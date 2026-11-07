// Next - Delphi Rio
library hw.next;

uses
  System.SysUtils,
  System.Classes,
  HwNextViewApi in '..\Interop\Contracts\HwNextViewApi.pas',
  NextBaseForm in '..\Interop\Module\NextBaseForm.pas',
  NextViewRegistry in '..\Interop\Module\NextViewRegistry.pas',
  HwNextValidationFormUnit in '..\UI\Forms\Validation\HwNextValidationFormUnit.pas' {frmHwNextValidation},
  HwNextValidationSecondFormUnit in '..\UI\Forms\Validation\HwNextValidationSecondFormUnit.pas' {frmHwNextValidationSecond},
  DataGridFrame in '..\UI\Frames\Shared\Grid\DataGridFrame.pas' {frmHwNextGridFrame: TFrame},
  FilterDefinition in '..\Queries\Shared\Filters\FilterDefinition.pas',
  FilterCriterion in '..\Queries\Shared\Filters\FilterCriterion.pas',
  FilterFrame in '..\UI\Frames\Shared\Filters\FilterFrame.pas' {frmFilterFrame: TFrame},
  QueryStandardForm in '..\UI\Forms\Base\QueryStandardForm.pas' {frmHwNextStandardQuery},
  QueryResultForm in '..\UI\Forms\Base\QueryResultForm.pas' {frmQueryResult},
  EventosRtcForm in '..\UI\Forms\Features\EventosRtc\EventosRtcForm.pas' {frmEventosRtc},
  NextSetup in '..\Composition\NextSetup.pas',
  ReaderContextLease in '..\Composition\ReaderContextLease.pas',
  NextQueryDefinition in '..\Queries\Shared\NextQueryDefinition.pas',
  EventosRtcDefinition in '..\Queries\Features\EventosRtc\EventosRtcDefinition.pas',
  StandardQueryFilterDefinition in '..\Queries\Shared\Filters\StandardQueryFilterDefinition.pas',
  NextViewCatalog in '..\Interop\Module\NextViewCatalog.pas',
  NextViewExports in '..\Interop\Module\NextViewExports.pas';

{$R *.res}

begin
end.
