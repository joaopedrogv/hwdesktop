unit UBalanco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ComCtrls, StdCtrls, Buttons, Mask, ExtCtrls, uclassesProdutos,
  Gauges, Grids, DBGrids, RDprint, Menus;

type
  TfrmBalanco = class(TfrmPadrao)
    PageControl1: TPageControl;
    TabSheet_Contagem: TTabSheet;
    TabSheet_Conf: TTabSheet;
    GroupBox_Produto: TGroupBox;
    Label1: TLabel;
    MaskEdit_produto: TMaskEdit;
    Label_Descricao: TLabel;
    Label_Locacao: TLabel;
    GroupBox_Valores: TGroupBox;
    Label3: TLabel;
    MaskEdit_Quantidade: TMaskEdit;
    MaskEdit_AlocQtd1: TMaskEdit;
    MaskEdit_AlocQtd2: TMaskEdit;
    Label_QtdAloc1: TLabel;
    Label_QtdAloc2: TLabel;
    Panel_Inferior: TPanel;
    BitBtn_Sair: TBitBtn;
    Panel1: TPanel;
    BitBtn_MudarPagina: TBitBtn;
    BitBtn_Incluir: TBitBtn;
    GroupBox1: TGroupBox;
    MaskEdit_Pasta: TMaskEdit;
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    BitBtn_Confirmar: TBitBtn;
    RadioButton_RelProdNaoCont: TRadioButton;
    RadioButton_RelProdEstDif: TRadioButton;
    RadioButton_ConfBalanco: TRadioButton;
    RadioButton_ApagarArquivoBalanco: TRadioButton;
    RadioButton_TranfArqBalanco: TRadioButton;
    RadioButton_DesligarPC: TRadioButton;
    MaskEdit_Descricao: TMaskEdit;
    MaskEdit_AlocProd1: TMaskEdit;
    GroupBox2: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label2: TLabel;
    Edit_Estoque: TEdit;
    Edit_ReqOs: TEdit;
    Edit_Contado: TEdit;
    Label6: TLabel;
    MaskEdit_AlocInfo2: TMaskEdit;
    MaskEdit_AlocInfo1: TMaskEdit;
    Label7: TLabel;
    Label14: TLabel;
    MaskEdit_AlocProd2: TMaskEdit;
    GroupBox3: TGroupBox;
    Edit_GrupoFim: TEdit;
    Label11: TLabel;
    Label8: TLabel;
    Edit_GrupoIni: TEdit;
    Gauge_HistoricoBalanco: TGauge;
    TabSheet_Grade: TTabSheet;
    Panel_Grade: TPanel;
    DBGrid_Grade: TDBGrid;
    Panel4: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Edit_ProdutoGrade: TEdit;
    Edit_QtdGradeCont: TEdit;
    Panel3: TPanel;
    BitBtn_Grade_OK: TBitBtn;
    Edit_EstGrade: TEdit;
    Label_EstGrade: TLabel;
    CheckBox_NumFab: TCheckBox;
    CheckBox_ContabMedio: TCheckBox;
    CheckBox_Contabil: TCheckBox;
    MaskEdit_Secao: TMaskEdit;
    Label10: TLabel;
    RadioButton_RelProdContado: TRadioButton;
    Edit_EstRealGrade: TEdit;
    Label9: TLabel;
    ChkSomenteconsumo: TCheckBox;
    CheckBox_EmitirSom: TCheckBox;
    ckAutoInc: TCheckBox;
    ckAutoIncGrade: TCheckBox;
    MainMenu1: TMainMenu;
    Configurar1: TMenuItem;
    Sinalsonoro1: TMenuItem;
    AutoIncremento1: TMenuItem;
    AutoIncrementonaGrade1: TMenuItem;
    Habilitar1: TMenuItem;
    Desabilitar1: TMenuItem;
    Habilitar2: TMenuItem;
    Desabilitar2: TMenuItem;
    Habilitar3: TMenuItem;
    Desabilitar3: TMenuItem;
    GroupBox6: TGroupBox;
    DBGridContados: TDBGrid;
    Bevel1: TBevel;
    Bevel2: TBevel;
    RadioGroup1: TRadioGroup;
    Label19: TLabel;
    EditLocalizarGrade: TEdit;
    Label15: TLabel;
    ckSemprePedirGrade: TCheckBox;
    Sempre1: TMenuItem;
    Habilitar4: TMenuItem;
    Desabilitar4: TMenuItem;
    Label16: TLabel;
    MaskEdit_grupo: TMaskEdit;
    Label17: TLabel;
    MaskEdit_codprod: TMaskEdit;
    TabSheet_Outros: TTabSheet;
    pnApagarBalanco: TPanel;
    PageControlApagarBalanco: TPageControl;
    TabSheet_Apagar_Balanco_Geral: TTabSheet;
    TabSheet_Apagar_Balanco_Dia: TTabSheet;
    TabSheet_Apagar_Balango_Registro: TTabSheet;
    pnApagar_Balanco_Geral: TPanel;
    BitBtnDelApagar_Balanco_Geral: TBitBtn;
    pnApagar_Balanco_Dia: TPanel;
    BitBtnDelApagar_Balanco_Dia: TBitBtn;
    pnApagar_Balanco_Registro: TPanel;
    BitBtnDelApagar_Balanco_Registro: TBitBtn;
    Label18: TLabel;
    GroupBoxApagar_Balanco_Dia: TGroupBox;
    DBGrid_Balanco_Dia: TDBGrid;
    GroupBoxApagar_Balanco_Registro: TGroupBox;
    DBGrid_Balanco_Registro: TDBGrid;
    GroupBoxLocApagar_Balanco_Registro: TGroupBox;
    Label20: TLabel;
    MaskEdit_produtolocalizar: TMaskEdit;
    BitBtnVoltarlApagar_Balanco_Dia: TBitBtn;
    BitBtnVoltarApagar_Balanco_Registro: TBitBtn;
    BitBtnVoltarApagar_Balanco_Geral: TBitBtn;
    procedure MaskEdit_produtolocalizarChange(Sender: TObject);
    procedure BitBtnVoltarApagar_Balanco_RegistroClick(Sender: TObject);
    procedure BitBtnVoltarApagar_Balanco_GeralClick(Sender: TObject);
    procedure BitBtnVoltarlApagar_Balanco_DiaClick(Sender: TObject);
    procedure BitBtnDelApagar_Balanco_RegistroClick(Sender: TObject);
    procedure BitBtnDelApagar_Balanco_DiaClick(Sender: TObject);
    procedure BitBtnCancelApagar_Balanco_RegistroClick(Sender: TObject);
    procedure BitBtnCancelApagar_Balanco_DiaClick(Sender: TObject);
    procedure BitBtnCancelApagar_Balanco_GeralClick(Sender: TObject);
    procedure BitBtnDelApagar_Balanco_GeralClick(Sender: TObject);
    procedure Edit_ProdutoGradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Desabilitar4Click(Sender: TObject);
    procedure Habilitar4Click(Sender: TObject);
    procedure EditLocalizarGradeChange(Sender: TObject);
    procedure Panel_GradeEnter(Sender: TObject);
    procedure RadioButton_RelProdNaoContClick(Sender: TObject);
    procedure DBGridContadosExit(Sender: TObject);
    procedure Desabilitar2Click(Sender: TObject);
    procedure Habilitar2Click(Sender: TObject);
    procedure Desabilitar1Click(Sender: TObject);
    procedure Habilitar1Click(Sender: TObject);
    procedure Desabilitar3Click(Sender: TObject);
    procedure Habilitar3Click(Sender: TObject);
    procedure ckAutoIncGradeExit(Sender: TObject);
    procedure ckAutoIncExit(Sender: TObject);
    procedure MaskEdit_produtoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TabSheet_ContagemEnter(Sender: TObject);
    procedure CheckBox_EmitirSomClick(Sender: TObject);
    procedure DBGrid_GradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid_GradeDblClick(Sender: TObject);
    procedure BitBtn_Grade_OKClick(Sender: TObject);
    procedure TabSheet_ConfShow(Sender: TObject);
    procedure TabSheet_ConfEnter(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RadioButton_TranfArqBalancoClick(Sender: TObject);
    procedure Edit_GrupoFimExit(Sender: TObject);
    procedure Edit_GrupoIniExit(Sender: TObject);
    procedure BitBtn_MudarPaginaClick(Sender: TObject);
    procedure BitBtn_ConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn_IncluirClick(Sender: TObject);
    procedure MaskEdit_QuantidadeExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MaskEdit_produtoExit(Sender: TObject);
    procedure MaskEdit_produtoEnter(Sender: TObject);
    procedure BitBtn_SairClick(Sender: TObject);
  private
    { Private declarations }
    procedure _MudarPaginaFoco();
    procedure _CampoVazio(Campo: TMaskEdit);
    procedure _DigitosSuperior();
    procedure _ZerarForm();
    procedure _QtdZerada();
  public
    { Public declarations }
    procedure teste;
  end;

var
  frmBalanco: TfrmBalanco;
  _objBalanco: TBalancoProduto;
  _objBalancoDia: TBalancoProdutoDia;
  _objBalancoReg: TBalancoProdutoRegistro;
  _vBotaoOKGrade: Boolean;
  _FormGrade: TForm;

implementation

{$R *.dfm}

uses
  uDtmAtivo, uDataSet_OOP, DB, uDadosIni, UDtmBalanco, MMSystem;

function __getSenhaFDB: PChar; stdcall; external 'cons40.dll';
function __getUsuarioFDB: PChar; stdcall; external 'cons40.dll';
function __descriptografaTextoFDB(pTexto: PChar): PChar; stdcall; external 'cons40.dll';  

procedure TfrmBalanco.BitBtn2Click(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := TabSheet_Contagem;
end;

procedure TfrmBalanco.BitBtnCancelApagar_Balanco_DiaClick(Sender: TObject);
begin
  TForm(pnApagarBalanco.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmBalanco.BitBtnCancelApagar_Balanco_GeralClick(Sender: TObject);
begin
  TForm(pnApagarBalanco.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmBalanco.BitBtnCancelApagar_Balanco_RegistroClick(Sender: TObject);
begin
  TForm(pnApagarBalanco.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmBalanco.BitBtnDelApagar_Balanco_DiaClick(Sender: TObject);
var
	vtemp: string;
begin
	if _objBalancoDia.dataSet.IsEmpty then
  begin
  	Application.MessageBox('Nenhum arquivo de balanço encontrado.', 'Aviso', MB_OK + MB_ICONWARNING);
  	exit;
  end;
    
	{2}if Application.MessageBox(PChar('Deseja realmente apagar os registros do arquivo do balanço do dia ' +
  	trim(_objBalancoDia.dataSet.FieldByName('DATA').AsString) + ' ?'), 'Confirmação',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IDYES then
    //messagedlg('Deseja Realmente apagar o arquivo Balanço', mtconfirmation, [mbYES, mbNO], 0) = mrYES then
  begin
  	vtemp := 'DATA: ' + trim(_objBalancoDia.dataSet.FieldByName('DATA').AsString);
    
  	if not vDadosIni.PesqPros('BAL003', 'APAGAR', vtemp, 'BALANCO_PRODUTOS', '', dtmBalanco.qrBuscas, true) then
      Exit;
      
    vDadosIni.abreStatusProcessamento('Apagar arquivo do balanço',
      'Processando informações...');

    _objBalanco.ExecutaComandosSqlExec(
      ' delete from balanco_produtos ' +
      ' where cod_empresa = ' + vDadosIni.codEmpresa +
      ' and cast(data_hora_leitura as date) = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', StrToDate(_objBalancoDia.dataSet.FieldByName('DATA').AsString))));

    _objBalanco.CommitaTransacao;
    vDadosIni.fechaStatusProcessamento;
    ShowMessage('Registros da data apagados com sucesso.');
  end; {2}

  _objBalancoDia._AbreProdutoDia;
  _objBalancoReg._AbreProdutoReg;
end;

procedure TfrmBalanco.BitBtnDelApagar_Balanco_GeralClick(Sender: TObject);
begin
	{2}if Application.MessageBox('Deseja realmente apagar todos registros do arquivo do balanço?', 'Confirmação',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IDYES then
    //messagedlg('Deseja Realmente apagar o arquivo Balanço', mtconfirmation, [mbYES, mbNO], 0) = mrYES then
  begin
  	if not vDadosIni.PesqPros('BAL003', 'APAGAR', 'GERAL', 'BALANCO_PRODUTOS', '', dtmBalanco.qrBuscas, true) then
      Exit;

    vDadosIni.abreStatusProcessamento('Apagar arquivo do balanço',
      'Processando informações...');

    _objBalanco.ExecutaComandosSqlExec(
      ' delete from balanco_produtos ' +
      ' where cod_empresa = ' + vDadosIni.codEmpresa);

    _objBalanco.CommitaTransacao;
    vDadosIni.fechaStatusProcessamento;
    ShowMessage('Arquivo apagado com sucesso.');
  end; {2}

  _objBalancoDia._AbreProdutoDia;
  _objBalancoReg._AbreProdutoReg;
end;

procedure TfrmBalanco.BitBtnDelApagar_Balanco_RegistroClick(Sender: TObject);
var
	vtemp: string;
begin
	if _objBalancoReg.dataSet.IsEmpty then
  begin
  	Application.MessageBox('Nenhum arquivo de balanço encontrado.', 'Aviso', MB_OK + MB_ICONWARNING);
  	exit;
  end;

	{2}if Application.MessageBox(PChar('Deseja realmente apagar o registro selecionado ?'), 'Confirmação',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IDYES then
  begin
  	if _objBalancoReg.dataSet.FieldByName('COD_GRADE').AsInteger > 0 then
    	vtemp :=
        'GRUPO: ' + IntToStr(_objBalancoReg.dataSet.FieldByName('GRUPO_PROD').AsInteger) +
  	  	' COD: ' + trim(_objBalancoReg.dataSet.FieldByName('COD_PROD').AsString) +
        ' GR: ' + IntToStr(_objBalancoReg.dataSet.FieldByName('COD_GRADE').AsInteger)
    else
	  	vtemp :=
        'GRUPO: ' + IntToStr(_objBalancoReg.dataSet.FieldByName('GRUPO_PROD').AsInteger) +
  	  	' COD: ' + trim(_objBalancoReg.dataSet.FieldByName('COD_PROD').AsString);
      
  	if not vDadosIni.PesqPros('BAL003', 'APAGAR', vtemp, 'BALANCO_PRODUTOS', '', dtmBalanco.qrBuscas, true) then
      Exit;

    vDadosIni.abreStatusProcessamento('Apagar arquivo do balanço',
      'Processando informações...');

    if _objBalancoReg.dataSet.FieldByName('COD_GRADE').AsInteger > 0 then
    	_objBalanco.ExecutaComandosSqlExec(
        ' delete from cod_grade_balanco ' +
        ' where grupo_prod = ' + IntToStr(_objBalancoReg.dataSet.FieldByName('GRUPO_PROD').AsInteger) +
        ' and cod_prod = ' + QuotedStr(_objBalancoReg.dataSet.FieldByName('COD_PROD').AsString) +
        ' and cod_grade = ' + IntToStr(_objBalancoReg.dataSet.FieldByName('COD_GRADE').AsInteger) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa)
    else
      _objBalanco.ExecutaComandosSqlExec(
        ' delete from balanco_produtos ' +
        ' where grupo_prod = ' + IntToStr(_objBalancoReg.dataSet.FieldByName('GRUPO_PROD').AsInteger) +
        ' and cod_prod = ' + QuotedStr(_objBalancoReg.dataSet.FieldByName('COD_PROD').AsString) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa);

    _objBalanco.CommitaTransacao;
    vDadosIni.fechaStatusProcessamento;
    ShowMessage('Registro selecionado apagado com sucesso.');
  end; {2}
  
  _objBalancoDia._AbreProdutoDia;
  _objBalancoReg._AbreProdutoReg;
end;

procedure TfrmBalanco.BitBtnVoltarApagar_Balanco_GeralClick(Sender: TObject);
begin
  TForm(pnApagarBalanco.Parent).ModalResult := IDOK;
end;

procedure TfrmBalanco.BitBtnVoltarApagar_Balanco_RegistroClick(Sender: TObject);
begin
  TForm(pnApagarBalanco.Parent).ModalResult := IDOK;
end;

procedure TfrmBalanco.BitBtnVoltarlApagar_Balanco_DiaClick(Sender: TObject);
begin
  TForm(pnApagarBalanco.Parent).ModalResult := IDOK;
end;

procedure TfrmBalanco.BitBtn_ConfirmarClick(Sender: TObject);
var
  MyClass: TComponent;
  vest: real;
  vestnct, vdifest, vestq, vestbal, vestP: real;
  vit: integer;
  ivsubg, itc: integer;
  Arq: TextFile;
  NomeArq: string;
  auxstr: string;
  vtotC, vtotV, vtotgC, vtotgV: currency;
  vtotcstnc: currency;
  vSomaQtde: Extended;
  vQtdPenGrade : real;
  vPw, vUs: string;
  I, vCountMovimento, vIncMov: Integer;
begin

{$REGION 'Validar grupo'}

  {1}if Edit_GrupoIni.Text <> '' then
  begin
    {2}try
      strtoint(Edit_GrupoIni.text);
    except
      messagedlg('Grupo inicial Invalido', mtinformation, [mbOK], 0);
      if (Self.Enabled) and (Self.Visible) and (Edit_GrupoIni.CanFocus) then
     	  Edit_GrupoIni.setfocus;
      exit;
    end; {2}
  end; {1}

  {1}if Edit_GrupoFim.Text <> '' then
  begin
    {2}try
      strtoint(Edit_GrupoFim.text);
    except
      messagedlg('Grupo Final Invalido', mtinformation, [mbOK], 0);
      if (Self.Enabled) and (Self.Visible) and (Edit_GrupoFim.CanFocus) then
      	Edit_GrupoFim.setfocus;
      exit;
    end; {2}
  end; {1}

  if (((trim(Edit_GrupoIni.Text) <> '') and (trim(Edit_GrupoFim.Text) = '')) or
    ((trim(Edit_GrupoIni.Text) = '') and (trim(Edit_GrupoFim.Text) <> '')))
    then
  begin
    messagedlg(
      'Não é valido informar somente um grupo, informe os dois grupos ou deixe os campos em branco',
      mtinformation, [mbOK], 0);
    if (Self.Enabled) and (Self.Visible) and (Edit_GrupoIni.CanFocus) then
    	Edit_GrupoIni.setfocus;
    Exit;
  end;

{$ENDREGION}

{$REGION 'Validar variaveis'}

  _objBalanco._Linha_I := 1;
  _objBalanco._Vpag_I := 0;
  vit := 0;
  itc := 0;
  _objBalanco.vsomenteconsumo := ChkSomenteconsumo.Checked;

{$ENDREGION}

{$REGION 'Relatorio produtos nao contados'}
  try

    vDadosIni.abreStatusProcessamento('Relatório de produtos não contados',
      'Processando informações...');

    if (RadioButton_RelProdNaoCont.Checked) then
    begin

      if not vDadosIni.PesqPros('BAL004', 'REL PROD NAO CONT', '', 'BALANCO_PRODUTOS', '',
        dtmBalanco.qrBuscas, True) then
        Exit;

      if RadioGroup1.Visible then
        if RadioGroup1.ItemIndex = 0 then
          _objBalanco._vOrdem := 'descr_prod'
        else
          _objBalanco._vOrdem := 'num_fab_prod';

      _objBalanco._AbreNaoContados(Edit_GrupoIni.Text, Edit_GrupoFim.Text);
      //   FrModImpG.showmodal;
      if not vDadosIni.ModImp(_objBalanco.RdZerados) then
        exit;
      _objBalanco._vTituloRelatorio := 'Produtos não contados';
      if Edit_GrupoIni.Text <> '' then
        _objBalanco._vTituloRelatorio := _objBalanco._vTituloRelatorio + '-Gr. ini.: ' +
          Edit_GrupoIni.Text + ' Gr. Fin.: ' + Edit_GrupoFim.Text;
      if ChkSomenteconsumo.Checked then
        _objBalanco._vTituloRelatorio := _objBalanco._vTituloRelatorio + '-Só Consumo';
      if CheckBox_Contabil.Checked then
        _objBalanco._vTituloRelatorio := _objBalanco._vTituloRelatorio + '-Ultimo Custo'
      else
        _objBalanco._vTituloRelatorio := _objBalanco._vTituloRelatorio + '-Custo Médio';

      _objBalanco.RdZerados.abrir;
      vtotcstnc := 0;
      vestnct := 0;
      vestP := 0;
      _objBalanco.qrZerados.First;
      while not _objBalanco.QrZerados.eof do
      begin
        vest := (_objBalanco.QrZerados.FieldByName('EST_F').AsFloat -
          (_objBalanco._PegarReqOs(_objBalanco.QrZerados.FieldByName('COD_PROD').asstring,
          _objBalanco.QrZerados.FieldByName('GRUPO_PROD').asstring)));
        if vest > 0 then
        begin
          _objBalanco.RdZerados.impD(_objBalanco._Linha_I, 14,
            _objBalanco.QrZerados.FieldByName('GRUPO_PROD').asstring + ' ' +
            _objBalanco.QrZerados.FieldByName('COD_PROD').asstring, [comp17]);
          _objBalanco.RdZerados.imp(_objBalanco._Linha_I, 16,
            copy(trim(_objBalanco.QrZerados.FieldByName('DESCR_PROD').asstring), 1, 47));
          _objBalanco.RdZerados.impD(_objBalanco._Linha_I, 72, format('%f', [vest]), [comp17]);
          _objBalanco.RdZerados.imp(_objBalanco._Linha_I, 85, 'NAO CONTADO');
          _objBalanco.RdZerados.imp(_objBalanco._Linha_I, 100,
            _objBalanco.QrZerados.FieldByName('NUM_FAB_PROD').asstring);
          _objBalanco.RdZerados.imp(_objBalanco._Linha_I, 120,
            _objBalanco.QrZerados.FieldByName('LOCACAO_PROD').asstring);
          if _objBalanco.QrZerados.FieldByName('PREC_CUSM_PROD').AsCurrency <> 0 then
            vtotcstnc := vtotcstnc + (_objBalanco.QrZerados.FieldByName('PREC_CUSM_PROD').asfloat *
              vest)
          else
            vtotcstnc := vtotcstnc + (_objBalanco.QrZerados.FieldByName('PREC_CUS_PROD').asfloat *
              vest);
          vestnct := vestnct + vest;
          vestP := vestP + vest;
          //////////////////////////////
          _objBalanco._vGradeBalanco._AbreGradeBalancoGrupo(_objBalanco.QrZerados.FieldByName('COD_PROD').asstring,
            inttostr(_objBalanco.QrZerados.FieldByName('GRUPO_PROD').asinteger));
          while not _objBalanco._vGradeBalanco.Eof do
          begin
            inc(_objBalanco._Linha_I);
            _objBalanco.rdZerados.Imp(_objBalanco._Linha_I, 16, 'Grade: ' +trim(_objBalanco.retornaValor('select descricao as valor from grade ' +
                'where cod_grade = ' + _objBalanco._vGradeBalanco.dataset.FieldByName('COD_GRADE').asstring+
                ' and cod_empresa = ' + vDadosIni.codEmpresa +' and ativo = 1')));

            vQtdPenGrade:=0;
            if (vDadosIni.vEmp.vApresentarEstR='S') or (vDadosIni.vEmp.vApresentarEstR='R') then
            begin
              _objBalanco.buscas.Close;
              _objBalanco.buscas.SQL.Text:= 'select coalesce(sum(pp.quant_ped_item),0) as valor  from  pedvenda_prod pp ' +
                ' inner join pedvenda v on v.nped=pp.nped and v.cod_empresa=pp.cod_empresa and pp.tipo=v.tipo' +
                ' where pp.grupo_prod = '+_objBalanco._vGradeBalanco.dataset.FieldByName('GRUPO_PROD').asstring+
                ' and pp.cod_prod = '+ QuotedStr(trim(_objBalanco._vGradeBalanco.dataset.FieldByName('COD_PROD').asstring))+
                ' and pp.cod_grade='+_objBalanco._vGradeBalanco.dataset.FieldByName('COD_GRADE').asstring +
                ' and pp.cod_empresa = ' +vDadosIni.codEmpresa+
                ' and ((v.status_ped <>''FECHADA'') or (v.status_ped is null))' +
                ' and (pp.status<>''CANCELADO'' or pp.status is null) and (v.tipo=''REQ'' or v.tipo=''OS'') ';
              _objBalanco.buscas.Open;
               vQtdPenGrade:=_objBalanco._vGradeBalanco.dataSet.FieldByName('QTDE').asfloat-_objBalanco._vGradeBalanco.buscas.FieldByName('valor').asfloat;
            end
            else vQtdPenGrade:=_objBalanco._vGradeBalanco.dataSet.FieldByName('QTDE').asfloat;
            _objBalanco.rdZerados.ImpD(_objBalanco._Linha_I, 62, format('%f',
              [vQtdPenGrade]), [comp17]);

            _objBalanco._vGradeBalanco.dataSet.Next;
            if _objBalanco._Linha_I = 60 then
            begin
              _objBalanco._Linha_I := _objBalanco._Linha_I + 1;
              _objBalanco.RdZerados.imp(_objBalanco._Linha_I, 2, 'Total qtde de estoque..............: '
                + Format('%n', [vestP]));
              _objBalanco._Linha_I := _objBalanco._Linha_I + 1;
              _objBalanco.RdZerados.imp(_objBalanco._Linha_I, 2, 'Total qtde de estoque acumulado.....: '
                + Format('%n', [vestnct]));
              _objBalanco._Linha_I := 1;
              _objBalanco.RdZerados.Novapagina;
              vestP := 0;
            end;
          end;

          //////////////////////////////
          _objBalanco._Linha_I := _objBalanco._Linha_I + 1;
        end;
        _objBalanco.QrZerados.next;

        if _objBalanco._Linha_I = 60 then
        begin
          _objBalanco._Linha_I := _objBalanco._Linha_I + 1;
          _objBalanco.RdZerados.imp(_objBalanco._Linha_I, 2, 'Total qtde de estoque..............: '
            + Format('%n', [vestP]));
          _objBalanco._Linha_I := _objBalanco._Linha_I + 1;
          _objBalanco.RdZerados.imp(_objBalanco._Linha_I, 2, 'Total qtde de estoque acumulado.....: '
            + Format('%n', [vestnct]));
          _objBalanco._Linha_I := 1;
          _objBalanco.RdZerados.Novapagina;
          vestP := 0;
        end;
      end;
      _objBalanco._Linha_I := _objBalanco._Linha_I + 1;
      _objBalanco.RdZerados.imp(_objBalanco._Linha_I, 2,
        'Total Custo médio dos prod. Nao contados: ' + Format('%n', [vtotcstnc]));
      _objBalanco._Linha_I := _objBalanco._Linha_I + 1;
      _objBalanco.RdZerados.imp(_objBalanco._Linha_I, 2, 'Total qtde de estoque..............: '
        + Format('%n', [vestnct]));

      _objBalanco.rdZerados.OpcoesPreview.Preview := true;

      _objBalanco.RdZerados.Fechar;
      _objBalanco.qrZerados.Close;

      exit;
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;

{$ENDREGION}

//  Relatar produtos com estoque diferente'}

  if (RadioButton_RelProdEstDif.Checked) then
  begin
    if not vDadosIni.PesqPros('BAL005', 'REL PROD EST DIF', '', 'BALANCO_PRODUTOS', '',
      dtmBalanco.qrBuscas, true) then
      Exit;
    try
      vDadosIni.abreStatusProcessamento('Relatar produtos com estoque diferente',
        'Processando informações...');
      vestq := 0;
      vestbal := 0;
      vtotcstnc := 0;
      _objBalanco.qrDiferenca.close;

      if RadioGroup1.Visible then
        if RadioGroup1.ItemIndex = 0 then
          _objBalanco._vOrdem := 'descr_prod'
        else
          _objBalanco._vOrdem := 'num_fab_prod';

      _objBalanco._AbreEstoqueDiferente(Edit_GrupoIni.Text, Edit_GrupoFim.Text);
      if not vDadosIni.ModImp(_objBalanco.rdZerados) then
        exit;
      _objBalanco._vTituloRelatorio := 'Produtos com estoque diferente';
      if Edit_GrupoIni.Text <> '' then
        _objBalanco._vTituloRelatorio := _objBalanco._vTituloRelatorio + '-Gr. ini.: ' +
          Edit_GrupoIni.Text + ' Gr. Fin.: ' + Edit_GrupoFim.Text;
      if ChkSomenteconsumo.Checked then
        _objBalanco._vTituloRelatorio := _objBalanco._vTituloRelatorio + '-Só Consumo';
      if CheckBox_Contabil.Checked then
        _objBalanco._vTituloRelatorio := _objBalanco._vTituloRelatorio + '-Ultimo Custo'
      else
        _objBalanco._vTituloRelatorio := _objBalanco._vTituloRelatorio + '-Custo Médio';

      _objBalanco.rdZerados.Abrir;

      while not _objBalanco.qrDiferenca.eof do
      begin
        vest := (_objBalanco.qrDiferenca.FieldByName('EST_F').AsFloat -
          (_objBalanco._PegarReqOs(_objBalanco.qrDiferenca.FieldByName('COD_PROD').asstring,
          _objBalanco.qrDiferenca.FieldByName('GRUPO_PROD').asstring)));

        if (vest <> _objBalanco.qrDiferenca.FieldByName('QTDE_PROD').asfloat) then
        begin
          _objBalanco.rdZerados.impD(_objBalanco._Linha_I, 14,
            _objBalanco.qrDiferenca.FieldByName('GRUPO_PROD').asstring + ' '
            + trim(_objBalanco.qrDiferenca.FieldByName('COD_PROD').asstring), [comp17]);
          _objBalanco.rdZerados.imp(_objBalanco._Linha_I, 16,
            copy(trim(_objBalanco.qrDiferenca.FieldByName('DESCR_PROD').asstring), 1,47));
          _objBalanco.rdZerados.impD(_objBalanco._Linha_I, 72, format('%f', [vest]), [comp17]);
          _objBalanco.rdZerados.impD(_objBalanco._Linha_I, 83,
            format('%f', [_objBalanco.qrDiferenca.FieldByName('QTDE_PROD').AsFloat]), [comp17]);
          if Vest > _objBalanco.qrDiferenca.FieldByName('QTDE_PROD').asfloat then
            _objBalanco.rdZerados.imp(_objBalanco._Linha_I, 85, 'EstoqueMai')
          else _objBalanco.rdZerados.imp(_objBalanco._Linha_I, 85, 'EstoqueMen');
          _objBalanco.rdZerados.imp(_objBalanco._Linha_I, 100,
            _objBalanco.qrDiferenca.FieldByName('NUM_FAB_PROD').asstring);
          _objBalanco.rdZerados.imp(_objBalanco._Linha_I, 120,
            _objBalanco.qrDiferenca.FieldByName('LOCACAO_PROD').asstring);
          _objBalanco._vGradeBalanco._AbreGradeBalancoGrupo(_objBalanco.qrDiferenca.FieldByName('COD_PROD').asstring,
            inttostr(_objBalanco.qrDiferenca.FieldByName('GRUPO_PROD').asinteger));
          if not _objBalanco._vGradeBalanco.IsEmpty then
          begin
            while not _objBalanco._vGradeBalanco.Eof do
            begin
              _objBalanco._vGradeContadosBalanco._AbreGradeContBalanco(
                _objBalanco.qrDiferenca.FieldByName('GRUPO_PROD').asstring,
                _objBalanco.qrDiferenca.FieldByName('COD_PROD').asstring,
                _objBalanco._vGradeBalanco.dataset.FieldByName('COD_GRADE').asstring);

              if (_objBalanco._vGradeBalanco.dataSet.FieldByName('QTDE').AsFloat <>
                _objBalanco._vGradeContadosBalanco.dataSet.FieldByName('QTDE').AsFloat) then
              begin
                inc(_objBalanco._Linha_I);
                if _objBalanco._vGradeContadosBalanco.dataSet.FieldByName('DESCRICAO').IsNull then
                begin
                  _objBalanco.rdZerados.Imp(_objBalanco._Linha_I, 16, 'Grade: ' +trim(_objBalanco.retornaValor('select descricao as valor from grade ' +
                    'where cod_grade = ' + _objBalanco._vGradeBalanco.dataset.FieldByName('COD_GRADE').asstring+
                    ' and cod_empresa = ' + vDadosIni.codEmpresa +' and ativo = 1')));
                end
                else  _objBalanco.rdZerados.Imp(_objBalanco._Linha_I, 16, 'Grade: ' +
                  trim(_objBalanco._vGradeContadosBalanco.dataSet.FieldByName('DESCRICAO').Text));
                vQtdPenGrade:=0;
                if (vDadosIni.vEmp.vApresentarEstR='S') or (vDadosIni.vEmp.vApresentarEstR='R') then
                begin
                  _objBalanco.buscas.Close;
                  _objBalanco.buscas.SQL.Text:= 'select coalesce(sum(pp.quant_ped_item),0) as valor  from  pedvenda_prod pp ' +
                    ' inner join pedvenda v on v.nped=pp.nped and v.cod_empresa=pp.cod_empresa and pp.tipo=v.tipo' +
                    ' where pp.grupo_prod = '+_objBalanco._vGradeBalanco.dataset.FieldByName('GRUPO_PROD').asstring+
                    ' and pp.cod_prod = '+ QuotedStr(trim(_objBalanco._vGradeBalanco.dataset.FieldByName('COD_PROD').asstring))+
                    ' and pp.cod_grade='+_objBalanco._vGradeBalanco.dataset.FieldByName('COD_GRADE').asstring +
                    ' and pp.cod_empresa = ' +vDadosIni.codEmpresa+
                    ' and ((v.status_ped <>''FECHADA'') or (v.status_ped is null))' +
                    ' and (pp.status<>''CANCELADO'' or pp.status is null) and v.tipo<>''ORC''';
                  _objBalanco.buscas.Open;
                   vQtdPenGrade:=_objBalanco._vGradeBalanco.dataSet.FieldByName('QTDE').asfloat-_objBalanco._vGradeBalanco.buscas.FieldByName('valor').asfloat;
                end
                else vQtdPenGrade:=_objBalanco._vGradeBalanco.dataSet.FieldByName('QTDE').asfloat;
                _objBalanco.rdZerados.ImpD(_objBalanco._Linha_I, 72, format('%f',
                  [vQtdPenGrade]), [comp17]);
                _objBalanco.rdZerados.ImpD(_objBalanco._Linha_I, 83, format('%f',
                  [_objBalanco._vGradeContadosBalanco.dataSet.FieldByName('QTDE').asfloat]),
                  [comp17]);
                if _objBalanco._vGradeBalanco.dataSet.FieldByName('QTDE').AsFloat >
                  _objBalanco._vGradeContadosBalanco.dataSet.FieldByName('QTDE').AsFloat then
                  _objBalanco.rdZerados.imp(_objBalanco._Linha_I, 85, 'GradeMaior')
                else
                  _objBalanco.rdZerados.imp(_objBalanco._Linha_I, 85, 'GradeMenor');
                _objBalanco.rdZerados.imp(_objBalanco._Linha_I, 120,
                  _objBalanco._vGradeContadosBalanco.dataSet.FieldByName('LOCACAO1_PROD').asstring);
              end;
              _objBalanco._vGradeBalanco.dataSet.Next;
              if _objBalanco._Linha_I = 60 then
              begin
               _objBalanco._Linha_I := 1;
               _objBalanco.rdZerados.Novapagina;
              end;
            end;
          end;
          vestq := vestq + vest;
          vestbal := vestbal + _objBalanco.qrDiferenca.FieldByName('QTDE_PROD').asfloat;
          if _objBalanco.qrDiferenca.FieldByName('PREC_CUSM_PROD').AsCurrency <> 0 then
            vtotcstnc := vtotcstnc + (
              (vest * _objBalanco.qrDiferenca.FieldByName('PREC_CUSM_PROD').AsCurrency)
              - (_objBalanco.qrDiferenca.FieldByName('QTDE_PROD').asfloat *
              _objBalanco.qrDiferenca.FieldByName('PREC_CUSM_PROD').AsCurrency))
          else
            vtotcstnc := vtotcstnc + ((vest *
              _objBalanco.qrDiferenca.FieldByName('PREC_CUS_PROD').AsCurrency) -
              (_objBalanco.qrDiferenca.FieldByName('QTDE_PROD').asfloat *
              _objBalanco.qrDiferenca.FieldByName('PREC_CUS_PROD').AsCurrency));
          vit := vit + 1;
          _objBalanco._Linha_I := _objBalanco._Linha_I + 1;
        end;
        _objBalanco.qrDiferenca.next;
        if _objBalanco._Linha_I = 60 then
        begin
          _objBalanco._Linha_I := 1;
          _objBalanco.rdZerados.Novapagina;
        end;
      end;
      _objBalanco.rdZerados.impF(_objBalanco._Linha_I, 1, vDadosIni.Replicate('-', 130), [comp17]);
      _objBalanco._Linha_I := _objBalanco._Linha_I + 1;
      _objBalanco.rdZerados.imp(_objBalanco._Linha_I, 1, 'ESTOQUE GERAL PROD. ARQ ' + format('%n',
        [vestq]));
      _objBalanco._Linha_I := _objBalanco._Linha_I + 1;
      _objBalanco.rdZerados.imp(_objBalanco._Linha_I, 1, 'ESTOQUE GERAL PROD. BAL ' + format('%n',
        [vestbal]));
      _objBalanco._Linha_I := _objBalanco._Linha_I + 1;
      _objBalanco.rdZerados.imp(_objBalanco._Linha_I, 1, 'DIF. ESTOQ. GERAL.....: ' + format('%n',
        [vestq - vestbal]));
      _objBalanco._Linha_I := _objBalanco._Linha_I + 1;
      if vestq > 0 then
        _objBalanco.rdZerados.imp(_objBalanco._Linha_I, 1, 'PERCENTUAL DIFERENCA..: ' + format('%n',
          [(100 - ((vestbal * 100) / vestq))]));
      _objBalanco._Linha_I := _objBalanco._Linha_I + 1;
      _objBalanco.rdZerados.imp(_objBalanco._Linha_I, 1, 'QTDE ITENS............: ' + format('%d',
        [vit]));
      _objBalanco._Linha_I := _objBalanco._Linha_I + 1;
      _objBalanco.rdZerados.imp(_objBalanco._Linha_I, 1,
        'Total Diferença em Custo médio dos produtos contados: ' + Format('%n', [vtotcstnc]));
      _objBalanco._Linha_I := _objBalanco._Linha_I + 1;

      _objBalanco.rdZerados.OpcoesPreview.Preview := true;

    finally
      vDadosIni.fechaStatusProcessamento;
      _objBalanco.rdZerados.Fechar;
      _objBalanco.qrDiferenca.close;
    end;
    exit;
  end;


{$REGION 'Confirmar balanço'}

  inherited;
  if (RadioButton_ConfBalanco.Checked) then
  begin
    if not vDadosIni.PesqPros('BAL002', 'CONFIRMAR', '', 'BALANCO_PRODUTOS', '',
      dtmBalanco.qrBuscas, True) then
      Exit;
    if Application.MessageBox('Deseja Realmente confirmar o Balanço?', 'Confirmação', MB_YESNO +
      MB_ICONQUESTION + MB_DEFBUTTON1) = IDNO then
      exit;
    try
      try
        PageControl1.Enabled:=false;
        BitBtn_Confirmar.Enabled:=false;
        bitbtn2.Enabled:=false;
        BitBtn_Sair.Enabled:=false;
        Gauge_HistoricoBalanco.Visible := true;
        vDadosIni.abreStatusProcessamento('Finalizando balanço', 'Processando informações...');
        //Carregar produto
        if (Edit_GrupoIni.Text <> '') then
        begin
          _objBalanco.buscas.Close;
          _objBalanco.buscas.SQL.Text := 'select count(cod_prod) as contador from produtos where grupo_prod >= '
            + trim(Edit_GrupoIni.text) + ' and grupo_prod <= ' + trim(Edit_GrupoFim.text)
            + ' and COD_EMPRESA = ' + vDadosIni.codEmpresa;
          _objBalanco.buscas.Open;
          _objBalanco._vContador := _objBalanco.buscas.FieldByName('contador').AsInteger;

          //Preenche lista dos itens contados no balanço
//          _objBalanco._ListarProdutos(' select * from produtos where grupo_prod >= '
//            + trim(Edit_GrupoIni.text) + ' and grupo_prod <= ' + trim(Edit_GrupoFim.text)
//            + ' and COD_EMPRESA = ' + vDadosIni.codEmpresa);
        end
        else
        begin
          _objBalanco.buscas.Close;
          _objBalanco.buscas.SQL.Text := 'select count(cod_prod) as contador from produtos where COD_EMPRESA = ' +
            vDadosIni.codEmpresa;
          _objBalanco.buscas.Open;
          _objBalanco._vContador := _objBalanco.buscas.FieldByName('contador').AsInteger;
          //Preencher lista se tiver item no estoque inicial já feito por algum balanco geral ou diario
//          _objBalanco._ListarProdutos('select * from produtos where COD_EMPRESA = ' +
//            vDadosIni.codEmpresa);
            //+' and grupo_prod = 25 and cod_prod = ''22955''');
        end;

        //Formatando contador para produto'
//        if (_objBalanco.dataSet.RecordCount <> 0) then
//          _objBalanco._vContador := 100 / _objBalanco.dataSet.RecordCount
//        else
//          _objBalanco._vContador := 0;

        _objBalanco._vGContador := 0;
        _objBalanco.vInc := 0;
        for I := 0 to 9 do
        begin
          if (Edit_GrupoIni.Text <> '') then
            _objBalanco._ListarProdutos(' select pr.grupo_prod, pr.cod_prod, pr.cod_empresa, ' +
             	' pr.num_fab_prod, pr.descr_prod, pr.descr_prod_red, pr.prec_cusm_prod, pr.prec_tab_prod, pr.prec_publico, pr.nbm, ' +
              ' pr.cst_prod, pr.icm_prod, pr.codigo_nop, pr.marca_p, pr.unidade, pr.em_promocao, ' +
              ' pr.preco_promocao, pr.prec_30_prod, pr.prec_60_prod, pr.prec_90_prod, ' +
              ' pr.est_f, pr.locacao_prod, pr.locacao_prod_1, ' +
              ' cast(0 as float) estoque_disponivel, cast(0 as float) estoque_produzir from produtos pr ' +
              ' where pr.grupo_prod >= ' + trim(Edit_GrupoIni.text) +
              ' and pr.grupo_prod <= ' + trim(Edit_GrupoFim.text) +
              ' and pr.cod_empresa = ' + vDadosIni.codEmpresa +
              ' and rtrim(pr.cod_prod) like ' + QuotedStr('%' + IntToStr(I)))
          else
            _objBalanco._ListarProdutos(' select pr.grupo_prod, pr.cod_prod, pr.cod_empresa, ' +
             	' pr.num_fab_prod, pr.descr_prod, pr.descr_prod_red, pr.prec_cusm_prod, pr.prec_tab_prod, pr.prec_publico, pr.nbm, ' +
              ' pr.cst_prod, pr.icm_prod, pr.codigo_nop, pr.marca_p, pr.unidade, pr.em_promocao, ' +
              ' pr.preco_promocao, pr.prec_30_prod, pr.prec_60_prod, pr.prec_90_prod, ' +
              ' pr.est_f, pr.locacao_prod, pr.locacao_prod_1, ' +              
              ' cast(0 as float) estoque_disponivel, cast(0 as float) estoque_produzir from produtos pr ' +
            	' where pr.cod_empresa = ' + vDadosIni.codEmpresa +
              ' and rtrim(pr.cod_prod) like ' + QuotedStr('%' + IntToStr(I)));

          vDadosIni.abreStatusProcessamento('Finalizando balanço', 'Alterando estoque de produto...');
          _objBalanco._ConfirmarBalanco;
        end;

        Gauge_HistoricoBalanco.Progress := (100);
        //vDadosIni.progressoFuncao('Finalizando o balanço...','Carregando informações do produto com grade','Inicializando segunda etapa...');

        //Carregar Prouto com grade
        if (Edit_GrupoIni.Text <> '') then
        begin
          _objBalanco.buscas.Close;
          _objBalanco.buscas.SQL.Text := 'select count(cod_prod) as contador from cod_grade_prod where grupo_prod >= ' + trim(Edit_GrupoIni.text) +
            ' and grupo_prod <= ' + trim(Edit_GrupoFim.text) + ' and cod_empresa = ' +
            vDadosIni.codEmpresa;
          _objBalanco.buscas.Open;
          _objBalanco._vContador := _objBalanco.buscas.FieldByName('contador').AsInteger;

          //Preenche lista dos itens contados no balanço
          _objBalanco._vGradeBalanco._ListarProdutosGrade('select * from cod_grade_prod where grupo_prod >= ' + trim(Edit_GrupoIni.text) +
            ' and grupo_prod <= ' + trim(Edit_GrupoFim.text) + ' and cod_empresa = ' +
            vDadosIni.codEmpresa);
        end
        else
        begin
          _objBalanco.buscas.Close;
          _objBalanco.buscas.SQL.Text := 'select count(cod_prod) as contador from cod_grade_prod where cod_empresa = ' + vDadosIni.codEmpresa;
          _objBalanco.buscas.Open;
          _objBalanco._vContador := _objBalanco.buscas.FieldByName('contador').AsInteger;

          //Preencher lista se tiver item no estoque inicial já feito por algum balanco geral ou diario
          _objBalanco._vGradeBalanco._ListarProdutosGrade(
            'select * from cod_grade_prod where cod_empresa = ' + vDadosIni.codEmpresa);
        end;
        vCountMovimento := Trunc(_objBalanco._vContador);

        //Formatando contador para produto com grade
//        if (_objBalanco._vGradeBalanco.dataSet.RecordCount <> 0) then
//          _objBalanco._vContador := 100 / _objbalanco._vGradeBalanco.dataSet.RecordCount
//        else
//          _objBalanco._vContador := 0;
        _objBalanco._vGContador := 0;
        Gauge_HistoricoBalanco.Progress := 0;
        vDadosIni.abreStatusProcessamento('Finalizando balanço', 'Alterando estoque de Grade de produto...');

        _objBalanco.vInc := 0;
        for I := 0 to 9 do
        begin

          if (Edit_GrupoIni.Text <> '') then
            _objBalanco._vGradeBalanco._ListarProdutosGrade(' select * from cod_grade_prod ' +
            	' where grupo_prod >= ' + trim(Edit_GrupoIni.text) +
              ' and grupo_prod <= ' + trim(Edit_GrupoFim.text) +
              ' and cod_empresa = ' + vDadosIni.codEmpresa +
              ' and rtrim(cod_prod) like ' + QuotedStr('%' + IntToStr(I)))
          else
            _objBalanco._vGradeBalanco._ListarProdutosGrade(' select * from cod_grade_prod ' +
            	' where cod_empresa = ' + vDadosIni.codEmpresa +
              ' and rtrim(cod_prod) like ' + QuotedStr('%' + IntToStr(I)));

          _objBalanco._ConfirmarGradeBalanco;
        end;

        vDadosIni.abreStatusProcessamento('Finalizando balanço', 'Gravando estoque diário...');
        Gauge_HistoricoBalanco.Progress := 0;
        _objBalanco.buscas.Close;
        _objBalanco.buscas.SQL.Text := 'select count(p.cod_prod) as contador from produtos p' +
          ' left join cod_grade_prod gp on gp.grupo_prod = p.grupo_prod and gp.cod_prod = p.cod_prod and gp.cod_empresa = p.cod_empresa' ;
        if (Edit_GrupoIni.Text <> '') then
          _objBalanco.buscas.SQL.Text := _objBalanco.buscas.SQL.Text +
            ' where p.grupo_prod >= ' + trim(Edit_GrupoIni.text) +
            ' and p.grupo_prod <= ' + trim(Edit_GrupoFim.text) +
            ' and p.cod_empresa = ' + vDadosIni.codEmpresa
        else
          _objBalanco.buscas.SQL.Text := _objBalanco.buscas.SQL.Text +
            ' where p.cod_empresa = ' + vDadosIni.codEmpresa;
        _objBalanco.buscas.Open;
        vCountMovimento := _objBalanco.buscas.FieldByName('contador').AsInteger;

        vIncMov := 0;

        for I := 0 to 9 do
        begin
          Application.ProcessMessages;
          _objBalanco.buscas.Close;
          _objBalanco.buscas.SQL.Text := 'select p.grupo_prod,  p.cod_prod, p.cod_empresa, coalesce(gp.cod_grade, 0) cod_grade from produtos p' +
            ' left join cod_grade_prod gp on gp.grupo_prod = p.grupo_prod and gp.cod_prod = p.cod_prod and gp.cod_empresa = p.cod_empresa' ;
          if (Edit_GrupoIni.Text <> '') then
            _objBalanco.buscas.SQL.Text := _objBalanco.buscas.SQL.Text +
              ' where p.grupo_prod >= ' + trim(Edit_GrupoIni.text) +
              ' and p.grupo_prod <= ' + trim(Edit_GrupoFim.text) +
              ' and p.cod_empresa = ' + vDadosIni.codEmpresa +
              ' and rtrim(p.cod_prod) like ' + QuotedStr('%' + IntToStr(I))
          else
            _objBalanco.buscas.SQL.Text := _objBalanco.buscas.SQL.Text +
              ' where p.cod_empresa = ' + vDadosIni.codEmpresa + ' and rtrim(p.cod_prod) like ' + QuotedStr('%' + IntToStr(I));
          _objBalanco.buscas.Open;
          _objBalanco.buscas.First;
          while not _objBalanco.buscas.Eof do
          begin
            Application.ProcessMessages;
            _objBalanco.vMovimentaEstoque.Close;
            _objBalanco.vMovimentaEstoque.ParamByName('PGRUPO_PROD').AsInteger := _objBalanco.buscas.Fieldbyname('GRUPO_PROD').AsInteger;
            _objBalanco.vMovimentaEstoque.ParamByName('PCOD_PROD').AsString := _objBalanco.buscas.Fieldbyname('COD_PROD').AsString;
            _objBalanco.vMovimentaEstoque.ParamByName('PCOD_EMPRESA').AsInteger := _objBalanco.buscas.Fieldbyname('COD_EMPRESA').AsInteger;
            _objBalanco.vMovimentaEstoque.ParamByName('PCOD_GRADE').AsInteger := _objBalanco.buscas.Fieldbyname('COD_GRADE').AsInteger;
            _objBalanco.vMovimentaEstoque.ParamByName('PQTDE_ENTRADA').AsFloat := 0;
            _objBalanco.vMovimentaEstoque.ParamByName('PQTDE_SAIDA').AsFloat := 0;
            _objBalanco.vMovimentaEstoque.ParamByName('PALTDTULTVND').AsInteger := 0;
            _objBalanco.vMovimentaEstoque.Prepare;
            _objBalanco.vMovimentaEstoque.ExecProc;

            _objBalanco.buscas.Next;
            vIncMov := vIncMov + 1;
            Gauge_HistoricoBalanco.Progress := Trunc(100 / vCountMovimento * vIncMov);
            Application.ProcessMessages;
          end;
        end;


        if _objBalanco.CommitaTransacao then
        begin
          Gauge_HistoricoBalanco.Progress := (100);
          vDadosIni.fechaStatusProcessamento;
          vDadosIni.GravaAuditoria('BAL002', 'CONFIRMAR', 'SUCESSO', 'BALANCO_PRODUTOS',
            'COD_PROD', dtmBalanco.qrBuscas);
          Application.MessageBox('Balanco efetuado com sucesso!', 'Informação', MB_OK +
            MB_ICONINFORMATION);
        end
        else
        begin
          Application.MessageBox('Falha ao confirmar balanço.', 'Aviso', MB_OK + MB_ICONWARNING);
          vDadosIni.GravaAuditoria('BAL002', 'CONFIRMAR', 'FALHA', 'BALANCO_PRODUTOS',
            'COD_PROD', _objBalanco.buscas);
        end;
      except
        on E: Exception do
        begin
          if not (E.MESSAGE = '') then
          begin
            if ((E.MESSAGE = 'Erro ao gravar estoque inicial com grade') or (E.MESSAGE =
              'Erro ao gravar estoque inicial')) then
              Application.MessageBox('Favor verificar se o balanço já não foi confirmado anteriormente, ou se quiser confirmá-lo mesmo assim tente amanhã.', 'Aviso', MB_OK + MB_ICONWARNING);
            vDadosIni.GravaAuditoria('BAL002', 'CONFIRMAR', 'FALHA', 'BALANCO_PRODUTOS',
              'COD_PROD', dtmBalanco.qrBuscas);
            Application.MessageBox(Pchar(E.Message), 'Erro', MB_OK + MB_ICONERROR);
            vDadosIni.registraErro(E.MESSAGE);
          end;
        end;
      end;
    finally
      _objBalanco.RollBackTransacao;
      vDadosIni.fechaStatusProcessamento;
      BitBtn_Confirmar.Enabled:=true;
      bitbtn2.Enabled:=true;
      BitBtn_Sair.Enabled:=true;
      PageControl1.Enabled:=true;
    end;
    Gauge_HistoricoBalanco.Visible := false;
  end;

{$ENDREGION}

{$REGION 'Apagar arquivo balanço'}

  if (RadioButton_ApagarArquivoBalanco.Checked) then
  begin
    try
    	PageControlApagarBalanco.ActivePage := TabSheet_Apagar_Balanco_Geral;

      _objBalancoDia._AbreProdutoDia;
      _objBalancoReg._AbreProdutoReg;
      vDadosIni.abreForm('Apagar Balanço Geral', pnApagarBalanco, [ofAutoSize, ofEscapeExit]);
    finally
       _objBalanco.RollBackTransacao;
       _objBalanco.abrirUltimosRegBalanco;
    end;
  end;

{$ENDREGION}

{$REGION 'Transferir arquivo para o balanço'}

  if (RadioButton_TranfArqBalanco.Checked) then
  begin

    try
      Nomearq := ExtractFilePath(Application.Exename) + 'Nencont.log';
      AssignFile(Arq, NomeArq);
      {2}if not FileExists(NomeArq) then
        Rewrite(arq)
      else {2}
        append(arq);

      _objBalanco._AbreBalanco;

      _objBalanco.qrTransfArqBal.Close;
      vUs := string(__getUsuarioFDB);
      vPw := string(__getSenhaFDB);
      if (Trim(vUs) <> '') then
        _objBalanco.qrTransfArqBal.Database.Params[0] := 'user_name=' + string(__descriptografaTextoFDB(Pchar(vUs)));
      if (Trim(vPw) <> '') then
        _objBalanco.qrTransfArqBal.Database.Params[1] := 'password=' + string(__descriptografaTextoFDB(Pchar(vPw)));
      _objBalanco.qrTransfArqBal.Database.DatabaseName := MaskEdit_Pasta.Text;
      _objBalanco.qrTransfArqBal.Open;

      {w - 1}while not _objBalanco.qrTransfArqBal.eof do
      begin
        _objBalanco._AbreProdutoRel(
          _objBalanco.qrTransfArqBal.FieldByName('CODIGO').AsString);

        {2}if _objBalanco.qrProdutosRel.isempty then
        begin
          auxstr := 'CODIGO: ' +
            _objBalanco.qrTransfArqBal.FieldByName('CODIGO').asstring +
            ' Qtde: ' + _objBalanco.qrTransfArqBal.FieldByName('QTDE').asstring;
          WriteLn(arq, auxstr);
        end {2}
        else {2}
        begin {2}
          _objBalanco._vContadoBalanco._AbreContado(_objBalanco.qrTransfArqBal.FieldByName('CODIGO').asstring,
            _objBalanco.qrTransfArqBal.FieldByName('GRUPO_PROD').asstring);

          {3}if not _objBalanco._vContadoBalanco.dataSet.isempty then
          begin
            _objBalanco._vContadoBalanco.edit;
            _objBalanco._vContadoBalanco.dataSet.FieldByName('QTDE_PROD').asfloat
              := _objBalanco._vContadoBalanco.dataSet.FieldByName('QTDE_PROD').AsFloat
              + _objBalanco.qrTransfArqBal.FieldByName('QTDE').AsFloat;
            _objBalanco._vContadoBalanco.dataSet.post;
          end {3}
          else {3}
          begin {3}
            _objBalanco.dataSet.Append;
            _objBalanco.dataSet.FieldByName('COD_PROD').AsString :=
              _objBalanco.qrProdutosRel.FieldByName('COD_PROD').AsString;
            _objBalanco.dataSet.FieldByName('GRUPO_PROD').AsInteger :=
              _objBalanco.qrProdutosRel.FieldByName('GRUPO_PROD').AsInteger;
            _objBalanco.dataSet.FieldByName('COD_BARRA').AsString :=
              _objBalanco.qrProdutosRel.FieldByName('NUM_FAB_PROD').AsString;
            _objBalanco.dataSet.FieldByName('QTDE_PROD').AsFloat :=
              _objBalanco.qrProdutosRel.FieldByName('QTDE').AsFloat;
            _objBalanco.dataSet.FieldByName('COD_EMPRESA').AsString :=
              vDadosIni.codEmpresa;
            _objBalanco.qrTransfArqBal.post;
          end; {3}
        end; {2}
        _objBalanco.qrTransfArqBal.next;
      end; {w - 1}

    finally
      closeFile(arq);
      _objBalanco.qrProdutosRel.close;
      _objBalanco.qrTransfArqBal.close;
    end;

  end;

{$ENDREGION}

{$REGION 'Relatório de produtos contados'}

  if (RadioButton_RelProdContado.Checked) then
  begin
    if not vDadosIni.PesqPros('BAL006', 'REL PROD CONT', '', 'BALANCO_PRODUTOS', '',
      dtmBalanco.qrBuscas, True) then
      Exit;
    if MaskEdit_Secao.Text <> '' then
    begin
      try
        strtoint(MaskEdit_Secao.text);
      except
        Application.MessageBox('Seção Inválida.', 'Aviso', MB_OK + MB_ICONERROR);
        if (Self.Enabled) and (Self.Visible) and (MaskEdit_Secao.CanFocus) then
        	MaskEdit_Secao.setfocus;
        exit;
      end;
    end;

    try
      vDadosIni.abreStatusProcessamento('Relatório de produtos contados',
        'Processando informações...');
      vtotC := 0;
      vtotV := 0;
      vtotgC := 0;
      vtotgV := 0;
      vSomaQtde := 0;
      _objBalanco._Linha_I := 1;
      _objBalanco.qrContRel.close;
      if MaskEdit_Secao.text = '' then
        _objBalanco.QrContRel.sql.text :=
          'select pr.grupo_prod,pr.cod_prod,pr.descr_prod,pr.est_f,bl.qtde_prod,' +
          'pr.num_fab_prod,pr.locacao_prod,pr.sub_g_prod,pr.prec_cus_prod,' +
          'pr.prec_cusr_prod,sbg.descricao,pr.prec_tab_prod,pr.emb_prod,pr.prec_cusm_prod from ' +
          'balanco_produtos bl,produtos pr,sub_grupo sbg where ' +
          'bl.grupo_prod = pr.grupo_prod and bl.cod_prod = pr.cod_prod and ' +
          'coalesce(pr.sub_g_prod,0) = sbg.codigo_subgr and bl.cod_empresa = pr.cod_empresa and pr.cod_empresa = ' +
          vDadosIni.codEmpresa
          + ' order by pr.sub_g_prod,pr.descr_prod'
      else
      begin
        _objBalanco.QrContRel.sql.text :=
          'select pr.grupo_prod,pr.cod_prod,pr.descr_prod,pr.est_f,bl.qtde_prod,' +
          'pr.num_fab_prod,pr.locacao_prod,pr.sub_g_prod,pr.prec_cus_prod,' +
          'pr.prec_cusr_prod,sbg.descricao,pr.prec_tab_prod,pr.emb_prod,pr.prec_cusm_prod from ' +
          'balanco_produtos bl,produtos pr,sub_grupo sbg where ' +
          'bl.grupo_prod = pr.grupo_prod and bl.cod_prod = pr.cod_prod and ' +
          'coalesce(pr.sub_g_prod,0) = sbg.codigo_subgr and coalesce(pr.sub_g_prod,0) = '
          + trim(MaskEdit_Secao.Text) + ' and bl.cod_empresa = pr.cod_empresa and pr.cod_empresa = '
          + vDadosIni.codEmpresa + ' order by pr.sub_g_prod,pr.descr_prod';
      end;
      _objBalanco.QrContRel.open;
      if not vDadosIni.ModImp(_objBalanco.rdRelCont) then
         exit;
      _objBalanco._vTituloRelatorio := 'Produtos contados';
      _objBalanco.RdRelCont.abrir;
      _objBalanco.RdRelCont.impf(_objBalanco._Linha_I, 2,
        _objBalanco.QrContRel.FieldByName('SUB_G_PROD').asstring + ' ' +
        _objBalanco.QrContRel.FieldByName('DESCRICAO').AsString, [normal, negrito]);
      _objBalanco._Linha_I := _objBalanco._Linha_I + 1;
      ivsubg := _objBalanco.QrContRel.FieldByName('SUB_G_PROD').AsInteger;
      _objBalanco.qrContRel.First;
      while not _objBalanco.QrContRel.eof do
      begin
        if _objBalanco.QrContRel.FieldByName('SUB_G_PROD').AsInteger <> ivsubg then
        begin
          //  _objBalanco._Linha_I := _objBalanco._Linha_I + 1;//eu inseri
          _objBalanco.RdRelCont.imp(_objBalanco._Linha_I, 2, 'Total da Secao: ');
          _objBalanco.RdRelCont.imp(_objBalanco._Linha_I, 92, vDadosIni.AlnDir(format('%n',
            [vtotV]), 10));
          _objBalanco.RdRelCont.imp(_objBalanco._Linha_I, 112, vDadosIni.AlnDir(format('%n',
            [vtotC]), 10));
          _objBalanco._Linha_I := _objBalanco._Linha_I + 2;
          _objBalanco.RdRelCont.impf(_objBalanco._Linha_I, 2,
            _objBalanco.QrContRel.FieldByName('SUB_G_PROD').asstring + ' '
            + _objBalanco.QrContRel.FieldByName('DESCRICAO').asstring, [normal, negrito]);
          ivsubg := _objBalanco.QrContRel.FieldByName('SUB_G_PROD').AsInteger;
          _objBalanco._Linha_I := _objBalanco._Linha_I + 1;
          vtotC := 0;
          vtotV := 0;
        end;
        if CheckBox_NumFab.checked then
          _objBalanco.RdRelCont.imp(_objBalanco._Linha_I, 1,
            trim(_objBalanco.QrContRel.FieldByName('NUM_FAB_PROD').AsString))
        else
          _objBalanco.RdRelCont.imp(_objBalanco._Linha_I, 2,
            vDadosIni.StrZero(_objBalanco.QrContRel.FieldByName('GRUPO_PROD').AsString, 3)
            + ' ' + _objBalanco.QrContRel.FieldByName('COD_PROD').AsString);
        _objBalanco.RdRelCont.imp(_objBalanco._Linha_I, 15,
          copy(_objBalanco.QrContRel.FieldByName('DESCR_PROD').AsString, 1, 43));
        _objBalanco.RdRelCont.imp(_objBalanco._Linha_I, 50,
          _objBalanco.QrContRel.FieldByName('EMB_PROD').AsString);
        //    RdRelCont.imp(linha,60,QrContRelEST_F
        //    'ESTOQUE',[comp17]);
        vSomaQtde := vSomaQtde + _objBalanco.QrContRel.FieldByName('QTDE_PROD').AsFloat;
        vestP := vestP + _objBalanco.QrContRel.FieldByName('QTDE_PROD').AsFloat;
        _objBalanco.RdRelCont.imp(_objBalanco._Linha_I, 70, vDadosIni.AlnDir(format('%8.3f',
          [_objBalanco.QrContRel.FieldByName('QTDE_PROD').AsFloat]), 8));
        _objBalanco.RdRelCont.imp(_objBalanco._Linha_I, 80, vDadosIni.AlnDir(format('%n',
          [_objBalanco.QrContRel.FieldByName('PREC_TAB_PROD').AsFloat]), 10));
        _objBalanco.RdRelCont.imp(_objBalanco._Linha_I, 92, vDadosIni.AlnDir(format('%n',
          [(_objBalanco.QrContRel.FieldByName('QTDE_PROD').AsFloat *
            _objBalanco.QrContRel.FieldByName('PREC_TAB_PROD').AsFloat)]), 10));
        if CheckBox_Contabil.Checked then
        begin
          _objBalanco.RdRelCont.imp(_objBalanco._Linha_I, 102, vDadosIni.AlnDir(format('%n',
            [_objBalanco.QrContRel.FieldByName('PREC_CUS_PROD').AsFloat]), 10));
          _objBalanco.RdRelCont.imp(_objBalanco._Linha_I, 112, vDadosIni.AlnDir(format('%n',
            [(_objBalanco.QrContRel.FieldByName('QTDE_PROD').AsFloat *
              _objBalanco.QrContRel.FieldByName('PREC_CUS_PROD').AsFloat)]), 10));
          vtotC := vtotC + (_objBalanco.QrContRel.FieldByName('QTDE_PROD').AsFloat *
            _objBalanco.QrContRel.FieldByName('PREC_CUS_PROD').AsFloat);
        end
        else
        begin
          //        {3}if CheckBox_ContabMedio.Checked then
          //        begin
          _objBalanco.RdRelCont.imp(_objBalanco._Linha_I, 102, vDadosIni.AlnDir(format('%n',
            [_objBalanco.QrContRel.FieldByName('PREC_CUSM_PROD').AsFloat]), 10));
          _objBalanco.RdRelCont.imp(_objBalanco._Linha_I, 112, vDadosIni.AlnDir(format('%n',
            [(_objBalanco.QrContRel.FieldByName('QTDE_PROD').AsFloat *
              _objBalanco.QrContRel.FieldByName('PREC_CUSM_PROD').AsFloat)]), 10));
          vtotC := vtotC +
            (_objBalanco.QrContRel.FieldByName('QTDE_PROD').AsFloat *
            _objBalanco.QrContRel.FieldByName('PREC_CUSM_PROD').AsFloat);
          (*  end{3}
            else{3}
            begin{3}
              _objBalanco.RdRelCont.imp(_objBalanco._Linha_I, 102, vDadosIni.AlnDir(format('%n',
              [_objBalanco.QrContRel.FieldByName('PREC_CUSR_PROD').AsFloat]), 10));
              _objBalanco.RdRelCont.imp(_objBalanco._Linha_I, 112, vDadosIni.AlnDir(format('%n',
              [(_objBalanco.QrContRel.FieldByName('QTDE_PROD').AsFloat *
              _objBalanco.QrContRel.FieldByName('PREC_CUSR_PROD').AsFloat)]), 10));
              vtotC := vtotC +
              (_objBalanco.QrContRel.FieldByName('QTDE_PROD').AsFloat *
              _objBalanco.QrContRel.FieldByName('PREC_CUSR_PROD').AsFloat);
            end;{3}*)
        end; {2}
        _objBalanco._vGradeBalanco._AbreGradeBalancoGrupo(
          _objBalanco.QrContRel.FieldByName('COD_PROD').Text,
          _objBalanco.QrContRel.FieldByName('GRUPO_PROD').Text);
        if not _objBalanco._vGradeBalanco.IsEmpty then
        begin
          _objBalanco._vGradeBalanco.First;
          while not _objBalanco._vGradeBalanco.Eof do
          begin
            _objBalanco._vGradeContadosBalanco._AbreGradeContBalanco(
              _objBalanco._vGradeBalanco.dataSet.FieldByName('GRUPO_PROD').AsString,
              _objBalanco._vGradeBalanco.dataSet.FieldByName('COD_PROD').AsString,
              _objBalanco._vGradeBalanco.dataSet.FieldByName('COD_GRADE').AsString);
            if _objBalanco._vGradeContadosBalanco.dataset.FieldByName('QTDE').AsFloat > 0 then
            begin
              inc(_objBalanco._Linha_I);
              _objBalanco.RdRelCont.Imp(_objBalanco._Linha_I, 18, 'Grade: ' +
                _objBalanco._vGradeContadosBalanco.dataSet.FieldByName('DESCRICAO').Text);
              _objBalanco.RdRelCont.imp(_objBalanco._Linha_I, 70, vDadosIni.AlnDir(format('%8.3f',
                [_objBalanco._vGradeContadosBalanco.dataSet.FieldByName('QTDE').AsFloat]), 8));

              //            RdRelCont.Imp(linha, 70, AlnDir(Format('%n', [QrGradeContadosdescricao.text]), 10));
            end;
            _objBalanco._vGradeBalanco.Next;
          end;
        end;
        vtotV := vtotv + (_objBalanco.QrContRel.FieldByName('QTDE_PROD').AsFloat *
          _objBalanco.QrContRel.FieldByName('PREC_TAB_PROD').AsFloat);
        // vit := vit + 1;
        _objBalanco._Linha_I := _objBalanco._Linha_I + 1;
        // linha := linha + 1;
        // itc := itc + 1;
        // label8.Caption := inttostr(itc) + ' ' + QrContRelGRUPO_PROD.asstring + ' ' + QrContRelCOD_PROD.asstring;
        // label8.refresh;
        _objBalanco.QrContRel.next;
        if _objBalanco._Linha_I >= 60 then
        begin

           _objBalanco._Linha_I := _objBalanco._Linha_I + 1;
          _objBalanco.RdRelCont.imp(_objBalanco._Linha_I, 2, 'Total qtde de estoque contado.....................: '
            + Format('%n', [vestP]));
           _objBalanco._Linha_I := _objBalanco._Linha_I + 1;
          _objBalanco.RdRelCont.imp(_objBalanco._Linha_I, 2, 'Total qtde de estoque contado acumulado...........: '
            + Format('%n', [vSomaQtde]));
            vestP := 0;

          _objBalanco._Linha_I := 1;
          _objBalanco.RdRelCont.Novapagina;
        end;
      end;
      // _objBalanco._Linha_I := _objBalanco._Linha_I + 1;//eu coloquei andré 30/11/2011
      _objBalanco.RdRelCont.impF(_objBalanco._Linha_I, 1, vDadosIni.replicate('-', 130), [comp17]);
      _objBalanco._Linha_I := _objBalanco._Linha_I + 1;
      _objBalanco.RdRelCont.ImpF(_objBalanco._Linha_I, 1, 'TOTAL POR SECAO ', [normal, negrito]);
      _objBalanco._Linha_I := _objBalanco._Linha_I + 1;
      _objBalanco.RdRelCont.Imp(_objBalanco._Linha_I, 1, 'CODIGO');
      _objBalanco.RdRelCont.Imp(_objBalanco._Linha_I, 30, 'DESCRICAO');
      _objBalanco.RdRelCont.Imp(_objBalanco._Linha_I, 80, 'VALOR');
      _objBalanco._Linha_I := _objBalanco._Linha_I + 1;
      _objBalanco._AbreSomasProd;
      while not _objBalanco.qrSomasProd.eof do
      begin
        _objBalanco.RdRelCont.Imp(_objBalanco._Linha_I, 1,
          _objBalanco.qrSomasProd.FieldByName('SUB_G_PROD').asstring + ' : ');
        _objBalanco.RdRelCont.Imp(_objBalanco._Linha_I, 30,
          _objBalanco.qrSomasProd.FieldByName('DESCRICAO').asstring);
        _objBalanco.RdRelCont.Imp(_objBalanco._Linha_I, 92, vDadosIni.AlnDir(format('%n',
          [_objBalanco.qrSomasProd.FieldByName('SUM_2').AsFloat]), 10));
        if CheckBox_Contabil.checked then
        begin
          _objBalanco.RdRelCont.Imp(_objBalanco._Linha_I, 112, vDadosIni.AlnDir(format('%n',
            [_objBalanco.qrSomasProd.FieldByName('SUM').AsFloat]), 10));
          vtotgC := vtotgC + _objBalanco.qrSomasProd.FieldByName('SUM').AsFloat;
        end
        else
        begin
          //        {3}if CheckBox_ContabMedio.checked then
          //        begin
          _objBalanco.RdRelCont.Imp(_objBalanco._Linha_I, 112, vDadosIni.AlnDir(format('%n',
            [_objBalanco.qrSomasProd.FieldByName('SUM_3').AsFloat]), 10));
          vtotgC := vtotgC + _objBalanco.qrSomasProd.FieldByName('SUM_3').AsFloat;
          (*        end{3}
                  else{3}
                  begin{3}
                    _objBalanco.RdRelCont.Imp(_objBalanco._Linha_I, 112, vDadosIni.AlnDir(format('%n', [_objBalanco.qrSomasProd.FieldByName('SUM_1').AsFloat]), 10));
                    vtotgC := vtotgC + _objBalanco.qrSomasProd.FieldByName('SUM_1').AsFloat;
                  end{3}*)
        end; {2}
        vtotgV := vtotgV + _objBalanco.qrSomasProd.FieldByName('SUM_2').AsFloat;
        _objBalanco._Linha_I := _objBalanco._Linha_I + 1;
        if _objBalanco._Linha_I >= 60 then
        begin
          _objBalanco.RdRelCont.Imp(_objBalanco._Linha_I, 1, vDadosIni.replicate('=', 132));
          _objBalanco._Linha_I := 1;
          _objBalanco.RdRelCont.Novapagina;
        end;
        _objBalanco.qrSomasProd.next;
      end;
      _objBalanco.RdRelCont.imp(_objBalanco._Linha_I, 1, 'TOTAIS :');
      _objBalanco.RdRelCont.imp(_objBalanco._Linha_I, 70, vDadosIni.AlnDir(format('%8.3f',
        [vSomaQtde]), 8));
      _objBalanco.RdRelCont.Imp(_objBalanco._Linha_I, 92, vDadosIni.AlnDir(format('%n', [VtotgV]),
        10));
      _objBalanco.RdRelCont.Imp(_objBalanco._Linha_I, 112, vDadosIni.AlnDir(format('%n', [vtotgC]),
        10));
      _objBalanco._Linha_I := _objBalanco._Linha_I + 1;
      _objBalanco.rdRelCont.OpcoesPreview.Preview := true;
      _objBalanco.RdRelCont.Fechar;
    finally
      vDadosIni.fechaStatusProcessamento;
    end;
  end;

{$ENDREGION}

{$REGION 'Desligar computador'}

  if (RadioButton_DesligarPC.Checked) then
  begin
    _objBalanco.RollBackTransacao;
    _objBalanco.Close;
    _objBalanco.Free;
    _objBalanco := nil;
    vDadosIni.desconectaBanco(dtmAtivo.bancoHw);
    vDadosIni.DesligaComputador(EWX_SHUTDOWN or EWX_FORCE);
    Close;
  end;

{$ENDREGION}

end;

procedure TfrmBalanco.BitBtn_Grade_OKClick(Sender: TObject);
begin
  inherited;
  _vBotaoOKGrade := true;
  TForm(Panel_Grade.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmBalanco.BitBtn_IncluirClick(Sender: TObject);
var
	vdata: string;
  _QtdContado_D: Double;
  vGradContBalanco:boolean;
begin
	if _objBalanco.arquivoBalancoGeradoEmOutraData(vdata) then
  begin
  	if Application.MessageBox(PChar('Arquivo de balanço gerado em outra data, deseja continuar assim mesmo?' + #13 + #13 +
    	'Data: ' + vdata), 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> IDYES then
        exit;
        
		if not vDadosIni.PesqPros('BAL008', 'EXISTE', '', 'BALANCO_PRODUTOS', '', dtmBalanco.qrBuscas, true) then
  	  exit;
  end;

  _QtdContado_D := 0;
  try
    try
      inherited;
      // Vericar campos codigo e quantidade se vazio
      _CampoVazio(MaskEdit_produto);
      _CampoVazio(MaskEdit_Quantidade);
      _QtdZerada;
      if not vDadosIni.PesqPros('BAL001', 'INCLUIR', '', 'BALANCO_PRODUTOS', MaskEdit_produto.Text,
        dtmBalanco.qrBuscas, True) then
        Exit;

//      Verificar se e para substituir o valor do estoque ou somar com o que esta contado no balanço, igual a ficha financeira
      if not (_objBalanco._vGradeBalanco.dataSet.IsEmpty) then
      begin
        if not _objBalanco._validaQtdASubtrairGrade(strtofloat(trim(MaskEdit_Quantidade.text)),strtoint(trim(_objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[2]))) then
        begin
        	if (Self.Enabled) and (Self.Visible) and (MaskEdit_produto.CanFocus) then
          	MaskEdit_produto.SetFocus;
          exit;
        end;

        _objBalanco._InserirGradeProduto(trim(MaskEdit_Quantidade.text),
          MaskEdit_AlocQtd1.Text, MaskEdit_AlocQtd2.Text,
          _objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[2]);
      end;

      _objBalanco._InserirProduto(trim(MaskEdit_Quantidade.text),
        MaskEdit_AlocQtd1.Text, MaskEdit_AlocQtd2.Text);

      _objBalanco.CommitaTransacao;
      if _objBalanco._vContadoBalanco.dataSet.FieldByName('QTDE_PROD').AsFloat <= 0 then
      begin
        _objBalanco._vGradeContadosBalanco.ExecutaComandosSqlExec(
          ' delete from COD_GRADE_BALANCO ' +
          ' where GRUPO_PROD = '+inttostr(_objBalanco._vContadoBalanco.dataSet.FieldByName('GRUPO_PROD').AsInteger)+
          ' and COD_PROD = '+ QuotedStr(trim(_objBalanco._vContadoBalanco.dataSet.FieldByName('COD_PROD').Asstring))+
          ' and COD_EMPRESA = ' + vDadosIni.codEmpresa);
        _objBalanco._vGradeContadosBalanco.CommitaTransacao;

        _objBalanco._vContadoBalanco.dataSet.RefreshRecord;
        _objBalanco._vContadoBalanco.Delete;
        _objBalanco._vContadoBalanco.Apply;
        _objBalanco.CommitaTransacao;
      end;
      _objBalanco.vQuery.Open;

      if (CheckBox_EmitirSom.Checked) then
      begin
        PlaySound(Pchar('produto.wav'), 0, SND_ASYNC);
      end;

    except on E: Exception do
      begin
        if (CheckBox_EmitirSom.Checked) then
        begin
          PlaySound(Pchar('erro.wav'), 0, SND_ASYNC);
        end;
        if not (E.MESSAGE = '') then
        begin
          MessageDlg(E.Message, mtError, [mbOK], 0);
          vDadosIni.registraErro(E.MESSAGE);
        end;

        if (Self.Enabled) and (Self.Visible) and (MaskEdit_produto.CanFocus) then
        	MaskEdit_produto.SetFocus;
      end;
    end;
  finally
    _ZerarForm;
  end;

  if (Self.Enabled) and (Self.Visible) and (MaskEdit_produto.CanFocus) then
	  MaskEdit_produto.SetFocus;
end;

procedure TfrmBalanco.BitBtn_MudarPaginaClick(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := TabSheet_Conf;
end;

procedure TfrmBalanco.BitBtn_SairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmBalanco.CheckBox_EmitirSomClick(Sender: TObject);
begin
  inherited;

  if (CheckBox_EmitirSom.Checked) then
  begin
    _GravaConfiguracoesBoolean('SINALBALANCO', true);
    PlaySound(Pchar('produto.wav'), 0, SND_ASYNC);
  end
  else
  begin
    _GravaConfiguracoesBoolean('SINALBALANCO', false);
    PlaySound(Pchar('produto.wav'), 0, SND_ASYNC);
  end;

end;

procedure TfrmBalanco.ckAutoIncExit(Sender: TObject);
begin
  inherited;
  _objBalanco._InserirUmOuQtdeProduto := ckAutoInc.Checked;
end;

procedure TfrmBalanco.ckAutoIncGradeExit(Sender: TObject);
begin
  inherited;
  _objBalanco._InserirUmOuQtdeGrade := ckAutoIncGrade.Checked;
end;

procedure TfrmBalanco.DBGridContadosExit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = BitBtn_MudarPagina) or (ActiveControl = BitBtn_Sair) then
    exit;
  if (Self.Enabled) and (Self.Visible) and (MaskEdit_produto.CanFocus) then
    MaskEdit_produto.SetFocus;
end;

procedure TfrmBalanco.DBGrid_GradeDblClick(Sender: TObject);
begin
  inherited;
  BitBtn_Grade_OKClick(Sender);
end;

procedure TfrmBalanco.DBGrid_GradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
    BitBtn_Grade_OKClick(Sender)
  else if Key = VK_ESCAPE then
    TForm(Panel_Grade.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmBalanco.Desabilitar1Click(Sender: TObject);
begin
  inherited;
  ckAutoInc.Checked := False;
  _objBalanco._InserirUmOuQtdeProduto := ckAutoInc.Checked;
end;

procedure TfrmBalanco.Desabilitar2Click(Sender: TObject);
begin
  inherited;
  ckAutoIncGrade.Checked := False;
  _objBalanco._InserirUmOuQtdeGrade := ckAutoIncGrade.Checked;
end;

procedure TfrmBalanco.Desabilitar3Click(Sender: TObject);
begin
  inherited;
  CheckBox_EmitirSom.Checked := False;
  if (CheckBox_EmitirSom.Checked) then
  begin
    _GravaConfiguracoesBoolean('SINALBALANCO', true);
    PlaySound(Pchar('produto.wav'), 0, SND_ASYNC);
  end
  else
  begin
    _GravaConfiguracoesBoolean('SINALBALANCO', false);
    PlaySound(Pchar('produto.wav'), 0, SND_ASYNC);
  end;
end;

procedure TfrmBalanco.Desabilitar4Click(Sender: TObject);
begin
  inherited;
  ckSemprePedirGrade.Checked := False;
end;

procedure TfrmBalanco.EditLocalizarGradeChange(Sender: TObject);
begin
  inherited;
  try
    if Trim(EditLocalizarGrade.Text) <> '' then
    begin
      _objBalanco._vVisGrade.dataSet.Filter := 'descricao like ''%' + EditLocalizarGrade.Text + '%''';
      _objBalanco._vVisGrade.dataSet.Filtered := True;
    end;
  finally
    if Trim(EditLocalizarGrade.Text) = '' then
    begin
      _objBalanco._vVisGrade.dataSet.Filtered := False;
      _objBalanco._vVisGrade.dataSet.Filter := '';
    end;
  end;
end;

procedure TfrmBalanco.Edit_GrupoFimExit(Sender: TObject);
begin
  inherited;
  {1}if Edit_GrupoFim.Text <> '' then
  begin
    {2}try
      strtoint(Edit_GrupoFim.text);
    except
      messagedlg('Grupo Final Invalido', mtinformation, [mbOK], 0);
      if (Self.Enabled) and (Self.Visible) and (Edit_GrupoFim.CanFocus) then
      	Edit_GrupoFim.setfocus;
      exit;
    end; {2}
  end; {1}
end;

procedure TfrmBalanco.Edit_GrupoIniExit(Sender: TObject);
begin
  inherited;
  {1}if Edit_GrupoIni.Text <> '' then
  begin
    {2}try
      strtoint(Edit_GrupoIni.text);
    except
      messagedlg('Grupo inicial Invalido', mtinformation, [mbOK], 0);
      if (Self.Enabled) and (Self.Visible) and (Edit_GrupoIni.CanFocus) then
      	Edit_GrupoIni.setfocus;
      exit;
    end; {2}
  end; {1}
end;

procedure TfrmBalanco.Edit_ProdutoGradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    TForm(Panel_Grade.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmBalanco.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if _objBalanco <> nil then
  begin
    _objBalanco.RollBackTransacao;
    _objBalanco.Close;
    _objBalanco.Free;
    _objBalanco := nil;
  end;

  if _objBalancoDia <> nil then
  begin
  	_objBalancoDia.RollBackTransacao;
    _objBalancoDia.Close;
    _objBalancoDia.Free;
    _objBalancoDia := nil;
  end;

  if _objBalancoReg <> nil then
  begin
  	_objBalancoReg.RollBackTransacao;
    _objBalancoReg.Close;
    _objBalancoReg.Free;
    _objBalancoReg := nil;
  end;
end;

procedure TfrmBalanco.FormCreate(Sender: TObject);
begin
  inherited;
  _objBalanco    := TBalancoProduto.create;
  _objBalancoDia := TBalancoProdutoDia.create;
  _objBalancoReg := TBalancoProdutoRegistro.create;

  _objBalanco._GaugeBalanco := TGauge(Gauge_HistoricoBalanco);
  _objBalanco._vVisGrade._EditQuant := TEdit(Edit_QtdGradeCont);
  _objBalanco._vVisGrade._EditEstRealGrade := TEdit(Edit_EstRealGrade);
  DBGridContados.DataSource := _objBalanco.vDsSource;

end;

procedure TfrmBalanco.FormShow(Sender: TObject);
begin
  inherited;
  {1}if vDadosIni.vSupermercado = 'S' then
  begin
    Label_QtdAloc1.Visible := false;
    Label_QtdAloc2.Visible := false;
    MaskEdit_AlocQtd1.Visible := false;
    MaskEdit_AlocQtd2.Visible := false;
    BitBtn_Incluir.Visible := false;
  end;

{$REGION 'Config.ini'}

  //Não testado     -------
  if (vDadosIni.vDiferencaEstoque = 'S') then
    _objBalanco._SubstituiDiferencaEstoque := true
  else
    _objBalanco._SubstituiDiferencaEstoque := false;
  //Não testado     -------

  if (vDadosIni.vAutoInc = 'S') then
    _objBalanco._InserirUmOuQtdeProduto := true
  else
    _objBalanco._InserirUmOuQtdeProduto := false;

  if (vDadosIni.vAutoIncGrade = 'S') then
    _objBalanco._InserirUmOuQtdeGrade := true
  else
    _objBalanco._InserirUmOuQtdeGrade := false;

  if (vDadosIni.vSubOuSoma = 'S') then
    _objBalanco._SubstituirOuSomar := true
  else
    _objBalanco._SubstituirOuSomar := false;

  ckAutoInc.Checked := _objBalanco._InserirUmOuQtdeProduto;
  ckAutoIncGrade.Checked := _objBalanco._InserirUmOuQtdeGrade;

{$ENDREGION}

  PageControl1.ActivePage := TabSheet_Contagem;
  Label_EstGrade.Visible := false;
  Edit_EstGrade.Visible := false;
  TabSheet_Grade.TabVisible := false;
  TabSheet_Outros.TabVisible := false;

  if (_LerConfiguracoesRegistroBoolean('SINALBALANCO')) then
  begin
    CheckBox_EmitirSom.Checked := true;
  end;

  Label19.Visible := vDadosIni.vEmp.vAlmox = 'S2';

  RadioButton_RelProdNaoCont.Checked := true;

  MaskEdit_AlocProd1.EditMask := vDadosIni.vMascaraLocacao;
  MaskEdit_AlocProd2.EditMask := vDadosIni.vMascaraLocacao;

  MaskEdit_AlocQtd1.EditMask := vDadosIni.vMascaraLocacao;
  MaskEdit_AlocQtd2.EditMask := vDadosIni.vMascaraLocacao;

  MaskEdit_AlocInfo1.EditMask := vDadosIni.vMascaraLocacao;
  MaskEdit_AlocInfo2.EditMask := vDadosIni.vMascaraLocacao;

  if (Self.Enabled) and (Self.Visible) and (MaskEdit_produto.CanFocus) then
    MaskEdit_produto.SetFocus;
end;

procedure TfrmBalanco.Habilitar1Click(Sender: TObject);
begin
  inherited;
  ckAutoInc.Checked := True;
  _objBalanco._InserirUmOuQtdeProduto := ckAutoInc.Checked;
end;

procedure TfrmBalanco.Habilitar2Click(Sender: TObject);
begin
  inherited;
  ckAutoIncGrade.Checked := True;
  _objBalanco._InserirUmOuQtdeGrade := ckAutoIncGrade.Checked;
end;

procedure TfrmBalanco.Habilitar3Click(Sender: TObject);
begin
  inherited;
  CheckBox_EmitirSom.Checked := True;
  if (CheckBox_EmitirSom.Checked) then
  begin
    _GravaConfiguracoesBoolean('SINALBALANCO', true);
    PlaySound(Pchar('produto.wav'), 0, SND_ASYNC);
  end
  else
  begin
    _GravaConfiguracoesBoolean('SINALBALANCO', false);
    PlaySound(Pchar('produto.wav'), 0, SND_ASYNC);
  end;
end;

procedure TfrmBalanco.Habilitar4Click(Sender: TObject);
begin
  inherited;
  ckSemprePedirGrade.Checked := True;
end;

procedure TfrmBalanco.MaskEdit_produtoEnter(Sender: TObject);
begin
  inherited;
  MaskEdit_produto.SelectAll;
end;

procedure TfrmBalanco.MaskEdit_produtoExit(Sender: TObject);
var
  vnomegrade: string;
begin
  inherited;
  try
    try
      if (ActiveControl = DBGridContados) or (ActiveControl = BitBtn_MudarPagina)
      	or (ActiveControl = BitBtn_Sair) then
          exit;
          
      if _objBalanco.vCodBarra <> trim(MaskEdit_produto.Text) then
      begin
        MaskEdit_grupo.text := '';
        MaskEdit_codprod.text := '';
      end;

      vnomegrade := '';
      _objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL.Clear;

      Label_EstGrade.Visible := false;
      Edit_EstGrade.Visible := false;
      _objBalanco._vData := vDadosIni.getDataBanco(_objBalanco.buscas);
      _MudarPaginaFoco();
      _CampoVazio(MaskEdit_produto);

//      _DigitosSuperior();

      //O Numero de fabrica é o mesmo do Codbarra, se tiver mais de um pega pelo grupo e código
      if _objBalanco._DigitosSuperior(trim(MaskEdit_produto.Text)) then
        _objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL :=
          TProdutos._PegarInfoCodBarra_CodprodNumfabCodgradeGrupo(
          	trim(MaskEdit_grupo.Text),
            trim(MaskEdit_codprod.Text),
          	trim(MaskEdit_produto.Text));

      if (_objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL.Count = 0) then
      begin
        _objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL.Add('');
        _objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL.Add(trim(MaskEdit_produto.Text));
        _objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL.Add('');
        _objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL.Add('');
      end;
      try
        //Se está em supermecado
        if vDadosIni.vSupermercado = 'S' then
        begin
          if length(trim(_objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[1])) < 13 then
            _objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[1] :=
              vDadosIni.StrZero(StrToInt64(trim(_objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[1])), 13);
        end;
      finally

      end;

      if not (_objBalanco._AbreProduto(
      	MaskEdit_grupo.Text,
        MaskEdit_codprod.Text,
      	_objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[1])) then
      begin
        raise Exception.Create('Produto não encontrado');
      end
      else
      begin
        if _objBalanco.dataSet.FieldByName('PREC_CUSM_PROD').AsFloat <= 0 then
          raise Exception.Create('Produto sem custo cadastrado');

        _objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[0] :=
          _objBalanco.dataSet.FieldByName('COD_PROD').AsString;
        _objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[3] :=
          _objBalanco.dataSet.FieldByName('GRUPO_PROD').AsString;

        MaskEdit_grupo.Text := _objBalanco.dataSet.FieldByName('GRUPO_PROD').AsString;
        MaskEdit_codprod.Text := _objBalanco.dataSet.FieldByName('COD_PROD').AsString;
        if _objBalanco.vPesqDescrProd then
          MaskEdit_produto.Text := _objBalanco.dataSet.FieldByName('NUM_FAB_PROD').AsString;

        if (_objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL.Count <= 4) then
	        _objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL :=
  	        TProdutos._PegarInfoCodBarra_CodprodNumfabCodgradeGrupo(
    	      	trim(MaskEdit_grupo.Text),
      	      trim(MaskEdit_codprod.Text),
        	  	trim(MaskEdit_produto.Text));
      end;

     //Validar Grade
      if (_objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[2] <> '') then
      begin
        if not _objBalanco._vGradeBalanco._existeGrade(
          _objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[0],
          _objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[3],
          _objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[2]) then
            _objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[2] := '';
      end;

      _objBalanco._vGradeBalanco._AbreGradeBalancoGrupo(
        _objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[0],
        _objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[3]);

//      Verificar codigo de Barra G- com grade
      if (_objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[2] = '') or (ckSemprePedirGrade.Checked) then
      begin
//        Verificar grade
        if not (_objBalanco._vGradeBalanco.dataSet.IsEmpty) or (ckSemprePedirGrade.Checked) then
        begin
          if ckSemprePedirGrade.Checked then
            _objBalanco._vVisGrade._AbreVisGradeTodas(
              _objBalanco.dataSet.FieldByName('GRUPO_PROD').AsString,
              _objBalanco.dataSet.FieldByName('COD_PROD').AsString)
          else
            _objBalanco._vVisGrade._AbreVisGrade(
              _objBalanco._vGradeBalanco.dataSet.FieldByName('GRUPO_PROD').AsString,
              _objBalanco.dataSet.FieldByName('COD_PROD').AsString,
              _objBalanco._vGradeBalanco.dataSet.FieldByName('COD_GRADE').AsString);
//        Solicitar grade

        	if (not ckSemprePedirGrade.Checked)
          	and (_objBalanco._vGradeBalanco.dataSet.RecordCount = 1)
          	and (_objBalanco._vGradeBalanco.dataSet.FieldByName('COD_GRADE').AsInteger = 0) then
          	// Não fazer nada
          else
          begin
//          Usuario informar grade
            try
              _FormGrade := TForm.Create(Application);
              _FormGrade.Position := poScreenCenter;
              _FormGrade.Caption := 'Informe a grade que deseja adicionar';
              Panel_Grade.Parent := _FormGrade;
              _FormGrade.AutoSize := True;
              _FormGrade.AutoScroll := False;
              _FormGrade.KeyPreview := True;
              _FormGrade.BorderIcons := [biSystemMenu];
              _FormGrade.Width := 706;
              _FormGrade.Height := 393;

              Edit_ProdutoGrade.Text := _objBalanco.dataSet.FieldByName('DESCR_PROD').AsString;
              _vBotaoOKGrade := false;
  //            Informar grade
              if (CheckBox_EmitirSom.Checked) then
              begin
                PlaySound(Pchar('grade.wav'), 0, SND_ASYNC);
              end;
              _FormGrade.ShowModal;
              vnomegrade := ' GRADE:' + _objBalanco._vVisGrade.dataSet.FieldByName('DESCRICAO').AsString;
              if (not (_vBotaoOKGrade)) and (not (_objBalanco._vGradeBalanco.dataSet.IsEmpty)) then
              begin
                raise Exception.create('É preciso informar a grade para prosseguir');
              end
              else if (_vBotaoOKGrade) and (_objBalanco._vGradeBalanco.dataSet.IsEmpty) then
              begin
                //aqui vai testar se ja foi contado algum sem grade e dar a mensagem de erro caso ja tenha sido
                // o usuario deverá zerar a contagem deste produto e refazela com a grade
                if _objBalanco.existeProdutoContadoSemGrade(
                  _objBalanco.dataSet.FieldByName('GRUPO_PROD').AsInteger,
                  _objBalanco.dataSet.FieldByName('COD_PROD').AsString,
                  _objBalanco._vVisGrade.dataSet.FieldByName('COD_GRADE').AsInteger) then
                  raise Exception.create('Produto já foi contado! É preciso zerar a contagem deste produto para vincular uma grade')
                else
                begin
                  if _objBalanco.inserirProdutoContadoSemGrade(
                    _objBalanco.dataSet.FieldByName('GRUPO_PROD').AsInteger,
                    _objBalanco.dataSet.FieldByName('COD_PROD').AsString,
                    _objBalanco._vVisGrade.dataSet.FieldByName('COD_GRADE').AsInteger) then
                  begin
                    _objBalanco._vGradeBalanco._AbreGradeBalancoGrupo(
                      _objBalanco.dataSet.FieldByName('COD_PROD').AsString,
                      IntToStr(_objBalanco.dataSet.FieldByName('GRUPO_PROD').AsInteger));
                  end;
                end;
              end
              else if (_vBotaoOKGrade) and (ckSemprePedirGrade.Checked) then
              begin
                //inserindo a grade na tablea cod_grade_prod caso necessario
                if _objBalanco.inserirProdutoContadoSemGrade(
                  _objBalanco.dataSet.FieldByName('GRUPO_PROD').AsInteger,
                  _objBalanco.dataSet.FieldByName('COD_PROD').AsString,
                  _objBalanco._vVisGrade.dataSet.FieldByName('COD_GRADE').AsInteger) then
                begin
                  _objBalanco._vGradeBalanco._AbreGradeBalancoGrupo(
                    _objBalanco.dataSet.FieldByName('COD_PROD').AsString,
                    IntToStr(_objBalanco.dataSet.FieldByName('GRUPO_PROD').AsInteger));
                end;
              end;

            finally
              Panel_Grade.Parent := TabSheet_Grade;
              _FormGrade.Free;
              _FormGrade := nil;
            end;
          end;

          _objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[3] :=
            _objBalanco._vVisGrade.dataSet.FieldByName('GRUPO_PROD').AsString;
          _objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[0] :=
            _objBalanco._vVisGrade.dataSet.FieldByName('COD_PROD').AsString;
          _objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[2] :=
            _objBalanco._vVisGrade.dataSet.FieldByName('COD_GRADE').AsString;

          MaskEdit_grupo.Text := _objBalanco._vVisGrade.dataSet.FieldByName('GRUPO_PROD').AsString;
	        MaskEdit_codprod.Text := _objBalanco._vVisGrade.dataSet.FieldByName('COD_PROD').AsString;

          _objBalanco._vVisGrade.dataSet.Filtered := False;
          _objBalanco._vVisGrade.dataSet.Filter := '';

//          Verificar e preencher lista se produto com grade  foi contado
          if (_objBalanco._vGradeContadosBalanco._AbreGradeContBalanco(
            _objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[3],
            _objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[0],
            _objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[2])) then
          begin
            _objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[3] :=
              _objBalanco._vGradeContadosBalanco.dataSet.FieldByName('GRUPO_PROD').AsString;
            _objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[0] :=
              _objBalanco._vGradeContadosBalanco.dataSet.FieldByName('COD_PROD').AsString;
            _objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[2] :=
              _objBalanco._vGradeContadosBalanco.dataSet.FieldByName('COD_GRADE').AsString;

            MaskEdit_grupo.Text := _objBalanco._vGradeContadosBalanco.dataSet.FieldByName('GRUPO_PROD').AsString;
		        MaskEdit_codprod.Text := _objBalanco._vGradeContadosBalanco.dataSet.FieldByName('COD_PROD').AsString;
          end;
        end;
      end
      else
      begin
        _objBalanco._vGradeContadosBalanco._AbreGradeContBalanco(
          _objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[3],
          _objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[0],
          _objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[2]);
      end;


// Preenche Itens Form
      MaskEdit_Descricao.Text := trim(_objBalanco.dataSet.FieldByName('DESCR_PROD').AsString) +
        vnomegrade;
      MaskEdit_AlocProd1.Text :=
        _objBalanco.dataSet.FieldByName('LOCACAO_PROD').AsString;
      MaskEdit_AlocProd2.Text :=
        _objBalanco.dataSet.FieldByName('LOCACAO_PROD_1').AsString;
      Label_Descricao.Refresh;
      Label_Locacao.Refresh;

//    Verificar se produto ja foi contado
      if not (_objBalanco._vContadoBalanco._AbreContado(
        _objBalanco.dataSet.FieldByName('COD_PROD').AsString,
        _objBalanco.dataSet.FieldByName('GRUPO_PROD').AsString
        )) then
      begin
        Edit_Contado.Text := '0';
        MaskEdit_AlocInfo1.Text := '';
        MaskEdit_AlocInfo2.Text := '';
      end
      else
      begin
        Edit_Contado.Text :=
          _objBalanco._vContadoBalanco.dataset.FieldByName('QTDE_PROD').AsString;
        MaskEdit_AlocInfo1.Text :=
          _objBalanco._vContadoBalanco.dataset.FieldByName('LOCACAO1_PROD').AsString;
        MaskEdit_AlocInfo2.Text :=
          _objBalanco._vContadoBalanco.dataset.FieldByName('LOCACAO2_PROD').AsString;

//      Verfica se o produto tem grade
        if (not (_objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[2] = '')) then
        begin
          if ((not (_objBalanco._InserirUmOuQtdeGrade)) and
            (not (Application.MessageBox('Este produto já foi contado deseja prosseguir?',
            'Confirmação', MB_YESNO +
            MB_ICONQUESTION + MB_DEFBUTTON1) = IDYES))) then
          begin
          	if (Self.Enabled) and (Self.Visible) and (MaskEdit_produto.CanFocus) then
            	MaskEdit_produto.SetFocus;
            exit;
          end;
        end
        else
        begin
          if ((not (_objBalanco._InserirUmOuQtdeProduto)) and
            (not (Application.MessageBox('Este produto já foi contado deseja prosseguir?',
            'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IDYES))) then
          begin
            if (Self.Enabled) and (Self.Visible) and (MaskEdit_produto.CanFocus) then
            	MaskEdit_produto.SetFocus;
            exit;
          end;
        end;
      end;

      if (_objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[2] = '') then
      begin
        _objBalanco._vGradeBalanco._AbreGradeBalancoGrupo(
          _objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[0],
          _objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[3]);
      end
      else
      begin
        _objBalanco._vGradeBalanco._AbreGradeBalanco(
          _objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[0],
          _objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[2]);
        {2}
      end;

//   Verificar configuracao passar todos os produtos ou um de cada vez, para os produtos que tem grade
         // Inserir variável na empresa _InserirUmOuQtde
//      if ((_objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[2] = '') and
//        (_objBalanco._InserirUmOuQtdeProduto)) then
//      begin
//        MaskEdit_Quantidade.Text := _objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[4];// '1';
//      end;
//
//      if (not (_objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[2] = '') and
//        (_objBalanco._InserirUmOuQtdeGrade)) then
//        MaskEdit_Quantidade.Text := _objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[4];//'1';
       if ((_objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[2] = '') or (_objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[2] = '0'))
       	 and (_objBalanco._InserirUmOuQtdeProduto) then
       begin
       	 if _objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL.Count > 4 then
         	 MaskEdit_Quantidade.Text := _objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[4];
       end;

       if (_objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[2] <> '')
       	 and (_objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[2] <> '0')
       	 and (_objBalanco._InserirUmOuQtdeGrade) then
       begin
	       if _objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL.Count > 4 then
	         MaskEdit_Quantidade.Text := _objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[4];
       end;

      Edit_ReqOs.Text := FloatToStr(_objBalanco._PegarReqOs(
        _objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[0],
        _objBalanco.dataSet.FieldByName('GRUPO_PROD').AsString));

      if not (_objBalanco._vGradeBalanco.dataSet.IsEmpty) then
      begin
        Edit_EstGrade.Text :=
          _objBalanco._vGradeBalanco.dataSet.FieldByName('QTDE').AsString;
        Label_EstGrade.Visible := True;
        Edit_EstGrade.Visible := true;

        Edit_Estoque.Text := FloatToStr(
          StrToFloat(_objBalanco._vGradeBalanco._QtdGradeBalanco(
          _objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[0],
          _objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[3]))
          //_objBalanco._vGradeBalanco.dataSet.FieldByName('QTDE').Asfloat
          -
          strtofloat(Edit_ReqOs.Text));

      end
      else
      begin
        Label_EstGrade.Visible := false;
        Edit_EstGrade.Visible := false;
        Edit_EstGrade.Text := '0';
        Edit_Estoque.Text := FloatToStr(
          _objBalanco.dataSet.FieldByName('EST_F').AsFloat -
          strtofloat(Edit_ReqOs.Text));
      end;

      if (not (_objBalanco._ItensProd_CodCodbarraCodGradeGrupo_SL[2] = '')) then
      begin
        if _objBalanco._InserirUmOuQtdeGrade then
          BitBtn_IncluirClick(Sender);
      end
      else
      begin
        if _objBalanco._InserirUmOuQtdeProduto then
          BitBtn_IncluirClick(Sender);
      end;


    except on E: Exception
      do
      begin
        _ZerarForm;
        if (CheckBox_EmitirSom.Checked) then
        begin
          PlaySound(Pchar('erro.wav'), 0, SND_ASYNC);
        end;
        if not (E.MESSAGE = '') then
        begin
          MessageDlg(E.Message, mtError, [mbOK], 0);
          vDadosIni.registraErro(E.MESSAGE);
        end;
        if (Self.Enabled) and (Self.Visible) and (MaskEdit_produto.CanFocus) then
        	MaskEdit_produto.SetFocus;
      end;
    end;
  finally
    _objBalanco.vCodBarra := trim(MaskEdit_produto.Text);
  end;
end;

procedure TfrmBalanco.MaskEdit_produtoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = vk_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
      if vDadosIni.vPesquisa <> '' then
        MaskEdit_produto.text := vDadosIni.vPesquisa;
      if trim(vDadosIni.vPesquisaCod_prod) <> '' then
        MaskEdit_grupo.text := vDadosIni.vPesquisaGrupo_prod;
      if trim(vDadosIni.vPesquisaCod_prod) <> '' then
        MaskEdit_codprod.text := vDadosIni.vPesquisaCod_prod;
      _objBalanco.vCodBarra := trim(MaskEdit_produto.Text);
    finally
      Screen.Cursor := crDefault;
    end;
  end;

end;

procedure TfrmBalanco.MaskEdit_produtolocalizarChange(Sender: TObject);
begin
  inherited;
	if (trim(MaskEdit_produtolocalizar.Text) <> '') then
  begin
    _objBalancoReg.IndexFieldNames := 'COD_BARRA';
    _objBalancoReg.FindNearest([trim(MaskEdit_produtolocalizar.Text)]);
  end
  else
  begin
    begin
      _objBalancoReg.IndexFieldNames := 'COD_BARRA';
      _objBalancoReg.FindNearest(['']);
    end;
  end;
end;

procedure TfrmBalanco.MaskEdit_QuantidadeExit(Sender: TObject);
begin
  inherited;
  if length(trim(MaskEdit_Quantidade.text)) > 15 then
  begin
    messagedlg('Quantidade Invalida', mtinformation, [mbOK], 0);
    if (Self.Enabled) and (Self.Visible) and (MaskEdit_Quantidade.CanFocus) then
    	MaskEdit_Quantidade.setfocus;
  end;
  if ((not (BitBtn_Incluir.visible))) then
    BitBtn_IncluirClick(Sender);
end;

procedure TfrmBalanco.Panel_GradeEnter(Sender: TObject);
begin
  inherited;
  _objBalanco._vVisGrade.dataSet.Filtered := False;
  _objBalanco._vVisGrade.dataSet.Filter := ''; 
  EditLocalizarGrade.Clear;
  if _objBalanco._vVisGrade.dataSet.RecordCount >= 10 then
  begin
    if (Self.Enabled) and (Self.Visible) and (EditLocalizarGrade.CanFocus) then
      EditLocalizarGrade.SetFocus;
  end
  else if (Self.Enabled) and (Self.Visible) and (DBGrid_Grade.CanFocus) then
    DBGrid_Grade.SetFocus;
end;

procedure TfrmBalanco.RadioButton_RelProdNaoContClick(Sender: TObject);
begin
  inherited;
  RadioGroup1.Visible := RadioButton_RelProdNaoCont.Checked or RadioButton_RelProdEstDif.Checked;
end;

procedure TfrmBalanco.RadioButton_TranfArqBalancoClick(Sender: TObject);
begin
  inherited;
  RadioButton_TranfArqBalanco.Caption := 'Transferir arquivo do balanço para pasta:';
  MaskEdit_Pasta.Visible := true;

  if (Self.Enabled) and (Self.Visible) and (MaskEdit_Pasta.CanFocus) then
    MaskEdit_Pasta.SetFocus;
end;

procedure TfrmBalanco.TabSheet_ConfEnter(Sender: TObject);
begin
  inherited;
  // ShowMessage('teste');
end;

procedure TfrmBalanco.TabSheet_ConfShow(Sender: TObject);
begin
  inherited;
  //ShowMessage('teste');
end;

procedure TfrmBalanco.TabSheet_ContagemEnter(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (MaskEdit_produto.CanFocus) then
  	MaskEdit_produto.SetFocus;
end;

procedure TfrmBalanco._CampoVazio(Campo: TMaskEdit);
begin
  if (trim(Campo.Text) = '') then
  begin
    raise Exception.Create('');
  end;
end;

procedure TfrmBalanco._DigitosSuperior;
begin
  if (Length(trim(MaskEdit_produto.Text)) > 14) then
  begin
  	if (Self.Enabled) and (Self.Visible) and (MaskEdit_produto.CanFocus) then
    	MaskEdit_produto.setfocus;
    raise Exception.Create('Código possui mais que 14 dígitos');
  end;
end;

procedure TfrmBalanco._MudarPaginaFoco;
begin
  if ((ActiveControl = BitBtn_MudarPagina) or (ActiveControl = TabSheet_Conf)) then
  begin
    MaskEdit_produto.Text := '';
    raise Exception.Create('');
    exit;
  end;
end;

procedure TfrmBalanco._QtdZerada;
begin
  if (trim(MaskEdit_Quantidade.Text) = '0') then
  begin
  	if (Self.Enabled) and (Self.Visible) and (MaskEdit_produto.CanFocus) then
    	MaskEdit_produto.setfocus;
    raise Exception.Create('Quantidade zerada');
  end;
end;

procedure TfrmBalanco._ZerarForm;
begin
  Edit_Contado.Text := '0';
  MaskEdit_AlocProd1.Text := '';
  MaskEdit_AlocProd2.Text := '';
  MaskEdit_AlocQtd1.Text := '';
  MaskEdit_AlocQtd2.Text := '';
  MaskEdit_Descricao.Text := '';
  MaskEdit_produto.Text := '';
  MaskEdit_grupo.Text := '';
  MaskEdit_codprod.Text := '';
  MaskEdit_AlocInfo1.Text := '';
  MaskEdit_AlocInfo2.Text := '';
  Edit_Estoque.Text := '0';
  Edit_ReqOs.Text := '0';
  MaskEdit_Quantidade.Text := '';
  Edit_EstGrade.Text := '0';
end;

procedure TfrmBalanco.teste;
begin

end;

initialization
  RegisterClass(TfrmBalanco);
finalization
  UnRegisterClass(TfrmBalanco);

end.

