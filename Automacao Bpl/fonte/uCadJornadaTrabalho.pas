unit uCadJornadaTrabalho;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls, UclassesColaborador;

type
  TfrmCadJornadaTrabalho = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    GroupBox4: TGroupBox;
    Panel4: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    GroupBox5: TGroupBox;
    pnSegunda: TPanel;
    ckSegunda: TCheckBox;
    pnTerca: TPanel;
    ckTerca: TCheckBox;
    pnQuarta: TPanel;
    ckQuarta: TCheckBox;
    pnQuinta: TPanel;
    ckQuinta: TCheckBox;
    pnSexta: TPanel;
    ckSexta: TCheckBox;
    pnSabado: TPanel;
    ckSabado: TCheckBox;
    pnDomingo: TPanel;
    ckDomingo: TCheckBox;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadJornadaTrabalho: TfrmCadJornadaTrabalho;
  obJornadaTrabalho: TJornadaTrabalho;

implementation

uses uDtmColaborador, uDtmAtivo;

{$R *.dfm}

procedure TfrmCadJornadaTrabalho.BitBtn1Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('COL058', 'CONSULTA', '', 'JORNADA_TRABALHO', '',
    obJornadaTrabalho.buscas, true) then
    Exit;

  inherited;
  if MaskEdit2.Visible then
  begin
    if not obJornadaTrabalho.ConsultaCampos('JORNADA_TRABALHO', ComboBox1.Text,
      ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa, 1,
      ' JORNADA_TRABALHO.* ', ' ', '') then
        if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus;
  end
  else
    if not obJornadaTrabalho.ConsultaCampos('JORNADA_TRABALHO', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa,
      ' JORNADA_TRABALHO.* ', ' ', '') then
        if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus;

  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmCadJornadaTrabalho.BitBtn3Click(Sender: TObject);
begin
  try
    if not obJornadaTrabalho.Insert then
      exit;

    inherited;

    obJornadaTrabalho.obterDiaSemana(0, ckDomingo);
		obJornadaTrabalho.obterDiaSemana(1, ckSegunda);
    obJornadaTrabalho.obterDiaSemana(2, ckTerca);
    obJornadaTrabalho.obterDiaSemana(3, ckQuarta);
    obJornadaTrabalho.obterDiaSemana(4, ckQuinta);
    obJornadaTrabalho.obterDiaSemana(5, ckSexta);
    obJornadaTrabalho.obterDiaSemana(6, ckSabado);

    ckDomingo.Checked := True;
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
      obJornadaTrabalho.Cancel;
      obJornadaTrabalho.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadJornadaTrabalho.BitBtn4Click(Sender: TObject);
begin
  obJornadaTrabalho.vJornadaTrabalhoDia.segunda := ckSegunda.Checked;
  obJornadaTrabalho.vJornadaTrabalhoDia.terca := ckTerca.Checked;
  obJornadaTrabalho.vJornadaTrabalhoDia.quarta := ckQuarta.Checked;
  obJornadaTrabalho.vJornadaTrabalhoDia.quinta := ckQuinta.Checked;
  obJornadaTrabalho.vJornadaTrabalhoDia.sexta := ckSexta.Checked;
  obJornadaTrabalho.vJornadaTrabalhoDia.sabado := ckSabado.Checked;
  obJornadaTrabalho.vJornadaTrabalhoDia.domingo := ckDomingo.Checked;

  if not obJornadaTrabalho.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(obJornadaTrabalho.vNomeCampoErro, obJornadaTrabalho.vMensagemErro);
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
      if obJornadaTrabalho.Insert then
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

procedure TfrmCadJornadaTrabalho.BitBtn5Click(Sender: TObject);
begin
  obJornadaTrabalho.Cancel;
  obJornadaTrabalho.RollBackTransacao;
  inherited;
end;

procedure TfrmCadJornadaTrabalho.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadJornadaTrabalho.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  
  if (obJornadaTrabalho <> nil) then
    obJornadaTrabalho.Cancel;

  obJornadaTrabalho.free;
  obJornadaTrabalho := nil;

  Action := caFree;
  if (frmCadJornadaTrabalho <> nil) then
    frmCadJornadaTrabalho := nil;
end;

procedure TfrmCadJornadaTrabalho.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  obJornadaTrabalho := TJornadaTrabalho.create;
  tsCadastro.TabVisible := False;
  PageControl1.ActivePage := TabSheet2;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadJornadaTrabalho.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmColaborador.dsJornadaTrabalho;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    SpeedButton2.Hint := 'Apagar Registro - [COL061]';
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadJornadaTrabalho.SpeedButton1Click(Sender: TObject);
begin
  try
    if obJornadaTrabalho.dataSet.IsEmpty then
      Exit;
    if not obJornadaTrabalho.Edit then
      Exit;
    inherited;

    obJornadaTrabalho.obterDiaSemana(0, ckDomingo);
		obJornadaTrabalho.obterDiaSemana(1, ckSegunda);
    obJornadaTrabalho.obterDiaSemana(2, ckTerca);
    obJornadaTrabalho.obterDiaSemana(3, ckQuarta);
    obJornadaTrabalho.obterDiaSemana(4, ckQuinta);
    obJornadaTrabalho.obterDiaSemana(5, ckSexta);
    obJornadaTrabalho.obterDiaSemana(6, ckSabado);

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
      obJornadaTrabalho.Cancel;
      obJornadaTrabalho.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadJornadaTrabalho.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  try
    obJornadaTrabalho.Delete;

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      obJornadaTrabalho.Cancel;
      obJornadaTrabalho.RollBackTransacao;
    end;
  end;
end;

end.
