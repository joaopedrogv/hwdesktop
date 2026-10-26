unit NFSeEventoModelUnit;

interface

uses
  NFSeDocEtdUnit, StringNullableUnit, IntegerNullableUnit, DateAndTimeNullableUnit, NFSeTypesUnit, NFSeEventoEtdUnit;

type
  NFSeEventoModel = class
  private
    FNFSeId: string;
    FEmpresaId: Integer;
    FSituacao: SituacaoNFSeEnum;
    FSerie: StringNullable;
    FNDps: IntegerNullable;
    FDhEmi: DateTimeNullable;
    FDhCanc: DateTimeNullable;
    FOrigemCanc: OrigemCancelamentoNFSeEnum;
    FLayout: LayoutNFSeEnum;
    FDocumento: NFSeDocEtd;
    FEvento: NFSeEventoEtd;
  public
    constructor Create(
      const ANFSeId: string;
      AEmpresaId: Integer;
      ASituacao: SituacaoNFSeEnum;
      const ASerie: StringNullable;
      const ANDps: IntegerNullable;
      const ADhEmi: DateTimeNullable;
      const ADhCanc: DateTimeNullable;
      AOrigemCanc: OrigemCancelamentoNFSeEnum;
      ALayout: LayoutNFSeEnum;
      ADocumento: NFSeDocEtd;
      AEvento: NFSeEventoEtd
    );
    destructor Destroy; override;   
    function IsPadraoNacional(): Boolean;
    function LayoutNFSeComIbsCbs(): Boolean;

    property NFSeId: string read FNFSeId;
    property EmpresaId: Integer read FEmpresaId;
    property Situacao: SituacaoNFSeEnum read FSituacao;
    property Serie: StringNullable read FSerie;
    property NDps: IntegerNullable read FNDps;
    property DhEmi: DateTimeNullable read FDhEmi;
    property DhCanc: DateTimeNullable read FDhCanc;
    property OrigemCanc: OrigemCancelamentoNFSeEnum read FOrigemCanc write FOrigemCanc;
    property Layout: LayoutNFSeEnum read FLayout;
    property Autorizacao: NFSeDocEtd read FDocumento;
    property Evento: NFSeEventoEtd read FEvento;
  end;

implementation


{ NFSeEventoModel }

constructor NFSeEventoModel.Create(
  const ANFSeId: string;
  AEmpresaId: Integer;
  ASituacao: SituacaoNFSeEnum;
  const ASerie: StringNullable;
  const ANDps: IntegerNullable;
  const ADhEmi: DateTimeNullable;
  const ADhCanc: DateTimeNullable;
  AOrigemCanc: OrigemCancelamentoNFSeEnum;
  ALayout: LayoutNFSeEnum;
  ADocumento: NFSeDocEtd;
  AEvento: NFSeEventoEtd
);
begin
  FNFSeId := ANFSeId;
  FSituacao := ASituacao;
  FEmpresaId := AEmpresaId;
  FSerie := ASerie;
  FNDps := ANDps;
  FDhEmi := ADhEmi;
  FDhCanc := ADhCanc;
  FOrigemCanc := AOrigemCanc;
  FLayout := ALayout;
  FDocumento := ADocumento;
  FEvento := AEvento;
end;

destructor NFSeEventoModel.Destroy;
begin
  FDocumento.Free();
  FEvento.Free();

  inherited;
end;

function NFSeEventoModel.IsPadraoNacional: Boolean;
begin
  Result := FLayout in [ lytNacionalSemIbsCbs, lytNacionalComIbsCbs ];
end;

function NFSeEventoModel.LayoutNFSeComIbsCbs: Boolean;
begin
  Result := FLayout in [ lytNacionalComIbsCbs ];
end;

end.
