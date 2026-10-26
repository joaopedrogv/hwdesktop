unit uCadSpedFIcmsInterAjustes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls, Buttons, Grids, DBGrids, Mask, DB, DBCtrls, uEditHw;

type
  TfrmSpedFIcmsInterAjustes = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    pnCadastro: TPanel;
    ScrollBox4: TScrollBox;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBMemo1: TDBMemo;
    Panel5: TPanel;
    Panel4: TPanel;
    PageControl2: TPageControl;
    tsInfAdicionais: TTabSheet;
    tsInfDoc: TTabSheet;
    DBGrid2: TDBGrid;
    Panel6: TPanel;
    Panel7: TPanel;
    DBGrid3: TDBGrid;
    tsCadInfAd: TTabSheet;
    pnCadInfAd: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Label9: TLabel;
    DBEdit2: TDBEdit;
    Label10: TLabel;
    DBEdit4: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    DBMemo2: TDBMemo;
    Label13: TLabel;
    DBMemo3: TDBMemo;
    DBLookupComboBox1: TDBLookupComboBox;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    tsCadDoc: TTabSheet;
    pnInfAdDoc: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    GroupBox5: TGroupBox;
    BitBtn11: TBitBtn;
    GroupBox6: TGroupBox;
    BitBtn12: TBitBtn;
    Label14: TLabel;
    DBEdit5: TDBEdit;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    Label15: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label16: TLabel;
    DBEdit6: TDBEdit;
    Label17: TLabel;
    DBEdit7: TDBEdit;
    Label18: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Label19: TLabel;
    DBEdit10: TDBEdit;
    Label20: TLabel;
    DBEdit11: TDBEdit;
    Label21: TLabel;
    DBEdit12: TDBEdit;
    Label22: TLabel;
    DBEdit13: TDBEdit;
    Label23: TLabel;
    DBEdit14: TDBEdit;
    Label24: TLabel;
    DBEdit15: TDBEdit;
    Label25: TLabel;
    DBEdit16: TDBEdit;
    Label26: TLabel;
    DBEdit17: TDBEdit;
    BitBtn19: TBitBtn;
    tsPesqNF: TTabSheet;
    pnPesqNF: TPanel;
    Panel10: TPanel;
    DBGrid4: TDBGrid;
    Panel13: TPanel;
    Panel14: TPanel;
    BitBtn20: TBitBtn;
    BitBtn21: TBitBtn;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    EditHw1: TEditHw;
    BitBtn22: TBitBtn;
    tsPesqNFIt: TTabSheet;
    pnPesqNFIt: TPanel;
    Panel16: TPanel;
    DBGrid5: TDBGrid;
    Panel18: TPanel;
    BitBtn24: TBitBtn;
    BitBtn25: TBitBtn;
    Label30: TLabel;
    DBEdit18: TDBEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn24Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure BitBtn22Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSpedFIcmsInterAjustes: TfrmSpedFIcmsInterAjustes;

implementation

uses uDtmSPED, uClassesSpedFBlocoE, uDtmAtivo, uDadosIni, DateUtils;

{$R *.dfm}

procedure TfrmSpedFIcmsInterAjustes.BitBtn10Click(Sender: TObject);
begin
  if vIcmInterAj.infDoc.salvar then
    TForm(pnInfAdDoc.Parent).ModalResult := IDOK;
end;

procedure TfrmSpedFIcmsInterAjustes.BitBtn11Click(Sender: TObject);
begin
  inherited;
  DBGrid4.DataSource := vIcmInterAj.infDoc.notas.dataS;
  MaskEdit4.Text := regGetConfStr(MaskEdit4.Name);
  MaskEdit5.Text := regGetConfStr(MaskEdit5.Name);
  if MaskEdit4.Text = '  /  /    ' then
    MaskEdit4.Text := DateToStr(StartOfTheMonth( StartOfTheMonth(Date - 1) ));
  if MaskEdit5.Text = '  /  /    ' then
    MaskEdit5.Text := DateToStr(EndOfTheMonth( StartOfTheMonth(Date - 1) ));
  vIcmInterAj.infDoc.notas.pesquisarRegistros(MaskEdit4.Text, MaskEdit5.Text, 0);
  if vDadosIni.abreForm('Selecione a nota fiscal', pnPesqNF, [ofAutoSize, ofEscapeExit]) then
    vIcmInterAj.infDoc.setDadosNF;
end;

procedure TfrmSpedFIcmsInterAjustes.BitBtn12Click(Sender: TObject);
begin
  inherited;
  DBGrid5.DataSource := vIcmInterAj.infDoc.notas.itens.dataS;
  vIcmInterAj.infDoc.notas.itens.pesquisarRegistros;
  if vDadosIni.abreForm('Selecione o item da nota fiscal', pnPesqNFIt, [ofAutoSize, ofEscapeExit]) then
    vIcmInterAj.infDoc.setDadosNFItens;
end;

procedure TfrmSpedFIcmsInterAjustes.BitBtn13Click(Sender: TObject);
begin
  inherited;
  if vIcmInterAj.infDoc.inserir then
  begin
    vDadosIni.abreForm('Informações Adicionais de Documentos', pnInfAdDoc, [ofAutoSize, ofEscapeExit]);
    vIcmInterAj.infDoc.cancela;
  end;
end;

procedure TfrmSpedFIcmsInterAjustes.BitBtn14Click(Sender: TObject);
begin
  inherited;
  if vIcmInterAj.infDoc.editar then
  begin
    vDadosIni.abreForm('Informações Adicionais de Documentos', pnInfAdDoc, [ofAutoSize, ofEscapeExit]);
    vIcmInterAj.infDoc.cancela;
  end;
end;

procedure TfrmSpedFIcmsInterAjustes.BitBtn15Click(Sender: TObject);
begin
  inherited;
  vIcmInterAj.infDoc.excluir;
end;

procedure TfrmSpedFIcmsInterAjustes.BitBtn16Click(Sender: TObject);
begin
  inherited;
  if vIcmInterAj.infAd.Insert then
  begin
    vDadosIni.abreForm('Informações Adicionais', pnCadInfAd, [ofAutoSize, ofEscapeExit]);
    vIcmInterAj.infAd.Cancel;
  end;
end;

procedure TfrmSpedFIcmsInterAjustes.BitBtn17Click(Sender: TObject);
begin
  inherited;
  if vIcmInterAj.infAd.Edit then
  begin
    vDadosIni.abreForm('Informações Adicionais', pnCadInfAd, [ofAutoSize, ofEscapeExit]);
    vIcmInterAj.infAd.Cancel;
  end;
end;

procedure TfrmSpedFIcmsInterAjustes.BitBtn18Click(Sender: TObject);
begin
  inherited;
  vIcmInterAj.infAd.Delete;
end;

procedure TfrmSpedFIcmsInterAjustes.BitBtn19Click(Sender: TObject);
begin
  inherited;
  vIcmInterAj.infDoc.clearDadosNFItens;
end;

procedure TfrmSpedFIcmsInterAjustes.BitBtn1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not vDadosIni.PesqPros('SPED095', 'CONSULTA', '', 'SPED_F_ICMINTER_AJ', '', vIcmInterAj.buscas, False) then
      Exit;

    inherited;

    if MaskEdit2.Visible then
    begin
      if not vIcmInterAj.ConsultaCampos('SPED_F_ICMINTER_AJ', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else
      if vIcmInterAj.ConsultaCampos('SPED_F_ICMINTER_AJ', MaskEdit3.text, ComboBox1.Text,
        combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		ComboBox1.SetFocus;

    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmSpedFIcmsInterAjustes.BitBtn20Click(Sender: TObject);
begin
  inherited;
  if not vIcmInterAj.infDoc.notas.IsEmpty then
    TForm(pnPesqNF.Parent).ModalResult := IDOK;
end;

procedure TfrmSpedFIcmsInterAjustes.BitBtn22Click(Sender: TObject);
begin
  inherited;
  vIcmInterAj.infDoc.notas.pesquisarRegistros(MaskEdit4.Text, MaskEdit5.Text, EditHw1.AsInteger);
  regSetConfStr(MaskEdit4.Name, MaskEdit4.Text);
  regSetConfStr(MaskEdit5.Name, MaskEdit5.Text);
end;

procedure TfrmSpedFIcmsInterAjustes.BitBtn24Click(Sender: TObject);
begin
  inherited;
  if not vIcmInterAj.infDoc.notas.itens.IsEmpty then
    TForm(pnPesqNFIt.Parent).ModalResult := IDOK;
end;

procedure TfrmSpedFIcmsInterAjustes.BitBtn3Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    ActiveControl := BitBtn3;
    if not vIcmInterAj.Insert then
      exit;
    inherited;
    PageControl1.ActivePage := TabSheet1;
    PageControl2.ActivePage := tsInfAdicionais;
    PageControl3.ActivePage := tsCadastro;

    if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
      DBEdit1.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmSpedFIcmsInterAjustes.BitBtn4Click(Sender: TObject);
begin
  if not vIcmInterAj.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(vIcmInterAj.vNomeCampoErro);
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
      if vIcmInterAj.Insert then
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

procedure TfrmSpedFIcmsInterAjustes.BitBtn5Click(Sender: TObject);
begin
  vIcmInterAj.Cancel;
  if TelaCadastro = 2 then
  begin
    PageControl1.ActivePage := TabSheet2;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
      DBGrid1.SetFocus;
    Exit;
  end;
  inherited;
end;

procedure TfrmSpedFIcmsInterAjustes.BitBtn7Click(Sender: TObject);
begin
  vIcmInterAj.infAd.Cancel;
  inherited;
end;

procedure TfrmSpedFIcmsInterAjustes.BitBtn8Click(Sender: TObject);
begin
  if vIcmInterAj.infAd.Post then
    TForm(pnCadInfAd.Parent).ModalResult := IDOK;
end;

procedure TfrmSpedFIcmsInterAjustes.BitBtn9Click(Sender: TObject);
begin
  vIcmInterAj.infDoc.cancela;
  inherited;
end;

procedure TfrmSpedFIcmsInterAjustes.DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  	SpeedButton1Click(Sender)
  else if Key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if Key = VK_INSERT then
    BitBtn3Click(Sender);
end;

procedure TfrmSpedFIcmsInterAjustes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  vIcmInterAj.Free;
  vIcmInterAj := nil;

  Action := caFree;
  frmSpedFIcmsInterAjustes := nil;
end;

procedure TfrmSpedFIcmsInterAjustes.FormCreate(Sender: TObject);
begin

  TelaCadastro := vDadosIni.vTipoForm;
  inherited;

  vIcmInterAj := TIcmsInterDifalAjustes.create;

  tsCadastro.TabVisible := False;
  TabSheet1.TabVisible := False;
  tsCadInfAd.TabVisible := False;
  tsCadDoc.TabVisible := False;
  tsPesqNF.TabVisible := False;
  tsPesqNFIt.TabVisible := False;
  PageControl1.ActivePage := TabSheet2;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';

end;

procedure TfrmSpedFIcmsInterAjustes.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_INSERT then
    if PageControl1.ActivePage = TabSheet2 then
      SpeedButton1.Click;
end;

procedure TfrmSpedFIcmsInterAjustes.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmSPED.dsICMInterAJ;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);

    vIcmInterAj.estado.setDadosDataSet([
      'AC','AL','AP','AM','BA','CE','DF','ES','GO','MA','MT','MS','MG','PA','PB','PR','PE','PI',
      'RJ','RN','RS','RO','RR','SC','SP','SE','TO'], [
      'Acre','Alagoas','Amapá','Amazonas','Bahia','Ceará','Distrito Federal','Espírito Santo','Goiás',
      'Maranhão','Mato Grosso','Mato Grosso do Sul','Minas Gerais','Pará','Paraíba','Paraná','Pernambuco',
      'Piauí','Rio de Janeiro','Rio Grande do Norte','Rio Grande do Sul','Rondônia','Roraima','Santa Catarina',
      'São Paulo','Sergipe','Tocantins'], DBLookupComboBox2);

    vIcmInterAj.infAd.indProc.setDadosDataSet(['0','1','2','9'], ['0 - Sefaz', '1 - Justiça Federal',
      '2 - Justiça Estadual', '9 - Outros'], DBLookupComboBox1);
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmSpedFIcmsInterAjustes.SpeedButton1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not vIcmInterAj.Edit then
      exit;
    inherited;
    PageControl1.ActivePage := TabSheet1;
    PageControl2.ActivePage := tsInfAdicionais;
    PageControl3.ActivePage := tsCadastro;

    if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
      DBEdit1.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmSpedFIcmsInterAjustes.SpeedButton2Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    vIcmInterAj.Delete;
  finally
    Screen.Cursor := crDefault;
  end;
end;

end.
