unit NFSeEventoEtdUnit;

interface

uses
  Classes,
  SysUtils,
  Contnrs,
  StringNullableUnit,
  DateAndTimeNullableUnit,
  NFSeTypesUnit, IntegerNullableUnit;

type
  NFSeEventoEtd = class
  private
    FId: string;
    FNFSeId: string;
    FTipoEvento: TipoEventoNFSeEnum;
    FDataEvento: TDateTime;
    FSituacao: SituacaoNFSeEnum;
    FVerAplic: StringNullable;
    FCMotivo: StringNullable;
    FXMotivo: StringNullable;
    FDhProc: DateTimeNullable;
    FNSeqEvento: IntegerNullable;
  public
    constructor Create(); overload;
    constructor Create(
      const AId: string;
      const ANFSeId: string;
      ATipoEvento: TipoEventoNFSeEnum;
      ADataEvento: TDateTime;
      ASituacao: SituacaoNFSeEnum;
      const AVerAplic: StringNullable;
      const ACMotivo: StringNullable;
      const AXMotivo: StringNullable;
      const ADhProc: DateTimeNullable;
      const ANSeqEvento: IntegerNullable
    ); overload;

    property Id: string read FId write FId;
    property NFSeId: string read FNFSeId write FNFSeId;
    property TipoEvento: TipoEventoNFSeEnum read FTipoEvento write FTipoEvento;
    property DataEvento: TDateTime read FDataEvento write FDataEvento;
    property Situacao: SituacaoNFSeEnum read FSituacao write FSituacao;
    property VerAplic: StringNullable read FVerAplic write FVerAplic;
    property CMotivo: StringNullable read FCMotivo write FCMotivo;
    property XMotivo: StringNullable read FXMotivo write FXMotivo;
    property DhProc: DateTimeNullable read FDhProc write FDhProc;
    property NSeqEvento: IntegerNullable read FNSeqEvento write FNSeqEvento;
  end;

  NfseEventoEtdList = class(TObjectList);

implementation

{ NFSeEventoEtd }

constructor NFSeEventoEtd.Create();
begin
  inherited Create;
end;

constructor NFSeEventoEtd.Create(
  const AId: string;
  const ANFSeId: string;
  ATipoEvento: TipoEventoNFSeEnum;
  ADataEvento: TDateTime;
  ASituacao: SituacaoNFSeEnum;
  const AVerAplic: StringNullable;
  const ACMotivo: StringNullable;
  const AXMotivo: StringNullable;
  const ADhProc: DateTimeNullable;
  const ANSeqEvento: IntegerNullable
);
begin
  Create();
  FId := AId;
  FNFSeId := ANFSeId;
  FTipoEvento := ATipoEvento;
  FDataEvento := ADataEvento;
  FSituacao := ASituacao;
  FVerAplic := AVerAplic;
  FCMotivo := ACMotivo;
  FXMotivo := AXMotivo;
  FDhProc := ADhProc;
  FNSeqEvento := ANSeqEvento;
end;

end.
