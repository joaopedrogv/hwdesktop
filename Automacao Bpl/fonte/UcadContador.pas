unit UcadContador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, ExtCtrls, Menus, ComCtrls, Buttons, Grids, DBGrids,
  StdCtrls, Mask, uclassesCadastrosBasicos, DB,DBCtrls, QRMBCtrls, QRCtrls,
  QuickRpt, grimgctrl, AppEvnts;

type
  TfrmCadContador = class(TfrmCadPadraoM)
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    Label9: TLabel;
    DBEdit6: TDBEdit;
    Label12: TLabel;
    Label13: TLabel;
    DBEdit8: TDBEdit;
    Label14: TLabel;
    Label15: TLabel;
    DBEdit10: TDBEdit;
    Label16: TLabel;
    DBEdit11: TDBEdit;
    Label17: TLabel;
    DBEdit12: TDBEdit;
    Label18: TLabel;
    DBEdit13: TDBEdit;
    Label19: TLabel;
    DBEdit14: TDBEdit;
    Label20: TLabel;
    DBEdit15: TDBEdit;
    Label21: TLabel;
    DBEdit16: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    Label22: TLabel;
    DBEdit4: TDBEdit;
    TabSheet4: TTabSheet;
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRMBDBText1: TQRMBDBText;
    QRDBText3: TQRDBText;
    QRMBDBText2: TQRMBDBText;
    QRHRule1: TQRHRule;
    QRHRule2: TQRHRule;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    DBEdit5: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label23: TLabel;
    DBEdit7: TDBEdit;
    DBEdit134: TDBEdit;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    Label11: TLabel;
    DBEdit17: TDBEdit;
    Label24: TLabel;
    DBEdit18: TDBEdit;
    procedure QuickRep1Preview(Sender: TObject);
    procedure DBEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit5Enter(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure DBEdit6Enter(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure DBLookupComboBox1Enter(Sender: TObject);
    procedure DBLookupComboBox2Exit(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit4KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadContador: TfrmCadContador;
  obContador: TContador;
implementation

uses  UDtmCadastrosBasicos, uDtmAtivo;

{$R *.dfm}

procedure TfrmCadContador.BitBtn1Click(Sender: TObject);
begin
 SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS208]';
 
 if not(vDadosIni.PesqPros('BAS204', 'PESQUISAR', '', 'COND_PAG', '', obContador.buscas, true)) then
  begin
   exit;
  end;
  inherited;
 if MaskEdit2.Visible then
  begin
    if not obContador.ConsultaCampos('CONTADOR', ComboBox1.Text,
      ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus;
  end
  else
    if not obContador.ConsultaCampos('CONTADOR', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		ComboBox1.SetFocus;

  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmCadContador.BitBtn3Click(Sender: TObject);
begin
  if not(vDadosIni.PesqPros('BAS205', 'NOVO', '', 'COND_PAG', '', obContador.buscas, true)) then
  begin
   exit;
  end;

  if not obContador.Insert then
    exit;

  ActiveControl := BitBtn3;
  Inherited;

  PageControl1.ActivePage:=TabSheet1;
  TabSheet3.TabVisible:=True;
  TabSheet3.Caption:= 'Cadastro Contador';
  PageControl3.ActivePage:=TabSheet3;
  if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
   	DBEdit2.SetFocus;

  obContador.vUF.abreUF;
  obContador.vBairro.AbreBairro;
  obContador.vCidade.AbreCidade;
end;

procedure TfrmCadContador.BitBtn4Click(Sender: TObject);
begin
	if not obContador.Post then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
    	DBEdit2.SetFocus;
  end
  else
  begin
    if CheckCadSeq.Checked then
    begin
      if obContador.Insert then
        if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
      	  DBEdit3.SetFocus;
      MudaCor;
    end
    else
      inherited;
  end;
end;

procedure TfrmCadContador.BitBtn5Click(Sender: TObject);
begin
  inherited;
  obContador.Cancel;
end;

procedure TfrmCadContador.DBEdit4KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (key  in ['0'..'9',#8,#13]) then
  key:=#0;
end;

procedure TfrmCadContador.DBEdit5Enter(Sender: TObject);
begin
  inherited;
//DBEdit5.Text:=vDadosIni.pesquisaRapida('BAIRROS');
end;

procedure TfrmCadContador.DBEdit5Exit(Sender: TObject);
begin
  inherited;
 if DBEdit5.Text <> '' then
     DBLookupComboBox1.KeyValue:=StrToInt(DBEdit5.Text);
end;

procedure TfrmCadContador.DBEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  begin
  inherited;
if Key = VK_F3 then
begin
   obContador.dataSet.FieldByName('COD_BAIRRO').AsString:=vDadosIni.pesquisaRapida('BAIRROS');
end;
end;

procedure TfrmCadContador.DBEdit6Enter(Sender: TObject);
begin
  inherited;
//DBEdit6.Text:=vDadosIni.pesquisaRapida('CIDADES');
end;

procedure TfrmCadContador.DBEdit6Exit(Sender: TObject);
begin
  inherited;
if DBEdit6.Text <> '' then
     DBLookupComboBox2.KeyValue:=StrToInt(DBEdit6.Text);
end;

procedure TfrmCadContador.DBEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

begin
  inherited;

if Key = VK_F3 then
     obContador.dataSet.FieldByName('COD_CIDADE').AsString:= vDadosIni.pesquisaRapida('CIDADES');
  end;

procedure TfrmCadContador.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadContador.DBLookupComboBox1Enter(Sender: TObject);
begin
  inherited;
  vDadosIni.pesquisaRapida('BAIRROS');
end;

procedure TfrmCadContador.DBLookupComboBox1Exit(Sender: TObject);
begin
  inherited;
  if DBLookupComboBox1.KeyValue <> null then
    DBEdit5.Text:= IntToStr(DBLookupComboBox1.KeyValue);

  if DBLookupComboBox1.Text = '' then
  begin
    ShowMessage('código do bairro não cadastrado.');
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
    	DBLookupComboBox1.SetFocus;
  end;
end;

procedure TfrmCadContador.DBLookupComboBox2Exit(Sender: TObject);
begin
  inherited;
  if DBLookupComboBox2.KeyValue <> null then
    DBEdit6.Text:= IntToStr(DBLookupComboBox2.KeyValue);

  if DBLookupComboBox2.Text = '' then
  begin
    ShowMessage('código da cidade não cadastrado.');
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox2.CanFocus) then
    	DBLookupComboBox2.SetFocus;
  end;
end;

procedure TfrmCadContador.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
Action:= cafree;
frmCadContador:= nil;
end;

procedure TfrmCadContador.FormCreate(Sender: TObject);
begin
  inherited;
obContador:= TContador.create;
end;

procedure TfrmCadContador.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
   BitBtn5Click(sender);

  if key  = VK_INSERT then
  BitBtn3Click(sender);



end;

procedure TfrmCadContador.FormShow(Sender: TObject);
var I: integer;
begin
  DBGrid1.DataSource:= DtmCadBasicos.dsContador;
  obContador.abreContador;
  TabSheet4.TabVisible:=false;
  
inherited;
  setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  for I := 0 to self.ComponentCount - 1 do
  begin
    if Components[i] is TDBEdit then
      TDBEdit(Components[i]).CharCase:= ecUpperCase;
      
    if Components[I] is TDBComboBox then
       TDBComboBox(Components[I]).CharCase := ecUpperCase;
  end;
  
  if obContador.StatusLixeira then
     lixeiraVazia(false)
  else
     lixeiraVazia(true);

end;

procedure TfrmCadContador.QuickRep1Preview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Relação de Contadores');
end;

procedure TfrmCadContador.SpeedButton1Click(Sender: TObject);
begin
 if not(vDadosIni.PesqPros('BAS206', 'EDITAR', '', 'COND_PAG', '', obContador.buscas, true)) then
  begin
   exit;
  end;
   if obContador.dataSet.FieldByName('ATIVO').AsInteger <> 1 then
    exit;
  inherited;
  if not obContador.Edit then
     exit;

  PageControl1.ActivePage:=TabSheet1;
  TabSheet3.TabVisible:=True;
  TabSheet3.Caption:= 'Alterando Contador';
  if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
  	DBEdit2.SetFocus;

  obContador.vUF.abreUF;
   obContador.vBairro.AbreBairro;
   obContador.vCidade.AbreCidade;

end;

procedure TfrmCadContador.SpeedButton25Click(Sender: TObject);
begin
 if not(vDadosIni.PesqPros('BAS210', 'LIXEIRA', '', 'COND_PAG', '', obContador.buscas, true)) then
  begin
   exit;
  end;
  inherited;
if not obContador.abrirLixeira then
  begin
    SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS208]';
    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
  end
  else
  begin
    SpeedButton2.Hint := 'Excluir registro permanentemente -  [BAS207]';
    SpeedButton1.Visible := false;
    SpeedButton5.Visible := true;
  end;
end;

procedure TfrmCadContador.SpeedButton2Click(Sender: TObject);
begin
 if not(vDadosIni.PesqPros('BAS208', 'DELETAR', '', 'COND_PAG', '', obContador.buscas, true)) then
  begin
   exit;
  end;
  inherited;
if obContador.Delete then
  begin
  if obContador.StatusLixeira then
  begin
      lixeiraVazia(false);
  end
   else begin
      lixeiraVazia(true);
      obContador.abreContador;
   end;

  end;

end;

procedure TfrmCadContador.SpeedButton3Click(Sender: TObject);
begin
 if not(vDadosIni.PesqPros('BAS213', '', '', 'COND_PAG', '', obContador.buscas, true)) then
  begin
   exit;
  end;
  inherited;
QuickRep1.Preview;
end;

procedure TfrmCadContador.SpeedButton5Click(Sender: TObject);
begin
 if not(vDadosIni.PesqPros('BAS209', 'RESTAURAR', '', 'COND_PAG', '', obContador.buscas, true)) then
  begin
   exit;
  end;
  inherited;
  if obContador.restauraLixeira  then
begin
 if obContador.StatusLixeira then
      lixeiraVazia(false)
   else begin
      lixeiraVazia(true);
      obContador.abreContador;
   end;
  end;
end;

end.
