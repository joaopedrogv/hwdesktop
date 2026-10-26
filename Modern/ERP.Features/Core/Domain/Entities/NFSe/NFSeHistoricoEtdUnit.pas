unit NFSeHistoricoEtdUnit;

interface

uses
  Classes,
  SysUtils,
  Contnrs,
  StringNullableUnit,
  DateAndTimeNullableUnit,
  NFSeTypesUnit;

type
  NFSeHistoricoEtd = class
  private
    FNFSeId: string;
    FSeqId: Integer;
    FDataEvento: DateTimeNullable;
    FSituacao: SituacaoNFSeEnum;
    FTipoEvento: TipoHistoricoNFSeEnum;
    FDescricao: StringNullable;
  public
    constructor Create(); overload;
    constructor Create(
      const ANFSeId: string;
      ASeqId: Integer;
      ADataEvento: DateTimeNullable;
      ASituacao: SituacaoNFSeEnum;
      ATipoEvento: TipoHistoricoNFSeEnum;
      const ADescricao: StringNullable
    ); overload;

    property NFSeId: string read FNFSeId write FNFSeId;
    property SeqId: Integer read FSeqId write FSeqId;
    property DataEvento: DateTimeNullable read FDataEvento write FDataEvento;
    property Situacao: SituacaoNFSeEnum read FSituacao write FSituacao;
    property TipoEvento: TipoHistoricoNFSeEnum read FTipoEvento write FTipoEvento;
    property Descricao: StringNullable read FDescricao write FDescricao;
  end;

  NFSEHistoricoEtdList = class(TObjectList);

implementation

{ NFSeHistoricoEtd }

constructor NFSeHistoricoEtd.Create();
begin
  inherited Create;
end;

constructor NFSeHistoricoEtd.Create(
  const ANFSeId: string;
  ASeqId: Integer;
  ADataEvento: DateTimeNullable;
  ASituacao: SituacaoNFSeEnum;
  ATipoEvento: TipoHistoricoNFSeEnum;
  const ADescricao: StringNullable
);
begin
  Create();
  FNFSeId := ANFSeId;
  FSeqId := ASeqId;
  FDataEvento := ADataEvento;
  FSituacao := ASituacao;
  FTipoEvento := ATipoEvento;
  FDescricao := ADescricao;
end;

end.
