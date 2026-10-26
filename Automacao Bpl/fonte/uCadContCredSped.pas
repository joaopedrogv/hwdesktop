unit uCadContCredSped;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, ExtCtrls, Menus, ComCtrls, Buttons, Grids, DBGrids,
  StdCtrls, Mask, uClassesCIAP, DBCtrls, AppEvnts;

type
  TfrmCadContSped = class(TfrmCadPadraoM)
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    Label10: TLabel;
    DBEdit5: TDBEdit;
    Label11: TLabel;
    DBEdit6: TDBEdit;
    Label12: TLabel;
    DBEdit7: TDBEdit;
    GroupBox4: TGroupBox;
    Panel4: TPanel;
    DBGrid2: TDBGrid;
    DBComboBox1: TDBComboBox;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    Panel5: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    DBEdit9: TDBEdit;
    Label15: TLabel;
    DBEdit10: TDBEdit;
    DBComboBox2: TDBComboBox;
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadContSped: TfrmCadContSped;
  obContCF: TControleCreditosFiscais;

implementation

uses uDtmCIAP, uDtmAtivo;

{$R *.dfm}

procedure TfrmCadContSped.BitBtn10Click(Sender: TObject);
begin
  inherited;
  obContCF.vItem.Cancel;
  Panel5.Enabled := False;
  BitBtn7.Visible := True;
  BitBtn8.Visible := True;
  BitBtn9.Visible := True;
  BitBtn10.Visible := False;
  BitBtn11.Visible := False;
end;

procedure TfrmCadContSped.BitBtn11Click(Sender: TObject);
begin
  inherited;
  if obContCF.salvaItem then
  begin
    Panel5.Enabled := False;
    BitBtn7.Visible := True;
    BitBtn8.Visible := True;
    BitBtn9.Visible := True;
    BitBtn10.Visible := False;
    BitBtn11.Visible := False;
  end;
end;

procedure TfrmCadContSped.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('SPED076','CONSULTA','','SPED_CONT_CRED_FISC','',obContCF.buscas,False) then
    Exit;
  if MaskEdit2.Visible then
  begin
    if not obContCF.ConsultaCampos('SPED_CONT_CRED_FISC', ComboBox1.Text,
      ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
      		combobox1.setfocus;
  end
  else
    if obContCF.ConsultaCampos('SPED_CONT_CRED_FISC', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
      		ComboBox1.SetFocus;

  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmCadContSped.BitBtn3Click(Sender: TObject);
begin
  Panel5.Enabled := False;
  BitBtn7.Visible := True;
  BitBtn8.Visible := True;
  BitBtn9.Visible := True;
  BitBtn10.Visible := False;
  BitBtn11.Visible := False;
  ActiveControl := BitBtn3;
  if not obContCF.Insert then
    exit;
  inherited;
  PageControl1.ActivePage := TabSheet1;
  PageControl3.ActivePage := TabSheet3;
  if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
    DBEdit1.SetFocus;
end;

procedure TfrmCadContSped.BitBtn4Click(Sender: TObject);
begin
  if not obContCF.post then
  begin
    PageControl3.ActivePage := TabSheet3;
    setFocusCampoErro(obContCF.vNomeCampoErro);
  end
  else
  begin
    if TelaCadastro = 2 then
    begin
      BitBtn6.Click;
      Exit;
    end;
    if CheckCadSeq.Checked then
    begin
      if obContCF.Insert then
      begin
        PageControl3.ActivePage := TabSheet3;
        if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
        	DBEdit1.SetFocus;
      end;
    end
    else
      inherited;
  end;
end;

procedure TfrmCadContSped.BitBtn5Click(Sender: TObject);
begin
  inherited;
  obContCF.Cancel;
end;

procedure TfrmCadContSped.BitBtn7Click(Sender: TObject);
begin
  inherited;
  if obContCF.insertItem then
  begin
    Panel5.Enabled := True;
    BitBtn7.Visible := False;
    BitBtn8.Visible := False;
    BitBtn9.Visible := False;
    BitBtn10.Visible := True;
    BitBtn11.Visible := True;
    if (Self.Enabled) and (Self.Visible) and (DBComboBox2.CanFocus) then
      DBComboBox2.SetFocus;
  end;
end;

procedure TfrmCadContSped.BitBtn8Click(Sender: TObject);
begin
  inherited;
  if obContCF.vItem.Edit then
  begin
    Panel5.Enabled := True;
    BitBtn7.Visible := False;
    BitBtn8.Visible := False;
    BitBtn9.Visible := False;
    BitBtn10.Visible := True;
    BitBtn11.Visible := True;
    if (Self.Enabled) and (Self.Visible) and (DBComboBox2.CanFocus) then
      DBComboBox2.SetFocus;
  end;
end;

procedure TfrmCadContSped.BitBtn9Click(Sender: TObject);
begin
  inherited;
  obContCF.vItem.Delete;
end;

procedure TfrmCadContSped.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  SpeedButton1.Click;
end;

procedure TfrmCadContSped.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = VK_RETURN then
    SpeedButton1Click(Sender)
  else if Key = VK_DELETE then
  	SpeedButton2Click(Sender)
  else if Key = VK_INSERT then
  	BitBtn3Click(Sender);
end;

procedure TfrmCadContSped.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  obContCF.Free;
  obContCF := nil;
  Action := caFree;
  frmCadContSped := nil;
end;

procedure TfrmCadContSped.FormCreate(Sender: TObject);
begin
  inherited;
  TelaCadastro := vDadosIni.vTipoForm;
  TelaCadastro := 0;
  obContCF := TControleCreditosFiscais.Create;
end;

procedure TfrmCadContSped.FormShow(Sender: TObject);
begin
  DBGrid1.DataSource := dtmCIAP.dsContCF;
  TabSheet1.TabVisible := false;
  TabSheet2.TabVisible := false;
  TabSheet3.TabVisible := false;

  inherited;

  setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);

end;

procedure TfrmCadContSped.SpeedButton1Click(Sender: TObject);
begin
  Panel5.Enabled := False;
  BitBtn7.Visible := True;
  BitBtn8.Visible := True;
  BitBtn9.Visible := True;
  BitBtn10.Visible := False;
  BitBtn11.Visible := False;
  inherited;
  if not obContCF.Edit then
    exit;
  PageControl1.ActivePage := TabSheet1;
  PageControl3.ActivePage := TabSheet3;
  if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
    DBEdit1.SetFocus;
end;

procedure TfrmCadContSped.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if obContCF.Delete then
  begin
  end;
end;

end.

