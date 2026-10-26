unit uCadSpedFObrigacoesDIFAL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls, Buttons, Grids, DBGrids, Mask, DBCtrls;

type
  TfrmCadSpedFObrigacoesDIFAL = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    ScrollBox4: TScrollBox;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    Label8: TLabel;
    DBEdit2: TDBEdit;
    Label9: TLabel;
    DBEdit3: TDBEdit;
    Label10: TLabel;
    DBEdit4: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    Label12: TLabel;
    Label11: TLabel;
    DBMemo1: TDBMemo;
    Label13: TLabel;
    DBMemo2: TDBMemo;
    Label14: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label15: TLabel;
    DBEdit7: TDBEdit;
    Label16: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadSpedFObrigacoesDIFAL: TfrmCadSpedFObrigacoesDIFAL;

implementation

uses uDtmSPED, uClassesSpedFBlocoE, uDtmAtivo, uDadosIni, DB, DateUtils;

{$R *.dfm}

procedure TfrmCadSpedFObrigacoesDIFAL.BitBtn1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not vDadosIni.PesqPros('SPED101', 'CONSULTA', '', 'SPED_F_ICMINTER_OB_DIFAL', '', vIcmInterOb.buscas, False) then
      Exit;

    inherited;

    if MaskEdit2.Visible then
    begin
      if not vIcmInterOb.ConsultaCampos('SPED_F_ICMINTER_OB_DIFAL', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else
      if vIcmInterOb.ConsultaCampos('SPED_F_ICMINTER_OB_DIFAL', MaskEdit3.text, ComboBox1.Text,
        combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
        		ComboBox1.SetFocus;

    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadSpedFObrigacoesDIFAL.BitBtn3Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    ActiveControl := BitBtn3;
    if not vIcmInterOb.Insert then
      exit;
    inherited;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox3.CanFocus) then
      DBLookupComboBox3.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadSpedFObrigacoesDIFAL.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  vIcmInterOb.Free;
  vIcmInterOb := nil;

  Action := caFree;
  frmCadSpedFObrigacoesDIFAL := nil;
end;

procedure TfrmCadSpedFObrigacoesDIFAL.FormCreate(Sender: TObject);
begin

  TelaCadastro := vDadosIni.vTipoForm;
  inherited;

  vIcmInterOb := TIcmsInterDifalObrigacoesDifal.create;

  tsCadastro.TabVisible := False;
  PageControl1.ActivePage := TabSheet2;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadSpedFObrigacoesDIFAL.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_INSERT then
    if PageControl1.ActivePage = TabSheet2 then
      SpeedButton1.Click;
end;

procedure TfrmCadSpedFObrigacoesDIFAL.FormShow(Sender: TObject);
var
  vTab_5_4_ICMS: TStrings;
  vCodNF: Integer;
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmSPED.dsICMInterOb;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);

    vTab_5_4_ICMS := TStringList.Create;
    vTab_5_4_ICMS := vDadosIni.getConfSisBlob('sped_f_tab_5_4_icms', vIcmInterOb.buscas);

    vIcmInterOb.codOR.setDadosDataSet(
      vDadosIni.convertStrinsToArray2(vTab_5_4_ICMS, 1),
      vDadosIni.convertStrinsToArray2(vTab_5_4_ICMS, 2), DBLookupComboBox1);

    vIcmInterOb.indProc.setDadosDataSet(['', '0','1','2','9'], ['', '0 - Sefaz', '1 - Justiça Federal',
      '2 - Justiça Estadual', '9 - Outros'], DBLookupComboBox2);

    vIcmInteroB.estado.setDadosDataSet([
      'AC','AL','AP','AM','BA','CE','DF','ES','GO','MA','MT','MS','MG','PA','PB','PR','PE','PI',
      'RJ','RN','RS','RO','RR','SC','SP','SE','TO'], [
      'Acre','Alagoas','Amapá','Amazonas','Bahia','Ceará','Distrito Federal','Espírito Santo','Goiás',
      'Maranhão','Mato Grosso','Mato Grosso do Sul','Minas Gerais','Pará','Paraíba','Paraná','Pernambuco',
      'Piauí','Rio de Janeiro','Rio Grande do Norte','Rio Grande do Sul','Rondônia','Roraima','Santa Catarina',
      'São Paulo','Sergipe','Tocantins'], DBLookupComboBox3);

  end;

  if TelaCadastro = 1 then
  begin
    if (Pos('|CAD_DIFAL_FCP|', vDadosIni.vPesquisa) > 0) then
    begin
      Self.Caption := Self.Caption + ' - ' + vDadosIni.getValue(vDadosIni.vPesquisa, 7) + ' NF: ' + vDadosIni.getValue(vDadosIni.vPesquisa, 8); 
      vIcmInterOb.montaSelect('select * from SPED_F_ICMINTER_OB_DIFAL' +
        ' where cod_nf = ' + IntToStr(StrToIntDef(vDadosIni.getValue(vDadosIni.vPesquisa, 6), 0)) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa +
        ' and tpob = ' + QuotedStr(vDadosIni.getValue(vDadosIni.vPesquisa, 7)));
      if vIcmInterOb.dataSet.IsEmpty then
      begin
        Self.Caption := Self.Caption + '*';
        BitBtn3Click(Sender);
        vIcmInterOb.dataSet.FieldByName('COD_OR').AsString := vDadosIni.getValue(vDadosIni.vPesquisa, 2);
        vIcmInterOb.dataSet.FieldByName('COD_REC').AsString := vDadosIni.getValue(vDadosIni.vPesquisa, 3);
        vIcmInterOb.dataSet.FieldByName('VL_OR').AsFloat := StrToFloatDef(vDadosIni.getValue(vDadosIni.vPesquisa, 4),0);
        vIcmInterOb.dataSet.FieldByName('UF').AsString := vDadosIni.getValue(vDadosIni.vPesquisa, 5);
        vIcmInterOb.dataSet.FieldByName('COD_NF').AsInteger := StrToIntDef(vDadosIni.getValue(vDadosIni.vPesquisa, 6), 0);
        vIcmInterOb.dataSet.FieldByName('TPOB').AsString := vDadosIni.getValue(vDadosIni.vPesquisa, 7);
        vIcmInterOb.dataSet.FieldByName('DATA_LANC').AsDateTime := vDadosIni.getDataBanco(vIcmInterOb.buscas);
        vIcmInterOb.dataSet.FieldByName('DT_VCTO').AsDateTime := vIcmInterOb.dataSet.FieldByName('DATA_LANC').AsDateTime;
        vIcmInterOb.dataSet.FieldByName('ANO_REF').AsInteger := YearOf(vIcmInterOb.dataSet.FieldByName('DATA_LANC').AsDateTime);
        vIcmInterOb.dataSet.FieldByName('MES_REF').AsInteger := MonthOf(vIcmInterOb.dataSet.FieldByName('DATA_LANC').AsDateTime );
      end
      else
        SpeedButton1.Click;
    end
    else
      BitBtn3Click(Sender);
  end;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadSpedFObrigacoesDIFAL.SpeedButton1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not vIcmInterOb.Edit then
      exit;
    inherited;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox3.CanFocus) then
      DBLookupComboBox3.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadSpedFObrigacoesDIFAL.SpeedButton2Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    vIcmInterOb.Delete;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadSpedFObrigacoesDIFAL.BitBtn5Click(Sender: TObject);
begin
  vIcmInterOb.Cancel;
  if TelaCadastro = 2 then
  begin
    PageControl1.ActivePage := TabSheet2;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
      DBGrid1.SetFocus;
    Exit;
  end;
  inherited;
end;

procedure TfrmCadSpedFObrigacoesDIFAL.DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  	SpeedButton1Click(Sender)
  else if Key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if Key = VK_INSERT then
    BitBtn3Click(Sender);
end;

procedure TfrmCadSpedFObrigacoesDIFAL.BitBtn4Click(Sender: TObject);
begin
  if not vIcmInterOb.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(vIcmInterOb.vNomeCampoErro);
  end
  else
  begin
    if TelaCadastro = 1 then
    begin
      BitBtn6.Click;
      Exit;
    end;
    if CheckCadSeq.Checked then
    begin
      if vIcmInterOb.Insert then
      begin
        PageControl3.ActivePage := tsCadastro;
        if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
        	DBEdit1.SetFocus;
      end;
    end
    else if TelaCadastro = 2 then
      BitBtn5.Click
    else
      inherited;
  end;
end;

initialization
  RegisterClass(TfrmCadSpedFObrigacoesDIFAL);
finalization
  UnRegisterClass(TfrmCadSpedFObrigacoesDIFAL);

end.
