unit Hw.Integra.Api.NotificacaoContasEmAberto;

interface

uses
  Hw.Integra.Api.ContatoCliente,
  Hw.Integra.Api.CreditoBoleto;

type

  TDiasAvisoCobranca = class
  private
    FAVencer: Integer;
    FEmAtraso: Integer;
  public
    property EmAtraso: Integer read FEmAtraso write FEmAtraso;
    property AVencer: Integer read FAVencer write FAVencer;
  end;

  TMensagemCobranca = class
  private
    FAVencer: String;
    FDiaVencimento: String;
    FEmAtraso: String;
  public
    property EmAtraso: String read FEmAtraso write FEmAtraso;
    property AVencer: String read FAVencer write FAVencer;
    property DiaVencimento: String read FDiaVencimento write FDiaVencimento;
  end;

  TRecorrenciaCobranca = class
  private
    FAVencer: Integer;
    FDiaVencimento: Integer;
    FEmAtraso: Integer;
  public
    property EmAtraso: Integer read FEmAtraso write FEmAtraso;
    property AVencer: Integer read FAVencer write FAVencer;
    property DiaVencimento: Integer read FDiaVencimento write FDiaVencimento;
  end;

  TNotificacaoContasEmAberto = class
  private
    FContatos: TArray<TContatoCliente>;
    FNotificacaoPorAcessoModuloFinanceiroERP: Boolean;
    FNotificacaoPorContatoCobranca: Boolean;
    FDiaFechado: TDateTime;
    FUsarDiaFinanceiroHw: Boolean;
    FRecorrencia: TRecorrenciaCobranca;
    FDiasAviso: TDiasAvisoCobranca;
    FMensagem: TMensagemCobranca;
    FContas: TArray<TCreditoBoleto>;
  public
    property UsarDiaFinanceiroHw: Boolean read FUsarDiaFinanceiroHw write FUsarDiaFinanceiroHw;
    property NotificacaoPorContatoCobranca: Boolean read FNotificacaoPorContatoCobranca write FNotificacaoPorContatoCobranca;
    property NotificacaoPorAcessoModuloFinanceiroERP: Boolean read FNotificacaoPorAcessoModuloFinanceiroERP write FNotificacaoPorAcessoModuloFinanceiroERP;
    property DiasAviso: TDiasAvisoCobranca read FDiasAviso write FDiasAviso;// class
    property Mensagem: TMensagemCobranca read FMensagem write FMensagem;// class
    property Recorrencia: TRecorrenciaCobranca read FRecorrencia write FRecorrencia;// class
    property DiaFechado: TDateTime read FDiaFechado write FDiaFechado;
    property Contatos: TArray<TContatoCliente> read FContatos write FContatos;// Collection
    property Contas: TArray<TCreditoBoleto> read FContas write FContas;// Collection
  end;

implementation

end.
