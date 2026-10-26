unit sped_informacao_complementar_class;

interface

uses
{$IFDEF VER180}
  base_class,
  Contnrs,
  DB;
{$ELSE}
  base_class,
  System.Contnrs,
  Data.DB;
{$ENDIF}

type
  TSped_informacao_complementar_class = class(TBase_class)
  private
    Fcod_inf    : Integer;
    Fcod_empresa: Integer;
    Ftxt        : string;
    Ftxt_compl  : string;
    Ftipo       : string;
    Fativo      : Integer;
    procedure Setcod_inf(const Value: Integer);
    procedure Setcod_empresa(const Value: Integer);
    procedure Settxt(const Value: string);
    procedure Settxt_compl(const Value: string);
    procedure Settipo(const Value: string);
    procedure Setativo(const Value: Integer);
  public
    constructor Create;
    destructor Destroy; override;

    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    class function GetFieldsSql(Aalias: string = ''): string; virtual;

    property cod_inf    : Integer read Fcod_inf     write Setcod_inf;
    property cod_empresa: Integer read Fcod_empresa write Setcod_empresa;
    property txt        : string  read Ftxt         write Settxt;
    property txt_compl  : string  read Ftxt_compl   write Settxt_compl;
    property tipo       : string  read Ftipo        write Settipo;
    property ativo      : Integer read Fativo       write Setativo;
  end;

  TSped_informacao_complementar_classList = class(TBase_classList)
  private
    function GetItem(Index: Integer): TSped_informacao_complementar_class;
    procedure SetItem(Index: Integer; const Value: TSped_informacao_complementar_class);
  public
    function New: TSped_informacao_complementar_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TSped_informacao_complementar_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER310}
  System.SysUtils;
{$ELSE}
  SysUtils;
{$ENDIF}

{ TSped_informacao_complementar_class }

constructor TSped_informacao_complementar_class.Create;
begin
  Ftable := TTable_fb.Create('SPED_INFORMACAO_COMPLEMENTAR',
                             'COD_INF, COD_EMPRESA',
                             '',
                             GetFieldsSql());
  Fativo := 1;
end;

destructor TSped_informacao_complementar_class.Destroy;
begin
  if Assigned(Ftable) then
    FreeAndNil(Ftable);
  inherited;
end;

class function TSped_informacao_complementar_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@cod_inf, @cod_empresa, @txt, @txt_compl, @tipo, @ativo';
  if (Trim(Aalias) <> '') and (Trim(Aalias) <> ':') then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TSped_informacao_complementar_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    cod_inf     := ADataSet.FieldByName('COD_INF').AsInteger;
    cod_empresa := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    txt         := Trim(ADataSet.FieldByName('TXT').AsString);
    txt_compl   := Trim(ADataSet.FieldByName('TXT_COMPL').AsString);
    tipo        := Trim(ADataSet.FieldByName('TIPO').AsString);
    ativo       := ADataSet.FieldByName('ATIVO').AsInteger;
  end
  else
  begin
    if Assigned(ADataSet.FindField('COD_INF'    )) then cod_inf     := ADataSet.FieldByName('COD_INF').AsInteger;
    if Assigned(ADataSet.FindField('COD_EMPRESA')) then cod_empresa := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    if Assigned(ADataSet.FindField('TXT'        )) then txt         := Trim(ADataSet.FieldByName('TXT').AsString);
    if Assigned(ADataSet.FindField('TXT_COMPL'  )) then txt_compl   := Trim(ADataSet.FieldByName('TXT_COMPL').AsString);
    if Assigned(ADataSet.FindField('TIPO'       )) then tipo        := Trim(ADataSet.FieldByName('TIPO').AsString);
    if Assigned(ADataSet.FindField('ATIVO'      )) then ativo       := ADataSet.FieldByName('ATIVO').AsInteger;
  end;
end;

procedure TSped_informacao_complementar_class.Setcod_inf(const Value: Integer);
begin
  Fcod_inf := Value;
  ChangeField('COD_INF', Fcod_inf);
end;

procedure TSped_informacao_complementar_class.Setcod_empresa(const Value: Integer);
begin
  Fcod_empresa := Value;
  ChangeField('COD_EMPRESA', Fcod_empresa);
end;

procedure TSped_informacao_complementar_class.Settxt(const Value: string);
begin
  Ftxt := Value;
  ChangeField('TXT', strq(Ftxt, 255));
end;

procedure TSped_informacao_complementar_class.Settxt_compl(const Value: string);
begin
  Ftxt_compl := Value;
  ChangeField('TXT_COMPL', strq(Ftxt_compl, 255));
end;

procedure TSped_informacao_complementar_class.Settipo(const Value: string);
begin
  Ftipo := Value;
  ChangeField('TIPO', strq(Ftipo, 20));
end;

procedure TSped_informacao_complementar_class.Setativo(const Value: Integer);
begin
  Fativo := Value;
  ChangeField('ATIVO', Fativo);
end;

{ TSped_informacao_complementar_classList }

function TSped_informacao_complementar_classList.GetItem(Index: Integer): TSped_informacao_complementar_class;
begin
  Result := TSped_informacao_complementar_class(inherited Items[Index]);
end;

function TSped_informacao_complementar_classList.New: TSped_informacao_complementar_class;
begin
  Result := TSped_informacao_complementar_class.Create;
  Add(Result);
end;

procedure TSped_informacao_complementar_classList.SetItem(Index: Integer; const Value: TSped_informacao_complementar_class);
begin
  Put(Index, Value);
end;

procedure TSped_informacao_complementar_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
