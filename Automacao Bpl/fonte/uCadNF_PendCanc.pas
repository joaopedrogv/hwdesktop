unit uCadNF_PendCanc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, ExtCtrls, uClassesNotasFiscais, Grids,
  DBGrids, uDataSet_OOP;

type
  TfrmCadNF_PencCanc = class(TfrmPadrao)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    RNo: Integer;
    FNota: TNFCab;
    Consulta: TDataSet_OOP;
    StringComand: string;
    { Private declarations }
  public
    { Public declarations }
    property Nota: TNFCab read FNota write FNota;
  end;

var
  frmCadNF_PencCanc: TfrmCadNF_PencCanc;

implementation

uses DB, hw_utils, uDtmAtivo, DBClient, uClassesNotasFiscais_consts;

{$R *.dfm}

procedure TfrmCadNF_PencCanc.BitBtn2Click(Sender: TObject);
begin
  inherited;
  try
    BitBtn1.Enabled := False;
    BitBtn2.Enabled := False;
    Screen.Cursor := crHourGlass;

    Nota.selecionaNotaFiscal(Consulta.fint('codigo'));
    if Nota.dataSet.IsEmpty then
    begin
      ShowAtencao('Nota Fiscal não encontrada');
      Exit;
    end;

    Nota.vItem.selecionaItens(Nota.fint('cod_nf'));

    Nota.cancelarNotaFiscal(ocEventoCanc);
    Consulta.Refresh;
  finally
    Screen.Cursor := crDefault;
    BitBtn1.Enabled := True;
    BitBtn2.Enabled := True;
  end;
end;

procedure TfrmCadNF_PencCanc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if StringComand <> '' then
  begin
    Nota.ClientOpen(StringComand);
    if RNo <= Nota.dataSet.RecordCount then
      if RNo >= 1 then
        Nota.dataSet.RecNo := RNo;
  end;

  Consulta.Free;
  Action := caFree;
  Self := nil;
end;

procedure TfrmCadNF_PencCanc.FormShow(Sender: TObject);
begin
  inherited;
  if not Assigned(Nota) then
    raise Exception.Create('Objeto Nota deve receber a instancia TNFCab logo após o Create do formulário');

  Consulta := TDataSet_OOP.Create(Nota.buscas.Database);

  if Nota.dataSet.Active then
  begin
    RNo := Nota.dataSet.RecNo;
    StringComand := Nota.dataSet.CommandText;
  end
  else
    StringComand := '';

  Consulta.ClientOpen('select nf.num_nf, nf.serie, nf.data_lanc, nf.valor_total, nf.situacao_nfe, nf.status, nf.cod_nf codigo from notafiscal nf' +
                      ' where nf.situacao_nfe in (''Cancelada'', ''Inutilizada'', ''Denegada'') and nf.status <> ''Cancelada'' and nf.cod_empresa = %d' +
                      ' and nf.emissao_propria = ''S'' and iif(nf.natureza_nf = ''S'', ''S'', nf.num_gerado) = ''S''' +
                      ' order by nf.data_lanc, nf.cod_nf', [vDadosIni.cod_empresa]);
  DBGrid1.DataSource := Consulta._dataSourceOOP;
end;

end.
