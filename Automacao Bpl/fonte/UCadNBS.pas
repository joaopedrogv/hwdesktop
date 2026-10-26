unit UCadNBS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, UDtmProdutos, UClassesProdutos, uDadosIni, uDtmAtivo,
  AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls;

type
  TFrmCadNBS = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    procedure SpeedButton6Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadNBS: TFrmCadNBS;
  Nbs: TNBS;

implementation

uses uDataSet_OOP, DB;

procedure AtualizaImposto(Bancohw, codEmpresa: Pchar); external 'Compacta.dll';

{$R *.dfm}

procedure TFrmCadNBS.BitBtn1Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS325', 'PESQUISAR', '', 'NBS', '', Nbs.buscas, true) then
  begin
    inherited;
    if MaskEdit2.Visible then
    begin
      if not Nbs.ConsultaCampos('NBS', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else if not Nbs.ConsultaCampos('NBS', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		ComboBox1.SetFocus;
    SpeedButton1.Visible := true;

    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  end;
end;

procedure TFrmCadNBS.BitBtn3Click(Sender: TObject);
begin
  try
    if not NBS.Insert then
      exit;

    inherited;

    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;
    DBEdit1.Enabled := true;

    if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
      DBEdit1.SetFocus;
  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + E.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      NBS.Cancel;
      NBS.RollBackTransacao;
    end;
  end;
end;

procedure TFrmCadNBS.BitBtn4Click(Sender: TObject);
begin
	if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
  	BitBtn4.SetFocus;
  if not NBS.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(NBS.vNomeCampoErro, NBS.vMensagemErro);
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
      if NBS.Insert then
      begin
        PageControl3.ActivePage := tsCadastro;
        if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
        	DBEdit2.SetFocus;
      end;
    end
    else
      inherited;
  end;
end;

procedure TFrmCadNBS.BitBtn5Click(Sender: TObject);
begin
  inherited;
  NBS.Cancel;
  NBS.RollBackTransacao;

end;

procedure TFrmCadNBS.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
if not (Key in['0'..'9',Chr(8)]) then Key:= #0;
end;

procedure TFrmCadNBS.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmCadNBS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  if (NBS <> nil) then
  NBS.Cancel;

  NBS.free;
  NBS := nil;

  Action := caFree;
  if (frmCadNBS <> nil) then
    frmCadNBS := nil;
end;

procedure TFrmCadNBS.FormCreate(Sender: TObject);
begin
  inherited;
  if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'NBS' then
  begin
    if dtmProdutos = nil then
      dtmProdutos := tdtmProdutos.Create(dtmProdutos);
    vDadosIni.vTipoForm := 6;
    vDadosIni.vModalOuChild := 'M';
  end;
  TelaCadastro := vDadosIni.vTipoForm;
  Nbs := TNbs.Create;
  TabSheet3.TabVisible := false;
  tsCadastro.TabVisible := false;
  PageControl1.ActivePage := TabSheet2;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TFrmCadNBS.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
 if key = VK_INSERT then
  begin
    if PageControl1.ActivePage = TabSheet2 then
      BitBtn3Click(Sender);
  end
  else if key = VK_ESCAPE then
  begin
    if (Nbs.dataSet.State in [dsEdit, dsInsert]) then
    begin
      ActiveControl := BitBtn5;
      BitBtn5Click(Sender);
    end;
  end
end;

procedure TFrmCadNBS.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmProdutos.dsNBS;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;
  Nbs._abreNBS;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  if (TelaCadastro = 6) then
    BitBtn3.Click;
    
  vDadosIni.fechaStatusProcessamento;
end;

procedure TFrmCadNBS.SpeedButton1Click(Sender: TObject);
begin
   try
    if NBS.dataSet.IsEmpty then
      Exit;
    if not vDadosIni.PesqPros('BAS327', 'ALTERAR', '', 'NBS',
      NBS.dataSet.FieldByName('COD_NBS').AsString, NBS.buscas, true) then
      exit;

    if not NBS.Edit then
      Exit;
    inherited;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;
    DBEdit1.Enabled := false;

    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      DBEdit2.SetFocus;

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      NBS.Cancel;
      NBS.RollBackTransacao;
    end;
  end;
end;

procedure TFrmCadNBS.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  try
    if not vDadosIni.PesqPros('BAS328', 'EXCLUIR', '', 'NBS',
      NBS.dataSet.FieldByName('COD_NBS').AsString, NBS.buscas, false) then
      Exit;

    NBS.Delete;

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      NBS.Cancel;
      NBS.RollBackTransacao;
    end;
  end;
end;

procedure TFrmCadNBS.SpeedButton6Click(Sender: TObject);
begin
  inherited;
    if vDadosIni.PesqPros('PRO265', 'ALTERAR', '', 'NBM', '', NBS.buscas, True) then
      AtualizaImposto(pchar(vDadosIni.vBancoHW), pchar(vDadosIni.codEmpresa));
end;

initialization
  RegisterClass(TFrmCadNBS);
finalization
  UnRegisterClass(TFrmCadNBS);

end.
