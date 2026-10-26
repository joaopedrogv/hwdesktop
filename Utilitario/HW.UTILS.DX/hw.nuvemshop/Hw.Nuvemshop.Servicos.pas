unit Hw.Nuvemshop.Servicos;

interface

uses
  System.Classes,
  System.DateUtils,
  uClasseConexao,
  Winapi.Windows,
  HW.Servicos,
  HW.Nuvemshop.Api.Consumo,
  HW.Nuvemshop.Api.Category,
  HW.Nuvemshop.Api.Variant,
  HW.Nuvemshop.Api.Product,
  HW.Nuvemshop.Api.Image,
  HW.Nuvemshop.Api.Rest, IBX.IBQuery;

const
  NUVEMSHOP_SERV_TOKEN_API       = 'nuvemshop_api_access_token';

  tbCategoria = 'CATEGORIA';
  tbMarca     = 'MARCA_PROD';
  tbGrade     = 'GRADE';
  tbProduto   = 'PRODUTOS';

type

  THwNuvemshopServicos = class(THwServicos)
  private
    nuvemshopConsumeApi: TNuvemshopConsumeApi;
    AllProdutos     : TConexao_OOP;
    AllVariacoes    : TConexao_OOP;
    AllCategs       : TConexao_OOP;
    AllGrades       : TConexao_OOP;
    AllSincProd     : TConexao_OOP;
    AllSincCategoria: TConexao_OOP;
    AllImages       : TConexao_OOP;
    FRegistros      : Integer;
    FPag            : Integer;
    FTotalPag       : Integer;
    FLimit          : Integer;
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
    function GetCount<T: class, constructor>(controller, name: string; params: TArray<string>): Integer;
    function GetConsulta(controller, name: string; params: TArray<string>): TNuvemshopConsulta;
    function Delete(controller: string): boolean;

    //Do Banco de dados
    function ConcederPermissoesTabelasViews: boolean;
    // categorias
    function GetCategorias(): TConexao_OOP; overload;
    function GetCategorias(categoriaOOP: TConexao_OOP; pIds: string): TConexao_OOP; overload;
    function GetCategorias(categoriaOOP: TConexao_OOP; onlySinc: Boolean): TConexao_OOP; overload;
    function GetCategorias(categoriaOOP: TConexao_OOP; campo, condicao, texto: string): TConexao_OOP; overload;
    function ResolverCategorias(nuvemshopCategorias: TArray<TCategory>; parentId: string; Level: SmallInt; current: TArray<TCategoryMescladaHw>): TArray<TCategoryMescladaHw>;
    function ResolverCategoriasHw(categoriaOOP: TConexao_OOP; nuvemshopCategorias: TArray<TCategory>; parentId: Integer; Level: SmallInt; current: TArray<TCategoriaHw>): TArray<TCategoriaHw>;
    function VincularCategoria(nuvemshopCategoria: TCategory; hwId: Integer): Boolean;
    function DesvincularCategoria(hwId: Integer): Boolean;
    function CadastrarCategoria(nuvemshopCategorias: TArray<TCategory>): Boolean;

    // produtos
    function GetProdutos(): TConexao_OOP; overload;
    function GetProdutos(prodOOP: TConexao_OOP; pIds: string): TConexao_OOP; overload;
    function GetProdutos(prodOOP: TConexao_OOP; onlySinc: Boolean; withImages: Boolean = True): TConexao_OOP; overload;
    function GetProdutos(prodOOP: TConexao_OOP; campo, condicao, texto: string): TConexao_OOP; overload;
    function ResolverProdutos(nuvemshopProdutos: TArray<TProduct>; trayCategorias: TArray<TCategory>): TArray<TProductHw>;
    function ResolverProdutosHw(prodOOP: TConexao_OOP; nuvemshopProdutos: TArray<TProduct>): TArray<TProductHw>;
    function ResolverProduto(nuvemshopProduto: TProduct): TProductHw;
    function ResolverProdutoHw(prodOOP: TConexao_OOP; trayProdutos: TArray<TProduct>): TProductHw;
    function VincularProduto(nuvemshopProduto: TProduct; hwGrupoProd: Integer; hwCodProd: string;
      hwAltura_prod: Double; hwComprimento_prod: Double;
      hwLargura_prod: Double; hwPeso_brut_prod: Double;
      hwPeso_liq_prod: Double): Boolean;
    function DesvincularProduto(hwGrupoProd: Integer; hwCodProd: string): Boolean;
    function ReenviarImagensProduto(pId: Integer; pGerarUrl: boolean): boolean;

    // variação
    function GetGrades(): TConexao_OOP;
    function GetVariacoes(nuvemshopVariacoes: TArray<TVariant>;
      pGrupoProd: Integer; pCodProd: string;
      pTipoEc: string; pTipoEc1: string; pId: Integer): TConexao_OOP; overload;
    function ResolverVariacoes(nuvemshopVariacoes: TArray<TVariant>; tipoec: string; tipoec1: string): TArray<TVariantHw2>;
    function ResolverVariacoesHw(nuvemshopVariacoes: TArray<TVariant>; tipoec: string; tipoec1: string): TArray<TVariantHw2>;
    function CadastrarGrade(pDataset: TConexao_OOP): Boolean; overload;
    function AdicionarGrade(pDataset: TConexao_OOP; pGrupoProd: Integer; pCodProd: string): Boolean; overload;
    function VincularVariacoes(nuvemshopVariacoes: TVariant; hwGrupo: Integer; hwCodProd: string; hwCodGrade: Integer): Boolean;
    function DesvincularVariacoes(hwGrupo: Integer; hwCodProd: string; hwCodGrade: Integer): Boolean;

    function _LerConfiguracoesRegistroInteger(NomeVariavel : string; Adefault: Integer = 0) : Integer;
    procedure _GravaConfiguracoesInteger(NomeVariavel : string; Valor : Integer);

    property Registros: Integer read FRegistros write FRegistros;
    property Pag: Integer read FPag write FPag;
    property TotalPag: Integer read FTotalPag write FTotalPag;
    property Limit: Integer read FLimit write FLimit;
    property Usuario: string read FUsuario write FUsuario;
  var
    testarImagem: boolean;
  end;

implementation

uses
  hw_progress_utils,
  System.SysUtils,
  System.StrUtils,
  Hw.Nuvemshop.Api.Url,
  hw_utils,
  hw_audit_utils,
  marca_prod_class,
  categoria_class,
  grade_class,
  tipo_grade_ec_class,
  cod_grade_prod_class,
  config_sistema_class,
  HW.Utils.Classes.Rtti,
  HW.Utils.Classes.Registros_DX,
  HW.Json, Vcl.Forms, Hw.Tray.Api.Form.Cadastros, produtos_ec_grade_class,
  produtos_ec_class, Hw.Nuvemshop.Api.Form.Cadastros,
  System.Generics.Collections, Hw.Nuvemshop.Api.Form.Padrao, System.Variants,
  System.Win.Registry, Vcl.Dialogs;

function _getMd5File(FileName: WideString): WideString; stdcall; external 'MD5XE3.dll';

{ THwNuvemshopServicos }

function THwNuvemshopServicos.AdicionarGrade(pDataset: TConexao_OOP; pGrupoProd: Integer; pCodProd: string): Boolean;
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
          LogError('THwNuvemshopServicos.AdicionarGrade. Erro: %s', [e.Message]);
          if not SilentMod then
            ShowErro('Erro ao adicionar grade. %s',  [e.Message]);
        end;
    end;
  finally
    desconectar;
  end;
end;

procedure THwNuvemshopServicos.AfterLogin(Sender: TObject);
begin
  if Sender <> nil then
    SaveJSON(NUVEMSHOP_SERV_TOKEN_API, TJsonHw.ToJsonString(TNuvemshopTokenApi(Sender)));
end;

function THwNuvemshopServicos.CadastrarCategoria(
  nuvemshopCategorias: TArray<TCategory>): Boolean;
var
  newCategs: TArray<TCategoryMescladaHw>;
  newCateg: TCategoryMescladaHw;
  hwCateg, hwCategPai, hwCategSub: TCategoria_class;
  nuvemshopCateg: TCategory;
  nuvemshopCat: TCategory;
  inserir: Boolean;
  vCadastrar: boolean;
  str: string;
  vcod_categoria: Integer;
  vcod_categoria_pai: Integer;
  vcod_categoria_sub: Integer;
  I: Integer;
begin
  vCadastrar := false;
  if not conectar(DataBasePath, True)  then
    Exit;

  try

    try
      for nuvemshopCateg in nuvemshopCategorias do
        with ClientOOP(' select categoria.cod_categoria, categoria.descricao, categoria.ativo, coalesce(categoria.id_commerce, 0) id_commerce from categoria' +
                       ' where trim(categoria.descricao) = %s and categoria.cod_empresa = %d ' +
                       ' union ' +
                       ' select categoria.cod_categoria, categoria.descricao, categoria.ativo, coalesce(categoria.id_commerce, 0) id_commerce from categoria' +
                       ' where upper(trim(categoria.descricao)) = %s and categoria.cod_empresa = %d ',
                       [nuvemshopCateg.name_category.Substring(0, 50).Trim.QuotedString, CodEmpresa,
                       nuvemshopCateg.name_category.Substring(0, 50).ToUpper.Trim.QuotedString, CodEmpresa]) do
          if not IsEmpty then
          begin
            ShowAtencao('Já existe uma categoria cadastrada com a mesma descrição.' + #13 + #13 +
              IfThen(fint('id_commerce') > 0, 'Id E-Commerce: ' + IntToStr(fint('id_commerce')) + #13, '') +
              'Categoria: ' + IntToStr(fint('cod_categoria')) + ' - ' +  trim(fstr('descricao')) + #13 +
              'Lixeira: ' + IfThen(fequals('ativo', '1'), 'Não', 'Sim'));
            exit;
          end;

      for nuvemshopCateg in nuvemshopCategorias do
        with ClientOOP(' select categoria.cod_categoria, categoria.descricao, categoria.ativo, coalesce(categoria.id_commerce, 0) id_commerce from categoria' +
                       ' where categoria.id_commerce = %d and categoria.cod_empresa = %d',
                       [nuvemshopCateg.id, CodEmpresa]) do
          if not IsEmpty then
          begin
            ShowAtencao('Já existe uma categoria cadastrada com o mesmo id e-commerce.' + #13 + #13 +
              'Id E-Commerce: ' + nuvemshopCateg.id.ToString + #13 +
              'Categoria: ' + IntToStr(fint('cod_categoria')) + ' - ' +  trim(fstr('descricao')) + #13 +
              'Lixeira: ' + IfThen(fequals('ativo', '1'), 'Não', 'Sim'));
            exit;
          end;


      for nuvemshopCateg in nuvemshopCategorias do
        if SqlOpen(' select categoria.cod_categoria, categoria.descricao, categoria.ativo, coalesce(categoria.id_commerce, 0) id_commerce from categoria' +
                   ' where trim(categoria.descricao) = %s and categoria.cod_empresa = %d ' +
                   ' union ' +
                   ' select categoria.cod_categoria, categoria.descricao, categoria.ativo, coalesce(categoria.id_commerce, 0) id_commerce from categoria' +
                   ' where upper(trim(categoria.descricao)) = %s and categoria.cod_empresa = %d ',
                   [nuvemshopCateg.name_category.Substring(0, 50).Trim.QuotedString, CodEmpresa,
                    nuvemshopCateg.name_category.ToUpper.Substring(0, 50).Trim.QuotedString, CodEmpresa]).IsEmpty then
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
      for nuvemshopCateg in nuvemshopCategorias do
      begin
        try
          hwCateg := TCategoria_class.Create;
          hwCateg.descricao := nuvemshopCateg.name.Pt.Trim;
          hwCateg.cod_empresa := CodEmpresa;
          hwCateg.ativo := 1;
          hwCateg.id_commerce := nuvemshopCateg.id;

          with hwCateg.SQLMotor('cod_categoria') do
            hwCateg.cod_categoria := SqlInsertID(SQLInsertAutoInc, autoIncField);

          with ClientOOP('select id_commerce, cod_categoria, descricao, ativo from categoria' +
                         ' where id_commerce = %d and cod_empresa = %d and cod_categoria <> %d',
                         [nuvemshopCateg.id, CodEmpresa, hwCateg.cod_categoria]) do
            if not IsEmpty then
            begin
              ShowAtencao('Já existe uma categoria cadastrada com esse id e-commerce.' + #13 + #13 +
                'Id E-Commerce: ' + IntToStr(nuvemshopCateg.id) + #13 +
                'Categoria: ' + IntToStr(fint('cod_categoria')) + ' - ' + trim(fstr('descricao')) + #13 +
                'Lixeira: ' + IfThen(fequals('ativo', '1'), 'Não', 'Sim'));
              exit;
            end;
        except on E: Exception do
          begin
            if Transacao.InTransaction then
              Transacao.Rollback;
            Result := False;
            LogError('THwNuvemshopServicos.CadastrarCategoria. nuvemshop %d %s. Erro: %s', [nuvemshopCateg.id, nuvemshopCateg.name.Pt, e.Message]);
            if not SilentMod then
              ShowErro('Erro ao cadastrar Categoria(s). %s',  [e.Message]);
            exit;
          end;
        end;

        ArrayStr := ArrayStr + [nuvemshopCateg.id.ToString];// + '-' + trayCateg.Description.pt];
      end;

      if Transacao.InTransaction then
        Transacao.Commit;

      for nuvemshopCateg in nuvemshopCategorias do
      begin
        try
          inserir := nuvemshopCateg.Parent <= 0;
          if not inserir then
          begin
            ClientOOP(' select c.cod_categoria from categoria c' +
                      ' where c.id_commerce = %d and c.cod_empresa = %d',
                      [nuvemshopCateg.Id, CodEmpresa]);

            vcod_categoria     := Client.fint('cod_categoria');

            ClientOOP(' select c.cod_categoria from categoria c' +
                      ' where c.id_commerce = %d and c.cod_empresa = %d',
                      [nuvemshopCateg.Parent, CodEmpresa]);

            vcod_categoria_pai := Client.fint('cod_categoria');

            nuvemshopCat := nuvemshopConsumeApi.GetItem<TCategory>('categories/' + nuvemshopCateg.Parent.ToString, []);

            if (nuvemshopCat <> nil) then
            begin
              if SqlOpen(' select categoria.cod_categoria, categoria.descricao, categoria.ativo, coalesce(categoria.id_commerce, 0) id_commerce from categoria' +
                         ' where trim(categoria.descricao) = %s and categoria.cod_empresa = %d ' +
                         ' union ' +
                         ' select categoria.cod_categoria, categoria.descricao, categoria.ativo, coalesce(categoria.id_commerce, 0) id_commerce from categoria' +
                         ' where upper(trim(categoria.descricao)) = %s and categoria.cod_empresa = %d ',
                         [nuvemshopCat.name.Pt.Substring(0, 50).Trim.QuotedString, CodEmpresa,
                          nuvemshopCat.name.Pt.ToUpper.Substring(0, 50).Trim.QuotedString, CodEmpresa]).IsEmpty then
                            inserir := true;
            end;

            if (not inserir) and (nuvemshopCat <> nil) and (vcod_categoria_pai <= 0) and (inserir) then
            begin
              hwCategPai := TCategoria_class.Create;
              hwCategPai.descricao := nuvemshopCat.name.Pt.Trim;
              hwCategPai.cod_empresa := CodEmpresa;
              hwCategPai.ativo := 1;
              hwCategPai.id_commerce := nuvemshopCat.Id;

              with hwCategPai.SQLMotor('cod_categoria') do
                vcod_categoria_pai := SqlInsertID(SQLInsertAutoInc, autoIncField);

              if Transacao.InTransaction then
                Transacao.Commit;

              ArrayStr := ArrayStr + [nuvemshopCat.id.ToString];// + '-' + trayCateg.Description.pt];
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
          end;

          if Length(nuvemshopCateg.subcategories) > 0 then
          begin
            for I := 0 to Length(nuvemshopCateg.subcategories) - 1 do
            begin
              inserir := nuvemshopCateg.subcategories[I] <= 0;
              if not inserir then
              begin
                ClientOOP(' select c.cod_categoria from categoria c' +
                          ' where c.id_commerce = %d and c.cod_empresa = %d',
                          [nuvemshopCateg.subcategories[I], CodEmpresa]);

                vcod_categoria_sub := Client.fint('cod_categoria');

                nuvemshopCat := nuvemshopConsumeApi.GetItem<TCategory>('categories/' + nuvemshopCateg.subcategories[I].ToString, []);

                try
                  if (nuvemshopCat <> nil) then
                  begin
                    if SqlOpen(' select categoria.cod_categoria, categoria.descricao, categoria.ativo, coalesce(categoria.id_commerce, 0) id_commerce from categoria' +
                               ' where trim(categoria.descricao) = %s and categoria.cod_empresa = %d ' +
                               ' union ' +
                               ' select categoria.cod_categoria, categoria.descricao, categoria.ativo, coalesce(categoria.id_commerce, 0) id_commerce from categoria' +
                               ' where upper(trim(categoria.descricao)) = %s and categoria.cod_empresa = %d ',
                               [nuvemshopCat.name.Pt.Substring(0, 50).Trim.QuotedString, CodEmpresa,
                                nuvemshopCat.name.Pt.ToUpper.Substring(0, 50).Trim.QuotedString, CodEmpresa]).IsEmpty then
                                  inserir := true;
                  end;

                  if (not(inserir)) and (nuvemshopCat <> nil) and (vcod_categoria_sub <= 0) and (inserir) then
                  begin
                    hwCategSub := TCategoria_class.Create;
                    hwCategSub.descricao := nuvemshopCat.name.Pt.Trim;
                    hwCategSub.cod_empresa := CodEmpresa;
                    hwCategSub.ativo := 1;
                    hwCategSub.id_commerce := nuvemshopCat.id;

                    with hwCategSub.SQLMotor('cod_categoria') do
                      vcod_categoria := SqlInsertID(SQLInsertAutoInc, autoIncField);

                    ArrayStr := ArrayStr + [nuvemshopCat.id.ToString];// + '-' + trayCateg.Description.pt];

                    if Transacao.InTransaction then
                      Transacao.Commit;
                  end;
                except on E: Exception do
                  begin
                    if Transacao.InTransaction then
                      Transacao.Rollback;
                    Result := False;
                    LogError('THwNuvemshopServicos.CadastrarCategoria. nuvemshop %d %s. Erro: %s', [nuvemshopCat.id, nuvemshopCat.name.Pt, e.Message]);
                    if not SilentMod then
                      ShowErro('Erro ao cadastrar Categoria(s). %s',  [e.Message]);
                    exit;
                  end;
                end;
              end;
            end;
          end;
        except on E: Exception do
          begin
            if Transacao.InTransaction then
              Transacao.Rollback;
            Result := False;
            LogError('THwNuvemshopServicos.CadastrarCategoria. nuvemshop %d %s. Erro: %s', [nuvemshopCateg.id, nuvemshopCateg.name.Pt, e.Message]);
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
        LogError('THwNuvemshopServicos.CadastrarCategoria. Nuvemshop. Erro: %s', [e.Message]);
        if not SilentMod then
          ShowErro('Erro ao cadastrar Categoria(s). %s',  [e.Message]);
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwNuvemshopServicos.CadastrarGrade(pDataset: TConexao_OOP): Boolean;
var
 hwGrade: Tgrade_class;
 hwCodGradeProd: TCod_grade_prod_class2;
 hwGrades, hwGradesCad: TArray<Tgrade_class>;
 hwCodGradeProds, hwCodGradeProdCad: TArray<TCod_grade_prod_class2>;
 tipo_ec, descricao_ec, tipo_ec1, descricao_ec1: string;

 hwTipoGrade: TTipo_grade_ec_class;
 hwTipoGrades, hwTipoGradesCad: TArray<TTipo_grade_ec_class>;

 hwTipoGrade1: TTipo_grade_ec_class;
 hwTipoGrades1, hwTipoGradesCad1: TArray<TTipo_grade_ec_class>;

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
        if (UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec').AsString)) <> '') then
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

        if (UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec1').AsString)) <> '') then
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

        hwGrade              := TGrade_class.Create;
        if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec').AsString)) = 'CORES' then
          hwGrade.tipo_ec    := 'COR'
        else if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec').AsString)) = 'COR' then
          hwGrade.tipo_ec    := 'COR'
        else
          hwGrade.tipo_ec    := trim(pDataset.DataSet.FieldByName('tipo_ec').AsString).Substring(0, 100);
        hwGrade.descricao_ec := trim(pDataset.DataSet.FieldByName('descricao_ec').AsString).Substring(0, 100);

        if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec1').AsString)) = 'CORES' then
          hwGrade.tipo_ec1    := 'COR'
        else if UpperCase(trim(pDataset.DataSet.FieldByName('tipo_ec1').AsString)) = 'COR' then
          hwGrade.tipo_ec1    := 'COR'
        else
          hwGrade.tipo_ec1    := trim(pDataset.DataSet.FieldByName('tipo_ec1').AsString).Substring(0, 100);
        hwGrade.descricao_ec1 :=trim(pDataset.DataSet.FieldByName('descricao_ec1').AsString).Trim.Substring(0, 100);
        hwGrades := hwGrades + [hwGrade];

        pDataset.Next;
      end;

      for hwGrade in hwGrades do
        with ClientOOP(' select g.descricao, g.descricao1, g.ativo from grade g ' +
                   ' where g.tipo_ec = %s and g.descricao_ec = %s ' +
                   ' and coalesce(g.tipo_ec1, '''') = %s and coalesce(g.descricao_ec1, '''') = %s ' +
                   ' and g.cod_empresa = %d ' +
                   ' union ' +
                   ' select g.descricao, g.descricao1, g.ativo from grade g ' +
                   ' where upper(g.tipo_ec) = %s and g.descricao_ec = %s ' +
                   ' and upper(coalesce(g.tipo_ec1, '''')) = %s and coalesce(g.descricao_ec1, '''') = %s ' +
                   ' and g.cod_empresa = %d ',
                   [hwGrade.tipo_ec.Trim.Substring(0, 100).QuotedString, hwGrade.descricao_ec.Trim.Substring(0, 100).QuotedString,
                    hwGrade.tipo_ec1.Trim.Substring(0, 100).QuotedString, hwGrade.descricao_ec1.Trim.Substring(0, 100).QuotedString, CodEmpresa,
                    hwGrade.tipo_ec.Trim.Substring(0, 100).ToUpper.QuotedString, hwGrade.descricao_ec.Trim.Substring(0, 100).QuotedString,
                    hwGrade.tipo_ec1.Trim.Substring(0, 100).ToUpper.QuotedString, hwGrade.descricao_ec1.Trim.Substring(0, 100).QuotedString, CodEmpresa]) do

          if not IsEmpty then
          begin
            ShowAtencao('Já existe uma variação (grade) no banco com mesma tipo e descrição.' + #13 + #13 +
              'Variação tipo : ' + hwGrade.tipo_ec + ' - ' + hwGrade.descricao_ec + #13 +
              IfThen(hwGrade.tipo_ec1.Trim <> '',
              'Variação tipo1: ' + hwGrade.tipo_ec1.Trim + ' - ' + hwGrade.descricao_ec1.Trim + #13) +
              'Lixeira: ' + IfThen(fequals('ativo', '1'), 'Não', 'Sim'));
            exit;
          end;

      hwTipoGradesCad  := [];
      hwTipoGradesCad1 := [];
      hwGradesCad := [];

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
        hwGrade.descricao          := (hwGrade.tipo_ec.Trim  + ' ' + hwGrade.descricao_ec.Trim).ToUpper;
        hwGrade.descricao1         := (hwGrade.tipo_ec1.Trim + ' ' + hwGrade.descricao_ec1.Trim).Trim.ToUpper;
        hwGrade.cod_empresa        := CodEmpresa;
        hwGrade.ativo              := 1;
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
          LogError('THwNuvemshopServicos.CadastrarGrade. Erro: %s', [e.Message]);
          if not SilentMod then
            ShowErro('Erro ao cadastrar Grade. %s',  [e.Message]);
        end;
    end;
  finally
    desconectar;
  end;
end;

function THwNuvemshopServicos.ConcederPermissoesTabelasViews: boolean;
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
//              LogError('THwNuvemshopServicos.ConcederPermissoesTabelasViews. Tabela %s Erro: %s', [vListaTabelas[I], e.Message]);
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
//              LogError('THwNuvemshopServicos.ConcederPermissoesTabelasViews. Procedure %s Erro: %s', [vListaProcedures[I], e.Message]);
//              if not SilentMod then
//                ShowErro('Erro ao conceder permissões tabelas e views. Procedure %s Erro %s',  [vListaProcedures[I], e.Message]);
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
        LogError('THwNuvemshopServicos.ConcederPermissoesTabelasViews. Erro: %s', [e.Message]);
        if not SilentMod then
          ShowErro('Erro ao conceder permissões tabelas e views. %s',  [e.Message]);
    end;
  end;
end;

constructor THwNuvemshopServicos.Create(SilentMode: Boolean);
begin
  inherited;
  nuvemshopConsumeApi            := TNuvemshopConsumeApi.Create(UrlApi, FCnpj);
end;

function THwNuvemshopServicos.Delete(controller: string): boolean;
begin
  if not conectar(DataBasePath, True)  then
    Exit;

  try

    try
      if (not GetDadosApi) then
        Exit;

      Result := nuvemshopConsumeApi.Delete(controller, []);

    except on E: Exception do
      begin
        LogError('THwNuvemshopServicos.Delete %s %s', [controller, e.Message]);
        if not SilentMod then
          ShowErro('Erro ao obter lista %s' + sLineBreak + e.Message, [controller]);
      end;
    end;

  finally
    desconectar;
  end;
end;

destructor THwNuvemshopServicos.Destroy;
begin
  nuvemshopConsumeApi.Free;

  inherited;
end;

function THwNuvemshopServicos.DesvincularCategoria(hwId: Integer): Boolean;
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
        LogError('THwNuvemshopServicos.DesvincularCategoria. HwId %d. Erro: %s', [hwId, e.Message]);
        if not SilentMod then
          ShowErro('Erro ao desvincular Categoria. %s',  [e.Message]);
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwNuvemshopServicos.DesvincularProduto(hwGrupoProd: Integer;
  hwCodProd: string): Boolean;
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

      with SqlExec(' update produtos_ec_grade set id_commerce = null' +
              ' where grupo_prod = %d ' +
              ' and cod_prod = %s ' +
              ' and cod_grade = %d ' +
              ' and cod_empresa = %d ', [hwGrupoProd, hwCodProd, 0, CodEmpresa]).Transaction do
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
        LogError('THwNuvemshopServicos.DesvincularProduto. Grupo Prod %d Cod Prod %s. Erro: %s', [hwGrupoProd, hwCodProd, e.Message]);
        if not SilentMod then
          ShowErro('Erro ao vincular Produto. %s',  [e.Message]);
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwNuvemshopServicos.DesvincularVariacoes(hwGrupo: Integer;
  hwCodProd: string; hwCodGrade: Integer): Boolean;
begin
  if not conectar(DataBasePath, True)  then
    Exit;

  try

    try

      with SqlExec('update or insert into produtos_ec_grade (grupo_prod, cod_prod, cod_grade, cod_empresa, id_commerce, sinc_ecommerce) ' +
        ' values (%d, %s, %d, %d, %d, %S) ' +
        ' matching (grupo_prod, cod_prod, cod_grade, cod_empresa) ',
         [hwGrupo, QuotedStr(hwCodProd), hwCodGrade, CodEmpresa, 0, QuotedStr('S')]).Transaction do
        if InTransaction then
          Commit;
      Result := True;

      Auditor.Sucesso.GravarMensagem('');

    except on E: Exception do
      begin
        Result := False;
        LogError('THwNuvemshopServicos.DesvincularVariacoes. HwGrupo %d HwCodProd %s HwCodGrade %d. Erro: %s',
           [hwGrupo, hwCodProd, hwCodGrade, e.Message]);
        if not SilentMod then
          ShowErro('Erro ao desvincular Variacoes. %s',  [e.Message]);
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwNuvemshopServicos.GetCategorias: TConexao_OOP;
var
  sql: string;
begin
  Result := AllCategs;

  if not conectar(DataBasePath, True)  then
    Exit;

  try

    try

      //??? tem de olhar o ativo = 1
      sql := Format('select cod_categoria, cod_empresa, descricao, cod_categoria_pai, id_commerce' +
                    ' from categoria where cod_empresa = %d and ativo = 1' +
                    ' order by id_commerce, descricao', [CodEmpresa]);

      if AllCategs = nil then
        AllCategs := NewClientOOP(sql)
      else
        AllCategs.ClientOpen(sql);

    except on E: Exception do
      begin
        LogError('THwNuvemshopServicos.GetCategorias. %s', [e.Message]);
        if not SilentMod then
          ShowErro('Erro ao obter Categorias do banco. %s',  [e.Message]);
      end;
    end;

  finally
    Result := AllCategs;

    desconectar;
  end;
end;

function THwNuvemshopServicos.GetCategorias(categoriaOOP: TConexao_OOP;
  pIds: string): TConexao_OOP;
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
      sql := Format(' select categoria.cod_categoria, categoria.cod_empresa, categoria.descricao, categoria.cod_categoria_pai, categoria.id_commerce from categoria  ' +
                    ' where categoria.cod_empresa = %d  ' +
                    ' and categoria.ativo = 1 ' +
                    ' order by categoria.descricao ', [CodEmpresa]);

      if Result = nil then
        Result := NewClientOOP(sql)
      else
        Result.ClientOpen(sql);

    except on E: Exception do
      begin
        LogError('THwNuvemshopServicos.GetCategorias. %s', [e.Message]);
        if not SilentMod then
          ShowErro('Erro ao obter Categorias do banco. %s',  [e.Message]);
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwNuvemshopServicos.GetCategorias(categoriaOOP: TConexao_OOP; onlySinc: Boolean): TConexao_OOP;
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
        LogError('THwNuvemshopServicos.GetCategorias. %s', [e.Message]);
        if not SilentMod then
          ShowErro('Erro ao obter Categorias do banco. %s',  [e.Message]);
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwNuvemshopServicos.GenCodigo(Tabela: string; buscas: TIBQuery;
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

function THwNuvemshopServicos.GetCategorias(categoriaOOP: TConexao_OOP; campo,
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
        LogError('THwNuvemshopServicos.GetCategorias. %s', [e.Message]);
        if not SilentMod then
          ShowErro('Erro ao obter Categorias do banco. %s',  [e.Message]);
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwNuvemshopServicos.GetConsulta(controller, name: string;
  params: TArray<string>): TNuvemshopConsulta;
begin
  if not conectar(DataBasePath, True)  then
    Exit;

  try

    try
      if (not GetDadosApi) then
        Exit;

      Result := nuvemshopConsumeApi.GetConsulta(controller, name, params);

    except on E: Exception do
      begin
        LogError('THwNuvemshopServicos.GetConsulta %s %s', [controller, e.Message]);
        if not SilentMod then
          ShowErro('Erro ao obter consulta %s' + sLineBreak + e.Message, [controller]);
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwNuvemshopServicos.GetCount<T>(controller, name: string;
  params: TArray<string>): Integer;
begin
  if not conectar(DataBasePath, True)  then
    Exit;

  try

    try
      if (not GetDadosApi) then
        Exit;

      Result := nuvemshopConsumeApi.GetCount<T>(controller, name, params);

    except on E: Exception do
      begin
        LogError('THwNuvemshopServicos.Get%s %s', [controller, e.Message]);
        if not SilentMod then
          ShowErro('Erro ao obter lista %s' + sLineBreak + e.Message, [controller]);
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwNuvemshopServicos.GetDadosApi: Boolean;
begin
  Result := False;

  try
    with SqlOpen(' select coalesce(url_api, '''') url_api, ' +
                 ' coalesce(acess_token, '''') acess_token, ' +
                 ' coalesce(user_id, 0) user_id ' +
                 ' from config_api where cod_empresa = %d and api = ''NUVEMSHOP''', [CodEmpresa]) do
    begin
      URLApi := FieldByName('url_api').AsString.Trim;
      nuvemshopConsumeApi.URLApi :=
        FieldByName('url_api').AsString.Trim +
        '/' + IntToStr(FieldByName('user_id').AsInteger);
      nuvemshopConsumeApi.Token :=
        FieldByName('acess_token').AsString.Trim;
    end;

    Result := not nuvemshopConsumeApi.URLApi.Trim.IsEmpty;

//    if Result then
//      nuvemshopConsumeApi.Token := TJsonHw.ToObject<TNuvemshopTokenApi>(GetJson(NUVEMSHOP_SERV_TOKEN_API))
//    else if not Result then
//      if not SilentMod then
//        ShowErro('Não foi possivel obter dados da API NUVEMSHOP no banco de dados')
//      else
//        LogError('Não foi possivel obter dados da API NUVEMSHOP no banco de dados. Empresa %d', [CodEmpresa]);

  except on E: Exception do
    begin
      LogError('THwNuvemshopServicos.GetDadosApi ', [e.Message]);
    end;
  end;
end;

function THwNuvemshopServicos.GetGrades: TConexao_OOP;
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
        LogError('THwNuvemshopServicos.GetGrades. %s', [e.Message]);
        if not SilentMod then
          ShowErro('Erro ao obter Grades do banco. %s',  [e.Message]);
      end;
    end;

  finally
    Result := AllGrades;

    desconectar;
  end;
end;

function THwNuvemshopServicos.GetList<T>(controller, name: string;
  params: TArray<string>): TArray<T>;
begin
  if not conectar(DataBasePath, True)  then
    Exit;

  try

    try
      if (not GetDadosApi) then
        Exit;

      Result := nuvemshopConsumeApi.Get<T>(controller, name, params);

    except on E: Exception do
      begin
        LogError('THwNuvemshopServicos.Get%s %s', [controller, e.Message]);
        if not SilentMod then
          ShowErro('Erro ao obter lista %s' + sLineBreak + e.Message, [controller]);
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwNuvemshopServicos.GetProdutos(prodOOP: TConexao_OOP; onlySinc,
  withImages: Boolean): TConexao_OOP;
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
        LogError('THwNuvemshopServicos.GetProdutos. %s', [e.Message]);
        if not SilentMod then
          ShowErro('Erro ao obter Produtos do banco. %s',  [e.Message]);
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwNuvemshopServicos.GetProdutos(prodOOP: TConexao_OOP;
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
                    '     and gr.cod_grade > 0 ) tem_grade ' +
                    ' from produtos pr ' +
                    ' left join produtos_ec pe on pe.grupo_prod = pr.grupo_prod and pe.cod_prod = pr.cod_prod and pe.cod_empresa = pr.cod_empresa ' +
                    ' where pe.id_commerce in (%s) ' +
                    ' and pe.cod_empresa = %d ' +
                    ' and coalesce(pe.sinc_ecommerce, '''') in ('''',%s)' +
                    ' order by pr.descr_prod',
                    [pIds, CodEmpresa, string('S').QuotedString + ',' + string('N').QuotedString]);

      if Result = nil then
        Result := NewClientOOP(sql)
      else
        Result.ClientOpen(sql);

    except on E: Exception do
      begin
        LogError('THwNuvemshopServicos.GetProdutos. %s', [e.Message]);
        if not SilentMod then
          ShowErro('Erro ao obter Produtos do banco. %s',  [e.Message]);
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwNuvemshopServicos.GetProdutos(prodOOP: TConexao_OOP; campo,
  condicao, texto: string): TConexao_OOP;
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
                    ' where %s %s %s and %s.cod_empresa = %d' +
                    ' order by pr.descr_prod',
                    [campo, condicao, texto, aliasEmp, CodEmpresa]);// and  and ' + IntToStr(CodEmpresa) +

      if Result = nil then
        Result := NewClientOOP(sql)
      else
        Result.ClientOpen(sql);

      sql := ' select pr.grupo_prod, pr.cod_prod, pimg.cod_grade, 0 codigo_kit, pimg.lista_imagens, pimg.url_imagens' +
             ' from produtos pr' +
             ' left join retorna_img_prod(pr.grupo_prod, pr.cod_prod, 0, pr.cod_empresa) pimg on 1 = 1 ' +
             sql.Substring(sql.IndexOf('left join produtos_ec')).Replace('order by pr.descr_prod', '');

      if AllImages = nil then
        AllImages := NewClientOOP(sql)
      else
        AllImages.ClientOpen(sql);

    except on E: Exception do
      begin
        LogError('THwNuvemshopServicos.GetProdutos. %s', [e.Message]);
        if not SilentMod then
          ShowErro('Erro ao obter Produtos do banco. %s',  [e.Message]);
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwNuvemshopServicos.GetVariacoes(nuvemshopVariacoes: TArray<TVariant>;
  pGrupoProd: Integer; pCodProd: string;
  pTipoEc: string; pTipoEc1: string;
  pId: Integer): TConexao_OOP;
var
  nuvemshopVariacao: TVariant;
  vtemp: string;
  vtempini: string;
  sql: string;
begin
  Result := AllVariacoes;

  if not conectar(DataBasePath, True)  then
    Exit;

  try
    sql := '';

    try
      for nuvemshopVariacao in nuvemshopVariacoes do
      begin
        if trim(sql) <> '' then
          sql := sql + ' union ';

        if Length(nuvemshopVariacao.Values) > 1 then
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
            ' and grade.descricao_ec = ' + nuvemshopVariacao.Values[0].Pt.Trim.QuotedString +
            ' and coalesce(grade.tipo_ec1, '''') = ' + pTipoEc1.Trim.QuotedString +
            ' and coalesce(grade.descricao_ec1, '''') = ' + nuvemshopVariacao.Values[1].Pt.Trim.QuotedString +
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
                ' and grade.descricao_ec = ' + nuvemshopVariacao.Values[0].Pt.Trim.QuotedString +
                ' and coalesce(grade.tipo_ec1, '''') = ' + pTipoEc1.Trim.QuotedString +
                ' and coalesce(grade.descricao_ec1, '''') = ' + nuvemshopVariacao.Values[1].Pt.Trim.QuotedString +
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
                ' and grade.descricao_ec = ' + nuvemshopVariacao.Values[0].Pt.Trim.QuotedString +
                ' and upper(coalesce(grade.tipo_ec1, '''')) = ' + pTipoEc1.ToUpper.Trim.QuotedString +
                ' and coalesce(grade.descricao_ec1, '''') = ' + nuvemshopVariacao.Values[1].Pt.Trim.QuotedString +
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
                ' and grade.descricao_ec = ' + nuvemshopVariacao.Values[0].Pt.Trim.QuotedString +
                ' and upper(coalesce(grade.tipo_ec1, '''')) = ' + pTipoEc1.ToUpper.Trim.QuotedString +
                ' and coalesce(grade.descricao_ec1, '''') = ' + nuvemshopVariacao.Values[1].Pt.Trim.QuotedString +
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
                ' upper(grade.tipo_ec) = ' + 'CORES'.Trim.QuotedString +
                ' and grade.descricao_ec = ' + nuvemshopVariacao.Values[0].Pt.Trim.QuotedString +
                ' and coalesce(grade.tipo_ec1, '''') = ' + pTipoEc1.Trim.QuotedString +
                ' and coalesce(grade.descricao_ec1, '''') = ' + nuvemshopVariacao.Values[1].Pt.Trim.QuotedString +
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
                ' upper(grade.tipo_ec) = ' + 'COR'.Trim.QuotedString +
                ' and grade.descricao_ec = ' + nuvemshopVariacao.Values[0].Pt.Trim.QuotedString +
                ' and coalesce(grade.tipo_ec1, '''') = ' + pTipoEc1.Trim.QuotedString +
                ' and coalesce(grade.descricao_ec1, '''') = ' + nuvemshopVariacao.Values[1].Pt.Trim.QuotedString +
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
                ' upper(grade.tipo_ec) = ' + 'GÊNERO'.Trim.QuotedString +
                ' and grade.descricao_ec = ' + nuvemshopVariacao.Values[0].Pt.Trim.QuotedString +
                ' and coalesce(grade.tipo_ec1, '''') = ' + pTipoEc1.Trim.QuotedString +
                ' and coalesce(grade.descricao_ec1, '''') = ' + nuvemshopVariacao.Values[1].Pt.Trim.QuotedString +
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
                ' upper(grade.tipo_ec) = ' + 'TAMANHO'.Trim.QuotedString +
                ' and grade.descricao_ec = ' + nuvemshopVariacao.Values[0].Pt.Trim.QuotedString +
                ' and coalesce(grade.tipo_ec1, '''') = ' + pTipoEc1.Trim.QuotedString +
                ' and coalesce(grade.descricao_ec1, '''') = ' + nuvemshopVariacao.Values[1].Pt.Trim.QuotedString +
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
                ' upper(grade.tipo_ec) = ' + 'VOLTAGEM'.Trim.QuotedString +
                ' and grade.descricao_ec = ' + nuvemshopVariacao.Values[0].Pt.Trim.QuotedString +
                ' and coalesce(grade.tipo_ec1, '''') = ' + pTipoEc1.Trim.QuotedString +
                ' and coalesce(grade.descricao_ec1, '''') = ' + nuvemshopVariacao.Values[1].Pt.Trim.QuotedString +
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
                ' and grade.descricao_ec = ' + nuvemshopVariacao.Values[0].Pt.Trim.QuotedString +
                ' and upper(coalesce(grade.tipo_ec1, '''')) = ' + 'CORES'.Trim.QuotedString +
                ' and coalesce(grade.descricao_ec1, '''') = ' + nuvemshopVariacao.Values[1].Pt.Trim.QuotedString +
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
                ' and grade.descricao_ec = ' + nuvemshopVariacao.Values[0].Pt.Trim.QuotedString +
                ' and upper(coalesce(grade.tipo_ec1, '''')) = ' + 'COR'.Trim.QuotedString +
                ' and coalesce(grade.descricao_ec1, '''') = ' + nuvemshopVariacao.Values[1].Pt.Trim.QuotedString +
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
                ' and grade.descricao_ec = ' + nuvemshopVariacao.Values[0].Pt.Trim.QuotedString +
                ' and upper(coalesce(grade.tipo_ec1, '''')) = ' + 'GÊNERO'.Trim.QuotedString +
                ' and coalesce(grade.descricao_ec1, '''') = ' + nuvemshopVariacao.Values[1].Pt.Trim.QuotedString +
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
                ' and grade.descricao_ec = ' + nuvemshopVariacao.Values[0].Pt.Trim.QuotedString +
                ' and upper(coalesce(grade.tipo_ec1, '''')) = ' + 'TAMANHO'.Trim.QuotedString +
                ' and coalesce(grade.descricao_ec1, '''') = ' + nuvemshopVariacao.Values[1].Pt.Trim.QuotedString +
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
                ' and grade.descricao_ec = ' + nuvemshopVariacao.Values[0].Pt.Trim.QuotedString +
                ' and upper(coalesce(grade.tipo_ec1, '''')) = ' + 'VOLTAGEM'.Trim.QuotedString +
                ' and coalesce(grade.descricao_ec1, '''') = ' + nuvemshopVariacao.Values[1].Pt.Trim.QuotedString +
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
                ' upper(grade.tipo_ec) = ' + 'CORES'.Trim.QuotedString +
                ' and grade.descricao_ec = ' + nuvemshopVariacao.Values[0].Pt.Trim.QuotedString +
                ' and upper(coalesce(grade.tipo_ec1, '''')) = ' + 'CORES'.Trim.QuotedString +
                ' and coalesce(grade.descricao_ec1, '''') = ' + nuvemshopVariacao.Values[1].Pt.Trim.QuotedString +
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
                ' upper(grade.tipo_ec) = ' + 'COR'.Trim.QuotedString +
                ' and grade.descricao_ec = ' + nuvemshopVariacao.Values[0].Pt.Trim.QuotedString +
                ' and upper(coalesce(grade.tipo_ec1, '''')) = ' + 'COR'.Trim.QuotedString +
                ' and coalesce(grade.descricao_ec1, '''') = ' + nuvemshopVariacao.Values[1].Pt.Trim.QuotedString +
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
                ' upper(grade.tipo_ec) = ' + 'GÊNERO'.Trim.QuotedString +
                ' and grade.descricao_ec = ' + nuvemshopVariacao.Values[0].Pt.Trim.QuotedString +
                ' and upper(coalesce(grade.tipo_ec1, '''')) = ' + 'GÊNERO'.Trim.QuotedString +
                ' and coalesce(grade.descricao_ec1, '''') = ' + nuvemshopVariacao.Values[1].Pt.Trim.QuotedString +
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
                ' upper(grade.tipo_ec) = ' + 'TAMANHO'.Trim.QuotedString +
                ' and grade.descricao_ec = ' + nuvemshopVariacao.Values[0].Pt.Trim.QuotedString +
                ' and upper(coalesce(grade.tipo_ec1, '''')) = ' + 'TAMANHO'.Trim.QuotedString +
                ' and coalesce(grade.descricao_ec1, '''') = ' + nuvemshopVariacao.Values[1].Pt.Trim.QuotedString +
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
                ' upper(grade.tipo_ec) = ' + 'VOLTAGEM'.Trim.QuotedString +
                ' and grade.descricao_ec = ' + nuvemshopVariacao.Values[0].Pt.Trim.QuotedString +
                ' and upper(coalesce(grade.tipo_ec1, '''')) = ' + 'VOLTAGEM'.Trim.QuotedString +
                ' and coalesce(grade.descricao_ec1, '''') = ' + nuvemshopVariacao.Values[1].Pt.Trim.QuotedString +
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
        else if Length(nuvemshopVariacao.Values) > 0 then
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
            ' and grade.descricao_ec = ' + nuvemshopVariacao.Values[0].Pt.Trim.QuotedString +
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
                ' and grade.descricao_ec = ' + nuvemshopVariacao.Values[0].Pt.Trim.QuotedString +
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
                ' upper(grade.tipo_ec) = ' + 'CORES'.Trim.QuotedString +
                ' and grade.descricao_ec = ' + nuvemshopVariacao.Values[0].Pt.Trim.QuotedString +
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
                ' upper(grade.tipo_ec) = ' + 'COR'.Trim.QuotedString +
                ' and grade.descricao_ec = ' + nuvemshopVariacao.Values[0].Pt.Trim.QuotedString +
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
                ' upper(grade.tipo_ec) = ' + 'GÊNERO'.Trim.QuotedString +
                ' and grade.descricao_ec = ' + nuvemshopVariacao.Values[0].Pt.Trim.QuotedString +
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
                ' upper(grade.tipo_ec) = ' + 'TAMANHO'.Trim.QuotedString +
                ' and grade.descricao_ec = ' + nuvemshopVariacao.Values[0].Pt.Trim.QuotedString +
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
                ' upper(grade.tipo_ec) = ' + 'VOLTAGEM'.Trim.QuotedString +
                ' and grade.descricao_ec = ' + nuvemshopVariacao.Values[0].Pt.Trim.QuotedString +
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
        LogError('THwNuvemshopServicos.GetVariacoes. %s', [e.Message]);
        if not SilentMod then
          ShowErro('Erro ao obter Marcas do GetVariacoes. %s',  [e.Message]);
      end;
    end;

  finally
    Result := AllVariacoes;

    desconectar;
  end;
end;

function THwNuvemshopServicos.GetProdutos: TConexao_OOP;
var
  sql: string;
begin
  Result := AllProdutos;

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
                    ' and coalesce(pe.sinc_ecommerce, '''') in ('''',%s)' +
                    ' order by pr.descr_prod',
                    [CodEmpresa, string('S').QuotedString]);

      if AllProdutos = nil then
        AllProdutos := NewClientOOP(sql)
      else
        AllProdutos.ClientOpen(sql);

    except on E: Exception do
      begin
        LogError('THwNuvemshopServicos.GetProdutos. %s', [e.Message]);
        if not SilentMod then
          ShowErro('Erro ao obter GetProdutos do banco. %s',  [e.Message]);
      end;
    end;

  finally
    Result := AllProdutos;

    desconectar;
  end;
end;

procedure THwNuvemshopServicos.Inicializar;
begin
  nuvemshopConsumeApi.OnLog      := Self.OnLog;
  nuvemshopConsumeApi.AfterLogin := AfterLogin;
  Auditor                   := TAudit_OOP.Create(FUsuario, CodEmpresa, Self.Banco);

  Self.ConfigureStr(';databaseName=' + DataBasePath);
end;

function THwNuvemshopServicos.ReduceArray(value: TArray<string>;
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

function THwNuvemshopServicos.ReenviarImagensProduto(pId: Integer;
  pGerarUrl: boolean): boolean;
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
      QrAux.SQL.Text := ' update produtos set alterou_imagem = ''S'', alterou_imagem_grade = ''S''  ' +
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
        QrAux.SQL.Text := ' update produtos_imagens set url_imagens = :url_imagens ' +
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
        LogError('THwNuvemshopServicos.ReenviarImagensProduto. tray %s GrupoProd %d Cod Prod %s. Erro: %s', [IntToStr(pId), vgrupoprod, vcodprod, e.Message]);
        if not SilentMod then
          ShowErro('Erro ao reenviar Imagens do Produto. %s',  [e.Message]);
      end;
    end;
  finally
    desconectar;
  end;
end;

function THwNuvemshopServicos.ResolverCategorias(
  nuvemshopCategorias: TArray<TCategory>; parentId: string; Level: SmallInt;
  current: TArray<TCategoryMescladaHw>): TArray<TCategoryMescladaHw>;
var
  nuvemshopCateg: TCategory;
  hwCateg: TCategoryMescladaHw;
  adicionar: Boolean;
  childParentId: string;
  jaIncluido: Boolean;
  I: Integer;
begin
  Result := [];

  AllSincCategoria := GetCategorias(AllSincCategoria, True);

  parentId := IfThen(parentId.Trim.IsEmpty, '0', parentId.Trim);

  for nuvemshopCateg in nuvemshopCategorias do
  begin
    childParentId := nuvemshopCateg.parent.ToString;
    childParentId := IfThen(nuvemshopCateg.parent <= 0, '0', nuvemshopCateg.parent.ToString);

    jaIncluido := False;
    for I := Low(current) to High(current) do
      if jaIncluido then
        Break
      else
        jaIncluido := nuvemshopCateg.id = current[I].id;

    if not jaIncluido then
    begin
      if parentId = childParentId  then
      begin
        hwCateg := TCategoryMescladaHw.Create;
        hwCateg.Id := nuvemshopCateg.Id;
        hwCateg.name_category := nuvemshopCateg.Name.Pt.Trim;
        hwCateg.Parent := nuvemshopCateg.Parent;
//        hwCateg.cod_categoria = nuvemshopCateg.
//        RttiHwUtils.MesclarObjetos(tobject(hwCateg), nuvemshopCateg);
//        hwCateg.small_description := hwCateg.small_description.Replace('<br>', ' ').Replace('</br>', ' ')
//                                                              .Replace('<p>', ' ').Replace('</p>', ' ')
//                                                              .Replace('<strong>', '').Replace('</strong>', '')
//                                                              .Replace('<div>', ' ').Replace('</div>', ' ');
        if not AllSincCategoria.filterStr('id_commerce = %d', [nuvemshopCateg.id]).IsEmpty then
        begin
          hwCateg.cod_categoria := AllSincCategoria.fint('cod_categoria');
          hwCateg.descricao := AllSincCategoria.fstr('descricao').Trim;
        end;
//        hwCateg.name := ''.PadRight(Level * 3, ' ') + IfThen(Level > 0, '> ')  + hwCateg.name;

        Result := Result + [hwCateg];

        Result := Result + ResolverCategorias(nuvemshopCategorias, hwCateg.id.ToString, Level + 1, Result);
      end;

    end;

  end;

  AllSincCategoria.filterClear;

  if Level = 0 then
    for I := Low(Result) to High(Result) do
      Result[I].index := I;
end;

function THwNuvemshopServicos.ResolverCategoriasHw(
  categoriaOOP: TConexao_OOP; nuvemshopCategorias: TArray<TCategory>; parentId: Integer; Level: SmallInt;
  current: TArray<TCategoriaHw>): TArray<TCategoriaHw>;
var
  hwCategorias: TArray<TCategoriaHw>;
  hwCategoria: TCategoriaHw;

  dbCateg: TCategoriaHw;
  nuvemshopCategoria: TCategory;
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
      for nuvemshopCategoria in nuvemshopCategorias do
        if nuvemshopCategoria.id = hwCategoria.id_commerce then
        begin
          hwCategoria.id := nuvemshopCategoria.id;
          hwCategoria.descricao := nuvemshopCategoria.name.Pt.Trim;
          hwCategoria.name_commerce := nuvemshopCategoria.Name.Pt.Trim;
          Break;
        end;

      Result := Result + [hwCategoria];

    end;
  finally
    categoriaOOP.prepare_loop_done;
  end;
end;

function THwNuvemshopServicos.ResolverImagensKitProduto(
  kitproduto: TKitsProdHw): TKitsProdHw;
begin

end;

function THwNuvemshopServicos.ResolverImagensProduto(
  produto: TProductHw): TProductHw;
var
  //variacoes: TArray<TVariant>;
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

//      variacoes := trayConsumeApi.Get<TVariant>('products/variants', 'Variants', ['product_id=' + produto.id]);
//      produto.Variant := variacoes;

      path := IncludeTrailingPathDelimiter(TConfig_sistema_class.getConf('prod_cad_diretorio_padrao_imagens', QrAux, CodEmpresa).value1_vc.Trim);

      with SqlOpen(' select pr.grupo_prod, pr.cod_prod, 0 cod_grade, img.lista_imagens, img.url_imagens from produtos pr ' +
                   ' left join retorna_img_prod (pr.grupo_prod, pr.cod_prod, 0, pr.cod_empresa) img on 1 = 1 ' +
                   ' where pr.grupo_prod = %d ' +
                   ' and pr.cod_prod = %s ' +
                   ' and pr.cod_empresa = %d ' +
                   ' union all ' +
                   ' select pr.grupo_prod, pr.cod_prod, cg.cod_grade, img.lista_imagens, img.url_imagens from produtos pr ' +
                   ' left join cod_grade_prod cg on ' +
                   '   cg.grupo_prod = pr.grupo_prod ' +
                   '   and cg.cod_prod = pr.cod_prod ' +
                   '   and cg.cod_empresa = pr.cod_empresa ' +
                   '   and cg.cod_grade > 0 ' +
                   ' left join retorna_img_prod (pr.grupo_prod, pr.cod_prod, cg.cod_grade, pr.cod_empresa) img on 1 = 1 ' +
                   ' where pr.grupo_prod = %d ' +
                   ' and pr.cod_prod = %s ' +
                   ' and pr.cod_empresa = %d ',
                   [produto.grupo_prod, produto.cod_prod.QuotedString, CodEmpresa,
                    produto.grupo_prod, produto.cod_prod.QuotedString, CodEmpresa]) do
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
        LogError('THwNuvemshopServicos.ResolverImagensProduto. %s', [e.Message]);
        if not SilentMod then
          ShowErro('Erro ao obter Imagens do banco. %s',  [e.Message]);
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwNuvemshopServicos.ResolverProduto(
  nuvemshopProduto: TProduct): TProductHw;
begin
  Result := TProductHw.Create;
  RttiHwUtils.MesclarObjetos(TObject(Result), nuvemshopProduto);

  if (AllSincProd <> nil) and (AllSincProd.Active) then
    try
      if not AllSincProd.filterStr('id_commerce = %d', [nuvemshopProduto.id]).IsEmpty then
      begin
        Result.grupo_prod    := AllSincProd.fint('grupo_prod');
        Result.cod_prod      := AllSincProd.fstr('cod_prod');
        Result.num_fab_prod  := AllSincProd.fstr('num_fab_prod');
        Result.descr_prod    := AllSincProd.fstr('descr_prod');
      end;

    finally
      AllSincProd.filterClear;
    end;

  Result := ResolverImagensProduto(Result);
end;

function THwNuvemshopServicos.ResolverProdutoHw(prodOOP: TConexao_OOP;
  trayProdutos: TArray<TProduct>): TProductHw;
var
  nuvemshopProduto: TProduct;
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

    for nuvemshopProduto in trayProdutos do
      if nuvemshopProduto.id = prodOOP.fint('id') then // if nuvemshopProduto.id.Trim.Equals(hwProduto.id_commerce.ToString) then
      begin
//        hwProduto.name := nuvemshopProduto.name;
        hwProduto.id := nuvemshopProduto.id;
        Break;
      end;

    Result := ResolverImagensProduto(Result);

  finally
    prodOOP.prepare_loop_done;
  end;
end;

function THwNuvemshopServicos.ResolverProdutos(nuvemshopProdutos: TArray<TProduct>;
  trayCategorias: TArray<TCategory>): TArray<TProductHw>;
var
  nuvemshopProduto: TProduct;
  trayCategoria: TCategory;
  hwProduto: TProductHw;
  adicionar: Boolean;
begin
  Result := [];

  AllSincProd := GetProdutos(AllSincProd, True, False);

  for nuvemshopProduto in nuvemshopProdutos do
  begin
    hwProduto := TProductHw.Create;
    RttiHwUtils.MesclarObjetos(tobject(hwProduto), nuvemshopProduto);
    hwProduto.Id := nuvemshopProduto.Id;
    hwProduto.name_product := nuvemshopProduto.Name.Pt;
    if (Length(nuvemshopProduto.Attributes) > 0) and (Length(nuvemshopProduto.Variants) = 1) then
    begin
      if Length(nuvemshopProduto.Variants[0].Values) <= 0 then
        hwProduto.has_variation := '0'
      else if Length(nuvemshopProduto.Variants[0].Values) = 1 then
      begin
        if nuvemshopProduto.Variants[0].Values[0].Pt.Trim = '' then
          hwProduto.has_variation := '0'
        else
          hwProduto.has_variation := '1';
      end
      else if Length(nuvemshopProduto.Variants[0].Values) > 1 then
        hwProduto.has_variation := '1'
      else
        hwProduto.has_variation := '0';
    end
    else if Length(nuvemshopProduto.Variants) > 1 then
      hwProduto.has_variation := '1'
    else
      hwProduto.has_variation := '0';
    if Length(nuvemshopProduto.Images) > 0 then
      hwProduto.has_image := '1'
    else
      hwProduto.has_image := '0';
    if Length(nuvemshopProduto.Attributes) <= 0 then
      hwProduto.tipoec := '';
    if Length(nuvemshopProduto.Attributes) <= 1 then
      hwProduto.tipoec1 := '';
    if Length(nuvemshopProduto.Attributes) > 0 then
      hwProduto.tipoec := nuvemshopProduto.Attributes[0].Pt;
    if Length(nuvemshopProduto.Attributes) > 1 then
      hwProduto.tipoec1 := nuvemshopProduto.Attributes[1].Pt;

//    for trayCategoria in trayCategorias do
//      if trayCategoria.id = hwProduto.category_id then
//      begin
//        hwProduto.category_name := trayCategoria.name;
//        Break;
//      end;

    if (AllSincProd <> nil) and (AllSincProd.Active) then
      if not AllSincProd.filterStr('id_commerce = %d', [nuvemshopProduto.id]).IsEmpty then
      begin
        hwProduto.grupo_prod    := AllSincProd.fint('grupo_prod');
        hwProduto.cod_prod      := AllSincProd.fstr('cod_prod');
        hwProduto.num_fab_prod  := AllSincProd.fstr('num_fab_prod');
        hwProduto.descr_prod    := AllSincProd.fstr('descr_prod');
      end;

    Result := Result + [hwProduto];
  end;
  if (AllSincProd <> nil) and (AllSincProd.Active) then
    AllSincProd.filterClear;
end;

function THwNuvemshopServicos.ResolverProdutosHw(prodOOP: TConexao_OOP;
  nuvemshopProdutos: TArray<TProduct>): TArray<TProductHw>;
var
  nuvemshopProduto: TProduct;
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
      for nuvemshopProduto in nuvemshopProdutos do
        if nuvemshopProduto.id = hwProduto.id_commerce then
        begin
          hwProduto.id := hwProduto.id_commerce;
          if hwProduto.id > 0 then
            hwProduto.name_commerce := hwProduto.descr_prod_res;
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

function THwNuvemshopServicos.ResolverVariacoes(
  nuvemshopVariacoes: TArray<TVariant>; tipoec: string; tipoec1: string): TArray<TVariantHw2>;
var
  nuvemshopVariacao: TVariant;
  hwVariacao: TVariantHw2;
  //sku: TSku;
  variacao: TValues;
  adicionar: Boolean;
begin
  Result := [];

  GetGrades;
  for nuvemshopVariacao in nuvemshopVariacoes do
  begin
    hwVariacao := TVariantHw2.Create;
    RttiHwUtils.MesclarObjetos(tobject(hwVariacao), nuvemshopVariacao);
    if Length(nuvemshopVariacao.Values) > 0 then
    begin
      if tipoec.Trim() = '' then
        hwVariacao.tipo_ec := 'Teste'
      else
        hwVariacao.tipo_ec := tipoec;
      hwVariacao.descricao_ec := nuvemshopVariacao.Values[0].Pt;
    end;
    if Length(nuvemshopVariacao.Values) > 1 then
    begin
      if tipoec1.Trim() = '' then
        hwVariacao.tipo_ec := 'Teste'
      else
        hwVariacao.tipo_ec := tipoec1;
      hwVariacao.descricao_ec := nuvemshopVariacao.Values[1].Pt;
    end;

    if (hwVariacao.tipo_ec.Trim() = '') and (hwVariacao.tipo_ec1.Trim() = '') then
      // Não fazer nada
    else
    begin
      if hwVariacao.tipo_ec1.IsEmpty then
      begin
        AllGrades.filterStr('upper(tipo_ec) = %s and descricao_ec = %s ' +
                            'and ((tipo_ec1 is null) or (tipo_ec1 = '''')) ' +
                            'and ((descricao_ec1 is null) or (descricao_ec1 = '''')) ',
                            [hwVariacao.tipo_ec.QuotedString, hwVariacao.descricao_ec.QuotedString]);
        if AllGrades.IsEmpty then
          AllGrades.filterStr('upper(tipo_ec) = %s and descricao_ec = %s ' +
                              'and ((tipo_ec1 is null) or (tipo_ec1 = '''')) ' +
                              'and ((descricao_ec1 is null) or (descricao_ec1 = '''')) ',
                              [hwVariacao.tipo_ec.ToUpper.QuotedString, hwVariacao.descricao_ec.QuotedString]);
        if (AllGrades.IsEmpty) and (hwVariacao.tipo_ec.Trim.ToUpper = 'COR') then
          AllGrades.filterStr('upper(tipo_ec) = %s and descricao_ec = %s ' +
                              'and ((tipo_ec1 is null) or (tipo_ec1 = '''')) ' +
                              'and ((descricao_ec1 is null) or (descricao_ec1 = '''')) ',
                              ['CORES'.QuotedString, hwVariacao.descricao_ec.QuotedString]);
        if (AllGrades.IsEmpty) and (hwVariacao.tipo_ec.Trim.ToUpper = 'CORES') then
          AllGrades.filterStr('upper(tipo_ec) = %s and descricao_ec = %s ' +
                              'and ((tipo_ec1 is null) or (tipo_ec1 = '''')) ' +
                              'and ((descricao_ec1 is null) or (descricao_ec1 = '''')) ',
                              ['COR'.QuotedString, hwVariacao.descricao_ec.QuotedString]);
      end
      else
      begin
        AllGrades.filterStr('tipo_ec = %s and descricao_ec = %s ' +
                            'and tipo_ec1 = %s and descricao_ec1 = %s',
                            [hwVariacao.tipo_ec.QuotedString, hwVariacao.descricao_ec.QuotedString,
                             hwVariacao.tipo_ec1.QuotedString, hwVariacao.descricao_ec1.QuotedString]);
        if AllGrades.IsEmpty then
          AllGrades.filterStr('upper(tipo_ec) = %s and descricao_ec = %s ' +
                              'and tipo_ec1 = %s and descricao_ec1 = %s',
                              [hwVariacao.tipo_ec.ToUpper.QuotedString, hwVariacao.descricao_ec.QuotedString,
                               hwVariacao.tipo_ec1.QuotedString, hwVariacao.descricao_ec1.QuotedString]);
        if AllGrades.IsEmpty then
          AllGrades.filterStr('tipo_ec = %s and descricao_ec = %s ' +
                              'and upper(tipo_ec1) = %s and descricao_ec1 = %s',
                              [hwVariacao.tipo_ec.QuotedString, hwVariacao.descricao_ec.QuotedString,
                               hwVariacao.tipo_ec1.ToUpper.QuotedString, hwVariacao.descricao_ec1.QuotedString]);
        if AllGrades.IsEmpty then
          AllGrades.filterStr('upper(tipo_ec) = %s and descricao_ec = %s ' +
                              'and upper(tipo_ec1) = %s and descricao_ec1 = %s',
                              [hwVariacao.tipo_ec.ToUpper.QuotedString, hwVariacao.descricao_ec.QuotedString,
                               hwVariacao.tipo_ec1.ToUpper.QuotedString, hwVariacao.descricao_ec1.QuotedString]);
        if (AllGrades.IsEmpty) and (hwVariacao.tipo_ec.Trim.ToUpper = 'COR') then
          AllGrades.filterStr('upper(tipo_ec) = %s and descricao_ec = %s ' +
                              'and tipo_ec1 = %s and descricao_ec1 = %s',
                              ['CORES'.QuotedString, hwVariacao.descricao_ec.QuotedString,
                               hwVariacao.tipo_ec1.ToUpper.QuotedString, hwVariacao.descricao_ec1.QuotedString]);
        if (AllGrades.IsEmpty) and (hwVariacao.tipo_ec.Trim.ToUpper = 'CORES') then
          AllGrades.filterStr('tipo_ec = %s and descricao_ec = %s ' +
                              'and upper(tipo_ec1) = %s and descricao_ec1 = %s',
                              ['COR'.QuotedString, hwVariacao.descricao_ec.QuotedString,
                               hwVariacao.tipo_ec1.ToUpper.QuotedString, hwVariacao.descricao_ec1.QuotedString]);
        if (AllGrades.IsEmpty) and (hwVariacao.tipo_ec1.Trim.ToUpper = 'COR') then
          AllGrades.filterStr('upper(tipo_ec) = %s and descricao_ec = %s ' +
                              'and tipo_ec1 = %s and descricao_ec1 = %s',
                              [hwVariacao.tipo_ec.QuotedString, hwVariacao.descricao_ec.QuotedString,
                               'CORES'.ToUpper.QuotedString, hwVariacao.descricao_ec1.QuotedString]);
        if (AllGrades.IsEmpty) and (hwVariacao.tipo_ec1.Trim.ToUpper = 'CORES') then
          AllGrades.filterStr('tipo_ec = %s and descricao_ec = %s ' +
                              'and upper(tipo_ec1) = %s and descricao_ec1 = %s',
                              [hwVariacao.tipo_ec.QuotedString, hwVariacao.descricao_ec.QuotedString,
                               'COR'.ToUpper.QuotedString, hwVariacao.descricao_ec1.QuotedString]);
        if (AllGrades.IsEmpty) and (hwVariacao.tipo_ec.Trim.ToUpper = 'COR') and (hwVariacao.tipo_ec1.Trim.ToUpper = 'COR') then
          AllGrades.filterStr('upper(tipo_ec) = %s and descricao_ec = %s ' +
                              'and upper(tipo_ec1) = %s and descricao_ec1 = %s',
                              ['CORES'.QuotedString, hwVariacao.descricao_ec.QuotedString,
                               'CORES'.ToUpper.QuotedString, hwVariacao.descricao_ec1.QuotedString]);
        if (AllGrades.IsEmpty) and (hwVariacao.tipo_ec.Trim.ToUpper = 'CORES') and (hwVariacao.tipo_ec1.Trim.ToUpper = 'CORES') then
          AllGrades.filterStr('upper(tipo_ec) = %s and descricao_ec = %s ' +
                              'and upper(tipo_ec1) = %s and descricao_ec1 = %s',
                              ['COR'.QuotedString, hwVariacao.descricao_ec.QuotedString,
                               'COR'.ToUpper.QuotedString, hwVariacao.descricao_ec1.QuotedString]);
      end;
    end;

    if (hwVariacao.tipo_ec.Trim() = '') and (hwVariacao.tipo_ec1.Trim() = '') then
    begin
      hwVariacao.cod_grade     := 0;
      hwVariacao.descricao     := '';
      hwVariacao.descricao1    := '';
    end
    else
    begin
      if not AllGrades.IsEmpty then
      begin
        hwVariacao.cod_grade     := AllGrades.fint('cod_grade');
        hwVariacao.descricao     := AllGrades.fstr('descricao');
        hwVariacao.descricao1    := AllGrades.fstr('descricao1');
      end;
    end;

    if (hwVariacao.tipo_ec.Trim() = '') and (hwVariacao.tipo_ec1.Trim() = '') then
      // Não fazer nada
    else
      Result := Result + [hwVariacao];
  end;
  AllVariacoes.filterClear;
end;

function THwNuvemshopServicos.ResolverVariacoesHw(
  nuvemshopVariacoes: TArray<TVariant>; tipoec: string; tipoec1: string): TArray<TVariantHw2>;
var
  nuvemshopVariacao: TVariant;
  hwVariacoes: TArray<TVariantHw2>;
  hwVariacao: TVariantHw2;
begin
  Result := [];

  AllVariacoes.prepare_loop();
  try
    hwVariacoes := THwDbConverter.DataSetToObject<TVariantHw2>(AllVariacoes.DataSet);

    for hwVariacao in hwVariacoes do
    begin
      for nuvemshopVariacao in nuvemshopVariacoes do
      begin
        if Length(nuvemshopVariacao.Values) > 1 then
        begin
          if ((nuvemshopVariacao.Values[0].Pt.Trim = hwVariacao.descricao_ec.Trim)
            and (tipoec.Trim = hwVariacao.tipo_ec.Trim))
            and ((nuvemshopVariacao.Values[1].Pt.Trim = hwVariacao.descricao_ec1.Trim)
            and (tipoec1.Trim = hwVariacao.tipo_ec1.Trim)) then
          begin
            hwVariacao.id := nuvemshopVariacao.id;
            Break;
          end
          else if ((nuvemshopVariacao.Values[0].Pt.Trim = hwVariacao.descricao_ec.Trim)
            and (tipoec.ToUpper.Trim = hwVariacao.tipo_ec.ToUpper.Trim))
            and ((nuvemshopVariacao.Values[1].Pt.Trim = hwVariacao.descricao_ec1.Trim)
            and (tipoec1.Trim = hwVariacao.tipo_ec1.Trim)) then
          begin
            hwVariacao.id := nuvemshopVariacao.id;
            Break;
          end
          else if ((nuvemshopVariacao.Values[0].Pt.Trim = hwVariacao.descricao_ec.Trim)
            and (tipoec.Trim = hwVariacao.tipo_ec.Trim))
            and ((nuvemshopVariacao.Values[1].Pt.Trim = hwVariacao.descricao_ec1.Trim)
            and (tipoec1.ToUpper.Trim = hwVariacao.tipo_ec1.ToUpper.Trim)) then
          begin
            hwVariacao.id := nuvemshopVariacao.id;
            Break;
          end
          else if ((nuvemshopVariacao.Values[0].Pt.Trim = hwVariacao.descricao_ec.Trim)
            and (tipoec.ToUpper.Trim = hwVariacao.tipo_ec.ToUpper.Trim))
            and ((nuvemshopVariacao.Values[1].Pt.Trim = hwVariacao.descricao_ec1.Trim)
            and (tipoec1.ToUpper.Trim = hwVariacao.tipo_ec1.ToUpper.Trim)) then
          begin
            hwVariacao.id := nuvemshopVariacao.id;
            Break;
          end
          else if ((tipoec.ToUpper.Trim = 'COR')
            and (nuvemshopVariacao.Values[0].Pt.Trim = hwVariacao.descricao_ec.Trim)
            and ('CORES'.Trim = hwVariacao.tipo_ec.ToUpper.Trim))
            and ((nuvemshopVariacao.Values[1].Pt.Trim = hwVariacao.descricao_ec1.Trim)
            and (tipoec1.Trim = hwVariacao.tipo_ec1.Trim)) then
          begin
            hwVariacao.id := nuvemshopVariacao.id;
            Break;
          end
          else if ((tipoec.ToUpper.Trim = 'CORES')
            and (nuvemshopVariacao.Values[0].Pt.Trim = hwVariacao.descricao_ec.Trim)
            and ('COR'.Trim = hwVariacao.tipo_ec.ToUpper.Trim))
            and ((nuvemshopVariacao.Values[1].Pt.Trim = hwVariacao.descricao_ec1.Trim)
            and (tipoec1.Trim = hwVariacao.tipo_ec1.Trim)) then
          begin
            hwVariacao.id := nuvemshopVariacao.id;
            Break;
          end
          else if ((tipoec1.ToUpper.Trim = 'COR')
            and (nuvemshopVariacao.Values[0].Pt.Trim = hwVariacao.descricao_ec.Trim)
            and (tipoec.Trim = hwVariacao.tipo_ec.Trim))
            and ((nuvemshopVariacao.Values[1].Pt.Trim = hwVariacao.descricao_ec1.Trim)
            and ('CORES'.Trim = hwVariacao.tipo_ec1.ToUpper.Trim)) then
          begin
            hwVariacao.id := nuvemshopVariacao.id;
            Break;
          end
          else if ((tipoec1.ToUpper.Trim = 'CORES')
            and (nuvemshopVariacao.Values[0].Pt.Trim = hwVariacao.descricao_ec.Trim)
            and (tipoec.Trim = hwVariacao.tipo_ec.Trim))
            and ((nuvemshopVariacao.Values[1].Pt.Trim = hwVariacao.descricao_ec1.Trim)
            and ('COR'.Trim = hwVariacao.tipo_ec1.ToUpper.Trim)) then
          begin
            hwVariacao.id := nuvemshopVariacao.id;
            Break;
          end
          else if ((tipoec.ToUpper.Trim = 'COR') and (tipoec1.ToUpper.Trim = 'COR')
            and (nuvemshopVariacao.Values[0].Pt.Trim = hwVariacao.descricao_ec.Trim)
            and ('CORES'.Trim = hwVariacao.tipo_ec.ToUpper.Trim))
            and ((nuvemshopVariacao.Values[1].Pt.Trim = hwVariacao.descricao_ec1.Trim)
            and ('CORES'.Trim = hwVariacao.tipo_ec1.ToUpper.Trim)) then
          begin
            hwVariacao.id := nuvemshopVariacao.id;
            Break;
          end
          else if ((tipoec.ToUpper.Trim = 'CORES') and (tipoec1.ToUpper.Trim = 'CORES')
            and (nuvemshopVariacao.Values[0].Pt.Trim = hwVariacao.descricao_ec.Trim)
            and ('COR'.Trim = hwVariacao.tipo_ec.ToUpper.Trim))
            and ((nuvemshopVariacao.Values[1].Pt.Trim = hwVariacao.descricao_ec1.Trim)
            and ('COR'.Trim = hwVariacao.tipo_ec1.ToUpper.Trim)) then
          begin
            hwVariacao.id := nuvemshopVariacao.id;
            Break;
          end
        end
        else if Length(nuvemshopVariacao.Values) > 0 then
        begin
          if ((nuvemshopVariacao.Values[0].Pt.Trim = hwVariacao.descricao_ec.Trim)
            and (tipoec.Trim = hwVariacao.tipo_ec.Trim)) then
          begin
            hwVariacao.id := nuvemshopVariacao.id;
            Break;
          end
          else if ((nuvemshopVariacao.Values[0].Pt.Trim = hwVariacao.descricao_ec.Trim)
            and (tipoec.ToUpper.Trim = hwVariacao.tipo_ec.ToUpper.Trim)) then
          begin
            hwVariacao.id := nuvemshopVariacao.id;
            Break;
          end
          else if ((tipoec.ToUpper.Trim = 'COR')
            and (nuvemshopVariacao.Values[0].Pt.Trim = hwVariacao.descricao_ec.Trim)
            and ('CORES'.Trim = hwVariacao.tipo_ec.ToUpper.Trim)) then
          begin
            hwVariacao.id := nuvemshopVariacao.id;
            Break;
          end
          else if ((tipoec.ToUpper.Trim = 'CORES')
            and (nuvemshopVariacao.Values[0].Pt.Trim = hwVariacao.descricao_ec.Trim)
            and ('COR'.Trim = hwVariacao.tipo_ec.ToUpper.Trim)) then
          begin
            hwVariacao.id := nuvemshopVariacao.id;
            Break;
          end;
        end;
      end;

      if hwVariacao.id > 0 then
        Result := Result + [hwVariacao];

    end;
  finally
    AllVariacoes.prepare_loop_done;
  end;
end;

function THwNuvemshopServicos.VincularCategoria(nuvemshopCategoria: TCategory;
  hwId: Integer): Boolean;
begin
  if not conectar(DataBasePath, True)  then
    Exit;

  try

    try

      with SqlExec('update categoria set id_commerce = %d, descricao = %s' +
                   ' where cod_categoria = %d and cod_empresa = %d',
                   [nuvemshopCategoria.id, nuvemshopCategoria.name.Pt.Substring(0, 50).Trim.QuotedString, hwId, CodEmpresa]).Transaction do
        if InTransaction then
          Commit;

      Result := True;

      Auditor.Sucesso.GravarMensagem('E-commerce %d %s', [nuvemshopCategoria.id, nuvemshopCategoria.name.Pt.Trim.Substring(0, 50)]);

    except on E: Exception do
      begin
        Result := False;
        LogError('THwNuvemshopServicos.VincularCategoria. nuvemshop %d %s HwId %d. Erro: %s', [nuvemshopCategoria.id, nuvemshopCategoria.name.ToString.Trim, hwId, e.Message]);
        if not SilentMod then
          ShowErro('Erro ao vincular Categoria. %s',  [e.Message]);
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwNuvemshopServicos.VincularProduto(nuvemshopProduto: TProduct;
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
  vcodcategoria_adc: Integer;
  servicoTmp: THwNuvemshopServicos;
  nuvemshopProd: TProduct;
  nuvemshopCat: TCategory;
  nuvemshopCatPai: TCategory;
  hwCategAdc: TCategoria_class;
  vcodgrade: Integer;
  vtipoVar1, vtipoVar2: string;
  vdescricaoVar1, vdescricaoVar2: string;
  variacoes: TArray<TVariant>;
  value: TValues;
  path: string;
  vimagensProd: string;
  vGradeEncontrada: boolean;
  QrAux2: TIBQuery;
  vStringListCategorias: TStringList;
  inserir: Boolean;
  vPesoBruto, vPesoLiquido, vAltura, vLargura, vComprimento: Double;
  vStringListImagens: TStringList;
  vformatos: string;
  I: Integer;
  vCodigoImg: Integer;
  vMD5: string;

  function produtoTemImagem: string;
  begin
    QrAux.Close;
    QrAux.SQL.Text := ' select pr.grupo_prod, pr.cod_prod, 0 cod_grade, img.lista_imagens, img.url_imagens from produtos pr ' +
      ' left join retorna_img_prod (pr.grupo_prod, pr.cod_prod, 0, pr.cod_empresa) img on 1 = 1 ' +
      ' where pr.grupo_prod = :grupo_prod ' +
      ' and pr.cod_prod = :cod_prod ' +
      ' and pr.cod_empresa = :cod_empresa ' +
      ' union all ' +
      ' select pr.grupo_prod, pr.cod_prod, cg.cod_grade, img.lista_imagens, img.url_imagens from produtos pr ' +
      ' left join cod_grade_prod cg on ' +
      '   cg.grupo_prod = pr.grupo_prod ' +
      '   and cg.cod_prod = pr.cod_prod ' +
      '   and cg.cod_empresa = pr.cod_empresa ' +
      '   and cg.cod_grade > 0 ' +
      ' left join retorna_img_prod (pr.grupo_prod, pr.cod_prod, cg.cod_grade, pr.cod_empresa) img on 1 = 1 ' +
      ' where pr.grupo_prod = :grupo_prod ' +
      ' and pr.cod_prod = :cod_prod ' +
      ' and pr.cod_empresa = :cod_empresa ' ;
    QrAux.ParamByName('grupo_prod').AsInteger := hwGrupoProd;
    QrAux.ParamByName('cod_prod').AsString := hwCodProd;
    QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
    QrAux.Open;

    Result := IfThen(QrAux.IsEmpty, 'N', 'S');
  end;

  function utilizaImagemERP(pGrupoProd: Integer;
    pCodProd: string): boolean;
  begin
    Result := False;

    try
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

      if QrAux.Transaction.InTransaction then
        QrAux.Transaction.Commit;

      Result := true;
    except on E: Exception do
      begin
        FrmNuvemshopCadastros.IdHTTP.Disconnect;
        if QrAux.Transaction.InTransaction then
          QrAux.Transaction.Rollback;
        Result := False;
        LogError('utilizaImagemERP. Erro: %s', [e.Message]);
        if not SilentMod then
          ShowErro('Erro ao utilizar imagem. %s',  [e.Message]);
      end;
    end;
  end;

  function adicionarImagemEC(pGrupoProd: Integer;
    pCodProd: string;
    product: TProduct): boolean;
  var
    vStringListImagens: TStringList;
    path: string;
    I: Integer;
    vformatos: string;
  begin
    Result := False;

    try
      vStringListImagens := TStringList.Create;

      vformatos := '';
      path := IncludeTrailingPathDelimiter(TConfig_sistema_class.getConf('prod_cad_diretorio_padrao_imagens', QrAux, CodEmpresa).value1_vc.Trim);

      vStringListImagens.Clear;
      for I := 0 to Length(product.Images) - 1 do
        if (UpperCase(ExtractFileExt(product.Images[I].Src)) = '.JPG') or (UpperCase(ExtractFileExt(product.Images[I].Src)) = '.JPEG') then
          vStringListImagens.Add(FrmNuvemshopCadastros.baixarImagens(path, product.Images[I].Src))
        else
        begin
          vformatos := vformatos +
            IfThen(trim(vformatos) = '', '', ', ') +
            UpperCase(ExtractFileExt(product.Images[I].Src));
          ShowErro('Formato das imagens deste produto do E-Commerce não suportado no ERP:' + #13 + #13 + vformatos);
          testarImagem := false;
          exit;
        end;

      if vStringListImagens.Count > 0 then
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

        if QrAux.Transaction.InTransaction then
          QrAux.Transaction.Commit;
      end;
      FrmNuvemshopCadastros.IdHTTP.Disconnect;
      Result := true;
    except on E: Exception do
      begin
        FrmNuvemshopCadastros.IdHTTP.Disconnect;
        if QrAux.Transaction.InTransaction then
          QrAux.Transaction.Rollback;
        Result := False;
        LogError('adicionarImagemEC. Erro: %s', [e.Message]);
        if not SilentMod then
          ShowErro('Erro ao adicionar imagem. %s',  [e.Message]);
      end;
    end;
  end;

  function abreFormImagem(pGrupoProd: Integer;
    pCodProd: string;
    product: TProduct): boolean;
  var
    formulario: TFrmNuvemshopPadrao;
  begin
    try
      formulario := TFrmNuvemshopPadrao.Create(Application);
      formulario.Width := 620;
      formulario.Height := 500;
      formulario.Position := poScreenCenter;
      formulario.Caption := 'Selecione uma opção';
      FrmNuvemshopCadastros.pnImagens.Parent := formulario;
      FrmNuvemshopCadastros.pnDetImg.Visible := false;
      FrmNuvemshopCadastros.pbprogresso.Visible := false;
      formulario.AutoSize := True;
      formulario.AutoScroll := False;
      formulario.Position := poScreenCenter;
      result := (formulario.ShowModal = IDOK);
    finally
      if result then
      begin
        if FrmNuvemshopCadastros.RadioGroupOpcao.ItemIndex = 0 then
        begin
          FrmNuvemshopCadastros.pbprogresso.Position := 0;
          FrmNuvemshopCadastros.pnDetImg.Visible := true;
          FrmNuvemshopCadastros.pbprogresso.Visible := true;

          adicionarImagemEC(pGrupoProd, pCodProd, product);
        end
        else
        begin
          utilizaImagemERP(
            pGrupoProd,
            pCodProd);
        end;
      end;

      FrmNuvemshopCadastros.pnImagens.Parent := FrmNuvemshopCadastros.ts_Imagens;
      formulario.Free;
      formulario := nil;
    end;
  end;


begin
  testarImagem := true;
  if not Auditor.Alterar.Table(tbProduto).Processo('PRO385')
         .Key('%d-%s', [hwGrupoProd, hwCodProd])
         .Msg('Prod Sistema %d-%s, E-commerce %d', [hwGrupoProd, hwCodProd, nuvemshopProduto.id])
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

    nuvemshopProd := nuvemshopConsumeApi.GetItem<TProduct>('products/' + nuvemshopProduto.id.ToString, []);

    vPesoBruto   := 0;
    vPesoLiquido := 0;
    vAltura      := 0;
    vLargura     := 0;
    vComprimento := 0;
    vprecosobconsulta := 'N';
    if Length(nuvemshopProd.Variants) > 0 then
    begin
      if Length(nuvemshopProd.Variants[0].Values) <= 0 then
      begin
        //Peso Bruto
        vPesoBruto   := StrToFloat(IfThen(nuvemshopProd.Variants[0].Weight = Null,
          '0',
          StringReplace(nuvemshopProd.Variants[0].Weight, '.', ',', [rfIgnoreCase])));

        //Peso Liquido
        vPesoLiquido := StrToFloat(IfThen(nuvemshopProd.Variants[0].Weight = Null,
          '0',
          StringReplace(nuvemshopProd.Variants[0].Weight, '.', ',', [rfIgnoreCase])));

        //Altura
        vAltura      := StrToFloat(IfThen(nuvemshopProd.Variants[0].Height = Null,
          '0',
          StringReplace(nuvemshopProd.Variants[0].Height, '.', ',', [rfIgnoreCase])));

        //Largura
        vLargura     := StrToFloat(IfThen(nuvemshopProd.Variants[0].Width = Null,
          '0',
          StringReplace(nuvemshopProd.Variants[0].Width, '.', ',', [rfIgnoreCase])));

        //Comprimento
        vComprimento := StrToFloat(IfThen(nuvemshopProd.Variants[0].Dept = Null,
          '0',
          StringReplace(nuvemshopProd.Variants[0].Dept, '.', ',', [rfIgnoreCase])));

        vPrecoSobConsulta := IfThen(nuvemshopProd.Variants[0].Price.Trim = '0.00',
          'S', IfThen(nuvemshopProd.Variants[0].Price.Trim = '0', 'S', 'N'));
      end;
    end;

    vdescrprod := nuvemshopProd.name.Pt.Substring(0, 131).Trim;
    vdisponivel := IfThen(not nuvemshopProd.&Published, 'N', 'S');
    vpromocional := 'N';
    vfretegratis := IfThen(nuvemshopProd.FreeShipping, 'N', 'S');
    vvirtual := IfThen(nuvemshopProd.RequiresShipping, 'N', 'S');
    vlancamento := 'N';
    vdestaque := 'N';
    vvariacao := IfThen(Length(nuvemshopProd.Variants) <= 1, 'N', 'S');
    vdescrprodcompl := nuvemshopProd.Description.Pt;    
    vcodcategoria := 0;
    vcodcategoria_adc := 0;
    vimagens := IfThen(Length(nuvemshopProd.Images) <= 0, 'N', 'S');
    vimagensProd := produtoTemImagem;

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

    if ((hwPeso_brut_prod <= 0) and (vPesoBruto <= 0) and (hwPeso_liq_prod <= 0) and (vPesoLiquido <= 0))
      or ((hwAltura_prod <= 0) and (vAltura <= 0))
      or ((hwComprimento_prod <= 0) and (vComprimento <= 0))
      or ((hwLargura_prod <= 0) and (vLargura <= 0)) then
    begin
      ShowAtencao('Para vincular o produto é necessário ter informações do peso bruto, peso líquido, altura, comprimento e largura.' + #13 + #13 +
        'Favor informar antes de continuar.');
      exit;
    end;


    try
      vStringListCategorias := TStringList.Create;
      vStringListCategorias.Clear;
      if Length(nuvemshopProd.Categories) > 0 then
      begin
        for I := 0 to Length(nuvemshopProd.Categories) - 1 do
        begin
          vcodcategoria_adc := 0;
          with SqlOpen(' select cod_categoria, cod_empresa, ' +
            ' descricao, cod_categoria_pai, id_commerce from categoria ' +
            ' where id_commerce = ' + IntToStr(nuvemshopProd.Categories[I].Id) +
            ' and cod_empresa = ' + IntToStr(CodEmpresa)) do
          begin
            if FieldByName('cod_categoria').AsInteger > 0 then
              vcodcategoria_adc := FieldByName('cod_categoria').AsInteger;

            if vcodcategoria_adc <= 0 then
            begin
              ShowAtencao('Categoria' + #13 +
                'Id: ' + IntToStr(nuvemshopProd.Categories[I].Id) + #13 +
                'Descrição: ' + trim(nuvemshopProd.Categories[I].Name.Pt) + #13 + #13 +
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

        variacoes := nuvemshopConsumeApi.Get<TVariant>('products/' + nuvemshopProd.Id.ToString + '/variants', 'Variants', nil);

        for I := 0 to Length(variacoes) - 1 do
        begin
          if Length(variacoes[I].Values) > 0 then
          begin
            vcodgrade := 0;
            vtipoVar1 := '';
            vtipoVar2 := '';
            vdescricaoVar1 := '';
            vdescricaoVar2 := '';

            if (trim(vtipoVar1) = '')
              and (Length(nuvemshopProd.Attributes) > 0)
              and (Length(variacoes[I].Values) > 0) then
            begin
              vtipoVar1 := Trim(nuvemshopProd.Attributes[0].Pt);
              vdescricaoVar1 := Trim(variacoes[I].Values[0].Pt);
            end;

            if (trim(vtipoVar2) = '')
              and (Length(nuvemshopProd.Attributes) > 1)
              and (Length(variacoes[I].Values) > 1) then
            begin
              vtipoVar2 := Trim(nuvemshopProd.Attributes[1].Pt);
              vdescricaoVar2 := Trim(variacoes[I].Values[1].Pt);
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
      end;

      if (vimagens = 'S') and (vimagensProd = 'S') then
      begin
        if not abreFormImagem(
          hwGrupoProd,
          hwCodProd,
          nuvemshopProduto) then
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
          nuvemshopProduto) then
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
          hwCodProd) then
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
          QrAux.ParamByName('peso_brut_prod').AsFloat := vPesoBruto
        else if vPesoLiquido > 0 then
          QrAux.ParamByName('peso_brut_prod').AsFloat := vPesoLiquido
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
          QrAux.ParamByName('peso_liq_prod').AsFloat := vPesoLiquido
        else if vPesoBruto > 0 then
          QrAux.ParamByName('peso_liq_prod').AsFloat := vPesoBruto
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
        ' :promocional, :frete_gratis, :lancamento, :destaque, :variacao, ' +
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
      QrAux.ParamByName('cod_categoria').Value := Null;
      QrAux.ParamByName('id_commerce').AsInteger := nuvemshopProduto.id;
      QrAux.ExecSQL;

      if Length(variacoes) > 0 then
      begin
        if (Length(variacoes[0].Values) <= 0) then
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
          QrAux.ParamByName('cod_grade').AsInteger := 0;
          QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
          QrAux.ParamByName('id_commerce').AsInteger := nuvemshopProd.Variants[0].Id;
          QrAux.ParamByName('sinc_ecommerce').AsString := 'S';
          QrAux.ExecSQL;
        end;

        for I := 0 to Length(variacoes) - 1 do
        begin
          if (Length(variacoes[I].Values) > 0) and (variacoes[I].cod_grade_temp > 0) then
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
            QrAux.ParamByName('id_commerce').AsInteger := variacoes[I].Id;
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
      QrAux.ParamByName('id_commerce').AsInteger := nuvemshopProduto.id;
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

      Auditor.Sucesso.GravarMensagem('E-commerce %d %s', [nuvemshopProduto.id, nuvemshopProduto.name.Pt.Substring(0, 50)]);

    except on E: Exception do
      begin
        Result := False;
        LogError('THwNuvemshopServicos.VincularProduto. nuvemshop %d GrupoProd %d Cod Prod %s. Erro: %s', [nuvemshopProduto.Id, hwGrupoProd, hwCodProd, e.Message]);
        if not SilentMod then
          ShowErro('Erro ao vincular Produtos. %s',  [e.Message]);
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwNuvemshopServicos.VincularVariacoes(nuvemshopVariacoes: TVariant;
  hwGrupo: Integer; hwCodProd: string; hwCodGrade: Integer): Boolean;
begin
  if not conectar(DataBasePath, True)  then
    Exit;

  try

    try

      with SqlExec('update or insert into produtos_ec_grade (grupo_prod, cod_prod, cod_grade, cod_empresa, id_commerce, sinc_ecommerce) ' +
        ' values (%d, %s, %d, %d, %d, %S) ' +
        ' matching (grupo_prod, cod_prod, cod_grade, cod_empresa) ',
         [hwGrupo, QuotedStr(hwCodProd), hwCodGrade, CodEmpresa, nuvemshopVariacoes.id, QuotedStr('S')]).Transaction do
        if InTransaction then
          Commit;

      Result := True;

      if Length(nuvemshopVariacoes.Values) > 0 then
        Auditor.Sucesso.GravarMensagem('E-commerce %d %s', [nuvemshopVariacoes.id, QuotedStr(nuvemshopVariacoes.Values[0].Pt)])
      else
        Auditor.Sucesso.GravarMensagem('E-commerce %d %s', [nuvemshopVariacoes.id, QuotedStr('PRODUTO')]);

    except on E: Exception do
      begin
        Result := False;
        if Length(nuvemshopVariacoes.Values) > 0 then
          LogError('THwNuvemshopServicos.VincularVariacoes. nuvemshop %d %s HwGrupo %d HwCodProd %s HwCodGrade %d. Erro: %s',
            [nuvemshopVariacoes.id, nuvemshopVariacoes.Values[0], hwGrupo, hwCodProd, hwCodGrade, e.Message])
        else
          LogError('THwNuvemshopServicos.VincularVariacoes. nuvemshop %d %s HwGrupo %d HwCodProd %s HwCodGrade %d. Erro: %s',
            [nuvemshopVariacoes.id, 'PRODUTO', hwGrupo, hwCodProd, hwCodGrade, e.Message]);
        if not SilentMod then
          ShowErro('Erro ao vincular Variacoes. %s',  [e.Message]);
      end;
    end;

  finally
    desconectar;
  end;
end;

procedure THwNuvemshopServicos._GravaConfiguracoesInteger(NomeVariavel: string;
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

function THwNuvemshopServicos._LerConfiguracoesRegistroInteger(
  NomeVariavel: string; Adefault: Integer): Integer;
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

end.
