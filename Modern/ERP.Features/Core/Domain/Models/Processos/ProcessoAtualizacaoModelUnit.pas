unit ProcessoAtualizacaoModelUnit;

interface

type
  ProcessoModel = record
    Codigo: string;
    Descricao: string;
    Nivel: Integer;
    ExigeGerente: Boolean;
    GravaAuditoria: Boolean;
  end;

  ProcessoModelArray = array of ProcessoModel;

  AtualizacaoProcessosModel = record
    UltimaVersao: Integer;
    Processos: ProcessoModelArray;
  end;

implementation

end.
