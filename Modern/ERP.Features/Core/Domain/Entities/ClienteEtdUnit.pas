unit ClienteEtdUnit;

interface

uses
  Classes,
  SysUtils,
  Contnrs,
  EntityBaseUnit,
  StringNullableUnit,
  IntegerNullableUnit,
  StatusRegistroEnumUnit,
  MunicipioEtdUnit,
  DFeTypesUnit, TipoRetencaoFederalPJEnumUnit;

type


  ClienteEtd = class(EntityBase)
  private
    FCodCliente: Integer;
    FCodEmpresa: Integer;
    FNomeCliente: string;
    FRazao: string;
    FCep: string;
    FEndereco: string;
    FNumEndCliente: StringNullable;
    FComplemento: StringNullable;
    FBairro: string;
    FCidade: string;
    FCodBairro: IntegerNullable;
    FCodCidade: IntegerNullable;
    FCodigoUf: Integer;
    FCodPais: IntegerNullable;
    FFoneCliente: StringNullable;
    FFoneCelular: StringNullable;
    FEmail: StringNullable;
    FCpfCnpj: StringNullable;
    FInscEst: StringNullable;
    FInscMunicipal: StringNullable;
    FIsuf: StringNullable;
    FRegime: StringNullable;
    FIssRetido: IntegerNullable;
    FNfeIndiedest: IntegerNullable;
    FNfeIdestrangeiro: StringNullable;
    FConsumidorFinal: StringNullable;
    FRetFed: IntegerNullable;
    FRetFedNfs: TipoCombinacaoRetencaoFederalPJEnum;
    FTipoObraNfse: IntegerNullable;
    FTipoEnteGov: TipoEnteGovEnum;
    FFinalidadeid: IntegerNullable;
    FCodCliFat: IntegerNullable;
    FTipo: StringNullable;
    FCodVendedor: IntegerNullable;
    FRetFedNFSSetSet: IntegerNullable;
    FRetencoesFederaisNFS: TipoRetencaoFederalPJEnumSet; // Calculado
    FAtivo: StatusRegistroEnum;
    FMunicipio: MunicipioEtd;
    function GetTemRentecaoISS: Boolean;
  public
    constructor Create(); overload;
    constructor Create(
      ACodCliente: Integer;
      ACodEmpresa: Integer;
      const ANomeCliente: string;
      const ARazao: string;
      const ACep: string;
      const AEndereco: string;
      const ANumEndCliente: StringNullable;
      const AComplemento: StringNullable;
      const ABairro: string;
      const ACidade: string;
      const ACodBairro: IntegerNullable;
      const ACodCidade: IntegerNullable;
      ACodigoUf: Integer;
      const ACodPais: IntegerNullable;
      const AFoneCliente: StringNullable;
      const AFoneCelular: StringNullable;
      const AEmail: StringNullable;
      const ACpfCnpj: StringNullable;
      const AInscEst: StringNullable;
      const AInscMunicipal: StringNullable;
      const AIsuf: StringNullable;
      const ARegime: StringNullable;
      const AIssRetido: IntegerNullable;
      const ANfeIndiedest: IntegerNullable;
      const ANfeIdestrangeiro: StringNullable;
      const AConsumidorFinal: StringNullable;
      const ARetFed: IntegerNullable;
      const ARetFedNfs: TipoCombinacaoRetencaoFederalPJEnum;
      const ATipoObraNfse: IntegerNullable;
      ATipoEnteGov: TipoEnteGovEnum;
      const AFinalidadeid: IntegerNullable;
      const ACodCliFat: IntegerNullable;
      const ATipo: StringNullable;
      const ACodVendedor: IntegerNullable;
      const ARetFedNFSSetSet: IntegerNullable;
      AAtivo: StatusRegistroEnum;
      AMunicipio: MunicipioEtd
    ); overload;

    function Clone(): EntityBase; override;

    property CodCliente: Integer read FCodCliente write FCodCliente;
    property CodEmpresa: Integer read FCodEmpresa write FCodEmpresa;
    property NomeCliente: string read FNomeCliente write FNomeCliente;
    property Razao: string read FRazao write FRazao;
    property Cep: string read FCep write FCep;
    property Endereco: string read FEndereco write FEndereco;
    property NumEndCliente: StringNullable read FNumEndCliente write FNumEndCliente;
    property Complemento: StringNullable read FComplemento write FComplemento;
    property Bairro: string read FBairro write FBairro;
    property Cidade: string read FCidade write FCidade;
    property CodBairro: IntegerNullable read FCodBairro write FCodBairro;
    property CodCidade: IntegerNullable read FCodCidade write FCodCidade;
    property CodigoUf: Integer read FCodigoUf write FCodigoUf;
    property CodPais: IntegerNullable read FCodPais write FCodPais;
    property FoneCliente: StringNullable read FFoneCliente write FFoneCliente;
    property FoneCelular: StringNullable read FFoneCelular write FFoneCelular;
    property Email: StringNullable read FEmail write FEmail;
    property CpfCnpj: StringNullable read FCpfCnpj write FCpfCnpj;
    property InscEst: StringNullable read FInscEst write FInscEst;
    property InscMunicipal: StringNullable read FInscMunicipal write FInscMunicipal;
    property Isuf: StringNullable read FIsuf write FIsuf;
		property Regime: StringNullable read FRegime write FRegime;
    property NfeIndiedest: IntegerNullable read FNfeIndiedest write FNfeIndiedest;
    property NfeIdestrangeiro: StringNullable read FNfeIdestrangeiro write FNfeIdestrangeiro;
    property ConsumidorFinal: StringNullable read FConsumidorFinal write FConsumidorFinal;
    property RetFed: IntegerNullable read FRetFed write FRetFed;
    property TipoObraNfse: IntegerNullable read FTipoObraNfse write FTipoObraNfse;
    property TipoEnteGov: TipoEnteGovEnum read FTipoEnteGov write FTipoEnteGov;
    property Finalidadeid: IntegerNullable read FFinalidadeid write FFinalidadeid;
    property CodCliFat: IntegerNullable read FCodCliFat write FCodCliFat;
		property Tipo: StringNullable read FTipo write FTipo;
		property CodVendedor: IntegerNullable read FCodVendedor write FCodVendedor;
		property TemRentecaoISS: Boolean read GetTemRentecaoISS;
    property RetencoesFederaisNFS: TipoRetencaoFederalPJEnumSet read FRetencoesFederaisNFS;
		property Ativo: StatusRegistroEnum read FAtivo write FAtivo;
    property Municipio: MunicipioEtd read FMunicipio;
  end;

  ClienteEtdList = class(TObjectList);

implementation

{ ClienteEtd }

constructor ClienteEtd.Create();
begin
  inherited Create;
end;

constructor ClienteEtd.Create(
  ACodCliente: Integer;
  ACodEmpresa: Integer;
  const ANomeCliente: string;
  const ARazao: string;
  const ACep: string;
  const AEndereco: string;
  const ANumEndCliente: StringNullable;
  const AComplemento: StringNullable;
  const ABairro: string;
  const ACidade: string;
  const ACodBairro: IntegerNullable;
  const ACodCidade: IntegerNullable;
  ACodigoUf: Integer;
  const ACodPais: IntegerNullable;
  const AFoneCliente: StringNullable;
  const AFoneCelular: StringNullable;
  const AEmail: StringNullable;
  const ACpfCnpj: StringNullable;
  const AInscEst: StringNullable;
  const AInscMunicipal: StringNullable;
  const AIsuf: StringNullable;
  const ARegime: StringNullable;
  const AIssRetido: IntegerNullable;
  const ANfeIndiedest: IntegerNullable;
  const ANfeIdestrangeiro: StringNullable;
  const AConsumidorFinal: StringNullable;
  const ARetFed: IntegerNullable;
  const ARetFedNfs: TipoCombinacaoRetencaoFederalPJEnum;
  const ATipoObraNfse: IntegerNullable;
  ATipoEnteGov: TipoEnteGovEnum;
  const AFinalidadeid: IntegerNullable;
  const ACodCliFat: IntegerNullable;
  const ATipo: StringNullable;
  const ACodVendedor: IntegerNullable;
  const ARetFedNFSSetSet: IntegerNullable;
  AAtivo: StatusRegistroEnum;
  AMunicipio: MunicipioEtd
);
  function CardinalToRetencoes(Value: Cardinal): TipoRetencaoFederalPJEnumSet;
  begin
    Move(Value, Result, SizeOf(Cardinal));
  end;
var
  C: Cardinal;
begin
  Create();
  FCodCliente := ACodCliente;
  FCodEmpresa := ACodEmpresa;
  FNomeCliente := ANomeCliente;
  FRazao := ARazao;
  FCep := ACep;
  FEndereco := AEndereco;
  FNumEndCliente := ANumEndCliente;
  FComplemento := AComplemento;
  FBairro := ABairro;
  FCidade := ACidade;
  FCodBairro := ACodBairro;
  FCodCidade := ACodCidade;
  FCodigoUf := ACodigoUf;
  FCodPais := ACodPais;
  FFoneCliente := AFoneCliente;
  FFoneCelular := AFoneCelular;
  FEmail := AEmail;
  FCpfCnpj := ACpfCnpj;
  FInscEst := AInscEst;
  FInscMunicipal := AInscMunicipal;
  FIsuf := AIsuf;
  FRegime := ARegime;
  FIssRetido := AIssRetido;
  FNfeIndiedest := ANfeIndiedest;
  FNfeIdestrangeiro := ANfeIdestrangeiro;
  FConsumidorFinal := AConsumidorFinal;
  FRetFed := ARetFed;
  FRetFedNfs := ARetFedNfs;
  FTipoObraNfse := ATipoObraNfse;
  FTipoEnteGov := ATipoEnteGov;
  FFinalidadeid := AFinalidadeid;
  FCodCliFat := ACodCliFat;
  FTipo := ATipo;
  FCodVendedor := ACodVendedor;
  FAtivo := AAtivo;
  FMunicipio := AMunicipio;
  FRetFedNFSSetSet := ARetFedNFSSetSet;

  if FRetFedNFSSetSet.IsNull then
  begin
    if FRetFedNfs = trfComIrPisCofinsCSLL then
      FRetencoesFederaisNFS := [ trfIRRF, trfPIS, trfCOFINS, trfCSLL ]
    else if FRetFedNfs = trfComPisCofinsCSLL then
      FRetencoesFederaisNFS := [ trfPIS, trfCOFINS, trfCSLL ]
    else if FRetFedNfs = trfComIR then
      FRetencoesFederaisNFS := [ trfIRRF ]
    else
      FRetencoesFederaisNFS := [];
  end
  else
    FRetencoesFederaisNFS := CardinalToRetencoes(FRetFedNFSSetSet.Value);
end;

function ClienteEtd.GetTemRentecaoISS: Boolean;
begin
  Result := not FIssRetido.IsNull and (FIssRetido.Value = 1);
end;

function ClienteEtd.Clone(): EntityBase;
var
  AMunicipio: MunicipioEtd;
begin
  if FMunicipio = nil then
    AMunicipio := nil
  else
    AMunicipio := MunicipioEtd(FMunicipio.Clone());
  
  if Self = nil then
    Result := nil
  else
    Result := ClienteEtd.Create(
      FCodCliente,
      FCodEmpresa,
      FNomeCliente,
      FRazao,
      FCep,
      FEndereco,
      FNumEndCliente,
      FComplemento,
      FBairro,
      FCidade,
      FCodBairro,
      FCodCidade,
      FCodigoUf,
      FCodPais,
      FFoneCliente,
      FFoneCelular,
      FEmail,
      FCpfCnpj,
      FInscEst,
      FInscMunicipal,
      FIsuf,
      FRegime,
      FIssRetido,
      FNfeIndiedest,
      FNfeIdestrangeiro,
      FConsumidorFinal,
      FRetFed,
      FRetFedNfs,
      FTipoObraNfse,
      FTipoEnteGov,
      FFinalidadeid,
      FCodCliFat,
      FTipo,
      FCodVendedor,
      FRetFedNFSSetSet,
      FAtivo,
      AMunicipio
    );
end;

end.
