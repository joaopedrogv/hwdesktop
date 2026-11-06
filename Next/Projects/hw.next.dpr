// Next - Delphi Rio
library hw.next;

uses
  System.SysUtils,
  System.Classes,
  HwNextViewApi in '..\Interop\Contracts\HwNextViewApi.pas',
  NextBaseForm in '..\Interop\Module\NextBaseForm.pas',
  NextViewRegistry in '..\Interop\Module\NextViewRegistry.pas',
  HwNextValidationFormUnit in '..\Interop\Module\HwNextValidationFormUnit.pas' {frmHwNextValidation},
  HwNextValidationSecondFormUnit in '..\Interop\Module\HwNextValidationSecondFormUnit.pas' {frmHwNextValidationSecond},
  DataGridFrame in '..\UI\Frames\DataGridFrame.pas' {frmHwNextGridFrame: TFrame},
  QueryStandardForm in '..\UI\Forms\QueryStandardForm.pas' {frmHwNextStandardQuery},
  EventosRtcForm in '..\UI\Forms\EventosRtcForm.pas' {frmEventosRtc},
  NextSetup in '..\Composition\NextSetup.pas',
  EventosRtcQuery in '..\Queries\EventosRtcQuery.pas',
  NextViewCatalog in '..\Interop\Module\NextViewCatalog.pas',
  NextViewExports in '..\Interop\Module\NextViewExports.pas';

{$R *.res}

begin
end.
