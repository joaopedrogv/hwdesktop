unit desoneracao_regras_class;

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
  TDesoneracao_regras_class = class(TBase_class)
  private
    Fdesoneracaoid   : Integer;
    Fcod_empresa     : Integer;
    Fid_regras       : Integer;
    Fsigla_uf        : string;
    Fcsts            : string;
    Fcontribuinte    : string;
    Fpessoa          : string;
    Fconsumidor_final: string;
    Ffinalidadeid    : Integer;
    procedure Setdesoneracaoid(const Value: Integer);
    procedure Setcod_empresa(const Value: Integer);
    procedure Setid_regras(const Value: Integer);
    procedure Setsigla_uf(const Value: string);
    procedure Setcsts(const Value: string);
    procedure Setcontribuinte(const Value: string);
    procedure Setpessoa(const Value: string);
    procedure Setconsumidor_final(const Value: string);
    procedure Setfinalidadeid(const Value: Integer);
  public
    constructor Create;
    destructor Destroy; override;

    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    class function GetFieldsSql(Aalias: string = ''): string; virtual;

    function Clone: TDesoneracao_regras_class; virtual;

    function CopyFrom(Source: TDesoneracao_regras_class): TDesoneracao_regras_class; virtual;

    property desoneracaoid   : Integer read Fdesoneracaoid    write Setdesoneracaoid;
    property cod_empresa     : Integer read Fcod_empresa      write Setcod_empresa;
    property id_regras       : Integer read Fid_regras        write Setid_regras;
    property sigla_uf        : string  read Fsigla_uf         write Setsigla_uf;
    property csts            : string  read Fcsts             write Setcsts;
    property contribuinte    : string  read Fcontribuinte     write Setcontribuinte;
    property pessoa          : string  read Fpessoa           write Setpessoa;
    property consumidor_final: string  read Fconsumidor_final write Setconsumidor_final;
    property finalidadeid    : Integer read Ffinalidadeid     write Setfinalidadeid;
  end;

  TDesoneracao_regras_classList = class(TBase_classList)
  private
    function GetItem(Index: Integer): TDesoneracao_regras_class;
    procedure SetItem(Index: Integer; const Value: TDesoneracao_regras_class);
  public
    function New: TDesoneracao_regras_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TDesoneracao_regras_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER310}
  System.SysUtils;
{$ELSE}
  SysUtils;
{$ENDIF}

{ TDesoneracao_regras_class }

constructor TDesoneracao_regras_class.Create;
begin
  Ftable := TTable_fb.Create('DESONERACAO_REGRAS',
                             'DESONERACAOID, COD_EMPRESA, ID_REGRAS',
                             'DESONERACAOID, FINALIDADEID, COD_EMPRESA',
                             GetFieldsSql());
end;

destructor TDesoneracao_regras_class.Destroy;
begin
  if Assigned(Ftable) then
    FreeAndNil(Ftable);
  inherited;
end;

function TDesoneracao_regras_class.Clone: TDesoneracao_regras_class;
begin
  Result                  := TDesoneracao_regras_class.Create;
  Result.desoneracaoid    := Self.desoneracaoid;
  Result.cod_empresa      := Self.cod_empresa;
  Result.id_regras        := Self.id_regras;
  Result.sigla_uf         := Self.sigla_uf;
  Result.csts             := Self.csts;
  Result.contribuinte     := Self.contribuinte;
  Result.pessoa           := Self.pessoa;
  Result.consumidor_final := Self.consumidor_final;
  Result.finalidadeid     := Self.finalidadeid;
  Result.recordState      := Self.recordState;
end;

function TDesoneracao_regras_class.CopyFrom(Source: TDesoneracao_regras_class): TDesoneracao_regras_class;
begin
  Result                := Self;
  Self.desoneracaoid    := Source.desoneracaoid;
  Self.cod_empresa      := Source.cod_empresa;
  Self.id_regras        := Source.id_regras;
  Self.sigla_uf         := Source.sigla_uf;
  Self.csts             := Source.csts;
  Self.contribuinte     := Source.contribuinte;
  Self.pessoa           := Source.pessoa;
  Self.consumidor_final := Source.consumidor_final;
  Self.finalidadeid     := Source.finalidadeid;
  Self.recordState      := Source.recordState;
end;

class function TDesoneracao_regras_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@desoneracaoid, @cod_empresa, @id_regras, @sigla_uf, @csts, @contribuinte, @pessoa, @consumidor_final,' +
            ' @finalidadeid';
  if (Trim(Aalias) <> '') and (Trim(Aalias) <> ':') then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TDesoneracao_regras_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    desoneracaoid    := ADataSet.FieldByName('DESONERACAOID').AsInteger;
    cod_empresa      := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    id_regras        := ADataSet.FieldByName('ID_REGRAS').AsInteger;
    sigla_uf         := Trim(ADataSet.FieldByName('SIGLA_UF').AsString);
    csts             := Trim(ADataSet.FieldByName('CSTS').AsString);
    contribuinte     := Trim(ADataSet.FieldByName('CONTRIBUINTE').AsString);
    pessoa           := Trim(ADataSet.FieldByName('PESSOA').AsString);
    consumidor_final := Trim(ADataSet.FieldByName('CONSUMIDOR_FINAL').AsString);
    finalidadeid     := ADataSet.FieldByName('FINALIDADEID').AsInteger;
  end
  else
  begin
    if Assigned(ADataSet.FindField('DESONERACAOID'   )) then desoneracaoid    := ADataSet.FieldByName('DESONERACAOID').AsInteger;
    if Assigned(ADataSet.FindField('COD_EMPRESA'     )) then cod_empresa      := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    if Assigned(ADataSet.FindField('ID_REGRAS'       )) then id_regras        := ADataSet.FieldByName('ID_REGRAS').AsInteger;
    if Assigned(ADataSet.FindField('SIGLA_UF'        )) then sigla_uf         := Trim(ADataSet.FieldByName('SIGLA_UF').AsString);
    if Assigned(ADataSet.FindField('CSTS'            )) then csts             := Trim(ADataSet.FieldByName('CSTS').AsString);
    if Assigned(ADataSet.FindField('CONTRIBUINTE'    )) then contribuinte     := Trim(ADataSet.FieldByName('CONTRIBUINTE').AsString);
    if Assigned(ADataSet.FindField('PESSOA'          )) then pessoa           := Trim(ADataSet.FieldByName('PESSOA').AsString);
    if Assigned(ADataSet.FindField('CONSUMIDOR_FINAL')) then consumidor_final := Trim(ADataSet.FieldByName('CONSUMIDOR_FINAL').AsString);
    if Assigned(ADataSet.FindField('FINALIDADEID'    )) then finalidadeid     := ADataSet.FieldByName('FINALIDADEID').AsInteger;
  end;
end;

procedure TDesoneracao_regras_class.Setdesoneracaoid(const Value: Integer);
begin
  Fdesoneracaoid := Value;
  ChangeField('DESONERACAOID', Fdesoneracaoid);
end;

procedure TDesoneracao_regras_class.Setcod_empresa(const Value: Integer);
begin
  Fcod_empresa := Value;
  ChangeField('COD_EMPRESA', Fcod_empresa);
end;

procedure TDesoneracao_regras_class.Setid_regras(const Value: Integer);
begin
  Fid_regras := Value;
  ChangeField('ID_REGRAS', Fid_regras);
end;

procedure TDesoneracao_regras_class.Setsigla_uf(const Value: string);
begin
  Fsigla_uf := Value;
  ChangeField('SIGLA_UF', strq(Fsigla_uf, 128));
end;

procedure TDesoneracao_regras_class.Setcsts(const Value: string);
begin
  Fcsts := Value;
  ChangeField('CSTS', strq(Fcsts, 16));
end;

procedure TDesoneracao_regras_class.Setcontribuinte(const Value: string);
begin
  Fcontribuinte := Value;
  ChangeField('CONTRIBUINTE', strq(Fcontribuinte, 8));
end;

procedure TDesoneracao_regras_class.Setpessoa(const Value: string);
begin
  Fpessoa := Value;
  ChangeField('PESSOA', strq(Fpessoa, 8));
end;

procedure TDesoneracao_regras_class.Setconsumidor_final(const Value: string);
begin
  Fconsumidor_final := Value;
  ChangeField('CONSUMIDOR_FINAL', strq(Fconsumidor_final, 8));
end;

procedure TDesoneracao_regras_class.Setfinalidadeid(const Value: Integer);
begin
  Ffinalidadeid := Value;
  ChangeField('FINALIDADEID', Ffinalidadeid);
end;

{ TDesoneracao_regras_classList }

function TDesoneracao_regras_classList.GetItem(Index: Integer): TDesoneracao_regras_class;
begin
  Result := TDesoneracao_regras_class(inherited Items[Index]);
end;

function TDesoneracao_regras_classList.New: TDesoneracao_regras_class;
begin
  Result := TDesoneracao_regras_class.Create;
  Add(Result);
end;

procedure TDesoneracao_regras_classList.SetItem(Index: Integer; const Value: TDesoneracao_regras_class);
begin
  Put(Index, Value);
end;

procedure TDesoneracao_regras_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
