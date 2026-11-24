unit Test_EventoDFeEtd;

interface

uses
  DUnitX.TestFramework,
  TipoEventoDFeUnit,
  EventoDFe112150EtdUnit,
  EventoDFe211130EtdUnit;

type
  [TestFixture]
  TTestEventoDFeEtd = class
  public
    [Test]
    procedure DeveCriarRascunho112150ComIdentidadeNFe;

    [Test]
    procedure DeveCriarRascunho211130ComIdentidadeNFe;
  end;

implementation

{ TTestEventoDFeEtd }

procedure TTestEventoDFeEtd.DeveCriarRascunho112150ComIdentidadeNFe;
var
  Evento: EventoDFe112150Etd;
begin
  Evento := EventoDFe112150Etd.Create;
  try
    Assert.IsTrue(Evento.FamiliaDocumento = fdNFe);
    Assert.IsTrue(Evento.TipoEvento = teAtualizacaoPrevisaoEntrega);
  finally
    Evento.Free;
  end;
end;

procedure TTestEventoDFeEtd.DeveCriarRascunho211130ComIdentidadeNFe;
var
  Evento: EventoDFe211130Etd;
begin
  Evento := EventoDFe211130Etd.Create;
  try
    Assert.IsTrue(Evento.FamiliaDocumento = fdNFe);
    Assert.IsTrue(Evento.TipoEvento = teImobilizacaoItem);
  finally
    Evento.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestEventoDFeEtd);

end.
