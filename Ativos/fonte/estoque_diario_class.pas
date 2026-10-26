unit estoque_diario_class;

interface

uses
{$IFDEF VER180}
  Contnrs,
  DB;
{$ELSE}
  System.Contnrs,
  Data.DB;
{$ENDIF}

type
  TEstoque_diario_class = class(TObject)
  private
    Ftipo       : string;
    Fseqid      : Integer;
    Fcod_empresa: Integer;
    Fdia        : TDateTime;
    Fgrupo_prod : Integer;
    Fcod_prod   : string;
    Fcod_grade  : Integer;
    Fchassi     : string;
    Festoque    : Double;
    Fcusto_medio: Double;
    Fsituacao   : string;
  public
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    class function GetFieldsSql(Aalias: string = ''): string; virtual;

    function Clone: TEstoque_diario_class; virtual;

    property tipo       : string    read Ftipo        write Ftipo;
    property seqid      : Integer   read Fseqid       write Fseqid;
    property cod_empresa: Integer   read Fcod_empresa write Fcod_empresa;
    property dia        : TDateTime read Fdia         write Fdia;
    property grupo_prod : Integer   read Fgrupo_prod  write Fgrupo_prod;
    property cod_prod   : string    read Fcod_prod    write Fcod_prod;
    property cod_grade  : Integer   read Fcod_grade   write Fcod_grade;
    property chassi     : string    read Fchassi      write Fchassi;
    property estoque    : Double    read Festoque     write Festoque;
    property custo_medio: Double    read Fcusto_medio write Fcusto_medio;
    property situacao   : string    read Fsituacao    write Fsituacao;
  end;

  TEstoque_diario_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TEstoque_diario_class;
    procedure SetItem(Index: Integer; const Value: TEstoque_diario_class);
  public
    function New: TEstoque_diario_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TEstoque_diario_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER310}
  System.SysUtils;
{$ELSE}
  SysUtils;
{$ENDIF}

{ TEstoque_diario_class }

function TEstoque_diario_class.Clone: TEstoque_diario_class;
begin
  Result             := TEstoque_diario_class.Create;
  Result.tipo        := Self.tipo;
  Result.seqid       := Self.seqid;
  Result.cod_empresa := Self.cod_empresa;
  Result.dia         := Self.dia;
  Result.grupo_prod  := Self.grupo_prod;
  Result.cod_prod    := Self.cod_prod;
  Result.cod_grade   := Self.cod_grade;
  Result.chassi      := Self.chassi;
  Result.estoque     := Self.estoque;
  Result.custo_medio := Self.custo_medio;
  Result.situacao    := Self.situacao;
end;

class function TEstoque_diario_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@tipo, @seqid, @cod_empresa, @dia, @grupo_prod, @cod_prod, @cod_grade, @chassi, @estoque, @custo_medio,' +
            ' @situacao';
  if Trim(Aalias) <> '' then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TEstoque_diario_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    Ftipo        := Trim(ADataSet.FieldByName('TIPO').AsString);
    Fseqid       := ADataSet.FieldByName('SEQID').AsInteger;
    Fcod_empresa := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    Fdia         := ADataSet.FieldByName('DIA').AsDateTime;
    Fgrupo_prod  := ADataSet.FieldByName('GRUPO_PROD').AsInteger;
    Fcod_prod    := Trim(ADataSet.FieldByName('COD_PROD').AsString);
    Fcod_grade   := ADataSet.FieldByName('COD_GRADE').AsInteger;
    Fchassi      := Trim(ADataSet.FieldByName('CHASSI').AsString);
    Festoque     := ADataSet.FieldByName('ESTOQUE').AsFloat;
    Fcusto_medio := ADataSet.FieldByName('CUSTO_MEDIO').AsFloat;
    Fsituacao    := Trim(ADataSet.FieldByName('SITUACAO').AsString);
  end
  else
  begin
    if Assigned(ADataSet.FindField('TIPO'       )) then Ftipo        := Trim(ADataSet.FieldByName('TIPO').AsString);
    if Assigned(ADataSet.FindField('SEQID'      )) then Fseqid       := ADataSet.FieldByName('SEQID').AsInteger;
    if Assigned(ADataSet.FindField('COD_EMPRESA')) then Fcod_empresa := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    if Assigned(ADataSet.FindField('DIA'        )) then Fdia         := ADataSet.FieldByName('DIA').AsDateTime;
    if Assigned(ADataSet.FindField('GRUPO_PROD' )) then Fgrupo_prod  := ADataSet.FieldByName('GRUPO_PROD').AsInteger;
    if Assigned(ADataSet.FindField('COD_PROD'   )) then Fcod_prod    := Trim(ADataSet.FieldByName('COD_PROD').AsString);
    if Assigned(ADataSet.FindField('COD_GRADE'  )) then Fcod_grade   := ADataSet.FieldByName('COD_GRADE').AsInteger;
    if Assigned(ADataSet.FindField('CHASSI'     )) then Fchassi      := Trim(ADataSet.FieldByName('CHASSI').AsString);
    if Assigned(ADataSet.FindField('ESTOQUE'    )) then Festoque     := ADataSet.FieldByName('ESTOQUE').AsFloat;
    if Assigned(ADataSet.FindField('CUSTO_MEDIO')) then Fcusto_medio := ADataSet.FieldByName('CUSTO_MEDIO').AsFloat;
    if Assigned(ADataSet.FindField('SITUACAO'   )) then Fsituacao    := Trim(ADataSet.FieldByName('SITUACAO').AsString);
  end;
end;

{ TEstoque_diario_classList }

function TEstoque_diario_classList.GetItem(Index: Integer): TEstoque_diario_class;
begin
  Result := TEstoque_diario_class(inherited Items[Index]);
end;

function TEstoque_diario_classList.New: TEstoque_diario_class;
begin
  Result := TEstoque_diario_class.Create;
  Add(Result);
end;

procedure TEstoque_diario_classList.SetItem(Index: Integer; const Value: TEstoque_diario_class);
begin
  Put(Index, Value);
end;

procedure TEstoque_diario_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
