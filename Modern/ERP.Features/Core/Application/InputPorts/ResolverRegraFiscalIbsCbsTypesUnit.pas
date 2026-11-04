unit ResolverRegraFiscalIbsCbsTypesUnit;

interface

uses
  TipoComunsUnit,
  DFeTypesUnit,
  OperacaoFiscalIbsCbsCondicaoEtdUnit,
  OperacaoFiscalIbsCbsEtdUnit,
  RegraFiscalIbsCbsEtdUnit;

type
  ResolverRegraFiscalIbsCbsInput = record
  private
    FOperacaoInternaId: string;
    FGrupoFiscalId: string;
    FEmpresaId: Integer;
    FData: TDate;
    FTipoEmissao: TipoEmissaoOcorrencia;
    FNaturezaEmissao: NaturezaEmissaoOcorrencia;
    FTipoOrgaoPublico: TipoEnteGovEnum;
    FSomenteAnalise: Boolean;
    // Rascunho da tela; a entrada nao assume a posse do objeto.
    FCandidatoRascunho: OperacaoFiscalIbsCbsEtd;
  public
    // Entrada de determinacao: os tres fatos da ocorrencia sao obrigatorios e
    // SomenteAnalise fica falso. Executar aceita exclusivamente este formato.
    class function Create(
      const OperacaoInternaId, GrupoFiscalId: string;
      EmpresaId: Integer;
      Data: TDate;
      const TipoEmissao: TipoEmissaoOcorrencia;
      const NaturezaEmissao: NaturezaEmissaoOcorrencia;
      TipoOrgaoPublico: TipoEnteGovEnum
    ): ResolverRegraFiscalIbsCbsInput; static;

    // Somente para a analise de configuracao: os fatos da ocorrencia sao
    // deliberadamente desconhecidos (placeholders) e ignorados por Analisar.
    // A marcacao SomenteAnalise impede que a entrada seja consumida por
    // Executar como se os placeholders fossem fatos da ocorrencia.
    class function CreateParaAnalise(
      const OperacaoInternaId, GrupoFiscalId: string;
      EmpresaId: Integer;
      Data: TDate
    ): ResolverRegraFiscalIbsCbsInput; overload; static;

    // Variante que considera o estado corrente da tela. O rascunho substitui
    // o vinculo persistido de mesmo Id na analise, mas continua pertencendo ao
    // chamador.
    class function CreateParaAnalise(
      const OperacaoInternaId, GrupoFiscalId: string;
      EmpresaId: Integer;
      Data: TDate;
      const ACandidatoRascunho: OperacaoFiscalIbsCbsEtd
    ): ResolverRegraFiscalIbsCbsInput; overload; static;

    property OperacaoInternaId: string read FOperacaoInternaId;
    property GrupoFiscalId: string read FGrupoFiscalId;
    property EmpresaId: Integer read FEmpresaId;
    property Data: TDate read FData;
    property TipoEmissao: TipoEmissaoOcorrencia read FTipoEmissao;
    property NaturezaEmissao: NaturezaEmissaoOcorrencia read FNaturezaEmissao;
    property TipoOrgaoPublico: TipoEnteGovEnum read FTipoOrgaoPublico;
    // Verdadeiro apenas para entradas de analise; Executar as rejeita.
    property SomenteAnalise: Boolean read FSomenteAnalise;
    property CandidatoRascunho: OperacaoFiscalIbsCbsEtd read FCandidatoRascunho;
  end;

  ResolverRegraFiscalIbsCbsResultado = (
    rrDeterminado,
    rrInformacaoPendente,
    rrConflito,
    rrConfiguracaoInvalida,
    rrNenhumaRegra
  );

  ResolverRegraFiscalIbsCbsResult = class
  private
    FStatus: ResolverRegraFiscalIbsCbsResultado;
    FRegraFiscal: RegraFiscalIbsCbsEtd;
    FMensagem: string;
    FAtributosPendentes: OperacaoFiscalIbsCbsCondicaoAtributoArray;
    FRedundante: Boolean;
  public
    constructor Create(
      Status: ResolverRegraFiscalIbsCbsResultado;
      RegraFiscal: RegraFiscalIbsCbsEtd;
      const Mensagem: string;
      const AtributosPendentes: OperacaoFiscalIbsCbsCondicaoAtributoArray;
      Redundante: Boolean);
    destructor Destroy; override;

    property Status: ResolverRegraFiscalIbsCbsResultado read FStatus;
    property RegraFiscal: RegraFiscalIbsCbsEtd read FRegraFiscal;
    property Mensagem: string read FMensagem;
    property AtributosPendentes: OperacaoFiscalIbsCbsCondicaoAtributoArray read FAtributosPendentes;
    property Redundante: Boolean read FRedundante;
  end;

  ResolverRegraFiscalIbsCbsApontamentoTipo = (
    ratObservacaoOpcoes,
    ratDuplicidade,
    ratConflito,
    ratRegraAusente,
    ratValorInvalido
  );

  // Classificacao do apontamento exibido na conferencia; o texto se destina ao
  // usuario e nao expoe identificadores tecnicos.
  ResolverRegraFiscalIbsCbsApontamento = record
    Tipo: ResolverRegraFiscalIbsCbsApontamentoTipo;
    Texto: string;
  end;

  ResolverRegraFiscalIbsCbsApontamentoArray =
    array of ResolverRegraFiscalIbsCbsApontamento;

  ResolverRegraFiscalIbsCbsAnalise = class
  private
    FMensagens: TArrayString;
    FApontamentos: ResolverRegraFiscalIbsCbsApontamentoArray;
  public
    // Mantido para compatibilidade: acrescenta somente a lista de mensagens.
    procedure Adicionar(const Mensagem: string);
    procedure AdicionarApontamento(
      Tipo: ResolverRegraFiscalIbsCbsApontamentoTipo;
      const Texto: string);
    property Mensagens: TArrayString read FMensagens;
    property Apontamentos: ResolverRegraFiscalIbsCbsApontamentoArray read FApontamentos;
  end;

implementation

{ ResolverRegraFiscalIbsCbsInput }

class function ResolverRegraFiscalIbsCbsInput.Create(
  const OperacaoInternaId, GrupoFiscalId: string;
  EmpresaId: Integer;
  Data: TDate;
  const TipoEmissao: TipoEmissaoOcorrencia;
  const NaturezaEmissao: NaturezaEmissaoOcorrencia;
  TipoOrgaoPublico: TipoEnteGovEnum
): ResolverRegraFiscalIbsCbsInput;
begin
  Result.FOperacaoInternaId := OperacaoInternaId;
  Result.FGrupoFiscalId := GrupoFiscalId;
  Result.FEmpresaId := EmpresaId;
  Result.FData := Data;
  Result.FTipoEmissao := TipoEmissao;
  Result.FNaturezaEmissao := NaturezaEmissao;
  Result.FTipoOrgaoPublico := TipoOrgaoPublico;
  Result.FSomenteAnalise := False;
  Result.FCandidatoRascunho := nil;
end;

class function ResolverRegraFiscalIbsCbsInput.CreateParaAnalise(
  const OperacaoInternaId, GrupoFiscalId: string;
  EmpresaId: Integer;
  Data: TDate
): ResolverRegraFiscalIbsCbsInput;
begin
  Result := ResolverRegraFiscalIbsCbsInput.CreateParaAnalise(
    OperacaoInternaId, GrupoFiscalId, EmpresaId, Data, nil);
end;

class function ResolverRegraFiscalIbsCbsInput.CreateParaAnalise(
  const OperacaoInternaId, GrupoFiscalId: string;
  EmpresaId: Integer;
  Data: TDate;
  const ACandidatoRascunho: OperacaoFiscalIbsCbsEtd
): ResolverRegraFiscalIbsCbsInput;
begin
  Result.FOperacaoInternaId := OperacaoInternaId;
  Result.FGrupoFiscalId := GrupoFiscalId;
  Result.FEmpresaId := EmpresaId;
  Result.FData := Data;
  Result.FTipoEmissao := TipoEmissaoOcorrencia.Desconhecido;
  Result.FNaturezaEmissao := NaturezaEmissaoOcorrencia.Desconhecido;
  Result.FTipoOrgaoPublico := tgvNenhum;
  Result.FSomenteAnalise := True;
  Result.FCandidatoRascunho := ACandidatoRascunho;
end;

{ ResolverRegraFiscalIbsCbsResult }

constructor ResolverRegraFiscalIbsCbsResult.Create(
  Status: ResolverRegraFiscalIbsCbsResultado;
  RegraFiscal: RegraFiscalIbsCbsEtd;
  const Mensagem: string;
  const AtributosPendentes: OperacaoFiscalIbsCbsCondicaoAtributoArray;
  Redundante: Boolean);
begin
  inherited Create;
  FStatus := Status;
  FRegraFiscal := RegraFiscal;
  FMensagem := Mensagem;
  FAtributosPendentes := AtributosPendentes;
  FRedundante := Redundante;
end;

destructor ResolverRegraFiscalIbsCbsResult.Destroy;
begin
  // A regra escolhida pertence ao resultado; o chamador libera apenas o
  // resultado, nunca a regra isoladamente.
  FRegraFiscal.Free;
  inherited;
end;

{ ResolverRegraFiscalIbsCbsAnalise }

procedure ResolverRegraFiscalIbsCbsAnalise.Adicionar(const Mensagem: string);
var
  n: Integer;
begin
  n := Length(FMensagens);
  SetLength(FMensagens, n + 1);
  FMensagens[n] := Mensagem;
end;

procedure ResolverRegraFiscalIbsCbsAnalise.AdicionarApontamento(
  Tipo: ResolverRegraFiscalIbsCbsApontamentoTipo;
  const Texto: string);
var
  n: Integer;
begin
  Adicionar(Texto);

  n := Length(FApontamentos);
  SetLength(FApontamentos, n + 1);
  FApontamentos[n].Tipo := Tipo;
  FApontamentos[n].Texto := Texto;
end;

end.
