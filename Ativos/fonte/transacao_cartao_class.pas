unit transacao_cartao_class;

interface

uses
{$IFDEF VER180}
  basefb_class,
  Classes,
  Contnrs,
  Variants;
{$ELSE}
  basefb_class,
  System.Classes,
  System.Contnrs,
  System.Variants;
{$ENDIF}

type
  TTransacao_cartao_class = class(TBaseFb_class)
  private
    Fseqid             : Integer;
    Fcod_empresa       : Integer;
    Ftpdocs            : string;
    Fnrequisicao       : Integer;
    Fsecao             : Integer;
    Fvalor_operacao    : Variant;
    Fvalor_transacao   : Variant;
    Fn_aut_cart        : string;
    Fn_docnsu_adm      : string;
    Fcod_terminal_adm  : string;
    Fstatus            : string;
    Fcod_controle      : Variant;
    Fparcelas          : Variant;
    Fdata_hora         : Variant;
    Fcod_usuario       : Variant;
    Flogin_usuario     : string;
    Fdata_hora_canc    : Variant;
    Fcod_usuario_canc  : Variant;
    Flogin_usuario_canc: string;
    Fimpressao         : TStrings;
    Fdata_transacao    : Variant;
    Foperacao          : string;
    Fdias_para_cred    : Variant;
    Frede              : string;
    Fguidt             : string;
    Fid_cartdig        : string;
    Fid_psp            : string;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property seqid             : Integer  read Fseqid              write Fseqid;
    property cod_empresa       : Integer  read Fcod_empresa        write Fcod_empresa;
    property tpdocs            : string   read Ftpdocs             write Ftpdocs;
    property nrequisicao       : Integer  read Fnrequisicao        write Fnrequisicao;
    property secao             : Integer  read Fsecao              write Fsecao;
    property valor_operacao    : Variant  read Fvalor_operacao     write Fvalor_operacao;
    property valor_transacao   : Variant  read Fvalor_transacao    write Fvalor_transacao;
    property n_aut_cart        : string   read Fn_aut_cart         write Fn_aut_cart;
    property n_docnsu_adm      : string   read Fn_docnsu_adm       write Fn_docnsu_adm;
    property cod_terminal_adm  : string   read Fcod_terminal_adm   write Fcod_terminal_adm;
    property status            : string   read Fstatus             write Fstatus;
    property cod_controle      : Variant  read Fcod_controle       write Fcod_controle;
    property parcelas          : Variant  read Fparcelas           write Fparcelas;
    property data_hora         : Variant  read Fdata_hora          write Fdata_hora;
    property cod_usuario       : Variant  read Fcod_usuario        write Fcod_usuario;
    property login_usuario     : string   read Flogin_usuario      write Flogin_usuario;
    property data_hora_canc    : Variant  read Fdata_hora_canc     write Fdata_hora_canc;
    property cod_usuario_canc  : Variant  read Fcod_usuario_canc   write Fcod_usuario_canc;
    property login_usuario_canc: string   read Flogin_usuario_canc write Flogin_usuario_canc;
    property impressao         : TStrings read Fimpressao          write Fimpressao;
    property data_transacao    : Variant  read Fdata_transacao     write Fdata_transacao;
    property operacao          : string   read Foperacao           write Foperacao;
    property dias_para_cred    : Variant  read Fdias_para_cred     write Fdias_para_cred;
    property rede              : string   read Frede               write Frede;
    property guidt             : string   read Fguidt              write Fguidt;
    property id_cartdig        : string   read Fid_cartdig         write Fid_cartdig;
    property id_psp            : string   read Fid_psp             write Fid_psp;
  end;

  TTransacao_cartoes_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TTransacao_cartao_class;
    procedure SetItem(Index: Integer; const Value: TTransacao_cartao_class);
  public
    function New: TTransacao_cartao_class;

    property Items[Index: Integer]: TTransacao_cartao_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER180}
  SysUtils;
{$ELSE}
  System.SysUtils;
{$ENDIF}

{ TTransacao_cartao_class }

procedure TTransacao_cartao_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('TRANSACAO_CARTAO');
  with FTable.Fields do
  begin
    AddField('SEQID'             , fkInteger , 0 , False, True              );
    AddField('COD_EMPRESA'       , fkInteger , 0 , False, True              );
    AddField('TPDOCS'            , fkString  , 6 , False                    );
    AddField('NREQUISICAO'       , fkInteger , 0 , False                    );
    AddField('SECAO'             , fkInteger , 0 , False                    );
    AddField('VALOR_OPERACAO'    , fkFloat   , 0 , True , False, False, True);
    AddField('VALOR_TRANSACAO'   , fkFloat   , 0 , True , False, False, True);
    AddField('N_AUT_CART'        , fkString  , 20                           );
    AddField('N_DOCNSU_ADM'      , fkString  , 10                           );
    AddField('COD_TERMINAL_ADM'  , fkString  , 10                           );
    AddField('STATUS'            , fkString  , 1 , True , False, False, True);
    AddField('COD_CONTROLE'      , fkInteger                                );
    AddField('PARCELAS'          , fkInteger                                );
    AddField('DATA_HORA'         , fkDateTime                               );
    AddField('COD_USUARIO'       , fkInteger                                );
    AddField('LOGIN_USUARIO'     , fkString  , 20                           );
    AddField('DATA_HORA_CANC'    , fkDateTime                               );
    AddField('COD_USUARIO_CANC'  , fkInteger                                );
    AddField('LOGIN_USUARIO_CANC', fkString  , 20                           );
    AddField('IMPRESSAO'         , fkTStrings                               );
    AddField('DATA_TRANSACAO'    , fkDateTime                               );
    AddField('OPERACAO'          , fkString  , 1                            );
    AddField('DIAS_PARA_CRED'    , fkInteger                                );
    AddField('REDE'              , fkString  , 32                           );
    AddField('GUIDT'             , fkString  , 36                           );
    AddField('ID_CARTDIG'        , fkString  , 8                            );
    AddField('ID_PSP'            , fkString  , 8                            );
  end;
  Fimpressao := TStringList.Create;
end;

constructor TTransacao_cartao_class.Create;
begin
  InitializeObjects;
end;

destructor TTransacao_cartao_class.Destroy;
begin
  if Assigned(Fimpressao) then
    FreeAndNil(Fimpressao);
  inherited;
end;

{ TTransacao_cartoes_class }

function TTransacao_cartoes_class.GetItem(Index: Integer): TTransacao_cartao_class;
begin
  Result := TTransacao_cartao_class(inherited Items[Index]);
end;

function TTransacao_cartoes_class.New: TTransacao_cartao_class;
begin
  Result := TTransacao_cartao_class.Create;
  Add(Result);
end;

procedure TTransacao_cartoes_class.SetItem(Index: Integer; const Value: TTransacao_cartao_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TTransacao_cartao_class);
finalization
  UnRegisterClass(TTransacao_cartao_class);

end.
