unit CodigoTributacaoNacionalNFSeEtdUnit;

interface

uses
  SysUtils, Classes, Contnrs,
  EntityBaseUnit;

type
  CodigoTributacaoNacionalNFSeEtd = class(EntityBase)
  private
    FCodigo: string;
    FDescricao: string;
  public
    constructor Create(const ACodigo, ADescricao: string);

    function Clone(): EntityBase; override;

    property Codigo: string read FCodigo;
    property Descricao: string read FDescricao;
  end;

  CodigoTributacaoNacionalNFSeEtdList = class(TObjectList);

implementation

{ CodigoTributacaoNacionalNFSeEtd }

function CodigoTributacaoNacionalNFSeEtd.Clone: EntityBase;
begin
  Result := CodigoTributacaoNacionalNFSeEtd.Create( FCodigo, FDescricao );
end;

constructor CodigoTributacaoNacionalNFSeEtd.Create(const ACodigo, ADescricao: string);
begin
  FCodigo := ACodigo;
  FDescricao := ADescricao;
end;

end.

