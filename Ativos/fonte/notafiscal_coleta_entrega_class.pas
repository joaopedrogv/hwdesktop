unit notafiscal_coleta_entrega_class;

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
  TNotafiscal_coleta_entrega_class = class(TObject)
  private
    Fcod_nf     : Integer;
    Fcod_empresa: Integer;
    Ftipo       : Integer;
    Fcpfcnpj    : string;
    Fie         : string;
    Fxnome      : string;
    Fxlgr       : string;
    Fnro        : string;
    Fxcpl       : string;
    Fxbairro    : string;
    Fcmun       : Integer;
    Fxmun       : string;
    Fuf         : string;
    Fcep        : string;
    Fcpais      : Integer;
    Fxpais      : string;
    Ffone       : string;
    Femail      : string;
  public
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    class function GetFieldsSql(Aalias: string = ''): string; virtual;

    property cod_nf     : Integer read Fcod_nf      write Fcod_nf;
    property cod_empresa: Integer read Fcod_empresa write Fcod_empresa;
    property tipo       : Integer read Ftipo        write Ftipo;
    property cpfcnpj    : string  read Fcpfcnpj     write Fcpfcnpj;
    property ie         : string  read Fie          write Fie;
    property xnome      : string  read Fxnome       write Fxnome;
    property xlgr       : string  read Fxlgr        write Fxlgr;
    property nro        : string  read Fnro         write Fnro;
    property xcpl       : string  read Fxcpl        write Fxcpl;
    property xbairro    : string  read Fxbairro     write Fxbairro;
    property cmun       : Integer read Fcmun        write Fcmun;
    property xmun       : string  read Fxmun        write Fxmun;
    property uf         : string  read Fuf          write Fuf;
    property cep        : string  read Fcep         write Fcep;
    property cpais      : Integer read Fcpais       write Fcpais;
    property xpais      : string  read Fxpais       write Fxpais;
    property fone       : string  read Ffone        write Ffone;
    property email      : string  read Femail       write Femail;
  end;

  TNotafiscal_coleta_entrega_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TNotafiscal_coleta_entrega_class;
    procedure SetItem(Index: Integer; const Value: TNotafiscal_coleta_entrega_class);
  public
    function New: TNotafiscal_coleta_entrega_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TNotafiscal_coleta_entrega_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER310}
  System.SysUtils;
{$ELSE}
  SysUtils;
{$ENDIF}

{ TNotafiscal_coleta_entrega_class }

class function TNotafiscal_coleta_entrega_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@cod_nf, @cod_empresa, @tipo, @cpfcnpj, @ie, @xnome, @xlgr, @nro, @xcpl, @xbairro, @cmun, @xmun, @uf, @cep,' +
            ' @cpais, @xpais, @fone, @email';
  if (Trim(Aalias) <> '') and (Trim(Aalias) <> ':') then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TNotafiscal_coleta_entrega_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    Fcod_nf      := ADataSet.FieldByName('COD_NF').AsInteger;
    Fcod_empresa := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    Ftipo        := ADataSet.FieldByName('TIPO').AsInteger;
    Fcpfcnpj     := Trim(ADataSet.FieldByName('CPFCNPJ').AsString);
    Fie          := Trim(ADataSet.FieldByName('IE').AsString);
    Fxnome       := Trim(ADataSet.FieldByName('XNOME').AsString);
    Fxlgr        := Trim(ADataSet.FieldByName('XLGR').AsString);
    Fnro         := Trim(ADataSet.FieldByName('NRO').AsString);
    Fxcpl        := Trim(ADataSet.FieldByName('XCPL').AsString);
    Fxbairro     := Trim(ADataSet.FieldByName('XBAIRRO').AsString);
    Fcmun        := ADataSet.FieldByName('CMUN').AsInteger;
    Fxmun        := Trim(ADataSet.FieldByName('XMUN').AsString);
    Fuf          := Trim(ADataSet.FieldByName('UF').AsString);
    Fcep         := Trim(ADataSet.FieldByName('CEP').AsString);
    Fcpais       := ADataSet.FieldByName('CPAIS').AsInteger;
    Fxpais       := Trim(ADataSet.FieldByName('XPAIS').AsString);
    Ffone        := Trim(ADataSet.FieldByName('FONE').AsString);
    Femail       := Trim(ADataSet.FieldByName('EMAIL').AsString);
  end
  else
  begin
    if Assigned(ADataSet.FindField('COD_NF'     )) then Fcod_nf      := ADataSet.FieldByName('COD_NF').AsInteger;
    if Assigned(ADataSet.FindField('COD_EMPRESA')) then Fcod_empresa := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    if Assigned(ADataSet.FindField('TIPO'       )) then Ftipo        := ADataSet.FieldByName('TIPO').AsInteger;
    if Assigned(ADataSet.FindField('CPFCNPJ'    )) then Fcpfcnpj     := Trim(ADataSet.FieldByName('CPFCNPJ').AsString);
    if Assigned(ADataSet.FindField('IE'         )) then Fie          := Trim(ADataSet.FieldByName('IE').AsString);
    if Assigned(ADataSet.FindField('XNOME'      )) then Fxnome       := Trim(ADataSet.FieldByName('XNOME').AsString);
    if Assigned(ADataSet.FindField('XLGR'       )) then Fxlgr        := Trim(ADataSet.FieldByName('XLGR').AsString);
    if Assigned(ADataSet.FindField('NRO'        )) then Fnro         := Trim(ADataSet.FieldByName('NRO').AsString);
    if Assigned(ADataSet.FindField('XCPL'       )) then Fxcpl        := Trim(ADataSet.FieldByName('XCPL').AsString);
    if Assigned(ADataSet.FindField('XBAIRRO'    )) then Fxbairro     := Trim(ADataSet.FieldByName('XBAIRRO').AsString);
    if Assigned(ADataSet.FindField('CMUN'       )) then Fcmun        := ADataSet.FieldByName('CMUN').AsInteger;
    if Assigned(ADataSet.FindField('XMUN'       )) then Fxmun        := Trim(ADataSet.FieldByName('XMUN').AsString);
    if Assigned(ADataSet.FindField('UF'         )) then Fuf          := Trim(ADataSet.FieldByName('UF').AsString);
    if Assigned(ADataSet.FindField('CEP'        )) then Fcep         := Trim(ADataSet.FieldByName('CEP').AsString);
    if Assigned(ADataSet.FindField('CPAIS'      )) then Fcpais       := ADataSet.FieldByName('CPAIS').AsInteger;
    if Assigned(ADataSet.FindField('XPAIS'      )) then Fxpais       := Trim(ADataSet.FieldByName('XPAIS').AsString);
    if Assigned(ADataSet.FindField('FONE'       )) then Ffone        := Trim(ADataSet.FieldByName('FONE').AsString);
    if Assigned(ADataSet.FindField('EMAIL'      )) then Femail       := Trim(ADataSet.FieldByName('EMAIL').AsString);
  end;
end;

{ TNotafiscal_coleta_entrega_classList }

function TNotafiscal_coleta_entrega_classList.GetItem(Index: Integer): TNotafiscal_coleta_entrega_class;
begin
  Result := TNotafiscal_coleta_entrega_class(inherited Items[Index]);
end;

function TNotafiscal_coleta_entrega_classList.New: TNotafiscal_coleta_entrega_class;
begin
  Result := TNotafiscal_coleta_entrega_class.Create;
  Add(Result);
end;

procedure TNotafiscal_coleta_entrega_classList.SetItem(Index: Integer; const Value: TNotafiscal_coleta_entrega_class);
begin
  Put(Index, Value);
end;

procedure TNotafiscal_coleta_entrega_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
