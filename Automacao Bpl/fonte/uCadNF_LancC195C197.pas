unit uCadNF_LancC195C197;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, uClassesNotasFiscais, DBCtrls, StdCtrls, Grids, DBGrids,
  Buttons, ExtCtrls, ComCtrls, Mask, uEditHw, DB;

type
  TfrmCadNFLancC195C197 = class(TfrmPadrao)
    pagePrinc: TPageControl;
    tsEspelhoCalculo: TTabSheet;
    pnEspelhoCalcAntSt: TPanel;
    GroupBox101: TGroupBox;
    gridEspelho: TDBGrid;
    Panel101: TPanel;
    BitBtn190: TBitBtn;
    ckMostrarApenasComST: TCheckBox;
    edEspelho: TDBMemo;
    tsItens: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ckOutrosAjustes: TCheckBox;
    Panel4: TPanel;
    groupICMSAntecipado: TGroupBox;
    Label1: TLabel;
    edICMSAnt: TEditHw;
    radioICMSAnt: TRadioGroup;
    SpeedButton1: TSpeedButton;
    Label5: TLabel;
    edCodAjICMSAnt: TMaskEdit;
    Panel5: TPanel;
    groupICMSOutrosAjustes: TGroupBox;
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    Label3: TLabel;
    edICMSAjust: TEditHw;
    radioICMSAjust: TRadioGroup;
    edCodAjICMSAjust: TMaskEdit;
    dsItens: TDataSource;
    tslanc: TTabSheet;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    gridLanc: TDBGrid;
    BitBtn3: TBitBtn;
    btSelectCodigo: TBitBtn;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    gridItens: TDBGrid;
    dsLanc: TDataSource;
    dsEspelho: TDataSource;
    procedure gridEspelhoEnter(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn190Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure btSelectCodigoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ckMostrarApenasComSTClick(Sender: TObject);
    procedure ckOutrosAjustesClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    Fnota: TNFCab;
    FicmsAjustePorItem: Boolean;
    FoutrosAjustePorItem: Boolean;
//    rescueEvent: TNotifyEvent;
  public
    property nota: TNFCab read Fnota write Fnota;
    property icmsAjustePorItem: Boolean read FicmsAjustePorItem;
    property outrosAjustePorItem: Boolean read FoutrosAjustePorItem;
  end;

var
  frmCadNFLancC195C197: TfrmCadNFLancC195C197;

implementation

uses
  hw_utils, hw_win_utils, uDataSet_OOP, uClassesNotasFiscais_infoadfisco,
  Query_OOP, uDtmAtivo;

{$R *.dfm}

procedure TfrmCadNFLancC195C197.BitBtn190Click(Sender: TObject);
begin
  inherited;
  nota.vItem.filterClear;
  pagePrinc.ActivePage := tsItens;

  if (Self.Enabled) and (Self.Visible) and (gridItens.CanFocus) then
    gridItens.SetFocus;
end;

procedure TfrmCadNFLancC195C197.BitBtn1Click(Sender: TObject);
begin
  inherited;

  if (edICMSAnt.AsValue > 0)
    and (Trim(edCodAjICMSAnt.Text) = '') then
  begin
    ShowAtencao('Código de ajuste para antecipação precisa ser preenchido');
    Exit;
  end;

  if (edICMSAjust.AsValue > 0)
    and (Trim(edCodAjICMSAjust.Text) = '') then
  begin
    ShowAtencao('Código de ajuste Outros ser preenchido');
    Exit;
  end;
  FicmsAjustePorItem := radioICMSAnt.ItemIndex = 1;
  FoutrosAjustePorItem := radioICMSAjust.ItemIndex = 1;

  ModalResult := IDOK;
end;

procedure TfrmCadNFLancC195C197.BitBtn3Click(Sender: TObject);
begin
  inherited;
  pagePrinc.ActivePage := tsItens;
end;

procedure TfrmCadNFLancC195C197.btSelectCodigoClick(Sender: TObject);
begin
  inherited;
  if btSelectCodigo.Tag = 1 then
    edCodAjICMSAnt.Text := Format('%d - %s', [gridLanc.DataSource.DataSet.FieldByName('cod_obs').AsInteger,
                                              gridLanc.DataSource.DataSet.FieldByName('txt').AsString])
  else if btSelectCodigo.Tag = 2 then
    edCodAjICMSAjust.Text := Format('%d - %s', [gridLanc.DataSource.DataSet.FieldByName('cod_obs').AsInteger,
                                                gridLanc.DataSource.DataSet.FieldByName('txt').AsString]);

  pagePrinc.ActivePage := tsItens;
end;

procedure TfrmCadNFLancC195C197.ckMostrarApenasComSTClick(Sender: TObject);
begin
  inherited;
  RegistroWin.Write(Self.ClassName, ckMostrarApenasComST.Name, ckMostrarApenasComST.Checked);
  nota.vItem.dataSet.Filtered := ckMostrarApenasComST.Checked;
end;

procedure TfrmCadNFLancC195C197.ckOutrosAjustesClick(Sender: TObject);
begin
  inherited;
  RegistroWin.Write(Self.ClassName, ckOutrosAjustes.Name, ckOutrosAjustes.Checked);
  nota.vItem.dataSet.Filtered := ckOutrosAjustes.Checked;
end;

procedure TfrmCadNFLancC195C197.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  nota.vItem.filterClear;

  dsEspelho.DataSet := nil;
  dsLanc.DataSet := nil;
end;

procedure TfrmCadNFLancC195C197.FormCreate(Sender: TObject);
begin
  inherited;

  tsItens.TabVisible := False;
  tslanc.TabVisible := False;
  tsEspelhoCalculo.TabVisible := False;

end;

procedure TfrmCadNFLancC195C197.FormShow(Sender: TObject);
var
  icmsAntecipado: Double;
  icmsAjuste: Double;
  consulta: TQuery_OOP;
begin
  inherited;

  try
    consulta := TQuery_OOP.Create(nota.buscas)
      .Open('select t.id, s.cod_obs, txt from trib_sefaz t' +
            ' inner join sped_lancamento_fiscal s on s.cod_obs = t.cod_obs and t.cod_empresa = s.cod_empresa' +
            ' where t.cod_empresa = %d', [vDadosIni.cod_empresa]);

    icmsAntecipado := nota.vItem.filterStr('antec_trib = ''S''').fsum('valor_icmsub_ant', False);
    // valor_icmsub_ant é unitario, tem de multiplicar o campofalta o * items.ffloat('quantidade')

    if icmsAntecipado > 0 then
    begin
      edCodAjICMSAnt.Text := '';
      icmsAntecipado := 0;

      nota.vItem.dataSet.First;
      while not nota.vItem.dataSet.Eof do
      begin
        if edCodAjICMSAnt.Text = ''  then
          if (not nota.vItem.fempty('trib_sefaz_id')) and (consulta.query.Locate('ID', nota.vItem.fstr('trib_sefaz_id'), [])) then
            edCodAjICMSAnt.Text := Format('%d - %s', [consulta.fint('cod_obs'), consulta.fstr('txt')]);

        icmsAntecipado := icmsAntecipado + (nota.vItem.ffloat('valor_icmsub_ant') * nota.vItem.ffloat('quantidade'));

        nota.vItem.dataSet.Next;
      end;

      if (edCodAjICMSAnt.Text = '') and (consulta.First.query.RecordCount > 0) then
        edCodAjICMSAnt.Text := Format('%d - %s', [consulta.fint('cod_obs'), consulta.fstr('txt')]);
    end;

    icmsAjuste := nota.vItem.filterStr('antec_trib <> ''S'' and trib_sefaz_id <> ''''').fsum('vajuste', False);
    //vajuste já é total

    if icmsAjuste > 0 then
    begin
      edCodAjICMSAjust.Text := '';

      nota.vItem.dataSet.First;
      while not nota.vItem.dataSet.Eof do
      begin
        if (not nota.vItem.fempty('trib_sefaz_id'))
          and (consulta.query.Locate('ID', nota.vItem.fstr('trib_sefaz_id'), [])) then
        begin
//          consulta.Open('select t.id, s.cod_obs, txt from trib_sefaz t' +
//                        ' inner join sped_lancamento_fiscal s on s.cod_obs = t.cod_obs and t.cod_empresa = s.cod_empresa' +
//                        ' where t.cod_empresa = %d and t.id = %s', [vDadosIni.cod_empresa, nota.vItem.fstrq('trib_sefaz_id')]);
//
//          if not consulta.IsEmpty then
            edCodAjICMSAjust.Text :=  Format('%d - %s', [consulta.fint('cod_obs'), consulta.fstr('txt')]);

          Break;
        end;

        nota.vItem.dataSet.Next;
      end;
      
      if (edCodAjICMSAjust.Text = '') and (consulta.First.query.RecordCount > 0) then
        edCodAjICMSAjust.Text := Format('%d - %s', [consulta.fint('cod_obs'), consulta.fstr('txt')]);
    end;

  finally
    nota.vItem.filterClear;
  end;

  dsEspelho.DataSet := nota.vItem.dataSet;
  dsLanc.DataSet := nota.vSped.vC195_C197.vLancFiscal.dataSet;

  edICMSAnt.AsValue   := icmsAntecipado;
  edICMSAjust.AsValue := icmsAjuste;

  groupICMSAntecipado.Enabled    := icmsAntecipado > 0;
  groupICMSOutrosAjustes.Enabled := icmsAjuste > 0;

  pagePrinc.ActivePage := tsItens;

  if (Self.Enabled) and (Self.Visible) and (gridItens.CanFocus) then
    gridItens.SetFocus;
end;

procedure TfrmCadNFLancC195C197.gridEspelhoEnter(Sender: TObject);
begin
  inherited;
  nota.vItem.dataSet.EnableControls;
  nota.vItem.dataSet.EnableControls;
  nota.vItem.dataSet.EnableControls;
end;

procedure TfrmCadNFLancC195C197.SpeedButton1Click(Sender: TObject);
begin
  inherited;

  ckMostrarApenasComST.Checked := RegistroWin.Read(Self.ClassName, ckMostrarApenasComST.Name, True);
  nota.vItem.dataSet.Filter := 'antec_trib = ''S''';
  nota.vItem.dataSet.Filtered := ckMostrarApenasComST.Checked;
  edEspelho.Visible := True;
  ckOutrosAjustes.Visible := True;
  ckMostrarApenasComST.Visible := False;

  pagePrinc.ActivePage := tsEspelhoCalculo;

  if (Self.Enabled) and (Self.Visible) and (gridEspelho.CanFocus) then
    gridEspelho.SetFocus;
end;

procedure TfrmCadNFLancC195C197.SpeedButton2Click(Sender: TObject);
begin
  inherited;

  ckOutrosAjustes.Checked := RegistroWin.Read(Self.ClassName, ckOutrosAjustes.Name, True);
  nota.vItem.dataSet.Filter := 'antec_trib <> ''S'' and trib_sefaz_id <> ''''';
  nota.vItem.dataSet.Filtered := ckMostrarApenasComST.Checked;
  edEspelho.Visible := False;
  ckOutrosAjustes.Visible := False;
  ckMostrarApenasComST.Visible := True;

  pagePrinc.ActivePage := tsEspelhoCalculo;

  if (Self.Enabled) and (Self.Visible) and (gridEspelho.CanFocus) then
    gridEspelho.SetFocus;
end;

procedure TfrmCadNFLancC195C197.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  btSelectCodigo.Tag := 1;
  pagePrinc.ActivePage := tslanc;

  if (Self.Enabled) and (Self.Visible) and (gridLanc.CanFocus) then
    gridLanc.SetFocus;
end;

procedure TfrmCadNFLancC195C197.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  btSelectCodigo.Tag := 2;
  pagePrinc.ActivePage := tslanc;

  if (Self.Enabled) and (Self.Visible) and (gridLanc.CanFocus) then
    gridLanc.SetFocus;
end;

end.
