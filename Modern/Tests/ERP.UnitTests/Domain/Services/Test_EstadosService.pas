unit Test_EstadosService;

interface

uses
  DUnitX.TestFramework,
  EstadosServiceUnit;

type
  [TestFixture]
  TTestEstadosService = class
  public
    [Test]
    procedure DeveConverterSiglaParaCodigoIbge;

    [Test]
    procedure DeveIgnorarCaixaDaSigla;

    [Test]
    procedure DeveRetornarMenosUmParaUfDesconhecida;
  end;

implementation

procedure TTestEstadosService.DeveConverterSiglaParaCodigoIbge;
begin
  Assert.AreEqual(35, EstadosService.UfToCodigoIBGE('SP'));
  Assert.AreEqual(11, EstadosService.UfToCodigoIBGE('RO'));
  Assert.AreEqual(53, EstadosService.UfToCodigoIBGE('DF'));
  Assert.AreEqual(99, EstadosService.UfToCodigoIBGE('EX'));
end;

procedure TTestEstadosService.DeveIgnorarCaixaDaSigla;
begin
  Assert.AreEqual(35, EstadosService.UfToCodigoIBGE('sp'));
end;

procedure TTestEstadosService.DeveRetornarMenosUmParaUfDesconhecida;
begin
  Assert.AreEqual(-1, EstadosService.UfToCodigoIBGE('XX'));
  Assert.AreEqual(-1, EstadosService.UfToCodigoIBGE(''));
end;

end.
