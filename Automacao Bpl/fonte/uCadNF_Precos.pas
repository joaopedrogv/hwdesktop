unit uCadNF_Precos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ComCtrls, StdCtrls, Buttons, uEditHw, Grids, DBGrids,
  ExtCtrls, DBCtrls, uClassesNotasFiscais, uDataSet_OOP, Mask, DB, DBClient;

type
  TfrmCadNFPrecos = class(TfrmPadrao)
    pagePrecos: TPageControl;
    tabPrecos: TTabSheet;
    Panel13: TPanel;
    Panel15: TPanel;
    Label104: TLabel;
    DBText6: TDBText;
    Bevel2: TBevel;
    DBText7: TDBText;
    DBText8: TDBText;
    Bevel3: TBevel;
    Bevel4: TBevel;
    DBText9: TDBText;
    DBText10: TDBText;
    GroupBox25: TGroupBox;
    DBGrid10: TDBGrid;
    GroupBox26: TGroupBox;
    DBGrid11: TDBGrid;
    panelAntigo: TPanel;
    GroupBox33: TGroupBox;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    SpeedButton46: TSpeedButton;
    BitBtn28: TBitBtn;
    GroupBox27: TGroupBox;
    Label165: TLabel;
    Label166: TLabel;
    GroupBox28: TGroupBox;
    Label102: TLabel;
    Label103: TLabel;
    btSalvaMargemObtida: TBitBtn;
    BitBtn30: TBitBtn;
    grupoPreco306090MarkupMargem: TGroupBox;
    lbPrecoVarejoAtual: TLabel;
    Label620: TLabel;
    Label624: TLabel;
    lbPrecoAtacadoAtual: TLabel;
    GroupBox31: TGroupBox;
    Label157: TLabel;
    Label158: TLabel;
    Label159: TLabel;
    Label160: TLabel;
    edVEMK: TEditHw;
    edVOMK: TEditHw;
    edVEMM: TEditHw;
    edVOMM: TEditHw;
    GroupBox32: TGroupBox;
    Label161: TLabel;
    Label162: TLabel;
    Label163: TLabel;
    Label164: TLabel;
    edAEMK: TEditHw;
    edAOMK: TEditHw;
    edAEMM: TEditHw;
    edAOMM: TEditHw;
    BitBtn32: TBitBtn;
    BitBtn122: TBitBtn;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    dsItem: TDataSource;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    SpeedButton60: TSpeedButton;
    panelPercentualAdicional: TPanel;
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label10: TLabel;
    Panel3: TPanel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    grupoPreco306090: TGroupBox;
    Label11: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    DBEdit12: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit16: TDBEdit;
    panelPercDesc30DiasAvista: TPanel;
    Label2: TLabel;
    DBText4: TDBText;
    BitBtn1: TBitBtn;
    panelConfs: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn122Click(Sender: TObject);
    procedure SpeedButton60Click(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn30Click(Sender: TObject);
    procedure btSalvaMargemObtidaClick(Sender: TObject);
    procedure BitBtn28Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton46Click(Sender: TObject);
    procedure DBGrid11KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    disabledControls: Boolean;
    FCadNf: TNFCab;
    FemFechamento: Boolean;
    procedure getCamposMargem;
    procedure ConfigurarCampos;
    procedure HandleCampos;
  public
    property CadNf: TNFCab read FCadNf write FCadNf;
    property emFechamento: Boolean read FemFechamento write FemFechamento;
  end;

var
  frmCadNFPrecos: TfrmCadNFPrecos;

implementation

uses
  StrUtils,
  Math,
  uDtmAtivo,
  uDtmNF,
  hw_utils,
  hw_win_utils,
  calc_utils,
  config_sistema_class,
  uClasseMargemProduto,
  uDadosIni;

{$R *.dfm}

procedure TfrmCadNFPrecos.BitBtn122Click(Sender: TObject);
var
  vMargemProd: TMargemProduto;
begin
  try
    Screen.Cursor := crHourGlass;
    vMargemProd.cadMargemProduto;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNFPrecos.BitBtn28Click(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
    DBEdit1.SetFocus;
end;

procedure TfrmCadNFPrecos.BitBtn30Click(Sender: TObject);
begin
  inherited;
  CadNf.vItem.CancelMargem;
  getCamposMargem;
  HandleCampos;
end;

procedure TfrmCadNFPrecos.btSalvaMargemObtidaClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NF0066', 'EDITAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;

//  CadNf.vItem.Preco30 := edPreco3.AsValue;
//  CadNf.vItem.Preco60 := edPreco6.AsValue;
//  CadNf.vItem.Preco90 := edPreco9.AsValue;

  if CadNf.vItem.salvaMargemObtida then
  begin
    getCamposMargem;
    HandleCampos;
    if (Self.Enabled) and (Self.Visible) and (BitBtn28.CanFocus) then
    	BitBtn28.SetFocus;
  end;
end;

procedure TfrmCadNFPrecos.ConfigurarCampos;
var
  dFormat: string;
begin
  {
  edPrecoV.FormatSize := '0.' + IntToStr(vDadosIni.vEmp.vCasasDecimais);
  edPrecoA.FormatSize := '0.' + IntToStr(vDadosIni.vEmp.vCasasDecimais);
  edPreco3.FormatSize := '0.' + IntToStr(vDadosIni.vEmp.vCasasDecimais);
  edPreco6.FormatSize := '0.' + IntToStr(vDadosIni.vEmp.vCasasDecimais);
  edPreco9.FormatSize := '0.' + IntToStr(vDadosIni.vEmp.vCasasDecimais);
  edMarkUpV.FormatSize := '0.' + IntToStr(vDadosIni.vProduto.Precos.DigMrkMrg);
  edMarkUpA.FormatSize := '0.' + IntToStr(vDadosIni.vProduto.Precos.DigMrkMrg);
  edPerc3.FormatSize := '0.' + IntToStr(vDadosIni.vProduto.Precos.DigMrkMrg);
  edPerc6.FormatSize := '0.' + IntToStr(vDadosIni.vProduto.Precos.DigMrkMrg);
  edPerc9.FormatSize := '0.' + IntToStr(vDadosIni.vProduto.Precos.DigMrkMrg);
  }

  Label165.Caption := IfThen(vDadosIni.vProduto.Precos.UsarMargemAoMarkup, 'Margem', 'Markup');
  Label102.Caption := Label165.Caption;
  Label1.Caption := IfThen(vDadosIni.vProduto.Precos.UsarPercAdicional306090, '% Adicional', Label165.Caption);
  Label6.Caption := Label165.Caption;
  Label8.Caption := Label165.Caption;

  panelConfs.Caption := 'Alterar preços ao confirmar = ' + IfThen(vDadosIni.vProduto.Precos.AlterarPrecosAoConfirmarNF, 'Sim', 'Não') +
                        ' | Alterar ' + IfThen(vDadosIni.vProduto.Precos.UsarMargemAoMarkup, 'margens', 'markups') + ' ao confirmar = ' +
                        IfThen(vDadosIni.vProduto.Precos.AlterarPrecosAoConfirmarNF and vDadosIni.PesqPros('NF0227', 'HABILITAR', '', 'NOTAFISCAL', CadNf.fstr('cod_nf'), CadNf.Buscas, False, False, True),
                               'Sim', 'Não');

  panelPercDesc30DiasAvista.Visible    := vDadosIni.vProduto.Precos.UsarPercDescPreco30Dias;
  panelPercentualAdicional.Visible     := vDadosIni.vProduto.Precos.UsarPercAdicional306090;
  grupoPreco306090.Visible             := vDadosIni.vProduto.Precos.UsarPercAdicional306090;
  grupoPreco306090MarkupMargem.Visible := not vDadosIni.vProduto.Precos.UsarPercAdicional306090;

  edVEMK.FormatSize := '0.' + IntToStr(vDadosIni.vProduto.Precos.DigMrkMrg);
  edVEMM.FormatSize := '0.' + IntToStr(vDadosIni.vProduto.Precos.DigMrkMrg);
  edVOMK.FormatSize := '0.' + IntToStr(vDadosIni.vProduto.Precos.DigMrkMrg);
  edVOMM.FormatSize := '0.' + IntToStr(vDadosIni.vProduto.Precos.DigMrkMrg);

  edAEMK.FormatSize := '0.' + IntToStr(vDadosIni.vProduto.Precos.DigMrkMrg);
  edAEMM.FormatSize := '0.' + IntToStr(vDadosIni.vProduto.Precos.DigMrkMrg);
  edAOMK.FormatSize := '0.' + IntToStr(vDadosIni.vProduto.Precos.DigMrkMrg);
  edAOMM.FormatSize := '0.' + IntToStr(vDadosIni.vProduto.Precos.DigMrkMrg);

  dFormat := DisplayNumber(vDadosIni.vEmp.vCasasDecimais);
  (CadNf.vItem.dataSet.FieldByName('PRECO_CALC_V') as TFloatField).DisplayFormat := dFormat;
  (CadNf.vItem.dataSet.FieldByName('PRECO_CALC_A') as TFloatField).DisplayFormat := dFormat;
  (CadNf.vItem.dataSet.FieldByName('PRECO_CALC_3') as TFloatField).DisplayFormat := dFormat;
  (CadNf.vItem.dataSet.FieldByName('PRECO_CALC_6') as TFloatField).DisplayFormat := dFormat;
  (CadNf.vItem.dataSet.FieldByName('PRECO_CALC_9') as TFloatField).DisplayFormat := dFormat;

  dFormat := DisplayNumber(vDadosIni.vProduto.Precos.DigMrkMrg);
  (CadNf.vItem.dataSet.FieldByName('PERCENT_CALC_v') as TFloatField).DisplayFormat := dFormat;
  (CadNf.vItem.dataSet.FieldByName('PERCENT_CALC_A') as TFloatField).DisplayFormat := dFormat;
  (CadNf.vItem.dataSet.FieldByName('PERCENT_CALC_3') as TFloatField).DisplayFormat := dFormat;
  (CadNf.vItem.dataSet.FieldByName('PERCENT_CALC_6') as TFloatField).DisplayFormat := dFormat;
  (CadNf.vItem.dataSet.FieldByName('PERCENT_CALC_9') as TFloatField).DisplayFormat := dFormat;
  (CadNf.vItem.dataSet.FieldByName('MARGEM_V_CALC') as TFloatField).DisplayFormat := dFormat;
  (CadNf.vItem.dataSet.FieldByName('MARGEM_A_CALC') as TFloatField).DisplayFormat := dFormat;
  (CadNf.vItem.dataSet.FieldByName('MARGEM_30_CALC') as TFloatField).DisplayFormat := dFormat;
  (CadNf.vItem.dataSet.FieldByName('MARGEM_60_CALC') as TFloatField).DisplayFormat := dFormat;
  (CadNf.vItem.dataSet.FieldByName('MARGEM_90_CALC') as TFloatField).DisplayFormat := dFormat;

  (CadNf.vItem.vProd.dataSet.FieldByName('PERC_AD_30') as TFloatField).DisplayFormat := dFormat;
  (CadNf.vItem.vProd.dataSet.FieldByName('PERC_AD_60') as TFloatField).DisplayFormat := dFormat;
  (CadNf.vItem.vProd.dataSet.FieldByName('PERC_AD_90') as TFloatField).DisplayFormat := dFormat;
  (CadNf.vItem.vProd.dataSet.FieldByName('PDESC_PR30_VAREJO') as TFloatField).DisplayFormat := dFormat;

end;

procedure TfrmCadNFPrecos.DBEdit1Exit(Sender: TObject);
var
  editName, siglaPreco, siglaPerc : string;
  precoAlterado: Double;
begin
  inherited;

  editName := TDBEdit(Sender).DataField;

  siglaPreco := Copy(editName, length(editName), 1);
  siglaPerc := IfThen(StartsText('PRECO', editName), 'P', 'M');
  precoAlterado := TDBEdit(Sender).Field.AsFloat;

  CadNf.vItem.calculaPreco(siglaPreco, siglaPerc, precoAlterado);
  
  getCamposMargem;
  HandleCampos;
end;

procedure TfrmCadNFPrecos.DBGrid11KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  	if (Self.Enabled) and (Self.Visible) and (BitBtn28.CanFocus) then
    	BitBtn28.SetFocus;
end;

procedure TfrmCadNFPrecos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if disabledControls then
    dsItem.DataSet.DisableControls;
end;

procedure TfrmCadNFPrecos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
  begin
    if grupoPreco306090MarkupMargem.Visible then
      if (Self.Enabled) and (Self.Visible) and (DBEdit5.CanFocus) then
        DBEdit5.SetFocus;

    if grupoPreco306090.Visible then
      if (Self.Enabled) and (Self.Visible) and (DBEdit12.CanFocus) then
        DBEdit12.SetFocus;
  end;
end;

procedure TfrmCadNFPrecos.FormShow(Sender: TObject);
var
  I: Integer;
begin
  inherited;

  dsItem.DataSet := CadNf.vItem.dataSet;

  disabledControls := dsItem.DataSet.ControlsDisabled;
  dsItem.DataSet.EnableControls;

  grupoPreco306090.Top := grupoPreco306090MarkupMargem.Top;
  grupoPreco306090.Left := grupoPreco306090MarkupMargem.Left;
  grupoPreco306090.Visible := False;

  ConfigurarCampos;

  tabPrecos.TabVisible := False;
  pagePrecos.ActivePage := tabPrecos;

  Label165.Caption := IfThen(vDadosIni.vProduto.Precos.UsarMargemAoMarkup, 'Margem', 'Markup');
  Label102.Caption := Label165.Caption;
  btSalvaMargemObtida.Enabled := emFechamento or (IniConf.ReadStr('MD', 'MRGSAV') = 'S');

  BitBtn30Click(BitBtn30);

  if (Self.Enabled) and (Self.Visible) and (DBGrid11.CanFocus) then
    DBGrid11.SetFocus;
end;

procedure TfrmCadNFPrecos.getCamposMargem;
begin
  {
  //
  if vDadosIni.vProduto.Precos.UsarMargemAoMarkup then
  begin
    edMarkUpV.AsValue := CadNf.vItem.MargemObtidaV;
    edMarkUpA.AsValue := CadNf.vItem.MargemObtidaA;
  end
  else
  begin
    edMarkUpV.AsValue := CadNf.vItem.MarkUpV;
    edMarkUpA.AsValue := CadNf.vItem.MarkUpA;
  end;

  //o percentual colocar apenas o label, trocar abaixo
  if vDadosIni.vProduto.Precos.UsarPercAdicional306090 then
  begin
    edPerc3.AsValue := CadNf.vItem.PercAdProd3;
    edPerc6.AsValue := CadNf.vItem.PercAdProd6;
    edPerc9.AsValue := CadNf.vItem.PercAdProd9;
  end
  else if vDadosIni.vProduto.Precos.UsarMargemAoMarkup then
  begin
    edPerc3.AsValue := CadNf.vItem.MargemObtida3;
    edPerc6.AsValue := CadNf.vItem.MargemObtida6;
    edPerc9.AsValue := CadNf.vItem.MargemObtida9;
  end
  else
  begin
    edPerc3.AsValue := CadNf.vItem.MarkUp3;
    edPerc6.AsValue := CadNf.vItem.MarkUp6;
    edPerc9.AsValue := CadNf.vItem.MarkUp9;
  end;

//  edMarkUpV.Visible := (not vDadosIni.vProduto.Precos.UsarPercDescPreco30Dias) or (CadNf.vItem.Perc30ToVrj <= 0);
//  Label165.Visible := edMarkUpV.Visible;

//  edPerc3.Visible := (not vDadosIni.vProduto.Precos.UsarPercDescPreco30Dias) or (CadNf.vItem.Perc30ToVrj <= 0);
//  Label1.Visible := edPerc3.Visible;

  if vDadosIni.vProduto.Precos.UsarPercDescPreco30Dias and (CadNf.vItem.Perc30ToVrj > 0) then
    edPerc3.AsValue := 0;

  edPrecoV.AsValue := CadNf.vItem.PrecoV;
  edPrecoA.AsValue := CadNf.vItem.PrecoA;
  edPreco3.AsValue := CadNf.vItem.Preco30;
  edPreco6.AsValue := CadNf.vItem.Preco60;
  edPreco9.AsValue := CadNf.vItem.Preco90;

  edVEMK.AsValue := CadNf.vItem.MarkUpEsperadoV;
  edVEMM.AsValue := CadNf.vItem.MargemEsperadaV;
  edVOMK.AsValue := CadNf.vItem.MarkUpV;
  edVOMM.AsValue := CadNf.vItem.MargemObtidaV;

  edAEMK.AsValue := CadNf.vItem.MarkUpEsperadoA;
  edAEMM.AsValue := CadNf.vItem.MargemEsperadaA;
  edAOMK.AsValue := CadNf.vItem.MarkUpA;
  edAOMM.AsValue := CadNf.vItem.MargemObtidaA;

  edVOMK.Font.Color := CadNf.vItem.getCorCampo('V', 'MK');
  edVOMM.Font.Color := CadNf.vItem.getCorCampo('V', 'MM');

  edAOMK.Font.Color := CadNf.vItem.getCorCampo('A', 'MK');
  edAOMM.Font.Color := CadNf.vItem.getCorCampo('A', 'MM');

  lbPrecoVarejoAtual.Caption  := Format('%0.' + IntToStr(vDadosIni.vEmp.vCasasDecimais) + 'n', [CadNf.vItem.PrecoAtualVarejo]);
  lbPrecoAtacadoAtual.Caption := Format('%0.' + IntToStr(vDadosIni.vEmp.vCasasDecimais) + 'n', [CadNf.vItem.PrecoAtualAtacado]);
  }
end;

procedure TfrmCadNFPrecos.HandleCampos;
begin

  if not (CadNf.vItem.dataSet.State in [dsInsert, dsEdit]) then
    CadNf.vItem.dataSet.Edit;

  if vDadosIni.vProduto.Precos.UsarMargemAoMarkup then
  begin
    CadNf.vItem.dataSet.FieldByName('PERCENT_CALC_V').AsFloat := CadNf.vItem.MargemObtidaV;
    CadNf.vItem.dataSet.FieldByName('PERCENT_CALC_A').AsFloat := CadNf.vItem.MargemObtidaA;
  end
  else
  begin
    CadNf.vItem.dataSet.FieldByName('PERCENT_CALC_V').AsFloat := CadNf.vItem.MarkUpV;
    CadNf.vItem.dataSet.FieldByName('PERCENT_CALC_A').AsFloat := CadNf.vItem.MarkUpA;
  end;

  //o percentual colocar apenas o label, trocar abaixo
  if vDadosIni.vProduto.Precos.UsarPercAdicional306090 then
  begin
    CadNf.vItem.dataSet.FieldByName('PERCENT_CALC_3').AsFloat := CadNf.vItem.PercAdProd3;
    CadNf.vItem.dataSet.FieldByName('PERCENT_CALC_6').AsFloat := CadNf.vItem.PercAdProd6;
    CadNf.vItem.dataSet.FieldByName('PERCENT_CALC_9').AsFloat := CadNf.vItem.PercAdProd9;
  end
  else if vDadosIni.vProduto.Precos.UsarMargemAoMarkup then
  begin
    CadNf.vItem.dataSet.FieldByName('PERCENT_CALC_3').AsFloat := CadNf.vItem.MargemObtida3;
    CadNf.vItem.dataSet.FieldByName('PERCENT_CALC_6').AsFloat := CadNf.vItem.MargemObtida6;
    CadNf.vItem.dataSet.FieldByName('PERCENT_CALC_9').AsFloat := CadNf.vItem.MargemObtida9;
  end
  else
  begin
    CadNf.vItem.dataSet.FieldByName('PERCENT_CALC_3').AsFloat := CadNf.vItem.MarkUp3;
    CadNf.vItem.dataSet.FieldByName('PERCENT_CALC_6').AsFloat := CadNf.vItem.MarkUp6;
    CadNf.vItem.dataSet.FieldByName('PERCENT_CALC_9').AsFloat := CadNf.vItem.MarkUp9;
  end;

  DBEdit5.Visible := not vDadosIni.vProduto.Precos.UsarPercAdicional306090;
  DBEdit7.Visible := not vDadosIni.vProduto.Precos.UsarPercAdicional306090;
  DBEdit9.Visible := not vDadosIni.vProduto.Precos.UsarPercAdicional306090;

  DBText1.Visible := vDadosIni.vProduto.Precos.UsarPercAdicional306090;
  DBText2.Visible := vDadosIni.vProduto.Precos.UsarPercAdicional306090;
  DBText3.Visible := vDadosIni.vProduto.Precos.UsarPercAdicional306090;

//  DBEdit1.Visible := (not vDadosIni.vProduto.Precos.UsarPercDescPreco30Dias) or (CadNf.vItem.Perc30ToVrj <= 0);
//  Label165.Visible := DBEdit1.Visible;

//  DBEdit5.Visible := (not vDadosIni.vProduto.Precos.UsarPercDescPreco30Dias) or (CadNf.vItem.Perc30ToVrj <= 0);
//  Label1.Visible := DBEdit5.Visible;

  if vDadosIni.vProduto.Precos.UsarPercDescPreco30Dias and (CadNf.vItem.Perc30ToVrj > 0) then
    CadNf.vItem.dataSet.FieldByName('PERCENT_CALC_3').AsFloat := 0;

  CadNf.vItem.dataSet.FieldByName('PRECO_CALC_V').AsFloat := CadNf.vItem.PrecoV;
  CadNf.vItem.dataSet.FieldByName('PRECO_CALC_A').AsFloat := CadNf.vItem.PrecoA;
  CadNf.vItem.dataSet.FieldByName('PRECO_CALC_3').AsFloat := CadNf.vItem.Preco30;
  CadNf.vItem.dataSet.FieldByName('PRECO_CALC_6').AsFloat := CadNf.vItem.Preco60;
  CadNf.vItem.dataSet.FieldByName('PRECO_CALC_9').AsFloat := CadNf.vItem.Preco90;

  edVEMK.AsValue := CadNf.vItem.MarkUpEsperadoV;
  edVEMM.AsValue := CadNf.vItem.MargemEsperadaV;
  edVOMK.AsValue := CadNf.vItem.MarkUpV;
  edVOMM.AsValue := CadNf.vItem.MargemObtidaV;

  edAEMK.AsValue := CadNf.vItem.MarkUpEsperadoA;
  edAEMM.AsValue := CadNf.vItem.MargemEsperadaA;
  edAOMK.AsValue := CadNf.vItem.MarkUpA;
  edAOMM.AsValue := CadNf.vItem.MargemObtidaA;

  edVOMK.Font.Color := CadNf.vItem.getCorCampo('V', 'MK');
  edVOMM.Font.Color := CadNf.vItem.getCorCampo('V', 'MM');

  edAOMK.Font.Color := CadNf.vItem.getCorCampo('A', 'MK');
  edAOMM.Font.Color := CadNf.vItem.getCorCampo('A', 'MM');

  lbPrecoVarejoAtual.Caption  := Format('%0.' + IntToStr(vDadosIni.vEmp.vCasasDecimais) + 'n', [CadNf.vItem.PrecoAtualVarejo]);
  lbPrecoAtacadoAtual.Caption := Format('%0.' + IntToStr(vDadosIni.vEmp.vCasasDecimais) + 'n', [CadNf.vItem.PrecoAtualAtacado]);
end;

procedure TfrmCadNFPrecos.SpeedButton15Click(Sender: TObject);
begin
  inherited;
  CadNf.vItem.PriorMargem;
  getCamposMargem;
  HandleCampos;
  if (Self.Enabled) and (Self.Visible) and (BitBtn28.CanFocus) then
  	BitBtn28.SetFocus;
  if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
    DBEdit1.SetFocus;
end;

procedure TfrmCadNFPrecos.SpeedButton16Click(Sender: TObject);
begin
  inherited;
  CadNf.vItem.NextMargem;
  getCamposMargem;
  HandleCampos;
  if (Self.Enabled) and (Self.Visible) and (BitBtn28.CanFocus) then
  	BitBtn28.SetFocus;
  if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
    DBEdit1.SetFocus;
end;

procedure TfrmCadNFPrecos.SpeedButton46Click(Sender: TObject);
begin
  inherited;
  vDadosIni.pesquisaRapida('PRODUTOS');
end;

procedure TfrmCadNFPrecos.SpeedButton60Click(Sender: TObject);
begin
  inherited;
  vDadosIni.configurarSistema('prod_precos', CadNf.buscas);
  vDadosIni.vProduto.Precos.ConfigViaNF(TConfig_sistema_class.getConf('prod_precos', CadNf.buscas, vDadosIni.cod_empresa),
                                        vDadosIni.PesqPros('NF0223', 'HABILITAR', '', 'NOTAFISCAL', '', CadNf.buscas, True, False, True));
  ConfigurarCampos;
  HandleCampos;
end;

end.
