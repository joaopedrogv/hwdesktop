unit ObterResumoDadosFiscaisOutputUnit;

interface

uses
  TipoComunsUnit,
  AnexoEtdUnit,
  NcmEtdUnit,
  TipoTributoFiscalEnumUnit,
  ProdutoAnexoResumoModelUnit,
  GrupoFiscalEtdUnit;

type
  ObterResumoDadosFiscaisOutput = class
  private
    FTipoTributo: TipoTributoFiscalEnum;
    FAnexos: AnexosEtd;
    FAnexosCompativeis: AnexosEtd;
    FAnexosAgrupados: TArrayString;
    FAnexosCompativeisAgrupados: TArrayString;
    FGruposFiscais: GruposFiscaisEtd;
    //FNcmsCompativeis: NcmsEtd;
    FResumoProdutos: ProdutoAnexoResumoModel;
  public
    constructor Create(
      ATipoTributo: TipoTributoFiscalEnum;
      const AAnexos: AnexosEtd;
      const AAnexosCompativeis: AnexosEtd;
      const AAnexosAgrupados: TArrayString;
      const AAnexosCompativeisAgrupados: TArrayString;
      AGruposFiscais: GruposFiscaisEtd;
      //ANcmsCompativeis: NcmsEtd;
      const AResumoProdutos: ProdutoAnexoResumoModel
    );
    destructor Destroy; override;

    property TipoTributo: TipoTributoFiscalEnum read FTipoTributo;
    property Anexos: AnexosEtd read FAnexos;
    property AnexosCompativeis: AnexosEtd read FAnexosCompativeis;
    property AnexosAgrupados: TArrayString read FAnexosAgrupados;
    property AnexosCompativeisAgrupados: TArrayString read FAnexosCompativeisAgrupados;
    property GruposFiscais: GruposFiscaisEtd read FGruposFiscais;
    //property NcmsCompativeis: NcmsEtd read FNcmsCompativeis;
    property ResumoProdutos: ProdutoAnexoResumoModel read FResumoProdutos;
  end;

implementation

uses
  SysUtils;

{ ObterResumoDadosFiscaisOutput }

constructor ObterResumoDadosFiscaisOutput.Create(
  ATipoTributo: TipoTributoFiscalEnum;
  const AAnexos: AnexosEtd;
  const AAnexosCompativeis: AnexosEtd;
  const AAnexosAgrupados: TArrayString;
  const AAnexosCompativeisAgrupados: TArrayString;
  AGruposFiscais: GruposFiscaisEtd;
  //ANcmsCompativeis: NcmsEtd;
  const AResumoProdutos: ProdutoAnexoResumoModel
);
begin
  FTipoTributo := ATipoTributo;
  FAnexos := AAnexos;
  FAnexosCompativeis := AAnexosCompativeis;
  FAnexosAgrupados := AAnexosAgrupados;
  FAnexosCompativeisAgrupados := AAnexosCompativeisAgrupados;
  FGruposFiscais := AGruposFiscais;
  //FNcmsCompativeis := ANcmsCompativeis;
  FResumoProdutos := AResumoProdutos;
end;

destructor ObterResumoDadosFiscaisOutput.Destroy;
begin
  if Assigned(FGruposFiscais) then
    FreeAndNil(FGruposFiscais);

  //if Assigned(FNcmsCompativeis) then
    //FreeAndNil(FNcmsCompativeis);

  inherited;
end;

end.
//unit ObterResumoDadosFiscaisOutputUnit;
//
//interface
//
//uses
//  TipoComunsUnit,
//  AnexoEtdUnit,
//  NcmEtdUnit,
//  GrupoFiscalEtdUnit;
//
//type
//  ObterResumoDadosFiscaisOutput = class
//  private
//    FAnexosIbsCbs: AnexosEtd;
//    FAnexosImpSel: AnexosEtd;
//    FAnexosIbsCbsCompativeis: AnexosEtd;
//    FAnexosImpSelCompativeis: AnexosEtd;
//    FAnexosIbsCbsAgrupados: TArrayString;
//    FAnexosImpSelAgrupados: TArrayString;
//    FAnexosIbsCbsCompativeisAgrupados: TArrayString;
//    FAnexosImpSelCompativeisAgrupados: TArrayString;
//    FGruposFiscais: GruposFiscaisEtd;
//    FNcmsIbsCbsCompativeis: NcmsEtd;
//    FNcmsImpSelCompativeis: NcmsEtd;
//    FQtdeProdutosCompativeisIbsCbs: Integer;
//    FQtdeProdutosCompativeisImpSel: Integer;
//  public
//    constructor Create(
//      const AAnexosIbsCbs: AnexosEtd;
//      const AAnexosImpSel: AnexosEtd;
//      const AAnexosIbsCbsCompativeis: AnexosEtd;
//      const AAnexosImpSelCompativeis: AnexosEtd;
//      const AAnexosIbsCbsAgrupados: TArrayString;
//      const AAnexosImpSelAgrupados: TArrayString;
//      const AAnexosIbsCbsCompativeisAgrupados: TArrayString;
//      const AAnexosImpSelCompativeisAgrupados: TArrayString;
//      AGruposFiscais: GruposFiscaisEtd;
//      ANcmsIbsCbsCompativeis: NcmsEtd;
//      ANcmsImpSelCompativeis: NcmsEtd;
//      AQtdeProdutosCompativeisIbsCbs: Integer;
//      AQtdeProdutosCompativeisImpSel: Integer
//    );
//    destructor Destroy; override;
//
//    property AnexosIbsCbs: AnexosEtd read FAnexosIbsCbs;
//    property AnexosImpSel: AnexosEtd read FAnexosImpSel;
//    property AnexosIbsCbsCompativeis: AnexosEtd read FAnexosIbsCbsCompativeis;
//    property AnexosImpSelCompativeis: AnexosEtd read FAnexosImpSelCompativeis;
//    property AnexosIbsCbsAgrupados: TArrayString read FAnexosIbsCbsAgrupados;
//    property AnexosImpSelAgrupados: TArrayString read FAnexosImpSelAgrupados;
//    property AnexosIbsCbsCompativeisAgrupados: TArrayString read FAnexosIbsCbsCompativeisAgrupados;
//    property AnexosImpSelCompativeisAgrupados: TArrayString read FAnexosImpSelCompativeisAgrupados;
//    property GruposFiscais: GruposFiscaisEtd read FGruposFiscais;
//    property NcmsIbsCbsCompativeis: NcmsEtd read FNcmsIbsCbsCompativeis;
//    property NcmsImpSelCompativeis: NcmsEtd read FNcmsImpSelCompativeis;
//    property QtdeProdutosCompativeisIbsCbs: Integer read FQtdeProdutosCompativeisIbsCbs;
//    property QtdeProdutosCompativeisImpSel: Integer read FQtdeProdutosCompativeisImpSel;
//  end;
//
//implementation
//
//uses
//  SysUtils;
//
//{ ObterResumoDadosFiscaisOutput }
//
//constructor ObterResumoDadosFiscaisOutput.Create(
//  const AAnexosIbsCbs: AnexosEtd;
//  const AAnexosImpSel: AnexosEtd;
//  const AAnexosIbsCbsCompativeis: AnexosEtd;
//  const AAnexosImpSelCompativeis: AnexosEtd;
//  const AAnexosIbsCbsAgrupados: TArrayString;
//  const AAnexosImpSelAgrupados: TArrayString;
//  const AAnexosIbsCbsCompativeisAgrupados: TArrayString;
//  const AAnexosImpSelCompativeisAgrupados: TArrayString;
//  AGruposFiscais: GruposFiscaisEtd;
//  ANcmsIbsCbsCompativeis: NcmsEtd;
//  ANcmsImpSelCompativeis: NcmsEtd;
//  AQtdeProdutosCompativeisIbsCbs: Integer;
//  AQtdeProdutosCompativeisImpSel: Integer
//);
//begin
//  FAnexosIbsCbs := AAnexosIbsCbs;
//  FAnexosImpSel := AAnexosImpSel;
//  FAnexosIbsCbsCompativeis := AAnexosIbsCbsCompativeis;
//  FAnexosImpSelCompativeis := AAnexosImpSelCompativeis;
//  FAnexosIbsCbsAgrupados := AAnexosIbsCbsAgrupados;
//  FAnexosImpSelAgrupados := AAnexosImpSelAgrupados;
//  FAnexosIbsCbsCompativeisAgrupados := AAnexosIbsCbsCompativeisAgrupados;
//  FAnexosImpSelCompativeisAgrupados := AAnexosImpSelCompativeisAgrupados;
//  FGruposFiscais := AGruposFiscais;
//  FNcmsIbsCbsCompativeis := ANcmsIbsCbsCompativeis;
//  FNcmsImpSelCompativeis := ANcmsImpSelCompativeis;
//  FQtdeProdutosCompativeisIbsCbs := AQtdeProdutosCompativeisIbsCbs;
//  FQtdeProdutosCompativeisImpSel := AQtdeProdutosCompativeisImpSel;
//end;
//
//destructor ObterResumoDadosFiscaisOutput.Destroy;
//begin
//  if Assigned(FGruposFiscais) then
//    FreeAndNil(FGruposFiscais);
//
//  if Assigned(FNcmsIbsCbsCompativeis) then
//    FreeAndNil(FNcmsIbsCbsCompativeis);
//
//  inherited;
//end;
//
//end.
