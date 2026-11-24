unit EventoDFeEnvelopeResolverUnit;

interface

uses
  IEmpresasRepositoryUnit,
  EventoDFeTransmissaoTypesUnit;

type
  IEventoDFeEnvelopeResolver = interface
    ['{3A7C1E94-5B2D-4F86-9C10-8E4D7A2F6B53}']
    function Resolver(const ARequisicao: TEventoDFeRequisicaoPreparo):
      TEventoDFeRequisicaoPreparo;
  end;

  EventoDFeEnvelopeResolver = class(TInterfacedObject,
    IEventoDFeEnvelopeResolver)
  private
    FEmpresas: IEmpresasRepository;
  public
    constructor Create(const AEmpresas: IEmpresasRepository);
    function Resolver(const ARequisicao: TEventoDFeRequisicaoPreparo):
      TEventoDFeRequisicaoPreparo;
  end;

implementation

uses
  SysUtils,
  EmpresaEtdUnit,
  EstadosServiceUnit,
  StringServiceUnit,
  EValidacaoNegocioUnit,
  TipoEventoDFeUnit;

const
  TAMANHO_CNPJ = 14;

{ EventoDFeEnvelopeResolver }

constructor EventoDFeEnvelopeResolver.Create(const AEmpresas: IEmpresasRepository);
begin
  inherited Create;

  FEmpresas := AEmpresas;
end;

function EventoDFeEnvelopeResolver.Resolver(
  const ARequisicao: TEventoDFeRequisicaoPreparo):
  TEventoDFeRequisicaoPreparo;
var
  LEmpresa: EmpresaEtd;
  LUf: string;
  LCodigoUf: Integer;
begin
  Result := ARequisicao;

  LEmpresa := FEmpresas.GetByKey(ARequisicao.CodEmpresa);

  if LEmpresa = nil then
    raise EValidacaoNegocio.Create('Empresa do evento não encontrada.');

  try
    LUf := EstadosService.MunicipioIbgeToUF(LEmpresa.CMunIbge);

    if LUf = '' then
      raise Exception.Create(
        'O município da empresa não permite identificar a UF. Revise o cadastro da empresa.');

    LCodigoUf := EstadosService.UfToCodigoIBGE(LUf);

    if LCodigoUf <= 0 then
      raise Exception.Create(
        'UF da empresa não identificada. Revise o cadastro da empresa.');

    Result.Uf := LUf;
    Result.Cnpj := StringService.OnlyNumber(LEmpresa.CNPJ);

    if Length(Result.Cnpj) <> TAMANHO_CNPJ then
      raise Exception.Create(
        'O CNPJ da empresa não está completo. Revise o cadastro da empresa.');

    Result.COrgao := LCodigoUf;
    Result.COrgaoAutor := LCodigoUf;
    Result.TpAutor := TipoEventoDFeTpAutor(ARequisicao.TipoEvento);

    if Result.TpAutor <= 0 then
      raise Exception.CreateFmt(
        'Tipo de evento DF-e sem autor definido: %d.',
        [TipoEventoDFeCodigo(ARequisicao.TipoEvento)]);
  finally
    LEmpresa.Free;
  end;
end;

end.
