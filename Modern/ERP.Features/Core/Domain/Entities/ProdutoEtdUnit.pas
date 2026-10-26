unit ProdutoEtdUnit;

interface

uses
  EntityBaseUnit,
  TipoComunsUnit,
  DateAndTimeNullableUnit,
  StringNullableUnit,
  Contnrs;

type

  ProdutoEtd = class(EntityBase)
  private
    FGrupoId: Integer;
    FCodigoId: string;
    FEmpresaId: Integer;
    FDescricao: string;
    FNCM: string;
    FGrupoFiscalIbsCbsId: StringNullable;
    FRevisadoGrupoFiscalIbsCbsEm: DateNullable;
  public
    constructor Create(
      AGrupoId: Integer;
      const ACodigoId: string;
      AEmpresaId: Integer;
      const ADescricao: string;
      const ANCM: string;
      const AGrupoFiscalIbsCbsId: StringNullable;
      const ARevisadoGrupoFiscalIbsCbsEm: DateNullable
    );

    function Clone(): EntityBase; override;

    property GrupoId: Integer read FGrupoId;
    property CodigoId: string read FCodigoId;
    property EmpresaId: Integer read FEmpresaId;
    property Descricao: string read FDescricao;
    property NCM: string read FNCM;
    property GrupoFiscalIbsCbsId: StringNullable read FGrupoFiscalIbsCbsId;
    property RevisadoGrupoFiscalIbsCbsEm: DateNullable read FRevisadoGrupoFiscalIbsCbsEm;
  end;

  ProdutoEtdList = class(TObjectList);

implementation

{ ProdutoEtd }

function ProdutoEtd.Clone: EntityBase;
begin
  if Self = nil then
    Result := nil
  else
    Result := ProdutoEtd.Create(
      FGrupoId,
      FCodigoId,
      FEmpresaId,
      FDescricao,
      FNCM,
      FGrupoFiscalIbsCbsId,
      FRevisadoGrupoFiscalIbsCbsEm
    );
end;

constructor ProdutoEtd.Create(
  AGrupoId: Integer;
  const ACodigoId: string;
  AEmpresaId: Integer;
  const ADescricao: string;
  const ANCM: string;
  const AGrupoFiscalIbsCbsId: StringNullable;
  const ARevisadoGrupoFiscalIbsCbsEm: DateNullable
);
begin
  FGrupoId := AGrupoId;
  FCodigoId := ACodigoId;
  FEmpresaId := AEmpresaId;
  FDescricao := ADescricao;
  FNCM := ANCM;
  FGrupoFiscalIbsCbsId := AGrupoFiscalIbsCbsId;
  FRevisadoGrupoFiscalIbsCbsEm := ARevisadoGrupoFiscalIbsCbsEm;
end;

end.
