unit Test_EventoDFeStatus;

interface

uses
  DUnitX.TestFramework,
  EventoDFeStatusUnit;

type
  [TestFixture]
  TTestEventoDFeStatus = class
  public
    [Test]
    procedure DeveConverterStatusParaTexto;

    [Test]
    procedure DeveConverterTextoParaStatus;

    [Test]
    procedure DeveRejeitarTextoDesconhecido;
  end;

implementation

uses
  SysUtils;

procedure TTestEventoDFeStatus.DeveConverterStatusParaTexto;
begin
  Assert.AreEqual('PENDENTE', StatusEventoDFeParaTexto(sePendente));
  Assert.AreEqual('ENVIANDO', StatusEventoDFeParaTexto(seEnviando));
  Assert.AreEqual('AUTORIZADO', StatusEventoDFeParaTexto(seAutorizado));
  Assert.AreEqual('REJEITADO', StatusEventoDFeParaTexto(seRejeitado));
end;

procedure TTestEventoDFeStatus.DeveConverterTextoParaStatus;
begin
  Assert.IsTrue(TextoParaStatusEventoDFe('PENDENTE') = sePendente);
  Assert.IsTrue(TextoParaStatusEventoDFe('ENVIANDO') = seEnviando);
  Assert.IsTrue(TextoParaStatusEventoDFe('AUTORIZADO') = seAutorizado);
  Assert.IsTrue(TextoParaStatusEventoDFe('REJEITADO') = seRejeitado);
end;

procedure TTestEventoDFeStatus.DeveRejeitarTextoDesconhecido;
begin
  Assert.WillRaise(
    procedure
    begin
      TextoParaStatusEventoDFe('INEXISTENTE');
    end,
    Exception
  );
end;

end.
