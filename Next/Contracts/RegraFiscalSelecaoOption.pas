unit RegraFiscalSelecaoOption;

interface

uses
  System.SysUtils;

type
  // Opcao do seletor de Regra Fiscal. O texto ja vem identificado pela
  // classificacao e pela descricao, como no cadastro legado; a vigencia
  // acompanha a opcao para que o seletor apresente o periodo sem reconsultar o
  // dominio. FimVigencia e valido apenas quando TemFimVigencia.
  TRegraFiscalSelecaoOption = record
    Id: string;
    Texto: string;
    TemFimVigencia: Boolean;
    InicioVigencia: TDate;
    FimVigencia: TDate;
  end;

  TRegraFiscalSelecaoOptions = TArray<TRegraFiscalSelecaoOption>;

  // Carrega as opcoes do seletor para o identificador atual. AIdAtual garante a
  // regra ja vinculada mesmo quando ela nao esta na lista vigente. A falha
  // devolve False e nenhuma opcao parcial.
  TCarregarRegraFiscalSelecao = reference to function(const AIdAtual: string;
    out AOpcoes: TRegraFiscalSelecaoOptions): Boolean;

implementation

end.
