unit uDtmFiscalHw;

interface

uses
  SysUtils, Classes, IniFiles, IBQuery, IBStoredProc,
  IBDatabase, DB, DBClient, IBCustomDataSet, Provider;

type
  TdtmFiscalHw = class(TDataModule)
    DataSetProvider1: TDataSetProvider;
    IBQuery1: TIBQuery;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    procedure cdsCupomBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    procedure mudaSelect(DataSet: TClientDataSet);
  public
    { Public declarations }
  end;

var
  dtmFiscalHw: TdtmFiscalHw;
  
implementation

{$R *.dfm}

{ TdtmFiscal }

procedure TdtmFiscalHw.cdsCupomBeforeOpen(DataSet: TDataSet);
begin
  mudaSelect(TClientDataSet(DataSet));
end;

procedure TdtmFiscalHw.mudaSelect(DataSet: TClientDataSet);
var
  i: integer;
begin
  if DataSet.CommandText <> '' then
  begin
    for I := 0 to dtmFiscalHw.ComponentCount - 1 do
    begin
      if (dtmFiscalHw.Components[i] is TDataSetProvider) then
        if UpperCase(TDataSetProvider(dtmFiscalHw.Components[i]).Name) =
          UpperCase(DataSet.ProviderName)
          then
        begin
          TIBQuery(TDataSetProvider(dtmFiscalHw.Components[i]).DataSet).SQL.Text :=
            DataSet.CommandText;
          Break;
        end;
    end;
  end;
end;

end.

