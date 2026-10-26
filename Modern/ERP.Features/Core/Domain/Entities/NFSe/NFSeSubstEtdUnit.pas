unit NFSeSubstEtdUnit;

interface

uses
  Classes,
  SysUtils,
  Contnrs,
  EntityBaseUnit,
  StringNullableUnit,
  IntegerNullableUnit;

type
  NFSeSubstEtd = class(EntityBase)
  private
    FId: string;
    FSubstituidaId: StringNullable;
    FChave: StringNullable;
    FCMotivo: StringNullable;
    FXMotivo: StringNullable;
    FSerie: StringNullable;
    FNdps: IntegerNullable;
    FNNFSe: Int64Nullable;
    FNLote: StringNullable;
    FCVerificacao: StringNullable;
  public
    constructor Create(); overload;
    constructor Create(
      const AId: string;
      const ASubstId: StringNullable;
      const AChave: StringNullable;
      const ACMotivo: StringNullable;
      const AXMotivo: StringNullable;
      const ASerie: StringNullable;
      const ANdps: IntegerNullable;
      const ANNFSe: Int64Nullable;
      const ANLote: StringNullable;
      const ACVerificacao: StringNullable
    ); overload;

    function Clone(): EntityBase; override;
    function IsEqualTo(const Other: NFSeSubstEtd): Boolean;

    property Id: string read FId write FId;
    property SubstituidaId: StringNullable read FSubstituidaId write FSubstituidaId;
    property Chave: StringNullable read FChave write FChave;
    property CMotivo: StringNullable read FCMotivo write FCMotivo;
    property XMotivo: StringNullable read FXMotivo write FXMotivo;
    property Serie: StringNullable read FSerie write FSerie;
    property Ndps: IntegerNullable read FNdps write FNdps;
    property NNFSe: Int64Nullable read FNNFSe write FNNFSe;
    property NLote: StringNullable read FNLote write FNLote;
    property CVerificacao: StringNullable read FCVerificacao write FCVerificacao;
  end;

  NFSeSubstEtdList = class(TObjectList);

implementation

{ NFSeSubstEtd }

constructor NFSeSubstEtd.Create();
begin
  inherited Create;
end;

function NFSeSubstEtd.Clone: EntityBase;
begin
  if Self = nil then
    Result := nil
  else
    Result := NFSeSubstEtd.Create(
      FId,
      FSubstituidaId,
      FChave,
      FCMotivo,
      FXMotivo,
      FSerie,
      FNdps,
      FNNFSe,
      FNLote,
      FCVerificacao
    );
end;

constructor NFSeSubstEtd.Create(
  const AId: string;
  const ASubstId: StringNullable;
  const AChave: StringNullable;
  const ACMotivo: StringNullable;
  const AXMotivo: StringNullable;
  const ASerie: StringNullable;
  const ANdps: IntegerNullable;
  const ANNFSe: Int64Nullable;
  const ANLote: StringNullable;
  const ACVerificacao: StringNullable
);
begin
  Create();
  FId := AId;
  FSubstituidaId := ASubstId;
  FChave := AChave;
  FCMotivo := ACMotivo;
  FXMotivo := AXMotivo;
  FSerie := ASerie;
  FNdps := ANdps;
  FNNFSe := ANNFSe;
  FNLote := ANLote;
  FCVerificacao := ACVerificacao;
end;

function NFSeSubstEtd.IsEqualTo(const Other: NFSeSubstEtd): Boolean;
begin
  if (Self = nil) or (Other = nil) then
    Result := (Self = nil) and (Other = nil)
  else
    Result := (Self.Id = Other.Id)
      and Self.SubstituidaId.IsEqualTo(Other.SubstituidaId)
      and Self.Chave.IsEqualTo(Other.Chave)
      and Self.CMotivo.IsEqualTo(Other.CMotivo)
      and Self.XMotivo.IsEqualTo(Other.XMotivo)
      and Self.Serie.IsEqualTo(Other.Serie)
      and Self.Ndps.IsEqualTo(Other.Ndps)
      and Self.NNFSe.IsEqualTo(Other.NNFSe)
      and Self.NLote.IsEqualTo(Other.NLote)
      and Self.CVerificacao.IsEqualTo(Other.CVerificacao);
end;

end.
