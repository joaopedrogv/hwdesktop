unit Test_NFSeXInfComp;

interface

uses
  DUnitX.TestFramework,
  StringNullableUnit,
  NFSeEtdUnit;

type
  [TestFixture]
  TTestNFSeXInfComp = class
  public
    [Test]
    procedure DeveIniciarComXInfCompNulo;

    [Test]
    procedure DevePreservarXInfCompPreenchido;

    [Test]
    procedure DeveClonarXInfComp;

    [Test]
    procedure DeveCompararXInfCompEmIsEqualTo;
  end;

implementation

{ TTestNFSeXInfComp }

procedure TTestNFSeXInfComp.DeveIniciarComXInfCompNulo;
var
  NFSe: NFSeEtd;
begin
  NFSe := NFSeEtd.Create();
  try
    Assert.IsTrue(NFSe.XInfComp.IsNull);
    Assert.IsTrue(NFSe.XInfComp.IsNullOrWhiteSpace);
  finally
    NFSe.Free();
  end;
end;

procedure TTestNFSeXInfComp.DevePreservarXInfCompPreenchido;
var
  NFSe: NFSeEtd;
begin
  NFSe := NFSeEtd.Create();
  try
    NFSe.XInfComp := StringNullable.Create('Informacoes complementares da NFS-e');

    Assert.IsFalse(NFSe.XInfComp.IsNull);
    Assert.AreEqual('Informacoes complementares da NFS-e', NFSe.XInfComp.Value);
  finally
    NFSe.Free();
  end;
end;

procedure TTestNFSeXInfComp.DeveClonarXInfComp;
var
  Original: NFSeEtd;
  Clonada: NFSeEtd;
begin
  Original := NFSeEtd.Create();
  try
    Original.XInfComp := StringNullable.Create('Texto informado pelo usuario');

    Clonada := NFSeEtd(Original.Clone());
    try
      Assert.IsTrue(Clonada.XInfComp.IsEqualTo(Original.XInfComp));
      Assert.AreEqual('Texto informado pelo usuario', Clonada.XInfComp.Value);
    finally
      Clonada.Free();
    end;
  finally
    Original.Free();
  end;
end;

procedure TTestNFSeXInfComp.DeveCompararXInfCompEmIsEqualTo;
var
  Primeira: NFSeEtd;
  Segunda: NFSeEtd;
begin
  Primeira := NFSeEtd.Create();
  Segunda := NFSeEtd.Create();
  try
    Primeira.XInfComp := StringNullable.Create('Texto A');
    Segunda.XInfComp := StringNullable.Create('Texto A');
    Assert.IsTrue(Primeira.IsEqualTo(Segunda));

    Segunda.XInfComp := StringNullable.Create('Texto B');
    Assert.IsFalse(Primeira.IsEqualTo(Segunda));

    Segunda.XInfComp := StringNullable.NullInstance();
    Assert.IsFalse(Primeira.IsEqualTo(Segunda));
  finally
    Segunda.Free();
    Primeira.Free();
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestNFSeXInfComp);

end.
