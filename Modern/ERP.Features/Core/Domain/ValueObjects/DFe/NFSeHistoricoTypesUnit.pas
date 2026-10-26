unit NFSeHistoricoTypesUnit;

interface

uses NFSeTypesUnit;

type
  NFSeHistoricoModel = record
  private
    FNFSeId: string;
    FEmpresaId: Integer;
    FTipo: TipoHistoricoNFSeEnum;
    FDescricao: string;
  public
    class function Create(
      const NFSeId: string;
      EmpresaId: Integer;
      Tipo: TipoHistoricoNFSeEnum;
      const Descricao: string
    ): NFSeHistoricoModel; static;

    property NFSeId: string read FNFSeId;
    property EmpresaId: Integer read FEmpresaId;
    property Tipo: TipoHistoricoNFSeEnum read FTipo write FTipo;
    property Descricao: string read FDescricao;
  end;

  NFSeUltimoHistoricoModel = record
  private
    FNFSeId: string;
    FEmpresaId: Integer;
    FDescricao: string;
  public
    class function Create(
      const NFSeId: string;
      EmpresaId: Integer;
      const Descricao: string
    ): NFSeUltimoHistoricoModel; static;

    property NFSeId: string read FNFSeId;
    property EmpresaId: Integer read FEmpresaId;
    property Descricao: string read FDescricao;
  end;

implementation

{ NFSeUltimoHistoricoModel }

class function NFSeUltimoHistoricoModel.Create(
  const NFSeId: string;
  EmpresaId: Integer;
  const Descricao: string
): NFSeUltimoHistoricoModel;
begin
  Result.FNFSeId := NFSeId;
  Result.FEmpresaId := EmpresaId;
  Result.FDescricao := Descricao;
end;

{ NFSeHistoricoModel }

class function NFSeHistoricoModel.Create(
  const NFSeId: string;
  EmpresaId: Integer;
  Tipo: TipoHistoricoNFSeEnum;
  const Descricao: string
): NFSeHistoricoModel;
begin
  Result.FNFSeId := NFSeId;
  Result.FEmpresaId := EmpresaId;
  Result.FTipo := Tipo;
  Result.FDescricao := Descricao;
end;

end.
