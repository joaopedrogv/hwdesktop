unit uCadAtributos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls;

type
  TfrmCadAtributos = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadAtributos: TfrmCadAtributos;

implementation

uses UdtmGestorHw, UClassesGestor, uDtmAtivo, uDadosIni;

{$R *.dfm}

procedure TfrmCadAtributos.BitBtn1Click(Sender: TObject);
begin
   if not vDadosIni.PesqPros('GES069', 'CONSULTA', '', 'ATRIBUTOS', '',
    Atributos.buscas, true) then
    Exit;

  inherited;
  if MaskEdit2.Visible then
  begin
    if not Atributos.ConsultaCampos('ATRIBUTOS', ComboBox1.Text,
      ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus;
  end
  else if not Atributos.ConsultaCampos('ATRIBUTOS', MaskEdit3.text, ComboBox1.Text,
    combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
    	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
    		ComboBox1.SetFocus;

  SpeedButton2.Hint := 'Enviar para Lixeira - [GES072]';
  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmCadAtributos.BitBtn3Click(Sender: TObject);
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('ATRIBUTOS_FORNECEDOR', 'I', Atributos.buscas) then
    Exit;
  try
    if not Atributos.Insert then
      exit;

    inherited;

    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      DBEdit2.SetFocus;

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + E.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      Atributos.Cancel;
      Atributos.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadAtributos.BitBtn4Click(Sender: TObject);
begin
  if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
 	  BitBtn4.SetFocus;
  if not Atributos.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(Atributos.vNomeCampoErro, Atributos.vMensagemErro);
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
      if Atributos.Insert then
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

procedure TfrmCadAtributos.BitBtn5Click(Sender: TObject);
begin
 inherited;
 Atributos.Cancel;
 Atributos.RollBackTransacao;
end;

procedure TfrmCadAtributos.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadAtributos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
if (Atributos <> nil) then
    Atributos.Cancel;

  Atributos.free;
  Atributos := nil;

  Action := caFree;
  if (frmCadAtributos <> nil) then
    frmCadAtributos := nil;

end;

procedure TfrmCadAtributos.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  Atributos := TAtributos.create;
  tsCadastro.TabVisible := False;
  PageControl1.ActivePage := TabSheet2;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadAtributos.FormShow(Sender: TObject);
begin
 if vShow <> 1 then
  begin
    DBGrid1.DataSource := DtmGestorHw.dsAtributos;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    SpeedButton2.Hint := 'Enviar para Lixeira -  [GES072]';
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender)
  else
  begin
    lixeiraVazia(not Atributos._lixeiraCheia);
  end;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadAtributos.SpeedButton1Click(Sender: TObject);
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('ATRIBUTOS_FORNECEDOR', 'A', Atributos.buscas) then
    Exit;
 try
    if Atributos.dataSet.IsEmpty then
      Exit;
    if not Atributos.Edit then
      Exit;
    inherited;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

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
      Atributos.Cancel;
      Atributos.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadAtributos.SpeedButton25Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('GES076', 'ABRIR A LIXEIRA', '', 'ATRIBUTOS',
    '', Atributos.buscas, true) then
    Exit;

  inherited;

  if not Atributos._abrelixeira then
  begin
    SpeedButton2.Hint := 'Enviar para Lixeira -  [GES072]';
    SpeedButton1.Visible := True;
    SpeedButton5.Visible := False;
  end
  else
  begin
    SpeedButton2.Hint := 'Excluir registro permanentemente -  [GES073]';
    SpeedButton1.Visible := False;
    SpeedButton5.Visible := True;
  end;
end;

procedure TfrmCadAtributos.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('ATRIBUTOS_FORNECEDOR', 'E', Atributos.buscas) then
    Exit;
  try
    Atributos.Delete;
    lixeiraVazia(not Atributos._lixeiraCheia);

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      Atributos.Cancel;
      Atributos.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadAtributos.SpeedButton5Click(Sender: TObject);
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('ATRIBUTOS_FORNECEDOR', 'A', Atributos.buscas) then
    Exit;
   if vDadosIni.PesqPros('GES074', '', '', 'ATRIBUTOS', '', Atributos.buscas, true) then
    if Atributos._restauraLixeira then
     lixeiraVazia(not Atributos._lixeiraCheia);
end;

end.
