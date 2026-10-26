unit nfce_dest_class;

interface

uses
  Contnrs,
  DB;

type
  TNfce_dest_class = class(TObject)
  private
    Fcod_nfce   : Integer;
    Fcod_empresa: Integer;
    Fcnpjcpf    : string;
    Fxnome      : string;
    Femail      : string;
    Fxlgr       : string;
    Fnro        : string;
    Fxcpl       : string;
    Fxbairro    : string;
    Fcmun       : Integer;
    Fxmun       : string;
    Fuf         : string;
    Fcep        : string;
    Ffone       : string;
  public
    procedure SetValuesFrom(ADataSet: TDataSet); virtual;

    function GetFieldsSql(Aalias: string = ''): string;

    property cod_nfce   : Integer read Fcod_nfce    write Fcod_nfce;
    property cod_empresa: Integer read Fcod_empresa write Fcod_empresa;
    property cnpjcpf    : string  read Fcnpjcpf     write Fcnpjcpf;
    property xnome      : string  read Fxnome       write Fxnome;
    property email      : string  read Femail       write Femail;
    property xlgr       : string  read Fxlgr        write Fxlgr;
    property nro        : string  read Fnro         write Fnro;
    property xcpl       : string  read Fxcpl        write Fxcpl;
    property xbairro    : string  read Fxbairro     write Fxbairro;
    property cmun       : Integer read Fcmun        write Fcmun;
    property xmun       : string  read Fxmun        write Fxmun;
    property uf         : string  read Fuf          write Fuf;
    property cep        : string  read Fcep         write Fcep;
    property fone       : string  read Ffone        write Ffone;
  end;

  TNfce_dest_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TNfce_dest_class;
    procedure SetItem(Index: Integer; const Value: TNfce_dest_class);
  public
    function New: TNfce_dest_class;

    property Items[Index: Integer]: TNfce_dest_class read GetItem write SetItem;
  end;

implementation

uses
  SysUtils;

{TNfce_dest_class}

function TNfce_dest_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@cod_nfce, @cod_empresa, @cnpjcpf, @xnome, @email, @xlgr, @nro, @xcpl, @xbairro, @cmun, @xmun, @uf, @cep,' +
            ' @fone';
  if Trim(Aalias) <> '' then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TNfce_dest_class.SetValuesFrom(ADataSet: TDataSet);
begin
  Fcod_nfce    := ADataSet.FieldByName('COD_NFCE').AsInteger;
  Fcod_empresa := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
  Fcnpjcpf     := Trim(ADataSet.FieldByName('CNPJCPF').AsString);
  Fxnome       := Trim(ADataSet.FieldByName('XNOME').AsString);
  Femail       := Trim(ADataSet.FieldByName('EMAIL').AsString);
  Fxlgr        := Trim(ADataSet.FieldByName('XLGR').AsString);
  Fnro         := Trim(ADataSet.FieldByName('NRO').AsString);
  Fxcpl        := Trim(ADataSet.FieldByName('XCPL').AsString);
  Fxbairro     := Trim(ADataSet.FieldByName('XBAIRRO').AsString);
  Fcmun        := ADataSet.FieldByName('CMUN').AsInteger;
  Fxmun        := Trim(ADataSet.FieldByName('XMUN').AsString);
  Fuf          := Trim(ADataSet.FieldByName('UF').AsString);
  Fcep         := Trim(ADataSet.FieldByName('CEP').AsString);
  Ffone        := Trim(ADataSet.FieldByName('FONE').AsString);
end;


{TNfce_dest_classList}

function TNfce_dest_classList.GetItem(Index: Integer): TNfce_dest_class;
begin
  Result := TNfce_dest_class(inherited Items[Index]);
end;

function TNfce_dest_classList.New: TNfce_dest_class;
begin
  Result := TNfce_dest_class.Create;
  Add(Result);
end;

procedure TNfce_dest_classList.SetItem(Index: Integer; const Value: TNfce_dest_class);
begin
  Put(Index, Value);
end;

end.
