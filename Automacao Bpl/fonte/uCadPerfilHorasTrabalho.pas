unit uCadPerfilHorasTrabalho;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls;

type
  TfrmCadPerfilHorasTrabalho = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    ScrollBox4: TScrollBox;
    GroupBox4: TGroupBox;
    Panel4: TPanel;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    GroupBox5: TGroupBox;
    pnSegunda: TPanel;
    ckSegunda: TCheckBox;
    mkSegundaHoraIni: TMaskEdit;
    Label8: TLabel;
    mkSegundaHoraFim: TMaskEdit;
    pnTerca: TPanel;
    Label9: TLabel;
    ckTerca: TCheckBox;
    mkTercaHoraIni: TMaskEdit;
    mkTercaHoraFim: TMaskEdit;
    pnQuarta: TPanel;
    Label10: TLabel;
    ckQuarta: TCheckBox;
    mkQuartaHoraIni: TMaskEdit;
    mkQuartaHoraFim: TMaskEdit;
    pnQuinta: TPanel;
    Label11: TLabel;
    ckQuinta: TCheckBox;
    mkQuintaHoraIni: TMaskEdit;
    mkQuintaHoraFim: TMaskEdit;
    pnSexta: TPanel;
    Label12: TLabel;
    ckSexta: TCheckBox;
    mkSextaHoraIni: TMaskEdit;
    mkSextaHoraFim: TMaskEdit;
    pnSabado: TPanel;
    Label13: TLabel;
    ckSabado: TCheckBox;
    mkSabadoHoraIni: TMaskEdit;
    mkSabadoHoraFim: TMaskEdit;
    pnDomingo: TPanel;
    Label14: TLabel;
    ckDomingo: TCheckBox;
    mkDomingoHoraIni: TMaskEdit;
    mkDomingoHoraFim: TMaskEdit;
    spSegunda: TSpeedButton;
    spTerca: TSpeedButton;
    spQuarta: TSpeedButton;
    spQuinta: TSpeedButton;
    spSexta: TSpeedButton;
    spSabado: TSpeedButton;
    spDomingo: TSpeedButton;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure spDomingoClick(Sender: TObject);
    procedure spSabadoClick(Sender: TObject);
    procedure spSextaClick(Sender: TObject);
    procedure spQuartaClick(Sender: TObject);
    procedure spQuintaClick(Sender: TObject);
    procedure spTercaClick(Sender: TObject);
    procedure spSegundaClick(Sender: TObject);
    procedure mkSegundaHoraIniKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mkSegundaHoraIniEnter(Sender: TObject);
    procedure ckDomingoClick(Sender: TObject);
    procedure ckSabadoClick(Sender: TObject);
    procedure ckSextaClick(Sender: TObject);
    procedure ckQuintaClick(Sender: TObject);
    procedure ckQuartaClick(Sender: TObject);
    procedure ckTercaClick(Sender: TObject);
    procedure ckSegundaClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
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
  frmCadPerfilHorasTrabalho: TfrmCadPerfilHorasTrabalho;
  
implementation

uses
	UClassesCadastrosBasicos, UDtmCadastrosBasicos, uDtmAtivo;

{$R *.dfm}

procedure TfrmCadPerfilHorasTrabalho.BitBtn1Click(Sender: TObject);
begin
	SpeedButton2.Hint := 'Enviar para Lixeira - [BAS536]';
  
  if not vDadosIni.PesqPros('BAS533', 'CONSULTA', '', 'PERFIL_HORAS_TRABALHO', '',
    CadPerfilHorasTrabalho.buscas, true) then
    Exit;

  inherited;
  if MaskEdit2.Visible then
  begin
    if not CadPerfilHorasTrabalho.ConsultaCampos('PERFIL_HORAS_TRABALHO', ComboBox1.Text,
      ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus;
  end
  else if not CadPerfilHorasTrabalho.ConsultaCampos('PERFIL_HORAS_TRABALHO', MaskEdit3.text, ComboBox1.Text,
    combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
    	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
    		ComboBox1.SetFocus;

  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmCadPerfilHorasTrabalho.BitBtn3Click(Sender: TObject);
begin
  try
    if not CadPerfilHorasTrabalho.Insert then
      exit;

    inherited;

    CadPerfilHorasTrabalho.obterDiaSemana(0, ckDomingo, mkDomingoHoraIni, mkDomingoHoraFim, spDomingo);
		CadPerfilHorasTrabalho.obterDiaSemana(1, ckSegunda, mkSegundaHoraIni, mkSegundaHoraFim, spSegunda);
    CadPerfilHorasTrabalho.obterDiaSemana(2, ckTerca,   mkTercaHoraIni,   mkTercaHoraFim,   spTerca);
    CadPerfilHorasTrabalho.obterDiaSemana(3, ckQuarta,  mkQuartaHoraIni,  mkQuartaHoraFim,  spQuarta);
    CadPerfilHorasTrabalho.obterDiaSemana(4, ckQuinta,  mkQuintaHoraIni,  mkQuintaHoraFim,  spQuinta);
    CadPerfilHorasTrabalho.obterDiaSemana(5, ckSexta,   mkSextaHoraIni,   mkSextaHoraFim,   spSexta);
    CadPerfilHorasTrabalho.obterDiaSemana(6, ckSabado,  mkSabadoHoraIni,  mkSabadoHoraFim,  spSabado);

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
      CadPerfilHorasTrabalho.Cancel;
      CadPerfilHorasTrabalho.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadPerfilHorasTrabalho.BitBtn4Click(Sender: TObject);
begin
	CadPerfilHorasTrabalho.vPerfilHoras.segunda := ckSegunda.Checked;
  CadPerfilHorasTrabalho.vPerfilHoras.segundahoraini := mkSegundaHoraIni.Text;
  CadPerfilHorasTrabalho.vPerfilHoras.segundahorafim := mkSegundaHoraFim.Text;

  CadPerfilHorasTrabalho.vPerfilHoras.terca := ckTerca.Checked;
  CadPerfilHorasTrabalho.vPerfilHoras.tercahoraini := mkTercaHoraIni.Text;
	CadPerfilHorasTrabalho.vPerfilHoras.tercahorafim := mkTercaHoraFim.Text;

  CadPerfilHorasTrabalho.vPerfilHoras.quarta := ckQuarta.Checked;
  CadPerfilHorasTrabalho.vPerfilHoras.quartahoraini := mkQuartaHoraIni.Text;
	CadPerfilHorasTrabalho.vPerfilHoras.quartahorafim := mkQuartaHoraFim.Text;

  CadPerfilHorasTrabalho.vPerfilHoras.quinta := ckQuinta.Checked;
  CadPerfilHorasTrabalho.vPerfilHoras.quintahoraini := mkQuintaHoraIni.Text;
  CadPerfilHorasTrabalho.vPerfilHoras.quintahorafim := mkQuintaHoraFim.Text;

  CadPerfilHorasTrabalho.vPerfilHoras.sexta := ckSexta.Checked;
  CadPerfilHorasTrabalho.vPerfilHoras.sextahoraini := mkSextaHoraIni.Text;
	CadPerfilHorasTrabalho.vPerfilHoras.sextahorafim := mkSextaHoraFim.Text;

  CadPerfilHorasTrabalho.vPerfilHoras.sabado := ckSabado.Checked;
  CadPerfilHorasTrabalho.vPerfilHoras.sabadohoraini := mkSabadoHoraIni.Text;
	CadPerfilHorasTrabalho.vPerfilHoras.sabadohorafim := mkSabadoHoraFim.Text;

  CadPerfilHorasTrabalho.vPerfilHoras.domingo := ckDomingo.Checked;
  CadPerfilHorasTrabalho.vPerfilHoras.domingohoraini := mkDomingoHoraIni.Text;
	CadPerfilHorasTrabalho.vPerfilHoras.domingohorafim := mkDomingoHoraFim.Text;

  if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
  	BitBtn4.SetFocus;
  
  if not CadPerfilHorasTrabalho.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(CadPerfilHorasTrabalho.vNomeCampoErro, CadPerfilHorasTrabalho.vMensagemErro);
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
      if CadPerfilHorasTrabalho.Insert then
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

procedure TfrmCadPerfilHorasTrabalho.BitBtn5Click(Sender: TObject);
begin
  inherited;
	CadPerfilHorasTrabalho.Cancel;
  CadPerfilHorasTrabalho.RollBackTransacao;

end;

procedure TfrmCadPerfilHorasTrabalho.ckDomingoClick(Sender: TObject);
begin
  inherited;
	mkDomingoHoraIni.Enabled := ckDomingo.Checked;
  mkDomingoHoraFim.Enabled := ckDomingo.Checked;
  spDomingo.Enabled        := ckDomingo.Checked;

  if ckDomingo.Checked then
  begin
  	pnDomingo.ParentBackground := False;
		pnDomingo.Color := clYellow;
  end
  else
  begin
  	pnDomingo.ParentBackground := True;
  	pnDomingo.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (mkDomingoHoraIni.CanFocus) then
  	mkDomingoHoraIni.SetFocus;
end;

procedure TfrmCadPerfilHorasTrabalho.ckQuartaClick(Sender: TObject);
begin
  inherited;
  mkQuartaHoraIni.Enabled := ckQuarta.Checked;
  mkQuartaHoraFim.Enabled := ckQuarta.Checked;
  spQuarta.Enabled        := ckQuarta.Checked;

  if ckQuarta.Checked then
  begin
  	pnQuarta.ParentBackground := False;
		pnQuarta.Color := clYellow;
  end
  else
  begin
  	pnQuarta.ParentBackground := True;
  	pnQuarta.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (mkQuartaHoraIni.CanFocus) then
  	mkQuartaHoraIni.SetFocus;
end;

procedure TfrmCadPerfilHorasTrabalho.ckQuintaClick(Sender: TObject);
begin
  inherited;
	mkQuintaHoraIni.Enabled := ckQuinta.Checked;
  mkQuintaHoraFim.Enabled := ckQuinta.Checked;
  spQuinta.Enabled        := ckQuinta.Checked;

  if ckQuinta.Checked then
  begin
  	pnQuinta.ParentBackground := False;
		pnQuinta.Color := clYellow;
  end
  else
  begin
  	pnQuinta.ParentBackground := True;
  	pnQuinta.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (mkQuintaHoraIni.CanFocus) then
  	mkQuintaHoraIni.SetFocus;
end;

procedure TfrmCadPerfilHorasTrabalho.ckSabadoClick(Sender: TObject);
begin
  inherited;
	mkSabadoHoraIni.Enabled := ckSabado.Checked;
  mkSabadoHoraFim.Enabled := ckSabado.Checked;
  spSabado.Enabled        := ckSabado.Checked;

  if ckSabado.Checked then
  begin
  	pnSabado.ParentBackground := False;
		pnSabado.Color := clYellow;
  end
  else
  begin
  	pnSabado.ParentBackground := True;
  	pnSabado.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (mkSabadoHoraIni.CanFocus) then
  	mkSabadoHoraIni.SetFocus;
end;

procedure TfrmCadPerfilHorasTrabalho.ckSegundaClick(Sender: TObject);
begin
  inherited;
	mkSegundaHoraIni.Enabled := ckSegunda.Checked;
  mkSegundaHoraFim.Enabled := ckSegunda.Checked;
  spSegunda.Enabled        := ckSegunda.Checked;
  
  if ckSegunda.Checked then
  begin
  	pnSegunda.ParentBackground := False;
		pnSegunda.Color := clYellow;
  end
  else
  begin
  	pnSegunda.ParentBackground := True;
  	pnSegunda.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (mkSegundaHoraIni.CanFocus) then
  	mkSegundaHoraIni.SetFocus;
end;

procedure TfrmCadPerfilHorasTrabalho.ckSextaClick(Sender: TObject);
begin
  inherited;
	mkSextaHoraIni.Enabled := ckSexta.Checked;
  mkSextaHoraFim.Enabled := ckSexta.Checked;
  spSexta.Enabled        := ckSexta.Checked;

  if ckSexta.Checked then
  begin
  	pnSexta.ParentBackground := False;
		pnSexta.Color := clYellow;
  end
  else
  begin
  	pnSexta.ParentBackground := True;
  	pnSexta.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (mkSextaHoraIni.CanFocus) then
  	mkSextaHoraIni.SetFocus;
end;

procedure TfrmCadPerfilHorasTrabalho.ckTercaClick(Sender: TObject);
begin
  inherited;
  mkTercaHoraIni.Enabled := ckTerca.Checked;
  mkTercaHoraFim.Enabled := ckTerca.Checked;
  spTerca.Enabled        := ckTerca.Checked;

  if ckTerca.Checked then
  begin
  	pnTerca.ParentBackground := False;
		pnTerca.Color := clYellow;
  end
  else
  begin
  	pnTerca.ParentBackground := True;
  	pnTerca.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (mkTercaHoraIni.CanFocus) then
  	mkTercaHoraIni.SetFocus;
end;

procedure TfrmCadPerfilHorasTrabalho.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
	if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender);
end;

procedure TfrmCadPerfilHorasTrabalho.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

	if (CadPerfilHorasTrabalho <> nil) then
    CadPerfilHorasTrabalho.Cancel;

  CadPerfilHorasTrabalho.free;
  CadPerfilHorasTrabalho := nil;

  Action := caFree;
  if (frmCadPerfilHorasTrabalho <> nil) then
    frmCadPerfilHorasTrabalho := nil;
end;

procedure TfrmCadPerfilHorasTrabalho.FormCreate(Sender: TObject);
begin
  inherited;
	TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  CadPerfilHorasTrabalho := TCadPerfilHorasTrabalho.create;
  tsCadastro.TabVisible := False;
  PageControl1.ActivePage := TabSheet2;
  
  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadPerfilHorasTrabalho.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := DtmCadBasicos.dsPerfilHorasTrabalho;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    SpeedButton2.Hint := 'Enviar para Lixeira - [BAS536]';
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender)
  else
  begin
    lixeiraVazia(not CadPerfilHorasTrabalho.statusLixeira);
  end;

  imgInformation.Hint := imgInformation.Hint + #13 + #13 +
    'Processo "CGF058" ACESSAR SISTEMA FORA DO HORARIO DE TRABALHO' + #13 +
    'Processo "CGF059" CONTINUAR USANDO SISTEMA FORA DO HORARIO TRABALHO';

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadPerfilHorasTrabalho.mkSegundaHoraIniEnter(Sender: TObject);
begin
  inherited;
//	mostrarHintEmBalao(
//  	TMaskEdit(Sender).Handle,
//    PChar('Pressione "ESC" para limpar o conteúdo'),
//    'Atenção',
//    TTI_INFO);
end;

procedure TfrmCadPerfilHorasTrabalho.mkSegundaHoraIniKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;                                                                     
	if Key = VK_ESCAPE then
  begin
    TMaskEdit(Sender).Text := '00:00';
    TMaskEdit(Sender).Clear;
  end;
  inherited;
end;

procedure TfrmCadPerfilHorasTrabalho.spDomingoClick(Sender: TObject);
begin
  inherited;
	mkDomingoHoraIni.Clear;
  mkDomingoHoraFim.Clear;
end;

procedure TfrmCadPerfilHorasTrabalho.spSegundaClick(Sender: TObject);
begin
  inherited;
	mkSegundaHoraIni.Clear;
  mkSegundaHoraFim.Clear;
end;

procedure TfrmCadPerfilHorasTrabalho.spSextaClick(Sender: TObject);
begin
  inherited;
	mkSextaHoraIni.Clear;
  mkSextaHoraFim.Clear;
end;

procedure TfrmCadPerfilHorasTrabalho.spQuartaClick(Sender: TObject);
begin
  inherited;
	mkQuartaHoraIni.Clear;
  mkQuartaHoraFim.Clear;
end;

procedure TfrmCadPerfilHorasTrabalho.spQuintaClick(Sender: TObject);
begin
  inherited;
	mkQuintaHoraIni.Clear;
  mkQuintaHoraFim.Clear;
end;

procedure TfrmCadPerfilHorasTrabalho.spSabadoClick(Sender: TObject);
begin
  inherited;
	mkSabadoHoraIni.Clear;
  mkSabadoHoraFim.Clear;
end;

procedure TfrmCadPerfilHorasTrabalho.SpeedButton1Click(Sender: TObject);
begin
  try
    if CadPerfilHorasTrabalho.dataSet.IsEmpty then
      Exit;
    if not CadPerfilHorasTrabalho.Edit then
      Exit;
    inherited;

    CadPerfilHorasTrabalho.obterDiaSemana(0, ckDomingo, mkDomingoHoraIni, mkDomingoHoraFim, spDomingo);
		CadPerfilHorasTrabalho.obterDiaSemana(1, ckSegunda, mkSegundaHoraIni, mkSegundaHoraFim, spSegunda);
    CadPerfilHorasTrabalho.obterDiaSemana(2, ckTerca,   mkTercaHoraIni,   mkTercaHoraFim,   spTerca);
    CadPerfilHorasTrabalho.obterDiaSemana(3, ckQuarta,  mkQuartaHoraIni,  mkQuartaHoraFim,  spQuarta);
    CadPerfilHorasTrabalho.obterDiaSemana(4, ckQuinta,  mkQuintaHoraIni,  mkQuintaHoraFim,  spQuinta);
    CadPerfilHorasTrabalho.obterDiaSemana(5, ckSexta,   mkSextaHoraIni,   mkSextaHoraFim,   spSexta);
    CadPerfilHorasTrabalho.obterDiaSemana(6, ckSabado,  mkSabadoHoraIni,  mkSabadoHoraFim,  spSabado);

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
      CadPerfilHorasTrabalho.Cancel;
      CadPerfilHorasTrabalho.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadPerfilHorasTrabalho.SpeedButton25Click(Sender: TObject);
begin
  inherited;
	if vDadosIni.PesqPros('BAS540', 'ABRIR', '', 'PERFIL_HORAS_TRABALHO', '', CadPerfilHorasTrabalho.buscas, true) then
  begin
    if not CadPerfilHorasTrabalho.AbrirLixeira then
    begin
      SpeedButton2.Hint := 'Enviar para Lixeira - [BAS536]';
      SpeedButton1.Visible := true;
      SpeedButton5.Visible := false;
    end
    else
    begin
      SpeedButton2.Hint := 'Excluir registro permanentemente - [BAS537]';
      SpeedButton1.Visible := false;
      SpeedButton5.Visible := true;
    end;
  end;
end;

procedure TfrmCadPerfilHorasTrabalho.SpeedButton2Click(Sender: TObject);
var
	vStatusLixeira: boolean;
begin
  inherited;
	try
    CadPerfilHorasTrabalho.Delete;
    vStatusLixeira := CadPerfilHorasTrabalho.statusLixeira;
    lixeiraVazia(not vStatusLixeira);

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      CadPerfilHorasTrabalho.Cancel;
      CadPerfilHorasTrabalho.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadPerfilHorasTrabalho.SpeedButton5Click(Sender: TObject);
begin
  if CadPerfilHorasTrabalho.restaurarLixeira then
  	lixeiraVazia(not CadPerfilHorasTrabalho.StatusLixeira);
end;

procedure TfrmCadPerfilHorasTrabalho.spTercaClick(Sender: TObject);
begin
  inherited;
	mkTercaHoraIni.Clear;
  mkTercaHoraFim.Clear;
end;

end.
