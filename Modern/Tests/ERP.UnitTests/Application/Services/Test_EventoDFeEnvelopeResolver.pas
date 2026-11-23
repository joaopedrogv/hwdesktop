unit Test_EventoDFeEnvelopeResolver;

interface

uses
  DUnitX.TestFramework,
  EventoDFeEnvelopeResolverUnit,
  EventoDFeTransmissaoTypesUnit,
  TipoEventoDFeUnit,
  EmpresaEtdUnit,
  StubEmpresasRepositoryUnit;

type
  [TestFixture]
  TTestEventoDFeEnvelopeResolver = class
  private
    FEmpresasRepo: TEmpresasRepositoryStub;
    FResolver: IEventoDFeEnvelopeResolver;
    procedure SemearEmpresa(const ACnpj: string; ACMunIbge: Integer);
    function Requisicao(ATipoEvento: TipoEventoDFe):
      TEventoDFeRequisicaoPreparo;
  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure DeveResolverUfCnpjECodigoIbgeDaEmpresa;

    [Test]
    procedure DeveMapearTpAutorDoTipo;

    [Test]
    procedure DevePreservarOsDemaisCamposDaRequisicao;

    [Test]
    procedure DeveFalharComErroTecnicoQuandoMunicipioNaoIdentificaUf;

    [Test]
    procedure DeveFalharComErroTecnicoQuandoCnpjIncompleto;

    [Test]
    procedure DeveFalharComValidacaoDeNegocioQuandoEmpresaNaoEncontrada;
  end;

implementation

uses
  SysUtils,
  EValidacaoNegocioUnit;

const
  EMPRESA_ID = 3;
  CNPJ_FORMATADO = '11.222.333/0001-81';
  CNPJ_DIGITOS = '11222333000181';
  IBGE_SAO_PAULO = 3550308;
  CHAVE_DOCUMENTO = '11111111111111111111111111111111111111111111';

function CriarEmpresa(const ACnpj: string; ACMunIbge: Integer): EmpresaEtd;
begin
  Result := EmpresaEtd.Create(
    EMPRESA_ID,
    ACnpj,
    'Empresa de teste',
    'Teste',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    'Sao Paulo',
    'SP',
    ACMunIbge,
    '',
    ''
  );
end;

procedure SemearEmpresaNoRepositorio(const ARepositorio: TEmpresasRepositoryStub;
  const ACnpj: string; ACMunIbge: Integer);
var
  LEmpresa: EmpresaEtd;
begin
  LEmpresa := CriarEmpresa(ACnpj, ACMunIbge);
  try
    ARepositorio.Adicionar(LEmpresa);
  finally
    LEmpresa.Free;
  end;
end;

{ TTestEventoDFeEnvelopeResolver }

procedure TTestEventoDFeEnvelopeResolver.Setup;
begin
  FEmpresasRepo := TEmpresasRepositoryStub.Create;
  SemearEmpresa(CNPJ_FORMATADO, IBGE_SAO_PAULO);
  FResolver := EventoDFeEnvelopeResolver.Create(FEmpresasRepo);
end;

procedure TTestEventoDFeEnvelopeResolver.TearDown;
begin
  FResolver := nil;
  FEmpresasRepo.Free;
end;

procedure TTestEventoDFeEnvelopeResolver.SemearEmpresa(const ACnpj: string;
  ACMunIbge: Integer);
begin
  SemearEmpresaNoRepositorio(FEmpresasRepo, ACnpj, ACMunIbge);
end;

function TTestEventoDFeEnvelopeResolver.Requisicao(ATipoEvento: TipoEventoDFe):
  TEventoDFeRequisicaoPreparo;
begin
  Result.CodEmpresa := EMPRESA_ID;
  Result.ChaveDocumento := CHAVE_DOCUMENTO;
  Result.TipoEvento := ATipoEvento;
  Result.NSeqEvento := 4;
  Result.IdLote := 77;
  Result.DhEvento := EncodeDate(2026, 11, 22);
  Result.Uf := '';
  Result.Cnpj := '';
  Result.COrgao := 0;
  Result.TpAutor := 0;
  Result.COrgaoAutor := 0;
  Result.Payload.DataPrevisaoEntrega := EncodeDate(2026, 12, 1);
  SetLength(Result.Payload.Itens, 0);
end;

procedure TTestEventoDFeEnvelopeResolver.DeveResolverUfCnpjECodigoIbgeDaEmpresa;
var
  LResolvida: TEventoDFeRequisicaoPreparo;
begin
  LResolvida := FResolver.Resolver(Requisicao(teAtualizacaoPrevisaoEntrega));

  Assert.AreEqual('SP', LResolvida.Uf);
  Assert.AreEqual(CNPJ_DIGITOS, LResolvida.Cnpj);
  Assert.AreEqual(35, LResolvida.COrgao);
  Assert.AreEqual(35, LResolvida.COrgaoAutor);
end;

procedure TTestEventoDFeEnvelopeResolver.DeveMapearTpAutorDoTipo;
var
  LResolvida: TEventoDFeRequisicaoPreparo;
begin
  LResolvida := FResolver.Resolver(Requisicao(teAtualizacaoPrevisaoEntrega));
  Assert.AreEqual(1, LResolvida.TpAutor);

  LResolvida := FResolver.Resolver(Requisicao(teImobilizacaoItem));
  Assert.AreEqual(2, LResolvida.TpAutor);
end;

procedure TTestEventoDFeEnvelopeResolver.DevePreservarOsDemaisCamposDaRequisicao;
var
  LRequisicao: TEventoDFeRequisicaoPreparo;
  LResolvida: TEventoDFeRequisicaoPreparo;
begin
  LRequisicao := Requisicao(teAtualizacaoPrevisaoEntrega);
  LResolvida := FResolver.Resolver(LRequisicao);

  Assert.AreEqual(EMPRESA_ID, LResolvida.CodEmpresa);
  Assert.AreEqual(CHAVE_DOCUMENTO, LResolvida.ChaveDocumento);
  Assert.AreEqual(4, LResolvida.NSeqEvento);
  Assert.AreEqual(Int64(77), LResolvida.IdLote);
  Assert.AreEqual(LRequisicao.DhEvento, LResolvida.DhEvento);
  Assert.AreEqual(LRequisicao.Payload.DataPrevisaoEntrega,
    LResolvida.Payload.DataPrevisaoEntrega);
end;

procedure TTestEventoDFeEnvelopeResolver.DeveFalharComErroTecnicoQuandoMunicipioNaoIdentificaUf;
var
  LEmpresasInvalidas: TEmpresasRepositoryStub;
  LResolver: IEventoDFeEnvelopeResolver;
  Levantou: Boolean;
  NaoEhValidacaoDeNegocio: Boolean;
begin
  LEmpresasInvalidas := TEmpresasRepositoryStub.Create;
  try
    SemearEmpresaNoRepositorio(LEmpresasInvalidas, CNPJ_FORMATADO, 0);
    LResolver := EventoDFeEnvelopeResolver.Create(LEmpresasInvalidas);

    Levantou := False;
    NaoEhValidacaoDeNegocio := False;
    try
      LResolver.Resolver(Requisicao(teAtualizacaoPrevisaoEntrega));
    except
      on E: Exception do
      begin
        Levantou := True;
        NaoEhValidacaoDeNegocio := not (E is EValidacaoNegocio);
      end;
    end;

    Assert.IsTrue(Levantou, 'A UF nao identificada deve interromper a resolucao.');
    Assert.IsTrue(NaoEhValidacaoDeNegocio,
      'UF nao identificada e erro tecnico de configuracao.');
  finally
    LResolver := nil;
    LEmpresasInvalidas.Free;
  end;
end;

procedure TTestEventoDFeEnvelopeResolver.DeveFalharComErroTecnicoQuandoCnpjIncompleto;
var
  LEmpresasInvalidas: TEmpresasRepositoryStub;
  LResolver: IEventoDFeEnvelopeResolver;
  Levantou: Boolean;
  NaoEhValidacaoDeNegocio: Boolean;
begin
  LEmpresasInvalidas := TEmpresasRepositoryStub.Create;
  try
    SemearEmpresaNoRepositorio(LEmpresasInvalidas, '123', IBGE_SAO_PAULO);
    LResolver := EventoDFeEnvelopeResolver.Create(LEmpresasInvalidas);

    Levantou := False;
    NaoEhValidacaoDeNegocio := False;
    try
      LResolver.Resolver(Requisicao(teAtualizacaoPrevisaoEntrega));
    except
      on E: Exception do
      begin
        Levantou := True;
        NaoEhValidacaoDeNegocio := not (E is EValidacaoNegocio);
      end;
    end;

    Assert.IsTrue(Levantou, 'O CNPJ incompleto deve interromper a resolucao.');
    Assert.IsTrue(NaoEhValidacaoDeNegocio,
      'CNPJ incompleto e erro tecnico de configuracao.');
  finally
    LResolver := nil;
    LEmpresasInvalidas.Free;
  end;
end;

procedure TTestEventoDFeEnvelopeResolver.DeveFalharComValidacaoDeNegocioQuandoEmpresaNaoEncontrada;
var
  LRequisicao: TEventoDFeRequisicaoPreparo;
begin
  LRequisicao := Requisicao(teAtualizacaoPrevisaoEntrega);
  LRequisicao.CodEmpresa := 99;

  Assert.WillRaise(
    procedure
    begin
      FResolver.Resolver(LRequisicao);
    end,
    EValidacaoNegocio
  );
end;

initialization
  TDUnitX.RegisterTestFixture(TTestEventoDFeEnvelopeResolver);

end.
