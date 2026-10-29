unit IViewFeedbackUnit;

interface

uses
  SysUtils, Classes,
  ValidationEntityOutputUnit;

type
  IViewFeedback = interface
    ['{8812EEEA-D813-4877-848B-C49CC6C58286}']
    procedure ExibirValidacoes(const AValidacoes: ValidationEntityOutput);
    procedure ExibirErro(AErro: Exception);
    procedure ExibirInformacao(const AMensagem: string);
  end;

implementation

end.