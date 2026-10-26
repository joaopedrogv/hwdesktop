unit clientes_end_doc_add_class;

interface

uses
  Contnrs,
  DB,
  IBQuery;

type
  TClientes_end_doc_add_class = class(TObject)
  private
    Fcod_cliente   : Integer;
    Fcod_empresa   : Integer;
    Fseqid         : Integer;
    Ftipo          : string;
    Finsc_est      : string;
    Findiedest     : Integer;
    Fidestrangeiro : string;
    Fisuf          : string;
    Fim            : string;
    Femail         : string;
    Fxlgr          : string;
    Fnro           : string;
    Fxcpl          : string;
    Fxbairro       : string;
    Fcmun          : Integer;
    Fxmun          : string;
    Fuf            : string;
    Fcep           : string;
    Fcpais         : Integer;
    Fxpais         : string;
    Ffone          : string;
    Fativo         : Integer;
    Fcod_localidade: Integer;
    Fcod_cidade    : Integer;
  public
    constructor Create;
    destructor Destroy; override;

    procedure SetValuesFrom(ADataSet: TDataSet); virtual;

    procedure SetValuesInParams(ADataSet: TIBQuery);

    class function GetFieldsSql(Aalias: string = ''): string;

    property cod_cliente   : Integer read Fcod_cliente    write Fcod_cliente;
    property cod_empresa   : Integer read Fcod_empresa    write Fcod_empresa;
    property seqid         : Integer read Fseqid          write Fseqid;
    property tipo          : string  read Ftipo           write Ftipo;
    property insc_est      : string  read Finsc_est       write Finsc_est;
    property indiedest     : Integer read Findiedest      write Findiedest;
    property idestrangeiro : string  read Fidestrangeiro  write Fidestrangeiro;
    property isuf          : string  read Fisuf           write Fisuf;
    property im            : string  read Fim             write Fim;
    property email         : string  read Femail          write Femail;
    property xlgr          : string  read Fxlgr           write Fxlgr;
    property nro           : string  read Fnro            write Fnro;
    property xcpl          : string  read Fxcpl           write Fxcpl;
    property xbairro       : string  read Fxbairro        write Fxbairro;
    property cmun          : Integer read Fcmun           write Fcmun;
    property xmun          : string  read Fxmun           write Fxmun;
    property uf            : string  read Fuf             write Fuf;
    property cep           : string  read Fcep            write Fcep;
    property cpais         : Integer read Fcpais          write Fcpais;
    property xpais         : string  read Fxpais          write Fxpais;
    property fone          : string  read Ffone           write Ffone;
    property ativo         : Integer read Fativo          write Fativo;
    property cod_localidade: Integer read Fcod_localidade write Fcod_localidade;
    property cod_cidade    : Integer read Fcod_cidade     write Fcod_cidade;
  end;

  TClientes_end_doc_add_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TClientes_end_doc_add_class;
    procedure SetItem(Index: Integer; const Value: TClientes_end_doc_add_class);
  public
    function New: TClientes_end_doc_add_class;

    property Items[Index: Integer]: TClientes_end_doc_add_class read GetItem write SetItem;
  end;

implementation

uses
  SysUtils;

{ TClientes_end_doc_add_class }

constructor TClientes_end_doc_add_class.Create;
begin
  Fativo := 1;
end;

destructor TClientes_end_doc_add_class.Destroy;
begin
  inherited;
end;

class function TClientes_end_doc_add_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@cod_cliente, @cod_empresa, @seqid, @tipo, @insc_est, @indiedest, @idestrangeiro, @isuf, @im, @email, @xlgr,' +
            ' @nro, @xcpl, @xbairro, @cmun, @xmun, @uf, @cep, @cpais, @xpais, @fone, @ativo, @cod_localidade, @cod_cidade';
  if Trim(Aalias) <> '' then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TClientes_end_doc_add_class.SetValuesFrom(ADataSet: TDataSet);
begin
  Fcod_cliente    := ADataSet.FieldByName('COD_CLIENTE').AsInteger;
  Fcod_empresa    := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
  Fseqid          := ADataSet.FieldByName('SEQID').AsInteger;
  Ftipo           := Trim(ADataSet.FieldByName('TIPO').AsString);
  Finsc_est       := Trim(ADataSet.FieldByName('INSC_EST').AsString);
  Findiedest      := ADataSet.FieldByName('INDIEDEST').AsInteger;
  Fidestrangeiro  := Trim(ADataSet.FieldByName('IDESTRANGEIRO').AsString);
  Fisuf           := Trim(ADataSet.FieldByName('ISUF').AsString);
  Fim             := Trim(ADataSet.FieldByName('IM').AsString);
  Femail          := Trim(ADataSet.FieldByName('EMAIL').AsString);
  Fxlgr           := Trim(ADataSet.FieldByName('XLGR').AsString);
  Fnro            := Trim(ADataSet.FieldByName('NRO').AsString);
  Fxcpl           := Trim(ADataSet.FieldByName('XCPL').AsString);
  Fxbairro        := Trim(ADataSet.FieldByName('XBAIRRO').AsString);
  Fcmun           := ADataSet.FieldByName('CMUN').AsInteger;
  Fxmun           := Trim(ADataSet.FieldByName('XMUN').AsString);
  Fuf             := Trim(ADataSet.FieldByName('UF').AsString);
  Fcep            := Trim(ADataSet.FieldByName('CEP').AsString);
  Fcpais          := ADataSet.FieldByName('CPAIS').AsInteger;
  Fxpais          := Trim(ADataSet.FieldByName('XPAIS').AsString);
  Ffone           := Trim(ADataSet.FieldByName('FONE').AsString);
  Fativo          := ADataSet.FieldByName('ATIVO').AsInteger;
  Fcod_localidade := ADataSet.FieldByName('COD_LOCALIDADE').AsInteger;
  Fcod_cidade     := ADataSet.FieldByName('COD_CIDADE').AsInteger;
end;

procedure TClientes_end_doc_add_class.SetValuesInParams(ADataSet: TIBQuery);
begin
  ADataSet.ParamByName('COD_CLIENTE').AsInteger    := Fcod_cliente;
  ADataSet.ParamByName('COD_EMPRESA').AsInteger    := Fcod_empresa;
  ADataSet.ParamByName('SEQID').AsInteger          := Fseqid;
  ADataSet.ParamByName('TIPO').AsString            := Copy(Ftipo         , 1, 32);
  ADataSet.ParamByName('INSC_EST').AsString        := Copy(Finsc_est     , 1, 14);
  ADataSet.ParamByName('INDIEDEST').AsInteger      := Findiedest;
  ADataSet.ParamByName('IDESTRANGEIRO').AsString   := Copy(Fidestrangeiro, 1, 20);
  ADataSet.ParamByName('ISUF').AsString            := Copy(Fisuf         , 1, 9);
  ADataSet.ParamByName('IM').AsString              := Copy(Fim           , 1, 15);
  ADataSet.ParamByName('EMAIL').AsString           := Copy(Femail        , 1, 60);
  ADataSet.ParamByName('XLGR').AsString            := Copy(Fxlgr         , 1, 60);
  ADataSet.ParamByName('NRO').AsString             := Copy(Fnro          , 1, 60);
  ADataSet.ParamByName('XCPL').AsString            := Copy(Fxcpl         , 1, 60);
  ADataSet.ParamByName('XBAIRRO').AsString         := Copy(Fxbairro      , 1, 60);
  ADataSet.ParamByName('CMUN').AsInteger           := Fcmun;
  ADataSet.ParamByName('XMUN').AsString            := Copy(Fxmun         , 1, 60);
  ADataSet.ParamByName('UF').AsString              := Copy(Fuf           , 1, 2);
  ADataSet.ParamByName('CEP').AsString             := Copy(Fcep          , 1, 8);
  ADataSet.ParamByName('CPAIS').AsInteger          := Fcpais;
  ADataSet.ParamByName('XPAIS').AsString           := Copy(Fxpais        , 1, 60);
  ADataSet.ParamByName('FONE').AsString            := Copy(Ffone         , 1, 14);
  ADataSet.ParamByName('ATIVO').AsInteger          := Fativo;
  ADataSet.ParamByName('COD_LOCALIDADE').AsInteger := Fcod_localidade;
  ADataSet.ParamByName('COD_CIDADE').AsInteger     := Fcod_cidade;
end;

{ TClientes_end_doc_add_classList }

function TClientes_end_doc_add_classList.GetItem(Index: Integer): TClientes_end_doc_add_class;
begin
  Result := TClientes_end_doc_add_class(inherited Items[Index]);
end;

function TClientes_end_doc_add_classList.New: TClientes_end_doc_add_class;
begin
  Result := TClientes_end_doc_add_class.Create;
  Add(Result);
end;

procedure TClientes_end_doc_add_classList.SetItem(Index: Integer; const Value: TClientes_end_doc_add_class);
begin
  Put(Index, Value);
end;

end.
