unit estoque_ajuste_itens_class;

interface

uses
{$IFDEF VER180}
  Contnrs,
  DB,
  IBQuery;
{$ELSE}
  System.Contnrs,
  Data.DB,
  IBX.IBQuery;
{$ENDIF}

type
  TEstoque_ajuste_itens_class = class(TObject)
  private
    Fid_ajuste   : Integer;
    Fcod_empresa : Integer;
    Fid_it       : Integer;
    Fgrupo_prod  : Integer;
    Fcod_prod    : string;
    Fcod_grade   : Integer;
    Fquantidade  : Double;
    Fcusto_un    : Double;
    Fcusto_tot_aj: Double;
    Ffator       : Double;
    Fcod_nf      : Integer;
    Fnitem       : Integer;
  public
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    function SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean = False): TIBQuery;

    class function GetFieldsSql(Aalias: string = ''): string; virtual;

    property id_ajuste   : Integer read Fid_ajuste    write Fid_ajuste;
    property cod_empresa : Integer read Fcod_empresa  write Fcod_empresa;
    property id_it       : Integer read Fid_it        write Fid_it;
    property grupo_prod  : Integer read Fgrupo_prod   write Fgrupo_prod;
    property cod_prod    : string  read Fcod_prod     write Fcod_prod;
    property cod_grade   : Integer read Fcod_grade    write Fcod_grade;
    property quantidade  : Double  read Fquantidade   write Fquantidade;
    property custo_un    : Double  read Fcusto_un     write Fcusto_un;
    property custo_tot_aj: Double  read Fcusto_tot_aj write Fcusto_tot_aj;
    property fator       : Double  read Ffator        write Ffator;
    property cod_nf      : Integer read Fcod_nf       write Fcod_nf;
    property nitem       : Integer read Fnitem        write Fnitem;
  end;

  TEstoque_ajuste_itens_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TEstoque_ajuste_itens_class;
    procedure SetItem(Index: Integer; const Value: TEstoque_ajuste_itens_class);
  public
    function New: TEstoque_ajuste_itens_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TEstoque_ajuste_itens_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER310}
  System.SysUtils;
{$ELSE}
  SysUtils;
{$ENDIF}

{ TEstoque_ajuste_itens_class }

class function TEstoque_ajuste_itens_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@id_ajuste, @cod_empresa, @id_it, @grupo_prod, @cod_prod, @cod_grade, @quantidade, @custo_un, @custo_tot_aj,' +
            ' @fator, @cod_nf, @nitem';
  if Trim(Aalias) <> '' then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TEstoque_ajuste_itens_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    Fid_ajuste    := ADataSet.FieldByName('ID_AJUSTE').AsInteger;
    Fcod_empresa  := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    Fid_it        := ADataSet.FieldByName('ID_IT').AsInteger;
    Fgrupo_prod   := ADataSet.FieldByName('GRUPO_PROD').AsInteger;
    Fcod_prod     := Trim(ADataSet.FieldByName('COD_PROD').AsString);
    Fcod_grade    := ADataSet.FieldByName('COD_GRADE').AsInteger;
    Fquantidade   := ADataSet.FieldByName('QUANTIDADE').AsFloat;
    Fcusto_un     := ADataSet.FieldByName('CUSTO_UN').AsFloat;
    Fcusto_tot_aj := ADataSet.FieldByName('CUSTO_TOT_AJ').AsFloat;
    Ffator        := ADataSet.FieldByName('FATOR').AsFloat;
    Fcod_nf       := ADataSet.FieldByName('COD_NF').AsInteger;
    Fnitem        := ADataSet.FieldByName('NITEM').AsInteger;
  end
  else
  begin
    if Assigned(ADataSet.FindField('ID_AJUSTE'   )) then Fid_ajuste    := ADataSet.FieldByName('ID_AJUSTE').AsInteger;
    if Assigned(ADataSet.FindField('COD_EMPRESA' )) then Fcod_empresa  := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    if Assigned(ADataSet.FindField('ID_IT'       )) then Fid_it        := ADataSet.FieldByName('ID_IT').AsInteger;
    if Assigned(ADataSet.FindField('GRUPO_PROD'  )) then Fgrupo_prod   := ADataSet.FieldByName('GRUPO_PROD').AsInteger;
    if Assigned(ADataSet.FindField('COD_PROD'    )) then Fcod_prod     := Trim(ADataSet.FieldByName('COD_PROD').AsString);
    if Assigned(ADataSet.FindField('COD_GRADE'   )) then Fcod_grade    := ADataSet.FieldByName('COD_GRADE').AsInteger;
    if Assigned(ADataSet.FindField('QUANTIDADE'  )) then Fquantidade   := ADataSet.FieldByName('QUANTIDADE').AsFloat;
    if Assigned(ADataSet.FindField('CUSTO_UN'    )) then Fcusto_un     := ADataSet.FieldByName('CUSTO_UN').AsFloat;
    if Assigned(ADataSet.FindField('CUSTO_TOT_AJ')) then Fcusto_tot_aj := ADataSet.FieldByName('CUSTO_TOT_AJ').AsFloat;
    if Assigned(ADataSet.FindField('FATOR'       )) then Ffator        := ADataSet.FieldByName('FATOR').AsFloat;
    if Assigned(ADataSet.FindField('COD_NF'      )) then Fcod_nf       := ADataSet.FieldByName('COD_NF').AsInteger;
    if Assigned(ADataSet.FindField('NITEM'       )) then Fnitem        := ADataSet.FieldByName('NITEM').AsInteger;
  end;
end;

function TEstoque_ajuste_itens_class.SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean): TIBQuery;
begin
  Result := ADataSet;

  if not AcheckParams then
  begin
    ADataSet.ParamByName('ID_AJUSTE').AsInteger   := Fid_ajuste;
    ADataSet.ParamByName('COD_EMPRESA').AsInteger := Fcod_empresa;
    ADataSet.ParamByName('ID_IT').AsInteger       := Fid_it;
    ADataSet.ParamByName('GRUPO_PROD').AsInteger  := Fgrupo_prod;
    ADataSet.ParamByName('COD_PROD').AsString     := Copy(Fcod_prod, 1, 6);
    ADataSet.ParamByName('COD_GRADE').AsInteger   := Fcod_grade;
    ADataSet.ParamByName('QUANTIDADE').AsFloat    := Fquantidade;
    ADataSet.ParamByName('CUSTO_UN').AsFloat      := Fcusto_un;
    ADataSet.ParamByName('CUSTO_TOT_AJ').AsFloat  := Fcusto_tot_aj;
    ADataSet.ParamByName('FATOR').AsFloat         := Ffator;
    ADataSet.ParamByName('COD_NF').AsInteger      := Fcod_nf;
    ADataSet.ParamByName('NITEM').AsInteger       := Fnitem;
  end
  else
  begin
    if Assigned(ADataSet.Params.FindParam('ID_AJUSTE'   )) then   ADataSet.ParamByName('ID_AJUSTE').AsInteger   := Fid_ajuste;
    if Assigned(ADataSet.Params.FindParam('COD_EMPRESA' )) then   ADataSet.ParamByName('COD_EMPRESA').AsInteger := Fcod_empresa;
    if Assigned(ADataSet.Params.FindParam('ID_IT'       )) then   ADataSet.ParamByName('ID_IT').AsInteger       := Fid_it;
    if Assigned(ADataSet.Params.FindParam('GRUPO_PROD'  )) then   ADataSet.ParamByName('GRUPO_PROD').AsInteger  := Fgrupo_prod;
    if Assigned(ADataSet.Params.FindParam('COD_PROD'    )) then   ADataSet.ParamByName('COD_PROD').AsString     := Copy(Fcod_prod, 1, 6);
    if Assigned(ADataSet.Params.FindParam('COD_GRADE'   )) then   ADataSet.ParamByName('COD_GRADE').AsInteger   := Fcod_grade;
    if Assigned(ADataSet.Params.FindParam('QUANTIDADE'  )) then   ADataSet.ParamByName('QUANTIDADE').AsFloat    := Fquantidade;
    if Assigned(ADataSet.Params.FindParam('CUSTO_UN'    )) then   ADataSet.ParamByName('CUSTO_UN').AsFloat      := Fcusto_un;
    if Assigned(ADataSet.Params.FindParam('CUSTO_TOT_AJ')) then   ADataSet.ParamByName('CUSTO_TOT_AJ').AsFloat  := Fcusto_tot_aj;
    if Assigned(ADataSet.Params.FindParam('FATOR'       )) then   ADataSet.ParamByName('FATOR').AsFloat         := Ffator;
    if Assigned(ADataSet.Params.FindParam('COD_NF'      )) then   ADataSet.ParamByName('COD_NF').AsInteger      := Fcod_nf;
    if Assigned(ADataSet.Params.FindParam('NITEM'       )) then   ADataSet.ParamByName('NITEM').AsInteger       := Fnitem;
  end;
end;

{ TEstoque_ajuste_itens_classList }

function TEstoque_ajuste_itens_classList.GetItem(Index: Integer): TEstoque_ajuste_itens_class;
begin
  Result := TEstoque_ajuste_itens_class(inherited Items[Index]);
end;

function TEstoque_ajuste_itens_classList.New: TEstoque_ajuste_itens_class;
begin
  Result := TEstoque_ajuste_itens_class.Create;
  Add(Result);
end;

procedure TEstoque_ajuste_itens_classList.SetItem(Index: Integer; const Value: TEstoque_ajuste_itens_class);
begin
  Put(Index, Value);
end;

procedure TEstoque_ajuste_itens_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
