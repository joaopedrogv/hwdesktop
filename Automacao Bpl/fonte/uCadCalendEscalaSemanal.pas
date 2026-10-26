unit uCadCalendEscalaSemanal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, UclassesColaborador, DBCtrls;

type
  TfrmCadCalendEscalaSemanal = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    GroupBox4: TGroupBox;
    Panel4: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    GroupBox5: TGroupBox;
    pnSegunda: TPanel;
    Label8: TLabel;
    spSegunda: TSpeedButton;
    ckSegunda: TCheckBox;
    mkSegundaHoraIni: TMaskEdit;
    mkSegundaHoraFim: TMaskEdit;
    pnTerca: TPanel;
    Label9: TLabel;
    spTerca: TSpeedButton;
    ckTerca: TCheckBox;
    mkTercaHoraIni: TMaskEdit;
    mkTercaHoraFim: TMaskEdit;
    pnQuarta: TPanel;
    Label10: TLabel;
    spQuarta: TSpeedButton;
    ckQuarta: TCheckBox;
    mkQuartaHoraIni: TMaskEdit;
    mkQuartaHoraFim: TMaskEdit;
    pnQuinta: TPanel;
    Label11: TLabel;
    spQuinta: TSpeedButton;
    ckQuinta: TCheckBox;
    mkQuintaHoraIni: TMaskEdit;
    mkQuintaHoraFim: TMaskEdit;
    pnSexta: TPanel;
    Label12: TLabel;
    spSexta: TSpeedButton;
    ckSexta: TCheckBox;
    mkSextaHoraIni: TMaskEdit;
    mkSextaHoraFim: TMaskEdit;
    pnSabado: TPanel;
    Label13: TLabel;
    spSabado: TSpeedButton;
    ckSabado: TCheckBox;
    mkSabadoHoraIni: TMaskEdit;
    mkSabadoHoraFim: TMaskEdit;
    pnDomingo: TPanel;
    Label14: TLabel;
    spDomingo: TSpeedButton;
    ckDomingo: TCheckBox;
    mkDomingoHoraIni: TMaskEdit;
    mkDomingoHoraFim: TMaskEdit;
    procedure spDomingoClick(Sender: TObject);
    procedure spSabadoClick(Sender: TObject);
    procedure spSextaClick(Sender: TObject);
    procedure spQuintaClick(Sender: TObject);
    procedure spQuartaClick(Sender: TObject);
    procedure spTercaClick(Sender: TObject);
    procedure spSegundaClick(Sender: TObject);
    procedure ckDomingoClick(Sender: TObject);
    procedure ckSabadoClick(Sender: TObject);
    procedure ckSextaClick(Sender: TObject);
    procedure ckQuintaClick(Sender: TObject);
    procedure ckQuartaClick(Sender: TObject);
    procedure ckTercaClick(Sender: TObject);
    procedure ckSegundaClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCalendEscalaSemanal: TfrmCadCalendEscalaSemanal;
  obCalendEscalaSemanal: TCalendEscalaSemanal;

implementation

uses
  uDtmColaborador, uDtmAtivo;
  
{$R *.dfm}

procedure TfrmCadCalendEscalaSemanal.BitBtn1Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('COL052', 'CONSULTA', '', 'CALEND_ESCALA_SEMANAL', '',
    obCalendEscalaSemanal.buscas, true) then
    Exit;

  inherited;
  if MaskEdit2.Visible then
  begin
    if not obCalendEscalaSemanal.ConsultaCampos('CALEND_ESCALA_SEMANAL', ComboBox1.Text,
      ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa, 1,
      ' CALEND_ESCALA_SEMANAL.* ', ' ', '') then
        if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus;
  end
  else
    if not obCalendEscalaSemanal.ConsultaCampos('CALEND_ESCALA_SEMANAL', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa,
      ' CALEND_ESCALA_SEMANAL.* ', ' ', '') then
        if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus;

  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmCadCalendEscalaSemanal.BitBtn3Click(Sender: TObject);
begin
  try
    if not obCalendEscalaSemanal.Insert then
      exit;

    inherited;

    obCalendEscalaSemanal.obterDiaSemana(0, ckDomingo, mkDomingoHoraIni, mkDomingoHoraFim, spDomingo);
		obCalendEscalaSemanal.obterDiaSemana(1, ckSegunda, mkSegundaHoraIni, mkSegundaHoraFim, spSegunda);
    obCalendEscalaSemanal.obterDiaSemana(2, ckTerca,   mkTercaHoraIni,   mkTercaHoraFim,   spTerca);
    obCalendEscalaSemanal.obterDiaSemana(3, ckQuarta,  mkQuartaHoraIni,  mkQuartaHoraFim,  spQuarta);
    obCalendEscalaSemanal.obterDiaSemana(4, ckQuinta,  mkQuintaHoraIni,  mkQuintaHoraFim,  spQuinta);
    obCalendEscalaSemanal.obterDiaSemana(5, ckSexta,   mkSextaHoraIni,   mkSextaHoraFim,   spSexta);
    obCalendEscalaSemanal.obterDiaSemana(6, ckSabado,  mkSabadoHoraIni,  mkSabadoHoraFim,  spSabado);

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
      obCalendEscalaSemanal.Cancel;
      obCalendEscalaSemanal.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadCalendEscalaSemanal.BitBtn4Click(Sender: TObject);
begin
  obCalendEscalaSemanal.vCalendEscalaDia.segunda := ckSegunda.Checked;
  obCalendEscalaSemanal.vCalendEscalaDia.segundahoraini := mkSegundaHoraIni.Text;
  obCalendEscalaSemanal.vCalendEscalaDia.segundahorafim := mkSegundaHoraFim.Text;

  obCalendEscalaSemanal.vCalendEscalaDia.terca := ckTerca.Checked;
  obCalendEscalaSemanal.vCalendEscalaDia.tercahoraini := mkTercaHoraIni.Text;
	obCalendEscalaSemanal.vCalendEscalaDia.tercahorafim := mkTercaHoraFim.Text;

  obCalendEscalaSemanal.vCalendEscalaDia.quarta := ckQuarta.Checked;
  obCalendEscalaSemanal.vCalendEscalaDia.quartahoraini := mkQuartaHoraIni.Text;
	obCalendEscalaSemanal.vCalendEscalaDia.quartahorafim := mkQuartaHoraFim.Text;

  obCalendEscalaSemanal.vCalendEscalaDia.quinta := ckQuinta.Checked;
  obCalendEscalaSemanal.vCalendEscalaDia.quintahoraini := mkQuintaHoraIni.Text;
  obCalendEscalaSemanal.vCalendEscalaDia.quintahorafim := mkQuintaHoraFim.Text;

  obCalendEscalaSemanal.vCalendEscalaDia.sexta := ckSexta.Checked;
  obCalendEscalaSemanal.vCalendEscalaDia.sextahoraini := mkSextaHoraIni.Text;
	obCalendEscalaSemanal.vCalendEscalaDia.sextahorafim := mkSextaHoraFim.Text;

  obCalendEscalaSemanal.vCalendEscalaDia.sabado := ckSabado.Checked;
  obCalendEscalaSemanal.vCalendEscalaDia.sabadohoraini := mkSabadoHoraIni.Text;
	obCalendEscalaSemanal.vCalendEscalaDia.sabadohorafim := mkSabadoHoraFim.Text;

  obCalendEscalaSemanal.vCalendEscalaDia.domingo := ckDomingo.Checked;
  obCalendEscalaSemanal.vCalendEscalaDia.domingohoraini := mkDomingoHoraIni.Text;
	obCalendEscalaSemanal.vCalendEscalaDia.domingohorafim := mkDomingoHoraFim.Text;

  if not obCalendEscalaSemanal.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(obCalendEscalaSemanal.vNomeCampoErro, obCalendEscalaSemanal.vMensagemErro);
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
      if obCalendEscalaSemanal.Insert then
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

procedure TfrmCadCalendEscalaSemanal.BitBtn5Click(Sender: TObject);
begin
  obCalendEscalaSemanal.Cancel;
  obCalendEscalaSemanal.RollBackTransacao;
  inherited;
end;

procedure TfrmCadCalendEscalaSemanal.ckDomingoClick(Sender: TObject);
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

procedure TfrmCadCalendEscalaSemanal.ckQuartaClick(Sender: TObject);
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

procedure TfrmCadCalendEscalaSemanal.ckQuintaClick(Sender: TObject);
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

procedure TfrmCadCalendEscalaSemanal.ckSabadoClick(Sender: TObject);
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

procedure TfrmCadCalendEscalaSemanal.ckSegundaClick(Sender: TObject);
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

procedure TfrmCadCalendEscalaSemanal.ckSextaClick(Sender: TObject);
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

procedure TfrmCadCalendEscalaSemanal.ckTercaClick(Sender: TObject);
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

procedure TfrmCadCalendEscalaSemanal.DBGrid1KeyDown(Sender: TObject;
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

procedure TfrmCadCalendEscalaSemanal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  if (obCalendEscalaSemanal <> nil) then
    obCalendEscalaSemanal.Cancel;

  obCalendEscalaSemanal.free;
  obCalendEscalaSemanal := nil;

  Action := caFree;
  if (frmCadCalendEscalaSemanal <> nil) then
    frmCadCalendEscalaSemanal := nil;
end;

procedure TfrmCadCalendEscalaSemanal.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  obCalendEscalaSemanal := TCalendEscalaSemanal.create;
  tsCadastro.TabVisible := False;
  PageControl1.ActivePage := TabSheet2;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadCalendEscalaSemanal.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmColaborador.dsCalendEscalaSemanal;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    SpeedButton2.Hint := 'Apagar Registro - [COL055]';
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadCalendEscalaSemanal.spDomingoClick(Sender: TObject);
begin
  inherited;
  mkDomingoHoraIni.Clear;
  mkDomingoHoraFim.Clear;
end;

procedure TfrmCadCalendEscalaSemanal.SpeedButton1Click(Sender: TObject);
begin
  try
    if obCalendEscalaSemanal.dataSet.IsEmpty then
      Exit;
    if not obCalendEscalaSemanal.Edit then
      Exit;
    inherited;

    obCalendEscalaSemanal.obterDiaSemana(0, ckDomingo, mkDomingoHoraIni, mkDomingoHoraFim, spDomingo);
		obCalendEscalaSemanal.obterDiaSemana(1, ckSegunda, mkSegundaHoraIni, mkSegundaHoraFim, spSegunda);
    obCalendEscalaSemanal.obterDiaSemana(2, ckTerca,   mkTercaHoraIni,   mkTercaHoraFim,   spTerca);
    obCalendEscalaSemanal.obterDiaSemana(3, ckQuarta,  mkQuartaHoraIni,  mkQuartaHoraFim,  spQuarta);
    obCalendEscalaSemanal.obterDiaSemana(4, ckQuinta,  mkQuintaHoraIni,  mkQuintaHoraFim,  spQuinta);
    obCalendEscalaSemanal.obterDiaSemana(5, ckSexta,   mkSextaHoraIni,   mkSextaHoraFim,   spSexta);
    obCalendEscalaSemanal.obterDiaSemana(6, ckSabado,  mkSabadoHoraIni,  mkSabadoHoraFim,  spSabado);

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
      obCalendEscalaSemanal.Cancel;
      obCalendEscalaSemanal.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadCalendEscalaSemanal.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  try
    obCalendEscalaSemanal.Delete;

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      obCalendEscalaSemanal.Cancel;
      obCalendEscalaSemanal.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadCalendEscalaSemanal.spQuartaClick(Sender: TObject);
begin
  inherited;
  mkQuartaHoraIni.Clear;
  mkQuartaHoraFim.Clear;
end;

procedure TfrmCadCalendEscalaSemanal.spQuintaClick(Sender: TObject);
begin
  inherited;
  mkQuintaHoraIni.Clear;
  mkQuintaHoraFim.Clear;
end;

procedure TfrmCadCalendEscalaSemanal.spSabadoClick(Sender: TObject);
begin
  inherited;
  mkSabadoHoraIni.Clear;
  mkSabadoHoraFim.Clear;
end;

procedure TfrmCadCalendEscalaSemanal.spSegundaClick(Sender: TObject);
begin
  inherited;
  mkSegundaHoraIni.Clear;
  mkSegundaHoraFim.Clear;
end;

procedure TfrmCadCalendEscalaSemanal.spSextaClick(Sender: TObject);
begin
  inherited;
  mkSextaHoraIni.Clear;
  mkSextaHoraFim.Clear;
end;

procedure TfrmCadCalendEscalaSemanal.spTercaClick(Sender: TObject);
begin
  inherited;
  mkTercaHoraIni.Clear;
  mkTercaHoraFim.Clear;
end;

end.
