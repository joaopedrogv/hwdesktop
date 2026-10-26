unit uCadPedVenda_NotasVinculadas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, uDataSet_OOP, DB;

type
  TfrmCadPedVenda_NotasVinculadas = class(TfrmPadrao)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    Panel4: TPanel;
    Splitter1: TSplitter;
    GroupBox2: TGroupBox;
    grid_nf: TDBGrid;
    BitBtn1: TBitBtn;
    Panel5: TPanel;
    grid_itens: TDBGrid;
    Panel6: TPanel;
    Panel7: TPanel;
    procedure grid_itensDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    venda: TDataSet_OOP;
    itens: TDataSet_OOP;
    Fnped: Integer;
    Ftipo: string;

    procedure venda_after_scroll(DataSet: TDataSet);
  public
    { Public declarations }
    property Pedido_Numero: Integer read Fnped write Fnped;
    property Pedido_Tipo  : string  read Ftipo write Ftipo;
  end;

var
  frmCadPedVenda_NotasVinculadas: TfrmCadPedVenda_NotasVinculadas;

implementation

uses uDtmAtivo, pedvenda_ref_nf_class;

{$R *.dfm}

procedure TfrmCadPedVenda_NotasVinculadas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  FreeAndNil(itens);
  FreeAndNil(venda);

  Action := caFree;
  frmCadPedVenda_NotasVinculadas := nil;

end;

procedure TfrmCadPedVenda_NotasVinculadas.FormCreate(Sender: TObject);
begin
  inherited;
  venda := TDataSet_OOP.Create(dtmAtivo.bancoHw);
  itens := TDataSet_OOP.Create(dtmAtivo.bancoHw);
end;

procedure TfrmCadPedVenda_NotasVinculadas.FormShow(Sender: TObject);
var
  PedVendaRef: TPedvenda_ref_nf_classList;
  I: Integer;
begin
  inherited;

  venda.SqlOpen('select pvp.nped, pvp.tipo, nfi.cod_nf, nfi.cod_empresa from pedvenda_prod pvp' +
                ' inner join notafiscal_item nfi on nfi.nped = pvp.nped and nfi.tipo_ped = pvp.tipo and nfi.cod_empresa = pvp.cod_empresa' +
                ' left join pedvenda_ref_nf pvr on pvr.nped = pvp.nped and pvr.tipo = pvp.tipo and pvr.cod_empresa = pvp.cod_empresa and pvr.cod_nf = nfi.cod_nf' +
                ' where pvp.nped = %d and pvp.tipo = %s and pvp.cod_empresa = %s and pvr.cod_nf is null',
                [Fnped, QuotedStr(Ftipo), vDadosIni.CodEmpresa]).First;

  // fazer um select aqui e localizar referencias de notas que nao existem itens na mesma, ex
  // quando eu uso uma nota fiscal e excluo todos os itens da mesma 
  PedVendaRef := TPedvenda_ref_nf_classList.Create;
  try
    while not venda.buscas.Eof do
    begin
      with PedVendaRef.New do
      begin
        nped        := venda.buscas.FieldByName('nped').AsInteger;
        tipo        := venda.buscas.FieldByName('tipo').AsString;
        cod_empresa := venda.buscas.FieldByName('cod_empresa').AsInteger;
        cod_nf      := venda.buscas.FieldByName('cod_nf').AsInteger;
      end;
      venda.buscas.Next;
    end;

    for I := 0 to PedVendaRef.Count - 1 do
      venda.SqlExec(PedVendaRef.Items[I].SQLMotor().SQLUpdateOrInsert);

    if venda.buscas.Transaction.InTransaction then
      venda.buscas.Transaction.Commit;

  finally
    FreeAndNil(PedVendaRef);
  end;

  venda.montaSelect('select nf.cod_nf id, nf.num_nf, nf.serie, nf.data_lanc data, nf.valor_total, nf.status, nf.situacao_nfe,' +
                    ' nf.natureza_nf "E/S", nf.valor_seguro,  nf.valor_frete, nf.valor_out_desp, nf.desc_natop operacao' +
                    ' from pedvenda_ref_nf pvr' +
                    ' inner join notafiscal nf on nf.cod_nf = pvr.cod_nf and nf.cod_empresa = pvr.cod_empresa' +
                    ' where pvr.nped = %d and pvr.tipo = %s and pvr.cod_empresa = %s order by nf.data_lanc',
                    [Fnped, QuotedStr(Ftipo), vDadosIni.codEmpresa]);

  grid_nf.DataSource := venda._dataSourceOOP;
  grid_nf.Visible := venda.dataSet.RecordCount > 0;


  itens.montaSelect('select nfi.nitem,  nfi.descricao_item, nfi.num_fab_prod, nfi.referencia Ref, nfi.quantidade,  nfi.valor_unitario, nfi.valor_total,' +
                    ' nfi.cst cst_icms, nfi.codigo_nop cfop, nfi.csosn,  nfi.ncm,  nfi.cest,' +
                    ' nfi.nped, nfi.tipo_ped, nfi.grupo_prod,  nfi.cod_prod, nfi.cod_nf id, pv.nf_gerou' +
                    ' from pedvenda_ref_nf pvr' +
                    ' inner join notafiscal_item nfi on nfi.cod_nf = pvr.cod_nf and nfi.cod_empresa = pvr.cod_empresa' +
                    ' inner join pedvenda pv on pv.nped = pvr.nped and pv.tipo = pvr.tipo and pv.cod_empresa = pvr.cod_empresa' +
                    ' where pvr.nped = %d and pvr.tipo = %s and pvr.cod_empresa = %s order by nfi.cod_nf, nfi.nitem',
                    [Fnped, QuotedStr(Ftipo), vDadosIni.codEmpresa]);
  itens.filterStr('id = %d',[venda.fint('id')]);

  grid_itens.DataSource := itens._dataSourceOOP;
  grid_itens.Visible := itens.dataSet.RecordCount > 0;

  venda.dataSet.AfterScroll := venda_after_scroll;
end;

procedure TfrmCadPedVenda_NotasVinculadas.grid_itensDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
  Agrid: TDBGrid;
begin
  inherited;
  Agrid := TDBGrid(Sender);
    begin
      if (gdFocused in State) then
        Agrid.Canvas.Font.Color := clWhite
      else if (itens.fstr('nf_gerou') = 'S') or
              ((Fnped = itens.fint('nped')) and
               (Ftipo = itens.fstr('tipo_ped'))) then
        Agrid.Canvas.Brush.Color := $00FFF3E6
      else
        Agrid.Canvas.Brush.Color := $00EAEAFF;
      Agrid.Canvas.FillRect(Rect);
      Agrid.DefaultDrawDataCell(Rect, Column.Field, State);
    end;
end;

procedure TfrmCadPedVenda_NotasVinculadas.venda_after_scroll(DataSet: TDataSet);
begin
  itens.filterStr('id = %s',[venda.fstr('id')]);
end;

end.
