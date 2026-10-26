unit uProdutosEC_CA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, uDadosIni;

type
  TfrmProdutosEC_CA = class(TfrmCadPadraoM)
    tsDadosComercioAberto: TTabSheet;
    pnDadosComercioAberto: TPanel;
    pnButtonComercioAberto: TPanel;
    pnOKDadosComercioAberto: TBitBtn;
    pnCancDadosComercioAberto: TBitBtn;
    RadioGroupOpcoesComercioAberto: TRadioGroup;
    MarcarTodosProdutosServicos: TMenuItem;
    DesmarcarTodosProdutosServicos: TMenuItem;
    groupAdicional: TGroupBox;
    Label109: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    ComboBox11: TComboBox;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    MaskEdit9: TMaskEdit;
    ComboBox12: TComboBox;
    RadioGroup3: TRadioGroup;
    CheckBoxComGrade: TCheckBox;
    procedure ComboBox11Exit(Sender: TObject);
    procedure CheckBoxComGradeClick(Sender: TObject);
    procedure groupAdicionalExit(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure RadioGroup3Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure DesmarcarTodosProdutosServicosClick(Sender: TObject);
    procedure MarcarTodosProdutosServicosClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton6Click(Sender: TObject);
    procedure pnOKDadosComercioAbertoClick(Sender: TObject);
    procedure pnCancDadosComercioAbertoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure configuraEntrada;
    procedure ConfiguraCampoConsulta;
    procedure gravaConfiguracoesFormRegistro;
    procedure leConfiguracoesFormRegistro;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProdutosEC_CA: TfrmProdutosEC_CA;

implementation

uses UDtmCadastrosBasicos, uDtmAtivo, UClassesCadastrosBasicos, Registry,
  DBClient, DB;

{$R *.dfm}

procedure TfrmProdutosEC_CA.BitBtn1Click(Sender: TObject);
var
  I: Integer;
begin
	try
  	Screen.Cursor := crHourGlass;
    if not vDadosIni.PesqPros(vDadosIni.IfThen(vDadosIni.vtpEC_CA = 'E', 'BAS433', 'BAS435'),
     'CONSULTA', '', 'VW_PRODUTOS_EC', '',
      ProdutosEC_CA.buscas, true) then
      Exit;

    ProdutosEC_CA.rProdutosEC_CA.vCampo := ComboBox1.Text;
    ProdutosEC_CA.rProdutosEC_CA.vCondicao := ComboBox3.Text;
    ProdutosEC_CA.rProdutosEC_CA.vValor := trim(MaskEdit3.Text);
    ProdutosEC_CA.rProdutosEC_CA.vDataIni := MaskEdit1.Text;
    ProdutosEC_CA.rProdutosEC_CA.vDataFim := MaskEdit2.Text;
    ProdutosEC_CA.rProdutosEC_CA.vPorData := MaskEdit1.Visible;
    ProdutosEC_CA.rProdutosEC_CA.vCampoAd := ComboBox11.Text;
    ProdutosEC_CA.rProdutosEC_CA.vValorAd := trim(MaskEdit7.Text);
    ProdutosEC_CA.rProdutosEC_CA.vDataIniAd := MaskEdit9.Text;
    ProdutosEC_CA.rProdutosEC_CA.vDataFimAd := MaskEdit8.Text;
    ProdutosEC_CA.rProdutosEC_CA.vCondicaoAd := ComboBox12.Text;
    ProdutosEC_CA.rProdutosEC_CA.vPorDataAd := MaskEdit9.Visible;
    ProdutosEC_CA.rProdutosEC_CA.vAdicional := CheckBox1.Checked;
    ProdutosEC_CA._defineSqlAdicional(vDadosIni.vtpEC_CA);

    inherited;
    if not ProdutosEC_CA.ConsultaCampos('VW_PRODUTOS_EC', ProdutosEC_CA.rProdutosEC_CA.vValor, ComboBox1.Text,
      combobox3.Text, 'VW_PRODUTOS_EC.TIPO', true, vDadosIni.codEmpresa,
      vDadosIni.IfThen(not CheckBoxComGrade.Checked,
        ' DISTINCT ', '') +
      ' VW_PRODUTOS_EC.TIPO, ' +
      ' VW_PRODUTOS_EC.GRUPO_PROD, ' +
      ' VW_PRODUTOS_EC.COD_PROD, ' +
      ' VW_PRODUTOS_EC.COD_EMPRESA, ' +
      ' VW_PRODUTOS_EC.ATIVO, ' +
      ' VW_PRODUTOS_EC.NUM_FAB_PROD, ' +
      ' VW_PRODUTOS_EC.DESCR_PROD_RES, ' +
      ' VW_PRODUTOS_EC.DESCR_PROD_COMPL, ' +
      ' VW_PRODUTOS_EC.SINC_ECOMMERCE, ' +
      ' VW_PRODUTOS_EC.ID_COMMERCE, ' +
      ' VW_PRODUTOS_EC.DISPONIVEL, ' +
      ' VW_PRODUTOS_EC.PROMOCIONAL, ' +
      ' VW_PRODUTOS_EC.FRETE_GRATIS, ' +
      ' VW_PRODUTOS_EC.LANCAMENTO, ' +
      ' VW_PRODUTOS_EC.DESTAQUE, ' +
      ' VW_PRODUTOS_EC.VARIACAO, ' +
      ' VW_PRODUTOS_EC.TERMOS_ACEITE, ' +
      ' VW_PRODUTOS_EC.COMPREJUNTO, ' +
      ' VW_PRODUTOS_EC.VIRTUAL, ' +
      ' VW_PRODUTOS_EC.ENV_COMERCIO_ABERTO, ' +
      ' VW_PRODUTOS_EC.ID_COMERCIO_ABERTO, ' +
      ' VW_PRODUTOS_EC.DESCRICAO_MARCA, ' +
      ' VW_PRODUTOS_EC.REFERENCE, ' +
      ' VW_PRODUTOS_EC.COM_GRADE, ' +
      vDadosIni.IfThen(CheckBoxComGrade.Checked,
        ' VW_PRODUTOS_EC.COD_GRADE, ' +
        ' VW_PRODUTOS_EC.GRADE1, ' +
        ' VW_PRODUTOS_EC.GRADE2, ' +
        ' VW_PRODUTOS_EC.EST_DISP_GRADE, ' +
        ' VW_PRODUTOS_EC.MANUAL_EST_DISP_GRADE, ',
          ' 0 COD_GRADE, ' +
          ' null GRADE1, ' +
          ' null GRADE2, ' +
          ' CAST(0 AS FLOAT) EST_DISP_GRADE, ' +
          ' CAST(0 AS FLOAT) MANUAL_EST_DISP_GRADE, ') +
      ' VW_PRODUTOS_EC.EST_DISP, ' +
      ' VW_PRODUTOS_EC.EST_MINIMO, ' +
      ' VW_PRODUTOS_EC.MANUAL_EST_DISP, ' +
      ' VW_PRODUTOS_EC.MANUAL_EST_MINIMO, ' +
      ' VW_PRODUTOS_EC.API, ' +
      ' VW_PRODUTOS_EC.API_PRECO_TABELA, ' +
      ' VW_PRODUTOS_EC.PRECO_TABELA, ' +
      ' VW_PRODUTOS_EC.DESCRICAOPROMOCAO, ' +
      ' VW_PRODUTOS_EC.VALORPROMOCAO, ' +
      ' VW_PRODUTOS_EC.DATAINICIOPROMOCAO, ' +
      ' VW_PRODUTOS_EC.DATAFIMPROMOCAO, ' +
      ' VW_PRODUTOS_EC.HORAINICIOPROMOCAO, ' +
      ' VW_PRODUTOS_EC.HORAFIMPROMOCAO, ' +
      ' VW_PRODUTOS_EC.PRECO_A_COMBINAR_EC, ' +
      ' VW_PRODUTOS_EC.PRECO_A_COMBINAR_CA ',
      '',
      ProdutosEC_CA.rProdutosEC_CA.vSqlAdicional) then
      	if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
      		ComboBox1.SetFocus;

     if ProdutosEC_CA.dataSet.Active then
        for I := 0 to DBGrid1.Columns.Count - 1 do
          if DBGrid1.Columns[i].FieldName = 'DESCR_PROD_COMPL' then
            DBGrid1.Columns[i].ButtonStyle := cbsEllipsis;

    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  finally
  	gravaConfiguracoesFormRegistro;

    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmProdutosEC_CA.CheckBox1Click(Sender: TObject);
begin
  RadioGroup3.Visible := CheckBox3.Checked;
  groupAdicional.Visible := CheckBox1.Checked;
  if ComboBox11.Items.Count = 0 then
  begin
    ComboBox11.Items := ComboBox1.Items;
    ComboBox11.ItemIndex := 0;
  end;
  if (CheckBox1.Checked) or (CheckBox3.Checked) then
    GroupBox3.Height := 203
  else
    GroupBox3.Height := 73;
  if (Self.Enabled) and (Self.Visible) and (ComboBox11.CanFocus) then
    ComboBox11.SetFocus;
end;

procedure TfrmProdutosEC_CA.CheckBox3Click(Sender: TObject);
begin
	RadioGroup3.Visible := CheckBox3.Checked;
  groupAdicional.Visible := CheckBox1.Checked;
	if (CheckBox1.Checked) or (CheckBox3.Checked) then
    GroupBox3.Height := 203
  else
    GroupBox3.Height := 73;
end;

procedure TfrmProdutosEC_CA.CheckBoxComGradeClick(Sender: TObject);
begin
  inherited;
  ProdutosEC_CA.create;
  setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol, vDadosIni.vtpEC_CA);
  inherited;
  configuraEntrada;
  configuraShow;
  ConfiguraCampoConsulta;
  configurarGridPeloConfigColunas(DBGrid1);
  ProdutosEC_CA._abreProdutosEC_CA(CheckBoxComGrade.Checked);
//  end;
	vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmProdutosEC_CA.ComboBox11Exit(Sender: TObject);
var
  i: integer;
begin
  inherited;
  ComboBox11.Text := ComboBox11.Items[ComboBox11.ItemIndex];
  if trim(ComboBox11.Text) = '' then
  begin
  	if ComboBox11.ItemIndex<0 then
      ComboBox11.ItemIndex := ComboBox11.Items.Count - 1;
  	if (Self.Enabled) and (Self.Visible) and (ComboBox11.CanFocus) then
    	ComboBox11.SetFocus;
    exit;
  end;

  if DBGrid1.DataSource <> nil then
    for I := 0 to ProdutosEC_CA.dataSet.Fields.Count - 1 do
    begin
      if ProdutosEC_CA.dataSet.Fields.Fields[i].DisplayLabel = ComboBox11.Text then
      begin
        if ProdutosEC_CA.dataSet.Fields.Fields[i] is TDateTimeField then
        begin
          MaskEdit7.Visible := false;
          MaskEdit9.Visible := true;
          MaskEdit8.Visible := true;
          if MaskEdit9.Text = '  /  /    ' then
            MaskEdit9.Text := DateToStr(Date);
          if MaskEdit8.Text = '  /  /    ' then
            MaskEdit8.Text := DateToStr(Date);
        end
        else
        begin
          MaskEdit7.Visible := true;
          MaskEdit9.Visible := false;
          MaskEdit8.Visible := false;
        end;
      end;
    end;
end;

procedure TfrmProdutosEC_CA.ConfiguraCampoConsulta;
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
  vTemp: string;
begin
  try
    Registro := TRegistry.Create;
    try
      Registro.OpenKey(Conf + Self.ClassName, True);
      if vDadosIni.vtpEC_CA = 'E' then
      begin
        vTemp := Registro.ReadString('CampoE');
        if (vTemp <> '') then
        begin
          ComboBox1.Text := vTemp;
          ComboBox1.ItemIndex := ComboBox1.Items.IndexOf(vTemp);
        end;
        vTemp := Registro.ReadString('CondicaoE');
        if vTemp <> '' then
        begin
          ComboBox3.Text := vTemp;
          ComboBox3.ItemIndex := ComboBox3.Items.IndexOf(vTemp)
        end;
        vTemp := Registro.ReadString('DataIniE');
        if vTemp <> '' then
          MaskEdit1.Text := vTemp;
        vTemp := Registro.ReadString('DataFimE');
        if vTemp <> '' then
          MaskEdit2.Text := vTemp;
        vTemp := Registro.ReadString('PalavraChaveE');
        if vTemp <> '' then
          MaskEdit3.Text := vTemp;
        try
          MaskEdit1.Visible := Registro.ReadBool('MaskEdit1E');
          MaskEdit2.Visible := Registro.ReadBool('MaskEdit2E');
          MaskEdit3.Visible := Registro.ReadBool('MaskEdit3E');
        except
          MaskEdit1.Visible := false;
          MaskEdit2.Visible := false;
          MaskEdit3.Visible := true;
          MaskEdit3.EditMask:='';
          ComboBox1.Text := 'Todos';
          ComboBox1.ItemIndex := ComboBox1.Items.IndexOf('Todos')
        end;
      end
      else if vDadosIni.vtpEC_CA = 'C' then
      begin
        vTemp := Registro.ReadString('CampoC');
        if (vTemp <> '') then
        begin
          ComboBox1.Text := vTemp;
          ComboBox1.ItemIndex := ComboBox1.Items.IndexOf(vTemp);
        end;
        vTemp := Registro.ReadString('CondicaoC');
        if vTemp <> '' then
        begin
          ComboBox3.Text := vTemp;
          ComboBox3.ItemIndex := ComboBox3.Items.IndexOf(vTemp)
        end;
        vTemp := Registro.ReadString('DataIniC');
        if vTemp <> '' then
          MaskEdit1.Text := vTemp;
        vTemp := Registro.ReadString('DataFimC');
        if vTemp <> '' then
          MaskEdit2.Text := vTemp;
        vTemp := Registro.ReadString('PalavraChaveC');
        if vTemp <> '' then
          MaskEdit3.Text := vTemp;
        try
          MaskEdit1.Visible := Registro.ReadBool('MaskEdit1C');
          MaskEdit2.Visible := Registro.ReadBool('MaskEdit2C');
          MaskEdit3.Visible := Registro.ReadBool('MaskEdit3C');
        except
          MaskEdit1.Visible := false;
          MaskEdit2.Visible := false;
          MaskEdit3.Visible := true;
          MaskEdit3.EditMask:='';
          ComboBox1.Text := 'Todos';
          ComboBox1.ItemIndex := ComboBox1.Items.IndexOf('Todos')
        end;
      end;
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

procedure TfrmProdutosEC_CA.configuraEntrada;
begin
 	SpeedButton6.Visible := vDadosIni.vtpEC_CA = 'C';

  if vDadosIni.vtpEC_CA = 'E' then
  	BitBtn1.Hint := 'Clique para pesquisar - [BAS433]'
  else
  	BitBtn1.Hint := 'Clique para pesquisar - [BAS435]';
end;

procedure TfrmProdutosEC_CA.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SEL' then
    ProdutosEC_CA._marcaDesmarcaLinha;
end;

procedure TfrmProdutosEC_CA.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
	if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    TDBGrid(sender).Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmProdutosEC_CA.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if Key = VK_SPACE then
    if not ProdutosEC_CA.dataSet.IsEmpty then
      ProdutosEC_CA._marcaDesmarcaLinha;
end;

procedure TfrmProdutosEC_CA.DesmarcarTodosProdutosServicosClick(
  Sender: TObject);
begin
	if not ProdutosEC_CA.dataSet.IsEmpty then
	  ProdutosEC_CA._desmarcarTodos;
end;

procedure TfrmProdutosEC_CA.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  gravaConfiguracoesFormRegistro;

  if (ProdutosEC_CA <> nil) then
    ProdutosEC_CA.Cancel;

  ProdutosEC_CA.free;
  ProdutosEC_CA := nil;

  Action := caFree;
  if (frmProdutosEC_CA <> nil) then
    frmProdutosEC_CA := nil;

end;

procedure TfrmProdutosEC_CA.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  tsDadosComercioAberto.TabVisible := false;
  inherited;
  ProdutosEC_CA := TProdutosEC_CA.create;
  PageControl1.ActivePage := TabSheet2;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmProdutosEC_CA.FormShow(Sender: TObject);
var
	I: Integer;
begin
//	if vShow <> 1 then
//  begin
  	DBGrid1.DataSource := DtmCadBasicos.dsProdutosEC_CA;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol, vDadosIni.vtpEC_CA);
    inherited;
    configuraEntrada;
    configuraShow;
    ConfiguraCampoConsulta;
    configurarGridPeloConfigColunas(DBGrid1);
    ProdutosEC_CA._abreProdutosEC_CA(CheckBoxComGrade.Checked);
//  end;

	leConfiguracoesFormRegistro;

	vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmProdutosEC_CA.gravaConfiguracoesFormRegistro;
begin
	if (TelaCadastro <= 0) then
  begin
    _GravaConfiguracoesBoolean(CheckBoxComGrade.Name, CheckBoxComGrade.Checked);
  end;

  if (not SalvarValoresConsultaAvancada.Checked) and (CheckBox3.Checked) then
    CheckBox3.Checked := false
  else if (TelaCadastro <= 0) and (SalvarValoresConsultaAvancada.Checked) and (CheckBox3.Checked) then
  begin
    _GravaConfiguracoesInteger(RadioGroup3.Name, RadioGroup3.ItemIndex);
  end;

  if (not SalvarValoresConsultaAdicional.Checked) and (CheckBox1.Checked) then
    CheckBox1.Checked := false
  else if (TelaCadastro <= 0) and (SalvarValoresConsultaAdicional.Checked) and (CheckBox1.Checked) then
  begin
    _GravaConfiguracoesString(ComboBox11.Name, ComboBox11.Text);
    _GravaConfiguracoesString(ComboBox12.Name, ComboBox12.Text);

    _GravaConfiguracoesString(MaskEdit9.Name, MaskEdit9.Text);
    _GravaConfiguracoesString(MaskEdit8.Name, MaskEdit8.Text);
    _GravaConfiguracoesString(MaskEdit7.Name, MaskEdit7.Text);
  end;
end;

procedure TfrmProdutosEC_CA.groupAdicionalExit(Sender: TObject);
begin
  inherited;
	if (Self.Enabled) and (Self.Visible) and (BitBtn1.CanFocus) then
 		BitBtn1.SetFocus;
end;

procedure TfrmProdutosEC_CA.leConfiguracoesFormRegistro;
var
	I: Integer;
begin
	if (TelaCadastro <= 0) then
  begin
  	CheckBoxComGrade.Checked := _LerConfiguracoesRegistroBoolean(CheckBoxComGrade.Name);
  end;

  if (TelaCadastro <= 0) and (CheckBox3.Checked) then
  begin
  	RadioGroup3.ItemIndex := _LerConfiguracoesRegistroInteger(RadioGroup3.Name);
  end;

	if (TelaCadastro <= 0) and (CheckBox1.Checked) then
  begin
    CheckBox1Click(Self);
    if Trim(_LerConfiguracoesRegistroString(ComboBox11.Name)) <> '' then
    	ComboBox11.Text   := _LerConfiguracoesRegistroString(ComboBox11.Name);
    for I := 0 to ComboBox11.Items.Count - 1 do
    begin
      if trim(ComboBox11.Items[I]) = trim(ComboBox11.Text) then
      begin
        ComboBox11.ItemIndex := I;
        Break;
      end;
    end;

    ComboBox11Exit(Self);
    if Trim(_LerConfiguracoesRegistroString(ComboBox12.Name)) <> '' then
    	ComboBox12.Text   := _LerConfiguracoesRegistroString(ComboBox12.Name);
    if Trim(_LerConfiguracoesRegistroString(MaskEdit9.Name)) <> '' then
    	MaskEdit9.Text    := _LerConfiguracoesRegistroString(MaskEdit9.Name);
    if Trim(_LerConfiguracoesRegistroString(MaskEdit8.Name)) <> '' then
    	MaskEdit8.Text    := _LerConfiguracoesRegistroString(MaskEdit8.Name);
    if Trim(_LerConfiguracoesRegistroString(MaskEdit7.Name)) <> '' then
    	MaskEdit7.Text    := _LerConfiguracoesRegistroString(MaskEdit7.Name);
  end;
end;

procedure TfrmProdutosEC_CA.MarcarTodosProdutosServicosClick(Sender: TObject);
begin
  if not ProdutosEC_CA.dataSet.IsEmpty then
	  ProdutosEC_CA._marcarTodos;
end;

procedure TfrmProdutosEC_CA.pnCancDadosComercioAbertoClick(Sender: TObject);
begin
	TForm(pnDadosComercioAberto.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmProdutosEC_CA.pnOKDadosComercioAbertoClick(Sender: TObject);
begin
  try
  	if not ProdutosEC_CA.EnviarDadosComercioAberto(RadioGroupOpcoesComercioAberto.ItemIndex = 1, CheckBoxComGrade.Checked) then
    	exit;

	  TForm(pnDadosComercioAberto.Parent).ModalResult := IDOK;
  finally
    _GravaConfiguracoesInteger(RadioGroupOpcoesComercioAberto.Name,	RadioGroupOpcoesComercioAberto.ItemIndex);
  end;
end;

procedure TfrmProdutosEC_CA.RadioGroup3Click(Sender: TObject);
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
  i: integer;
begin
	if not vDadosIni.PesqPros(vDadosIni.IfThen(RadioGroup3.ItemIndex = 0, 'BAS432', 'BAS434'),
  	'CONSULTA', '', 'VW_PRODUTOS_EC', '', ProdutosEC_CA.buscas, False) then
   	exit;

	try
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try

      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      // Grava as informações do form
      Registro.WriteString('Campo'+vDadosIni.vtpEC_CA, ComboBox1.Text);
      Registro.WriteString('Condicao'+vDadosIni.vtpEC_CA, ComboBox3.Text);
      Registro.WriteString('DataIni'+vDadosIni.vtpEC_CA, MaskEdit1.Text);
      Registro.WriteString('DataFim'+vDadosIni.vtpEC_CA, MaskEdit2.Text);
      Registro.WriteString('PalavraChave'+vDadosIni.vtpEC_CA, MaskEdit3.Text);
      Registro.WriteBool('MaskEdit1'+vDadosIni.vtpEC_CA,MaskEdit1.Visible);
      Registro.WriteBool('MaskEdit2'+vDadosIni.vtpEC_CA,MaskEdit2.Visible);
      Registro.WriteBool('MaskEdit3'+vDadosIni.vtpEC_CA,MaskEdit3.Visible);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if RadioGroup3.ItemIndex = 0 then
    begin
      vDadosIni.vtpEC_CA := 'E';
      Caption := 'Produtos E-Commerce';
    end
    else if RadioGroup3.ItemIndex = 1 then
    begin
      vDadosIni.vtpEC_CA := 'C';
      Caption := 'Produtos Comércio Aberto';
    end;
    if not PrimeiraPesquisa then
      salvarGridNoConfigColunas(DBGrid1);
    ProdutosEC_CA.create;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol,vDadosIni.vtpEC_CA);
    configuraEntrada;
    configuraShow;
    ConfiguraCampoConsulta;
    configurarGridPeloConfigColunas(DBGrid1);
    ProdutosEC_CA._abreProdutosEC_CA(CheckBoxComGrade.Checked);
    CheckBox3.Checked := false;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmProdutosEC_CA.SpeedButton6Click(Sender: TObject);
begin
	if not vDadosIni.PesqPros('BAS430', 'ALTERAR', '', 'TIPO_SERVICO',
     '', ProdutosEC_CA.buscas, true) then
    Exit;

  if not ProdutosEC_CA.ConfigAPIComercioAbertoAtiva then
  begin
  	Application.MessageBox('Configuração da API do Comércio Aberto não definidas, favor verificar!', 'Erro', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    exit;
  end;

  RadioGroupOpcoesComercioAberto.ItemIndex := _LerConfiguracoesRegistroInteger(RadioGroupOpcoesComercioAberto.Name);
  if not vDadosIni.abreForm('Atualizar informações Comércio Aberto', pnDadosComercioAberto, [ofEscapeExit, ofAlignAllClientWinCtrl]) then
  	exit;

  ProdutosEC_CA.dataSet.Refresh;
end;

end.
