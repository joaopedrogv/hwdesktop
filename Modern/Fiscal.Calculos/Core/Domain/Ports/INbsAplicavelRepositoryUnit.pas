unit INbsAplicavelRepositoryUnit;

interface

uses      
  CacheableRepositoryUnit,
  NbsAplicavelEtdUnit,
  NbsEtdUnit,
  TipoComunsUnit;

type                    
  {$IFDEF INTF_ON}
  INbsAplicavelRepository = interface
    ['{FE4362A0-B4E8-4EB8-95E9-4D4384F0A264}']
    function ObterPorNbseClassificacaoId(NCM: string; ClassificacaoId: Integer; Data: TDate): NbssAplicaveisEtd;
    function ExistePorClassificacaoId(ClassificacaoId: Integer; Data: TDate): Boolean;
    /// <summary>
    ///   Java equivalente: NbsAplicavelRepository.temNbsAplicavel.
    ///   Existencia de NBS_APLICAVEL vigente para o prefixo NBS e a classificacao/data.
    /// </summary>
    function TemNbsAplicavel(const Nbs: string; ClassificacaoId: Integer; Data: TDate): Boolean;
    /// <summary>
    ///   Java equivalente: NbsAplicavelRepository.temExcecaoNbsAplicavel.
    ///   Existencia de excecao vigente, independentemente da vigencia da linha NBS_APLICAVEL.
    /// </summary>
    function TemExcecaoNbsAplicavel(const Nbs: string; ClassificacaoId: Integer; Data: TDate): Boolean;
    /// <summary>
    ///   Java equivalente: NbsAplicavelRepository.temNbsAplicavelSemExcecao.
    ///   Aplicabilidade vigente combinada com a ausencia de excecao vigente.
    /// </summary>
    function TemNbsAplicavelSemExcecao(const Nbs: string; ClassificacaoId: Integer; Data: TDate): Boolean;
    function ListarNbsAplicaveisPorClassificacao(ClassificacaoId: Integer; Data: TDate): NbssEtd;
    function ListarClassificacaoAplicavelPorNbs(const Nbs: string; Data: TDate): TArrayString;
    function ExisteVinculoParaClassificacao(ClassificacaoId: Integer): Boolean;
  end;
  {$ELSE}
  INbsAplicavelRepository = class(CacheableRepository)
  public
    function ObterPorNbseClassificacaoId(NCM: string; ClassificacaoId: Integer; Data: TDate): NbssAplicaveisEtd; virtual; abstract;
    function ExistePorClassificacaoId(ClassificacaoId: Integer; Data: TDate): Boolean; virtual; abstract;
    // Metodos Java equivalentes (temNbsAplicavel / temExcecaoNbsAplicavel /
    // temNbsAplicavelSemExcecao) e C06-04 nao abstratos (defaults seguros) para
    // preservar os test doubles existentes sem alteracao fora do escopo do incremento.
    function TemNbsAplicavel(const Nbs: string; ClassificacaoId: Integer; Data: TDate): Boolean; virtual;
    function TemExcecaoNbsAplicavel(const Nbs: string; ClassificacaoId: Integer; Data: TDate): Boolean; virtual;
    function TemNbsAplicavelSemExcecao(const Nbs: string; ClassificacaoId: Integer; Data: TDate): Boolean; virtual;
    function ListarNbsAplicaveisPorClassificacao(ClassificacaoId: Integer; Data: TDate): NbssEtd; virtual;
    function ListarClassificacaoAplicavelPorNbs(const Nbs: string; Data: TDate): TArrayString; virtual;
    function ExisteVinculoParaClassificacao(ClassificacaoId: Integer): Boolean; virtual;
  end;
  {$ENDIF}

implementation

{$IFNDEF INTF_ON}
function INbsAplicavelRepository.TemNbsAplicavel(const Nbs: string; ClassificacaoId: Integer; Data: TDate): Boolean;
begin
  Result := False;
end;

function INbsAplicavelRepository.TemExcecaoNbsAplicavel(const Nbs: string; ClassificacaoId: Integer; Data: TDate): Boolean;
begin
  Result := False;
end;

function INbsAplicavelRepository.TemNbsAplicavelSemExcecao(const Nbs: string; ClassificacaoId: Integer; Data: TDate): Boolean;
begin
  Result := False;
end;

function INbsAplicavelRepository.ListarNbsAplicaveisPorClassificacao(ClassificacaoId: Integer; Data: TDate): NbssEtd;
begin
  Result := nil;
end;

function INbsAplicavelRepository.ListarClassificacaoAplicavelPorNbs(const Nbs: string; Data: TDate): TArrayString;
begin
  SetLength(Result, 0);
end;

function INbsAplicavelRepository.ExisteVinculoParaClassificacao(ClassificacaoId: Integer): Boolean;
begin
  Result := False;
end;
{$ENDIF}

end.
