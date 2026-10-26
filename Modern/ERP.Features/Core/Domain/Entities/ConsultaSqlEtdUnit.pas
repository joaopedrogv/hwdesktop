unit ConsultaSqlEtdUnit;

interface

uses
  SysUtils, Classes, Contnrs;

type
  ConsultaSqlEtd = class//(EntityBase)
  private
    FId: string;
    FSQL: string;
  public
    constructor Create( const AId, ASQL: string );
  public
    property Id: string read FId write FId;
    property SQL: string read FSQL write FSQL;
  end;

  ConsultaSqlEtdList = class(TObjectList)
  private
    function GetItem(Index: Integer): ConsultaSqlEtd;
    procedure SetItem(Index: Integer; const Value: ConsultaSqlEtd);
  public
    property Items[Index: Integer]: ConsultaSqlEtd read GetItem write SetItem;
  end;

implementation

{ ConsultaSqlEtd }

constructor ConsultaSqlEtd.Create(
  const AId, ASQL: string
);
begin
  FId := AId;
  FSQL := ASQL;
end;

{ ConsultaSqlEtdList }

function ConsultaSqlEtdList.GetItem(Index: Integer): ConsultaSqlEtd;
begin
  Result := ConsultaSqlEtd(inherited Items[Index]);
end;

procedure ConsultaSqlEtdList.SetItem(Index: Integer; const Value: ConsultaSqlEtd);
begin
  Put(Index, Value);
end;

end.
