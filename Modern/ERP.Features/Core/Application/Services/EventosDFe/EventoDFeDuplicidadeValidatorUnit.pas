unit EventoDFeDuplicidadeValidatorUnit;

interface

uses
  IEventosDFeRepositoryUnit,
  TipoEventoDFeUnit;

procedure ValidarDuplicidadeEventoDFe(const AEventosRepository: IEventosDFeRepository;
  const ACodEmpresa: Integer; const AChaveDocumento: string;
  const ATipoEvento: TipoEventoDFe; const AIdIgnorado: string);

implementation

uses
  SysUtils,
  EventoDFeStatusUnit,
  EventoDFeTransmissaoTypesUnit,
  EValidacaoNegocioUnit;

procedure ValidarDuplicidadeEventoDFe(const AEventosRepository: IEventosDFeRepository;
  const ACodEmpresa: Integer; const AChaveDocumento: string;
  const ATipoEvento: TipoEventoDFe; const AIdIgnorado: string);
var
  LConflito: TEventoDFeConflito;
begin
  LConflito := AEventosRepository.ObterConflitoEvento(ACodEmpresa,
    AChaveDocumento, ATipoEvento, AIdIgnorado);

  if not LConflito.Existe then
    Exit;

  if LConflito.StatusExistente = seEnviando then
    raise EValidacaoNegocio.Create(Format(
      'Já existe o evento nº %d em transmissão para esta chave e tipo. ' +
      'Consulte a situação do evento existente antes de cadastrar outro.',
      [LConflito.SeqIdExistente]));

  raise EValidacaoNegocio.Create(Format(
    'Já existe o evento nº %d não autorizado para esta chave e tipo. ' +
    'Transmita ou exclua logicamente o evento existente antes de cadastrar outro.',
    [LConflito.SeqIdExistente]));
end;

end.
