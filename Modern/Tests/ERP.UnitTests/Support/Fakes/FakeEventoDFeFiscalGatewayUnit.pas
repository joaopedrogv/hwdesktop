unit FakeEventoDFeFiscalGatewayUnit;

interface

uses
  IEventoDFeFiscalGatewayUnit,
  EventoDFeTransmissaoTypesUnit,
  TipoEventoDFeUnit,
  FakeTransactionUnit;

type
  TEnvioPreparadoFake = class(TInterfacedObject, IEventoDFeEnvioPreparado)
  private
    FXmlEnvio: string;
    FAmbiente: Integer;
  public
    constructor Create(const AXmlEnvio: string; AAmbiente: Integer);
    function GetXmlEnvio: string;
    function GetAmbiente: Integer;
  end;

  TEventoDFeFiscalGatewayFake = class(TInterfacedObject,
    IEventoDFeFiscalGateway)
  private
    FState: TTransactionSpyState;
    FConsulta: TEventoDFeResultadoConsulta;
    FResultado: TEventoDFeResultadoTransmissao;
    FPreparado: IEventoDFeEnvioPreparado;
    FXmlPreparacao: string;
    FAmbientePreparacao: Integer;
    FErroPreparacao: string;
    FUltimaRequisicao: TEventoDFeRequisicaoPreparo;
    FUltimaConsultaUf: string;
    FUltimaConsultaChave: string;
    FUltimaConsultaNSeq: Integer;
    FConsultarChamado: Boolean;
    FPrepararChamado: Boolean;
    FTransmitirChamado: Boolean;
    FTransacoesAbertasEmConsultar: Integer;
    FTransacoesAbertasEmPreparar: Integer;
    FTransacoesAbertasEmTransmitir: Integer;
  public
    constructor Create(const AState: TTransactionSpyState);
    function Preparar(const ARequisicao: TEventoDFeRequisicaoPreparo):
      TEventoDFePreparacao;
    function Transmitir(const APreparado: IEventoDFeEnvioPreparado):
      TEventoDFeResultadoTransmissao;
    function ConsultarSituacao(const AUf: string;
      const AChaveDocumento: string; const ATipoEvento: TipoEventoDFe;
      const ANSeqEvento: Integer): TEventoDFeResultadoConsulta;

    procedure DefinirPreparacao(const AXmlEnvio: string; AAmbiente: Integer);
    procedure DefinirErroPreparacao(const AMensagem: string);

    property Consulta: TEventoDFeResultadoConsulta
      read FConsulta write FConsulta;
    property Resultado: TEventoDFeResultadoTransmissao
      read FResultado write FResultado;
    property UltimaRequisicao: TEventoDFeRequisicaoPreparo
      read FUltimaRequisicao;
    property UltimaConsultaUf: string read FUltimaConsultaUf;
    property UltimaConsultaChave: string read FUltimaConsultaChave;
    property UltimaConsultaNSeq: Integer read FUltimaConsultaNSeq;
    property ConsultarChamado: Boolean read FConsultarChamado;
    property PrepararChamado: Boolean read FPrepararChamado;
    property TransmitirChamado: Boolean read FTransmitirChamado;
    property TransacoesAbertasEmConsultar: Integer
      read FTransacoesAbertasEmConsultar;
    property TransacoesAbertasEmPreparar: Integer
      read FTransacoesAbertasEmPreparar;
    property TransacoesAbertasEmTransmitir: Integer
      read FTransacoesAbertasEmTransmitir;
  end;

implementation

uses
  SysUtils;

function ResultadoConsultaVazio: TEventoDFeResultadoConsulta;
begin
  Result.Respondeu := False;
  Result.CStatNFe := 0;
  Result.XMotivoNFe := '';
  Result.EventoEncontrado := False;
  Result.NSeqEventoEncontrado := 0;
  Result.CStatEvento := 0;
  Result.XMotivoEvento := '';
  Result.NProt := '';
  Result.DhRegEvento := 0;
  Result.XmlProcEvento := '';
  Result.ErroTransporte := '';
end;

function ResultadoTransmissaoVazio: TEventoDFeResultadoTransmissao;
begin
  Result.Classe := crSemResposta;
  Result.OrigemResultado := orNenhuma;
  Result.CStatLote := 0;
  Result.CStatEvento := 0;
  Result.XMotivo := '';
  Result.NProt := '';
  Result.DhRegEvento := 0;
  Result.XmlRetorno := '';
  Result.XmlProcEvento := '';
  Result.ErroTransporte := '';
end;

function PreparacaoVazia: TEventoDFePreparacao;
begin
  Result.Preparado := nil;
  Result.XmlEnvio := '';
  Result.Ambiente := 0;
  Result.ErroPreparacao := '';
end;

{ TEnvioPreparadoFake }

constructor TEnvioPreparadoFake.Create(const AXmlEnvio: string;
  AAmbiente: Integer);
begin
  inherited Create;

  FXmlEnvio := AXmlEnvio;
  FAmbiente := AAmbiente;
end;

function TEnvioPreparadoFake.GetAmbiente: Integer;
begin
  Result := FAmbiente;
end;

function TEnvioPreparadoFake.GetXmlEnvio: string;
begin
  Result := FXmlEnvio;
end;

{ TEventoDFeFiscalGatewayFake }

constructor TEventoDFeFiscalGatewayFake.Create(
  const AState: TTransactionSpyState);
begin
  inherited Create;

  FState := AState;
  FConsulta := ResultadoConsultaVazio;
  FResultado := ResultadoTransmissaoVazio;
  DefinirPreparacao('XML-EVENTO', 2);
end;

procedure TEventoDFeFiscalGatewayFake.DefinirPreparacao(const AXmlEnvio: string;
  AAmbiente: Integer);
begin
  FErroPreparacao := '';
  FXmlPreparacao := AXmlEnvio;
  FAmbientePreparacao := AAmbiente;
  FPreparado := TEnvioPreparadoFake.Create(AXmlEnvio, AAmbiente);
end;

procedure TEventoDFeFiscalGatewayFake.DefinirErroPreparacao(
  const AMensagem: string);
begin
  FErroPreparacao := AMensagem;
  FPreparado := nil;
end;

function TEventoDFeFiscalGatewayFake.Preparar(
  const ARequisicao: TEventoDFeRequisicaoPreparo): TEventoDFePreparacao;
begin
  FPrepararChamado := True;
  FTransacoesAbertasEmPreparar := FState.TransacoesAbertas;
  FUltimaRequisicao := ARequisicao;
  FState.Registrar('Preparar');

  Result := PreparacaoVazia;

  if Trim(FErroPreparacao) <> '' then
  begin
    Result.ErroPreparacao := FErroPreparacao;
    Exit;
  end;

  Result.Preparado := FPreparado;
  Result.XmlEnvio := FXmlPreparacao;
  Result.Ambiente := FAmbientePreparacao;
end;

function TEventoDFeFiscalGatewayFake.Transmitir(
  const APreparado: IEventoDFeEnvioPreparado): TEventoDFeResultadoTransmissao;
begin
  FTransmitirChamado := True;
  FTransacoesAbertasEmTransmitir := FState.TransacoesAbertas;
  FState.Registrar('Transmitir');

  if APreparado = nil then
  begin
    Result := ResultadoTransmissaoVazio;
    Result.ErroTransporte := 'Envio preparado nao informado.';
    Exit;
  end;

  Result := FResultado;
end;

function TEventoDFeFiscalGatewayFake.ConsultarSituacao(const AUf: string;
  const AChaveDocumento: string; const ATipoEvento: TipoEventoDFe;
  const ANSeqEvento: Integer): TEventoDFeResultadoConsulta;
begin
  FConsultarChamado := True;
  FTransacoesAbertasEmConsultar := FState.TransacoesAbertas;
  FUltimaConsultaUf := AUf;
  FUltimaConsultaChave := AChaveDocumento;
  FUltimaConsultaNSeq := ANSeqEvento;
  FState.Registrar('Consultar');

  Result := FConsulta;
end;

end.
