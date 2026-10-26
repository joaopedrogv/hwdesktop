unit ResolverRegraFiscalIbsCbsServiceUnit;

interface

uses
  IResolverRegraFiscalIbsCbsServiceUnit,
  ResolverRegraFiscalIbsCbsTypesUnit,
  OperacaoFiscalIbsCbsCondicaoEtdUnit,
  IOperacoesFiscaisIbsCbsRepositoryUnit,
  IRegrasFiscaisIbsCbsRepositoryUnit,
  OperacaoFiscalIbsCbsEtdUnit,
  RegraFiscalIbsCbsEtdUnit;

type
  ResolverRegraFiscalIbsCbsService = class(TInterfacedObject, IResolverRegraFiscalIbsCbsService)
  private
    FOperacoesFiscaisIbsCbsRepo: IOperacoesFiscaisIbsCbsRepository;
    FRegrasFiscaisIbsCbsRepo: IRegrasFiscaisIbsCbsRepository;

    function CondicaoSatisfeita(const Condicao: OperacaoFiscalIbsCbsCondicaoEtd;
      const Input: ResolverRegraFiscalIbsCbsInput): Boolean;
    function TodasCondicoesSatisfeitas(const Condicoes: OperacaoFiscalIbsCbsCondicaoEtdArray;
      const Input: ResolverRegraFiscalIbsCbsInput): Boolean;
  public
    constructor Create(
      OperacoesFiscaisIbsCbsRepo: IOperacoesFiscaisIbsCbsRepository;
      RegrasFiscaisIbsCbsRepo: IRegrasFiscaisIbsCbsRepository
    );

    function Executar(const Input: ResolverRegraFiscalIbsCbsInput): RegraFiscalIbsCbsEtd; 
  end;

implementation

{ ResolverRegraFiscalIbsCbsService }

function ResolverRegraFiscalIbsCbsService.TodasCondicoesSatisfeitas(
  const Condicoes: OperacaoFiscalIbsCbsCondicaoEtdArray;
  const Input: ResolverRegraFiscalIbsCbsInput
): Boolean;
var
  j: Integer;
begin
  Result := False;
  for j := Low(Condicoes) to High(Condicoes) do
  begin
    if not CondicaoSatisfeita(Condicoes[j], Input) then
      Exit;
  end;
  Result := True;
end;

function ResolverRegraFiscalIbsCbsService.CondicaoSatisfeita(
  const Condicao: OperacaoFiscalIbsCbsCondicaoEtd;
  const Input: ResolverRegraFiscalIbsCbsInput
): Boolean;
begin
  case Condicao.Tipo of
    ofctEnteGovernamentalAny: ;
    ofctEnteGovernamentalUniao: ;
    ofctEnteGovernamentalUF: ;
    ofctEnteGovernamentalMunicipio: ;
  else
    Result := False;
  end;
end;

constructor ResolverRegraFiscalIbsCbsService.Create(
  OperacoesFiscaisIbsCbsRepo: IOperacoesFiscaisIbsCbsRepository;
  RegrasFiscaisIbsCbsRepo: IRegrasFiscaisIbsCbsRepository
);
begin
  FOperacoesFiscaisIbsCbsRepo := OperacoesFiscaisIbsCbsRepo;
  FRegrasFiscaisIbsCbsRepo := RegrasFiscaisIbsCbsRepo;
end;

function ResolverRegraFiscalIbsCbsService.Executar(const Input: ResolverRegraFiscalIbsCbsInput): RegraFiscalIbsCbsEtd;
var
  candidatos: OperacaoFiscalIbsCbsEtdList;
  I: Integer;
begin

  // o repositorio talvez precise de um campo de ordem, caso contrario precisarei ordenar aqui
  candidatos := FOperacoesFiscaisIbsCbsRepo.GetByOpInternaGrupoFiscal(
    Input.OperacaoInternaId,
    Input.GrupoFiscalId,
    Input.EmpresaId,
    Input.Data
  );

  try

    for I := 0 to candidatos.Count - 1 do
    begin
      if TodasCondicoesSatisfeitas(OperacaoFiscalIbsCbsEtd(Candidatos[i]).Condicoes, Input) then
      begin
        Result := FRegrasFiscaisIbsCbsRepo.GetById(OperacaoFiscalIbsCbsEtd(Candidatos[i]).RegraFiscalId);
        Exit;
      end;
    end;

    Result := nil;

  finally
    candidatos.Free;
  end;
end;

end.
