unit Hw.Tray.Servicos;

interface

uses
  System.Classes,
  System.DateUtils,
  uClasseConexao,
  Winapi.Windows,
  HW.Servicos,
  HW.Tray.Api.Consumo,
  HW.Tray.Api.Category,
  HW.Tray.Api.Variant,
  HW.Tray.Api.Brand,
  HW.Tray.Api.Product,
  Hw.Tray.Api.Kit,
  HW.Tray.Api.Property_,
  HW.Tray.Api.Image,
  HW.Tray.Api.Rest, IBX.IBQuery;

const
  TRAY_SERV_TOKEN_API       = 'tray_api_access_token';

  tbCategoria = 'CATEGORIA';
  tbMarca     = 'MARCA_PROD';
  tbGrade     = 'GRADE';
  tbProduto   = 'PRODUTOS';
  tbKitProduto= 'KITS_PROD';
  tbProdutoKit= 'KITS_PROD_KITS';

type

  THwTrayServicos = class(THwServicos)
  private
    trayConsumeApi  : TTrayConsumeApi;
    AllProdutosKit  : TConexao_OOP;
    AllVariacoes    : TConexao_OOP;
    AllGrades       : TConexao_OOP;
    AllSincProd     : TConexao_OOP;
    AllSincMarca    : TConexao_OOP;
    AllSincCategoria: TConexao_OOP;
    AllSincKitProd  : TConexao_OOP;
    AllImages       : TConexao_OOP;
    FUsuario        : string;
    ArrayStr        : TArray<string>;

    procedure AfterLogin(Sender: TObject);
    function ResolverImagensProduto(produto: TProductHw): TProductHw;
    function ResolverImagensKitProduto(kitproduto: TKitsProdHw): TKitsProdHw;
    function ReduceArray(value: TArray<string>; stringLimit: Integer; const separator: string = ','): TArray<string>;
  protected
    function GetDadosApi: Boolean; override;
    //function UrlImagensResolver(LocalList, UrlList: TStrings; PathImgs: string; var UpdateImagens: Boolean): TStrings;

  public
    constructor Create(SilentMode: Boolean); override;
    destructor Destroy; override;
    procedure Inicializar;

    function GenCodigo(Tabela: string; buscas: TIBQuery; codemp: string): Integer;

    // Consumo Api
    function GetList<T: class, constructor>(controller, name: string; params: TArray<string>): TArray<T>;
    function GetConsulta(controller, name: string; params: TArray<string>): TTrayConsulta;
    function Delete(controller: string): boolean;

    //Do Banco de dados
    function ConcederPermissoesTabelasViews: boolean;

    // produtos
    function GetProdutos(prodOOP: TConexao_OOP; pIds: string): TConexao_OOP; overload;
    function GetProdutos(prodOOP: TConexao_OOP; onlySinc: Boolean; withImages: Boolean = True): TConexao_OOP; overload;
    function GetProdutos(prodOOP: TConexao_OOP; campo, condicao, texto: string): TConexao_OOP; overload;
    function ResolverProdutos(trayProdutos: TArray<TProduct>; trayCategorias: TArray<TCategory>): TArray<TProductHw>;
    function ResolverProdutosHw(prodOOP: TConexao_OOP; trayProdutos: TArray<TProduct>): TArray<TProductHw>;
    function ResolverProduto(trayProduto: TProduct): TProductHw;
    function ResolverProdutoHw(prodOOP: TConexao_OOP; trayProdutos: TArray<TProduct>): TProductHw;
    function VincularProduto(trayProduto: TProduct; hwGrupoProd: Integer; hwCodProd: string;
      hwAltura_prod: Double; hwComprimento_prod: Double;
      hwLargura_prod: Double; hwPeso_brut_prod: Double;
      hwPeso_liq_prod: Double): Boolean;
    function DesvincularProduto(hwGrupoProd: Integer; hwCodProd: string): Boolean;
    function ReenviarImagensProduto(pId: Integer; pGerarUrl: boolean): boolean;

    // kitprodutos
    function GetKitProdutos(kitprodOOP: TConexao_OOP; onlySinc: Boolean; withImages: Boolean = True): TConexao_OOP; overload;
    function GetKitProdutos(kitprodOOP: TConexao_OOP; campo, condicao, texto: string): TConexao_OOP; overload;
    function ResolverKitProdutos(trayKitProdutos: TArray<TProduct>; trayCategorias: TArray<TCategory>): TArray<TKitsProdHw>;
    function ResolverKitProdutosHw(kitprodOOP: TConexao_OOP; trayKitProdutos: TArray<TProduct>): TArray<TKitsProdHw>;
    function ResolverKitProduto(trayKitProduto: TProduct): TKitsProdHw;
    function ResolverKitProdutoHw(kitprodOOP: TConexao_OOP; trayKitProdutos: TArray<TProduct>): TKitsProdHw;
    function VincularKitProduto(trayKitProduto: TProduct; hwCodigoKit: Integer): Boolean;
    function DesvincularKitProduto(hwCodigoKit: Integer): Boolean;
    function ReenviarImagensKitProduto(pId: Integer; pGerarUrl: boolean): boolean;

    // productkit
    function GetProdutosKit(pId: Integer): TConexao_OOP;
    function ResolverProdutosKits(trayProdutosKit: TArray<TProductKit>; trayProdutos: TArray<TProduct>): TArray<TProductKitHw>;
    function ResolverProdutosKitsHw(trayProdutosKit: TArray<TProductKit>): TArray<TProductKitHw>;
    function VincularProdutoKit(trayProdutoKit: TProductKit;
      hwCodigoKit: Integer; hwGrupoProd: Integer; hwCodProd: string): Boolean;
    function DesvincularProdutoKit(hwCodigoKit: Integer; hwGrupoProd: Integer; hwCodProd: string): Boolean;

    function utilizaImagemERP(pGrupoProd: Integer; pCodProd: string; pCodigoKit: Integer): boolean;
    function adicionarImagemEC(pGrupoProd: Integer; pCodProd: string; pCodigoKit: Integer; product: TProduct; variacoes: TArray<TVariant>): boolean;
    function abreFormImagem(pGrupoProd: Integer; pCodProd: string; pCodigoKit: Integer; product: TProduct; variacoes: TArray<TVariant>): boolean;


    function _LerConfiguracoesRegistroInteger(NomeVariavel : string; Adefault: Integer = 0) : Integer;
    procedure _GravaConfiguracoesInteger(NomeVariavel : string; Valor : Integer);

    // marcas
    function GetMarcas(marcaOOP: TConexao_OOP; pIds: string): TConexao_OOP; overload;
    function GetMarcas(marcaOOP: TConexao_OOP; onlySinc: Boolean; withImages: Boolean = True): TConexao_OOP; overload;
    function GetMarcas(marcaOOP: TConexao_OOP; campo, condicao, texto: string): TConexao_OOP; overload;
    function ResolverMarcas(trayMarcas: TArray<TBrand>): TArray<TBrandHw>;
    function ResolverMarcasHw(marcaOOP: TConexao_OOP; trayMarcas: TArray<TBrand>): TArray<TBrandHw>;
    function ResolverMarca(trayMarca: TBrand): TBrandHw;
    function VincularMarca(trayMarca: TBrand; hwId: Integer): Boolean;
    function DesvincularMarca(hwId: Integer): Boolean;
    function CadastrarMarca(trayMarcas: TArray<TBrand>): Boolean;

    // categorias
    function GetCategorias(categoriaOOP: TConexao_OOP; pIds: string): TConexao_OOP; overload;
    function GetCategorias(categoriaOOP: TConexao_OOP; onlySinc: Boolean): TConexao_OOP; overload;
    function GetCategorias(categoriaOOP: TConexao_OOP; campo, condicao, texto: string): TConexao_OOP; overload;
    function ResolverCategorias(trayCategorias: TArray<TCategory>; parentId: string; Level: SmallInt; current: TArray<TCategoryMescladaHw>): TArray<TCategoryMescladaHw>;
    function ResolverCategoriasHw(categoriaOOP: TConexao_OOP; trayCategorias: TArray<TCategory>; parentId: Integer; Level: SmallInt; current: TArray<TCategoriaHw>): TArray<TCategoriaHw>;
    function VincularCategoria(trayCategoria: TCategory; hwId: Integer): Boolean;
    function DesvincularCategoria(hwId: Integer): Boolean;
    function CadastrarCategoria(trayCategorias: TArray<TCategory>): Boolean;

    //grades
    function GetGrades(): TConexao_OOP;
    function VincularGrade(trayGrade: TPropertyWithValueHw; Primaria: Boolean; hwId: Integer): Boolean;
    function DesvincularGrade(Primaria: Boolean; hwId: Integer): Boolean;
    function CadastrarGrade(pDataset: TConexao_OOP): Boolean; overload;
    function CadastrarGrade(trayGrades1, trayGrades2: TArray<TPropertyWithValueHw>): Boolean; overload;

    // variação
    function GetVariacoes(trayVariacoes: TArray<TVariant>;
      pGrupoProd: Integer; pCodProd: string;
      pTipoEc: string; pTipoEc1: string; pId: Integer): TConexao_OOP;
    function ResolverVariacoes(trayVariacoes: TArray<TVariant>): TArray<TVariantHw2>;
    function ResolverVariacoesHw(trayVariacoes: TArray<TVariant>; tipoec: string; tipoec1: string): TArray<TVariantHw2>;
    function CadastrarGradeVariacao(pDataset: TConexao_OOP): Boolean;
    function AdicionarGradeVariacao(pDataset: TConexao_OOP; pGrupoProd: Integer; pCodProd: string): Boolean;


    property Usuario: string read FUsuario write FUsuario;
  var
    testarImagem: boolean;
  end;

implementation

uses
  hw_progress_utils,
  System.SysUtils,
  System.StrUtils,
  Hw.Tray.Api.Url,
  hw_utils,
  hw_audit_utils,
  marca_prod_class,
  categoria_class,
  grade_class,
  tipo_grade_ec_class,
  config_sistema_class,
  HW.Utils.Classes.Rtti,
  HW.Utils.Classes.Registros_DX,
  HW.Json, Vcl.Forms, Hw.Tray.Api.Form.Cadastros, cod_grade_prod_class,
  produtos_ec_class, produtos_ec_grade_class, System.Variants,
  Hw.Tray.Api.Form.Padrao, System.Win.Registry, marca_prod_ec_class,
  Vcl.Dialogs;

function _getMd5File(FileName: WideString): WideString; stdcall; external 'MD5XE3.dll';

{ THwTrayServicos }

function THwTrayServicos.CadastrarGradeVariacao(pDataset: TConexao_OOP): Boolean;
var
 hwGrade: Tgrade_class;
 hwCodGradeProd: TCod_grade_prod_class2;
 hwGrades, hwGradesCad: TArray<Tgrade_class>;
 hwCodGradeProds, hwCodGradeProdCad: TArray<TCod_grade_prod_class2>;

 hwTipoGrade: TTipo_grade_ec_class;
 hwTipoGrades, hwTipoGradesCad: TArray<TTipo_grade_ec_class>;

 hwTipoGrade1: TTipo_grade_ec_class;
 hwTipoGrades1, hwTipoGradesCad1: TArray<TTipo_grade_ec_class>;

 vCadastrarGrade: boolean;

 vListaTipoGrade: TStringList;
 vListaTipoGrade1: TStringList;

 tipo_ec, descricao_ec, tipo_ec1, descricao_ec1: string;
 str: string;
 I: Integer;
begin
  Result := True;
  vCadastrarGrade := false;

  vListaTipoGrade := TStringList.Create;
  vListaTipoGrade.Clear;
  vListaTipoGrade.Sorted     := True;
  vListaTipoGrade.Duplicates := dupIgnore;

  vListaTipoGrade1 := TStringList.Create;
  vListaTipoGrade1.Clear;
  vListaTipoGrade1.Sorted     := True;
  vListaTipoGrade1.Duplicates := dupIgnore;

  if not conectar(DataBasePath, True)  then
     Exit;

  try
    try
      hwGrades := [];
      pDataset.First;
      while not pDataset.Eof do
      begin
        if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec').AsString)) = 'CORES' then
          vListaTipoGrade.Add('COR')
        else if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec').AsString)) = 'COR' then
          vListaTipoGrade.Add('COR')
        else if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec').AsString)) = 'GÊNERO' then
          vListaTipoGrade.Add('GÊNERO')
        else if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec').AsString)) = 'TAMANHO' then
          vListaTipoGrade.Add('TAMANHO')
        else if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec').AsString)) = 'VOLTAGEM' then
          vListaTipoGrade.Add('VOLTAGEM')
        else if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec').AsString)) <> '' then
          vListaTipoGrade.Add(trim(pDataset.DataSet.FieldByName('tipo_ec').AsString).Substring(0, 100));

        if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec1').AsString)) = 'CORES' then
          vListaTipoGrade1.Add('COR')
        else if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec1').AsString)) = 'COR' then
          vListaTipoGrade1.Add('COR')
        else if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec1').AsString)) = 'GÊNERO' then
          vListaTipoGrade1.Add('GÊNERO')
        else if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec1').AsString)) = 'TAMANHO' then
          vListaTipoGrade1.Add('TAMANHO')
        else if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec1').AsString)) = 'VOLTAGEM' then
          vListaTipoGrade1.Add('VOLTAGEM')
        else if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec1').AsString)) <> '' then             
          vListaTipoGrade1.Add(trim(pDataset.DataSet.FieldByName('tipo_ec1').AsString).Substring(0, 100));

        hwGrade               := TGrade_class.Create;
        if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec').AsString)) = 'CORES' then
          hwGrade.tipo_ec     := 'COR'
        else if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec').AsString)) = 'COR' then
          hwGrade.tipo_ec     := 'COR'
        else if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec').AsString)) = 'GÊNERO' then
          hwGrade.tipo_ec     := 'GÊNERO'
        else if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec').AsString)) = 'TAMANHO' then
          hwGrade.tipo_ec     := 'TAMANHO'
        else if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec').AsString)) = 'VOLTAGEM' then
          hwGrade.tipo_ec     := 'VOLTAGEM'
        else
          hwGrade.tipo_ec     := trim(pDataset.DataSet.FieldByName('tipo_ec').AsString).Substring(0, 100);
        hwGrade.descricao_ec  := trim(pDataset.DataSet.FieldByName('descricao_ec').AsString).Substring(0, 100);

        if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec1').AsString)) = 'CORES' then
          hwGrade.tipo_ec1    := 'COR'
        else if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec1').AsString)) = 'COR' then
          hwGrade.tipo_ec1    := 'COR'
        else if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec1').AsString)) = 'GÊNERO' then
          hwGrade.tipo_ec1    := 'GÊNERO'
        else if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec1').AsString)) = 'TAMANHO' then
          hwGrade.tipo_ec1    := 'TAMANHO'
        else if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec1').AsString)) = 'VOLTAGEM' then
          hwGrade.tipo_ec1    := 'VOLTAGEM'
        else
          hwGrade.tipo_ec1    := trim(pDataset.DataSet.FieldByName('tipo_ec1').AsString).Substring(0, 100);
        hwGrade.descricao_ec1 :=trim(pDataset.DataSet.FieldByName('descricao_ec1').AsString).Trim.Substring(0, 100);
        hwGrades := hwGrades + [hwGrade];

        pDataset.Next;
      end;

      for hwGrade in hwGrades do
        with ClientOOP(' select g.descricao, g.descricao1, g.ativo from grade g ' +
                   ' where trim(g.tipo_ec) = %s and trim(g.descricao_ec) = %s ' +
                   ' and trim(coalesce(g.tipo_ec1, '''')) = %s and trim(coalesce(g.descricao_ec1, '''')) = %s ' +
                   ' and g.cod_empresa = %d ' +
                   ' union ' +
                   ' select g.descricao, g.descricao1, g.ativo from grade g ' +
                   ' where upper(trim(g.tipo_ec)) = %s and trim(g.descricao_ec) = %s ' +
                   ' and upper(trim(coalesce(g.tipo_ec1, ''''))) = %s and trim(coalesce(g.descricao_ec1, '''')) = %s ' +
                   ' and g.cod_empresa = %d ',
                   [hwGrade.tipo_ec.Trim.QuotedString, hwGrade.descricao_ec.Trim.QuotedString,
                    hwGrade.tipo_ec1.Trim.QuotedString, hwGrade.descricao_ec1.Trim.QuotedString, CodEmpresa,
                    hwGrade.tipo_ec.ToUpper.Trim.QuotedString, hwGrade.descricao_ec.Trim.QuotedString,
                    hwGrade.tipo_ec1.ToUpper.Trim.QuotedString, hwGrade.descricao_ec1.Trim.QuotedString, CodEmpresa]) do

          if not IsEmpty then
          begin
            ShowAtencao('Já existe uma variação (grade) no banco com mesma tipo e descrição.' + #13 + #13 +
              'Variação tipo : ' + hwGrade.tipo_ec.Trim + ' - ' + hwGrade.descricao_ec.Trim + #13 +
              IfThen(hwGrade.tipo_ec1.Trim <> '',
              'Variação tipo1: ' + hwGrade.tipo_ec1.Trim + ' - ' + hwGrade.descricao_ec1.Trim + #13) +
              'Lixeira: ' + IfThen(fequals('ativo', '1'), 'Não', 'Sim'));
            exit;
          end;

      hwGradesCad := [];
      hwTipoGradesCad1 := [];
      hwGradesCad      := [];

      for I := 0 to vListaTipoGrade.Count - 1 do
      begin
        if SqlOpen(' select t.descricao from tipo_grade_ec t' +
                   ' where trim(t.descricao) = %s' +
                   ' and t.cod_empresa = %d ' +
                   ' union ' +
                   ' select t.descricao from tipo_grade_ec t' +
                   ' where upper(trim(t.descricao)) = %s' +
                   ' and t.cod_empresa = %d ',
                   [vListaTipoGrade[I].Trim.Substring(0, 100).QuotedString,
                    CodEmpresa,
                    vListaTipoGrade[I].ToUpper.Trim.Substring(0, 100).QuotedString,
                    CodEmpresa]).IsEmpty then
        begin
          hwTipoGrade            := TTipo_grade_ec_class.Create;
          hwTipoGrade.descricao  := vListaTipoGrade[I].Trim.Substring(0, 100);
          hwTipoGrades := hwTipoGrades + [hwTipoGrade];

          hwTipoGradesCad := hwTipoGradesCad + [hwTipoGrade];
        end;
      end;

      for I := 0 to vListaTipoGrade1.Count - 1 do
      begin
        if SqlOpen(' select t.descricao from tipo_grade_ec t' +
                   ' where trim(t.descricao) = %s' +
                   ' and t.cod_empresa = %d ' +
                   ' union ' +
                   ' select t.descricao from tipo_grade_ec t' +
                   ' where upper(trim(t.descricao)) = %s' +
                   ' and t.cod_empresa = %d ',
                   [vListaTipoGrade1[I].Trim.Substring(0, 100).QuotedString,
                    CodEmpresa,
                    vListaTipoGrade1[I].ToUpper.Trim.Substring(0, 100).QuotedString,
                    CodEmpresa]).IsEmpty then
        begin
          hwTipoGrade1            := TTipo_grade_ec_class.Create;
          hwTipoGrade1.descricao  := vListaTipoGrade1[I].Trim.Substring(0, 100);
          hwTipoGrades1 := hwTipoGrades1 + [hwTipoGrade1];

          hwTipoGradesCad1 := hwTipoGradesCad1 + [hwTipoGrade1];
        end;
      end;

      for hwGrade in hwGrades do
        if SqlOpen(' select g.descricao, g.descricao1, g.ativo from grade g ' +
                   ' where trim(g.tipo_ec) = %s and trim(g.descricao_ec) = %s ' +
                   ' and trim(coalesce(g.tipo_ec1, '''')) = %s and trim(coalesce(g.descricao_ec1, '''')) = %s ' +
                   ' and g.cod_empresa = %d ' +
                   ' union ' +
                   ' select g.descricao, g.descricao1, g.ativo from grade g ' +
                   ' where upper(trim(g.tipo_ec)) = %s and trim(g.descricao_ec) = %s ' +
                   ' and upper(trim(coalesce(g.tipo_ec1, ''''))) = %s and trim(coalesce(g.descricao_ec1, '''')) = %s ' +
                   ' and g.cod_empresa = %d ',
                   [hwGrade.tipo_ec.Trim.QuotedString, hwGrade.descricao_ec.Trim.QuotedString,
                    hwGrade.tipo_ec1.Trim.QuotedString, hwGrade.descricao_ec1.Trim.QuotedString, CodEmpresa,
                    hwGrade.tipo_ec.ToUpper.Trim.QuotedString, hwGrade.descricao_ec.Trim.QuotedString,
                    hwGrade.tipo_ec1.ToUpper.Trim.QuotedString, hwGrade.descricao_ec1.Trim.QuotedString, CodEmpresa]).IsEmpty then
      begin
        vCadastrarGrade := true;
        hwGradesCad := hwGradesCad + [hwGrade];
      end;

      if not vCadastrarGrade then
      begin
        ShowAtencao('Todas variações (grades) selecionadas já foram cadastradas');
        Result := false;
        Exit;
      end;

      for I := 0 to vListaTipoGrade.Count - 1 do
      begin
        hwTipoGrade.descricao    := vListaTipoGrade[I];
        hwTipoGrade.ativo        := 1;
        hwTipoGrade.cod_empresa  := CodEmpresa;
        SqlExec(hwTipoGrade.SQLMotor('cod_tipo').SQLInsertAutoInc).Transaction;
      end;

      for I := 0 to vListaTipoGrade1.Count - 1 do
      begin
        hwTipoGrade1.descricao   := vListaTipoGrade1[I];
        hwTipoGrade1.ativo       := 1;
        hwTipoGrade1.cod_empresa := CodEmpresa;
        SqlExec(hwTipoGrade1.SQLMotor('cod_tipo').SQLInsertAutoInc).Transaction;
      end;

      ArrayStr := [];
      for hwGrade in hwGradesCad do
      begin
        hwGrade.descricao   := (hwGrade.tipo_ec.Trim  + ' ' + hwGrade.descricao_ec.Trim).ToUpper;
        hwGrade.descricao1  := (hwGrade.tipo_ec1.Trim + ' ' + hwGrade.descricao_ec1.Trim).Trim.ToUpper;
        hwGrade.cod_empresa := CodEmpresa;
        hwGrade.ativo       := 1;
        SqlExec(hwGrade.SQLMotor('cod_grade').SQLInsertAutoInc).Transaction;

        ArrayStr := ArrayStr + [IfThen(hwGrade.descricao1.IsEmpty, 'Simples', 'Dupla') + ' ' + hwGrade.tipo_ec + ' ' + hwGrade.descricao_ec +
                                IfThen(not hwGrade.descricao1.IsEmpty, ' - ' + hwGrade.tipo_ec1 + ' ' + hwGrade.descricao_ec1)];
      end;

      if Transacao.InTransaction then
        Transacao.Commit;

      Result := True;

      ArrayStr := ReduceArray(ArrayStr, 120);//tamanho do campo de auditoria
      for Str in ArrayStr do
        Auditor.Sucesso.GravarMensagem(Str);
    except on E: Exception do
        begin
          if Transacao.InTransaction then
            Transacao.Rollback;
          Result := False;
          LogError('THwTrayServicos.CadastrarGradeVariacao. Erro: %s', [e.Message]);
          if not SilentMod then
            ShowErro('Erro ao cadastrar Grade. %s',  [e.Message]);
        end;
    end;
  finally
    desconectar;
  end;
end;

function THwTrayServicos.abreFormImagem(pGrupoProd: Integer; pCodProd: string;
  pCodigoKit: Integer; product: TProduct; variacoes: TArray<TVariant>): boolean;
var
  formulario: TFrmTrayPadrao;
begin
  try
    formulario := TFrmTrayPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Selecione uma opção';
    FrmTrayCadastros.pnImagens.Parent := formulario;
    FrmTrayCadastros.pnDetImg.Visible := false;
    FrmTrayCadastros.pbprogresso.Visible := false;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.Position := poScreenCenter;
    result := (formulario.ShowModal = IDOK);
  finally
    if result then
    begin
      if FrmTrayCadastros.RadioGroupOpcao.ItemIndex = 0 then
      begin
        FrmTrayCadastros.pbprogresso.Position := 0;
        FrmTrayCadastros.pnDetImg.Visible := true;
        FrmTrayCadastros.pbprogresso.Visible := true;

        adicionarImagemEC(
          pGrupoProd,
          pCodProd,
          pCodigoKit,
          product,
          variacoes);
      end
      else
      begin
        utilizaImagemERP(
          pGrupoProd,
          pCodProd,
          pCodigoKit);
      end;
    end;

    FrmTrayCadastros.pnImagens.Parent := FrmTrayCadastros.ts_Imagens;
    formulario.Free;
    formulario := nil;
  end;
end;

function THwTrayServicos.AdicionarGradeVariacao(pDataset: TConexao_OOP;
  pGrupoProd: Integer; pCodProd: string): Boolean;
var
  hwCodGradeProd: TCod_grade_prod_class2;
  hwCodGradeProds, hwCodGradeProdCad: TArray<TCod_grade_prod_class2>;
  hwProdutosEC: TProdutos_ec_class;
  hwProdutosECs, hwProdutosECCad: TArray<TProdutos_ec_class>;
  hwProdutosECgrade: TProdutos_ec_grade_class;
  hwProdutosECgrades, hwProdutosECgradeCad: TArray<TProdutos_ec_grade_class>;
  vProdutoSemEstoque: boolean;
  vProdutoComGrade: boolean;
  vCadastrarGradeProd: boolean;
  vCadastrarProdutosEcommerce: boolean;
  vCadastrarGradeEcommerce: boolean;
  str: string;
begin
  Result := True;
  vProdutoSemEstoque          := false;
  vProdutoComGrade            := false;
  vCadastrarGradeProd         := false;
  vCadastrarProdutosEcommerce := false;
  vCadastrarGradeEcommerce    := false;
  if not conectar(DataBasePath, True)  then
     Exit;

  try
    try
      pDataset.First;
      while not pDataset.Eof do
      begin
        if (pDataset.DataSet.FieldByName('cod_grade').AsInteger > 0) then
        begin
          if SqlOpen('select g.cod_grade, g.cod_empresa from grade g ' +
                   ' where g.cod_grade = %d ' +
                   ' and g.cod_empresa = %d',
                   [pDataset.DataSet.FieldByName('cod_grade').AsInteger,
                    CodEmpresa]).IsEmpty then
          begin
            if pDataset.DataSet.FieldByName('descricao_ec1').AsString = '' then
              ShowAtencao('Variação(grade) Id Hw ' + IntToStr(pDataset.DataSet.FieldByName('cod_grade').AsInteger) + ': ' +#13 +
                pDataset.DataSet.FieldByName('tipo_ec').AsString + ' - ' + pDataset.DataSet.FieldByName('descricao_ec').AsString + #13 +
                'Não foi encontrada não é possível adicionar!')
            else
              ShowAtencao('Variação(grade) Id Hw ' + IntToStr(pDataset.DataSet.FieldByName('cod_grade').AsInteger) + ': ' +#13 +
                pDataset.DataSet.FieldByName('tipo_ec').AsString + ' - ' + pDataset.DataSet.FieldByName('descricao_ec').AsString + #13 +
                pDataset.DataSet.FieldByName('tipo_ec1').AsString + ' - ' + pDataset.DataSet.FieldByName('descricao_ec1').AsString + #13 +
                'Não foi encontrada não é possível adicionar');
            Result := false;
            Exit;
          end;
        end;

        pDataset.Next;
      end;

      pDataset.First;
      while not pDataset.Eof do
      begin
        if (pDataset.DataSet.FieldByName('cod_grade').AsInteger <= 0) then
        begin
          if pDataset.DataSet.FieldByName('descricao_ec1').AsString = '' then
            ShowAtencao('Variação(grade): ' + #13 +
              pDataset.DataSet.FieldByName('tipo_ec').AsString + ' - ' + pDataset.DataSet.FieldByName('descricao_ec').AsString + #13 +
              'Não foi cadastrada não é possível adicionar!')
          else
            ShowAtencao('Variação(grade): ' + #13 +
              pDataset.DataSet.FieldByName('tipo_ec').AsString + ' - ' + pDataset.DataSet.FieldByName('descricao_ec').AsString + #13 +
              pDataset.DataSet.FieldByName('tipo_ec1').AsString + ' - ' + pDataset.DataSet.FieldByName('descricao_ec1').AsString + #13 +
              'Não foi cadastrada não é possível adicionar');
          Result := false;
          Exit;
        end;

        pDataset.Next;
      end;

      with SqlOpen('select pr.grupo_prod, pr.cod_prod, pr.cod_empresa, pr.est_f from produtos pr ' +
                   ' where pr.grupo_prod = %d ' +
                   ' and pr.cod_prod = %s' +
                   ' and pr.cod_empresa = %d',
                   [pGrupoProd,
                    pCodProd.QuotedString,
                    CodEmpresa]) do
      begin
        vProdutoSemEstoque := FieldByName('est_f').AsFloat <= 0;
      end;

      if not SqlOpen('select g.grupo_prod, g.cod_prod, g.cod_grade, g.cod_empresa from cod_grade_prod g ' +
                   ' where g.grupo_prod = %d ' +
                   ' and g.cod_prod = %s' +
                   ' and g.cod_grade > 0 ' +
                   ' and g.cod_empresa = %d',
                   [pGrupoProd,
                    pCodProd.QuotedString,
                    CodEmpresa]).IsEmpty then
      begin
        vProdutoComGrade   := true;
      end;

      if (not vProdutoSemEstoque) and (not vProdutoComGrade) then
      begin
        ShowAtencao('Produto sem grade com estoque, não é possível adicionar as grades');
        Result := false;
        Exit;
      end;

      hwCodGradeProds    := [];
      hwProdutosECs      := [];
      hwProdutosECgrades := [];

      if pGrupoProd > 0 then
      begin
        hwProdutosEC                 := TProdutos_ec_class.Create;
        hwProdutosEC.grupo_prod      := pGrupoProd;
        hwProdutosEC.cod_prod        := pCodProd;

        hwProdutosECs := hwProdutosECs + [hwProdutosEC];
      end;

      pDataset.First;
      while not pDataset.Eof do
      begin
        hwCodGradeProd               := TCod_grade_prod_class2.Create;
        hwCodGradeProd.grupo_prod    := pGrupoProd;
        hwCodGradeProd.cod_prod      := pCodProd;
        hwCodGradeProd.cod_grade     := pDataset.DataSet.FieldByName('cod_grade').AsInteger;

        hwCodGradeProds := hwCodGradeProds + [hwCodGradeProd];

        hwProdutosECgrade            := TProdutos_ec_grade_class.Create;
        hwProdutosECgrade.grupo_prod := pGrupoProd;
        hwProdutosECgrade.cod_prod   := pCodProd;
        hwProdutosECgrade.cod_grade  := pDataset.DataSet.FieldByName('cod_grade').AsInteger;

        hwProdutosECgrades := hwProdutosECgrades + [hwProdutosECgrade];

        pDataset.Next;
      end;

      hwCodGradeProdCad := [];
      for hwCodGradeProd in hwCodGradeProds do
        if SqlOpen('select g.grupo_prod, g.cod_prod, g.cod_grade, g.cod_empresa from cod_grade_prod g ' +
                   ' where g.grupo_prod = %d ' +
                   ' and g.cod_prod = %s' +
                   ' and g.cod_grade = %d ' +
                   ' and g.cod_empresa = %d',
                   [hwCodGradeProd.grupo_prod,
                    hwCodGradeProd.cod_prod.QuotedString,
                    hwCodGradeProd.cod_grade,
                    CodEmpresa]).IsEmpty then
      begin
        if (not vCadastrarGradeProd) then vCadastrarGradeProd := true;
          hwCodGradeProdCad := hwCodGradeProdCad + [hwCodGradeProd];
      end;

      hwProdutosECCad := [];
      for hwProdutosEC in hwProdutosECs do
        if SqlOpen('select pe.grupo_prod, pe.cod_prod, pe.cod_empresa from produtos_ec pe ' +
                   ' where pe.grupo_prod = %d ' +
                   ' and pe.cod_prod = %s' +
                   ' and pe.cod_empresa = %d',
                   [hwProdutosEC.grupo_prod,
                    hwProdutosEC.cod_prod.QuotedString,
                    CodEmpresa]).IsEmpty then
      begin
        if (not vCadastrarProdutosEcommerce) then vCadastrarProdutosEcommerce := true;
          hwProdutosECgradeCad := hwProdutosECgradeCad + [hwProdutosECgrade];
      end;

      hwProdutosECgradeCad := [];
      for hwProdutosECgrade in hwProdutosECgrades do
        if SqlOpen('select pg.grupo_prod, pg.cod_prod, pg.cod_grade, pg.cod_empresa from produtos_ec_grade pg ' +
                   ' where pg.grupo_prod = %d ' +
                   ' and pg.cod_prod = %s' +
                   ' and pg.cod_grade = %d ' +
                   ' and pg.cod_empresa = %d',
                   [hwProdutosECgrade.grupo_prod,
                    hwProdutosECgrade.cod_prod.QuotedString,
                    hwProdutosECgrade.cod_grade,
                    CodEmpresa]).IsEmpty then
      begin
        if (not vCadastrarGradeEcommerce) then vCadastrarGradeEcommerce := true;
          hwProdutosECgradeCad := hwProdutosECgradeCad + [hwProdutosECgrade];
      end;

      if (not vCadastrarGradeProd) and (not vCadastrarProdutosEcommerce) and (not vCadastrarGradeEcommerce) then
      begin
        ShowAtencao('Variação (grades) selecionadas já foram adicionadas');
        Result := false;
        Exit;
      end;

      for hwCodGradeProd in hwCodGradeProdCad do
      begin
        if SqlOpen('select g.grupo_prod, g.cod_prod, g.cod_grade, g.cod_empresa from cod_grade_prod g ' +
                   ' where g.grupo_prod = %d ' +
                   ' and g.cod_prod = %s' +
                   ' and g.cod_grade = %d ' +
                   ' and g.cod_empresa = %d',
                   [hwCodGradeProd.grupo_prod,
                    hwCodGradeProd.cod_prod.QuotedString,
                    hwCodGradeProd.cod_grade,
                    CodEmpresa]).IsEmpty then
        begin
          hwCodGradeProd.grupo_prod  := hwCodGradeProd.grupo_prod;
          hwCodGradeProd.cod_prod    := hwCodGradeProd.cod_prod;
          hwCodGradeProd.cod_grade   := hwCodGradeProd.cod_grade;
          hwCodGradeProd.cod_empresa := CodEmpresa;
          hwCodGradeProd.ativo       := 1;
          SqlExec(hwCodGradeProd.SQL('cod_grade').SQLInsertAutoInc).Transaction;
        end;
      end;

      for hwProdutosEC in hwProdutosECCad do
      begin
        if SqlOpen('select pe.grupo_prod, pe.cod_prod, pe.cod_grade, pe.cod_empresa from produtos_ec pe ' +
                   ' where pe.grupo_prod = %d ' +
                   ' and pe.cod_prod = %s' +
                   ' and pe.cod_empresa = %d',
                   [hwProdutosEC.grupo_prod,
                    hwProdutosEC.cod_prod.QuotedString,
                    CodEmpresa]).IsEmpty then
        begin
          hwProdutosEC.grupo_prod     := hwProdutosEC.grupo_prod;
          hwProdutosEC.cod_prod       := hwProdutosEC.cod_prod;
          hwProdutosEC.cod_empresa    := CodEmpresa;
          hwProdutosEC.sinc_ecommerce := 'S';
          SqlExec(hwProdutosEC.SQL('cod_grade').SQLInsertAutoInc).Transaction;
        end;
      end;

      ArrayStr := [];
      for hwProdutosECgrade in hwProdutosECgradeCad do
      begin
        if SqlOpen('select pg.grupo_prod, pg.cod_prod, pg.cod_grade, pg.cod_empresa from produtos_ec_grade pg ' +
                   ' where pg.grupo_prod = %d ' +
                   ' and pg.cod_prod = %s' +
                   ' and pg.cod_grade = %d ' +
                   ' and pg.cod_empresa = %d',
                   [hwProdutosECgrade.grupo_prod,
                    hwProdutosECgrade.cod_prod.QuotedString,
                    hwProdutosECgrade.cod_grade,
                    CodEmpresa]).IsEmpty then
        begin
          hwProdutosECgrade.grupo_prod     := hwProdutosECgrade.grupo_prod;
          hwProdutosECgrade.cod_prod       := hwProdutosECgrade.cod_prod;
          hwProdutosECgrade.cod_grade      := hwProdutosECgrade.cod_grade;
          hwProdutosECgrade.cod_empresa    := CodEmpresa;
          hwProdutosECgrade.sinc_ecommerce := 'S';
          SqlExec(hwProdutosECgrade.SQL('cod_grade').SQLInsertAutoInc).Transaction;

          ArrayStr := ArrayStr + [pDataset.DataSet.FieldByName('cod_grade').AsString];
        end;
      end;

      if Transacao.InTransaction then
        Transacao.Commit;

      Result := True;

      ArrayStr := ReduceArray(ArrayStr, 120);//tamanho do campo de auditoria
      for Str in ArrayStr do
        Auditor.Sucesso.GravarMensagem(Str);
     except on E: Exception do
        begin
          if Transacao.InTransaction then
            Transacao.Rollback;
          Result := False;
          LogError('THwTrayServicos.AdicionarGradeVariacao. Erro: %s', [e.Message]);
          if not SilentMod then
            ShowErro('Erro ao adicionar grade. %s',  [e.Message]);
        end;
    end;
  finally
    desconectar;
  end;
end;

function THwTrayServicos.adicionarImagemEC(pGrupoProd: Integer;
  pCodProd: string; pCodigoKit: Integer; product: TProduct;
  variacoes: TArray<TVariant>): boolean;
var
  vStringListImagens, vStringListVarImagens: TStringList;
  path: string;
  I, J, Z: Integer;
  vformatos: string;
  vCodigoImg: Integer;
  vMD5: string;
begin
  Result := False;
  try
    vStringListImagens    := TStringList.Create;
    vStringListVarImagens := TStringList.Create;

    vformatos := '';
    path := IncludeTrailingPathDelimiter(TConfig_sistema_class.getConf('prod_cad_diretorio_padrao_imagens', QrAux, CodEmpresa).value1_vc.Trim);

    if (trim(path) <> '') then
      if Pos('\', path) > 0 then
        if Copy(path, Length(path), 1) <> '\' then
          path := path + '\';

    if trim(path) = '' then
    begin
      ShowAtencao('Diretório padrão de imagens do cadastro do produto não configurado, favor verificar antes de continuar.');
      exit;
    end
    else if not DirectoryExists(trim(path)) then
    begin
      ShowAtencao('Diretório padrão de imagens do cadastro do produto não encontrado: ' + #13 +
        path + #13 + #13 +
        'Favor verificar antes de continuar.');
      exit;
    end;

    vStringListImagens.Clear;
    for I := 0 to Length(product.ProductImage) - 1 do
      if (UpperCase(ExtractFileExt(product.ProductImage[I].http)) = '.JPG') or (UpperCase(ExtractFileExt(product.ProductImage[I].http)) = '.JPEG') then
        vStringListImagens.Add(FrmTrayCadastros.baixarImagens(path, product.ProductImage[I].http))
      else
      begin
        vformatos := vformatos +
          IfThen(trim(vformatos) = '', '', ', ') +
          UpperCase(ExtractFileExt(product.ProductImage[I].http));
        ShowErro('Formato das imagens deste produto do E-Commerce não suportado no ERP:' + #13 + #13 + vformatos);
        testarImagem := false;
        exit;
      end;

    if Length(variacoes) > 0 then
    begin
      for I := 0 to Length(variacoes) - 1 do
      begin
        vStringListVarImagens.Clear;
        for J := 0 to Length(variacoes[I].VariantImage) - 1 do
        begin
          if (UpperCase(ExtractFileExt(variacoes[I].VariantImage[J].http)) = '.JPG') or (UpperCase(ExtractFileExt(variacoes[I].VariantImage[J].http)) = '.JPEG') then
            vStringListVarImagens.Add(FrmTrayCadastros.baixarImagens(path, variacoes[I].VariantImage[J].http))
          else
          begin
            vformatos := vformatos +
              IfThen(trim(vformatos) = '', '', ', ') +
              UpperCase(ExtractFileExt(variacoes[I].VariantImage[J].http));
            ShowErro('Formato das imagens deste produto do E-Commerce não suportado:' + #13 + #13 + vformatos);
            testarImagem := false;
            exit;
          end;
        end;
      end;
    end;

    if vStringListImagens.Count > 0 then
    begin
      if pCodigoKit > 0 then
      begin
        QrAux.Close;
        QrAux.SQL.Text := ' update kits_prod set lista_imagens = null, url_imagens = null ' +
          ' where codigo_kit = :codigo_kit ' +
          ' and cod_empresa = :cod_empresa ';
        QrAux.ParamByName('codigo_kit').AsInteger := pCodigoKit;
        QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
        QrAux.ExecSQL;

        for I := 0 to vStringListImagens.Count - 1 do
        begin
          vMD5 := '';
          vCodigoImg := 0;
          if (ExtractFileDir(vStringListImagens[I]) = ExtractFileDir(vStringListImagens[I])) then
          begin
            if FileExists(path + vStringListImagens[I]) then
              vMD5 := _getMd5File(path + vStringListImagens[I]);
          end
          else
          begin
            if FileExists(vStringListImagens[I]) then
              vMD5 := _getMd5File(vStringListImagens[I]);
          end;

          if (trim(vMD5) <> '') then
          begin
            QrAux.Close;
            QrAux.SQL.Text := '  select first 1 cod_img from imagens_doc ' +
              ' where md5 = :md5 ' +
              ' and cod_empresa = :cod_empresa ';
            QrAux.ParamByName('md5').AsString := vMD5;
            QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
            QrAux.Open;

            vCodigoImg := QrAux.FieldByName('cod_img').AsInteger;
          end;

          if (vCodigoImg <= 0) then
          begin
            vCodigoImg := GenCodigo('IMAGENS_DOC', QrAux, IntToStr(CodEmpresa));

            QrAux.Close;
            QrAux.SQL.Text := ' insert into imagens_doc ' +
              ' (cod_img, cod_empresa, imagem, md5, us_cad, data_cad) ' +
              ' values (:cod_img, :cod_empresa, :imagem, :md5, :us_cad, :data_cad) ';
            QrAux.ParamByName('cod_img').AsInteger := vCodigoImg;
            QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
            QrAux.ParamByName('imagem').AsString := vStringListImagens[I];
            QrAux.ParamByName('md5').AsString := vMD5;
            QrAux.ParamByName('data_cad').AsDateTime := Date;
            QrAux.ExecSQL;
          end;

          QrAux.Close;
          QrAux.SQL.Text := ' update or insert into kits_prod_imagens ' +
            ' (codigo_kit, cod_empresa, cod_img) ' +
            ' values (:codigo_kit, :cod_empresa, :cod_img) ' +
            ' matching (codigo_kit, cod_empresa, cod_img); ';
          QrAux.ParamByName('codigo_kit').AsInteger := pCodigoKit;
          QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
          QrAux.ParamByName('cod_img').AsInteger := vCodigoImg;
          QrAux.ExecSQL;
        end;
      end
      else
      begin
        QrAux.Close;
        QrAux.SQL.Text := ' update produtos set lista_imagens = null ' +
          ' where grupo_prod = :grupo_prod ' +
          ' and cod_prod = :cod_prod ' +
          ' and cod_empresa = :cod_empresa ';
        QrAux.ParamByName('grupo_prod').AsInteger := pGrupoProd;
        QrAux.ParamByName('cod_prod').AsString := pCodProd;
        QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
        QrAux.ExecSQL;

        QrAux.Close;
        QrAux.SQL.Text := ' delete from produtos_imagens ' +
          ' where grupo_prod = :grupo_prod ' +
          ' and cod_prod = :cod_prod ' +
          ' and cod_empresa = :cod_empresa ';
        QrAux.ParamByName('grupo_prod').AsInteger := pGrupoProd;
        QrAux.ParamByName('cod_prod').AsString := pCodProd;
        QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
        QrAux.ExecSQL;

        QrAux.Close;
        QrAux.SQL.Text := ' delete from produtos_grade_imagens ' +
          ' where grupo_prod = :grupo_prod ' +
          ' and cod_prod = :cod_prod ' +
          ' and cod_empresa = :cod_empresa ';
        QrAux.ParamByName('grupo_prod').AsInteger := pGrupoProd;
        QrAux.ParamByName('cod_prod').AsString := pCodProd;
        QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
        QrAux.ExecSQL;

        for I := 0 to vStringListImagens.Count - 1 do
        begin
          vMD5 := '';
          vCodigoImg := 0;
          if (ExtractFileDir(vStringListImagens[I]) = ExtractFileDir(vStringListImagens[I])) then
          begin
            if FileExists(path + vStringListImagens[I]) then
              vMD5 := _getMd5File(path + vStringListImagens[I]);
          end
          else
          begin
            if FileExists(vStringListImagens[I]) then
              vMD5 := _getMd5File(vStringListImagens[I]);
          end;

          if (trim(vMD5) <> '') then
          begin
            QrAux.Close;
            QrAux.SQL.Text := '  select first 1 cod_img from imagens_doc ' +
              ' where md5 = :md5 ' +
              ' and cod_empresa = :cod_empresa ';
            QrAux.ParamByName('md5').AsString := vMD5;
            QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
            QrAux.Open;

            vCodigoImg := QrAux.FieldByName('cod_img').AsInteger;
          end;

          if (vCodigoImg <= 0) then
          begin
            vCodigoImg := GenCodigo('IMAGENS_DOC', QrAux, IntToStr(CodEmpresa));

            QrAux.Close;
            QrAux.SQL.Text := ' insert into imagens_doc ' +
              ' (cod_img, cod_empresa, imagem, md5, us_cad, data_cad) ' +
              ' values (:cod_img, :cod_empresa, :imagem, :md5, :us_cad, :data_cad) ';
            QrAux.ParamByName('cod_img').AsInteger := vCodigoImg;
            QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
            QrAux.ParamByName('imagem').AsString := vStringListImagens[I];
            QrAux.ParamByName('md5').AsString := vMD5;
            QrAux.ParamByName('data_cad').AsDateTime := Date;
            QrAux.ExecSQL;
          end;

          QrAux.Close;
          QrAux.SQL.Text := ' update or insert into produtos_grade_imagens ' +
            ' (grupo_prod, cod_prod, cod_grade, cod_empresa, cod_img) ' +
            ' values (:grupo_prod, :cod_prod, :cod_grade, :cod_empresa, :cod_img) ' +
            ' matching (grupo_prod, cod_prod, cod_grade, cod_empresa, cod_img); ';
          QrAux.ParamByName('grupo_prod').AsInteger := pGrupoProd;
          QrAux.ParamByName('cod_prod').AsString := pCodProd;
          QrAux.ParamByName('cod_grade').AsInteger := 0;
          QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
          QrAux.ParamByName('cod_img').AsInteger := vCodigoImg;
          QrAux.ExecSQL;
        end;
      end;

      if QrAux.Transaction.InTransaction then
        QrAux.Transaction.Commit;
    end;

    for I := 0 to Length(variacoes) - 1 do
    begin
      vStringListVarImagens.Clear;
      for J := 0 to Length(variacoes[I].VariantImage) - 1 do
      begin
        FrmTrayCadastros.pbprogresso.Position := 0;
        vStringListVarImagens.Add(FrmTrayCadastros.baixarImagens(path, variacoes[I].VariantImage[J].http));
      end;

      if vStringListVarImagens.Count > 0 then
      begin
        if pCodigoKit <= 0 then
        begin
          for Z := 0 to vStringListVarImagens.Count - 1 do
          begin
            vMD5 := '';
            vCodigoImg := 0;
            if (ExtractFileDir(vStringListVarImagens[Z]) = ExtractFileDir(vStringListVarImagens[Z])) then
            begin
              if FileExists(path + vStringListVarImagens[Z]) then
                vMD5 := _getMd5File(path + vStringListVarImagens[Z]);
            end
            else
            begin
              if FileExists(vStringListVarImagens[Z]) then
                vMD5 := _getMd5File(vStringListVarImagens[Z]);
            end;

            if (trim(vMD5) <> '') then
            begin
              QrAux.Close;
              QrAux.SQL.Text := '  select first 1 cod_img from imagens_doc ' +
                ' where md5 = :md5 ' +
                ' and cod_empresa = :cod_empresa ';
              QrAux.ParamByName('md5').AsString := vMD5;
              QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
              QrAux.Open;

              vCodigoImg := QrAux.FieldByName('cod_img').AsInteger;
            end;

            if (vCodigoImg <= 0) then
            begin
              vCodigoImg := GenCodigo('IMAGENS_DOC', QrAux, IntToStr(CodEmpresa));

              QrAux.Close;
              QrAux.SQL.Text := ' insert into imagens_doc ' +
                ' (cod_img, cod_empresa, imagem, md5, us_cad, data_cad) ' +
                ' values (:cod_img, :cod_empresa, :imagem, :md5, :us_cad, :data_cad) ';
              QrAux.ParamByName('cod_img').AsInteger := vCodigoImg;
              QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
              QrAux.ParamByName('imagem').AsString := vStringListVarImagens[Z];
              QrAux.ParamByName('md5').AsString := vMD5;
              QrAux.ParamByName('data_cad').AsDateTime := Date;
              QrAux.ExecSQL;
            end;

            QrAux.Close;
            QrAux.SQL.Text := ' update or insert into produtos_grade_imagens ' +
              ' (grupo_prod, cod_prod, cod_grade, cod_empresa, cod_img) ' +
              ' values (:grupo_prod, :cod_prod, :cod_grade, :cod_empresa, :cod_img) ' +
              ' matching (grupo_prod, cod_prod, cod_grade, cod_empresa, cod_img); ';
            QrAux.ParamByName('grupo_prod').AsInteger := pGrupoProd;
            QrAux.ParamByName('cod_prod').AsString := pCodProd;
            QrAux.ParamByName('cod_grade').AsInteger := variacoes[I].cod_grade_temp;
            QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
            QrAux.ParamByName('cod_img').AsInteger := vCodigoImg;
            QrAux.ExecSQL;
          end;
        end;

        if QrAux.Transaction.InTransaction then
          QrAux.Transaction.Commit;
      end;
    end;
    FrmTrayCadastros.IdHTTP.Disconnect;
    Result := true;
  except on E: Exception do
    begin
      FrmTrayCadastros.IdHTTP.Disconnect;
      if QrAux.Transaction.InTransaction then
        QrAux.Transaction.Rollback;
      Result := False;
      LogError('adicionarImagemEC. Erro: %s', [e.Message]);
      if not SilentMod then
        ShowErro('Erro ao adicionar imagem. %s',  [e.Message]);
    end;
  end;
end;

procedure THwTrayServicos.AfterLogin(Sender: TObject);
begin
  if Sender <> nil then
    SaveJSON(TRAY_SERV_TOKEN_API, TJsonHw.ToJsonString(TTrayTokenApi(Sender)));
end;

function THwTrayServicos.CadastrarCategoria(
  trayCategorias: TArray<TCategory>): Boolean;
var
  newCategs: TArray<TCategoryMescladaHw>;
  newCateg: TCategoryMescladaHw;
  hwCateg: TCategoria_class;
  hwCategPai: TCategoria_class;
  trayCateg: TCategory;
  trayCategoria: TCategory;
  inserir: Boolean;
  vCadastrar: boolean;
  vcod_categoria: Integer;
  vcod_categoria_pai: Integer;
  str: string;
begin
  vCadastrar := false;
  if not conectar(DataBasePath, True)  then
    Exit;

  try

    try
      for trayCateg in trayCategorias do
        with ClientOOP(' select categoria.cod_categoria, categoria.descricao, categoria.ativo, coalesce(categoria.id_commerce, 0) id_commerce from categoria' +
                       ' where trim(categoria.descricao) = %s and categoria.cod_empresa = %d ' +
                       ' union ' +
                       ' select categoria.cod_categoria, categoria.descricao, categoria.ativo, coalesce(categoria.id_commerce, 0) id_commerce from categoria' +
                       ' where upper(trim(categoria.descricao)) = %s and categoria.cod_empresa = %d ',
                       [trayCateg.name.Substring(0, 50).Trim.QuotedString, CodEmpresa,
                        trayCateg.name.Substring(0, 50).ToUpper.Trim.QuotedString, CodEmpresa]) do
          if not IsEmpty then
          begin
            ShowAtencao('Já existe uma categoria cadastrada com a mesma descrição.' + #13 + #13 +
              IfThen(fint('id_commerce') > 0, 'Id E-Commerce: ' + IntToStr(fint('id_commerce')) + #13, '') +
              'Categoria: ' + IntToStr(fint('cod_categoria')) + ' - ' +  trim(fstr('descricao')) + #13 +
              'Lixeira: ' + IfThen(fequals('ativo', '1'), 'Não', 'Sim'));
            exit;
          end;

      for trayCateg in trayCategorias do
        with ClientOOP('select categoria.cod_categoria, categoria.descricao, categoria.ativo, coalesce(categoria.id_commerce, 0) id_commerce from categoria' +
                       ' where categoria.id_commerce = %s and categoria.cod_empresa = %d', [trayCateg.id, CodEmpresa]) do
          if not IsEmpty then
          begin
            ShowAtencao('Já existe uma categoria cadastrada com mesmo id e-commerce.' + #13 + #13 +
              'Id E-Commerce: ' + trayCateg.id + #13 +
              'Categoria ' + IntToStr(fint('cod_categoria')) + ' - ' +  trim(fstr('descricao')) + #13 +
              'Lixeira: ' + IfThen(fequals('ativo', '1'), 'Não', 'Sim'));
            exit;
          end;

      for trayCateg in trayCategorias do
        if SqlOpen(' select categoria.cod_categoria, categoria.descricao, categoria.ativo, coalesce(categoria.id_commerce, 0) id_commerce from categoria' +
                   ' where trim(categoria.descricao) = %s and categoria.cod_empresa = %d ' +
                   ' union ' +
                   ' select categoria.cod_categoria, categoria.descricao, categoria.ativo, coalesce(categoria.id_commerce, 0) id_commerce from categoria' +
                   ' where upper(trim(categoria.descricao)) = %s and categoria.cod_empresa = %d ',
                   [trayCateg.name.Substring(0, 50).Trim.QuotedString, CodEmpresa,
                    trayCateg.name.ToUpper.Substring(0, 50).Trim.QuotedString, CodEmpresa]).IsEmpty then
          begin
            vCadastrar := true;
            Break;
          end;

      if not vCadastrar then
      begin
        ShowAtencao('Todas categorias selecionadas já foram cadastradas');
        Result := false;
        Exit;
      end;

      ArrayStr := [];
      for trayCateg in trayCategorias do
      begin
        try
          hwCateg := TCategoria_class.Create;
          hwCateg.descricao := trayCateg.name.ToUpper().Trim;
          hwCateg.cod_empresa := CodEmpresa;
          hwCateg.ativo := 1;
          hwCateg.id_commerce := StrToInt(trayCateg.id);

          with hwCateg.SQLMotor('cod_categoria') do
            hwCateg.cod_categoria := SqlInsertID(SQLInsertAutoInc, autoIncField);

          with ClientOOP('select id_commerce, cod_categoria, descricao, ativo from categoria' +
                         ' where id_commerce = %d and cod_empresa = %d and cod_categoria <> %d',
                         [StrToInt(trayCateg.id), CodEmpresa, hwCateg.cod_categoria]) do
            if not IsEmpty then
            begin
              ShowAtencao('Já existe uma categoria cadastrada com esse id e-commerce.' + #13 + #13 +
                'Id E-Commerce: ' + trayCateg.id + #13 +
                'Categoria: ' + IntToStr(fint('cod_categoria')) + ' - ' + trim(fstr('descricao')) + #13 +
                'Lixeira: ' + IfThen(fequals('ativo', '1'), 'Não', 'Sim'));
              exit;
            end;
        except on E: Exception do
          begin
            if Transacao.InTransaction then
              Transacao.Rollback;
            Result := False;
            LogError('THwTrayServicos.CadastrarCategoria. tray %s %s. Erro: %s', [trayCateg.id, trayCateg.name, e.Message]);
            if not SilentMod then
              ShowErro('Erro ao cadastrar Categoria(s). %s',  [e.Message]);
            exit;
          end;
        end;

        ArrayStr := ArrayStr + [trayCateg.id + '-' + trayCateg.name];
      end;

      if Transacao.InTransaction then
        Transacao.Commit;

      for trayCateg in trayCategorias do
      begin
        try
          inserir := trayCateg.parent_id.Trim.IsEmpty or trayCateg.parent_id.Trim.Equals('0');

          if not inserir then
          begin
            ClientOOP(' select c.cod_categoria from categoria c' +
                      ' where c.id_commerce = %d and c.cod_empresa = %d',
                      [StrToInt(trayCateg.id), CodEmpresa]);

            vcod_categoria     := Client.fint('cod_categoria');

            ClientOOP(' select c.cod_categoria from categoria c' +
                      ' where c.id_commerce = %d and c.cod_empresa = %d',
                      [StrToInt(trayCateg.parent_id), CodEmpresa]);

            vcod_categoria_pai := Client.fint('cod_categoria');
          end;

          trayCategoria := trayConsumeApi.GetItem<TCategory>('categories/' + trayCateg.parent_id, []);

          if (trayCategoria <> nil) then
          begin
            if SqlOpen(' select categoria.cod_categoria, categoria.descricao, categoria.ativo, coalesce(categoria.id_commerce, 0) id_commerce from categoria' +
                       ' where trim(categoria.descricao) = %s and categoria.cod_empresa = %d ' +
                       ' union ' +
                       ' select categoria.cod_categoria, categoria.descricao, categoria.ativo, coalesce(categoria.id_commerce, 0) id_commerce from categoria' +
                       ' where upper(trim(categoria.descricao)) = %s and categoria.cod_empresa = %d ',
                       [trayCategoria.name.Substring(0, 50).Trim.QuotedString, CodEmpresa,
                        trayCategoria.name.ToUpper.Substring(0, 50).Trim.QuotedString, CodEmpresa]).IsEmpty then
                          inserir := true;
          end;

          if (not inserir) and (trayCategoria <> nil) and (vcod_categoria_pai <= 0) and (inserir) then
          begin
            hwCategPai := TCategoria_class.Create;
            hwCategPai.descricao := trayCategoria.name.Trim;
            hwCategPai.cod_empresa := CodEmpresa;
            hwCategPai.ativo := 1;
            hwCategPai.id_commerce := trayCategoria.Id.ToInteger;

            with hwCategPai.SQLMotor('cod_categoria') do
              vcod_categoria_pai := SqlInsertID(SQLInsertAutoInc, autoIncField);

            if Transacao.InTransaction then
              Transacao.Commit;

            ArrayStr := ArrayStr + [trayCategoria.id];// + '-' + trayCateg.Description.pt];
          end;

          if (vcod_categoria > 0) and (vcod_categoria_pai > 0) then
          begin
            SqlExec(' update categoria set cod_categoria_pai = %d ' +
              ' where cod_categoria = %d ' +
              ' and cod_empresa = %d ',
              [vcod_categoria_pai, vcod_categoria, CodEmpresa]);

            if Transacao.InTransaction then
              Transacao.Commit;
          end;
        except on E: Exception do
          begin
            if Transacao.InTransaction then
              Transacao.Rollback;
            Result := False;
            LogError('THwTrayServicos.CadastrarCategoria. tray %d %s. Erro: %s', [trayCateg.id, trayCateg.name, e.Message]);
            if not SilentMod then
              ShowErro('Erro ao cadastrar Categoria(s). %s',  [e.Message]);
            exit;
          end;
        end;
      end;

      Result := True;

      ArrayStr := ReduceArray(ArrayStr, 128);//tamanho do campo de auditoria
      for Str in ArrayStr do
        Auditor.Sucesso.GravarMensagem(Str);

    except on E: Exception do
      begin
        if Transacao.InTransaction then
          Transacao.Rollback;
        Result := False;
        LogError('THwTrayServicos.CadastrarCategoria. tray. Erro: %s', [e.Message]);
        if not SilentMod then
          ShowErro('Erro ao cadastrar Categoria(s). %s',  [e.Message]);
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwTrayServicos.CadastrarGrade(pDataset: TConexao_OOP): Boolean;
var
 hwGrade: Tgrade_class;
 hwGrades, hwGradesCad: TArray<Tgrade_class>;

 hwTipoGrade: TTipo_grade_ec_class;
 hwTipoGrades, hwTipoGradesCad: TArray<TTipo_grade_ec_class>;

 hwTipoGrade1: TTipo_grade_ec_class;
 hwTipoGrades1, hwTipoGradesCad1: TArray<TTipo_grade_ec_class>;

 tipo_ec, descricao_ec, tipo_ec1, descricao_ec1: string;

 vCadastrarGrade: boolean;

 vListaTipoGrade: TStringList;
 vListaTipoGrade1: TStringList;

 str: string;
 I: Integer;
begin
  Result := True;
  vCadastrarGrade := false;

  vListaTipoGrade := TStringList.Create;
  vListaTipoGrade.Clear;
  vListaTipoGrade.Sorted     := True;
  vListaTipoGrade.Duplicates := dupIgnore;

  vListaTipoGrade1 := TStringList.Create;
  vListaTipoGrade1.Clear;
  vListaTipoGrade1.Sorted     := True;
  vListaTipoGrade1.Duplicates := dupIgnore;

  if not conectar(DataBasePath, True)  then
     Exit;

  try
    try
      hwGrades := [];
      pDataset.First;
      while not pDataset.Eof do
      begin
        if (trim(pDataset.DataSet.FieldByName('tipo_ec').AsString) <> '') then
        begin
          if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec').AsString)) = 'CORES' then
            vListaTipoGrade.Add('COR')
          else if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec').AsString)) = 'COR' then
            vListaTipoGrade.Add('COR')
          else if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec').AsString)) = 'GÊNERO' then
            vListaTipoGrade.Add('GÊNERO')
          else if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec').AsString)) = 'TAMANHO' then
            vListaTipoGrade.Add('TAMANHO')
          else if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec').AsString)) = 'VOLTAGEM' then
            vListaTipoGrade.Add('VOLTAGEM')
          else if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec').AsString)) <> '' then
            vListaTipoGrade.Add(trim(pDataset.DataSet.FieldByName('tipo_ec').AsString).Substring(0, 100));
        end;

        if (trim(pDataset.DataSet.FieldByName('tipo_ec1').AsString) <> '') then
        begin
          if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec1').AsString)) = 'CORES' then
            vListaTipoGrade1.Add('COR')
          else if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec1').AsString)) = 'COR' then
            vListaTipoGrade1.Add('COR')
          else if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec1').AsString)) = 'GÊNERO' then
            vListaTipoGrade1.Add('GÊNERO')
          else if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec1').AsString)) = 'TAMANHO' then
            vListaTipoGrade1.Add('TAMANHO')
          else if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec1').AsString)) = 'VOLTAGEM' then
            vListaTipoGrade1.Add('VOLTAGEM')
          else if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec1').AsString)) <> '' then
            vListaTipoGrade1.Add(trim(pDataset.DataSet.FieldByName('tipo_ec1').AsString).Substring(0, 100));
        end;

        hwGrade               := TGrade_class.Create;
        if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec').AsString)) = 'CORES' then
          hwGrade.tipo_ec     := 'COR'
        else if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec').AsString)) = 'COR' then
          hwGrade.tipo_ec     := 'COR'
        else if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec').AsString)) = 'GÊNERO' then
          hwGrade.tipo_ec     := 'GÊNERO'
        else if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec').AsString)) = 'TAMANHO' then
          hwGrade.tipo_ec     := 'TAMANHO'
        else if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec').AsString)) = 'VOLTAGEM' then
          hwGrade.tipo_ec     := 'VOLTAGEM'
        else
          hwGrade.tipo_ec     := trim(pDataset.DataSet.FieldByName('tipo_ec').AsString).Substring(0, 100);
        hwGrade.descricao_ec  := trim(pDataset.DataSet.FieldByName('descricao_ec').AsString).Substring(0, 100);

        if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec1').AsString)) = 'CORES' then
          hwGrade.tipo_ec1    := 'COR'
        else if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec1').AsString)) = 'COR' then
          hwGrade.tipo_ec1    := 'COR'
        else if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec1').AsString)) = 'GÊNERO' then
          hwGrade.tipo_ec1    := 'GÊNERO'
        else if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec1').AsString)) = 'TAMANHO' then
          hwGrade.tipo_ec1    := 'TAMANHO'
        else if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec1').AsString)) = 'VOLTAGEM' then
          hwGrade.tipo_ec1    := 'VOLTAGEM'
        else
          hwGrade.tipo_ec1    := trim(pDataset.DataSet.FieldByName('tipo_ec1').AsString).Substring(0, 100);
        hwGrade.descricao_ec1 := trim(pDataset.DataSet.FieldByName('descricao_ec1').AsString).Substring(0, 100);
        hwGrades := hwGrades + [hwGrade];

        pDataset.Next;
      end;

      for hwGrade in hwGrades do
        with ClientOOP(' select g.descricao, g.descricao1, g.ativo from grade g ' +
                   ' where trim(g.tipo_ec) = %s and trim(g.descricao_ec) = %s ' +
                   ' and trim(coalesce(g.tipo_ec1, '''')) = %s and trim(coalesce(g.descricao_ec1, '''')) = %s ' +
                   ' and g.cod_empresa = %d ' +
                   ' union ' +
                   ' select g.descricao, g.descricao1, g.ativo from grade g ' +
                   ' where upper(trim(g.tipo_ec)) = %s and trim(g.descricao_ec) = %s ' +
                   ' and upper(trim(coalesce(g.tipo_ec1, ''''))) = %s and trim(coalesce(g.descricao_ec1, '''')) = %s ' +
                   ' and g.cod_empresa = %d ',
                   [hwGrade.tipo_ec.Trim.Substring(0, 100).QuotedString, hwGrade.descricao_ec.Trim.Substring(0, 100).QuotedString,
                    hwGrade.tipo_ec1.Trim.Substring(0, 100).QuotedString, hwGrade.descricao_ec1.Trim.Substring(0, 100).QuotedString, CodEmpresa,
                    hwGrade.tipo_ec.ToUpper.Trim.Substring(0, 100).QuotedString, hwGrade.descricao_ec.Trim.Substring(0, 100).QuotedString,
                    hwGrade.tipo_ec1.ToUpper.Trim.Substring(0, 100).QuotedString, hwGrade.descricao_ec1.Trim.Substring(0, 100).QuotedString, CodEmpresa]) do

          if not IsEmpty then
          begin
            ShowAtencao('Já existe uma variação (grade) no banco com mesma tipo e descrição.' + #13 + #13 +
              'Variação tipo : ' + hwGrade.tipo_ec.Trim + ' - ' + hwGrade.descricao_ec.Trim + #13 +
              IfThen(hwGrade.tipo_ec1.Trim <> '',
              'Variação tipo1: ' + hwGrade.tipo_ec1.Trim + ' - ' + hwGrade.descricao_ec1.Trim + #13) +
              'Lixeira: ' + IfThen(fequals('ativo', '1'), 'Não', 'Sim'));
            exit;
          end;

      hwGradesCad := [];
      hwTipoGradesCad1 := [];
      hwGradesCad      := [];

      for I := 0 to vListaTipoGrade.Count - 1 do
      begin
        if SqlOpen(' select t.descricao from tipo_grade_ec t' +
                   ' where trim(t.descricao) = %s' +
                   ' and t.cod_empresa = %d ' +
                   ' union ' +
                   ' select t.descricao from tipo_grade_ec t' +
                   ' where upper(trim(t.descricao)) = %s' +
                   ' and t.cod_empresa = %d ',
                   [vListaTipoGrade[I].Trim.Substring(0, 100).QuotedString,
                    CodEmpresa,
                    vListaTipoGrade[I].ToUpper.Trim.Substring(0, 100).QuotedString,
                    CodEmpresa]).IsEmpty then
        begin
          hwTipoGrade            := TTipo_grade_ec_class.Create;
          hwTipoGrade.descricao  := vListaTipoGrade[I].Trim.Substring(0, 100);
          hwTipoGrades := hwTipoGrades + [hwTipoGrade];

          hwTipoGradesCad := hwTipoGradesCad + [hwTipoGrade];
        end;
      end;

      for I := 0 to vListaTipoGrade1.Count - 1 do
      begin
        if SqlOpen(' select t.descricao from tipo_grade_ec t' +
                   ' where trim(t.descricao) = %s' +
                   ' and t.cod_empresa = %d ' +
                   ' union ' +
                   ' select t.descricao from tipo_grade_ec t' +
                   ' where upper(trim(t.descricao)) = %s' +
                   ' and t.cod_empresa = %d ',
                   [vListaTipoGrade1[I].Trim.Substring(0, 100).QuotedString,
                    CodEmpresa,
                    vListaTipoGrade1[I].ToUpper.Trim.Substring(0, 100).QuotedString,
                    CodEmpresa]).IsEmpty then
        begin
          hwTipoGrade1            := TTipo_grade_ec_class.Create;
          hwTipoGrade1.descricao  := vListaTipoGrade1[I].Trim.Substring(0, 100);
          hwTipoGrades1 := hwTipoGrades1 + [hwTipoGrade1];

          hwTipoGradesCad1 := hwTipoGradesCad1 + [hwTipoGrade1];
        end;
      end;

      for hwGrade in hwGrades do
        if SqlOpen(' select g.descricao, g.descricao1, g.ativo from grade g' +
                   ' where trim(g.tipo_ec) = %s and trim(g.descricao_ec) = %s' +
                   ' and trim(coalesce(g.tipo_ec1, '''')) = %s and trim(coalesce(g.descricao_ec1, '''')) = %s' +
                   ' and cod_empresa = %d ' +
                   ' union ' +
                   ' select g.descricao, g.descricao1, g.ativo from grade g' +
                   ' where upper(trim(g.tipo_ec)) = %s and trim(g.descricao_ec) = %s' +
                   ' and upper(trim(coalesce(g.tipo_ec1, ''''))) = %s and trim(coalesce(g.descricao_ec1, '''')) = %s' +
                   ' and cod_empresa = %d ',
                   [hwGrade.tipo_ec.Trim.Substring(0, 100).QuotedString, hwGrade.descricao_ec.Trim.Substring(0, 100).QuotedString,
                    hwGrade.tipo_ec1.Trim.Substring(0, 100).QuotedString, hwGrade.descricao_ec1.Trim.Substring(0, 100).QuotedString, CodEmpresa,
                    hwGrade.tipo_ec.ToUpper.Trim.Substring(0, 100).QuotedString, hwGrade.descricao_ec.Trim.Substring(0, 100).QuotedString,
                    hwGrade.tipo_ec1.ToUpper.Trim.Substring(0, 100).QuotedString, hwGrade.descricao_ec1.Trim.Substring(0, 100).QuotedString, CodEmpresa]).IsEmpty then
        begin
          vCadastrarGrade := true;
          hwGradesCad := hwGradesCad + [hwGrade];
        end;

      if not vCadastrarGrade then
      begin
        ShowAtencao('Todas variações (grades) selecionadas já foram cadastradas');
        Result := false;
        Exit;
      end;

      for I := 0 to vListaTipoGrade.Count - 1 do
      begin
        hwTipoGrade.descricao    := vListaTipoGrade[I];
        hwTipoGrade.ativo        := 1;
        hwTipoGrade.cod_empresa  := CodEmpresa;
        SqlExec(hwTipoGrade.SQLMotor('cod_tipo').SQLInsertAutoInc).Transaction;
      end;

      for I := 0 to vListaTipoGrade1.Count - 1 do
      begin
        hwTipoGrade1.descricao   := vListaTipoGrade1[I];
        hwTipoGrade1.ativo       := 1;
        hwTipoGrade1.cod_empresa := CodEmpresa;
        SqlExec(hwTipoGrade1.SQLMotor('cod_tipo').SQLInsertAutoInc).Transaction;
      end;

      ArrayStr := [];
      for hwGrade in hwGradesCad do
      begin
        hwGrade.descricao        := (hwGrade.tipo_ec.Trim  + ' ' + hwGrade.descricao_ec.Trim).ToUpper;
        hwGrade.descricao1       := (hwGrade.tipo_ec1.Trim + ' ' + hwGrade.descricao_ec1.Trim).Trim.ToUpper;
        hwGrade.cod_empresa      := CodEmpresa;
        hwGrade.ativo            := 1;
        SqlExec(hwGrade.SQLMotor('cod_grade').SQLInsertAutoInc).Transaction;

        ArrayStr := ArrayStr + [IfThen(hwGrade.descricao1.IsEmpty, 'Simples', 'Dupla') + ' ' + hwGrade.tipo_ec.Trim + ' ' + hwGrade.descricao_ec.Trim +
                                IfThen(not hwGrade.descricao1.IsEmpty, ' - ' + hwGrade.tipo_ec1.Trim + ' ' + hwGrade.descricao_ec1.Trim)];
      end;

      if Transacao.InTransaction then
        Transacao.Commit;

      Result := True;

      ArrayStr := ReduceArray(ArrayStr, 120);//tamanho do campo de auditoria
      for Str in ArrayStr do
        Auditor.Sucesso.GravarMensagem(Str);
    except on E: Exception do
        begin
          if Transacao.InTransaction then
            Transacao.Rollback;
          Result := False;
          LogError('THwTrayServicos.CadastrarGrade. Erro: %s', [e.Message]);
          if not SilentMod then
            ShowErro('Erro ao cadastrar grade. %s',  [e.Message]);
        end;
    end;
  finally
    desconectar;
  end;
end;

function THwTrayServicos.CadastrarGrade(
  trayGrades1, trayGrades2: TArray<TPropertyWithValueHw>): Boolean;
var
  hwGrade: Tgrade_class;
  hwGrades, hwGradesCad: TArray<Tgrade_class>;
  trayGrade1, trayGrade2: TPropertyWithValueHw;

  hwTipoGrade: TTipo_grade_ec_class;
  hwTipoGrades, hwTipoGradesCad: TArray<TTipo_grade_ec_class>;

  hwTipoGrade1: TTipo_grade_ec_class;
  hwTipoGrades1, hwTipoGradesCad1: TArray<TTipo_grade_ec_class>;

  vCadastrarGrade: boolean;

  vListaTipoGrade: TStringList;
  vListaTipoGrade1: TStringList;

  str: string;
  I: integer;
begin
  Result := True;
  vCadastrarGrade := false;

  vListaTipoGrade := TStringList.Create;
  vListaTipoGrade.Clear;
  vListaTipoGrade.Sorted     := True;
  vListaTipoGrade.Duplicates := dupIgnore;

  vListaTipoGrade1 := TStringList.Create;
  vListaTipoGrade1.Clear;
  vListaTipoGrade1.Sorted     := True;
  vListaTipoGrade1.Duplicates := dupIgnore;

  if not conectar(DataBasePath, True)  then
    Exit;

  try

    try
      if Length(trayGrades2) = 0 then
      begin
        trayGrade2 := TPropertyWithValueHw.Create;
        trayGrade2.name := '';
        trayGrade2.value_name := '';
        trayGrades2 := [trayGrade2];
      end;

      // falta teste para diferenciar a existencia de grade dupla quando for cadastrar a simples e vice versa

      hwGrades      := [];
      hwTipoGrades  := [];
      hwTipoGrades1 := [];
      for trayGrade1 in trayGrades1 do
        for trayGrade2 in trayGrades2 do
        begin
          if (trayGrade1.name.Trim <> '') then
          begin
            if trayGrade1.name.ToUpper.Trim = 'CORES' then
              vListaTipoGrade.Add('COR')
            else if trayGrade1.name.ToUpper.Trim = 'COR' then
              vListaTipoGrade.Add('COR')
            else if trayGrade1.name.ToUpper.Trim = 'GÊNERO' then
              vListaTipoGrade.Add('GÊNERO')
            else if trayGrade1.name.ToUpper.Trim = 'TAMANHO' then
              vListaTipoGrade.Add('TAMANHO')
            else if trayGrade1.name.ToUpper.Trim = 'VOLTAGEM' then
              vListaTipoGrade.Add('VOLTAGEM')
            else if trayGrade1.name.ToUpper.Trim <> '' then
              vListaTipoGrade.Add(trayGrade1.name.Trim.Substring(0, 100));
          end;

          if (trayGrade2.name.Trim <> '') then
          begin
            if trayGrade2.name.ToUpper.Trim = 'CORES' then
              vListaTipoGrade1.Add('COR')
            else if trayGrade2.name.ToUpper.Trim = 'COR' then
              vListaTipoGrade1.Add('COR')
            else if trayGrade2.name.ToUpper.Trim = 'GÊNERO' then
              vListaTipoGrade1.Add('GÊNERO')
            else if trayGrade2.name.ToUpper.Trim = 'TAMANHO' then
              vListaTipoGrade1.Add('TAMANHO')
            else if trayGrade2.name.ToUpper.Trim = 'VOLTAGEM' then
              vListaTipoGrade1.Add('VOLTAGEM')
            else if trayGrade2.name.ToUpper.Trim <> '' then
              vListaTipoGrade1.Add(trayGrade2.name.Trim.Substring(0, 100));
          end;

          hwGrade                  := TGrade_class.Create;
          if trayGrade1.name.ToUpper.Trim = 'CORES' then
            hwGrade.tipo_ec        := 'COR'
          else if trayGrade1.name.ToUpper.Trim = 'COR' then
            hwGrade.tipo_ec        := 'COR'
          else if trayGrade1.name.ToUpper.Trim = 'GÊNERO' then
            hwGrade.tipo_ec        := 'GÊNERO'
          else if trayGrade1.name.ToUpper.Trim = 'TAMANHO' then
            hwGrade.tipo_ec        := 'TAMANHO'
          else if trayGrade1.name.ToUpper.Trim = 'VOLTAGEM' then
            hwGrade.tipo_ec        := 'VOLTAGEM'
          else
            hwGrade.tipo_ec        := trayGrade1.name.Trim.Substring(0, 100);
          hwGrade.descricao_ec     := trayGrade1.value_name.Trim.Substring(0, 100);

          if trayGrade2.name.ToUpper.Trim = 'CORES' then
            hwGrade.tipo_ec1       := 'COR'
          else if trayGrade2.name.ToUpper.Trim = 'COR' then
            hwGrade.tipo_ec1       := 'COR'
          else if trayGrade2.name.ToUpper.Trim = 'GÊNERO' then
            hwGrade.tipo_ec1       := 'GÊNERO'
          else if trayGrade2.name.ToUpper.Trim = 'TAMANHO' then
            hwGrade.tipo_ec1       := 'TAMANHO'
          else if trayGrade2.name.ToUpper.Trim = 'VOLTAGEM' then
            hwGrade.tipo_ec1       := 'VOLTAGEM'
          else
            hwGrade.tipo_ec1       := trayGrade2.name.Trim.Substring(0, 100);
          hwGrade.descricao_ec1    := trayGrade2.value_name.Trim.Substring(0, 100);
          hwGrades := hwGrades + [hwGrade];
        end;

      for hwGrade in hwGrades do
        with ClientOOP(' select g.descricao, g.descricao1, g.ativo from grade g ' +
                   ' where trim(g.tipo_ec) = %s and trim(g.descricao_ec) = %s ' +
                   ' and trim(coalesce(g.tipo_ec1, '''')) = %s and trim(coalesce(g.descricao_ec1, '''')) = %s ' +
                   ' and g.cod_empresa = %d ' +
                   ' union ' +
                   ' select g.descricao, g.descricao1, g.ativo from grade g ' +
                   ' where upper(trim(g.tipo_ec)) = %s and trim(g.descricao_ec) = %s ' +
                   ' and upper(trim(coalesce(g.tipo_ec1, ''''))) = %s and trim(coalesce(g.descricao_ec1, '''')) = %s ' +
                   ' and g.cod_empresa = %d ',
                   [hwGrade.tipo_ec.Trim.Substring(0, 100).Substring(0, 100).QuotedString, hwGrade.descricao_ec.Trim.Substring(0, 100).QuotedString,
                    hwGrade.tipo_ec1.Trim.Substring(0, 100).QuotedString, hwGrade.descricao_ec1.Trim.Substring(0, 100).QuotedString, CodEmpresa,
                    hwGrade.tipo_ec.ToUpper.Trim.Substring(0, 100).QuotedString, hwGrade.descricao_ec.Trim.Substring(0, 100).QuotedString,
                    hwGrade.tipo_ec1.ToUpper.Trim.Substring(0, 100).QuotedString, hwGrade.descricao_ec1.Trim.Substring(0, 100).QuotedString, CodEmpresa]) do

          if not IsEmpty then
          begin
            ShowAtencao('Já existe uma variação (grade) no banco com mesma tipo e descrição.' + #13 + #13 +
              'Variação tipo : ' + hwGrade.tipo_ec.Trim + ' - ' + hwGrade.descricao_ec.Trim + #13 +
              IfThen(hwGrade.tipo_ec1.Trim <> '',
              'Variação tipo1: ' + hwGrade.tipo_ec1.Trim + ' - ' + hwGrade.descricao_ec1.Trim + #13) +
              'Lixeira: ' + IfThen(fequals('ativo', '1'), 'Não', 'Sim'));
            exit;
          end;

      hwTipoGradesCad  := [];
      hwTipoGradesCad1 := [];
      hwGradesCad      := [];

      for I := 0 to vListaTipoGrade.Count - 1 do
      begin
        if SqlOpen(' select t.descricao from tipo_grade_ec t' +
                   ' where trim(t.descricao) = %s' +
                   ' and t.cod_empresa = %d ' +
                   ' union ' +
                   ' select t.descricao from tipo_grade_ec t' +
                   ' where upper(trim(t.descricao)) = %s' +
                   ' and t.cod_empresa = %d ',
                   [vListaTipoGrade[I].Trim.Substring(0, 100).QuotedString,
                    CodEmpresa,
                    vListaTipoGrade[I].ToUpper.Trim.Substring(0, 100).QuotedString,
                    CodEmpresa]).IsEmpty then
        begin
          hwTipoGrade            := TTipo_grade_ec_class.Create;
          hwTipoGrade.descricao  := vListaTipoGrade[I].Trim.Substring(0, 100);
          hwTipoGrades := hwTipoGrades + [hwTipoGrade];

          hwTipoGradesCad := hwTipoGradesCad + [hwTipoGrade];
        end;
      end;

      for I := 0 to vListaTipoGrade1.Count - 1 do
      begin
        if SqlOpen(' select t.descricao from tipo_grade_ec t' +
                   ' where trim(t.descricao) = %s' +
                   ' and t.cod_empresa = %d ' +
                   ' union ' +
                   ' select t.descricao from tipo_grade_ec t' +
                   ' where upper(trim(t.descricao)) = %s' +
                   ' and t.cod_empresa = %d ',
                   [vListaTipoGrade1[I].Trim.Substring(0, 100).QuotedString,
                    CodEmpresa,
                    vListaTipoGrade1[I].ToUpper.Trim.Substring(0, 100).QuotedString,
                    CodEmpresa]).IsEmpty then
        begin
          hwTipoGrade1            := TTipo_grade_ec_class.Create;
          hwTipoGrade1.descricao  := vListaTipoGrade1[I].Trim.Substring(0, 100);
          hwTipoGrades1 := hwTipoGrades1 + [hwTipoGrade1];

          hwTipoGradesCad1 := hwTipoGradesCad1 + [hwTipoGrade1];
        end;
      end;


      for hwGrade in hwGrades do
        if SqlOpen(' select g.descricao, g.descricao1, g.ativo from grade g ' +
                   ' where trim(g.tipo_ec) = %s and trim(g.descricao_ec) = %s ' +
                   ' and trim(coalesce(g.tipo_ec1, '''')) = %s and trim(coalesce(g.descricao_ec1, '''')) = %s ' +
                   ' and g.cod_empresa = %d ' +
                   ' union ' +
                   ' select g.descricao, g.descricao1, g.ativo from grade g ' +
                   ' where upper(trim(g.tipo_ec)) = %s and trim(g.descricao_ec) = %s ' +
                   ' and upper(trim(coalesce(g.tipo_ec1, ''''))) = %s and trim(coalesce(g.descricao_ec1, '''')) = %s ' +
                   ' and g.cod_empresa = %d ',
                   [hwGrade.tipo_ec.Trim.Substring(0, 100).QuotedString, hwGrade.descricao_ec.Trim.Substring(0, 100).QuotedString,
                    hwGrade.tipo_ec1.Trim.Substring(0, 100).QuotedString, hwGrade.descricao_ec1.Trim.Substring(0, 100).QuotedString, CodEmpresa,
                    hwGrade.tipo_ec.ToUpper.Trim.Substring(0, 100).QuotedString, hwGrade.descricao_ec.Trim.Substring(0, 100).QuotedString,
                    hwGrade.tipo_ec1.ToUpper.Trim.Substring(0, 100).QuotedString, hwGrade.descricao_ec1.Trim.Substring(0, 100).QuotedString, CodEmpresa]).IsEmpty then
        begin
          vCadastrarGrade := true;
          hwGradesCad := hwGradesCad + [hwGrade];
        end;

      if not vCadastrarGrade then
      begin
        ShowAtencao('Todas variações (grades) selecionadas já foram cadastradas');
        Result := false;
        Exit;
      end;

      for I := 0 to vListaTipoGrade.Count - 1 do
      begin
        hwTipoGrade.descricao    := vListaTipoGrade[I];
        hwTipoGrade.ativo        := 1;
        hwTipoGrade.cod_empresa  := CodEmpresa;
        SqlExec(hwTipoGrade.SQLMotor('cod_tipo').SQLInsertAutoInc).Transaction;
      end;

      for I := 0 to vListaTipoGrade1.Count - 1 do
      begin
        hwTipoGrade1.descricao   := vListaTipoGrade1[I];
        hwTipoGrade1.ativo       := 1;
        hwTipoGrade1.cod_empresa := CodEmpresa;
        SqlExec(hwTipoGrade1.SQLMotor('cod_tipo').SQLInsertAutoInc).Transaction;
      end;

      ArrayStr := [];
      for hwGrade in hwGradesCad do
      begin
        hwGrade.descricao        := (hwGrade.tipo_ec.Trim  + ' ' + hwGrade.descricao_ec.Trim).Trim.ToUpper;
        hwGrade.descricao1       := (hwGrade.tipo_ec1.Trim + ' ' + hwGrade.descricao_ec1.Trim).Trim.ToUpper;
        hwGrade.cod_empresa      := CodEmpresa;
        hwGrade.ativo            := 1;
        SqlExec(hwGrade.SQLMotor('cod_grade').SQLInsertAutoInc).Transaction;

        ArrayStr := ArrayStr + [IfThen(hwGrade.descricao1.IsEmpty, 'Simples', 'Dupla') + ' ' + hwGrade.tipo_ec.Trim + ' ' + hwGrade.descricao_ec.Trim +
                                IfThen(not hwGrade.descricao1.IsEmpty, ' - ' + hwGrade.tipo_ec1.Trim + ' ' + hwGrade.descricao_ec1.Trim)];
      end;

      if Transacao.InTransaction then
        Transacao.Commit;

      Result := True;

      ArrayStr := ReduceArray(ArrayStr, 120);//tamanho do campo de auditoria
      for Str in ArrayStr do
        Auditor.Sucesso.GravarMensagem(Str);

      {
      for trayGrade1 in trayGrades1 do
        with ClientOOP('select descricao, descricao1, ativo from grade g' +
                       ' where ((g.descricao = %s and coalesce(g.descricao1, '''') = '''')' +
                       ' or (g.tipo_ec = %s and g.descricao_ec = %s and coalesce(g.descricao_ec1, '''') = ''''))' +
                       ' and cod_empresa = %d',
                       [(trayGrade1.name.Trim + ' ' + trayGrade1.value_name.Trim).ToUpper.Trim.Substring(0, 32).QuotedString,
                        trayGrade1.name.Trim.Substring(0, 100).QuotedString,
                        trayGrade1.value_name.Trim.Substring(0, 100).QuotedString,
                        CodEmpresa]) do
          if not IsEmpty then
            raise Exception.Create(Format('Já existe caracteristica(grade) no banco com mesma descrição' + sLineBreak +
                                          'Grade %s - %s / Lixeira: %s',
                                          [fstr('descricao'), fstr('descricao1'),
                                           IfThen(fequals('ativo', '1'), 'Não', 'Sim')]));

      for trayGrade1 in trayGrades1 do
      begin
        hwGrade := Tgrade_class.Create;
        hwGrade.descricao := (trayGrade1.name.Trim + ' ' + trayGrade1.value_name.Trim).ToUpper.Trim;
        hwGrade.cod_empresa := CodEmpresa;
        hwGrade.ativo := 1;
        hwGrade.tipo_ec := trayGrade1.name;
        hwGrade.descricao_ec := trayGrade1.value_name;

        SqlExec(hwGrade.SQLMotor('cod_grade').SQLInsertAutoInc).Transaction;
      end;

      if Transacao.InTransaction then
        Transacao.Commit;

      Result := True;
      }

    except on E: Exception do
      begin
        if Transacao.InTransaction then
          Transacao.Rollback;
        Result := False;
        LogError('THwTrayServicos.CadastrarGrade. Erro: %s', [e.Message]);
        if not SilentMod then
          ShowErro('Erro ao cadastrar grade. %s',  [e.Message]);
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwTrayServicos.CadastrarMarca(trayMarcas: TArray<TBrand>): Boolean;
var
  hwMarca: TMarca_prod_class;
  hwMarcaEc: TMarca_prod_ec_class;
  trayMarca: TBrand;
  vCadastrar: boolean;
  str: string;
begin
  vCadastrar := false;
  if not conectar(DataBasePath, True)  then
    Exit;

  try

    try
      for trayMarca in trayMarcas do
        with ClientOOP(' select marca_prod.cod_marca, marca_prod.descricao_marca, marca_prod.ativo, ' +
                       ' marca_prod.descricao_ec, marca_prod_ec.id_commerce, marca_prod_ec.seqid_ec from marca_prod' +
                       ' left join marca_prod_ec on marca_prod_ec.cod_marca = marca_prod.cod_marca and marca_prod_ec.cod_empresa = ' + IntToStr(CodEmpresa) +
                       ' where trim(marca_prod.descricao_ec) = %s ' +
                       ' union ' +
                       ' select marca_prod.cod_marca, marca_prod.descricao_marca, marca_prod.ativo, ' +
                       ' marca_prod.descricao_ec, marca_prod_ec.id_commerce, marca_prod_ec.seqid_ec from marca_prod' +
                       ' left join marca_prod_ec on marca_prod_ec.cod_marca = marca_prod.cod_marca and marca_prod_ec.cod_empresa = ' + IntToStr(CodEmpresa) +
                       ' where upper(trim(marca_prod.descricao_ec)) = %s ',
                       [trayMarca.brand.Substring(0, 30).Trim.QuotedString,
                        trayMarca.brand.ToUpper.Substring(0, 30).Trim.QuotedString]) do
          if not IsEmpty then
          begin
            ShowAtencao('Já existe uma marca no banco com mesma descrição.' + #13 + #13 +
              IfThen(fint('id_commerce') > 0, 'Id E-Commerce: ' + IntToStr(fint('id_commerce')) + #13, '') +
              'Marca: ' + trim(fstr('descricao_marca')) + ' - ' + trim(fstr('descricao_ec')) + #13 +
              'Lixeira: ' + IfThen(fequals('ativo', '1'), 'Não', 'Sim'));
            exit;
          end;

      for trayMarca in trayMarcas do
        with ClientOOP(' select marca_prod.cod_marca, marca_prod.descricao_marca, marca_prod.descricao_ec, marca_prod.ativo, marca_prod_ec.id_commerce from marca_prod' +
                       ' left join marca_prod_ec on marca_prod_ec.cod_marca = marca_prod.cod_marca and marca_prod_ec.cod_empresa = ' + IntToStr(CodEmpresa) +
                       ' where marca_prod_ec.id_commerce = %d and marca_prod_ec.cod_empresa = %d',
                       [trayMarca.id.ToInteger, CodEmpresa]) do
          if not IsEmpty then
          begin
            ShowAtencao('Já existe uma marca no banco com mesmo id e-commerce.' + #13 + #13 +
              'Id E-Commerce: ' + IntToStr(trayMarca.id.ToInteger) + #13 +
              'Marca: ' + IntToStr(fint('cod_marca')) + ' - ' +  trim(fstr('descricao_ec')) + #13 +
              'Lixeira: ' + IfThen(fequals('ativo', '1'), 'Não', 'Sim'));
            exit;
          end;

      for trayMarca in trayMarcas do
        if SqlOpen(' select marca_prod.cod_marca, marca_prod.descricao_marca, marca_prod.descricao_ec, marca_prod.ativo, marca_prod_ec.id_commerce from marca_prod ' +
                   ' left join marca_prod_ec on marca_prod_ec.cod_marca = marca_prod.cod_marca and marca_prod_ec.cod_empresa = ' + IntToStr(CodEmpresa) +
                   ' where trim(marca_prod.descricao_ec) = %s ' +
                   ' union ' +
                   ' select marca_prod.cod_marca, marca_prod.descricao_marca, marca_prod.descricao_ec, marca_prod.ativo, marca_prod_ec.id_commerce from marca_prod ' +
                   ' left join marca_prod_ec on marca_prod_ec.cod_marca = marca_prod.cod_marca and marca_prod_ec.cod_empresa = ' + IntToStr(CodEmpresa) +
                   ' where upper(trim(marca_prod.descricao_ec)) = %s ',
                   [trayMarca.brand.Substring(0, 30).Trim.QuotedString,
                    trayMarca.brand.ToUpper.Substring(0, 30).Trim.QuotedString]).IsEmpty then
          begin
            vCadastrar := true;
            Break;
          end;

      if not vCadastrar then
      begin
        ShowAtencao('Todas marcas selecionadas já foram cadastradas');
        Result := false;
        Exit;
      end;

      ArrayStr := [];
      for trayMarca in trayMarcas do
      begin
        try
          hwMarca := TMarca_prod_class.Create;
          hwMarca.descricao_marca := trayMarca.brand.Trim.ToUpper();
          hwMarca.ativo := 1;
          hwMarca.tipo_marca := 'P';
          hwMarca.descricao_ec := trayMarca.brand.Trim;

          SqlExec(hwMarca.SQLMotor('cod_marca').SQLInsert).Transaction;

          with SqlOpen(' select cod_marca, descricao_marca from marca_prod ' +
            ' where trim(descricao_marca) = ' + hwMarca.descricao_marca.Trim.QuotedString +
            ' and trim(descricao_ec) = ' + trayMarca.brand.Trim.QuotedString +
            ' order by cod_marca desc ') do
              hwMarca.cod_marca := FieldByName('cod_marca').AsInteger;

          if  hwMarca.cod_marca > 0 then
          begin
            hwMarcaEc := TMarca_prod_ec_class.Create;
            hwMarcaEc.cod_marca := hwMarca.cod_marca;
            hwMarcaEc.cod_empresa := CodEmpresa;
            hwMarcaEc.id_commerce := trayMarca.id.ToInteger;

            SqlExec(hwMarcaEc.SQL('cod_marca').SQLUpdateOrInsert).Transaction;
          end;
        except on E: Exception do
          begin
            if Transacao.InTransaction then
              Transacao.Rollback;
            Result := False;
            LogError('THwTrayServicos.CadastrarMarca. tray %s %s. Erro: %s', [trayMarca.id, trayMarca.brand, e.Message]);
            if not SilentMod then
              ShowErro('Erro ao cadastrar CadastrarMarca(s). %s',  [e.Message]);
            exit;
          end;
        end;

        ArrayStr := ArrayStr + [trayMarca.id + '-' + trayMarca.brand];
      end;

      if Transacao.InTransaction then
        Transacao.Commit;

      Result := True;

      ArrayStr := ReduceArray(ArrayStr, 128);//tamanho do campo de auditoria
      for Str in ArrayStr do
        Auditor.Sucesso.GravarMensagem(Str);

    except on E: Exception do
      begin
        if Transacao.InTransaction then
          Transacao.Rollback;
        Result := False;
        LogError('THwTrayServicos.CadastrarMarca. tray %s %s. Erro: %s', [trayMarca.id, trayMarca.brand , e.Message]);
        if not SilentMod then
          ShowErro('Erro ao cadastrar Marca. %s',  [e.Message]);
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwTrayServicos.ConcederPermissoesTabelasViews: boolean;
var
  I: Integer;
  vListaTabelas: TStringList;
  vListaProcedures: TStringList;
begin
  try
    Result := False;

    vListaTabelas := TStringList.Create;
    vListaTabelas.Clear;

    vListaProcedures := TStringList.Create;
    vListaProcedures.Clear;

    try
      ProgressUtil.Msg('Verificando permissão tabelas');

      with SqlOpen(' SELECT RDB$RELATION_NAME FROM RDB$RELATIONS ' +
                   ' WHERE RDB$VIEW_BLR IS NULL ' +
                   ' AND RDB$SYSTEM_FLAG = 0 ' +
                   ' AND COALESCE((SELECT COUNT(*) PERMISSAO FROM RDB$USER_PRIVILEGES RP ' +
                   '               WHERE RP.RDB$USER = ''REPL'' ' +
                   '               AND RP.RDB$RELATION_NAME = RDB$RELATIONS.RDB$RELATION_NAME), 0) < 5 ' +
                   ' ORDER BY 1 ') do
      begin
        First;
        while not Eof do
        begin
          vListaTabelas.Add(trim(FieldByName('RDB$RELATION_NAME').AsString));

          Next;
        end;
      end;
    finally
      ProgressUtil.Terminate();
    end;

    try
      ProgressUtil.Msg('Verificando permissão procedures');

      with SqlOpen(' SELECT RDB$PROCEDURE_NAME FROM RDB$PROCEDURES ' +
                   ' WHERE COALESCE((SELECT COUNT(*) PERMISSAO FROM RDB$USER_PRIVILEGES RP ' +
                   '                 WHERE RP.RDB$USER = ''REPL'' ' +
                   '                 AND RP.RDB$RELATION_NAME = RDB$PROCEDURE_NAME), 0) <= 0 ' +
                   ' ORDER BY 1 ') do
      begin
        First;
        while not Eof do
        begin
          vListaProcedures.Add(trim(FieldByName('RDB$PROCEDURE_NAME').AsString));

          Next;
        end;
      end;
    finally
      ProgressUtil.Terminate();
    end;

    if vListaTabelas.Count > 0 then
    begin
      try
        ProgressUtil.Msg('Criando permissão tabelas');
      finally
        ProgressUtil.Terminate();
      end;

      try
        for I := 0 to vListaTabelas.Count - 1 do
        begin
//          try
//            ProgressUtil.Msg('Criando permissão tabela ' + vListaTabelas[I] + ' REPL');

            with SqlExec('grant all on ' + vListaTabelas[I] + ' to REPL ').Transaction do
              if InTransaction then
                Commit;
//          except on E: Exception do
//            begin
//              LogError('THwTrayServicos.ConcederPermissoesTabelasViews. Tabela %s Erro: %s', [vListaTabelas[I], e.Message]);
//              if not SilentMod then
//                ShowErro('Erro ao conceder permissões tabelas e views. Tabela %s Erro %s',  [vListaTabelas[I], e.Message]);
//            end;
//          end;
        end;
      finally
        ProgressUtil.Terminate();
      end;
    end;

    if vListaProcedures.Count > 0 then
    begin
      try
        ProgressUtil.Msg('Criando permissão procedures');
      finally
        ProgressUtil.Terminate();
      end;

      try
        for I := 0 to vListaProcedures.Count - 1 do
        begin
//          try
//            ProgressUtil.Msg('Criando permissão procedure ' + vListaProcedures[I] + ' REPL');

            with SqlExec('grant execute on procedure ' + vListaProcedures[I] + ' to REPL ').Transaction do
              if InTransaction then
                Commit;
//          except on E: Exception do
//            begin
//              LogError('THwTrayServicos.ConcederPermissoesTabelasViews. Procedure %s Erro: %s', [vListaProcedures[I], e.Message]);
//              if not SilentMod then
//                ShowErro('Erro ao conceder permissões tabelas e views. Procedyre %s Erro %s',  [vListaProcedures[I], e.Message]);
//            end;
//          end;
        end;
      finally
        ProgressUtil.Terminate();
      end;
    end;

    Result := True;
  except on E: Exception do
    begin
        if Transacao.InTransaction then
          Transacao.Rollback;
        Result := False;
        LogError('THwTrayServicos.ConcederPermissoesTabelasViews. Erro: %s', [e.Message]);
        if not SilentMod then
          ShowErro('Erro ao conceder permissões tabelas e views. %s',  [e.Message]);
    end;
  end;
end;

constructor THwTrayServicos.Create(SilentMode: Boolean);
begin
  inherited;
  trayConsumeApi            := TTrayConsumeApi.Create(UrlApi, FCnpj);
end;

function THwTrayServicos.Delete(controller: string): Boolean;
begin
  if not conectar(DataBasePath, True)  then
    Exit;

  try

    try
      if (not GetDadosApi) then
        Exit;

      Result := trayConsumeApi.Delete(controller, []);

    except on E: Exception do
      begin
        LogError('THwTrayServicos.Delete %s %s', [controller, e.Message]);
        if not SilentMod then
          ShowErro('Erro ao obter lista %s' + sLineBreak + e.Message, [controller]);
      end;
    end;

  finally
    desconectar;
  end;
end;

destructor THwTrayServicos.Destroy;
begin
  trayConsumeApi.Free;

  inherited;
end;

function THwTrayServicos.DesvincularCategoria(hwId: Integer): Boolean;
begin
  if not conectar(DataBasePath, 'REPL', 'masterkey', True)  then
    Exit;

  try

    try

      with SqlExec('update categoria set id_commerce = null' +
                   ' where cod_categoria = %d and cod_empresa = %d',
                   [hwId, CodEmpresa]).Transaction do
        if InTransaction then
          Commit;

      Result := True;

      Auditor.Sucesso.GravarMensagem('');

    except on E: Exception do
      begin
        Result := False;
        LogError('THwTrayServicos.DesvincularCategoria. HwId %d. Erro: %s', [hwId, e.Message]);
        if not SilentMod then
          ShowErro('Erro ao desvincular Categoria. %s',  [e.Message]);
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwTrayServicos.DesvincularGrade(Primaria: Boolean;
  hwId: Integer): Boolean;
begin
  if not conectar(DataBasePath, 'REPL', 'masterkey', True)  then
    Exit;

  try

    try

      with SqlExec('update grade set tipo_ec%s = null, descricao_ec%s = null' +
                   ' where cod_grade = %d and cod_empresa = %d',
                   [IfThen(not Primaria, '1'), IfThen(not Primaria, '1'),
                    hwId, CodEmpresa]).Transaction do
        if InTransaction then
          Commit;

      Result := True;

      Auditor.Sucesso.GravarMensagem(IfThen(Primaria, 'Primaria', 'Secundaria'));

    except on E: Exception do
      begin
        Result := False;
        LogError('THwTrayServicos.DesvincularGrade. HwId %d. Erro: %s', [hwId, e.Message]);
        if not SilentMod then
          ShowErro('Erro ao desvincular Grade. %s',  [e.Message]);
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwTrayServicos.DesvincularKitProduto(hwCodigoKit: Integer): Boolean;
begin
  with Auditor.Alterar.Table(tbKitProduto).Processo('PRO417')
    .Key('%d', [hwCodigoKit])
    .Msg('Kit Prod Sistema %d', [hwCodigoKit]) do
    if not Permitido then
      Exit;

  if not conectar(DataBasePath, 'REPL', 'masterkey', True)  then
    Exit;

  try

    try
      with SqlExec(' update kits_prod_ec set sinc_ecommerce = ''N'', id_commerce = null' +
              ' where codigo_kit = %d ' +
              ' and cod_empresa = %d ', [hwCodigoKit, CodEmpresa]).Transaction do
        if InTransaction then
          Commit;

       with SqlExec(' update kits_prod set id_commerce = null' +
              ' where codigo_kit = %d ' +
              ' and cod_empresa = %d ', [hwCodigoKit, CodEmpresa]).Transaction do
        if InTransaction then
          Commit;
      Result := True;

      Auditor.Sucesso.GravarMensagem('');

    except on E: Exception do
      begin
        Result := False;
        LogError('THwTrayServicos.DesvincularKitProduto. Codigo Kit %d. Erro: %s', [hwCodigoKit, e.Message]);
        if not SilentMod then
          ShowErro('Erro ao vincular Kit de Produto. %s',  [e.Message]);
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwTrayServicos.DesvincularMarca(hwId: Integer): Boolean;
begin
  if not conectar(DataBasePath, 'REPL', 'masterkey', True)  then
    Exit;

  try

    try

      with SqlExec('update marca_prod_ec set id_commerce = null' +
                   ' where cod_marca = %d and cod_empresa = %d', [hwId, CodEmpresa]).Transaction do
        if InTransaction then
          Commit;

      Result := True;

      Auditor.Sucesso.GravarMensagem('');

    except on E: Exception do
      begin
        Result := False;
        LogError('THwTrayServicos.DesvincularMarca. HwId %d. Erro: %s', [hwId, e.Message]);
        if not SilentMod then
          ShowErro('Erro ao vincular Marca. %s',  [e.Message]);
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwTrayServicos.DesvincularProduto(hwGrupoProd: Integer; hwCodProd: string): Boolean;
begin
  with Auditor.Alterar.Table(tbProduto).Processo('PRO386')
    .Key('%d-%s', [hwGrupoProd, hwCodProd])
    .Msg('Prod Sistema %d-%s', [hwGrupoProd, hwCodProd]) do
    if not Permitido then
      Exit;

  if not conectar(DataBasePath, 'REPL', 'masterkey', True)  then
    Exit;

  try

    try
      with SqlExec(' update produtos_ec set sinc_ecommerce = ''N'', id_commerce = null' +
              ' where grupo_prod = %d ' +
              ' and cod_prod = %s ' +
              ' and cod_empresa = %d ', [hwGrupoProd, hwCodProd, CodEmpresa]).Transaction do
        if InTransaction then
          Commit;

      with SqlExec(' update produtos_ec_grade set sinc_ecommerce = ''N'', id_commerce = null' +
              ' where grupo_prod = %d ' +
              ' and cod_prod = %s ' +
              ' and cod_empresa = %d ', [hwGrupoProd, hwCodProd, CodEmpresa]).Transaction do
        if InTransaction then
          Commit;

       with SqlExec(' update produtos set id_commerce = null' +
              ' where grupo_prod = %d ' +
              ' and cod_prod = %s ' +
              ' and cod_empresa = %d ', [hwGrupoProd, hwCodProd, CodEmpresa]).Transaction do
        if InTransaction then
          Commit;
      Result := True;

      Auditor.Sucesso.GravarMensagem('');

    except on E: Exception do
      begin
        Result := False;
        LogError('THwTrayServicos.DesvincularProduto. Grupo Prod %d Cod Prod %s. Erro: %s', [hwGrupoProd, hwCodProd, e.Message]);
        if not SilentMod then
          ShowErro('Erro ao vincular Produto. %s',  [e.Message]);
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwTrayServicos.DesvincularProdutoKit(hwCodigoKit: Integer; hwGrupoProd: Integer; hwCodProd: string): Boolean;
begin
  with Auditor.Alterar.Table(tbProdutoKit).Processo('PRO422')
    .Key('%d-%d-%s', [hwCodigoKit, hwGrupoProd, hwCodProd])
    .Msg('Prod do Kit Sistema %d, Grupo %d CodProd %s', [hwCodigoKit, hwGrupoProd, hwCodProd]) do
    if not Permitido then
      Exit;

  if not conectar(DataBasePath, 'REPL', 'masterkey', True)  then
    Exit;

  try

    try
      with SqlExec(' update kits_prod_kits set sinc_ecommerce = ''N'', id_commerce = null' +
              ' where codigo_kit = %d ' +
              ' and grupo_prod = %d ' +
              ' and cod_prod = %s ' +
              ' and cod_empresa = %d ', [hwCodigoKit, hwGrupoProd, hwCodProd, CodEmpresa]).Transaction do
        if InTransaction then
          Commit;
      Result := True;

      Auditor.Sucesso.GravarMensagem('');

    except on E: Exception do
      begin
        Result := False;
        LogError('THwTrayServicos.DesvincularProdutoKit. Codigo Kit %d. Erro: %s', [hwCodigoKit, e.Message]);
        if not SilentMod then
          ShowErro('Erro ao vincular Produto do kit. %s',  [e.Message]);
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwTrayServicos.GetList<T>(controller, name: string;
  params: TArray<string>): TArray<T>;
begin
  if not conectar(DataBasePath, True)  then
    Exit;

  try

    try
      if (not GetDadosApi) then
        Exit;

      Result := trayConsumeApi.Get<T>(controller, name, params);

    except on E: Exception do
      begin
        LogError('THwTrayServicos.Get%s %s', [controller, e.Message]);
        if not SilentMod then
          ShowErro('Erro ao obter lista %s' + sLineBreak + e.Message, [controller]);
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwTrayServicos.GetMarcas(marcaOOP: TConexao_OOP; campo, condicao,
  texto: string): TConexao_OOP;
var
  sql, aliasEmp: string;
  I: Integer;
begin
  Result := marcaOOP;

  if texto.Trim.IsEmpty then
  begin
    ShowErro('Conteúdo da consulta não informado.');
    Exit;
  end;


  if not MatchText(condicao, ['Começa', 'Igual', 'Esta contido']) then
  begin
    ShowErro('Campo de condição inválido.' + chr(13) + 'Valores válidos: "Começa", "Igual", "Esta contido"');
    Exit;
  end;

  if not MatchText(campo, ['Cod Marca', 'Id Ecommerce']) then
  begin
    if condicao = 'Começa' then
      texto := texto + '%'
    else if condicao = 'Igual' then
      texto := texto
    else if condicao = 'Esta contido' then
      texto := '%' + texto + '%';

    texto := texto.QuotedString;

    condicao := IfThen(condicao = 'Igual', '=', 'like');

  end
  else if not TryStrToInt(texto.Trim, I) then
  begin
    ShowErro('Conteúdo da consulta inválido.' + chr(13) + 'Verifique os dados de sua pesquisa e tente novamente.');
    Exit;
  end
  else
    condicao := '=';

  aliasEmp := 'marca_prod';
  if campo = 'Cod Marca' then
    campo := 'marca_prod.cod_marca'
  else if campo = 'Descrição da Marca' then
    campo := 'marca_prod.descricao_marca'
  else if campo = 'Id Ecommerce' then
    campo := 'marca_prod_ec.id_commerce'
  else
  begin
    ShowErro('Campo da consulta inválido.' + chr(13) + 'Verifique os dados de sua pesquisa e tente novamente.');
    Exit;
  end;

  if not conectar(DataBasePath, True)  then
    Exit;

  try
    try

      //??? tem de olhar o ativo = 1
      sql := Format(' select marca_prod.cod_marca, marca_prod.descricao_marca, marca_prod.ativo, ' +
                    ' marca_prod.descricao_ec, marca_prod_ec.id_commerce, marca_prod_ec.seqid_ec from marca_prod ' +
                    ' left join marca_prod_ec on marca_prod_ec.cod_marca = marca_prod.cod_marca and marca_prod_ec.cod_empresa = %d ' +
                    ' where %s %s %s and marca_prod.ativo = 1' +
                    ' order by marca_prod.descricao_marca',
                    [CodEmpresa, campo, condicao, texto]);

      if Result = nil then
        Result := NewClientOOP(sql)
      else
        Result.ClientOpen(sql);

    except on E: Exception do
      begin
        LogError('THwTrayServicos.GetMarcas. %s', [e.Message]);
        if not SilentMod then
          ShowErro('Erro ao obter Marcas do banco. %s',  [e.Message]);
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwTrayServicos.GetMarcas(marcaOOP: TConexao_OOP;
  pIds: string): TConexao_OOP;
var
  sql: string;
  vcondicao: string;
  vtexto: string;
begin
  Result := marcaOOP;

  if not conectar(DataBasePath, True)  then
    Exit;

  try
    try

      //??? tem de olhar o ativo = 1
      sql := Format(' select marca_prod.cod_marca, marca_prod.descricao_marca, marca_prod.ativo, ' +
                    ' marca_prod.descricao_ec, marca_prod_ec.id_commerce, marca_prod_ec.seqid_ec from marca_prod ' +
                    ' left join marca_prod_ec on marca_prod_ec.cod_marca = marca_prod.cod_marca and marca_prod_ec.cod_empresa = %d ' +
                    ' where marca_prod.ativo = 1 ' +
                    ' order by marca_prod.descricao_marca ', [CodEmpresa]);

      if Result = nil then
        Result := NewClientOOP(sql)
      else
        Result.ClientOpen(sql);

    except on E: Exception do
      begin
        LogError('THwTrayServicos.GetMarcas. %s', [e.Message]);
        if not SilentMod then
          ShowErro('Erro ao obter Marcas do banco. %s',  [e.Message]);
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwTrayServicos.GetMarcas(marcaOOP: TConexao_OOP; onlySinc,
  withImages: Boolean): TConexao_OOP;
var
  sql: string;
  vcondicao: string;
  vtexto: string;
begin
  Result := marcaOOP;

  if not conectar(DataBasePath, True)  then
    Exit;

  try
    try

      //??? tem de olhar o ativo = 1
      sql := Format(' select marca_prod.cod_marca, marca_prod.descricao_marca, marca_prod.ativo, ' +
                    ' marca_prod.descricao_ec, marca_prod_ec.id_commerce, marca_prod_ec.seqid_ec from marca_prod ' +
                    ' left join marca_prod_ec on marca_prod_ec.cod_marca = marca_prod.cod_marca and marca_prod_ec.cod_empresa = %d ' +
                    ' where ativo = 1 ' +
                    ' order by marca_prod.descricao_marca ',
                    [CodEmpresa]);

      if Result = nil then
        Result := NewClientOOP(sql)
      else
        Result.ClientOpen(sql);

    except on E: Exception do
      begin
        LogError('THwTrayServicos.GetMarcas. %s', [e.Message]);
        if not SilentMod then
          ShowErro('Erro ao obter Marcas do banco. %s',  [e.Message]);
      end;
    end;

  finally
    desconectar;
  end;
end;


function THwTrayServicos.GetProdutos(prodOOP: TConexao_OOP;
  pIds: string): TConexao_OOP;
var
  sql: string;
  vcondicao: string;
  vtexto: string;
begin
  Result := prodOOP;

  if not conectar(DataBasePath, True)  then
    Exit;

  try
    try

      //??? tem de olhar o ativo = 1
      sql := Format(' select pr.grupo_prod, pr.cod_prod, pr.cod_empresa, pr.num_fab_prod, pr.descr_prod, 0 codigo_kit, pr.ativo,' +
                    ' pe.cod_categoria, pr.altura_prod, pr.comprimento_prod, pr.largura_prod, pr.peso_brut_prod, pr.peso_liq_prod, ' +
                    ' pe.id_commerce, pe.descr_prod_res, ' +
                    ' (select first 1 coalesce(grade.tipo_ec, '''') from cod_grade_prod ' +
                    '  inner join grade on ' +
                    '     grade.cod_grade = cod_grade_prod.cod_grade ' +
                    '     and grade.cod_empresa = cod_grade_prod.cod_empresa ' +
                    '     where cod_grade_prod.grupo_prod = pr.grupo_prod ' +
                    '     and cod_grade_prod.cod_prod = pr.cod_prod ' +
                    '     and cod_grade_prod.cod_empresa = pr.cod_empresa) tipo_ec, ' +
                    ' (select first 1 coalesce(grade.tipo_ec1, '''') from cod_grade_prod ' +
                    '  inner join grade on ' +
                    '     grade.cod_grade = cod_grade_prod.cod_grade ' +
                    '     and grade.cod_empresa = cod_grade_prod.cod_empresa ' +
                    '     where cod_grade_prod.grupo_prod = pr.grupo_prod ' +
                    '     and cod_grade_prod.cod_prod = pr.cod_prod ' +
                    '     and cod_grade_prod.cod_empresa = pr.cod_empresa) tipo_ec1, ' +
                    ' (select case when (count(*) > 1) then 1 else 0 end from cod_grade_prod gr ' +
                    '     where gr.grupo_prod = pr.grupo_prod ' +
                    '     and gr.cod_prod = pr.cod_prod ' +
                    '     and gr.cod_empresa = pr.cod_empresa ' +
                    '     and gr.cod_grade > 0) tem_grade ' +
                    ' from produtos pr ' +
                    ' left join produtos_ec pe on pe.grupo_prod = pr.grupo_prod and pe.cod_prod = pr.cod_prod and pe.cod_empresa = pr.cod_empresa ' +
                    ' where pr.cod_empresa = %d ' +
                    ' and pr.ativo = 1 ' +
                    ' and pe.id_commerce in (%s) ' +
                    ' and coalesce(pe.sinc_ecommerce, '''') in ('''',%s)' +
                    ' order by pr.descr_prod',
                    [CodEmpresa, pIds, string('S').QuotedString + ',' + string('N').QuotedString]);

      if Result = nil then
        Result := NewClientOOP(sql)
      else
        Result.ClientOpen(sql);

    except on E: Exception do
      begin
        LogError('THwTrayServicos.GetProdutos. %s', [e.Message]);
        if not SilentMod then
          ShowErro('Erro ao obter Produtos do banco. %s',  [e.Message]);
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwTrayServicos.GetProdutosKit(pId: Integer): TConexao_OOP;
var
  sql: string;
begin
  Result := AllProdutosKit;

  if not conectar(DataBasePath, True)  then
    Exit;

  try

    try
      //??? tem de olhar o ativo = 1
      sql := ' select kp.codigo_kit, ' +
        ' kp.grupo_prod, ' +
        ' kp.cod_prod, ' +
        ' kp.num_fab_prod, ' +
        ' pr.descr_prod, ' +
        ' kp.cod_empresa, ' +
        ' kp.descr_prod_kit, ' +
        ' kp.id_commerce, ' +
        ' pe.id_commerce as id_commerce_prod, ' +
        ' (select case when (count(*) > 1) then 1 else 0 end from cod_grade_prod gr ' +
        '     where gr.grupo_prod = pr.grupo_prod ' +
        '     and gr.cod_prod = pr.cod_prod ' +
        '     and gr.cod_empresa = pr.cod_empresa) tem_grade ' +
        ' from kits_prod kit ' +
        ' inner join kits_prod_kits kp on kp.codigo_kit = kit.codigo_kit and kp.cod_empresa = kit.cod_empresa ' +
        ' left join kits_prod_ec ke on ke.codigo_kit = kit.codigo_kit and ke.cod_empresa = kit.codigo_kit ' +
        ' inner join produtos pr on pr.grupo_prod = kp.grupo_prod and pr.cod_prod = kp.cod_prod and pr.cod_empresa = kp.cod_empresa ' +
        ' left join produtos_ec pe on pe.grupo_prod = pr.grupo_prod and pe.cod_prod = pr.cod_prod and pe.cod_empresa = pr.cod_empresa ' +
        ' where kit.codigo_kit = ' + IntToStr(pId) +
        ' and kit.cod_empresa = ' + IntToStr(CodEmpresa);

      if AllProdutosKit = nil then
        AllProdutosKit := NewClientOOP(sql)
      else
        AllProdutosKit.ClientOpen(sql);

    except on E: Exception do
      begin
        LogError('THwTrayServicos.GetProdutosKit. %s', [e.Message]);
        if not SilentMod then
          ShowErro('Erro ao obter Produtos Kit do GetProdutosKit. %s',  [e.Message]);
      end;
    end;

  finally
    Result := AllProdutosKit;

    desconectar;
  end;
end;

function THwTrayServicos.GetProdutos(prodOOP: TConexao_OOP;
  campo, condicao, texto: string): TConexao_OOP;
var
  sql, aliasEmp: string;
  I: Integer;
begin
  Result := prodOOP;

  if texto.Trim.IsEmpty then
  begin
    ShowErro('Conteúdo da consulta não informado.');
    Exit;
  end;


  if not MatchText(condicao, ['Começa', 'Igual', 'Esta contido']) then
  begin
    ShowErro('Campo de condição inválido.' + chr(13) + 'Valores válidos: "Começa", "Igual", "Esta contido"');
    Exit;
  end;

  if not MatchText(campo, ['Grupo Produto', 'Id Ecommerce']) then
  begin
    if condicao = 'Começa' then
      texto := texto + '%'
    else if condicao = 'Igual' then
      texto := texto
    else if condicao = 'Esta contido' then
      texto := '%' + texto + '%';

    texto := texto.QuotedString;

    condicao := IfThen(condicao = 'Igual', '=', 'like');

  end
  else if not TryStrToInt(texto.Trim, I) then
  begin
    ShowErro('Conteúdo da consulta inválido.' + chr(13) + 'Verifique os dados de sua pesquisa e tente novamente.');
    Exit;
  end
  else
    condicao := '=';

  aliasEmp := 'pr';
  if campo = 'Grupo Produto' then
    campo := 'pr.grupo_prod'
  else if campo = 'Cod Produto' then
    campo := 'pr.cod_prod'
  else if campo = 'Numero Fabricação Produto' then
    campo := 'pr.num_fab_prod'
  else if campo = 'Descrição do Produto' then
    campo := 'pr.descr_prod'
  else if campo = 'Id Ecommerce' then
  begin
    campo := 'pe.id_commerce';
    aliasEmp := 'pe';
  end
  else
  begin
    ShowErro('Campo da consulta inválido.' + chr(13) + 'Verifique os dados de sua pesquisa e tente novamente.');
    Exit;
  end;

  if not conectar(DataBasePath, True)  then
    Exit;

  try
    try

      //??? tem de olhar o ativo = 1
      sql := Format(' select pr.grupo_prod, pr.cod_prod, pr.cod_empresa, pr.num_fab_prod, pr.descr_prod, 0 codigo_kit, pr.ativo,' +
                    ' pe.cod_categoria, pr.altura_prod, pr.comprimento_prod, pr.largura_prod, pr.peso_brut_prod, pr.peso_liq_prod, ' +
                    ' pe.id_commerce, pe.descr_prod_res, ' +
                    ' (select first 1 coalesce(grade.tipo_ec, '''') from cod_grade_prod ' +
                    '  inner join grade on ' +
                    '     grade.cod_grade = cod_grade_prod.cod_grade ' +
                    '     and grade.cod_empresa = cod_grade_prod.cod_empresa ' +
                    '     where cod_grade_prod.grupo_prod = pr.grupo_prod ' +
                    '     and cod_grade_prod.cod_prod = pr.cod_prod ' +
                    '     and cod_grade_prod.cod_empresa = pr.cod_empresa) tipo_ec, ' +
                    ' (select first 1 coalesce(grade.tipo_ec1, '''') from cod_grade_prod ' +
                    '  inner join grade on ' +
                    '     grade.cod_grade = cod_grade_prod.cod_grade ' +
                    '     and grade.cod_empresa = cod_grade_prod.cod_empresa ' +
                    '     where cod_grade_prod.grupo_prod = pr.grupo_prod ' +
                    '     and cod_grade_prod.cod_prod = pr.cod_prod ' +
                    '     and cod_grade_prod.cod_empresa = pr.cod_empresa) tipo_ec1, ' +
                    ' (select case when (count(*) > 1) then 1 else 0 end from cod_grade_prod gr ' +
                    '     where gr.grupo_prod = pr.grupo_prod ' +
                    '     and gr.cod_prod = pr.cod_prod ' +
                    '     and gr.cod_empresa = pr.cod_empresa ' +
                    '     and gr.cod_grade > 0) tem_grade ' +
                    ' from produtos pr' +
                    ' left join produtos_ec pe on pe.grupo_prod = pr.grupo_prod and pe.cod_prod = pr.cod_prod and pe.cod_empresa = pr.cod_empresa ' +
                    ' where %s %s %s and %s.cod_empresa = %d and pr.ativo = 1 ' +
                    ' order by pr.descr_prod',
                    [campo, condicao, texto, aliasEmp, CodEmpresa]);

      if Result = nil then
        Result := NewClientOOP(sql)
      else
        Result.ClientOpen(sql);

      sql := Format(' select pr.grupo_prod, pr.cod_prod, pimg.cod_grade, 0 codigo_kit, pimg.lista_imagens, pimg.url_imagens' +
             ' from produtos pr' +
             ' left join retorna_img_prod(pr.grupo_prod, pr.cod_prod, 0, pr.cod_empresa) pimg on 1 = 1 ' +
             ' where %s %s %s and %s.cod_empresa = %d' +
             ' order by pr.descr_prod',
              [campo, condicao, texto, aliasEmp, CodEmpresa]);

      if AllImages = nil then
        AllImages := NewClientOOP(sql)
      else
        AllImages.ClientOpen(sql);

    except on E: Exception do
      begin
        LogError('THwTrayServicos.GetProdutos. %s', [e.Message]);
        if not SilentMod then
          ShowErro('Erro ao obter Produtos do banco. %s',  [e.Message]);
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwTrayServicos.GetVariacoes(trayVariacoes: TArray<TVariant>;
  pGrupoProd: Integer; pCodProd: string;
  pTipoEc: string; pTipoEc1: string; pId: Integer): TConexao_OOP;
var
  trayVariacao: TVariant;
  vtemp: string;
  vtempini: string;
  sql: string;
begin
  Result := AllVariacoes;

  if not conectar(DataBasePath, True)  then
    Exit;

  try

    try
      for trayVariacao in trayVariacoes do
      begin
        if trim(sql) <> '' then
          sql := sql + ' union ';

        if Length(trayVariacao.Sku) > 1 then
        begin
          vtempini :=
            ' select first 1 ' + IntToStr(pGrupoProd) + ' grupo_prod, ' +
            QuotedStr(pCodProd) + ' cod_prod, ' +
            ' grade.cod_grade, ' +
            ' trim(coalesce(grade.descricao, '''')) descricao, ' +
            ' trim(coalesce(grade.descricao1, '''')) descricao1, ' +
            ' trim(coalesce(grade.tipo_ec, '''')) tipo_ec, ' +
            ' trim(coalesce(grade.descricao_ec, '''')) descricao_ec, ' +
            ' trim(coalesce(grade.tipo_ec1, '''')) tipo_ec1, ' +
            ' trim(coalesce(grade.descricao_ec1, '''')) descricao_ec1, ' +
            ' (select first 1 case when (produtos_ec_grade.cod_grade > 0) then ' +
            '         1 ' +
            '      else ' +
            '         0 ' +
            '  end gr_adicionadas from produtos_ec ' +
            '  inner join cod_grade_prod on ' +
            '      cod_grade_prod.grupo_prod = produtos_ec.grupo_prod ' +
            '      and cod_grade_prod.cod_prod = produtos_ec.cod_prod ' +
            '      and cod_grade_prod.cod_empresa = produtos_ec.cod_empresa ' +
            '  inner join grade on ' +
            '      grade.cod_grade = cod_grade_prod.cod_grade ' +
            '      and grade.cod_empresa = cod_grade_prod.cod_empresa ' +
            '  inner join produtos_ec_grade on ' +
            '      produtos_ec_grade.grupo_prod = cod_grade_prod.grupo_prod ' +
            '      and produtos_ec_grade.cod_prod = cod_grade_prod.cod_prod ' +
            '      and produtos_ec_grade.cod_grade = cod_grade_prod.cod_grade ' +
            '      and produtos_ec_grade.cod_empresa = cod_grade_prod.cod_empresa ' +
            '  where produtos_ec.grupo_prod = ' + IntToStr(pGrupoProd) +
            '  and produtos_ec.cod_prod = ' + QuotedStr(pCodProd) +
            '  and produtos_ec.cod_empresa = ' + IntToStr(CodEmpresa) + ') gr_adicionadas, ' +
            ' (select produtos_ec_grade.id_commerce from produtos_ec_grade ' +
            '  where produtos_ec_grade.grupo_prod = ' + IntToStr(pGrupoProd) +
            '  and produtos_ec_grade.cod_prod = ' + QuotedStr(pCodProd) +
            '  and produtos_ec_grade.cod_grade = grade.cod_grade ' +
            '  and produtos_ec_grade.cod_empresa = ' + IntToStr(CodEmpresa) + ') id_commerce ' +
            ' from grade ' +
            ' where ';

            vtemp := vtempini +
              ' grade.tipo_ec = ' + pTipoEc.Trim.QuotedString +
              ' and grade.descricao_ec = ' + trayVariacao.Sku[0].value.Trim.QuotedString +
              ' and coalesce(grade.tipo_ec1, '''') = ' + pTipoEc1.Trim.QuotedString +
              ' and coalesce(grade.descricao_ec1, '''') = ' + trayVariacao.Sku[1].value.Trim.QuotedString +
              ' and grade.cod_empresa = ' + IntToStr(CodEmpresa) +
              ' and grade.ativo = 1 ';

            if trim(vtemp) <> '' then
            begin
              if AllVariacoes = nil then
                AllVariacoes := NewClientOOP(vtemp)
              else
                AllVariacoes.ClientOpen(vtemp);

              if AllVariacoes.IsEmpty then
              begin
                vtemp := vtempini +
                  ' upper(grade.tipo_ec) = ' + pTipoEc.ToUpper.Trim.QuotedString +
                  ' and grade.descricao_ec = ' + trayVariacao.Sku[0].value.Trim.QuotedString +
                  ' and coalesce(grade.tipo_ec1, '''') = ' + pTipoEc1.Trim.QuotedString +
                  ' and coalesce(grade.descricao_ec1, '''') = ' + trayVariacao.Sku[1].value.Trim.QuotedString +
                  ' and grade.cod_empresa = ' + IntToStr(CodEmpresa) +
                  ' and grade.ativo = 1 ';

                if AllVariacoes = nil then
                  AllVariacoes := NewClientOOP(vtemp)
                else
                  AllVariacoes.ClientOpen(vtemp);
              end;

              if AllVariacoes.IsEmpty then
              begin
                vtemp := vtempini +
                  ' grade.tipo_ec = ' + pTipoEc.Trim.QuotedString +
                  ' and grade.descricao_ec = ' + trayVariacao.Sku[0].value.Trim.QuotedString +
                  ' and upper(coalesce(grade.tipo_ec1, '''')) = ' + pTipoEc1.ToUpper.Trim.QuotedString +
                  ' and coalesce(grade.descricao_ec1, '''') = ' + trayVariacao.Sku[1].value.Trim.QuotedString +
                  ' and grade.cod_empresa = ' + IntToStr(CodEmpresa) +
                  ' and grade.ativo = 1 ';

                if AllVariacoes = nil then
                  AllVariacoes := NewClientOOP(vtemp)
                else
                  AllVariacoes.ClientOpen(vtemp);
              end;

              if AllVariacoes.IsEmpty then
              begin
                vtemp := vtempini +
                  ' upper(grade.tipo_ec) = ' + pTipoEc.ToUpper.Trim.QuotedString +
                  ' and grade.descricao_ec = ' + trayVariacao.Sku[0].value.Trim.QuotedString +
                  ' and upper(coalesce(grade.tipo_ec1, '''')) = ' + pTipoEc1.ToUpper.Trim.QuotedString +
                  ' and coalesce(grade.descricao_ec1, '''') = ' + trayVariacao.Sku[1].value.Trim.QuotedString +
                  ' and grade.cod_empresa = ' + IntToStr(CodEmpresa) +
                  ' and grade.ativo = 1 ';

                if AllVariacoes = nil then
                  AllVariacoes := NewClientOOP(vtemp)
                else
                  AllVariacoes.ClientOpen(vtemp);
              end;

              if (AllVariacoes.IsEmpty) and (pTipoEc.ToUpper.Trim = 'COR') then
              begin
                vtemp := vtempini +
                  ' upper(grade.tipo_ec) = ' + 'CORES'.QuotedString +
                  ' and grade.descricao_ec = ' + trayVariacao.Sku[0].value.Trim.QuotedString +
                  ' and coalesce(grade.tipo_ec1, '''') = ' + pTipoEc1.Trim.QuotedString +
                  ' and coalesce(grade.descricao_ec1, '''') = ' + trayVariacao.Sku[1].value.Trim.QuotedString +
                  ' and grade.cod_empresa = ' + IntToStr(CodEmpresa) +
                  ' and grade.ativo = 1 ';

                if AllVariacoes = nil then
                  AllVariacoes := NewClientOOP(vtemp)
                else
                  AllVariacoes.ClientOpen(vtemp);
              end;

              if (AllVariacoes.IsEmpty) and (pTipoEc.ToUpper.Trim = 'CORES') then
              begin
                vtemp := vtempini +
                  ' upper(grade.tipo_ec) = ' + 'COR'.QuotedString +
                  ' and grade.descricao_ec = ' + trayVariacao.Sku[0].value.Trim.QuotedString +
                  ' and coalesce(grade.tipo_ec1, '''') = ' + pTipoEc1.Trim.QuotedString +
                  ' and coalesce(grade.descricao_ec1, '''') = ' + trayVariacao.Sku[1].value.Trim.QuotedString +
                  ' and grade.cod_empresa = ' + IntToStr(CodEmpresa) +
                  ' and grade.ativo = 1 ';

                if AllVariacoes = nil then
                  AllVariacoes := NewClientOOP(vtemp)
                else
                  AllVariacoes.ClientOpen(vtemp);
              end;

              if (AllVariacoes.IsEmpty) and (pTipoEc.ToUpper.Trim = 'GÊNERO') then
              begin
                vtemp := vtempini +
                  ' upper(grade.tipo_ec) = ' + 'GÊNERO'.QuotedString +
                  ' and grade.descricao_ec = ' + trayVariacao.Sku[0].value.Trim.QuotedString +
                  ' and coalesce(grade.tipo_ec1, '''') = ' + pTipoEc1.Trim.QuotedString +
                  ' and coalesce(grade.descricao_ec1, '''') = ' + trayVariacao.Sku[1].value.Trim.QuotedString +
                  ' and grade.cod_empresa = ' + IntToStr(CodEmpresa) +
                  ' and grade.ativo = 1 ';

                if AllVariacoes = nil then
                  AllVariacoes := NewClientOOP(vtemp)
                else
                  AllVariacoes.ClientOpen(vtemp);
              end;

              if (AllVariacoes.IsEmpty) and (pTipoEc.ToUpper.Trim = 'TAMANHO') then
              begin
                vtemp := vtempini +
                  ' upper(grade.tipo_ec) = ' + 'TAMANHO'.QuotedString +
                  ' and grade.descricao_ec = ' + trayVariacao.Sku[0].value.Trim.QuotedString +
                  ' and coalesce(grade.tipo_ec1, '''') = ' + pTipoEc1.Trim.QuotedString +
                  ' and coalesce(grade.descricao_ec1, '''') = ' + trayVariacao.Sku[1].value.Trim.QuotedString +
                  ' and grade.cod_empresa = ' + IntToStr(CodEmpresa) +
                  ' and grade.ativo = 1 ';

                if AllVariacoes = nil then
                  AllVariacoes := NewClientOOP(vtemp)
                else
                  AllVariacoes.ClientOpen(vtemp);
              end;

              if (AllVariacoes.IsEmpty) and (pTipoEc.ToUpper.Trim = 'VOLTAGEM') then
              begin
                vtemp := vtempini +
                  ' upper(grade.tipo_ec) = ' + 'VOLTAGEM'.QuotedString +
                  ' and grade.descricao_ec = ' + trayVariacao.Sku[0].value.Trim.QuotedString +
                  ' and coalesce(grade.tipo_ec1, '''') = ' + pTipoEc1.Trim.QuotedString +
                  ' and coalesce(grade.descricao_ec1, '''') = ' + trayVariacao.Sku[1].value.Trim.QuotedString +
                  ' and grade.cod_empresa = ' + IntToStr(CodEmpresa) +
                  ' and grade.ativo = 1 ';

                if AllVariacoes = nil then
                  AllVariacoes := NewClientOOP(vtemp)
                else
                  AllVariacoes.ClientOpen(vtemp);
              end;

              if (AllVariacoes.IsEmpty) and (pTipoEc1.ToUpper.Trim = 'COR') then
              begin
                vtemp := vtempini +
                  ' grade.tipo_ec = ' + pTipoEc.Trim.QuotedString +
                  ' and grade.descricao_ec = ' + trayVariacao.Sku[0].value.Trim.QuotedString +
                  ' and upper(coalesce(grade.tipo_ec1, '''')) = ' + 'CORES'.QuotedString +
                  ' and coalesce(grade.descricao_ec1, '''') = ' + trayVariacao.Sku[1].value.Trim.QuotedString +
                  ' and grade.cod_empresa = ' + IntToStr(CodEmpresa) +
                  ' and grade.ativo = 1 ';

                if AllVariacoes = nil then
                  AllVariacoes := NewClientOOP(vtemp)
                else
                  AllVariacoes.ClientOpen(vtemp);
              end;

              if (AllVariacoes.IsEmpty) and (pTipoEc1.ToUpper.Trim = 'CORES') then
              begin
                vtemp := vtempini +
                  ' grade.tipo_ec = ' + pTipoEc.Trim.QuotedString +
                  ' and grade.descricao_ec = ' + trayVariacao.Sku[0].value.Trim.QuotedString +
                  ' and upper(coalesce(grade.tipo_ec1, '''')) = ' + 'COR'.QuotedString +
                  ' and coalesce(grade.descricao_ec1, '''') = ' + trayVariacao.Sku[1].value.Trim.QuotedString +
                  ' and grade.cod_empresa = ' + IntToStr(CodEmpresa) +
                  ' and grade.ativo = 1 ';

                if AllVariacoes = nil then
                  AllVariacoes := NewClientOOP(vtemp)
                else
                  AllVariacoes.ClientOpen(vtemp);
              end;

              if (AllVariacoes.IsEmpty) and (pTipoEc1.ToUpper.Trim = 'GÊNERO') then
              begin
                vtemp := vtempini +
                  ' grade.tipo_ec = ' + pTipoEc.Trim.QuotedString +
                  ' and grade.descricao_ec = ' + trayVariacao.Sku[0].value.Trim.QuotedString +
                  ' and upper(coalesce(grade.tipo_ec1, '''')) = ' + 'GÊNERO'.QuotedString +
                  ' and coalesce(grade.descricao_ec1, '''') = ' + trayVariacao.Sku[1].value.Trim.QuotedString +
                  ' and grade.cod_empresa = ' + IntToStr(CodEmpresa) +
                  ' and grade.ativo = 1 ';

                if AllVariacoes = nil then
                  AllVariacoes := NewClientOOP(vtemp)
                else
                  AllVariacoes.ClientOpen(vtemp);
              end;

              if (AllVariacoes.IsEmpty) and (pTipoEc1.ToUpper.Trim = 'TAMANHO') then
              begin
                vtemp := vtempini +
                  ' grade.tipo_ec = ' + pTipoEc.Trim.QuotedString +
                  ' and grade.descricao_ec = ' + trayVariacao.Sku[0].value.Trim.QuotedString +
                  ' and upper(coalesce(grade.tipo_ec1, '''')) = ' + 'TAMANHO'.QuotedString +
                  ' and coalesce(grade.descricao_ec1, '''') = ' + trayVariacao.Sku[1].value.Trim.QuotedString +
                  ' and grade.cod_empresa = ' + IntToStr(CodEmpresa) +
                  ' and grade.ativo = 1 ';

                if AllVariacoes = nil then
                  AllVariacoes := NewClientOOP(vtemp)
                else
                  AllVariacoes.ClientOpen(vtemp);
              end;

              if (AllVariacoes.IsEmpty) and (pTipoEc1.ToUpper.Trim = 'VOLTAGEM') then
              begin
                vtemp := vtempini +
                  ' grade.tipo_ec = ' + pTipoEc.Trim.QuotedString +
                  ' and grade.descricao_ec = ' + trayVariacao.Sku[0].value.Trim.QuotedString +
                  ' and upper(coalesce(grade.tipo_ec1, '''')) = ' + 'VOLTAGEM'.QuotedString +
                  ' and coalesce(grade.descricao_ec1, '''') = ' + trayVariacao.Sku[1].value.Trim.QuotedString +
                  ' and grade.cod_empresa = ' + IntToStr(CodEmpresa) +
                  ' and grade.ativo = 1 ';

                if AllVariacoes = nil then
                  AllVariacoes := NewClientOOP(vtemp)
                else
                  AllVariacoes.ClientOpen(vtemp);
              end;

              if (AllVariacoes.IsEmpty) and (pTipoEc.ToUpper.Trim = 'COR') and (pTipoEc1.ToUpper.Trim = 'COR') then
              begin
                vtemp := vtempini +
                  ' upper(grade.tipo_ec) = ' + 'CORES'.QuotedString +
                  ' and grade.descricao_ec = ' + trayVariacao.Sku[0].value.Trim.QuotedString +
                  ' and upper(coalesce(grade.tipo_ec1, '''')) = ' + 'CORES'.QuotedString +
                  ' and coalesce(grade.descricao_ec1, '''') = ' + trayVariacao.Sku[1].value.Trim.QuotedString +
                  ' and grade.cod_empresa = ' + IntToStr(CodEmpresa) +
                  ' and grade.ativo = 1 ';

                if AllVariacoes = nil then
                  AllVariacoes := NewClientOOP(vtemp)
                else
                  AllVariacoes.ClientOpen(vtemp);
              end;

              if (AllVariacoes.IsEmpty) and (pTipoEc.ToUpper.Trim = 'CORES') and (pTipoEc1.ToUpper.Trim = 'CORES') then
              begin
                vtemp := vtempini +
                  ' upper(grade.tipo_ec) = ' + 'COR'.QuotedString +
                  ' and grade.descricao_ec = ' + trayVariacao.Sku[0].value.Trim.QuotedString +
                  ' and upper(coalesce(grade.tipo_ec1, '''')) = ' + 'COR'.QuotedString +
                  ' and coalesce(grade.descricao_ec1, '''') = ' + trayVariacao.Sku[1].value.Trim.QuotedString +
                  ' and grade.cod_empresa = ' + IntToStr(CodEmpresa) +
                  ' and grade.ativo = 1 ';

                if AllVariacoes = nil then
                  AllVariacoes := NewClientOOP(vtemp)
                else
                  AllVariacoes.ClientOpen(vtemp);
              end;

              if (AllVariacoes.IsEmpty) and (pTipoEc.ToUpper.Trim = 'GÊNERO') and (pTipoEc1.ToUpper.Trim = 'GÊNERO') then
              begin
                vtemp := vtempini +
                  ' upper(grade.tipo_ec) = ' + 'GÊNERO'.QuotedString +
                  ' and grade.descricao_ec = ' + trayVariacao.Sku[0].value.Trim.QuotedString +
                  ' and upper(coalesce(grade.tipo_ec1, '''')) = ' + 'GÊNERO'.QuotedString +
                  ' and coalesce(grade.descricao_ec1, '''') = ' + trayVariacao.Sku[1].value.Trim.QuotedString +
                  ' and grade.cod_empresa = ' + IntToStr(CodEmpresa) +
                  ' and grade.ativo = 1 ';

                if AllVariacoes = nil then
                  AllVariacoes := NewClientOOP(vtemp)
                else
                  AllVariacoes.ClientOpen(vtemp);
              end;

              if (AllVariacoes.IsEmpty) and (pTipoEc.ToUpper.Trim = 'TAMANHO') and (pTipoEc1.ToUpper.Trim = 'TAMANHO') then
              begin
                vtemp := vtempini +
                  ' upper(grade.tipo_ec) = ' + 'TAMANHO'.QuotedString +
                  ' and grade.descricao_ec = ' + trayVariacao.Sku[0].value.Trim.QuotedString +
                  ' and upper(coalesce(grade.tipo_ec1, '''')) = ' + 'TAMANHO'.QuotedString +
                  ' and coalesce(grade.descricao_ec1, '''') = ' + trayVariacao.Sku[1].value.Trim.QuotedString +
                  ' and grade.cod_empresa = ' + IntToStr(CodEmpresa) +
                  ' and grade.ativo = 1 ';

                if AllVariacoes = nil then
                  AllVariacoes := NewClientOOP(vtemp)
                else
                  AllVariacoes.ClientOpen(vtemp);
              end;

              if (AllVariacoes.IsEmpty) and (pTipoEc.ToUpper.Trim = 'VOLTAGEM') and (pTipoEc1.ToUpper.Trim = 'VOLTAGEM') then
              begin
                vtemp := vtempini +
                  ' upper(grade.tipo_ec) = ' + 'VOLTAGEM'.QuotedString +
                  ' and grade.descricao_ec = ' + trayVariacao.Sku[0].value.Trim.QuotedString +
                  ' and upper(coalesce(grade.tipo_ec1, '''')) = ' + 'VOLTAGEM'.QuotedString +
                  ' and coalesce(grade.descricao_ec1, '''') = ' + trayVariacao.Sku[1].value.Trim.QuotedString +
                  ' and grade.cod_empresa = ' + IntToStr(CodEmpresa) +
                  ' and grade.ativo = 1 ';

                if AllVariacoes = nil then
                  AllVariacoes := NewClientOOP(vtemp)
                else
                  AllVariacoes.ClientOpen(vtemp);
              end;
            end;

          sql := sql + vtemp;
        end
        else if Length(trayVariacao.Sku) > 0 then
        begin
          vtempini :=
            ' select first 1 ' + IntToStr(pGrupoProd) + ' grupo_prod, ' +
            QuotedStr(pCodProd) + ' cod_prod, ' +
            ' grade.cod_grade, ' +
            ' trim(coalesce(grade.descricao, '''')) descricao, ' +
            ' trim(coalesce(grade.descricao1, '''')) descricao1, ' +
            ' trim(coalesce(grade.tipo_ec, '''')) tipo_ec, ' +
            ' trim(coalesce(grade.descricao_ec, '''')) descricao_ec, ' +
            ' trim(coalesce(grade.tipo_ec1, '''')) tipo_ec1, ' +
            ' trim(coalesce(grade.descricao_ec1, '''')) descricao_ec1, ' +
            ' (select first 1 case when (produtos_ec_grade.cod_grade > 0) then ' +
            '         1 ' +
            '      else ' +
            '         0 ' +
            '  end gr_adicionadas from produtos_ec ' +
            '  inner join cod_grade_prod on ' +
            '      cod_grade_prod.grupo_prod = produtos_ec.grupo_prod ' +
            '      and cod_grade_prod.cod_prod = produtos_ec.cod_prod ' +
            '      and cod_grade_prod.cod_empresa = produtos_ec.cod_empresa ' +
            '  inner join grade on ' +
            '      grade.cod_grade = cod_grade_prod.cod_grade ' +
            '      and grade.cod_empresa = cod_grade_prod.cod_empresa ' +
            '  inner join produtos_ec_grade on ' +
            '      produtos_ec_grade.grupo_prod = cod_grade_prod.grupo_prod ' +
            '      and produtos_ec_grade.cod_prod = cod_grade_prod.cod_prod ' +
            '      and produtos_ec_grade.cod_grade = cod_grade_prod.cod_grade ' +
            '      and produtos_ec_grade.cod_empresa = cod_grade_prod.cod_empresa ' +
            '  where produtos_ec.grupo_prod = ' + IntToStr(pGrupoProd) +
            '  and produtos_ec.cod_prod = ' + QuotedStr(pCodProd) +
            '  and produtos_ec.cod_empresa = ' + IntToStr(CodEmpresa) + ') gr_adicionadas, ' +
            ' (select produtos_ec_grade.id_commerce from produtos_ec_grade ' +
            '  where produtos_ec_grade.grupo_prod = ' + IntToStr(pGrupoProd) +
            '  and produtos_ec_grade.cod_prod = ' + QuotedStr(pCodProd) +
            '  and produtos_ec_grade.cod_grade = grade.cod_grade ' +
            '  and produtos_ec_grade.cod_empresa = ' + IntToStr(CodEmpresa) + ') id_commerce ' +
            ' from grade ' +
            ' where ';

          vtemp := vtempini +
            ' grade.tipo_ec = ' + pTipoEc.Trim.QuotedString +
            ' and grade.descricao_ec = ' + trayVariacao.Sku[0].value.Trim.QuotedString +
            ' and coalesce(grade.tipo_ec1, '''') = '''' ' +
            ' and coalesce(grade.descricao_ec1, '''') = '''' ' +
            ' and grade.cod_empresa = ' + IntToStr(CodEmpresa) +
            ' and grade.ativo = 1 ';

          if trim(vtemp) <> '' then
          begin
            if AllVariacoes = nil then
              AllVariacoes := NewClientOOP(vtemp)
            else
              AllVariacoes.ClientOpen(vtemp);

            if AllVariacoes.IsEmpty then
            begin
              vtemp := vtempini +
                ' upper(grade.tipo_ec) = ' + pTipoEc.ToUpper.Trim.QuotedString +
                ' and grade.descricao_ec = ' + trayVariacao.Sku[0].value.Trim.QuotedString +
                ' and coalesce(grade.tipo_ec1, '''') = '''' ' +
                ' and coalesce(grade.descricao_ec1, '''') = '''' ' +
                ' and grade.cod_empresa = ' + IntToStr(CodEmpresa) +
                ' and grade.ativo = 1 ';

              if AllVariacoes = nil then
                AllVariacoes := NewClientOOP(vtemp)
              else
                AllVariacoes.ClientOpen(vtemp);
            end;

            if (AllVariacoes.IsEmpty) and (pTipoEc.ToUpper.Trim = 'COR') then
            begin
              vtemp := vtempini +
                ' upper(grade.tipo_ec) = ''CORES'' ' +
                ' and grade.descricao_ec = ' + trayVariacao.Sku[0].value.Trim.QuotedString +
                ' and coalesce(grade.tipo_ec1, '''') = '''' ' +
                ' and coalesce(grade.descricao_ec1, '''') = '''' ' +
                ' and grade.cod_empresa = ' + IntToStr(CodEmpresa) +
                ' and grade.ativo = 1 ';

              if AllVariacoes = nil then
                AllVariacoes := NewClientOOP(vtemp)
              else
                AllVariacoes.ClientOpen(vtemp);
            end;

            if (AllVariacoes.IsEmpty) and (pTipoEc.ToUpper.Trim = 'CORES') then
            begin
              vtemp := vtempini +
                ' upper(grade.tipo_ec) = ''COR'' ' +
                ' and grade.descricao_ec = ' + trayVariacao.Sku[0].value.Trim.QuotedString +
                ' and coalesce(grade.tipo_ec1, '''') = '''' ' +
                ' and coalesce(grade.descricao_ec1, '''') = '''' ' +
                ' and grade.cod_empresa = ' + IntToStr(CodEmpresa) +
                ' and grade.ativo = 1 ';

              if AllVariacoes = nil then
                AllVariacoes := NewClientOOP(vtemp)
              else
                AllVariacoes.ClientOpen(vtemp);
            end;

            if (AllVariacoes.IsEmpty) and (pTipoEc.ToUpper.Trim = 'GÊNERO') then
            begin
              vtemp := vtempini +
                ' upper(grade.tipo_ec) = ''GÊNERO'' ' +
                ' and grade.descricao_ec = ' + trayVariacao.Sku[0].value.Trim.QuotedString +
                ' and coalesce(grade.tipo_ec1, '''') = '''' ' +
                ' and coalesce(grade.descricao_ec1, '''') = '''' ' +
                ' and grade.cod_empresa = ' + IntToStr(CodEmpresa) +
                ' and grade.ativo = 1 ';

              if AllVariacoes = nil then
                AllVariacoes := NewClientOOP(vtemp)
              else
                AllVariacoes.ClientOpen(vtemp);
            end;

            if (AllVariacoes.IsEmpty) and (pTipoEc.ToUpper.Trim = 'TAMANHO') then
            begin
              vtemp := vtempini +
                ' upper(grade.tipo_ec) = ''TAMANHO'' ' +
                ' and grade.descricao_ec = ' + trayVariacao.Sku[0].value.Trim.QuotedString +
                ' and coalesce(grade.tipo_ec1, '''') = '''' ' +
                ' and coalesce(grade.descricao_ec1, '''') = '''' ' +
                ' and grade.cod_empresa = ' + IntToStr(CodEmpresa) +
                ' and grade.ativo = 1 ';

              if AllVariacoes = nil then
                AllVariacoes := NewClientOOP(vtemp)
              else
                AllVariacoes.ClientOpen(vtemp);
            end;

            if (AllVariacoes.IsEmpty) and (pTipoEc.ToUpper.Trim = 'VOLTAGEM') then
            begin
              vtemp := vtempini +
                ' upper(grade.tipo_ec) = ''VOLTAGEM'' ' +
                ' and grade.descricao_ec = ' + trayVariacao.Sku[0].value.Trim.QuotedString +
                ' and coalesce(grade.tipo_ec1, '''') = '''' ' +
                ' and coalesce(grade.descricao_ec1, '''') = '''' ' +
                ' and grade.cod_empresa = ' + IntToStr(CodEmpresa) +
                ' and grade.ativo = 1 ';

              if AllVariacoes = nil then
                AllVariacoes := NewClientOOP(vtemp)
              else
                AllVariacoes.ClientOpen(vtemp);
            end;
          end;
          sql := sql + vtemp;
        end;
      end;

      if trim(sql) <> '' then
        if AllVariacoes = nil then
          AllVariacoes := NewClientOOP(sql)
        else
          AllVariacoes.ClientOpen(sql);

    except on E: Exception do
      begin
        LogError('THwTrayServicos.GetVariacoes. %s', [e.Message]);
        if not SilentMod then
          ShowErro('Erro ao obter Marcas do GetVariacoes. %s',  [e.Message]);
      end;
    end;

  finally
    Result := AllVariacoes;

    desconectar;
  end;
end;

procedure THwTrayServicos.Inicializar;
begin
  trayConsumeApi.OnLog      := Self.OnLog;
  trayConsumeApi.AfterLogin := AfterLogin;
  Auditor                   := TAudit_OOP.Create(FUsuario, CodEmpresa, Self.Banco);

  Self.ConfigureStr(';databaseName=' + DataBasePath);
end;

function THwTrayServicos.GetProdutos(prodOOP: TConexao_OOP;
  onlySinc, withImages: Boolean): TConexao_OOP;
var
  sql: string;
  vcondicao: string;
  vtexto: string;
begin
  Result := prodOOP;

  if not conectar(DataBasePath, True)  then
    Exit;

  try
    try

      //??? tem de olhar o ativo = 1
      sql := Format(' select pr.grupo_prod, pr.cod_prod, pr.cod_empresa, pr.num_fab_prod, pr.descr_prod, 0 codigo_kit, pr.ativo,' +
                    ' pe.cod_categoria, pr.altura_prod, pr.comprimento_prod, pr.largura_prod, pr.peso_brut_prod, pr.peso_liq_prod, ' +
                    ' pe.id_commerce, pe.descr_prod_res, ' +
                    ' (select first 1 coalesce(grade.tipo_ec, '''') from cod_grade_prod ' +
                    '  inner join grade on ' +
                    '     grade.cod_grade = cod_grade_prod.cod_grade ' +
                    '     and grade.cod_empresa = cod_grade_prod.cod_empresa ' +
                    '     where cod_grade_prod.grupo_prod = pr.grupo_prod ' +
                    '     and cod_grade_prod.cod_prod = pr.cod_prod ' +
                    '     and cod_grade_prod.cod_empresa = pr.cod_empresa) tipo_ec, ' +
                    ' (select first 1 coalesce(grade.tipo_ec1, '''') from cod_grade_prod ' +
                    '  inner join grade on ' +
                    '     grade.cod_grade = cod_grade_prod.cod_grade ' +
                    '     and grade.cod_empresa = cod_grade_prod.cod_empresa ' +
                    '     where cod_grade_prod.grupo_prod = pr.grupo_prod ' +
                    '     and cod_grade_prod.cod_prod = pr.cod_prod ' +
                    '     and cod_grade_prod.cod_empresa = pr.cod_empresa) tipo_ec1, ' +
                    ' (select case when (count(*) > 1) then 1 else 0 end from cod_grade_prod gr ' +
                    '     where gr.grupo_prod = pr.grupo_prod ' +
                    '     and gr.cod_prod = pr.cod_prod ' +
                    '     and gr.cod_empresa = pr.cod_empresa ' +
                    '     and gr.cod_grade > 0 ) tem_grade ' +
                    ' from produtos pr ' +
                    ' left join produtos_ec pe on pe.grupo_prod = pr.grupo_prod and pe.cod_prod = pr.cod_prod and pe.cod_empresa = pr.cod_empresa ' +
                    ' where pr.cod_empresa = %d ' +
                    ' and pr.ativo = 1 ' +
                    ' and coalesce(pe.sinc_ecommerce, '''') in ('''',%s)' +
                    ' order by pr.descr_prod',
                    [CodEmpresa, string('S').QuotedString + IfThen(not onlySinc, ',' + string('N').QuotedString)]);

      if Result = nil then
        Result := NewClientOOP(sql)
      else
        Result.ClientOpen(sql);

      if withImages then
      begin
        sql := ' select pr.grupo_prod, pr.cod_prod, pimg.cod_grade, 0 codigo_kit, pimg.lista_imagens, pimg.url_imagens ' +
               ' from produtos pr ' +
               ' left join retorna_img_prod (pr.grupo_prod, pr.cod_prod, 0, pr.cod_empresa) pimg on 1 = 1' +
               sql.Substring(sql.IndexOf('left join produtos_ec')).Replace('order by pr.descr_prod', '');

        if AllImages = nil then
          AllImages := NewClientOOP(sql)
        else
          AllImages.ClientOpen(sql);
      end;

    except on E: Exception do
      begin
        LogError('THwTrayServicos.GetProdutos. %s', [e.Message]);
        if not SilentMod then
          ShowErro('Erro ao obter Produtos do banco. %s',  [e.Message]);
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwTrayServicos.ReduceArray(value: TArray<string>;
  stringLimit: Integer; const separator: string): TArray<string>;
var
  str: string;
  outstr: string;
begin
  Result := [];
  outstr := '';
  for str in value do
  begin
    if outstr.IsEmpty then
      outstr := str
    else if Length(outstr + separator + str) > stringLimit then
    begin
      Result := Result + [outstr];
      outstr := str;
    end
    else
      outstr := outstr + separator + str;
  end;

  if not outstr.IsEmpty then
    Result := Result + [outstr];
end;

function THwTrayServicos.ReenviarImagensKitProduto(pId: Integer;
  pGerarUrl: boolean): boolean;
var
  vcodigokit: Integer;
  vprocesso: string;

  QrAux2: TIBQuery;
begin
  Result := true;

  QrAux2 := TIBQuery.Create(Application);
  QrAux2.Database := QrAux.Database;
  QrAux2.Transaction := QrAux.Transaction;

  if not pGerarUrl then
    vprocesso := 'PRO418'
  else
    vprocesso := 'PRO419';

  vcodigokit := 0;

  if not conectar(DataBasePath, True)  then
    Exit;

  try
    with SqlOpen(' select codigo_kit, id_commerce from kits_prod_ec ' +
              ' where id_commerce = ' + IntToStr(pId) +
              ' and cod_empresa = ' + IntToStr(CodEmpresa)) do
    begin
      if FieldByName('codigo_kit').AsInteger > 0 then
        vcodigokit := FieldByName('codigo_kit').AsInteger;
    end;

    if not Auditor.Alterar.Table(tbKitProduto).Processo(vprocesso)
           .Key('%d-%s', [vcodigokit])
           .Msg('Kit Prod Sistema %d-%s, E-commerce %s', [vcodigokit, IntToStr(pId)])
           .Permitido then
      Exit;

    try
      QrAux.Close;
      QrAux.SQL.Text := 'update kits_prod_ec set alterou_imagem = ''S'' ' +
         ' where codigo_kit = :codigo_kit ' +
         ' and cod_empresa = :cod_empresa; ';
      QrAux.ParamByName('codigo_kit').AsInteger := vcodigokit;
      QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
      QrAux.ExecSQL;

      if pGerarUrl then
      begin
        QrAux.Close;
        QrAux.SQL.Text := 'update kits_prod_ec set url_imagens = :url_imagens ' +
           ' where codigo_kit = :codigo_kit ' +
           ' and cod_empresa = :cod_empresa; ';
        QrAux.ParamByName('codigo_kit').AsInteger := vcodigokit;
        QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
        QrAux.ParamByName('url_imagens').Value := Null;
        QrAux.ExecSQL;

        QrAux2.Close;
        QrAux2.SQL.Text := ' select img.cod_img from kits_prod_imagens kimg ' +
          ' inner join imagens_doc img on ' +
          '   img.cod_img = kimg.cod_img ' +
          '   and img.cod_empresa = kimg.cod_empresa ' +
          ' where kimg.codigo_kit = :codigo_kit ' +
          ' and kimg.cod_empresa = :cod_empresa ';
        QrAux2.ParamByName('codigo_kit').AsInteger := vcodigokit;
        QrAux2.ParamByName('cod_empresa').AsInteger := CodEmpresa;
        QrAux2.Open;

        QrAux2.First;
        while not QrAux2.Eof do
        begin
          QrAux.Close;
          QrAux.SQL.Text := ' update imagens_doc set url = :url ' +
            ' where cod_img = :cod_img ' +
            ' and cod_empresa = :cod_empresa ';
          QrAux.ParamByName('cod_img').AsInteger := QrAux2.FieldByName('cod_img').AsInteger;
          QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
          QrAux.ParamByName('url').Value := Null;
          QrAux.ExecSQL;

          QrAux2.Next;
        end;
      end;

      if QrAux.Transaction.InTransaction then
        QrAux.Transaction.Commit;

      Auditor.Sucesso.GravarMensagem('E-commerce %s ', [IntToStr(pId)]);

    except on E: Exception do
      begin
        Result := False;
        LogError('THwTrayServicos.ReenviarImagensKitProduto. tray %s Codigo Kit %d. Erro: %s', [IntToStr(pId), vcodigokit, e.Message]);
        if not SilentMod then
          ShowErro('Erro ao reenviar Imagens do Kit de Produto. %s',  [e.Message]);
      end;
    end;
  finally
    desconectar;
  end;
end;

function THwTrayServicos.ReenviarImagensProduto(pId: Integer; pGerarUrl: boolean): boolean;
var
  vgrupoprod: Integer;
  vcodprod: string;
  vprocesso: string;

  QrAux2: TIBQuery;
begin
  Result := true;

  QrAux2 := TIBQuery.Create(Application);
  QrAux2.Database := QrAux.Database;
  QrAux2.Transaction := QrAux.Transaction;

  if not pGerarUrl then
    vprocesso := 'PRO401'
  else
    vprocesso := 'PRO402';

  vgrupoprod := 0;
  vcodprod := '';

  if not conectar(DataBasePath, True)  then
    Exit;

  try
    with SqlOpen(' select grupo_prod, cod_prod, id_commerce from produtos_ec ' +
              ' where id_commerce = ' + IntToStr(pId) +
              ' and cod_empresa = ' + IntToStr(CodEmpresa)) do
    begin
      if FieldByName('grupo_prod').AsInteger > 0 then
        vgrupoprod := FieldByName('grupo_prod').AsInteger;
      if trim(FieldByName('cod_prod').AsString) <> '' then
        vcodprod := FieldByName('cod_prod').AsString;
    end;

    if not Auditor.Alterar.Table(tbProduto).Processo(vprocesso)
           .Key('%d-%s', [vgrupoprod, vcodprod])
           .Msg('Prod Sistema %d-%s, E-commerce %s', [vgrupoprod, vcodprod, IntToStr(pId)])
           .Permitido then
      Exit;

    try
      QrAux.Close;
      QrAux.SQL.Text := 'update produtos set alterou_imagem = ''S'', alterou_imagem_grade = ''S''  ' +
         ' where grupo_prod = :grupo_prod ' +
         ' and cod_prod = :cod_prod ' +
         ' and cod_empresa = :cod_empresa; ';
      QrAux.ParamByName('grupo_prod').AsInteger := vgrupoprod;
      QrAux.ParamByName('cod_prod').AsString := vcodprod;
      QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
      QrAux.ExecSQL;

      if pGerarUrl then
      begin
        QrAux.Close;
        QrAux.SQL.Text := 'update produtos_imagens set url_imagens = :url_imagens ' +
           ' where grupo_prod = :grupo_prod ' +
           ' and cod_prod = :cod_prod ' +
           ' and cod_empresa = :cod_empresa; ';
        QrAux.ParamByName('grupo_prod').AsInteger := vgrupoprod;
        QrAux.ParamByName('cod_prod').AsString := vcodprod;
        QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
        QrAux.ParamByName('url_imagens').Value := Null;
        QrAux.ExecSQL;

        QrAux2.Close;
        QrAux2.SQL.Text := ' select img.cod_img from produtos_grade_imagens pimg ' +
          ' inner join imagens_doc img on ' +
          '   img.cod_img = pimg.cod_img ' +
          '   and img.cod_empresa = pimg.cod_empresa ' +
          ' where pimg.grupo_prod = :grupo_prod ' +
          ' and pimg.cod_prod = :cod_prod ' +
          ' and pimg.cod_empresa = :cod_empresa ';
        QrAux2.ParamByName('grupo_prod').AsInteger := vgrupoprod;
        QrAux2.ParamByName('cod_prod').AsString := vcodprod;
        QrAux2.ParamByName('cod_empresa').AsInteger := CodEmpresa;
        QrAux2.Open;

        QrAux2.First;
        while not QrAux2.Eof do
        begin
          QrAux.Close;
          QrAux.SQL.Text := ' update imagens_doc set url = :url ' +
            ' where cod_img = :cod_img ' +
            ' and cod_empresa = :cod_empresa ';
          QrAux.ParamByName('cod_img').AsInteger := QrAux2.FieldByName('cod_img').AsInteger;
          QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
          QrAux.ParamByName('url').Value := Null;
          QrAux.ExecSQL;

          QrAux2.Next;
        end;
      end;

      if QrAux.Transaction.InTransaction then
        QrAux.Transaction.Commit;

      Auditor.Sucesso.GravarMensagem('E-commerce %s ', [IntToStr(pId)]);

    except on E: Exception do
      begin
        Result := False;
        LogError('THwTrayServicos.ReenviarImagensProduto. tray %s GrupoProd %d Cod Prod %s. Erro: %s', [IntToStr(pId), vgrupoprod, vcodprod, e.Message]);
        if not SilentMod then
          ShowErro('Erro ao reenviar Imagens do Produto. %s',  [e.Message]);
      end;
    end;
  finally
    desconectar;
  end;
end;

function THwTrayServicos.ResolverCategorias(trayCategorias: TArray<TCategory>;
  parentId: string; Level: SmallInt;
  current: TArray<TCategoryMescladaHw>): TArray<TCategoryMescladaHw>;
var
  trayCateg: TCategory;
  hwCateg: TCategoryMescladaHw;
  adicionar: Boolean;
  childParentId: string;
  jaIncluido: Boolean;
  I: Integer;
begin
  Result := [];

  AllSincCategoria := GetCategorias(AllSincCategoria, True);

  parentId := IfThen(parentId.Trim.IsEmpty, '0', parentId.Trim);

  for trayCateg in trayCategorias do
  begin
    childParentId := trayCateg.parent_id.Trim;
    childParentId := IfThen(trayCateg.parent_id.Trim.IsEmpty, '0', trayCateg.parent_id.Trim);

    jaIncluido := False;
    for I := Low(current) to High(current) do
      if jaIncluido then
        Break
      else
        jaIncluido := trayCateg.id.Trim = current[I].id.Trim;

    if not jaIncluido then
    begin

      if parentId = childParentId  then
      begin
        hwCateg := TCategoryMescladaHw.Create;
        RttiHwUtils.MesclarObjetos(tobject(hwCateg), trayCateg);
        hwCateg.has_product := IfThen(hwCateg.has_product.Equals('1'), '1', '');
        hwCateg.small_description := hwCateg.small_description.Replace('<br>', ' ').Replace('</br>', ' ')
                                                              .Replace('<p>', ' ').Replace('</p>', ' ')
                                                              .Replace('<strong>', '').Replace('</strong>', '')
                                                              .Replace('<div>', ' ').Replace('</div>', ' ');

        if not AllSincCategoria.filterStr('id_commerce = %s', [trayCateg.id]).IsEmpty then
        begin
          hwCateg.cod_categoria := AllSincCategoria.fint('cod_categoria');
          hwCateg.descricao := AllSincCategoria.fstr('descricao');
        end;
        hwCateg.name := ''.PadRight(Level * 3, ' ') + IfThen(Level > 0, '> ')  + hwCateg.name.Trim;

        Result := Result + [hwCateg];

        Result := Result + ResolverCategorias(trayCategorias, hwCateg.id, Level + 1, Result);
      end;

    end;

  end;

  AllSincCategoria.filterClear;

  if Level = 0 then
    for I := Low(Result) to High(Result) do
      Result[I].index := I;
end;

function THwTrayServicos.ResolverCategoriasHw(
  categoriaOOP: TConexao_OOP;
  trayCategorias: TArray<TCategory>;
  parentId: Integer; Level: SmallInt;
  current: TArray<TCategoriaHw>): TArray<TCategoriaHw>;
var
  hwCategorias: TArray<TCategoriaHw>;
  hwCategoria: TCategoriaHw;

  dbCateg: TCategoriaHw;
  trayCategoria: TCategory;
  adicionar: Boolean;
  childParentId: Integer;
  jaIncluido: Boolean;
  I: Integer;
begin
  Result := [];

  categoriaOOP.prepare_loop();
  try
    hwCategorias := THwDbConverter.DataSetToObject<TCategoriaHw>(categoriaOOP.DataSet);

    for hwCategoria in hwCategorias do
    begin
      for trayCategoria in trayCategorias do
        if trayCategoria.id.Trim.Equals(hwCategoria.id_commerce.ToString) then
        begin
          hwCategoria.id := trayCategoria.id;
          hwCategoria.name := trayCategoria.name.Trim;
          hwCategoria.name_commerce := trayCategoria.name.Trim;
          Break;
        end;

      Result := Result + [hwCategoria];

    end;
  finally
    categoriaOOP.prepare_loop_done;
  end;
end;

function THwTrayServicos.ResolverImagensKitProduto(
  kitproduto: TKitsProdHw): TKitsProdHw;
var
  variacoes: TArray<TVariant>;
  list: TStrings;
  path, str, str2: string;
  url: TUrl;
begin
  Result := kitproduto;

  if not conectar(DataBasePath, True)  then
    Exit;

  try

    try

      if (not GetDadosApi) then
        Exit;

      variacoes := trayConsumeApi.Get<TVariant>('products/variants', 'Variants', ['product_id=' + kitproduto.id]);
      kitproduto.Variant := variacoes;

      path := IncludeTrailingPathDelimiter(TConfig_sistema_class.getConf('prod_cad_diretorio_padrao_imagens', QrAux, CodEmpresa).value1_vc.Trim);

      with SqlOpen('select codigo_kit, lista_imagens, url_imagens from kits_prod' +
                   ' where codigo_kit = %d and cod_empresa = %d and coalesce(lista_imagens, '''') = '''' ',
                   [kitproduto.codigo_kit, CodEmpresa]) do
      begin
        QrAux.First;
        while not QrAux.Eof do
        begin
          list := NewStringList(QrAux.FieldByName('lista_imagens').AsString);
          for str in list do
          begin
            url := TUrl.Create;

            if (str.Trim.CountChar('\') > 0) or (str.Trim.CountChar('/') > 0) then
            begin
              url.http := str;
              //str2 := IncludeTrailingPathDelimiter(ExtractFilePath(str));
              //if not path.ToLower.Equals(str2.ToLower) then
              //  Result.hw_image := 'P';//problema
            end
            else
              url.http := IncludeTrailingPathDelimiter(path) + str;

            Result.hw_image_local := Result.hw_image_local + [url];

          end;

          list := NewStringList(QrAux.FieldByName('url_imagens').AsString);
          for str in list do
          begin
            url := TUrl.Create;
            url.http := str;

            Result.hw_image_url := Result.hw_image_url + [url];
          end;

          QrAux.Next;
        end;

      end;

    except on E: Exception do
      begin
        LogError('THwTrayServicos.ResolverImagensKitProduto. %s', [e.Message]);
        if not SilentMod then
          ShowErro('Erro ao obter Imagens do banco. %s',  [e.Message]);
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwTrayServicos.ResolverImagensProduto(produto: TProductHw): TProductHw;
var
  variacoes: TArray<TVariant>;
  list: TStrings;
  path, str, str2: string;
  url: TUrl;
begin
  Result := produto;

  if not conectar(DataBasePath, True)  then
    Exit;

  try

    try

      if (not GetDadosApi) then
        Exit;

      variacoes := trayConsumeApi.Get<TVariant>('products/variants', 'Variants', ['product_id=' + produto.id]);
      produto.Variant := variacoes;

      path := IncludeTrailingPathDelimiter(TConfig_sistema_class.getConf('prod_cad_diretorio_padrao_imagens', QrAux, CodEmpresa).value1_vc.Trim);

      with SqlOpen(Format(' select pr.grupo_prod, pr.cod_prod, 0 cod_grade, img.lista_imagens, img.url_imagens from produtos pr' +
                          ' left join retorna_img_prod (pr.grupo_prod, pr.cod_prod, 0, pr.cod_empresa) img on 1 = 1 ' +
                          ' where pr.grupo_prod = %d ' +
                          ' and pr.cod_prod = %s ' +
                          ' and pr.cod_empresa = %d ',
                          [produto.grupo_prod, produto.cod_prod.QuotedString, CodEmpresa]) +
                   Format(' union all ' +
                          ' select cg.grupo_prod, cg.cod_prod, cg.cod_grade, img.lista_imagens, img.url_imagens from cod_grade_prod cg ' +
                          ' left join retorna_img_prod (cg.grupo_prod, cg.cod_prod, cg.cod_grade, cg.cod_empresa) img on 1 = 1 ' +
                          ' where cg.grupo_prod = %d ' +
                          ' and cg.cod_prod = %s ' +
                          ' and cg.cod_empresa = %d ' +
                          ' and cg.cod_grade > 0 ',
                          [produto.grupo_prod, produto.cod_prod.QuotedString, CodEmpresa])) do
      begin
        QrAux.First;
        while not QrAux.Eof do
        begin
          list := NewStringList(QrAux.FieldByName('lista_imagens').AsString);
          for str in list do
          begin
            url := TUrl.Create;

            if (str.Trim.CountChar('\') > 0) or (str.Trim.CountChar('/') > 0) then
            begin
              url.http := str;
              //str2 := IncludeTrailingPathDelimiter(ExtractFilePath(str));
              //if not path.ToLower.Equals(str2.ToLower) then
              //  Result.hw_image := 'P';//problema
            end
            else
              url.http := IncludeTrailingPathDelimiter(path) + str;

            Result.hw_image_local := Result.hw_image_local + [url];

          end;

          list := NewStringList(QrAux.FieldByName('url_imagens').AsString);
          for str in list do
          begin
            url := TUrl.Create;
            url.http := str;

            Result.hw_image_url := Result.hw_image_url + [url];
          end;

          QrAux.Next;
        end;

      end;

    except on E: Exception do
      begin
        LogError('THwTrayServicos.ResolverImagensProduto. %s', [e.Message]);
        if not SilentMod then
          ShowErro('Erro ao obter Imagens do banco. %s',  [e.Message]);
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwTrayServicos.ResolverKitProduto(
  trayKitProduto: TProduct): TKitsProdHw;
begin
  Result := TKitsProdHw.Create;
  RttiHwUtils.MesclarObjetos(TObject(Result), trayKitProduto);

  if (AllSincKitProd <> nil) and (AllSincKitProd.Active) then
    try
      if not AllSincKitProd.filterStr('id_commerce = %s', [trayKitProduto.id]).IsEmpty then
      begin
        Result.codigo_kit    := AllSincKitProd.fint('codigo_kit');
        Result.descricao_kit := AllSincKitProd.fstr('descricao_kit');
        Result.cod_categoria := AllSincKitProd.fint('cod_categoria');
      end;

    finally
      AllSincKitProd.filterClear;
    end;

  Result := ResolverImagensKitProduto(Result);
end;

function THwTrayServicos.ResolverKitProdutoHw(kitprodOOP: TConexao_OOP;
  trayKitProdutos: TArray<TProduct>): TKitsProdHw;
var
  trayKitProduto: TProduct;
  hwKitProdutos: TArray<TKitsProdHw>;
  hwKitProduto: TKitsProdHw;
  list: TStrings;
  path, str, str2: string;
  url: TUrl;
begin
  kitprodOOP.prepare_loop();
  try
    hwKitProduto := TKitsProdHw.Create;

    Result := THwDbConverter.DataSetRowToObject<TKitsProdHw>(kitprodOOP.DataSet);

    for trayKitProduto in trayKitProdutos do
      if trayKitProduto.id.Trim.Equals(kitprodOOP.fstr('id')) then // if trayKitProduto.id.Trim.Equals(hwKitProduto.id_commerce.ToString) then
      begin
        hwKitProduto.category_id := trayKitProduto.category_id;
        hwKitProduto.name := trayKitProduto.name;
        hwKitProduto.id := trayKitProduto.id;
        Break;
      end;

    Result := ResolverImagensKitProduto(Result);

  finally
    kitprodOOP.prepare_loop_done;
  end;
end;

function THwTrayServicos.ResolverKitProdutos(trayKitProdutos: TArray<TProduct>;
  trayCategorias: TArray<TCategory>): TArray<TKitsProdHw>;
var
  trayKitProduto: TProduct;
  trayCategoria: TCategory;
  hwKitProduto: TKitsProdHw;
  adicionar: Boolean;
begin
  Result := [];

  AllSincKitProd := GetKitProdutos(AllSincKitProd, True, False);

  for trayKitProduto in trayKitProdutos do
  begin
    hwKitProduto := TKitsProdHw.Create;
    RttiHwUtils.MesclarObjetos(tobject(hwKitProduto), trayKitProduto);

    if Length(trayKitProduto.ProductImage) > 0 then
      hwKitProduto.has_image := '1'
    else
      hwKitProduto.has_image := '0';

    for trayCategoria in trayCategorias do
      if trayCategoria.id = hwKitProduto.category_id then
      begin
        hwKitProduto.category_name := trayCategoria.name;
        Break;
      end;

    if (AllSincKitProd <> nil) and (AllSincKitProd.Active) then
      if not AllSincKitProd.filterStr('id_commerce = %s', [trayKitProduto.id]).IsEmpty then
      begin
        hwKitProduto.codigo_kit    := AllSincKitProd.fint('codigo_kit');
        hwKitProduto.descricao_kit := AllSincKitProd.fstr('descricao_kit');
        hwKitProduto.cod_categoria := AllSincKitProd.fint('cod_categoria');
      end;

    Result := Result + [hwKitProduto];
  end;
  if (AllSincKitProd <> nil) and (AllSincKitProd.Active) then
    AllSincKitProd.filterClear;
end;

function THwTrayServicos.ResolverKitProdutosHw(kitprodOOP: TConexao_OOP;
  trayKitProdutos: TArray<TProduct>): TArray<TKitsProdHw>;
var
  trayKitProduto: TProduct;
  hwKitProdutos: TArray<TKitsProdHw>;
  hwKitProduto: TKitsProdHw;
  list: TStrings;
  path, str, str2: string;
begin
  Result := [];

  kitprodOOP.prepare_loop();
  try
    path := IncludeTrailingPathDelimiter(TConfig_sistema_class.getConf('prod_cad_diretorio_padrao_imagens', QrAux, CodEmpresa).value1_vc.Trim);

    hwKitProdutos := THwDbConverter.DataSetToObject<TKitsProdHw>(kitprodOOP.DataSet);

    for hwKitProduto in hwKitProdutos do
    begin
      for trayKitProduto in trayKitProdutos do
        if trayKitProduto.id.Trim.Equals(hwKitProduto.id_commerce.ToString) then
        begin
          hwKitProduto.category_id := trayKitProduto.category_id;
          hwKitProduto.name := trayKitProduto.name;
          hwKitProduto.id := trayKitProduto.id;
          Break;
        end;

      if (AllImages <> nil) and (AllImages.Active) then
        if not AllImages.filterStr('codigo_kit = %d', [hwKitProduto.codigo_kit]).First.IsEmpty then
        begin
          if (AllImages.fstr('lista_imagens').Trim <> '') then
          begin
            hwKitProduto.hw_image := 'S'; // possui imagem
            while not AllImages.Eof do
            begin
              list := NewStringList(AllImages.fstr('lista_imagens'));
              for str in list do
                if (str.Trim.CountChar('\') > 0) or (str.Trim.CountChar('/') > 0) then
                  if not path.ToLower.Equals(IncludeTrailingPathDelimiter(ExtractFilePath(str).ToLower)) then
                    hwKitProduto.hw_image := 'P';//problema

              AllImages.Next;
            end;
          end;
        end;

      Result := Result + [hwKitProduto];

    end;

  finally
    kitprodOOP.prepare_loop_done;
  end;
end;

function THwTrayServicos.ResolverMarca(trayMarca: TBrand): TBrandHw;
begin
  Result := TBrandHw.Create;
  RttiHwUtils.MesclarObjetos(TObject(Result), trayMarca);

  if (AllSincMarca <> nil) and (AllSincMarca.Active) then
    try
      if not AllSincMarca.filterStr('id_commerce = %s', [trayMarca.id]).IsEmpty then
      begin
        Result.cod_marca        := AllSincMarca.fint('cod_marca');
        Result.descricao_marca  := AllSincMarca.fstr('descricao_marca');
      end;

    finally
      AllSincMarca.filterClear;
    end;
end;

function THwTrayServicos.ResolverMarcas(trayMarcas: TArray<TBrand>): TArray<TBrandHw>;
var
  trayMarca: TBrand;
  hwMarca: TBrandHw;

  adicionar: Boolean;
begin
  Result := [];

  AllSincMarca := GetMarcas(AllSincMarca, True, False);

  for trayMarca in trayMarcas do
  begin
    hwMarca := TBrandHw.Create;
    RttiHwUtils.MesclarObjetos(tobject(hwMarca), trayMarca);

    if (AllSincMarca <> nil) and (AllSincMarca.Active) then
      if not AllSincMarca.filterStr('id_commerce = %s', [trayMarca.id]).IsEmpty then
      begin
        hwMarca.cod_marca := AllSincMarca.fint('cod_marca');
        hwMarca.descricao_marca := AllSincMarca.fstr('descricao_marca').Trim;
      end;

    Result := Result + [hwMarca];
  end;

  if (AllSincMarca <> nil) and (AllSincMarca.Active) then
    AllSincMarca.filterClear;
end;

function THwTrayServicos.ResolverMarcasHw(
  marcaOOP: TConexao_OOP; trayMarcas: TArray<TBrand>): TArray<TBrandHw>;
var
  trayMarca: TBrand;
  hwMarcas: TArray<TBrandHw>;
  hwMarca: TBrandHw;
begin
  Result := [];

  marcaOOP.prepare_loop();
  try
    hwMarcas := THwDbConverter.DataSetToObject<TBrandHw>(marcaOOP.DataSet);

    for hwMarca in hwMarcas do
    begin
      for trayMarca in trayMarcas do
        if trayMarca.id.Trim.Equals(hwMarca.id_commerce.ToString) then
        begin
          hwMarca.id := trayMarca.id;
          hwMarca.brand := trayMarca.brand.Trim;
          Break;
        end;

      Result := Result + [hwMarca];

    end;
  finally
    marcaOOP.prepare_loop_done;
  end;
end;

function THwTrayServicos.ResolverProdutosKits(
  trayProdutosKit: TArray<TProductKit>; trayProdutos: TArray<TProduct>): TArray<TProductKitHw>;
var
  trayProduto: TProduct;
  trayProdutoKit: TProductKit;
  hwProdutoKit: TProductKitHw;
  sku: TSku;
  adicionar: Boolean;
begin
  Result := [];

  for trayProdutoKit in trayProdutosKit do
  begin
    hwProdutoKit := TProductKitHw.Create;
    RttiHwUtils.MesclarObjetos(tobject(hwProdutoKit), trayProdutoKit);

    for trayProduto in trayProdutos do
      if trayProduto.id = hwProdutoKit.product_id then
      begin
        hwProdutoKit.product_name := trayProduto.name;
        hwProdutoKit.product_has_variation := trayProduto.has_variation;
        Break;
      end;

    if not AllProdutosKit.filterStr('id_commerce = %s', [trayProdutoKit.id]).IsEmpty then
    begin
      hwProdutoKit.codigo_kit    := AllProdutosKit.fint('codigo_kit');
      hwProdutoKit.grupo_prod    := AllProdutosKit.fint('grupo_prod');
      hwProdutoKit.cod_prod      := AllProdutosKit.fstr('cod_prod');
      hwProdutoKit.num_fab_prod  := AllProdutosKit.fstr('num_fab_prod');
      hwProdutoKit.descr_prod    := AllProdutosKit.fstr('descr_prod');
      hwProdutoKit.descr_prod_kit:= AllProdutosKit.fstr('descr_prod_kit');
    end;

    Result := Result + [hwProdutoKit];
  end;
  AllProdutosKit.filterClear;
end;

function THwTrayServicos.ResolverProdutosKitsHw(
  trayProdutosKit: TArray<TProductKit>): TArray<TProductKitHw>;
var
  trayProdutoKit: TProductKit;
  hwProdutosKit: TArray<TProductKitHw>;
  hwProdutoKit: TProductKitHw;
begin
  Result := [];

  AllProdutosKit.prepare_loop();
  try
    hwProdutosKit := THwDbConverter.DataSetToObject<TProductKitHw>(AllProdutosKit.DataSet);

    for hwProdutoKit in hwProdutosKit do
    begin
      for trayProdutoKit in trayProdutosKit do
      begin
        if trayProdutoKit.id.Trim.Equals(hwProdutoKit.id_commerce.ToString) then
        begin
          hwProdutoKit.id := trayProdutoKit.id;
          Break;
        end;
      end;

      Result := Result + [hwProdutoKit];

    end;
  finally
    AllProdutosKit.prepare_loop_done;
  end;
end;

function THwTrayServicos.ResolverProduto(trayProduto: TProduct): TProductHw;
begin
  Result := TProductHw.Create;
  RttiHwUtils.MesclarObjetos(TObject(Result), trayProduto);

  if (AllSincProd <> nil) and (AllSincProd.Active) then
    try
      if not AllSincProd.filterStr('id_commerce = %s', [trayProduto.id]).IsEmpty then
      begin
        Result.grupo_prod    := AllSincProd.fint('grupo_prod');
        Result.cod_prod      := AllSincProd.fstr('cod_prod');
        Result.num_fab_prod  := AllSincProd.fstr('num_fab_prod');
        Result.descr_prod    := AllSincProd.fstr('descr_prod');
        Result.cod_categoria := AllSincProd.fint('cod_categoria');
        Result.tem_grade     := AllSincProd.fint('tem_grade');
      end;

    finally
      AllSincProd.filterClear;
    end;

  Result := ResolverImagensProduto(Result);
end;

function THwTrayServicos.ResolverProdutoHw(
  prodOOP: TConexao_OOP; trayProdutos: TArray<TProduct>): TProductHw;
var
  trayProduto: TProduct;
  hwProdutos: TArray<TProductHw>;
  hwProduto: TProductHw;
  list: TStrings;
  path, str, str2: string;
  url: TUrl;
begin
  prodOOP.prepare_loop();
  try
    hwProduto := TProductHw.Create;

    Result := THwDbConverter.DataSetRowToObject<TProductHw>(prodOOP.DataSet);

    for trayProduto in trayProdutos do
      if trayProduto.id.Trim.Equals(prodOOP.fstr('id')) then // if trayProduto.id.Trim.Equals(hwProduto.id_commerce.ToString) then
      begin
        hwProduto.category_id := trayProduto.category_id;
        hwProduto.name := trayProduto.name;
        hwProduto.id := trayProduto.id;
        Break;
      end;

    Result := ResolverImagensProduto(Result);

  finally
    prodOOP.prepare_loop_done;
  end;
end;

function THwTrayServicos.ResolverProdutos(
  trayProdutos: TArray<TProduct>;
  trayCategorias: TArray<TCategory>): TArray<TProductHw>;
var
  trayProduto: TProduct;
  trayCategoria: TCategory;
  hwProduto: TProductHw;
  adicionar: Boolean;
begin
  Result := [];

  AllSincProd := GetProdutos(AllSincProd, True, False);

  for trayProduto in trayProdutos do
  begin
    hwProduto := TProductHw.Create;
    RttiHwUtils.MesclarObjetos(tobject(hwProduto), trayProduto);
    if Length(trayProduto.ProductImage) > 0 then
      hwProduto.has_image := '1'
    else
      hwProduto.has_image := '0';

    for trayCategoria in trayCategorias do
      if trayCategoria.id = hwProduto.category_id then
      begin
        hwProduto.category_name := trayCategoria.name;
        Break;
      end;

    if (AllSincProd <> nil) and (AllSincProd.Active) then
      if not AllSincProd.filterStr('id_commerce = %s', [trayProduto.id]).IsEmpty then
      begin
        hwProduto.grupo_prod    := AllSincProd.fint('grupo_prod');
        hwProduto.cod_prod      := AllSincProd.fstr('cod_prod');
        hwProduto.num_fab_prod  := AllSincProd.fstr('num_fab_prod');
        hwProduto.descr_prod    := AllSincProd.fstr('descr_prod');
        hwProduto.cod_categoria := AllSincProd.fint('cod_categoria');
        hwProduto.tem_grade     := AllSincProd.fint('tem_grade');
      end;

    Result := Result + [hwProduto];
  end;
  if (AllSincProd <> nil) and (AllSincProd.Active) then
    AllSincProd.filterClear;
end;

function THwTrayServicos.ResolverProdutosHw(
  prodOOP: TConexao_OOP; trayProdutos: TArray<TProduct>): TArray<TProductHw>;
var
  trayProduto: TProduct;
  hwProdutos: TArray<TProductHw>;
  hwProduto: TProductHw;
  list: TStrings;
  path, str, str2: string;
begin
  Result := [];

  prodOOP.prepare_loop();
  try
    path := IncludeTrailingPathDelimiter(TConfig_sistema_class.getConf('prod_cad_diretorio_padrao_imagens', QrAux, CodEmpresa).value1_vc.Trim);

    hwProdutos := THwDbConverter.DataSetToObject<TProductHw>(prodOOP.DataSet);

    for hwProduto in hwProdutos do
    begin
      for trayProduto in trayProdutos do
        if trayProduto.id.Trim.Equals(hwProduto.id_commerce.ToString) then
        begin
          hwProduto.category_id := trayProduto.category_id;
          hwProduto.name := trayProduto.name;
          hwProduto.id := trayProduto.id;
          Break;
        end;

      if (AllImages <> nil) and (AllImages.Active) then
        if not AllImages.filterStr('grupo_prod = %d and cod_prod = %s', [hwProduto.grupo_prod, hwProduto.cod_prod.QuotedString]).First.IsEmpty then
        begin
          if (AllImages.fstr('lista_imagens').Trim <> '') then
          begin
            hwProduto.hw_image := 'S'; // possui imagem
            while not AllImages.Eof do
            begin
              list := NewStringList(AllImages.fstr('lista_imagens'));
              for str in list do
                if (str.Trim.CountChar('\') > 0) or (str.Trim.CountChar('/') > 0) then
                  if not path.ToLower.Equals(IncludeTrailingPathDelimiter(ExtractFilePath(str).ToLower)) then
                    hwProduto.hw_image := 'P';//problema

              AllImages.Next;
            end;
          end;
        end;

      Result := Result + [hwProduto];

    end;

  finally
    prodOOP.prepare_loop_done;
  end;
end;

function THwTrayServicos.ResolverVariacoes(
  trayVariacoes: TArray<TVariant>): TArray<TVariantHw2>;
var
  trayVariacao: TVariant;
  hwVariacao: TVariantHw2;
  sku: TSku;
  adicionar: Boolean;
begin
  Result := [];

  GetGrades;
  for trayVariacao in trayVariacoes do
  begin
    hwVariacao := TVariantHw2.Create;
    RttiHwUtils.MesclarObjetos(tobject(hwVariacao), trayVariacao);

    for sku in trayVariacao.Sku do
      if hwVariacao.tipo_ec.IsEmpty then
      begin
        hwVariacao.tipo_ec := sku.type_.Trim;
        hwVariacao.descricao_ec := sku.value.Trim;
      end
      else
      begin
        hwVariacao.tipo_ec1 := sku.type_.Trim;
        hwVariacao.descricao_ec1 := sku.value.Trim;
      end;

    if hwVariacao.tipo_ec1.IsEmpty then
    begin
      AllGrades.filterStr('trim(tipo_ec) = %s and trim(descricao_ec) = %s',
                            [hwVariacao.tipo_ec.Trim.QuotedString, hwVariacao.descricao_ec.Trim.QuotedString]);
      if AllGrades.IsEmpty then
        AllGrades.filterStr('upper(trim(tipo_ec)) = %s and trim(descricao_ec) = %s ' +
                            'and ((tipo_ec1 is null) or (trim(tipo_ec1) = '''')) ' +
                            'and ((descricao_ec1 is null) or (trim(descricao_ec1) = '''')) ',
                            [hwVariacao.tipo_ec.ToUpper.Trim.QuotedString, hwVariacao.descricao_ec.Trim.QuotedString]);
      if (AllGrades.IsEmpty) and (hwVariacao.tipo_ec.Trim.ToUpper = 'COR') then
        AllGrades.filterStr('upper(trim(tipo_ec)) = %s and trim(descricao_ec) = %s ' +
                            'and ((tipo_ec1 is null) or (trim(tipo_ec1) = '''')) ' +
                            'and ((descricao_ec1 is null) or (trim(descricao_ec1) = '''')) ',
                            ['CORES'.Trim.QuotedString, hwVariacao.descricao_ec.Trim.QuotedString]);
      if (AllGrades.IsEmpty) and (hwVariacao.tipo_ec.Trim.ToUpper = 'CORES') then
          AllGrades.filterStr('upper(trim(tipo_ec)) = %s and trim(descricao_ec) = %s ' +
                              'and ((tipo_ec1 is null) or (trim(tipo_ec1) = '''')) ' +
                              'and ((descricao_ec1 is null) or (trim(descricao_ec1) = '''')) ',
                              ['COR'.Trim.QuotedString, hwVariacao.descricao_ec.Trim.QuotedString]);
    end
    else
    begin
      AllGrades.filterStr('trim(tipo_ec) = %s and trim(descricao_ec) = %s ' +
                          'and trim(tipo_ec1) = %s and trim(descricao_ec1) = %s',
                          [hwVariacao.tipo_ec.Trim.QuotedString, hwVariacao.descricao_ec.Trim.QuotedString,
                           hwVariacao.tipo_ec1.Trim.QuotedString, hwVariacao.descricao_ec1.Trim.QuotedString]);
      if AllGrades.IsEmpty then
        AllGrades.filterStr('upper(trim(tipo_ec)) = %s and trim(descricao_ec) = %s ' +
                            'and trim(tipo_ec1) = %s and trim(descricao_ec1) = %s',
                            [hwVariacao.tipo_ec.Trim.ToUpper.QuotedString, hwVariacao.descricao_ec.Trim.QuotedString,
                             hwVariacao.tipo_ec1.Trim.QuotedString, hwVariacao.descricao_ec1.Trim.QuotedString]);
      if AllGrades.IsEmpty then
        AllGrades.filterStr('trim(tipo_ec) = %s and trim(descricao_ec) = %s ' +
                            'and upper(trim(tipo_ec1)) = %s and trim(descricao_ec1) = %s',
                            [hwVariacao.tipo_ec.Trim.QuotedString, hwVariacao.descricao_ec.Trim.QuotedString,
                             hwVariacao.tipo_ec1.ToUpper.Trim.QuotedString, hwVariacao.descricao_ec1.Trim.QuotedString]);
      if AllGrades.IsEmpty then
        AllGrades.filterStr('upper(trim(tipo_ec)) = %s and trim(descricao_ec) = %s ' +
                            'and upper(trim(tipo_ec1)) = %s and trim(descricao_ec1) = %s',
                            [hwVariacao.tipo_ec.ToUpper.Trim.QuotedString, hwVariacao.descricao_ec.Trim.QuotedString,
                             hwVariacao.tipo_ec1.ToUpper.Trim.QuotedString, hwVariacao.descricao_ec1.Trim.QuotedString]);
      if (AllGrades.IsEmpty) and (hwVariacao.tipo_ec.Trim.ToUpper = 'COR') then
        AllGrades.filterStr('upper(trim(tipo_ec)) = %s and trim(descricao_ec) = %s ' +
                            'and trim(tipo_ec1) = %s and trim(descricao_ec1) = %s',
                            ['CORES'.Trim.QuotedString, hwVariacao.descricao_ec.Trim.QuotedString,
                             hwVariacao.tipo_ec1.ToUpper.Trim.QuotedString, hwVariacao.descricao_ec1.Trim.QuotedString]);
      if (AllGrades.IsEmpty) and (hwVariacao.tipo_ec.Trim.ToUpper = 'CORES') then
        AllGrades.filterStr('upper(trim(tipo_ec)) = %s and trim(descricao_ec) = %s ' +
                            'and trim(tipo_ec1) = %s and trim(descricao_ec1) = %s',
                            ['COR'.Trim.QuotedString, hwVariacao.descricao_ec.Trim.QuotedString,
                             hwVariacao.tipo_ec1.ToUpper.Trim.QuotedString, hwVariacao.descricao_ec1.Trim.QuotedString]);
      if (AllGrades.IsEmpty) and (hwVariacao.tipo_ec1.Trim.ToUpper = 'COR') then
        AllGrades.filterStr('trim(tipo_ec) = %s and trim(descricao_ec) = %s ' +
                            'and upper(trim(tipo_ec1)) = %s and trim(descricao_ec1) = %s',
                            [hwVariacao.tipo_ec.Trim.QuotedString, hwVariacao.descricao_ec.Trim.QuotedString,
                            'CORES'.Trim.QuotedString, hwVariacao.descricao_ec1.Trim.QuotedString]);
      if (AllGrades.IsEmpty) and (hwVariacao.tipo_ec1.Trim.ToUpper = 'CORES') then
        AllGrades.filterStr('trim(tipo_ec) = %s and trim(descricao_ec) = %s ' +
                            'and upper(trim(tipo_ec1)) = %s and trim(descricao_ec1) = %s',
                            [hwVariacao.tipo_ec.Trim.QuotedString, hwVariacao.descricao_ec.Trim.QuotedString,
                            'COR'.Trim.QuotedString, hwVariacao.descricao_ec1.Trim.QuotedString]);
      if (AllGrades.IsEmpty) and (hwVariacao.tipo_ec.Trim.ToUpper = 'COR') and (hwVariacao.tipo_ec1.Trim.ToUpper = 'COR') then
        AllGrades.filterStr('upper(trim(tipo_ec)) = %s and trim(descricao_ec) = %s ' +
                            'and upper(trim(tipo_ec1)) = %s and trim(descricao_ec1) = %s',
                            ['CORES'.Trim.QuotedString, hwVariacao.descricao_ec.Trim.QuotedString,
                             'CORES'.Trim.QuotedString, hwVariacao.descricao_ec1.Trim.QuotedString]);
      if (AllGrades.IsEmpty) and (hwVariacao.tipo_ec.Trim.ToUpper = 'CORES') and (hwVariacao.tipo_ec1.Trim.ToUpper = 'CORES') then
        AllGrades.filterStr('upper(trim(tipo_ec)) = %s and trim(descricao_ec) = %s ' +
                            'and upper(trim(tipo_ec1)) = %s and trim(descricao_ec1) = %s',
                            ['COR'.Trim.QuotedString, hwVariacao.descricao_ec.Trim.QuotedString,
                             'COR'.Trim.QuotedString, hwVariacao.descricao_ec1.Trim.QuotedString]);
    end;

    if not AllGrades.IsEmpty then
    begin
      hwVariacao.cod_grade     := AllGrades.fint('cod_grade');
      hwVariacao.descricao     := AllGrades.fstr('descricao').Trim;
      hwVariacao.descricao1    := AllGrades.fstr('descricao1').Trim;
    end;

    Result := Result + [hwVariacao];
  end;
  AllGrades.filterClear;
end;

function THwTrayServicos.ResolverVariacoesHw(
  trayVariacoes: TArray<TVariant>; tipoec: string; tipoec1: string): TArray<TVariantHw2>;
var
  trayVariacao: TVariant;
  hwVariacoes: TArray<TVariantHw2>;
  hwVariacao: TVariantHw2;
begin
  Result := [];

  AllVariacoes.prepare_loop();
  try
    hwVariacoes := THwDbConverter.DataSetToObject<TVariantHw2>(AllVariacoes.DataSet);

    for hwVariacao in hwVariacoes do
    begin
      for trayVariacao in trayVariacoes do
      begin
        if Length(trayVariacao.Sku) > 1 then
        begin
          if ((trayVariacao.Sku[0].type_.Trim = hwVariacao.descricao_ec.Trim)
            and (tipoec.Trim = hwVariacao.tipo_ec.Trim))
            and ((trayVariacao.Sku[1].type_.Trim = hwVariacao.descricao_ec1.Trim)
            and (tipoec1.Trim = hwVariacao.tipo_ec1.Trim)) then
          begin
            hwVariacao.id := trayVariacao.id;
            Break;
          end
          else if ((trayVariacao.Sku[0].type_.Trim = hwVariacao.descricao_ec.Trim)
            and (tipoec.ToUpper.Trim = hwVariacao.tipo_ec.ToUpper.Trim))
            and ((trayVariacao.Sku[1].type_.Trim = hwVariacao.descricao_ec1.Trim)
            and (tipoec1.Trim = hwVariacao.tipo_ec1.Trim)) then
          begin
            hwVariacao.id := trayVariacao.id;
            Break;
          end
          else if ((trayVariacao.Sku[0].type_.Trim = hwVariacao.descricao_ec.Trim)
            and (tipoec.Trim = hwVariacao.tipo_ec.Trim))
            and ((trayVariacao.Sku[1].type_.Trim = hwVariacao.descricao_ec1.Trim)
            and (tipoec1.ToUpper.Trim = hwVariacao.tipo_ec1.ToUpper.Trim)) then
          begin
            hwVariacao.id := trayVariacao.id;
            Break;
          end
          else if ((trayVariacao.Sku[0].type_.Trim = hwVariacao.descricao_ec.Trim)
            and (tipoec.ToUpper.Trim = hwVariacao.tipo_ec.ToUpper.Trim))
            and ((trayVariacao.Sku[1].type_.Trim = hwVariacao.descricao_ec1.Trim)
            and (tipoec1.ToUpper.Trim = hwVariacao.tipo_ec1.ToUpper.Trim)) then
          begin
            hwVariacao.id := trayVariacao.id;
            Break;
          end
          else if ((tipoec.ToUpper.Trim = 'COR')
            and (trayVariacao.Sku[0].type_.Trim = hwVariacao.descricao_ec.Trim)
            and ('CORES'.Trim = hwVariacao.tipo_ec.ToUpper.Trim))
            and ((trayVariacao.Sku[1].type_.Trim = hwVariacao.descricao_ec1.Trim)
            and (tipoec1.ToUpper.Trim = hwVariacao.tipo_ec1.ToUpper.Trim)) then
          begin
            hwVariacao.id := trayVariacao.id;
            Break;
          end
          else if ((tipoec.ToUpper.Trim = 'CORES')
            and (trayVariacao.Sku[0].type_.Trim = hwVariacao.descricao_ec.Trim)
            and ('COR'.Trim = hwVariacao.tipo_ec.ToUpper.Trim))
            and ((trayVariacao.Sku[1].type_.Trim = hwVariacao.descricao_ec1.Trim)
            and (tipoec1.ToUpper.Trim = hwVariacao.tipo_ec1.ToUpper.Trim)) then
          begin
            hwVariacao.id := trayVariacao.id;
            Break;
          end
          else if ((tipoec1.ToUpper.Trim = 'COR')
            and (trayVariacao.Sku[0].type_.Trim = hwVariacao.descricao_ec.Trim)
            and (tipoec.Trim = hwVariacao.tipo_ec.ToUpper.Trim))
            and ((trayVariacao.Sku[1].type_.Trim = hwVariacao.descricao_ec1.Trim)
            and ('CORES'.Trim = hwVariacao.tipo_ec1.ToUpper.Trim)) then
          begin
            hwVariacao.id := trayVariacao.id;
            Break;
          end
          else if ((tipoec1.ToUpper.Trim = 'CORES')
            and (trayVariacao.Sku[0].type_.Trim = hwVariacao.descricao_ec.Trim)
            and (tipoec.Trim = hwVariacao.tipo_ec.ToUpper.Trim))
            and ((trayVariacao.Sku[1].type_.Trim = hwVariacao.descricao_ec1.Trim)
            and ('COR'.Trim = hwVariacao.tipo_ec1.ToUpper.Trim)) then
          begin
            hwVariacao.id := trayVariacao.id;
            Break;
          end
          else if ((tipoec.ToUpper.Trim = 'COR') and (tipoec1.ToUpper.Trim = 'COR')
            and (trayVariacao.Sku[0].type_.Trim = hwVariacao.descricao_ec.Trim)
            and ('CORES'.Trim = hwVariacao.tipo_ec.ToUpper.Trim))
            and ((trayVariacao.Sku[1].type_.Trim = hwVariacao.descricao_ec1.Trim)
            and ('CORES'.Trim = hwVariacao.tipo_ec1.ToUpper.Trim)) then
          begin
            hwVariacao.id := trayVariacao.id;
            Break;
          end
          else if ((tipoec.ToUpper.Trim = 'CORES') and (tipoec1.ToUpper.Trim = 'CORES')
            and (trayVariacao.Sku[0].type_.Trim = hwVariacao.descricao_ec.Trim)
            and ('COR'.Trim = hwVariacao.tipo_ec.ToUpper.Trim))
            and ((trayVariacao.Sku[1].type_.Trim = hwVariacao.descricao_ec1.Trim)
            and ('COR'.Trim = hwVariacao.tipo_ec1.ToUpper.Trim)) then
          begin
            hwVariacao.id := trayVariacao.id;
            Break;
          end;
        end
        else if Length(trayVariacao.Sku) > 0 then
        begin
          if ((trayVariacao.Sku[0].type_.Trim = hwVariacao.descricao_ec.Trim)
            and (tipoec.Trim = hwVariacao.tipo_ec.Trim)) then
          begin
            hwVariacao.id := trayVariacao.id;
            Break;
          end
          else if ((trayVariacao.Sku[0].type_.Trim = hwVariacao.descricao_ec.Trim)
            and (tipoec.ToUpper.Trim = hwVariacao.tipo_ec.ToUpper.Trim)) then
          begin
            hwVariacao.id := trayVariacao.id;
            Break;
          end
          else if ((tipoec.ToUpper.Trim = 'COR')
            and (trayVariacao.Sku[0].type_.Trim = hwVariacao.descricao_ec.Trim)
            and ('CORES'.Trim = hwVariacao.tipo_ec.ToUpper.Trim)) then
          begin
            hwVariacao.id := trayVariacao.id;
            Break;
          end
          else if ((tipoec.ToUpper.Trim = 'CORES')
            and (trayVariacao.Sku[0].type_.Trim = hwVariacao.descricao_ec.Trim)
            and ('COR'.Trim = hwVariacao.tipo_ec.ToUpper.Trim)) then
          begin
            hwVariacao.id := trayVariacao.id;
            Break;
          end;
        end;
      end;

      Result := Result + [hwVariacao];

    end;
  finally
    AllVariacoes.prepare_loop_done;
  end;
end;

function THwTrayServicos.utilizaImagemERP(pGrupoProd: Integer; pCodProd: string;
  pCodigoKit: Integer): boolean;
var
  QrAux2: TIBQuery;
begin
  Result := False;

  QrAux2 := TIBQuery.Create(Application);
  QrAux2.Database := QrAux.Database;
  QrAux2.Transaction := QrAux.Transaction;

  try
    if pCodigoKit > 0 then
    begin
      QrAux.Close;
      QrAux.SQL.Text := ' update kits_prod set url_imagens = :url_imagens ' +
        ' where codigo_kit = :codigo_kit ' +
        ' and cod_empresa = :cod_empresa ';
      QrAux.ParamByName('codigo_kit').AsInteger := pCodigoKit;
      QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
      QrAux.ParamByName('url_imagens').Value := Null;
      QrAux.ExecSQL;

      QrAux2.Close;
      QrAux2.SQL.Text := ' select img.cod_img from kits_prod_imagens pimg ' +
        ' inner join imagens_doc img on ' +
        '   img.cod_img = pimg.cod_img ' +
        '   and img.cod_empresa = pimg.cod_empresa ' +
        ' where pimg.codigo_kit = :codigo_kit ' +
        ' and pimg.cod_empresa = :cod_empresa ';
      QrAux2.ParamByName('codigo_kit').AsInteger := pCodigoKit;
      QrAux2.ParamByName('cod_empresa').AsInteger := CodEmpresa;
      QrAux2.Open;

      QrAux2.First;
      while not QrAux2.Eof do
      begin
        QrAux.Close;
        QrAux.SQL.Text := ' update imagens_doc set url = :url ' +
          ' where cod_img = :cod_img ' +
          ' and cod_empresa = :cod_empresa ';
        QrAux.ParamByName('cod_img').AsInteger := QrAux2.FieldByName('cod_img').AsInteger;
        QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
        QrAux.ParamByName('url').Value := Null;
        QrAux.ExecSQL;

        QrAux2.Next;
      end;
    end
    else
    begin
      QrAux.Close;
      QrAux.SQL.Text := ' update produtos_imagens set url_imagens = :url_imagens ' +
        ' where grupo_prod = :grupo_prod ' +
        ' and cod_prod = :cod_prod ' +
        ' and cod_empresa = :cod_empresa ';
      QrAux.ParamByName('grupo_prod').AsInteger := pGrupoProd;
      QrAux.ParamByName('cod_prod').AsString := pCodProd;
      QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
      QrAux.ParamByName('url_imagens').Value := Null;
      QrAux.ExecSQL;

      QrAux2.Close;
      QrAux2.SQL.Text := ' select img.cod_img from produtos_grade_imagens pimg ' +
        ' inner join imagens_doc img on ' +
        '   img.cod_img = pimg.cod_img ' +
        '   and img.cod_empresa = pimg.cod_empresa ' +
        ' where pimg.grupo_prod = :grupo_prod ' +
        ' and pimg.cod_prod = :cod_prod ' +
        ' and pimg.cod_empresa = :cod_empresa ';
      QrAux2.ParamByName('grupo_prod').AsInteger := pGrupoProd;
      QrAux2.ParamByName('cod_prod').AsString := pCodProd;
      QrAux2.ParamByName('cod_empresa').AsInteger := CodEmpresa;
      QrAux2.Open;

      QrAux2.First;
      while not QrAux2.Eof do
      begin
        QrAux.Close;
        QrAux.SQL.Text := ' update imagens_doc set url = :url ' +
          ' where cod_img = :cod_img ' +
          ' and cod_empresa = :cod_empresa ';
        QrAux.ParamByName('cod_img').AsInteger := QrAux2.FieldByName('cod_img').AsInteger;
        QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
        QrAux.ParamByName('url').Value := Null;
        QrAux.ExecSQL;

        QrAux2.Next;
      end;
    end;

    if QrAux.Transaction.InTransaction then
      QrAux.Transaction.Commit;

    Result := true;
  except on E: Exception do
    begin
      FrmTrayCadastros.IdHTTP.Disconnect;
      if QrAux.Transaction.InTransaction then
        QrAux.Transaction.Rollback;
      Result := False;
      LogError('utilizaImagemERP. Erro: %s', [e.Message]);
      if not SilentMod then
        ShowErro('Erro ao utilizar imagem. %s',  [e.Message]);
    end;
  end;
end;

function THwTrayServicos.VincularCategoria(trayCategoria: TCategory;
  hwId: Integer): Boolean;
begin
  if not conectar(DataBasePath, True)  then
    Exit;

  try

    try

      with SqlExec('update categoria set id_commerce = %s, descricao = %s' +
                   ' where cod_categoria = %d and cod_empresa = %d',
                   [trayCategoria.id, trayCategoria.name.Substring(0, 50).Trim.QuotedString, hwId, CodEmpresa]).Transaction do
        if InTransaction then
          Commit;

      Result := True;

      Auditor.Sucesso.GravarMensagem('E-commerce %s %s', [trayCategoria.id, trayCategoria.name.Substring(0, 50).Trim]);

    except on E: Exception do
      begin
        Result := False;
        LogError('THwTrayServicos.VincularCategoria. tray %s %s HwId %d. Erro: %s', [trayCategoria.id, trayCategoria.name , hwId, e.Message]);
        if not SilentMod then
          ShowErro('Erro ao vincular Categoria. %s',  [e.Message]);
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwTrayServicos.VincularGrade(trayGrade: TPropertyWithValueHw;
  Primaria: Boolean; hwId: Integer): Boolean;
var
  grade: TGrade_class;
  descricao, tipoec, descricaoec: string;
begin
  if not conectar(DataBasePath, True)  then
    Exit;

  grade := TGrade_class.Create;
  try

    try
      tipoec      := trayGrade.name.Trim.Substring(0, 100);
      descricaoec := trayGrade.value_name.Trim.Substring(0, 100);
      descricao   := (trayGrade.name.Trim + ' ' + trayGrade.value_name.Trim).ToUpper.Trim.Substring(0, 32);

      //usando o registro original para comparar se existe outro no banco que igual depois da alteração
      grade.CopyFrom(ClientOOP('select * from grade where cod_grade = %d and cod_empresa = %d', [hwId, CodEmpresa]).DataSet);

      with ClientOOP('select * from grade g' +
                     ' where ((trim(coalesce(g.descricao, '''')) = %s and trim(coalesce(g.descricao1, '''')) = %s)' +
                     ' or ((trim(coalesce(g.tipo_ec, '''')) = %s and trim(coalesce(g.descricao_ec, '''')) = %s)' +
                     '  and (trim(coalesce(g.tipo_ec1, '''')) = %s and trim(coalesce(g.descricao_ec1, '''')) = %s)))' +
                     ' and g.cod_empresa = %d and g.cod_grade <> %d ',
                     [IfThen(    Primaria, descricao.Trim.QuotedString  , grade.descricao.Trim.QuotedString),
                      IfThen(not Primaria, descricao.Trim.QuotedString  , grade.descricao1.Trim.QuotedString),
                      IfThen(    Primaria, tipoec.Trim.QuotedString     , grade.tipo_ec.Trim.QuotedString),
                      IfThen(    Primaria, descricaoec.Trim.QuotedString, grade.descricao_ec.Trim.QuotedString),
                      IfThen(not Primaria, tipoec.Trim.QuotedString     , grade.tipo_ec1.Trim.QuotedString),
                      IfThen(not Primaria, descricaoec.Trim.QuotedString, grade.descricao_ec1.Trim.QuotedString),
                      CodEmpresa, hwId]) do
          if not IsEmpty then
            raise Exception.Create(Format('Já existe caracteristica(grade) no banco com mesma combinação' + sLineBreak +
                                          'Grade %d %s - %s / Lixeira: %s' + sLineBreak +
                                          'E-commerce Tipo/Descrição 1: %s %s' + sLineBreak +
                                          'E-commerce Tipo/Descrição 2: %s %s',
                                          [fint('cod_grade'), trim(fstr('descricao')), trim(fstr('descricao1')),
                                           IfThen(fequals('ativo', '1'), 'Não', 'Sim'),
                                           trim(fstr('tipo_ec')), trim(fstr('descricao_ec')),
                                           trim(fstr('tipo_ec1')), trim(fstr('descricao_ec1'))]));

      if Primaria then
      begin
        //grade.descricao    := descricao;
        grade.tipo_ec      := tipoec.Trim;
        grade.descricao_ec := descricaoec.Trim;
      end
      else
      begin
        if grade.descricao1.Trim.IsEmpty then
          grade.descricao1  := descricao.Trim;
        grade.tipo_ec1      := tipoec.Trim;
        grade.descricao_ec1 := descricaoec.Trim;
      end;

      with SqlExec(grade.SQLMotor().SQLUpdate).Transaction do
        if InTransaction then
          Commit;

      Result := True;

      Auditor.Sucesso.GravarMensagem(' %s %s E-commerce %s %s', [IfThen(Primaria, 'Primaria', 'Secundaria'), descricao, tipoec, descricaoec]);

    except on E: Exception do
      begin
        Result := False;
        LogError('THwTrayServicos.VincularGrade. tray %s %s HwId %d. Erro: %s', [trayGrade.id, trayGrade.name , hwId, e.Message]);
        if not SilentMod then
          ShowErro('Erro ao vincular Grade. %s',  [e.Message]);
      end;
    end;

  finally
    grade.Free;
    desconectar;
  end;
end;

function THwTrayServicos.VincularKitProduto(trayKitProduto: TProduct;
  hwCodigoKit: Integer): Boolean;
var
  vdescrkitprod: string;
  vdescrkitprodcompl: string;
  vdisponivel: string;
  vprecosobconsulta: string;
  vpromocional: string;
  vfretegratis: string;
  vlancamento: string;
  vdestaque: string;
  vvariacao: string;
  vvirtual: string;
  vimagens: string;
  vcodcategoria: Integer;
  vcodcategoria_adc: Integer;
  vcodean: string;
  servicoTmp: THwTrayServicos;
  variacoes: TArray<TVariant>;
  variacao: TVariant;
  trayKitProd: TProduct;
  trayKitCat: TCategory;
  trayProd: TProduct;
  trayProdutosKit: TArray<TProductKit>;
  consultaKitProd: TTrayConsulta;
  sku: TSku;
  vcodgrade: Integer;
  vtipoVar1, vtipoVar2: string;
  vdescricaoVar1, vdescricaoVar2: string;
  path: string;
  vimagensKitProd: string;
  QrAux2: TIBQuery;
  vStringListCategorias: TStringList;
  I: Integer;

  function kitprodutoTemImagem: string;
  begin
    QrAux.Close;
    QrAux.SQL.Text := ' select codigo_kit, cod_empresa, coalesce(lista_imagens, '''') lista_imagens from kits_prod  ' +
      ' where codigo_kit = :codigo_kit ' +
      ' and cod_empresa = :cod_empresa ' ;
    QrAux.ParamByName('codigo_kit').AsInteger := hwCodigoKit;
    QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
    QrAux.Open;

    Result := IfThen(trim(QrAux.FieldByName('LISTA_IMAGENS').AsString) = '', 'N', 'S');
  end;
begin
  testarImagem := true;
  if not Auditor.Alterar.Table(tbKitProduto).Processo('PRO416')
         .Key('%d', [hwCodigoKit])
         .Msg('Kit Prod Sistema %d, E-commerce %s', [hwCodigoKit, trayKitProduto.id])
         .Permitido then
    Exit;

  if not conectar(DataBasePath, True)  then
    Exit;

  try
    if (not GetDadosApi) then
      Exit;

    trayKitProd := trayConsumeApi.GetItem<TProduct>('products/' + trayKitProduto.id, []);

    consultaKitProd := GetConsulta('products/kits', 'ProductKits', ['product_parent_id=' + trayKitProduto.id]);

    trayProdutosKit := TJsonHw.ToArrayObject<TProductKit>(consultaKitProd.dadosDinamicos);

//    trayProdutosKit := trayConsumeApi.GetItem<TArray<TProductKit>>('products/kits/', ['product_parent_id=' + trayKitProduto.id]);

    vdescrkitprod := trayKitProd.name.Substring(0, 131).Trim;
    vdisponivel := IfThen(trayKitProd.available = '0', 'N', 'S');
    vprecosobconsulta := IfThen(trayProd.price.Trim = '0.00',
      'S', IfThen(trayProd.price.Trim = '0', 'S', 'N'));
    vpromocional := IfThen(trayKitProd.promotional_price = '0', 'N', 'S');
    vfretegratis := IfThen(trayKitProd.free_shipping = '0', 'N', 'S');
    vvirtual := IfThen(trayKitProd.virtual_product = '0', 'N', 'S');
    vlancamento := IfThen(trayKitProd.release = '0', 'N', 'S');
    vdestaque := IfThen(trayKitProd.hot = '0', 'N', 'S');
    vvariacao := IfThen(trayKitProd.has_variation = '0', 'N', 'S');
    vdescrkitprodcompl := trayKitProd.description;
    vcodcategoria := 0;
    vcodcategoria_adc := 0;
    vcodean := trayKitProd.ean;
    vimagens := IfThen(Length(trayKitProd.ProductImage) <= 0, 'N', 'S');
    vimagensKitProd := kitprodutoTemImagem;

    path := IncludeTrailingPathDelimiter(TConfig_sistema_class.getConf('prod_cad_diretorio_padrao_imagens', QrAux, CodEmpresa).value1_vc.Trim);

    if trim(path) = '' then
    begin
      ShowAtencao('Diretório padrão de imagens do cadastro do produto não configurado, favor verificar antes de continuar.');
      exit;
    end
    else if not DirectoryExists(trim(path)) then
    begin
      ShowAtencao('Diretório padrão de imagens do cadastro do produto não encontrado: ' + #13 +
        path + #13 + #13 +
        'Favor verificar antes de continuar.');
      exit;
    end;

    try
      with SqlOpen(' select cod_categoria from categoria ' +
        ' where id_commerce = ' + trayKitProduto.category_id +
        ' and cod_empresa = ' + IntToStr(CodEmpresa)) do
      begin
        vcodcategoria := 0;
        if FieldByName('cod_categoria').AsInteger > 0 then
          vcodcategoria := FieldByName('cod_categoria').AsInteger;

        if vcodcategoria <= 0 then
        begin
          if trim(trayKitProduto.category_id) <> '' then
          begin
            trayKitCat := trayConsumeApi.GetItem<TCategory>('categories/' + trayKitProduto.category_id, []);

            ShowAtencao('Categoria' + #13 +
              'Id: ' + trim(trayKitProduto.category_id) + #13 +
              'Descrição: ' + trim(trayKitCat.name) + #13 + #13 +
              'Favor cadastrar/vincular a categoria antes de vincular o kit!');
          end
          else
            ShowAtencao('Kit Produto sem categoria, favor vincular as categorias antes de vincular os produtos');
          Exit;
        end;
      end;

      vStringListCategorias := TStringList.Create;
      vStringListCategorias.Clear;
      if Length(trayKitProduto.related_categories) > 0 then
      begin
        for I := 0 to Length(trayKitProduto.related_categories) - 1 do
        begin
          vcodcategoria_adc := 0;
          with SqlOpen(' select cod_categoria, cod_empresa, ' +
            ' descricao, cod_categoria_pai, id_commerce from categoria ' +
            ' where id_commerce = ' + IntToStr(trayKitProduto.related_categories[I].ToInteger) +
            ' and cod_empresa = ' + IntToStr(CodEmpresa)) do
          begin
            if FieldByName('cod_categoria').AsInteger > 0 then
              vcodcategoria_adc := FieldByName('cod_categoria').AsInteger;

            if vcodcategoria_adc <= 0 then
            begin
              trayKitCat := trayConsumeApi.GetItem<TCategory>('categories/' + trayKitProduto.related_categories[I], []);

              ShowAtencao('Categoria' + #13 +
                'Id: ' + IntToStr(trayKitProduto.related_categories[I].ToInteger) + #13 +
                'Descrição: ' + trim(trayKitCat.name) + #13 + #13 +
                'Favor cadastrar/vincular a categoria antes de vincular o kit!');
              exit;
            end
            else
              vStringListCategorias.Add(IntToStr(vcodcategoria_adc));
          end;
        end;
      end;

      if Length(trayProdutosKit) > 0 then
      begin
        for I := 0 to Length(trayProdutosKit) - 1 do
        begin
           if SqlOpen(' select grupo_prod, cod_empresa, cod_empresa, ' +
            ' id_commerce from produtos_ec ' +
            ' where id_commerce = ' + trayProdutosKit[I].product_id +
            ' and cod_empresa = ' + IntToStr(CodEmpresa)).IsEmpty then
          begin
            trayProd := trayConsumeApi.GetItem<TProduct>('products/' + trayProdutosKit[I].product_id, []);

            ShowAtencao('Produto' + #13 +
                'Id: ' + trayProdutosKit[I].product_id + #13 +
                'Descrição: ' + trim(trayProd.name) + #13 + #13 +
                'Favor cadastrar/vincular a produto antes de vincular o kit!');
            exit;
          end;
        end;
      end;

      if (vimagens = 'S') and (vimagensKitProd = 'S') then
      begin
        if not abreFormImagem(
          0,
          '',
          hwCodigoKit,
          trayKitProd,
          variacoes) then
        begin
          Result := False;
          exit;
        end;

        if not testarImagem then
        begin
          Result := False;
          exit;
        end;
      end
      else if (vimagens = 'S') then
      begin
        if not adicionarImagemEC(
          0,
          '',
          hwCodigoKit,
          trayKitProd,
          variacoes) then
        begin
          Result := False;
          exit;
        end;

        if not testarImagem then
        begin
          Result := False;
          exit;
        end;
      end
      else if (vimagensKitProd = 'S') then
      begin
        if not utilizaImagemERP(
          0,
          '',
          hwCodigoKit) then
        begin
          Result := False;
          exit;
        end;
      end;

      QrAux.Close;
      QrAux.SQL.Text := 'update or insert into kits_prod_ec ' +
        ' (codigo_kit, cod_empresa, descr_kit_res, ' +
        ' sinc_ecommerce, disponivel, preco_a_combinar_ec, ' +
        ' promocional, frete_gratis, lancamento, destaque, variacao, ' +
        ' termos_aceite, comprejunto, virtual, ' +
        ' descr_kit_compl, cod_categoria, cod_ean, regra_peso_dim, id_commerce) ' +
        ' values ' +
        ' (:codigo_kit, :cod_empresa, :descr_kit_res, ' +
        ' :sinc_ecommerce, :disponivel, :preco_a_combinar_ec, ' +
        ' :promocional, :frete_gratis, :lancamento, :destaque, :variacao, ' +
        ' :termos_aceite, :comprejunto, :virtual, ' +
        ' :descr_kit_compl, :cod_categoria, :cod_ean, :regra_peso_dim, :id_commerce) ' +
        ' matching (codigo_kit, cod_empresa); ';
      QrAux.ParamByName('codigo_kit').AsInteger := hwCodigoKit;
      QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
      QrAux.ParamByName('descr_kit_res').AsString := trim(vdescrkitprod);
      QrAux.ParamByName('sinc_ecommerce').AsString := 'S';
      QrAux.ParamByName('disponivel').AsString := vdisponivel;
      QrAux.ParamByName('preco_a_combinar_ec').AsString := vprecosobconsulta;
      QrAux.ParamByName('promocional').AsString := vpromocional;
      QrAux.ParamByName('frete_gratis').AsString := vfretegratis;
      QrAux.ParamByName('lancamento').AsString := vlancamento;
      QrAux.ParamByName('destaque').AsString := vdestaque;
      QrAux.ParamByName('variacao').AsString := vvariacao;
      QrAux.ParamByName('termos_aceite').AsString := 'N';
      QrAux.ParamByName('comprejunto').AsString := 'N';
      QrAux.ParamByName('virtual').AsString := vvirtual;
      QrAux.ParamByName('descr_kit_compl').AsString := vdescrkitprodcompl;
      QrAux.ParamByName('cod_categoria').AsInteger := vcodcategoria;
      QrAux.ParamByName('cod_ean').AsString := vcodean;
      QrAux.ParamByName('regra_peso_dim').AsString := 'SOMARPESODIM';
      QrAux.ParamByName('id_commerce').AsInteger := StrToInt(trayKitProduto.id);
      QrAux.ExecSQL;

      if vStringListCategorias.Count > 0 then
      begin
        for I := 0 to vStringListCategorias.Count - 1 do
        begin
          QrAux.Close;
          QrAux.SQL.Text := 'update or insert into kits_prod_categoria ' +
            ' (codigo_kit, cod_empresa, cod_categoria) ' +
            ' values (:codigo_kit, :cod_empresa, :cod_categoria) ' +
            ' matching (codigo_kit, cod_empresa, cod_categoria); ';
          QrAux.ParamByName('codigo_kit').AsInteger := hwCodigoKit;
          QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
          QrAux.ParamByName('cod_categoria').AsInteger := StrToInt(vStringListCategorias[I]);
          QrAux.ExecSQL;
        end;
      end;

      QrAux.Close;
      QrAux.SQL.Text := 'update kits_prod set id_commerce = :id_commerce ' +
        ' where codigo_kit = :codigo_kit ' +
        ' and cod_empresa = :cod_empresa ';
      QrAux.ParamByName('codigo_kit').AsInteger := hwCodigoKit;
      QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
      QrAux.ParamByName('id_commerce').AsInteger := StrToInt(trayKitProduto.id);
      QrAux.ExecSQL;

      if QrAux.Transaction.InTransaction then
        QrAux.Transaction.Commit;

      Result := True;

      Auditor.Sucesso.GravarMensagem('E-commerce %s %s', [trayKitProduto.id, trayKitProduto.name]);

    except on E: Exception do
      begin
        Result := False;
        LogError('THwTrayServicos.VincularProduto. tray %s Codigo_kit %d. Erro: %s', [trayKitProduto.id, hwCodigoKit, e.Message]);
        if not SilentMod then
          ShowErro('Erro ao vincular Produtos. %s',  [e.Message]);
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwTrayServicos.VincularMarca(
  trayMarca: TBrand; hwId: Integer): Boolean;
begin
  if not conectar(DataBasePath, True)  then
    Exit;

  try

    try
      with SqlExec('update marca_prod set descricao_ec = %s' +
                   ' where cod_marca = %d',
                   [trayMarca.brand.Substring(0, 30).Trim.QuotedString, hwId]).Transaction do
        if InTransaction then
          Commit;

      with SqlExec('update or insert into marca_prod_ec ' +
                   ' (cod_marca, cod_empresa, id_commerce) ' +
                   ' values (%d, %d, %d) ' +
                   ' matching (cod_marca, cod_empresa);',
                   [hwId, CodEmpresa, trayMarca.id.ToInteger]).Transaction do
        if InTransaction then
          Commit;

      Result := True;

      Auditor.Sucesso.GravarMensagem('E-commerce %s %s', [trayMarca.id, trayMarca.brand.Substring(0, 30).Trim]);

    except on E: Exception do
      begin
        Result := False;
        LogError('THwTrayServicos.VincularMarca. tray %s %s HwId %d. Erro: %s', [trayMarca.id, trayMarca.brand , hwId, e.Message]);
        if not SilentMod then
          ShowErro('Erro ao vincular Marca. %s',  [e.Message]);
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwTrayServicos.VincularProduto(trayProduto: TProduct;
  hwGrupoProd: Integer; hwCodProd: string;
  hwAltura_prod: Double; hwComprimento_prod: Double;
  hwLargura_prod: Double; hwPeso_brut_prod: Double;
  hwPeso_liq_prod: Double): Boolean;
var
  vdescrprod: string;
  vdescrprodcompl: string;
  vdisponivel: string;
  vprecosobconsulta: string;
  vpromocional: string;
  vfretegratis: string;
  vlancamento: string;
  vdestaque: string;
  vvariacao: string;
  vvirtual: string;
  vimagens: string;
  vcodcategoria: Integer;
  vcodcategoria_pai: Integer;
  vcodcategoria_adc: Integer;
  servicoTmp: THwTrayServicos;
  variacoes: TArray<TVariant>;
  trayProd: TProduct;
  trayCat: TCategory;
  sku: TSku;
  vcodgrade: Integer;
  vtipoVar1, vtipoVar2: string;
  vdescricaoVar1, vdescricaoVar2: string;
  path: string;
  vimagensProd: string;
  vGradeEncontrada: boolean;
  QrAux2: TIBQuery;
  vStringListCategorias: TStringList;
  vPesoBruto, vPesoLiquido, vAltura, vLargura, vComprimento: Double;
  I: Integer;

  function produtoTemImagem: string;
  begin
    QrAux.Close;
    QrAux.SQL.Text := ' select grupo_prod, cod_prod, cod_grade, cod_empresa from retorna_img_prod (:grupo_prod, :cod_prod, 0, :cod_empresa) ';
    QrAux.ParamByName('grupo_prod').AsInteger := hwGrupoProd;
    QrAux.ParamByName('cod_prod').AsString := hwCodProd;
    QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
    QrAux.Open;

    Result := IfThen(QrAux.IsEmpty, 'N', 'S');
  end;
begin
  testarImagem := true;
  if not Auditor.Alterar.Table(tbProduto).Processo('PRO385')
         .Key('%d-%s', [hwGrupoProd, hwCodProd])
         .Msg('Prod Sistema %d-%s, E-commerce %s', [hwGrupoProd, hwCodProd, trayProduto.id])
         .Permitido then
    Exit;

  if not conectar(DataBasePath, 'SYSDBA', 'masterkey', True)  then
    Exit;

  try
    if (not GetDadosApi) then
      Exit;

    QrAux2 := TIBQuery.Create(Application);
    QrAux2.Database := QrAux.Database;
    QrAux2.Transaction := QrAux.Transaction;

    trayProd := trayConsumeApi.GetItem<TProduct>('products/' + trayProduto.id, []);

    vPesoBruto   := 0;
    vPesoLiquido := 0;
    vAltura      := 0;
    vLargura     := 0;
    vComprimento := 0;

    //Peso Bruto
    vPesoBruto   := StrToFloat(IfThen(trayProd.weight = Null,
      '0',
      StringReplace(trayProd.weight, '.', ',', [rfIgnoreCase])));

    // Peso Liquido
    vPesoLiquido := StrToFloat(IfThen(trayProd.weight = Null,
      '0',
      StringReplace(trayProd.weight, '.', ',', [rfIgnoreCase])));

    //Altura
    vAltura      := StrToFloat(IfThen(trayProd.height = Null,
      '0',
      StringReplace(trayProd.height, '.', ',', [rfIgnoreCase])));

    //Largura
    vLargura     := StrToFloat(IfThen(trayProd.width = Null,
      '0',
      StringReplace(trayProd.width, '.', ',', [rfIgnoreCase])));

    //Comprimento
    vComprimento := StrToFloat(IfThen(trayProd.length = Null,
      '0',
      StringReplace(trayProd.length, '.', ',', [rfIgnoreCase])));

    vdescrprod := trayProd.name.Substring(0, 131).Trim;
    vdisponivel := IfThen(trayProd.available = '0', 'N', 'S');
    vprecosobconsulta := IfThen(trayProd.price.Trim = '0.00',
      'S', IfThen(trayProd.price.Trim = '0', 'S', 'N'));
    vpromocional := IfThen(trayProd.promotional_price = '0', 'N', 'S');
    vfretegratis := IfThen(trayProd.free_shipping = '0', 'N', 'S');
    vvirtual := IfThen(trayProd.virtual_product = '0', 'N', 'S');
    vlancamento := IfThen(trayProd.release = '0', 'N', 'S');
    vdestaque := IfThen(trayProd.hot = '0', 'N', 'S');
    vvariacao := IfThen(trayProd.has_variation = '0', 'N', 'S');
    vdescrprodcompl := trayProd.description;
    vcodcategoria := 0;
    vcodcategoria_adc := 0;
    vimagens := IfThen(Length(trayProd.ProductImage) <= 0, 'N', 'S');
    vimagensProd := produtoTemImagem;

    path := IncludeTrailingPathDelimiter(TConfig_sistema_class.getConf('prod_cad_diretorio_padrao_imagens', QrAux, CodEmpresa).value1_vc.Trim);

    if trim(path) = '' then
    begin
      ShowAtencao('Diretório padrão de imagens do cadastro do produto não configurado, favor verificar antes de continuar.');
      exit;
    end
    else if not DirectoryExists(trim(path)) then
    begin
      ShowAtencao('Diretório padrão de imagens do cadastro do produto não encontrado: ' + #13 +
        path + #13 + #13 +
        'Favor verificar antes de continuar.');
      exit;
    end;

    if ((hwPeso_brut_prod <= 0) and (vPesoBruto <= 0) and (hwPeso_liq_prod <= 0) and (vPesoLiquido <= 0))
      or ((hwAltura_prod <= 0) and (vAltura <= 0))
      or ((hwComprimento_prod <= 0) and (vComprimento <= 0))
      or ((hwLargura_prod <= 0) and (vLargura <= 0)) then
    begin
      ShowAtencao('Para vincular o produto é necessário ter informações do peso bruto, peso líquido, altura, comprimento e largura. '+ #13 + #13 +
        'Favor informar antes de continuar.');
      exit;
    end;

    try
      with SqlOpen(' select cod_categoria from categoria ' +
        ' where id_commerce = ' + trayProduto.category_id +
        ' and cod_empresa = ' + IntToStr(CodEmpresa)) do
      begin
        vcodcategoria := 0;
        if FieldByName('cod_categoria').AsInteger > 0 then
          vcodcategoria := FieldByName('cod_categoria').AsInteger;

        if vcodcategoria <= 0 then
        begin
          if trim(trayProduto.category_id) <> '' then
          begin
            trayCat := trayConsumeApi.GetItem<TCategory>('categories/' + trayProduto.category_id, []);

            ShowAtencao('Categoria' + #13 +
              'Id: ' + trim(trayProduto.category_id) + #13 +
              'Descrição: ' + trim(trayCat.name) + #13 + #13 +
              'Favor cadastrar/vincular a categoria antes de vincular o produto!');
          end
          else
            ShowAtencao('Produto sem categoria principal, favor vincular as categorias antes de vincular os produtos');
          Exit;
        end;
      end;

      vStringListCategorias := TStringList.Create;
      vStringListCategorias.Clear;
      if Length(trayProd.related_categories) > 0 then
      begin
        for I := 0 to Length(trayProd.related_categories) - 1 do
        begin
          vcodcategoria_adc := 0;
          with SqlOpen(' select cod_categoria, cod_empresa, ' +
            ' descricao, cod_categoria_pai, id_commerce from categoria ' +
            ' where id_commerce = ' + IntToStr(trayProd.related_categories[I].ToInteger) +
            ' and cod_empresa = ' + IntToStr(CodEmpresa)) do
          begin
            if FieldByName('cod_categoria').AsInteger > 0 then
              vcodcategoria_adc := FieldByName('cod_categoria').AsInteger;

            if vcodcategoria_adc <= 0 then
            begin
              trayCat := trayConsumeApi.GetItem<TCategory>('categories/' + trayProd.related_categories[I], []);

              ShowAtencao('Categoria' + #13 +
                'Id: ' + IntToStr(trayProd.related_categories[I].ToInteger) + #13 +
                'Descrição: ' + trim(trayCat.name) + #13 + #13 +
                'Favor cadastrar/vincular a categoria antes de vincular o produto!');
              exit;
            end
            else
              vStringListCategorias.Add(IntToStr(vcodcategoria_adc));
          end;
        end;
      end;

      if vvariacao = 'S' then
      begin
//        if (ShowConfirmacao('Produto tem variação, ao vincular as variações serão removidas do E-Commerce. ' + #13 + #13 +
//          'Deseja vincular esse produto assim mesmo?') <> ID_YES) then
//          exit;

        variacoes := trayConsumeApi.Get<TVariant>('products/variants', 'Variants', ['product_id=' + trayProduto.id]);

        for I := 0 to Length(variacoes) - 1 do
        begin
          vcodgrade := 0;
          vtipoVar1 := '';
          vtipoVar2 := '';
          vdescricaoVar1 := '';
          vdescricaoVar2 := '';
          for sku in variacoes[I].Sku do
          begin
            if (trim(vtipoVar1) = '') then
            begin
              vtipoVar1 := sku.type_;
              vdescricaoVar1 := sku.value;
            end
            else if (trim(vtipoVar1) <> '') and (trim(vtipoVar2) = '') then
            begin
              vtipoVar2 := sku.type_;
              vdescricaoVar2 := sku.value;
            end;
          end;

          QrAux.Close;
          QrAux.SQL.Text := ' select cod_grade, cod_empresa from grade ' +
            ' where trim(tipo_ec) = :tipo_ec ' +
            ' and trim(descricao_ec) = :descricao_ec ';

          if trim(vtipoVar2) = '' then
            QrAux.SQL.Text := QrAux.SQL.Text +
                ' and trim(coalesce(tipo_ec1, '''')) = '''' ' +
                ' and trim(coalesce(descricao_ec1, '''')) = '''' '
          else
            QrAux.SQL.Text := QrAux.SQL.Text +
              ' and trim(tipo_ec1) = :tipo_ec1 ' +
              ' and trim(descricao_ec1) = :descricao_ec1 ';

          QrAux.SQL.Text := QrAux.SQL.Text +
            ' and cod_empresa = :cod_empresa ';
          QrAux.ParamByName('tipo_ec').AsString := trim(vtipoVar1);
          QrAux.ParamByName('descricao_ec').AsString := trim(vdescricaoVar1);
          QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
          if trim(vtipoVar2) <> '' then
          begin
            QrAux.ParamByName('tipo_ec1').AsString := trim(vtipoVar2);
            QrAux.ParamByName('descricao_ec1').AsString := trim(vdescricaoVar2);
          end;
          QrAux.Open;

          if QrAux.IsEmpty then
          begin
            QrAux.Close;
            QrAux.SQL.Text := ' select cod_grade, cod_empresa from grade ' +
              ' where upper(trim(tipo_ec)) = :tipo_ec ' +
              ' and trim(descricao_ec) = :descricao_ec ';

            if trim(vtipoVar2) = '' then
              QrAux.SQL.Text := QrAux.SQL.Text +
                ' and trim(coalesce(tipo_ec1, '''')) = '''' ' +
                ' and trim(coalesce(descricao_ec1, '''')) = '''' '
            else
              QrAux.SQL.Text := QrAux.SQL.Text +
                ' and trim(tipo_ec1) = :tipo_ec1 ' +
                ' and trim(descricao_ec1) = :descricao_ec1 ';

            QrAux.SQL.Text := QrAux.SQL.Text +
              ' and cod_empresa = :cod_empresa ';
            QrAux.ParamByName('tipo_ec').AsString := UpperCase(trim(vtipoVar1));
            QrAux.ParamByName('descricao_ec').AsString := trim(vdescricaoVar1);
            QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
            if trim(vtipoVar2) <> '' then
            begin
              QrAux.ParamByName('tipo_ec1').AsString := UpperCase(trim(vtipoVar2));
              QrAux.ParamByName('descricao_ec1').AsString := trim(vdescricaoVar2);
            end;
            QrAux.Open;
          end;

          if QrAux.IsEmpty then
          begin
            QrAux.Close;
            QrAux.SQL.Text := ' select cod_grade, cod_empresa from grade ' +
              ' where trim(tipo_ec) = :tipo_ec ' +
              ' and trim(descricao_ec) = :descricao_ec ';

            if trim(vtipoVar2) = '' then
              QrAux.SQL.Text := QrAux.SQL.Text +
                ' and trim(coalesce(tipo_ec1, '''')) = '''' ' +
                ' and trim(coalesce(descricao_ec1, '''')) = '''' '
            else
              QrAux.SQL.Text := QrAux.SQL.Text +
                ' and upper(trim(tipo_ec1)) = :tipo_ec1 ' +
                ' and trim(descricao_ec1) = :descricao_ec1 ';

            QrAux.SQL.Text := QrAux.SQL.Text +
              ' and cod_empresa = :cod_empresa ';
            QrAux.ParamByName('tipo_ec').AsString := trim(vtipoVar1);
            QrAux.ParamByName('descricao_ec').AsString := trim(vdescricaoVar1);
            QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
            if trim(vtipoVar2) <> '' then
            begin
              QrAux.ParamByName('tipo_ec1').AsString := UpperCase(trim(vtipoVar2));
              QrAux.ParamByName('descricao_ec1').AsString := trim(vdescricaoVar2);
            end;
            QrAux.Open;
          end;

          if QrAux.IsEmpty then
          begin
            QrAux.Close;
            QrAux.SQL.Text := ' select cod_grade, cod_empresa from grade ' +
              ' where upper(trim(tipo_ec)) = :tipo_ec ' +
              ' and trim(descricao_ec) = :descricao_ec ';

            if trim(vtipoVar2) = '' then
              QrAux.SQL.Text := QrAux.SQL.Text +
                ' and trim(coalesce(tipo_ec1, '''')) = '''' ' +
                ' and trim(coalesce(descricao_ec1, '''')) = '''' '
            else
              QrAux.SQL.Text := QrAux.SQL.Text +
                ' and upper(trim(tipo_ec1)) = :tipo_ec1 ' +
                ' and trim(descricao_ec1) = :descricao_ec1 ';

            QrAux.SQL.Text := QrAux.SQL.Text +
              ' and cod_empresa = :cod_empresa ';
            QrAux.ParamByName('tipo_ec').AsString := UpperCase(trim(vtipoVar1));
            QrAux.ParamByName('descricao_ec').AsString := trim(vdescricaoVar1);
            QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
            if trim(vtipoVar2) <> '' then
            begin
              QrAux.ParamByName('tipo_ec1').AsString := UpperCase(trim(vtipoVar2));
              QrAux.ParamByName('descricao_ec1').AsString := trim(vdescricaoVar2);
            end;
            QrAux.Open;
          end;

          if (QrAux.IsEmpty)
            and (UpperCase(trim(vtipoVar1)) = 'CORES') then
          begin
            QrAux.Close;
            QrAux.SQL.Text := ' select cod_grade, cod_empresa from grade ' +
              ' where upper(trim(tipo_ec)) = :tipo_ec ' +
              ' and trim(descricao_ec) = :descricao_ec ';

            if trim(vtipoVar2) = '' then
              QrAux.SQL.Text := QrAux.SQL.Text +
                ' and trim(coalesce(tipo_ec1, '''')) = '''' ' +
                ' and trim(coalesce(descricao_ec1, '''')) = '''' '
            else
              QrAux.SQL.Text := QrAux.SQL.Text +
                ' and trim(tipo_ec1) = :tipo_ec1 ' +
                ' and trim(descricao_ec1) = :descricao_ec1 ';

            QrAux.SQL.Text := QrAux.SQL.Text +
              ' and cod_empresa = :cod_empresa ';
            QrAux.ParamByName('tipo_ec').AsString := 'COR';
            QrAux.ParamByName('descricao_ec').AsString := trim(vdescricaoVar1);
            QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
            if trim(vtipoVar2) <> '' then
            begin
              QrAux.ParamByName('tipo_ec1').AsString := UpperCase(trim(vtipoVar2));
              QrAux.ParamByName('descricao_ec1').AsString := trim(vdescricaoVar2);
            end;
            QrAux.Open;
          end;

          if (QrAux.IsEmpty)
            and (UpperCase(trim(vtipoVar1)) = 'COR') then
          begin
            QrAux.Close;
            QrAux.SQL.Text := ' select cod_grade, cod_empresa from grade ' +
              ' where upper(trim(tipo_ec)) = :tipo_ec ' +
              ' and trim(descricao_ec) = :descricao_ec ';

            if trim(vtipoVar2) = '' then
              QrAux.SQL.Text := QrAux.SQL.Text +
                ' and trim(coalesce(tipo_ec1, '''')) = '''' ' +
                ' and trim(coalesce(descricao_ec1, '''')) = '''' '
            else
              QrAux.SQL.Text := QrAux.SQL.Text +
                ' and trim(tipo_ec1) = :tipo_ec1 ' +
                ' and trim(descricao_ec1) = :descricao_ec1 ';

            QrAux.SQL.Text := QrAux.SQL.Text +
              ' and cod_empresa = :cod_empresa ';
            QrAux.ParamByName('tipo_ec').AsString := 'CORES';
            QrAux.ParamByName('descricao_ec').AsString := trim(vdescricaoVar1);
            QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
            if trim(vtipoVar2) <> '' then
            begin
              QrAux.ParamByName('tipo_ec1').AsString := UpperCase(trim(vtipoVar2));
              QrAux.ParamByName('descricao_ec1').AsString := trim(vdescricaoVar2);
            end;
            QrAux.Open;
          end;

          if (QrAux.IsEmpty)
            and (UpperCase(trim(vtipoVar2)) = 'CORES') then
          begin
            QrAux.Close;
            QrAux.SQL.Text := ' select cod_grade, cod_empresa from grade ' +
              ' where trim(tipo_ec) = :tipo_ec ' +
              ' and trim(descricao_ec) = :descricao_ec ';

            if trim(vtipoVar2) = '' then
              QrAux.SQL.Text := QrAux.SQL.Text +
                ' and trim(coalesce(tipo_ec1, '''')) = '''' ' +
                ' and trim(coalesce(descricao_ec1, '''')) = '''' '
            else
              QrAux.SQL.Text := QrAux.SQL.Text +
                ' and upper(trim(tipo_ec1)) = :tipo_ec1 ' +
                ' and trim(descricao_ec1) = :descricao_ec1 ';

            QrAux.SQL.Text := QrAux.SQL.Text +
              ' and cod_empresa = :cod_empresa ';
            QrAux.ParamByName('tipo_ec').AsString := trim(vtipoVar1);
            QrAux.ParamByName('descricao_ec').AsString := trim(vdescricaoVar1);
            QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
            if trim(vtipoVar2) <> '' then
            begin
              QrAux.ParamByName('tipo_ec1').AsString := 'COR';
              QrAux.ParamByName('descricao_ec1').AsString := trim(vdescricaoVar2);
            end;
            QrAux.Open;
          end;

          if (QrAux.IsEmpty)
            and (UpperCase(trim(vtipoVar2)) = 'COR') then
          begin
            QrAux.Close;
            QrAux.SQL.Text := ' select cod_grade, cod_empresa from grade ' +
              ' where trim(tipo_ec) = :tipo_ec ' +
              ' and trim(descricao_ec) = :descricao_ec ';

            if trim(vtipoVar2) = '' then
              QrAux.SQL.Text := QrAux.SQL.Text +
                ' and trim(coalesce(tipo_ec1, '''')) = '''' ' +
                ' and trim(coalesce(descricao_ec1, '''')) = '''' '
            else
              QrAux.SQL.Text := QrAux.SQL.Text +
                ' and upper(trim(tipo_ec1)) = :tipo_ec1 ' +
                ' and trim(descricao_ec1) = :descricao_ec1 ';

            QrAux.SQL.Text := QrAux.SQL.Text +
              ' and cod_empresa = :cod_empresa ';
            QrAux.ParamByName('tipo_ec').AsString := trim(vtipoVar1);
            QrAux.ParamByName('descricao_ec').AsString := trim(vdescricaoVar1);
            QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
            if trim(vtipoVar2) <> '' then
            begin
              QrAux.ParamByName('tipo_ec1').AsString := 'CORES';
              QrAux.ParamByName('descricao_ec1').AsString := trim(vdescricaoVar2);
            end;
            QrAux.Open;
          end;

          if (QrAux.IsEmpty)
            and (UpperCase(trim(vtipoVar1)) = 'CORES')
            and (UpperCase(trim(vtipoVar2)) = 'CORES') then
          begin
            QrAux.Close;
            QrAux.SQL.Text := ' select cod_grade, cod_empresa from grade ' +
              ' where upper(trim(tipo_ec)) = :tipo_ec ' +
              ' and trim(descricao_ec) = :descricao_ec ';

            if trim(vtipoVar2) = '' then
              QrAux.SQL.Text := QrAux.SQL.Text +
                ' and trim(coalesce(tipo_ec1, '''')) = '''' ' +
                ' and trim(coalesce(descricao_ec1, '''')) = '''' '
            else
              QrAux.SQL.Text := QrAux.SQL.Text +
                ' and upper(trim(tipo_ec1)) = :tipo_ec1 ' +
                ' and trim(descricao_ec1) = :descricao_ec1 ';

            QrAux.SQL.Text := QrAux.SQL.Text +
              ' and cod_empresa = :cod_empresa ';
            QrAux.ParamByName('tipo_ec').AsString := 'COR';
            QrAux.ParamByName('descricao_ec').AsString := trim(vdescricaoVar1);
            QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
            if trim(vtipoVar2) <> '' then
            begin
              QrAux.ParamByName('tipo_ec1').AsString := 'COR';
              QrAux.ParamByName('descricao_ec1').AsString := trim(vdescricaoVar2);
            end;
            QrAux.Open;
          end;

          if (QrAux.IsEmpty)
            and (UpperCase(trim(vtipoVar1)) = 'COR')
            and (UpperCase(trim(vtipoVar2)) = 'COR') then
          begin
            QrAux.Close;
            QrAux.SQL.Text := ' select cod_grade, cod_empresa from grade ' +
              ' where upper(trim(tipo_ec)) = :tipo_ec ' +
              ' and trim(descricao_ec) = :descricao_ec ';

            if trim(vtipoVar2) = '' then
              QrAux.SQL.Text := QrAux.SQL.Text +
                ' and trim(coalesce(tipo_ec1, '''')) = '''' ' +
                ' and trim(coalesce(descricao_ec1, '''')) = '''' '
            else
              QrAux.SQL.Text := QrAux.SQL.Text +
                ' and upper(trim(tipo_ec1)) = :tipo_ec1 ' +
                ' and trim(descricao_ec1) = :descricao_ec1 ';

            QrAux.SQL.Text := QrAux.SQL.Text +
              ' and cod_empresa = :cod_empresa ';
            QrAux.ParamByName('tipo_ec').AsString := 'CORES';
            QrAux.ParamByName('descricao_ec').AsString := trim(vdescricaoVar1);
            QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
            if trim(vtipoVar2) <> '' then
            begin
              QrAux.ParamByName('tipo_ec1').AsString := 'CORES';
              QrAux.ParamByName('descricao_ec1').AsString := trim(vdescricaoVar2);
            end;
            QrAux.Open;
          end;

          vGradeEncontrada := false;
          if not QrAux.IsEmpty then
          begin
            QrAux.First;
            while not QrAux.Eof do
            begin
              vcodgrade := QrAux.FieldByName('cod_grade').AsInteger;

              if vcodgrade > 0 then
              begin
                QrAux2.Close;
                QrAux2.SQL.Text := ' select grupo_prod, cod_prod, cod_grade, cod_empresa from cod_grade_prod ' +
                  ' where grupo_prod = :grupo_prod ' +
                  ' and cod_prod = :cod_prod ' +
                  ' and cod_grade = :cod_grade ' +
                  ' and cod_empresa = :cod_empresa ';
                QrAux2.ParamByName('grupo_prod').AsInteger := hwGrupoProd;
                QrAux2.ParamByName('cod_prod').AsString := hwCodProd;
                QrAux2.ParamByName('cod_grade').AsInteger := vcodgrade;
                QrAux2.ParamByName('cod_empresa').AsInteger := CodEmpresa;
                QrAux2.Open;

                if not QrAux2.IsEmpty then
                begin
                  variacoes[I].cod_grade_temp := vcodgrade;
                  vGradeEncontrada            := true;
                  break;
                end;
              end;

              QrAux.Next;
            end;

            if not vGradeEncontrada then
            begin
              if trim(vtipoVar2) <> '' then
                ShowAtencao('Produto Grupo ' + IntToStr(hwGrupoProd) + ' Codigo ' + trim(hwCodProd) + ' não vinculado a variação dupla: ' + #13 +
                  'Tipo 1: ' + trim(vtipoVar1) + #13 +
                  'Descrição 1: ' + trim(vdescricaoVar1) + #13 +
                  'Tipo 2: ' + trim(vtipoVar2) + #13 +
                  'Descrição 2: ' + trim(vdescricaoVar2) + #13 + #13 +
                  'Favor cadastrar/vincular a grade/variação antes de vincular o produto!')
              else
                ShowAtencao('Produto Grupo ' + IntToStr(hwGrupoProd) + ' Codigo ' + trim(hwCodProd) + ' não vinculado a variação simples: ' + #13 +
                  'Tipo: ' + trim(vtipoVar1) + #13 +
                  'Descrição: ' + trim(vdescricaoVar1) + #13 + #13 +
                  'Favor cadastrar/vincular a grade/variação antes de vincular o produto!');
              exit;
            end
          end
          else
          begin
            if trim(vtipoVar2) <> '' then
              ShowAtencao('Variação dupla não cadastrada no ERP: ' + #13 +
                'Tipo 1: ' + trim(vtipoVar1) + #13 +
                'Descrição 1: ' + trim(vdescricaoVar1) + #13 +
                'Tipo 2: ' + trim(vtipoVar2) + #13 +
                'Descrição 2: ' + trim(vdescricaoVar2) + #13 + #13 +
                'Favor cadastrar/vincular a grade/variação antes de vincular o produto!')
            else
              ShowAtencao('Variação simples não cadastrada no ERP: ' + #13 +
                'Tipo: ' + trim(vtipoVar1) + #13 +
                'Descrição: ' + trim(vdescricaoVar1) + #13 + #13 +
                'Favor cadastrar/vincular a grade/variação antes de vincular o produto!');
            exit;
          end;
        end;
      end;

      if (vimagens = 'S') and (vimagensProd = 'S') then
      begin
        if not abreFormImagem(
          hwGrupoProd,
          hwCodProd,
          0,
          trayProd,
          variacoes) then
        begin
          Result := False;
          exit;
        end;

        if not testarImagem then
        begin
          Result := False;
          exit;
        end;
      end
      else if (vimagens = 'S') then
      begin
        if not adicionarImagemEC(
          hwGrupoProd,
          hwCodProd,
          0,
          trayProd,
          variacoes) then
        begin
          Result := False;
          exit;
        end;

        if not testarImagem then
        begin
          Result := False;
          exit;
        end;
      end
      else if (vimagensProd = 'S') then
      begin
        if not utilizaImagemERP(
          hwGrupoProd,
          hwCodProd,
          0) then
        begin
          Result := False;
          exit;
        end;
      end;

      if (hwPeso_brut_prod <= 0) and ((vPesoBruto > 0) or (vPesoLiquido > 0) or (hwPeso_liq_prod > 0)) then
      begin
        QrAux.Close;
        QrAux.SQL.Text := ' update produtos set peso_brut_prod = :peso_brut_prod, rep_int_active = 1 ' +
          ' where grupo_prod = :grupo_prod ' +
          ' and cod_prod = :cod_prod ' +
          ' and cod_empresa = :cod_empresa ';
        QrAux.ParamByName('grupo_prod').AsInteger := hwGrupoProd;
        QrAux.ParamByName('cod_prod').AsString := hwCodProd;
        QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
        if vPesoBruto > 0 then
          QrAux.ParamByName('peso_brut_prod').AsFloat := vPesoBruto / 1000
        else if vPesoLiquido > 0 then
          QrAux.ParamByName('peso_brut_prod').AsFloat := vPesoLiquido / 1000
        else if hwPeso_liq_prod > 0 then
          QrAux.ParamByName('peso_brut_prod').AsFloat := hwPeso_liq_prod;
        QrAux.ExecSQL;
      end;

      if (hwPeso_liq_prod <= 0) and ((vPesoBruto > 0) or (vPesoLiquido > 0) or (hwPeso_brut_prod > 0)) then
      begin
        QrAux.Close;
        QrAux.SQL.Text := ' update produtos set peso_liq_prod = :peso_liq_prod, rep_int_active = 1 ' +
          ' where grupo_prod = :grupo_prod ' +
          ' and cod_prod = :cod_prod ' +
          ' and cod_empresa = :cod_empresa ';
        QrAux.ParamByName('grupo_prod').AsInteger := hwGrupoProd;
        QrAux.ParamByName('cod_prod').AsString := hwCodProd;
        QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
        if vPesoLiquido > 0 then
          QrAux.ParamByName('peso_liq_prod').AsFloat := vPesoLiquido / 1000
        else if vPesoBruto > 0 then
          QrAux.ParamByName('peso_liq_prod').AsFloat := vPesoBruto / 1000
        else if hwPeso_brut_prod > 0 then
          QrAux.ParamByName('peso_liq_prod').AsFloat := hwPeso_brut_prod;
        QrAux.ExecSQL;
      end;

      if (hwAltura_prod <= 0) and (vAltura > 0) then
      begin
        QrAux.Close;
        QrAux.SQL.Text := ' update produtos set altura_prod = :altura_prod, rep_int_active = 1 ' +
          ' where grupo_prod = :grupo_prod ' +
          ' and cod_prod = :cod_prod ' +
          ' and cod_empresa = :cod_empresa ';
        QrAux.ParamByName('grupo_prod').AsInteger := hwGrupoProd;
        QrAux.ParamByName('cod_prod').AsString := hwCodProd;
        QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
        QrAux.ParamByName('altura_prod').AsInteger := Trunc(vAltura);
        QrAux.ExecSQL;
      end;

      if (hwLargura_prod <= 0) and (vLargura > 0) then
      begin
        QrAux.Close;
        QrAux.SQL.Text := ' update produtos set largura_prod = :largura_prod, rep_int_active = 1 ' +
          ' where grupo_prod = :grupo_prod ' +
          ' and cod_prod = :cod_prod ' +
          ' and cod_empresa = :cod_empresa ';
        QrAux.ParamByName('grupo_prod').AsInteger := hwGrupoProd;
        QrAux.ParamByName('cod_prod').AsString := hwCodProd;
        QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
        QrAux.ParamByName('largura_prod').AsInteger := Trunc(vLargura);
        QrAux.ExecSQL;
      end;

      if (hwComprimento_prod <= 0) and (vComprimento > 0) then
      begin
        QrAux.Close;
        QrAux.SQL.Text := ' update produtos set comprimento_prod = :comprimento_prod, rep_int_active = 1 ' +
          ' where grupo_prod = :grupo_prod ' +
          ' and cod_prod = :cod_prod ' +
          ' and cod_empresa = :cod_empresa ';
        QrAux.ParamByName('grupo_prod').AsInteger := hwGrupoProd;
        QrAux.ParamByName('cod_prod').AsString := hwCodProd;
        QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
        QrAux.ParamByName('comprimento_prod').AsInteger := Trunc(vComprimento);
        QrAux.ExecSQL;
      end;

      QrAux.Close;
      QrAux.SQL.Text := ' update or insert into produtos_ec ' +
        ' (grupo_prod, cod_prod, cod_empresa, descr_prod_res, ' +
        ' sinc_ecommerce, disponivel, preco_a_combinar_ec, ' +
        ' promocional, frete_gratis, lancamento, destaque, variacao, ' +
        ' termos_aceite, comprejunto, virtual, ' +
        ' descr_prod_compl, cod_categoria, id_commerce) ' +
        ' values ' +
        ' (:grupo_prod, :cod_prod, :cod_empresa, :descr_prod_res, ' +
        ' :sinc_ecommerce, :disponivel, :preco_a_combinar_ec, ' +
        ':promocional, :frete_gratis, :lancamento, :destaque, :variacao, ' +
        ' :termos_aceite, :comprejunto, :virtual, ' +
        ' :descr_prod_compl, :cod_categoria, :id_commerce) ' +
        ' matching (grupo_prod, cod_prod, cod_empresa); ';
      QrAux.ParamByName('grupo_prod').AsInteger := hwGrupoProd;
      QrAux.ParamByName('cod_prod').AsString := hwCodProd;
      QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
      QrAux.ParamByName('descr_prod_res').AsString := trim(vdescrprod);
      QrAux.ParamByName('sinc_ecommerce').AsString := 'S';
      QrAux.ParamByName('disponivel').AsString := vdisponivel;
      QrAux.ParamByName('preco_a_combinar_ec').AsString := vprecosobconsulta;
      QrAux.ParamByName('promocional').AsString := vpromocional;
      QrAux.ParamByName('frete_gratis').AsString := vfretegratis;
      QrAux.ParamByName('lancamento').AsString := vlancamento;
      QrAux.ParamByName('destaque').AsString := vdestaque;
      QrAux.ParamByName('variacao').AsString := vvariacao;
      QrAux.ParamByName('termos_aceite').AsString := 'N';
      QrAux.ParamByName('comprejunto').AsString := 'N';
      QrAux.ParamByName('virtual').AsString := vvirtual;
      QrAux.ParamByName('descr_prod_compl').AsString := vdescrprodcompl;
      QrAux.ParamByName('cod_categoria').AsInteger := vcodcategoria;
      QrAux.ParamByName('id_commerce').AsInteger := StrToInt(trayProduto.id);
      QrAux.ExecSQL;

      if Length(variacoes) > 0  then
      begin
        for I := 0 to Length(variacoes) - 1 do
        begin
          if (Length(variacoes[I].Sku) > 0) and (variacoes[I].cod_grade_temp > 0) then
          begin
            QrAux.Close;
            QrAux.SQL.Text := ' update or insert into produtos_ec_grade ' +
              ' (grupo_prod, cod_prod, cod_grade, cod_empresa, ' +
              ' id_commerce, sinc_ecommerce) ' +
              ' values (:grupo_prod, :cod_prod, :cod_grade, :cod_empresa, ' +
              ' :id_commerce, :sinc_ecommerce) ' +
              ' matching (grupo_prod, cod_prod, cod_grade, cod_empresa) ';
            QrAux.ParamByName('grupo_prod').AsInteger := hwGrupoProd;
            QrAux.ParamByName('cod_prod').AsString := hwCodProd;
            QrAux.ParamByName('cod_grade').AsInteger := variacoes[I].cod_grade_temp;
            QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
            QrAux.ParamByName('id_commerce').AsInteger := variacoes[I].Id.ToInteger;
            QrAux.ParamByName('sinc_ecommerce').AsString := 'S';
            QrAux.ExecSQL;
          end;
        end;
      end;

      if vStringListCategorias.Count > 0 then
      begin
        for I := 0 to vStringListCategorias.Count - 1 do
        begin
          QrAux.Close;
          QrAux.SQL.Text := ' update or insert into produtos_categoria ' +
            ' (grupo_prod, cod_prod, cod_empresa, cod_categoria) ' +
            ' values (:grupo_prod, :cod_prod, :cod_empresa, :cod_categoria) ' +
            ' matching (grupo_prod, cod_prod, cod_empresa, cod_categoria); ';
          QrAux.ParamByName('grupo_prod').AsInteger := hwGrupoProd;
          QrAux.ParamByName('cod_prod').AsString := hwCodProd;
          QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
          QrAux.ParamByName('cod_categoria').AsInteger := StrToInt(vStringListCategorias[I]);
          QrAux.ExecSQL;
        end;
      end;

      QrAux.Close;
      QrAux.SQL.Text := ' update produtos set id_commerce = :id_commerce ' +
        ' where grupo_prod = :grupo_prod ' +
        ' and cod_prod = :cod_prod ' +
        ' and cod_empresa = :cod_empresa ';
      QrAux.ParamByName('grupo_prod').AsInteger := hwGrupoProd;
      QrAux.ParamByName('cod_prod').AsString := hwCodProd;
      QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
      QrAux.ParamByName('id_commerce').AsInteger := StrToInt(trayProduto.id);
      QrAux.ExecSQL;

      if QrAux.Transaction.InTransaction then
        QrAux.Transaction.Commit;

      QrAux.Close;
      QrAux.SQL.Text := ' update produtos set rep_int_active = 1 ' +
        ' where grupo_prod = :grupo_prod ' +
        ' and cod_prod = :cod_prod ' +
        ' and cod_empresa = :cod_empresa ';
      QrAux.ParamByName('grupo_prod').AsInteger := hwGrupoProd;
      QrAux.ParamByName('cod_prod').AsString := hwCodProd;
      QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
      QrAux.ExecSQL;

      if QrAux.Transaction.InTransaction then
        QrAux.Transaction.Commit;

      Result := True;

      Auditor.Sucesso.GravarMensagem('E-commerce %s %s', [trayProduto.id, trayProduto.name]);

    except on E: Exception do
      begin
        Result := False;
        LogError('THwTrayServicos.VincularProduto. tray %s GrupoProd %d Cod Prod %s. Erro: %s', [trayProduto.id, hwGrupoProd, hwCodProd, e.Message]);
        if not SilentMod then
          ShowErro('Erro ao vincular Produtos. %s',  [e.Message]);
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwTrayServicos.VincularProdutoKit(trayProdutoKit: TProductKit;
  hwCodigoKit: Integer; hwGrupoProd: Integer; hwCodProd: string): Boolean;
begin
  try
    if not Auditor.Alterar.Table(tbProdutoKit).Processo('PRO421')
           .Key('%d-%d-%s', [hwCodigoKit, hwGrupoProd, hwCodProd])
           .Msg('Kit Prod Sistema Kit %d, Grupo %d, CodProd %s, E-commerce %s', [hwCodigoKit, hwGrupoProd, hwCodProd, trayProdutoKit.id])
           .Permitido then
      Exit;

    if not conectar(DataBasePath, True)  then
      Exit;

    QrAux.Close;
    QrAux.SQL.Text := 'update kits_prod_kits set ' +
      ' sinc_ecommerce = ''S'', id_commerce = :id_commerce ' +
      ' where codigo_kit = :codigo_kit ' +
      ' and grupo_prod = :grupo_prod ' +
      ' and cod_prod = :cod_prod ' +
      ' and cod_empresa = :cod_empresa ';

    QrAux.ParamByName('codigo_kit').AsInteger := hwCodigoKit;
    QrAux.ParamByName('grupo_prod').AsInteger := hwGrupoProd;
    QrAux.ParamByName('cod_prod').AsString := hwCodProd;
    QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
    QrAux.ParamByName('id_commerce').AsInteger := StrToInt(trayProdutoKit.id);
    QrAux.ExecSQL;

    if QrAux.Transaction.InTransaction then
      QrAux.Transaction.Commit;

    Result := True;

    Auditor.Sucesso.GravarMensagem('E-commerce %s', [trayProdutoKit.id]);

  except on E: Exception do
    begin
      Result := False;
      LogError('THwTrayServicos.VincularProdutoKit. tray %s Codigo_kit %d. Grupo %d CodProd %s Erro: %s',
        [trayProdutoKit.id, hwCodigoKit, hwGrupoProd, hwCodProd, e.Message]);
      if not SilentMod then
        ShowErro('Erro ao vincular Produtos do Kit. %s',  [e.Message]);
    end;
  end;
end;

procedure THwTrayServicos._GravaConfiguracoesInteger(NomeVariavel: string;
  Valor: Integer);
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
begin
  try
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      // Grava as informações do form
      Registro.WriteInteger(NomeVariavel, Valor);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

function THwTrayServicos._LerConfiguracoesRegistroInteger(NomeVariavel: string;
  Adefault: Integer): Integer;
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
  vTemp: Integer;
begin
  try
    vTemp := Adefault;
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      // L~e a informação da variavel
      vTemp := Registro.ReadInteger(NomeVariavel);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Result := vTemp;
      Registro.Free;
    end;
  except
  end;
end;

//function THwTrayServicos.GetCategories(params: TArray<string>): TArray<TCategory>;
//begin
//  Result := Get<TCategory>('categories', 'Categories', ['sort=id_desc'] + params);
//end;

function THwTrayServicos.GetCategorias(categoriaOOP: TConexao_OOP;
  pIds: string): TConexao_OOP;
var
  sql: string;
begin
  Result := categoriaOOP;

  if not conectar(DataBasePath, True)  then
    Exit;

  try

    try

      //??? tem de olhar o ativo = 1
      sql := Format(' select categoria.cod_categoria, categoria.cod_empresa, categoria.descricao, categoria.cod_categoria_pai, categoria.id_commerce from categoria ' +
                    ' where categoria.cod_empresa = %d ' +
                    ' and categoria.ativo = 1' +
                    ' order by categoria.descricao ', [CodEmpresa]);

      if Result = nil then
        Result := NewClientOOP(sql)
      else
        Result.ClientOpen(sql);

    except on E: Exception do
      begin
        LogError('THwTrayServicos.GetCategorias. %s', [e.Message]);
        if not SilentMod then
          ShowErro('Erro ao obter Categorias do banco. %s',  [e.Message]);
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwTrayServicos.GetCategorias(categoriaOOP: TConexao_OOP;
  onlySinc: Boolean): TConexao_OOP;
var
  sql: string;
  vcondicao: string;
  vtexto: string;
begin
  Result := categoriaOOP;

  if not conectar(DataBasePath, True)  then
    Exit;

  try
    try

      //??? tem de olhar o ativo = 1
      sql := Format(' select categoria.cod_categoria, categoria.cod_empresa, categoria.descricao, categoria.cod_categoria_pai, categoria.id_commerce from categoria ' +
                    ' where categoria.cod_empresa = %d '   +
                    ' and categoria.ativo = 1' +
                    ' order by categoria.descricao', [CodEmpresa]);

      if Result = nil then
        Result := NewClientOOP(sql)
      else
        Result.ClientOpen(sql);

    except on E: Exception do
      begin
        LogError('THwTrayServicos.GetCategorias. %s', [e.Message]);
        if not SilentMod then
          ShowErro('Erro ao obter Categorias do banco. %s',  [e.Message]);
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwTrayServicos.GenCodigo(Tabela: string; buscas: TIBQuery;
  codemp: string): Integer;
begin
  while True do
  begin
    try
      buscas.Close;
      buscas.SQL.Text := 'SELECT COD FROM INCREMENTA_CODIGO (:VCOD_EMPRESA, :VTABELA)';
      buscas.ParamByName('VCOD_EMPRESA').Text := codemp;
      buscas.ParamByName('VTABELA').Text := UpperCase(Tabela);
      buscas.Open;
      Result := buscas.FieldByName('COD').Value;
      buscas.Close;
      exit;
    except
      on E: Exception do
      begin
        MessageDlg('E005 ' + 'Erro ao obter código para: "' + Tabela + '"' + #13 +
          'Não desligue o computador durante este processamento' + #13 +
          'Operação será repetida' +#13 +
          'Se o processo ficar repetitivo procure o Suporte' + #13 +
          E.Message, mtInformation, [mbOK], 0);
      end;
    end;
  end;
end;

function THwTrayServicos.GetCategorias(categoriaOOP: TConexao_OOP; campo,
  condicao, texto: string): TConexao_OOP;
var
  sql, aliasEmp: string;
  I: Integer;
begin
  Result := categoriaOOP;

  if texto.Trim.IsEmpty then
  begin
    ShowErro('Conteúdo da consulta não informado.');
    Exit;
  end;


  if not MatchText(condicao, ['Começa', 'Igual', 'Esta contido']) then
  begin
    ShowErro('Campo de condição inválido.' + chr(13) + 'Valores válidos: "Começa", "Igual", "Esta contido"');
    Exit;
  end;

  if not MatchText(campo, ['Cod Categoria', 'Id Ecommerce']) then
  begin
    if condicao = 'Começa' then
      texto := texto + '%'
    else if condicao = 'Igual' then
      texto := texto
    else if condicao = 'Esta contido' then
      texto := '%' + texto + '%';

    texto := texto.QuotedString;

    condicao := IfThen(condicao = 'Igual', '=', 'like');

  end
  else if not TryStrToInt(texto.Trim, I) then
  begin
    ShowErro('Conteúdo da consulta inválido.' + chr(13) + 'Verifique os dados de sua pesquisa e tente novamente.');
    Exit;
  end
  else
    condicao := '=';

  aliasEmp := 'categoria';
  if campo = 'Cod Categoria' then
    campo := 'categoria.cod_categoria'
  else if campo = 'Descrição da Categoria' then
    campo := 'categoria.descricao'
  else if campo = 'Id Ecommerce' then
    campo := 'categoria.id_commerce'
  else
  begin
    ShowErro('Campo da consulta inválido.' + chr(13) + 'Verifique os dados de sua pesquisa e tente novamente.');
    Exit;
  end;

  if not conectar(DataBasePath, True)  then
    Exit;

  try
    try

      //??? tem de olhar o ativo = 1
      sql := Format('select categoria.cod_categoria, categoria.cod_empresa, categoria.descricao, categoria.cod_categoria_pai, categoria.id_commerce' +
                    ' from categoria ' +
                    ' where %s %s %s and %s.cod_empresa = %d and categoria.ativo = 1' +
                    ' order by categoria.descricao',
                    [campo, condicao, texto, aliasEmp, CodEmpresa]);

      if Result = nil then
        Result := NewClientOOP(sql)
      else
        Result.ClientOpen(sql);

    except on E: Exception do
      begin
        LogError('THwTrayServicos.GetCategorias. %s', [e.Message]);
        if not SilentMod then
          ShowErro('Erro ao obter Categorias do banco. %s',  [e.Message]);
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwTrayServicos.GetConsulta(controller, name: string;
  params: TArray<string>): TTrayConsulta;
begin
  if not conectar(DataBasePath, True)  then
    Exit;

  try

    try
      if (not GetDadosApi) then
        Exit;

      Result := trayConsumeApi.GetConsulta(controller, name, params);

    except on E: Exception do
      begin
        LogError('THwTrayServicos.GetConsulta %s %s', [controller, e.Message]);
        if not SilentMod then
          ShowErro('Erro ao obter consulta %s' + sLineBreak + e.Message, [controller]);
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwTrayServicos.GetDadosApi: Boolean;
begin
  Result := False;

  try
    with SqlOpen('select url_api, consumer_key, consumer_secret, code_autorization' +
                 ' from config_api where cod_empresa = %d and api = ''TRAYCOMMERCE''', [CodEmpresa]) do
    begin
      URLApi := FieldByName('url_api').AsString.Trim;
      trayConsumeApi.URLApi := FieldByName('url_api').AsString.Trim;
      trayConsumeApi.ConsumerKey := FieldByName('consumer_key').AsString.Trim;
      trayConsumeApi.ConsumerSecret := FieldByName('consumer_secret').AsString.Trim;
      trayConsumeApi.Code := FieldByName('code_autorization').AsString.Trim;
    end;

    Result := not trayConsumeApi.URLApi.Trim.IsEmpty;

    if Result then
      trayConsumeApi.Token := TJsonHw.ToObject<TTrayTokenApi>(GetJson(TRAY_SERV_TOKEN_API))
    else if not Result then
      if not SilentMod then
        ShowErro('Não foi possivel obter dados da API TRAY no banco de dados')
      else
        LogError('Não foi possivel obter dados da API TRAY no banco de dados. Empresa %d', [CodEmpresa]);

  except on E: Exception do
    begin
      LogError('THwTrayServicos.GetDadosApi ', [e.Message]);
    end;
  end;
end;

function THwTrayServicos.GetGrades: TConexao_OOP;
var
  sql: string;
begin
  Result := AllGrades;

  if not conectar(DataBasePath, True)  then
    Exit;

  try

    try
      //??? tem de olhar o ativo = 1
      sql := Format('select cod_grade, descricao, descricao1, ativo, tipo_ec, descricao_ec, tipo_ec1, descricao_ec1' +
                    ' from grade where cod_empresa = %d and ativo = 1' +
                    ' order by descricao', [CodEmpresa]);

      if AllGrades = nil then
        AllGrades := NewClientOOP(sql)
      else
        AllGrades.ClientOpen(sql);

    except on E: Exception do
      begin
        LogError('THwTrayServicos.GetGrades. %s', [e.Message]);
        if not SilentMod then
          ShowErro('Erro ao obter Grades do banco. %s',  [e.Message]);
      end;
    end;

  finally
    Result := AllGrades;

    desconectar;
  end;
end;

function THwTrayServicos.GetKitProdutos(kitprodOOP: TConexao_OOP; campo,
  condicao, texto: string): TConexao_OOP;
var
  sql, aliasEmp: string;
  I: Integer;
begin
  Result := kitprodOOP;

  if texto.Trim.IsEmpty then
  begin
    ShowErro('Conteúdo da consulta não informado.');
    Exit;
  end;


  if not MatchText(condicao, ['Começa', 'Igual', 'Esta contido']) then
  begin
    ShowErro('Campo de condição inválido.' + chr(13) + 'Valores válidos: "Começa", "Igual", "Esta contido"');
    Exit;
  end;

  if not MatchText(campo, ['Cod Kit', 'Id Ecommerce']) then
  begin
    if condicao = 'Começa' then
      texto := texto + '%'
    else if condicao = 'Igual' then
      texto := texto
    else if condicao = 'Esta contido' then
      texto := '%' + texto + '%';

    texto := texto.QuotedString;

    condicao := IfThen(condicao = 'Igual', '=', 'like');

  end
  else if not TryStrToInt(texto.Trim, I) then
  begin
    ShowErro('Conteúdo da consulta inválido.' + chr(13) + 'Verifique os dados de sua pesquisa e tente novamente.');
    Exit;
  end
  else
    condicao := '=';

  aliasEmp := 'kit';
  if campo = 'Cod Kit' then
    campo := 'kit.codigo_kit'
  else if campo = 'Descrição do Kit' then
    campo := 'kit.descricao_kit'
  else if campo = 'Id Ecommerce' then
  begin
    campo := 'ke.id_commerce';
    aliasEmp := 'ke';
  end
  else
  begin
    ShowErro('Campo da consulta inválido.' + chr(13) + 'Verifique os dados de sua pesquisa e tente novamente.');
    Exit;
  end;

  if not conectar(DataBasePath, True)  then
    Exit;

  try
    try
      sql := Format('select 0 grupo_prod, '''' cod_prod, kit.cod_empresa, '''' num_fab_prod, '''' descr_prod,  kit.codigo_kit, kit.descricao_kit, kit.ativo,' +
                    ' ke.cod_categoria, ke.id_commerce from kits_prod kit' +
                    ' left join kits_prod_ec ke on ke.codigo_kit = kit.codigo_kit and ke.cod_empresa = kit.cod_empresa ' +
                    ' where %s %s %s and %s.cod_empresa = %d' +
                    ' order by kit.descricao_kit',
                    [campo, condicao, texto, aliasEmp, CodEmpresa]);

      if Result = nil then
        Result := NewClientOOP(sql)
      else
        Result.ClientOpen(sql);

      sql := Format('select 0 grupo_prod, '''' cod_prod, 0 cod_grade, kit.codigo_kit, kit.lista_imagens, kit.url_imagens' +
             ' from kits_prod kit ' +
             ' where %s %s %s and %s.cod_empresa = %d ' +
             ' order by kit.descricao_kit',
             [campo, condicao, texto, aliasEmp, CodEmpresa]);

      if AllImages = nil then
        AllImages := NewClientOOP(sql)
      else
        AllImages.ClientOpen(sql);

    except on E: Exception do
      begin
        LogError('THwTrayServicos.GetKitProdutos. %s', [e.Message]);
        if not SilentMod then
          ShowErro('Erro ao obter Kits de Produto do banco. %s',  [e.Message]);
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwTrayServicos.GetKitProdutos(kitprodOOP: TConexao_OOP; onlySinc,
  withImages: Boolean): TConexao_OOP;
var
  sql: string;
  vcondicao: string;
  vtexto: string;
begin
  Result := kitprodOOP;

  if not conectar(DataBasePath, True)  then
    Exit;

  try
    try

      //??? tem de olhar o ativo = 1
      sql := Format(' select 0 grupo_prod, '''' cod_prod,  ke.cod_empresa, '''' num_fab_prod, '''' descr_prod, kit.codigo_kit, kit.descricao_kit, kit.ativo,' +
                    ' ke.cod_categoria, ke.id_commerce from kits_prod_ec ke ' +
                    ' inner join kits_prod kit on ke.codigo_kit = kit.codigo_kit and ke.cod_empresa = kit.cod_empresa ' +
                    ' where ke.cod_empresa = %d ' +
                    ' and coalesce(ke.sinc_ecommerce, '''') in ('''',%s)' +
                    ' order by kit.descricao_kit',
                    [CodEmpresa, string('S').QuotedString + IfThen(not onlySinc, ',' + string('N').QuotedString)]);

//                     descr_prod_res, ' +
//        ' sinc_ecommerce, disponivel, promocional, frete_gratis, ' +
//        ' lancamento, destaque, variacao, ' +
//        ' termos_aceite, comprejunto, virtual, ' +
//        ' cod_categoria, id_commerce

      if Result = nil then
        Result := NewClientOOP(sql)
      else
        Result.ClientOpen(sql);

      if withImages then
      begin
        sql := 'select 0 grupo_prod, '''' cod_prod, 0 cod_grade, ke.codigo_kit, ke.cod_empresa, kit.lista_imagens, kit.url_imagens' +
               ' from kits_prod_ec ke ' +
               sql.Substring(sql.IndexOf('inner join kits_prod')).Replace('order by kit.descricao_kit', '');

        if AllImages = nil then
          AllImages := NewClientOOP(sql)
        else
          AllImages.ClientOpen(sql);
      end;

    except on E: Exception do
      begin
        LogError('THwTrayServicos.GetKitProdutos. %s', [e.Message]);
        if not SilentMod then
          ShowErro('Erro ao obter KitsProdutos do banco. %s',  [e.Message]);
      end;
    end;

  finally
    desconectar;
  end;
end;

//function THwTrayServicos.GetVariacoes(params: TArray<string>): TArray<TVariant>;
//begin
//  Result := Get<TVariant>('products/variants', 'Variants', ['limit=0'] + params);
//end;

end.
