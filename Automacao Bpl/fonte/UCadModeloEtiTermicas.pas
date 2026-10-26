unit UCadModeloEtiTermicas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask,UDtmProdutos, UClassesProdutos, uDadosIni, uDtmAtivo,
  DBCtrls;

type
  TFrmCadModeloEtiTermica = class(TfrmCadPadraoM)
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    Label10: TLabel;
    DBMemo1: TDBMemo;
    tsItensEti: TTabSheet;
    Panel4: TPanel;
    GroupBox5: TGroupBox;
    DBGrid14: TDBGrid;
    GroupBox4: TGroupBox;
    Panel5: TPanel;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn61: TBitBtn;
    Label17: TLabel;
    DBEdit6: TDBEdit;
    DBComboBox3: TDBComboBox;
    Panel6: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    DBComboBox4: TDBComboBox;
    DBMemo2: TDBMemo;
    CheckBox2: TCheckBox;
    Panel7: TPanel;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    procedure DBComboBox4Exit(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure BitBtn61Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure DBComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadModeloEtiTermica: TFrmCadModeloEtiTermica;
  ModeloEtiT: TModeloEtiTermica;

implementation

uses
  DB;

{$R *.dfm}

procedure TFrmCadModeloEtiTermica.BitBtn10Click(Sender: TObject);
begin
  inherited;
  if not GroupBox4.Visible then
    exit;
  if not ModeloEtiT.itModEtiTer.Post then
  begin
    GroupBox4.Visible:=true;
    GroupBox5.Enabled:=false;
    BitBtn10.Enabled:=true;
    BitBtn11.Enabled:=true;
    setFocusCampoErro(ModeloEtiT.itModEtiTer.vNomeCampoErro);
  end
  else
  begin
    GroupBox4.Visible:=false;
    BitBtn10.Enabled:=false;
    BitBtn11.Enabled:=false;
    GroupBox5.Enabled:=true;
  end;
end;

procedure TFrmCadModeloEtiTermica.BitBtn11Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('PRO211', 'CANCELAR', 'CANCELAR ULTIMAS ALTERAÇÕES AINDA NÃO SALVAS', 'ITMODELOETITERMICA', '', ModeloEtiT.itModEtiTer.buscas, true) then
    Exit;
  ModeloEtiT.itModEtiTer.Cancel;
  ModeloEtiT.itModEtiTer.CancelUpdates;
  GroupBox4.Visible:=false;
  GroupBox5.Enabled:=true;
  BitBtn10.Enabled:=false;
  BitBtn11.Enabled:=false;
end;

procedure TFrmCadModeloEtiTermica.BitBtn1Click(Sender: TObject);
begin
  SpeedButton2.Hint := 'Enviar para Lixeira -  [PRO202]';
  if not vDadosIni.PesqPros('PRO199', 'PESQUISAR', '', 'MODELOETITERMICA', '', ModeloEtiT.buscas, true) then
    Exit;
  inherited;
  if MaskEdit2.Visible then
  begin
    if not ModeloEtiT.ConsultaCampos('MODELOETITERMICA', ComboBox1.Text,
      ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus;
  end
  else if not ModeloEtiT.ConsultaCampos('MODELOETITERMICA', MaskEdit3.text, ComboBox1.Text,
    combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
    	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
    		ComboBox1.SetFocus;
  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  if ModeloEtiT._StatusLixeira then
    SpeedButton25.Visible := true
  else
    SpeedButton25.Visible := false;
  ModeloEtiT.ultimasql := ModeloEtiT.dataSet.CommandText;
  if UpperCase(ComboBox1.Text)='TODOS' then
    ModeloEtiT.IndexFieldNames:='codigo';
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TFrmCadModeloEtiTermica.BitBtn3Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('PRO200', 'INCLUIR', '', 'MODELOETITERMICA', '', ModeloEtiT.buscas, true) then
    exit;
  if not ModeloEtiT.Insert then
    exit;
  ActiveControl := BitBtn3;
  inherited;
  PageControl3.ActivePage := TabSheet3;
  if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
  	DBEdit2.SetFocus;
end;

procedure TFrmCadModeloEtiTermica.BitBtn4Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('PRO206', 'CONFIRMAR', '', 'MODELOETITERMICA', '', ModeloEtiT.buscas, true) then
    exit;
  if not ModeloEtiT.Post then
    setFocusCampoErro(ModeloEtiT.vNomeCampoErro)
  else
  begin
    if CheckCadSeq.Checked then
    begin
      if ModeloEtiT.Insert then
      	if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
        	DBEdit2.SetFocus;
      MudaCor;
    end
    else
      inherited;
  end;
end;

procedure TFrmCadModeloEtiTermica.BitBtn5Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('PRO207', 'CANCELAR', '', 'MODELOETITERMICA', ModeloEtiT.dataSet.FieldByName('codigo').AsString, ModeloEtiT.buscas, true) then
  begin
    ModeloEtiT.Cancel;
    ModeloEtiT.CancelUpdates;
    ModeloEtiT.RollBackTransacao;
    ActiveControl := BitBtn5;
    inherited;
    TabSheet2.Show;
  end;
end;

procedure TFrmCadModeloEtiTermica.BitBtn61Click(Sender: TObject);
begin
  inherited;
  ModeloEtiT.itModEtiTer.Cancel;
  ModeloEtiT.itModEtiTer.CancelUpdates;
  ModeloEtiT.itModEtiTer.RollBackTransacao;
  TabSheet2.Show;
end;

procedure TFrmCadModeloEtiTermica.BitBtn7Click(Sender: TObject);
begin
  inherited;
  if ModeloEtiT.itModEtiTer.insert(ModeloEtiT.dataSet.FieldByName('CODIGO').AsInteger) then
  begin
    GroupBox4.Visible:=true;
    GroupBox5.Enabled:=false;
    BitBtn10.Enabled:=true;
    BitBtn11.Enabled:=true;
    if (Self.Enabled) and (Self.Visible) and (DBComboBox2.CanFocus) then
    	DBComboBox2.SetFocus;
  end;
end;

procedure TFrmCadModeloEtiTermica.BitBtn8Click(Sender: TObject);
begin
  inherited;
  if ModeloEtiT.itModEtiTer.Delete then
  begin
    GroupBox4.Visible:=false;
    BitBtn10.Enabled:=false;
    BitBtn11.Enabled:=false;
  end;
end;

procedure TFrmCadModeloEtiTermica.BitBtn9Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('PRO209','ALTERAR','CONFIG. '+ModeloEtiT.itModEtiTer.dataSet.FieldByName('PARAMETROS_IMP').AsString+
    ' COLUNA: '+ ModeloEtiT.itModEtiTer.dataSet.FieldByName('INDICECOLUNA').AsString+
    ' TEXTO: '+ModeloEtiT.itModEtiTer.dataSet.FieldByName('TEXTO').AsString,
    'ITMODELOETITERMICA', ModeloEtiT.itModEtiTer.dataSet.FieldByName('CODIGO').AsString+
    '-'+ ModeloEtiT.itModEtiTer.dataSet.FieldByName('NITEM').AsString,ModeloEtiT.itModEtiTer.buscas, true) then
      exit;
  if ModeloEtiT.itModEtiTer.Edit then
  begin
    if ModeloEtiT.itModEtiTer.dataSet.FieldByName('MASCARARPRECO').AsString = 'S' then
    begin
       CheckBox2.Checked:= true;
       ModeloEtiT.itModEtiTer.MascararPreco := true;
    end
    else begin
      CheckBox2.Checked:= false;
      ModeloEtiT.itModEtiTer.MascararPreco := false;
    end;

    GroupBox4.Visible:=true;
    GroupBox5.Enabled:=false;
    if (Self.Enabled) and (Self.Visible) and (DBComboBox2.CanFocus) then
    	DBComboBox2.SetFocus;
    BitBtn10.Enabled:=true;
    BitBtn11.Enabled:=true;
  end;
end;

procedure TFrmCadModeloEtiTermica.CheckBox2Click(Sender: TObject);
begin
  inherited;
  if ModeloEtiT.itModEtiTer.dataSet.FieldByName('CAMPOCURRENCY').AsString = 'N' then
  begin
    ModeloEtiT.itModEtiTer.MascararPreco := false;
    CheckBox2.Checked:=false;
  end else if CheckBox2.Checked then
    ModeloEtiT.itModEtiTer.MascararPreco := true
  else ModeloEtiT.itModEtiTer.MascararPreco := false;
end;

procedure TFrmCadModeloEtiTermica.DBComboBox1Exit(Sender: TObject);
begin
  inherited;
  if trim(ModeloEtiT.itModEtiTer.dataSet.FieldByName('TIPOTEXTOIMPRESSO').AsString)='BARCODE' then
  begin
    DBEdit9.Enabled:=false;
    DBEdit10.Enabled:=false;
    DBmemo2.Enabled:=false;
  end
  else if trim(ModeloEtiT.itModEtiTer.dataSet.FieldByName('TIPOTEXTOIMPRESSO').AsString)='IMAGEM' then
  begin
    DBEdit9.Enabled:=false;
    DBEdit10.Enabled:=false;
    DBmemo2.Enabled:=true;
  end else begin
    DBEdit9.Enabled:=true;
    DBEdit10.Enabled:=true;
    DBmemo2.Enabled:=false;
  end;
end;

procedure TFrmCadModeloEtiTermica.DBComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  key:=#0;
end;

procedure TFrmCadModeloEtiTermica.DBComboBox4Exit(Sender: TObject);
begin
  inherited;
  if ModeloEtiT.itModEtiTer.dataSet.FieldByName('CAMPOCURRENCY').AsString = 'N' then
  begin
    ModeloEtiT.itModEtiTer.MascararPreco := false;
    CheckBox2.Checked:=false;
  end;
end;

procedure TFrmCadModeloEtiTermica.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmCadModeloEtiTermica.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ModeloEtiT.free;
  ModeloEtiT := nil;

  Action := caFree;
  FrmCadModeloEtiTermica := nil;
end;

procedure TFrmCadModeloEtiTermica.FormCreate(Sender: TObject);
var
  i:integer;
begin
  inherited;
  for I := 0 to PageControl3.PageCount - 1 do
    PageControl3.Pages[i].TabVisible := false;
  for I := 0 to PageControl1.PageCount - 1 do
    PageControl1.Pages[i].TabVisible := false;
  TelaCadastro := vDadosIni.vTipoForm;
  ModeloEtiT := TModeloEtiTermica.Create;
  ModeloEtiT._abreModelosEtiTer(true);
  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TFrmCadModeloEtiTermica.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_INSERT then
  begin
    if PageControl1.ActivePage = TabSheet2 then
      BitBtn3Click(Sender);
  end
  else if key = VK_ESCAPE then
  begin
    if (ModeloEtiT.dataSet.State in [dsEdit, dsInsert]) then
    begin
      ActiveControl := BitBtn5;
      BitBtn5Click(Sender);
    end;
  end;
  inherited;
end;

procedure TFrmCadModeloEtiTermica.FormShow(Sender: TObject);
begin
  DBGrid1.DataSource := dtmProdutos.dsModEitTer;
  CheckBox3.Visible := false;
  CheckBox1.Visible := false;
  setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  PageControl1.ActivePage := TabSheet2;
  inherited;
  if TelaCadastro = 1 then
    BitBtn3Click(Sender);
end;

procedure TFrmCadModeloEtiTermica.SpeedButton1Click(Sender: TObject);
begin
  if ModeloEtiT.Edit then
  begin
    inherited;
    TabSheet3.Show;
    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
    	DBEdit2.SetFocus;
  end;
end;

procedure TFrmCadModeloEtiTermica.SpeedButton25Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('PRO204', 'ABRIR LIXEIRA', '', 'MODELOETITERMICA', '', ModeloEtiT.buscas, true) then
    exit;
  SpeedButton1.Visible := not ModeloEtiT._AbrirLixeira;
  SpeedButton5.Visible := not SpeedButton1.Visible;

  if SpeedButton1.Visible then
  SpeedButton2.Hint := 'Enviar para Lixeira -  [PRO202]'
  else
  SpeedButton2.Hint := 'Excluir registro permanentemente -  [PRO203]';
end;

procedure TFrmCadModeloEtiTermica.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  ModeloEtiT.Delete;
  SpeedButton25.visible:=ModeloEtiT._StatusLixeira;
end;

procedure TFrmCadModeloEtiTermica.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  ModeloEtiT._RestaurarRegistro;
  SpeedButton25.Visible := ModeloEtiT._StatusLixeira;
end;

procedure TFrmCadModeloEtiTermica.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  if (ModeloEtiT.IsEmpty) or (ModeloEtiT.dataSet.FieldByName('ativo').AsInteger=0) then
   exit;
  if not vDadosIni.PesqPros('PRO212', 'VISUALIZAR', '', 'MODELOETITERMICA', ModeloEtiT.dataSet.FieldByName('CODIGO').AsString, ModeloEtiT.buscas, true) then
    exit;
  if not ModeloEtiT.itModEtiTer._abreItModelosEtiTer(ModeloEtiT.dataSet.FieldByName('CODIGO').Asinteger) then
    exit;
  GroupBox5.Caption:='Campos da etiqueta modelo:'+ trim(ModeloEtiT.dataSet.FieldByName('DESCRICAO').AsString)+ ' - Impressora: '+trim(ModeloEtiT.dataSet.FieldByName('MODELOIMP').AsString);
  GroupBox4.Visible:=false;
  GroupBox5.Enabled:=true;
  BitBtn10.Enabled:=false;
  BitBtn11.Enabled:=false;
  tsItensEti.Show;
end;

end.
