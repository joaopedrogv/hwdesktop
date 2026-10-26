unit uClassesOperacaoFiscal;

interface    

uses
  Contnrs,
  Classes,
  DB,
  IBDatabase,
  IBQuery,
  DBClient,
  uDataSet_OOP,
  opfiscal_model,
  opf_class,
  opf_icms_class,
  opf_icms_dest_class,
  opf_icms_dest_params_class,
  opf_pc_class,
  opf_rettrib_class
  ;

type
//  TFinalidade = class;
  TipoCondicao = (tcEstados, tcConsumoFinal, tcContribuite, tcPessoa, tcTipoItem, tcTipoNf, tcFinalidade, tcCidade, tcCstIcms, tcCstPisSai);

  TOpFiscal_ICMS_Dest_Params  = class(TOpf_icms_dest_params_class)
  private
    Fativado: Boolean;
  public    
    property ativado: Boolean read Fativado write Fativado;
  end;

  TOpFiscal_ICMS_Dest = class(TOpf_icms_dest_class)
  private
    Fparams: TObjectList;
  public
    constructor Create();
    destructor Destroy; override;

    procedure HandleUpdateOrInsert(parentId: Integer; destId: string; Owner: TDataSet_OOP);

    property params: TObjectList read Fparams write Fparams;
  end;

  TOpFiscal_ICMS = class(TOpf_icms_class)
  private    
    Finterno: TOpFiscal_ICMS_Dest;
    Finterestadual: TOpFiscal_ICMS_Dest;
    Fexterior: TOpFiscal_ICMS_Dest;
    Fconf_trib: TConfTributo;
  public
    constructor Create();
    destructor Destroy; override;

    property interno: TOpFiscal_ICMS_Dest read Finterno write Finterno;
    property interestadual: TOpFiscal_ICMS_Dest read Finterestadual write Finterestadual;
    property exterior: TOpFiscal_ICMS_Dest read Fexterior write Fexterior;
    property conf_trib: TConfTributo read Fconf_trib write Fconf_trib;
  end;

  TOpFiscal_PC = class(TOpf_pc_class)
  private
    Fconf_trib: TConfTributo;
  public
    constructor Create();
    destructor Destroy; override;

    property conf_trib: TConfTributo read Fconf_trib write Fconf_trib;
  end;

  TOpFiscal_Ret = class(TOpf_rettrib_class);

  TOpFiscal = class(TOpf_class)
  private
    Ficms: TOpFiscal_ICMS;
    Fpiscofins: TOpFiscal_PC;
    FretTrib: TOpFiscal_Ret;
  public
    constructor Create();
    destructor Destroy; override;

    class function buildOpFiscal(id: Integer; con: TDataSet_OOP): TOpFiscal;

    property icms     : TOpFiscal_ICMS read Ficms      write Ficms;
    property piscofins: TOpFiscal_PC   read Fpiscofins write Fpiscofins;
    property retTrib  : TOpFiscal_Ret  read FretTrib   write FretTrib;
  end;

  TOperacaoFiscalCondicoes = class
  strict private
    Fid: Integer;
    incremento: Integer;
    function TipoCondicaoToStr(tipo: TipoCondicao): string;
    procedure opcionalDataSetGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  private
    Fncms: TDataSet_OOP;
    Fopcionais: TDataSet_OOP;
  public
    constructor Create(Owner: TDataSet_OOP);
    destructor Destroy; override;

    procedure AbrirCondicoes(id: integer);
    procedure AddOpcional(tipo: TipoCondicao; valor, display: string);
    function AddNCM(inicio, fim: string): Boolean;
    procedure RemoveOpcional();
    procedure RemoveNCM();
    function 	HandleCondicoes(id: integer): Boolean;

    property ncms: TDataSet_OOP read Fncms write Fncms;
    property opcionais: TDataSet_OOP read Fopcionais write Fopcionais;
  end;

  TOperacaoFiscal = class(TDataSet_OOP)
  private
    Fobjeto: TOpFiscal;
    Fcondicoes: TOperacaoFiscalCondicoes;
    Fprodutos: TDataSet_OOP;
  public
    constructor Create();
    destructor Destroy; override;

    function Edit: Boolean; override;
    function Insert: Boolean;
    function Post: Boolean;
    function Delete: Boolean;
    function Restaurar: Boolean;

    procedure HandleProdutos; 

    property objeto: TOpFiscal read Fobjeto write Fobjeto;
    property condicoes: TOperacaoFiscalCondicoes read Fcondicoes write Fcondicoes;
    property produtos: TDataSet_OOP read Fprodutos write Fprodutos;
  end;

var
  opFiscal: TOperacaoFiscal;

implementation

uses
  SysUtils,
  StrUtils,
  uDtmAtivo,
  FieldsConfigUnit,
  hw_utils,
  hw_win_utils, uDadosIni, hw_strings;

{ TOpFiscal_ICMS_Dest }

constructor TOpFiscal_ICMS_Dest.Create();
begin
  inherited Create();
  Fparams := TObjectList.Create;
end;

destructor TOpFiscal_ICMS_Dest.Destroy;
begin
  Fparams.Free;
  inherited;
end;

procedure TOpFiscal_ICMS_Dest.HandleUpdateOrInsert(parentId: Integer; 
  destId: string; Owner: TDataSet_OOP);
var
  I: Integer;
  param, datadb: TOpFiscal_ICMS_Dest_Params;
begin
  if (Self.id > 0) or (Self.ativo = 1) then
  begin
    if Self.id = 0 then
    begin
      Self.opf_icms_id := parentId;
      Self.iddest      := destId;
      Self.cod_empresa := vDadosIni.cod_empresa;
      Self.id          := Owner.SqlInsertID(Self.SQLMotor('id').SQLUpdateOrInsertAutoInc, 'id')
    end
    else if Self.FoundChanges then
      Owner.SqlExec(Self.SQLMotor().SQLUpdate);

    for I := 0 to Self.params.Count - 1 do
    begin
      param := (Self.params.Items[I] as  TOpFiscal_ICMS_Dest_Params);
      if destId = '1' then
        param.ufs := vDadosIni.vEmp.vSiglaUF
      else if destId = '3' then
        param.ufs := 'EX'
      else if EndsStr(',', param.ufs) then
        param.ufs := Copy(param.ufs, 1, Length(param.ufs) - 1);

      if param.id > 0 then
      begin
        datadb := TOpFiscal_ICMS_Dest_Params.Create();
        datadb.CopyFrom(Owner.SqlOpen('select * from opf_icms_dest_params where id = %d and cod_empresa = %d', [param.id, vDadosIni.cod_empresa]));
        datadb.aliq_icms := param.aliq_icms;
        datadb.aliq_fcp := param.aliq_fcp;
        datadb.aliq_red_bc := param.aliq_red_bc;
        datadb.aliq_icms_dif := param.aliq_icms_dif;
        datadb.aliq_fcp_dif := param.aliq_fcp_dif;
        datadb.ufs := param.ufs;
        datadb.ativado := param.ativado;
      end
      else
      begin
        datadb := (param.Clone as TOpFiscal_ICMS_Dest_Params);
        datadb.ativado := param.ativado;
      end;

      if (datadb.id = 0) and (datadb.ativado) then
      begin
        datadb.opf_icms_dest_id := Self.id;
        datadb.cod_empresa      := vDadosIni.cod_empresa;
        Owner.SqlExec(datadb.SQLMotor('id').SQLInsertAutoInc);
      end
      else if (datadb.id > 0) and (not datadb.ativado) then
        Owner.SqlExec(datadb.SQLMotor().SQLDelete)
      else if (datadb.id > 0) and (datadb.ativado) and (datadb.FoundChanges) then
        Owner.SqlExec(datadb.SQLMotor().SQLUpdate);
    end;
  end;
end;

{ TOpFiscal_ICMS }

constructor TOpFiscal_ICMS.Create();
begin
  inherited Create();
  Finterno := TOpFiscal_ICMS_Dest.Create();
  Finterestadual := TOpFiscal_ICMS_Dest.Create;
  Fexterior := TOpFiscal_ICMS_Dest.Create();
  Fconf_trib := TConfTributo.Create;
end;

destructor TOpFiscal_ICMS.Destroy;
begin
  Finterno.Free;
  Finterestadual.Free;
  Fexterior.Free;
  Fconf_trib.Free;

  inherited;
end;

{ TOpFiscal }

class function TOpFiscal.buildOpFiscal(id: Integer; con: TDataSet_OOP): TOpFiscal;
var
  item: TOpFiscal_ICMS_Dest_Params;
begin
  Result := TOpFiscal.Create();
  Result.CopyFrom(con.SqlOpen('select * from opf where id = %d and cod_empresa = %d', [id, vDadosIni.cod_empresa]));
  Result.icms.CopyFrom(con.SqlOpen('select * from opf_icms where opf_id = %d and cod_empresa = %d', [id, vDadosIni.cod_empresa]));
  Result.piscofins.CopyFrom(con.SqlOpen('select * from opf_pc where opf_id = %d and cod_empresa = %d', [id, vDadosIni.cod_empresa]));
  Result.retTrib.CopyFrom(con.SqlOpen('select * from opf_rettrib where opf_id = %d and cod_empresa = %d', [id, vDadosIni.cod_empresa]));

  Result.icms.conf_trib.Text := Result.icms.conf_calc.Text;
  Result.piscofins.conf_trib.Text := Result.piscofins.conf_calc.Text;

  if Result.icms.id > 0 then
  begin
    Result.icms.interno.CopyFrom(
      con.SqlOpen('select * from opf_icms_dest where opf_icms_id = %d and cod_empresa = %d and iddest = ''1''', [Result.icms.id, vDadosIni.cod_empresa]));
    Result.icms.interestadual.CopyFrom(
      con.SqlOpen('select * from opf_icms_dest where opf_icms_id = %d and cod_empresa = %d and iddest = ''2''', [Result.icms.id, vDadosIni.cod_empresa]));
    Result.icms.exterior.CopyFrom(
      con.SqlOpen('select * from opf_icms_dest where opf_icms_id = %d and cod_empresa = %d and iddest = ''3''', [Result.icms.id, vDadosIni.cod_empresa]));

    if Result.icms.interno.id > 0 then
    begin
      con.SqlOpen('select first 1 * from opf_icms_dest_params where opf_icms_dest_id = %d and cod_empresa = %d', [Result.icms.interno.id, vDadosIni.cod_empresa]);
      while not con.buscas.Eof do
      begin
        item := TOpFiscal_ICMS_Dest_Params.Create;
        item.CopyFrom(con.buscas);
        item.beginChanges;
        item.ativado := True;
        Result.icms.interno.params.Add(item);

        con.buscas.Next;
      end;
    end;

    if Result.icms.interestadual.id > 0 then
    begin
      con.SqlOpen('select * from opf_icms_dest_params where opf_icms_dest_id = %d and cod_empresa = %d', [Result.icms.interestadual.id, vDadosIni.cod_empresa]);
      while not con.buscas.Eof do
      begin
        item := TOpFiscal_ICMS_Dest_Params.Create;
        item.CopyFrom(con.buscas);
        item.beginChanges;
        item.ativado := True;
        Result.icms.interestadual.params.Add(item);

        con.buscas.Next;
      end;
    end;

    if Result.icms.exterior.id > 0 then
    begin
      con.SqlOpen('select * from opf_icms_dest_params where opf_icms_dest_id = %d and cod_empresa = %d', [Result.icms.exterior.id, vDadosIni.cod_empresa]);
      while not con.buscas.Eof do
      begin
        item := TOpFiscal_ICMS_Dest_Params.Create;
        item.CopyFrom(con.buscas);
        item.beginChanges;
        item.ativado := True;
        Result.icms.exterior.params.Add(item);

        con.buscas.Next;
      end;
    end;
  end;
end;

constructor TOpFiscal.Create();
begin
  inherited Create();
  Ficms := TOpFiscal_ICMS.Create;
  Fpiscofins := TOpFiscal_PC.Create;
  FretTrib := TOpFiscal_Ret.Create;
end;

destructor TOpFiscal.Destroy;
begin
  Ficms.Free;
  Fpiscofins.Free;
  FretTrib.Free;
  inherited;
end;

{ TOperacaoFiscalCondicoes }

procedure TOperacaoFiscalCondicoes.AbrirCondicoes(id: integer);
begin
  Fid := id;
  Fncms.ClientOpen('select * from (select id, opf_id, cod_empresa, ncm_ini, ncm_fim, 1 ativo, 0 changes from opf_cond_ncm' +
                    ' where opf_id = %d and cod_empresa = %d) as c' +
                    ' order by ncm_ini', [id, vDadosIni.cod_empresa]);
  Fncms.dataSet.FieldByName('id').Required := False;
  Fncms.dataSet.FieldByName('opf_id').Required := False;
  Fncms.dataSet.FieldByName('cod_empresa').Required := False;
  Fncms.dataSet.IndexFieldNames := 'NCM_INI';
  Fncms.filterStr('ativo = 1');

  Fopcionais.ClientOpen(StrReplaceA(
                        'select c.*, 1 ativo, 0 changes from (' +
                        ' select id, opf_id, cod_empresa, 0 cond, ufs valor, ufs name from opf_cond_uf' +
                        ' where opf_id = :id and cod_empresa = :cod_empresa' +
                        ' union' +
                        ' select id, opf_id, cod_empresa, 1 cond, consumidor_final valor, consumidor_final name from opf_cond_cons_final' +
                        ' where opf_id = :id and cod_empresa = :cod_empresa' +
                        ' union' +
                        ' select id, opf_id, cod_empresa, 2 cond, indiedest valor, indiedest name from opf_cond_contrib' +
                        ' where opf_id = :id and cod_empresa = :cod_empresa' +
                        ' union' +
                        ' select id, opf_id, cod_empresa, 3 cond, pessoa valor, pessoa name from opf_cond_pessoa' +
                        ' where opf_id = :id and cod_empresa = :cod_empresa' +
                        ' union' +
                        ' select id, opf_id, cod_empresa, 4 cond, tipo_item valor, tipo_item name from opf_cond_tipo_item' +
                        ' where opf_id = :id and cod_empresa = :cod_empresa' +
                        ' union ' +
                        ' select id, opf_id, cod_empresa, 5 cond, tipo valor, tipo name from opf_cond_tipo_nf' +
                        ' where opf_id = :id and cod_empresa = :cod_empresa' +
                        ' union' +
                        ' select ocf.id, ocf.opf_id, ocf.cod_empresa, 6 cond, ocf.finalidade_id valor, f.id || '' - '' || f.descricao name from opf_cond_finalidade ocf' +
                        ' left join finalidade f on f.id = ocf.finalidade_id and f.cod_empresa = ocf.cod_empresa' +
                        ' where ocf.opf_id = :id and ocf.cod_empresa = :cod_empresa' +
                        ' union' +
                        ' select occ.id, occ.opf_id, occ.cod_empresa, 7 cond, occ.cidade_id valor, (c.nome_municipio || '' - '' || c.nome_uf) name from opf_cond_cidade occ' +
                        ' left join cidades_ibge c on c.codigo_mun_ibge = occ.cidade_id' +
                        ' where occ.opf_id = :id and occ.cod_empresa = :cod_empresa' +
                        ' union' +
                        ' select id, opf_id, cod_empresa, 8 cond, cst valor, cst name from opf_cond_cst_icms' +
                        ' where opf_id = :id and cod_empresa = :cod_empresa' +
                        ' union' +
                        ' select id, opf_id, cod_empresa, 9 cond, cst valor, cst name from opf_cond_cst_pc_sai' +
                        ' where opf_id = :id and cod_empresa = :cod_empresa' +
                        ' ) c' +
                        ' order by c.cond, c.id', [':id', ':cod_empresa'], [IntToStr(id), vDadosIni.codEmpresa]));

  Fopcionais.prepare_loop();
  try
    Fopcionais.dataSet.FieldByName('cond').Alignment := taLeftJustify;
    Fopcionais.dataSet.FieldByName('cond').OnGetText := opcionalDataSetGetText;
    Fopcionais.dataSet.FieldByName('name').Alignment := taCenter;
    Fopcionais.dataSet.FieldByName('name').OnGetText := opcionalDataSetGetText;
    Fopcionais.dataSet.IndexFieldNames := 'COND;NAME';

    Fopcionais.First;
  finally
    Fopcionais.prepare_loop_done();
    Fopcionais.filterStr('ativo = 1');
  end;
end;

function  TOperacaoFiscalCondicoes.AddNCM(inicio, fim: string): Boolean;
begin
  Result := False;
  inicio := PadR(inicio, 8, '0');
  fim := PadR(fim, 8, '9');

  if inicio > fim then
  begin
    ShowAtencao('NCM Inicial maior que ao Final');
    Exit;
  end;

  if not Fncms.Auditor.Table('OPF_COND_NCM').Processo('BAS497').Inserir
    .Msg('OPF %d - Faixa NCM %s/%s', [Fid, inicio, fim])
    .Permitido then
    Exit;

  Fncms.prepare_loop(loop_options_with_filter);
  try
    while not Fncms.Eof do
    begin
      if ((inicio >= Fncms.fstr('ncm_ini')) and
          (inicio <= Fncms.fstr('ncm_fim'))) or
         ((fim >= Fncms.fstr('ncm_ini')) and
          (fim <= Fncms.fstr('ncm_fim'))) then
      begin
        if (inicio > Fncms.fstr('ncm_ini')) then
          inicio := Fncms.fstr('ncm_ini');
        if (fim < Fncms.fstr('ncm_fim')) then
          fim := Fncms.fstr('ncm_fim');
              
        ShowAtencao('Faixa de NCM sobreposta');
        Exit;
//        Break;
      end;
      
      Fncms.Next;
    end;


    if Fncms.dataSet.State <> dsEdit then
    begin
      Fncms.Insert;                                    
      Fncms.dataSet.FieldByName('id').AsInteger  := incremento;
      Fncms.dataSet.FieldByName('opf_id').AsInteger  := 0;
      Fncms.dataSet.FieldByName('cod_empresa').AsInteger  := vdadosIni.cod_empresa;
      incremento := incremento  - 1;
    end;

    Fncms.dataSet.FieldByName('ncm_ini').AsString  := inicio;
    Fncms.dataSet.FieldByName('ncm_fim').AsString  := fim;
    Fncms.dataSet.FieldByName('ativo').AsInteger   := 1;
    Fncms.dataSet.FieldByName('changes').AsInteger := 1;
    Fncms.Post;
                 
    Result := True;
  finally
    Fncms.prepare_loop_done();
  end;
end;

procedure TOperacaoFiscalCondicoes.AddOpcional(tipo: TipoCondicao; valor, display: string);
begin
  if tipo = tcEstados then
    Fopcionais.prepare_loop(Format('cond = %d', [ord(tipo)]), loop_options_with_filter)
  else
    Fopcionais.prepare_loop(Format('cond = %d and valor = %s', [ord(tipo), QuotedStr(valor)]), loop_options_with_filter);
  try
    if Fopcionais.IsEmpty then
    begin
      Fopcionais.Insert;
      Fopcionais.dataSet.FieldByName('id').AsInteger  := incremento;
      Fopcionais.dataSet.FieldByName('opf_id').AsInteger  := 0;
      Fopcionais.dataSet.FieldByName('cod_empresa').AsInteger  := vdadosIni.cod_empresa;
      incremento := incremento  - 1;
    end
    else if tipo = tcEstados then
      Fopcionais.Edit
    else
      Exit;

    if not Fopcionais.Auditor.Table('OPF').Processo('BAS499').Inserir
      .Msg('OPF %d - Condicao %s = %s', [Fid, TipoCondicaoToStr(tipo), display])
      .Permitido then
      Exit;

    Fopcionais.dataSet.FieldByName('cond').AsInteger := ord(tipo);
    Fopcionais.dataSet.FieldByName('valor').AsString := valor;
    Fopcionais.dataSet.FieldByName('name').AsString := display;
    Fopcionais.dataSet.FieldByName('ativo').AsInteger := 1;
    Fopcionais.dataSet.FieldByName('changes').AsInteger := 1;
    Fopcionais.Post;

  finally
    Fopcionais.prepare_loop_done();
    Fopcionais.filterStr('ativo = 1');
  end;
end;

constructor TOperacaoFiscalCondicoes.Create(Owner: TDataSet_OOP);
begin
  Fncms      := TDataSet_OOP.Create(dtmAtivo.bancoHw, Owner.transacao);
  Fopcionais := TDataSet_OOP.Create(dtmAtivo.bancoHw, Owner.transacao);
  incremento := 0;
end;

destructor TOperacaoFiscalCondicoes.Destroy;
begin
  Fncms.Free;
  Fopcionais.Free;
  inherited;
end;

function TOperacaoFiscalCondicoes.HandleCondicoes(id: integer): Boolean;
var
  tabela, campo, valor: string;
begin
  Result := False;

  ncms.prepare_loop('changes > 0');
  try
    while not ncms.Eof do
    begin
      if (ncms.fint('id') > 0) and (ncms.fint('ativo') = 0) then
        ncms.SqlExec('delete from opf_cond_ncm where id = %d and cod_empresa = %d', [ncms.fint('id'), vDadosIni.cod_empresa])
      else if (ncms.fint('id') <= 0) and (ncms.fint('changes') > 0) then
        ncms.SqlExec('insert into opf_cond_ncm (id, opf_id, cod_empresa, ncm_ini, ncm_fim)' +
                     ' values ((select cod from incrementa_codigo(%d, ''OPF_COND_NCM'')), %d, %d, %s, %s)',
                     [vDadosIni.cod_empresa, id, vDadosIni.cod_empresa, ncms.fstrq('ncm_ini'), ncms.fstrq('ncm_fim')]);
      ncms.Next;
    end;

  finally
    ncms.prepare_loop_done();
  end;


  Fopcionais.prepare_loop('changes > 0');
  try
    while not Fopcionais.Eof do
    begin

      case TipoCondicao(Fopcionais.fint('cond')) of
        tcEstados:
          begin
            tabela := 'uf';
            campo :=  'ufs';
            valor := Fopcionais.fstrq('valor', 1, 128);
          end;
        tcConsumoFinal:
          begin
            tabela := 'cons_final';
            campo :=  'consumidor_final';
            valor := Fopcionais.fstrq('valor', 1, 1);
          end;
        tcContribuite:
          begin
            tabela := 'contrib';
            campo :=  'indiedest';
            valor := Fopcionais.fstrq('valor', 1, 1);
          end;
        tcPessoa:
          begin
            tabela := 'pessoa';
            campo :=  'pessoa';
            valor := Fopcionais.fstrq('valor', 1, 2);
          end;
        tcTipoItem: 
          begin
            tabela := 'tipo_item';
            campo :=  'tipo_item';
            valor := Fopcionais.fstrq('valor', 1, 2);
          end;
        tcTipoNf: 
          begin
            tabela := 'tipo_nf';
            campo :=  'tipo';
            valor := Fopcionais.fstr('valor');
          end;
        tcCstIcms: 
          begin
            tabela := 'cst_icms';
            campo :=  'cst';
            valor := Fopcionais.fstrq('valor', 1, 2);
          end;
        tcCstPisSai: 
          begin
            tabela := 'cst_pc_sai';
            campo :=  'cst';
            valor := Fopcionais.fstrq('valor', 1, 2);
          end;
        tcFinalidade:
          begin
            tabela := 'finalidade';
            campo :=  'finalidade_id';
            valor := Fopcionais.fstr('valor');
          end;
        tcCidade: 
          begin
            tabela := 'cidade';
            campo :=  'cidade_id';
            valor := Fopcionais.fstr('valor');
          end;
      end;

      if (Fopcionais.fint('cond') = 0) and (Fopcionais.fint('id') > 0) and (Fopcionais.fint('changes') > 0) and (Fopcionais.fint('ativo') = 1) then
        Fopcionais.SqlExec('update opf_cond_%s set %s = %s where id = %d and cod_empresa = %d', [tabela, campo, valor, Fopcionais.fint('id'), vDadosIni.cod_empresa])
      else if (Fopcionais.fint('id') > 0) and (Fopcionais.fint('ativo') = 0) then
        Fopcionais.SqlExec('delete from opf_cond_%s where id = %d and cod_empresa = %d', [tabela, Fopcionais.fint('id'), vDadosIni.cod_empresa])
      else if (Fopcionais.fint('id') <= 0) and (Fopcionais.fint('changes') > 0) then
        Fopcionais.SqlExec('insert into opf_cond_%s (id, opf_id, cod_empresa, %s)' +
                ' values ((select cod from incrementa_codigo(%d, ''%s'')), %d, %d, %s)',
                [tabela, campo, vDadosIni.cod_empresa, UpperCase('opf_cond_' + tabela), id, vDadosIni.cod_empresa, valor]);
      Fopcionais.Next;
    end;

  finally
    Fopcionais.prepare_loop_done();
  end;

  Result := True;
end;

procedure TOperacaoFiscalCondicoes.opcionalDataSetGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
var
  tipo: TipoCondicao;
begin
  if Fopcionais.IsEmpty then
    Exit;

  if Sender.FieldName = 'COND' then
  begin
    Text := TipoCondicaoToStr(TipoCondicao(Fopcionais.fint('cond')));
//    tipo := TipoCondicao(Fopcionais.fint('cond'));
//    case tipo of
//      tcEstados: Text := 'Estados';
//      tcConsumoFinal: Text := 'Consumo Final';
//      tcContribuite: Text := 'Ind Contribuinte';
//      tcPessoa: Text := 'Tipo Pessoa';
//      tcTipoItem: Text := 'Tipo Item';
//      tcTipoNf: Text := 'Tipo NF';
//      tcCstIcms: Text := 'CST Icms Cadastro';
//      tcCstPisSai: Text := 'CST PisCofins Cadatro';
//      tcFinalidade: Text := 'Finalidade';
//      tcCidade: Text := 'Cidade';
//    end;
  end
  else if Sender.FieldName = 'NAME' then
  begin
    tipo := TipoCondicao(Fopcionais.fint('cond'));
    case tipo of
      tcConsumoFinal:
        Text := IfThen(Fopcionais.fequals('valor', 'S'), 'Sim', 'Nao');

      tcContribuite:
        Text := IfThen(Fopcionais.fequals('valor', '1'), '1 - Contribuinte') +
                IfThen(Fopcionais.fequals('valor', '2'), '2 - Isento') +
                IfThen(Fopcionais.fequals('valor', '9'), '9 - Não Contribuinte');

      tcPessoa:
        Text := IfThen(Fopcionais.fequals('valor', 'PJ'), 'PJ - Pessoa Jurídica') +
                IfThen(Fopcionais.fequals('valor', 'PF'), 'PF - Pessoa Física');

      tcTipoItem:
        Text := IfThen(Fopcionais.fequals('valor', '00'), '00 - Mercadoria para Revenda') +
                IfThen(Fopcionais.fequals('valor', '01'), '01 - Matéria-Prima') +
                IfThen(Fopcionais.fequals('valor', '02'), '02 - Embalagem') +
                IfThen(Fopcionais.fequals('valor', '03'), '03 - Produto em Processo') +
                IfThen(Fopcionais.fequals('valor', '04'), '04 - Produto Acabado') +
                IfThen(Fopcionais.fequals('valor', '05'), '05 - Subproduto') +
                IfThen(Fopcionais.fequals('valor', '06'), '06 - Produto Intermediário') +
                IfThen(Fopcionais.fequals('valor', '07'), '07 - Material de Uso e Consumo') +
                IfThen(Fopcionais.fequals('valor', '08'), '08 - Ativo Imobilizado') +
                IfThen(Fopcionais.fequals('valor', '09'), '09 - Serviços') +
                IfThen(Fopcionais.fequals('valor', '10'), '10 - Outros insumos') +
                IfThen(Fopcionais.fequals('valor', '99'), '99 - Outras');

      tcTipoNf: 
        Text := IfThen(Fopcionais.fequals('valor', '0'), '0 - Produtos') +
                IfThen(Fopcionais.fequals('valor', '1'), '1 - Serviços') +
                IfThen(Fopcionais.fequals('valor', '2'), '2 - Veículos Novos') +
                IfThen(Fopcionais.fequals('valor', '3'), '3 - Veículos Usados') +
                IfThen(Fopcionais.fequals('valor', '4'), '4 - Outras') +
                IfThen(Fopcionais.fequals('valor', '5'), '5 - Despesas');
      else
        Text := Sender.AsString;
    end;
  end
  else
    Text := Sender.AsString;
end;

procedure TOperacaoFiscalCondicoes.RemoveNCM;
begin
  if Fncms.IsEmpty then
    Exit;

  if not Fncms.Auditor.Table('OPF_COND_NCM').Processo('BAS498').Excluir
    .Msg('OPF %d - Faixa NCM %s/%s', [Fid, Fncms.fstr('ncm_ini'), Fncms.fstr('ncm_fim')])
    .Permitido then
    Exit;

  try
    Fncms.edit;
    Fncms.dataSet.FieldByName('ativo').AsInteger := 0;
    Fncms.dataSet.FieldByName('changes').AsInteger := 1;
    Fncms.Post;

  finally
//    Fncms.filterStr('ativo = 1');
  end;
end;

procedure TOperacaoFiscalCondicoes.RemoveOpcional;
begin
  if Fopcionais.IsEmpty then
    Exit;

  if not Fncms.Auditor.Table('OPF').Processo('BAS500').Excluir
    .Msg('OPF %d - Condicao %s = %s', [Fid, TipoCondicaoToStr(TipoCondicao(Fopcionais.fint('cond'))), Fopcionais.fstr('name')])
    .Permitido then
    Exit;

  try
    Fopcionais.edit;
    Fopcionais.dataSet.FieldByName('ativo').AsInteger := 0;
    Fopcionais.dataSet.FieldByName('changes').AsInteger := 1;
    Fopcionais.Post;

  finally
//    Fopcionais.filterStr('ativo = 1');
  end;
end;

function TOperacaoFiscalCondicoes.TipoCondicaoToStr(tipo: TipoCondicao): string;
begin
  case tipo of
    tcEstados: Result := 'Estados';
    tcConsumoFinal: Result := 'Consumo Final';
    tcContribuite: Result := 'Ind Contribuinte';
    tcPessoa: Result := 'Tipo Pessoa';
    tcTipoItem: Result := 'Tipo Item';
    tcTipoNf: Result := 'Tipo NF';
    tcCstIcms: Result := 'CST Icms Cadastro';
    tcCstPisSai: Result := 'CST PisCofins Cadatro';
    tcFinalidade: Result := 'Finalidade';
    tcCidade: Result := 'Cidade';
  end;
end;

{ TOperacaoFiscal }

constructor TOperacaoFiscal.Create;
begin
  inherited Create(dtmAtivo.bancoHw, nil, True, 'cds_opf');
  Fobjeto := TOpFiscal.Create;
  TableName := 'OPF';

  ConfigFields(
    FieldsConfigFactory.Create()
      .Add('cod_empresa,ativo', fvInvisivel)
      .Add('id', fvSempreVisivel)
  );

  Fcondicoes := TOperacaoFiscalCondicoes.Create(Self);
  Fprodutos := TDataSet_OOP.Create(dtmAtivo.bancoHw);
end;

function TOperacaoFiscal.Delete: Boolean;
begin
  Result := False;
  if dataSet.IsEmpty then
    Exit;

  if not Auditor.Processo('BAS490').Excluir
    .Msg('%d - %s', [fint('id'), fstr('descricao')])
    .Permitido then
    Exit;

  try
    Fobjeto.CopyFrom(dataSet);

    Fobjeto.ativo := 0;
    SqlExec(Fobjeto.SQLMotor().SQLUpdate);

    if transacao.InTransaction then
      transacao.Commit;

    Result := True;
    DataSet.Refresh;

    Auditor.Sucesso.GravarMensagem('');

  except on E: Exception do
    begin
      transacao.Rollback;
      ShowErro('Erro: %s', [e.Message]);
      registraErro('TOperacaoFiscal.Delete Erro: ' + e.Message);
    end;
  end;
end;

destructor TOperacaoFiscal.Destroy;
begin
  Fcondicoes.Free;
  Fobjeto.Free;          
  Fprodutos.Free;
  FreeDbComponents(True);
  inherited;
end;

function TOperacaoFiscal.Edit: Boolean;
begin
  Result := False;

  dataSet.RefreshRecord;

  if not Auditor.Processo('BAS488').Alterar
    .Msg('%d - %s', [fint('id'), fstr('descricao')])
    .Permitido then
    Exit;

  Result := inherited Edit;
  if Result then
  begin
    if Assigned(Fobjeto) then FreeAndNil(Fobjeto);

    Fobjeto := TOpFiscal.buildOpFiscal(fint('id'), Self);
    Fobjeto.beginChanges;

    Fcondicoes.AbrirCondicoes(fint('id'));
  end;
end;

procedure TOperacaoFiscal.HandleProdutos;
const
  SQL_DEF = 'select distinct pr.grupo_prod "Grupo Id", pr.cod_prod "Cod Id", pr.num_fab_prod "Num fab", pr.nbm "Ncm", pr.cest,' +
            ' pr.descr_prod "Produto", g.descricao "Grupo", s.descricao "Subgrupo",' +
            ' pr.unidade "Unidade", pr.codigo_nop "CFOP", pr.cst_prod "CST ICMS", pr.icm_prod "Aliq ICMS",' +
            ' pr.cst_pis "CST PIS Saida", pr.cst_pis_ent "CST PIS Entrada"' +
            ' from produtos pr' +
            ' left join grupos g on g.codigo_grup = pr.grupo_prod' +
            ' left join sub_grupo s on s.codigo_subgr = pr.sub_g_prod' +
            ' where pr.cod_empresa = %d and pr.ativo = 1 and pr.nbm >= ''%s'' and pr.nbm <= ''%s''';

var
  sql: string;
begin
  if Fprodutos.dataSet.Active then  
    Fprodutos.prepare_loop();
  Fcondicoes.ncms.prepare_loop('ativo = 1').First;
  try
    sql := '';
    while not Fcondicoes.ncms.Eof do
    begin
      sql := sql + IfThen(sql <> '', ' union ') +
             Format(SQL_DEF, [vDadosIni.cod_empresa, Fcondicoes.ncms.fstr('ncm_ini'), Fcondicoes.ncms.fstr('ncm_fim')]);

      Fcondicoes.ncms.Next;
    end;

    if sql <> '' then
      Fprodutos.ClientOpen(sql)
    else
      Fprodutos.ClientOpen(Format(SQL_DEF, [0, 'Z', 'A']));

  finally
    Fcondicoes.ncms.prepare_loop_done;
    Fprodutos.prepare_loop_done;
  end;
end;

function TOperacaoFiscal.Insert: Boolean;
begin
  Result := False;

  if not Auditor.Processo('BAS487').Inserir.Permitido then
    Exit;

  if not dataSet.Active then
    montaSelect('select * from %s where id = 0 and cod_empresa = 1', [TableName]);

  Result := inherited Insert;
  if Result then
  begin
    if Assigned(Fobjeto) then FreeAndNil(Fobjeto);

    Fobjeto := TOpFiscal.Create;
    Fcondicoes.AbrirCondicoes(0);
    vDadosIni.vDataHora := vDadosIni.getDataHoraBanco(buscas);

    dataSet.FieldByName('cod_empresa').AsInteger       := StrToInt(vDadosIni.codEmpresa);
    dataSet.FieldByName('data_cadastro').AsDateTime    := vDadosIni.vDataHora;
    dataSet.FieldByName('data_modificacao').AsDateTime := vDadosIni.vDataHora;
  end;
end;

function TOperacaoFiscal.Post: Boolean;
var
  Acao, Str: string;
  I: Integer;
begin
  Result := False;


  if not Auditor.Processo('BAS489').Salvar
    .Msg('%d - %s', [fint('id'), fstr('descricao')])
    .Permitido then
    Exit;

  try
    checkFieldEmpty('descricao', 'Descrição precisa ser preenchida', '');

    vDadosIni.vDataHora := vDadosIni.getDataHoraBanco(buscas);
    Fobjeto.CopyFrom(dataSet, False);

    if VarToInt(Fobjeto.id) = 0 then
    begin
      Fobjeto.data_cadastro    := vDadosIni.vDataHora;
      Fobjeto.data_modificacao := vDadosIni.vDataHora;
      Fobjeto.cod_empresa      := vDadosIni.cod_empresa;
      with Fobjeto.SQLMotor('ID', 'ATIVO') do
        Fobjeto.id             := SqlInsertID(SQLInsertAutoInc, 'id');
    end
    else if Fobjeto.FoundChanges then
    begin
      Fobjeto.data_modificacao := vDadosIni.vDataHora;
      SqlExec(Fobjeto.SQLMotor().SQLUpdate);
    end;

    if (Fobjeto.icms.id > 0) or (Fobjeto.icms.ativo = 1) then
    begin
      Fobjeto.icms.conf_calc.Text := Fobjeto.icms.conf_trib.Text;
      if Fobjeto.icms.id = 0 then
      begin
        Fobjeto.icms.opf_id      := Fobjeto.id;
        Fobjeto.icms.cod_empresa := vDadosIni.cod_empresa;
        Fobjeto.icms.id          := SqlInsertID(Fobjeto.icms.SQLMotor('id').SQLUpdateOrInsertAutoInc, 'id')
      end
      else if Fobjeto.icms.FoundChanges then
        SqlExec(Fobjeto.icms.SQLMotor().SQLUpdate);

      Fobjeto.icms.interno.HandleUpdateOrInsert(Fobjeto.icms.id, '1', Self);
      Fobjeto.icms.interestadual.HandleUpdateOrInsert(Fobjeto.icms.id, '2', Self);
      Fobjeto.icms.exterior.HandleUpdateOrInsert(Fobjeto.icms.id, '3', Self);
    end;

    if (Fobjeto.piscofins.id > 0) or (Fobjeto.piscofins.ativo = 1) then
    begin
      Fobjeto.piscofins.conf_calc.Text := Fobjeto.piscofins.conf_trib.Text;
      if Fobjeto.piscofins.id = 0 then
      begin
        Fobjeto.piscofins.opf_id      := Fobjeto.id;
        Fobjeto.piscofins.cod_empresa := vDadosIni.cod_empresa;
        Fobjeto.piscofins.id          := SqlInsertID(Fobjeto.piscofins.SQLMotor('id').SQLUpdateOrInsertAutoInc, 'id')
      end
      else if Fobjeto.piscofins.FoundChanges then
        SqlExec(Fobjeto.piscofins.SQLMotor().SQLUpdate);
    end;

    if (Fobjeto.retTrib.id > 0) or (Fobjeto.retTrib.ativo = 1) then
    begin
      if Fobjeto.retTrib.id = 0 then
      begin
        Fobjeto.retTrib.opf_id      := Fobjeto.id;
        Fobjeto.retTrib.cod_empresa := vDadosIni.cod_empresa;
        Fobjeto.retTrib.id          := SqlInsertID(Fobjeto.retTrib.SQLMotor('id').SQLUpdateOrInsertAutoInc, 'id')
      end
      else if Fobjeto.retTrib.FoundChanges then
        SqlExec(Fobjeto.retTrib.SQLMotor().SQLUpdate);
    end;

    Fcondicoes.HandleCondicoes(Fobjeto.id);

    if transacao.InTransaction then
      transacao.Commit;
    Result := True;

    Auditor.Sucesso.GravarMensagem('');

    DataSet.Cancel;
    if EndsText('where id = 0 and cod_empresa = 1', dataSet.CommandText) then
      montaSelect('select * from %s where id = %d and cod_empresa = %s', [TableName, VarToInt(Fobjeto.id), vDadosIni.codEmpresa])
    else
      DataSet.Refresh;

  except on E: Exception do
    begin
      transacao.Rollback;
      ShowErro('Erro: %s', [e.Message]);
      registraErro('TCEST_.Post Erro: ' + e.Message);
    end;
  end;
end;

function TOperacaoFiscal.Restaurar: Boolean;
begin
  Result := False;
  if dataSet.IsEmpty then
    Exit;

  if not Auditor.Processo('BAS491')
    .Msg('%d - %s', [fint('id'), fstr('descricao')])
    .AcaoPermitida('RESTAURAR') then
    Exit;

  try
    Fobjeto.CopyFrom(dataSet);

    Fobjeto.ativo := 1;
    if Fobjeto.FoundChanges then
      SqlExec(Fobjeto.SQLMotor().SQLUpdate);

    if transacao.InTransaction then
      transacao.Commit;

    Result := True;
    DataSet.Refresh;

    Auditor.Sucesso.GravarMensagem('');

  except on E: Exception do
    begin
      transacao.Rollback;
      ShowErro('Erro: %s', [e.Message]);
      registraErro('TOperacaoFiscal.Restaurar Erro: ' + e.Message);
    end;
  end;
end;

{ TOpFiscal_PC }

constructor TOpFiscal_PC.Create;
begin
  inherited Create();
  Fconf_trib := TConfTributo.Create;
end;

destructor TOpFiscal_PC.Destroy;
begin
  Fconf_trib.Free;
  inherited;
end;

initialization
  RegisterClass(TOpFiscal_ICMS_Dest_Params);
finalization
  UnRegisterClass(TOpFiscal_ICMS_Dest_Params);

end.
