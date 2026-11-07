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
  FilterDefinition in '..\Filters\FilterDefinition.pas',
  FilterCriterion in '..\Filters\FilterCriterion.pas',
  FilterFrame in '..\UI\Frames\FilterFrame.pas' {frmFilterFrame: TFrame},
  QueryStandardForm in '..\UI\Forms\QueryStandardForm.pas' {frmHwNextStandardQuery},
  QueryResultForm in '..\UI\Forms\QueryResultForm.pas' {frmQueryResult},
  EventosRtcForm in '..\UI\Forms\EventosRtcForm.pas' {frmEventosRtc},
  NextSetup in '..\Composition\NextSetup.pas',
  ReaderContextLease in '..\Composition\ReaderContextLease.pas',
  NextQueryDefinition in '..\Queries\NextQueryDefinition.pas',
  EventosRtcDefinition in '..\Queries\EventosRtcDefinition.pas',
  StandardQueryFilterDefinition in '..\Queries\StandardQueryFilterDefinition.pas',
  NextViewCatalog in '..\Interop\Module\NextViewCatalog.pas',
  NextViewExports in '..\Interop\Module\NextViewExports.pas';

{$R *.res}

begin
end.
