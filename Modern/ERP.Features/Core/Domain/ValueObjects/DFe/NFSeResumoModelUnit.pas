unit NFSeResumoModelUnit;

interface

uses
  StringNullableUnit, IntegerNullableUnit, DateAndTimeNullableUnit, NFSeTypesUnit, DFeTypesUnit;

type
  NFSeResumoModelDoc = record
  private
    TipoDoc: TipoDocNFSeEnum;
    Documento: StringNullable;
  public
    class function Create(
      TipoDoc: TipoDocNFSeEnum;
      Documento: StringNullable
    ): NFSeResumoModelDoc; static;
  end;

  NFSeResumoModelDocArray = array of NFSeResumoModelDoc;

  NFSeResumoModel = record
  private
    FId: string;
    FEmpresaId: Integer;
    FSituacao: SituacaoNFSeEnum;
    FNaturezaEmissao: NaturezaEmissaoNFSeEnum;
    FTpAmb: TipoAmbienteEnum;
    FSerie: StringNullable;
    FNDps: IntegerNullable;
    FDhEmi: DateTimeNullable;
    FLayout: LayoutNFSeEnum;
    FNLote: StringNullable;
    FNProt: StringNullable;
    FChave: StringNullable;
    FNNFSe: Int64Nullable;
    FDocumentos: NFSeResumoModelDocArray;
    FSubstituidaPorId: StringNullable;
    FSubstitutaDeId: StringNullable;
    function GetDocumento(TipoDoc: TipoDocNFSeEnum): StringNullable;
  public
    class function Create(
      const Id: string;
      EmpresaId: Integer;
      Situacao: SituacaoNFSeEnum;
      NaturezaEmissao: NaturezaEmissaoNFSeEnum;
      TpAmb: TipoAmbienteEnum;
      const Serie: StringNullable;
      const NDps: IntegerNullable;
      const DhEmi: DateTimeNullable;
      Layout: LayoutNFSeEnum;
      const NLote: StringNullable;
      const NProt: StringNullable;
      const Chave: StringNullable;
      const NNFSe: Int64Nullable;
      const SubstituidaPorId: StringNullable;
      const SubstitutaDeId: StringNullable;
      const Documentos: NFSeResumoModelDocArray
    ):NFSeResumoModel; static;

    property Id: string read FId;
    property EmpresaId: Integer read FEmpresaId;
    property Situacao: SituacaoNFSeEnum read FSituacao;
    property NaturezaEmissao: NaturezaEmissaoNFSeEnum read FNaturezaEmissao;
    property TpAmb: TipoAmbienteEnum read FTpAmb;
    property Serie: StringNullable read FSerie;
    property NDps: IntegerNullable read FNDps;
    property DhEmi: DateTimeNullable read FDhEmi;
    property Layout: LayoutNFSeEnum read FLayout;
    property NLote: StringNullable read FNLote;
    property NProt: StringNullable read FNProt;
    property Chave: StringNullable read FChave;
    property NNFSe: Int64Nullable read FNNFSe;
    property SubstituidaPorId: StringNullable read FSubstituidaPorId;
    property SubstitutaDeId: StringNullable read FSubstitutaDeId;
    property Documento[TipoDoc: TipoDocNFSeEnum]: StringNullable read GetDocumento;
  end;

  NFSeSitacaoModel = record
  private
    FId: string;
    FEmpresaId: Integer;
    FSituacao: SituacaoNFSeEnum;
    FNaturezaEmissao: NaturezaEmissaoNFSeEnum;
    FSerie: StringNullable;
    FNDps: IntegerNullable;
  public
    class function Create(
      const Id: string;
      EmpresaId: Integer;
      Situacao: SituacaoNFSeEnum;
      NaturezaEmissao: NaturezaEmissaoNFSeEnum;
      const Serie: StringNullable;
      const NDps: IntegerNullable
    ):NFSeSitacaoModel; static;
    property Id: string read FId;
    property EmpresaId: Integer read FEmpresaId;
    property Situacao: SituacaoNFSeEnum read FSituacao;
    property NaturezaEmissao: NaturezaEmissaoNFSeEnum read FNaturezaEmissao;
    property Serie: StringNullable read FSerie;
    property NDps: IntegerNullable read FNDps;
  end;

  NFSeSitacaoModelArray = array of NFSeSitacaoModel;

implementation

{ NFSeResumoModel }

class function NFSeResumoModel.Create(
  const Id: string;
  EmpresaId: Integer;
  Situacao: SituacaoNFSeEnum;
  NaturezaEmissao: NaturezaEmissaoNFSeEnum;
  TpAmb: TipoAmbienteEnum;
  const Serie: StringNullable;
  const NDps: IntegerNullable;
  const DhEmi: DateTimeNullable;
  Layout: LayoutNFSeEnum;
  const NLote: StringNullable;
  const NProt: StringNullable;
  const Chave: StringNullable;
  const NNFSe: Int64Nullable;
  const SubstituidaPorId: StringNullable;
  const SubstitutaDeId: StringNullable;
  const Documentos: NFSeResumoModelDocArray
): NFSeResumoModel;
begin
  Result.FId := Id;
  Result.FEmpresaId := EmpresaId;
  Result.FSituacao := Situacao;
  Result.FNaturezaEmissao := NaturezaEmissao;
  Result.FTpAmb := TpAmb;
  Result.FSerie := Serie;
  Result.FNDps := NDps;
  Result.FDhEmi := DhEmi;
  Result.FLayout := Layout;
  Result.FNLote := NLote;
  Result.FNProt := NProt;
  Result.FChave := Chave;
  Result.FNNFSe := NNFSe;
  Result.FSubstituidaPorId := SubstituidaPorId;
  Result.FSubstitutaDeId := SubstitutaDeId;
  Result.FDocumentos := Documentos;
end;

function NFSeResumoModel.GetDocumento(TipoDoc: TipoDocNFSeEnum): StringNullable;
var
  I: Integer;
begin
  for I := Low(FDocumentos) to High(FDocumentos) do
    if FDocumentos[I].TipoDoc = TipoDoc then
    begin
      Result := FDocumentos[I].Documento;
      Exit;
    end;

  Result := StringNullable.NullInstance();
end;

{ NFSeResumoModelDoc }

class function NFSeResumoModelDoc.Create(TipoDoc: TipoDocNFSeEnum; Documento: StringNullable): NFSeResumoModelDoc;
begin
  Result.TipoDoc := TipoDoc;
  Result.Documento := Documento;
end;

{ NFSeSitacaoModel }

class function NFSeSitacaoModel.Create(
  const Id: string;
  EmpresaId: Integer;
  Situacao: SituacaoNFSeEnum;
  NaturezaEmissao: NaturezaEmissaoNFSeEnum;
  const Serie: StringNullable;
  const NDps: IntegerNullable
): NFSeSitacaoModel;
begin
  Result.FId := Id;
  Result.FEmpresaId := EmpresaId;
  Result.FSituacao := Situacao;
  Result.FNaturezaEmissao := NaturezaEmissao;
  Result.FSerie := Serie;
  Result.FNDps := NDps;
end;

end.
