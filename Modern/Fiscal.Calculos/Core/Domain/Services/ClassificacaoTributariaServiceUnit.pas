unit ClassificacaoTributariaServiceUnit;

interface

uses
  IClassificacaoTributariaServiceUnit, ClassificacaoTributariaModelUnit, TipoTributoEnumUnit, TipoComunsUnit,
  IClassificacaoTributariaRepositoryUnit, ClassificacaoTributariaCalculoModelUnit;

type
  ClassificacaoTributariaService = class(TInterfacedObject, IClassificacaoTributariaService)
  private
    FClassificacoesRepo: IClassificacaoTributariaRepository;
    function ObterClassificacaoTributaria(
      const CClassTrib: string; TipoTributo: TipoTributoEnum; Data: TDate; Tipo: String
    ): ClassificacaoTributariaModel;
  public
    constructor Create(ClassificacoesRepo: IClassificacaoTributariaRepository);

    function ObterClassificacaoTributariaCbsIbs(const CClassTrib: string; Data: TDate): ClassificacaoTributariaModel;
    function ObterClassificacaoTributariaImpostoSeletivo(const CClassTrib: string; Data: TDate): ClassificacaoTributariaModel;
    function ObterClassificacaoTributariaCalculo(Id: Integer): ClassificacaoTributariaCalculoModel;
  end;

implementation

uses
  SysUtils;

{ ClassificacaoTributariaService }

constructor ClassificacaoTributariaService.Create(ClassificacoesRepo: IClassificacaoTributariaRepository);
begin
  FClassificacoesRepo := ClassificacoesRepo;
end;

function ClassificacaoTributariaService.ObterClassificacaoTributaria(const CClassTrib: string;
  TipoTributo: TipoTributoEnum; Data: TDate; Tipo: String): ClassificacaoTributariaModel;
begin
  Result := FClassificacoesRepo.ObterClassificacaoTributaria(CClassTrib, TipoTributo, Data);

  if Result.IsNull then
    raise Exception.CreateFmt(
      'Classificação tributária não encontrada para código %s e data %s (%s)',
       [ CClassTrib, DateToStr(Data), Tipo ]
    );
end;

function ClassificacaoTributariaService.ObterClassificacaoTributariaCalculo(Id: Integer): ClassificacaoTributariaCalculoModel;
begin
  Result := FClassificacoesRepo.ObterClassificacaoCalculo(Id);

  if Result.IsNull then
    raise Exception.CreateFmt( 'Classificação tributária não encontrada para id %d', [ Id ]);
end;

function ClassificacaoTributariaService.ObterClassificacaoTributariaCbsIbs(const CClassTrib: string;
  Data: TDate): ClassificacaoTributariaModel;
begin
  // Na calculadora versao v0039 simplesmente retorna, por isso comentei o metoque que testava e levantava exceção.
  //Result := Self.ObterClassificacaoTributaria(CClassTrib, tbtCBS, Data, 'CBS e IBS');
  Result := FClassificacoesRepo.ObterClassificacaoTributaria(CClassTrib, tbtCBS, Data);
end;

function ClassificacaoTributariaService.ObterClassificacaoTributariaImpostoSeletivo(const CClassTrib: string;
  Data: TDate): ClassificacaoTributariaModel;
begin
  // Na calculadora versao v0039 simplesmente retorna, por isso comentei o metoque que testava e levantava exceção.
  //Result := Self.ObterClassificacaoTributaria(CClassTrib, tbtIS, Data,  'Imposto Seletivo');
  Result := FClassificacoesRepo.ObterClassificacaoTributaria(CClassTrib, tbtIS, Data);
end;

end.
