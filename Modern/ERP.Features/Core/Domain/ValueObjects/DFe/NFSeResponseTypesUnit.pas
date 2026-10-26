unit NFSeResponseTypesUnit;

interface

uses
  IntegerNullableUnit,
  CurrencyNullableUnit, StringNullableUnit, NFSeTypesUnit;

type
  // Contem os dados extraidos do compoente ACBr enviar para entidade do banco de dados

  NFSeResponseAutorizacaoValoresModel = record
  private
    FValorLiquido: Currency;
    FValotTotalNF: Currency;
    FValorTotalRetencoes: Currency;
    FBaseCalculoISS: CurrencyNullable;
    FAliquotaISS: CurrencyNullable;
    FValorISS: CurrencyNullable;
  public
    class function Create(
      AValorLiquido, AValotTotalNF, AValorTotalRetencoes: Currency;
      const ABaseCalculoISS, AAliquotaISS, AValorISS: CurrencyNullable
    ): NFSeResponseAutorizacaoValoresModel; static;

    property ValorLiquido: Currency read FValorLiquido;
    property ValotTotalNF: Currency read FValotTotalNF;
    property ValorTotalRetencoes: Currency read FValorTotalRetencoes;
    property BaseCalculoISS: CurrencyNullable read FBaseCalculoISS;
    property AliquotaISS: CurrencyNullable read FAliquotaISS;
    property ValorISS: CurrencyNullable read FValorISS;
  end;

  NFSeResponseAutorizacaoModel = class
  private
    FChaveNFSe: string;
    FCodigoVerificacao: StringNullable;
    FcStat: string;
    FDataProcessamento: TDateTime;
    FNumeroNFSe: Int64;
    FNumeroDFSe: Int64Nullable;
    FValores: NFSeResponseAutorizacaoValoresModel;
    FPercentualRedutor: CurrencyNullable;
    FProtocolo: StringNullable;
    FChaveNFSeSubstituida: string;
    FXmlAutorizacao: StringNullable;
  public
    constructor Create(
      const AChaveNFSe: string;
      const ACodigoVerificacao: StringNullable;
      const AcStat: string;
      ADataProcessamento: TDateTime;
      ANumeroNFSe: Int64;
      const ANumeroDFSe: Int64Nullable;
      const AValores: NFSeResponseAutorizacaoValoresModel;
      const APercentualRedutor: CurrencyNullable;
      const AProtocolo: StringNullable;
      const AChaveNFSeSubstituida: string;
      const AXmlAutorizacao: StringNullable
    );
    property ChaveNFSe: string read FChaveNFSe;
    property CodigoVerificacao: StringNullable read FCodigoVerificacao;
    property cStat: string read FcStat;
    property DataProcessamento: TDateTime read FDataProcessamento;
    property NumeroNFSe: Int64 read FNumeroNFSe;
    property NumeroDFSe: Int64Nullable read FNumeroDFSe;
    property Valores: NFSeResponseAutorizacaoValoresModel read FValores;
    property PercentualRedutor: CurrencyNullable read FPercentualRedutor;
    property Protocolo: StringNullable read FProtocolo;
    property ChaveNFSeSubstituida: string read FChaveNFSeSubstituida;
    property XmlAutorizacao: StringNullable read FXmlAutorizacao;
  end;

  // DAQUI PRA BAIXO E SO RECORD, POSSIVELMENTE VOU APAGAR
  // Contem os dados extraidos do compoente ACBr enviar para entidade do banco de dados


  // Contem os dados extraidos do compoente ACBr enviar para entidade do banco de dados
  NFSeResponseCancelamentoModel = class
  private
    FDataProcessamento: TDateTime;
    FNumSeqEvento: IntegerNullable;
    FXmlCancelamento: StringNullable;
    FOrigem: OrigemCancelamentoNFSeEnum;
  public
    constructor Create(
      ADataProcessamento: TDateTime;
      const ANumSeqEvento: IntegerNullable;
      const AXmlCancelamento: StringNullable;
      AOrigem: OrigemCancelamentoNFSeEnum
    );
    function Clone(): NFSeResponseCancelamentoModel;

    property DataProcessamento: TDateTime read FDataProcessamento;
    property NumSeqEvento: IntegerNullable read FNumSeqEvento;
    property XmlCancelamento: StringNullable read FXmlCancelamento;
    property Origem: OrigemCancelamentoNFSeEnum read FOrigem;
  end;

  NFSeResponseSubstituicaoModel = class
  private
    FAutorizacao: NFSeResponseAutorizacaoModel;
    FCancelamento: NFSeResponseCancelamentoModel;
  public
    constructor Create(
      AAutorizacao: NFSeResponseAutorizacaoModel;
      ACancelamento: NFSeResponseCancelamentoModel
    );
    destructor Destroy; override;

    property Autorizacao: NFSeResponseAutorizacaoModel read FAutorizacao;
    property Cancelamento: NFSeResponseCancelamentoModel read FCancelamento;
  end;

  NFSeResponseConsultaModel = record
  public
//    property

  end;

//  NFSeResponseConsultaModel = record
//  private
//    FAutorizacao: NFSeResponseAutorizacaoModel;
//    FCancelamento: NFSeResponseCancelamentoModel;
//  public
//    class function Create(
//      const Autorizacao: NFSeResponseAutorizacaoModel;
//      const Cancelamento: NFSeResponseCancelamentoModel
//    ): NFSeResponseConsultaModel; static;
//    property Autorizacao: NFSeResponseAutorizacaoModel read FAutorizacao;
//    property Cancelamento: NFSeResponseCancelamentoModel read FCancelamento;
//  end;

implementation

{ NFSeResponseAutorizacaoModel }

constructor NFSeResponseAutorizacaoModel.Create(
  const AChaveNFSe: string;
  const ACodigoVerificacao: StringNullable;
  const AcStat: string;
  ADataProcessamento: TDateTime;
  ANumeroNFSe: Int64;
  const ANumeroDFSe: Int64Nullable;
  const AValores: NFSeResponseAutorizacaoValoresModel;
  const APercentualRedutor: CurrencyNullable;
  const AProtocolo: StringNullable;
  const AChaveNFSeSubstituida: string;
  const AXmlAutorizacao: StringNullable
);
begin
  FChaveNFSe := AChaveNFSe;
  FCodigoVerificacao := ACodigoVerificacao;
  FcStat := AcStat;
  FDataProcessamento := ADataProcessamento;
  FNumeroNFSe := ANumeroNFSe;
  FNumeroDFSe := ANumeroDFSe;
  FValores := AValores;
  FPercentualRedutor := APercentualRedutor;
  FProtocolo := AProtocolo;
  FChaveNFSeSubstituida := AChaveNFSeSubstituida;
  FXmlAutorizacao := AXmlAutorizacao;
end;

{ NFSeResponseCancelamentoModel }

function NFSeResponseCancelamentoModel.Clone(): NFSeResponseCancelamentoModel;
begin
  Result := NFSeResponseCancelamentoModel.Create(FDataProcessamento, FNumSeqEvento, FXmlCancelamento, FOrigem);
end;

constructor NFSeResponseCancelamentoModel.Create(
  ADataProcessamento: TDateTime;
  const ANumSeqEvento: IntegerNullable;
  const AXmlCancelamento: StringNullable;
  AOrigem: OrigemCancelamentoNFSeEnum
);
begin
  FDataProcessamento := ADataProcessamento;
  FNumSeqEvento := ANumSeqEvento;
  FXmlCancelamento := AXmlCancelamento;
  FOrigem := AOrigem;
end;

{ NFSeResponseSubstituicaoModel }

constructor NFSeResponseSubstituicaoModel.Create(
  AAutorizacao: NFSeResponseAutorizacaoModel;
  ACancelamento: NFSeResponseCancelamentoModel
);
begin
  FAutorizacao := AAutorizacao;
  FCancelamento := ACancelamento;
end;

destructor NFSeResponseSubstituicaoModel.Destroy;
begin
  FAutorizacao.Free();
  FCancelamento.Free();
  inherited;
end;

{ NFSeResponseAutorizacaoValoresModel }

class function NFSeResponseAutorizacaoValoresModel.Create(
  AValorLiquido, AValotTotalNF, AValorTotalRetencoes: Currency;
  const ABaseCalculoISS, AAliquotaISS, AValorISS: CurrencyNullable
): NFSeResponseAutorizacaoValoresModel;
begin
  Result.FValorLiquido := AValorLiquido;
  Result.FValotTotalNF := AValotTotalNF;
  Result.FValorTotalRetencoes := AValorTotalRetencoes;
  Result.FBaseCalculoISS := ABaseCalculoISS;
  Result.FAliquotaISS := AAliquotaISS;
  Result.FValorISS := AValorISS;
end;

end.
