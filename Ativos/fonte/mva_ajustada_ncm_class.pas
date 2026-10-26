unit mva_ajustada_ncm_class;

interface

uses
  Contnrs,
  DB;

type
  TMva_ajustada_ncm_class = class(TObject)
  private
    Fcod_ncm        : string;
    Fcodigo_uf      : Integer;
    Faliq_inter     : Double;
    Faliq_intra     : Double;
    Fmva_st_original: Double;
    Fmva_ajustada   : Double;
  public
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    class function GetFieldsSql(Aalias: string = ''): string;

    property cod_ncm        : string  read Fcod_ncm         write Fcod_ncm;
    property codigo_uf      : Integer read Fcodigo_uf       write Fcodigo_uf;
    property aliq_inter     : Double  read Faliq_inter      write Faliq_inter;
    property aliq_intra     : Double  read Faliq_intra      write Faliq_intra;
    property mva_st_original: Double  read Fmva_st_original write Fmva_st_original;
    property mva_ajustada   : Double  read Fmva_ajustada    write Fmva_ajustada;
  end;

  TMva_ajustada_ncm_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TMva_ajustada_ncm_class;
    procedure SetItem(Index: Integer; const Value: TMva_ajustada_ncm_class);
  public
    function New: TMva_ajustada_ncm_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TMva_ajustada_ncm_class read GetItem write SetItem;
  end;

implementation

uses
  SysUtils;

{ TMva_ajustada_ncm_class }

class function TMva_ajustada_ncm_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@cod_ncm, @codigo_uf, @aliq_inter, @aliq_intra, @mva_st_original, @mva_ajustada';
  if Trim(Aalias) <> '' then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TMva_ajustada_ncm_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    Fcod_ncm         := Trim(ADataSet.FieldByName('COD_NCM').AsString);
    Fcodigo_uf       := ADataSet.FieldByName('CODIGO_UF').AsInteger;
    Faliq_inter      := ADataSet.FieldByName('ALIQ_INTER').AsFloat;
    Faliq_intra      := ADataSet.FieldByName('ALIQ_INTRA').AsFloat;
    Fmva_st_original := ADataSet.FieldByName('MVA_ST_ORIGINAL').AsFloat;
    Fmva_ajustada    := ADataSet.FieldByName('MVA_AJUSTADA').AsFloat;
  end
  else
  begin
    if Assigned(ADataSet.FindField('COD_NCM'        )) then Fcod_ncm         := Trim(ADataSet.FieldByName('COD_NCM').AsString);
    if Assigned(ADataSet.FindField('CODIGO_UF'      )) then Fcodigo_uf       := ADataSet.FieldByName('CODIGO_UF').AsInteger;
    if Assigned(ADataSet.FindField('ALIQ_INTER'     )) then Faliq_inter      := ADataSet.FieldByName('ALIQ_INTER').AsFloat;
    if Assigned(ADataSet.FindField('ALIQ_INTRA'     )) then Faliq_intra      := ADataSet.FieldByName('ALIQ_INTRA').AsFloat;
    if Assigned(ADataSet.FindField('MVA_ST_ORIGINAL')) then Fmva_st_original := ADataSet.FieldByName('MVA_ST_ORIGINAL').AsFloat;
    if Assigned(ADataSet.FindField('MVA_AJUSTADA'   )) then Fmva_ajustada    := ADataSet.FieldByName('MVA_AJUSTADA').AsFloat;
  end;
end;

{ TMva_ajustada_ncm_classList }

function TMva_ajustada_ncm_classList.GetItem(Index: Integer): TMva_ajustada_ncm_class;
begin
  Result := TMva_ajustada_ncm_class(inherited Items[Index]);
end;

function TMva_ajustada_ncm_classList.New: TMva_ajustada_ncm_class;
begin
  Result := TMva_ajustada_ncm_class.Create;
  Add(Result);
end;

procedure TMva_ajustada_ncm_classList.SetItem(Index: Integer; const Value: TMva_ajustada_ncm_class);
begin
  Put(Index, Value);
end;
procedure TMva_ajustada_ncm_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
