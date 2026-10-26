unit boletas_class;

interface

uses
{$IFDEF VER180}
  base_class,
  Classes,
  Contnrs,
  DB,
  IBQuery;
{$ELSE}
  base_class,
  System.Classes,
  System.Contnrs,
  Data.DB,
  IBX.IBQuery;
{$ENDIF}

type
  TBoletas_class = class(TBase_class)
  private
    Fn_seq_bol         : Integer;
    Fcod_empresa       : Integer;
    Fnum_nf_vnd        : Integer;
    Fn_cupom           : Integer;
    Fn_pdv             : Integer;
    Fcod_cred          : Integer;
    Fdata_em_bol       : TDateTime;
    Fdata_ven_bol      : TDateTime;
    Fdata_lim_desc     : TDateTime;
    Fn_doc_bol         : string;
    Fvl_doc_bol        : Double;
    Fobs_bol           : string;
    Fm_dia_bol         : Double;
    Fmult_atr_bol      : Double;
    Fcod_cliente       : Integer;
    Flocalpag          : string;
    Fobs_bol1          : string;
    Fativo             : Integer;
    Fnosso_numero_banco: string;
    Fcod_controle_cx   : Integer;
    Fremessa_enviada   : string;
    Fsub_serie         : Integer;
    Fdata_remessa      : TDateTime;
    Fcod_cobrebem      : Integer;
    Fcod_seq_remessa   : Integer;
    Fstatus            : string;
    Ftipo_emissao      : string;
    Focorrenciabancaria: TStrings;
    Fnparcela          : Integer;
    Ftotalparcelas     : Integer;
    Fidcarne           : Integer;
    Ftipoimpressao     : string;
    Fbancoemiteboleto  : string;
    Fnf_aut            : string;
    Fmensagem_bol      : string;
    Fmensagem_desc     : string;
    Fcod_carga         : Integer;
    Fcod_nf            : Integer;
    Fvl_orig           : Double;
    Fmensagem_adc      : string;
    Fdias_protesto     : Integer;
    Falterado          : string;
    Fcod_gerador       : Integer;
    Fhtmlboleto        : TStrings;
    Fenv_email_bol     : string;
    Fseqform           : Integer;
    Fpermite_protesto  : string;
    Fpermite_desconto  : string;
    Fqtd_dias_lim_desc : Integer;
    procedure Setn_seq_bol(const Value: Integer);
    procedure Setcod_empresa(const Value: Integer);
    procedure Setnum_nf_vnd(const Value: Integer);
    procedure Setn_cupom(const Value: Integer);
    procedure Setn_pdv(const Value: Integer);
    procedure Setcod_cred(const Value: Integer);
    procedure Setdata_em_bol(const Value: TDateTime);
    procedure Setdata_ven_bol(const Value: TDateTime);
    procedure Setdata_lim_desc(const Value: TDateTime);
    procedure Setn_doc_bol(const Value: string);
    procedure Setvl_doc_bol(const Value: Double);
    procedure Setobs_bol(const Value: string);
    procedure Setm_dia_bol(const Value: Double);
    procedure Setmult_atr_bol(const Value: Double);
    procedure Setcod_cliente(const Value: Integer);
    procedure Setlocalpag(const Value: string);
    procedure Setobs_bol1(const Value: string);
    procedure Setativo(const Value: Integer);
    procedure Setnosso_numero_banco(const Value: string);
    procedure Setcod_controle_cx(const Value: Integer);
    procedure Setremessa_enviada(const Value: string);
    procedure Setsub_serie(const Value: Integer);
    procedure Setdata_remessa(const Value: TDateTime);
    procedure Setcod_cobrebem(const Value: Integer);
    procedure Setcod_seq_remessa(const Value: Integer);
    procedure Setstatus(const Value: string);
    procedure Settipo_emissao(const Value: string);
    procedure Setocorrenciabancaria(const Value: TStrings);
    procedure Setnparcela(const Value: Integer);
    procedure Settotalparcelas(const Value: Integer);
    procedure Setidcarne(const Value: Integer);
    procedure Settipoimpressao(const Value: string);
    procedure Setbancoemiteboleto(const Value: string);
    procedure Setnf_aut(const Value: string);
    procedure Setmensagem_bol(const Value: string);
    procedure Setcod_carga(const Value: Integer);
    procedure Setcod_nf(const Value: Integer);
    procedure Setvl_orig(const Value: Double);
    procedure Setmensagem_adc(const Value: string);
    procedure Setmensagem_desc(const Value: string);
    procedure Setpermite_protesto(const Value: string);
    procedure Setpermite_desconto(const Value: string);
    procedure Setqtd_dias_lim_desc(const Value: Integer);
    procedure Setdias_protesto(const Value: Integer);
    procedure Setalterado(const Value: string);
    procedure Setcod_gerador(const Value: Integer);
    procedure Sethtmlboleto(const Value: TStrings);
    procedure Setenv_email_bol(const Value: string);
    procedure Setseqform(const Value: Integer);
  public
    constructor Create;
    destructor Destroy; override;

    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    function SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean = False): TIBQuery;

    class function GetFieldsSql(Aalias: string = ''): string; virtual;

    function SQLMotor(AautoIncField: string = ''; AignoreFields: string = 'ativo'): TSQLBase_fb; override;

    property n_seq_bol         : Integer   read Fn_seq_bol          write Setn_seq_bol;
    property cod_empresa       : Integer   read Fcod_empresa        write Setcod_empresa;
    property num_nf_vnd        : Integer   read Fnum_nf_vnd         write Setnum_nf_vnd;
    property n_cupom           : Integer   read Fn_cupom            write Setn_cupom;
    property n_pdv             : Integer   read Fn_pdv              write Setn_pdv;
    property cod_cred          : Integer   read Fcod_cred           write Setcod_cred;
    property data_em_bol       : TDateTime read Fdata_em_bol        write Setdata_em_bol;
    property data_ven_bol      : TDateTime read Fdata_ven_bol       write Setdata_ven_bol;
    property data_lim_desc     : TDateTime read Fdata_lim_desc      write Setdata_lim_desc;
    property n_doc_bol         : string    read Fn_doc_bol          write Setn_doc_bol;
    property vl_doc_bol        : Double    read Fvl_doc_bol         write Setvl_doc_bol;
    property obs_bol           : string    read Fobs_bol            write Setobs_bol;
    property m_dia_bol         : Double    read Fm_dia_bol          write Setm_dia_bol;
    property mult_atr_bol      : Double    read Fmult_atr_bol       write Setmult_atr_bol;
    property cod_cliente       : Integer   read Fcod_cliente        write Setcod_cliente;
    property localpag          : string    read Flocalpag           write Setlocalpag;
    property obs_bol1          : string    read Fobs_bol1           write Setobs_bol1;
    property ativo             : Integer   read Fativo              write Setativo;
    property nosso_numero_banco: string    read Fnosso_numero_banco write Setnosso_numero_banco;
    property cod_controle_cx   : Integer   read Fcod_controle_cx    write Setcod_controle_cx;
    property remessa_enviada   : string    read Fremessa_enviada    write Setremessa_enviada;
    property sub_serie         : Integer   read Fsub_serie          write Setsub_serie;
    property data_remessa      : TDateTime read Fdata_remessa       write Setdata_remessa;
    property cod_cobrebem      : Integer   read Fcod_cobrebem       write Setcod_cobrebem;
    property cod_seq_remessa   : Integer   read Fcod_seq_remessa    write Setcod_seq_remessa;
    property status            : string    read Fstatus             write Setstatus;
    property tipo_emissao      : string    read Ftipo_emissao       write Settipo_emissao;
    property ocorrenciabancaria: TStrings  read Focorrenciabancaria write Setocorrenciabancaria;
    property nparcela          : Integer   read Fnparcela           write Setnparcela;
    property totalparcelas     : Integer   read Ftotalparcelas      write Settotalparcelas;
    property idcarne           : Integer   read Fidcarne            write Setidcarne;
    property tipoimpressao     : string    read Ftipoimpressao      write Settipoimpressao;
    property bancoemiteboleto  : string    read Fbancoemiteboleto   write Setbancoemiteboleto;
    property nf_aut            : string    read Fnf_aut             write Setnf_aut;
    property mensagem_bol      : string    read Fmensagem_bol       write Setmensagem_bol;
    property mensagem_adc      : string    read Fmensagem_adc       write Setmensagem_adc;
    property mensagem_desc     : string    read Fmensagem_desc      write Setmensagem_desc;
    property permite_protesto  : string    read Fpermite_protesto   write Setpermite_protesto;
    property permite_desconto  : string    read Fpermite_desconto   write Setpermite_desconto;
    property qtd_dias_lim_desc : Integer   read Fqtd_dias_lim_desc  write Setqtd_dias_lim_desc;
    property cod_carga         : Integer   read Fcod_carga          write Setcod_carga;
    property cod_nf            : Integer   read Fcod_nf             write Setcod_nf;
    property vl_orig           : Double    read Fvl_orig            write Setvl_orig;
    property dias_protesto     : Integer   read Fdias_protesto      write Setdias_protesto;
    property alterado          : string    read Falterado           write Setalterado;
    property cod_gerador       : Integer   read Fcod_gerador        write Setcod_gerador;
    property htmlboleto        : TStrings  read Fhtmlboleto         write Sethtmlboleto;
    property env_email_bol     : string    read Fenv_email_bol      write Setenv_email_bol;
    property seqform           : Integer   read Fseqform            write Setseqform;
  end;

  TBoletas_classList = class(TBase_classList)
  private
    function GetItem(Index: Integer): TBoletas_class;
    procedure SetItem(Index: Integer; const Value: TBoletas_class);
  public
    function New: TBoletas_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TBoletas_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER310}
  System.SysUtils;
{$ELSE}
  SysUtils;
{$ENDIF}

{ TBoletas_class }

constructor TBoletas_class.Create;
begin
  Ftable             := TTable_fb.Create('BOLETAS',
                                         'N_SEQ_BOL, COD_EMPRESA',
                                         'COD_COBREBEM, COD_EMPRESA',
                                         GetFieldsSql());
  Fativo             := 1;
  ocorrenciabancaria := TStringList.Create;
  htmlboleto         := TStringList.Create;
end;

destructor TBoletas_class.Destroy;
begin
  if Assigned(Ftable) then
    FreeAndNil(Ftable);
  if Assigned(Focorrenciabancaria) then
    FreeAndNil(Focorrenciabancaria);
  if Assigned(Fhtmlboleto) then
    FreeAndNil(Fhtmlboleto);
  inherited;
end;

class function TBoletas_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@n_seq_bol, @cod_empresa, @num_nf_vnd, @n_cupom, @n_pdv, @cod_cred, @data_em_bol, @data_ven_bol, @data_lim_desc, @n_doc_bol,' +
            ' @vl_doc_bol, @obs_bol, @m_dia_bol, @mult_atr_bol, @cod_cliente, @localpag, @obs_bol1, @ativo,' +
            ' @nosso_numero_banco, @cod_controle_cx, @remessa_enviada, @sub_serie, @data_remessa, @cod_cobrebem,' +
            ' @cod_seq_remessa, @status, @tipo_emissao, @ocorrenciabancaria, @nparcela, @totalparcelas, @idcarne,' +
            ' @tipoimpressao, @bancoemiteboleto, @nf_aut, @mensagem_bol, @cod_carga, @cod_nf, @vl_orig, @mensagem_adc,' +
            ' @dias_protesto, @alterado, @cod_gerador, @htmlboleto, @env_email_bol, @seqform';
  if (Trim(Aalias) <> '') and (Trim(Aalias) <> ':') then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TBoletas_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    n_seq_bol               := ADataSet.FieldByName('N_SEQ_BOL').AsInteger;
    cod_empresa             := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    num_nf_vnd              := ADataSet.FieldByName('NUM_NF_VND').AsInteger;
    n_cupom                 := ADataSet.FieldByName('N_CUPOM').AsInteger;
    n_pdv                   := ADataSet.FieldByName('N_PDV').AsInteger;
    cod_cred                := ADataSet.FieldByName('COD_CRED').AsInteger;
    data_em_bol             := ADataSet.FieldByName('DATA_EM_BOL').AsDateTime;
    data_ven_bol            := ADataSet.FieldByName('DATA_VEN_BOL').AsDateTime;
    data_lim_desc           := ADataSet.FieldByName('DATA_LIM_DESC').AsDateTime;
    n_doc_bol               := Trim(ADataSet.FieldByName('N_DOC_BOL').AsString);
    vl_doc_bol              := ADataSet.FieldByName('VL_DOC_BOL').AsFloat;
    obs_bol                 := Trim(ADataSet.FieldByName('OBS_BOL').AsString);
    m_dia_bol               := ADataSet.FieldByName('M_DIA_BOL').AsFloat;
    mult_atr_bol            := ADataSet.FieldByName('MULT_ATR_BOL').AsFloat;
    cod_cliente             := ADataSet.FieldByName('COD_CLIENTE').AsInteger;
    localpag                := Trim(ADataSet.FieldByName('LOCALPAG').AsString);
    obs_bol1                := Trim(ADataSet.FieldByName('OBS_BOL1').AsString);
    ativo                   := ADataSet.FieldByName('ATIVO').AsInteger;
    nosso_numero_banco      := Trim(ADataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString);
    cod_controle_cx         := ADataSet.FieldByName('COD_CONTROLE_CX').AsInteger;
    remessa_enviada         := Trim(ADataSet.FieldByName('REMESSA_ENVIADA').AsString);
    sub_serie               := ADataSet.FieldByName('SUB_SERIE').AsInteger;
    data_remessa            := ADataSet.FieldByName('DATA_REMESSA').AsDateTime;
    cod_cobrebem            := ADataSet.FieldByName('COD_COBREBEM').AsInteger;
    cod_seq_remessa         := ADataSet.FieldByName('COD_SEQ_REMESSA').AsInteger;
    status                  := Trim(ADataSet.FieldByName('STATUS').AsString);
    tipo_emissao            := Trim(ADataSet.FieldByName('TIPO_EMISSAO').AsString);
    ocorrenciabancaria.Text := Trim(ADataSet.FieldByName('OCORRENCIABANCARIA').AsString);
    Setocorrenciabancaria(Focorrenciabancaria);
    nparcela                := ADataSet.FieldByName('NPARCELA').AsInteger;
    totalparcelas           := ADataSet.FieldByName('TOTALPARCELAS').AsInteger;
    idcarne                 := ADataSet.FieldByName('IDCARNE').AsInteger;
    tipoimpressao           := Trim(ADataSet.FieldByName('TIPOIMPRESSAO').AsString);
    bancoemiteboleto        := Trim(ADataSet.FieldByName('BANCOEMITEBOLETO').AsString);
    nf_aut                  := Trim(ADataSet.FieldByName('NF_AUT').AsString);
    mensagem_bol            := Trim(ADataSet.FieldByName('MENSAGEM_BOL').AsString);
    cod_carga               := ADataSet.FieldByName('COD_CARGA').AsInteger;
    cod_nf                  := ADataSet.FieldByName('COD_NF').AsInteger;
    vl_orig                 := ADataSet.FieldByName('VL_ORIG').AsFloat;
    mensagem_adc            := Trim(ADataSet.FieldByName('MENSAGEM_ADC').AsString);
    dias_protesto           := ADataSet.FieldByName('DIAS_PROTESTO').AsInteger;
    alterado                := Trim(ADataSet.FieldByName('ALTERADO').AsString);
    cod_gerador             := ADataSet.FieldByName('COD_GERADOR').AsInteger;
    htmlboleto.Text         := Trim(ADataSet.FieldByName('HTMLBOLETO').AsString);
    Sethtmlboleto(Fhtmlboleto);
    env_email_bol           := Trim(ADataSet.FieldByName('ENV_EMAIL_BOL').AsString);
    seqform                 := ADataSet.FieldByName('SEQFORM').AsInteger;
  end
  else
  begin
    if Assigned(ADataSet.FindField('N_SEQ_BOL'         )) then n_seq_bol               := ADataSet.FieldByName('N_SEQ_BOL').AsInteger;
    if Assigned(ADataSet.FindField('COD_EMPRESA'       )) then cod_empresa             := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    if Assigned(ADataSet.FindField('NUM_NF_VND'        )) then num_nf_vnd              := ADataSet.FieldByName('NUM_NF_VND').AsInteger;
    if Assigned(ADataSet.FindField('N_CUPOM'           )) then n_cupom                 := ADataSet.FieldByName('N_CUPOM').AsInteger;
    if Assigned(ADataSet.FindField('N_PDV'             )) then n_pdv                   := ADataSet.FieldByName('N_PDV').AsInteger;
    if Assigned(ADataSet.FindField('COD_CRED'          )) then cod_cred                := ADataSet.FieldByName('COD_CRED').AsInteger;
    if Assigned(ADataSet.FindField('DATA_EM_BOL'       )) then data_em_bol             := ADataSet.FieldByName('DATA_EM_BOL').AsDateTime;
    if Assigned(ADataSet.FindField('DATA_VEN_BOL'      )) then data_ven_bol            := ADataSet.FieldByName('DATA_VEN_BOL').AsDateTime;
    if Assigned(ADataSet.FindField('DATA_LIM_DESC'     )) then data_lim_desc           := ADataSet.FieldByName('DATA_LIM_DESC').AsDateTime;    
    if Assigned(ADataSet.FindField('N_DOC_BOL'         )) then n_doc_bol               := Trim(ADataSet.FieldByName('N_DOC_BOL').AsString);
    if Assigned(ADataSet.FindField('VL_DOC_BOL'        )) then vl_doc_bol              := ADataSet.FieldByName('VL_DOC_BOL').AsFloat;
    if Assigned(ADataSet.FindField('OBS_BOL'           )) then obs_bol                 := Trim(ADataSet.FieldByName('OBS_BOL').AsString);
    if Assigned(ADataSet.FindField('M_DIA_BOL'         )) then m_dia_bol               := ADataSet.FieldByName('M_DIA_BOL').AsFloat;
    if Assigned(ADataSet.FindField('MULT_ATR_BOL'      )) then mult_atr_bol            := ADataSet.FieldByName('MULT_ATR_BOL').AsFloat;
    if Assigned(ADataSet.FindField('COD_CLIENTE'       )) then cod_cliente             := ADataSet.FieldByName('COD_CLIENTE').AsInteger;
    if Assigned(ADataSet.FindField('LOCALPAG'          )) then localpag                := Trim(ADataSet.FieldByName('LOCALPAG').AsString);
    if Assigned(ADataSet.FindField('OBS_BOL1'          )) then obs_bol1                := Trim(ADataSet.FieldByName('OBS_BOL1').AsString);
    if Assigned(ADataSet.FindField('ATIVO'             )) then ativo                   := ADataSet.FieldByName('ATIVO').AsInteger;
    if Assigned(ADataSet.FindField('NOSSO_NUMERO_BANCO')) then nosso_numero_banco      := Trim(ADataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString);
    if Assigned(ADataSet.FindField('COD_CONTROLE_CX'   )) then cod_controle_cx         := ADataSet.FieldByName('COD_CONTROLE_CX').AsInteger;
    if Assigned(ADataSet.FindField('REMESSA_ENVIADA'   )) then remessa_enviada         := Trim(ADataSet.FieldByName('REMESSA_ENVIADA').AsString);
    if Assigned(ADataSet.FindField('SUB_SERIE'         )) then sub_serie               := ADataSet.FieldByName('SUB_SERIE').AsInteger;
    if Assigned(ADataSet.FindField('DATA_REMESSA'      )) then data_remessa            := ADataSet.FieldByName('DATA_REMESSA').AsDateTime;
    if Assigned(ADataSet.FindField('COD_COBREBEM'      )) then cod_cobrebem            := ADataSet.FieldByName('COD_COBREBEM').AsInteger;
    if Assigned(ADataSet.FindField('COD_SEQ_REMESSA'   )) then cod_seq_remessa         := ADataSet.FieldByName('COD_SEQ_REMESSA').AsInteger;
    if Assigned(ADataSet.FindField('STATUS'            )) then status                  := Trim(ADataSet.FieldByName('STATUS').AsString);
    if Assigned(ADataSet.FindField('TIPO_EMISSAO'      )) then tipo_emissao            := Trim(ADataSet.FieldByName('TIPO_EMISSAO').AsString);
    if Assigned(ADataSet.FindField('OCORRENCIABANCARIA')) then ocorrenciabancaria.Text := Trim(ADataSet.FieldByName('OCORRENCIABANCARIA').AsString);
    if Assigned(ADataSet.FindField('OCORRENCIABANCARIA')) then Setocorrenciabancaria(Focorrenciabancaria);
    if Assigned(ADataSet.FindField('NPARCELA'          )) then nparcela                := ADataSet.FieldByName('NPARCELA').AsInteger;
    if Assigned(ADataSet.FindField('TOTALPARCELAS'     )) then totalparcelas           := ADataSet.FieldByName('TOTALPARCELAS').AsInteger;
    if Assigned(ADataSet.FindField('IDCARNE'           )) then idcarne                 := ADataSet.FieldByName('IDCARNE').AsInteger;
    if Assigned(ADataSet.FindField('TIPOIMPRESSAO'     )) then tipoimpressao           := Trim(ADataSet.FieldByName('TIPOIMPRESSAO').AsString);
    if Assigned(ADataSet.FindField('BANCOEMITEBOLETO'  )) then bancoemiteboleto        := Trim(ADataSet.FieldByName('BANCOEMITEBOLETO').AsString);
    if Assigned(ADataSet.FindField('NF_AUT'            )) then nf_aut                  := Trim(ADataSet.FieldByName('NF_AUT').AsString);
    if Assigned(ADataSet.FindField('MENSAGEM_BOL'      )) then mensagem_bol            := Trim(ADataSet.FieldByName('MENSAGEM_BOL').AsString);
    if Assigned(ADataSet.FindField('COD_CARGA'         )) then cod_carga               := ADataSet.FieldByName('COD_CARGA').AsInteger;
    if Assigned(ADataSet.FindField('COD_NF'            )) then cod_nf                  := ADataSet.FieldByName('COD_NF').AsInteger;
    if Assigned(ADataSet.FindField('VL_ORIG'           )) then vl_orig                 := ADataSet.FieldByName('VL_ORIG').AsFloat;
    if Assigned(ADataSet.FindField('MENSAGEM_ADC'      )) then mensagem_adc            := Trim(ADataSet.FieldByName('MENSAGEM_ADC').AsString);
    if Assigned(ADataSet.FindField('DIAS_PROTESTO'     )) then dias_protesto           := ADataSet.FieldByName('DIAS_PROTESTO').AsInteger;
    if Assigned(ADataSet.FindField('ALTERADO'          )) then alterado                := Trim(ADataSet.FieldByName('ALTERADO').AsString);
    if Assigned(ADataSet.FindField('COD_GERADOR'       )) then cod_gerador             := ADataSet.FieldByName('COD_GERADOR').AsInteger;
    if Assigned(ADataSet.FindField('HTMLBOLETO'        )) then htmlboleto.Text         := Trim(ADataSet.FieldByName('HTMLBOLETO').AsString);
    if Assigned(ADataSet.FindField('HTMLBOLETO'        )) then Sethtmlboleto(Fhtmlboleto);
    if Assigned(ADataSet.FindField('ENV_EMAIL_BOL'     )) then env_email_bol           := Trim(ADataSet.FieldByName('ENV_EMAIL_BOL').AsString);
    if Assigned(ADataSet.FindField('SEQFORM'           )) then seqform                 := ADataSet.FieldByName('SEQFORM').AsInteger;
  end;
end;

function TBoletas_class.SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean): TIBQuery;
begin
  Result := ADataSet;

  if not AcheckParams then
  begin
    ADataSet.ParamByName('N_SEQ_BOL').AsInteger         := Fn_seq_bol;
    ADataSet.ParamByName('COD_EMPRESA').AsInteger       := Fcod_empresa;
    ADataSet.ParamByName('NUM_NF_VND').AsInteger        := Fnum_nf_vnd;
    ADataSet.ParamByName('N_CUPOM').AsInteger           := Fn_cupom;
    ADataSet.ParamByName('N_PDV').AsInteger             := Fn_pdv;
    ADataSet.ParamByName('COD_CRED').AsInteger          := Fcod_cred;
    ADataSet.ParamByName('DATA_EM_BOL').AsDateTime      := Fdata_em_bol;
    ADataSet.ParamByName('DATA_VEN_BOL').AsDateTime     := Fdata_ven_bol;
    ADataSet.ParamByName('DATA_LIM_DESC').AsDateTime    := Fdata_lim_desc;
    ADataSet.ParamByName('N_DOC_BOL').AsString          := Copy(Fn_doc_bol         , 1, 10);
    ADataSet.ParamByName('VL_DOC_BOL').AsFloat          := Fvl_doc_bol;
    ADataSet.ParamByName('OBS_BOL').AsString            := Copy(Fobs_bol           , 1, 128);
    ADataSet.ParamByName('M_DIA_BOL').AsFloat           := Fm_dia_bol;
    ADataSet.ParamByName('MULT_ATR_BOL').AsFloat        := Fmult_atr_bol;
    ADataSet.ParamByName('COD_CLIENTE').AsInteger       := Fcod_cliente;
    ADataSet.ParamByName('LOCALPAG').AsString           := Copy(Flocalpag          , 1, 128);
    ADataSet.ParamByName('OBS_BOL1').AsString           := Copy(Fobs_bol1          , 1, 45);
    ADataSet.ParamByName('ATIVO').AsInteger             := Fativo;
    ADataSet.ParamByName('NOSSO_NUMERO_BANCO').AsString := Copy(Fnosso_numero_banco, 1, 20);
    ADataSet.ParamByName('COD_CONTROLE_CX').AsInteger   := Fcod_controle_cx;
    ADataSet.ParamByName('REMESSA_ENVIADA').AsString    := Copy(Fremessa_enviada   , 1, 1);
    ADataSet.ParamByName('SUB_SERIE').AsInteger         := Fsub_serie;
    ADataSet.ParamByName('DATA_REMESSA').AsDateTime     := Fdata_remessa;
    ADataSet.ParamByName('COD_COBREBEM').AsInteger      := Fcod_cobrebem;
    ADataSet.ParamByName('COD_SEQ_REMESSA').AsInteger   := Fcod_seq_remessa;
    ADataSet.ParamByName('STATUS').AsString             := Copy(Fstatus            , 1, 20);
    ADataSet.ParamByName('TIPO_EMISSAO').AsString       := Copy(Ftipo_emissao      , 1, 20);
    ADataSet.ParamByName('OCORRENCIABANCARIA').AsString := Focorrenciabancaria.Text;
    ADataSet.ParamByName('NPARCELA').AsInteger          := Fnparcela;
    ADataSet.ParamByName('TOTALPARCELAS').AsInteger     := Ftotalparcelas;
    ADataSet.ParamByName('IDCARNE').AsInteger           := Fidcarne;
    ADataSet.ParamByName('TIPOIMPRESSAO').AsString      := Copy(Ftipoimpressao     , 1, 20);
    ADataSet.ParamByName('BANCOEMITEBOLETO').AsString   := Copy(Fbancoemiteboleto  , 1, 1);
    ADataSet.ParamByName('NF_AUT').AsString             := Copy(Fnf_aut            , 1, 1);
    ADataSet.ParamByName('MENSAGEM_BOL').AsString       := Copy(Fmensagem_bol      , 1, 128);
    ADataSet.ParamByName('COD_CARGA').AsInteger         := Fcod_carga;
    ADataSet.ParamByName('COD_NF').AsInteger            := Fcod_nf;
    ADataSet.ParamByName('VL_ORIG').AsFloat             := Fvl_orig;
    ADataSet.ParamByName('MENSAGEM_ADC').AsString       := Copy(Fmensagem_adc      , 1, 128);
    ADataSet.ParamByName('DIAS_PROTESTO').AsInteger     := Fdias_protesto;
    ADataSet.ParamByName('ALTERADO').AsString           := Copy(Falterado          , 1, 1);
    ADataSet.ParamByName('COD_GERADOR').AsInteger       := Fcod_gerador;
    ADataSet.ParamByName('HTMLBOLETO').AsString         := Fhtmlboleto.Text;
    ADataSet.ParamByName('ENV_EMAIL_BOL').AsString      := Copy(Fenv_email_bol     , 1, 1);
    ADataSet.ParamByName('SEQFORM').AsInteger           := Fseqform;
  end
  else
  begin
    if Assigned(ADataSet.Params.FindParam('N_SEQ_BOL'         )) then   ADataSet.ParamByName('N_SEQ_BOL').AsInteger         := Fn_seq_bol;
    if Assigned(ADataSet.Params.FindParam('COD_EMPRESA'       )) then   ADataSet.ParamByName('COD_EMPRESA').AsInteger       := Fcod_empresa;
    if Assigned(ADataSet.Params.FindParam('NUM_NF_VND'        )) then   ADataSet.ParamByName('NUM_NF_VND').AsInteger        := Fnum_nf_vnd;
    if Assigned(ADataSet.Params.FindParam('N_CUPOM'           )) then   ADataSet.ParamByName('N_CUPOM').AsInteger           := Fn_cupom;
    if Assigned(ADataSet.Params.FindParam('N_PDV'             )) then   ADataSet.ParamByName('N_PDV').AsInteger             := Fn_pdv;
    if Assigned(ADataSet.Params.FindParam('COD_CRED'          )) then   ADataSet.ParamByName('COD_CRED').AsInteger          := Fcod_cred;
    if Assigned(ADataSet.Params.FindParam('DATA_EM_BOL'       )) then   ADataSet.ParamByName('DATA_EM_BOL').AsDateTime      := Fdata_em_bol;
    if Assigned(ADataSet.Params.FindParam('DATA_VEN_BOL'      )) then   ADataSet.ParamByName('DATA_VEN_BOL').AsDateTime     := Fdata_ven_bol;
    if Assigned(ADataSet.Params.FindParam('DATA_LIM_DESC'     )) then   ADataSet.ParamByName('DATA_LIM_DESC').AsDateTime    := Fdata_lim_desc;
    if Assigned(ADataSet.Params.FindParam('N_DOC_BOL'         )) then   ADataSet.ParamByName('N_DOC_BOL').AsString          := Copy(Fn_doc_bol         , 1, 10);
    if Assigned(ADataSet.Params.FindParam('VL_DOC_BOL'        )) then   ADataSet.ParamByName('VL_DOC_BOL').AsFloat          := Fvl_doc_bol;
    if Assigned(ADataSet.Params.FindParam('OBS_BOL'           )) then   ADataSet.ParamByName('OBS_BOL').AsString            := Copy(Fobs_bol           , 1, 128);
    if Assigned(ADataSet.Params.FindParam('M_DIA_BOL'         )) then   ADataSet.ParamByName('M_DIA_BOL').AsFloat           := Fm_dia_bol;
    if Assigned(ADataSet.Params.FindParam('MULT_ATR_BOL'      )) then   ADataSet.ParamByName('MULT_ATR_BOL').AsFloat        := Fmult_atr_bol;
    if Assigned(ADataSet.Params.FindParam('COD_CLIENTE'       )) then   ADataSet.ParamByName('COD_CLIENTE').AsInteger       := Fcod_cliente;
    if Assigned(ADataSet.Params.FindParam('LOCALPAG'          )) then   ADataSet.ParamByName('LOCALPAG').AsString           := Copy(Flocalpag          , 1, 128);
    if Assigned(ADataSet.Params.FindParam('OBS_BOL1'          )) then   ADataSet.ParamByName('OBS_BOL1').AsString           := Copy(Fobs_bol1          , 1, 45);
    if Assigned(ADataSet.Params.FindParam('ATIVO'             )) then   ADataSet.ParamByName('ATIVO').AsInteger             := Fativo;
    if Assigned(ADataSet.Params.FindParam('NOSSO_NUMERO_BANCO')) then   ADataSet.ParamByName('NOSSO_NUMERO_BANCO').AsString := Copy(Fnosso_numero_banco, 1, 20);
    if Assigned(ADataSet.Params.FindParam('COD_CONTROLE_CX'   )) then   ADataSet.ParamByName('COD_CONTROLE_CX').AsInteger   := Fcod_controle_cx;
    if Assigned(ADataSet.Params.FindParam('REMESSA_ENVIADA'   )) then   ADataSet.ParamByName('REMESSA_ENVIADA').AsString    := Copy(Fremessa_enviada   , 1, 1);
    if Assigned(ADataSet.Params.FindParam('SUB_SERIE'         )) then   ADataSet.ParamByName('SUB_SERIE').AsInteger         := Fsub_serie;
    if Assigned(ADataSet.Params.FindParam('DATA_REMESSA'      )) then   ADataSet.ParamByName('DATA_REMESSA').AsDateTime     := Fdata_remessa;
    if Assigned(ADataSet.Params.FindParam('COD_COBREBEM'      )) then   ADataSet.ParamByName('COD_COBREBEM').AsInteger      := Fcod_cobrebem;
    if Assigned(ADataSet.Params.FindParam('COD_SEQ_REMESSA'   )) then   ADataSet.ParamByName('COD_SEQ_REMESSA').AsInteger   := Fcod_seq_remessa;
    if Assigned(ADataSet.Params.FindParam('STATUS'            )) then   ADataSet.ParamByName('STATUS').AsString             := Copy(Fstatus            , 1, 20);
    if Assigned(ADataSet.Params.FindParam('TIPO_EMISSAO'      )) then   ADataSet.ParamByName('TIPO_EMISSAO').AsString       := Copy(Ftipo_emissao      , 1, 20);
    if Assigned(ADataSet.Params.FindParam('OCORRENCIABANCARIA')) then   ADataSet.ParamByName('OCORRENCIABANCARIA').AsString := Focorrenciabancaria.Text;
    if Assigned(ADataSet.Params.FindParam('NPARCELA'          )) then   ADataSet.ParamByName('NPARCELA').AsInteger          := Fnparcela;
    if Assigned(ADataSet.Params.FindParam('TOTALPARCELAS'     )) then   ADataSet.ParamByName('TOTALPARCELAS').AsInteger     := Ftotalparcelas;
    if Assigned(ADataSet.Params.FindParam('IDCARNE'           )) then   ADataSet.ParamByName('IDCARNE').AsInteger           := Fidcarne;
    if Assigned(ADataSet.Params.FindParam('TIPOIMPRESSAO'     )) then   ADataSet.ParamByName('TIPOIMPRESSAO').AsString      := Copy(Ftipoimpressao     , 1, 20);
    if Assigned(ADataSet.Params.FindParam('BANCOEMITEBOLETO'  )) then   ADataSet.ParamByName('BANCOEMITEBOLETO').AsString   := Copy(Fbancoemiteboleto  , 1, 1);
    if Assigned(ADataSet.Params.FindParam('NF_AUT'            )) then   ADataSet.ParamByName('NF_AUT').AsString             := Copy(Fnf_aut            , 1, 1);
    if Assigned(ADataSet.Params.FindParam('MENSAGEM_BOL'      )) then   ADataSet.ParamByName('MENSAGEM_BOL').AsString       := Copy(Fmensagem_bol      , 1, 128);
    if Assigned(ADataSet.Params.FindParam('COD_CARGA'         )) then   ADataSet.ParamByName('COD_CARGA').AsInteger         := Fcod_carga;
    if Assigned(ADataSet.Params.FindParam('COD_NF'            )) then   ADataSet.ParamByName('COD_NF').AsInteger            := Fcod_nf;
    if Assigned(ADataSet.Params.FindParam('VL_ORIG'           )) then   ADataSet.ParamByName('VL_ORIG').AsFloat             := Fvl_orig;
    if Assigned(ADataSet.Params.FindParam('MENSAGEM_ADC'      )) then   ADataSet.ParamByName('MENSAGEM_ADC').AsString       := Copy(Fmensagem_adc      , 1, 128);
    if Assigned(ADataSet.Params.FindParam('DIAS_PROTESTO'     )) then   ADataSet.ParamByName('DIAS_PROTESTO').AsInteger     := Fdias_protesto;
    if Assigned(ADataSet.Params.FindParam('ALTERADO'          )) then   ADataSet.ParamByName('ALTERADO').AsString           := Copy(Falterado          , 1, 1);
    if Assigned(ADataSet.Params.FindParam('COD_GERADOR'       )) then   ADataSet.ParamByName('COD_GERADOR').AsInteger       := Fcod_gerador;
    if Assigned(ADataSet.Params.FindParam('HTMLBOLETO'        )) then   ADataSet.ParamByName('HTMLBOLETO').AsString         := Fhtmlboleto.Text;
    if Assigned(ADataSet.Params.FindParam('ENV_EMAIL_BOL'     )) then   ADataSet.ParamByName('ENV_EMAIL_BOL').AsString      := Copy(Fenv_email_bol     , 1, 1);
    if Assigned(ADataSet.Params.FindParam('SEQFORM'           )) then   ADataSet.ParamByName('SEQFORM').AsInteger           := Fseqform;
  end;
end;

function TBoletas_class.SQLMotor(AautoIncField, AignoreFields: string): TSQLBase_fb;
begin
  Setocorrenciabancaria(Focorrenciabancaria);
  Sethtmlboleto(Fhtmlboleto                );
  Result := inherited SQLMotor(AautoIncField, AignoreFields);
end;

procedure TBoletas_class.Setn_seq_bol(const Value: Integer);
begin
  Fn_seq_bol := Value;
  ChangeField('N_SEQ_BOL', Fn_seq_bol);
end;

procedure TBoletas_class.Setcod_empresa(const Value: Integer);
begin
  Fcod_empresa := Value;
  ChangeField('COD_EMPRESA', Fcod_empresa);
end;

procedure TBoletas_class.Setnum_nf_vnd(const Value: Integer);
begin
  Fnum_nf_vnd := Value;
  ChangeField('NUM_NF_VND', Fnum_nf_vnd);
end;

procedure TBoletas_class.Setn_cupom(const Value: Integer);
begin
  Fn_cupom := Value;
  ChangeField('N_CUPOM', Fn_cupom);
end;

procedure TBoletas_class.Setn_pdv(const Value: Integer);
begin
  Fn_pdv := Value;
  ChangeField('N_PDV', Fn_pdv);
end;

procedure TBoletas_class.Setcod_cred(const Value: Integer);
begin
  Fcod_cred := Value;
  ChangeField('COD_CRED', Fcod_cred);
end;

procedure TBoletas_class.Setdata_em_bol(const Value: TDateTime);
begin
  Fdata_em_bol := Value;
  ChangeField_dt('DATA_EM_BOL', Fdata_em_bol);
end;

procedure TBoletas_class.Setdata_lim_desc(const Value: TDateTime);
begin
	Fdata_lim_desc := Value;
  ChangeField_dt('DATA_LIM_DESC', Fdata_lim_desc);
end;

procedure TBoletas_class.Setdata_ven_bol(const Value: TDateTime);
begin
  Fdata_ven_bol := Value;
  ChangeField_dt('DATA_VEN_BOL', Fdata_ven_bol);
end;

procedure TBoletas_class.Setn_doc_bol(const Value: string);
begin
  Fn_doc_bol := Value;
  ChangeField('N_DOC_BOL', strq(Fn_doc_bol, 10));
end;

procedure TBoletas_class.Setvl_doc_bol(const Value: Double);
begin
  Fvl_doc_bol := Value;
  ChangeField_f('VL_DOC_BOL', Fvl_doc_bol);
end;

procedure TBoletas_class.Setobs_bol(const Value: string);
begin
  Fobs_bol := Value;
  ChangeField('OBS_BOL', strq(Fobs_bol, 128));
end;

procedure TBoletas_class.Setm_dia_bol(const Value: Double);
begin
  Fm_dia_bol := Value;
  ChangeField_f('M_DIA_BOL', Fm_dia_bol);
end;

procedure TBoletas_class.Setmult_atr_bol(const Value: Double);
begin
  Fmult_atr_bol := Value;
  ChangeField_f('MULT_ATR_BOL', Fmult_atr_bol);
end;

procedure TBoletas_class.Setcod_cliente(const Value: Integer);
begin
  Fcod_cliente := Value;
  ChangeField('COD_CLIENTE', Fcod_cliente);
end;

procedure TBoletas_class.Setlocalpag(const Value: string);
begin
  Flocalpag := Value;
  ChangeField('LOCALPAG', strq(Flocalpag, 128));
end;

procedure TBoletas_class.Setobs_bol1(const Value: string);
begin
  Fobs_bol1 := Value;
  ChangeField('OBS_BOL1', strq(Fobs_bol1, 45));
end;

procedure TBoletas_class.Setativo(const Value: Integer);
begin
  Fativo := Value;
  ChangeField('ATIVO', Fativo);
end;

procedure TBoletas_class.Setnosso_numero_banco(const Value: string);
begin
  Fnosso_numero_banco := Value;
  ChangeField('NOSSO_NUMERO_BANCO', strq(Fnosso_numero_banco, 20));
end;

procedure TBoletas_class.Setcod_controle_cx(const Value: Integer);
begin
  Fcod_controle_cx := Value;
  ChangeField('COD_CONTROLE_CX', Fcod_controle_cx);
end;

procedure TBoletas_class.Setremessa_enviada(const Value: string);
begin
  Fremessa_enviada := Value;
  ChangeField('REMESSA_ENVIADA', strq(Fremessa_enviada, 1));
end;

procedure TBoletas_class.Setsub_serie(const Value: Integer);
begin
  Fsub_serie := Value;
  ChangeField('SUB_SERIE', Fsub_serie);
end;

procedure TBoletas_class.Setdata_remessa(const Value: TDateTime);
begin
  Fdata_remessa := Value;
  ChangeField_dt('DATA_REMESSA', Fdata_remessa);
end;

procedure TBoletas_class.Setcod_cobrebem(const Value: Integer);
begin
  Fcod_cobrebem := Value;
  ChangeField('COD_COBREBEM', Fcod_cobrebem);
end;

procedure TBoletas_class.Setcod_seq_remessa(const Value: Integer);
begin
  Fcod_seq_remessa := Value;
  ChangeField('COD_SEQ_REMESSA', Fcod_seq_remessa);
end;

procedure TBoletas_class.Setstatus(const Value: string);
begin
  Fstatus := Value;
  ChangeField('STATUS', strq(Fstatus, 20));
end;

procedure TBoletas_class.Settipo_emissao(const Value: string);
begin
  Ftipo_emissao := Value;
  ChangeField('TIPO_EMISSAO', strq(Ftipo_emissao, 20));
end;

procedure TBoletas_class.Setocorrenciabancaria(const Value: TStrings);
begin
  Focorrenciabancaria := Value;
  ChangeField('OCORRENCIABANCARIA', Focorrenciabancaria);
end;

procedure TBoletas_class.Setpermite_desconto(const Value: string);
begin
	Fpermite_desconto := Value;
  ChangeField('PERMITE_DESCONTO', Fpermite_desconto);
end;

procedure TBoletas_class.Setpermite_protesto(const Value: string);
begin
	Fpermite_protesto := Value;
  ChangeField('PERMITE_PROTESTO', Fpermite_protesto);
end;

procedure TBoletas_class.Setqtd_dias_lim_desc(const Value: Integer);
begin
	Fqtd_dias_lim_desc := Value;
  ChangeField('QTD_DIAS_LIM_DESC', Fqtd_dias_lim_desc);
end;

procedure TBoletas_class.Setnparcela(const Value: Integer);
begin
  Fnparcela := Value;
  ChangeField('NPARCELA', Fnparcela);
end;

procedure TBoletas_class.Settotalparcelas(const Value: Integer);
begin
  Ftotalparcelas := Value;
  ChangeField('TOTALPARCELAS', Ftotalparcelas);
end;

procedure TBoletas_class.Setidcarne(const Value: Integer);
begin
  Fidcarne := Value;
  ChangeField('IDCARNE', Fidcarne);
end;

procedure TBoletas_class.Settipoimpressao(const Value: string);
begin
  Ftipoimpressao := Value;
  ChangeField('TIPOIMPRESSAO', strq(Ftipoimpressao, 20));
end;

procedure TBoletas_class.Setbancoemiteboleto(const Value: string);
begin
  Fbancoemiteboleto := Value;
  ChangeField('BANCOEMITEBOLETO', strq(Fbancoemiteboleto, 1));
end;

procedure TBoletas_class.Setnf_aut(const Value: string);
begin
  Fnf_aut := Value;
  ChangeField('NF_AUT', strq(Fnf_aut, 1));
end;

procedure TBoletas_class.Setmensagem_bol(const Value: string);
begin
  Fmensagem_bol := Value;
  ChangeField('MENSAGEM_BOL', strq(Fmensagem_bol, 128));
end;

procedure TBoletas_class.Setmensagem_desc(const Value: string);
begin
	Fmensagem_desc := Value;
  ChangeField('MENSAGEM_DESC', strq(Fmensagem_desc, 128));
end;

procedure TBoletas_class.Setcod_carga(const Value: Integer);
begin
  Fcod_carga := Value;
  ChangeField('COD_CARGA', Fcod_carga);
end;

procedure TBoletas_class.Setcod_nf(const Value: Integer);
begin
  Fcod_nf := Value;
  ChangeField('COD_NF', Fcod_nf);
end;

procedure TBoletas_class.Setvl_orig(const Value: Double);
begin
  Fvl_orig := Value;
  ChangeField_f('VL_ORIG', Fvl_orig);
end;

procedure TBoletas_class.Setmensagem_adc(const Value: string);
begin
  Fmensagem_adc := Value;
  ChangeField('MENSAGEM_ADC', strq(Fmensagem_adc, 128));
end;

procedure TBoletas_class.Setdias_protesto(const Value: Integer);
begin
  Fdias_protesto := Value;
  ChangeField('DIAS_PROTESTO', Fdias_protesto);
end;

procedure TBoletas_class.Setalterado(const Value: string);
begin
  Falterado := Value;
  ChangeField('ALTERADO', strq(Falterado, 1));
end;

procedure TBoletas_class.Setcod_gerador(const Value: Integer);
begin
  Fcod_gerador := Value;
  ChangeField('COD_GERADOR', Fcod_gerador);
end;

procedure TBoletas_class.Sethtmlboleto(const Value: TStrings);
begin
  Fhtmlboleto := Value;
  ChangeField('HTMLBOLETO', Fhtmlboleto);
end;

procedure TBoletas_class.Setenv_email_bol(const Value: string);
begin
  Fenv_email_bol := Value;
  ChangeField('ENV_EMAIL_BOL', strq(Fenv_email_bol, 1));
end;

procedure TBoletas_class.Setseqform(const Value: Integer);
begin
  Fseqform := Value;
  ChangeField('SEQFORM', Fseqform);
end;

{ TBoletas_classList }

function TBoletas_classList.GetItem(Index: Integer): TBoletas_class;
begin
  Result := TBoletas_class(inherited Items[Index]);
end;

function TBoletas_classList.New: TBoletas_class;
begin
  Result := TBoletas_class.Create;
  Add(Result);
end;

procedure TBoletas_classList.SetItem(Index: Integer; const Value: TBoletas_class);
begin
  Put(Index, Value);
end;

procedure TBoletas_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
