unit Teste_CompraGovernamentalInput;

interface

uses
  DUnitX.TestFramework,
  CalcularTributoInputUnit,
  CompraGovernamentalInputUnit,
  TipoEnteGovernamentalEnumUnit,
  TipoOperacaoGovernamentalEnumUnit;

type
  [TestFixture]
  TTest_CompraGovernamentalInput = class
  public
    [Test]
    procedure teste_GetTpEnteGov_SemGCompraGov_RetornaUnassigned;

    [Test]
    procedure teste_GetTpEnteGov_ComGCompraGov_RetornaEnteInformado;

    [Test]
    procedure teste_CompraGovernamentalInput_Valida_QuandoAmbosInformados;

    [Test]
    procedure teste_CompraGovernamentalInput_Invalida_QuandoEnteNaoInformado;

    [Test]
    procedure teste_CompraGovernamentalInput_Invalida_QuandoOperacaoNaoInformada;

    [Test]
    procedure teste_TipoEnteGovernamentalFromCodigo_MapeiaCodigos;

    [Test]
    procedure teste_TipoOperacaoGovernamentalFromCodigo_MapeiaCodigos;

    [Test]
    procedure teste_TipoOperacaoGovernamentalFromCodigo_CodigoDesconhecido_LancaExcecao;

    [Test]
    procedure teste_TipoEnteGovernamentalFromCodigo_CodigoDesconhecido_LancaExcecao;
  end;

implementation

uses
  System.SysUtils;

{ TTest_CompraGovernamentalInput }

procedure TTest_CompraGovernamentalInput.teste_GetTpEnteGov_SemGCompraGov_RetornaUnassigned;
var
  input: CalcularTributoInput;
begin
  input := CalcularTributoInput.Create(0, 0, '', nil, CompraGovernamentalInput.NullInstance());

  Assert.AreEqual(Integer(tegUnassigned), Integer(input.GetTpEnteGov()), 'Sem gCompraGov, getTpEnteGov deve retornar nulo (unassigned)');
end;

procedure TTest_CompraGovernamentalInput.teste_GetTpEnteGov_ComGCompraGov_RetornaEnteInformado;
var
  input: CalcularTributoInput;
begin
  input := CalcularTributoInput.Create(0, 0, '', nil, CompraGovernamentalInput.NullInstance());
  input.GCompraGov := CompraGovernamentalInput.Create(tegEstado, togFornecimento);

  Assert.AreEqual(Integer(tegEstado), Integer(input.GetTpEnteGov()), 'Com gCompraGov, getTpEnteGov deve retornar o ente informado');
end;

procedure TTest_CompraGovernamentalInput.teste_CompraGovernamentalInput_Valida_QuandoAmbosInformados;
var
  input: CompraGovernamentalInput;
begin
  input := CompraGovernamentalInput.Create(tegUniao, togFornecimento);

  Assert.IsFalse(input.IsNull(), 'Input criado nao deve ser nulo');
  Assert.IsTrue(input.IsValid(), 'Input com ente e operacao deve ser valido');
end;

procedure TTest_CompraGovernamentalInput.teste_CompraGovernamentalInput_Invalida_QuandoEnteNaoInformado;
var
  input: CompraGovernamentalInput;
begin
  input := CompraGovernamentalInput.Create(tegUnassigned, togFornecimento);

  Assert.IsFalse(input.IsValid(), 'Input sem ente deve ser invalido');
end;

procedure TTest_CompraGovernamentalInput.teste_CompraGovernamentalInput_Invalida_QuandoOperacaoNaoInformada;
var
  input: CompraGovernamentalInput;
begin
  input := CompraGovernamentalInput.Create(tegUniao, togUnassigned);

  Assert.IsFalse(input.IsValid(), 'Input sem operacao deve ser invalido');
end;

procedure TTest_CompraGovernamentalInput.teste_TipoEnteGovernamentalFromCodigo_MapeiaCodigos;
begin
  Assert.AreEqual(Integer(tegUniao), Integer(TipoEnteGovernamentalFromCodigo(1)), 'Codigo 1 deve ser Uniao');
  Assert.AreEqual(Integer(tegEstado), Integer(TipoEnteGovernamentalFromCodigo(2)), 'Codigo 2 deve ser Estado');
  Assert.AreEqual(Integer(tegDistritoFederal), Integer(TipoEnteGovernamentalFromCodigo(3)), 'Codigo 3 deve ser DF');
  Assert.AreEqual(Integer(tegMunicipio), Integer(TipoEnteGovernamentalFromCodigo(4)), 'Codigo 4 deve ser Municipio');
end;

procedure TTest_CompraGovernamentalInput.teste_TipoOperacaoGovernamentalFromCodigo_MapeiaCodigos;
begin
  Assert.AreEqual(Integer(togFornecimento), Integer(TipoOperacaoGovernamentalFromCodigo(1)), 'Codigo 1 deve ser Fornecimento com pagamento posterior');
  Assert.AreEqual(Integer(togRecebimentoPagamento), Integer(TipoOperacaoGovernamentalFromCodigo(2)), 'Codigo 2 deve ser Recebimento do pagamento com fornecimento realizado');
  Assert.AreEqual(Integer(togFornecimentoPagamentoRealizado), Integer(TipoOperacaoGovernamentalFromCodigo(3)), 'Codigo 3 deve ser Fornecimento com pagamento realizado');
  Assert.AreEqual(Integer(togRecebimentoPagamentoFornecimentoPosterior), Integer(TipoOperacaoGovernamentalFromCodigo(4)), 'Codigo 4 deve ser Recebimento do pagamento com fornecimento posterior');
  Assert.AreEqual(Integer(togFornecimentoRecebimentoConcomitantes), Integer(TipoOperacaoGovernamentalFromCodigo(5)), 'Codigo 5 deve ser Fornecimento e recebimento concomitantes');
end;

procedure TTest_CompraGovernamentalInput.teste_TipoOperacaoGovernamentalFromCodigo_CodigoDesconhecido_LancaExcecao;
begin
  Assert.WillRaise(
    procedure
    begin
      TipoOperacaoGovernamentalFromCodigo(99);
    end,
    Exception);
end;

procedure TTest_CompraGovernamentalInput.teste_TipoEnteGovernamentalFromCodigo_CodigoDesconhecido_LancaExcecao;
begin
  Assert.WillRaise(
    procedure
    begin
      TipoEnteGovernamentalFromCodigo(99);
    end,
    Exception);
end;

initialization
  TDUnitX.RegisterTestFixture(TTest_CompraGovernamentalInput);

end.
