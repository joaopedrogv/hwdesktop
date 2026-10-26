unit NFSeParticipanteEtdUnit;

interface

uses
  Classes,
  SysUtils,
  Contnrs,
  EntityBaseUnit,
  NFSeTypesUnit,
  StringNullableUnit,
  IntegerNullableUnit,
  TipoComunsUnit;

type
  NFSeParticipanteEtd = class(EntityBase)
  private
    FId: string;
    FTipoPart: TipoPartDpesEnum;
    FCpfcnpj: StringNullable;
    FNif: StringNullable;
    FCnaonif: IntegerNullable;
    FIm: StringNullable;
    FXnome: string;
    FFone: StringNullable;
    FEmail: StringNullable;
    FCmun: IntegerNullable;
    FCep: StringNullable;
    FXlgr: StringNullable;
    FNro: StringNullable;
    FXcpl: StringNullable;
    FXbairro: StringNullable;
    FListaEmails: TArrayString;
  public
    constructor Create(); overload;
    constructor Create(
      const AId: string;
      ATipoPart: TipoPartDpesEnum;
      const ACpfcnpj: StringNullable;
      const ANif: StringNullable;
      const ACnaonif: IntegerNullable;
      const AIm: StringNullable;
      const AXnome: string;
      const AFone: StringNullable;
      const AEmail: StringNullable;
      const ACmun: IntegerNullable;
      const ACep: StringNullable;
      const AXlgr: StringNullable;
      const ANro: StringNullable;
      const AXcpl: StringNullable;
      const AXbairro: StringNullable
    ); overload;

    function Clone(): EntityBase; override;
    function IsEqualTo(const Other: NFSeParticipanteEtd): Boolean;

    property Id: string read FId write FId;
    property TipoPart: TipoPartDpesEnum read FTipoPart write FTipoPart;
    property Cpfcnpj: StringNullable read FCpfcnpj write FCpfcnpj;
    property Nif: StringNullable read FNif write FNif;
    property Cnaonif: IntegerNullable read FCnaonif write FCnaonif;
    property Im: StringNullable read FIm write FIm;
    property Xnome: string read FXnome write FXnome;
    property Fone: StringNullable read FFone write FFone;
    property Email: StringNullable read FEmail write FEmail;
    property Cmun: IntegerNullable read FCmun write FCmun;
    property Cep: StringNullable read FCep write FCep;
    property Xlgr: StringNullable read FXlgr write FXlgr;
    property Nro: StringNullable read FNro write FNro;
    property Xcpl: StringNullable read FXcpl write FXcpl;
    property Xbairro: StringNullable read FXbairro write FXbairro;
    property ListaEmails: TArrayString read FListaEmails write FListaEmails;
  end;

  NFSeParticipanteEtdList = class(TObjectList);

implementation

{ NFSeParticipanteEtd }

constructor NFSeParticipanteEtd.Create();
begin
  inherited Create;
end;

constructor NFSeParticipanteEtd.Create(
  const AId: string;
  ATipoPart: TipoPartDpesEnum;
  const ACpfcnpj: StringNullable;
  const ANif: StringNullable;
  const ACnaonif: IntegerNullable;
  const AIm: StringNullable;
  const AXnome: string;
  const AFone: StringNullable;
  const AEmail: StringNullable;
  const ACmun: IntegerNullable;
  const ACep: StringNullable;
  const AXlgr: StringNullable;
  const ANro: StringNullable;
  const AXcpl: StringNullable;
  const AXbairro: StringNullable
);
begin
  Create();
  FId := AId;
  FTipoPart := ATipoPart;
  FCpfcnpj := ACpfcnpj;
  FNif := ANif;
  FCnaonif := ACnaonif;
  FIm := AIm;
  FXnome := AXnome;
  FFone := AFone;
  FEmail := AEmail;
  FCmun := ACmun;
  FCep := ACep;
  FXlgr := AXlgr;
  FNro := ANro;
  FXcpl := AXcpl;
  FXbairro := AXbairro;
end;

function NFSeParticipanteEtd.Clone(): EntityBase;
begin
  if Self = nil then
    Result := nil
  else
    Result := NFSeParticipanteEtd.Create(
      FId,
      FTipoPart,
      FCpfcnpj,
      FNif,
      FCnaonif,
      FIm,
      FXnome,
      FFone,
      FEmail,
      FCmun,
      FCep,
      FXlgr,
      FNro,
      FXcpl,
      FXbairro
    );
end;

function NFSeParticipanteEtd.IsEqualTo(const Other: NFSeParticipanteEtd): Boolean;
begin
  if (Self = nil) or (Other = nil) then
    Result := (Self = nil) and (Other = nil)
  else
    Result := (Self.Id = Other.Id)
      and (Self.TipoPart = Other.TipoPart)
      and Self.Cpfcnpj.IsEqualTo(Other.Cpfcnpj)
      and Self.Nif.IsEqualTo(Other.Nif)
      and Self.Cnaonif.IsEqualTo(Other.Cnaonif)
      and Self.Im.IsEqualTo(Other.Im)
      and (Self.Xnome = Other.Xnome)
      and Self.Fone.IsEqualTo(Other.Fone)
      and Self.Email.IsEqualTo(Other.Email)
      and Self.Cmun.IsEqualTo(Other.Cmun)
      and Self.Cep.IsEqualTo(Other.Cep)
      and Self.Xlgr.IsEqualTo(Other.Xlgr)
      and Self.Nro.IsEqualTo(Other.Nro)
      and Self.Xcpl.IsEqualTo(Other.Xcpl)
      and Self.Xbairro.IsEqualTo(Other.Xbairro);
end;

end.
