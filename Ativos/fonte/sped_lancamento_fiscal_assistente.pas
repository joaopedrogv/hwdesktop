unit sped_lancamento_fiscal_assistente;

interface

uses
  Classes,
  basefb_class,
  config_sistema_class,
  Contnrs,
  DB,
  IBDatabase,
  notafiscal_sped_c195_c197_class,
  sped_lancamento_fiscal_class,
  uClasseConexao;

const
  field_vazio        = 1;
  field_calculado    = 2;
  field_base_icm     = 4;
  field_base_st      = 8;
  field_base_fcp     = 16;
  field_base_fcp_st  = 32;
  field_valor_icm    = 64;
  field_valor_icm_st = 128;
  field_valor_fcp    = 256;
  field_valor_fcp_st = 512;
  field_aliq_icm     = 1024;
  field_aliq_st      = 2048;
  field_aliq_fcp     = 4096;
  field_aliq_fcp_st  = 8192;

  txt_mmaaaa         = 'mmaaaa';
  txt_vazio          = '';
  txt_digitado       = 'digitado';

type
  Tipo_Ajuste_NF_Rest_Compl = (ta_rest_st, ta_rest_fcpst, ta_compl_st, {ta_compl_fcpst, }ta_compl_st_ext, ta_compl_fcpst_ext);
  Tipo_Ajuste_NF_Rest_Compls = set of Tipo_Ajuste_NF_Rest_Compl;

  // configuracoes de cada registro ou codigo de ajuste
  TLF_Prod = class
  private
    Fbase_fcp_st : Double;
    Fbase_st     : Double;
    Fvalor_fcp   : Double;
    Fvalor_icm   : Double;
    Faliq_fcp    : Double;
    Fvalor_fcp_st: Double;
    Fvalor_st    : Double;
    Faliq_icm    : Double;
    Faliq_fcp_st : Double;
    Faliq_st     : Double;
    Fbase_fcp    : Double;
    Fbase_icm    : Double;
    Fcod_empresa : Integer;
  public
    property base_icm    : Double  read Fbase_icm     write Fbase_icm;
    property base_st     : Double  read Fbase_st      write Fbase_st;
    property base_fcp    : Double  read Fbase_fcp     write Fbase_fcp;
    property base_fcp_st : Double  read Fbase_fcp_st  write Fbase_fcp_st;
    property aliq_icm    : Double  read Faliq_icm     write Faliq_icm;
    property aliq_st     : Double  read Faliq_st      write Faliq_st;
    property aliq_fcp    : Double  read Faliq_fcp     write Faliq_fcp;
    property aliq_fcp_st : Double  read Faliq_fcp_st  write Faliq_fcp_st;
    property valor_icm   : Double  read Fvalor_icm    write Fvalor_icm;
    property valor_st    : Double  read Fvalor_st     write Fvalor_st;
    property valor_fcp   : Double  read Fvalor_fcp    write Fvalor_fcp;
    property valor_fcp_st: Double  read Fvalor_fcp_st write Fvalor_fcp_st;
    property cod_empresa : Integer read Fcod_empresa  write Fcod_empresa;
  end;

  TLF_Conf = class
  private
    Ftp_aj_doc_ou_It: string;
    Fdescr_compl_aj : string;
    Fcod_aj         : string;
    Ffields_aliq    : Smallint;
    Ffields_base    : Smallint;
    Ffields_valor   : Smallint;
  public
    property cod_aj         : string   read Fcod_aj          write Fcod_aj;
    property descr_compl_aj : string   read Fdescr_compl_aj  write Fdescr_compl_aj;
    property tp_aj_doc_ou_It: string   read Ftp_aj_doc_ou_It write Ftp_aj_doc_ou_It;
    property fields_base    : Smallint read Ffields_base     write Ffields_base;//inteiro que armazena todas as configuracoes em binario
    property fields_aliq    : Smallint read Ffields_aliq     write Ffields_aliq;//inteiro que armazena todas as configuracoes em binario
    property fields_valor   : Smallint read Ffields_valor    write Ffields_valor;//inteiro que armazena todas as configuracoes em binario
//    property tp_base: string read Ftp_base write Ftp_base;//nome dos campos que vai compor a base, [base_icm, base_st, base_fcp, base_fcp_st] ou usuario digita [digitado] OU vazio [vazio]
//    property tp_aliq: string read Ftp_aliq write Ftp_aliq;//nome dos campos da aliquota, [aliq_icm, aliq_st, aliq_fcp, aliq_fcp_st] ou usuario digita [digitado] ou vazio [vazio]
//    property tp_val : string read Ftp_val  write Ftp_val; //nome dos campo do valor, [valor_icm, valor_icm_st, valor_fcp, valor_fcp_st] ou usuario digita [digitado] ou calculado [calculado] ou vazio [vazio]
//    property fieldsc: Smallint read Ffieldsc write Ffieldsc;//inteiro que armazena todas as configuracoes em binario
  end;

  TLF_Item = class
  private
    Fconf: TLF_Conf;
  public
    destructor Destroy; override;
    constructor Create();

    property conf: TLF_Conf read Fconf write Fconf;
  end;

  //lista da configuração acima, pois 1 observacao no efd pode mais de 1 codigo de ajuste
  TLF_Item_List = class(TObjectList)
  private
    function GetItem(Index: Integer): TLF_Conf;
    procedure SetItem(Index: Integer; const Value: TLF_Conf);
  public
    function New: TLF_Conf;

    property Items[Index: Integer]: TLF_Conf read GetItem write SetItem;
  end;

  //configuracao do regisotr c195 que tamnem contem a lista dos ajustes
  TLF_Lanc = class
  private
    Ftp_txt_compl: string;
    Fconfs       : TLF_Item_List;
  public
    destructor Destroy; override;
    constructor Create(Atxt: TStrings);

    procedure configurar(Atxt: TStrings);

    property tp_txt_compl: string        read Ftp_txt_compl write Ftp_txt_compl; //[mmaaaa] [vazio] [digitado]
    property confs       : TLF_Item_List read Fconfs        write Fconfs;
  end;

  //uniao do regisotro do banco e da sua configuração
  THW_Lanc_Fiscal = class(TSped_lancamento_fiscal_class)
  private
    Flanc: TLF_Lanc;
  public
    constructor Create;
    destructor Destroy; override;

    function CopyFrom(ADataSet: TDataSet; AStoreObValues: Boolean = True): TBaseFb_class; override;

    property lanc: TLF_Lanc read Flanc write Flanc;
  end;

  THW_Lanc_Fiscal_List = class(TObjectList)
  private
    function GetItem(Index: Integer): THW_Lanc_Fiscal;
    procedure SetItem(Index: Integer; const Value: THW_Lanc_Fiscal);
  public
    function New: THW_Lanc_Fiscal;
    function CopyFrom(ADataSet: TDataSet; AStoreObValues: Boolean = True): Integer;

    property Items[Index: Integer]: THW_Lanc_Fiscal read GetItem write SetItem;
  end;

  THW_c195 = class
  private
    Fc197        : TNotafiscal_sped_c195_c197_classList;
    Fcod_obs     : Integer;
    Ftxt         : string;
    Ftxt_compl   : string;
    Ftp_txt_compl: string;
  public       
    constructor Create;
    destructor Destroy; override;

    property cod_obs     : Integer                              read Fcod_obs      write Fcod_obs;
    property txt         : string                               read Ftxt          write Ftxt;
    property txt_compl   : string                               read Ftxt_compl    write Ftxt_compl;
    property tp_txt_compl: string                               read Ftp_txt_compl write Ftp_txt_compl; //[mmaaaa] [vazio] [digitado]
    property c197        : TNotafiscal_sped_c195_c197_classList read Fc197         write Fc197;
  end;

  THW_C195List = class(TObjectList)
  private
    function GetItem(Index: Integer): THW_c195;
    procedure SetItem(Index: Integer; const Value: THW_c195);
  public
    function New: THW_c195;

    property Items[Index: Integer]: THW_c195 read GetItem write SetItem;
  end;

  TLanc_Fiscal_Assistente = class(TConexao)
  private
    Fcurrent : THW_Lanc_Fiscal;
    FlancList: THW_Lanc_Fiscal_List;
    Fprod    : TLF_Prod;

    function construir_ajuste_padrao(Atipos: Tipo_Ajuste_NF_Rest_Compls): THW_Lanc_Fiscal_List;

  public
    constructor Create(Adatabase: TIBDatabase; Aprod: TLF_Prod);
    destructor Destroy; override;

    function Obter_LancamentosNF(Atipos: Tipo_Ajuste_NF_Rest_Compls): THW_C195List;
  end;


implementation

uses
  SysUtils, StrUtils, Math, IBQuery;

{ TLF_Item_List }

function TLF_Item_List.GetItem(
  Index: Integer): TLF_Conf;
begin
  Result := TLF_Conf(inherited Items[Index]);
end;

function TLF_Item_List.New: TLF_Conf;
begin
  Result := TLF_Conf.Create;
  Add(Result);
end;

procedure TLF_Item_List.SetItem(Index: Integer;
  const Value: TLF_Conf);
begin
  Put(Index, Value);
end;

{ THW_Lanc_Fiscal }

constructor THW_Lanc_Fiscal.Create();
begin
  inherited Create;
  Flanc := TLF_Lanc.Create(nil);
end;

destructor THW_Lanc_Fiscal.Destroy;
begin
  FreeAndNil(Flanc);
  inherited;
end;

function THW_Lanc_Fiscal.CopyFrom(ADataSet: TDataSet; AStoreObValues: Boolean = True): TBaseFb_class;
begin
  inherited CopyFrom(ADataSet, AStoreObValues);
  Flanc.configurar(conf_assistente);
end;

{ TLF_Lanc }

procedure TLF_Lanc.configurar(Atxt: TStrings);
var
  Aconf: TConfig_sistema_class;
  Akey: string;
  I: Integer;
begin
  Fconfs.Clear;
  Ftp_txt_compl := '';

  Aconf := TConfig_sistema_class.Create;
  try
    Aconf.value1_b.Text := Atxt.Text;
    Ftp_txt_compl := Aconf.ReadString('Conf', 'tp_txt_compl', '');

    for I := 0 to Pred(Atxt.Count) do
      if (Pos('[', Atxt[I]) = 1) and (Pos(']', Atxt[I]) =  Length(Atxt[I])) then
      begin
        Akey := Trim(Copy(Atxt[I], 2, Length(Atxt[I]) - 2));
        if (Akey <> '') and (UpperCase(Akey) <> 'CONF') then
        begin
          with Fconfs.New do//.conf do
          begin
            cod_aj          := Akey;
            descr_compl_aj  := Aconf.ReadString( Akey, 'descr_compl_aj', '');
            tp_aj_doc_ou_It := Aconf.ReadString( Akey, 'tp_aj_doc_ou_It', '');
            fields_base     := Aconf.ReadInteger(Akey, 'fields_base', 0);
            fields_aliq     := Aconf.ReadInteger(Akey, 'fields_aliq', 0);
            fields_valor    := Aconf.ReadInteger(Akey, 'fields_valor', 0);
//            fieldsc         := Aconf.ReadInteger(Akey, 'fields', 0);
          end;
        end;
      end;

  finally
    FreeAndNil(Aconf);
  end;
end;

constructor TLF_Lanc.Create(Atxt: TStrings);
begin
  Fconfs := TLF_Item_List.Create;
  if Assigned(Atxt) then
    configurar(Atxt);  
end;

destructor TLF_Lanc.Destroy;
begin
  Fconfs.Clear;
  FreeAndNil(Fconfs);
  inherited;
end;

{ TLanc_Fiscal_Assistente }

function TLanc_Fiscal_Assistente.Obter_LancamentosNF(
  Atipos: Tipo_Ajuste_NF_Rest_Compls): THW_C195List;
var
  I, J: Integer;
  Ac195: THW_c195;
  Ac197: TNotafiscal_sped_c195_c197_class;
  Atipo : Tipo_Ajuste_NF_Rest_Compl;
  Acf: TLF_Conf;
  Alc: THW_Lanc_Fiscal;
  Asql: string;
begin
  FlancList.Clear;
  Asql := '';
//  for Atipo := Low(Tipo_Ajuste_NF_Rest_Compl) to High(Tipo_Ajuste_NF_Rest_Compl) do
//    if Atipo in Atipos then
  for Atipo in Atipos do
      Asql := Asql + Ifthen(Asql <> '', ',') + IntToStr(Ord(Atipo));

  FlancList.CopyFrom(SqlOpen('select * from SPED_LANCAMENTO_FISCAL where cod_empresa = %d and tipo_lanc in (%s)', [Fprod.cod_empresa, Asql]));

  if FlancList.Count = 0 then
    FlancList := construir_ajuste_padrao(Atipos);

  Result := THW_C195List.Create;

  for Atipo in Atipos do
    for I := 0 to FlancList.Count - 1 do
    begin
      Alc :=             FlancList.Items[I];
      if Alc.tipo_lanc = Ord(Atipo) then
      begin
        Ac195              := Result.New;
        Ac195.cod_obs      := Alc.cod_obs;
        Ac195.txt          := Alc.txt;
        Ac195.tp_txt_compl := Alc.lanc.tp_txt_compl;
        for J := 0 to Alc.lanc.confs.Count - 1 do with Alc.lanc.confs.Items[J] do
        begin
          Acf                  := Alc.lanc.confs.Items[J];
          Ac197                := Ac195.c197.New;

          Ac197.vl_bc_icms     := IfThen(fields_base and field_base_icm      = field_base_icm    , Fprod.base_icm    ) +
                                  IfThen(fields_base and field_base_st       = field_base_st     , Fprod.base_st     ) +
                                  IfThen(fields_base and field_base_fcp      = field_base_fcp    , Fprod.base_fcp    ) +
                                  IfThen(fields_base and field_base_fcp_st   = field_base_fcp_st , Fprod.base_fcp_st );

          Ac197.aliq_icms      := IfThen(fields_aliq and field_aliq_icm      = field_aliq_icm    , Fprod.aliq_icm    ) +
                                  IfThen(fields_aliq and field_aliq_st       = field_aliq_st     , Fprod.aliq_st     ) +
                                  IfThen(fields_aliq and field_aliq_fcp      = field_aliq_fcp    , Fprod.aliq_fcp    ) +
                                  IfThen(fields_aliq and field_aliq_fcp_st   = field_aliq_fcp_st , Fprod.aliq_fcp_st );

          Ac197.vl_icms        := IfThen(fields_valor and field_valor_icm    = field_valor_icm   , Fprod.valor_icm   ) +
                                  IfThen(fields_valor and field_valor_icm_st = field_valor_icm_st, Fprod.valor_st    ) +
                                  IfThen(fields_valor and field_valor_fcp    = field_valor_fcp   , Fprod.valor_fcp   ) +
                                  IfThen(fields_valor and field_valor_fcp_st = field_valor_fcp_st, Fprod.valor_fcp_st);

          Ac197.cod_obs        := Alc.cod_obs;
          Ac197.cod_empresa    := Alc.cod_empresa;
          Ac197.cod_aj         := cod_aj;
          Ac197.descr_compl_aj := descr_compl_aj;
          Ac197.nitem          := 0;
          Ac195.txt_compl      := '';

          Acf.cod_aj := Acf.cod_aj;
          Alc.txt := Alc.txt;
        end;
      end;
    end;
  for I := Result.Count - 1 downto 0 do
  begin
    for J := Result.Items[I].c197.Count -1 downto 0 do
    begin
      if (Result.Items[I].c197.Items[J].vl_bc_icms = 0) and
         (Result.Items[I].c197.Items[J].vl_icms    = 0) and
         (Result.Items[I].c197.Items[J].vl_outros  = 0) then
        Result.Items[I].c197.Delete(J);
    end;
    if Result.Items[I].c197.Count = 0 then
      Result.Delete(I);
  end;
end;

function TLanc_Fiscal_Assistente.construir_ajuste_padrao(
  Atipos: Tipo_Ajuste_NF_Rest_Compls): THW_Lanc_Fiscal_List;
var
  Aconf: TConfig_sistema_class;
  Atipo: Tipo_Ajuste_NF_Rest_Compl;
  Akey: string;
  I: Integer;
  J: Integer;
begin
  Result := THW_Lanc_Fiscal_List.Create;
  Aconf := TConfig_sistema_class.Create;
  try
    for Atipo := Low(Tipo_Ajuste_NF_Rest_Compl) to High(Tipo_Ajuste_NF_Rest_Compl) do
      if Atipo in Atipos then
        with Result.New do
        begin
          beginChanges;
          cod_obs     := 0;
          cod_empresa := Fprod.cod_empresa;
          case Atipo of
            ta_rest_st        : txt := 'Restituição de ICMS ST - Aspecto quantitativo';
            ta_rest_fcpst     : txt := 'Restituição de Fundo de Erradicação da Miséria - FEM' ;
            ta_compl_st       : txt := 'Complemento de ICMS ST + FEM - Aspecto quantitativo';
            //ta_compl_fcpst  : ;
            ta_compl_st_ext   : txt := 'Complemento de ICMS ST - Aspecto quantitativo - Lançamento Extemporâneo';
            ta_compl_fcpst_ext: txt := 'Complemento de FEM - Aspecto quantitativo - Lançamento Extemporâneo';
          end;
          tipo_lanc := Ord(Atipo);

          case Atipo of
      
            ta_rest_st:  
              begin
                lanc.tp_txt_compl := txt_mmaaaa;
                with lanc.confs.New do
                begin
                  tp_aj_doc_ou_It := 'doc';
                  cod_aj          := 'MG11000015'; //MG11000015 (Outros créditos; Op.ST; Resp.: Própria; Apur.: A apurar; Mercadoria; Rest. ICMS ST - Aspectoquantitativo )
                  fields_base     := Ord(field_vazio);
                  fields_aliq     := Ord(field_vazio);
                  fields_valor    := Ord(field_valor_icm_st);
                end;
              end;
          
            ta_rest_fcpst: 
              begin
                lanc.tp_txt_compl := txt_vazio;
                with lanc.confs.New do
                begin
                  tp_aj_doc_ou_It := 'doc';
                  cod_aj          := 'MG91000218'; //MG91000218 (Informativo; Op.ST; Resp.: Própria; Apur.: A apurar; Mercadoria; Créditos do período do Fundo de Erradicação da Miséria - FEM - adicionado ao ICMS/ST)
                  descr_compl_aj  := 'Restituição FEM - Substituição Tributária (Aspecto quantitativo)';
                  fields_base     := Ord(field_vazio);
                  fields_aliq     := Ord(field_vazio);
                  fields_valor    := Ord(field_valor_fcp_st);
                end;
              end;
          
            ta_compl_st: 
              begin
                lanc.tp_txt_compl := txt_mmaaaa;
                with lanc.confs.New do
                begin
                  tp_aj_doc_ou_It := 'doc';
                  cod_aj          := 'MG41000015'; //MG41000015 (Outros débitos; Op.ST; Resp.: Própria; Apur.: A apurar; Mercadoria; Complemento de ICMS ST + FEM – Aspecto quantitativo)
                  fields_base     := Ord(field_vazio);
                  fields_aliq     := Ord(field_vazio);
                  fields_valor    := Ord(field_valor_icm_st) +
                                     Ord(field_valor_fcp_st);
                end;
                with lanc.confs.New do
                begin                       
                  tp_aj_doc_ou_It := 'doc';
                  cod_aj          := 'MG21000018'; //MG21000018 (Estorno de débito; Op.ST; Resp.: Própria; Apur.: A apurar; Mercadoria; Fundo de Erradicação da Miséria – FEM - adicionado ao ICMS/ST)
                  descr_compl_aj  := 'Estorno do FEM - adicionado ao ICMS ST';
                  fields_base     := Ord(field_vazio);
                  fields_aliq     := Ord(field_vazio);
                  fields_valor    := Ord(field_valor_fcp_st);
                end;
              end;
        
            ta_compl_st_ext: 
              begin
                lanc.tp_txt_compl := txt_mmaaaa;
                with lanc.confs.New do
                begin
                  tp_aj_doc_ou_It := 'doc';
                  cod_aj          := 'MG71010011'; //MG71010011 (Débitos especiais; Op.ST; Resp.: Própria; Apur.: Recolhimento Espontâneo; Mercadoria;
                  descr_compl_aj  := 'Complemento do ICMS ST - Aspecto Quantitativo - Extemporâneo';
                  fields_base     := Ord(field_vazio);
                  fields_aliq     := Ord(field_vazio);
                  fields_valor    := Ord(field_valor_icm_st);
                end;
              end;
          
            ta_compl_fcpst_ext: 
              begin
                lanc.tp_txt_compl := txt_mmaaaa; 
                with lanc.confs.New do
                begin
                  tp_aj_doc_ou_It := 'doc';
                  cod_aj          := 'MG71010021'; //MG71010021 (Débitos especiais; Op.ST; Resp.: Própria; Apur.: Recolhimento Espontâneo; Mercadoria;Complemento de FEM – Aspecto quantitativo – Lançamento Extemporâneo)
                  descr_compl_aj  := 'Complemento do FEM - Aspecto Quantitativo - Extemporâneo';
                  fields_base     := Ord(field_vazio);
                  fields_aliq     := Ord(field_vazio);
                  fields_valor    := Ord(field_valor_fcp_st);          
                end;
              end;
          end;    
        end;

    Aconf.value1_b.Clear;
    for I := 0 to Result.Count - 1 do with Result.Items[I] do
    begin
      Aconf.WriteString('Conf', 'tp_txt_compl', lanc.tp_txt_compl);
      for J := 0 to Result.Items[I].lanc.confs.Count - 1 do with Result.Items[I].lanc.confs.Items[J] do
      begin                                                           
        Aconf.WriteString( cod_aj, 'tp_aj_doc_ou_It', tp_aj_doc_ou_It);
        Aconf.WriteString( cod_aj, 'descr_compl_aj' , descr_compl_aj);
        Aconf.WriteInteger(cod_aj, 'fields_base'    , fields_base);
        Aconf.WriteInteger(cod_aj, 'fields_aliq'    , fields_aliq);
        Aconf.WriteInteger(cod_aj, 'fields_valor'   , fields_valor);
      end;
      conf_assistente.Text := Aconf.value1_b.Text;
      Aconf.value1_b.Clear;
    end;

    for I := 0 to Result.Count - 1 do with Result.Items[I] do
      cod_obs := SqlInsertID(SQLMotor('COD_OBS').SQLInsertAutoInc, 'COD_OBS');

  finally
    if QrAux.Transaction.InTransaction then
      QrAux.Transaction.Commit;
    FreeAndNil(Aconf);
  end;
end;

constructor TLanc_Fiscal_Assistente.Create(Adatabase: TIBDatabase; Aprod: TLF_Prod);
begin
  
  if not Assigned(Aprod) then
    raise Exception.Create('Objeto do produto não definido');

  if Aprod.cod_empresa = 0 then
    raise Exception.Create('Objeto do produto sem codigo da empresa');
                                                                   
  inherited Create(Adatabase);
  FlancList := THW_Lanc_Fiscal_List.Create;
  
  Fprod := Aprod;
end;

destructor TLanc_Fiscal_Assistente.Destroy;
begin
  FlancList.Clear;
  FreeAndNil(FlancList);
  inherited;
end;

{ THW_Lanc_Fiscal_List }

function THW_Lanc_Fiscal_List.GetItem(
  Index: Integer): THW_Lanc_Fiscal;
begin
  Result := THW_Lanc_Fiscal(inherited Items[Index]);
end;

function THW_Lanc_Fiscal_List.New: THW_Lanc_Fiscal;
begin
  Result := THW_Lanc_Fiscal.Create;
  Add(Result);
end;

procedure THW_Lanc_Fiscal_List.SetItem(Index: Integer;
  const Value: THW_Lanc_Fiscal);
begin
  Put(Index, Value);
end;

function THW_Lanc_Fiscal_List.CopyFrom(ADataSet: TDataSet; AStoreObValues: Boolean): Integer;
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.CopyFrom(ADataSet, AStoreObValues);

    ADataSet.Next;
  end;
end;

{ TLF_Item }

constructor TLF_Item.Create;
begin
  Fconf := TLF_Conf.Create;
end;

destructor TLF_Item.Destroy;
begin
  FreeAndNil(Fconf);
  inherited;
end;

{ THW_C195List }

function THW_C195List.GetItem(Index: Integer): THW_c195;
begin
  Result := THW_c195(inherited Items[Index]);
end;

function THW_C195List.New: THW_c195;
begin
  Result := THW_c195.Create;
  Add(Result);
end;

procedure THW_C195List.SetItem(Index: Integer; const Value: THW_c195);
begin
  Put(Index, Value);
end;

{ THW_c195 }

constructor THW_c195.Create;
begin
  Fc197 := TNotafiscal_sped_c195_c197_classList.Create();
end;

destructor THW_c195.Destroy;
begin
  Fc197.Clear;
  FreeAndNil(Fc197);
  inherited;
end;

end.
