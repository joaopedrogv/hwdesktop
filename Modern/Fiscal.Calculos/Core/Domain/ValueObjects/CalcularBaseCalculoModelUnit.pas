unit CalcularBaseCalculoModelUnit;
 
interface
 
uses
  SysUtils, Classes;

type
  BaseCalculoISMercadoriasModel = record
  private
    FAnoFatoGerador: SmallInt;
    FValorBem: Currency;
    FAjusteAcrescimos: Currency;
    FJuros: Currency;
    FMultas: Currency;
    FEncargos: Currency;
    FFreteCobrado: Currency;
    FOutrosTributos: Currency;
    FDemaisImportancias: Currency;
    FICMS: Currency;
    FISS: Currency;
    FIPI: Currency;
    FDescontoIncondicional: Currency;
    FBonificacao: Currency;
    FDevolucaoVendas: Currency;
  public
    class function Create(
      AAnoFatoGerador: SmallInt;
      AValorBem: Currency;
      AAjusteAcrescimos: Currency;
      AJuros: Currency;
      AMultas: Currency;
      AEncargos: Currency;
      AFreteCobrado: Currency;
      AOutrosTributos: Currency;
      ADemaisImportancias: Currency;
      AICMS: Currency;
      AISS: Currency;
      AIPI: Currency;
      ADescontoIncondicional: Currency;
      ABonificacao: Currency;
      ADevolucaoVendas: Currency
    ): BaseCalculoISMercadoriasModel; static;

    property AnoFatoGerador: SmallInt read FAnoFatoGerador;
    property ValorBem: Currency read FValorBem;
    property AjusteAcrescimos: Currency read FAjusteAcrescimos;
    property Juros: Currency read FJuros;
    property Multas: Currency read FMultas;
    property Encargos: Currency read FEncargos;
    property FreteCobrado: Currency read FFreteCobrado;
    property OutrosTributos: Currency read FOutrosTributos;
    property DemaisImportancias: Currency read FDemaisImportancias;
    property ICMS: Currency read FICMS;
    property ISS: Currency read FISS;
    property IPI: Currency read FIPI;
    property DescontoIncondicional: Currency read FDescontoIncondicional;
    property Bonificacao: Currency read FBonificacao;
    property DevolucaoVendas: Currency read FDevolucaoVendas;
  end;

  BaseCalculoIbsCbsModel = record
  private
    FAnoFatoGerador: SmallInt;
    FValorBem: Currency;
    FAjusteAcrescimos: Currency;
    FJuros: Currency;
    FMultas: Currency;
    FEncargos: Currency;
    FFrete: Currency;
    FOutrosTributos: Currency;
    FImpostoSeletivo: Currency;
    FDemaIsImportancias: Currency;
    FICMS: Currency;
    FISS: Currency;
    FPIS: Currency;
    FCOFINS: Currency;
    FIPI: Currency;
    FDescontoIncondicional: Currency;
  public
    class function Create(
      AAnoFatoGerador: SmallInt;
      AValorBem: Currency;
      AAjusteAcrescimos: Currency;
      AJuros: Currency;
      AMultas: Currency;
      AEncargos: Currency;
      AFrete: Currency;
      AOutrosTributos: Currency;
      AImpostoSeletivo: Currency;
      ADemaIsImportancias: Currency;
      AICMS: Currency;
      AISS: Currency;
      APIS: Currency;
      ACOFINS: Currency;
      AIPI: Currency;
      ADescontoIncondicional: Currency
    ): BaseCalculoIbsCbsModel; static;

    property AnoFatoGerador: SmallInt read FAnoFatoGerador;
    property ValorBem: Currency read FValorBem;
    property AjusteAcrescimos: Currency read FAjusteAcrescimos;
    property Juros: Currency read FJuros;
    property Multas: Currency read FMultas;
    property Encargos: Currency read FEncargos;
    property Frete: Currency read FFrete;
    property OutrosTributos: Currency read FOutrosTributos;
    property ImpostoSeletivo: Currency read FImpostoSeletivo;
    property DemaisImportancias: Currency read FDemaIsImportancias;
    property ICMS: Currency read FICMS;
    property ISS: Currency read FISS;
    property PIS: Currency read FPIS;
    property COFINS: Currency read FCOFINS;
    property IPI: Currency read FIPI;
    property DescontoIncondicional: Currency read FDescontoIncondicional;
  end;
 
implementation

{ BaseCalculoISMercadoriasModel }

class function BaseCalculoISMercadoriasModel.Create(
  AAnoFatoGerador: SmallInt;
  AValorBem: Currency;
  AAjusteAcrescimos: Currency;
  AJuros: Currency;
  AMultas: Currency;
  AEncargos: Currency;
  AFreteCobrado: Currency;
  AOutrosTributos: Currency;
  ADemaisImportancias: Currency;
  AICMS: Currency;
  AISS: Currency;
  AIPI: Currency;
  ADescontoIncondicional: Currency;
  ABonificacao: Currency;
  ADevolucaoVendas: Currency
): BaseCalculoISMercadoriasModel;
begin
  Result.FAnoFatoGerador := AAnoFatoGerador;
  Result.FValorBem := AValorBem;
  Result.FAjusteAcrescimos := AAjusteAcrescimos;
  Result.FJuros := AJuros;
  Result.FMultas := AMultas;
  Result.FEncargos := AEncargos;
  Result.FFreteCobrado := AFreteCobrado;
  Result.FOutrosTributos := AOutrosTributos;
  Result.FDemaisImportancias := ADemaisImportancias;
  Result.FICMS := AICMS;
  Result.FISS := AISS;
  Result.FIPI := AIPI;
  Result.FDescontoIncondicional := ADescontoIncondicional;
  Result.FBonificacao := ABonificacao;
  Result.FDevolucaoVendas := ADevolucaoVendas;
end;

{ BaseCalculoIbsCbsModel }

class function BaseCalculoIbsCbsModel.Create(
  AAnoFatoGerador: SmallInt;
  AValorBem: Currency;
  AAjusteAcrescimos: Currency;
  AJuros: Currency;
  AMultas: Currency;
  AEncargos: Currency;
  AFrete: Currency;
  AOutrosTributos: Currency;
  AImpostoSeletivo: Currency;
  ADemaIsImportancias: Currency;
  AICMS: Currency;
  AISS: Currency;
  APIS: Currency;
  ACOFINS: Currency;
  AIPI: Currency;
  ADescontoIncondicional: Currency
): BaseCalculoIbsCbsModel;
begin
  Result.FAnoFatoGerador := AAnoFatoGerador;
  Result.FValorBem := AValorBem;
  Result.FAjusteAcrescimos := AAjusteAcrescimos;
  Result.FJuros := AJuros;
  Result.FMultas := AMultas;
  Result.FEncargos := AEncargos;
  Result.FFrete := AFrete;
  Result.FOutrosTributos := AOutrosTributos;
  Result.FImpostoSeletivo := AImpostoSeletivo;
  Result.FDemaIsImportancias := ADemaIsImportancias;
  Result.FICMS := AICMS;
  Result.FISS := AISS;
  Result.FPIS := APIS;
  Result.FCOFINS := ACOFINS;
  Result.FIPI := AIPI;
  Result.FDescontoIncondicional := ADescontoIncondicional;
end;

end.

