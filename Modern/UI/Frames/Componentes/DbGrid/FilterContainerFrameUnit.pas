unit FilterContainerFrameUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, DB, DBClient, FilterConditionFrameUnit;

type
  TLogVarEvent = procedure(var value: string) of object;

  TFilterContainerFrame = class(TFrame)
    topPanel: TPanel;
  private
    Data: TClientDataSet;
    FOnFilterChange: TLogVarEvent;
    procedure RunFiltro(Sender: TObject);
    procedure RemoveFilterContainer(Sender: TObject);
  public
    procedure CriarFiltro(AField: TFilterConditionFrameInput; Condition: FilterCondition; ANegativeCondition: Boolean); overload;
    procedure CriarFiltro(FieldName: string; Condition: FilterCondition; ANegativeCondition: Boolean); overload;
    procedure ClearAll();
    procedure Setup(AData: TClientDataSet);

    property OnFilterChange: TLogVarEvent read FOnFilterChange write FOnFilterChange;
  end;

implementation

{$R *.dfm}

uses
  StrUtils, UIUtilsUnit, StringServiceUnit;

procedure TFilterContainerFrame.ClearAll;
var
  I: Integer;
  cpnt: TComponent;
begin
  for I := Self.topPanel.ComponentCount - 1 downto 0 do
  begin
    if StartsText('FilterConditionFrame', Self.topPanel.Components[I].Name) and
       (Self.topPanel.Components[I] is TFilterConditionFrame) then
    begin
      cpnt := Self.topPanel.Components[I];
      Self.topPanel.RemoveComponent(Self.topPanel.Components[I]);
      FreeAndNil(cpnt);
    end

    else if StartsText('Splitter', Self.topPanel.Components[I].Name) and
       (Self.topPanel.Components[I] is TSplitter) then
    begin
      cpnt := Self.topPanel.Components[I];
      Self.topPanel.RemoveComponent(Self.topPanel.Components[I]);
      FreeAndNil(cpnt);
    end;
  end;

  Self.RunFiltro(Self);

end;

procedure TFilterContainerFrame.CriarFiltro(FieldName: string; Condition: FilterCondition;
  ANegativeCondition: Boolean);
var
  field: TField;
  clf, lf, I: Integer;
  filterFr: TFilterConditionFrame;
  spliter: TSplitter;
begin
  field := Data.FindField(FieldName);

  if not Assigned(field) then
  begin
    UIUtils.ShowInfo('Campo não encontrado');
    Exit;
  end;

  CriarFiltro( TFilterConditionFrameInput.Create(
    field.FieldName, field.DisplayLabel, field.Value, field.DataType
  ), Condition, ANegativeCondition);
end;

procedure TFilterContainerFrame.CriarFiltro(AField: TFilterConditionFrameInput; Condition: FilterCondition;
  ANegativeCondition: Boolean);
var
  clf, lf, I: Integer;
  filterFr: TFilterConditionFrame;
  spliter: TSplitter;
begin
  if not TFilterConditionFrameHelper.AllowType(AField.DataType) then
  begin
    UIUtils.ShowInfo('Tipo de campo não suportado');
    Exit;
  end;

  lf := 0;

  for I := Self.topPanel.ComponentCount - 1 downto 0 do
    if topPanel.Components[I] is TControl then
    begin
      clf := (topPanel.Components[I] as TControl).Left + (topPanel.Components[I] as TControl).Width;
      if clf > lf then
        lf := clf;
    end;

  Self.topPanel.Tag := Self.topPanel.Tag + 1;
  filterFr          := TFilterConditionFrame.Create(Self.topPanel);
  filterFr.Align    := alRight;
  filterFr.Name     := 'FilterConditionFrame' + IntToStr(Self.topPanel.Tag);
  filterFr.Parent   := Self.topPanel;
  filterFr.Left     := lf + 5;
  filterFr.OnUpdateFilter      := RunFiltro;
  filterFr.OnClickRemoveFilter := RemoveFilterContainer;
  filterFr.Align    := alLeft;

  filterFr.FillForm( AField, Condition, ANegativeCondition );

  spliter    := TSplitter.Create(Self.topPanel);
  spliter.Parent := Self.topPanel;
  spliter.Name   := 'Splitter' + IntToStr(Self.topPanel.Tag);
  spliter.Align  := alLeft;
  spliter.Left   := filterFr.Left + filterFr.Width + 5;
  spliter.Beveled := True;
  spliter.AlignWithMargins := True;
  spliter.Margins.Left := 0;
  spliter.Margins.Right := 0;
  spliter.Margins.Top := 6;
  spliter.Margins.Bottom := 6;

  RunFiltro(Self);
end;

procedure TFilterContainerFrame.Setup(AData: TClientDataSet);
begin
  Data := AData;
end;

procedure TFilterContainerFrame.RemoveFilterContainer(Sender: TObject);
var
  filterFr: TFilterConditionFrame;
  filterName, spliterName: string;
  I: Integer;
  cpnt: TComponent;
begin
  if not (Sender is TFilterConditionFrame) then
    Exit;

  filterFr := (Sender as TFilterConditionFrame);
  filterName := 'FilterConditionFrame' + StringService.OnlyNumber(filterFr.Name);
  spliterName := 'Splitter' + StringService.OnlyNumber(filterFr.Name);

  for I := Self.topPanel.ComponentCount - 1 downto 0 do
  begin
    if (Trim(filterName) = '') and (Trim(spliterName) = '') then
      break;

    if Self.topPanel.Components[I].Name = filterName then
    begin
      cpnt := Self.topPanel.Components[I];
      Self.topPanel.RemoveComponent(Self.topPanel.Components[I]);
      FreeAndNil(cpnt);

      filterName := '';
    end
    else if Self.topPanel.Components[I].Name = spliterName then
    begin
      cpnt := Self.topPanel.Components[I];
      Self.topPanel.RemoveComponent(Self.topPanel.Components[I]);
      FreeAndNil(cpnt);

      spliterName := '';
    end
  end;

  Self.RunFiltro(Self);
end;

procedure TFilterContainerFrame.RunFiltro(Sender: TObject);
var
  filtro: string;
  I: Integer;
begin
  filtro := '';
  for I := 0 to Self.topPanel.ComponentCount - 1 do
    if (Self.topPanel.Components[I] is TFilterConditionFrame) then
      filtro := filtro + IfThen(Trim(filtro) <> '', ' and ') + (Self.topPanel.Components[I] as TFilterConditionFrame).FilterString();

  if Assigned(FOnFilterChange) then
    FOnFilterChange(filtro);

  Data.Filter := filtro;
  Data.Filtered := Trim(filtro) <> '';
end;

end.
