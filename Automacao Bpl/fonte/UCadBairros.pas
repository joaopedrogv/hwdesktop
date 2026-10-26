unit UCadBairros;

interface

uses
  Windows, UClassesCadastrosBasicos, uCadPadraoModal, DBCtrls, ExtCtrls, Menus,
  ComCtrls, Buttons, Grids, DBGrids, Controls, StdCtrls, Mask, Forms, Classes,
  AppEvnts, Graphics;

type
  TFrmCadBairros = class(TfrmCadPadraoM)
    Label6: TLabel;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadBairros: TFrmCadBairros;
  Bairro: TBairros;

implementation

uses UDtmCadastrosBasicos, uDtmAtivo;

{$R *.dfm}

procedure TFrmCadBairros.BitBtn1Click(Sender: TObject);
begin
  SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS048]';

  if vDadosIni.PesqPros('BAS045', 'PESQUISAR', '', 'BAIRROS', '', Bairro.buscas, true) then
  begin
    inherited;
    if MaskEdit2.Visible then
    begin
      if not Bairro.ConsultaCampos('BAIRROS', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
        		combobox1.setfocus;
    end
    else if not Bairro.ConsultaCampos('BAIRROS', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
      		ComboBox1.SetFocus;
    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    if Bairro.StatusLixeira then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;
    Bairro.ultimasql := Bairro.dataset.CommandText;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  end;
end;

procedure TFrmCadBairros.BitBtn3Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS046', 'INSERINDO NOVO REGISTRO', '', 'BAIRROS', '', Bairro.buscas, true) then
  begin
    //    bairro.dataSet.OnReconcileError := bairro.renconciliaErro;
    if Bairro.Insert then
    begin
      inherited;
      TabSheet3.Caption := 'Cadastrar Bairro';
      TabSheet3.TabVisible := true;
      TabSheet3.Show;
      if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      	DBEdit2.SetFocus;
    end;
  end;
end;

procedure TFrmCadBairros.BitBtn4Click(Sender: TObject);
begin
  if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
    BitBtn4.SetFocus;
  if not Bairro.Post then
  begin
    PageControl3.ActivePage := TabSheet3;
    setFocusCampoErro(Bairro.vNomeCampoErro, Bairro.vMensagemErro);
  end
  else
  begin
    if CheckCadSeq.Checked then
    begin
      if Bairro.Insert then
        if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      	  DBEdit2.SetFocus;
      MudaCor;
    end
    else
      inherited;
  end;
end;

procedure TFrmCadBairros.BitBtn5Click(Sender: TObject);
begin
//  if vDadosIni.PesqPros('BAS052','CANCELAR', '','BAIRROS',Bairro.dataSet.FieldByName('COD_BAIRRO').AsString, Bairro.buscas, true) then
//  begin
    ActiveControl := BitBtn5;
    PageControl1.ActivePage := TabSheet2;
    Bairro.Cancel;
    Bairro.RollBackTransacao;
    inherited;
//  end;
end;

procedure TFrmCadBairros.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  {if (key = VK_RETURN) and (vDadosIni.vTipoForm = 1) then
  begin
    vDadosIni.vPesquisa := Bairro.dataSet.FieldByName('COD_BAIRRO').AsString;
    FrmCadBairros.Close;
  end
  else}
  if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender);
end;

procedure TFrmCadBairros.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Bairro.Cancel;
  Bairro.RollBackTransacao;
  Bairro.free;
  Action := caFree;
  FrmCadBairros := nil;
end;

procedure TFrmCadBairros.FormCreate(Sender: TObject);
begin
  inherited;
  TelaCadastro := vDadosIni.vTipoForm;
  DBGrid1.DataSource := DtmCadBasicos.dsBairros;
  Bairro := TBairros.Create;
//  Bairro.abreBairros;
  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TFrmCadBairros.FormKeyDown(Sender: TObject; var Key: Word;
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
    if PageControl3.ActivePage = TabSheet3 then
      BitBtn5Click(Sender);
  end
end;

procedure TFrmCadBairros.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;
  if TelaCadastro = 1 then
    BitBtn3Click(Sender);
end;

procedure TFrmCadBairros.SpeedButton1Click(Sender: TObject);
begin
  if not Bairro.dataSet.IsEmpty then
    if vDadosIni.PesqPros('BAS047', 'EDITANDO REGISTRO', '', 'BAIRROS', Bairro.dataSet.FieldByName('COD_BAIRRO').AsString, Bairro.buscas, true) then
    begin
      if Bairro.dataSet.FieldByName('ATIVO').AsInteger = 1 then
        if Bairro.Edit then
        begin
          inherited;
          PageControl1.ActivePage := TabSheet1;
          TabSheet1.Show;
          TabSheet3.Caption := 'Alterar Bairro';
          TabSheet3.TabVisible := true;
          PageControl3.ActivePage := TabSheet3;
          if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
          	DBEdit2.SetFocus;
          Bairro.PreencheCampos;
        end;
    end;
end;

procedure TFrmCadBairros.SpeedButton25Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS050', 'ABRIR A LIXEIRA', '', 'BAIRROS', '', Bairro.buscas, true) then
  begin
    inherited;
    if not Bairro.AbrirLixeira then
    begin
      SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS048]';
      SpeedButton1.Visible := true;
      SpeedButton5.Visible := false;
    end
    else
    begin
       SpeedButton2.Hint := 'Excluir registro permanentemente -  [BAS048]';
      SpeedButton1.Visible := false;
      SpeedButton5.Visible := true;
    end;
  end;
end;

procedure TFrmCadBairros.SpeedButton2Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS048', 'EXCLUIR', '', 'BAIRROS', '', Bairro.buscas, false) then
  begin
    inherited;
    Bairro.Delete;
    if Bairro.StatusLixeira then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;
  end;
end;

procedure TFrmCadBairros.SpeedButton5Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS049', 'RESTAURAR', '', 'BAIRROS', '', Bairro.buscas, false) then
  begin
    inherited;
    Bairro.restaurarLixeira;
    if Bairro.StatusLixeira then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;
  end;
end;

initialization
  RegisterClass(TFrmCadBairros);
finalization
  UnRegisterClass(TFrmCadBairros);
end.

