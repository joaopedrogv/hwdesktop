unit ProdutoNcmGrupoFiscalUpdateModelUnit;

interface

uses
  StringNullableUnit;

type
  ProdutoNcmGrupoFiscalUpdateModel = record
  private
    FNCM: string;
    FEmpresaId: Integer;
    FGrupoFiscalId: StringNullable;
  public
    class function Create(
      const NCM: string;
      EmpresaId: Integer;
      const GrupoFiscalId: StringNullable
    ): ProdutoNcmGrupoFiscalUpdateModel; static;

    property NCM: string read FNCM;
    property EmpresaId: Integer read FEmpresaId;
    property GrupoFiscalId: StringNullable read FGrupoFiscalId write FGrupoFiscalId;
  end;

  ProdutoNcmGrupoFiscalUpdateModelArray = array of ProdutoNcmGrupoFiscalUpdateModel;

implementation

{ ProdutoNcmGrupoFiscalUpdateModel }

class function ProdutoNcmGrupoFiscalUpdateModel.Create(
  const NCM: string;
  EmpresaId: Integer;
  const GrupoFiscalId: StringNullable
): ProdutoNcmGrupoFiscalUpdateModel;
begin
  Result.FNCM := NCM;
  Result.FEmpresaId := EmpresaId;
  Result.FGrupoFiscalId := GrupoFiscalId;
end;

end.
