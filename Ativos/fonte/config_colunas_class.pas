unit config_colunas_class;

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
  TConfig_colunas_class = class(TBaseFb_class)
  private
    Fusuario         : string;
    Fcomponente      : string;
    Fcampos          : string;
    Fvisivel         : Variant;
    Fordem           : Variant;
    Flargura_exibicao: Variant;
    Fexcel_titulo    : string;
    Fexcel_format    : string;
    FInDataSet: Boolean;
    function GetIsVisible: Boolean;
    function GetFieldName: string;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;

    property FieldName: string read GetFieldName;
    property IsVisible: Boolean read GetIsVisible;
    property InDataSet: Boolean read FInDataSet write FInDataSet; 
  published
    property usuario         : string  read Fusuario          write Fusuario;
    property componente      : string  read Fcomponente       write Fcomponente;
    property campos          : string  read Fcampos           write Fcampos;
    property visivel         : Variant read Fvisivel          write Fvisivel;
    property ordem           : Variant read Fordem            write Fordem;
    property largura_exibicao: Variant read Flargura_exibicao write Flargura_exibicao;
    property excel_titulo    : string  read Fexcel_titulo     write Fexcel_titulo;
    property excel_format    : string  read Fexcel_format     write Fexcel_format;
  end;

  TConfig_colunass_class = class;

  TConfig_colunass_classEnumerator = class
  private
    FIndex: Integer;
    FList: TConfig_colunass_class;
  public
    constructor Create(AList: TConfig_colunass_class);
    function GetCurrent: TConfig_colunas_class;
    function MoveNext: Boolean;
    property Current: TConfig_colunas_class read GetCurrent;
  end;

  TConfig_colunass_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TConfig_colunas_class;
    procedure SetItem(Index: Integer; const Value: TConfig_colunas_class);
  public
    function New: TConfig_colunas_class;
    function IndexOfByFieldName(fieldName: string): Integer;
    function GetEnumerator: TConfig_colunass_classEnumerator;
    procedure MoveTo(fieldName: string; idx: Integer);

    property Items[Index: Integer]: TConfig_colunas_class read GetItem write SetItem; default;
  end;

implementation

uses
  Math,
  SysUtils;

{ TConfig_colunas_class }

function TConfig_colunas_class.GetFieldName: string;
begin
  Result := Trim(Copy(Fcampos, Length(Fcomponente) + 1, Length(Fcampos)));
end;

function TConfig_colunas_class.GetIsVisible: Boolean;
begin
  Result := Fvisivel = 1;
end;

procedure TConfig_colunas_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('CONFIG_COLUNAS');
  with FTable.Fields do
  begin
    AddField('USUARIO'         , fkString , 20, False, True);
    AddField('COMPONENTE'      , fkString , 64, False, True);
    AddField('CAMPOS'          , fkString , 64, False, True);
    AddField('VISIVEL'         , fkInteger,  0, False      );
    AddField('ORDEM'           , fkInteger,  0, False      );
    AddField('LARGURA_EXIBICAO', fkInteger                 );
    AddField('EXCEL_TITULO'    , fkString , 16             );
    AddField('EXCEL_FORMAT'    , fkString , 64             );
  end;
end;

constructor TConfig_colunas_class.Create;
begin
  InitializeObjects;
end;

{ TConfig_colunass_class }

function TConfig_colunass_class.GetEnumerator: TConfig_colunass_classEnumerator;
begin
  Result := TConfig_colunass_classEnumerator.Create(Self);
end;

function TConfig_colunass_class.GetItem(Index: Integer): TConfig_colunas_class;
begin
  Result := TConfig_colunas_class(inherited Items[Index]);
end;

function TConfig_colunass_class.IndexOfByFieldName(fieldName: string): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to Self.Count - 1 do
    if AnsiLowerCase(Trim(fieldName)) = AnsiLowerCase(Self.Items[I].FieldName) then
    begin
      Result := I;
      Exit;
    end;
end;

procedure TConfig_colunass_class.MoveTo(fieldName: string; idx: Integer);
var
  I, myIndex, minIndex, maxIndex: Integer;
  col: TConfig_colunas_class;
  cVis: Boolean;
begin
  myIndex := Self.IndexOfByFieldName(fieldName);
  if (myIndex < 0) or (myIndex = idx) then
    Exit;

  col := TConfig_colunas_class(Self.Items[myIndex].Clone);
  col.InDataSet := Self.Items[myIndex].InDataSet;
  Self.Delete(myIndex);
  Self.Insert(idx, col);
  for I := 0 to Self.Count - 1 do
    Self.Items[I].ordem := I;

//  minIndex := Min(idx, myIndex);
//  maxIndex := Min(idx, myIndex);
//
//  for I := maxIndex downto minIndex do

//  for i := ALength - 1 downto Index + 1 do
//    A[i] := A[i - 1];


end;

function TConfig_colunass_class.New: TConfig_colunas_class;
begin
  Result := TConfig_colunas_class.Create;
  Add(Result);
end;

procedure TConfig_colunass_class.SetItem(Index: Integer; const Value: TConfig_colunas_class);
begin
  Put(Index, Value);
end;

{ TConfig_colunass_classEnumerator }

constructor TConfig_colunass_classEnumerator.Create(AList: TConfig_colunass_class);
begin
  inherited Create;
  FIndex := -1;
  FList := AList;
end;

function TConfig_colunass_classEnumerator.GetCurrent: TConfig_colunas_class;
begin
  Result := FList[FIndex];
end;

function TConfig_colunass_classEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FList.Count - 1;
  if Result then
    Inc(FIndex);
end;

initialization
  RegisterClass(TConfig_colunas_class);
finalization
  UnRegisterClass(TConfig_colunas_class);

end.
