unit EmpresaEtdUnit;

interface

uses
  Contnrs, EntityBaseUnit;

type
  EmpresaEtd = class(EntityBase)
  private
    FId: Integer;
    FCNPJ: string;
    FRazao: string;
    FFantasia: string;
    FIdentificacao: string;
    FInscEstadual: string;
    FInscMunicipal: string;
    FEndereco: string;
    FNumeroEnd: string;
    FCEP: string;
    FBairro: string;
    FComplemento: string;
    FNomeCidade: string;
    FUF: string;
    FCMunIbge: Integer;
    FTelefone: string;
    FEmail: string;
  public
    constructor Create(
      Id: Integer;
      const CNPJ: string;
      const Razao: string;
      const Fantasia: string;
      const Identificacao: string;
      const AInscEstadual: string;
      const AInscMunicipal: string;
      const AEndereco: string;
      const ANumeroEnd: string;
      const ACEP: string;
      const ABairro: string;
      const AComplemento: string;
      const ANomeCidade: string;
      const AUF: string;
      ACMunIbge: Integer;
      const ATelefone: string;
      const AEmail: string
    );

    function Clone(): EntityBase; override;

    property Id: Integer read FId;
    property CNPJ: string read FCNPJ;
    property Razao: string read FRazao;
    property Fantasia: string read FFantasia;
    property Identificacao: string read FIdentificacao;
    property InscEstadual: string read FInscEstadual;
    property InscMunicipal: string read FInscMunicipal;
    property Endereco: string read FEndereco;
    property NumeroEnd: string read FNumeroEnd;
    property CEP: string read FCEP;
    property Bairro: string read FBairro;
    property Complemento: string read FComplemento;
    property NomeCidade: string read FNomeCidade;
    property UF: string read FUF;
    property CMunIbge: Integer read FCMunIbge;
    property Telefone: string read FTelefone;
    property Email: string read FEmail;
  end;

  EmpresasEtd = class(TObjectList);

implementation

{ EmpresaEtd }

function EmpresaEtd.Clone: EntityBase;
begin
  if Self = nil then
    Result := nil
  else
    Result := EmpresaEtd.Create(
      FId, FCNPJ, FRazao, FFantasia, FIdentificacao, FInscEstadual, FInscMunicipal, FEndereco, FNumeroEnd, FCEP,
      FBairro, FComplemento, FNomeCidade, FUF, FCMunIbge, FTelefone, FEmail
    );
end;

constructor EmpresaEtd.Create(
  Id: Integer;
  const CNPJ: string;
  const Razao: string;
  const Fantasia: string;
  const Identificacao: string;
  const AInscEstadual: string;
  const AInscMunicipal: string;
  const AEndereco: string;
  const ANumeroEnd: string;
  const ACEP: string;
  const ABairro: string;
  const AComplemento: string;
  const ANomeCidade: string;
  const AUF: string;
  ACMunIbge: Integer;
  const ATelefone: string;
  const AEmail: string
);
begin
  FId := Id;
  FCNPJ := CNPJ;
  FRazao := Razao;
  FFantasia := Fantasia;
  FIdentificacao := Identificacao;
  FInscEstadual := AInscEstadual;
  FInscMunicipal := AInscMunicipal;
  FEndereco := AEndereco;
  FNumeroEnd := ANumeroEnd;
  FCEP := ACEP;
  FBairro := ABairro;
  FComplemento := AComplemento;
  FNomeCidade := ANomeCidade;
  FUF := AUF;
  FCMunIbge := ACMunIbge;
  FTelefone := ATelefone;
  FEmail := AEmail;
end;

end.
