unit udtmTMO;

interface

uses
  SysUtils, Classes, DB, DBClient,uDtmAtivo, IBCustomDataSet, IBQuery,
  IBDatabase, Provider;

type
  TdtmTMO = class(TDataModule)
    IBTransTMO: TIBTransaction;
    cdsTMO2: TClientDataSet;
    IntegerField1: TIntegerField;
    DateTimeField1: TDateTimeField;
    IntegerField2: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    IntegerField3: TIntegerField;
    StringField3: TStringField;
    DateTimeField2: TDateTimeField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    dspTMO2: TDataSetProvider;
    dsTMO2: TDataSource;
    qrTMO2: TIBQuery;
    cdsColab: TClientDataSet;
    dspColab: TDataSetProvider;
    dsColab: TDataSource;
    qrColab: TIBQuery;
    cdsServ: TClientDataSet;
    dspServ: TDataSetProvider;
    dsServ: TDataSource;
    qrServ: TIBQuery;
    cdsColabCOD_VENDEDOR: TIntegerField;
    cdsColabNOME_VENDEDOR: TStringField;
    cdsServCOD_SERVICO: TIntegerField;
    cdsServDESC_SERVICO: TStringField;
    qrBuscas: TIBQuery;
    cdsServTMO: TFloatField;
    procedure cdsTMOBeforeOpen(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmTMO: TdtmTMO;

implementation

{$R *.dfm}

procedure TdtmTMO.cdsTMOBeforeOpen(DataSet: TDataSet);
begin
dtmAtivo.mudaSelect(TClientDataSet(DataSet),dtmTMO);
end;

procedure TdtmTMO.DataModuleCreate(Sender: TObject);
var
  J, I: Integer;
begin
  for J := 0 to Self.ComponentCount - 1 do
    if Self.Components[J] is TClientDataSet then
      for I := 0 to TClientDataSet(Self.Components[J]).FieldCount - 1 do
      begin
        TClientDataSet(Self.Components[J]).IndexDefs.Add('IDXA' +
          TClientDataSet(Self.Components[J]).Fields[I].FieldName,
          TClientDataSet(Self.Components[J]).Fields[I].FieldName, []);
        TClientDataSet(Self.Components[J]).IndexDefs.Add('IDXD' +
          TClientDataSet(Self.Components[J]).Fields[I].FieldName,
          TClientDataSet(Self.Components[J]).Fields[I].FieldName, [ixDescending]);
      end;
end;

end.
