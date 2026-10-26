unit ibpt_class;

interface

uses
  Contnrs,
  DB;

type
  TIbpt_class = class(TObject)
  private
    Fcodigo        : string;
    Fuf            : string;
    Fex            : Integer;
    Fdescricao     : string;
    Fnacional      : Double;
    Festadual      : Double;
    Fimportado     : Double;
    Fmunicipal     : Double;
    Ftipo          : string;
    Fvigenciainicio: TDateTime;
    Fvigenciafim   : TDateTime;
    Fchave         : string;
    Fversao        : string;
    Fdataconsulta  : TDateTime;
    Fconsultar     : string;
  public
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    class function GetFieldsSql(Aalias: string = ''): string;

    property codigo        : string    read Fcodigo         write Fcodigo;
    property uf            : string    read Fuf             write Fuf;
    property ex            : Integer   read Fex             write Fex;
    property descricao     : string    read Fdescricao      write Fdescricao;
    property nacional      : Double    read Fnacional       write Fnacional;
    property estadual      : Double    read Festadual       write Festadual;
    property importado     : Double    read Fimportado      write Fimportado;
    property municipal     : Double    read Fmunicipal      write Fmunicipal;
    property tipo          : string    read Ftipo           write Ftipo;
    property vigenciainicio: TDateTime read Fvigenciainicio write Fvigenciainicio;
    property vigenciafim   : TDateTime read Fvigenciafim    write Fvigenciafim;
    property chave         : string    read Fchave          write Fchave;
    property versao        : string    read Fversao         write Fversao;
    property dataconsulta  : TDateTime read Fdataconsulta   write Fdataconsulta;
    property consultar     : string    read Fconsultar      write Fconsultar;
  end;

  TIbpt_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TIbpt_class;
    procedure SetItem(Index: Integer; const Value: TIbpt_class);
  public
    function New: TIbpt_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TIbpt_class read GetItem write SetItem;
  end;

implementation

uses
  SysUtils;

{ TIbpt_class }

class function TIbpt_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@codigo, @uf, @ex, @descricao, @nacional, @estadual, @importado, @municipal, @tipo, @vigenciainicio,' +
            ' @vigenciafim, @chave, @versao, @dataconsulta, @consultar';
  if Trim(Aalias) <> '' then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TIbpt_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    Fcodigo         := Trim(ADataSet.FieldByName('CODIGO').AsString);
    Fuf             := Trim(ADataSet.FieldByName('UF').AsString);
    Fex             := ADataSet.FieldByName('EX').AsInteger;
    Fdescricao      := Trim(ADataSet.FieldByName('DESCRICAO').AsString);
    Fnacional       := ADataSet.FieldByName('NACIONAL').AsFloat;
    Festadual       := ADataSet.FieldByName('ESTADUAL').AsFloat;
    Fimportado      := ADataSet.FieldByName('IMPORTADO').AsFloat;
    Fmunicipal      := ADataSet.FieldByName('MUNICIPAL').AsFloat;
    Ftipo           := Trim(ADataSet.FieldByName('TIPO').AsString);
    Fvigenciainicio := ADataSet.FieldByName('VIGENCIAINICIO').AsDateTime;
    Fvigenciafim    := ADataSet.FieldByName('VIGENCIAFIM').AsDateTime;
    Fchave          := Trim(ADataSet.FieldByName('CHAVE').AsString);
    Fversao         := Trim(ADataSet.FieldByName('VERSAO').AsString);
    Fdataconsulta   := ADataSet.FieldByName('DATACONSULTA').AsDateTime;
    Fconsultar      := Trim(ADataSet.FieldByName('CONSULTAR').AsString);
  end
  else
  begin
    if Assigned(ADataSet.FindField('CODIGO'        )) then Fcodigo         := Trim(ADataSet.FieldByName('CODIGO').AsString);
    if Assigned(ADataSet.FindField('UF'            )) then Fuf             := Trim(ADataSet.FieldByName('UF').AsString);
    if Assigned(ADataSet.FindField('EX'            )) then Fex             := ADataSet.FieldByName('EX').AsInteger;
    if Assigned(ADataSet.FindField('DESCRICAO'     )) then Fdescricao      := Trim(ADataSet.FieldByName('DESCRICAO').AsString);
    if Assigned(ADataSet.FindField('NACIONAL'      )) then Fnacional       := ADataSet.FieldByName('NACIONAL').AsFloat;
    if Assigned(ADataSet.FindField('ESTADUAL'      )) then Festadual       := ADataSet.FieldByName('ESTADUAL').AsFloat;
    if Assigned(ADataSet.FindField('IMPORTADO'     )) then Fimportado      := ADataSet.FieldByName('IMPORTADO').AsFloat;
    if Assigned(ADataSet.FindField('MUNICIPAL'     )) then Fmunicipal      := ADataSet.FieldByName('MUNICIPAL').AsFloat;
    if Assigned(ADataSet.FindField('TIPO'          )) then Ftipo           := Trim(ADataSet.FieldByName('TIPO').AsString);
    if Assigned(ADataSet.FindField('VIGENCIAINICIO')) then Fvigenciainicio := ADataSet.FieldByName('VIGENCIAINICIO').AsDateTime;
    if Assigned(ADataSet.FindField('VIGENCIAFIM'   )) then Fvigenciafim    := ADataSet.FieldByName('VIGENCIAFIM').AsDateTime;
    if Assigned(ADataSet.FindField('CHAVE'         )) then Fchave          := Trim(ADataSet.FieldByName('CHAVE').AsString);
    if Assigned(ADataSet.FindField('VERSAO'        )) then Fversao         := Trim(ADataSet.FieldByName('VERSAO').AsString);
    if Assigned(ADataSet.FindField('DATACONSULTA'  )) then Fdataconsulta   := ADataSet.FieldByName('DATACONSULTA').AsDateTime;
    if Assigned(ADataSet.FindField('CONSULTAR'     )) then Fconsultar      := Trim(ADataSet.FieldByName('CONSULTAR').AsString);
  end;
end;

{ TIbpt_classList }

function TIbpt_classList.GetItem(Index: Integer): TIbpt_class;
begin
  Result := TIbpt_class(inherited Items[Index]);
end;

function TIbpt_classList.New: TIbpt_class;
begin
  Result := TIbpt_class.Create;
  Add(Result);
end;

procedure TIbpt_classList.SetItem(Index: Integer; const Value: TIbpt_class);
begin
  Put(Index, Value);
end;
procedure TIbpt_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
