unit NotaFiscalResumoModelUnit;

interface

uses
  Contnrs,
  Classes,
  SysUtils,
  EntityBaseUnit,
  StringNullableUnit,
  IntegerNullableUnit,
  DateAndTimeNullableUnit, FormatoImpressaoDANFeEnumUnit, TipoEmissaoNFeEnumUnit, NaturezaNfEnumUnit, TipoNfEnumUnit,
  StatusNfEnumUnit, SituacaoNFeEnumUnit, TipoAmbienteNFeEnumUnit;

type
  NotaFiscalResumoModel = class(EntityBase)
  private
    FCodNf: Integer;
    FCodEmpresa: Integer;
    FNaturezaNf: string;
    FTipoNf: string;
    FStatus: StringNullable;
    FSituacaoNfe: StringNullable;
    FSerie: string;
    FNumNf: Integer;
    FCodCliente: Integer;
    FDataContabil: DateTimeNullable;
    FHoraEmissao: StringNullable;
    FDataLanc: DateTimeNullable;
    FNfeTpemis: StringNullable;
    FChaveNfe: StringNullable;
    FXmlNFe: StringNullable;
    FDescricaoerro: StringNullable;
    FTpimp: IntegerNullable;
    FTpAmb: StringNullable;
    function GetDhEmis: DateTimeNullable;
    function GetTpimp: FormatoImpressaoDANFeEnum;
    function GetNfeTpemis: TipoEmissaoNFeEnum;
    function GetNaturezaNf: NaturezaNfEnum;
    function GetTipoNf: TipoNfEnum;
    function GetStatus: StatusNfEnum;
    function GetSituacaoNfe: SituacaoNFeEnum;
    function GetTpAmb: TipoAmbienteNFeEnum;
  public
    constructor Create(
      ACodNf: Integer;
      ACodEmpresa: Integer;
      const ANaturezaNf: string;
      const ATipoNf: string;
      const AStatus: StringNullable;
      const ASituacaoNfe: StringNullable;
      const ASerie: string;
      ANumNf: Integer;
      ACodCliente: Integer;
      const ADataContabil: DateTimeNullable;
      const AHoraEmissao: StringNullable;
      const ADataLanc: DateTimeNullable;
      const ANfeTpemis: StringNullable;
      const AChaveNfe: StringNullable;
      const AXmlNFe: StringNullable;
      const ADescricaoerro: StringNullable;
      const ATpimp: IntegerNullable;
      const ATpAmb: StringNullable
    );

    function Clone(): EntityBase; override;

    property CodNf: Integer read FCodNf;
    property CodEmpresa: Integer read FCodEmpresa;
    property NaturezaNf: NaturezaNfEnum read GetNaturezaNf;
    property TipoNf: TipoNfEnum read GetTipoNf;
    property Status: StatusNfEnum read GetStatus;
    property SituacaoNfe: SituacaoNFeEnum read GetSituacaoNfe;
    property Serie: string read FSerie;
    property NumNf: Integer read FNumNf;
    property CodCliente: Integer read FCodCliente;
    property DhEmis: DateTimeNullable read GetDhEmis;
    property DataLanc: DateTimeNullable read FDataLanc;
    property NfeTpemis: TipoEmissaoNFeEnum read GetNfeTpemis;
    property ChaveNfe: StringNullable read FChaveNfe;
    property XmlNFe: StringNullable read FXmlNFe;
    property Descricaoerro: StringNullable read FDescricaoerro;
    property Tpimp: FormatoImpressaoDANFeEnum read GetTpimp;
    property TpAmb: TipoAmbienteNFeEnum read GetTpAmb;
  end;

  NotaFiscalResumoModelList = class(TObjectList)
  private
    function GetItem(Index: Integer): NotaFiscalResumoModel;
    procedure SetItem(Index: Integer; const Value: NotaFiscalResumoModel);
  public
    property Items[Index: Integer]: NotaFiscalResumoModel read GetItem write SetItem; default;
  end;

implementation

uses
  DateUtils;

{ NotaFiscalResumoModel }

constructor NotaFiscalResumoModel.Create(
  ACodNf: Integer;
  ACodEmpresa: Integer;
  const ANaturezaNf: string;
  const ATipoNf: string;
  const AStatus: StringNullable;
  const ASituacaoNfe: StringNullable;
  const ASerie: string;
  ANumNf: Integer;
  ACodCliente: Integer;
  const ADataContabil: DateTimeNullable;
  const AHoraEmissao: StringNullable;
  const ADataLanc: DateTimeNullable;
  const ANfeTpemis: StringNullable;
  const AChaveNfe: StringNullable;
  const AXmlNFe: StringNullable;
  const ADescricaoerro: StringNullable;
  const ATpimp: IntegerNullable;
  const ATpAmb: StringNullable
);
begin
  FCodNf := ACodNf;
  FCodEmpresa := ACodEmpresa;
  FNaturezaNf := ANaturezaNf;
  FTipoNf := ATipoNf;
  FStatus := AStatus;
  FSituacaoNfe := ASituacaoNfe;
  FSerie := ASerie;
  FNumNf := ANumNf;
  FCodCliente := ACodCliente;
  FDataContabil := ADataContabil;
  FHoraEmissao := AHoraEmissao;
  FDataLanc := ADataLanc;
  FNfeTpemis := ANfeTpemis;
  FChaveNfe := AChaveNfe;
  FXmlNFe := AXmlNFe;
  FDescricaoerro := ADescricaoerro;
  FTpimp := ATpimp;
  FTpAmb := ATpAmb;
end;

function NotaFiscalResumoModel.GetDhEmis: DateTimeNullable;
begin
  if FDataContabil.HasValue then
    Result.SetValue( FDataLanc.Value + StrToTimeDef(FHoraEmissao.Value, EncodeTime(0,0,0,0)))
  else
    Result := FDataContabil;
end;

function NotaFiscalResumoModel.GetNaturezaNf: NaturezaNfEnum;
begin
  Result := NaturezaNfToEnum(FNaturezaNf);
end;

function NotaFiscalResumoModel.GetNfeTpemis: TipoEmissaoNFeEnum;
var
  eVal: SmallInt;
begin
  eVal := StrToIntDef(FNfeTpemis.Value, -1);
  case eVal of
    1..9:
      Result := TipoEmissaoNFeEnum(eVal);
    else
      Result := tenNaoDefinido;
  end;
end;

function NotaFiscalResumoModel.GetSituacaoNfe: SituacaoNFeEnum;
begin
  Result := SituacaoNFeToEnum(FSituacaoNfe.Value);
end;

function NotaFiscalResumoModel.GetStatus: StatusNfEnum;
begin
  Result := StatusNfToEnum(FStatus.Value);
end;

function NotaFiscalResumoModel.GetTipoNf: TipoNfEnum;
begin
  Result := TipoNfToEnum(FTipoNf);
end;

function NotaFiscalResumoModel.GetTpAmb: TipoAmbienteNFeEnum;
begin
  Result := TipoAmbienteNFeToEnum(FTpAmb.Value);
end;

function NotaFiscalResumoModel.GetTpimp: FormatoImpressaoDANFeEnum;
begin
  if FTpimp.IsNull then
    Result := fidNaoDefinido

  else
    case FTpimp.Value of
      0..5: Result := FormatoImpressaoDANFeEnum(FTpimp.Value);
      else
        Result := fidNaoDefinido;
    end;
end;

function NotaFiscalResumoModel.Clone(): EntityBase;
begin
  if Self = nil then
    Result := nil
  else
    Result := NotaFiscalResumoModel.Create(
      FCodNf,
      FCodEmpresa,
      FNaturezaNf,
      FTipoNf,
      FStatus,
      FSituacaoNfe,
      FSerie,
      FNumNf,
      FCodCliente,
      FDataContabil,
      FHoraEmissao,
      FDataLanc,
      FNfeTpemis,
      FChaveNfe,
      FXmlNFe,
      FDescricaoerro,
      FTpimp,
      FTpAmb
    );
end;

{ NotaFiscalResumoModelList }

function NotaFiscalResumoModelList.GetItem(Index: Integer): NotaFiscalResumoModel;
begin
  Result := NotaFiscalResumoModel(inherited Items[Index]);
end;

procedure NotaFiscalResumoModelList.SetItem(Index: Integer; const Value: NotaFiscalResumoModel);
begin
  Put(Index, Value);
end;

end.