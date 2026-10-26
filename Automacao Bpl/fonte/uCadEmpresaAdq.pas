unit uCadEmpresaAdq;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls;

type
  TfrmCadEmpresaAdq = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadEmpresaAdq: TfrmCadEmpresaAdq;

implementation

uses
	uDtmAtivo, UClassesCadastrosBasicos, UDtmCadastrosBasicos, uDadosIni;

{$R *.dfm}

procedure TfrmCadEmpresaAdq.BitBtn1Click(Sender: TObject);
var
 I: Integer;
begin
  if not vDadosIni.PesqPros('BAS519', 'CONSULTA', '', 'CONCILIACAO_ESTAB_EMP', '', ConciliacaoEstEmpAdq.buscas, true) then
    Exit;

  inherited;
  ConciliacaoEstEmpAdq.vCons.campo := ComboBox1.Text;
  ConciliacaoEstEmpAdq.vCons.ordem := ComboBox2.Text;
  ConciliacaoEstEmpAdq.vCons.condicao := ComboBox3.Text;
  ConciliacaoEstEmpAdq.vCons.valor := MaskEdit3.Text;
  ConciliacaoEstEmpAdq.vCons.dataIni := MaskEdit1.Text;
  ConciliacaoEstEmpAdq.vCons.dataFim := MaskEdit2.Text;
  ConciliacaoEstEmpAdq.vCons.porData := MaskEdit1.Visible;

  ConciliacaoEstEmpAdq.consulta;

  if not ConciliacaoEstEmpAdq.IsEmpty then
   if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
     DBGrid1.SetFocus;
end;

procedure TfrmCadEmpresaAdq.BitBtn3Click(Sender: TObject);
begin
  try
    if not ConciliacaoEstEmpAdq.Insert then
      exit;

    inherited;

    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
      DBEdit1.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      DBEdit2.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
      DBEdit3.SetFocus;

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + E.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      ConciliacaoEstEmpAdq.Cancel;
      ConciliacaoEstEmpAdq.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadEmpresaAdq.BitBtn4Click(Sender: TObject);
begin
	if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
		BitBtn4.SetFocus;
  if not ConciliacaoEstEmpAdq.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(ConciliacaoEstEmpAdq.vNomeCampoErro, ConciliacaoEstEmpAdq.vMensagemErro);
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
      if ConciliacaoEstEmpAdq.Insert then
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

procedure TfrmCadEmpresaAdq.BitBtn5Click(Sender: TObject);
begin
  inherited;
	ConciliacaoEstEmpAdq.Cancel;
  ConciliacaoEstEmpAdq.RollBackTransacao;
end;

procedure TfrmCadEmpresaAdq.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadEmpresaAdq.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  if (ConciliacaoEstEmpAdq <> nil) then
    ConciliacaoEstEmpAdq.Cancel;

  ConciliacaoEstEmpAdq.free;
  ConciliacaoEstEmpAdq := nil;

  Action := caFree;
  if (frmCadEmpresaAdq <> nil) then
    frmCadEmpresaAdq := nil;

end;

procedure TfrmCadEmpresaAdq.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  ConciliacaoEstEmpAdq := TConciliacaoEstEmpAdq.create;
  PageControl1.ActivePage := TabSheet2;
  tsCadastro.TabVisible := False;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';

end;

procedure TfrmCadEmpresaAdq.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := DtmCadBasicos.dsConciliacaoEmpAdq;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    SpeedButton2.Hint := 'Apagar Registro - [BAS522]';
  end;

  if TelaCadastro = 1 then
  	TelaCadastro := 0;

  SpeedButton1.Visible := true;
  SpeedButton25.Visible := false;
  SpeedButton3.Visible := false;
  SpeedButton4.Visible := false;
  SpeedButton5.Visible := false;

  vDadosIni.fechaStatusProcessamento;

end;

procedure TfrmCadEmpresaAdq.SpeedButton1Click(Sender: TObject);
begin
  try
    if ConciliacaoEstEmpAdq.dataSet.IsEmpty then
      Exit;
    if not ConciliacaoEstEmpAdq.Edit then
      Exit;
    inherited;

    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
      DBEdit1.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      DBEdit2.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
      DBEdit3.SetFocus;

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      ConciliacaoEstEmpAdq.Cancel;
      ConciliacaoEstEmpAdq.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadEmpresaAdq.SpeedButton2Click(Sender: TObject);
begin
  try
    ConciliacaoEstEmpAdq.Delete;
  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      ConciliacaoEstEmpAdq.Cancel;
      ConciliacaoEstEmpAdq.RollBackTransacao;
    end;
  end;
end;

end.
