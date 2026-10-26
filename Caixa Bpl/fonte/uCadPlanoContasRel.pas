unit uCadPlanoContasRel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls, UClassesCadastrosBasicosCx, CheckLst;

type
  TfrmCadPlanoContasRel = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBComboBox1: TDBComboBox;
    tsTipoConta: TTabSheet;
    pnTipoConta: TPanel;
    Panel4: TPanel;
    GroupBox5: TGroupBox;
    DBText1: TDBText;
    CheckListBox1: TCheckListBox;
    BitBtnTipoContaOK: TBitBtn;
    BitBtnTipoContaCanc: TBitBtn;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton6Click(Sender: TObject);
    procedure BitBtnTipoContaCancClick(Sender: TObject);
    procedure BitBtnTipoContaOKClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadPlanoContasRel: TfrmCadPlanoContasRel;
  ObPContaRel : TPlanoContasRel;

implementation

uses
  uDtmAtivo, UDtmCadastrosBasicosCx, uDataSet_OOP, uDadosIni, DB;

{$R *.dfm}

procedure TfrmCadPlanoContasRel.BitBtn1Click(Sender: TObject);
begin
	try
  	Screen.Cursor := crHourGlass;
    if not vDadosIni.PesqPros('CXG149', 'CONSULTA', '', 'P_CONTAS_REL', '',
      ObPContaRel.buscas, true) then
      Exit;

    inherited;
    if MaskEdit2.Visible then
    begin
      if not ObPContaRel.ConsultaCampos('P_CONTAS_REL', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
          if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
            combobox1.setfocus;
    end
    else if not ObPContaRel.ConsultaCampos('P_CONTAS_REL', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
        if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
          ComboBox1.SetFocus;

    SpeedButton1.Visible := True;
    SpeedButton5.Visible := False;
    SpeedButton6.Visible := True;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
      DBGrid1.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadPlanoContasRel.BitBtn3Click(Sender: TObject);
begin
  inherited;
	try
    if not ObPContaRel.Insert then
      exit;

    inherited;

    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    DBComboBox1.ItemIndex := -1;
    DBEdit2.Enabled := True;
    DBComboBox1.Enabled := True;

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
      ObPContaRel.Cancel;
      ObPContaRel.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadPlanoContasRel.BitBtn4Click(Sender: TObject);
begin
  if not ObPContaRel.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(ObPContaRel.vNomeCampoErro, ObPContaRel.vMensagemErro);
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
      if ObPContaRel.Insert then
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

procedure TfrmCadPlanoContasRel.BitBtn5Click(Sender: TObject);
begin
  inherited;
	ObPContaRel.Cancel;
  ObPContaRel.RollBackTransacao;
end;

procedure TfrmCadPlanoContasRel.BitBtnTipoContaCancClick(Sender: TObject);
begin
  inherited;
	TForm(pnTipoConta.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadPlanoContasRel.BitBtnTipoContaOKClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
  	if not ObPContaRel.atualizarPContas(CheckListBox1) then
      Exit;

    TForm(pnTipoConta.Parent).ModalResult := IDOK;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadPlanoContasRel.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if (key = VK_RETURN) and (PageControl1.ActivePage = TabSheet2) then
    SpeedButton1Click(Sender)
  else if (key = VK_DELETE) and (PageControl1.ActivePage = TabSheet2) then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) and (PageControl1.ActivePage = TabSheet2) then
  	BitBtn3Click(Sender);
end;

procedure TfrmCadPlanoContasRel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

	if (ObPContaRel <> nil) then
    ObPContaRel.Cancel;

  ObPContaRel.free;
  ObPContaRel := nil;

  Action := caFree;
  if (frmCadPlanoContasRel <> nil) then
    frmCadPlanoContasRel := nil;
end;

procedure TfrmCadPlanoContasRel.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  ObPContaRel := TPlanoContasRel.create;
  tsCadastro.TabVisible := False;
  PageControl1.ActivePage := TabSheet2;
  tsTipoConta.TabVisible := False;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadPlanoContasRel.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := DtmCadBasicosCx.dsPlanoContasRel;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    SpeedButton2.Hint := 'Enviar para Lixeira - [CXG152]';
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender)
  else
  begin
    lixeiraVazia(not ObPContaRel._lixeiraCheia);
  end;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadPlanoContasRel.SpeedButton1Click(Sender: TObject);
var
	I: Integer;
begin
  try
    if ObPContaRel.dataSet.IsEmpty then
      Exit;
    if not ObPContaRel.Edit then
      Exit;
    inherited;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    if ObPContaRel.dataSet.FieldByName('NATUREZA').AsString = 'S' then
    	DBComboBox1.ItemIndex := 1
    else
    	DBComboBox1.ItemIndex := 0;
    DBEdit2.Enabled := ObPContaRel.dataSet.FieldByName('PADRAO').AsString <> 'S';
    DBComboBox1.Enabled := ObPContaRel.dataSet.FieldByName('PADRAO').AsString <> 'S';

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
      ObPContaRel.Cancel;
      ObPContaRel.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadPlanoContasRel.SpeedButton25Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('CXG156', 'ABRIR A LIXEIRA', '', 'P_CONTAS_REL',
    '', ObPContaRel.buscas, true) then
    Exit;

  inherited;

  if not ObPContaRel._abrelixeira then
  begin
    SpeedButton2.Hint := 'Enviar para Lixeira - [CXG152]';
    SpeedButton1.Visible := True;
    SpeedButton5.Visible := False;
    SpeedButton6.Visible := True;
  end
  else
  begin
    SpeedButton2.Hint := 'Excluir registro permanentemente - [CXG153]';
    SpeedButton1.Visible := False;
    SpeedButton5.Visible := True;
    SpeedButton6.Visible := False;
  end;
end;

procedure TfrmCadPlanoContasRel.SpeedButton2Click(Sender: TObject);
begin
  inherited;
	try
    ObPContaRel.Delete;
    lixeiraVazia(not ObPContaRel._lixeiraCheia);

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      ObPContaRel.Cancel;
      ObPContaRel.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadPlanoContasRel.SpeedButton5Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('CXG154', 'RESTAURAR', '', 'P_CONTAS_REL', '', ObPContaRel.buscas, false) then
    if ObPContaRel._restauraLixeira then
      lixeiraVazia(not ObPContaRel._lixeiraCheia);
end;

procedure TfrmCadPlanoContasRel.SpeedButton6Click(Sender: TObject);
begin
  try
  	Screen.Cursor := crHourGlass;
    if not vDadosIni.PesqPros('CXG157', 'ABRIR', '', 'P_CONTAS_REL', '',
      ObPContaRel.buscas, true) then
      Exit;

    ObPContaRel.abrirPContas(CheckListBox1);
    if not vDadosIni.abreForm('Tipo de Contas - Plano de Contas', pnTipoConta, [ofEscapeExit, ofAlignAllClientWinCtrl]) then
      exit;
  finally
    Screen.Cursor := crDefault;
  end;
end;

end.
