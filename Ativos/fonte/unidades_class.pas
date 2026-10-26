unit unidades_class;

interface

uses
{$IFDEF VER180}
  basefb_class,
  Classes,
  Contnrs,
  Variants;
{$ELSE}
  basefb_class,
  System.Classes,
  System.Contnrs,
  System.Variants;
{$ENDIF}

type
  TUnidades_class = class(TBaseFb_class)
  private
    Fsigla     : string;
    Fdescricao : string;
    Ffracionado: Integer;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property sigla     : string  read Fsigla      write Fsigla;
    property descricao : string  read Fdescricao  write Fdescricao;
    property fracionado: Integer read Ffracionado write Ffracionado;
  end;

  TUnidadess_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TUnidades_class;
    procedure SetItem(Index: Integer; const Value: TUnidades_class);
  public
    function New: TUnidades_class;

    property Items[Index: Integer]: TUnidades_class read GetItem write SetItem;
  end;

implementation

{ TUnidades_class }

procedure TUnidades_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('UNIDADES');
  with FTable.Fields do
  begin
    AddField('SIGLA'     , fkString , 6 , False, True);
    AddField('DESCRICAO' , fkString , 50, False      );
    AddField('FRACIONADO', fkInteger, 0 , False      );
  end;
end;

constructor TUnidades_class.Create;
begin
  InitializeObjects;
end;

{ TUnidadess_class }

function TUnidadess_class.GetItem(Index: Integer): TUnidades_class;
begin
  Result := TUnidades_class(inherited Items[Index]);
end;

function TUnidadess_class.New: TUnidades_class;
begin
  Result := TUnidades_class.Create;
  Add(Result);
end;

procedure TUnidadess_class.SetItem(Index: Integer; const Value: TUnidades_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TUnidades_class);
finalization
  UnRegisterClass(TUnidades_class);

end.
