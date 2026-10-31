unit uSetConfiguracaoSistema;

interface

uses
  uDtmAtivo, IBQuery, Classes, config_sistema_class;

type
  TSetConfiguracaoSistema = class
  private            
    vVersaoConfigBanco: Double;
    AConfs: TConfig_sistema_classList;
    procedure setConfSisStr(pChave: string; pValue: string; pBuscas: TIBQuery; pDisplay: string = ''; pStrings: TStrings = nil; pTrim: Boolean = True); overload;
    procedure setConfSisStr(pChave: string; pValue: string; pBuscas: TIBQuery; pDisplay: string = ''; pStrings: string = ''; pTrim: Boolean = True); overload;
    procedure setConfSisInt(pChave: string; pValue: integer; pBuscas: TIBQuery; pDisplay: string = ''; pStrings: TStrings = nil); overload;
    procedure setConfSisInt(pChave: string; pValue: integer; pBuscas: TIBQuery; pDisplay: string = ''; pStrings: string = ''); overload;
    procedure setConfSisBool(pChave: string; pValue: Boolean; pBuscas: TIBQuery; pDisplay: string = ''; pStrings: TStrings = nil); overload;
    procedure setConfSisBool(pChave: string; pValue: Boolean; pBuscas: TIBQuery; pDisplay: string = ''; pStrings: string = ''); overload;
    procedure setConfSisFloat(pChave: string; pValue: Double; pBuscas: TIBQuery; pDisplay: string = ''; pStrings: TStrings = nil); overload;
    procedure setConfSisFloat(pChave: string; pValue: Double; pBuscas: TIBQuery; pDisplay: string = ''; pStrings: string = ''); overload;
    procedure setConfSisBlob(pChave: string; pBuscas: TIBQuery; pDisplay: string = ''; pValue: TStrings = nil); overload;
    procedure setConfSisBlob(pChave: string; pBuscas: TIBQuery; pDisplay: string = ''; pValue: string = ''); overload;
    procedure setConfSisObj(Aconf: TConfig_sistema_class; ABuscas: TIBQuery);

    function VersaoBancoMenor(NovaVersao: Double): Boolean; //Checar e star a versao nova
    procedure verificarVersaoConf2(buscas: TIBQuery);
  public
    constructor create;
    destructor Destroy; override;

    procedure verificarVersaoConf(buscas: TIBQuery);
  end;

implementation

uses Forms, SysUtils, uDadosIni, DB, Math, Contnrs, StrUtils;

{ TSetConfiguracaoSistema }

procedure TSetConfiguracaoSistema.setConfSisBlob(pChave: string; pBuscas: TIBQuery;
  pDisplay: string; pValue: TStrings);
begin
  pBuscas.Close;
  pBuscas.SQL.Text := 'select value1_b retorno from config_sistema' +
    ' where chave = ' + QuotedStr(pChave) + ' and cod_empresa = ' + vDadosIni.codEmpresa;
  pBuscas.Open;

  if (pBuscas.IsEmpty) then
  begin
    pBuscas.Close;
    pBuscas.SQL.Text := 'insert into config_sistema (chave, cod_empresa, display_, type1_, value1_b, ordem)' +
      ' values (:chave, :cod_empresa, :display_, :type1_, :value1_b, gen_id(inc_ord_config_sistema, 1))';
    pBuscas.ParamByName('chave').AsString := pChave;
    pBuscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
    pBuscas.ParamByName('display_').AsString := pDisplay;
    pBuscas.ParamByName('type1_').AsString := 'blob';
    pBuscas.ParamByName('value1_b').AsString := pValue.Text;
    pBuscas.ExecSQL;
    if pBuscas.Transaction.InTransaction  then
      pBuscas.Transaction.Commit;
  end;
end;

destructor TSetConfiguracaoSistema.Destroy;
begin
  FreeAndNil(Aconfs);
  inherited;
end;

procedure TSetConfiguracaoSistema.setConfSisBlob(pChave: string; pBuscas: TIBQuery; pDisplay, pValue: string);
var
  vStrings: TStrings;
begin
  vStrings := TStringList.Create;
  vStrings.Text := pValue;
  setConfSisBlob(pChave, pBuscas, pDisplay, vStrings);
  FreeAndNil(vStrings);
end;

procedure TSetConfiguracaoSistema.setConfSisBool(pChave: string; pValue: Boolean; pBuscas: TIBQuery; pDisplay, pStrings: string);
var
  vStrings: TStrings;
begin
  vStrings := TStringList.Create;
  vStrings.Text := pStrings;
  setConfSisBool(pChave, pValue, pBuscas, pDisplay, vStrings);
  FreeAndNil(vStrings);
end;

procedure TSetConfiguracaoSistema.setConfSisFloat(pChave: string; pValue: Double; pBuscas: TIBQuery; pDisplay, pStrings: string);
var
  vStrings: TStrings;
begin
  vStrings := TStringList.Create;
  vStrings.Text := pStrings;
  setConfSisFloat(pChave, pValue, pBuscas, pDisplay, vStrings);
  FreeAndNil(vStrings);
end;

procedure TSetConfiguracaoSistema.setConfSisBool(pChave: string; pValue: Boolean; pBuscas: TIBQuery;
  pDisplay: string; pStrings: TStrings);
begin
  pBuscas.Close;
  pBuscas.SQL.Text := 'select value1_f retorno from config_sistema' +
    ' where chave = ' + QuotedStr(pChave) + ' and cod_empresa = ' + vDadosIni.codEmpresa;
  pBuscas.Open;

  if (pBuscas.IsEmpty) then
  begin
    pBuscas.Close;
    pBuscas.SQL.Text := 'insert into config_sistema (chave, cod_empresa, display_, type1_, value1_f, value1_b, ordem)' +
      ' values (:chave, :cod_empresa, :display_, :type1_, :value1_f, :value1_b, gen_id(inc_ord_config_sistema, 1))';
    pBuscas.ParamByName('chave').AsString := pChave;
    pBuscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
    pBuscas.ParamByName('display_').AsString := pDisplay;
    pBuscas.ParamByName('type1_').AsString := 'boolean';
    pBuscas.ParamByName('value1_f').AsFloat := vDadosIni.IfThen(pValue, 1, 0);
    if pStrings <> nil then
      pBuscas.ParamByName('value1_b').AsString := pStrings.Text;
    pBuscas.ExecSQL;
    if pBuscas.Transaction.InTransaction  then
      pBuscas.Transaction.Commit;
  end;
end;

procedure TSetConfiguracaoSistema.setConfSisFloat(pChave: string; pValue: Double; pBuscas: TIBQuery; pDisplay: string;
  pStrings: TStrings);
begin
  pBuscas.Close;
  pBuscas.SQL.Text := 'select value1_f retorno from config_sistema' +
    ' where chave = ' + QuotedStr(pChave) + ' and cod_empresa = ' + vDadosIni.codEmpresa;
  pBuscas.Open;

  if (pBuscas.IsEmpty) then
  begin
    pBuscas.Close;
    pBuscas.SQL.Text := 'insert into config_sistema (chave, cod_empresa, display_, type1_, value1_f, value1_b, ordem)' +
      ' values (:chave, :cod_empresa, :display_, :type1_, :value1_f, :value1_b, gen_id(inc_ord_config_sistema, 1))';
    pBuscas.ParamByName('chave').AsString := pChave;
    pBuscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
    pBuscas.ParamByName('display_').AsString := pDisplay;
    pBuscas.ParamByName('type1_').AsString := 'float';
    pBuscas.ParamByName('value1_f').AsFloat := pValue;
    if pStrings <> nil then
      pBuscas.ParamByName('value1_b').AsString := pStrings.Text;
    pBuscas.ExecSQL;
    if pBuscas.Transaction.InTransaction  then
      pBuscas.Transaction.Commit;
  end;
end;

procedure TSetConfiguracaoSistema.setConfSisInt(pChave: string; pValue: integer; pBuscas: TIBQuery; pDisplay, pStrings: string);
var
  vStrings: TStrings;
begin
  vStrings := TStringList.Create;
  vStrings.Text := pStrings;
  setConfSisInt(pChave, pValue, pBuscas, pDisplay, vStrings);
  FreeAndNil(vStrings);
end;

procedure TSetConfiguracaoSistema.setConfSisObj(Aconf: TConfig_sistema_class;
  ABuscas: TIBQuery);
begin
  ABuscas.Close;
  ABuscas.SQL.Text := 'select value1_b retorno from config_sistema' +
    ' where chave = ' + QuotedStr(Aconf.chave) + ' and cod_empresa = ' + vDadosIni.codEmpresa;
  ABuscas.Open;

  if (ABuscas.IsEmpty) then
  begin
    Aconf.cod_empresa := IfThen(Aconf.cod_empresa = 0, StrToInt(vDadosIni.codEmpresa), Aconf.cod_empresa);
    ABuscas.Close;
    ABuscas.SQL.Text := 'insert into config_sistema (chave, cod_empresa, display_, tag, type1_, value1_vc, value1_f, value1_b, ordem, ativo)' +
      ' values (:chave, :cod_empresa, :display_, :tag, :type1_, :value1_vc, :value1_f, :value1_b, gen_id(inc_ord_config_sistema, 1), :ativo)';
    ABuscas.ParamByName('chave').AsString        := Copy(Aconf.chave    , 1,  64);
    ABuscas.ParamByName('cod_empresa').AsInteger := Aconf.cod_empresa;
    ABuscas.ParamByName('display_').AsString     := Copy(Aconf.display_ , 1, 256);
    ABuscas.ParamByName('tag').AsString          := Copy(Aconf.tag      , 1, 256);
    ABuscas.ParamByName('type1_').AsString       := Copy(Aconf.type1_   , 1,  32);

    if Aconf.value1_vc <> '' then
      ABuscas.ParamByName('value1_vc').AsString  := Copy(Aconf.value1_vc, 1, 256);

    if vDadosIni.strIn(Aconf.type1_, ['integer', 'float', 'boolean']) then
      ABuscas.ParamByName('value1_f').AsFloat    := IfThen(Aconf.type1_ <> 'integer', Aconf.value1_f, Trunc(Aconf.value1_f));

    if Aconf.value1_b.Text <> '' then
      ABuscas.ParamByName('value1_b').AsString   := Aconf.GetBlobConf();

    ABuscas.ParamByName('ativo').AsInteger       := Aconf.ativo;
    ABuscas.ExecSQL;
    if ABuscas.Transaction.InTransaction  then
      ABuscas.Transaction.Commit;
  end;
end;

procedure TSetConfiguracaoSistema.setConfSisInt(pChave: string; pValue: integer; pBuscas: TIBQuery; pDisplay: string;
  pStrings: TStrings);
begin
  pBuscas.Close;
  pBuscas.SQL.Text := 'select value1_f retorno from config_sistema' +
    ' where chave = ' + QuotedStr(pChave) + ' and cod_empresa = ' + vDadosIni.codEmpresa;
  pBuscas.Open;

  if (pBuscas.IsEmpty) then
  begin
    pBuscas.Close;
    pBuscas.SQL.Text := 'insert into config_sistema (chave, cod_empresa, display_, type1_, value1_f, value1_b, ordem)' +
      ' values (:chave, :cod_empresa, :display_, :type1_, :value1_f, :value1_b, gen_id(inc_ord_config_sistema, 1))';
    pBuscas.ParamByName('chave').AsString := pChave;
    pBuscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
    pBuscas.ParamByName('display_').AsString := pDisplay;
    pBuscas.ParamByName('type1_').AsString := 'integer';
    pBuscas.ParamByName('value1_f').AsFloat := pValue;
    if pStrings <> nil then
      pBuscas.ParamByName('value1_b').AsString := pStrings.Text;
    pBuscas.ExecSQL;
    if pBuscas.Transaction.InTransaction  then
      pBuscas.Transaction.Commit;
  end;
end;

procedure TSetConfiguracaoSistema.setConfSisStr(pChave, pValue: string; pBuscas: TIBQuery; pDisplay, pStrings: string;
  pTrim: Boolean);
var
  vStrings: TStrings;
begin
  vStrings := TStringList.Create;
  vStrings.Text := pStrings;
  setConfSisStr(pChave, pValue, pBuscas, pDisplay, vStrings, pTrim);
  FreeAndNil(vStrings);
end;

procedure  TSetConfiguracaoSistema.setConfSisStr(pChave, pValue: string; pBuscas: TIBQuery; pDisplay: string;
  pStrings: TStrings; pTrim: Boolean);
begin
  pBuscas.Close;
  pBuscas.SQL.Text := 'select value1_vc retorno from config_sistema' +
    ' where chave = ' + QuotedStr(pChave) + ' and cod_empresa = ' + vDadosIni.codEmpresa;
  pBuscas.Open;

  if (pBuscas.IsEmpty) then
  begin
    pBuscas.Close;
    pBuscas.SQL.Text := 'insert into config_sistema (chave, cod_empresa, display_, type1_, value1_vc, value1_b, ordem)' +
      ' values (:chave, :cod_empresa, :display_, :type1_, :value1_vc, :value1_b, gen_id(inc_ord_config_sistema, 1))';
    pBuscas.ParamByName('chave').AsString := pChave;
    pBuscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
    pBuscas.ParamByName('display_').AsString := pDisplay;
    pBuscas.ParamByName('type1_').AsString := 'string';
    pBuscas.ParamByName('value1_vc').AsString := Trim(Copy(pValue, 1, 256));
    if pStrings <> nil then
      pBuscas.ParamByName('value1_b').AsString := pStrings.Text;
    pBuscas.ExecSQL;

    if pBuscas.Transaction.InTransaction  then
      pBuscas.Transaction.Commit;
  end;
end;


constructor TSetConfiguracaoSistema.create;
begin
  vDadosIni.vVersaoConfig := 0; //alterar aqui a versao de configuracoes
  Aconfs := TConfig_sistema_classList.Create;
end;

function TSetConfiguracaoSistema.VersaoBancoMenor(NovaVersao: Double): Boolean;
begin
  //Checar e star a versao nova
  Result := RoundTo(vVersaoConfigBanco, -3) < RoundTo(NovaVersao, -3);
  if Result then
    vDadosIni.vVersaoConfig := NovaVersao;
end;

procedure TSetConfiguracaoSistema.verificarVersaoConf(buscas: TIBQuery);
var
  //Aconfs: TConfig_sistema_classList;
  Aconf: TConfig_sistema_class;
  I: Integer;
begin
  try
    vDadosIni.vVersaoConfig := 0;
    vVersaoConfigBanco := vDadosIni.getConfSisFloat('versao_config_sistema', buscas);

    AConfs.Clear();

    if vVersaoConfigBanco < 1 then
    begin
      setConfSisInt('versao_config_sistema', 0, buscas,
        'Versao da configuração do sistema', nil);
      setConfSisBool('cl_cad_simpl_habilitado', False, buscas,
        'Habilitar o cadastro simplificado de clientes', nil);
      setConfSisBool('cl_cad_simpl_obs_aba_pricipal_hab', True, buscas,
        'Habilitar o campo de observacao da aba principal para digitacao no cadastro simplificado de clientes', nil);
      setConfSisBool('cl_cad_simpl_usar_botoes_n_abas', False, buscas,
        'Habilitar o uso de botoes no lugar das abas no cadastro simplificado de clientes', nil);
//      setConfSisBlob('cl_cad_simpl_campos_obrigatorios', buscas,
//        'Campos de preenchimento obrigatorio no cadastro simplificado de clientes',
//        '|Campo do banco|Mensagem ao usuario|Componente de Foco(Shif+Ctrl+Alt+F10)|P:DadosPessoais;E:Endereco;C:Contato;D:Documentos;O:Outros|' + #13 +
//        '|sexo|Genero de Preenchimento obrigatorio|DBLookupComboBox30|');
      setConfSisBlob('cl_cad_simpl_campos_desabilitados', buscas,
        'Campos que serão desabilitados no cadastro simplificado de clientes',
        '|Nome do campo|Nome do componente|edicao alteracao inclusao ambos editar incluir alterar|nivel|' + #13 +
        '|Faturamento|DBLookupComboBox41|edicao|5|');
      setConfSisBool('cl_cad_sugerir_possivel_cliente', False, buscas,
        'Habilitar sugestao de possiveis clientes antes de iniciar um novo cadastro',
        '|T: Todos os possiveis cliente; C: Apenas os possiveis clientes do colaborador logado|campos personalizados dos possiveis clientes|' + #13 +
        '|T||');
      setConfSisBool('cl_conf_cpfcgc', vDadosIni.vCliente.vConfCPF, buscas,
        'Habilitar no cadastro de clientes o preenchimento obrigatorio do CPF/CNPJ', nil);
      setConfSisBool('cl_cad_normal_aba_veiculos_hab', vDadosIni.vCliente.vConfCPF, buscas,
        'Habilitar no cadastro normal de clientes a aba com dados do ultimo veiculo do cliente', nil);
    end;

    if vVersaoConfigBanco < 2 then
    begin
      setConfSisBlob('sped_f_tab_5_4_icms', buscas,
        'Sped Fiscal - Tabela de Códigos das Obrigações do ICMS a Recolher. 5.4',
        '000|ICMS a recolher|01012009|' + #13 +
        '001|ICMS da substituição tributária pelas entradas|01012009|' + #13 +
        '002|ICMS da substituição tributária pelas saídas para o Estado|01012009|' + #13 +
        '003|Antecipação do diferencial de alíquotas do ICMS|01012009|' + #13 +
        '004|Antecipação do ICMS da importação|01012009|' + #13 +
        '005|Antecipação tributária|01012009|' + #13 +
        '006|ICMS resultante da alíquota adicional dos itens incluídos no Fundo de Combate à Pobreza|01012009|' + #13 +
        '090|Outras obrigações do ICMS|01012009|' + #13 +
        '999|ICMS da substituição tributária pelas saídas para outro Estado|01012009|');
      setConfSisBool('cl_cad_questionar_enderprincipal_cobrancao', False, buscas,
        'Habilitar copia do endereço principal para o de cobrança',
        'Detalhes' + #13 +
        'Antes de salvar os dados do cliente, se o endereco principal foi alterado,' + #13 +
        'O sistema vai questionar se deseja copiar os dados do endereço principal para o de cobranca');
    end;

    if vVersaoConfigBanco < 3 then
    begin
      setConfSisBool('nf_hab_gnre_online_difal', True, buscas,
        'Habilitar a nota fiscal de saida a abrir a pagina de emissão de GNRE online de cada estado para o ICMS Interestadual DIFAL',
        '|AC|http://www.gnre.pe.gov.br/gnre/portal/GNRE_Gerar.jsp|' + #13 + 
        '|AL|http://www.gnre.pe.gov.br/gnre/portal/GNRE_Gerar.jsp|' + #13 + 
        '|AP|http://www.gnre.pe.gov.br/gnre/portal/GNRE_Gerar.jsp|' + #13 + 
        '|AM|http://www.gnre.pe.gov.br/gnre/portal/GNRE_Gerar.jsp|' + #13 + 
        '|BA|http://www.gnre.pe.gov.br/gnre/portal/GNRE_Gerar.jsp|' + #13 + 
        '|CE|http://www.gnre.pe.gov.br/gnre/portal/GNRE_Gerar.jsp|' + #13 +
        '|DF|http://www.gnre.pe.gov.br/gnre/portal/GNRE_Gerar.jsp|' + #13 + 
        '|ES|http://e-dua.sefaz.es.gov.br/|' + #13 + 
        '|GO|http://www.gnre.pe.gov.br/gnre/portal/GNRE_Gerar.jsp|' + #13 + 
        '|MA|http://www.gnre.pe.gov.br/gnre/portal/GNRE_Gerar.jsp|' + #13 + 
        '|MT|http://www.gnre.pe.gov.br/gnre/portal/GNRE_Gerar.jsp|' + #13 + 
        '|MS|http://www.gnre.pe.gov.br/gnre/portal/GNRE_Gerar.jsp|' + #13 + 
        '|MG|http://www.gnre.pe.gov.br/gnre/portal/GNRE_Gerar.jsp|' + #13 + 
        '|PA|http://www.gnre.pe.gov.br/gnre/portal/GNRE_Gerar.jsp|' + #13 + 
        '|PB|http://www.gnre.pe.gov.br/gnre/portal/GNRE_Gerar.jsp|' + #13 + 
        '|PR|http://www.gnre.pe.gov.br/gnre/portal/GNRE_Gerar.jsp|' + #13 + 
        '|PE|http://www.gnre.pe.gov.br/gnre/portal/GNRE_Gerar.jsp|' + #13 + 
        '|PI|http://www.gnre.pe.gov.br/gnre/portal/GNRE_Gerar.jsp|' + #13 + 
        '|RJ|http://www1.fazenda.rj.gov.br/projetoGCTBradesco/br/gov/rj/sef/gct/web/emitirdocumentoarrecadacao/DocumentoArrecadacaoController.jpf|' + #13 + 
        '|RN|http://www.gnre.pe.gov.br/gnre/portal/GNRE_Gerar.jsp|' + #13 + 
        '|RS|http://www.gnre.pe.gov.br/gnre/portal/GNRE_Gerar.jsp|' + #13 + 
        '|RO|http://www.gnre.pe.gov.br/gnre/portal/GNRE_Gerar.jsp|' + #13 + 
        '|RR|http://www.gnre.pe.gov.br/gnre/portal/GNRE_Gerar.jsp|' + #13 + 
        '|SC|http://www.gnre.pe.gov.br/gnre/portal/GNRE_Gerar.jsp|' + #13 + 
        '|SP|https://www.fazenda.sp.gov.br/guiasinternet/Gare/Paginas/Gare.aspx|' + #13 + 
        '|SE|http://www.gnre.pe.gov.br/gnre/portal/GNRE_Gerar.jsp|' + #13 + 
        '|TO|http://www.gnre.pe.gov.br/gnre/portal/GNRE_Gerar.jsp|');

      setConfSisBool('nf_hab_cad_obrig_sped_f_icmsdifal_fcp', True, buscas,
        'Habilitar a nota fiscal de saida a abrir o cadastro de Obrigacoes a Recolher do ICMS DIFAL / FCP para o Sped Fiscal',
        '|UF|DIFAL ou FCP|Cod Tab 5.4 Sped - DIFAL|Cod Tab 5.4 Sped - FCP|Codigo da receita na UF|' + #13 +
        '|AC|DIFAL|003|100102|' + #13 +
        '|AL|DIFAL|003|100102|' + #13 + 
        '|AL|FCP|006|100129|' + #13 + 
        '|AP|DIFAL|003|100102|' + #13 + 
        '|AM|DIFAL|003|100102|' + #13 + 
        '|BA|DIFAL|003|100102|' + #13 + 
        '|BA|FCP|006|100129|' + #13 + 
        '|CE|DIFAL|003|100102|' + #13 + 
        '|CE|FCP|006|100129|' + #13 +
        '|DF|DIFAL|003|100102|' + #13 + 
        '|DF|FCP|006|100129|' + #13 + 
        '|ES|DIFAL|003||' + #13 + 
        '|ES|FCP|006||' + #13 + 
        '|GO|DIFAL|003|100102|' + #13 + 
        '|GO|FCP|006||' + #13 + 
        '|MA|DIFAL|003|100102|' + #13 + 
        '|MA|FCP|006|100129|' + #13 + 
        '|MG|DIFAL|003|100102|' + #13 + 
        '|MG|FCP|006|100129|' + #13 + 
        '|MT|DIFAL|003|100102|' + #13 + 
        '|MT|FCP|006|100129|' + #13 + 
        '|MS|DIFAL|003|100102|' + #13 + 
        '|MS|FCP|006|100129|' + #13 + 
        '|PA|DIFAL|003|100102|' + #13 + 
        '|PA|FCP|006||' + #13 + 
        '|PB|DIFAL|003|100102|' + #13 + 
        '|PB|FCP|006|100129|' + #13 + 
        '|PE|DIFAL|003|100102|' + #13 + 
        '|PE|FCP|006|100129|' + #13 + 
        '|PI|DIFAL|003|100102|' + #13 + 
        '|PI|FCP|006|100129|' + #13 + 
        '|PR|DIFAL|003|100102|' + #13 + 
        '|PR|FCP|006||' + #13 + 
        '|RJ|DIFAL|003||' + #13 + 
        '|RJ|FCP|006||' + #13 + 
        '|RN|DIFAL|003|100102|' + #13 + 
        '|RN|FCP|006|100129|' + #13 + 
        '|RS|DIFAL|003|100102|' + #13 + 
        '|RS|FCP|006|100129|' + #13 + 
        '|RO|DIFAL|003|100102|' + #13 + 
        '|RO|FCP|006||' + #13 + 
        '|RR|DIFAL|003|100102|' + #13 + 
        '|SC|DIFAL|003|100102|' + #13 +
        '|SC|FCP|006||' + #13 + 
        '|SP|DIFAL|003||' + #13 +
        '|SP|FCP|006||' + #13 + 
        '|SE|DIFAL|003|100102|' + #13 + 
        '|SE|FCP|006||' + #13 + 
        '|TO|DIFAL|003|100102|' + #13 + 
        '|TO|FCP|006|100129|');
      setConfSisBool('nf_s_hab_dadosadicionais_cst_csosn', True, buscas,
        'Habilitar na nota fiscal de saída para o sistema montar nos dados adicionais da NF os valores agrupados de CST/CSOSN', nil);
      setConfSisBool('nf_s_hab_dadosadicionais_digitacao_fech', False, buscas,
        'Habilitar o campo de dados adicionais no fechamento da nota fiscal de saída', nil);
    end;

    if vVersaoConfigBanco < 4 then
    begin
      // Merge do release 
      setConfSisBool('nf_hab_validacao_antecipacao_st', False, buscas,
        'Habilitar a validação e calculo da Antecipação tributaria de ICMS na entrada de Notas Fiscais',
        '|Aplicar validacao tambem a entradas de devolucao: S ou N|' + #13 +
        '|N|');
      setConfSisBool('nf_hab_alerta_calc_ant_st_itens_por_cst', True, buscas,
        'Habilitar Alertas de calculo da Antecipação tributaria de ICMS por CST do Produto',
        '|Pedir processo no caso de alerta|Deixar como esta|Informar a lista de CST de ICMS separados pelo caracter "|"|' + #13 +
        '|S|Calcular e Alertar||||' + #13 +
        '|S|Alertar e Nao Calcular|41|50|51|90|' + #13 +
        '|N|Nao Alertar e Nao Calcular|40|');
      setConfSisBool('nf_hab_antecipacao_st_usar_icms_xml', False, buscas,
        'Habilitar uso do ICMS do XML nas Entradas com Antecipacao tributaria de ICMS', nil);
      setConfSisBool('vei_cfop_st_comando_fat', True, buscas,
        'Regras do comando de faturamento por CFOP e CST',
        'Informar somente os dois últimos dígitos do CST ' + #13 +
        '|Desabilitar campo CST|CFOP|CST|' + #13 +
        '|S|5912|50|' + #13 +
        '|S|6912|50|');
      setConfSisBool('nf_e_hab_conversao_cst_regra_geral_tabela_a', False, buscas,
        'Habilitar uso de conversao automatica de CST de ICMS nas entradas. Regra geral Tabela A',
        '|Digito de Origem (CST) constante na NF, XML: [0,1,2,3,4,5,6,7,8]| Informar o digito origem (CST) a atribuir|Alterar no cadastro do produto: S ou N|' + #13 +
        '|2|1|S|');
      setConfSisBool('nf_e_hab_conversao_cst_regra_geral_tabela_b', False, buscas,
        'Habilitar uso de conversao automatica de CST de ICMS nas entradas. Regra geral Tabela B',
        '|CST constante na NF, XML| Informar o CST a atribuir após a confirmação da NF|Aplicar em notas de emissao propria: S ou N|' + #13 +
        '|10|60|S|' + #13 +
        '|30|60|S|' + #13 +
        '|70|60|S|');
      setConfSisBool('nf_e_hab_cst_60_calculo_st_icms', False, buscas,
        'Habilitar nas entradas de nota fiscal o calculo da st de icms quando igual a "60"', nil);
      //nota fiscal
      setConfSisBool('nf_hab_validacao_antecipacao_st', False, buscas,
        'Habilitar a validação e calculo da Antecipação tributaria de ICMS na entrada de Notas Fiscais', nil);
      setConfSisBool('nf_hab_alerta_calc_ant_st_itens_por_cst', True, buscas,
        'Habilitar Alertas de calculo da Antecipação tributaria de ICMS por CST do Produto',
        '|Pedir processo no caso de alerta|Deixar como esta|Informar a lista de CST de ICMS separados pelo caracter "|"|' + #13 +
        '|S|Calcular e Alertar||||' + #13 +
        '|S|Alertar e Nao Calcular|41|50|51|90|' + #13 +
        '|N|Nao Alertar e Nao Calcular|40|');
      setConfSisBool('nf_hab_antecipacao_st_usar_icms_xml', False, buscas,
        'Habilitar uso do ICMS do XML nas Entradas com Antecipacao tributaria de ICMS', nil);
      setConfSisBool('nf_e_hab_conversao_embalagem_produto', False, buscas,
        'Habilitar na entrada de notas fiscais a converão de quantidades utilizando os campos do cadastro do produto', nil);
      setConfSisBool('nf_hab_digitacao_valor_total', False, buscas,
        'Habilitar na digitacao de nota fiscal o valor total para calcular o valor unitario', nil);
      setConfSisBool('nf_validar_ncm_xml_com_produto', False, buscas,
        'Habilitar a validação do NCM importado no XML com o NCM do cadastro do produto',
        'O sistema compara o NCM do cadastro do produto com o NCM do XML');
      setConfSisBool('nf_validar_cest_xml_com_produto', False, buscas,
        'Habilitar a validação do CEST importado no XML com o CEST do cadastro do produto',
        'O sistema compara o CEST do cadastro do produto com o CEST do XML');
      setConfSisBool('nf_e_hab_validacao_alternativa_modelo', False, buscas,
        'Habilitar a validação alternativa da serie e subserie dos modelos de documentos fiscais informados abaixo',
        '|Modelo|Serie: N (Numerica), A (Alfanumerica)|Permitir sem serie: S ou N|Valores validos separados por virgula caso necessario para serie' +
               '|Subserie: N (Numerica), A (Alfanumerica)|Permitir sem subserie: S ou N|Valores validos separados por virgula caso necessario para subserie|' + #13 +
        '|07|A|N|B,C,U|N|N||' + #13 +
        '|22|A|S|     | | ||');
      //outros
      setConfSisInt('prcss_intervalo_em_segundos', 30, buscas,
        'Intervalor de processamento interno do sistema. Processamtos podem ser feitos aos poucos, sem atrapalhar o desempenho do sistema', nil);
      setConfSisBool('prcss_montar_estoque_diario_30_12_1899', True, buscas,
        'Habilitar o processamento interno pra verificar datas iniciais de estoque dos produtos', nil);
      setConfSisStr('hw_url_servicos', 'http://hwsistemas.homelinux.com', buscas,
        'URL da pagina da HW Sistemas', nil);

      // a url nao deve ficar visivel para alteração, apenas interna, quando necessitar alterar a url o proprio sistema sistema ira fazer
      buscas.Close;
      buscas.SQL.Text := 'update config_sistema set ativo = 0' +
        ' where chave = ' + QuotedStr('hw_url_servicos') +
        ' and cod_empresa = ' + vDadosIni.codEmpresa +
        ' and ativo = 1';
      buscas.ExecSQL;

      //produtos
      setConfSisBool('prod_cad_simpl_habilitado', False, buscas,
        'Habilitar o cadastro simplificado de produtos', nil);

      buscas.Close;
      buscas.SQL.Text := 'select first 1 char_length(rtrim(p.cod_prod)) digprod, count(p.cod_empresa) from produtos p' +
        ' where p.cod_empresa = ' + vDadosIni.codEmpresa + ' group by 1 order by 2 desc';
      buscas.Open;

      setConfSisInt('prod_cad_digitos_codigos', buscas.FieldByName('digprod').AsInteger, buscas,
        'Quantidade de digitos para o campo Codigo do cadastro do produto. Informar de 3 a 6 digitos', nil);
      { Foi unificado na conf prod_precos
      setConfSisBool('prod_cad_aplicar_desc_preco_tabela', vDadosIni.vProduto.vMaxDescPrecoAVista = 'S', buscas,
        'Usar campo "Calc Preço(%)" do cadastro de produto para calcular o preco de tabela pelo preco de 30 dias', nil);
      }
      setConfSisBool('prod_cad_simpl_usar_campos_markup', False, buscas,
        'Deixa visivel os campos de markup no cadastro de produto simplificado',
        '|nome do campo|nome componente|nivel do usuario para deixar visivel|excecoes, codigos de usuarios separados por ";"|' + #13 +
        '|Preco de tabela  "%" |edMarkUpTb|10||' + #13 +
        '|Preco de atacado "%" |edMarkUpAt|10||' + #13 +
        '|Preco de 30 dias "%" |edMarkUp30|10||' + #13 +
        '|Preco de 60 dias "%" |edMarkUp60|10||' + #13 +
        '|Preco de 90 dias "%" |edMarkUp90|10||');

      setConfSisBool('prod_cad_simpl_usar_campos_perc_ajuste', False, buscas,
        'Deixa visivel os campos de percentual de ajuste dos precos de 30, 60 e 90 sobre o preco de tabela no cadastro de produto simplificado',
        '|nome do campo|nome componente|nivel do usuario para deixar visivel|excecoes, codigos de usuarios separados por ";"|' + #13 +
        '|Preco de 30 dias "AJ" |edPercAj30|10||' + #13 +
        '|Preco de 60 dias "AJ" |edPercAj60|10||' + #13 +
        '|Preco de 90 dias "AJ" |edPercAj90|10||');

      setConfSisBool('prod_cad_simpl_usar_campos_margem_minima', False, buscas,
        'Deixa visivel os campos de margem minima no cadastro de produto simplificado',
        '|nome do campo|nome componente|nivel do usuario para deixar visivel|excecoes, codigos de usuarios separados por ";"|' + #13 +
        '|Perc. Margem Min Venda Varejo(PMM) |edMargMinVa|10||' + #13 +
        '|Perc. Margem Min Venda Atacado(PMM)|edMargMinAt|10||');

      setConfSisBlob('prod_cad_relacao_cst_csosn', buscas,
        'Relacao entre CST e CSOSN de ICMS para validacao do cadastro do produto',
        '|CST ICMS|CSON 1|CSNO 2| CSON 3 ...|' + #13 +
        '|00|101|102|' + #13 +
        '|10|201|202|' + #13 +
        '|20|101|102|' + #13 +
        '|30|203|' + #13 +
        '|40|103|' + #13 +
        '|41|300|400|' + #13 +
        '|50|103|' + #13 +
        '|51|900|' + #13 +
        '|60|500|' + #13 +
        '|70|201|202|' + #13 +
        '|90|900|');
      setConfSisBool('prod_cad_simpl_usar_botoes_n_abas', False, buscas,
        'Habilitar o uso de botoes no lugar das abas no cadastro simplificado de produtos', nil);
      setConfSisBlob('prod_cad_simpl_campos_obrigatorios', buscas,
        'Campos de preenchimento obrigatorio no cadastro simplificado de produtos',
        '|Campo do banco|Mensagem ao usuario|Componente de Foco(Shif+Ctrl+Alt+F10)|');
      setConfSisStr('prod_cad_diretorio_padrao_imagens', '', buscas,
        'Diretorio padrao das imagens do cadastro do produto', nil);

      //paf-ecf
      setConfSisStr('paf_ecf_form_pag_digitada_controles', '', buscas,
        'Informar o codigo dos controles que deseja que no PAF-ECF seja digitada pelo usuario a forma de pagamento',
        'Digitar o controles separados por virgula, Ex: 5,8,9');
      setConfSisBool('paf_ecf_form_pag_agrupar_por_finalizador', False, buscas,
        'Habilitar o agrupamento de Valores por finalizador ao gerar os parcelamentos', nil);
      setConfSisBool('paf_ecf_form_pag_apresentar_todos_controles_s2', False, buscas,
        'Habilitar no parcelamento dos o sistema a apresentar todos os controles',
        'Por padrão o sistema utiliza o vinculo do cadastro de controles com os finalizadores' + #13 +
        'Quando esta configuracao for ativada o sistema desconsidera esta vinculacao');
    end;

    if vVersaoConfigBanco < 5 then
    begin
      //Merge do release
      setConfSisBool('paf_ecf_form_pag_num_doc_cupom', True, buscas,
        'Habilitar nas formas de pagamento o uso do número do documento do cupom fiscal',
        'Durante a sincronização o número do documento poderá ser alterado substituindo o número da' + #13 +
        'venda (pedido) pelo número do documento fiscal (cupom) assim como a nota fiscal já faz, basta deixar' + #13 +
        'ativada esta configuração.' + #13 +
        'Nesta sincronização o sistema também atualiza o número do documento dos créditos caso as formas de' + #13 +
        'pagamento já tenham sido processadas' + #13 +
        'Ex: Nao -> Num Pedido: 23444 Num Cupom: 8788 Num Doc: 023444-1, 023444-2' + #13 +
        '    Sim -> Num Pedido: 23444 Num Cupom: 8788 Num Doc: 008788-1, 008788-2');
      //
      setConfSisBlob('ctnserie_lista_status_adicional', buscas,
        'Lista de status adicionais no controle de número de série',
        '');
      setConfSisBlob('tpserv_cad_campos_obrigatorios', buscas,
        'Campos de preenchimento obrigatorio no cadastro de tipos de serviços',
        '|Campo do banco|Mensagem ao usuario|Componente de Foco(Shif+Ctrl+Alt+F10)|');
      //recibo
      setConfSisBool('rec_hab_depart', False, buscas,
        'Habilitar códificação do recibo por departamento',
        'O sistema utiliza um recibo padrão' + #13 +
        'Quando esta configuracao for ativada o sistema desconsidera o recibo padrão para utilizar a codificação do recibo por departamento');
      setConfSisFloat('rec_parc_formpag', 0, buscas,
       'Valor mínimo de um recibo após a baixa parcial na forma de pagamento', nil);
      setConfSisFloat('rec_parc_controle_creditos', 0, buscas,
       'Valor mínimo de um recibo após a baixa parcial de uma conta a receber', nil);
      setConfSisBool('rec_testar_departamento', False, buscas,
        'Testar gerente do departamento ao efetivar recibo',
        'Quando esta configuracao for ativada o sistema solicitará a senha do gerente ao efetivar recibo');
      //Pedvenda
      setConfSisInt('ped_vnd_req_limite_impressao', 0, buscas,
        'Quantidade de impressões permitidas para Pedidos de Venda',
        'Quantidade igual a 0(zero) desativa esta configuração');
      setConfSisInt('ped_vnd_os_limite_impressao', 0, buscas,
        'Quantidade de impressões permitidas para Ordens de Serviço',
        'Quantidade igual a 0(zero) desativa esta configuração');
      setConfSisInt('ped_vnd_orc_limite_impressao', 0, buscas,
        'Quantidade de impressões permitidas para Orçamentos',
        'Quantidade igual a 0(zero) desativa esta configuração');
      setConfSisBool('ped_vnd_manter_vendedor_original_dav', True, buscas,
        'Ao alterar vendedor do DAV manter o vendedor original quando mesclado', nil);
      setConfSisBool('ped_vnd_permitir_qtde_serv_fracionado', False, buscas,
        'Permitir quantidade de serviço fracionado em Ordem de Serviço e Orçamento', '');
    end;

    if vVersaoConfigBanco < 6 then
    begin
      //Merge do release


      //PedVenda
      setConfSisStr('ped_vnd_informar_dados_cliente_padrao', 'ORC', buscas,
        'Abrir dados de cliente quando o cliente padrão for informado',
        'Informar o tipo do documento. Ex: ORC, REQ, OS');
      setConfSisBool('ped_vnd_imprimir_nao_fiscal', False, buscas,
        'Ativa a Impressão de Requisição, Ordens de Serviço e Orçamentos em impressoras não fiscais',
        'Verificar no banco de soluções: 98');

      //Cliente
      setConfSisInt('cl_conf_codigo_cliente_padrao',
        StrToIntDef(vDadosIni.GetIni('Sistema', 'ClientePadrao', '0'), 0), buscas,
        'Codigo do cliente padrão usado em vendas balcao', nil);
      setConfSisBlob('cl_cad_campos_obrigatorios', buscas,
        'Campos de preenchimento obrigatorio no cadastro de clientes',
        '|Campo do banco|Mensagem ao usuario|Componente de Foco(Shif+Ctrl+Alt+F10)|P:DadosPessoais;E:Endereco;C:Contato;D:Documentos;O:Outros|' + #13 +
        '|cep|CEP do endereço do cliente de preenchimento obrigatório|DBEdit114|' + #13 +
        '|endereco|Logradouro do endereço do cliente de preenchimento obrigatório|DBEdit115|' + #13 +
        '|num_end_cliente|Número do endereço do cliente de preenchimento obrigatório|DBEdit116|' + #13 +
        '|bairro|Bairro do endereço do cliente de preenchimento obrigatório|DBEdit118|' + #13 +
        '|cidade|Cidade do endereço do cliente de preenchimento obrigatório|DBEdit119|' + #13 +
        '|codigo_uf|Estado do endereço do cliente de preenchimento obrigatório|DBLookupComboBox29|' + #13 +
        '|cep_cobranca|CEP do endereço de cobrança de preenchimento obrigatório|DBEdit150|E|' + #13 +
        '|end_cobranca|Endereço (Logradouro, numero e complemento) do endereço de cobrança de preenchimento obrigatório|DBEdit151|E|' + #13 +
        '|bairro_cobranca|Bairro do endereço de cobrança de preenchimento obrigatório|DBEdit152|E|' + #13 +
        '|cida_cobranca|Cidade do endereço de cobrança de preenchimento obrigatório|DBEdit153|E|' + #13 +
        '|est_codigo_uf|Estado do endereço de cobrança de preenchimento obrigatório|DBLookupComboBox35|E|');

      //Nota Fiscal
      setConfSisBlob('nf_conf_ncm_cfop_piscofins', buscas,
        'Configuração adicional para escriturar o PISCOFINS. Utiliza a combinação NCMxCFOP',
        '|NCM item*|CFOP item*|CST PISCOFINS a utilizar*|Natureza da Receita a utilizar|Aliq PIS a utilizar|Aliq Cofins a utilizar|Aliq PIS em Reais a utilizar|Aliq Cofins em Reais a utilizar|' + #13 +
        '#O NCM, CFOP e CST é de preenchimento obrigatorio, os demais campos somente serão utilizados se preencidos');

      {
      //NFC-e
      setConfSisBlob('nfc_nfce_config_emissor_cliente', buscas,
        'Pacote de configurações para o PC Cliente emissor da NFC-e',
        '[NFCe_Emissao_Padrao]' + #13 +
        'TipoDeImpressaoPadrao=4' + #13 +
        '# 4 - DANFE NFC-e; 5 - DANFE NFC-e em mensagem eletrônica email, pode ser impresso também;' + #13 + #13 +
        'IndicadorDePresencaPadrao=1' + #13 +
        '# 1 - Operação presencial; 4 - NFC-e em operação com entrega a domicílio;' + #13 + #13 +
        'NaturezaDeOperacaoPadrao=5102' + #13 +
        '# Informar o codigo do CFOP para o sistema localizar a descricao no cadastro' + #13 +
        '# Ou pode ser informado o texto padrão de até 60 caracteres' + #13 + #13 +
        'ModalidadeDoFrete=9' + #13 +
        '# 0: Por conta do emitente ; 1: Por conta do destinatário/remetente;' + #13 +
        '# 2: Por conta de terceiros; 9: Sem frete;' + #13 + #13 +
        'QtdeViasEmContingencia=2' + #13 +
        '# 1 ou 2, a critério de cada UF esta obrigação poderá ser dispensada' + #13 + #13 +
        'ImpressaoResumida=N' + #13 +
        '# S ou N para ativar a impressao resumida sem itens' + #13 + #13 +
        'ImpressoraNaoFiscal=N' + #13 +
        '# S ou N para impressora não fiscal' + #13 + #13 +

        '[NFCe_Regras]' + #13 +
        'DescontoPadraoPorItem=S' + #13 +
        '# S - Ativa o desconto padrao nos itens; N - ativa o desconto informado no total da NFC-e;' + #13 + #13 +
        'PermitirEmissaoNFCeParaClienteContribuinteDeICMS=N' + #13 +
        '# O sistema localiza o valor do campo Indicador de Inscrição Estadual no cadastro do cliente = 1' + #13 + #13 +
        'SequenciaDePreco=0,1' + #13 +
        '# 0: Promocao quando houver; 1: A Vista; 2: 30 dias; 3: 60  dias; 4: 90: dias' + #13 + #13 +
        'TimeOutParaEmitirEmContingencia=10' + #13 +
        '# Tempo que o sistema aguarda o processamento da NFC-e para imediatamente emitir a NFC-e em contngência' + #13 + #13 +
        'InibirFormaDePagamento=N' + #13 +
        '# Inibe a forma de pagamento na criação dos pedidos quando nfc-e avulsa mesmo quando o Caixa auxiliar está desativado' + #13 + #13 +

        '[NFCe_Servicos]' + #13 +
        'PermitirServicos=N' + #13 +
        '# Permitir incluir itens serviços para a NFC-e, verificar a legislação da sua cidade' + #13 + #13 +
        'UsarRetencaoDeISS=N' + #13 +
        '# Ativa a mesma regra de retenção da NFS-e, verifica cliente e serviços configurados' + #13 + #13 +
        'IndicadorDaExigibilidade=1' + #13 +
        '# 1: Exigível; 2: Não incidência; 3: Isenção; 4: Exportação; 5: Imunidade;' + #13 +
        '# 6: Exigibilidade Suspensa por Decisão Judicial; 7: Exigibilidade Suspensa por Processo Administrativo;' + #13 + #13 +
        'IndicadorDeIncentivoFiscal=2' + #13 +
        '# 1: Sim; 2: Nao' + #13 + #13 +

        '[NFCe_Regras_Itens]' + #13 +
        'UsarDescricaoReduzida=S' + #13 +
        '# Ativa o uso da descricao reduzida do cadastro do produto' + #13 + #13 +
        'CasasDecimaisQtde=3' + #13 +
        '# Permite definir as casas decimais para o campo de quantidade, apenas na NFC-e' + #13 + #13 +

        '[NFCe_Itens_Campos_Habilitados]' + #13 +
        '# S: Habilita o campo do item: N: Desabilita o campo do item' + #13 + 
        'ValorUnitario=S' + #13 +
        'ValorTotal=N' + #13 +
        'DescontoPercentual=S' + #13 +
        'DescontoEmValor=N' + #13 +
        'ValorLiquido=N' + #13 + #13 +

        '[NFCe_Regras_Itens_Grade]' + #13 +
        'UsarDescricao1Ou2=1' + #13 +
        '# Usar a primeira descricao da grade ou a segunda: Valores 1 ou 2' + #13 + #13 +
        'CaracterSeparador=-' + #13 +
        '# Caracter usado para separar a descricao do produto da descricao da grade. "|" não é permitido' + #13 + #13 +

        '[NFCe_Cartao]' + #13 +
        'HabilitarCampoAdcional=N' + #13 +
        '# Habilita o campo adicional de tipo de pagamento quando usar apenas um controle cartao' + #13 + #13 +

//        '[NFCe_Informacao_Fiscal]' + #13 +
//        'UsarMesmaRegraDaNFe=N' + #13 +
//        '# Habilita o sistema o campo de informacoes complementares usado a mesma regra da NF-e' + #13 + #13 +

        '[NFCe_Pedido]' + #13 +
        'SomarAcrecimoNoTotal=N' + #13 +
        '# Habilita o sistema somar os acrescimos dos pedidos no total do item e não usar no campo Outros Despesas da NF-e' + #13 + #13 +
        'SubtrairDescontoNoTotal=N' + #13 +
        '# Habilita o sistema subtrair os descontos dos pedidos no total do item e não usar no campo Desconto da NF-e' + #13 + #13 +

        '[NFCe_Estoque]' + #13 +
        'Conferir=S' + #13 +
        '# Habilita o sistema conferir o estoque na inclusão avulsa dos itens' + #13 + #13 +

        //'SepararSerieEmContingencia=N' + #13 +// talvez criando uma procedure resolva algum problema deadlock, pois na procedure fará tudo, copia e remover dados da venda
        //'SerieEmContingencia=0');
        '');
        }
    end;

    if vVersaoConfigBanco < 7 then
    begin
      setConfSisBool('sug_serv_hab', False, buscas,
        'Habilitar sugestão de serviço',
        'O sistema desabilita a sugestão por padrão');

      setConfSisInt('sug_serv_x_revisoes', 0, buscas,
        'Media entre X revisões:',
        'Por padrão "0" media geral entre todas revisões' + #13 +
        '0 - Todas|2 - Últimas|3 - Últimas|... - Últimas');

      setConfSisInt('sug_serv_dias_ant', 7, buscas,
        'Quantidade dias de antecedência que a sugestão será exibida',
        'Por padrão 7 dias');

      setConfSisBool('sug_serv_testar_regras', False, buscas,
        'Verificar regra de sugestão de serviço ao cadastrar modelo de veículo/equipamento',
        '|V: Todos modelos de veículos; I: Equipamentos internos;  E: Equipamentos externos; A: Ambos equipamentos (Externos e Internos)|' + #13 +
        '||');

      setConfSisStr('sug_serv_assunto_email', 'Assunto Padrão', buscas,
      	'Assunto e mensagem padrão email da sugestão serviço', 'Mensagem Padrão');

      setConfSisStr('boletim_caixa_assunto_email', 'Assunto Padrão', buscas,
      	'Assunto e mensagem padrão email do boletim de caixa', 'Mensagem Padrão');

      setConfSisStr('endividamento_por_depto_assunto_email', 'Assunto Padrão', buscas,
      	'Assunto e mensagem padrão email do endividamento por depto', 'Mensagem Padrão');

      setConfSisStr('clientes_devedores_por_periodo_assunto_email', 'Assunto Padrão', buscas,
      	'Assunto e mensagem padrão email do clientes devedores por período', 'Mensagem Padrão');

      setConfSisStr('mapa_despesas_assunto_email', 'Assunto Padrão', buscas,
      	'Assunto e mensagem padrão email do mapa despesas', 'Mensagem Padrão');

      setConfSisBool('ped_vnd_participante_hab', False, buscas,
      	'Habilitar participante em REQ/ORC', 'O sistema desabilita o participante por padrão');

      setConfSisStr('ped_vnd_descricao_participante', 'Participante', buscas,
      	'Descrição que será exibida ao participante/segundo vendedor', nil);

      setConfSisBool('ped_vnd_prod_qtde_desconto', False, buscas,
      	'Habilitar desconto em produtos com preço por quantidade no item REQ, ORC, OS',
        'Ao inserir um produto com preço por quantidade em uma venda, O sistema inclui o item com desconto');

      setConfSisBool('ped_vnd_prod_alterar_preco', False, buscas,
      	'Alterar preço dos produtos que possuam tabelas por preço por quantidade no item REQ, ORC, OS',
        'Ao inserir um produto com preço por quantidade em uma venda, O sistema desabilita os campo com o valor do item');
    end;

    if vVersaoConfigBanco < 8 then
    begin
      setConfSisStr('nf_zerar_icms_interestadual_cst_csosn',
        '|40|41|50|51|103|300|400|', buscas,
        'Informar o CST ou CSOSN separados por "|"(Pipe) para o sistema não fazer o cálculo do ICMS Interestadual',
        '');

      setConfSisBool('ped_vnd_prod_exibir_precos_por_qtde_vendarapida', False, buscas,
      	'Exibir os preços por quantidade na venda e orçamento rápido',
        'Ao inserir um produto com preço por quantidade em uma venda, O sistema não exibira os preços por quantidade');

      setConfSisStr('ped_vnd_otimizacao', '', buscas,
        'Ativar otimização da venda no sistema para os tipos especificados',
        'Configurar no campo acima os tipos desejados (REQ, OS, ORC)' + #13 +
        'Abaixo as regras de otimização. Obs. Pode configurar individualmente, ex: [InibirMensagens] -> [InibirMensagensREQ] ou [InibirMensagensOS] ou [InibirMensagensORC]' + #13 + #13 +
        '[Outras]' + #13 +
        //'ExibirOpcaoEnviarNfNfcNfsAoFechar=S' + #13 + #13 +
        //'FormaPagamentoAntesDeFechar=N' + #13 + #13 +
        '[InibirMensagens]' +#13 +
        'TipoDeVenda=S' + #13 +
        'ConfirmarDocumento=S' + #13 +
        'DocumentoConfirmado=S' + #13 +
        'ImprimirDocumentoAoConfirmar=S' + #13 + #13 +
        '[ImpressaoAuto]' + #13 +
        'AbrirTelaDeOpcoes=N' + #13 +
        'SempreImprimirAoConfirmar=S' + #13 +
        'Tipo=REDUZIDO' + #13 +
        'Formato=A5 (33 Linhas)' + #13 +
        'Chassi=N' + #13 +
        'OSExterna=N' + #13 +
        'NomeFantasia=N' + #13 +
        'DuasVias=N' + #13 +
        'DuasViasPorFolha=N');

      setConfSisBool('nf_ibpt_consulta_tributos', True, buscas,
      	'Habilitar a consulta (Api) das alíquotas para cálculo do valor aproximado dos tributos',
        '');
      setConfSisBool('nf_mudanca_cfop_com_opcoes', False, buscas,
      	'Habilitar a mudança de CFOP, CST/CSOSN e Aliquota de ICMS com seleções',
        '');
      setConfSisBool('nf_habilitar_fat_usar_valor_ped', False, buscas,
      	'Habilitar na Nota Fiscal ao gerar faturas usar o valor dos Pedidos',
        '');
      setConfSisBool('ped_vnd_hab_imp_end_emp', False, buscas,
      	'Habilitar em Requisições, Ordens de Serviço e Orçamentos a impressão do endereço da empresa',
        '');
      setConfSisBool('prod_cons_mult_descr', False, buscas,
      	'Habilitar na consulta de produtos procurar multiplos valores pela descrição',
        'Cada palavra informada no campo de pesquisa será pesquisada separadamente');
      setConfSisBool('prod_cons_mult_descr_pesqrapida', False, buscas,
      	'Habilitar na pesquisa rápida de produtos procurar multiplos valores pela descrição',
        'Cada palavra informada no campo de pesquisa será pesquisada separadamente');
    end;

    if vVersaoConfigBanco < 9 then
    begin
      setConfSisBlob('nf_e_excecao_anp_cims_inter_nao_contri', buscas,
      	'Informar os código ANP que não devem gerar as tags de Operação Interestadual a Consumidor Final, separar usando ","',
        '');

      setConfSisBool('equip_hab_atividadesInMetro', False, buscas,
        'Habilitar uso dos campos para atividades de reparo InMetro',
        'O sistema por padrão desabilita' + #13 +
        'Quando esta configuracao for ativada novos campos serão impressos na OS e Orcamento');
        
      setConfSisStr('equip_descrAdicionalInMetro', 'Informar descrição adicional', buscas,
       'Descrição adicional para atividades de reparo InMetro', nil);

      setConfSisBool('cl_hab_faturamento_unico_entre_empresas', False, buscas,
        'Habilitar o uso de tipo de faturamento único do cliente por CPF/CNPJ entre empresa no mesmo banco de dados. Barramento e desbarramento',
        'Informar as empresas que estarão habilitadas:' + #13 + 'Exemplo: |1|2|3|' + #13 + 'Empresas: ');

      setConfSisBool('nf_e_add_calc_recomposicao_ao_custo', False, buscas,
      	'Efetuar o cálculo da recomposição de aliquota do ICMS e adicionar ao custo das mercadorias',
        '[Configuracao]' + #13 +
        'CST_CSOSN=00,20,90,101,900' + #13 +
        'UsarPercReducaoDaNFe=S' + #13 +
        'SempreUsarCreditoDaNFe=S' + #13 +
        'CalcularIcmsQuandoZero=N' + #13 +
        'AliquotaIcmsQuandoZero=12');

      setConfSisBool('cl_usar_cond_pag_por_cliente', False, buscas,
        'Habilitar o uso das condições de pagamento por cliente', '');

      setConfSisBool('cond_pag_alterar_data_base', False, buscas,
        'Habilitar a alteração de data base ao gerar parcelas', '');

      setConfSisBool('form_pag_prest_data_base_vnd', False, buscas,
        'Na forma de pagamento usar a data base da venda mais nova', '');

      setConfSisBool('prod_cons_grid_selecionar_linha_inteira', False, buscas,
        'No cadastro de produtos deixar linha inteira selecionada', nil);

      setConfSisBool('prod_cons_grid_selecionar_linha_inteira_pesqrapida', False, buscas,
        'Na consulta rápida de produtos (Shift+F3) deixar linha inteira selecionada', nil);

      setConfSisBool('nf_serie_d_gerar_requisicao', False, buscas,
        'Ao confirmar Notafiscal série D gerar requisicao', nil);
    end;

        
    if vVersaoConfigBanco < 10 then
    begin
      //NFC-e
      setConfSisBlob('nfc_nfce_config_emissor_cliente', buscas,
        'Pacote de configurações para o PC Cliente emissor da NFC-e',
        '[NFCe_Emissao_Padrao]' + #13 +
        'TipoDeImpressaoPadrao=4' + #13 +
        '# 4 - DANFE NFC-e; 5 - DANFE NFC-e em mensagem eletrônica email, pode ser impresso também;' + #13 + #13 +
        'IndicadorDePresencaPadrao=1' + #13 +
        '# 1 - Operação presencial; 4 - NFC-e em operação com entrega a domicílio;' + #13 + #13 +
        'NaturezaDeOperacaoPadrao=5102' + #13 +
        '# Informar o codigo do CFOP para o sistema localizar a descricao no cadastro' + #13 +
        '# Ou pode ser informado o texto padrão de até 60 caracteres' + #13 + #13 +
        'ModalidadeDoFrete=9' + #13 +
        '# 0: Por conta do emitente ; 1: Por conta do destinatário/remetente;' + #13 +
        '# 2: Por conta de terceiros; 9: Sem frete;' + #13 + #13 +
        'QtdeViasEmContingencia=2' + #13 +
        '# 1 ou 2, a critério de cada UF esta obrigação poderá ser dispensada' + #13 + #13 +
        'ImpressaoResumida=N' + #13 +
        '# S ou N para ativar a impressao resumida sem itens' + #13 + #13 +
        'ImpressoraNaoFiscal=N' + #13 +
        '# S ou N para impressora não fiscal' + #13 + #13 +

        '[NFCe_CaixaAuxiliar]' + #13 +
        'EnvioAutomatico=N' + #13 + #13 +

        '[NFCe_Regras]' + #13 +
        'DescontoPadraoPorItem=S' + #13 +
        '# S - Ativa o desconto padrao nos itens; N - ativa o desconto informado no total da NFC-e;' + #13 + #13 +
        'PermitirEmissaoNFCeParaClienteContribuinteDeICMS=N' + #13 +
        '# O sistema localiza o valor do campo Indicador de Inscrição Estadual no cadastro do cliente = 1' + #13 + #13 +
        'SequenciaDePreco=0,1' + #13 +
        '# 0: Promocao quando houver; 1: A Vista; 2: 30 dias; 3: 60  dias; 4: 90: dias' + #13 + #13 +
        'TimeOutParaEmitirEmContingencia=10' + #13 +
        '# Tempo que o sistema aguarda o processamento da NFC-e para imediatamente emitir a NFC-e em contngência' + #13 + #13 +
        'InibirFormaDePagamento=N' + #13 +
        '# Inibe a forma de pagamento na criação dos pedidos quando nfc-e avulsa mesmo quando o Caixa auxiliar está desativado' + #13 + #13 +

        '[NFCe_Servicos]' + #13 +
        'PermitirServicos=N' + #13 +
        '# Permitir incluir itens serviços para a NFC-e, verificar a legislação da sua cidade' + #13 + #13 +
        'UsarRetencaoDeISS=N' + #13 +
        '# Ativa a mesma regra de retenção da NFS-e, verifica cliente e serviços configurados' + #13 + #13 +
        'IndicadorDaExigibilidade=1' + #13 +
        '# 1: Exigível; 2: Não incidência; 3: Isenção; 4: Exportação; 5: Imunidade;' + #13 +
        '# 6: Exigibilidade Suspensa por Decisão Judicial; 7: Exigibilidade Suspensa por Processo Administrativo;' + #13 + #13 +
        'IndicadorDeIncentivoFiscal=2' + #13 +
        '# 1: Sim; 2: Nao' + #13 + #13 +

        '[NFCe_Regras_Itens]' + #13 +
        'UsarDescricaoReduzida=S' + #13 +
        '# Ativa o uso da descricao reduzida do cadastro do produto' + #13 + #13 +
        'CasasDecimaisQtde=3' + #13 +
        '# Permite definir as casas decimais para o campo de quantidade, apenas na NFC-e' + #13 + #13 +

        '[NFCe_Itens_Campos_Habilitados]' + #13 +
        '# S: Habilita o campo do item: N: Desabilita o campo do item' + #13 +
        'ValorUnitario=S' + #13 +
        'ValorTotal=N' + #13 +
        'DescontoPercentual=S' + #13 +
        'DescontoEmValor=N' + #13 +
        'ValorLiquido=N' + #13 + #13 +

        '[NFCe_Regras_Itens_Grade]' + #13 +
        'UsarDescricao1Ou2=1' + #13 +
        '# Usar a primeira descricao da grade ou a segunda: Valores 1 ou 2' + #13 + #13 +
        'CaracterSeparador=-' + #13 +
        '# Caracter usado para separar a descricao do produto da descricao da grade. "|" não é permitido' + #13 + #13 +

        '[NFCe_Cartao]' + #13 +
        'HabilitarCampoAdcional=N' + #13 +
        '# Habilita o campo adicional de tipo de pagamento quando usar apenas um controle cartao' + #13 + #13 +

//        '[NFCe_Informacao_Fiscal]' + #13 +
//        'UsarMesmaRegraDaNFe=N' + #13 +
//        '# Habilita o sistema o campo de informacoes complementares usado a mesma regra da NF-e' + #13 + #13 +

        '[NFCe_Pedido]' + #13 +
        'SomarAcrecimoNoTotal=N' + #13 +
        '# Habilita o sistema somar os acrescimos dos pedidos no total do item e não usar no campo Outros Despesas da NF-e' + #13 + #13 +
        'SubtrairDescontoNoTotal=N' + #13 +
        '# Habilita o sistema subtrair os descontos dos pedidos no total do item e não usar no campo Desconto da NF-e' + #13 + #13 +

        '[NFCe_Estoque]' + #13 +
        'Conferir=S' + #13 +
        '# Habilita o sistema conferir o estoque na inclusão avulsa dos itens' + #13 + #13 +

        '');
    end;

    if vVersaoConfigBanco < 11 then
    begin  
      setConfSisBlob('nf_s_config_frete', buscas,
      	'Configurações para o valor do frete nas notas fiscais de saída',
        '[Configuracao]' + #13 +
        //Não usei, pois teria de fazer varias alterações, inclusive no SPED
        //'Somar_quando_conta_emitente=N' + #13 +
        //'Somar_quando_conta_destinatario=S' + #13 +
        //'Somar_quando_conta_terceiros=N' + #13 +
        'Somar_despesa_pedvenda_quando_conta_emitente=S' + #13 +
        'Somar_despesa_pedvenda_quando_conta_destinatario=N' + #13 +
        'Somar_despesa_pedvenda_quando_conta_terceiros=N' + #13 +
        'Entra_base_icm_quando_conta_emitente=S' + #13 +
        'Entra_base_icm_quando_conta_destinatario=N' + #13 +
        'Entra_base_icm_quando_conta_terceiros=N');
    end;

    if vVersaoConfigBanco < 12 then
    begin
      setConfSisBool('paf_ecf_alterar_vendedor', False, buscas,
        'Habilitar a tecla de atalho para alterar o vendedor na emissão do cupom fiscal', nil);

      setConfSisStr('boletos_assunto_email', 'Assunto padrão', buscas,
        'Assunto e mensagem padrão email boletos', 'Mensagem Padrão');

      setConfSisStr('contratos_clientes_assunto_email', 'Assunto padrão', buscas,
        'Assunto e mensagem padrão email contratos clientes', 'Mensagem Padrão');
    end;

    if vVersaoConfigBanco < 13 then
    begin
      setConfSisBool('ped_vnd_gerar_contas_a_pagar', False, buscas,
        'Ao confirmar Ordem de Servico gerar contas a pagar dos produtos/serviços de terceiro', nil);

      setConfSisBool('ped_vnd_gerar_contas_a_pagar_tot_serv', False, buscas,
        'Gerar contas a pagar do valor total dos produtos/serviços de terceiro', nil);

      setConfSisStr('ped_vnd_gerar_contas_a_pagar_numconta_plc', '0', buscas,
        'Código do plano de contas das despesas dos produtos/serviços de terceiro', nil);

      setConfSisBlob('ped_vnd_campos_desabilitados', buscas,
        'Campos que serão desabilitados na Requisição/Ordem de Serviço/Orçamento',
        '|Nome do campo|Nome do componente|edicao alteracao inclusao ambos editar incluir alterar|nivel|' + #13 +
        '');

      setConfSisBool('ped_vnd_exibir_unidade', False, buscas,
        'Exibir unidade na impressão do DAV', nil);

      setConfSisBool('cl_conf_vnd_vista_cliente_barrado', False, buscas,
        'Liberar vendas à vista para clientes barrados', nil);

      setConfSisBlob('cl_conf_condicoes_clientes_barrados', buscas,
        'Condições de pagamentos para clientes barrados',
        '|Nome da Condicao 1|' + #13 +
        '|Nome da Condicao 2|' + #13 +
        '|etc...|' + #13 +
        '|A VISTA|');

      setConfSisBlob('cl_conf_formpag_clientes_barrados', buscas,
        'Formas de pagamentos para clientes barrados',
        '|Nome da Forma 1|' + #13 +
        '|Nome da Forma 2|' + #13 +
        '|etc...|' + #13 +
        '|DINHEIRO|');

      setConfSisInt('nfe_cfg_ad_danfe_largura_codprod', 0, buscas,
        'Largura da coluna do código do produto para Impressão do DANFe', nil);
    end;

    if vVersaoConfigBanco < 14 then
    begin
       setConfSisBool('prog_fid_hab', False, buscas,
        'Habilitar o programa de fidelidade', nil);

       setConfSisFloat('prog_fid_valor_min_pontos_vale', 0, buscas,
        'Valor mínimo vale compra - Programa de fidelidade', nil);

       setConfSisStr('prog_fid_tipo_venda_troca', '', buscas,
        'Sigla do tipo de venda para vale troca de mercadorias (REQ) - Programa de fidelidade', nil);

       setConfSisInt('prog_fid_cod_controle', 0, buscas,
        'Código do controle configurado como baixa automática para formas de pagamento de vales (resgate/troca) - Programa de fidelidade', nil);

       setConfSisBool('ped_vnd_hab_locacao', False, buscas,
        'Habilitar o uso de locação', nil);

       setConfSisBool('conc_banc_sistema_hab', False, buscas,
        'Habilitar o uso da conciliação bancária', nil);

      with Aconfs.New do
      begin
        chave    := 'nf_s_conf_fcp';
        display_ := 'Configurações para cálculo do FCP(Fundo de combate a pobreza)';
        tag      := ';fcp;imposto;nfe;nfce;produto;ncm;icms;notafiscal;nf;';
        type1_   := typeBlob;
        with value1_b do
        begin
          Add('[FCP]');
          Add('CalcularFCP=N'                 + #13 + '#Ativa o calculo do FCP na NF-e' + #13);
          Add('UsarFCPdoEstado=S'             + #13 + '#Habilita fcp encontrado no cadastro do Estado' + #13);
          Add('UsarFCPdoNCM=N'                + #13 + '#Habilita fcp encontrado no cadastro do NCM' + #13);
          Add('UsarFCPdoProduto=N'            + #13 + '#Habilita fcp encontrado no cadastro do Produto' + #13);
          Add('UsarFCPdaTributacaoAdiciona=S' + #13 + '#Habilita fcp encontrado no cadastro de tributação adicional do produto');
        end;
      end;

      with Aconfs.New do
      begin
        chave    := 'nf_s_hab_escala_relevante';
        display_ := 'Habilitar/Configurar os campos de escala não relevante para NF-e';
        tag      := ';nfe;produto;ncm;cest;notafiscal;nf;';
        type1_   := typeBool;
      end;

      with Aconfs.New do
      begin
        chave    := 'nfe_icms_partilha_textos';
        display_ := 'Textos para apersentar valores de ICMS de partilha entre os estados na NF-e';
        tag      := ';nfe;icms;partilha;notafiscal;nf;';
        type1_   := typeBlob;
        with value1_b do
        begin
          Add('[Texto]');
          Add('FCPUFDest=ICMS relativo ao FCP da UF destino:');
          Add('ICMSUFDest=ICMS Interestadual para UF destino, já considerando o FCP na UF Destino:');
          Add('ICMSUFRemet=ICMS Interestadual para a UF do remetente:');
          Add('UsarQuebraDeLinha=N');
        end;
      end;
      

      with Aconfs.New do
      begin
        chave     := 'nf_s_icms_efetivo';
        display_  := 'Lista de estados destino para calulcar o ICMS efetivo na NF-e';
        tag       := ';nfe;icms;efetivo;notafiscal;nf;';
        type1_    := typeBlob;
        with value1_b do
        begin
          Add('[Texto]');
          Add('#Informar a lista de estados onde o calculo deve ser feito, EX(MG, SP, RJ)');
          Add('UFs=');
          Add('#Informar se deve calcular também em notas de entrada de emissão própria');
          Add('CalcularNotaEntrada=N');
        end;
      end;

      with Aconfs.New do
      begin
        chave     := 'nfe_dup_sequencial';
        display_  := 'Ativar a NFe para usar o sequencial nas faturas';
        tag       := ';nfe;icms;dup;boleto;notafiscal;nf;';
        type1_    := typeBool;
        value1_f  := 0;
      end;

      {with Aconfs.New do
      begin
        chave     := 'nfc_nfce_versao_qrcode';
        display_  := 'Alterar a versao do qrcode da NFC-e';
        tag       := ';nfce;qrcode;nfd-e;';
        type1_    := typeFloat;
        value1_f  := 0;
      end;}

      with Aconfs.New do
      begin
        chave     := 'nfe_hab_status_servico';
        display_  := 'Ativar a NFe consultar o status do serviço antes de iniciar o envio da NFe';
        tag       := ';nfe;icms;dup;boleto;notafiscal;nf;';
        type1_    := typeBool;
        value1_f  := 1;
      end;

      with Aconfs.New do
      begin
        chave     := 'nfe_pag_carta_tpintegra_padrao';
        display_  := 'Tipo de integração padrão para os pagamentos da NFe: 1-Integrado; 2-Não Integrado';
        tag       := ';nfe;icms;pagamentos;notafiscal;nf;';
        type1_    := typeInt;
        value1_f  := 1;
      end;

      with Aconfs.New do
      begin
        chave     := 'nf_s_hab_digitacao_peso';
        display_  := 'Habilita a digitação do peso na NF e desabilita o calculo automatico';
        tag       := ';peso;notafiscal;nf;';
        type1_    := typeBool;
        value1_f  := 0;
      end;

      with Aconfs.New do
      begin
        chave     := 'nf_s_obs_pad_bol';
        display_  := 'Mensagem padrão para o campo de obervações que serão geradas no boleto';
        tag       := ';boleto;notafiscal;nf;';
        type1_    := typeString;
        value1_vc := '';
        with value1_b do
          Add('Usar os identifcadores [@] para refenciar um campo da nota fiscal. Ex: "Conforme NF num [@NUM_NF]" = "Conforme NF num 33554"');
      end;

      with Aconfs.New do
      begin
        chave     := 'nfe_anp_repasse';
        display_  := 'Grupo de produtos codigo ANP com repasse interestadual';
        tag       := ';nfe;notafiscal;nf;anp;';
        type1_    := typeBlob;
        with value1_b do
          Add('210203001 320101001 320101002 320102002 320102001 320102003 820101032' + sLineBreak +
              '820101027 820101004 820101005 820101022 820101031 820101030 820101018' + sLineBreak +
              '820101020 820101021 420105001 420101005 420101004 420102005 820101003' + sLineBreak +
              '820101012 420106002 830101001 420301004 420202001 420301001 510101002' + sLineBreak +
              '510102002 510201001 510201003 510301003 510103001 510301001 820101026' + sLineBreak +
              '320102005 320201001 320103001 220102001 320301001 320103002 820101019' + sLineBreak +
              '820101014 820101006 820101016 820101015 820101025 820101017 820101013' + sLineBreak +
              '420102004 420104001 820101033 820101034 420106001 820101011 510102001' + sLineBreak +
              '420301002 410103001 410101001 410102001 430101004 510101001');
      end;

      with Aconfs.New do
      begin
        chave     := 'nfe_tag_ean_semgtin';
        display_  := 'Ativar a NFe para usar o texto "SEM GTIN" quando o EAN em branco';
        tag       := ';nfe;icms;ean;notafiscal;nf;';
        type1_    := typeBool;
        value1_f  := 0;
      end;

    end;

    if vVersaoConfigBanco < 15 then
    begin
      setConfSisStr('cl_tipo_venda', 'V', buscas,
        'Informar a sigla do tipo de venda padrão para o cadastro do cliente: Exemplo (V, A)', nil);

      setConfSisBool('prog_fid_imprimir_recibo', False, buscas,
        'Imprimir recibos ao receber documentos (REQ, OS, PRE) e realizar devoluções (DEV, NF) - Programa de fidelidade', nil);

      setConfSisStr('prog_fid_recibo_exibir_pontos_valor_ambos', 'P', buscas,
        'Exibir no extrato, recibo e relatórios do programa de fidelidade - Pontos, valor ou ambos: Exemplo (P: Pontos, V: Valor, A: Ambos) ', nil);

      with Aconfs.New do
      begin
        chave     := 'ped_vnd_ultimos_precos';
        display_  := 'Configuração para visualizar e ou utilizar ultimos preços praticados do cliente em REQ/ORC';
        tag       := ';precos;pedido;';
        type1_    := typeBool;
        value1_f  := 0;
        with value1_b do
        begin
          Add('[Conf]');
          Add('#Quantidade de itens para apresentar');
          Add('QtdeDeVisualizacaoItens=5');
          Add('#Abrir automaticamente a tela para escolher o preço durante a inclusão do item');
          Add('VerPrecosNaInclusaoNormal=N');
          Add('VerPrecosNaInclusaoVendaRapida=N');
          Add('#Habilitar o botão para utilizar o preço selecionado');
          Add('HabilitarBotaoAplicarPreco=N');
        end;
      end;
    end;

    if vVersaoConfigBanco < 15.1 then
    begin
      vDadosIni.vVersaoConfig := 15.1;
      setConfSisBool('ped_vnd_comissao_por_vnd_hab', False, buscas,
        'Habilitar o uso da comissão por venda', nil);
    end;

    if vVersaoConfigBanco < 16 then
    begin
      with Aconfs.New do
      begin
        chave     := 'nf_s_lote_faturamento';
        display_  := 'Configuração para faturamento em lote de pedidos(REQ)';
        tag       := ';lote;pedido;nf;nfe;';
        type1_    := typeBlob;
        with value1_b do
        begin
          Add('[Conf]');
          Add('#Agrupar notas dos pedidos do mesmo cliente/endereço');
          Add('AgruparNFmesmosClientes=N');
        end;
      end;
      
      with Aconfs.New do
      begin
        chave     := 'ped_vnd_valores_nf';
        display_  := 'Configuração para obter valores adicionais(tributos) de nota fiscal';
        tag       := ';nf;req;os;tributos;st;ipi;imposto;';
        type1_    := typeBlob;
        with value1_b do
        begin
          Add('[Conf_REQ]');
          Add('Ativa=N');
          Add('DefaultInclusao=S');
          Add('AbrirTelaAoSalvar=N');
          Add('#T: Terceiro, E: Emitente; D: Destinatario');
          Add('FretePorConta=D');
          Add('ICMSDesoneradoEmbutido=N');

          Add('');
          Add('[Conf_OS]');
          Add('Ativa=N');
          Add('DefaultInclusao=S');
          Add('AbrirTelaAoSalvar=N');
          Add('#T: Terceiro, E: Emitente; D: Destinatario');
          Add('FretePorConta=D');         
          Add('ICMSDesoneradoEmbutido=N');

          Add('');
          Add('[Conf_ORC]');
          Add('Ativa=N');
          Add('DefaultInclusao=S');
          Add('AbrirTelaAoSalvar=N');
          Add('#T: Terceiro, E: Emitente; D: Destinatario');
          Add('FretePorConta=D');         
          Add('ICMSDesoneradoEmbutido=N');
        end;
      end;

      with Aconfs.New do
      begin
        chave     := 'nf_s_calculo_versao';
        display_  := 'Configuração da versão dos cálculos da nota fiscal';
        tag       := ';nf;nfe;icms;icmsst;ipi;fcppis;cofins;';
        type1_    := typeInt;
        value1_f  := 1;
        value1_b.Add('Atualmente existem 2 versões, 1: Versão padrão; 2: Nova versão');
      end;
    end;

    if vVersaoConfigBanco < 17 then
    begin
      vDadosIni.vVersaoConfig := 17;

      setConfSisBool('e-commerce_hab', False, buscas,
        'Habilitar o uso do E-commerce', nil);

      with Aconfs.New('est_ajuste_conf', 'Configurações para emissão de notas fiscais de ajuste de estoque',
                      ';ajuste;estoque;', typeBlob, '', 0, 0) do
      begin
        WriteString('Conf_S', 'CFOP'    , '5927');
        WriteString('Conf_S', 'CST_ICMS', '41');
        WriteString('Conf_E', 'CFOP'    , '1949');
        WriteString('Conf_E', 'CST_ICMS', '41');
      end;
    end;

    if vVersaoConfigBanco < 17.1 then
    begin
      vDadosIni.vVersaoConfig := 17.1;

      with Aconfs.New do
      begin
        chave     := 'lote_nf_transporta';
        display_  := 'Configuração do lote de faturamento, ativa o uso do grupo de transportes';
        tag       := ';nf;nfe;tranporte;';
        type1_    := typeBool;
        value1_f  := 1;
        WriteString('Transportador',  'Codigo'    , '0');
        WriteString('Transportador',  'Modalidade', '9');
        WriteString('Transportador',  'Placa'     , '');
        WriteString('Transportador',  'PlacaUF'   , '');
        WriteString('Transportador',  'RNTC'      , '');
      end;
    end;

    if vVersaoConfigBanco < 17.2 then
    begin
      vDadosIni.vVersaoConfig := 17.2;

      setConfSisBool('e-commerce_controle_est_manual', False, buscas,
        'Utilizar controle de estoque manual para os produtos do E-commerce', nil);

      setConfSisBool('e-commerce_sincronizar_venda_rec', False, buscas,
        'Sincronizar apenas vendas recebidas no E-commerce', nil);

      setConfSisInt('e-commerce_tempo_sinc_mensagens', 0, buscas,
        'Intervalo de Verificação de Mensagens E-Commerce para o Sistema Retaguarda (Min)', nil);

      setConfSisBool('e-commerce_receber_notificacao', False, buscas,
        'Habilitar recebimento de notificações do E-Commerce',
        'Informe os códigos dos colaboradores que receberam as notificações do E-Commerce' + #13 +
        'Pode ser informado um ou mais colaboradores - Exemplo: |1|2|3|' + #13 +
        '|1|2|3|');
    end;

    if vVersaoConfigBanco < 17.3 then
    begin
      vDadosIni.vVersaoConfig := 17.3;

      with Aconfs.New do
      begin
        chave     := 'prod_leitura_peso_balanca';
        display_  := 'Configuração para leitura de etiquetas EAN13 impressas em balanças de peso';
        tag       := ';produtos;balanca;peso;etiquetas;leitura;';
        type1_    := typeBlob;
        value1_b.Add('#Abaixo a mascara da configuração e os dígitos do peso ou quantidade quando for o caso');
        WriteString( 'Conf', 'Mascara', '2CCCCC0TTTTTDV');
        WriteInteger('Conf', 'DigitosPesoOuValor', 2);
        //WriteString( 'Conf', 'AtivarNoPAFECF' , 'N');
        //WriteString( 'Conf', 'PesquisarNoCodProd' , 'N');
        value1_b.Add('');
        value1_b.Add('#Legenda para a mascara = C: codigo; 0: nao significativo; T: Total; P ou Q: Quantidade ou Peso' + sLineBreak +
                     '# Abaixo exemplo de outras mascaras' + sLineBreak +
                     '# 2CCCC0TTTTTTDV' + sLineBreak +
                     '# 2CCCC00PPPPPDV' + sLineBreak +
                     '# 2CCCC00QQQQQDV' + sLineBreak +
                     '# 2CCCCCTTTTTTDV' + sLineBreak +
                     '# 2CCCCC0PPPPPDV' + sLineBreak +
                     '# 2CCCCCCPPPPPDV');
      end;
    end;

    if vVersaoConfigBanco < 17.4 then
    begin
      vDadosIni.vVersaoConfig := 17.4;

      with Aconfs.New do
      begin
        chave := 'icms_st_rest_comp';
        display_ := 'Configuração para Complemento/Restituição do ICMS ST';
        tag := ';icmsst;icms;st;ressarcimento;complemento;restituicao;';
        type1_ := typeBlob;
        WriteString('Conf', 'ApenasOperacaoConsumidorFinal', 'S');
        WriteString('Conf', 'CFOP_ENTRADA', '');
        WriteString('Conf', 'CFOP_SAIDA'  , '');
        WriteString('Conf', 'CSTs_ENTRADA', '');
        WriteString('Conf', 'CSTs_SAIDA', '');
      end;
    end;    

    if vVersaoConfigBanco < 17.41 then
    begin
      vDadosIni.vVersaoConfig := 17.41;

      with Aconfs.New do
      begin
        chave := 'nf_icms_st_rest_comp';
        display_ := 'Configuração para emissão da nota fiscal de Complemento/Restituição do ICMS ST';
        tag := ';icmsst;icms;st;ressarcimento;complemento;restituicao;nf;';
        type1_ := typeBlob;
        WriteString('Complemento', 'CST'              , '090');
        WriteString('Complemento', 'CSOSN'            , '900');
        WriteString('Complemento', 'TextoItemICMSST'  , 'Valor do Complemento de ICMS ST %n;');
        WriteString('Complemento', 'TextoItemFCPST'   , 'Valor do Complemento de adicional de alíquota devido ao Fundo de Erradicação da Miséria - FEM %n');
        WriteString('Complemento', 'TextoInfAdicional', 'Complemento do ICMS ST refêrente ao período de %s a %s');
        value1_b.Add('');
        WriteString('Restituição', 'CST'              , '090');
        WriteString('Restituição', 'CSOSN'            , '900');
        WriteString('Restituição', 'TextoItemICMSST'  , 'Valor da Restituição de ICMS ST %n;');
        WriteString('Restituição', 'TextoItemFCPST'   , 'Valor da Restituição de adicional de alíquota devido ao Fundo de Erradicação da Miséria - FEM %n');
        WriteString('Restituição', 'TextoInfAdicional', 'Restituição do ICMS ST refêrente ao período de %s a %s');
      end;
    end;    

    if vVersaoConfigBanco < 17.42 then
    begin
      vDadosIni.vVersaoConfig := 17.42;

      with Aconfs.New do
      begin
        chave := 'nfe_tag_icmssubstituto';
        display_ := 'Configuração para gerar a tag com o Valor do ICMS Substituto, pois a ocorrencia é diferente por UF';
        tag := ';rejeicao938;icmssubstituto;nfe;';
        type1_ := typeBlob;
        WriteString('Conf', 'NFe_MG' , '0');
        value1_b.Insert(0, '# 0: Sempre; 1: Apenas quando possuir valor');// 2: Sempre producao; 3: Sempre homologacao
        value1_b.Add('');
      end;

      {with Aconfs.New do
      begin
        chave := 'nfc_nfce_tag_nt_2018_005';
        display_ := 'Data limite para o sistema gerar os campos referente a Nota Técnica 2018.005 na NFC-e. Padrão(03/06/2019)';
        tag := ';nfce;nt2018005;';
        type1_ := typeString;
        value1_vc := '03/06/2019';
      end;}

      with Aconfs.New do
      begin
        chave := 'nfe_tag_nt_2018_005';
        display_ := 'Data limite para o sistema gerar os campos referente a Nota Técnica 2018.005 na NF-e. Padrão(07/05/2019)';
        tag := ';nfe;nt2018005;';
        type1_ := typeString;
        value1_vc := '07/05/2019';
      end;
    end;

    if vVersaoConfigBanco < 17.42 then
    begin
      vDadosIni.vVersaoConfig := 17.42;

     setConfSisBool('rec_receber_financeiro', False, buscas,
        'Habilitar recebimento do recibo pelo financeiro',
        'Por padrão se o caixa auxiliar esta ativo o recebimento é feito por ele');
    end;

    if vVersaoConfigBanco < 18 then
    begin
      vDadosIni.vVersaoConfig := 18;

      setConfSisBool('prog_fid_api_hab', False, buscas,
        'Usar API - Programa de Fidelidade', nil);

      setConfSisBool('prog_fid_add_funcao_cnpj_api_hab', False, buscas,
      	'Habilitar - Integração API pessoas jurídicas', nil);
    end;

    if vVersaoConfigBanco < 19 then
    begin
      vDadosIni.vVersaoConfig := 19;
      Aconfs.New('ped_vnd_req_imprimir_abertas', 'Perguntar sobre a impressão quando salvar o Pedido de Venda mesmo se aberto',
                 ';impressao;dav;req;', typeBool, '', 0, 0);

      with Aconfs.New('ped_vnd_est_min_notificar', 'Configuração para notificar quando o produto atingir o estoque mínimo',
                      ';estoque;', typeBlob, '', 0, 0) do
      begin
        WriteString('Conf', 'AposSalvar'   , 'N');
        WriteString('Conf', 'AposConfirmar', 'N');
        WriteString('Conf', 'SempreMostrar', 'N');
        WriteString('Conf', 'MostrarTodos' , 'N');
        WriteString('Conf', 'Documentos'   , 'REQ,ORC,OS');
        value1_b.Add('');
        value1_b.Add('#SempreMostrar = S - Sempre irá apresentar todos os itens da venda com os estoques');
        value1_b.Add('#MostrarTodos  = S - Quando algum item atingir o estoque minimo ou "SempreMostrar = S" todos os itens serão apresentados, caso contrário, apenas itens atingidos');
        value1_b.Add('#Documentos    = S - Informar os documentos onde o sistema irá notificar. Ex: REQ,ORC,OS');
      end;
    end;

    if vVersaoConfigBanco < 19.1 then
    begin
      vDadosIni.vVersaoConfig := 19.1;
      with Aconfs.New('sintegra_tipo51_conf', 'Configuração para o tipo 51 do Sintegra',
                      ';sintegra;nf;ipi;notafiscal;', typeBlob, '', 0, 0) do
      begin
        WriteString('Conf', 'Considerar_CST'               , 'S');
        WriteString('Conf', 'CampoIsentoQuandoNaoTributado', 'N');
        value1_b.Add('');
        value1_b.Add('#Considerar_CST = S                 - O sistema considera os valores utilizando a base do ipi e o cst de isento(02, 52) para montar o registro');
        value1_b.Add('#CampoIsentoQuandoNaoTributado  = S - Quando a configuração acima está desabilitada então o valor da operação deve ir para o campo isento ou o campos outras');
      end;
    end;

    if vVersaoConfigBanco < 19.2 then
    begin
      vDadosIni.vVersaoConfig := 19.2;
      setConfSisBool('prog_fid_validar_vale_api', False, buscas,
          'Habilitar - Validação do Vale/Cupom (Voucher) através da API', nil);
    end;      

    if vVersaoConfigBanco < 19.21 then
    begin
      vDadosIni.vVersaoConfig := 19.21;
      with Aconfs.New('nf_piscofins_despesas', 'Configuração para base de calculo do PISCOFINS por modelo ',
                      'nf;piscofins;despesa;', typeBlob, '', 0, 0) do
      begin
        WriteString('Modelo_06', 'Campo_Desconto', 'S');
        WriteString('Modelo_06', 'Campo_Seguro'  , 'S');
        WriteString('Modelo_06', 'Campo_Outras'  , 'S');
        WriteString('Modelo_06', 'Campo_Frete'   , 'S');
        WriteString('Modelo_06', 'Campo_ValorIPI', 'S');
        value1_b.Add('');
        value1_b.Add('#Configuração para montar a base de calculo das notas fiscais de despesa(D) além do campo de valor total');
        value1_b.Add('Para configurar outros modelos basta adicionar no mesmo padrão acima, substituindo oo _06 pelo numero especifico do modelo');
      end;
    end;

    if vVersaoConfigBanco < 19.3 then
    begin
    	vDadosIni.vVersaoConfig := 19.3;

      setConfSisBool('prod_cad_alterar_estoque', False, buscas,
        'Habilitar a alteração do estoque e preço de custo médio ao incluir um novo produto', nil);
    end;

    if vVersaoConfigBanco < 19.4 then
    begin
      vDadosIni.vVersaoConfig := 19.4;
      with Aconfs.New('nf_icmsst_cest_v2', 'Configuração para utilizar a tabela CEST v2 no que diz respeito a Substituição Tributaria do ICMS',
                      ';nf;nfe;st;icms;icmsst;', typeBool, '', 0, 0) do
      begin
        WriteString('Conf', 'CalcularSTSaida', 'N');
        WriteString('Conf', 'AjustarMVA'     , 'S');
        WriteString('Conf', 'RamoAtividade'  , '3');
        WriteString('Conf', 'RamoAtividade_Fornecedor', '3');
        value1_b.Add('');
        value1_b.Add('#RamoAtividade:(1: Indústria; 2: Atacadista/Distribuidor; 3: Outros)');
        value1_b.Add('#RamoAtividade_Fornecedor:(Mesmos valores acima, usado na entrada)');
        value1_b.Add('#RamoAtividade_99999999999999:(Mesmos valores acima, usado na entrada, substituir 999... pelo CNPJ do fornecedor)');
      end;
    end;

    if vVersaoConfigBanco < 19.5 then
    begin
      vDadosIni.vVersaoConfig := 19.5;

      setConfSisBool('prodsimilar_agrupamento_hab', False, buscas,
        'Habilitar agrupamento de produtos similar',
        nil);

      setConfSisBool('prodsimilar_incluirsimilares_grupodif', False, buscas,
      	'Permitir incluir o mesmo produto similar em grupos diferentes', nil);

      setConfSisBool('prodsimilar_produtossimilaresentresi', False, buscas,
        'Permitir que todos produtos sejam similares entre si dentro do grupo',
        'Por padrão os produtos são similares apenas para o produto principal');
    end;

    if vVersaoConfigBanco < 20 then
    begin
      vDadosIni.vVersaoConfig := 20;
      with Aconfs.New('nfc_nfce_config_emissor_geral', 'Configurações gerais para emisão de NFC-e',
                      ';nfce;contingencia;nfc;', typeBlob, '', 0, 0) do
      begin
        WriteString( 'ServiceLess' , 'TempoEmSegundosVerificarNotasPendentes', '60');
        value1_b.Add('');
        WriteInteger('Manutencao'  , 'DiasHistoricoStatusServico', 15);
        WriteString( 'Manutencao'  , 'UltimoDiaManutencao', '');
        value1_b.Add('');
        WriteString( 'Contingencia', 'AtivacaoAutomatica', 'S');
        WriteInteger('Contingencia', 'QuantidadeFalhasParaAtivar', 5);
        WriteInteger('Contingencia', 'QuantidadeSucessoParaDesativar', 3);
        WriteString( 'Contingencia', 'TentarAutorizarMesmoContingenciaAtivada', 'N');
        value1_b.Add('');
        WriteString( 'Validacao_MG', 'UsarStatusServico', 'S');
        WriteInteger('Validacao_MG', 'LimiteMinutosCancelamentoNormal', 30);
        WriteInteger('Validacao_MG', 'LimiteDiasEmissaoAtrasoContigencia', 7);
        WriteInteger('Validacao_MG', 'LimiteDiasEntradaEmContigencia', 30);
        value1_b.Add('');
        WriteString( 'Token', 'UsarSessaoUsuario', 'N');
        value1_b.Add('#A sessão é invalidada quando outro login for feito');
        value1_b.Add('');
        value1_b.Add('#LimiteMinutosCancelamentoNormal: Tempo em minutos que o webservice aceita o cancelamento de uma nfce normal');
        value1_b.Add('#LimiteDiasEmissaoAtrasoContigencia: Tempo em dias que o webservice aceita a data de emissao atrasada quando a emissao for em contingencia');
        value1_b.Add('#--Caso o limite acima estrapole o sistema usa na data de emissao a hora atual');
        value1_b.Add('#LimiteDiasEntradaEmContigencia: Tempo em dias que o webserice aceita a data de entrada em contigencia');
        value1_b.Add('#--Caso o limite acima estrapole o sistema usa na data de contingencia a data de emissao');
      end;

      Aconfs.New('nfc_nfce_movimento_operador', 'Habilita o Movimento de Operador na NFC-e', ';nfcce;operador;movimento;relatorio;',
                 typeBool, '', 0, 0);

      with Aconfs.New('nfc_nfce_rel_mov_operador',
                      'Configuração para impressão do relatório de Movimento do Operador de NFC-e',
                      ';nfce;operador;movimento;', typeBlob, '', 0, 0) do
      begin
        value1_b.Add( '[Conf]'                                                         + sLineBreak +
                      'Colunas=50'                                                     + sLineBreak +
                      'ColunasCondensado=58'                                           + sLineBreak +
                      'FileNameCofigPosPrinter=PosPrinter'                             + sLineBreak +
                      ''                                                               + sLineBreak +
                      '[*MovOperador*]'                                                + sLineBreak +
                      '</ae><c>[EMPRESA.CODIGO] - [EMPRESA.NOME]|[EMPRESA.CNPJ]</c>'   + sLineBreak +
                      '</linha_simples>'                                               + sLineBreak +
                      '</ae>MOV ID:[MOV_ID]|[DATAHORAIMPRESSAO]'                       + sLineBreak +
                      'OPERADOR:[OPERADOR.CODIGO] - [OPERADOR.NOME]|CX:[CAIXA.CODIGO]' + sLineBreak +
                      '</linha_simples>'                                               + sLineBreak +
                      '</ce><n>MOVIMENTO DO OPERADOR - [MOV_STATUS]</n>'               + sLineBreak +
                      '</ae>Dia do Movimento:|[DIA_MOV]'                               + sLineBreak +
                      'Dia do Fechamento:|[DIA_FECH]'                                  + sLineBreak +
                      '</ce><n>--CONTADORES--</n>'                                     + sLineBreak +
                      '</ae>Contador geral de operacao:|[COUNT_OP]'                    + sLineBreak +
                      'Quantidade Suprimento:|[COUNT_SUPRIMENTO]'                      + sLineBreak +
                      'Quantidade Sangria:|[COUNT_SANGRIA]'                            + sLineBreak +
                      'Quantidade NFC-e Autorizadas:|[COUNT_AUTORIZADAS]'              + sLineBreak +
                      'Quantidade NFC-e Canceladas:|[COUNT_CANCELADAS]'                + sLineBreak +
                      'Quantidade NFC-e Inutilizadas:|[COUNT_INUTILIZADAS]'            + sLineBreak +
                      'Quantidade NFC-e Denegadas:|[COUNT_DENEGADAS]'                  + sLineBreak +
                      'Quantidade NFC-e em Contigencia:|[COUNT_CONTINGENCIAS]'         + sLineBreak +
                      'Quantidade NFC-e em Emissao*:|[COUNT_ENVIANDO]'                 + sLineBreak +
                      'Quantidade NFC-e Pendentes:|[COUNT_PENDENTE]'                   + sLineBreak +
                      '</ce><n>-- TOTALIZADORES NFC-e --</n>'                          + sLineBreak +
                      '</ae>VENDA BRUTA:|[VPROD]'                                      + sLineBreak +
                      'DESCONTO:|[VDESC]'                                              + sLineBreak +
                      'FRETE:|[VFRETE]'                                                + sLineBreak +
                      'SEGURO:|[VSEG]'                                                 + sLineBreak +
                      'OUTROS:|[VOUTRO]'                                               + sLineBreak +
                      'VENDA LIQUIDA:|[VNF]'                                           + sLineBreak +
                      '</ce><n>-- OUTROS TOTALIZADORES --</n>'                         + sLineBreak +
                      '</ae>SUPRIMENTO:|[VSUPRIMENTO]'                                 + sLineBreak +
                      'SANGRIA:|[VSANGRIA]'                                            + sLineBreak +
                      '</ce><n>-- TOTALIZADOR GERAL --</n>'                            + sLineBreak +
                      '</ae>TOTAL GERAL:|[VTOTALGERAL]'                                + sLineBreak +
                      '</ce><n>--MEIOS DE PAGAMENTO--</n>'                             + sLineBreak +
                      '<c>#ctrl tpag Nome|Valor</c>'                                   + sLineBreak +
                      '[/MEIOS_DE_PAGAMENTO]'                                          + sLineBreak +
                      '</linha_simples>'                                               + sLineBreak +
                      'CAIXA:[CAIXA.CODIGO]|LJ:[EMPRESA.CODIGO]'                       + sLineBreak +
                      '</linha_simples>'                                               + sLineBreak +
                      '</corte_total>'                                                 + sLineBreak +
                      '[*/MovOperador*]'                                               + sLineBreak +
                      ''                                                               + sLineBreak +
                      '[*MEIOS_DE_PAGAMENTO*]'                                         + sLineBreak +
                      '</ae><c>cod_controle tpag nome_ctrl|vpag</c>'                   + sLineBreak +
                      '[*/MEIOS_DE_PAGAMENTO*]'                                        + sLineBreak +
                      ''                                                               + sLineBreak +
                      '[*NAOUSADO*]'                                                   + sLineBreak +
                      'Contador geral de operacao:|[COUNT_OP]'                         + sLineBreak +
                      '[*/NAOUSADO*]');

      end;

      Aconf := TConfig_sistema_class.getConf('nfc_nfce_config_emissor_cliente', buscas, vDadosIni.cod_empresa);
      if Assigned(Aconf) then with Aconf do
      begin
        if not GetIniFile.ValueExists('NFCe_Regras', 'ConverterEmContingenciaAutomaticamente') then
          InsertLineConf('NFCe_Regras', 'ConverterEmContingenciaAutomaticamente', 'N');

        if not GetIniFile.ValueExists('NFCe_Regras', 'RejeitarNcmNaoCadastradoNoIBPT') then
          Aconf.InsertLineConf('NFCe_Regras', 'RejeitarNcmNaoCadastradoNoIBPT', 'S');

        if not GetIniFile.ValueExists('NFCe_Regras', 'RejeitarSemCestParaCSTs') then
          InsertLineConf('NFCe_Regras', 'RejeitarSemCestParaCSTs', '10,30,60,70');

        if not GetIniFile.ValueExists('NFCe_Emissao_Padrao', 'FormatoA4') then
          InsertLineConf('NFCe_Emissao_Padrao', 'FormatoA4', 'N');

        if not GetIniFile.ValueExists('NFCe_Regras', 'QtdeParaAvisoNotasPendentes') then
          InsertLineConf('NFCe_Regras', 'QtdeParaAvisoNotasPendentes', '15');

        if not GetIniFile.ValueExists('NFCe_Regras', 'QtdeDiasParaAvisoNotasPendentes') then
          InsertLineConf('NFCe_Regras', 'QtdeDiasParaAvisoNotasPendentes', '15');

        if not GetIniFile.ValueExists('NFCe_Regras', 'ModoSimplificadoAtivo') then
          InsertLineConf('NFCe_Regras', 'ModoSimplificadoAtivo', 'S');

        Aconf.SaveConfDB(buscas);
      end;
      Aconf.Free;
    end;
    
    if vVersaoConfigBanco < 20.1 then
    begin
      vDadosIni.vVersaoConfig := 20.1;
      with Aconfs.New('nfs_obscont_camposad',
                      'Configuração para campos padrão de Observações do Contribuinte na NFe',
                      ';nfe;', typeBlob, '', vDadosIni.cod_empresa, 0) do
        WriteString('Conf', 'CamposAdicionais', '');
    end;

    if vVersaoConfigBanco < 20.2 then
    begin
      vDadosIni.vVersaoConfig := 20.2;
      with Aconfs.New('rec_exibicao_recebimento',
                      'Configuração para onde exibir a mensagem quando o cliente possui vale compra',
                      ';recibo;antecipado;cxl;', typeBlob, '', vDadosIni.cod_empresa, 0) do
      begin
        WriteString('Onde', 'FormaDePagamento', 'S');
        WriteString('Onde', 'ContasAReceber'  , 'N');
      end;
    end;

    if vVersaoConfigBanco < 21 then
    begin
      vDadosIni.vVersaoConfig := 21;
      Aconfs.New('prod_sub_grupo_vinculado',
                 'Configuração para manter o subgrupo vinculado ao grupo de produtos',
                 ';produtos;grupo;subgrupo;', typeBool, '', vDadosIni.cod_empresa,
                 IfThen(vDadosIni.vSubGrupoVinc = 'S', 1));
    end;

    if vVersaoConfigBanco < 21.1 then
    begin
      vDadosIni.vVersaoConfig := 21.1;

      setConfSisBool('e-commerce_grade_codbarras', False, buscas,
        'Habilitar o uso da grade no código de barras (E-commerce)', nil);
    end;

    if VersaoBancoMenor(21.2) then
    begin
      Aconf := TConfig_sistema_class.getConf('nfc_nfce_config_emissor_cliente', buscas, vDadosIni.cod_empresa);
      if Assigned(Aconf) then with Aconf do
      begin
        AtivarMapeamentoKeys;
        ReadString('NFCe_CaixaAuxiliar', 'EnvioAutomatico', 'N');
        if KesyChanges then
          SaveConfDB(buscas);
      end;
    end;

    if VersaoBancoMenor(21.3) then
    begin
      vDadosIni.vVersaoConfig := 21.3;

      setConfSisBlob('prod_ean_prefixos_invalidos', buscas,
                     'Informar os prefixos inválidos de EAN''s separados por vírgula', '');
    end;

    if VersaoBancoMenor(21.4) then
    begin
      Aconf := TConfig_sistema_class.getConf('nfc_nfce_config_emissor_cliente', buscas, vDadosIni.cod_empresa);
      if Assigned(Aconf) then with Aconf do
      begin
        AtivarMapeamentoKeys;
        ReadString('NFCe_Pedido', 'AutorizarComPagamentoAutomaticamente', 'N');
        ReadString('NFCe_Pedido', 'EmitirAutomaticamente', 'N');
        ReadString('NFCe_Pedido', 'ImprimirAutomaticamente', 'N');
        if KesyChanges then
          SaveConfDB(buscas);
      end;

      with Aconfs.New('nfc_nfce_rejeicoes_sem_ctrl',
                      'Código das rejeições que o sistema não pode controlar para evitar consumo indevido',
                      ';nfce;rejeicao;', typeBlob, '', vDadosIni.cod_empresa, 0) do
        value1_b.Text := '230,231,240,244,245,246,781';

    end;

    if VersaoBancoMenor(22) then
    begin
      setConfSisBool('importacao_xml_cad_prod_mais_de_uma_vez', False, buscas,
       'Permitir cadastrar produto mais de uma vez', nil);

      setConfSisBlob('importacao_xml_conversao_csosn_cst', buscas,
        'Tabela de equivalência: CSOSN x CST, ao cadastrar os produtos pela importação do xml o CST será atribuído através da relação CSOSN x CST para empresas no Regime Simples Nacional',
        '|Informar CSOSN| Informar o sem CST sem o primeiro dígito|' + #13 +
        '|101|00|' + #13 +
        '|102|00|' + #13 +
        '|103|40|' + #13 +
        '|201|10|' + #13 +
        '|202|10|' + #13 +
        '|203|30|' + #13 +
        '|300|40|' + #13 +
        '|400|41|' + #13 +
        '|500|60|' + #13 +
        '|900|90|');

      setConfSisBool('importacao_xml_conversao_cst_regra_geral_tabela_a', False, buscas,
        'Habilitar uso de conversao automatica de CST de ICMS nas entradas. Regra geral Tabela A',
        '|Digito de Origem (CST) constante na NF, XML: [0,1,2,3,4,5,6,7,8]| Informar o digito origem (CST) a atribuir|' + #13 +
        '|2|1|');

      setConfSisBool('importacao_xml_conversao_cst_regra_geral_tabela_b', False, buscas,
        'Habilitar uso de conversao automatica de CST de ICMS nas entradas. Regra geral Tabela B',
        '|CST constante na NF, XML| Informar o CST a atribuir após a confirmação da NF|' + #13 +
        '|10|60|' + #13 +
        '|30|60|' + #13 +
        '|70|60|');

      setConfSisBool('importacao_xml_usa_anexoxv_operacao_st', True, buscas,
        'Habilitar o uso do anexo XV para operações ST',
        '[Conf]' + #13 +
        'CFOP padrão ST usando o anexo XV=5405');
    end;

    if VersaoBancoMenor(22.1) then
    begin
	    setConfSisInt('env_not_financ_tempo_sinc_mensagens', 0, buscas,
        'Intervalo de Verificação de Mensagens do Serviço de Notificação do Financeiro para o Sistema Retaguarda (Min)', nil);

      setConfSisBool('env_not_financ_receber_notificacao', False, buscas,
        'Habilitar recebimento de notificações do Serviço de Notificação do Financeiro',
        'Informe os códigos dos colaboradores que receberam as notificações do Serviço de Notificação do Financeiro' + #13 +
        'Pode ser informado um ou mais colaboradores - Exemplo: |1|2|3|' + #13 +
        '|1|2|3|');
    end;

    if VersaoBancoMenor(23) then
    begin
      Aconfs.New('nf_piscofins_cst_05_revenda_base_zero',
                 'Configuração para deixar a base e valor do PIS/COFINS sempre igual a 0(zero) no CST = 05',
                 ';nfe;nfce;pafecf;piscofins;', typeBool,
                 'Quando o contribuinte substituído efetuar operações de revenda', vDadosIni.cod_empresa, 1);
    end;

    if VersaoBancoMenor(24) then
    begin
      with Aconfs.New('nf_campos_default',
                      'Configuração para informar valores default para campos da NF',
                      ';nfe;emissaopropria;default;', typeBlob, '', vDadosIni.cod_empresa, 1) do
      begin
        WriteInteger('Saida', 'IndicadorDePresenca', 1);
        value1_b.Add('#Valores válidos: 0, 1, 2, 3, 5, 9' + sLineBreak);

        WriteInteger('Entrada', 'IndicadorDePresenca', 1);
        //Se for necessário outros campos podem ser acrescidos aqui, ex: tipo de desconto, frete seguro e outros
      end;
    end;


    if VersaoBancoMenor(24.1) then
    begin
      setConfSisBool('comercio_aberto_hab', False, buscas,
        'Habilitar o uso do Comércio Aberto', nil);

      setConfSisBool('comercio_aberto_controle_est_manual', False, buscas,
        'Utilizar controle de estoque manual para os produtos do Comércio Aberto', nil);

      setConfSisStr('comercio_aberto_receber_notificacao', '1,2,3', buscas,
        'Habilitar sincronização e recebimento de notificações do Comércio Aberto',
        'Informe os códigos dos colaboradores que receberam as notificações do Comércio Aberto' + #13 +
        'Pode ser informado um ou mais colaboradores - Exemplo: 1,2,3');
    end;

    if VersaoBancoMenor(24.11) then
    begin
      with Aconfs.New('ped_vnd_exibir_devolucao',
                      'Configuração para exibição de devoluções dos pedidos',
                      ';pedvenda;devolucao;', typeBool, '', vDadosIni.cod_empresa, 0) do
      begin
        WriteString('Impressao', 'QuandoImprimir', 'T');
        value1_b.Add('# S: Sempre; N: Nunca; T: Quando a opção em Tela for selecionada');
        WriteString('Impressao', 'LinhaAdicional', 'S');
        WriteString('Impressao', 'IdDevolucao', 'Dev');
        WriteString('Impressao', 'IdCondicional', 'Cond');
        WriteString('Impressao', 'SinalDevolucao', '_#_');
        WriteString('Impressao', 'SinalCondicional', '_**_');
        value1_b.Add('# SinalDevolucao e SinalCondicional correspondem aos caracteres que serão adicionados na impressão da linha adicional');
      end;
    end;

    if VersaoBancoMenor(24.12) then
    begin
    	setConfSisInt('e-commerce_id_pedido', 0, buscas,
        'Serviço sincronizar pedidos a partir do Id', nil);
    end;

    if VersaoBancoMenor(24.13) then
    begin
      setConfSisBool('ped_vnd_receber_financeiro', False, buscas,
        'Habilitar recebimento das vendas pelo financeiro',
        'Por padrão se o caixa auxiliar esta ativo o recebimento é feito por ele');

      setConfSisBool('vei_receber_financeiro', False, buscas,
        'Habilitar recebimento das saídas de veículo pelo financeiro',
        'Por padrão se o caixa auxiliar esta ativo o recebimento é feito por ele');
    end;

    if VersaoBancoMenor(24.14) then
    begin
      Aconf := TCfg_sis.getConf('hw_nbackup', buscas, 0);
      if Aconf.chave = '' then
      begin
        Aconf.Free;
        Aconf := TCfg_sis.Create;
        try
        with Aconf do
        begin
          chave := 'hw_nbackup';
          display_ := 'Configurações para uso do NBackup';
          tag := ';bkp;backup;nbackup;';
          type1_ := typeBool;
          value1_f := 0;
          WriteString('Backup_Completo_level_0'   , 'Tipo', 'M');
          WriteString('Backup_Incremental_level_1', 'Tipo', 'X');
          WriteString('Backup_Incremental_level_2', 'Tipo', 'D');
          WriteString('Backup_Incremental_level_3', 'Tipo', 'H');
          value1_b.Add('#');
          value1_b.Add('# -- O backup completo não permite tipo Hora a hora');
          value1_b.Add('# -- E somente 1 tipo de backup incremental pode ser usado quando for X, D ou S, ou seja');
          value1_b.Add('# -- deve-se escolher um backup incremental, quinzenal, decendial ou semanal somente');
          value1_b.Add('');
          WriteString('Configuracao', 'Executar_no_servidor', 'N');
          WriteString('Configuracao', 'Diretorio_backup_padrao', '');
          WriteString('Configuracao', 'Diretorio_backup_especifico_level_0', '');
          WriteString('Configuracao', 'Diretorio_backup_especifico_level_1', '');
          WriteString('Configuracao', 'Diretorio_backup_especifico_level_2', '');
          WriteString('Configuracao', 'Diretorio_backup_especifico_level_3', '');
          WriteString('Configuracao', 'Anexar_ano_nome_bkp', '');
          WriteString('Configuracao', 'Firebird_User', '');
          WriteString('Configuracao', 'Firebird_Password', '');
          WriteString('Configuracao', 'Task_Schedule_Id', '');
          WriteString('Configuracao', 'PC_Responsavel_SerialHD', '');
          WriteString('Configuracao', 'Estrutura_pasta', '0');
          value1_b.Add('#');
          value1_b.Add('# -- Executar_no_servidor=S: Configura o nbackup para usar o servidor no lugar da maquina local');
          value1_b.Add('# -- Diretorio_backup_padrao=D:\pastabkp');
          value1_b.Add('# -- Diretorio_backup_especifico_level_[0 1 2 3]=D:\pastabkp(se não preenchido vai utilizar a pasta do backup padrao)');
          value1_b.Add('# -- Anexar_ano_nome_bkp=S, Anexa o ano no nome do arquivo de backup, EC: Hwauto-A2020...nbk');
          value1_b.Add('# -- Firebird_User e Firebird_Password podem ficar e branco e o usuario e senha padrão serão utilizados');
          value1_b.Add('# -- Firebird_Password se informado deve ser codificado(Obter codificação com HW)');
          value1_b.Add('# -- Task_Schedule_Id usado identificar no agendador de tarefas, por padrão quando nao informado fica Hwauto,');
          value1_b.Add('# --  vai servir quando a empresa possuir acesso a mais bancos de dados nas maquinas. Ex: Matriz, Filial 1, etc');
          value1_b.Add('# -- PC_Responsavel_SerialHD identifica o PC responsavel do backup, normalmente o servidor,' +
                       '# --  caso o IP ou Nome do PC não coincida com o host no endereço do banco o sistema vai usar o serial do hd');
          value1_b.Add('#');
          value1_b.Add('# -- Estrutura_pasta conforme abaixo, valores validos: 0,1,2,3,4');
          value1_b.Add('# -- 0: Não usa diretorio, salva apenas na pasta de backup');
          value1_b.Add('# -- 1: AAAA\MM\DD - Separa por pastas, ano, mes e dia');
          value1_b.Add('# -- 2: AAAA\MM-DD - Separa por pastas, ano, mes e dia em uma unica pasta');
          value1_b.Add('# -- 3: AAAA-MM\DD - Separa por pastas, ano e mes em uma unica pasta e dia separado');
          value1_b.Add('# -- 4: AAAA-MM-DD - Separa por pastas, ano, mes e dia em uma unica pasta');
          value1_b.Add('# -- 5: AAAA\MM    - Separa por pastas, ano e mes somente');
          value1_b.Add('# -- 6: AAAA-MM    - Separa por pastas, ano e mes em uma unica pasta');
          value1_b.Add('');
          WriteString('Quando_Backup_Diario_Level_0_Ativo', 'Formato_sufixo', 'S');
          value1_b.Add('#');
          value1_b.Add('# -- Vai anexar o o sufixo no nome do arquivo de backup conforme abaixo, se nao informado usa o padrao');
          value1_b.Add('# -- S: Dia da semana, ex: seg, ter, qua, qui');
          value1_b.Add('# -- M: Dia do mes, ex: 01, 02, 03, 04');
          value1_b.Add('');
          WriteString('Hora_monitoramento', 'Inicial'                        , '7:00');
          WriteString('Hora_monitoramento', 'Final'                          , '19:00');
          WriteString('Hora_monitoramento', 'Tipo_Diferente_Hora_comeca_apos', '');
          WriteString('Hora_monitoramento', 'Intervalo_em_horas'             , '1');
          value1_b.Add('#');
          value1_b.Add('# -- Acima é o período monitorado, Inicial e final de preenchimento obrigatorios quando 1 deles for preenchido');
          value1_b.Add('# -- Se o período não for informado sempre vai existir um backup quando disparar o gatilho configurado');
          value1_b.Add('# -- O Intervalo não pode ser superior a 12 horas, consequentemente o backup tipo H(hora a hora) será afetado por esse intervalo');
          value1_b.Add('# -- Tipo_Diferente_Hora_comeca_apos vai fazer que os backups diferentes de Hora a Hora só seja efetuados após esse horario configurado');
          value1_b.Add('# --   Ex: Desejo que os backups Diario, Semanal, Mensal, etc sejam feitos somente apos o expediente, as 18:00, entao preencher esse campo com 18:00');

          value1_b.Insert(0, '');
          value1_b.Insert(0, '#                                S: Semanal, D: Diario, H: Hora a hora');
          value1_b.Insert(0, '# Tipos de Backup usados abaixo: M: Mensal, Q: Quinzenal, X: Decendial');
          value1_b.Insert(0, '#');
          value1_b.Insert(0, '# -- Para mais informações sobre o NBackup acesse: https://firebirdsql.org/manual/nbackup.html, ou a base de conhecimento HW');
          value1_b.Insert(0, '# -- O endereço do banco de dados deve ser configurado com o nome ou IP do Servidor, mesmo se o banco estiver local');
          value1_b.Insert(0, '# -- Essa configuração vai estruturar o Script e enviar o comando para o NBackup');
          value1_b.Insert(0, '# -- O Nbackup é uma ferramenta de backup fornecida pelo próprio Firebird em sua instalação');

          SaveConfDB(buscas);
        end;
        finally
          FreeAndNil(Aconf);
        end;
      end;
    end;

    if VersaoBancoMenor(24.15) then
    begin
	    setConfSisBool('e-commerce_sincr_todos_prod_kit', True, buscas,
  	      'Sincronizar todos produtos do kit ao E-commerce, caso informe não deverá informar os itens que serão sincronizados',
          'Por padrão todos produtos do kit são sincronizados ao E-Commerce');
    end;

    if VersaoBancoMenor(24.16) then
    begin
    	setConfSisFloat('e-commerce_kit_desconto_permitido', 5.00, buscas,
        'Máximo de desconto permitido para kit do E-Commerce (%)', nil);
    end;

    if VersaoBancoMenor(24.17) then
    begin
	    setConfSisBool('importacao_xml_cad_prod_com_mesmo_codigo', False, buscas,
  	    'Permitir cadastrar produto com mesmo código', nil);
    end;

    if VersaoBancoMenor(24.18) then
      with Aconfs.New('ped_vnd_imprimir_desc_acresc_item',
                      'Configuração para impressão de Desconto e acréscimo no DAV RDprint',
                      ';dav;pedido;os;orcamento;impressao;acrescimo;desconto;', typeInt,
                      '' , vDadosIni.cod_empresa, 0) do
      begin
        WriteString('Conf', 'PercentualAcrescimoDescontoEmTotais', 'N');
        value1_b.Add('Valores válidos para a configuração principal' + sLineBreak +
                     ' 0 - Nenhum desconto ou acrescimo' + sLineBreak +
                     ' 1 - Desconto e acrescimo em valor' + sLineBreak +
                     ' 2 - Desconto e acrescimo em percentual');
      end;

    if VersaoBancoMenor(24.19) then
    begin
    	setConfSisBool('importacao_xml_cad_unico_produto_por_codigo', False, buscas,
  	    'Habilitar o cadastro de único produto por código (CProd)',
        'Por padrão é cadastrado todos itens sem vínculo, mesmo os produtos com código (CProd) repetido');
    end;

    if VersaoBancoMenor(24.20) then
      with TCfg_sis.getConf('ped_vnd_imprimir_desc_acresc_item', buscas, vDadosIni.cod_empresa) do
      begin
        if (chave = 'ped_vnd_imprimir_desc_acresc_item') then
        begin
          AtivarMapeamentoKeys;
          ReadString('Conf', 'PercentualAcrescimoDescontoEmTotais', 'N');
          value1_b.Add('Valores válidos para a configuração principal' + sLineBreak +
                       ' 0 - Nenhum desconto ou acrescimo' + sLineBreak +
                       ' 1 - Desconto e acrescimo em valor' + sLineBreak +
                       ' 2 - Desconto e acrescimo em percentual');
          if KesyChanges then
            SaveConfDB(buscas);
        end;
        Free;
      end;

    if VersaoBancoMenor(24.21) then
      with Aconfs.New('nfc_nfce_correlacao_cst_indevido',
                      'Correlação para cst de icms(10,30,50,51,70 e 90) e csosn(900) quando não aceitos pela UF',
                      ';nfce;cst;csosn;', typeBlob, '', vDadosIni.cod_empresa, 0) do
      begin
        WriteString('Conf', 'Cst_10', '00');
        WriteString('Conf', 'Cst_30', '40');
        WriteString('Conf', 'Cst_50', '90');
        WriteString('Conf', 'Cst_51', '90');
        WriteString('Conf', 'Cst_70', '20');
        WriteString('Conf', 'Cst_90', '90');
        //value1_b.Add('#Para cada cst da lista(10,30,50,51,70 e 90) preencher CST_NN=NN, ex 30 para 40: Cst_30=40');

        WriteString('Conf', 'Csosn_900', '900');
        //value1_b.Add('#A critério de cada uf essa poderá rejeitar NFCe s com CSOSN 900. Ajustar caso necessário');
      end;

    if VersaoBancoMenor(24.22) then
      with TCfg_sis.getConf('nfc_nfce_config_emissor_geral', buscas, vDadosIni.cod_empresa) do
      begin
        if (chave = 'nfc_nfce_config_emissor_geral') then
        begin
          AtivarMapeamentoKeys;
          ReadString('Token', 'UsarSessaoUsuario', 'N');
          value1_b.Add('#A sessão é invalidada quando outro login for feito');
          if KesyChanges then
            SaveConfDB(buscas);
        end;
        Free;
      end;

    if VersaoBancoMenor(24.23) then
      with Aconfs.New('prest_recibo_nao_fiscal',
                      'Configuração para impressão de recibo de prestações no CXl para impressora não fiscal',
                      ';impressao;naofiscal;cxl;recibo;', typeBool, '', vDadosIni.cod_empresa, 0) do
      begin
        value1_b.Add( '[Conf]'                                                                                                     + sLineBreak +
                      'Colunas=50'                                                                                                 + sLineBreak +
                      'ColunasCondensado=58'                                                                                       + sLineBreak +
                      'FileNameCofigPosPrinter=PosPrinter'                                                                         + sLineBreak +
                      'ReciboLote=ReciboLote'                                                                                      + sLineBreak +
                      'ReciboIndividual=ReciboIndividual'                                                                          + sLineBreak +
                      ''                                                                                                           + sLineBreak +
                      '[*ReciboLote*]'                                                                                             + sLineBreak +
                      '<c><n>{PADL3[/EMPRESA.COD_EMPRESA]}-[/EMPRESA.IDENTIFICACAO_EMP]|CNPJ: {CPFCNPJ[/EMPRESA.CGC_EMP]}</n></c>' + sLineBreak +
                      '<c>[/EMPRESA.ENDRECO_EMP], [/EMPRESA.NUMERO_END], - [/EMPRESA.COMPLEMENTO_EMP], [/EMPRESA.CIDADE_EMP] </c>' + sLineBreak +
                      '<c>FONE: [/EMPRESA.TELEFONE_EMP]|[/NOW]</c>'                                                                + sLineBreak +
                      '</linha_simples>'                                                                                           + sLineBreak +
                      '</ce><n>COMPROVANTE DE RECEBIMENTO</n>'                                                                     + sLineBreak +
                      ''                                                                                                           + sLineBreak +
                      '</ce>NÃO É DOCUMENTO FISCAL'                                                                                + sLineBreak +
                      ''                                                                                                           + sLineBreak +
                      '</ae>RECIBO: Lote [/PRESTACAO.LOTE_CXL]'                                                                    + sLineBreak +
                      '</ae>CLIENTE: {PADL6[/PRESTACAO.COD_CLIENTE]}'                                                              + sLineBreak +
                      ''                                                                                                           + sLineBreak +
                      '<c></ae>Recebemos de [/PRESTACAO.NOME_C] '                                                                  + sLineBreak +
                      'A importancia de R$ [/VALORPAGO] ({EXTENSO[/VALORPAGO]})'                                                   + sLineBreak +
                      ''                                                                                                           + sLineBreak +
                      'Referente as notas promissórias'                                                                            + sLineBreak +
                      '#Doc|Vencimento</c>'                                                                                        + sLineBreak +
                      '[/PRESTACOES]'                                                                                              + sLineBreak +
                      ''                                                                                                           + sLineBreak +
                      '</ce>Governador Valadares, [/DATE]'                                                                         + sLineBreak +
                      ''                                                                                                           + sLineBreak +
                      '</ce>__________________________________'                                                                    + sLineBreak +
                      '</ce>[/EMPRESA.NOME_EMP]'                                                                                   + sLineBreak +
                      ''                                                                                                           + sLineBreak +
                      '</linha_simples>'                                                                                           + sLineBreak +
                      '</lf>'                                                                                                      + sLineBreak +
                      '</corte_total>'                                                                                             + sLineBreak +
                      '[*/ReciboLote*]'                                                                                            + sLineBreak +
                      ''                                                                                                           + sLineBreak +
                      '[*ReciboIndividual*]'                                                                                       + sLineBreak +
                      '<c><n>{PADL3[/EMPRESA.COD_EMPRESA]}-[/EMPRESA.IDENTIFICACAO_EMP]|CNPJ: {CPFCNPJ[/EMPRESA.CGC_EMP]}</n></c>' + sLineBreak +
                      '<c>[/EMPRESA.ENDRECO_EMP], [/EMPRESA.NUMERO_END], - [/EMPRESA.COMPLEMENTO_EMP], [/EMPRESA.CIDADE_EMP] </c>' + sLineBreak +
                      '<c>FONE: [/EMPRESA.TELEFONE_EMP]|[/NOW]</c>'                                                                + sLineBreak +
                      '</linha_simples>'                                                                                           + sLineBreak +
                      '</ce><n>COMPROVANTE DE RECEBIMENTO</n>'                                                                     + sLineBreak +
                      ''                                                                                                           + sLineBreak +
                      '</ce>NÃO É DOCUMENTO FISCAL'                                                                                + sLineBreak +
                      ''                                                                                                           + sLineBreak +
                      '</ae>RECIBO: [/PRESTACAO.N_DOC_C]'                                                                          + sLineBreak +
                      '</ae>CLIENTE: {PADL6[/PRESTACAO.COD_CLIENTE]}'                                                              + sLineBreak +
                      ''                                                                                                           + sLineBreak +
                      '<c></ae>Recebemos de: [/PRESTACAO.NOME_C] '                                                                 + sLineBreak +
                      'A importancia de R$ [/PRESTACAO.VL_RQ_PG_CXL]({EXTENSO[/PRESTACAO.VL_RQ_PG_CXL]})'                          + sLineBreak +
                      'Referente a nota promissória [/PRESTACAO.N_DOC_C] com vencimento em [/PRESTACAO.DATA_VENC_C]</c>'           + sLineBreak +
                      ''                                                                                                           + sLineBreak +
                      '</ce>Governador Valadares, [/DATE]'                                                                         + sLineBreak +
                      ''                                                                                                           + sLineBreak +
                      '</ce>__________________________________'                                                                    + sLineBreak +
                      '</ce>[/EMPRESA.NOME_EMP]'                                                                                   + sLineBreak +
                      ''                                                                                                           + sLineBreak +
                      '</linha_simples>'                                                                                           + sLineBreak +
                      ''                                                                                                           + sLineBreak +
                      '</corte_total>'                                                                                             + sLineBreak +
                      '[*/ReciboIndividual*]'                                                                                      + sLineBreak +
                      ''                                                                                                           + sLineBreak +
                      '[*PRESTACOES*]'                                                                                             + sLineBreak +
                      '<c>[/PRESTACAO.N_DOC_C]|[/PRESTACAO.DATA_VENC_C]</c>'                                                       + sLineBreak +
                      '[*/PRESTACOES*]');
      end;

    if VersaoBancoMenor(24.24) then
    begin
      Aconf := TCfg_sis.getConf('nf_piscofins_despesas', buscas, vDadosIni.cod_empresa);
      try
      with Aconfs.New('nf_piscofins_bases', 'Configuração para base de calculo do PISCOFINS por modelo ',
                      'nf;piscofins;bases;', typeBlob, '', 0, 0) do
      begin
        WriteString('Entrada_Modelo_06', 'Campo_Desconto', Aconf.ReadString('Modelo_06', 'Campo_Desconto', 'S'));
        WriteString('Entrada_Modelo_06', 'Campo_Seguro'  , Aconf.ReadString('Modelo_06', 'Campo_Seguro'  , 'S'));
        WriteString('Entrada_Modelo_06', 'Campo_Outras'  , Aconf.ReadString('Modelo_06', 'Campo_Outras'  , 'S'));
        WriteString('Entrada_Modelo_06', 'Campo_Frete'   , Aconf.ReadString('Modelo_06', 'Campo_Frete'   , 'S'));
        WriteString('Entrada_Modelo_06', 'Campo_ValorIPI', Aconf.ReadString('Modelo_06', 'Campo_ValorIPI', 'S'));
        value1_b.Add('');
        value1_b.Add('#Configuração para montar a base de calculo das notas fiscais por modelo além do campo de valor total');
        value1_b.Add('#Para configurar outros modelos basta adicionar no mesmo padrão acima, substituindo o "_06" pelo numero especifico do modelo, e a palavra "Saida" quando for o caso');
        value1_b.Add('#Ex: [Saida_Modelo_01]');
        value1_b.Add('#Não coloque mais que duas casas para o modelo numerico, por exemplo "Entrada_Modelo_006" ou "Entrada_Modelo_6" o sistema não vai interpretar');
        value1_b.Add('#Quando não existir o modelo configurado aqui o sistema adota o seguinte padrão');
        value1_b.Add('#Base Entrada = Total bruto - Campo_Desconto + Campo_Seguro + Campo_Outras + Campo_Frete + Campo_ValorIPI');
        value1_b.Add('#Base Saida   = Total bruto - Campo_Desconto + Campo_Seguro + Campo_Outras + Campo_Frete');
      end;
      if Aconf.ativo = 1 then
      begin
        Aconf.ativo := 0;
        Aconf.SaveConfDB(buscas);
      end;
      finally
        FreeAndNil(Aconf);
      end;
    end;
    { Foi unificada na conf prod_precos
    if VersaoBancoMenor(24.25) then
      with Aconfs.New('nf_e_alteracao_preco', 'Configurações sobre alteração de preço na entrada da nota fiscal juntamente com o processo NF0223',
                      'nf;entrada;preco;', typeBool, '', 0, 0) do
      begin
        WriteString('Conf', 'AlterarPrecoAutomaticoVendaEntradaNF', vDadosIni.vAlteraPrecoVendaEntradaNF);
        WriteString('Conf', 'UsarPercentualAdicinalProdEntrada', vDadosIni.vUsarPerADnaEntrada);
      end;
    }
    if VersaoBancoMenor(24.26) then
    begin
    	setConfSisBlob('ped_vnd_campos_obrigatorios', buscas,
        'Campos de preenchimento obrigatorio na Requisição/Ordem de Serviço/Orçamento/Tipo',
        '|Campo do banco|Mensagem ao usuario|Componente de Foco(Shif+Ctrl+Alt+F10)|Tipo (REQ/OS/ORCP/ORCPS)');

      setConfSisStr('ctp_diretorio_padrao_imagens', '', buscas,
        'Diretorio padrao das imagens das contas a pagar', nil);
    end;

		if VersaoBancoMenor(24.27) then
    begin
      setConfSisBool('conc_cartao_api_hab', False, buscas,
          'Habilitar o uso da API (Confere) conciliação cartão', nil);
    end;

    if VersaoBancoMenor(24.28) then
    begin
	    setConfSisBlob('ped_vnd_campos_obrigatorios', buscas,
        'Campos de preenchimento obrigatorio na Requisição/Ordem de Serviço/Orçamento/Tipo',
        '|Campo do banco|Mensagem ao usuario|Componente de Foco(Shif+Ctrl+Alt+F10)|Tipo (REQ/OS/ORCP/ORCPS)|');
    end;

    if VersaoBancoMenor(24.29) then
      Aconfs.New('efd_icms_escrituracao', 'EFD ICMS IPI - Configuração unificada para escrituração dos Impostos', ';efd;icms;ipi;sped;fiscal;', typeBool, '', 0, 0)
        .WriteString('ICMSST', 'EmissaoPropria', '1')
        .WriteString('ICMSST', 'EmissaoTerceiros', '')
        .WriteString('ICMSST', 'AntecipacaoST', '')
        .WriteString('IPI', 'EmissaoPropria', '')
        .WriteString('IPI', 'EmissaoTerceiros', '')
        .WriteString('ICMSSN', 'FormaAjuste', 'N')
        .WriteString('ICMSSN', 'CodigoAjuste', 'MG10990505')
        .Comment('ICMSST', ['Essa configuração quando ativada, inativa todas as anteriores relativas a escrituração dos Impostos', '',
                            'Valores válidos para configurações "EmissaoPropria" e "EmissaoTerceiros", valor padrão = 3 caso diferente de 1 e 2',
                            '1 = Campos proprios',
                            '2 = Campos outras despesas',
                            '3 = Campo valor da mercadoria conforme manual',
                            'Valores válidos para o campo AntecipacaoST: S ou N para o registro E210',''])
        .Comment('IPI', '')
        .Comment('ICMSSN', ['Confiurações relacionadas a entrada de notas fiscais de fornecedores do simples nacional',
                            'Valores válidos para configuração FormaAjuste',
                            'A  = Automático - Nesse caso o sistema usa os valores originais do xml para criar os registros de ajustes C195 e C197',
                            'S  = Sistema - Nesse caso ao confirmar a nota via sistema ele registra nas tabelas próprias os valores, ficando assim disponível para alteração',
                            'AS = Automático e Sistema - Ambas as alternativas acima',
                            'N  = Nenhuma - Nesse caso não há nenhum registro pelo sistema, porém não há nenhum impedimento de registro manual',
                            'CodigoAjuste=MG10990505 - O valor desse registro deve existir na tabela de lançamento fiscal, caso contrário o PVA vai acusar erro','']);

    if VersaoBancoMenor(24.30) then
    begin
      Aconf := TCfg_sis.getConf('nf_campos_default', buscas, vDadosIni.cod_empresa);
      try
      if Aconf.value1_f = 0 then
      begin
        Aconf.AtivarMapeamentoKeys();
        Aconf.value1_f := 1;
        Aconf.WriteInteger('Saida', 'IndicadorDePresenca', 1);
        Aconf.WriteInteger('Entrada', 'IndicadorDePresenca', 1);
        Aconf.SaveConfDB(buscas);
      end;
      finally
        FreeAndNil(Aconf);
      end;

      Aconfs.New('nfe_nt_2020_006_data', 'NFe Data inicial para aplicar validações da Nota Técnica 2020.006', ';nfe;nfce;', typeString, '05/04/2021', 0, 0);
      Aconfs.New('nfc_nt_2020_006_data', 'NFCe Data inicial para aplicar validações da Nota Técnica 2020.006', ';nfe;nfce;', typeString, '05/04/2021', 0, 0);
    end;

    if VersaoBancoMenor(24.31) then
      Aconfs.New('ped_vnd_req_obs_semlimite',
                 'Configuração para no pedido de venda usar a observação sem limite de tamanho',
                 ';pedido;obs;', typeBool, '', vDadosIni.cod_empresa, 0).value1_b.Add('# Mesmo com essa configuração a impressão do pedido ainda fica limitada a 130 caracteres');

    if VersaoBancoMenor(24.32) then
    begin
      setConfSisBool('rel_openoffice_export', False, buscas,
        'Abrir relatórios pelo OpenOffice',
        'Por padrão alguns relatórios são importados para Microsoft Office');
    end;

    if VersaoBancoMenor(24.33) then
    begin
    	setConfSisBool('prod_cad_recalcular_preco_diferenciado', False, buscas,
        'Habilitar a atualização do preço diferenciado', 'Ao alterar o preço de tabela o preço diferenciado será recalculado');

      setConfSisBool('prod_cad_recalcular_preco_por_quantidade', False, buscas,
        'Habilitar a atualização do preço por quantidade', 'Ao alterar o preço de tabela o preço por quantidade será recalculado');
    end;

    if VersaoBancoMenor(24.34) then
    begin
      setConfSisBool('sug_compra_multiempresa', False, buscas,
      'Habilitar sugestão de compra multiempresa',
      'O sistema desabilita a sugestão de compra multiempresa por padrão');

      setConfSisStr('sug_compra_sigla_transf', '', buscas,
      'Sigla do tipo de venda (Transferência) - REQ', nil);
    end;

    if VersaoBancoMenor(24.5) then
    begin
      Aconfs.New('nf_desoneracao_zfm_alc', 'Configurações para desoneração da ZFM ou ALC', ';zfm;alc;desoneracao;icms;pis;cofins;', typeBlob, '', vDadosIni.cod_empresa, 0)
        .WriteString('ICMS'     , 'UsarCidadesConfiguradas'               , 'S')
        .WriteString('ICMS'     , 'ConfirmarConferenciaInscricaoSuframa'  , 'S')
        .WriteString('ICMS'     , 'QuandoCstsIcmsContidoNaLista'          , '00,10,20,70')
        .WriteString('ICMS'     , 'ConverterCstIcmsQuandoIgual_00'        , '40')
        .WriteString('ICMS'     , 'ConverterCstIcmsQuandoIgual_10'        , '40')
        .WriteString('ICMS'     , 'ConverterCstIcmsQuandoIgual_20'        , '40')
        .WriteString('ICMS'     , 'ConverterCstIcmsQuandoIgual_70'        , '40')
        //.WriteString('ICMS'     , 'QuandoEncontrarPerfilTributacao'       , 'S')
        .WriteString('PISCOFINS', 'UsarCidadesConfiguradas'               , 'S')
        .WriteString('PISCOFINS', 'ConfirmarConferenciaInscricaoSuframa'  , 'N')
        .WriteString('PISCOFINS', 'QuandoCstsPisCofinsContidoNaLista'     , '01')
        .WriteString('PISCOFINS', 'ConverterCstPisCofinsQuandoIgual_01'   , '07')
        .WriteString('PISCOFINS', 'UsarNaturezaDaReceita'                 , '999')
        .WriteString('PISCOFINS', 'EntradaXmlConvertDescontoEmDesoneracao', 'S');
    end;

    if VersaoBancoMenor(24.51) then
    begin
      Aconf := TCfg_sis.getConf('nf_hab_validacao_antecipacao_st', buscas, vDadosIni.cod_empresa);
      try
      if not Aconf.value1_b.ini.SectionExists('Conf') then
      begin
        Aconf.type1_ := typeBlob;
        Aconf.WriteString('Conf', 'ConfirmarAntecipacaoEmTela', 'N');
        Aconf.WriteString('Conf', 'PreferirAliquotaAoMVA', 'N');
        Aconf.WriteString('Conf', 'AtivarEmDevolucao', 'N');
        Aconf.WriteString('Conf', 'NuncaCalcularAntecipacao', 'N');
        if Aconf.value1_b.Count = 2 then
          Aconf.WriteString('Conf', 'AtivarEmDevolucao', vDadosIni.getValue(Aconf.value1_b[1], 1));
        Aconf.SaveConfDB(buscas);
      end
      else if Aconf.type1_ <> typeBlob then
      begin
        Aconf.type1_ := typeBlob;
        Aconf.SaveConfDB(buscas);
      end;
      finally
        FreeAndNil(Aconf);
      end;
    end;

    if VersaoBancoMenor(24.52) then
    begin
      setConfSisInt('e-commerce_limite_produtos', 100, buscas,
        'Limite de produtos contrato no E-Commerce', nil);
    end;

    if VersaoBancoMenor(24.53) then
    begin
      Aconfs.New('pos_virtual_nao_fiscal', 'Configurações para impressão de comprovantes TEF na impressora não fiscal', ';pos;tef;virutal;naofiscal;', typeBlob, '', vDadosIni.cod_empresa, 0)
        .WriteString('AgenteNaoFiscal_Caixa_001', 'AgenteId', '')
        .WriteString('AgenteNaoFiscal_Caixa_001', 'ArquivoIniPosPrinterNaoFiscal', '')
        .WriteString('AgenteNaoFiscal_Usuario_001', 'AgenteId', '')
        .WriteString('AgenteNaoFiscal_Usuario_001', 'ArquivoIniPosPrinterNaoFiscal', '');
    end;

    if VersaoBancoMenor(24.54) then
    begin
    	setConfSisStr('e-commerce_integrado', 'TRAY', buscas,
        'Informe o nome do E-Commerce integrado: Exemplo: TRAY, NUVEMSHOP E TRAYCORP', nil);
    end;  

    if VersaoBancoMenor(24.55) then
    begin
      Aconfs.New('nf_inf_pedido_compra', 'Configurações para atribuir número de pedido interno de compra na nota fiscal', ';pedido;numero;', typeBlob, '', vDadosIni.cod_empresa, 0)
        .WriteString('NF_Saida_Origem_REQ', 'Ativar', 'N')
        .WriteString('NF_Saida_Origem_REQ', 'Prefixo', '')
        .WriteString('NF_Saida_Origem_OS', 'Ativar', 'N')
        .WriteString('NF_Saida_Origem_OS', 'Prefixo', '')
        .WriteString('NF_Entrada_Origem_REQ', 'Ativar', 'N')
        .WriteString('NF_Entrada_Origem_REQ', 'Prefixo', '')
        .WriteString('NF_Entrada_Origem_OS', 'Ativar', 'N')
        .WriteString('NF_Entrada_Origem_OS', 'Prefixo', '')
        .value1_b.Add('# Quando os campos não forem preenchidos no item do Pedido/OS e Ativar=S a nota vai utilizar o numero interno do mesmo e a sequencia do item no Pedido/OS');
    end;

    if VersaoBancoMenor(24.56) then
    begin
      Aconfs.New('nf_e_cnpj_import_xml', 'Lista de CNPJ diferentes do emitente e destinatário autorizados a importar o XML da NFe', ';xml;importar;', typeBlob, '', vDadosIni.cod_empresa, 0)
        .WriteString('EntradaNF', 'CNPJs', '')
        .WriteString('CadastroProdutos', 'CNPJs', '')
        .Comment('EntradaNF', 'Informar CNPJs separados por virgula autorizados a dar entrada de nota fiscal')
        .Comment('CadastroProdutos', 'Informar CNPJs separados por virgula autorizados apenas a cadastrar produtos');
    end;

    if VersaoBancoMenor(24.57) then
    begin
      Aconfs.New('imp_termica', 'Configurações para impressão em impressoras térmicas de etiquetas', ';impressao;etiqueta;termica;zebra;argox;intermec;epl2;zpl;', typeBlob, '', vDadosIni.cod_empresa, 0)
        .WriteString('Padrao', 'Porta', '')
        .WriteString('Padrao', 'AgenteId', '');
    end;

    if VersaoBancoMenor(24.59) then
    begin
	    setConfSisStr('sug_compra_origem_transf', 'T', buscas,
  	    'Origem do tipo de venda (Transferência) - REQ',
        'Exemplo: V - VENDAS NORMAIS|P - PROMOÇÕES|D - DESCARTES|T - TRANSFERÊNCIA|' +
        'A - AJUSTE DE INVENTÁRIO');

      Aconfs.New('ped_vnd_impressao_dav', 'Configurações de impressão do modelo AVANÇADO 1 e AVANÇADO 2', '', typeBlob, 'v1', 0, 0)
        .WriteString('IMPRESSAO', 'ExibirRazaoFantasiaIdentificacaoEmpresa', 'IDENTIFICACAO')
        .WriteString('IMPRESSAO', 'ExibirDescAcrescReqOsOrc', 'N')
        .WriteString('IMPRESSAO', 'ExibirDescAcresItem', 'N')
        .WriteString('IMPRESSAO', 'ExibirBrutoOsOrc', 'S')
        .WriteString('IMPRESSAO', 'ExibirTecnicoMecanicoLinhaAdc', 'N')
        .WriteString('IMPRESSAO', 'ExibirAplicacaoLinhaAdc', 'N')
        .WriteString('IMPRESSAO', 'ExibirLocacaoLinhaAdc', 'N')
        .WriteString('IMPRESSAO', 'ExibirDeclSPCReqOsOrc', vDadosIni.IfThen(vDadosIni.vEmp.vUsarDeclSPCReq <> 'S', 'N', 'S'))
        .Comment('IMPRESSAO', 'Explicação da impressão do pedido modelo AVANÇADA 1 e AVANÇADA 2')
        .Comment('IMPRESSAO', 'ExibirRazaoFantasiaEmpresa')
        .Comment('IMPRESSAO', '	 Exibir razão social ou nome fantasia ou identificação da empresa (RAZAO/FANTASIA/IDENTIFICACAO)')
        .Comment('IMPRESSAO', 'ExibirDescAcrescReqOsOrc')
        .Comment('IMPRESSAO', '	 Exibir informação de desconto e acréscimo nos totais (S/N)')
        .Comment('IMPRESSAO', 'ExibirDescAcresItem')
        .Comment('IMPRESSAO', '  Exibir valores de desconto e acréscimo nos itens,' +
        											' caso informe N os campos de desconto e acréscimo do item sempre ficarão zerados,' +
                              ' caso informe V será exibido o valor do desconto e acréscimo do item' +
                              ' e caso informe P será exibido o percentual do desconto e acréscimo do item (N/V/P)')
        .Comment('IMPRESSAO', 'ExibirBrutoOsOrc')
        .Comment('IMPRESSAO', '  Exibir valor bruto nos totais em Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirTecnicoMecanicoLinhaAdc')
        .Comment('IMPRESSAO', '	 Exibir vendedor/técnico/mecânico em uma linha adicional nos itens em Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirAplicacaoLinhaAdc')
        .Comment('IMPRESSAO', '  Exibir aplicação em linha uma adicional nos itens em Requisição/Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirLocacaoLinhaAdc')
        .Comment('IMPRESSAO', '  Exibir locação 1, locação 2 e locação depósito em uma linha adicional nos itens em Requisição/Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirDeclSPCReqOsOrc')
        .Comment('IMPRESSAO', '	 Exbir declaração SPC em Requisição/Ordem de Serviço/Orçamento (S/N)');
    end;

    if VersaoBancoMenor(24.60) then
    begin
//    	setConfSisBool('emp_unico_anexo_por_email', False, buscas,
//        'Enviar único anexo por e-mail', nil);
      Aconfs.New('emp_unico_anexo_por_email', 'Enviar único anexo por e-mail', ';email;boleto;nf;notafiscal;', typeBlob, '', vDadosIni.cod_empresa, 0)
        .WriteString('Conf_Boletos_Avulsos', 'Ativo', 'N')
        .WriteString('Conf_Boletos_NF', 'Ativo', 'N')
        .WriteString('Conf_Boletos_NF', 'AssuntoEmail', 'Boleto [@ndup] de [@countdup] - NF [@num_nf] - [@empresa]')
        .WriteString('Conf_Boletos_NF', 'CorpoEmail', 'Segue boleto para pagamento;;Atenciosamento;[@empresa]')
        .Comment('Conf_Boletos_Avulsos', 'Ativa o envio de boletos separados pela tela de cadastro dos boletos')
        .Comment('Conf_Boletos_NF', 'Ativa o envio de boletos no envio do email da NF cujos boletos tenha sido localizados pela mesma');
    end;

    if VersaoBancoMenor(24.61) then
    begin
      Aconfs.New('ped_vnd_impressao_dav', 'Configurações de impressão do modelo AVANÇADO 1 e AVANÇADO 2', '', typeBlob, 'v1', 0, 0)
        .WriteString('IMPRESSAO', 'ExibirRazaoFantasiaIdentificacaoEmpresa', 'IDENTIFICACAO')
        .WriteString('IMPRESSAO', 'ExibirCNPJEmp', 'S')
        .WriteString('IMPRESSAO', 'ExibirInscrEstEmp', 'S')
        .WriteString('IMPRESSAO', 'ExibirDescAcrescReqOsOrc', 'N')
        .WriteString('IMPRESSAO', 'ExibirDescAcresItem', 'N')
        .WriteString('IMPRESSAO', 'ExibirBrutoOsOrc', 'S')
        .WriteString('IMPRESSAO', 'ExibirTecnicoMecanicoLinhaAdc', 'N')
        .WriteString('IMPRESSAO', 'ExibirAplicacaoLinhaAdc', 'N')
        .WriteString('IMPRESSAO', 'ExibirLocacaoLinhaAdc', 'N')
        .WriteString('IMPRESSAO', 'ExibirDeclSPCReqOsOrc', vDadosIni.IfThen(vDadosIni.vEmp.vUsarDeclSPCReq <> 'S', 'N', 'S'))
        .WriteString('IMPRESSAO', 'ExibirAssinatura', 'S')
        .Comment('IMPRESSAO', 'Explicação da impressão do pedido modelo AVANÇADA 1 e AVANÇADA 2')
        .Comment('IMPRESSAO', 'ExibirRazaoFantasiaEmpresa')
        .Comment('IMPRESSAO', '	 Exibir razão social ou nome fantasia ou identificação da empresa (RAZAO/FANTASIA/IDENTIFICACAO)')
        .Comment('IMPRESSAO', 'ExibirCNPJEmp')
        .Comment('IMPRESSAO', '	 Exibir CNPJ da empresa no cabeçalho (S/N)')
        .Comment('IMPRESSAO', 'ExibirInscrEstEmp')
        .Comment('IMPRESSAO', '	 Exibir inscrição estadual da empresa no cabeçalho (S/N)')
        .Comment('IMPRESSAO', 'ExibirDescAcrescReqOsOrc')
        .Comment('IMPRESSAO', '	 Exibir informação de desconto e acréscimo nos totais (S/N)')
        .Comment('IMPRESSAO', 'ExibirDescAcresItem')
        .Comment('IMPRESSAO', '  Exibir valores de desconto e acréscimo nos itens,' +
        											' caso informe N os campos de desconto e acréscimo do item sempre ficarão zerados,' +
                              ' caso informe V será exibido o valor do desconto e acréscimo do item' +
                              ' e caso informe P será exibido o percentual do desconto e acréscimo do item (N/V/P)')
        .Comment('IMPRESSAO', 'ExibirBrutoOsOrc')
        .Comment('IMPRESSAO', '  Exibir valor bruto nos totais em Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirTecnicoMecanicoLinhaAdc')
        .Comment('IMPRESSAO', '	 Exibir vendedor/técnico/mecânico em uma linha adicional nos itens em Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirAplicacaoLinhaAdc')
        .Comment('IMPRESSAO', '  Exibir aplicação em linha uma adicional nos itens em Requisição/Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirLocacaoLinhaAdc')
        .Comment('IMPRESSAO', '  Exibir locação 1, locação 2 e locação depósito em uma linha adicional nos itens em Requisição/Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirDeclSPCReqOsOrc')
        .Comment('IMPRESSAO', '	 Exbir declaração SPC em Requisição/Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirAssinatura')
        .Comment('IMPRESSAO', '	 Exibir assinatura no final do relatório (S/N)');
    end;

    verificarVersaoConf2(buscas);

    for I := 0 to Aconfs.Count - 1 do
      setConfSisObj(Aconfs.Items[I], buscas);

    if vDadosIni.vVersaoConfig > vVersaoConfigBanco then // versao do programa maior que a versao salva no banco
    begin
      buscas.Close;
      buscas.SQL.Text := 'update config_sistema set value1_f = :value1_f' +
        ' where chave = ''versao_config_sistema'' and cod_empresa = ' + vDadosIni.codEmpresa;
      buscas.ParamByName('value1_f').AsFloat := vDadosIni.vVersaoConfig;
      buscas.ExecSQL;
      if buscas.Transaction.InTransaction then
        buscas.Transaction.Commit;

      vVersaoConfigBanco := vDadosIni.vVersaoConfig;
    end;

    buscas.Close;

  except
    on e: exception do
    begin
      Application.MessageBox(pchar('Erro ao abrir configuracoes (config_sistema). Erro: ' + e.Message),
        'Atenção', 0 + 64);
      vDadosIni.registraErro('TSetConfiguracaoSistema.verificarVersaoConf. Erro: ' + e.Message);
    end;
  end;
end;

procedure TSetConfiguracaoSistema.verificarVersaoConf2(buscas: TIBQuery);
var
  Aconf, newConf: TConfig_sistema_class;
	vEmpresas: string;
  vSomarEmpresaSemEstoque: string;
  vExibirSomaTotalEstoque: string;
  vUtilizarSomaTotalEstoque: string;
  vUtilizarPreco: string;
  vExibirUnidade: string;
  vExibirFormPag: string;
  vExibirUsuarioFechou: string;
  vExibirDescAcresItem: Integer;
  vPercentualAcrescimoDescontoEmTotais: string;
  vStringList, vStringList2: TStringList;
  vGerarBol, vGerarBolProdServ, vAgruparContr, vDesconsCtrl, vStatusTmo: string;
  vCodSubGrupo, vCodOperadorCXL, vCodVendedor: Integer;
  vlist: TConfig_sistema_classList;
  vexibir_devolucao: TConfig_sistema_class;
  I: Integer;
begin
  try
    if VersaoBancoMenor(24.62) then
    begin
      setConfSisBool('sug_compra_pedido_efetivado', True, buscas,
        'Criar pedido de compra efetivado a partir da sugestão de compra',
        'Por padrão a sugestão de compra é criada efetivada');

      Aconfs.New('ped_vnd_impressao_dav', 'Configurações de impressão do modelo AVANÇADO 1 e AVANÇADO 2', '', typeBlob, 'v1', 0, 0)
        .WriteString('IMPRESSAO', 'ExibirRazaoFantasiaIdentificacaoEmpresa', 'IDENTIFICACAO')
        .WriteString('IMPRESSAO', 'ExibirEnderecoEmp', 'S')
        .WriteString('IMPRESSAO', 'ExibirFoneEmp', 'S')
        .WriteString('IMPRESSAO', 'ExibirCNPJEmp', 'S')
        .WriteString('IMPRESSAO', 'ExibirInscrEstEmp', 'S')
        .WriteString('IMPRESSAO', 'ExibirEmailEmp', 'S')
        .WriteString('IMPRESSAO', 'ExibirDescAcrescReqOsOrc', 'N')
        .WriteString('IMPRESSAO', 'ExibirDescAcresItem', 'N')
        .WriteString('IMPRESSAO', 'ExibirBrutoOsOrc', 'S')
        .WriteString('IMPRESSAO', 'ExibirTecnicoMecanicoLinhaAdc', 'N')
        .WriteString('IMPRESSAO', 'ExibirAplicacaoLinhaAdc', 'N')
        .WriteString('IMPRESSAO', 'ExibirLocacaoLinhaAdc', 'N')
        .WriteString('IMPRESSAO', 'ExibirDeclSPCReqOsOrc', vDadosIni.IfThen(vDadosIni.vEmp.vUsarDeclSPCReq <> 'S', 'N', 'S'))
        .WriteString('IMPRESSAO', 'ExibirAssinatura', 'S')
        .Comment('IMPRESSAO', 'Explicação da impressão do pedido modelo AVANÇADA 1 e AVANÇADA 2')
        .Comment('IMPRESSAO', 'ExibirRazaoFantasiaEmpresa')
        .Comment('IMPRESSAO', '	 Exibir razão social ou nome fantasia ou identificação da empresa (RAZAO/FANTASIA/IDENTIFICACAO)')
        .Comment('IMPRESSAO', 'ExibirEnderecoEmp')
        .Comment('IMPRESSAO', '	 Exibir endereço da empresa no cabeçalho (S/N)')
        .Comment('IMPRESSAO', 'ExibirFoneEmp')
        .Comment('IMPRESSAO', '	 Exibir telefone da empresa no cabeçalho (S/N)')
        .Comment('IMPRESSAO', 'ExibirCNPJEmp')
        .Comment('IMPRESSAO', '	 Exibir CNPJ da empresa no cabeçalho (S/N)')
        .Comment('IMPRESSAO', 'ExibirInscrEstEmp')
        .Comment('IMPRESSAO', '	 Exibir inscrição estadual da empresa no cabeçalho (S/N)')
        .Comment('IMPRESSAO', 'ExibirEmailEmp')
        .Comment('IMPRESSAO', '	 Exibir e-mail da empresa no cabeçalho (S/N)')
        .Comment('IMPRESSAO', 'ExibirDescAcrescReqOsOrc')
        .Comment('IMPRESSAO', '	 Exibir informação de desconto e acréscimo nos totais (S/N)')
        .Comment('IMPRESSAO', 'ExibirDescAcresItem')
        .Comment('IMPRESSAO', '  Exibir valores de desconto e acréscimo nos itens,' +
                              ' caso informe N os campos de desconto e acréscimo do item sempre ficarão zerados,' +
                              ' caso informe V será exibido o valor do desconto e acréscimo do item' +
                              ' e caso informe P será exibido o percentual do desconto e acréscimo do item (N/V/P)')
        .Comment('IMPRESSAO', 'ExibirBrutoOsOrc')
        .Comment('IMPRESSAO', '  Exibir valor bruto nos totais em Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirTecnicoMecanicoLinhaAdc')
        .Comment('IMPRESSAO', '	 Exibir vendedor/técnico/mecânico em uma linha adicional nos itens em Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirAplicacaoLinhaAdc')
        .Comment('IMPRESSAO', '  Exibir aplicação em linha uma adicional nos itens em Requisição/Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirLocacaoLinhaAdc')
        .Comment('IMPRESSAO', '  Exibir locação 1, locação 2 e locação depósito em uma linha adicional nos itens em Requisição/Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirDeclSPCReqOsOrc')
        .Comment('IMPRESSAO', '	 Exbir declaração SPC em Requisição/Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirAssinatura')
        .Comment('IMPRESSAO', '	 Exibir assinatura no final do relatório (S/N)');
    end;
    { Foi unificado na conf prod_precos
    if VersaoBancoMenor(24.63) then
    begin
      Aconf := TCfg_sis.getConf('nf_e_alteracao_preco', buscas, vDadosIni.cod_empresa);
      Aconf.AtivarMapeamentoKeys;
      Aconf.ReadString('Conf', 'TelaMargemTrocarCampoMarkupParaMargem', 'N');
      Aconf.ReadString('Conf', 'TelaProdutoTrocarCampoMarkupParaMargem', 'N');

      if Aconf.KesyChanges then
      begin
        Aconf.Comment('Conf', [' ', 'Quando essa configuração é ativa o sistema deixa de usar o arquivo Config.ini para usar as variaveis abaixo', ' ']);
        Aconf.display_ := 'Configurações sobre alteração de preço na entrada da nota fiscal juntamente com o processo NF0223';
        Aconf.SaveConfDB(buscas);
      end;
    end;
    }
    if VersaoBancoMenor(24.64) then
      Aconfs.New('nfc_bc_picofins_sem_icms', 'Deixar a base de calculo do PISCOFINS sem considerar o campo do valor do imposto ICMS',
                 ';nfe;nfce;piscofins;basedecalculo;', typeBool, '', vDadosIni.cod_empresa, 0);

    if VersaoBancoMenor(24.65) then
    begin
      Aconf := TConfig_sistema_class.getConf('ped_vnd_impressao_dav', buscas, vDadosIni.cod_empresa);
      try

      Aconfs.New('ped_vnd_impressao_dav_v1', 'Configurações de impressão do modelo AVANÇADO 1 e AVANÇADO 2', ';dav;impressao;', typeBlob, 'v1', 0, 0)
        .WriteString('IMPRESSAO', 'ExibirRazaoFantasiaIdentificacaoEmpresa',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirRazaoFantasiaIdentificacaoEmpresa'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirRazaoFantasiaIdentificacaoEmpresa')), 'IDENTIFICACAO'))
        .WriteString('IMPRESSAO', 'ExibirEnderecoEmp',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirEnderecoEmp'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirEnderecoEmp')), 'S'))
        .WriteString('IMPRESSAO', 'ExibirFoneEmp',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirFoneEmp'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirFoneEmp')), 'S'))
        .WriteString('IMPRESSAO', 'ExibirCNPJEmp',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirCNPJEmp'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirCNPJEmp')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirInscrEstEmp',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirInscrEstEmp'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirInscrEstEmp')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirEmailEmp',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirEmailEmp'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirEmailEmp')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirDescAcrescReqOsOrc',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDescAcrescReqOsOrc'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDescAcrescReqOsOrc')),	'N'))
        .WriteString('IMPRESSAO', 'ExibirDescAcresItem',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDescAcresItem'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDescAcresItem')),	'N'))
        .WriteString('IMPRESSAO', 'ExibirBrutoOsOrc',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirBrutoOsOrc'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirBrutoOsOrc')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirTecnicoMecanicoLinhaAdc',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirTecnicoMecanicoLinhaAdc'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirTecnicoMecanicoLinhaAdc')),	'N'))
        .WriteString('IMPRESSAO', 'ExibirAplicacaoLinhaAdc',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAplicacaoLinhaAdc'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAplicacaoLinhaAdc')),	'N'))
        .WriteString('IMPRESSAO', 'ExibirLocacaoLinhaAdc',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirLocacaoLinhaAdc'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirLocacaoLinhaAdc')),	'N'))
        .WriteString('IMPRESSAO', 'ExibirDeclSPCReqOsOrc',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDeclSPCReqOsOrc'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDeclSPCReqOsOrc')),
               vDadosIni.IfThen(vDadosIni.vEmp.vUsarDeclSPCReq <> 'S', 'N', 'S')))
        .WriteString('IMPRESSAO', 'ExibirOBS',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirOBS'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirOBS')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirEstadoVeicObj',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirEstadoVeicObj'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirEstadoVeicObj')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirDefeito',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDefeito'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDefeito')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirAcessorios',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAcessorios'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAcessorios')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirOBSLivroReg',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirOBSLivroReg'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirOBSLivroReg')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirAtivReparoInstrucacaoInMetr',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAtivReparoInstrucacaoInMetr'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAtivReparoInstrucacaoInMetr')),	'N'))
        .WriteString('IMPRESSAO', 'ExibirPlanoPag',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirPlanoPag'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirPlanoPag')),	'N'))
        .WriteString('IMPRESSAO', 'ExibirFormaPag',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirFormaPag'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirFormaPag')),	'N'))
        .WriteString('IMPRESSAO', 'ExibirAssinatura',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAssinatura'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAssinatura')),	'S'))
        .Comment('IMPRESSAO', 'Explicação da impressão do pedido modelo AVANÇADA 1 e AVANÇADA 2')
        .Comment('IMPRESSAO', 'ExibirRazaoFantasiaEmpresa')
        .Comment('IMPRESSAO', '	 Exibir razão social ou nome fantasia ou identificação da empresa (RAZAO/FANTASIA/IDENTIFICACAO)')
        .Comment('IMPRESSAO', 'ExibirEnderecoEmp')
        .Comment('IMPRESSAO', '	 Exibir endereço da empresa no cabeçalho (S/N)')
        .Comment('IMPRESSAO', 'ExibirFoneEmp')
        .Comment('IMPRESSAO', '	 Exibir telefone da empresa no cabeçalho (S/N)')
        .Comment('IMPRESSAO', 'ExibirCNPJEmp')
        .Comment('IMPRESSAO', '	 Exibir CNPJ da empresa no cabeçalho (S/N)')
        .Comment('IMPRESSAO', 'ExibirInscrEstEmp')
        .Comment('IMPRESSAO', '	 Exibir inscrição estadual da empresa no cabeçalho (S/N)')
        .Comment('IMPRESSAO', 'ExibirEmailEmp')
        .Comment('IMPRESSAO', '	 Exibir e-mail da empresa no cabeçalho (S/N)')
        .Comment('IMPRESSAO', 'ExibirDescAcrescReqOsOrc')
        .Comment('IMPRESSAO', '	 Exibir informação de desconto e acréscimo nos totais (S/N)')
        .Comment('IMPRESSAO', 'ExibirDescAcresItem')
        .Comment('IMPRESSAO', '  Exibir valores de desconto e acréscimo nos itens,' +
                              ' caso informe N os campos de desconto e acréscimo do item sempre ficarão zerados,' +
                              ' caso informe V será exibido o valor do desconto e acréscimo do item' +
                              ' e caso informe P será exibido o percentual do desconto e acréscimo do item (N/V/P)')
        .Comment('IMPRESSAO', 'ExibirBrutoOsOrc')
        .Comment('IMPRESSAO', '  Exibir valor bruto nos totais em Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirTecnicoMecanicoLinhaAdc')
        .Comment('IMPRESSAO', '	 Exibir vendedor/técnico/mecânico em uma linha adicional nos itens em Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirAplicacaoLinhaAdc')
        .Comment('IMPRESSAO', '  Exibir aplicação em linha uma adicional nos itens em Requisição/Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirLocacaoLinhaAdc')
        .Comment('IMPRESSAO', '  Exibir locação 1, locação 2 e locação depósito em uma linha adicional nos itens em Requisição/Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirDeclSPCReqOsOrc')
        .Comment('IMPRESSAO', '	 Exbir declaração SPC em Requisição/Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirOBS')
        .Comment('IMPRESSAO', '	 Exibir observações em Requisição/Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirEstadoVeicObj')
        .Comment('IMPRESSAO', '	 Exibir estado veículo/objeto em Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirDefeito')
        .Comment('IMPRESSAO', '	 Exibir defeito veículo/objeto em Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirAcessorios')
        .Comment('IMPRESSAO', '	 Exibir acessórios veículo/objeto em Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirOBSLivroReg')
        .Comment('IMPRESSAO', '	 Exibir observação livro de registro em Requisição/Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirAtivReparoInstrucacaoInMetr')
        .Comment('IMPRESSAO', '	 Exibir informações de atividades de reparo InMetro Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirPlanoPag')
        .Comment('IMPRESSAO', '	 Exibir detalhes do plano de pagamento Requisição/Ordem de Serviço (S/N)')
        .Comment('IMPRESSAO', 'ExibirFormaPag')
        .Comment('IMPRESSAO', '	 Exibir detalhes da forma de pagamento Requisição/Ordem de Serviço (S/N)')
        .Comment('IMPRESSAO', 'ExibirAssinatura')
        .Comment('IMPRESSAO', '	 Exibir assinatura no final do relatório (S/N)');
      finally
        FreeAndNil(Aconf);
      end;
    end;

    if VersaoBancoMenor(24.66) then
    begin
      setConfSisBool('cl_ficha_exib_somente_cred_cheq_venc', False, buscas,
        'Exibir somente créditos e cheques vencidos na situação de caixa do cliente', nil);
    end;

    if VersaoBancoMenor(24.67) then
    begin
      setConfSisBlob('cl_cad_campos_desabilitados', buscas,
        'Campos que serão desabilitados no cadastro de clientes',
        '|Nome do campo|Nome do componente|edicao alteracao inclusao ambos editar incluir alterar|nivel|');

      setConfSisBlob('cl_cad_simpl_campos_desabilitados', buscas,
        'Campos que serão desabilitados no cadastro simplificado de clientes',
        '|Nome do campo|Nome do componente|edicao alteracao inclusao ambos editar incluir alterar|nivel|');

      setConfSisBlob('cl_cad_campos_obrigatorios', buscas,
        'Campos de preenchimento obrigatorio no cadastro de clientes',
        '|Campo do banco|Mensagem ao usuario|Componente de Foco(Shif+Ctrl+Alt+F10)|P:DadosPessoais;E:Endereco;C:Contato;D:Documentos;O:Outros|' + #13 +
        '|cep|CEP do endereço do cliente de preenchimento obrigatório|DBEdit114|' + #13 +
        '|endereco|Logradouro do endereço do cliente de preenchimento obrigatório|DBEdit115|' + #13 +
        '|num_end_cliente|Número do endereço do cliente de preenchimento obrigatório|DBEdit116|' + #13 +
        '|bairro|Bairro do endereço do cliente de preenchimento obrigatório|DBEdit118|' + #13 +
        '|cidade|Cidade do endereço do cliente de preenchimento obrigatório|DBEdit119|' + #13 +
        '|codigo_uf|Estado do endereço do cliente de preenchimento obrigatório|DBLookupComboBox29|' + #13 +
        '|cep_cobranca|CEP do endereço de cobrança de preenchimento obrigatório|DBEdit150|E|' + #13 +
        '|end_cobranca|Endereço (Logradouro, numero e complemento) do endereço de cobrança de preenchimento obrigatório|DBEdit151|E|' + #13 +
        '|bairro_cobranca|Bairro do endereço de cobrança de preenchimento obrigatório|DBEdit152|E|' + #13 +
        '|cida_cobranca|Cidade do endereço de cobrança de preenchimento obrigatório|DBEdit153|E|' + #13 +
        '|est_codigo_uf|Estado do endereço de cobrança de preenchimento obrigatório|DBLookupComboBox35|E|');

      setConfSisBlob('cl_cad_simpl_campos_obrigatorios', buscas,
        'Campos de preenchimento obrigatorio no cadastro simplificado de clientes',
        '|Campo do banco|Mensagem ao usuario|Componente de Foco(Shif+Ctrl+Alt+F10)|P:DadosPessoais;E:Endereco;C:Contato;D:Documentos;O:Outros|' + #13 +
        '|cep|CEP do endereço do cliente de preenchimento obrigatório|DBEdit12|' + #13 +
        '|endereco|Logradouro do endereço do cliente de preenchimento obrigatório|DBEdit9|' + #13 +
        '|num_end_cliente|Número do endereço do cliente de preenchimento obrigatório|DBEdit68|' + #13 +
        '|bairro|Bairro do endereço do cliente de preenchimento obrigatório|DBEdit10|' + #13 +
        '|cidade|Cidade do endereço do cliente de preenchimento obrigatório|DBEdit11|' + #13 +
        '|codigo_uf|Estado do endereço do cliente de preenchimento obrigatório|DBLookupComboBox1|' + #13 +
        '|cep_cobranca|CEP do endereço de cobrança de preenchimento obrigatório|DBEdit18|E|' + #13 +
        '|end_cobranca|Endereço (Logradouro, numero e complemento) do endereço de cobrança de preenchimento obrigatório|DBEdit15|E|' + #13 +
        '|bairro_cobranca|Bairro do endereço de cobrança de preenchimento obrigatório|DBEdit17|E|' + #13 +
        '|cida_cobranca|Cidade do endereço de cobrança de preenchimento obrigatório|DBEdit16|E|' + #13 +
        '|est_codigo_uf|Estado do endereço de cobrança de preenchimento obrigatório|DBLookupComboBox3|E|');

      setConfSisBlob('prod_cad_campos_desabilitados', buscas,
        'Campos que serão desabilitados no cadastro de produtos',
        '|Nome do campo|Nome do componente|edicao alteracao inclusao ambos editar incluir alterar|nivel|');

      setConfSisBlob('prod_cad_simpl_campos_desabilitados', buscas,
        'Campos que serão desabilitados no cadastro simplificado de produtos',
        '|Nome do campo|Nome do componente|edicao alteracao inclusao ambos editar incluir alterar|nivel|');

      setConfSisBlob('prod_cad_campos_obrigatorios', buscas,
        'Campos de preenchimento obrigatorio no cadastro de produtos',
        '|Campo do banco|Mensagem ao usuario|Componente de Foco(Shif+Ctrl+Alt+F10)|');

      setConfSisBlob('prod_cad_simpl_campos_obrigatorios', buscas,
        'Campos de preenchimento obrigatorio no cadastro simplificado de produtos',
        '|Campo do banco|Mensagem ao usuario|Componente de Foco(Shif+Ctrl+Alt+F10)|');
    end;

    if VersaoBancoMenor(24.68) then
    begin
      setConfSisBool('producao_aut_estoque_neg', False, buscas,
        'Criar produção automática mesmo quando as Matérias Primas/Insumos/Embalagens não tiverem estoque', nil);
    end;

    if VersaoBancoMenor(24.69) then
    begin
      Aconfs.New('prod_frete_peso', 'Configurações do frete por peso', ';nf;entrada;peso;frete;notafiscal;', typeBlob, '', vDadosIni.cod_empresa, 0)
        .WriteString('Calculo', 'SobreDadosFornecedor', 'N')
  //      .WriteString('Alteracao', 'Ativo', 'N')
        .Comment('Calculo', 'SobreDadosFornecedor = S ; Ativa o calculo com base nos dados(unidade e quantidade) do fornecedor, e não nos dados do cadastro do produto');
    end;

    if VersaoBancoMenor(24.70) then
    begin
      Aconfs.New('nf_s_difal_base_dupla', 'Configuração para definir UFs que usa a base dupla para o ICMS DIFAL', ';nf;nfe;difal;icms;', typeString, '', vDadosIni.cod_empresa, 0)
        .value1_b.Text := '; Informar as UFs serparadas por vírgula no campo acima';
    end;

    if VersaoBancoMenor(24.71) then
    begin
      Aconfs.New('pos_virtual_conf', 'Configuração para operação do POS Virtual TEF', ';posvirtual;tef;formpagamento;', typeBlob, '', vDadosIni.cod_empresa, 0)
        .WriteString('Conf', 'HabilitarBotaoTEF', 'N')
        .WriteString('Conf', 'HabilitarCarteirasDigitais', 'N')
        .Comment('Conf', 'HabilitarBotaoTEF = Habilita o botão da forma de pagamento')
        .Comment('Conf', '                    Quando habilitado o aplicativo TEF somente será chamado pelo botão')
        .Comment('Conf', 'HabilitarCarteirasDigitais = Habilita as seleção de carteiras digitais nas transações Avulsas e NFCe');
    end;

    if VersaoBancoMenor(24.72) then
    begin
      Aconfs.New('plug_boletos_api_conf', 'Configurações para utilização da API de Boletos (Plug Boleto)', ';boleto;plugboleto;', typeBlob, '', vDadosIni.cod_empresa, 0)
        .WriteString('CONFIGURACOES', 'TempoEntreTentativas', '50')
        .WriteString('CONFIGURACOES', 'TempoAguardarCadaTentativa', '50')
        .WriteString('CONFIGURACOES', 'QuantidadeTentativas', '5')
        .Comment('CONFIGURACOES', 'Congiruações utilização API Boleto (Plug Boleto)')
        .Comment('CONFIGURACOES', 'TempoEntreTentativas')
        .Comment('CONFIGURACOES', '	 Tempo entre tentativas (milissegundos)')
        .Comment('CONFIGURACOES', 'TempoAguardarCadaTentativa')
        .Comment('CONFIGURACOES', '	 Tempo para aguardar a cada tentativa (milissegundos)')
        .Comment('CONFIGURACOES', 'QuantidadeTentativas')
        .Comment('CONFIGURACOES', '	 Quantidade de tentativas a realizar');
    end;

    if VersaoBancoMenor(24.73) then
    begin
      Aconf := TCfg_sis.getConf('prod_precos', buscas, vDadosIni.cod_empresa);
      try
      if Aconf.chave = '' then
      begin
        newConf := Aconfs.New('prod_precos', 'Configurações de preço, formação e alteração entrada NF', ';preco;produto;nf;varejo;atacado;nf_e_alteracao_preco;prod_cad_aplicar_desc_preco_tabela;', typeBlob, '', vDadosIni.cod_empresa, 0)
          .WriteString('Conf', 'ManterMarkupeMargemProporcionalAosPrecos', vDadosIni.vEmp.vALT_PERC_MARGEM1)
          .WriteString('Conf', 'PreferirGerenciarCampoMargemAoMarkup', '')
          .WriteString('Conf', 'CalcularAlterarPrecosAoConfirmarNF', '')
          .WriteString('Conf', 'PreferirCalcularPrecoVarejoUsandoPreco30Dias', '')
          .WriteString('Conf', 'PreferirCalcularPreco30_60e90DiasUsandoPercentualAdcicional', '')
          .WriteInteger('Conf', 'DigitosCamposMargemMarkup', 3)
          .Comment('Conf', ['ManterMarkupeMargemProporcionalAosPrecos = S ou N ; Durante a alteração do cadastro do produto manter sempre os preços proporcionais ao markup e vice versa',
                            'PreferirGerenciarCampoMargemAoMarkup = S ou N ; Durante o cadastro do produto na aba principal ficará visível a Margem no lugar do campo Markup quando igual a "S"'])

          .Comment('Conf', ['CalcularAlterarPrecosAoConfirmarNF = S ou N ; Calcular preços usando as configurações de markups e percentuais do cadastro do produto, e alterar o preço durante a confirmação da Nota fiscal de compra',
                                 'PreferirCalcularPrecoVarejoUsandoPreco30Dias = S ou N ; Na entrada de NF preferir calcular o preço de venda Varejo usando % de desconto no Preço de 30 Dias no lugar do Markup',
                                 'PreferirCalcularPreco30_60e90DiasUsandoPercentualAdcicional = S ou N ; Na entrada de NF preferir calcular os preços de 30, 60 e 090 dias usando os percentuais adicionais correspondentes no lugar do Markup',
                                 '  A configuração anterior "PreferirCalcularPrecoVarejoUsandoPreco30Dias" tem prioridade sobre essa, sendo assim o percentual adicional de 30 dias será desconsiderado caso a outra esteja ativada'],
                                 True);

        Aconf.Free;
        Aconf := TCfg_sis.getConf('prod_cad_aplicar_desc_preco_tabela', buscas, vDadosIni.cod_empresa);
        if Aconf.ativo = 1 then
        begin
          newConf.WriteString('Conf', 'PreferirCalcularPrecoVarejoUsandoPreco30Dias', IfThen(Aconf.AsBoolean, 'S', 'N'));
          Aconf.ativo := 0;
          Aconf.SaveConfDB(buscas);
        end;

        Aconf.Free;
        Aconf := TCfg_sis.getConf('nf_e_alteracao_preco', buscas, vDadosIni.cod_empresa);
        if Aconf.ativo = 1 then
        begin
          newConf.WriteString('Conf', 'CalcularAlterarPrecosAoConfirmarNF', Aconf.ReadString('Conf', 'UsarPercentualAdicinalProdEntrada', vDadosIni.vUsarPerADnaEntrada))
                 .WriteString('Conf', 'PreferirCalcularPreco30_60e90DiasUsandoPercentualAdcicional', Aconf.ReadString('Conf', 'AlterarPrecoAutomaticoVendaEntradaNF', vDadosIni.vAlteraPrecoVendaEntradaNF))
                 .WriteString('Conf', 'PreferirGerenciarCampoMargemAoMarkup', Aconf.ReadString('Conf', 'TelaProdutoTrocarCampoMarkupParaMargem'));
          Aconf.ativo := 0;
          Aconf.SaveConfDB(buscas);
        end;
      end;
      finally
        FreeAndNil(Aconf);
      end;
    end;

    if VersaoBancoMenor(24.74) then
    begin
      Aconfs.New('conf_historicos', 'Configuração para definir historicos personalizados', '', typeBlob, '', vDadosIni.cod_empresa, 0)
        .WriteString('ContasAPagarDeNfCompra'   , 'Texto', '')
        .WriteString('ContasAPagarDeNfCompra'   , 'Campos', 'NUM_NF,VALOR_TOTAL,NOME_CLIENTE')

        .WriteString('ContasAPagarDeFreteNF'    , 'Texto', '')
        .WriteString('ContasAPagarDeFreteNF'    , 'Campos', 'NUM_NF,VALOR_TOTAL,NOME_CLIENTE')

        .WriteString('ContasAPagarDeFreteAvulso', 'Texto', '')
        .WriteString('ContasAPagarDeFreteAvulso', 'Campos', 'NUM_DOCUMENTO')

        .WriteString('FormaDePagamento', 'Texto', '')
        .WriteString('FormaDePagamento', 'TexCamposto', 'TPDOCS,NREQUISICAO')

        .Comment('ContasAPagarDeNfCompra', ['Preencher o Texto com a mensagem e colocar o caracter @ antes do campo que deseja imprimir',
                                            'Ex: COMPRA MERC CONF NF @NUM_NF',
                                            'Ao gerar o histórico ficará COMPRA MERC CONF NF 123456']);
    end;

    if VersaoBancoMenor(24.75) then
      Aconfs.New('ped_vnd_imprimir_usuario_que_fechou', 'Imprimir usuário que fechou o Pedido/OS',
                 ';impressao;dav;req;', typeBool, '', 0, 0);

    if VersaoBancoMenor(24.75) then
    begin
	    setConfSisBool('prod_codhex_codbarra', False, buscas,
  	    'Utilizar código simplificado (hexadecimal) ao gerar código de barras para etiquetas', nil);
    end;

    if VersaoBancoMenor(24.77) then
    begin
      Aconf := TConfig_sistema_class.getConf('ped_vnd_impressao_dav_v1', buscas, vDadosIni.cod_empresa);
      try

      Aconfs.New('ped_vnd_impressao_dav_v2', 'Configurações de impressão do modelo AVANÇADO 1 e AVANÇADO 2', ';dav;impressao;', typeBlob, 'v2', 0, 0)
        .WriteString('IMPRESSAO', 'ExibirRazaoFantasiaIdentificacaoEmpresa',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirRazaoFantasiaIdentificacaoEmpresa'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirRazaoFantasiaIdentificacaoEmpresa')), 'IDENTIFICACAO'))
        .WriteString('IMPRESSAO', 'ExibirEnderecoEmp',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirEnderecoEmp'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirEnderecoEmp')), 'S'))
        .WriteString('IMPRESSAO', 'ExibirFoneEmp',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirFoneEmp'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirFoneEmp')), 'S'))
        .WriteString('IMPRESSAO', 'ExibirCNPJEmp',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirCNPJEmp'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirCNPJEmp')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirInscrEstEmp',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirInscrEstEmp'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirInscrEstEmp')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirEmailEmp',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirEmailEmp'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirEmailEmp')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirDescAcrescReqOsOrc',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDescAcrescReqOsOrc'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDescAcrescReqOsOrc')),	'N'))
        .WriteString('IMPRESSAO', 'ExibirDescAcresItem',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDescAcresItem'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDescAcresItem')),	'N'))
        .WriteString('IMPRESSAO', 'ExibirBrutoOsOrc',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirBrutoOsOrc'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirBrutoOsOrc')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirTecnicoMecanicoLinhaAdc',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirTecnicoMecanicoLinhaAdc'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirTecnicoMecanicoLinhaAdc')),	'N'))
        .WriteString('IMPRESSAO', 'ExibirAplicacaoLinhaAdc',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAplicacaoLinhaAdc'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAplicacaoLinhaAdc')),	'N'))
        .WriteString('IMPRESSAO', 'ExibirLocacaoLinhaAdc',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirLocacaoLinhaAdc'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirLocacaoLinhaAdc')),	'N'))
        .WriteString('IMPRESSAO', 'ExibirDeclSPCReqOsOrc',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDeclSPCReqOsOrc'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDeclSPCReqOsOrc')),
               vDadosIni.IfThen(vDadosIni.vEmp.vUsarDeclSPCReq <> 'S', 'N', 'S')))
        .WriteString('IMPRESSAO', 'ExibirOBS',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirOBS'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirOBS')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirEstadoVeicObj',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirEstadoVeicObj'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirEstadoVeicObj')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirDefeito',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDefeito'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDefeito')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirAcessorios',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAcessorios'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAcessorios')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirOBSLivroReg',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirOBSLivroReg'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirOBSLivroReg')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirAtivReparoInstrucacaoInMetr',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAtivReparoInstrucacaoInMetr'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAtivReparoInstrucacaoInMetr')),	'N'))
        .WriteString('IMPRESSAO', 'ExibirPlanoPag',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirPlanoPag'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirPlanoPag')),	'N'))
        .WriteString('IMPRESSAO', 'ExibirFormaPag',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirFormaPag'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirFormaPag')),	'N'))
        .WriteString('IMPRESSAO', 'ExibirAssinatura',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAssinatura'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAssinatura')),	'S'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasEstadoVeicObj',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasEstadoVeicObj'))) <> '',
           	 UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasEstadoVeicObj')), '1'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasDefeitos',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasDefeitos'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasDefeitos')), '1'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasAcessorios',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasAcessorios'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasAcessorios')), '1'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral1',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral1'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral1')), '2'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral2',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral2'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral2')), '1'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasObservacaoLivroRegistro',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasObservacaoLivroRegistro'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasObservacaoLivroRegistro')), '1'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasSelosRemovidos',
        	 vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasSelosRemovidos'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasSelosRemovidos')), '1'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasSelosColocados',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasSelosColocados'))) <> '',
          	 UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasSelosColocados')), '1'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasLacresRemovidos',
        	 vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasLacresRemovidos'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasLacresRemovidos')), '1'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasLacresColocados',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasLacresColocados'))) <> '',
           	 UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasLacresColocados')), '1'))
        .Comment('IMPRESSAO', 'Explicação da impressão do pedido modelo AVANÇADA 1 e AVANÇADA 2')
        .Comment('IMPRESSAO', 'ExibirRazaoFantasiaEmpresa')
        .Comment('IMPRESSAO', '	 Exibir razão social ou nome fantasia ou identificação da empresa (RAZAO/FANTASIA/IDENTIFICACAO)')
        .Comment('IMPRESSAO', 'ExibirEnderecoEmp')
        .Comment('IMPRESSAO', '	 Exibir endereço da empresa no cabeçalho (S/N)')
        .Comment('IMPRESSAO', 'ExibirFoneEmp')
        .Comment('IMPRESSAO', '	 Exibir telefone da empresa no cabeçalho (S/N)')
        .Comment('IMPRESSAO', 'ExibirCNPJEmp')
        .Comment('IMPRESSAO', '	 Exibir CNPJ da empresa no cabeçalho (S/N)')
        .Comment('IMPRESSAO', 'ExibirInscrEstEmp')
        .Comment('IMPRESSAO', '	 Exibir inscrição estadual da empresa no cabeçalho (S/N)')
        .Comment('IMPRESSAO', 'ExibirEmailEmp')
        .Comment('IMPRESSAO', '	 Exibir e-mail da empresa no cabeçalho (S/N)')
        .Comment('IMPRESSAO', 'ExibirDescAcrescReqOsOrc')
        .Comment('IMPRESSAO', '	 Exibir informação de desconto e acréscimo nos totais (S/N)')
        .Comment('IMPRESSAO', 'ExibirDescAcresItem')
        .Comment('IMPRESSAO', '  Exibir valores de desconto e acréscimo nos itens,' +
                              ' caso informe N os campos de desconto e acréscimo do item sempre ficarão zerados,' +
                              ' caso informe V será exibido o valor do desconto e acréscimo do item' +
                              ' e caso informe P será exibido o percentual do desconto e acréscimo do item (N/V/P)')
        .Comment('IMPRESSAO', 'ExibirBrutoOsOrc')
        .Comment('IMPRESSAO', '  Exibir valor bruto nos totais em Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirTecnicoMecanicoLinhaAdc')
        .Comment('IMPRESSAO', '	 Exibir vendedor/técnico/mecânico em uma linha adicional nos itens em Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirAplicacaoLinhaAdc')
        .Comment('IMPRESSAO', '  Exibir aplicação em linha uma adicional nos itens em Requisição/Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirLocacaoLinhaAdc')
        .Comment('IMPRESSAO', '  Exibir locação 1, locação 2 e locação depósito em uma linha adicional nos itens em Requisição/Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirDeclSPCReqOsOrc')
        .Comment('IMPRESSAO', '	 Exbir declaração SPC em Requisição/Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirOBS')
        .Comment('IMPRESSAO', '	 Exibir observações em Requisição/Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirEstadoVeicObj')
        .Comment('IMPRESSAO', '	 Exibir estado veículo/objeto em Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirDefeito')
        .Comment('IMPRESSAO', '	 Exibir defeito veículo/objeto em Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirAcessorios')
        .Comment('IMPRESSAO', '	 Exibir acessórios veículo/objeto em Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirOBSLivroReg')
        .Comment('IMPRESSAO', '	 Exibir observação livro de registro em Requisição/Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirAtivReparoInstrucacaoInMetr')
        .Comment('IMPRESSAO', '	 Exibir informações de atividades de reparo InMetro Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirPlanoPag')
        .Comment('IMPRESSAO', '	 Exibir detalhes do plano de pagamento Requisição/Ordem de Serviço (S/N)')
        .Comment('IMPRESSAO', 'ExibirFormaPag')
        .Comment('IMPRESSAO', '	 Exibir detalhes da forma de pagamento Requisição/Ordem de Serviço (S/N)')
        .Comment('IMPRESSAO', 'ExibirAssinatura')
        .Comment('IMPRESSAO', '	 Exibir assinatura no final do relatório (S/N)')
        .Comment('IMPRESSAO', 'QuantidadeLinhasEstadoVeicObj')
        .Comment('IMPRESSAO', '	 Quantidade de Linhas para Estado do Veículo/Objeto (Máx 3)')
      	.Comment('IMPRESSAO', 'QuantidadeLinhasDefeitos')
        .Comment('IMPRESSAO', '	 Quantidade de Linhas para Defeitos (Máx 3)')
        .Comment('IMPRESSAO', 'QuantidadeLinhasAcessorios')
        .Comment('IMPRESSAO', '	 Quantidade de Linhas para Acessórios (Máx 3)')
        .Comment('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral1')
        .Comment('IMPRESSAO', '	 Quantidade de Linhas para Observação Geral 1 (Máx 3)')
        .Comment('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral2')
        .Comment('IMPRESSAO', '	 Quantidade de Linhas para Observação Geral 2 (Máx 3)')
        .Comment('IMPRESSAO', 'QuantidadeLinhasSelosRemovidos')
        .Comment('IMPRESSAO', '	 Quantidade de Linhas para Selos Removidos (Máx 3)')
        .Comment('IMPRESSAO', 'QuantidadeLinhasSelosColocados')
        .Comment('IMPRESSAO', '	 Quantidade de Linhas para Selos Colocados (Máx 3)')
        .Comment('IMPRESSAO', 'QuantidadeLinhasLacresRemovidos')
        .Comment('IMPRESSAO', '  Quantidade de Linhas para Lacres Removidos (Máx 3)')
        .Comment('IMPRESSAO', 'QuantidadeLinhasLacresColocados')
        .Comment('IMPRESSAO', '  Quantidade de Linhas para Lacres Colocados (Máx 3)');
      finally
        FreeAndNil(Aconf);
      end;
    end;

    if VersaoBancoMenor(24.78) then
    begin
	    setConfSisBool('prod_numfab_codbarra', False, buscas,
  	    'Utilizar o número de fabricante na composição do código de barras na impressão da etiqueta modelo térmico antigo (quando produto não tiver grade)', nil);
    end;

    if VersaoBancoMenor(24.79) then
    begin
      setConfSisBool('cond_pag_padrao_por_tipo', False, buscas,
      	'Utilizar condições de pagamento padrão por tipo REQ, OS, ORC e Comando Faturamento/Contratos' + #13 +
        'Informe o código da condição de pagamento para cada tipo de venda' + #13 +
        'Requisição, Ordem de Serviço, Orçamento e Comando de Faturamento' + #13,
        '[Configuracao]' + #13 +
        'RequisicaoNormal=1' + #13 +
        'RequisicaoRapida=1' + #13 +
        'OrdemServico=1' + #13 +
        'OrcamentoNormal=1' + #13 +
        'OrcamentoRapido=1' + #13 +
        'ComandoFaturamentoContrato=1');
    end;

    if VersaoBancoMenor(24.80) then
    begin
      Aconfs.New('nfe_info_complementar_op_interna_dest_outra_uf', 'Código da informação complementar personalizada para Operação Interna com destinatário de outro estado', '', typeInt, '', vDadosIni.cod_empresa, 0);

      Aconf := TCfg_sis.getConf('nf_hab_validacao_antecipacao_st', buscas, vDadosIni.cod_empresa);
      try
      Aconf.AtivarMapeamentoKeys;
      Aconf.ReadString('Conf', 'DesativarEmOperacaoInterna', 'N');
      if Aconf.KesyChanges then
        Aconf.SaveConfDB(buscas);
      finally
        FreeAndNil(Aconf);
      end;
    end;

    if VersaoBancoMenor(24.81) then
    begin
      Aconf := TConfig_sistema_class.getConf('ped_vnd_impressao_dav_v2', buscas, vDadosIni.cod_empresa);
      try

      Aconfs.New('ped_vnd_impressao_dav_v3', 'Configurações de impressão do modelo AVANÇADO 1 e AVANÇADO 2', ';dav;impressao;', typeBlob, 'v3', 0, 0)
        .WriteString('IMPRESSAO', 'ExibirRazaoFantasiaIdentificacaoEmpresa',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirRazaoFantasiaIdentificacaoEmpresa'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirRazaoFantasiaIdentificacaoEmpresa')), 'IDENTIFICACAO'))
        .WriteString('IMPRESSAO', 'ExibirEnderecoEmp',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirEnderecoEmp'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirEnderecoEmp')), 'S'))
        .WriteString('IMPRESSAO', 'ExibirFoneEmp',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirFoneEmp'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirFoneEmp')), 'S'))
        .WriteString('IMPRESSAO', 'ExibirCNPJEmp',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirCNPJEmp'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirCNPJEmp')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirInscrEstEmp',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirInscrEstEmp'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirInscrEstEmp')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirEmailEmp',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirEmailEmp'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirEmailEmp')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirDescAcrescReqOsOrc',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDescAcrescReqOsOrc'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDescAcrescReqOsOrc')),	'N'))
        .WriteString('IMPRESSAO', 'ExibirDescAcresItem',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDescAcresItem'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDescAcresItem')),	'N'))
        .WriteString('IMPRESSAO', 'ExibirBrutoOsOrc',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirBrutoOsOrc'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirBrutoOsOrc')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirTecnicoMecanicoLinhaAdc',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirTecnicoMecanicoLinhaAdc'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirTecnicoMecanicoLinhaAdc')),	'N'))
        .WriteString('IMPRESSAO', 'ExibirAplicacaoLinhaAdc',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAplicacaoLinhaAdc'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAplicacaoLinhaAdc')),	'N'))
        .WriteString('IMPRESSAO', 'ExibirLocacaoLinhaAdc',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirLocacaoLinhaAdc'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirLocacaoLinhaAdc')),	'N'))
        .WriteString('IMPRESSAO', 'ExibirDeclSPCReqOsOrc',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDeclSPCReqOsOrc'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDeclSPCReqOsOrc')),
               vDadosIni.IfThen(vDadosIni.vEmp.vUsarDeclSPCReq <> 'S', 'N', 'S')))
        .WriteString('IMPRESSAO', 'ExibirOBS',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirOBS'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirOBS')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirEstadoVeicObj',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirEstadoVeicObj'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirEstadoVeicObj')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirDefeito',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDefeito'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDefeito')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirAcessorios',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAcessorios'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAcessorios')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirOBSLivroReg',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirOBSLivroReg'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirOBSLivroReg')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirAtivReparoInstrucacaoInMetr',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAtivReparoInstrucacaoInMetr'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAtivReparoInstrucacaoInMetr')),	'N'))
        .WriteString('IMPRESSAO', 'ExibirPlanoPag',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirPlanoPag'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirPlanoPag')),	'N'))
        .WriteString('IMPRESSAO', 'ExibirFormaPag',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirFormaPag'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirFormaPag')),	'N'))
        .WriteString('IMPRESSAO', 'ExibirAssinatura',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAssinatura'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAssinatura')),	'S'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasEstadoVeicObj',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasEstadoVeicObj'))) <> '',
           	 UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasEstadoVeicObj')), '1'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasDefeitos',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasDefeitos'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasDefeitos')), '1'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasAcessorios',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasAcessorios'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasAcessorios')), '1'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral1',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral1'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral1')), '2'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral2',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral2'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral2')), '1'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasObservacaoLivroRegistro',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasObservacaoLivroRegistro'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasObservacaoLivroRegistro')), '1'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasSelosRemovidos',
        	 vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasSelosRemovidos'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasSelosRemovidos')), '1'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasSelosColocados',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasSelosColocados'))) <> '',
          	 UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasSelosColocados')), '1'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasLacresRemovidos',
        	 vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasLacresRemovidos'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasLacresRemovidos')), '1'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasLacresColocados',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasLacresColocados'))) <> '',
           	 UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasLacresColocados')), '1'))
        .Comment('IMPRESSAO', 'Explicação da impressão do pedido modelo AVANÇADA 1 e AVANÇADA 2')
        .Comment('IMPRESSAO', 'ExibirRazaoFantasiaEmpresa')
        .Comment('IMPRESSAO', '	 Exibir razão social ou nome fantasia ou identificação da empresa (RAZAO/FANTASIA/IDENTIFICACAO)')
        .Comment('IMPRESSAO', 'ExibirEnderecoEmp')
        .Comment('IMPRESSAO', '	 Exibir endereço da empresa no cabeçalho (S/N)')
        .Comment('IMPRESSAO', 'ExibirFoneEmp')
        .Comment('IMPRESSAO', '	 Exibir telefone da empresa no cabeçalho (S/N)')
        .Comment('IMPRESSAO', 'ExibirCNPJEmp')
        .Comment('IMPRESSAO', '	 Exibir CNPJ da empresa no cabeçalho (S/N)')
        .Comment('IMPRESSAO', 'ExibirInscrEstEmp')
        .Comment('IMPRESSAO', '	 Exibir inscrição estadual da empresa no cabeçalho (S/N)')
        .Comment('IMPRESSAO', 'ExibirEmailEmp')
        .Comment('IMPRESSAO', '	 Exibir e-mail da empresa no cabeçalho (S/N)')
        .Comment('IMPRESSAO', 'ExibirDescAcrescReqOsOrc')
        .Comment('IMPRESSAO', '	 Exibir informação de desconto e acréscimo nos totais (S/N)')
        .Comment('IMPRESSAO', 'ExibirDescAcresItem')
        .Comment('IMPRESSAO', '  Exibir valores de desconto e acréscimo nos itens,' +
                              ' caso informe N os campos de desconto e acréscimo do item sempre ficarão zerados,' +
                              ' caso informe V será exibido o valor do desconto e acréscimo do item' +
                              ' e caso informe P será exibido o percentual do desconto e acréscimo do item (N/V/P)')
        .Comment('IMPRESSAO', 'ExibirBrutoOsOrc')
        .Comment('IMPRESSAO', '  Exibir valor bruto nos totais em Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirTecnicoMecanicoLinhaAdc')
        .Comment('IMPRESSAO', '	 Exibir vendedor/técnico/mecânico em uma linha adicional nos itens em Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirAplicacaoLinhaAdc')
        .Comment('IMPRESSAO', '  Exibir aplicação em linha uma adicional nos itens em Requisição/Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirLocacaoLinhaAdc')
        .Comment('IMPRESSAO', '  Exibir locação 1, locação 2 e locação depósito em uma linha adicional nos itens em Requisição/Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirDeclSPCReqOsOrc')
        .Comment('IMPRESSAO', '	 Exbir declaração SPC em Requisição/Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirOBS')
        .Comment('IMPRESSAO', '	 Exibir observações em Requisição/Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirEstadoVeicObj')
        .Comment('IMPRESSAO', '	 Exibir estado veículo/objeto em Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirDefeito')
        .Comment('IMPRESSAO', '	 Exibir defeito veículo/objeto em Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirAcessorios')
        .Comment('IMPRESSAO', '	 Exibir acessórios veículo/objeto em Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirOBSLivroReg')
        .Comment('IMPRESSAO', '	 Exibir observação livro de registro em Requisição/Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirAtivReparoInstrucacaoInMetr')
        .Comment('IMPRESSAO', '	 Exibir informações de atividades de reparo InMetro Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirPlanoPag')
        .Comment('IMPRESSAO', '	 Exibir detalhes do plano de pagamento Requisição/Ordem de Serviço (S/N)')
        .Comment('IMPRESSAO', 'ExibirFormaPag')
        .Comment('IMPRESSAO', '	 Exibir detalhes da forma de pagamento Requisição/Ordem de Serviço (S/N)')
        .Comment('IMPRESSAO', 'ExibirAssinatura')
        .Comment('IMPRESSAO', '	 Exibir assinatura no final do relatório (S/N)')
        .Comment('IMPRESSAO', 'QuantidadeLinhasEstadoVeicObj')
        .Comment('IMPRESSAO', '	 Quantidade de Linhas para Estado do Veículo/Objeto (Máx 4)')
      	.Comment('IMPRESSAO', 'QuantidadeLinhasDefeitos')
        .Comment('IMPRESSAO', '	 Quantidade de Linhas para Defeitos (Máx 4)')
        .Comment('IMPRESSAO', 'QuantidadeLinhasAcessorios')
        .Comment('IMPRESSAO', '	 Quantidade de Linhas para Acessórios (Máx 4)')
        .Comment('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral1')
        .Comment('IMPRESSAO', '	 Quantidade de Linhas para Observação Geral 1 (Máx 4)')
        .Comment('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral2')
        .Comment('IMPRESSAO', '	 Quantidade de Linhas para Observação Geral 2 (Máx 4)')
        .Comment('IMPRESSAO', 'QuantidadeLinhasSelosRemovidos')
        .Comment('IMPRESSAO', '	 Quantidade de Linhas para Selos Removidos (Máx 4)')
        .Comment('IMPRESSAO', 'QuantidadeLinhasSelosColocados')
        .Comment('IMPRESSAO', '	 Quantidade de Linhas para Selos Colocados (Máx 4)')
        .Comment('IMPRESSAO', 'QuantidadeLinhasLacresRemovidos')
        .Comment('IMPRESSAO', '  Quantidade de Linhas para Lacres Removidos (Máx 4)')
        .Comment('IMPRESSAO', 'QuantidadeLinhasLacresColocados')
        .Comment('IMPRESSAO', '  Quantidade de Linhas para Lacres Colocados (Máx 4)');
      finally
        FreeAndNil(Aconf);
      end;
    end;

    if VersaoBancoMenor(24.82) then
    begin
    	setConfSisBool('vei_desabilitar_chassi', False, buscas,
  	    'Desabilitar campo chassi do cadastro de veículo (oficina)', nil);
    end;

    if VersaoBancoMenor(24.83) then
    begin
      Aconf := TConfig_sistema_class.getConf('ped_vnd_impressao_dav_v3', buscas, vDadosIni.cod_empresa);
      try
      
      Aconfs.New('ped_vnd_impressao_dav_v4', 'Configurações de impressão do modelo AVANÇADO 1 e AVANÇADO 2', ';dav;impressao;', typeBlob, 'v4', 0, 0)
        .WriteString('IMPRESSAO', 'ExibirRazaoFantasiaIdentificacaoEmpresa',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirRazaoFantasiaIdentificacaoEmpresa'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirRazaoFantasiaIdentificacaoEmpresa')), 'IDENTIFICACAO'))
        .WriteString('IMPRESSAO', 'ExibirEnderecoEmp',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirEnderecoEmp'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirEnderecoEmp')), 'S'))
        .WriteString('IMPRESSAO', 'ExibirFoneEmp',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirFoneEmp'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirFoneEmp')), 'S'))
        .WriteString('IMPRESSAO', 'ExibirCNPJEmp',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirCNPJEmp'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirCNPJEmp')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirInscrEstEmp',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirInscrEstEmp'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirInscrEstEmp')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirEmailEmp',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirEmailEmp'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirEmailEmp')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirDescAcrescReqOsOrc',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDescAcrescReqOsOrc'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDescAcrescReqOsOrc')), 'N'))
        .WriteString('IMPRESSAO', 'ExibirDescAcresItem',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDescAcresItem'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDescAcresItem')),	'N'))
        .WriteString('IMPRESSAO', 'ExibirBrutoOsOrc',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirBrutoOsOrc'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirBrutoOsOrc')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirTecnicoMecanicoLinhaAdc',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirTecnicoMecanicoLinhaAdc'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirTecnicoMecanicoLinhaAdc')),	'N'))
        .WriteString('IMPRESSAO', 'ExibirAplicacaoLinhaAdc',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAplicacaoLinhaAdc'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAplicacaoLinhaAdc')),	'N'))
        .WriteString('IMPRESSAO', 'ExibirLocacaoLinhaAdc',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirLocacaoLinhaAdc'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirLocacaoLinhaAdc')),	'N'))
        .WriteString('IMPRESSAO', 'ExibirDeclSPCReqOsOrc',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDeclSPCReqOsOrc'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDeclSPCReqOsOrc')),
               vDadosIni.IfThen(vDadosIni.vEmp.vUsarDeclSPCReq <> 'S', 'N', 'S')))
        .WriteString('IMPRESSAO', 'ExibirOBS',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirOBS'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirOBS')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirEstadoVeicObj',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirEstadoVeicObj'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirEstadoVeicObj')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirDefeito',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDefeito'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDefeito')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirAcessorios',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAcessorios'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAcessorios')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirOBSLivroReg',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirOBSLivroReg'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirOBSLivroReg')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirOBSAdicional',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirOBSAdicional'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirOBSAdicional')), 'S'))
        .WriteString('IMPRESSAO', 'ExibirAtivReparoInstrucacaoInMetr',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAtivReparoInstrucacaoInMetr'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAtivReparoInstrucacaoInMetr')),	'N'))
        .WriteString('IMPRESSAO', 'ExibirPlanoPag',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirPlanoPag'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirPlanoPag')), 'N'))
        .WriteString('IMPRESSAO', 'ExibirFormaPag',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirFormaPag'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirFormaPag')), 'N'))
        .WriteString('IMPRESSAO', 'ExibirAssinatura',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAssinatura'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAssinatura')), 'S'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasEstadoVeicObj',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasEstadoVeicObj'))) <> '',
           	 UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasEstadoVeicObj')), '1'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasDefeitos',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasDefeitos'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasDefeitos')), '1'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasAcessorios',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasAcessorios'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasAcessorios')), '1'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral1',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral1'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral1')), '2'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral2',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral2'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral2')), '1'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasObservacaoLivroRegistro',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasObservacaoLivroRegistro'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasObservacaoLivroRegistro')), '1'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasObservacaoAdicional',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasObservacaoAdicional'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasObservacaoAdicional')), '1'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasSelosRemovidos',
        	 vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasSelosRemovidos'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasSelosRemovidos')), '1'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasSelosColocados',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasSelosColocados'))) <> '',
          	 UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasSelosColocados')), '1'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasLacresRemovidos',
        	 vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasLacresRemovidos'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasLacresRemovidos')), '1'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasLacresColocados',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasLacresColocados'))) <> '',
           	 UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasLacresColocados')), '1'))
        .Comment('IMPRESSAO', 'Explicação da impressão do pedido modelo AVANÇADA 1 e AVANÇADA 2')
        .Comment('IMPRESSAO', 'ExibirRazaoFantasiaEmpresa')
        .Comment('IMPRESSAO', '	 Exibir razão social ou nome fantasia ou identificação da empresa (RAZAO/FANTASIA/IDENTIFICACAO)')
        .Comment('IMPRESSAO', 'ExibirEnderecoEmp')
        .Comment('IMPRESSAO', '	 Exibir endereço da empresa no cabeçalho (S/N)')
        .Comment('IMPRESSAO', 'ExibirFoneEmp')
        .Comment('IMPRESSAO', '	 Exibir telefone da empresa no cabeçalho (S/N)')
        .Comment('IMPRESSAO', 'ExibirCNPJEmp')
        .Comment('IMPRESSAO', '	 Exibir CNPJ da empresa no cabeçalho (S/N)')
        .Comment('IMPRESSAO', 'ExibirInscrEstEmp')
        .Comment('IMPRESSAO', '	 Exibir inscrição estadual da empresa no cabeçalho (S/N)')
        .Comment('IMPRESSAO', 'ExibirEmailEmp')
        .Comment('IMPRESSAO', '	 Exibir e-mail da empresa no cabeçalho (S/N)')
        .Comment('IMPRESSAO', 'ExibirDescAcrescReqOsOrc')
        .Comment('IMPRESSAO', '	 Exibir informação de desconto e acréscimo nos totais (S/N)')
        .Comment('IMPRESSAO', 'ExibirDescAcresItem')
        .Comment('IMPRESSAO', '  Exibir valores de desconto e acréscimo nos itens,' +
                              ' caso informe N os campos de desconto e acréscimo do item sempre ficarão zerados,' +
                              ' caso informe V será exibido o valor do desconto e acréscimo do item' +
                              ' e caso informe P será exibido o percentual do desconto e acréscimo do item (N/V/P)')
        .Comment('IMPRESSAO', 'ExibirBrutoOsOrc')
        .Comment('IMPRESSAO', '  Exibir valor bruto nos totais em Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirTecnicoMecanicoLinhaAdc')
        .Comment('IMPRESSAO', '	 Exibir vendedor/técnico/mecânico em uma linha adicional nos itens em Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirAplicacaoLinhaAdc')
        .Comment('IMPRESSAO', '  Exibir aplicação em linha uma adicional nos itens em Requisição/Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirLocacaoLinhaAdc')
        .Comment('IMPRESSAO', '  Exibir locação 1, locação 2 e locação depósito em uma linha adicional nos itens em Requisição/Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirDeclSPCReqOsOrc')
        .Comment('IMPRESSAO', '	 Exbir declaração SPC em Requisição/Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirOBS')
        .Comment('IMPRESSAO', '	 Exibir observações em Requisição/Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirEstadoVeicObj')
        .Comment('IMPRESSAO', '	 Exibir estado veículo/objeto em Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirDefeito')
        .Comment('IMPRESSAO', '	 Exibir defeito veículo/objeto em Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirAcessorios')
        .Comment('IMPRESSAO', '	 Exibir acessórios veículo/objeto em Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirOBSLivroReg')
        .Comment('IMPRESSAO', '	 Exibir observação livro de registro em Requisição/Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirOBSAdicional')
        .Comment('IMPRESSAO', '	 Exibir observação adicional em Requisição/Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirAtivReparoInstrucacaoInMetr')
        .Comment('IMPRESSAO', '	 Exibir informações de atividades de reparo InMetro Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirPlanoPag')
        .Comment('IMPRESSAO', '	 Exibir detalhes do plano de pagamento Requisição/Ordem de Serviço (S/N)')
        .Comment('IMPRESSAO', 'ExibirFormaPag')
        .Comment('IMPRESSAO', '	 Exibir detalhes da forma de pagamento Requisição/Ordem de Serviço (S/N)')
        .Comment('IMPRESSAO', 'ExibirAssinatura')
        .Comment('IMPRESSAO', '	 Exibir assinatura no final do relatório (S/N)')
        .Comment('IMPRESSAO', 'QuantidadeLinhasEstadoVeicObj')
        .Comment('IMPRESSAO', '	 Quantidade de Linhas para Estado do Veículo/Objeto (Máx 4)')
      	.Comment('IMPRESSAO', 'QuantidadeLinhasDefeitos')
        .Comment('IMPRESSAO', '	 Quantidade de Linhas para Defeitos (Máx 4)')
        .Comment('IMPRESSAO', 'QuantidadeLinhasAcessorios')
        .Comment('IMPRESSAO', '	 Quantidade de Linhas para Acessórios (Máx 4)')
        .Comment('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral1')
        .Comment('IMPRESSAO', '	 Quantidade de Linhas para Observação Geral 1 (Máx 4)')
        .Comment('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral2')
        .Comment('IMPRESSAO', '	 Quantidade de Linhas para Observação Geral 2 (Máx 4)')
        .Comment('IMPRESSAO', 'QuantidadeLinhasObservacaoLivroRegistro')
        .Comment('IMPRESSAO', '	 Quantidade de Linhas para Livro de Registro (Máx 4)')
        .Comment('IMPRESSAO', 'QuantidadeLinhasObservacaoAdicional')
        .Comment('IMPRESSAO', '	 Quantidade de Linhas para Observação Adicional (Máx 4)')
        .Comment('IMPRESSAO', 'QuantidadeLinhasSelosRemovidos')
        .Comment('IMPRESSAO', '	 Quantidade de Linhas para Selos Removidos (Máx 4)')
        .Comment('IMPRESSAO', 'QuantidadeLinhasSelosColocados')
        .Comment('IMPRESSAO', '	 Quantidade de Linhas para Selos Colocados (Máx 4)')
        .Comment('IMPRESSAO', 'QuantidadeLinhasLacresRemovidos')
        .Comment('IMPRESSAO', '  Quantidade de Linhas para Lacres Removidos (Máx 4)')
        .Comment('IMPRESSAO', 'QuantidadeLinhasLacresColocados')
        .Comment('IMPRESSAO', '  Quantidade de Linhas para Lacres Colocados (Máx 4)');
      finally
        FreeAndNil(Aconf);
      end;
    end;


    if VersaoBancoMenor(24.84) then
    begin
      with Aconfs.New do
      begin
        chave     := 'ped_vnd_imprimir_fech';
        display_  := 'Imprimir somente documento fechado';
        tag       := ';req;os;impressao;';
        type1_    := typeBlob;
        with value1_b do
        begin
          Add('[Conf_REQ]');
          Add('Ativa=N');
          Add('TipV=V,A,P,D');

          Add('');
          Add('[Conf_OS]');
          Add('Ativa=N');
          Add('TipoOS=CLIENTE,CORTESIA,EXTERNA,INTERNA,GARANTIA');
        end;
      end;

      with Aconfs.New do
      begin
        chave     := 'vei_imprimir_fech';
        display_  := 'Imprimir somente documento fechado';
        tag       := ';vei;impressao;';
        type1_    := typeBlob;
        with value1_b do
        begin
          Add('[Conf_E_VEI]');
          Add('Ativa=N');
          Add('TipV=AV,CC,CDCP,CDCT,CNH,CP,CT,CTA,CTR,CTV,LSG,PP');

          Add('');
          Add('[Conf_S_VEI]');
          Add('Ativa=N');
          Add('TipV=AV,CC,CDCP,CDCT,CNH,CP,CT,CTA,CTR,CTV,LSG,PP');
        end;
      end;
    end;

    if VersaoBancoMenor(24.85) then
    begin
    	with Aconfs.New do
      begin
        chave     := 'ped_vnd_vendedor_carteira';
        display_  := 'Atribuir vendedor da carteira ao informar cliente na REQ/OS/ORC';
        tag       := ';req;os;orc;vendedor;carteira;';
        type1_    := typeBlob;
        with value1_b do
        begin
          Add('[Conf_REQ]');
          Add('Ativa=N');

          Add('');
          Add('[Conf_OS]');
          Add('Ativa=N');

          Add('');
          Add('[Conf_ORC]');
          Add('Ativa=N');
        end;
      end;
    end;

    if VersaoBancoMenor(24.86) then
      Aconfs.New('nfe_referencia_sigilosa', 'Enviar NFe com refenrencias de outras NFs de forma sigilosa',
                 ';nfe;sigilo;referencia;', typeBool, '', vDadosIni.cod_empresa, 0);

    if VersaoBancoMenor(24.87) then
    begin
      Aconfs.New('nf_e_custos', 'Configurações para calculo de custo em entradas de Notas Fiscais', ';nf;entrada;custo;notafiscal;', typeBlob, '', vDadosIni.cod_empresa, 0)
        .WriteString('Diminuir', 'CreditoICMS', vDadosIni.vEmp.vDebCred)
        .WriteString('Diminuir', 'CreditoPISCOFINS', 'N')
    end;

    if VersaoBancoMenor(24.88) then
    begin
    	Aconfs.New('nf_e_compra_conferencia', 'Configurações para conferencia de valores relacionados a entrada de compras',
                 ';nf;compra;custo;entrada;', typeBlob, '', vDadosIni.cod_empresa, 0)
      	.WriteString('ValorUnitario', 'Conferir', 'S')
      	.WriteString('ValorUnitario', 'NumeroDeUltimasEntradas', '3')
      	.WriteString('ValorUnitario', 'PercentualLimiteAcima', '100')
      	.WriteString('ValorUnitario', 'PercentualLimiteAbaixo', '50')

      	.WriteString('UnidadeMedida', 'Conferir', 'N')
      	.WriteString('UnidadeMedida', 'DivergeDoEstoque', 'S')
      	.WriteString('UnidadeMedida', 'DivergeUltimaEntrada', 'S')
        .Comment('ValorUnitario', 'O "NumeroDeUltimasEntradas" diz ao sistema quantas notas anteriores ele deve considerar')
        .Comment('ValorUnitario', 'O "PercentualLimiteAcima" é quanto maior está o valor unitário do item na NF atual em relação a média das ultimas entradas')
        .Comment('ValorUnitario', 'O "PercentualLimiteAbaixo" é quanto menor está o valor unitário do item na NF atual em relação a média das ultimas entradas')
        .Comment('UnidadeMedida', 'Ativa a conferencia do campo de Unidade de Medida, se diverge com o estoque e/ou a ultima entrada', True);
    end;     

    if VersaoBancoMenor(24.89) then
    begin
      Aconfs.New('nf_etiqueta_danfe', 'Configurações para impressão de etiquetas relacionadas ao DANFe', ';nf;saida;etiqueta;notafiscal;', typeBlob, '', vDadosIni.cod_empresa, 0)
        .WriteString('Conf', 'TelaImpressaoEtiquetas', 'S')
        .WriteString('Conf', 'TelaImpressaoDANFe', 'N')
        .WriteString('Conf', 'TelaAutorizacao', 'N');
    end;

    if VersaoBancoMenor(24.90) then
    begin
    	setConfSisStr('boletos_mensagem_whatsapp', 'Assunto Padrão', buscas,
        'Assunto e Mensagem padrão whatsapp boletos', 'Mensagem Padrão');
    end;

    if VersaoBancoMenor(24.91) then
    begin
    	setConfSisBool('e-commerce_status_indisponivel', False, buscas,
        'Atribuir status indisponível quando produto no E-commerce não tiver estoque', nil);
    end;

    if VersaoBancoMenor(24.92) then
    begin
    	setConfSisBool('nf_e_conversao_ean_exata', False, buscas,
        'Na conversão do EAN validar a unidade de medida da nota fiscal ser exatamente igual a configurada na conversão', nil);
    end;

    if VersaoBancoMenor(24.93) then
    begin
    	setConfSisStr('contratos_clientes_mensagem_whatsapp', 'Assunto Padrão', buscas,
        'Assunto e Mensagem padrão whatsapp contratos clientes', 'Mensagem Padrão');
    end;

    if VersaoBancoMenor(24.94) then
    begin
    	setConfSisInt('ped_vnd_os_ctrl_iss_retido_nfse', 0, buscas,
        'Código do controle para o registro do IIS Retido na forma de pagamento da NFSe',
        'Utilizar controle configurado como baixa automática ou configurado para não gerar financeiro');
    end;

    if VersaoBancoMenor(24.95) then
    begin
      Aconf := TConfig_sistema_class.getConf('nf_ibpt_consulta_tributos', buscas, vDadosIni.cod_empresa);
      try
      if Aconf.AsString = '' then // Versao dessa alteracao
      begin
        Aconf.value1_vc := '1';
        Aconf.WriteString('Conf', 'ValidarNCMsEmissaoNFe', 'S')
          .Comment('Conf', 'Ativa a validação da existencia e vigência do NCM no cadastro do IBPT');
        Aconf.SaveConfDB(buscas);
      end;
      finally
        FreeAndNil(Aconf);
      end;
    end;

    if VersaoBancoMenor(24.96) then
    begin
    	with Aconfs.New do
      begin
        chave     := 'ped_vnd_impressao_recibo_locacao';
        display_  := 'Configurações de impressão do modelo RECIBO LOCAÇÃO';
        tag       := ';recibo_locacao;impressao;';
        type1_    := typeBlob;
        with value1_b do
        begin
        	Add('');
          Add('[Conf_Geral]');
          Add('ImprimirAposRecebimentoCXL=N');

          Add('');
          Add('[Conf_Produto]');
          Add('Exibir=S');

          Add('');
          Add('[Conf_Servico]');
          Add('Exibir=S');
          Add('Origem=|TODOS|R|M|G|S|E|L|O|C|');

          Add('');
          Add('[Conf_ProdTerc]');
          Add('Exibir=S');

          Add('');
          Add('[Conf_ServTerc]');
          Add('Exibir=S');
        end;
      end;
    end;      

    if VersaoBancoMenor(24.97) then
    begin
      Aconf := TConfig_sistema_class.getConf('efd_icms_escrituracao', buscas, vDadosIni.cod_empresa);
      try
      if Aconf.AsString = '' then // Versao dessa alteracao
      begin
        Aconf.value1_vc := '1';
        Aconf.WriteString('ICMSSN', 'NaoEscriturarIcmsProprioEmitenteSimplesNacional', 'S')
          .Comment('ICMSSN', 'NaoEscriturarIcmsProprioEmitenteSimplesNacional = S. Vai remover o valor de ICMS dos campos próprios apenas, quando emitente Simples Nacional', True);
        Aconf.SaveConfDB(buscas);
      end;
      finally
        FreeAndNil(Aconf);
      end;
    end;

    if VersaoBancoMenor(24.98) then
    begin
      setConfSisStr('ped_vnd_definir_politica_pagamento', '', buscas,
        'Usar politicas de pagamento da Venda ao montar forma de pagamento',
        'Usar o controle e condição de pagamento na venda para montar recebimento' + #13 + #13 +
        '[CONTROLE]' + #13 +
        'Usar=' + vDadosIni.IfThen(vDadosIni.vEmp.vUsarControlesVenda = 'S', 'S', 'N') + #13 + #13 +
        '[COND_PAG]' + #13 +
        'Usar=N');
    end;

    if VersaoBancoMenor(24.99) then
    begin
      Aconfs.New('inv_cfop_compra_rel_icms', 'Relação de cfops de compra para relatório de ICMS do Estoque', ';icms;icmsst;estoque;inventario;', typeBlob, '', vDadosIni.cod_empresa, 0)
        .value1_b.Add('1101,1102,1111,1113,1116,1117,1118,1120,1121,1122,1126,' + sLineBreak +
                      '1251,1252,1253,1254,1255,1256,1257,1401,1403,1406,1407,1551,1556,1651,1652,1653,' + sLineBreak +
                      '2101,2102,2111,2113,2116,2117,2118,2120,2121,2122,2126,' + sLineBreak +
                      '2251,2252,2253,2254,2255,2256,2257,2401,2403,2406,2407,2551,2556,2651,2652,2653,' + sLineBreak +
                      '3101,3102,3126,3127,3217,3251,3551,3556,3651,3652,3653,1128,2128,3128,3129');
    end;

    if VersaoBancoMenor(25.00) then
    begin
    	setConfSisBool('cxl_hab_rel2_res_fechamento', False, buscas,
        'Habilitar segundo relatório resumo fechamento caixa auxiliar', nil);
	  end;

    if VersaoBancoMenor(25.01) then
      Aconfs.New('nf_s_retencoes_federais', 'Controles para registro de despesas das Retenções Federais', ';retencao;federal;ir;csll;pis;cofins;', typeBool, '', vDadosIni.cod_empresa, 0)
        .WriteInteger('Controles', 'Retencao_IRRF', 0)
        .WriteInteger('Controles', 'Retencao_CSLL', 0)
        .WriteInteger('Controles', 'Retencao_PIS', 0)
        .WriteInteger('Controles', 'Retencao_COFINS', 0)
        .WriteInteger('Controles', 'Retencao_CP', 0);

    if VersaoBancoMenor(25.02) then
    begin
    	setConfSisStr('e-commerce_lancar_taxa_interm_pag', 'DINHEIRO', buscas,
        'Lançar taxa do intermediador de pagamento:',
        'Favor informar a forma como o sistema irá lançar a taxa do intermediador de pagamento:'  + #13 + #13 +
        'Exemplo: ' + #13 + #13 +
        'DINHEIRO - Lançar taxa do intermediador de pagamento no controle dinheiro' + #13 +
        'RECEBIMENTO - Lançar taxa do intermediador de pagamento ao receber forma de pagamento utilizando controles de documentos "N-DINHEIRO/BANCO" e ao quitar créditos');
    end;

    if VersaoBancoMenor(25.03) then
    begin
    	setConfSisStr('conc_cartao_versao', '1', buscas,
        'Versão da conciliação cartão',
        'Favor informar a versão da conciliação cartão:' + #13 + #13 +
        'Exemlo: ' + #13 + #13 +
        '1' + #13 +
        '2' + #13 +
        '3');
	  end;

    if VersaoBancoMenor(25.04) then
    begin
    	setConfSisStr('conc_cartao_data_versao_cielo', '16/01/2024', buscas,
        'Processar arquivos da nova versão Cielo a partir da data informada - Concilicação Cartão', nil);
	  end;

    if VersaoBancoMenor(25.05) then
    begin
    	setConfSisStr('conc_cartao_versao_layout_cielo', '015', buscas,
        'Versão do layout da conciliação cartão (cielo)', nil);
	  end;

    if VersaoBancoMenor(25.06) then
    begin
    	setConfSisBool('ctp_exibir_renociacoes_contas', True, buscas,
        'Exibir renegociações de contas a pagar',
        'Por padrão esta habilitado para exibir as renegociações');
	  end;

    if VersaoBancoMenor(25.07) then
    begin
    	setConfSisBool('contratos_clientes_env_ctr', False, buscas,
        'Configuração para envio de contratos clientes',
        '[Conf]' + #13 +
        'PausarCadaQuantosContratos=10' + #13 +
        'PausarPorQuantosSegungos=30');
    end;


    if VersaoBancoMenor(25.08) then
    begin
      Aconf := TConfig_sistema_class.getConf('ped_vnd_impressao_dav_v4', buscas, vDadosIni.cod_empresa);
      try

      Aconfs.New('ped_vnd_impressao_dav_v5', 'Configurações de impressão do modelo AVANÇADO 1 e AVANÇADO 2', ';dav;impressao;', typeBlob, 'v5', 0, 0)
        .WriteString('IMPRESSAO', 'ExibirRazaoFantasiaIdentificacaoEmpresa',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirRazaoFantasiaIdentificacaoEmpresa'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirRazaoFantasiaIdentificacaoEmpresa')), 'IDENTIFICACAO'))
        .WriteString('IMPRESSAO', 'ExibirEnderecoEmp',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirEnderecoEmp'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirEnderecoEmp')), 'S'))
        .WriteString('IMPRESSAO', 'ExibirFoneEmp',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirFoneEmp'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirFoneEmp')), 'S'))
        .WriteString('IMPRESSAO', 'ExibirCNPJEmp',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirCNPJEmp'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirCNPJEmp')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirInscrEstEmp',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirInscrEstEmp'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirInscrEstEmp')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirEmailEmp',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirEmailEmp'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirEmailEmp')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirDescAcrescReqOsOrc',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDescAcrescReqOsOrc'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDescAcrescReqOsOrc')), 'N'))
        .WriteString('IMPRESSAO', 'ExibirDescAcresItem',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDescAcresItem'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDescAcresItem')),	'N'))
        .WriteString('IMPRESSAO', 'ExibirBrutoOsOrc',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirBrutoOsOrc'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirBrutoOsOrc')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirTecnicoMecanicoLinhaAdc',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirTecnicoMecanicoLinhaAdc'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirTecnicoMecanicoLinhaAdc')),	'N'))
        .WriteString('IMPRESSAO', 'ExibirAplicacaoLinhaAdc',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAplicacaoLinhaAdc'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAplicacaoLinhaAdc')),	'N'))
        .WriteString('IMPRESSAO', 'ExibirLocacaoLinhaAdc',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirLocacaoLinhaAdc'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirLocacaoLinhaAdc')),	'N'))
        .WriteString('IMPRESSAO', 'ExibirDeclSPCReqOsOrc',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDeclSPCReqOsOrc'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDeclSPCReqOsOrc')),
               vDadosIni.IfThen(vDadosIni.vEmp.vUsarDeclSPCReq <> 'S', 'N', 'S')))
        .WriteString('IMPRESSAO', 'ExibirOBS',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirOBS'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirOBS')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirEstadoVeicObj',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirEstadoVeicObj'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirEstadoVeicObj')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirDefeito',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDefeito'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDefeito')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirAcessorios',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAcessorios'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAcessorios')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirOBSLivroReg',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirOBSLivroReg'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirOBSLivroReg')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirOBSAdicional',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirOBSAdicional'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirOBSAdicional')), 'S'))
        .WriteString('IMPRESSAO', 'ExibirAtivReparoInstrucacaoInMetr',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAtivReparoInstrucacaoInMetr'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAtivReparoInstrucacaoInMetr')),	'N'))
        .WriteString('IMPRESSAO', 'ExibirPlanoPag',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirPlanoPag'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirPlanoPag')), 'N'))
        .WriteString('IMPRESSAO', 'ExibirFormaPag',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirFormaPag'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirFormaPag')), 'N'))
        .WriteString('IMPRESSAO', 'ExibirAssinatura',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAssinatura'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAssinatura')), 'S'))
        .WriteString('IMPRESSAO', 'AgruparTotalPorProdServProdTServT',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'AgruparTotalPorProdServProdTServT'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'AgruparTotalPorProdServProdTServT')), 'N'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasEstadoVeicObj',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasEstadoVeicObj'))) <> '',
           	 UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasEstadoVeicObj')), '1'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasDefeitos',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasDefeitos'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasDefeitos')), '1'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasAcessorios',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasAcessorios'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasAcessorios')), '1'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral1',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral1'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral1')), '2'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral2',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral2'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral2')), '1'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasObservacaoLivroRegistro',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasObservacaoLivroRegistro'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasObservacaoLivroRegistro')), '1'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasObservacaoAdicional',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasObservacaoAdicional'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasObservacaoAdicional')), '1'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasSelosRemovidos',
        	 vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasSelosRemovidos'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasSelosRemovidos')), '1'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasSelosColocados',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasSelosColocados'))) <> '',
          	 UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasSelosColocados')), '1'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasLacresRemovidos',
        	 vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasLacresRemovidos'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasLacresRemovidos')), '1'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasLacresColocados',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasLacresColocados'))) <> '',
           	 UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasLacresColocados')), '1'))
        .Comment('IMPRESSAO', 'Explicação da impressão do pedido modelo AVANÇADA 1 e AVANÇADA 2')
        .Comment('IMPRESSAO', 'ExibirRazaoFantasiaEmpresa')
        .Comment('IMPRESSAO', '	 Exibir razão social ou nome fantasia ou identificação da empresa (RAZAO/FANTASIA/IDENTIFICACAO)')
        .Comment('IMPRESSAO', 'ExibirEnderecoEmp')
        .Comment('IMPRESSAO', '	 Exibir endereço da empresa no cabeçalho (S/N)')
        .Comment('IMPRESSAO', 'ExibirFoneEmp')
        .Comment('IMPRESSAO', '	 Exibir telefone da empresa no cabeçalho (S/N)')
        .Comment('IMPRESSAO', 'ExibirCNPJEmp')
        .Comment('IMPRESSAO', '	 Exibir CNPJ da empresa no cabeçalho (S/N)')
        .Comment('IMPRESSAO', 'ExibirInscrEstEmp')
        .Comment('IMPRESSAO', '	 Exibir inscrição estadual da empresa no cabeçalho (S/N)')
        .Comment('IMPRESSAO', 'ExibirEmailEmp')
        .Comment('IMPRESSAO', '	 Exibir e-mail da empresa no cabeçalho (S/N)')
        .Comment('IMPRESSAO', 'ExibirDescAcrescReqOsOrc')
        .Comment('IMPRESSAO', '	 Exibir informação de desconto e acréscimo nos totais (S/N)')
        .Comment('IMPRESSAO', 'ExibirDescAcresItem')
        .Comment('IMPRESSAO', '  Exibir valores de desconto e acréscimo nos itens,' +
                              ' caso informe N os campos de desconto e acréscimo do item sempre ficarão zerados,' +
                              ' caso informe V será exibido o valor do desconto e acréscimo do item' +
                              ' e caso informe P será exibido o percentual do desconto e acréscimo do item (N/V/P)')
        .Comment('IMPRESSAO', 'ExibirBrutoOsOrc')
        .Comment('IMPRESSAO', '  Exibir valor bruto nos totais em Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirTecnicoMecanicoLinhaAdc')
        .Comment('IMPRESSAO', '	 Exibir vendedor/técnico/mecânico em uma linha adicional nos itens em Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirAplicacaoLinhaAdc')
        .Comment('IMPRESSAO', '  Exibir aplicação em linha uma adicional nos itens em Requisição/Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirLocacaoLinhaAdc')
        .Comment('IMPRESSAO', '  Exibir locação 1, locação 2 e locação depósito em uma linha adicional nos itens em Requisição/Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirDeclSPCReqOsOrc')
        .Comment('IMPRESSAO', '	 Exbir declaração SPC em Requisição/Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirOBS')
        .Comment('IMPRESSAO', '	 Exibir observações em Requisição/Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirEstadoVeicObj')
        .Comment('IMPRESSAO', '	 Exibir estado veículo/objeto em Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirDefeito')
        .Comment('IMPRESSAO', '	 Exibir defeito veículo/objeto em Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirAcessorios')
        .Comment('IMPRESSAO', '	 Exibir acessórios veículo/objeto em Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirOBSLivroReg')
        .Comment('IMPRESSAO', '	 Exibir observação livro de registro em Requisição/Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirOBSAdicional')
        .Comment('IMPRESSAO', '	 Exibir observação adicional em Requisição/Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirAtivReparoInstrucacaoInMetr')
        .Comment('IMPRESSAO', '	 Exibir informações de atividades de reparo InMetro Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirPlanoPag')
        .Comment('IMPRESSAO', '	 Exibir detalhes do plano de pagamento Requisição/Ordem de Serviço (S/N)')
        .Comment('IMPRESSAO', 'ExibirFormaPag')
        .Comment('IMPRESSAO', '	 Exibir detalhes da forma de pagamento Requisição/Ordem de Serviço (S/N)')
        .Comment('IMPRESSAO', 'ExibirAssinatura')
        .Comment('IMPRESSAO', '	 Exibir assinatura no final do relatório (S/N)')
        .Comment('IMPRESSAO', 'AgruparTotalPorProdServProdTServT')
        .Comment('IMPRESSAO', '	 Agrupar Total por Tipo (Prod/Serv/Prod Terc/Serv Terc)')
        .Comment('IMPRESSAO', 'QuantidadeLinhasEstadoVeicObj')
        .Comment('IMPRESSAO', '	 Quantidade de Linhas para Estado do Veículo/Objeto (Máx 4)')
      	.Comment('IMPRESSAO', 'QuantidadeLinhasDefeitos')
        .Comment('IMPRESSAO', '	 Quantidade de Linhas para Defeitos (Máx 4)')
        .Comment('IMPRESSAO', 'QuantidadeLinhasAcessorios')
        .Comment('IMPRESSAO', '	 Quantidade de Linhas para Acessórios (Máx 4)')
        .Comment('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral1')
        .Comment('IMPRESSAO', '	 Quantidade de Linhas para Observação Geral 1 (Máx 4)')
        .Comment('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral2')
        .Comment('IMPRESSAO', '	 Quantidade de Linhas para Observação Geral 2 (Máx 4)')
        .Comment('IMPRESSAO', 'QuantidadeLinhasObservacaoLivroRegistro')
        .Comment('IMPRESSAO', '	 Quantidade de Linhas para Livro de Registro (Máx 4)')
        .Comment('IMPRESSAO', 'QuantidadeLinhasObservacaoAdicional')
        .Comment('IMPRESSAO', '	 Quantidade de Linhas para Observação Adicional (Máx 4)')
        .Comment('IMPRESSAO', 'QuantidadeLinhasSelosRemovidos')
        .Comment('IMPRESSAO', '	 Quantidade de Linhas para Selos Removidos (Máx 4)')
        .Comment('IMPRESSAO', 'QuantidadeLinhasSelosColocados')
        .Comment('IMPRESSAO', '	 Quantidade de Linhas para Selos Colocados (Máx 4)')
        .Comment('IMPRESSAO', 'QuantidadeLinhasLacresRemovidos')
        .Comment('IMPRESSAO', '  Quantidade de Linhas para Lacres Removidos (Máx 4)')
        .Comment('IMPRESSAO', 'QuantidadeLinhasLacresColocados')
        .Comment('IMPRESSAO', '  Quantidade de Linhas para Lacres Colocados (Máx 4)');
      finally
        FreeAndNil(Aconf);
      end;
    end;

    if VersaoBancoMenor(25.09) then
    begin
      Aconf := TConfig_sistema_class.getConf('ped_vnd_impressao_dav_v5', buscas, vDadosIni.cod_empresa);
      try

      Aconfs.New('ped_vnd_impressao_dav_v6', 'Configurações de impressão do modelo AVANÇADO 1 e AVANÇADO 2', ';dav;impressao;', typeBlob, 'v6', 0, 0)
        .WriteString('IMPRESSAO', 'ExibirRazaoFantasiaIdentificacaoEmpresa',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirRazaoFantasiaIdentificacaoEmpresa'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirRazaoFantasiaIdentificacaoEmpresa')), 'IDENTIFICACAO'))
        .WriteString('IMPRESSAO', 'ExibirEnderecoEmp',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirEnderecoEmp'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirEnderecoEmp')), 'S'))
        .WriteString('IMPRESSAO', 'ExibirFoneEmp',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirFoneEmp'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirFoneEmp')), 'S'))
        .WriteString('IMPRESSAO', 'ExibirCNPJEmp',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirCNPJEmp'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirCNPJEmp')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirInscrEstEmp',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirInscrEstEmp'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirInscrEstEmp')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirEmailEmp',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirEmailEmp'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirEmailEmp')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirDescAcrescReqOsOrc',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDescAcrescReqOsOrc'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDescAcrescReqOsOrc')), 'N'))
        .WriteString('IMPRESSAO', 'ExibirDescAcresItem',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDescAcresItem'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDescAcresItem')),	'N'))
        .WriteString('IMPRESSAO', 'ExibirBrutoOsOrc',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirBrutoOsOrc'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirBrutoOsOrc')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirTecnicoMecanicoLinhaAdc',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirTecnicoMecanicoLinhaAdc'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirTecnicoMecanicoLinhaAdc')),	'N'))
        .WriteString('IMPRESSAO', 'ExibirAplicacaoLinhaAdc',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAplicacaoLinhaAdc'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAplicacaoLinhaAdc')),	'N'))
        .WriteString('IMPRESSAO', 'ExibirLocacaoLinhaAdc',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirLocacaoLinhaAdc'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirLocacaoLinhaAdc')),	'N'))
        .WriteString('IMPRESSAO', 'ExibirDeclSPCReqOsOrc',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDeclSPCReqOsOrc'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDeclSPCReqOsOrc')),
               vDadosIni.IfThen(vDadosIni.vEmp.vUsarDeclSPCReq <> 'S', 'N', 'S')))
        .WriteString('IMPRESSAO', 'ExibirOBS',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirOBS'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirOBS')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirEstadoVeicObj',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirEstadoVeicObj'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirEstadoVeicObj')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirDefeito',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDefeito'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDefeito')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirAcessorios',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAcessorios'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAcessorios')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirOBSLivroReg',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirOBSLivroReg'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirOBSLivroReg')),	'S'))
        .WriteString('IMPRESSAO', 'ExibirOBSAdicional',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirOBSAdicional'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirOBSAdicional')), 'S'))
        .WriteString('IMPRESSAO', 'ExibirAtivReparoInstrucacaoInMetr',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAtivReparoInstrucacaoInMetr'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAtivReparoInstrucacaoInMetr')),	'N'))
        .WriteString('IMPRESSAO', 'ExibirPlanoPag',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirPlanoPag'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirPlanoPag')), 'N'))
        .WriteString('IMPRESSAO', 'ExibirFormaPag',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirFormaPag'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirFormaPag')), 'N'))
        .WriteString('IMPRESSAO', 'ExibirControleFormaPag',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirControleFormaPag'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirControleFormaPag')), 'N'))
        .WriteString('IMPRESSAO', 'ExibirAssinatura',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAssinatura'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAssinatura')), 'S'))
        .WriteString('IMPRESSAO', 'AgruparTotalPorProdServProdTServT',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'AgruparTotalPorProdServProdTServT'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'AgruparTotalPorProdServProdTServT')), 'N'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasEstadoVeicObj',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasEstadoVeicObj'))) <> '',
           	 UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasEstadoVeicObj')), '1'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasDefeitos',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasDefeitos'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasDefeitos')), '1'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasAcessorios',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasAcessorios'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasAcessorios')), '1'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral1',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral1'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral1')), '2'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral2',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral2'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral2')), '1'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasObservacaoLivroRegistro',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasObservacaoLivroRegistro'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasObservacaoLivroRegistro')), '1'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasObservacaoAdicional',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasObservacaoAdicional'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasObservacaoAdicional')), '1'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasSelosRemovidos',
        	 vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasSelosRemovidos'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasSelosRemovidos')), '1'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasSelosColocados',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasSelosColocados'))) <> '',
          	 UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasSelosColocados')), '1'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasLacresRemovidos',
        	 vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasLacresRemovidos'))) <> '',
             UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasLacresRemovidos')), '1'))
        .WriteString('IMPRESSAO', 'QuantidadeLinhasLacresColocados',
           vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasLacresColocados'))) <> '',
           	 UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasLacresColocados')), '1'))
        .Comment('IMPRESSAO', 'Explicação da impressão do pedido modelo AVANÇADA 1 e AVANÇADA 2')
        .Comment('IMPRESSAO', 'ExibirRazaoFantasiaEmpresa')
        .Comment('IMPRESSAO', '	 Exibir razão social ou nome fantasia ou identificação da empresa (RAZAO/FANTASIA/IDENTIFICACAO)')
        .Comment('IMPRESSAO', 'ExibirEnderecoEmp')
        .Comment('IMPRESSAO', '	 Exibir endereço da empresa no cabeçalho (S/N)')
        .Comment('IMPRESSAO', 'ExibirFoneEmp')
        .Comment('IMPRESSAO', '	 Exibir telefone da empresa no cabeçalho (S/N)')
        .Comment('IMPRESSAO', 'ExibirCNPJEmp')
        .Comment('IMPRESSAO', '	 Exibir CNPJ da empresa no cabeçalho (S/N)')
        .Comment('IMPRESSAO', 'ExibirInscrEstEmp')
        .Comment('IMPRESSAO', '	 Exibir inscrição estadual da empresa no cabeçalho (S/N)')
        .Comment('IMPRESSAO', 'ExibirEmailEmp')
        .Comment('IMPRESSAO', '	 Exibir e-mail da empresa no cabeçalho (S/N)')
        .Comment('IMPRESSAO', 'ExibirDescAcrescReqOsOrc')
        .Comment('IMPRESSAO', '	 Exibir informação de desconto e acréscimo nos totais (S/N)')
        .Comment('IMPRESSAO', 'ExibirDescAcresItem')
        .Comment('IMPRESSAO', '  Exibir valores de desconto e acréscimo nos itens,' +
                              ' caso informe N os campos de desconto e acréscimo do item sempre ficarão zerados,' +
                              ' caso informe V será exibido o valor do desconto e acréscimo do item' +
                              ' e caso informe P será exibido o percentual do desconto e acréscimo do item (N/V/P)')
        .Comment('IMPRESSAO', 'ExibirBrutoOsOrc')
        .Comment('IMPRESSAO', '  Exibir valor bruto nos totais em Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirTecnicoMecanicoLinhaAdc')
        .Comment('IMPRESSAO', '	 Exibir vendedor/técnico/mecânico em uma linha adicional nos itens em Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirAplicacaoLinhaAdc')
        .Comment('IMPRESSAO', '  Exibir aplicação em linha uma adicional nos itens em Requisição/Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirLocacaoLinhaAdc')
        .Comment('IMPRESSAO', '  Exibir locação 1, locação 2 e locação depósito em uma linha adicional nos itens em Requisição/Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirDeclSPCReqOsOrc')
        .Comment('IMPRESSAO', '	 Exbir declaração SPC em Requisição/Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirOBS')
        .Comment('IMPRESSAO', '	 Exibir observações em Requisição/Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirEstadoVeicObj')
        .Comment('IMPRESSAO', '	 Exibir estado veículo/objeto em Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirDefeito')
        .Comment('IMPRESSAO', '	 Exibir defeito veículo/objeto em Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirAcessorios')
        .Comment('IMPRESSAO', '	 Exibir acessórios veículo/objeto em Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirOBSLivroReg')
        .Comment('IMPRESSAO', '	 Exibir observação livro de registro em Requisição/Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirOBSAdicional')
        .Comment('IMPRESSAO', '	 Exibir observação adicional em Requisição/Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirAtivReparoInstrucacaoInMetr')
        .Comment('IMPRESSAO', '	 Exibir informações de atividades de reparo InMetro Ordem de Serviço/Orçamento (S/N)')
        .Comment('IMPRESSAO', 'ExibirPlanoPag')
        .Comment('IMPRESSAO', '	 Exibir detalhes do plano de pagamento Requisição/Ordem de Serviço (S/N)')
        .Comment('IMPRESSAO', 'ExibirFormaPag')
        .Comment('IMPRESSAO', '	 Exibir detalhes da forma de pagamento Requisição/Ordem de Serviço (S/N)')
        .Comment('IMPRESSAO', 'ExibirControleFormaPag')
        .Comment('IMPRESSAO', '	 Exibir detalhes da forma de pagamento e controle Requisição/Ordem de Serviço (S/N)')
        .Comment('IMPRESSAO', 'ExibirAssinatura')
        .Comment('IMPRESSAO', '	 Exibir assinatura no final do relatório (S/N)')
        .Comment('IMPRESSAO', 'AgruparTotalPorProdServProdTServT')
        .Comment('IMPRESSAO', '	 Agrupar Total por Tipo (Prod/Serv/Prod Terc/Serv Terc)')
        .Comment('IMPRESSAO', 'QuantidadeLinhasEstadoVeicObj')
        .Comment('IMPRESSAO', '	 Quantidade de Linhas para Estado do Veículo/Objeto (Máx 4)')
      	.Comment('IMPRESSAO', 'QuantidadeLinhasDefeitos')
        .Comment('IMPRESSAO', '	 Quantidade de Linhas para Defeitos (Máx 4)')
        .Comment('IMPRESSAO', 'QuantidadeLinhasAcessorios')
        .Comment('IMPRESSAO', '	 Quantidade de Linhas para Acessórios (Máx 4)')
        .Comment('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral1')
        .Comment('IMPRESSAO', '	 Quantidade de Linhas para Observação Geral 1 (Máx 4)')
        .Comment('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral2')
        .Comment('IMPRESSAO', '	 Quantidade de Linhas para Observação Geral 2 (Máx 4)')
        .Comment('IMPRESSAO', 'QuantidadeLinhasObservacaoLivroRegistro')
        .Comment('IMPRESSAO', '	 Quantidade de Linhas para Livro de Registro (Máx 4)')
        .Comment('IMPRESSAO', 'QuantidadeLinhasObservacaoAdicional')
        .Comment('IMPRESSAO', '	 Quantidade de Linhas para Observação Adicional (Máx 4)')
        .Comment('IMPRESSAO', 'QuantidadeLinhasSelosRemovidos')
        .Comment('IMPRESSAO', '	 Quantidade de Linhas para Selos Removidos (Máx 4)')
        .Comment('IMPRESSAO', 'QuantidadeLinhasSelosColocados')
        .Comment('IMPRESSAO', '	 Quantidade de Linhas para Selos Colocados (Máx 4)')
        .Comment('IMPRESSAO', 'QuantidadeLinhasLacresRemovidos')
        .Comment('IMPRESSAO', '  Quantidade de Linhas para Lacres Removidos (Máx 4)')
        .Comment('IMPRESSAO', 'QuantidadeLinhasLacresColocados')
        .Comment('IMPRESSAO', '  Quantidade de Linhas para Lacres Colocados (Máx 4)');
      finally
        FreeAndNil(Aconf);
      end;
    end;

    if VersaoBancoMenor(25.10) then
    begin
    	setConfSisBool('ped_vnd_exibir_form_pag', False, buscas,
        'Exibir forma de pagamento na impressão do DAV', nil);
    end;

    if VersaoBancoMenor(25.11) then
    begin
    	setConfSisBool('contratos_clientes_env_ctr_rec_loc_nfs', False, buscas,
      	'Enviar Recibo de Locação ou NFS',
        'Por padrão o sistema o sistema envia o Recibo de Locação e NFS' + #13 +
        'Quando esta configuracao for ativada ' + #13 +
        'será enviado o Recibo de Locação para OS com serviço(s) de origem de locação ' + #13 +
        'e para OS com serviço(s) de origem diferente(s) de locação será enviado NFS');
    end;

    if VersaoBancoMenor(25.12) then
    begin
    	setConfSisBool('ped_vnd_acresc_condpag_comissao_vend', False, buscas,
      	'Calcular acréscimo no item de acordo com a condição de pagamento e comissão do vendedor',
        '[Configuracao]' + #13 +
        'FatorPrazoPag=0,10' + #13 +
        'PercComissaoVendedor=5' + #13 +
        'TipoREQ=TODOS,V,A' + #13 +
        'TipoOS=TODOS,CLIENTE,EXTERNA' + #13 +
        'TipoORC=TODOS,V,A') ;
    end;

  	if VersaoBancoMenor(25.13) then
    begin
    	setConfSisBool('contratos_clientes_testar_gerar', False, buscas,
      	'Testar ao gerar faturamento contrato cliente',
        '[Configuracao]' + #13 +
        'ClienteBarrado=S' + #13 +
        'ClienteLimiteCreditoEstourado=S' + #13 +
        'ClienteDebito=S');
    end;

    if VersaoBancoMenor(25.14) then
    begin
      Aconfs.New('nf_s_icms_interestadual', 'Configuração para operação com ICMS Interestadual - Destaque quando não tem aliquota no produto', ';nf;notafiscal;nfe;', typeBlob, '', vDadosIni.cod_empresa, 0)
        .WriteString('Regra_UF_99', 'Destacar_quando_cliente_contribuinte', 'S')
        .WriteString('Regra_UF_99', 'Destacar_quando_cliente_nao_contribuinte', 'N')
        .WriteString('Regra_UF_99', 'Destacar_quando_cliente_isento', 'N')
        .WriteString('Regra_UF_99', 'Destacar_quando_consumo_final_sim', 'N')
        .WriteString('Regra_UF_99', 'Destacar_quando_consumo_final_nao', 'S')
        .Comment('Conf', 'Regra_UF_99 = Regra geral para utilizar a aliquota interestadual 12, 7 o 4')
        .Comment('Conf', 'Substituir o 99 pela sigla da UF caso queria uma regra diferente exclusiva para UF, ex: Regra_UF_ES');
    end;

    if VersaoBancoMenor(25.15) then
    begin
      Aconf := TConfig_sistema_class.getConf('ped_vnd_acresc_condpag_comissao_vend', buscas, vDadosIni.cod_empresa);
      try
      if Aconf.AsString = '' then // Versao dessa alteracao
      begin
        Aconf.value1_vc := '1';
        Aconf.WriteString('Configuracao', 'ComissaoMaxVendedor', '7');
        Aconf.SaveConfDB(buscas);
      end;
      finally
        FreeAndNil(Aconf);
      end;
    end;

    if VersaoBancoMenor(25.16) then
    begin
      Aconf := TConfig_sistema_class.getConf('ped_vnd_acresc_condpag_comissao_vend', buscas, vDadosIni.cod_empresa);
      try
      if (Aconf.AsString = '') or (Aconf.AsString = '1') then // Versao dessa alteracao
      begin
        Aconf.value1_vc := '2';
        Aconf.WriteString('Configuracao', 'ComissaoMinVendedor', '3');
        Aconf.SaveConfDB(buscas);
      end;
      finally
        FreeAndNil(Aconf);
      end;
    end;

    if VersaoBancoMenor(25.17) then
    begin
      Aconf := TConfig_sistema_class.getConf('ped_vnd_acresc_condpag_comissao_vend', buscas, vDadosIni.cod_empresa);
      try
      if (Aconf.AsString = '') or (Aconf.AsString = '1') or (Aconf.AsString = '2') then // Versao dessa alteracao
      begin
        Aconf.value1_vc := '3';
        Aconf.WriteString('Configuracao', 'RelUsarValorLiquidoBruto', 'ACRESC_BRUTO_DESC_LIQUIDO')
        .Comment('Configuracao', 'RelUsarValorLiquidoBruto')
        .Comment('Configuracao', '  BRUTO - Utilizar o valor bruto do item para calculo da comissao')
        .Comment('Configuracao', '  LIQUIDO - Utilizar o valor liquido do item para calculo da comissao')
        .Comment('Configuracao', '  LIQUIDO_MENOS_CONDPAG - Utilizar o valor liquido menos o percentual da condição de pagamento do item para calculo da comissao')
        .Comment('Configuracao', '  LIQUIDO_MENOS_VEND_CONDPAG - Utilizar o valor liquido menos a comissão do vendedor e percentual da condição de pagamento do item para calculo da comissao')
        .Comment('Configuracao', '  ACRESC_BRUTO_DESC_LIQUIDO - Utilizar o valor liquido quando existir desconto no item e valor bruto quando não existir para calculo da comissao');
        Aconf.SaveConfDB(buscas);
      end;
      finally
        FreeAndNil(Aconf);
      end;
    end;

    if VersaoBancoMenor(25.18) then
    begin
      Aconf := TConfig_sistema_class.getConf('ped_vnd_acresc_condpag_comissao_vend', buscas, vDadosIni.cod_empresa);
      try
      if (Aconf.AsString = '') or (Aconf.AsString = '1') or (Aconf.AsString = '2') or (Aconf.AsString = '3') then // Versao dessa alteracao
      begin
        Aconf.value1_vc := '4';
        Aconf.WriteString('Configuracao', 'CalculoValorProd', 'MULTIPLICAR')
        .Comment('Configuracao', 'RelUsarValorLiquidoBruto')
        .Comment('Configuracao', '  BRUTO - Utilizar o valor bruto do item para calculo da comissao')
        .Comment('Configuracao', '  LIQUIDO - Utilizar o valor liquido do item para calculo da comissao')
        .Comment('Configuracao', '  LIQUIDO_MENOS_CONDPAG - Utilizar o valor liquido menos o percentual da condição de pagamento do item para calculo da comissao')
        .Comment('Configuracao', '  LIQUIDO_MENOS_VEND_CONDPAG - Utilizar o valor liquido menos a comissão do vendedor e percentual da condição de pagamento do item para calculo da comissao')
        .Comment('Configuracao', '  ACRESC_BRUTO_DESC_LIQUIDO - Utilizar o valor liquido quando existir desconto no item e valor bruto quando não existir para calculo da comissao')
        .Comment('Configuracao', 'CalculoValorProd')
        .Comment('Configuracao', '  MULTIPLICAR - Valor Prod * ( 1 + (Perc Vend (0,035) + Perc Cond (0,03)) )')
        .Comment('Configuracao', '  DIVIDIR     - Valor Prod / ( 1 - (Perc Vend (0,035) + Perc Cond (0,03)) )');
        Aconf.SaveConfDB(buscas);
      end;
      finally
        FreeAndNil(Aconf);
      end;
    end;

    if VersaoBancoMenor(25.19) then
    begin
      Aconfs.New('cl_faturamento_conf', 'Configuração para o faturamento do cliente (barrar / desbarrar)', ';barrar;negativar;desbarrar;desnegativar;', typeBlob, '', vDadosIni.cod_empresa, 0)
        .WriteString('Configuracao', 'CrediarioVencidosApartirDestaData', '01/01/2024')
        .WriteString('Configuracao', 'UsarDataAtualDataFinanceiro', 'Financeiro')
        .WriteString('Configuracao', 'AbrirTelaBarramentoUmaVezPorDia', 'N')
        .WriteString('Configuracao', 'BarraAutomaticamenteAposVencCrediario', 'N')
        .Comment('Configuracao', 'CrediarioVencidosApartirDestaData')
        .Comment('Configuracao', '  Considerar crédiarios vencimentos a partir desta data de vencimento')
        .Comment('Configuracao', 'UsarDataAtualDataFinanceiro')
        .Comment('Configuracao', '  Atual      - Considerar crediário vencidos após data atual')
        .Comment('Configuracao', '  Financeiro - Considerar crediário vencidos após data do financeiro')
        .Comment('Configuracao', 'AbrirTelaBarramentoUmaVezPorDia')
        .Comment('Configuracao', '  S - Abrir tela para barramento dos clientes com créditos/cheque vencidos uma vez por dia (data vencimento + dias carência)')
        .Comment('Configuracao', '  N - Não abrir tela para barramento dos clientes')
        .Comment('Configuracao', 'BarraAutomaticamenteAposVencCrediario')
        .Comment('Configuracao', '  S - Automaticamente será barrado os clientes com créditos vencidos (data vencimento + dias carência)')
        .Comment('Configuracao', '  N - Não será barrado automaticamente os clientes');
    end;

  	if VersaoBancoMenor(25.20) then
    begin
    	setConfSisBool('ctp_exibir_valor_formaspag', True, buscas,
        'Exibir valor das formas de pagamento no campo "Form Pag" do contas a pagar',
        'Por padrão esta habilitado para exibir o valor das formas de pagamento no campo "Form Pag" do contas a pagar');
	  end;

    if VersaoBancoMenor(25.21) then
    begin
      Aconfs.New('rec_hab_vencimento', 'Configuração para vencimento do recibo antecipado e vale compra', ';recibo;antecipado;vale;compra;', typeBlob, '', vDadosIni.cod_empresa, 0)
        .WriteString('Configuracao', 'UtilizarDataVencimento', 'N')
        .WriteString('Configuracao', 'RecAntValeCompraApartirDestaData', '01/01/2024')
        .WriteString('Configuracao', 'DiasVencimento', '365')
        .WriteString('Configuracao', 'UsarDataAtualDataFinanceiro', 'Financeiro')
        .WriteString('Configuracao', 'BaixarAutomaticamentoAposVencRecAntValeCompra', 'N')
        .Comment('Configuracao', 'UtilizarDataVencimento')
        .Comment('Configuracao', '  S - Utilizar data de vencimento')
        .Comment('Configuracao', '  N - Não utilizar data de vencimento')
        .Comment('Configuracao', 'RecAntValeCompraApartirDestaData')
        .Comment('Configuracao', '  Considerar recibo antecipado / vale compra vencimentos a partir desta data de vencimento')
        .Comment('Configuracao', 'DiasVencimento')
        .Comment('Configuracao', '  Dias acrescidos a data atual no campo data de vencimento recibo antecipado / vale compra')
        .Comment('Configuracao', 'UsarDataAtualDataFinanceiro')
        .Comment('Configuracao', '  Atual      - Considerar recibo antecipado / vale compra vencidos após data atual')
        .Comment('Configuracao', '  Financeiro - Considerar recibo antecipado / vale compra após data do financeiro')
        .Comment('Configuracao', 'BaixarAutomaticamentoAposVencRecAntValeCompra')
        .Comment('Configuracao', '  S - Realizar baixa no recibo antecipado / vale compra após vencimento')
        .Comment('Configuracao', '  N - Não realizar baixa no recibo antecipado / vale compra após vencimento');
    end;


  	if VersaoBancoMenor(25.22) then
    begin
	    setConfSisInt('pag_online_tempo_sinc_mensagens', 0, buscas,
        'Intervalo de Verificação de Mensagens do Serviço de Pagamento Online para o Sistema Retaguarda (Min)', nil);

      setConfSisBool('pag_online_receber_notificacao', False, buscas,
        'Habilitar recebimento de notificações do Serviço de Pagamento Online',
        nil);
    end;

//    if VersaoBancoMenor(25.23) then
//    begin
//    	Aconfs.New('plub_boletos_api_conf', 'Configuração para uso api boleto', ';plug;boleto;', typeBlob, '', vDadosIni.cod_empresa, 0)
//        .WriteString('CONFIGURACOES', 'TempoEntreTentativas', '50')
//        .WriteString('CONFIGURACOES', 'TempoAguardarCadaTentativa', '50')
//        .WriteString('CONFIGURACOES', 'QuantidadeTentativas', '5')
//        .WriteString('CONFIGURACOES', 'QuantidadeTentativasDownload', '5')
//        .WriteString('CONFIGURACOES', 'TimeoutDownload', '3000');
//    end;

//    if VersaoBancoMenor(25.24) then
//    begin
//    	Aconf := TConfig_sistema_class.getConf('plub_boletos_api_conf', buscas, vDadosIni.cod_empresa);
//      try
//      if Aconf.AsString = '' then // Versao dessa alteracao
//      begin
//        Aconf.value1_vc := '1';
//        if trim(Aconf.ReadString('CONFIGURACOES', 'QuantidadeTentativasDownload')) = '' then
//        	Aconf.WriteString('CONFIGURACOES', 'QuantidadeTentativasDownload', '5');
//        if trim(Aconf.ReadString('CONFIGURACOES', 'TimeoutDownload')) = '' then
//        	Aconf.WriteString('CONFIGURACOES', 'TimeoutDownload', '3000');
//        Aconf.SaveConfDB(buscas);
//      end;
//      finally
//        FreeAndNil(Aconf);
//      end;
//    end;

  	if VersaoBancoMenor(25.25) then
    begin
	    setConfSisBool('nfse_simples_nacional_aliq', False, buscas,
        'Usar aliquota única do Simples Nacional(Cadastro Empresa)', nil);
    end;

  	if VersaoBancoMenor(25.26) then
    begin
    	with Aconfs.New('prod_cad_est_por_emp', 'Configuração ficha do estoque do produto por empresa',
                     ';produto;ficha;estoque;', typeBlob, '', 0, 0) do
      begin
        WriteString('Conf', 'Empresas'               , '0');
        WriteString('Conf', 'SomarEmpresaSemEstoque' , 'N');
        WriteString('Conf', 'ExibirSomaTotalEstoque' , 'N');
        value1_b.Add('');
        value1_b.Add('#Empresas                = Exemplos: 0 - Todas Empresas | 1 - Empresa 1 | 1,2,3 - Empresa 1, 2 e 3');
        value1_b.Add('#SomarEmpresaSemEstoque  = S - Somar ao estoque do produto onde empresas com estoque negativo');
        value1_b.Add('#ExibirSomaTotalEstoque  = S - Apresentar total do estoque do produto');
      end;
    end;

    if VersaoBancoMenor(25.27) then
    begin
    	with Aconfs.New('e-commerce_estoque', 'Configuração estoque para produtos do E-Commerce',
                     ';e-commerce;estoque;', typeBlob, '', 0, 0) do
      begin
        WriteString('Conf', 'Empresas'                 , '0');
        WriteString('Conf', 'SomarEmpresaSemEstoque'   , 'N');
        WriteString('Conf', 'UtilizarSomaTotalEstoque' , 'N');
        value1_b.Add('');
        value1_b.Add('#Empresas                 = Exemplos: 0 - Todas Empresas | 1 - Empresa 1 | 1,2,3 - Empresa 1, 2 e 3');
        value1_b.Add('#SomarEmpresaSemEstoque   = S - Somar ao estoque do produto empresas com estoque negativo');
        value1_b.Add('#UtilizarSomaTotalEstoque = S - Utilizar total do estoque do produto');
      end;
    end;

    if VersaoBancoMenor(25.28) then
    begin
    	Aconf := TConfig_sistema_class.getConf('prod_cad_est_por_emp', buscas, vDadosIni.cod_empresa);
      try
      if Aconf.AsString = '' then // Versao dessa alteracao
      begin
        vEmpresas                 := trim(Aconf.ReadString('Conf', 'Empresas'));
        vEmpresas                 := UpperCase(IfThen(trim(vEmpresas) = '', '0', trim(vEmpresas)));

        vSomarEmpresaSemEstoque   := trim(Aconf.ReadString('Conf', 'SomarEmpresaSemEstoque'));
        vSomarEmpresaSemEstoque   := UpperCase(IfThen(trim(vSomarEmpresaSemEstoque) = '', 'N', trim(vSomarEmpresaSemEstoque)));

        vExibirSomaTotalEstoque := trim(Aconf.ReadString('Conf', 'ExibirSomaTotalEstoque'));
        vExibirSomaTotalEstoque := UpperCase(IfThen(trim(vExibirSomaTotalEstoque) = '', 'N', trim(vExibirSomaTotalEstoque)));

      	Aconf.value1_vc := '1';
        Aconf.value1_b.Text := '';

        Aconf.WriteString('Conf', 'Empresas'                 , vEmpresas)
        	.Comment('Conf', ['Empresas',
          									'	0 - Todas Empresas',
                            '	1 - Empresa 1',
                            '	1,2,3 - Empresa 1, 2 e 3']);
        Aconf.WriteString('Conf', 'SomarEmpresaSemEstoque'   , vSomarEmpresaSemEstoque)
        	.Comment('Conf', ['SomarEmpresaSemEstoque',
          								  '	S - Somar ao estoque do produto empresas com estoque negativo']);
        Aconf.WriteString('Conf', 'ExibirSomaTotalEstoque' , vExibirSomaTotalEstoque)
        	.Comment('Conf', ['ExibirSomaTotalEstoque',
          								  '	S - Apresentar total do estoque do produto']);

        try
          vStringList := TStringList.Create;
          vStringList.Clear;
          vStringList.Text := Aconf.value1_b.Text;

          vStringList2 := TStringList.Create;
          vStringList2.Clear;

          for I := 0 to vStringList.Count - 1 do
          	if trim(vStringList[I]) <> '' then
          		vStringList2.Add(trim(vStringList[I]));

          Aconf.value1_b.Text := vStringList2.Text;
        finally
        	if Assigned(vStringList) then
          	FreeAndNil(vStringList);
          if Assigned(vStringList2) then
          	FreeAndNil(vStringList2);
        end;
        Aconf.SaveConfDB(buscas);
      end;
      finally
        FreeAndNil(Aconf);
      end;
    end;

    if VersaoBancoMenor(25.29) then
    begin
    	Aconf := TConfig_sistema_class.getConf('e-commerce_estoque', buscas, vDadosIni.cod_empresa);
      try
      if Aconf.AsString = '' then // Versao dessa alteracao
      begin
        vEmpresas                 := trim(Aconf.ReadString('Conf', 'Empresas'));
        vEmpresas                 := UpperCase(IfThen(trim(vEmpresas) = '', '0', trim(vEmpresas)));

        vSomarEmpresaSemEstoque   := trim(Aconf.ReadString('Conf', 'SomarEmpresaSemEstoque'));
        vSomarEmpresaSemEstoque   := UpperCase(IfThen(trim(vSomarEmpresaSemEstoque) = '', 'N', trim(vSomarEmpresaSemEstoque)));

        vUtilizarSomaTotalEstoque := trim(Aconf.ReadString('Conf', 'UtilizarSomaTotalEstoque'));
        vUtilizarSomaTotalEstoque := UpperCase(IfThen(trim(vUtilizarSomaTotalEstoque) = '', 'N', trim(vUtilizarSomaTotalEstoque)));

        vUtilizarPreco            := trim(Aconf.ReadString('Conf', 'UtilizarPreco'));
        vUtilizarPreco            := UpperCase(IfThen(trim(vUtilizarPreco) = '', 'PADRAO', trim(vUtilizarPreco)));

        Aconf.value1_vc := '1';
        Aconf.display_  := 'Configuração estoque e preço para produtos do E-Commerce';
        Aconf.tag       := ';e-commerce;estoque;preco;';
      	Aconf.value1_b.Text := '';

        Aconf.WriteString('Conf', 'Empresas'                 , vEmpresas)
        	.Comment('Conf', ['Empresas',
          									'	0 - Todas Empresas',
                            '	1 - Empresa 1',
                            '	1,2,3 - Empresa 1, 2 e 3']);
        Aconf.WriteString('Conf', 'SomarEmpresaSemEstoque'   , vSomarEmpresaSemEstoque)
        	.Comment('Conf', ['SomarEmpresaSemEstoque',
          								  '	S - Somar ao estoque do produto empresas com estoque negativo']);
        Aconf.WriteString('Conf', 'UtilizarSomaTotalEstoque' , vUtilizarSomaTotalEstoque)
        	.Comment('Conf', ['UtilizarSomaTotalEstoque',
          								  '	S - Utilizar total do estoque do produto']);
        Aconf.WriteString('Conf', 'UtilizarPreco'					   , vUtilizarPreco)
          .Comment('Conf', ['UtilizarPreco',
                            '	PADRAO - Utilizar o preço padrão E-Commerce',
                            '	MAIOR  - Utilizar o maior preço entre as empresas com estoque',
                            '	MENOR  - Utilizar o menor preço entre as empresas com estoque']);

        try
          vStringList := TStringList.Create;
          vStringList.Clear;
          vStringList.Text := Aconf.value1_b.Text;

          vStringList2 := TStringList.Create;
          vStringList2.Clear;

          for I := 0 to vStringList.Count - 1 do
          	if trim(vStringList[I]) <> '' then
          		vStringList2.Add(trim(vStringList[I]));

          Aconf.value1_b.Text := vStringList2.Text;
        finally
        	if Assigned(vStringList) then
          	FreeAndNil(vStringList);
          if Assigned(vStringList2) then
          	FreeAndNil(vStringList2);
        end;

        Aconf.SaveConfDB(buscas);
      end;
      finally
        FreeAndNil(Aconf);
      end;
    end;

    if VersaoBancoMenor(25.30) then
    begin
      Aconf := TConfig_sistema_class.getConf('nf_inf_pedido_compra', buscas, vDadosIni.cod_empresa);
      try
      if Aconf.AsString = '' then
      begin
        Aconf.value1_b.Text := ReplaceStr(Aconf.value1_b.Text, '# Quando os campos não forem preenchidos no item do Pedido/OS e Ativar=S a nota vai utilizar o numero interno do mesmo e a sequencia do item no Pedido/OS', '');
        Aconf.value1_vc := '1';
        Aconf.WriteString('CadastroPedidosClienteNFe', 'PreencheNotaFiscalAutomaticamente', 'S')
          .Comment('NF_Saida_Origem_REQ', 'Quando os campos não forem preenchidos no item do Pedido/OS e Ativar=S a nota vai utilizar o numero interno do mesmo e a sequencia do item no Pedido/OS')
          .Comment('CadastroPedidosClienteNFe',
            ['Preencher os campos de numero do pedido e numero do item automaticamente ao confirmar a nota fiscal',
             'O preenchimeto é feito com base no cadastro de Pedidos Compra Cliente NFe'], True
          );
        Aconf.SaveConfDB(buscas);
      end;
      finally
        FreeAndNil(Aconf);
      end;
    end;

    if VersaoBancoMenor(25.31) then
    begin
    	Aconfs.New('prod_cad_exibir_obs_det_carac', 'Configuração para exibir observações e detalhes / características', ';produtos;observacao;detalhe;', typeBlob, '', 0, 0)
    		.WriteString('Conf', 'Exibir', 'AMBOS')
        .Comment('Conf', ['Exibir',
                          ' AMBOS - Exibir observação e detalhes / características',
                          ' OBSERVACOES - Exibir observacoes',
                          ' DETALHES - Exibir detalhes / características'], True);
    end;

    if VersaoBancoMenor(25.32) then
    begin
    	Aconfs.New('ped_vnd_identificacao_produto', 'Configuração para identicação do produto em req/os/orc/nf/nfce', ';req;os;orc;nf;nfce;', typeBlob, '', 0, 0)
    		.WriteString('Conf', 'Identificar', 'INFORMADO')
        .Comment('Conf', ['Identificar',
                          ' INFORMADO - Exibir Código informado',
                          ' NUMEROFABRICANTE - Exibir Número de Fabricante do Produto',
                          ' GRUPOCODIGO - Exibir Grupo e Código do Produto',
                          ' CODIGO - Exibir Código do Produto'], True);
    end;

    if VersaoBancoMenor(25.33) then
    begin
  		setConfSisBool('cashback_hab', False, buscas,
        'Habilitar o programa de cashback', nil);
    end;

    if VersaoBancoMenor(25.34) then
    begin
    	Aconfs.New('cashback_conf_prod', 'Configuração padrão para produtos API Cashback', ';cashback;produtos;', typeBlob, '', 0, 0)
    		.WriteString('Conf', 'PercComissao', '10')
        .WriteString('Conf', 'DiasVencimento', '365')
        .Comment('Conf', ['PercComissao',
                          ' Percentual padrão de comissão para produtos'], True)
        .Comment('Conf', ['DiasVencimento',
                          ' Dias padrão para o vencimento do cashback'], True);
    end;

    if VersaoBancoMenor(25.35) then
    begin
    	Aconfs.New('cashback_conf_vales', 'Configuração padrão para vale API Cashback', ';cashback;vale;', typeBlob, '', 0, 0)
    		.WriteString('Conf', 'RegraVale', 'ILIMITADO')
        .WriteString('Conf', 'DiasVencimento', '365')
        .WriteString('RegrasValeIlimitado', 'ValorMin', '1')
        .WriteString('RegrasValeMinimoMaximo', 'ValorMin', '1')
        .WriteString('RegrasValeMinimoMaximo', 'ValorMax', '10')
        .WriteString('RegrasValePercentual', 'Perc', '100')
        .Comment('Conf', ['RegraVale',
                          ' RegrasValeIlimitado    - informar qualquer valor para cashback',
                          ' RegrasValeMinimoMaximo - informar valor entre o mínimo e máximo definido',
                          ' RegrasValePercentual   - informar percentual máximo sobre valor da compra realizada'], True)
        .Comment('Conf', ['DiasVencimento',
                          ' Dias padrão para o vencimento do vale'], True)
        .Comment('RegrasValeIlimitado',    ['ValorMin',
                                      	    ' Valor minimo do cashback'], True)
        .Comment('RegrasValeMinimoMaximo', ['ValorMin',
                                      	    ' Valor mínimo do cashback'], True)
        .Comment('RegrasValeMinimoMaximo', ['ValorMax',
                                      	    ' Valor máximo do cashback'], True)
        .Comment('RegrasValePercentual',   ['Perc',
                                      	    ' Percentual do cashback sobre o valor da compra'], True);
    end;

    if VersaoBancoMenor(25.36) then
    begin
    	setConfSisBlob('contratos_clientes_status_contratos', buscas,
        'Lista de status de contratos',
        'Ativo' + #13 +
        'Inativo' + #13 +
        'Pausado' + #13 +
        'Prescrito' + #13 +
        'Rescindido' + #13 +
        'Em Debito' + #13 +
        'Expirado' + #13 +
        'Cancelado' + #13 +
        'Cobrança Suspensa');
    end;

    if VersaoBancoMenor(25.37) then
    begin
      with Aconfs.New do
      begin
        chave     := 'nfc_nfce_qrcode_versao';
        display_  := 'Alterar a versao do qrcode da NFC-e';
        tag       := ';nfce;qrcode;nfd-e;';
        type1_    := typeFloat;
        value1_f  := 0;
        value1_b.Add('A critério do estado ele pode optar entre as versões 2 e 3.');
        value1_b.Add('Qualquer valor diferente assume o valor padrão 2');
      end;
    end;

    if VersaoBancoMenor(25.38) then
    begin
    	Aconf := TConfig_sistema_class.getConf('cl_faturamento_conf', buscas, vDadosIni.cod_empresa);
      try

      if Aconf.AsString = '' then
      begin
        Aconf.value1_vc := '1';
        Aconf.WriteString('Configuracao', 'DesbarraAutomaticamenteAposQuitCrediario', 'N')
        	 .WriteString('Configuracao', 'CodigoBarrado', '0')
          .WriteString('Configuracao', 'CodigoDesbarrado', '0')
          .Comment('Configuracao', 'CrediarioVencidosApartirDestaData')
          .Comment('Configuracao', '  Considerar crédiarios vencimentos a partir desta data de vencimento')
          .Comment('Configuracao', 'UsarDataAtualDataFinanceiro')
          .Comment('Configuracao', '  Atual      - Considerar crediário vencidos após data atual')
          .Comment('Configuracao', '  Financeiro - Considerar crediário vencidos após data do financeiro')
          .Comment('Configuracao', 'AbrirTelaBarramentoUmaVezPorDia')
          .Comment('Configuracao', '  S - Abrir tela para barramento dos clientes com créditos/cheque vencidos uma vez por dia (data vencimento + dias carência / data previsão recebimento)')
          .Comment('Configuracao', '  N - Não abrir tela para barramento dos clientes')
          .Comment('Configuracao', 'BarraAutomaticamenteAposVencCrediario')
          .Comment('Configuracao', '  S - Automaticamente será barrado os clientes com créditos vencidos (data vencimento + dias carência / data previsão recebimento)')
          .Comment('Configuracao', '  N - Não será barrado automaticamente os clientes')
          .Comment('Configuracao', 'DesbarraAutomaticamenteAposQuitCrediario')
          .Comment('Configuracao', '	S - Automaticamente será desbarrado os clientes após quitação dos créditos/cheques ou alteração de data de vencimento')
          .Comment('Configuracao', '	N - Não será desbarrado automaticamente os clientes')
          .Comment('Configuracao', 'CodigoBarrado')
          .Comment('Configuracao', '	Código do tipo de faturamento barrado')
          .Comment('Configuracao', 'CodigoDesbarrado')                
          .Comment('Configuracao', '	Código do tipo de faturamento desbarrado');
        Aconf.SaveConfDB(buscas);
      end;
      finally
        FreeAndNil(Aconf);
      end;
    end;

  	if VersaoBancoMenor(25.39) then
    begin
    	Aconfs.New('ped_vnd_data_prometida', 'Exbir campo data prometida', ';req;os;orc;dataprometida;', typeBlob, '', 0, 0)
    		.WriteString('Conf', 'TipoDoc', 'OS')
        .Comment('Conf',   ['TipoDoc - Informar a lista do tipos de documentos separados por vingular', 
        										'  REQ - Requisição',
        										'  OS - Ordem de Serviço',
        										'  ORC_P - Orçamento de Produtos',
        										'  ORC_PS - Orçamento de Produtos e Serviços',
        										'  Exemplo: REQ,OS,ORC_P,ORC_PS'], True);
    end;

  	if VersaoBancoMenor(25.40) then
    begin
      with Aconfs.New do
      begin
        chave     := 'nfe_lote_1nfe_sincrono_data';
        display_  := 'Data envio Sincrono para lotes com 1 NFe apenas';
        tag       := ';nfe;lote;NT2025.001;';
        type1_    := typeString;
        value1_vc  := '01/09/2025';
      end;

      Aconfs.New('nfe_nfce_csrt', 'CSRT Responsável técnico NFe e NFCe', ';nfe;nfce;', typeBlob, '', vDadosIni.cod_empresa, 0)
    		.WriteString('NFe_XX', 'IdCSRT', '1')
    		.WriteString('NFe_XX', 'CSRT', '1234567890123456789001234567890')
    		.WriteString('NFCe_XX', 'IdCSRT', '1')
    		.WriteString('NFCe_XX', 'CSRT', '0123456789012345678900123456789')
        .Comment('NFe_XX', 'Criar sessões como o exemplo substituindo o XX pela UF do emitente e os respectivos campos IdCSRT e CSRT')
        .Comment('NFCe_XX', 'Criar sessões como o exemplo substituindo o XX pela UF do emitente e os respectivos campos IdCSRT e CSRT', True);
    end;

  	if VersaoBancoMenor(25.41) then
    begin
      Aconfs.New('nfse_config', 'Configurações diversas NFSe', ';nfse;config;', typeBlob, '', vDadosIni.cod_empresa, 0)
        .WriteString('9999999', 'Municipio',  'Nome do municipio')
        .WriteString('9999999', 'WSChaveAcesso',  'Chave de acesso exigido pelo webservice')
        .Comment('9999999', 'Criar sessões como o exemplo substituindo o 9999999 pelo código IBGE da cidade', True);
    end;

    if VersaoBancoMenor(25.42) then
    begin
      Aconf := TConfig_sistema_class.getConf('ped_vnd_prod_qtde_desconto', buscas, vDadosIni.cod_empresa);
      try

      Aconfs.New('ped_vnd_prod_exibir_desconto', 'Configurações para exibir desconto em produtos com preço diferenciado/promoção/quantidade ', ';req;os;orc;exibir;desconto;', typeBlob, '', 0, 0)
      .WriteString('Conf', 'PrecoDiferenciado', 'N')
      .WriteString('Conf', 'PrecoPromocao', 'N')
        .WriteString('Conf', 'PrecoQtde', vDadosIni.IfThen(Aconf.value1_f = 1, 'S', 'N'))
      .Comment('Conf', 'PrecoDiferenciado')
      .Comment('Conf', '  S - Exibir o valor do desconto aplicado no item')
      .Comment('Conf', '  N - Não exibir o valor do desconto aplicado no item')
      .Comment('Conf', 'PrecoPromocao')
      .Comment('Conf', '  S - Exibir o valor do desconto aplicado no item')
      .Comment('Conf', '  N - Não exibir o valor do desconto aplicado no item')
      .Comment('Conf', 'PrecoQtde')
      .Comment('Conf', '  S - Exibir o valor do desconto aplicado no item')
      .Comment('Conf', '  N - Não exibir o valor do desconto aplicado no item');
      finally
        FreeAndNil(Aconf);
      end;
    end;

    if VersaoBancoMenor(25.43) then
    begin
      setConfSisInt('prod_cad_alt_lote_reg', 100, buscas,
        'Salvar no banco de dados a cada x registros.',
        'Caso informe 0 será salvo somente após o termino da alteração/sincronização em lote');
    end;

    if VersaoBancoMenor(25.44) then
    begin
    	Aconfs.New('aut_fin_conf', 'Configuração para Autorização do Financeiro', ';aut;fin;', typeBlob, '', vDadosIni.cod_empresa, 0)
        .WriteString('Configuracao', 'VerificarLimiteCredito', 'N')
        .WriteString('Configuracao', 'VerificarDebitoAtraso', 'N')
        .WriteString('Configuracao', 'AgruparVerificacao', 'N')
        .Comment('Configuracao', 'VerificarLimiteCredito')
        .Comment('Configuracao', '  S - Verificar limite de crédito ao autorizar pedido')
        .Comment('Configuracao', '  N - Não verificar limite de crédito ao autorizar pedido')
        .Comment('Configuracao', 'VerificarDebitoAtraso')
        .Comment('Configuracao', '  S - Verificar se o cliente possui débito ao autorizar pedido')
        .Comment('Configuracao', '  N - Não verificar se o cliente possui débito ao autorizar pedido')
        .Comment('Configuracao', 'AgruparVerificacao')
        .Comment('Configuracao', '  S - Agrupar verificação em uma único momento')
        .Comment('Configuracao', '  N - Nao agrupar verificação em uma único momento');
    end;

  	if VersaoBancoMenor(25.45) then
    begin
    	setConfSisBool('cr_exibir_valor_formaspag', True, buscas,
        'Exibir valor das formas de pagamento no campo "Form Pag" do contas a receber',
        'Por padrão esta habilitado para exibir o valor das formas de pagamento no campo "Form Pag" do contas a receber');
	  end;

    if VersaoBancoMenor(25.46) then
    begin
    	setConfSisBool('nfe_veiculo_detalhe_usado', True, buscas,
        'Habilitar o envio do detalhamento específico para veículos usados no xml', nil);

      setConfSisBool('vei_hab_teste_det_especifico_usado', True, buscas,
        'Habilitar o teste do detalhamento específico para veículos usados', nil);
    end;

  	if VersaoBancoMenor(25.47) then // usar novo campo invés do campo de devolucao, e setar quando a conf ta ativa, essaa conf nao'tem que ser de devolucao
    begin
      with Aconfs.New do
      begin
        chave     := 'nfs_devolucao_referencia_por_item';
        display_  := 'Ativar a referencia por item Nota Fiscal de Saida devolução a Fornecedor';
        tag       := ';nfe;nf;devolucao;';
        type1_    := typeBool;
        value1_f  := 0;
      end;
    end;

    if VersaoBancoMenor(25.48) then
    begin
    	setConfSisStr('ped_vnd_nome_seg_campo_serv', '', buscas,
        'Nome do segundo campo para Mecânico/Técnico nos Serviços (Ordem de Serviço / Orçamento)', nil);
    end;

    if VersaoBancoMenor(25.49) then
    begin
      with Aconfs.New do
      begin
        chave     := 'nf_s_baixa_estoque_import';
        display_  := 'Baixar estoque das notafiscal de saídas importadas';
        tag       := '';
        type1_    := typeBool;
        ativo     := 0;
        value1_f  := 0;
      end;
    end;

    if VersaoBancoMenor(25.51) then
    begin
      Aconfs.New(
        'rtc_config',
        'Configurações para os Tributos da Reforma tributária do consumo - RTC',
        ';nfe;nf;nfse;nfce;devolucao;rtc;',
        typeBool, '', vDadosIni.cod_empresa, 0)
      .WriteString('Config', 'ExigirNovosCamposAPartirDe', '01/01/2026')
      .WriteString('Config', 'SimplesNacionalOptanteRegimeRegular', 'NAO');

      with Aconfs.New do
      begin
        chave     := 'nfc_emissao_vedada_cnpj';
        display_  := 'Vedação de emissão de NFCe - Ajuste SINIEF Nº 11, 2025';
        tag       := '';
        type1_    := typeString;
        ativo     := 1;
        value1_vc := '05/01/2026';
      end;
    end;

    if VersaoBancoMenor(25.52) then
    begin
      buscas.Close;
      buscas.SQL.Text := ' select first 1 ' +
        ' gerador_osbol.gerar_boleto, ' +
        ' gerador_osbol.gerar_boleto_prod_serv, ' +
        ' gerador_osbol.agrupar_contr, ' +
        ' gerador_osbol.descons_ctrl, ' +
        ' gerador_osbol.status_tmo, ' +
        '	gerador_osbol.cod_sub_grupo, ' +
        ' gerador_osbol.cod_vendedor from gerador_osbol ' +
        ' where gerador_osbol.cod_empresa = ' + vDadosIni.codEmpresa +
        ' and gerador_osbol.status_gerador = ''CONCLUIDO'' ' +
        ' and gerador_osbol.vindi is null ' +
        ' order by gerador_osbol.data_gerador desc ';
      buscas.Open;

      vGerarBol         := vDadosIni.IfThen(UpperCase(trim(buscas.FieldByName('gerar_boleto').AsString)) = 'S', 'S', 'N');
      vGerarBolProdServ := vDadosIni.IfThen(UpperCase(trim(buscas.FieldByName('gerar_boleto_prod_serv').AsString)) = 'S', 'S', 'N');
      vAgruparContr     := vDadosIni.IfThen(UpperCase(trim(buscas.FieldByName('agrupar_contr').AsString)) = 'S', 'S', 'N');
      vDesconsCtrl      := vDadosIni.IfThen(UpperCase(trim(buscas.FieldByName('descons_ctrl').AsString)) = 'S', 'S', 'N');
      vStatusTmo        := UpperCase(trim(buscas.FieldByName('status_tmo').AsString));
      vCodSubGrupo      := buscas.FieldByName('cod_sub_grupo').AsInteger;
      vCodVendedor      := buscas.FieldByName('cod_vendedor').AsInteger;

    	Aconfs.New('gerador_os_clientes_conf', 'Configuração para Gerador de OS', ';gerador;os;nfse;nfe', typeBlob, '', vDadosIni.cod_empresa, 0)
        .WriteString('Configuracao', 'GerarBoleto', vGerarBol)
        .WriteString('Configuracao', 'GerarBoletoProdServ', vGerarBolProdServ)
        .WriteString('Configuracao', 'AgruparContratos', vAgruparContr)
        .WriteString('Configuracao', 'DesconsiderarRegraControles', vDesconsCtrl)
        .WriteString('Configuracao', 'StatusTMO', vStatusTmo)
        .WriteString('Configuracao', 'CodOperadorCXL', IntToStr(vCodOperadorCXL))
        .WriteString('Configuracao', 'CodVendedor', IntToStr(vCodVendedor))
        .WriteString('Configuracao', 'CodSubGrupoOS', IntToStr(vCodSubGrupo))
        .WriteString('Configuracao', 'Ordem', 'FANTASIA')
        .Comment('Configuracao', 'GerarBoleto')
        .Comment('Configuracao', '  S - Gerar boleto')
        .Comment('Configuracao', '  N - Não gerar boleto')
        .Comment('Configuracao', 'GerarBoletoProdServ')
        .Comment('Configuracao', '  S - Gerar boleto um boleto para produto e um boleto para serviço')
        .Comment('Configuracao', '  N - Gerar único boleto para produto e serviço')
        .Comment('Configuracao', 'AgruparContratos')
        .Comment('Configuracao', '  S - Agrupar contratos do cliente em uma única OS')
        .Comment('Configuracao', '  N - Nao agrupar Agrupar contratos do cliente em uma única OS')
        .Comment('Configuracao', 'DesconsiderarRegraControles')
        .Comment('Configuracao', '  S - Não consigerar data inicial de impressão do boleto')
        .Comment('Configuracao', '  N - Data inicial de impressão do boleto não deve ser nula e menor ou igual a data base do gerador')
        .Comment('Configuracao', 'StatusTMO')
        .Comment('Configuracao', '  Descrição do tipo de vendas de origem TMO')
        .Comment('Configuracao', 'CodOperadorCXL')
        .Comment('Configuracao', '  Código do operador do Caixa Auxiliar, informar 0 quando não utilizar caixa auxiliar')
        .Comment('Configuracao', 'CodVendedor')
        .Comment('Configuracao', '  Código do vendedor')
        .Comment('Configuracao', 'CodSubGrupoOS')
        .Comment('Configuracao', '  Código do sub grupo')
        .Comment('Configuracao', 'Ordem')
        .Comment('Configuracao', '  FANTASIA - Ordenar contratos pelo nome fantasia')
        .Comment('Configuracao', '  RAZAO - Ordenar contratos pela razão social')
        .Comment('Configuracao', '  CODCLIENTE - Ordenar contratos pelo código do cliente')
    end;

    if VersaoBancoMenor(25.53) then
    begin
    	 vExibirUnidade := 'N';
    	 try
         Aconf := TConfig_sistema_class.getConf('ped_vnd_exibir_unidade', buscas, vDadosIni.cod_empresa);

         if Assigned(Aconf) then
           vExibirUnidade := vDadosIni.IfThen(Aconf.AsBoolean, 'S', 'N');
       finally
         FreeAndNil(Aconf);
       end;

       vExibirFormPag := 'N';
       try
         Aconf := TConfig_sistema_class.getConf('ped_vnd_exibir_form_pag', buscas, vDadosIni.cod_empresa);

         if Assigned(Aconf) then
           vExibirFormPag := vDadosIni.IfThen(Aconf.AsBoolean, 'S', 'N');
       finally
         FreeAndNil(Aconf);
       end;

       vExibirDescAcresItem := 0;
       vPercentualAcrescimoDescontoEmTotais := 'N';
       try
       	Aconf := TConfig_sistema_class.getConf('ped_vnd_imprimir_desc_acresc_item', buscas, vDadosIni.cod_empresa);

       	if Assigned(Aconf) then
        begin
           vExibirDescAcresItem := Aconf.AsInteger;

           vPercentualAcrescimoDescontoEmTotais := Aconf.ReadString('Conf', 'PercentualAcrescimoDescontoEmTotais')
        end;
       finally
         FreeAndNil(Aconf);
       end;

       vlist := TConfig_sistema_classList.Create;
       try
         vlist.AddKey('ped_vnd_exibir_devolucao').MakeAll(buscas, StrToInt(vDadosIni.codEmpresa));

         vexibir_devolucao    := vlist.GetConf('ped_vnd_exibir_devolucao').Clone;

         Aconfs.New('ped_vnd_imp_dav', 'Configurações de impressão do modelo REDUZIDO e DETALHADO', ';dav;impressao;', typeBlob, 'v1', 0, 0)
          .WriteString('IMPRESSAO',    'ExibirDescAcresc',
          	 vDadosIni.IfThen(vDadosIni.vImpDescReqOrc = 'N', 'N', 'S'))
          .WriteString('IMPRESSAO',    'ExibirDescAcresItem',
             IntToStr(vExibirDescAcresItem))
          .WriteString('IMPRESSAO',    'PercentualAcrescimoDescontoEmTotais',
            vDadosIni.IfThen(vPercentualAcrescimoDescontoEmTotais = 'S', 'S', 'N'))
          .WriteString('IMPRESSAO',    'ExibirBruto',
          	 vDadosIni.IfThen(vDadosIni.vImpBrutoReqOrc = 'S', 'S', 'N'))
          .WriteString('IMPRESSAO',    'ExibirLocacao',
          	 vDadosIni.IfThen(vDadosIni.vlocReq = 'S', 'S', 'N'))
          .WriteString('IMPRESSAO',    'ExibirAplicacao',
          	 vDadosIni.IfThen(vDadosIni.vaplicmarcareq = 'S', 'S', 'N'))
          .WriteString('IMPRESSAO',    'ExibirMarca',
          	 vDadosIni.IfThen((vDadosIni.vaplicmarcareq = 'S') or (vDadosIni.vmarcareq = 'S'), 'S', 'N'))
          .WriteString('IMPRESSAO',    'ExibirUnidade',
          	 vDadosIni.IfThen(vExibirUnidade = 'S', 'S', 'N'))
          .WriteString('IMPRESSAO',    'ExibirFormaPag',
          	 vDadosIni.IfThen(vExibirFormPag = 'S', 'S', 'N'))
          .WriteString('IMPRESSAO',    'ExibirDeclSPC',
          	 vDadosIni.IfThen(vDadosIni.vEmp.vUsarDeclSPCReq <> 'S', 'N', 'S'))
          .WriteString('IMPRESSAODEV', 'QuandoImprimir',
          	 vDadosIni.IfThen(trim(vexibir_devolucao.ReadString('Impressao', 'QuandoImprimir')) = '',
             	 'T', vexibir_devolucao.ReadString('Impressao', 'QuandoImprimir')))
          .WriteString('IMPRESSAODEV', 'LinhaAdicional',
          	 vDadosIni.IfThen(trim(vexibir_devolucao.ReadString('Impressao' , 'LinhaAdicional')) = 'S', 'S', 'N'))
          .WriteString('IMPRESSAODEV', 'IdDevolucao',
          	 vDadosIni.IfThen(trim(vexibir_devolucao.ReadString('Impressao', 'IdDevolucao')) = '',
             	 'Dev', vexibir_devolucao.ReadString('Impressao', 'IdDevolucao')))
          .WriteString('IMPRESSAODEV', 'IdCondicional',
          	 vDadosIni.IfThen(trim(vexibir_devolucao.ReadString('Impressao', 'IdCondicional')) = '',
               'Cond', vexibir_devolucao.ReadString('Impressao', 'IdCondicional')))
          .WriteString('IMPRESSAODEV', 'SinalDevolucao',
          	 vDadosIni.IfThen(trim(vexibir_devolucao.ReadString('Impressao' , 'SinalDevolucao')) = '',
             	 '_#_', vexibir_devolucao.ReadString('Impressao' , 'SinalDevolucao')))
          .WriteString('IMPRESSAODEV', 'SinalCondicional',
             vDadosIni.IfThen(trim(vexibir_devolucao.ReadString('Impressao' , 'SinalCondicional')) = '',
             	 '_**_', vexibir_devolucao.ReadString('Impressao' , 'SinalCondicional')))
          .Comment('IMPRESSAO',    'IMPRESSAO')
          .Comment('IMPRESSAO',    '	ExibirDescAcresc')
          .Comment('IMPRESSAO',    '		Exibir informação de desconto e acréscimo nos totais (S/N)')
          .Comment('IMPRESSAO',    '	ExibirDescAcresItem')
          .Comment('IMPRESSAO',    '		0 - Nenhum desconto ou acrescimo')
          .Comment('IMPRESSAO',    '		1 - Desconto e acrescimo em valor')
          .Comment('IMPRESSAO',    '		2 - Desconto e acrescimo em percentual')
          .Comment('IMPRESSAO',    '	ExibirBruto')
          .Comment('IMPRESSAO',    '		Exibir valor bruto nos totais em Ordem de Serviço/Orçamento (S/N)')
          .Comment('IMPRESSAO',    '	ExibirLocacao')
          .Comment('IMPRESSAO',    '	 	Exibir locação no item (S/N)')
          .Comment('IMPRESSAO',    '	ExibirAplicacao')
          .Comment('IMPRESSAO',    '		Exibir aplicação no item (S/N)')
          .Comment('IMPRESSAO',    '	ExibirMarca')
          .Comment('IMPRESSAO',    '		Exibir marca no item (S/N)')
          .Comment('IMPRESSAO',    '	ExibirUnidade')
          .Comment('IMPRESSAO',    '	 	Exibir unidade no item (S/N)')
          .Comment('IMPRESSAO',    '	ExibirFormaPag')
          .Comment('IMPRESSAO',    '	 	Exibir detalhes da forma de pagamento Requisição/Ordem de Serviço (S/N)')
          .Comment('IMPRESSAO',    '	ExibirDeclSPC')
          .Comment('IMPRESSAO',    '	 	Exbir declaração SPC em Requisição/Ordem de Serviço/Orçamento (S/N)')
          .Comment('IMPRESSAODEV', 'IMPRESSAODEV')
          .Comment('IMPRESSAODEV', '	QuandoImprimir')
          .Comment('IMPRESSAODEV', '	 	S: Sempre')
          .Comment('IMPRESSAODEV', '	 	N: Nunca')
          .Comment('IMPRESSAODEV', '	 	T: Quando a opção em Tela for selecionada')
          .Comment('IMPRESSAODEV', '	LinhaAdicional')
          .Comment('IMPRESSAODEV', '	 	Exibir linha adicional (S/N)')
          .Comment('IMPRESSAODEV', '	IdDevolucao')
          .Comment('IMPRESSAODEV', '	 	Sigla para devolução (Dev)')
          .Comment('IMPRESSAODEV', '	IdCondicional')
          .Comment('IMPRESSAODEV', '	 	Sigla para condicional (Cond)')
          .Comment('IMPRESSAODEV', '	LinhaAdicional')
          .Comment('IMPRESSAODEV', '	 	Corresponde aos caracteres que serão adicionados na impressão da linha adicional')
          .Comment('IMPRESSAODEV', '	SinalCondicional')
          .Comment('IMPRESSAODEV', '	 	Corresponde aos 8caracteres que serão adicionados na impressão da linha adicional');
       finally
          if Assigned(vlist) then
    				FreeAndNil(vlist);
       end;

       vExibirUsuarioFechou := 'N';
       try
         Aconf := TConfig_sistema_class.getConf('ped_vnd_imprimir_usuario_que_fechou', buscas, vDadosIni.cod_empresa);

         if Assigned(Aconf) then
           vExibirUsuarioFechou := vDadosIni.IfThen(Aconf.AsBoolean, 'S', 'N');
       finally
         FreeAndNil(Aconf);
       end;

       Aconf := TConfig_sistema_class.getConf('ped_vnd_impressao_dav_v6', buscas, vDadosIni.cod_empresa);
       try
         Aconfs.New('ped_vnd_impressao_dav_v7', 'Configurações de impressão do modelo AVANÇADO 1 e AVANÇADO 2', ';dav;impressao;', typeBlob, 'v6', 0, 0)
          .WriteString('IMPRESSAO', 'ExibirRazaoFantasiaIdentificacaoEmpresa',
             vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirRazaoFantasiaIdentificacaoEmpresa'))) <> '',
               UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirRazaoFantasiaIdentificacaoEmpresa')), 'IDENTIFICACAO'))
          .WriteString('IMPRESSAO', 'ExibirEnderecoEmp',
             vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirEnderecoEmp'))) <> '',
               UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirEnderecoEmp')), 'S'))
          .WriteString('IMPRESSAO', 'ExibirFoneEmp',
             vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirFoneEmp'))) <> '',
               UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirFoneEmp')), 'S'))
          .WriteString('IMPRESSAO', 'ExibirCNPJEmp',
             vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirCNPJEmp'))) <> '',
               UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirCNPJEmp')),	'S'))
          .WriteString('IMPRESSAO', 'ExibirInscrEstEmp',
             vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirInscrEstEmp'))) <> '',
               UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirInscrEstEmp')),	'S'))
          .WriteString('IMPRESSAO', 'ExibirEmailEmp',
             vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirEmailEmp'))) <> '',
               UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirEmailEmp')),	'S'))
          .WriteString('IMPRESSAO', 'ExibirUsuarioFechou',
          	 vDadosIni.IfThen(vExibirUsuarioFechou = 'S', 'S', 'N'))
          .WriteString('IMPRESSAO', 'ExibirDescAcrescReqOsOrc',
             vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDescAcrescReqOsOrc'))) <> '',
               UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDescAcrescReqOsOrc')), 'N'))
          .WriteString('IMPRESSAO', 'ExibirDescAcresItem',
             vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDescAcresItem'))) <> '',
               UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDescAcresItem')),	'N'))
          .WriteString('IMPRESSAO', 'ExibirBrutoOsOrc',
             vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirBrutoOsOrc'))) <> '',
               UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirBrutoOsOrc')),	'S'))
          .WriteString('IMPRESSAO', 'ExibirTecnicoMecanicoLinhaAdc',
             vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirTecnicoMecanicoLinhaAdc'))) <> '',
               UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirTecnicoMecanicoLinhaAdc')),	'N'))
          .WriteString('IMPRESSAO', 'ExibirAplicacaoLinhaAdc',
             vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAplicacaoLinhaAdc'))) <> '',
               UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAplicacaoLinhaAdc')),	'N'))
          .WriteString('IMPRESSAO', 'ExibirLocacaoLinhaAdc',
             vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirLocacaoLinhaAdc'))) <> '',
               UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirLocacaoLinhaAdc')),	'N'))
          .WriteString('IMPRESSAO', 'ExibirDeclSPCReqOsOrc',
             vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDeclSPCReqOsOrc'))) <> '',
               UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDeclSPCReqOsOrc')),
                 vDadosIni.IfThen(vDadosIni.vEmp.vUsarDeclSPCReq <> 'S', 'N', 'S')))
          .WriteString('IMPRESSAO', 'ExibirOBS',
             vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirOBS'))) <> '',
               UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirOBS')),	'S'))
          .WriteString('IMPRESSAO', 'ExibirEstadoVeicObj',
             vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirEstadoVeicObj'))) <> '',
               UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirEstadoVeicObj')),	'S'))
          .WriteString('IMPRESSAO', 'ExibirDefeito',
             vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDefeito'))) <> '',
               UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirDefeito')),	'S'))
          .WriteString('IMPRESSAO', 'ExibirAcessorios',
             vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAcessorios'))) <> '',
               UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAcessorios')),	'S'))
          .WriteString('IMPRESSAO', 'ExibirOBSLivroReg',
             vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirOBSLivroReg'))) <> '',
               UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirOBSLivroReg')),	'S'))
          .WriteString('IMPRESSAO', 'ExibirOBSAdicional',
             vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirOBSAdicional'))) <> '',
               UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirOBSAdicional')), 'S'))
          .WriteString('IMPRESSAO', 'ExibirAtivReparoInstrucacaoInMetr',
             vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAtivReparoInstrucacaoInMetr'))) <> '',
               UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAtivReparoInstrucacaoInMetr')),	'N'))
          .WriteString('IMPRESSAO', 'ExibirPlanoPag',
             vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirPlanoPag'))) <> '',
               UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirPlanoPag')), 'N'))
          .WriteString('IMPRESSAO', 'ExibirFormaPag',
             vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirFormaPag'))) <> '',
               UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirFormaPag')), 'N'))
          .WriteString('IMPRESSAO', 'ExibirControleFormaPag',
             vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirControleFormaPag'))) <> '',
               UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirControleFormaPag')), 'N'))
          .WriteString('IMPRESSAO', 'ExibirAssinatura',
             vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAssinatura'))) <> '',
               UpperCase(Aconf.ReadString('IMPRESSAO', 'ExibirAssinatura')), 'S'))
          .WriteString('IMPRESSAO', 'AgruparTotalPorProdServProdTServT',
             vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'AgruparTotalPorProdServProdTServT'))) <> '',
               UpperCase(Aconf.ReadString('IMPRESSAO', 'AgruparTotalPorProdServProdTServT')), 'N'))
          .WriteString('IMPRESSAO', 'QuantidadeLinhasEstadoVeicObj',
             vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasEstadoVeicObj'))) <> '',
               UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasEstadoVeicObj')), '1'))
          .WriteString('IMPRESSAO', 'QuantidadeLinhasDefeitos',
             vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasDefeitos'))) <> '',
               UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasDefeitos')), '1'))
          .WriteString('IMPRESSAO', 'QuantidadeLinhasAcessorios',
             vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasAcessorios'))) <> '',
               UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasAcessorios')), '1'))
          .WriteString('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral1',
             vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral1'))) <> '',
               UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral1')), '2'))
          .WriteString('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral2',
             vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral2'))) <> '',
               UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral2')), '1'))
          .WriteString('IMPRESSAO', 'QuantidadeLinhasObservacaoLivroRegistro',
             vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasObservacaoLivroRegistro'))) <> '',
               UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasObservacaoLivroRegistro')), '1'))
          .WriteString('IMPRESSAO', 'QuantidadeLinhasObservacaoAdicional',
             vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasObservacaoAdicional'))) <> '',
               UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasObservacaoAdicional')), '1'))
          .WriteString('IMPRESSAO', 'QuantidadeLinhasSelosRemovidos',
             vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasSelosRemovidos'))) <> '',
               UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasSelosRemovidos')), '1'))
          .WriteString('IMPRESSAO', 'QuantidadeLinhasSelosColocados',
             vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasSelosColocados'))) <> '',
               UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasSelosColocados')), '1'))
          .WriteString('IMPRESSAO', 'QuantidadeLinhasLacresRemovidos',
             vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasLacresRemovidos'))) <> '',
               UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasLacresRemovidos')), '1'))
          .WriteString('IMPRESSAO', 'QuantidadeLinhasLacresColocados',
             vDadosIni.IfThen(trim(UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasLacresColocados'))) <> '',
               UpperCase(Aconf.ReadString('IMPRESSAO', 'QuantidadeLinhasLacresColocados')), '1'))
          .Comment('IMPRESSAO', 'Explicação da impressão do pedido modelo AVANÇADA 1 e AVANÇADA 2')
          .Comment('IMPRESSAO', 'ExibirRazaoFantasiaEmpresa')
          .Comment('IMPRESSAO', '	 Exibir razão social ou nome fantasia ou identificação da empresa (RAZAO/FANTASIA/IDENTIFICACAO)')
          .Comment('IMPRESSAO', 'ExibirEnderecoEmp')
          .Comment('IMPRESSAO', '	 Exibir endereço da empresa no cabeçalho (S/N)')
          .Comment('IMPRESSAO', 'ExibirFoneEmp')
          .Comment('IMPRESSAO', '	 Exibir telefone da empresa no cabeçalho (S/N)')
          .Comment('IMPRESSAO', 'ExibirCNPJEmp')
          .Comment('IMPRESSAO', '	 Exibir CNPJ da empresa no cabeçalho (S/N)')
          .Comment('IMPRESSAO', 'ExibirInscrEstEmp')
          .Comment('IMPRESSAO', '	 Exibir inscrição estadual da empresa no cabeçalho (S/N)')
          .Comment('IMPRESSAO', 'ExibirEmailEmp')
          .Comment('IMPRESSAO', '	 Exibir e-mail da empresa no cabeçalho (S/N)')
          .Comment('IMPRESSAO', 'ExibirUsuarioFechou')
          .Comment('IMPRESSAO', '	 Exibir usuário que fechou o Pedido/OS (S/N)')
          .Comment('IMPRESSAO', 'ExibirDescAcrescReqOsOrc')
          .Comment('IMPRESSAO', '	 Exibir informação de desconto e acréscimo nos totais (S/N)')
          .Comment('IMPRESSAO', 'ExibirDescAcresItem')
          .Comment('IMPRESSAO', '	 Exibir valores de desconto e acréscimo nos itens,')
          .Comment('IMPRESSAO', '	 caso informe N os campos de desconto e acréscimo do item sempre ficarão zerados,')
          .Comment('IMPRESSAO', '	 caso informe V será exibido o valor do desconto e acréscimo do item')
          .Comment('IMPRESSAO', '	 e caso informe P será exibido o percentual do desconto e acréscimo do item (N/V/P)')
          .Comment('IMPRESSAO', 'ExibirBrutoOsOrc')
          .Comment('IMPRESSAO', '	 Exibir valor bruto nos totais em Ordem de Serviço/Orçamento (S/N)')
          .Comment('IMPRESSAO', 'ExibirTecnicoMecanicoLinhaAdc')
          .Comment('IMPRESSAO', '	 Exibir vendedor/técnico/mecânico em uma linha adicional nos itens em Ordem de Serviço/Orçamento (S/N)')
          .Comment('IMPRESSAO', 'ExibirAplicacaoLinhaAdc')
          .Comment('IMPRESSAO', '	 Exibir aplicação em linha uma adicional nos itens em Requisição/Ordem de Serviço/Orçamento (S/N)')
          .Comment('IMPRESSAO', 'ExibirLocacaoLinhaAdc')
          .Comment('IMPRESSAO', '	 Exibir locação 1, locação 2 e locação depósito em uma linha adicional nos itens em Requisição/Ordem de Serviço/Orçamento (S/N)')
          .Comment('IMPRESSAO', 'ExibirDeclSPCReqOsOrc')
          .Comment('IMPRESSAO', '	 Exbir declaração SPC em Requisição/Ordem de Serviço/Orçamento (S/N)')
          .Comment('IMPRESSAO', 'ExibirOBS')
          .Comment('IMPRESSAO', '	 Exibir observações em Requisição/Ordem de Serviço/Orçamento (S/N)')
          .Comment('IMPRESSAO', 'ExibirEstadoVeicObj')
          .Comment('IMPRESSAO', '	 Exibir estado veículo/objeto em Ordem de Serviço/Orçamento (S/N)')
          .Comment('IMPRESSAO', 'ExibirDefeito')
          .Comment('IMPRESSAO', '	 Exibir defeito veículo/objeto em Ordem de Serviço/Orçamento (S/N)')
          .Comment('IMPRESSAO', 'ExibirAcessorios')
          .Comment('IMPRESSAO', '	 Exibir acessórios veículo/objeto em Ordem de Serviço/Orçamento (S/N)')
          .Comment('IMPRESSAO', 'ExibirOBSLivroReg')
          .Comment('IMPRESSAO', '	 Exibir observação livro de registro em Requisição/Ordem de Serviço/Orçamento (S/N)')
          .Comment('IMPRESSAO', 'ExibirOBSAdicional')
          .Comment('IMPRESSAO', '	 Exibir observação adicional em Requisição/Ordem de Serviço/Orçamento (S/N)')
          .Comment('IMPRESSAO', 'ExibirAtivReparoInstrucacaoInMetr')
          .Comment('IMPRESSAO', '	 Exibir informações de atividades de reparo InMetro Ordem de Serviço/Orçamento (S/N)')
          .Comment('IMPRESSAO', 'ExibirPlanoPag')
          .Comment('IMPRESSAO', '	 Exibir detalhes do plano de pagamento Requisição/Ordem de Serviço (S/N)')
          .Comment('IMPRESSAO', 'ExibirFormaPag')
          .Comment('IMPRESSAO', '	 Exibir detalhes da forma de pagamento Requisição/Ordem de Serviço (S/N)')
          .Comment('IMPRESSAO', 'ExibirControleFormaPag')
          .Comment('IMPRESSAO', '	 Exibir detalhes da forma de pagamento e controle Requisição/Ordem de Serviço (S/N)')
          .Comment('IMPRESSAO', 'ExibirAssinatura')
          .Comment('IMPRESSAO', '	 Exibir assinatura no final do relatório (S/N)')
          .Comment('IMPRESSAO', 'AgruparTotalPorProdServProdTServT')
          .Comment('IMPRESSAO', '	 Agrupar Total por Tipo (Prod/Serv/Prod Terc/Serv Terc)')
          .Comment('IMPRESSAO', 'QuantidadeLinhasEstadoVeicObj')
          .Comment('IMPRESSAO', '	 Quantidade de Linhas para Estado do Veículo/Objeto (Máx 4)')
          .Comment('IMPRESSAO', 'QuantidadeLinhasDefeitos')
          .Comment('IMPRESSAO', '	 Quantidade de Linhas para Defeitos (Máx 4)')
          .Comment('IMPRESSAO', 'QuantidadeLinhasAcessorios')
          .Comment('IMPRESSAO', '	 Quantidade de Linhas para Acessórios (Máx 4)')
          .Comment('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral1')
          .Comment('IMPRESSAO', '	 Quantidade de Linhas para Observação Geral 1 (Máx 4)')
          .Comment('IMPRESSAO', 'QuantidadeLinhasObservacaoGeral2')
          .Comment('IMPRESSAO', '	 Quantidade de Linhas para Observação Geral 2 (Máx 4)')
          .Comment('IMPRESSAO', 'QuantidadeLinhasObservacaoLivroRegistro')
          .Comment('IMPRESSAO', '	 Quantidade de Linhas para Livro de Registro (Máx 4)')
          .Comment('IMPRESSAO', 'QuantidadeLinhasObservacaoAdicional')
          .Comment('IMPRESSAO', '	 Quantidade de Linhas para Observação Adicional (Máx 4)')
          .Comment('IMPRESSAO', 'QuantidadeLinhasSelosRemovidos')
          .Comment('IMPRESSAO', '	 Quantidade de Linhas para Selos Removidos (Máx 4)')
          .Comment('IMPRESSAO', 'QuantidadeLinhasSelosColocados')
          .Comment('IMPRESSAO', '	 Quantidade de Linhas para Selos Colocados (Máx 4)')
          .Comment('IMPRESSAO', 'QuantidadeLinhasLacresRemovidos')
          .Comment('IMPRESSAO', '	 Quantidade de Linhas para Lacres Removidos (Máx 4)')
          .Comment('IMPRESSAO', 'QuantidadeLinhasLacresColocados')
          .Comment('IMPRESSAO', '	 Quantidade de Linhas para Lacres Colocados (Máx 4)');
      finally
        FreeAndNil(Aconf);
      end;
    end;

    if VersaoBancoMenor(25.54) then
    begin
      Aconf := TConfig_sistema_class.getConf('nf_s_retencoes_federais', buscas, vDadosIni.cod_empresa);
      try
        if Aconf.chave = 'nf_s_retencoes_federais'  then
        begin
          Aconf.AtivarMapeamentoKeys;
          Aconf.ReadInteger('Controles', 'Retencao_CP', 0);
          if Aconf.KesyChanges then
            Aconf.SaveConfDB(buscas);
        end;
      finally
        FreeAndNil(Aconf);
      end;
    end;

    if VersaoBancoMenor(25.55) then
    begin
    	with Aconfs.New do
      begin
        chave     := 'vei_codmarca';
        display_  := 'Código(s) por marca(s) separados por virgula';
        tag       := ';vei;marca;';
        type1_    := typeBlob;
        with value1_b do
        begin
          Add('[SUZUKI]');
          Add('Codigo=0');
          Add('VerificarNotasFiscais=S');
          Add('DataUltimaVerificacao=' + FormatDateTime('dd/mm/yyyy', Date));
          Add('NotasFiscaisApartir=' + FormatDateTime('dd/mm/yyyy', Date));
        end;
      end;
    end;

    if VersaoBancoMenor(25.56) then
    begin
    	setConfSisFloat('boletos_dias_aviso_venc_certificado', 15, buscas,
        'Quantidade de dias para aviso antes do vencimento do certificado digital', nil);
    end;

    if VersaoBancoMenor(25.57) then
    begin
    	Aconf := TConfig_sistema_class.getConf('plug_boletos_api_conf', buscas, vDadosIni.cod_empresa);
      try
        if Aconf.AsString = '' then // Versao dessa alteracao
        begin
          Aconf.value1_vc := '1';
          if trim(Aconf.ReadString('CONFIGURACOES', 'QuantidadeTentativasDownload')) = '' then
            Aconf.WriteString('CONFIGURACOES', 'QuantidadeTentativasDownload', '5');
          if trim(Aconf.ReadString('CONFIGURACOES', 'TimeoutDownload')) = '' then
            Aconf.WriteString('CONFIGURACOES', 'TimeoutDownload', '3000');
          Aconf.SaveConfDB(buscas);
        end;
      finally
        FreeAndNil(Aconf);
      end;
    end;

    if VersaoBancoMenor(25.58) then
    begin
      Aconfs.New('hw_cloud_ia_conf', 'Configuração para Hw Cloud IA', ';hw;cloud;', typeBlob, '', vDadosIni.cod_empresa, 0)
        .WriteString('Configuracao', 'UsarServicoMensageria', 'N') 
        .WriteString('Configuracao', 'CodTipoContatoPadrao', '0')
        .WriteString('Configuracao', 'SomenteContatosAceitos', 'N')
        .WriteString('Configuracao', 'TimerConsultaMensagem', '15')
        .WriteString('Configuracao', 'QtdeMensagensConsultadasPorVez', '50')
        .WriteString('Configuracao', 'QtdeDiasConsMensagensEnviadas', '7')
        .WriteString('Configuracao', 'UnicoArqCompactado', 'S')
        .WriteString('Configuracao', 'GerarLinkAnexos', 'S')
        .WriteString('Configuracao', 'AnexosDocFiscal', 'pdf')
        .WriteString('Configuracao', 'ExibirAcrescDescPedido', 'Acrescimo, Desconto')
        .Comment('Configuracao', 'UsarServicoMensageria')
        .Comment('Configuracao', '  S - Habilitar o uso do serviço de mensageria pelo ERP')
        .Comment('Configuracao', '  S - Desabilitar o uso do serviço de mensageria pelo ERP')
        .Comment('Configuracao', 'CodTipoContatoPadrao')
        .Comment('Configuracao', '  Código do tipo de contato utilizado para enviar mensagem de outros contatos (contato avulso)')
        .Comment('Configuracao', '  Código do tipo de contato utilizado para utilizado para sincronizar contatos da tabela antiga para nova tabela')
        .Comment('Configuracao', 'SomenteContatosAceitos')
        .Comment('Configuracao', '  S - Enviar mensagens somente para contatos onde o cliente aceita')
        .Comment('Configuracao', '  N - Enviar mensagens para todos contatos')
        .Comment('Configuracao', 'TimerConsultaMensagem')
        .Comment('Configuracao', '  Consultar mensagem a cada x minutos')
        .Comment('Configuracao', 'QtdeMensagensConsultadasPorVez')
        .Comment('Configuracao', '  Quantidade de mensagens consultadas por vez')
        .Comment('Configuracao', 'QtdeDiasConsMensagensEnviadas')
        .Comment('Configuracao', '	Consultar mensagens enviadas nos últimos x dias')
        .Comment('Configuracao', 'UnicoArqCompactado')
        .Comment('Configuracao', '  S - Gerar unico arquivo compactado do(s) anexo(s)')
        .Comment('Configuracao', '  N - Não gerar unico arquivo compactado do(s) anexo(s)')
        .Comment('Configuracao', 'GerarLinkAnexos')
        .Comment('Configuracao', '  S - Gerar link do(s) anexo(s)')
        .Comment('Configuracao', '  N - Não gerar link do(s) anexo(s)')
        .Comment('Configuracao', 'AnexosDocFiscal')
        .Comment('Configuracao', '  pdf, xml - Enviar xml e pdf')
        .Comment('Configuracao', '  pdf - Enviar pdf')
        .Comment('Configuracao', '  xml - Enviar xml')
        .Comment('Configuracao', 'ExibirAcrescDescPedido')
        .Comment('Configuracao', '  Acrescimo, Desconto - Exibir acréscimo e desconto dos pedidos recebibos')
        .Comment('Configuracao', '  Acrescimo - Exibir acréscimo dos pedidos recebibos')
        .Comment('Configuracao', '  Desconto - Exibir desconto dos pedidos recebibos')
    end;

    if VersaoBancoMenor(25.59) then
    begin
      Aconf := TConfig_sistema_class.getConf('hw_cloud_ia_conf', buscas, vDadosIni.cod_empresa);
      try
        if Aconf.AsString = '' then
        begin
          Aconf.value1_vc := '1';
          Aconf.WriteString('Configuracao', 'UsarVendaOnline', 'N')
            .Comment('Configuracao', 'UsarServicoMensageria')
            .Comment('Configuracao', '  S - Habilitar o uso do serviço de mensageria pelo ERP')
            .Comment('Configuracao', '  S - Desabilitar o uso do serviço de mensageria pelo ERP')
            .Comment('Configuracao', 'CodTipoContatoPadrao')
            .Comment('Configuracao', '  Código do tipo de contato utilizado para enviar mensagem de outros contatos (contato avulso)')
            .Comment('Configuracao', '  Código do tipo de contato utilizado para utilizado para sincronizar contatos da tabela antiga para nova tabela')
            .Comment('Configuracao', 'SomenteContatosAceitos')
            .Comment('Configuracao', '  S - Enviar mensagens somente para contatos onde o cliente aceita')
            .Comment('Configuracao', '  N - Enviar mensagens para todos contatos')
            .Comment('Configuracao', 'TimerConsultaMensagem')
            .Comment('Configuracao', '  Consultar mensagem a cada x minutos')
            .Comment('Configuracao', 'QtdeMensagensConsultadasPorVez')
            .Comment('Configuracao', '  Quantidade de mensagens consultadas por vez')
            .Comment('Configuracao', 'QtdeDiasConsMensagensEnviadas')
            .Comment('Configuracao', '	Consultar mensagens enviadas nos últimos x dias')
            .Comment('Configuracao', 'UnicoArqCompactado')
            .Comment('Configuracao', '  S - Gerar unico arquivo compactado do(s) anexo(s)')
            .Comment('Configuracao', '  N - Não gerar unico arquivo compactado do(s) anexo(s)')
            .Comment('Configuracao', 'GerarLinkAnexos')
            .Comment('Configuracao', '  S - Gerar link do(s) anexo(s)')
            .Comment('Configuracao', '  N - Não gerar link do(s) anexo(s)')
            .Comment('Configuracao', 'AnexosDocFiscal')
            .Comment('Configuracao', '  pdf, xml - Enviar xml e pdf')
            .Comment('Configuracao', '  pdf - Enviar pdf')
            .Comment('Configuracao', '  xml - Enviar xml')
            .Comment('Configuracao', 'ExibirAcrescDescPedido')
            .Comment('Configuracao', '  Acrescimo, Desconto - Exibir acréscimo e desconto dos pedidos recebibos')
            .Comment('Configuracao', '  Acrescimo - Exibir acréscimo dos pedidos recebibos')
            .Comment('Configuracao', '  Desconto - Exibir desconto dos pedidos recebibos')
        	 	.Comment('Configuracao', 'UsarVendaOnline')
            .Comment('Configuracao', '  S - Habilitar campos para o uso do venda online pelo ERP')
            .Comment('Configuracao', '  S - Desabilitar campos para o uso do venda online pelo ERP');
          Aconf.SaveConfDB(buscas);
        end;
      finally
        FreeAndNil(Aconf);
      end;
    end;

    if VersaoBancoMenor(25.60) then
    begin
      setConfSisInt('tpserv_alt_lote_reg', 100, buscas,
        'Salvar no banco de dados a cada x registros.',
        'Caso informe 0 será salvo somente após o termino da alteração/sincronização em lote');
    end;

    if VersaoBancoMenor(25.61) then
    begin
      setConfSisInt('kit_cad_alt_lote_reg', 100, buscas,
        'Salvar no banco de dados a cada x registros.',
        'Caso informe 0 será salvo somente após o termino da alteração/sincronização em lote');
    end;

    if VersaoBancoMenor(25.62) then
    begin
      setConfSisInt('grade_alt_lote_reg', 100, buscas,
        'Salvar no banco de dados a cada x registros.',
        'Caso informe 0 será salvo somente após o termino da alteração/sincronização em lote');
    end;

  except
    on e: exception do
    begin
      Application.MessageBox(pchar('Erro ao abrir configuracoes (config_sistema). Erro: ' + e.Message),
        'Atenção', 0 + 64);
      vDadosIni.registraErro('TSetConfiguracaoSistema.verificarVersaoConf2. Erro: ' + e.Message);
    end;
  end;
end;

end.
