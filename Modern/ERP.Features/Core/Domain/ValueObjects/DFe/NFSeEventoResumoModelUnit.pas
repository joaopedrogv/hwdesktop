unit NFSeEventoResumoModelUnit;

interface

uses
  StringNullableUnit, IntegerNullableUnit, DateAndTimeNullableUnit, NFSeTypesUnit;

type
  NFSeEventoResumoModel = record
  private
    FNFSeId: string;
    FEmpresaId: Integer;
    FEventoId: StringNullable;
    FTipoEvento: TipoEventoNFSeEnum;
    FSituacaoEvento: SituacaoNFSeEnum;
    FDataEvento: TDateTime;
    FSituacaoNFSe: SituacaoNFSeEnum;
    FSerie: StringNullable;
    FNDps: IntegerNullable;
    FDhEmi: DateTimeNullable;
  public
    class function Create(
      const NFSeId: string;
      EmpresaId: Integer;
      const EventoId: StringNullable;
      TipoEvento: TipoEventoNFSeEnum;
      SituacaoEvento: SituacaoNFSeEnum;
      DataEvento: TDateTime;
      SituacaoNFSe: SituacaoNFSeEnum;
      const Serie: StringNullable;
      const NDps: IntegerNullable;
      const DhEmi: DateTimeNullable
    ):NFSeEventoResumoModel; static;

    property NFSeId: string read FNFSeId;
    property EmpresaId: Integer read FEmpresaId;
    property EventoId: StringNullable read FEventoId;
    property TipoEvento: TipoEventoNFSeEnum read FTipoEvento;
    property SituacaoEvento: SituacaoNFSeEnum read FSituacaoEvento;
    property DataEvento: TDateTime read FDataEvento;
    property SituacaoNFSe: SituacaoNFSeEnum read FSituacaoNFSe;
    property Serie: StringNullable read FSerie;
    property NDps: IntegerNullable read FNDps;
    property DhEmi: DateTimeNullable read FDhEmi;
  end;

implementation

{ NFSeEventoResumoModel }

class function NFSeEventoResumoModel.Create(
  const NFSeId: string;
  EmpresaId: Integer;
  const EventoId: StringNullable;
  TipoEvento: TipoEventoNFSeEnum;
  SituacaoEvento: SituacaoNFSeEnum;
  DataEvento: TDateTime;
  SituacaoNFSe: SituacaoNFSeEnum;
  const Serie: StringNullable;
  const NDps: IntegerNullable;
  const DhEmi: DateTimeNullable
): NFSeEventoResumoModel;
begin
  Result.FNFSeId := NFSeId;
  Result.FEmpresaId := EmpresaId;
  Result.FEventoId := EventoId;
  Result.FTipoEvento := TipoEvento;
  Result.FSituacaoEvento := SituacaoEvento;
  Result.FDataEvento := DataEvento;
  Result.FSituacaoNFSe := SituacaoNFSe;
  Result.FSerie := Serie;
  Result.FNDps := NDps;
  Result.FDhEmi := DhEmi;
end;

end.
