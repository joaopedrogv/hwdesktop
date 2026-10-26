unit cod_barra_class;

interface

uses
  Contnrs,
  DB;

type
  TCod_barra_class = class(TObject)
  private
    Fcod_barra    : string;
    Fgrupo_prod   : Integer;
    Fcod_prod     : string;
    Fcod_empresa  : Integer;
    Fdat_cad_cdbar: TDateTime;
    Fdat_mod_cdbar: TDateTime;
    Fativo        : Integer;
    Fpadrao_gtin  : string;
    Fseqid        : Integer;
    Fcod_grade    : Integer;
    procedure Setcod_barra(const Value: string);
    procedure Setcod_prod(const Value: string);
    procedure Setpadrao_gtin(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;

    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    class function GetFieldsSql(Aalias: string = ''): string;

    function Clone: TCod_barra_class; virtual;

    property cod_barra    : string    read Fcod_barra     write Setcod_barra;
    property grupo_prod   : Integer   read Fgrupo_prod    write Fgrupo_prod;
    property cod_prod     : string    read Fcod_prod      write Setcod_prod;
    property cod_empresa  : Integer   read Fcod_empresa   write Fcod_empresa;
    property dat_cad_cdbar: TDateTime read Fdat_cad_cdbar write Fdat_cad_cdbar;
    property dat_mod_cdbar: TDateTime read Fdat_mod_cdbar write Fdat_mod_cdbar;
    property ativo        : Integer   read Fativo         write Fativo;
    property padrao_gtin  : string    read Fpadrao_gtin   write Setpadrao_gtin;
    property seqid        : Integer   read Fseqid         write Fseqid;
    property cod_grade    : Integer   read Fcod_grade     write Fcod_grade;
  end;

  TCod_barra_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TCod_barra_class;
    procedure SetItem(Index: Integer; const Value: TCod_barra_class);
  public
    function New: TCod_barra_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TCod_barra_class read GetItem write SetItem;
  end;

implementation

uses
  SysUtils;

{ TCod_barra_class }

constructor TCod_barra_class.Create;
begin
  Fativo := 1;
end;

destructor TCod_barra_class.Destroy;
begin
  inherited;
end;

function TCod_barra_class.Clone: TCod_barra_class;
begin
  if not Assigned(Result) then
  Result               := TCod_barra_class.Create;
  Result.cod_barra     := Self.cod_barra;
  Result.grupo_prod    := Self.grupo_prod;
  Result.cod_prod      := Self.cod_prod;
  Result.cod_empresa   := Self.cod_empresa;
  Result.dat_cad_cdbar := Self.dat_cad_cdbar;
  Result.dat_mod_cdbar := Self.dat_mod_cdbar;
  Result.ativo         := Self.ativo;
  Result.padrao_gtin   := Self.padrao_gtin;
  Result.seqid         := Self.seqid;
  Result.cod_grade     := Self.cod_grade;
end;

class function TCod_barra_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@cod_barra, @grupo_prod, @cod_prod, @cod_empresa, @dat_cad_cdbar, @dat_mod_cdbar, @ativo, @padrao_gtin,' +
            ' @seqid, @cod_grade';
  if Trim(Aalias) <> '' then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TCod_barra_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    Fcod_barra     := Trim(ADataSet.FieldByName('COD_BARRA').AsString);
    Fgrupo_prod    := ADataSet.FieldByName('GRUPO_PROD').AsInteger;
    Fcod_prod      := Trim(ADataSet.FieldByName('COD_PROD').AsString);
    Fcod_empresa   := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    Fdat_cad_cdbar := ADataSet.FieldByName('DAT_CAD_CDBAR').AsDateTime;
    Fdat_mod_cdbar := ADataSet.FieldByName('DAT_MOD_CDBAR').AsDateTime;
    Fativo         := ADataSet.FieldByName('ATIVO').AsInteger;
    Fpadrao_gtin   := Trim(ADataSet.FieldByName('PADRAO_GTIN').AsString);
    Fseqid         := ADataSet.FieldByName('SEQID').AsInteger;
    Fcod_grade     := ADataSet.FieldByName('COD_GRADE').AsInteger;
  end
  else
  begin
    if Assigned(ADataSet.FindField('COD_BARRA'    )) then Fcod_barra     := Trim(ADataSet.FieldByName('COD_BARRA').AsString);
    if Assigned(ADataSet.FindField('GRUPO_PROD'   )) then Fgrupo_prod    := ADataSet.FieldByName('GRUPO_PROD').AsInteger;
    if Assigned(ADataSet.FindField('COD_PROD'     )) then Fcod_prod      := Trim(ADataSet.FieldByName('COD_PROD').AsString);
    if Assigned(ADataSet.FindField('COD_EMPRESA'  )) then Fcod_empresa   := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    if Assigned(ADataSet.FindField('DAT_CAD_CDBAR')) then Fdat_cad_cdbar := ADataSet.FieldByName('DAT_CAD_CDBAR').AsDateTime;
    if Assigned(ADataSet.FindField('DAT_MOD_CDBAR')) then Fdat_mod_cdbar := ADataSet.FieldByName('DAT_MOD_CDBAR').AsDateTime;
    if Assigned(ADataSet.FindField('ATIVO'        )) then Fativo         := ADataSet.FieldByName('ATIVO').AsInteger;
    if Assigned(ADataSet.FindField('PADRAO_GTIN'  )) then Fpadrao_gtin   := Trim(ADataSet.FieldByName('PADRAO_GTIN').AsString);
    if Assigned(ADataSet.FindField('SEQID'        )) then Fseqid         := ADataSet.FieldByName('SEQID').AsInteger;
    if Assigned(ADataSet.FindField('COD_GRADE'    )) then Fcod_grade     := ADataSet.FieldByName('COD_GRADE').AsInteger;
  end;
end;

procedure TCod_barra_class.Setcod_barra(const Value: string);
begin
  Fcod_barra := Trim(UpperCase(Value));
end;

procedure TCod_barra_class.Setcod_prod(const Value: string);
begin
  Fcod_prod := Trim(UpperCase(Value));
end;

procedure TCod_barra_class.Setpadrao_gtin(const Value: string);
begin
  Fpadrao_gtin := Trim(UpperCase(Value));
end;

{ TCod_barra_classList }

function TCod_barra_classList.GetItem(Index: Integer): TCod_barra_class;
begin
  Result := TCod_barra_class(inherited Items[Index]);
end;

function TCod_barra_classList.New: TCod_barra_class;
begin
  Result := TCod_barra_class.Create;
  Add(Result);
end;

procedure TCod_barra_classList.SetItem(Index: Integer; const Value: TCod_barra_class);
begin
  Put(Index, Value);
end;
procedure TCod_barra_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
