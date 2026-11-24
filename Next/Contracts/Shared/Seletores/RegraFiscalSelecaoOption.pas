unit RegraFiscalSelecaoOption;

interface

uses
  System.SysUtils;

type
  // Texto ja vem com classificacao e descricao; FimVigencia e valido apenas quando TemFimVigencia.
  TRegraFiscalSelecaoOption = record
    Id: string;
    Texto: string;
    TemFimVigencia: Boolean;
    InicioVigencia: TDate;
    FimVigencia: TDate;
  end;

  TRegraFiscalSelecaoOptions = TArray<TRegraFiscalSelecaoOption>;

  // AIdAtual garante a regra ja vinculada mesmo fora da lista vigente; a falha devolve False e nenhuma opcao parcial.
  TCarregarRegraFiscalSelecao = reference to function(const AIdAtual: string;
    out AOpcoes: TRegraFiscalSelecaoOptions): Boolean;

implementation

end.
