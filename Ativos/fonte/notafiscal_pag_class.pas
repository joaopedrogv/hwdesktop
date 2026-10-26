unit notafiscal_pag_class;

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
  TNotafiscal_pag_class = class(TObject)
  private
    Fcod_nf      : Integer;
    Fcod_empresa : Integer;
    Fseqid       : Integer;
    Ftpag        : Integer;
    Fvpag        : Double;
    Fcnpj        : string;
    Ftband       : Integer;
    Fcaut        : string;
    Fcod_controle: Integer;
    Ftpintegra   : string;
    Forigem_ped  : string;
    Findpag      : string;
    Fxpag        : string;
  public
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    function SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean = False): TIBQuery;

    class function GetFieldsSql(Aalias: string = ''): string; virtual;

    function Clone: TNotafiscal_pag_class; virtual;

    property cod_nf      : Integer read Fcod_nf       write Fcod_nf;
    property cod_empresa : Integer read Fcod_empresa  write Fcod_empresa;
    property seqid       : Integer read Fseqid        write Fseqid;
    property tpag        : Integer read Ftpag         write Ftpag;
    property vpag        : Double  read Fvpag         write Fvpag;
    property cnpj        : string  read Fcnpj         write Fcnpj;
    property tband       : Integer read Ftband        write Ftband;
    property caut        : string  read Fcaut         write Fcaut;
    property cod_controle: Integer read Fcod_controle write Fcod_controle;
    property tpintegra   : string  read Ftpintegra    write Ftpintegra;
    property origem_ped  : string  read Forigem_ped   write Forigem_ped;
    property indpag      : string  read Findpag       write Findpag;
    property xpag        : string  read Fxpag         write Fxpag;
  end;

  TNotafiscal_pag_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TNotafiscal_pag_class;
    procedure SetItem(Index: Integer; const Value: TNotafiscal_pag_class);
  public
    function New: TNotafiscal_pag_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TNotafiscal_pag_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER180}
  SysUtils;
{$ELSE}
  System.SysUtils;
{$ENDIF}

{ TNotafiscal_pag_class }

function TNotafiscal_pag_class.Clone: TNotafiscal_pag_class;
begin
  Result              := TNotafiscal_pag_class.Create;
  Result.cod_nf       := Self.cod_nf;
  Result.cod_empresa  := Self.cod_empresa;
  Result.seqid        := Self.seqid;
  Result.tpag         := Self.tpag;
  Result.vpag         := Self.vpag;
  Result.cnpj         := Self.cnpj;
  Result.tband        := Self.tband;
  Result.caut         := Self.caut;
  Result.cod_controle := Self.cod_controle;
  Result.tpintegra    := Self.tpintegra;
  Result.origem_ped   := Self.origem_ped;
  Result.indpag       := Self.indpag;
  Result.xpag         := Self.xpag;
end;

class function TNotafiscal_pag_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@cod_nf, @cod_empresa, @seqid, @tpag, @vpag, @cnpj, @tband, @caut, @cod_controle, @tpintegra, @origem_ped,' +
            ' @indpag, @xpag';
  if (Trim(Aalias) <> '') and (Trim(Aalias) <> ':') then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TNotafiscal_pag_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    Fcod_nf       := ADataSet.FieldByName('COD_NF').AsInteger;
    Fcod_empresa  := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    Fseqid        := ADataSet.FieldByName('SEQID').AsInteger;
    Ftpag         := ADataSet.FieldByName('TPAG').AsInteger;
    Fvpag         := ADataSet.FieldByName('VPAG').AsFloat;
    Fcnpj         := Trim(ADataSet.FieldByName('CNPJ').AsString);
    Ftband        := ADataSet.FieldByName('TBAND').AsInteger;
    Fcaut         := Trim(ADataSet.FieldByName('CAUT').AsString);
    Fcod_controle := ADataSet.FieldByName('COD_CONTROLE').AsInteger;
    Ftpintegra    := Trim(ADataSet.FieldByName('TPINTEGRA').AsString);
    Forigem_ped   := Trim(ADataSet.FieldByName('ORIGEM_PED').AsString);
    Findpag       := Trim(ADataSet.FieldByName('INDPAG').AsString);
    Fxpag         := Trim(ADataSet.FieldByName('XPAG').AsString);
  end
  else
  begin
    if Assigned(ADataSet.FindField('COD_NF'      )) then Fcod_nf       := ADataSet.FieldByName('COD_NF').AsInteger;
    if Assigned(ADataSet.FindField('COD_EMPRESA' )) then Fcod_empresa  := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    if Assigned(ADataSet.FindField('SEQID'       )) then Fseqid        := ADataSet.FieldByName('SEQID').AsInteger;
    if Assigned(ADataSet.FindField('TPAG'        )) then Ftpag         := ADataSet.FieldByName('TPAG').AsInteger;
    if Assigned(ADataSet.FindField('VPAG'        )) then Fvpag         := ADataSet.FieldByName('VPAG').AsFloat;
    if Assigned(ADataSet.FindField('CNPJ'        )) then Fcnpj         := Trim(ADataSet.FieldByName('CNPJ').AsString);
    if Assigned(ADataSet.FindField('TBAND'       )) then Ftband        := ADataSet.FieldByName('TBAND').AsInteger;
    if Assigned(ADataSet.FindField('CAUT'        )) then Fcaut         := Trim(ADataSet.FieldByName('CAUT').AsString);
    if Assigned(ADataSet.FindField('COD_CONTROLE')) then Fcod_controle := ADataSet.FieldByName('COD_CONTROLE').AsInteger;
    if Assigned(ADataSet.FindField('TPINTEGRA'   )) then Ftpintegra    := Trim(ADataSet.FieldByName('TPINTEGRA').AsString);
    if Assigned(ADataSet.FindField('ORIGEM_PED'  )) then Forigem_ped   := Trim(ADataSet.FieldByName('ORIGEM_PED').AsString);
    if Assigned(ADataSet.FindField('INDPAG'      )) then Findpag       := Trim(ADataSet.FieldByName('INDPAG').AsString);
    if Assigned(ADataSet.FindField('XPAG'        )) then Fxpag         := Trim(ADataSet.FieldByName('XPAG').AsString);
  end;
end;

function TNotafiscal_pag_class.SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean): TIBQuery;
begin
  Result := ADataSet;

  if not AcheckParams then
  begin
    ADataSet.ParamByName('COD_NF').AsInteger       := Fcod_nf;
    ADataSet.ParamByName('COD_EMPRESA').AsInteger  := Fcod_empresa;
    ADataSet.ParamByName('SEQID').AsInteger        := Fseqid;
    ADataSet.ParamByName('TPAG').AsInteger         := Ftpag;
    ADataSet.ParamByName('VPAG').AsFloat           := Fvpag;
    ADataSet.ParamByName('CNPJ').AsString          := Copy(Fcnpj      , 1, 14);
    ADataSet.ParamByName('TBAND').AsInteger        := Ftband;
    ADataSet.ParamByName('CAUT').AsString          := Copy(Fcaut      , 1, 20);
    ADataSet.ParamByName('COD_CONTROLE').AsInteger := Fcod_controle;
    ADataSet.ParamByName('TPINTEGRA').AsString     := Copy(Ftpintegra , 1, 1);
    ADataSet.ParamByName('ORIGEM_PED').AsString    := Copy(Forigem_ped, 1, 1);
    ADataSet.ParamByName('INDPAG').AsString        := Copy(Findpag    , 1, 1);
    ADataSet.ParamByName('XPAG').AsString          := Copy(Fxpag      , 1, 60);
  end
  else
  begin
    if Assigned(ADataSet.Params.FindParam('COD_NF'      )) then   ADataSet.ParamByName('COD_NF').AsInteger       := Fcod_nf;
    if Assigned(ADataSet.Params.FindParam('COD_EMPRESA' )) then   ADataSet.ParamByName('COD_EMPRESA').AsInteger  := Fcod_empresa;
    if Assigned(ADataSet.Params.FindParam('SEQID'       )) then   ADataSet.ParamByName('SEQID').AsInteger        := Fseqid;
    if Assigned(ADataSet.Params.FindParam('TPAG'        )) then   ADataSet.ParamByName('TPAG').AsInteger         := Ftpag;
    if Assigned(ADataSet.Params.FindParam('VPAG'        )) then   ADataSet.ParamByName('VPAG').AsFloat           := Fvpag;
    if Assigned(ADataSet.Params.FindParam('CNPJ'        )) then   ADataSet.ParamByName('CNPJ').AsString          := Copy(Fcnpj      , 1, 14);
    if Assigned(ADataSet.Params.FindParam('TBAND'       )) then   ADataSet.ParamByName('TBAND').AsInteger        := Ftband;
    if Assigned(ADataSet.Params.FindParam('CAUT'        )) then   ADataSet.ParamByName('CAUT').AsString          := Copy(Fcaut      , 1, 20);
    if Assigned(ADataSet.Params.FindParam('COD_CONTROLE')) then   ADataSet.ParamByName('COD_CONTROLE').AsInteger := Fcod_controle;
    if Assigned(ADataSet.Params.FindParam('TPINTEGRA'   )) then   ADataSet.ParamByName('TPINTEGRA').AsString     := Copy(Ftpintegra , 1, 1);
    if Assigned(ADataSet.Params.FindParam('ORIGEM_PED'  )) then   ADataSet.ParamByName('ORIGEM_PED').AsString    := Copy(Forigem_ped, 1, 1);
    if Assigned(ADataSet.Params.FindParam('INDPAG'      )) then   ADataSet.ParamByName('INDPAG').AsString        := Copy(Findpag    , 1, 1);
    if Assigned(ADataSet.Params.FindParam('XPAG'        )) then   ADataSet.ParamByName('XPAG').AsString          := Copy(Fxpag      , 1, 60);
  end;
end;

{ TNotafiscal_pag_classList }

function TNotafiscal_pag_classList.GetItem(Index: Integer): TNotafiscal_pag_class;
begin
  Result := TNotafiscal_pag_class(inherited Items[Index]);
end;

function TNotafiscal_pag_classList.New: TNotafiscal_pag_class;
begin
  Result := TNotafiscal_pag_class.Create;
  Add(Result);
end;

procedure TNotafiscal_pag_classList.SetItem(Index: Integer; const Value: TNotafiscal_pag_class);
begin
  Put(Index, Value);
end;

procedure TNotafiscal_pag_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
