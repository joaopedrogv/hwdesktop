unit Test_ValidacaoNFSeSalvarRascunhoXInfComp;

interface

uses
  DUnitX.TestFramework,
  ValidacaoNFSeFactoryUnit,
  IEntityValidatorUnit,
  ValidationEntityOutputUnit,
  NFSeEtdUnit,
  NFSeTypesUnit,
  StringNullableUnit,
  IntegerNullableUnit;

type
  [TestFixture]
  TTestValidacaoNFSeSalvarRascunhoXInfComp = class
  private
    function CriarNFSeRascunho(const AXInfComp: string): NFSeEtd;
  public
    [Test]
    procedure DeveRecusarXInfCompComMaisDeDoisMilCaracteresSemTruncar;

    [Test]
    procedure DeveAceitarXInfCompComDoisMilCaracteres;

    [Test]
    procedure DeveAceitarXInfCompVazio;

    [Test]
    procedure DeveRecusarEntidadeNulaSemExcecao;
  end;

implementation

uses
  SysUtils;

function TTestValidacaoNFSeSalvarRascunhoXInfComp.CriarNFSeRascunho(const AXInfComp: string): NFSeEtd;
begin
  Result := NFSeEtd.Create();
  Result.Situacao := sdpsRascunho;
  Result.NaturezaEmissao := nemtPrestadorWS;
  Result.CodCliente := IntegerNullable.Create(10);
  Result.XInfComp := StringNullable.CreateOrNull(AXInfComp);
end;

procedure TTestValidacaoNFSeSalvarRascunhoXInfComp.DeveRecusarXInfCompComMaisDeDoisMilCaracteresSemTruncar;
var
  NFSe: NFSeEtd;
  Validador: IEntityValidator;
  Saida: ValidationEntityOutput;
  Texto: string;
begin
  Texto := StringOfChar('a', 2001);
  NFSe := CriarNFSeRascunho(Texto);
  try
    Validador := ValidacaoNFSeFactory.BuildSalvarRascunho(NFSe);

    Assert.IsFalse(Validador.IsValid());

    Saida := Validador.Result();
    Assert.AreEqual('XInfComp', Saida.Validations[0].FieldName);
    Assert.AreEqual(Texto, NFSe.XInfComp.Value);
  finally
    NFSe.Free;
  end;
end;

procedure TTestValidacaoNFSeSalvarRascunhoXInfComp.DeveAceitarXInfCompComDoisMilCaracteres;
var
  NFSe: NFSeEtd;
  Validador: IEntityValidator;
  Texto: string;
begin
  Texto := StringOfChar('a', 2000);
  NFSe := CriarNFSeRascunho(Texto);
  try
    Validador := ValidacaoNFSeFactory.BuildSalvarRascunho(NFSe);

    Assert.IsTrue(Validador.IsValid());
    Assert.AreEqual(2000, Length(NFSe.XInfComp.Value));
  finally
    NFSe.Free;
  end;
end;

procedure TTestValidacaoNFSeSalvarRascunhoXInfComp.DeveAceitarXInfCompVazio;
var
  NFSe: NFSeEtd;
  Validador: IEntityValidator;
begin
  NFSe := CriarNFSeRascunho('');
  try
    Validador := ValidacaoNFSeFactory.BuildSalvarRascunho(NFSe);

    Assert.IsTrue(Validador.IsValid());
    Assert.IsTrue(NFSe.XInfComp.IsNull);
  finally
    NFSe.Free;
  end;
end;

procedure TTestValidacaoNFSeSalvarRascunhoXInfComp.DeveRecusarEntidadeNulaSemExcecao;
var
  Validador: IEntityValidator;
begin
  Validador := ValidacaoNFSeFactory.BuildSalvarRascunho(nil);

  Assert.IsFalse(Validador.IsValid());
end;

initialization
  TDUnitX.RegisterTestFixture(TTestValidacaoNFSeSalvarRascunhoXInfComp);

end.
