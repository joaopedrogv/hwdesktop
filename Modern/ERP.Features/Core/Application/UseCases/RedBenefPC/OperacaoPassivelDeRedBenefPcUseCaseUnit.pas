unit OperacaoPassivelDeRedBenefPcUseCaseUnit;

interface

uses
  SysUtils, Classes,
  IOperacaoPassivelDeRedBenefPcUseCaseUnit, InfComplementarDFeEtdUnit, ISessionContextUnit,
  IRegrasRedBenefPcRepositoryUnit, IInfComplementarDFeRepositoryUnit;

type
  OperacaoPassivelDeRedBenefPcUseCase = class(TInterfacedObject, IOperacaoPassivelDeRedBenefPcUseCase)
  private
    FSession: ISessionContext;
    FRegrasRedBenefRepo: IRegrasRedBenefPcRepository;
  public
    constructor Create(
      Session: ISessionContext;
      RegrasRedBenefRepo: IRegrasRedBenefPcRepository
    );

    function Executar(const Input: OperacaoPassivelDeRedBenefPcUseCaseInput): Boolean;
  end;

implementation

uses
  CalculoPisCofinsResultUnit, CalculoPisCofinsInputUnit, RegraRedBenefPcEtdUnit, TipoInfComplementarEnumUnit,
  EValidacaoNegocioUnit;

{ OperacaoPassivelDeRedBenefPcUseCase }

constructor OperacaoPassivelDeRedBenefPcUseCase.Create(
  Session: ISessionContext;
  RegrasRedBenefRepo: IRegrasRedBenefPcRepository
);
begin
  FSession := Session;
  FRegrasRedBenefRepo := RegrasRedBenefRepo;
end;

function OperacaoPassivelDeRedBenefPcUseCase.Executar(const Input: OperacaoPassivelDeRedBenefPcUseCaseInput): Boolean;
var
  Regras: RegraRedBenefPcEtdList;
  I, J: Integer;
begin
  Result := False;
  //Infos := nil;
  Regras := FRegrasRedBenefRepo.ListarRegrasVigentes(FSession.EmpresaId, Input.Data);
  try
    if Regras.Count = 0 then
      Exit;

    for I := 0 to High(Input.Itens) do
      for J := 0 to Regras.Count - 1 do
        if Regras.Items[J].AplicaAoItem(Input.Itens[I].CST, Input.Itens[I].NatRec, Input.Itens[I].NCM) then
        begin
          {
          Infos := FInfComplRepo.ListarPorTipo(ticRedBenefPC);

          if Infos.Count = 0 then
            raise EValidacaoNegocio.CreateFmt(
              'Documento passível de redução de benefício do PIS/COFINS. ' +
              'Nenhuma informação complementar foi encontrada no cadastro com o tipo = "%s".',
              [TipoInfComplementarEnumStr[ticRedBenefPC]]
            );
          }

          Result := True;// InfComplementarDFeEtd(Infos.Extract(Infos[I]));

          Exit;
        end;
  finally
    Regras.Free();
    //Infos.Free();
  end;

end;

end.
