unit CodigoIndicadorOperacaoNFSeEtdUnit;

interface

uses
  SysUtils, Classes, Contnrs,
  EntityBaseUnit;

type
  CodigoIndicadorOperacaoNFSeEtd = class(EntityBase)
  private
    FCodigo: string;
    FDescricao: string;
  public
    constructor Create(const ACodigo, ADescricao: string);

    function Clone(): EntityBase; override;

    property Codigo: string read FCodigo;
    property Descricao: string read FDescricao;
  end;

  CodigoIndicadorOperacaoNFSeEtdList = class(TObjectList);

implementation

{ CodigoIndicadorOperacaoNFSeEtd }

function CodigoIndicadorOperacaoNFSeEtd.Clone: EntityBase;
begin
  Result := CodigoIndicadorOperacaoNFSeEtd.Create( FCodigo, FDescricao );
end;

constructor CodigoIndicadorOperacaoNFSeEtd.Create(const ACodigo, ADescricao: string);
begin
  FCodigo := ACodigo;
  FDescricao := ADescricao;
end;

end.
