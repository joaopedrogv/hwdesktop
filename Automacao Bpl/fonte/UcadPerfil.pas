unit UcadPerfil;

interface

uses
  Windows, uClassesCadastrosBasicos, uCadPadraoModal, QRCtrls, grimgctrl, qrpctrls,
  QuickRpt, DBCtrls, ExtCtrls, Menus, ComCtrls, Buttons, Grids, DBGrids,
  Controls, StdCtrls, Mask, Forms, Classes, AppEvnts, Graphics;

type
  TfrmCadPerfil = class(TfrmCadPadraoM)
    TabSheet4: TTabSheet;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRPLabel1: TQRPLabel;
    QRPLabel2: TQRPLabel;
    QRPLabel3: TQRPLabel;
    QRHRule1: TQRHRule;
    QRHRule2: TQRHRule;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    procedure QuickRep1Preview(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadPerfil: TfrmCadPerfil;
  obPerfil : TPerfil;
implementation

uses UDtmCadastrosBasicos, uDtmAtivo, DB;

{$R *.dfm}

procedure TfrmCadPerfil.BitBtn1Click(Sender: TObject);
begin
 SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS317]';
 
	if vDadosIni.PesqPros('BAS314', 'PESQUISAR', '',
    'TAB_PERFIL', '', obPerfil.buscas, true) then
  begin
    inherited;

  	if MaskEdit2.Visible then
    begin
      if not obPerfil.ConsultaCampos('Tab_Perfil', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
          if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
            combobox1.setfocus;
    end
    else
      if obPerfil.ConsultaCampos('Tab_Perfil', MaskEdit3.text, ComboBox1.Text,
        combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
          if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
            ComboBox1.SetFocus;

    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
      DBGrid1.SetFocus;
  end;
end;

procedure TfrmCadPerfil.BitBtn3Click(Sender: TObject);
begin
   if not obPerfil.Insert then
     exit;

   ActiveControl := BitBtn3;
   Inherited;

   PageControl1.ActivePage:=TabSheet1;
   TabSheet3.TabVisible:=True;
   TabSheet3.Caption:= 'Cadastro Perfil';
   PageControl3.ActivePage:=TabSheet3;
   if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
   	 DBEdit2.SetFocus;
end;

procedure TfrmCadPerfil.BitBtn4Click(Sender: TObject);
begin
	if not obPerfil.Post then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
    	DBEdit2.SetFocus;
  end
  else
  begin
    if CheckCadSeq.Checked then
    begin
      if obPerfil.Insert then
      	if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
        	DBEdit2.SetFocus;
      MudaCor;
    end
    else
      inherited;
  end;
end;

procedure TfrmCadPerfil.BitBtn5Click(Sender: TObject);
begin
  inherited;
obPerfil.Cancel;
end;

procedure TfrmCadPerfil.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender);
end;

procedure TfrmCadPerfil.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
Action:= caFree;
frmCadPerfil:= nil;
end;

procedure TfrmCadPerfil.FormCreate(Sender: TObject);
begin
	TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  obPerfil:= TPerfil.create;
  TabSheet4.TabVisible := False;
  PageControl1.ActivePage := TabSheet2;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
end;

procedure TfrmCadPerfil.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
   BitBtn5Click(sender);

  if key  = VK_INSERT then
  BitBtn3Click(sender);
end;

procedure TfrmCadPerfil.FormShow(Sender: TObject);
var I: integer;
begin
	if vShow <> 1 then
  begin
  	DBGrid1.DataSource := DtmCadBasicos.dsPerfil;
  	inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;

  obPerfil.abrePerfil;
  TabSheet4.TabVisible:=false;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  for I := 0 to self.ComponentCount - 1 do
  begin
    if Components[i] is TDBEdit then
      TDBEdit(Components[i]).CharCase:= ecUpperCase;
      
    if Components[I] is TDBComboBox then
       TDBComboBox(Components[I]).CharCase := ecUpperCase;
  end;

  if obPerfil.StatusLixeira then
     lixeiraVazia(false)
  else
     lixeiraVazia(true);

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadPerfil.QuickRep1Preview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Relação de Perfis');
end;

procedure TfrmCadPerfil.SpeedButton1Click(Sender: TObject);
begin

 if obPerfil.dataSet.FieldByName('ATIVO').AsInteger <> 1 then
    exit;
  inherited;
  if not obPerfil.Edit then
     exit;

  PageControl1.ActivePage:=TabSheet1;
  TabSheet3.TabVisible:=True;
  TabSheet3.Caption:= 'Alterando Perfil';
  if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
  	DBEdit2.SetFocus;
end;

procedure TfrmCadPerfil.SpeedButton25Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('BAS321', 'ABRIR A LIXEIRA', '', 'TAB_PERFIL',
    '', obPerfil.buscas, true) then
    Exit;


 if not obPerfil.abrirLixeira then
  begin
    SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS317]';
    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
  end
  else
  begin
    SpeedButton2.Hint := 'Excluir registro permanentemente -  [BAS318]';
    SpeedButton1.Visible := false;
    SpeedButton5.Visible := true;
  end;
end;

procedure TfrmCadPerfil.SpeedButton2Click(Sender: TObject);
begin
  inherited;
if obPerfil.Delete then
  begin
  if obPerfil.StatusLixeira then
  begin
      lixeiraVazia(false);
  end
   else begin
      lixeiraVazia(true);
      obPerfil.abrePerfil;
   end;

  end;
end;

procedure TfrmCadPerfil.SpeedButton3Click(Sender: TObject);
begin
  inherited;
   if not vDadosIni.PesqPros('BAS232', 'IMPRIMIR', '', 'TAB_PERFIL',
    obPerfil.dataSet.FieldByName('CAMPO_PERFIL').AsString, obPerfil.buscas, true) then
    exit;


  QuickRep1.Preview;
end;

procedure TfrmCadPerfil.SpeedButton5Click(Sender: TObject);
begin
  inherited;
if obPerfil.restauraLixeira  then
begin
 if obPerfil.StatusLixeira then
      lixeiraVazia(false)
   else begin
      lixeiraVazia(true);
      obPerfil.abrePerfil;
   end;
 end;
end;

end.
