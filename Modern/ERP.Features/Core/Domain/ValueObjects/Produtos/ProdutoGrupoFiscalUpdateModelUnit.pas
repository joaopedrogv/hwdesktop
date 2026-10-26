unit ProdutoGrupoFiscalUpdateModelUnit;

interface

uses
  StringNullableUnit;

type
  ProdutoGrupoFiscalUpdateModel = record
  private
    FGrupoId: Integer;
    FCodigoId: string;
    FEmpresaId: Integer;
    FGrupoFiscalId: StringNullable;
  public
    class function Create(
      GrupoId: Integer;
      const CodigoId: string;
      EmpresaId: Integer;
      const GrupoFiscalId: StringNullable
    ): ProdutoGrupoFiscalUpdateModel; static;

    property GrupoId: Integer read FGrupoId;
    property CodigoId: string read FCodigoId;
    property EmpresaId: Integer read FEmpresaId;
    property GrupoFiscalId: StringNullable read FGrupoFiscalId write FGrupoFiscalId;
  end;

  ProdutoGrupoFiscalUpdateModelArray = array of ProdutoGrupoFiscalUpdateModel;

implementation

{ ProdutoGrupoFiscalUpdateModel }

class function ProdutoGrupoFiscalUpdateModel.Create(
  GrupoId: Integer;
  const CodigoId: string;
  EmpresaId: Integer;
  const GrupoFiscalId: StringNullable
): ProdutoGrupoFiscalUpdateModel;
begin
  Result.FGrupoId := GrupoId;
  Result.FCodigoId := CodigoId;
  Result.FEmpresaId := EmpresaId;
  Result.FGrupoFiscalId := GrupoFiscalId;
end;

end.
