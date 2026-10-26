unit NcmAplicavelServiceUnit;

interface

uses
  ValidacaoOutputUnit,
  INcmAplicavelRepositoryUnit,
  TipoComunsUnit;

type

  INcmAplicavelService = interface
    ['{3763FAAB-F361-4D80-B144-9417881A4C8A}']
    function Validar(const Ncm: string; ClassificacaoId: Integer; Data: TDate; Tributos: string): ValidacaoOutput;
  end;

  NcmAplicavelService = class(TInterfacedObject, INcmAplicavelService)
  private
     FNcmAplicavelRepo: INcmAplicavelRepository;
  public
    constructor Create(NcmAplicavelRepo: INcmAplicavelRepository);

    function Validar(const Ncm: string; ClassificacaoId: Integer; Data: TDate; Tributos: string): ValidacaoOutput;
  end;

implementation

uses
  SysUtils, NcmAplicavelEtdUnit, ValidacaoItemOutputUnit, CodigosErroValidacao,
  Classes, Contnrs;

{ NcmAplicavelService }

constructor NcmAplicavelService.Create(NcmAplicavelRepo: INcmAplicavelRepository);
begin
  FNcmAplicavelRepo := NcmAplicavelRepo;
end;

function NcmAplicavelService.Validar(
  const Ncm: string;
  ClassificacaoId: Integer;
  Data: TDate;
  Tributos: string
): ValidacaoOutput;
var
  possuiNcmCompleto, existe, existeExcecao, existeSemExcecao: Boolean;
  ncmsAplicaveis: NcmsAplicaveisEtd;
  ncmAplicavel: NcmAplicavelEtd;
  existeNcmClass: Boolean;
  I: Integer;
begin

  possuiNcmCompleto := Length(Trim(Ncm)) = 8;

  existeNcmClass := FNcmAplicavelRepo.ExistePorClassificacaoId( ClassificacaoId, Data );

  if existeNcmClass and not possuiNcmCompleto then
    Result.Add(ValidacaoItemOutput.Create(ECOD_NCM_COMPLETO_NECESSARIO))

  else if possuiNcmCompleto then
  begin
    ncmsAplicaveis := FNcmAplicavelRepo.ObterPorNcmeClassificacaoId( Ncm, ClassificacaoId, Data );
    try
      existe := ncmsAplicaveis.Count > 0;

      existeExcecao := False;
      for I := 0 to ncmsAplicaveis.Count - 1 do
      begin
        ncmAplicavel := NcmAplicavelEtd(ncmsAplicaveis.Items[I]);

        if ncmAplicavel.PossuiExcecao(Ncm, Data) then
        begin
          existeExcecao := True;
          Break;
        end;
      end;

      existeSemExcecao := ncmsAplicaveis.Count > 0;
      for I := 0 to ncmsAplicaveis.Count - 1 do
      begin
        ncmAplicavel := NcmAplicavelEtd(ncmsAplicaveis.Items[I]);

        if ncmAplicavel.NaoPossuiExcecao(Data) then
        begin
          existeSemExcecao := False;
          Break;
        end;
      end;

      if existe and existeExcecao and not existeSemExcecao then
        Result.Add(ValidacaoItemOutput.CreateFmt(
          ECOD_NCM_NAO_VINC_CLASSIFICACAO, 'NCM %S - ClassificacaoId %d - %s', [Ncm, ClassificacaoId, Tributos]
        ));

      if existeNcmClass and not existe and not existeExcecao and not existeSemExcecao then
        Result.Add(ValidacaoItemOutput.CreateFmt(
          ECOD_NCM_NAO_VINC_CLASSIFICACAO, 'NCM %S - ClassificacaoId %d - %s', [Ncm, ClassificacaoId, Tributos]
      ));
    finally
      ncmsAplicaveis.Free();
    end;
  end;
end;

end.
