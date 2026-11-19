unit IProcessosRepositoryUnit;

interface

uses
  BaseRepositoryUnit,
  ProcessoAtualizacaoModelUnit;

type
  IProcessosRepository = class(BaseRepository)
  public
    procedure InserirAusentes(const AProcessos: ProcessoModelArray; AEmpresaId: Integer); virtual; abstract;
  end;

implementation

end.
