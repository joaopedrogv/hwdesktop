unit NbsAplicavelServiceUnit;

interface

uses
  ValidacaoOutputUnit,
  INbsAplicavelRepositoryUnit,
  TipoComunsUnit;

type

  INbsAplicavelService = interface
    ['{DE57C39A-E41C-4D13-B993-8E6EEA981CB0}']
    function Validar(const Nbs: string; ClassificacaoId: Integer; Data: TDate; const Tributos: string): ValidacaoOutput;
  end;

  /// <summary>
  ///   Java equivalente: NbsAplicavelService
  /// </summary>
  NbsAplicavelService = class(TInterfacedObject, INbsAplicavelService)
  private
     FNbsAplicavelRepo: INbsAplicavelRepository;
  public
    constructor Create(NbsAplicavelRepo: INbsAplicavelRepository);

    /// <summary>
    ///   Metodo Java equivalente: validarNbsAplicavel.
    /// </summary>
    function Validar(const Nbs: string; ClassificacaoId: Integer; Data: TDate; const Tributos: string): ValidacaoOutput;
  end;

implementation

uses
  SysUtils, ValidacaoItemOutputUnit, CodigosErroValidacao;

{ NbsAplicavelService }

constructor NbsAplicavelService.Create(NbsAplicavelRepo: INbsAplicavelRepository);
begin
  FNbsAplicavelRepo := NbsAplicavelRepo;
end;

function NbsAplicavelService.Validar(
  const Nbs: string;
  ClassificacaoId: Integer;
  Data: TDate;
  const Tributos: string
): ValidacaoOutput;
var
  possuiNbsCompleto, temNbsAplicavel, temExcecaoNbsAplicavel, temNbsAplicavelSemExcecao: Boolean;
  temClassificacaoTributaria: Boolean;
begin

  possuiNbsCompleto := Length(Trim(Nbs)) = 9;

  temClassificacaoTributaria := FNbsAplicavelRepo.ExistePorClassificacaoId( ClassificacaoId, Data );

  if temClassificacaoTributaria and not possuiNbsCompleto then
    Result.Add(ValidacaoItemOutput.Create(ECOD_NBS_COMPLETO_NECESSARIO))

  else if possuiNbsCompleto then
  begin
    /// Java equivalente: repository.temNbsAplicavel, repository.temExcecaoNbsAplicavel e
    ///  repository.temNbsAplicavelSemExcecao. Cada metodo possui cache propria no
    ///  repositorio, preservando a mesma logica observavel do NbsAplicavelService Java.

    temNbsAplicavel := FNbsAplicavelRepo.TemNbsAplicavel( Nbs, ClassificacaoId, Data );
    temExcecaoNbsAplicavel := FNbsAplicavelRepo.TemExcecaoNbsAplicavel( Nbs, ClassificacaoId, Data );
    temNbsAplicavelSemExcecao := FNbsAplicavelRepo.TemNbsAplicavelSemExcecao( Nbs, ClassificacaoId, Data );

    if temNbsAplicavel and temExcecaoNbsAplicavel and not temNbsAplicavelSemExcecao then
      Result.Add(ValidacaoItemOutput.CreateFmt(
        ECOD_NBS_NAO_VINC_CLASSIFICACAO, 'NCM %S - ClassificacaoId %d - %s', [Nbs, ClassificacaoId, Tributos]
      ));

    if temClassificacaoTributaria and not temNbsAplicavel and not temExcecaoNbsAplicavel and not temNbsAplicavelSemExcecao then
      Result.Add(ValidacaoItemOutput.CreateFmt(
        ECOD_NBS_NAO_VINC_CLASSIFICACAO, 'NCM %S - ClassificacaoId %d - %s', [Nbs, ClassificacaoId, Tributos]
      ));
  end;
end;

end.
