unit AjustesRedBenefPcView;

interface

uses
  SysUtils, Classes,
  IViewFeedbackUnit, RegraRedBenefPcEtdUnit;

type
  IAjustesRedBenefPcView = interface(IViewFeedback)
    ['{F6D66D00-36FB-49F7-AFEE-AA54B310CF52}']
    procedure ExibirRegras(ARegras: RegraRedBenefPcEtdList);
  end;

implementation

end.