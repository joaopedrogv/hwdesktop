unit ICalcularAjusteRedBenefPcServiceUnit;

interface

uses
  ContextoDocTribPcModelUnit, AjusteRedBenefPcModelUnit;

type

  ICalcularAjusteRedBenefPcService = interface
    ['{80443664-42F1-4F5E-8265-83A91B456998}']
    function Calcular(const Input: ContextoDocTribPcModel): AjusteRedBenefPcModelList;
  end;

implementation

end.
