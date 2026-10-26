unit GrupoFiscalEtdUnit;

interface

uses
  EntityBaseUnit,
  StatusRegistroEnumUnit,
  TipoTributoFiscalEnumUnit,
  TipoComunsUnit,
  StringNullableUnit,
  Contnrs;

type

  GrupoFiscalEtd = class(EntityBase)
  private                      
    FId: string;
    FSeqId: Integer;
    FDescricao: string;
    FTipoTributo: TipoTributoFiscalEnum;
    FDataCadastro: TDateTime;
    FDataAlteracao: TDateTime;
    FAtivo: StatusRegistroEnum;
    FEmpressasId: TArrayInteger;
    FGeridoPeloSistema: Boolean;
    FAnexo: StringNullable;
  public
    constructor Create(); overload;

    constructor Create(
      const AId: string;
      ASeqId: Integer;
      const ADescricao: string;
      ATipoTributo: TipoTributoFiscalEnum;
      ADataCadastro: TDateTime;
      ADataAlteracao: TDateTime;
      AAtivo: StatusRegistroEnum;
      AGeridoPeloSistema: Boolean;
      const AAnexo: StringNullable;
      const AEmpresasId: TArrayInteger
    ); overload;

    constructor Create(
      const ADescricao: string;
      ATipoTributo: TipoTributoFiscalEnum;
      AGeridoPeloSistema: Boolean;
      const AAnexo: StringNullable;
      const AEmpresasId: TArrayInteger
    ); overload;     
                        
    function Clone(): EntityBase; override;

    property Id: string read FId;
    property SeqId: Integer read FSeqId;
    property Descricao: string read FDescricao write FDescricao;
    property TipoTributo: TipoTributoFiscalEnum read FTipoTributo write FTipoTributo;
    property DataCadastro: TDateTime read FDataCadastro;
    property DataAlteracao: TDateTime read FDataAlteracao;
    property Ativo: StatusRegistroEnum read FAtivo write FAtivo;
    property GeridoPeloSistema: Boolean read FGeridoPeloSistema;
    property Anexo: StringNullable read FAnexo;
    property EmpresasId: TArrayInteger read FEmpressasId write FEmpressasId;
  end;

  GruposFiscaisEtd = class(TObjectList);

implementation

{ GrupoFiscalEtd }

constructor GrupoFiscalEtd.Create;
begin
  FSeqId := 0;
  FAtivo := saAtivo;
end;

constructor GrupoFiscalEtd.Create(
  const AId: string;
  ASeqId: Integer;
  const ADescricao: string;
  ATipoTributo: TipoTributoFiscalEnum;
  ADataCadastro: TDateTime;
  ADataAlteracao: TDateTime;
  AAtivo: StatusRegistroEnum;
  AGeridoPeloSistema: Boolean;
  const AAnexo: StringNullable;
  const AEmpresasId: TArrayInteger
);
begin
  FId := AId;
  FSeqId := ASeqId;
  FDescricao := ADescricao;
  FTipoTributo := ATipoTributo;
  FDataCadastro := ADataCadastro;
  FDataAlteracao := ADataAlteracao;
  FAtivo := AAtivo;
  FGeridoPeloSistema := AGeridoPeloSistema;
  FAnexo := AAnexo;
  FEmpressasId := AEmpresasId;
end;

function GrupoFiscalEtd.Clone: EntityBase;
begin
  Result := GrupoFiscalEtd.Create(
    FId, FSeqId, FDescricao,FTipoTributo, FDataCadastro, DataAlteracao, FAtivo, FGeridoPeloSistema,
    FAnexo, FEmpressasId
  );
end;

constructor GrupoFiscalEtd.Create(const ADescricao: string;
  ATipoTributo: TipoTributoFiscalEnum; AGeridoPeloSistema: Boolean;
  const AAnexo: StringNullable; const AEmpresasId: TArrayInteger);
begin
  Create();
  FDescricao := ADescricao;
  FTipoTributo := ATipoTributo;
  FGeridoPeloSistema := AGeridoPeloSistema;
  FAnexo := AAnexo;
  FEmpressasId := AEmpresasId;
end;

end.
