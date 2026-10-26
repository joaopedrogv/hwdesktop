unit UCadCidades;

interface

uses
  Windows, UClassesCadastrosBasicos, uCadPadraoModal, DBCtrls, ExtCtrls, Menus,
  ComCtrls, Buttons, Grids, DBGrids, Controls, StdCtrls, Mask, Forms, Classes,
  AppEvnts, Graphics;

type
  TFrmCadCidades = class(TfrmCadPadraoM)
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    procedure SpeedButton6Click(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure DBLookupComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton25Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
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
  FrmCadCidades: TFrmCadCidades;
  Cidade: TCidades;

implementation

uses UDtmCadastrosBasicos, uDtmAtivo, SysUtils, StrUtils, hw_utils, uDadosIni;

{$R *.dfm}

procedure TFrmCadCidades.BitBtn1Click(Sender: TObject);
var
  consulta: RConsulta;
begin
  if not vDadosIni.PesqPros('BAS053', 'PESQUISAR', '', 'CIDADES', '', Cidade.buscas, true) then
    Exit;

  inherited;

  consulta.dataIni  := maskedit1.text;
  consulta.dataFim  := maskedit2.text;
  consulta.valor    := maskedit3.text;
  consulta.campo    := ComboBox1.text;
  consulta.condicao := ComboBox3.text;
  consulta.sqlAdicional := Cidade.SqlAdicional(consulta);
  consulta.valor    := IfThen(consulta.sqlAdicional = '', consulta.valor);

  if MaskEdit2.Visible then
  begin
    if not Cidade.ConsultaCampos('CIDADES', ComboBox1.Text,
      'NOME_CIDADE', maskedit1.text, maskedit2.text, vDadosIni.codEmpresa, 1,
      'CIDADES.*, CIDADES_IBGE.ZFM_ALC',
      ' LEFT JOIN CIDADES_IBGE ON CIDADES_IBGE.CODIGO_MUN_IBGE = CIDADES.IBGE_COD_CIDADE',
      consulta.sqlAdicional) then
      	if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
      		combobox1.setfocus;
  end
  else if not Cidade.ConsultaCampos('CIDADES', consulta.valor, ComboBox1.Text,
    combobox3.Text,'NOME_CIDADE', True, vDadosIni.codEmpresa,
      'CIDADES.*, CIDADES_IBGE.ZFM_ALC',
      ' LEFT JOIN CIDADES_IBGE ON CIDADES_IBGE.CODIGO_MUN_IBGE = CIDADES.IBGE_COD_CIDADE',
      consulta.sqlAdicional) then
      	if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
      		ComboBox1.SetFocus;

  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  if Cidade.StatusLixeira then
    SpeedButton25.Visible := true
  else
    SpeedButton25.Visible := false;
  Cidade.ultimasql := Cidade.dataset.CommandText;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;

  SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS057]';
end;

procedure TFrmCadCidades.BitBtn3Click(Sender: TObject);
begin
  if vDadosIni.vNFConsumidor.NFCeOffline = noClient then
  begin
    ShowAtencao('NFCe modo Offline, não permite inclusão de registros. Por favor acesso o sistema remoto');
    Exit;
  end;

  if vDadosIni.PesqPros('BAS054', 'INSERINDO NOVO REGISTRO', '', 'CIDADES', '', Cidade.buscas, true) then
  begin
    if Cidade.Insert then
    begin
      inherited;
      TabSheet3.Caption := 'Cadastrar Cidade';
      TabSheet3.TabVisible := true;
      TabSheet3.Show;
      if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      	DBEdit2.SetFocus;
      Label9.Visible := false;
      Label10.Visible := false;
      DBEdit3.Visible := false;
      DBEdit4.Visible := false;
      Cidade.AbreCidadesIBGE;
    end;
  end;
end;

procedure TFrmCadCidades.BitBtn4Click(Sender: TObject);
begin
  if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
    BitBtn4.SetFocus;
  if not Cidade.Post then
  begin
    PageControl3.ActivePage := TabSheet3;
    setFocusCampoErro(Cidade.vNomeCampoErro, Cidade.vMensagemErro);
  end
  else
  begin
    if CheckCadSeq.Checked then
    begin
      if Cidade.Insert then
      	if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
        	DBEdit2.SetFocus;
      MudaCor;
    end
    else
      inherited;
  end;
end;

procedure TFrmCadCidades.BitBtn5Click(Sender: TObject);
begin
//  if vDadosIni.PesqPros('BAS061','CANCELAR', '','CIDADES',Cidade.dataSet.FieldByName('COD_CIDADE').AsString, Cidade.buscas, true) then
//  begin
    ActiveControl := BitBtn5;
    PageControl1.ActivePage := TabSheet2;
    Cidade.Cancel;
    Cidade.RollBackTransacao;
    inherited;
//  end;
end;

procedure TFrmCadCidades.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmCadCidades.DBLookupComboBox1Exit(Sender: TObject);
begin
  inherited;
  if DBLookupComboBox1.Text <> '' then
  begin
    Label9.Visible := true;
    Label10.Visible := true;
    DBEdit3.Visible := true;
    DBEdit4.Visible := true;
  end
  else
  begin
    Label9.Visible := false;
    Label10.Visible := false;
    DBEdit3.Visible := false;
    DBEdit4.Visible := false;
  end;
end;

procedure TFrmCadCidades.DBLookupComboBox1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('CLI012', 'PESQUISAR', '', 'CIDADES', '', Cidade.buscas, true) then
//    if vDadosIni.PesqPros('CLI010', '', Cidade.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CIDADES_IBGE');
        if vDadosIni.vPesquisa <> '' then
          Cidade.dataSet.FieldByName('IBGE_COD_CIDADE').asinteger := strtoint(vDadosIni.vPesquisa);
        if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
        	DBLookupComboBox1.SetFocus;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TFrmCadCidades.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  {  if Cidade.dataSet.State = dsEdit then
    begin
      Cidade.Post;
      if Cidade.confirmaAlteracao then
      begin
        if Cidade.Apply then
          Cidade.CommitaTransacao;
      end
      else if Cidade.emTransacao then
      begin
        Cidade.Cancel;
        Cidade.RollBackTransacao;
      end;
    end
    else
    begin
      Cidade.Cancel;
      Cidade.RollBackTransacao;
    end;
    Cidade.abreCidades;
    if vDadosIni.vTipoForm <> 1 then
      Cidade.Destroy;
    Action := caFree;
      FrmCadCidades := nil;}

//  if Cidade.confirmaAlteracao then
//  begin
//    Cidade.Cancel;
//    Cidade.RollBackTransacao;
//  end
//  else
//  begin
//    if not Cidade.Post then
//    begin
//      Cidade.Cancel;
//      Cidade.RollBackTransacao;
//    end
//  end;
  Cidade.Cancel;
  Cidade.RollBackTransacao;
  Cidade.free;
  Action := caFree;
  FrmCadCidades := nil;
end;

procedure TFrmCadCidades.FormCreate(Sender: TObject);
begin
  inherited;
  TelaCadastro := vDadosIni.vTipoForm;
  Cidade := TCidades.Create;
  //  Cidade.abreCidades;
  DBGrid1.DataSource := DtmCadBasicos.dsCidades;
  
  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TFrmCadCidades.FormKeyDown(Sender: TObject; var Key: Word;
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
  end;
end;

procedure TFrmCadCidades.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    inherited;
    DBGrid1.DataSource := DtmCadBasicos.dsCidades;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;
  if TelaCadastro = 1 then
    BitBtn3Click(Sender);
end;

procedure TFrmCadCidades.SpeedButton1Click(Sender: TObject);
begin
  if not Cidade.dataSet.IsEmpty then
    if vDadosIni.PesqPros('BAS055', 'EDITANDO REGISTRO', '', 'CIDADES', Cidade.dataSet.FieldByName('COD_CIDADE').AsString, Cidade.buscas, true) then
    begin
      if Cidade.dataSet.FieldByName('ATIVO').AsInteger = 1 then
        if Cidade.Edit then
        begin
          inherited;
          PageControl1.ActivePage := TabSheet1;
          TabSheet1.Show;
          TabSheet3.Caption := 'Alterar Cidade';
          TabSheet3.TabVisible := true;
          PageControl3.ActivePage := TabSheet3;
          if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
          	DBEdit2.SetFocus;
          Label9.Visible := false;
          Label10.Visible := false;
          DBEdit3.Visible := false;
          DBEdit4.Visible := false;
          Cidade.AbreCidadesIBGE;
          Cidade.PreencheCampos;
        end;
    end;
end;

procedure TFrmCadCidades.SpeedButton25Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS059', 'ABRIR A LIXEIRA', '', 'CIDADES', '', Cidade.buscas, true) then
  begin
    inherited;
    if not Cidade.AbrirLixeira then
    begin
      SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS057]';
      SpeedButton1.Visible := true;
      SpeedButton5.Visible := false;
    end
    else
    begin
      SpeedButton2.Hint := 'Excluir registro permanentemente -  [BAS056]';
      SpeedButton1.Visible := false;
      SpeedButton5.Visible := true;
    end;
  end;
end;

procedure TFrmCadCidades.SpeedButton2Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS057', 'EXCLUIR', '', 'CIDADES', '', Cidade.buscas, false) then
  begin
    inherited;
    Cidade.Delete;
    if Cidade.StatusLixeira then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;
  end;
end;

procedure TFrmCadCidades.SpeedButton5Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS058', 'RESTAURAR', '', 'CIDADES', '', Cidade.buscas, false) then
  begin
    inherited;
    Cidade.restaurarLixeira;
    if Cidade.StatusLixeira then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;
  end;
end;

procedure TFrmCadCidades.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  Cidade.switchZFM;
end;

end.

