unit Test_TipoEventoDFeTpAutor;

interface

uses
  DUnitX.TestFramework,
  TipoEventoDFeUnit;

type
  [TestFixture]
  TTestTipoEventoDFeTpAutor = class
  public
    [Test]
    procedure DeveUsarEmitenteParaAtualizacaoDePrevisao;

    [Test]
    procedure DeveUsarDestinatarioParaImobilizacaoDeItem;
  end;

implementation

procedure TTestTipoEventoDFeTpAutor.DeveUsarEmitenteParaAtualizacaoDePrevisao;
begin
  Assert.AreEqual(1, TipoEventoDFeTpAutor(teAtualizacaoPrevisaoEntrega));
end;

procedure TTestTipoEventoDFeTpAutor.DeveUsarDestinatarioParaImobilizacaoDeItem;
begin
  Assert.AreEqual(2, TipoEventoDFeTpAutor(teImobilizacaoItem));
end;

end.
