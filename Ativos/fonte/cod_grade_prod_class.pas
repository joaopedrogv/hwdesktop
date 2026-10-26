unit cod_grade_prod_class;

interface

uses
{$IFDEF VER180}
  Contnrs,
  DB,
  IBQuery,
  basefb_class,
  Classes,
  Variants;
{$ELSE}
  System.Contnrs,
  Data.DB,
  IBX.IBQuery,
  basefb_class,
  System.Classes,
  System.Variants;
{$ENDIF}

type
  TCod_grade_prod_class = class(TObject)
  private
    Fgrupo_prod   : Integer;
    Fcod_prod     : string;
    Fcod_grade    : Integer;
    Fcod_empresa  : Integer;
    Fqtde         : Double;
    Fativo        : Integer;
    Fqtd_etiquetas: Integer;
  public
    constructor Create;
    destructor Destroy; override;

    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    function SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean = False): TIBQuery;

    class function GetFieldsSql(Aalias: string = ''): string; virtual;

    function Clone: TCod_grade_prod_class; virtual;

    property grupo_prod   : Integer read Fgrupo_prod    write Fgrupo_prod;
    property cod_prod     : string  read Fcod_prod      write Fcod_prod;
    property cod_grade    : Integer read Fcod_grade     write Fcod_grade;
    property cod_empresa  : Integer read Fcod_empresa   write Fcod_empresa;
    property qtde         : Double  read Fqtde          write Fqtde;
    property ativo        : Integer read Fativo         write Fativo;
    property qtd_etiquetas: Integer read Fqtd_etiquetas write Fqtd_etiquetas;
  end;

  TCod_grade_prod_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TCod_grade_prod_class;
    procedure SetItem(Index: Integer; const Value: TCod_grade_prod_class);
  public
    function New: TCod_grade_prod_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TCod_grade_prod_class read GetItem write SetItem;
  end;

  TCod_grade_prod_class2 = class(TBaseFb_class)
  private
    Fgrupo_prod   : Integer;
    Fcod_prod     : string;
    Fcod_grade    : Integer;
    Fcod_empresa  : Integer;
    Fqtde         : Double;
    Fativo        : Integer;
    Fqtd_etiquetas: Integer;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property grupo_prod   : Integer read Fgrupo_prod    write Fgrupo_prod;
    property cod_prod     : string  read Fcod_prod      write Fcod_prod;
    property cod_grade    : Integer read Fcod_grade     write Fcod_grade;
    property cod_empresa  : Integer read Fcod_empresa   write Fcod_empresa;
    property qtde         : Double  read Fqtde          write Fqtde;
    property ativo        : Integer read Fativo         write Fativo;
    property qtd_etiquetas: Integer read Fqtd_etiquetas write Fqtd_etiquetas;
  end;

  TCod_grade_prods_class2 = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TCod_grade_prod_class2;
    procedure SetItem(Index: Integer; const Value: TCod_grade_prod_class2);
  public
    function New: TCod_grade_prod_class2;

    property Items[Index: Integer]: TCod_grade_prod_class2 read GetItem write SetItem;
  end;


implementation

uses
{$IFDEF VER310}
  System.SysUtils;
{$ELSE}
  SysUtils;
{$ENDIF}

{ TCod_grade_prod_class }

constructor TCod_grade_prod_class.Create;
begin
  Fativo := 1;
end;

destructor TCod_grade_prod_class.Destroy;
begin
  inherited;
end;

function TCod_grade_prod_class.Clone: TCod_grade_prod_class;
begin
  Result               := TCod_grade_prod_class.Create;
  Result.grupo_prod    := Self.grupo_prod;
  Result.cod_prod      := Self.cod_prod;
  Result.cod_grade     := Self.cod_grade;
  Result.cod_empresa   := Self.cod_empresa;
  Result.qtde          := Self.qtde;
  Result.ativo         := Self.ativo;
  Result.qtd_etiquetas := Self.qtd_etiquetas;
end;

class function TCod_grade_prod_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@grupo_prod, @cod_prod, @cod_grade, @cod_empresa, @qtde, @ativo, @qtd_etiquetas';
  if Trim(Aalias) <> '' then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TCod_grade_prod_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    Fgrupo_prod    := ADataSet.FieldByName('GRUPO_PROD').AsInteger;
    Fcod_prod      := Trim(ADataSet.FieldByName('COD_PROD').AsString);
    Fcod_grade     := ADataSet.FieldByName('COD_GRADE').AsInteger;
    Fcod_empresa   := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    Fqtde          := ADataSet.FieldByName('QTDE').AsFloat;
    Fativo         := ADataSet.FieldByName('ATIVO').AsInteger;
    Fqtd_etiquetas := ADataSet.FieldByName('QTD_ETIQUETAS').AsInteger;
  end
  else
  begin
    if Assigned(ADataSet.FindField('GRUPO_PROD'   )) then Fgrupo_prod    := ADataSet.FieldByName('GRUPO_PROD').AsInteger;
    if Assigned(ADataSet.FindField('COD_PROD'     )) then Fcod_prod      := Trim(ADataSet.FieldByName('COD_PROD').AsString);
    if Assigned(ADataSet.FindField('COD_GRADE'    )) then Fcod_grade     := ADataSet.FieldByName('COD_GRADE').AsInteger;
    if Assigned(ADataSet.FindField('COD_EMPRESA'  )) then Fcod_empresa   := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    if Assigned(ADataSet.FindField('QTDE'         )) then Fqtde          := ADataSet.FieldByName('QTDE').AsFloat;
    if Assigned(ADataSet.FindField('ATIVO'        )) then Fativo         := ADataSet.FieldByName('ATIVO').AsInteger;
    if Assigned(ADataSet.FindField('QTD_ETIQUETAS')) then Fqtd_etiquetas := ADataSet.FieldByName('QTD_ETIQUETAS').AsInteger;
  end;
end;

function TCod_grade_prod_class.SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean): TIBQuery;
begin
  Result := ADataSet;

  if not AcheckParams then
  begin
    ADataSet.ParamByName('GRUPO_PROD').AsInteger    := Fgrupo_prod;
    ADataSet.ParamByName('COD_PROD').AsString       := Copy(Fcod_prod, 1, 6);
    ADataSet.ParamByName('COD_GRADE').AsInteger     := Fcod_grade;
    ADataSet.ParamByName('COD_EMPRESA').AsInteger   := Fcod_empresa;
    ADataSet.ParamByName('QTDE').AsFloat            := Fqtde;
    ADataSet.ParamByName('ATIVO').AsInteger         := Fativo;
    ADataSet.ParamByName('QTD_ETIQUETAS').AsInteger := Fqtd_etiquetas;
  end
  else
  begin
    if Assigned(ADataSet.Params.FindParam('GRUPO_PROD'   )) then   ADataSet.ParamByName('GRUPO_PROD').AsInteger    := Fgrupo_prod;
    if Assigned(ADataSet.Params.FindParam('COD_PROD'     )) then   ADataSet.ParamByName('COD_PROD').AsString       := Copy(Fcod_prod, 1, 6);
    if Assigned(ADataSet.Params.FindParam('COD_GRADE'    )) then   ADataSet.ParamByName('COD_GRADE').AsInteger     := Fcod_grade;
    if Assigned(ADataSet.Params.FindParam('COD_EMPRESA'  )) then   ADataSet.ParamByName('COD_EMPRESA').AsInteger   := Fcod_empresa;
    if Assigned(ADataSet.Params.FindParam('QTDE'         )) then   ADataSet.ParamByName('QTDE').AsFloat            := Fqtde;
    if Assigned(ADataSet.Params.FindParam('ATIVO'        )) then   ADataSet.ParamByName('ATIVO').AsInteger         := Fativo;
    if Assigned(ADataSet.Params.FindParam('QTD_ETIQUETAS')) then   ADataSet.ParamByName('QTD_ETIQUETAS').AsInteger := Fqtd_etiquetas;
  end;
end;

{ TCod_grade_prod_classList }

function TCod_grade_prod_classList.GetItem(Index: Integer): TCod_grade_prod_class;
begin
  Result := TCod_grade_prod_class(inherited Items[Index]);
end;

function TCod_grade_prod_classList.New: TCod_grade_prod_class;
begin
  Result := TCod_grade_prod_class.Create;
  Add(Result);
end;

procedure TCod_grade_prod_classList.SetItem(Index: Integer; const Value: TCod_grade_prod_class);
begin
  Put(Index, Value);
end;

procedure TCod_grade_prod_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

{ TCod_grade_prod_class2 }

constructor TCod_grade_prod_class2.Create;
begin
  InitializeObjects;
end;

procedure TCod_grade_prod_class2.InitializeObjects;
begin
  Ftable := TTableFb.Create('COD_GRADE_PROD');
  with FTable.Fields do
  begin
    AddField('GRUPO_PROD'   , fkInteger, 0  , False, True              );
    AddField('COD_PROD'     , fkString, 6   , False, True              );
    AddField('COD_GRADE'    , fkInteger, 0  , False, True              );
    AddField('COD_EMPRESA'  , fkInteger, 0  , False, True              );
    AddField('QTDE'         , fkInteger, 0  , False, True              );
    AddField('ATIVO'        , fkInteger, 0  , True , False, False, True);
    AddField('QTD_ETIQUETAS', fkInteger, 0  , True , False, False, True);
  end;
end;

{ TCod_grade_prods_class2 }

function TCod_grade_prods_class2.GetItem(
  Index: Integer): TCod_grade_prod_class2;
begin
  Result := TCod_grade_prod_class2(inherited Items[Index]);
end;

function TCod_grade_prods_class2.New: TCod_grade_prod_class2;
begin
  Result := TCod_grade_prod_class2.Create;
  Add(Result);
end;

procedure TCod_grade_prods_class2.SetItem(Index: Integer;
  const Value: TCod_grade_prod_class2);
begin
  Put(Index, Value);
end;

end.
