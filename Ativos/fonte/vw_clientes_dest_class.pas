unit vw_clientes_dest_class;

interface

uses
  Contnrs,
  DB,
  DBClient;

type
  TVw_clientes_dest_class = class(TObject)
  private
    Fcod_cliente   : Integer;
    Fcod_empresa   : Integer;
    Fdest_seqid    : Integer;
    Ftipo_end      : string;
    Fnome_cliente  : string;
    Frazao         : string;
    Fcpfcgc        : string;
    Finsc_est      : string;
    Findiedest     : Integer;
    Fidestrangeiro : string;
    Fisuf          : string;
    Fim            : string;
    Flogradouro    : string;
    Fnumero        : string;
    Fbairro        : string;
    Fcep           : string;
    Fcomplemento   : string;
    Fcidade        : string;
    Fuf            : string;
    Ftelefone      : string;
    Femail         : string;
    Flocalidade    : string;
    Fsetor         : string;
    Fcod_cidade    : Integer;
    Fcod_localidade: Integer;
    Fcmun          : Integer;
    Fcpais         : Integer;
    Fxpais         : string;  
    Fzfm_alc       : string;
    Fativo         : Integer;
  public
    constructor Create;
    destructor Destroy; override;

    procedure SetValuesFrom(ADataSet: TDataSet); virtual;

    procedure SetValuesFromIn(ADataSet: TClientDataSet; AdoPost: Boolean = True; AdoInsert: Boolean = True; AdoAppend: Boolean = False; AdoEdit: Boolean = False); virtual;

    class function GetFieldsSql(Aalias: string = ''): string;

    function Clone: TVw_clientes_dest_class; virtual;

    property cod_cliente   : Integer read Fcod_cliente    write Fcod_cliente;
    property cod_empresa   : Integer read Fcod_empresa    write Fcod_empresa;
    property dest_seqid    : Integer read Fdest_seqid     write Fdest_seqid;
    property tipo_end      : string  read Ftipo_end       write Ftipo_end;
    property nome_cliente  : string  read Fnome_cliente   write Fnome_cliente;
    property razao         : string  read Frazao          write Frazao;
    property cpfcgc        : string  read Fcpfcgc         write Fcpfcgc;
    property insc_est      : string  read Finsc_est       write Finsc_est;
    property indiedest     : Integer read Findiedest      write Findiedest;
    property idestrangeiro : string  read Fidestrangeiro  write Fidestrangeiro;
    property isuf          : string  read Fisuf           write Fisuf;
    property im            : string  read Fim             write Fim;
    property logradouro    : string  read Flogradouro     write Flogradouro;
    property numero        : string  read Fnumero         write Fnumero;
    property bairro        : string  read Fbairro         write Fbairro;
    property cep           : string  read Fcep            write Fcep;
    property complemento   : string  read Fcomplemento    write Fcomplemento;
    property cidade        : string  read Fcidade         write Fcidade;
    property uf            : string  read Fuf             write Fuf;
    property telefone      : string  read Ftelefone       write Ftelefone;
    property email         : string  read Femail          write Femail;
    property localidade    : string  read Flocalidade     write Flocalidade;
    property setor         : string  read Fsetor          write Fsetor;
    property cod_cidade    : Integer read Fcod_cidade     write Fcod_cidade;
    property cod_localidade: Integer read Fcod_localidade write Fcod_localidade;
    property cmun          : Integer read Fcmun           write Fcmun;
    property cpais         : Integer read Fcpais          write Fcpais;
    property xpais         : string  read Fxpais          write Fxpais;    
    property zfm_alc       : string  read Fzfm_alc        write Fzfm_alc;
    property ativo         : Integer read Fativo          write Fativo;
  end;

  TVw_clientes_dest_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TVw_clientes_dest_class;
    procedure SetItem(Index: Integer; const Value: TVw_clientes_dest_class);
  public
    function New: TVw_clientes_dest_class;

    property Items[Index: Integer]: TVw_clientes_dest_class read GetItem write SetItem;
  end;

implementation

uses
  SysUtils;

{ TVw_clientes_dest_class }

constructor TVw_clientes_dest_class.Create;
begin
  Fativo := 1;
end;

destructor TVw_clientes_dest_class.Destroy;
begin
  inherited;
end;

function TVw_clientes_dest_class.Clone: TVw_clientes_dest_class;
begin
  if not Assigned(Result) then
  Result                := TVw_clientes_dest_class.Create;
  Result.cod_cliente    := Self.cod_cliente;
  Result.cod_empresa    := Self.cod_empresa;
  Result.dest_seqid     := Self.dest_seqid;
  Result.tipo_end       := Self.tipo_end;
  Result.nome_cliente   := Self.nome_cliente;
  Result.razao          := Self.razao;
  Result.cpfcgc         := Self.cpfcgc;
  Result.insc_est       := Self.insc_est;
  Result.indiedest      := Self.indiedest;
  Result.idestrangeiro  := Self.idestrangeiro;
  Result.isuf           := Self.isuf;
  Result.im             := Self.im;
  Result.logradouro     := Self.logradouro;
  Result.numero         := Self.numero;
  Result.bairro         := Self.bairro;
  Result.cep            := Self.cep;
  Result.complemento    := Self.complemento;
  Result.cidade         := Self.cidade;
  Result.uf             := Self.uf;
  Result.telefone       := Self.telefone;
  Result.email          := Self.email;
  Result.localidade     := Self.localidade;
  Result.setor          := Self.setor;
  Result.cod_cidade     := Self.cod_cidade;
  Result.cod_localidade := Self.cod_localidade;
  Result.cmun           := Self.cmun;
  Result.cpais          := Self.cpais;
  Result.xpais          := Self.xpais;  
  Result.zfm_alc        := Self.zfm_alc;
  Result.ativo          := Self.ativo;
end;

class function TVw_clientes_dest_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@cod_cliente, @cod_empresa, @dest_seqid, @tipo_end, @nome_cliente, @razao, @cpfcgc, @insc_est, @indiedest,' +
            ' @idestrangeiro, @isuf, @im, @logradouro, @numero, @bairro, @cep, @complemento, @cidade, @uf, @telefone,' +
            ' @email, @localidade, @setor, @cod_cidade, @cod_localidade, @cmun, @cpais, @xpais, @zfm_alc, @ativo';
  if Trim(Aalias) <> '' then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TVw_clientes_dest_class.SetValuesFrom(ADataSet: TDataSet);
begin
  Fcod_cliente    := ADataSet.FieldByName('COD_CLIENTE').AsInteger;
  Fcod_empresa    := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
  Fdest_seqid     := ADataSet.FieldByName('DEST_SEQID').AsInteger;
  Ftipo_end       := Trim(ADataSet.FieldByName('TIPO_END').AsString);
  Fnome_cliente   := Trim(ADataSet.FieldByName('NOME_CLIENTE').AsString);
  Frazao          := Trim(ADataSet.FieldByName('RAZAO').AsString);
  Fcpfcgc         := Trim(ADataSet.FieldByName('CPFCGC').AsString);
  Finsc_est       := Trim(ADataSet.FieldByName('INSC_EST').AsString);
  Findiedest      := ADataSet.FieldByName('INDIEDEST').AsInteger;
  Fidestrangeiro  := Trim(ADataSet.FieldByName('IDESTRANGEIRO').AsString);
  Fisuf           := Trim(ADataSet.FieldByName('ISUF').AsString);
  Fim             := Trim(ADataSet.FieldByName('IM').AsString);
  Flogradouro     := Trim(ADataSet.FieldByName('LOGRADOURO').AsString);
  Fnumero         := Trim(ADataSet.FieldByName('NUMERO').AsString);
  Fbairro         := Trim(ADataSet.FieldByName('BAIRRO').AsString);
  Fcep            := Trim(ADataSet.FieldByName('CEP').AsString);
  Fcomplemento    := Trim(ADataSet.FieldByName('COMPLEMENTO').AsString);
  Fcidade         := Trim(ADataSet.FieldByName('CIDADE').AsString);
  Fuf             := Trim(ADataSet.FieldByName('UF').AsString);
  Ftelefone       := Trim(ADataSet.FieldByName('TELEFONE').AsString);
  Femail          := Trim(ADataSet.FieldByName('EMAIL').AsString);
  Flocalidade     := Trim(ADataSet.FieldByName('LOCALIDADE').AsString);
  Fsetor          := Trim(ADataSet.FieldByName('SETOR').AsString);
  Fcod_cidade     := ADataSet.FieldByName('COD_CIDADE').AsInteger;
  Fcod_localidade := ADataSet.FieldByName('COD_LOCALIDADE').AsInteger;
  Fcmun           := ADataSet.FieldByName('CMUN').AsInteger;
  Fcpais          := ADataSet.FieldByName('CPAIS').AsInteger;
  Fxpais          := Trim(ADataSet.FieldByName('XPAIS').AsString);
  Fzfm_alc        := Trim(ADataSet.FieldByName('ZFM_ALC').AsString);
  Fativo          := ADataSet.FieldByName('ATIVO').AsInteger;
end;

procedure TVw_clientes_dest_class.SetValuesFromIn(ADataSet: TClientDataSet; AdoPost, AdoInsert, AdoAppend, AdoEdit: Boolean);
begin
  if ADataSet.State = dsBrowse then
    if AdoEdit then
      ADataSet.Edit
    else if AdoAppend then
      ADataSet.Append
    else if AdoInsert then
      ADataSet.Insert;

  ADataSet.FieldByName('COD_CLIENTE').AsInteger    := Fcod_cliente;
  ADataSet.FieldByName('COD_EMPRESA').AsInteger    := Fcod_empresa;
  ADataSet.FieldByName('DEST_SEQID').AsInteger     := Fdest_seqid;
  ADataSet.FieldByName('TIPO_END').AsString        := Trim(Ftipo_end);
  ADataSet.FieldByName('NOME_CLIENTE').AsString    := Trim(Fnome_cliente);
  ADataSet.FieldByName('RAZAO').AsString           := Trim(Frazao);
  ADataSet.FieldByName('CPFCGC').AsString          := Trim(Fcpfcgc);
  ADataSet.FieldByName('INSC_EST').AsString        := Trim(Finsc_est);
  ADataSet.FieldByName('INDIEDEST').AsInteger      := Findiedest;
  ADataSet.FieldByName('IDESTRANGEIRO').AsString   := Trim(Fidestrangeiro);
  ADataSet.FieldByName('ISUF').AsString            := Trim(Fisuf);
  ADataSet.FieldByName('IM').AsString              := Trim(Fim);
  ADataSet.FieldByName('LOGRADOURO').AsString      := Trim(Flogradouro);
  ADataSet.FieldByName('NUMERO').AsString          := Trim(Fnumero);
  ADataSet.FieldByName('BAIRRO').AsString          := Trim(Fbairro);
  ADataSet.FieldByName('CEP').AsString             := Trim(Fcep);
  ADataSet.FieldByName('COMPLEMENTO').AsString     := Trim(Fcomplemento);
  ADataSet.FieldByName('CIDADE').AsString          := Trim(Fcidade);
  ADataSet.FieldByName('UF').AsString              := Trim(Fuf);
  ADataSet.FieldByName('TELEFONE').AsString        := Trim(Ftelefone);
  ADataSet.FieldByName('EMAIL').AsString           := Trim(Femail);
  ADataSet.FieldByName('LOCALIDADE').AsString      := Trim(Flocalidade);
  ADataSet.FieldByName('SETOR').AsString           := Trim(Fsetor);
  ADataSet.FieldByName('COD_CIDADE').AsInteger     := Fcod_cidade;
  ADataSet.FieldByName('COD_LOCALIDADE').AsInteger := Fcod_localidade;
  ADataSet.FieldByName('CMUN').AsInteger           := Fcmun;
  ADataSet.FieldByName('CPAIS').AsInteger          := Fcpais;
  ADataSet.FieldByName('XPAIS').AsString           := Trim(Fxpais);   
  ADataSet.FieldByName('ZFM_ALC').AsString         := Trim(Fzfm_alc);
  ADataSet.FieldByName('ATIVO').AsInteger          := Fativo;

  if AdoPost then
    ADataSet.Post;
end;

{ TVw_clientes_dest_classList }

function TVw_clientes_dest_classList.GetItem(Index: Integer): TVw_clientes_dest_class;
begin
  Result := TVw_clientes_dest_class(inherited Items[Index]);
end;

function TVw_clientes_dest_classList.New: TVw_clientes_dest_class;
begin
  Result := TVw_clientes_dest_class.Create;
  Add(Result);
end;

procedure TVw_clientes_dest_classList.SetItem(Index: Integer; const Value: TVw_clientes_dest_class);
begin
  Put(Index, Value);
end;

end.
