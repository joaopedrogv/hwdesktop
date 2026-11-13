// Next
unit ColumnLayoutPreferences;

interface

type
  // Order negativo nao e valido. Width <= 0 significa "sem largura informada":
  // Save omite LARGURA_EXIBICAO e preserva a largura ja gravada.
  TColumnLayoutEntry = record
    FieldName: string;
    Visible: Boolean;
    Order: Integer;
    Width: Integer;
  end;

  TColumnLayoutEntries = TArray<TColumnLayoutEntry>;

  // Porta de preferencias de layout de colunas. O usuario e resolvido a cada
  // operacao; o chamador nao informa login nem SQL.
  //
  // Regras do contrato:
  // - Load devolve somente os campos com preferencia visual, ordenados por
  //   Order e FieldName; lista vazia preserva a definicao da consulta.
  // - Save grava todas as entradas em uma unica transacao. Lista vazia nao abre
  //   transacao nem escreve. Dados de exportacao da linha sao preservados.
  // - Reset limpa apenas visibilidade, ordem e largura do login corrente para o
  //   componente, preservando linhas e dados de exportacao.
  // - Nao trunca login, componente ou campo: valida e falha.
  // - Nao conhece grade, dataset nem UI; falhas de validacao e de banco sao
  //   propagadas como excecao e o chamador decide a apresentacao.
  IColumnLayoutPreferences = interface
    ['{7C4E1B90-2D6A-4F38-A5C1-9B0E6D2F7A43}']
    function Load: TColumnLayoutEntries;
    procedure Save(const AEntries: TColumnLayoutEntries);
    procedure Reset;
  end;

implementation

end.
