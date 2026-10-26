unit FundamentacaoClassificacaoModelUnit;

interface

uses
  TipoComunsUnit;

type
  FundamentacaoClassificacaoModel = record
  private
    FInstance: RecordInstance;
    FTextoCurto: string;
    FMemoriaCalculo: string;
  public
    class function NullInstance(): FundamentacaoClassificacaoModel; static;
    class function Create(const TextoCurto, MemoriaCalculo: string): FundamentacaoClassificacaoModel; static;

    function IsNull(): Boolean;

    property TextoCurto: string read FTextoCurto;
    property MemoriaCalculo: string read FMemoriaCalculo;
  end;

implementation

{ FundamentacaoClassificacaoModel }

class function FundamentacaoClassificacaoModel.Create(const TextoCurto,
  MemoriaCalculo: string): FundamentacaoClassificacaoModel;
begin
  Result.FInstance := riNotNull;
  Result.FTextoCurto := TextoCurto;
  Result.FMemoriaCalculo := MemoriaCalculo;
end;

function FundamentacaoClassificacaoModel.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

class function FundamentacaoClassificacaoModel.NullInstance: FundamentacaoClassificacaoModel;
begin
  Result.FInstance := riNull;
end;

end.
