// Next - Delphi Rio
library hw.next;

uses
  System.SysUtils,
  System.Classes,
  HwNextViewApi in '..\Interop\Contracts\HwNextViewApi.pas',
  NextBaseForm in '..\Interop\Module\NextBaseForm.pas',
  NextViewRegistry in '..\Interop\Module\NextViewRegistry.pas',
  HwNextValidationFormUnit in '..\UI\Forms\Validation\HwNextValidationFormUnit.pas' {frmHwNextValidation},
  DataGridFrame in '..\UI\Frames\Shared\Grid\DataGridFrame.pas' {frmDataGridFrame: TFrame},
  FilterDefinition in '..\Queries\Shared\Filters\FilterDefinition.pas',
  FilterCriterion in '..\Queries\Shared\Filters\FilterCriterion.pas',
  QueryFilterSqlBuilder in '..\Queries\Shared\Filters\QueryFilterSqlBuilder.pas',
  FilterFrame in '..\UI\Frames\Shared\Filters\FilterFrame.pas' {frmFilterFrame: TFrame},
  QueryStandardForm in '..\UI\Forms\Base\QueryStandardForm.pas' {frmQueryStandard},
  QueryResultForm in '..\UI\Forms\Base\QueryResultForm.pas' {frmQueryResult},
  EventosRtcForm in '..\UI\Forms\Features\EventosRtc\EventosRtcForm.pas' {frmEventosRtc},
  NextSetup in '..\Composition\NextSetup.pas',
  NextFeaturesComposition in '..\Composition\NextFeaturesComposition.pas',
  ISessionContextUnit in '..\..\Modern\Core\Domain\Ports\Shared\ISessionContextUnit.pas',
  SessionContextUnit in '..\..\Modern\Core\Application\Contexts\SessionContextUnit.pas',
  NextQueryDefinition in '..\Queries\Shared\NextQueryDefinition.pas',
  EventosRtcDefinition in '..\Queries\Features\EventosRtc\EventosRtcDefinition.pas',
  EventosRtcQuery in '..\Queries\Features\EventosRtc\EventosRtcQuery.pas',
  EventosRtcPresenter in '..\Queries\Features\EventosRtc\EventosRtcPresenter.pas',
  StandardQueryFilterDefinition in '..\Queries\Shared\Filters\StandardQueryFilterDefinition.pas',
  NextViewCatalog in '..\Interop\Module\NextViewCatalog.pas',
  NextViewExports in '..\Interop\Module\NextViewExports.pas',
  QueryResultOperations in '..\Queries\Shared\QueryResultOperations.pas',
  GridColumnDefinition in '..\Contracts\GridColumnDefinition.pas',
  QueryPreviewReader in '..\Composition\QueryPreviewReader.pas';

{$R *.res}

begin
end.
