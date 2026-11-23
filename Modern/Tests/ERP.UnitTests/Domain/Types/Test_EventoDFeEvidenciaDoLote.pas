unit Test_EventoDFeEvidenciaDoLote;

interface

uses
  DUnitX.TestFramework,
  EventoDFeTransmissaoTypesUnit;

type
  [TestFixture]
  TTestEventoDFeEvidenciaDoLote = class
  public
    [Test]
    procedure DeveManterEvidenciaQuandoRecebeValoresVazios;

    [Test]
    procedure DevePreferirEvidenciaRecebida;

    [Test]
    procedure DeveManterVazioQuandoAmbosSaoVazios;
  end;

implementation

procedure TTestEventoDFeEvidenciaDoLote.DeveManterEvidenciaQuandoRecebeValoresVazios;
var
  LEvidencia: TEventoDFeEvidenciaLote;
begin
  LEvidencia := MesclarEvidenciaDoLote(128, 0, '<retEnvEvento/>', '');

  Assert.AreEqual(128, LEvidencia.CStatLote);
  Assert.AreEqual('<retEnvEvento/>', LEvidencia.XmlRetorno);
end;

procedure TTestEventoDFeEvidenciaDoLote.DevePreferirEvidenciaRecebida;
var
  LEvidencia: TEventoDFeEvidenciaLote;
begin
  LEvidencia := MesclarEvidenciaDoLote(128, 135, '<retEnvEvento/>', '<retConsSit/>');

  Assert.AreEqual(135, LEvidencia.CStatLote);
  Assert.AreEqual('<retConsSit/>', LEvidencia.XmlRetorno);
end;

procedure TTestEventoDFeEvidenciaDoLote.DeveManterVazioQuandoAmbosSaoVazios;
var
  LEvidencia: TEventoDFeEvidenciaLote;
begin
  LEvidencia := MesclarEvidenciaDoLote(0, 0, '', '');

  Assert.AreEqual(0, LEvidencia.CStatLote);
  Assert.AreEqual('', LEvidencia.XmlRetorno);
end;

initialization
  TDUnitX.RegisterTestFixture(TTestEventoDFeEvidenciaDoLote);

end.