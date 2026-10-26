unit UClassesConfig;

interface

uses
  uDataSet_OOP, DBClient, DB, Forms, IBDatabase, IBQuery, Classes, ScktComp,
  StdCtrls, Grids;

type
  CFormsConfig = (cfBackup, cfBackupOutros, cfAtualTerminais, cfBuscaPreco);

  TRegrasProgramasFidelidades = class;
  TConfigRegrasProgramasFidelidades = class;   

  TERP_MenusSistemas = class(TDataSet_OOP)
  private              
  public               
    function abreERP: boolean;
    constructor create;
  end;

  TMenusSistema = class(TDataSet_OOP)
  private
    formulario: TForm;
    function IntToBin(Valor: Int64): string;
    procedure defineMenusAtuais;
    procedure dataSetMenusSistemaAfterScroll(DataSet: TDataSet);
  public
    vMenusAtuais: TClientDataSet;
    destructor Destroy; override;
    constructor create;
    function addMenu: boolean;
    function delMenu: boolean;
    function habilitaMenu: boolean;
    function desabilitaMenu: boolean;
    function setMenuVisivel: boolean;
    function setMenuInvisivel: boolean;
    function abreMenusSistema: boolean;
    function salvarAlteracoes: boolean;
    function buscarPalavraOuFrase(palavra: string; mnSistemas: boolean): boolean;
    procedure setNivelUsuario(nivel: integer);
  var
    vERP: TERP_MenusSistemas;
  end;

  TMenusAuto = class(TDataSet_OOP)
  private
    formulario: TForm;
    procedure configuraMenusSistema(vSistema: string);
    procedure configuraMenusTipoEmpresa(vTipo: string);
  public
    destructor Destroy; override;
    constructor create;
    procedure cadMenusAuto(tipoForm: integer);
    function abreMenusAuto: boolean; overload;
    function abreMenusAuto(departamento: string): boolean; overload;
    procedure criaMenus;
    procedure configurarMenus(departamento: string);
    procedure setMenuHabilitado(pTodos: Boolean = False);
    procedure setMenuDesabilitado(pTodos: Boolean = False);
    procedure setMenuVisivel(pTodos: Boolean = False);
    procedure setMenuInvisivel(pTodos: Boolean = False);
    function abrirLixeira: boolean;
    procedure restaurarRegistro;
    function delete: boolean; override;
    procedure _marcaLinha;
    procedure _marcaDesmarcaLinha;
    procedure _desmarcaLinha;
    procedure _marcarTodos;
    procedure _desmarcarTodos;
  var
    vMnSis: TMenusSistema;
  end;

  TTaxaProgramasFidelidades = class(TDataSet_OOP)
  public
    constructor create;
    function abreTaxaProgramaFidelidades: boolean;
  end;

  TConfigRegrasProgramasFidelidades = class(TDataSet_OOP)
  public
    constructor create;
    function abreConfigRegrasProgramaFidelidades(pCodTipo: Integer): boolean;
    function post(Regra: TRegrasProgramasFidelidades; pCodTipo: Integer): boolean;
    function insert(pCodTipo: Integer): boolean;
    function delete(pCodTipo: Integer): boolean;
    function verificarRegraCadastradas(Regra: TRegrasProgramasFidelidades; var pmensagem, pcampo: string): boolean;
    function buscaProduto(codBarra: string; var pgrupoprod: string; var pcodprod: string; var vdescricaoprod: string): boolean;
    function buscaKit(pcodkit: Integer; var pkit: string): boolean;
    function buscaGrupo(pcodgrupo: Integer; var pgrupo: string): boolean;
    function buscaSubGrupo(pcodsubgrupo: Integer; var psubgrupo: string): boolean;
    function buscaMarca(pcodmarca: Integer; var pmarca: string): boolean;
    function verificarProduto(pgrupoprod: Integer; pcodprod: string): boolean;
    function verificarKit(pcodkit: Integer): boolean;
    function verificarGrupo(pcodgrupo: Integer): boolean;
    function verificarSubGrupo(pcodsubgrupo: Integer): boolean;
    function verificarMarca(pcodmarca: Integer): boolean;
  end;

  TRegrasValeTrocaProgFid = class(TDataSet_OOP)
  public
    constructor create;
    procedure cadRegrasValeTrocaProgFid(pTipoForm: integer);
    function abreRegrasValeTrocaProgFid: boolean; overload;
    function _lixeiraCheia(ptipo: string): boolean;
    function _abrelixeira(ptipo: string): boolean;
    function insert: boolean;
    function edit: boolean; override;
    function delete: boolean;
    function post: boolean; override;
    function _restauralixeira: boolean;
    function buscarProduto: boolean;
    function verificarRegra(var pMensagem, pCampo: string): boolean;
    procedure atualizarTaxaConv;
  var
    vNumFab: string;
    vTaxaConv: Double;
  end;

  TRegrasProgramasFidelidades = class(TDataSet_OOP)
  public
    fTempFatP: TClientDataSet;
    fTempFaixaPontosValor: TClientDataSet;
    fTempAsseduidade: TClientDataSet;
    fTempFaixaAsseduidade: TClientDataSet;
    fTempFormaPag: TClientDataSet;
    fTempFaixaCompra: TClientDataSet;
    fTempRecPrest: TClientDataSet;
    fTempFaixaProduto: TClientDataSet;
    fTempFaixaMarcaProduto: TClientDataSet;
    fTempFaixaGrupoProduto: TClientDataSet;
    fTempFaixaSubGrupoProduto: TClientDataSet;
    fTempFaixaKitProduto: TClientDataSet;

    fTempFatPDtSource: TDataSource;
    fTempFaixaPontosValorDtSource: TDataSource;
    fTempAsseduidadeDtSource: TDataSource;
    fTempFaixaAsseduidadeDtSource: TDataSource;
    fTempFormaPagDtSource: TDataSource;
    fTempFaixaCompraDtSource: TDataSource;
    fTempRecPrestDtSource: TDataSource;
    fTempFaixaProdutoDtSource: TDataSource;
    fTempFaixaMarcaProdutoDtSource: TDataSource;
    fTempFaixaGrupoProdutoDtSource: TDataSource;
    fTempFaixaSubGrupoProdutoDtSource: TDataSource;
    fTempFaixaKitProdutoDtSource: TDataSource;

    destructor destroy; override;
    constructor create;
    procedure cadRegrasProgramaFidelidades(pTipoForm: integer);
    function abreRegrasProgramaFidelidades: boolean; overload;
    function abreRegrasProgramaFidelidades(ptipo: string): boolean; overload;
    procedure atualizarCombobox(pCombobox, pCombobox2: TComboBox; pLabel: TLabel);
    function ativarDesativarClasse(pAtivar: boolean = true): boolean;
    function abreFormAtuacao: boolean;
    function tiposvendasconfigurados(pbuscas: TIBQuery): boolean;
    procedure controlesconfigurados(pbuscas: TIBQuery);
    function simularProgramaFidelidade(pdataini, pdatafim: string; GridResumo: TStringGrid; pDet: boolean; pExibirMens: boolean = true): boolean;
    function verificarRegra(pTipo: string; pBuscas: TIBQuery): boolean;
    function retornadados(pSql: string): boolean;
    function confirmarSimulacao(pValor, pPerc: Double; pPeriodoVencP: Integer; pTotFatPer, pTotPontosPer: Double;
       pQtdeVendas, pQtdeDev: Integer; pTotVendasPer, pTotDevPer: Double; pQtdeDevAvulsas: Integer; pTotDevAvulsasPer: Double;
       pQtdeVales: Integer; pTotVales: Double; pDataIni: string; pDataFim: string): boolean;
    function testarDataSimulacao(var pMensagem: string; var pCampo: string; pTemp: string; pexibirProc: boolean = false): boolean;
    procedure atualizarDataUltimaDefClasse(vLabel: TLabel);
    function lancamentoRetroativo(pdataini, pdatafim: string): boolean;
  var
    vConfigRegrasProgramasFidelidades: TConfigRegrasProgramasFidelidades;
    vTaxaProgramasFidelidades: TTaxaProgramasFidelidades;
    vSimRealizada: boolean;
    vDataIniSim, vDataFimSim: string;
  end;

  TConfigIni = class(TDataSet_OOP)
  public
    destructor Destroy; override;
    constructor create;
    procedure cadConfigIni(tipoForm: integer);
  end;

  TAtualizaBCIDIBGE = class(TDataSet_OOP)
  public
    destructor Destroy; override;
    constructor create;
    function corrigebairrocidade: boolean;
    function corrigeCODIGOIBGE: boolean;
  var
    BuscasGenerator: TIBQuery;
  end;

  TConfigServiceHw = class(TDataSet_OOP)
  private
    //    fBanco: TIBDatabase;
    //    fTransacao: TIBTransaction;
    //    fBuscas: TIBQuery;
    f_Stream: TMemoryStream;
    f_stSize: integer;
    f_Receiving, f_abrirLog: boolean;

    f_bbkp_status, f_bbkp_formaBackup, f_bbkp_ServerName, f_bbkp_dataBase,
      f_bbkp_dataBasePath, f_bbkp_pathDestino, f_bbkp_pathDestinoExt, f_bbkp_horaBkp, f_bbkp_tipoSalvamento,
      f_bbkp_removerFbk, f_bbkp_diaUltimoBkp, f_bbkp_diaUltimoBkpFin, f_bbkp_backup_auditoria: string;

    f_t_bancoHw: string;
    f_t_bancoHwF: string;
    f_t_codEmpresa: string;
    f_t_status: string;
    f_t_hora: string;

    f_obkp_status, f_obkp_pathDestino, f_obkp_horaBkp, f_obkp_tipoSalvamento,
    f_obkp_diaUltimoBkp, f_obkp_diaUltimoBkpFin: string;
    f_obkp_qtde: integer;
    f_obkp_listaBackup: TStringList;

    f_bp_status, f_bp_codEmpresa, f_bp_bancoHw, f_bp_Hora: string;

    f_client_socket: TClientSocket;
    f_adress_server: string;
    f_log_receive: TStringList;
    f_nome_arquivo: string;
//    f_BkpBanco, f_BkpOutros, f_TerminalPAF: Boolean;
    f_tipoFormConfig: CFormsConfig;

    function _lerConfigHwService: Boolean;
    procedure clientSocketRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure clientSocketDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure clientSocketConnect(Sender: TObject; Socket: TCustomWinSocket);

  public
    destructor Destroy; override;
    constructor create;
    function _salvarParametrosBkpBanco: boolean;
    function _salvarParametrosBkpOutros: boolean;
    function _salvarParametrosTerminal: boolean;
    function _salvarParametrosBuscaPreco: boolean;
    function _lerParametros: Boolean;
    function _abreFormConfigBkp: boolean;
    function _abreFormConfigBkpOutros: boolean;
    function _abreFormConfigAtualizacaoTerminal: boolean;
    function _abreFormConfigBuscaPreco: boolean;
    function _abreFormLog: boolean;
    function abreHwService: boolean;

    procedure _iniciarServico;
    procedure _pararServico;
    procedure _pausarServico;
    procedure _continuarServico;
    procedure _installService;
    procedure _uninstallService;
    procedure _testarConexao;
    procedure _logServidor;
    procedure _conectarServer;

    procedure buscarBackup;
    procedure historicoBackup;
    function verificarBackup(vVerificar: Boolean): Boolean;
    function verificarSituacaoBackup: Boolean;
    function verificarSituacaoHwService: Boolean;
    procedure _abrirConfig(pTipoForm: CFormsConfig);

    //funcoes auxiliares
    function _selectDirectory(diretorioInicial: string): string;

    property bbkp_status: string read f_bbkp_status write f_bbkp_status;
    property bbkp_formaBackup: string read f_bbkp_formaBackup write f_bbkp_formaBackup;
    property bbkp_ServerName: string read f_bbkp_ServerName write f_bbkp_ServerName;
    property bbkp_dataBase: string read f_bbkp_dataBase write f_bbkp_dataBase;
    property bbkp_dataBasePath: string read f_bbkp_dataBasePath write f_bbkp_dataBasePath;
    property bbkp_pathDestino: string read f_bbkp_pathDestino write f_bbkp_pathDestino;
    property bbkp_pathDestinoExt: string read f_bbkp_pathDestinoExt write f_bbkp_pathDestinoExt;
    property bbkp_horaBkp: string read f_bbkp_horaBkp write f_bbkp_horaBkp;
    property bbkp_tipoSalvamento: string read f_bbkp_tipoSalvamento write f_bbkp_tipoSalvamento;
    property bbkp_removerFbk: string read f_bbkp_removerFbk write f_bbkp_removerFbk;
    property bbkp_diaUltimoBkp: string read f_bbkp_diaUltimoBkp write f_bbkp_diaUltimoBkp;
    property bbkp_diaUltimoBkpFin: string read f_bbkp_diaUltimoBkpFin write f_bbkp_diaUltimoBkpFin;
    property bbkp_backup_auditoria: string read f_bbkp_backup_auditoria write f_bbkp_backup_auditoria;

    property obkp_status: string read f_obkp_status write f_obkp_status;
    property obkp_pathDestino: string read f_obkp_pathDestino write f_obkp_pathDestino;
    property obkp_horaBkp: string read f_obkp_horaBkp write f_obkp_horaBkp;
    property obkp_tipoSalvamento: string read f_obkp_tipoSalvamento write f_obkp_tipoSalvamento;
    property obkp_listaBackup: TStringList read f_obkp_listaBackup write f_obkp_listaBackup;
    property obkp_diaUltimoBkp: string read f_obkp_diaUltimoBkp;
    property obkp_diaUltimoBkpFin: string read f_obkp_diaUltimoBkpFin;

    property t_status: string read f_t_status write f_t_status;
    property t_hora: string read f_t_hora write f_t_hora;
    property t_codEmpresa: string read f_t_codEmpresa write f_t_codEmpresa;
    property t_bancoHw: string read f_t_bancoHw write f_t_bancoHw;
    property t_bancoHwF: string read f_t_bancoHwF write f_t_bancoHwF;

    property bp_status: string read f_bp_status write f_bp_status;
    property bp_codEmpresa: string read f_bp_codEmpresa write f_bp_codEmpresa;
    property bp_bancoHw: string read f_bp_bancoHw write f_bp_bancoHw;
    property bp_Hora: string read f_bp_Hora write f_bp_Hora;

    property adress_server: string read f_adress_server write f_adress_server;
  var
  	vVerificarBackup: string;

  end;

implementation

uses uDtmConfig, uDtmAtivo, SysUtils, Menus,
  Windows, uCadMenusAuto, UcadConfigini, uPadrao, uConfiguracaoServico, FileCtrl,
  IniFiles, uCadRegrasProgramasFidelidade, uDadosIni, Controls,
  uCadRegrasValeTrocaProgFid, StrUtils;

{ TMenusAuto }

function TMenusAuto.abreMenusAuto(departamento: string): boolean;
begin
  Result := montaSelect('select * from menus_auto where ' +
    ' cod_empresa = ' + vDadosIni.codEmpresa + ' and depart_menu = ' +
    QuotedStr(Trim(departamento)) + ' and ativo = 1 and COD_MENU >= 500');
end;

function TMenusAuto.abrirLixeira: boolean;
begin
  Result := montaSelect('select * from menus_auto where ' +
    ' cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 0');
  Result := not dataSet.IsEmpty;
end;

function TMenusAuto.abreMenusAuto: boolean;
begin
  Result := montaSelect('select * from menus_auto where ' +
    ' cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 1 and COD_MENU >= 500');
end;

procedure TMenusAuto.cadMenusAuto(TipoForm: integer);
begin
  vDadosIni.vTipoForm := TipoForm;
  if frmMenusAuto = nil then
    Application.CreateForm(TfrmMenusAuto, frmMenusAuto);
  frmMenusAuto.Show;
end;

procedure TMenusAuto.configuraMenusSistema(vSistema: string);
var
  I, cod_sw: Integer;
  T: TComponent;
  vBoolCofing: Boolean;
  vTempSW, vTempMN: string;
begin
  vMnSis.vERP.dataSet.AfterScroll := nil;
  if not vMnSis.vERP.Active then
    vMnSis.vERP.abreERP;
  vMnSis.vERP.IndexFieldNames := 'cod_aplicativo';
  vMnSis.IndexFieldNames := 'nome_menu';
  IndexFieldNames := 'nome_menu';
  vMnSis.vERP.FindNearest([vSistema]);
  if UpperCase(vSistema) =
    UpperCase(trim(vMnSis.vERP.dataSet.FieldByName('cod_aplicativo').AsString)) then
  begin
    vMnSis.abreMenusSistema;
    vMnSis.dataSet.First;
    for I := 0 to formulario.ComponentCount - 1 do
    begin
      if formulario.Components[i] is TMenuItem then
      begin
        T := formulario.Components[i];

        if (T as TMenuItem).Tag = 100 then
        begin
          (T as TMenuItem).Visible := True;
          (T as TMenuItem).Enabled := True;
          Continue;
        end;

        //        if (T as TMenuItem).Tag <> 0 then
        cod_sw := (T as TMenuItem).Tag;
        vTempMN := vDadosIni.StrZero(vMnSis.IntToBin((T as TMenuItem).Tag), 8);
        vTempSW :=
          vDadosIni.StrZero(vMnSis.IntToBin(vMnSis.vERP.dataSet.FieldByName('cod_software').AsInteger), 8);

        cod_sw := Pos('1', vTempSW);

        vBoolCofing := copy(vTempMN, cod_sw, 1) = '1';

        if ((T as TMenuItem).Tag = 99) or
          //          ((T as TMenuItem).Tag = vMnSis.vERP.dataSet.FieldByName('cod_software').AsInteger) then
        (vBoolCofing) then
        begin
          vMnSis.FindNearest([(T as TMenuItem).Name]);
          FindNearest([(T as TMenuItem).Name]);
          if (Trim(vMnSis.dataSet.FieldByName('nome_menu').AsString) = ((T as TMenuItem).Name)) and
            (Trim(dataSet.FieldByName('nome_menu').AsString) = ((T as TMenuItem).Name)) then
          begin
            if (vDadosIni.vNomeUsuario = 'HW') then
            begin
              (T as TMenuItem).Visible := True;
              (T as TMenuItem).Enabled := True;
            end
            else if (vMnSis.dataSet.FieldByName('nivel_menu').AsInteger = 0) or
              (vDadosIni.vNivel >= vMnSis.dataSet.FieldByName('nivel_menu').AsInteger) then
            begin
              if trim(vMnSis.dataSet.FieldByName('status_menu').AsString) = 'V' then
                (T as TMenuItem).Visible := True;
              if trim(vMnSis.dataSet.FieldByName('enable_menu').AsString) = 'H' then
                (T as TMenuItem).Enabled := True;
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure TMenusAuto.configuraMenusTipoEmpresa(vTipo: string);
begin

end;

procedure TMenusAuto.configurarMenus(departamento: string);
var
  I: Integer;
  T: TComponent;
begin
  try
    criaMenus;
    abreMenusAuto(departamento);
    for I := 0 to formulario.ComponentCount - 1 do
    begin
      if formulario.Components[i] is TMenuItem then
      begin
        T := formulario.Components[i];
        (T as TMenuItem).Visible := False;
        (T as TMenuItem).Enabled := False;
      end;
    end;

    if dataSet.IsEmpty then
    begin
      if (vDadosIni.vNomeUsuario <> 'HW') then
      begin
        Application.MessageBox('Usuário sem departamento definido', 'Atenção', 0 + 64);
        Exit;
      end;
      for I := 0 to formulario.ComponentCount - 1 do
      begin
        if formulario.Components[i] is TMenuItem then
        begin
          T := formulario.Components[i];
          (T as TMenuItem).Visible := True;
          (T as TMenuItem).Enabled := True;
        end;
      end;
    end;
    if (vDadosIni.vRegistro.vSisAutomacao) and (vDadosIni.vSistemasUsuario.vSisAutomacao) then
      configuraMenusSistema('1');
    if (vDadosIni.vRegistro.vSisCaixaGeral) and (vDadosIni.vSistemasUsuario.vSisCaixaGeral) then
      configuraMenusSistema('2');
    if (vDadosIni.vRegistro.vSisCaixaAuxiliar) and (vDadosIni.vSistemasUsuario.vSisCaixaAuxiliar) then
      configuraMenusSistema('3');
    if (vDadosIni.vRegistro.vSisPAFECF) and (vDadosIni.vSistemasUsuario.vSisPAFECF) then
      configuraMenusSistema('4');
    if (vDadosIni.vRegistro.vSisVeiculos) and (vDadosIni.vSistemasUsuario.vSisVeiculos) then
      configuraMenusSistema('5');
    if (vDadosIni.vRegistro.vSisCRM) and (vDadosIni.vSistemasUsuario.vSisCRM) then
      configuraMenusSistema('6');
    if (vDadosIni.vRegistro.vSisGestor) and (vDadosIni.vSistemasUsuario.vSisGestor) then
      configuraMenusSistema('7');
    if (vDadosIni.vRegistro.vSisSupervisor) and (vDadosIni.vSistemasUsuario.vSisSupervisor) then
      configuraMenusSistema('8');

    for I := 0 to formulario.ComponentCount - 1 do
    begin
      if formulario.Components[i] is TMenuItem then
      begin
        T := formulario.Components[i];
        if (T as TMenuItem).Tag <> 0 then
        begin
          FindNearest([(T as TMenuItem).Name]);
          if dataSet.FieldByName('nome_menu').AsString = ((T as TMenuItem).Name)
            then
          begin
            if (Trim(dataSet.FieldByName('status_menu').AsString) = 'I') and (vDadosIni.vNomeUsuario
              <>
              'HW') then
              (T as TMenuItem).Visible := False;
            if (trim(dataSet.FieldByName('enable_menu').AsString) = 'D') and (vDadosIni.vNomeUsuario
              <>
              'HW') then
              (T as TMenuItem).Enabled := False;
          end;
        end;
      end;
    end;   

  finally
    dataSet.Close;
  end;
end;

constructor TMenusAuto.create;
begin
  if dtmConfig = nil then
    dtmConfig := TdtmConfig.Create(dtmConfig);
  dataSet := TClientDataSet(dtmConfig.cdsMenus);
  buscas := TIBQuery(dtmConfig.qrBuscas);
  transacao := TIBTransaction(dtmConfig.ibTransConfig);
  formulario := Application.MainForm;
  vMnSis := TMenusSistema.create;
end;

procedure TMenusAuto.criaMenus;
var
  I: Integer;
  T: TComponent;
begin
  try
    IniciaTransacao;
    buscas.Close;
    buscas.SQL.Text := 'select * from depto where ativo = 1';
    buscas.Open;
    while not buscas.Eof do
    begin
      montaSelect('select * from menus_auto where ' +
        ' cod_empresa = ' + vDadosIni.codEmpresa + ' and depart_menu = ' +
        QuotedStr(Trim(buscas.FieldByName('nome_depto').AsString)) + ' and COD_MENU >= 500');
      IndexFieldNames := 'nome_menu';
      //      if not dataSet.IsEmpty then
      for I := 0 to formulario.ComponentCount - 1 do
      begin
        if formulario.Components[i] is TMenuItem then
        begin
          T := formulario.Components[i];
          if (T as TMenuItem).Tag <> 0 then
          begin
            FindNearest([(T as TMenuItem).Name]);
            if dataSet.FieldByName('nome_menu').AsString = ((T as TMenuItem).Name)
              then
            begin

            end
            else
            begin
              if Insert then
              begin
                dataSet.FieldByName('cod_menu').AsInteger := Gencodigo('MENUS_AUTO',
                  dtmConfig.SpIncCodigo, '1') + 500;
                //                  (T as TMenuItem).Tag + 500;
                dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
                dataSet.FieldByName('depart_menu').AsString :=
                  buscas.FieldByName('nome_depto').AsString;
                dataSet.FieldByName('status_menu').AsString := 'V';
                dataSet.FieldByName('enable_menu').AsString := 'H';
                dataSet.FieldByName('desc_menu').AsString := StringReplace(
                  (T as TMenuItem).Caption, '&', '', [rfReplaceAll]);
                dataSet.FieldByName('nome_menu').AsString :=
                  (T as TMenuItem).Name;
                dataSet.FieldByName('ativo').AsInteger := 1;
                try

                  dataSet.Post;

                except on E: Exception do
                  if not ContainsText(e.Message, 'key violation') then
                    raise;
                end;
              end;

            end;

          end;
        end;
      end;
      Apply;
      buscas.Next;
    end;
  finally
    CommitaTransacao;
    IniciaTransacao;
  end;
end;

function TMenusAuto.delete: boolean;
begin
  Result := false;
  if dataSet.IsEmpty then
    exit;
  if dataSet.FieldByName('ATIVO').AsInteger = 0 then
  begin
    if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente?',
      'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idYES then
    begin
      inherited delete;
      Apply;
      CommitaTransacao;
    end;
  end
  else if dataSet.FieldByName('ATIVO').AsInteger = 1 then
  begin
    if Application.MessageBox('Tem certeza que deseja mover este registro para a Lixeira?',
      'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idYES then
    begin
      if Edit then
      begin
        dataSet.FieldByName('ATIVO').asinteger := 0;
        Post;
        Apply;
        CommitaTransacao;
      end;
    end;
  end;
end;

destructor TMenusAuto.Destroy;
begin
  vMnSis.Free;
  vMnSis := nil;
  inherited;
end;

procedure TMenusAuto.restaurarRegistro;
begin
  if dataSet.IsEmpty then
    exit;
  if dataSet.FieldByName('ATIVO').AsInteger = 1 then
    Exit;

  if dataSet.FieldByName('ATIVO').AsInteger = 0 then
  begin
    if Application.MessageBox('Tem certeza que deseja restaurar o registro selecionado?',
      'Restaurar Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idYES then
    begin
      if Edit then
      begin
        dataSet.FieldByName('ATIVO').asinteger := 1;
        Post;
        Apply;
        CommitaTransacao;
      end;
    end;
  end;
end;

procedure TMenusAuto.setMenuDesabilitado(pTodos: Boolean = False);
begin
  if pTodos then
  begin
    dataSet.First;
    while not dataSet.Eof do
    begin
      if dataSet.FieldByName('sel').AsString = 'S' then
      begin
        dataSet.Edit;
        dataSet.FieldByName('enable_menu').AsString := 'D';
        dataSet.Post;
      end;
      dataSet.Next;
    end;
    Apply;
    CommitaTransacao;
    IniciaTransacao;
    Exit;
  end;

  if dataSet.FieldByName('enable_menu').AsString = 'D' then
    exit;
  if Edit then
  begin
    dataSet.FieldByName('enable_menu').AsString := 'D';
    dataSet.Post;
    Apply;
    CommitaTransacao;
    IniciaTransacao;
  end;
end;

procedure TMenusAuto.setMenuHabilitado(pTodos: Boolean = False);
begin
  if pTodos then
  begin
    dataSet.First;
    while not dataSet.Eof do
    begin
      if dataSet.FieldByName('sel').AsString = 'S' then
      begin
        dataSet.Edit;
        dataSet.FieldByName('enable_menu').AsString := 'H';
        dataSet.FieldByName('status_menu').AsString := 'V';
        dataSet.Post;
      end;
      dataSet.Next;
    end;
    Apply;
    CommitaTransacao;
    IniciaTransacao;
    Exit;
  end;

  if dataSet.FieldByName('enable_menu').AsString = 'H' then
    Exit;
  if Trim(dataSet.FieldByName('status_menu').AsString) = 'I' then
  begin
    if Application.MessageBox('Menu configurado como Invisível. Deseja alterá-lo para Visível?',
      'Confirmação', MB_YESNOCANCEL + MB_ICONQUESTION) = IDYES then
    else
      exit;
  end;
  if Edit then
  begin
    dataSet.FieldByName('enable_menu').AsString := 'H';
    dataSet.FieldByName('status_menu').AsString := 'V';
    dataSet.Post;
    Apply;
    CommitaTransacao;
    IniciaTransacao;
  end;
end;

procedure TMenusAuto.setMenuInvisivel(pTodos: Boolean = False);
begin
  if pTodos then
  begin
    dataSet.First;
    while not dataSet.Eof do
    begin
      if dataSet.FieldByName('sel').AsString = 'S' then
      begin
        dataSet.Edit;
        dataSet.FieldByName('enable_menu').AsString := 'D';
        dataSet.FieldByName('status_menu').AsString := 'I';
        dataSet.Post;
      end;
      dataSet.Next;
    end;
    Apply;
    CommitaTransacao;
    IniciaTransacao;
    Exit;
  end;

  if Trim(dataSet.FieldByName('status_menu').AsString) = 'I' then
    exit;
  if Edit then
  begin
    dataSet.FieldByName('enable_menu').AsString := 'D';
    dataSet.FieldByName('status_menu').AsString := 'I';
    dataSet.Post;
    Apply;
    CommitaTransacao;
    IniciaTransacao;
  end;
end;

procedure TMenusAuto.setMenuVisivel(pTodos: Boolean = False);
begin
  if pTodos then
  begin
    dataSet.First;
    while not dataSet.Eof do
    begin
      if dataSet.FieldByName('sel').AsString = 'S' then
      begin
        dataSet.Edit;
        dataSet.FieldByName('status_menu').AsString := 'V';
        dataSet.Post;
      end;
      dataSet.Next;
    end;
    Apply;
    CommitaTransacao;
    IniciaTransacao;
    Exit;
  end;

  if Trim(dataSet.FieldByName('status_menu').AsString) = 'V' then
    exit;
  if Edit then
  begin
    dataSet.FieldByName('status_menu').AsString := 'V';
    dataSet.Post;
    Apply;
    CommitaTransacao;
    IniciaTransacao;
  end;
end;

procedure TMenusAuto._desmarcaLinha;
begin
  dataSet.Edit;
  dataSet.FieldByName('sel').AsString := '';
  dataSet.Post;
end;

procedure TMenusAuto._desmarcarTodos;
begin
  try
    vDadosIni.abreStatusProcessamento('','Aguarde. Desfazendo a seleção de todos os registros');

    if not dataSet.Active then
      Exit;

    dataSet.First;
    while not dataSet.Eof do
    begin
      dataSet.Edit;
      dataSet.FieldByName('sel').AsString := '';
      dataSet.Post;
      dataSet.Next;
    end;
    dataSet.First;

  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TMenusAuto._marcaDesmarcaLinha;
begin
  if dataSet.IsEmpty then
    exit;

  dataSet.Edit;
  if dataSet.FieldByName('sel').AsString = 'S' then
    dataSet.FieldByName('sel').AsString := ''
  else
    dataSet.FieldByName('sel').AsString := 'S';
  dataSet.Post;
end;

procedure TMenusAuto._marcaLinha;
begin
  dataSet.Edit;
  dataSet.FieldByName('sel').AsString := 'S';
  dataSet.Post;
end;

procedure TMenusAuto._marcarTodos;
begin
  try
    vDadosIni.abreStatusProcessamento('','Aguarde. Selecionando todos os registros');

    if not dataSet.Active then
      Exit;

    dataSet.First;
    while not dataSet.Eof do
    begin
      dataSet.Edit;
      dataSet.FieldByName('sel').AsString := 'S';
      dataSet.Post;
      dataSet.Next;
    end;
    dataSet.First;

  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

{ TERP_MenusSistemas }

function TERP_MenusSistemas.abreERP: boolean;
begin
  Result := montaSelect('select * from erp');

  dataSet.First;
  while not dataSet.Eof do
  begin

    dataSet.Edit;
    if dataSet.FieldByName('cod_aplicativo').AsInteger = 1 then
      dataSet.FieldByName('cod_software').AsInteger := 1
    else if dataSet.FieldByName('cod_aplicativo').AsInteger = 2 then
      dataSet.FieldByName('cod_software').AsInteger := 2
    else if dataSet.FieldByName('cod_aplicativo').AsInteger = 3 then
      dataSet.FieldByName('cod_software').AsInteger := 4
    else if dataSet.FieldByName('cod_aplicativo').AsInteger = 4 then
      dataSet.FieldByName('cod_software').AsInteger := 8
    else if dataSet.FieldByName('cod_aplicativo').AsInteger = 5 then
      dataSet.FieldByName('cod_software').AsInteger := 16
    else if dataSet.FieldByName('cod_aplicativo').AsInteger = 6 then
      dataSet.FieldByName('cod_software').AsInteger := 32
    else if dataSet.FieldByName('cod_aplicativo').AsInteger = 7 then
      dataSet.FieldByName('cod_software').AsInteger := 64
    else if dataSet.FieldByName('cod_aplicativo').AsInteger = 8 then
      dataSet.FieldByName('cod_software').AsInteger := 128;

    dataSet.Post;
    dataSet.Next;
  end;
  dataSet.First;

end;

constructor TERP_MenusSistemas.create;
begin
  if dtmConfig = nil then
    dtmConfig := TdtmConfig.Create(dtmConfig);
  dataSet := TClientDataSet(dtmConfig.cdsERP);
  buscas := TIBQuery(dtmConfig.qrBuscas);
  transacao := TIBTransaction(dtmConfig.ibTransConfig);
end;

{ TMenusSistema }

function TMenusSistema.abreMenusSistema: boolean;
var
  vIdResp: Integer;
begin
  if dataSet.ChangeCount > 0 then
  begin
    vIdResp := Application.MessageBox('Deseja salvar alterações', 'Atenção', MB_YESNOCANCEL +
      MB_ICONQUESTION);
    if vIdResp = IDYES then
    begin
      if dataSet.ChangeCount > 0 then
        Apply;
      CommitaTransacao;
    end
    else if vIdResp = IDNO then
      RollBackTransacao
    else
      exit;
  end;
  Result := montaSelect('select * from menus_auto_sistema where ' +
    ' cod_aplicativo = ' + IntToStr(vERP.dataSet.FieldByName('cod_aplicativo').AsInteger));
end;

procedure TMenusSistema.dataSetMenusSistemaAfterScroll(DataSet: TDataSet);
var
  vTempSW: string;
  vPosSW: Integer;
begin
  vTempSW := vDadosIni.StrZero(IntToBin(vERP.dataSet.FieldByName('cod_software').AsInteger), 8);
  vPosSW := Pos('1', vTempSW);

  vMenusAtuais.Filtered := False;
  //  vMenusAtuais.Filter := 'cod_aplicativo = '+vERP.dataSet.FieldByName('cod_aplicativo').AsString+
  vMenusAtuais.Filter := ' Substring(aplicativos, ' + IntToStr(vPosSW) + ', 1) = ''1''' +
    ' or cod_aplicativo = 99';
  vMenusAtuais.Filtered := True;
  abreMenusSistema;
end;

function TMenusSistema.addMenu: boolean;
var
  ponteiro: TBookmark;
  incluir: boolean;
begin
  if vMenusAtuais.IsEmpty then
    Exit;
  try
    vERP.dataSet.AfterScroll := nil;
    ponteiro := dataSet.GetBookmark;
    incluir := true;
    dataSet.First;
    while not dataSet.Eof do
    begin
      if UpperCase(trim(dataSet.FieldByName('nome_menu').AsString)) =
        UpperCase(trim(vMenusAtuais.FieldByName('nome_menu').AsString)) then
      begin
        incluir := false;
        Break;
      end;
      dataSet.Next;
    end;
    if incluir then
    begin
      dataSet.Insert;
      dataSet.FieldByName('nome_menu').AsString := vMenusAtuais.FieldByName('nome_menu').AsString;
      dataSet.FieldByName('desc_menu').AsString := vMenusAtuais.FieldByName('desc_menu').AsString;
      dataSet.FieldByName('enable_menu').AsString := 'H';
      dataSet.FieldByName('status_menu').AsString := 'V';
      dataSet.FieldByName('cod_aplicativo').AsInteger :=
        vERP.dataSet.FieldByName('cod_aplicativo').AsInteger;
      dataSet.Post;
    end;
    dataSet.GotoBookmark(ponteiro);
  finally
    vERP.dataSet.AfterScroll := dataSetMenusSistemaAfterScroll;
  end;
end;

function TMenusSistema.buscarPalavraOuFrase(palavra: string; mnSistemas: boolean): boolean;
var
  ponteiro: TBookmark;
  encontrou1, encontrou2: boolean;
  i: integer;
  j: Integer;
begin
  if mnSistemas then
  begin
    try
      if dataSet.IsEmpty then
        Exit;
      encontrou1 := false;
      ponteiro := dataSet.GetBookmark;
      i := dataSet.RecordCount;
      j := 0;
      while not encontrou1 do
      begin
        dataSet.Next;
        encontrou1 := (Pos(UpperCase(palavra), UpperCase(dataSet.FieldByName('nome_menu').AsString))
          > 0) or
          (Pos(UpperCase(palavra), UpperCase(dataSet.FieldByName('desc_menu').AsString)) > 0);
        if dataSet.Eof then
          dataSet.First;
        inc(j);
        if j + 1 > i then
        begin
          dataSet.GotoBookmark(ponteiro);
          Exit;
        end;
      end;
    finally
      Result := encontrou1;
    end;
  end
  else
  begin
    try
      if vMenusAtuais.IsEmpty then
        Exit;
      encontrou1 := false;
      ponteiro := vMenusAtuais.GetBookmark;
      i := vMenusAtuais.RecordCount;
      j := 0;
      while not encontrou1 do
      begin
        vMenusAtuais.Next;
        encontrou1 := (Pos(UpperCase(palavra),
          UpperCase(vMenusAtuais.FieldByName('nome_menu').AsString)) > 0) or
          (Pos(UpperCase(palavra), UpperCase(vMenusAtuais.FieldByName('desc_menu').AsString)) > 0);
        if vMenusAtuais.Eof then
          vMenusAtuais.First;
        inc(j);
        if j + 1 > i then
        begin
          vMenusAtuais.GotoBookmark(ponteiro);
          Exit;
        end;
      end;
    finally
      Result := encontrou1;
    end;
  end;
end;

constructor TMenusSistema.create;
begin
  if dtmConfig = nil then
    dtmConfig := TdtmConfig.Create(dtmConfig);
  dataSet := TClientDataSet(dtmConfig.cdsMnSis);
  buscas := TIBQuery(dtmConfig.qrBuscas);
  transacao := TIBTransaction(dtmConfig.ibTransConfig);
  vERP := TERP_MenusSistemas.create;
  vMenusAtuais := TClientDataSet(dtmConfig.cdsMenusAtuais);
  try
    if vMenusAtuais.Tag <> 22 then
      vMenusAtuais.CreateDataSet;
    vMenusAtuais.Tag := 22;
  except
  end;
  vMenusAtuais.EmptyDataSet;
  formulario := Application.MainForm;
  defineMenusAtuais;
  vERP.dataSet.AfterScroll := dataSetMenusSistemaAfterScroll;
end;

procedure TMenusSistema.defineMenusAtuais;
var
  I: Integer;
  T: TComponent;
begin
  while not vMenusAtuais.IsEmpty do
    vMenusAtuais.Delete;
  for I := 0 to formulario.ComponentCount - 1 do
  begin
    if formulario.Components[i] is TMenuItem then
    begin
      T := formulario.Components[i];
      if (T as TMenuItem).Tag <> 0 then
      begin
        vMenusAtuais.Insert;
        vMenusAtuais.FieldByName('nome_menu').AsString := (T as TMenuItem).Name;
        vMenusAtuais.FieldByName('cod_aplicativo').AsInteger := (T as TMenuItem).Tag;
        vMenusAtuais.FieldByName('desc_menu').AsString := StringReplace(
          (T as TMenuItem).Caption, '&', '', [rfReplaceAll]);
        vMenusAtuais.FieldByName('aplicativos').AsString := vDadosIni.StrZero(IntToBin((T as
          TMenuItem).Tag), 8);
        vMenusAtuais.Post;
      end;
    end;
  end;
end;

function TMenusSistema.delMenu: boolean;
begin
  if dataSet.IsEmpty then
    Exit;
  try
    vERP.dataSet.AfterScroll := nil;
    dataSet.Delete;
  finally
    vERP.dataSet.AfterScroll := dataSetMenusSistemaAfterScroll;
  end;
end;

function TMenusSistema.desabilitaMenu: boolean;
begin
  if (dataSet.IsEmpty) or (dataSet.FieldByName('enable_menu').AsString = 'D') then
    Exit;
  try
    vERP.dataSet.AfterScroll := nil;
    dataSet.Edit;
    dataSet.FieldByName('enable_menu').AsString := 'D';
    dataSet.Post;
  finally
    vERP.dataSet.AfterScroll := dataSetMenusSistemaAfterScroll;
  end;
end;

destructor TMenusSistema.Destroy;
begin
  vERP.Free;
  vERP := nil;
  inherited;
end;

function TMenusSistema.habilitaMenu: boolean;
begin
  if (dataSet.IsEmpty) or (dataSet.FieldByName('enable_menu').AsString = 'E') then
    Exit;
  try
    vERP.dataSet.AfterScroll := nil;
    dataSet.Edit;
    dataSet.FieldByName('enable_menu').AsString := 'H';
    dataSet.Post;
  finally
    vERP.dataSet.AfterScroll := dataSetMenusSistemaAfterScroll;
  end;
end;

function TMenusSistema.IntToBin(Valor: Int64): string;
var
  val: Int64;
  buffer: string;
begin
  val := Valor;
  while val > 0 do
  begin
    buffer := IntToStr(val mod 2) + buffer;
    val := val div 2;
  end;
  Result := buffer;
end;

function TMenusSistema.salvarAlteracoes: boolean;
var
  vIdResp: Integer;
begin
  Result := true;
  try
    vERP.dataSet.AfterScroll := nil;
    if dataSet.ChangeCount > 0 then
    begin
      vIdResp := Application.MessageBox('Deseja salvar alterações', 'Atenção', MB_YESNOCANCEL +
        MB_ICONQUESTION);
      if vIdResp = IDYES then
      begin
        if dataSet.ChangeCount > 0 then
          Apply;
        CommitaTransacao;
      end
      else if vIdResp = IDNO then
        RollBackTransacao
      else
        Result := false;
    end;
  finally
    vERP.dataSet.AfterScroll := dataSetMenusSistemaAfterScroll;
  end;
end;

function TMenusSistema.setMenuInvisivel: boolean;
begin
  if (dataSet.IsEmpty) or (dataSet.FieldByName('status_menu').AsString = 'I') then
    Exit;
  try
    vERP.dataSet.AfterScroll := nil;
    dataSet.Edit;
    dataSet.FieldByName('status_menu').AsString := 'I';
    dataSet.Post;
  finally
    vERP.dataSet.AfterScroll := dataSetMenusSistemaAfterScroll;
  end;
end;

function TMenusSistema.setMenuVisivel: boolean;
begin
  if (dataSet.IsEmpty) or (dataSet.FieldByName('status_menu').AsString = 'V') then
    Exit;
  try
    vERP.dataSet.AfterScroll := nil;
    dataSet.Edit;
    dataSet.FieldByName('status_menu').AsString := 'V';
    dataSet.Post;
  finally
    vERP.dataSet.AfterScroll := dataSetMenusSistemaAfterScroll;
  end;
end;

procedure TMenusSistema.setNivelUsuario(nivel: integer);
begin
  if (dataSet.IsEmpty) or (dataSet.FieldByName('nivel_menu').AsInteger = nivel) then
    Exit;
  try
    vERP.dataSet.AfterScroll := nil;
    dataSet.Edit;
    dataSet.FieldByName('nivel_menu').AsInteger := nivel;
    dataSet.Post;
  finally
    vERP.dataSet.AfterScroll := dataSetMenusSistemaAfterScroll;
  end;
end;

{ TConfigIni }

procedure TConfigIni.cadConfigIni(tipoForm: integer);
begin
  if not vDadosIni.PesqPros('CFG033', 'EDITAR', '', 'CONFIG.INI', '', buscas, true) then
    exit;
  vDadosIni.vTipoForm := TipoForm;
  if frmCadConfigini = nil then
    Application.CreateForm(TfrmCadConfigini, frmCadConfigini);
  frmCadConfigini.Showmodal;
end;

constructor TConfigIni.create;
begin
  if dtmConfig = nil then
    dtmConfig := TdtmConfig.Create(dtmConfig);
  buscas := TIBQuery(dtmConfig.qrBuscas);
  transacao := TIBTransaction(dtmConfig.ibTransConfig);
end;

destructor TConfigIni.Destroy;
begin
  inherited;
end;

{ TAtualizaBCIDIBGE }

function TAtualizaBCIDIBGE.corrigebairrocidade: boolean;
var
  i, itx, incMAX: integer;
  vnome: string;
begin
  if vDadosIni.vNomeUsuario <> 'HW' then
  begin
    Application.MessageBox(Pchar('Somente permitido para o usuário HW'), 'Informação', MB_OK +
      MB_ICONINFORMATION + MB_DEFBUTTON1);
    exit;
  end;
  if Application.MessageBox('Deseja corrigir as cidades,bairros e CEP?',
    'Corrigir Cidades e Bairros', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idYES then
  begin
    IniciaTransacao;
    try
      dataSet.close;
      dataSet.CommandText := 'select distinct(cidade) as nome_cidade from clientes ' +
        'union select distinct(cidade_vendedor) as nome_cidade from colaborador ' +
        'union select distinct(cida_cobranca) as nome_cidade from clientes ' +
        'union select distinct(cidade) as nome_cidade from cep ';
      dataSet.Open;
      dataSet.First;
      i := 0;
      itx := 0;

      BuscasGenerator.close;
      BuscasGenerator.SQL.Text := 'select GEN_ID(inc_cod_cidade,1) from rdb$database';
      BuscasGenerator.Open;
      itx := BuscasGenerator.FieldByName('GEN_ID').asinteger;

      BuscasGenerator.close;
      BuscasGenerator.SQL.Text := 'select first 1 max(COD_CIDADE) as COD_CIDADE from CIDADES';
      BuscasGenerator.Open;
      IncMax := BuscasGenerator.FieldByName('COD_CIDADE').asinteger;

      if (IncMax > itx) then
        itx := IncMax + 1;

      while not dataSet.Eof do
      begin
        try
          buscas.close;
          vnome := StringReplace(dataSet.FieldByName('NOME_CIDADE').AsString, '"', '',
            [rfReplaceAll]);
          vnome := StringReplace(vnome, '''', '', [rfReplaceAll]);
          buscas.sql.text := 'select NOME_CIDADE from CIDADES where NOME_CIDADE = ''' + vnome +
            '''';
          buscas.Open;
          if buscas.IsEmpty then
          begin
            i := i + 1;
            buscas.Close;
            buscas.sql.text := 'insert into CIDADES(COD_CIDADE, NOME_CIDADE)  VALUES (' +
              inttostr(itx) + ',''' + Copy(vnome,1,30) + ''')';
            buscas.Prepare;
            buscas.ExecSQL;
            itx := itx + 1;
            //          button2.caption := inttostr(itx);
            //          button2.refresh;
          end;
        except
          Application.MessageBox(Pchar('Erro na conversão da cidade ' +
            dataSet.FieldByName('NOME_CIDADE').asstring), 'Informação', MB_OK + MB_ICONINFORMATION
            +
            MB_DEFBUTTON1);
        end;
        dataset.next;
      end;
      buscas.close;
      buscas.sql.text := 'set generator inc_cod_cidade to ' + inttostr(itx);
      buscas.Prepare;
      buscas.ExecSQL;
      CommitaTransacao;
    except
      on e: Exception do
      begin
        RollBackTransacao;
        Result := False;
        Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
        registraErro(e.Message);
      end;
    end;
    IniciaTransacao;
    try
      dataSet.close;
      dataSet.CommandText := 'select distinct(bairro) as bai from clientes ' +
        'union select distinct(CAST(bairro_vendedor as char(35))) as bai ' +
        ' from colaborador ' +
        'union ' +
        'select distinct(CAST(bairro_cobranca as char(35))) as bai ' +
        'from clientes ' +
        'union ' +
        'select distinct(CAST(bairro as char(35))) as bai ' +
        'from cep';
      dataSet.Open;
      dataSet.First;

      i := 0;
      itx := 0;

      BuscasGenerator.close;
      BuscasGenerator.SQL.Text := 'select GEN_ID(INC_COD_BAIRRO,1) from rdb$database';
      BuscasGenerator.Open;
      itx := BuscasGenerator.FieldByName('GEN_ID').asinteger;

      BuscasGenerator.close;
      BuscasGenerator.SQL.Text := 'select first 1 max(COD_BAIRRO) AS COD_BAIRRO from BAIRROS';
      BuscasGenerator.Open;
      IncMax := BuscasGenerator.FieldByName('COD_BAIRRO').asinteger;

      if (IncMax > itx) then
        itx := IncMax + 1;

      while not dataset.EOF do
      begin
        try
          buscas.close;
          vnome := StringReplace(dataSet.FieldByName('BAI').AsString, '"', '', [rfReplaceAll]);
          vnome := StringReplace(vnome, '''', '', [rfReplaceAll]);
          buscas.sql.text := 'select NOME_BAIRRO from BAIRROS where NOME_BAIRRO = ''' + vnome +
            '''';
          buscas.Open;
          if buscas.IsEmpty then
          begin
            buscas.Close;
            buscas.sql.text := 'insert into BAIRROS(COD_BAIRRO, NOME_BAIRRO)  VALUES (' +
              inttostr(itx) + ',''' + Copy(vnome,1,30) + ''')';
            buscas.Prepare;
            buscas.ExecSQL;
            itx := itx + 1;
            i := i + 1;
            //          button2.caption := inttostr(itx);
            //          button2.refresh;
          end;
        except
          Application.MessageBox(Pchar('Erro na conversão da cidade ' +
            dataSet.FieldByName('NOME_BAIRRO').asstring), 'Informação', MB_OK + MB_ICONINFORMATION
            +
            MB_DEFBUTTON1);
        end;
        dataset.next;
      end;
      buscas.close;
      buscas.sql.text := 'set generator inc_cod_bairro to ' + inttostr(itx);
      buscas.Prepare;
      buscas.ExecSQL;
      CommitaTransacao;
    except
      on e: Exception do
      begin
        RollBackTransacao;
        Result := False;
        Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
        registraErro(e.Message);
      end;
    end;
    IniciaTransacao;
    try
      dataSet.close;
      dataSet.CommandText := ' select distinct(sigla_estado) as sigla ' +
        ' from cep where ( select estados.sigla_uf from estados ' +
        ' where estados.sigla_uf = cep.sigla_estado ) is null ';
      dataSet.Open;
      dataSet.First;

      i := 0;
      itx := 0;

      BuscasGenerator.close;
      BuscasGenerator.SQL.Text := 'select GEN_ID(INC_COD_ESTADO,1) from rdb$database';
      BuscasGenerator.Open;
      itx := BuscasGenerator.FieldByName('GEN_ID').asinteger;

      BuscasGenerator.close;
      BuscasGenerator.SQL.Text := 'select first 1 max(codigo_uf) AS codigo_uf from estados';
      BuscasGenerator.Open;
      IncMax := BuscasGenerator.FieldByName('codigo_uf').asinteger;

      if (IncMax > itx) then
        itx := IncMax + 1;

      while not dataset.EOF do
      begin
        try
          buscas.close;
          vnome := StringReplace(dataSet.FieldByName('SIGLA').AsString, '"', '', [rfReplaceAll]);
          vnome := StringReplace(vnome, '''', '', [rfReplaceAll]);
          buscas.sql.text := 'select SIGLA_UF from ESTADOS where SIGLA_UF = ''' + vnome + '''';
          buscas.Open;

          BuscasGenerator.close;
          BuscasGenerator.SQL.Text := 'select NOME_UF from ESTADOS where SIGLA_UF = ''' + vnome +
            '''';
          BuscasGenerator.Open;

          if buscas.IsEmpty then
          begin
            buscas.Close;
            buscas.sql.text := 'insert into ESTADOS(CODIGO_UF,SIGLA_UF, NOME_UF)  VALUES (' +
              inttostr(itx) + ',''' + vnome + ''','''
              + StringReplace(StringReplace(BuscasGenerator.FieldByName('NOME_UF').AsString, '"',
              '',
              [rfReplaceAll]), '''', '', [rfReplaceAll]) + ''')';
            buscas.Prepare;
            buscas.ExecSQL;
            itx := itx + 1;
            i := i + 1;
            //          button2.caption := inttostr(itx);
            //          button2.refresh;
          end;
        except
          Application.MessageBox(Pchar('Erro na conversão da cidade ' +
            dataSet.FieldByName('NOME_BAIRRO').asstring), 'Informação', MB_OK + MB_ICONINFORMATION
            +
            MB_DEFBUTTON1);
        end;
        dataset.next;
      end;
      buscas.close;
      buscas.sql.text := 'set generator INC_COD_ESTADO to ' + inttostr(itx);
      buscas.Prepare;
      buscas.ExecSQL;
      CommitaTransacao;
    except
      on e: Exception do
      begin
        RollBackTransacao;
        Result := False;
        Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
        registraErro(e.Message);
      end;
    end;
    IniciaTransacao;
    try
      dataset.close;
      dataset.CommandText := 'select * from cidades ';
      dataSet.open;
      itx := 0;
      while not dataSet.EOF do
      begin
        buscas.close;
        buscas.sql.text := 'update CLIENTES set cod_cidade = ' +
          dataSet.FieldByName('COD_CIDADE').asstring +
          ' where cidade = ''' +
          StringReplace(StringReplace(dataSet.FieldByName('NOME_CIDADE').AsString, '"', '',
          [rfReplaceAll]), '''', '', [rfReplaceAll]) + '''';
        buscas.Prepare;
        buscas.ExecSQL;
        buscas.close;
        buscas.sql.text := 'update CLIENTES set cod_cidade_cobranca = ' +
          dataSet.FieldByName('COD_CIDADE').asstring +
          ' where CIDA_COBRANCA = ''' +
          StringReplace(StringReplace(dataSet.FieldByName('NOME_CIDADE').AsString, '"', '',
          [rfReplaceAll]), '''', '', [rfReplaceAll]) + '''';
        buscas.Prepare;
        buscas.ExecSQL;

        buscas.close;
        buscas.sql.text := 'update COLABORADOR set COD_CIDADE = ' +
          dataSet.FieldByName('COD_CIDADE').AsString +
          ' where CIDADE_VENDEDOR = ''' +
          StringReplace(StringReplace(dataSet.FieldByName('NOME_CIDADE').AsString, '"', '',
          [rfReplaceAll]), '''', '', [rfReplaceAll]) + '''';
        buscas.Prepare;
        buscas.ExecSQL;

        buscas.close;
        buscas.sql.text := 'update CEP set COD_CIDADE = ' +
          dataSet.FieldByName('COD_CIDADE').AsString +
          ' where CIDADE = ''' +
          StringReplace(StringReplace(dataSet.FieldByName('NOME_CIDADE').AsString, '"', '',
          [rfReplaceAll]), '''', '', [rfReplaceAll]) + '''';
        buscas.Prepare;
        buscas.ExecSQL;

        dataset.Next;
        itx := itx + 1;

      end;

      dataset.close;
      dataset.CommandText := 'select * from bairros ';
      dataSet.open;
      itx := 0;
      while not dataSet.eof do
      begin
        {buscas.close;
        buscas.sql.text:='update CLIENTES set cod_bairro = ' + dataSet.FieldByName('COD_BAIRRO').AsString+
          ',cod_bairro_cobranca = ' +dataSet.FieldByName('COD_BAIRRO').AsString + ',BAIRRO_COBRANCA = ''' +
          StringReplace(StringReplace(dataSet.FieldByName('NOME_BAIRRO').AsString, '"', '', [rfReplaceAll]), '''', '', [rfReplaceAll]) +
          ''' where BAIRRO = '''+StringReplace(StringReplace(dataSet.FieldByName('NOME_BAIRRO').AsString, '"', '', [rfReplaceAll]), '''', '', [rfReplaceAll])+ '''';
        buscas.Prepare;
        buscas.ExecSQL;
        buscas.close;
        buscas.sql.text:='update CLIENTES set cod_bairro_cobranca = ' + dataSet.FieldByName('COD_BAIRRO').AsString+
          ',BAIRRO_COBRANCA = ''' +StringReplace(StringReplace(dataSet.FieldByName('NOME_BAIRRO').AsString, '"', '', [rfReplaceAll]), '''', '', [rfReplaceAll]) +
          ''' where BAIRRO_COBRANCA = '''+StringReplace(StringReplace(dataSet.FieldByName('NOME_BAIRRO').AsString, '"', '', [rfReplaceAll]), '''', '', [rfReplaceAll])+ '''';
        buscas.Prepare;
        buscas.ExecSQL;
}

        buscas.close;
        buscas.sql.text := 'update CLIENTES set cod_bairro = ' +
          dataSet.FieldByName('COD_BAIRRO').AsString +
          ' where BAIRRO = :pBairro';
        buscas.ParamByName('pBairro').AsString := trim(dataSet.FieldByName('NOME_BAIRRO').AsString);
        buscas.Prepare;
        buscas.ExecSQL;

        buscas.close;
        buscas.sql.text := 'update CLIENTES set cod_bairro_cobranca = ' +
          dataSet.FieldByName('COD_BAIRRO').AsString +
          ' where BAIRRO_COBRANCA = :pBairro';
        buscas.ParamByName('pBairro').AsString := trim(dataSet.FieldByName('NOME_BAIRRO').AsString);
        buscas.Prepare;
        buscas.ExecSQL;

        buscas.close;
        buscas.sql.text := 'update CLIENTES set cod_bairro_cobranca = ' +
          dataSet.FieldByName('COD_BAIRRO').AsString +
          ',BAIRRO_COBRANCA = ''' +
          StringReplace(StringReplace(dataSet.FieldByName('NOME_BAIRRO').AsString, '"', '',
          [rfReplaceAll]), '''', '', [rfReplaceAll]) +
          ''' where BAIRRO = :pBairro and cod_bairro_cobranca is null';
        buscas.ParamByName('pBairro').AsString := trim(dataSet.FieldByName('NOME_BAIRRO').AsString);
        buscas.Prepare;
        buscas.ExecSQL;

        buscas.close;
        buscas.sql.text := 'update COLABORADOR set COD_BAIRRO = ' +
          dataSet.FieldByName('COD_BAIRRO').AsString +
          ' where BAIRRO_VENDEDOR = :pBairro';
        buscas.ParamByName('pBairro').AsString := trim(dataSet.FieldByName('NOME_BAIRRO').AsString);
        buscas.Prepare;
        buscas.ExecSQL;

        buscas.close;
        buscas.sql.text := 'update CEP set COD_BAIRRO = ' +
          dataSet.FieldByName('COD_BAIRRO').AsString +
          ' where BAIRRO = :pBairro';
        buscas.ParamByName('pBairro').AsString := trim(dataSet.FieldByName('NOME_BAIRRO').AsString);
        buscas.Prepare;
        buscas.ExecSQL;

        dataSet.Next;
        itx := itx + 1;

      end;

      dataset.close;
      dataset.CommandText := 'select * from estados ';
      dataSet.open;
      itx := 0;
      while not dataSet.eof do
      begin

        buscas.close;
        buscas.sql.text := 'update CEP set COD_ESTADO = ' + dataSet.FieldByName('CODIGO_UF').AsString
          +
          ',SIGLA_ESTADO= ' + QuotedStr(dataSet.FieldByName('SIGLA_UF').AsString) +
          ' where ESTADO = ''' +
          StringReplace(StringReplace(dataSet.FieldByName('NOME_UF').AsString,
          '"', '', [rfReplaceAll]), '''', '', [rfReplaceAll]) + '''';
        buscas.Prepare;
        buscas.ExecSQL;

        dataSet.Next;
        itx := itx + 1;
        //      button2.caption := inttostr(itx);
        //      button2.refresh;
      end;

      CommitaTransacao;
    except
      on e: Exception do
      begin
        RollBackTransacao;
        Result := False;
        Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
        registraErro(e.Message);
      end;
    end;
    Application.MessageBox('Cidades e Bairros Corrigidos', 'Informação', MB_OK + MB_ICONINFORMATION
      + MB_DEFBUTTON1);
  end;

end;

function TAtualizaBCIDIBGE.corrigeCODIGOIBGE: boolean;
begin
  if vDadosIni.vNomeUsuario <> 'HW' then
  begin
    Application.MessageBox(Pchar('Somente permitido para o usuário HW'), 'Informação', MB_OK +
      MB_ICONINFORMATION + MB_DEFBUTTON1);
    exit;
  end;
  if Application.MessageBox('Deseja corrigir Código IBGE para Cidades e Estados?',
    'Corrigir Código IBGE', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IDNO then
    exit;

  IniciaTransacao;
  try
    dataSet.close;
    dataSet.CommandText := 'select * from ESTADOS';
    dataSet.open;
    while not dataSet.Eof do
    begin
      buscas.close;
      buscas.sql.text := 'select * from cidades_ibge where nome_uf = ''' +
        dataSet.fieldbyname('nome_uf').asstring + '''';
      buscas.Open;
      if not buscas.IsEmpty then
      begin
        dataSet.Edit;
        dataSet.fieldbyname('IBGE_CODIGO_UF').AsInteger :=
          buscas.fieldbyname('CODIGO_UF_IBGE').asinteger;
        dataSet.Post;
      end;
      dataSet.Next;
    end;
    dataSet.ApplyUpdates(-1);
    Application.MessageBox('Transferência de Estado Completo', 'Informação', MB_OK +
      MB_ICONINFORMATION + MB_DEFBUTTON1);

    dataSet.close;
    dataSet.CommandText := 'select * from CIDADES';
    dataSet.open;
    while not dataSet.eof do
    begin
      buscas.close;
      buscas.sql.text := 'select * from cidades_ibge where NOME_MUNICIPIO = ''' +
        dataSet.fieldbyname('NOME_CIDADE').asstring + '''';
      buscas.Open;
      if not buscas.IsEmpty then
      begin
        dataSet.Edit;
        dataSet.fieldbyname('IBGE_COD_CIDADE').AsInteger :=
          buscas.fieldbyname('CODIGO_MUN_IBGE').asinteger;
        dataSet.Post;
      end;
      dataSet.Next;
    end;
    dataSet.ApplyUpdates(-1);
    CommitaTransacao;
    Application.MessageBox('Transferência de Cidades Completo', 'Informação', MB_OK +
      MB_ICONINFORMATION + MB_DEFBUTTON1);
  except
    on e: Exception do
    begin
      RollBackTransacao;
      Result := False;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

constructor TAtualizaBCIDIBGE.create;
begin
  if dtmConfig = nil then
    dtmConfig := TdtmConfig.Create(dtmConfig);
  dataSet := TClientDataSet(dtmConfig.CdsBairrosCidades);
  buscas := TIBQuery(dtmConfig.qrBuscas);
  BuscasGenerator := TIBQuery(dtmConfig.qrBuscasGenerator);
  transacao := TIBTransaction(dtmConfig.ibTransConfig);
end;

destructor TAtualizaBCIDIBGE.Destroy;
begin

  inherited;
end;

{ TConfigServiceHw }

function TConfigServiceHw.abreHwService: boolean;
begin
  if dtmConfig = nil then
    dtmConfig := TdtmConfig.Create(dtmConfig);

  if not vDadosIni.PesqPros('CFG034', 'ABRIR', '', '', '', dtmConfig.qrBuscas, False) then
    Exit;

  if frmConfiguracaoServico = nil then
    Application.CreateForm(TfrmConfiguracaoServico, frmConfiguracaoServico);

  frmConfiguracaoServico.Position := poScreenCenter;
  frmConfiguracaoServico.ShowModal;
end;

procedure TConfigServiceHw.buscarBackup;
begin
	buscas.Close;
  buscas.SQL.Text := ' select first 100 ' +
    ' DATA, ' +
  	' NOMECOMPUTADOR, ' +
    ' IP, ' +
    ' SERIALHD, ' +
    ' ORIGEM, ' +
    ' ARQUIVO from HISTORICO_BACKUP ' +
  	' order by data desc ';
  buscas.Open;

  buscas.FieldByName('DATA').DisplayLabel := 'Data';
  buscas.FieldByName('NOMECOMPUTADOR').DisplayLabel := 'NomeComputador';
  buscas.FieldByName('IP').DisplayLabel := 'IP';
  buscas.FieldByName('SERIALHD').DisplayLabel := 'Serial HD';
  buscas.FieldByName('ORIGEM').DisplayLabel := 'Origem (Banco / Arq / Diretório)';
	buscas.FieldByName('ARQUIVO').DisplayLabel := 'Destino (Arq)';
end;

procedure TConfigServiceHw.clientSocketConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  if frmConfiguracaoServico <> nil then
  begin
    frmConfiguracaoServico.BitBtn6.Enabled  := False;
    frmConfiguracaoServico.BitBtn1.Enabled  := True;
    frmConfiguracaoServico.BitBtn2.Enabled  := True;
    frmConfiguracaoServico.BitBtn7.Enabled  := True;
    frmConfiguracaoServico.BitBtn8.Enabled  := True;
    frmConfiguracaoServico.BitBtn9.Enabled  := True;
    frmConfiguracaoServico.BitBtn22.Enabled := True;
    frmConfiguracaoServico.BitBtn27.Enabled := True;
    frmConfiguracaoServico.BitBtn13.Enabled := True;
  end;
end;

procedure TConfigServiceHw.clientSocketDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  if frmConfiguracaoServico <> nil then
  begin
    frmConfiguracaoServico.BitBtn6.Enabled  := True;
    frmConfiguracaoServico.BitBtn1.Enabled  := False;
    frmConfiguracaoServico.BitBtn2.Enabled  := False;
    frmConfiguracaoServico.BitBtn7.Enabled  := False;
    frmConfiguracaoServico.BitBtn8.Enabled  := False;
    frmConfiguracaoServico.BitBtn9.Enabled  := False;
    frmConfiguracaoServico.BitBtn22.Enabled := False;
    frmConfiguracaoServico.BitBtn27.Enabled := False;
    frmConfiguracaoServico.BitBtn13.Enabled := False;
  end;
  //Application.MessageBox('Desconectado com o servidor', 'Atenção', 0 + 64);
end;

procedure TConfigServiceHw.clientSocketRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  vResp: string;
begin
  vResp := Socket.ReceiveText;
  if not f_Receiving then
  begin
    if pos(#0 + 'LOG', vResp) > 0 then
    begin
      f_stSize := strtoint(copy(vResp, 1, pos(#0, vResp) - 1));
      f_nome_arquivo := 'hwService.log';
      vDadosIni.abreStatusProcessamento('', 'Recebendo log do servidor');
    end
    else if pos(#0 + 'CFG', vResp) > 0 then
    begin
      f_stSize := strtoint(copy(vResp, 1, pos(#0, vResp) - 1));
      f_nome_arquivo := 'HwService.ini';
      vDadosIni.abreStatusProcessamento('', 'Recebendo Config do servidor');
    end
    else
    begin
      if (trim(vResp) <> '') and (trim(vResp) <> 'OK') then
      begin
        if vDadosIni.getCampoPipe(vResp, 1) = 'OK' then
          Application.MessageBox(pchar(vDadosIni.getCampoPipe(vResp, 2)), 'Atenção', 0 + 64)
        else
          Application.MessageBox(pchar(vDadosIni.getCampoPipe(vResp, 2)), 'Erro',
            MB_ICONERROR + MB_OK);
      end;
      Exit;
    end;
    f_Stream := TMemoryStream.Create;
    f_Receiving := True;
    System.delete(vResp, 1, pos(#0, vResp) + 3);

    try
      try
        f_Stream.Write(vResp[1], length(vResp));
        if f_Stream.Size = f_stSize then
        begin
          f_Stream.Position := 0;
          f_Receiving := False;
          f_log_receive := TStringList.Create;
          f_log_receive.LoadFromStream(f_Stream);
          f_log_receive.SaveToFile(ExtractFilePath(Application.ExeName) + f_nome_arquivo);
          f_log_receive.Clear;
          f_log_receive.Free;
          f_log_receive := nil;
          f_Stream.Free;
          f_abrirLog := True;
          vDadosIni.fechaStatusProcessamento;
        end;
      except
        f_Stream.Free;
      end;

      if f_abrirLog then
      begin
        if f_nome_arquivo = 'hwService.log' then
          _abreFormLog
        else
        begin
          if f_tipoFormConfig = cfBackup then
            _abreFormConfigBkp
          else if f_tipoFormConfig = cfBackupOutros then
            _abreFormConfigBkpOutros
          else if f_tipoFormConfig = cfAtualTerminais then
            _abreFormConfigAtualizacaoTerminal
          else if f_tipoFormConfig = cfBuscaPreco then
            _abreFormConfigBuscaPreco;
        end;
      end;
    finally
      f_abrirLog := False;
    end;

  end
  else
  begin
    try
      try
        f_Stream.Write(vResp[1], length(vResp));
        if f_Stream.Size = f_stSize then
        begin
          f_Stream.Position := 0;
          f_Receiving := False;
          f_log_receive := TStringList.Create;
          f_log_receive.LoadFromStream(f_Stream);
          f_log_receive.SaveToFile(ExtractFilePath(Application.ExeName) + f_nome_arquivo);
          f_log_receive.Clear;
          f_log_receive.Free;
          f_log_receive := nil;
          f_Stream.Free;
          f_abrirLog := True;
          vDadosIni.fechaStatusProcessamento;
        end;
      except
        f_Stream.Free;
      end;

      if f_abrirLog then
      begin
        if f_nome_arquivo = 'hwService.log' then
          _abreFormLog
        else
        begin
          if f_tipoFormConfig = cfBackup then
            _abreFormConfigBkp
          else if f_tipoFormConfig = cfBackupOutros then
            _abreFormConfigBkpOutros
          else if f_tipoFormConfig = cfAtualTerminais then
            _abreFormConfigAtualizacaoTerminal
          else if f_tipoFormConfig = cfBuscaPreco then
            _abreFormConfigBuscaPreco;
        end;
      end;
    finally
      f_abrirLog := False;
    end;
  end;
end;

constructor TConfigServiceHw.create;
begin
  if dtmConfig = nil then
    dtmConfig := TdtmConfig.Create(dtmConfig);
  f_obkp_listaBackup := TStringList.Create; ;

//  vDadosIni.CreateProcessSimple(ExtractFilePath(Application.ExeName) + 'HwServico.exe');

  f_client_socket := TClientSocket.Create(Application);
  f_client_socket.Active := False;
  f_client_socket.Host := '127.0.0.1';
  f_client_socket.Port := 5351;
  f_client_socket.ClientType := ctNonBlocking;
  f_client_socket.OnRead := clientSocketRead;
  f_client_socket.OnDisconnect := clientSocketDisconnect;
  f_client_socket.OnConnect := clientSocketConnect;
  f_Receiving := False;
  f_abrirLog := False;
  //f_client_socket.Active := True;

//  fBanco := TIBDatabase.Create(Application);
//  fTransacao := TIBTransaction.Create(Application);
//  fTransacao.Params.Add('read_committed');
//  fTransacao.Params.Add('rec_version');
//  fTransacao.Params.Add('nowait');
//  fTransacao.DefaultDatabase := fBanco;
//  fBanco.DefaultTransaction := fTransacao;
//  fBanco.LoginPrompt := false;
//  fBanco.Params.Add('user_name=sysdba');
//  fBanco.Params.Add('password=masterkey');
//  fBuscas := TIBQuery.Create(Application);
//  fBuscas.Database := fBanco;
//  fBuscas.Transaction := fTransacao;

  buscas := TIBQuery(dtmConfig.qrBuscas);

end;

destructor TConfigServiceHw.Destroy;
begin
  buscas.Close;
  //  buscas.Free;
  //  buscas := nil;

  f_obkp_listaBackup.Free;
  f_obkp_listaBackup := nil;

  if not f_client_socket.Active then
    f_client_socket.Active := False;

  f_client_socket.Active := False;
  f_client_socket.Free;
  f_client_socket := nil;

  //  fBanco.Connected := False;
  //  fBanco.DefaultTransaction :=  nil;
  //
  //  fTransacao.DefaultDatabase := nil;
  //  fTransacao.free;
  //  fTransacao := nil;
  //
  //  fBanco.Free;
  //  fBanco := nil;
end;

procedure TConfigServiceHw.historicoBackup;
var
	vDataSource: TDataSource;
begin
	buscarBackup;

  try
  	vDataSource := TDataSource.Create(nil);
    vDataSource.Name := 'vDataSource99'; 
  	vDataSource.DataSet := buscas;

  	frmConfiguracaoServico.DBGrid1.DataSource := vDataSource;

    frmConfiguracaoServico.Align := alNone;
    frmConfiguracaoServico.pnHistorico.Height := 540 ;
    frmConfiguracaoServico.pnHistorico.Width  := 1059;
    vDadosIni.abreForm('Histórico de Backup', frmConfiguracaoServico.pnHistorico, [ofEscapeExit, ofAlignAllClientWinCtrl]);
  finally
    if Assigned(vDataSource) then
      FreeAndNil(vDataSource);
  end;
end;

function TConfigServiceHw.verificarBackup(vVerificar: Boolean): Boolean;
var
	vProcesso: string;
  vMensagem: string;
begin
	Result := False;

  if vVerificar then
  begin
  	vProcesso := 'CFG060';
    vMensagem := 'VERIFICAR';
  end
  else
  begin
    vProcesso := 'CFG061';
    vMensagem := 'NAO VERIFICAR';
  end;

  if not vDadosIni.PesqPros(vProcesso, vMensagem, '', 'EMPDESVOLV', '', buscas, True) then
    Exit;

	buscas.Close;
  buscas.SQL.Text := 'UPDATE EMPDESVOLV SET EMPDESVOLV.VERIFICAR_BACKUP = ' + QuotedStr(vDadosIni.IfThen(vVerificar, 'S', 'N')) +
  	' WHERE EMPDESVOLV.COD_EMPDES = 1 ';
  try
  	buscas.ExecSQL;

    if buscas.Transaction.InTransaction then
    begin
    	buscas.Transaction.Commit;
    	Result := True;
    end;

    vDadosIni.GravaAuditoria(vProcesso, vMensagem, 'SUCESSO', 'EMPDESVOLV', '', buscas);
  except
    buscas.Transaction.Rollback;
  	vDadosIni.GravaAuditoria(vProcesso, vMensagem, 'FALHA', 'EMPDESVOLV', '', buscas);
  end;
end;

function TConfigServiceHw.verificarSituacaoBackup: Boolean;
begin
	Result := False;

	try
    buscas.Close;
    buscas.SQL.Text := 'SELECT EMPDESVOLV.VERIFICAR_BACKUP FROM EMPDESVOLV ' +
      ' WHERE EMPDESVOLV.COD_EMPDES = 1 ';
    buscas.Open;

    vVerificarBackup := buscas.FieldByName('VERIFICAR_BACKUP').AsString;

    Result := True;
  except
    on e: Exception do
    begin
      Result := False;
      Application.MessageBox(pchar('Falhar verificar situação backup: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro('TConfigServiceHw.verificarSituacaoBackup: ' + e.Message);
    end;
  end;
end;

function TConfigServiceHw.verificarSituacaoHwService: Boolean;
begin
	Result := vDadosIni.RunningTask('HwServico.exe') > 0;
end;

function TConfigServiceHw._abreFormConfigAtualizacaoTerminal: boolean;
var
  formulario: TfrmPadrao;
begin
  if not vDadosIni.PesqPros('CFG043', 'ABRIR', '', '', '', buscas, False) then
    Exit;
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Caption :=
      'Configuração de Atualização de Terminais';
    frmConfiguracaoServico.pnTerminal.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    frmConfiguracaoServico.pnTerminal.Visible := True;

    formulario.Position := poScreenCenter;
    formulario.OnShow := frmConfiguracaoServico.FormShowTerminal;

    _lerParametros;

    result := (formulario.ShowModal = IDOK);

  finally
    frmConfiguracaoServico.pnTerminal.Visible := False;
    frmConfiguracaoServico.pnTerminal.Parent := frmConfiguracaoServico.tsAtualizacaoHwF;
    formulario.Free;
    formulario := nil;
  end;
end;

function TConfigServiceHw._abreFormConfigBkp: boolean;
var
  formulario: TfrmPadrao;
begin
  if not vDadosIni.PesqPros('CFG041', 'ABRIR', '', '', '', buscas, False) then
    Exit;
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Caption :=
      'Configuração de Backup do banco de dados';
    frmConfiguracaoServico.pnBkp.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    frmConfiguracaoServico.pnBkp.Visible := True;

    formulario.Position := poScreenCenter;
    formulario.OnShow := frmConfiguracaoServico.FormShowBkp;

    _lerParametros;

    result := (formulario.ShowModal = IDOK);

  finally
    frmConfiguracaoServico.pnBkp.Visible := False;
    frmConfiguracaoServico.pnBkp.Parent := frmConfiguracaoServico.tsBackupBanco;
    formulario.Free;
    formulario := nil;
  end;
end;

function TConfigServiceHw._abreFormConfigBkpOutros: boolean;
var
  formulario: TfrmPadrao;
begin
  if not vDadosIni.PesqPros('CFG042', 'ABRIR', '', '', '', buscas, False) then
    Exit;
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Caption :=
      'Configuração de Outros Backup''s';
    frmConfiguracaoServico.pnBkpOutros.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    frmConfiguracaoServico.pnBkpOutros.Visible := True;

    formulario.Position := poScreenCenter;
    formulario.OnShow := frmConfiguracaoServico.FormShowBkpOutros;

    _lerParametros;

    result := (formulario.ShowModal = IDOK);

  finally
    frmConfiguracaoServico.pnBkpOutros.Visible := False;
    frmConfiguracaoServico.pnBkpOutros.Parent := frmConfiguracaoServico.tsBackupOutros;
    formulario.Free;
    formulario := nil;
  end;
end;

function TConfigServiceHw._abreFormConfigBuscaPreco: boolean;
var
  formulario: TfrmPadrao;
begin
  if not vDadosIni.PesqPros('CFG046', 'ABRIR', '', '', '', buscas, False) then
    Exit;
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Caption :=
      'Configuração de Montagem de Arquivos';
    frmConfiguracaoServico.pnBuscaPreco.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    frmConfiguracaoServico.pnBuscaPreco.Visible := True;

    formulario.Position := poScreenCenter;
    formulario.OnShow := frmConfiguracaoServico.FormShowBuscaPreco;

    _lerParametros;

    result := (formulario.ShowModal = IDOK);

  finally
    frmConfiguracaoServico.pnBuscaPreco.Visible := False;
    frmConfiguracaoServico.pnBuscaPreco.Parent := frmConfiguracaoServico.tsBuscaPreco;
    formulario.Free;
    formulario := nil;
  end;
end;

function TConfigServiceHw._abreFormLog: boolean;
var
  formulario: TfrmPadrao;
begin
  if not vDadosIni.PesqPros('CFG044', 'ABRIR', '', '', '', buscas, False) then
    Exit;
  if FileExists(ExtractFilePath(Application.ExeName) + 'hwService.log') then
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Caption :=
      'Log Hw Service';
    frmConfiguracaoServico.pnLog.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    frmConfiguracaoServico.pnLog.Visible := True;

    formulario.Position := poScreenCenter;
    formulario.OnShow := frmConfiguracaoServico.FormShowLog;

    result := (formulario.ShowModal = IDOK);

  finally
    frmConfiguracaoServico.pnLog.Visible := False;
    frmConfiguracaoServico.pnLog.Parent := frmConfiguracaoServico;
    formulario.Free;
    formulario := nil;
  end;
end;

procedure TConfigServiceHw._abrirConfig(pTipoForm: CFormsConfig);
begin
  f_tipoFormConfig := pTipoForm;
//  f_BkpBanco := pBkpBanco;
//  f_BkpOutros := pBkpOutros;
//  f_TerminalPAF := pTerminalPAF;

  if f_tipoFormConfig = cfBackup then
  begin
    if not vDadosIni.PesqPros('CFG041', 'ABRIR', '', '', '', buscas, False) then
      Exit;
  end
  else if f_tipoFormConfig = cfBackupOutros then
  begin
    if not vDadosIni.PesqPros('CFG042', 'ABRIR', '', '', '', buscas, False) then
      Exit;
  end
  else if f_tipoFormConfig = cfAtualTerminais then
  begin
    if not vDadosIni.PesqPros('CFG043', 'ABRIR', '', '', '', buscas, False) then
      Exit;
  end
  else if f_tipoFormConfig = cfBackupOutros then
    if not vDadosIni.PesqPros('CFG046', 'ABRIR', '', '', '', buscas, False) then
      Exit;

  f_client_socket.Socket.SendText('CONFIG|COD USUARIO ' + IntToStr(vDadosIni.vCodUsuario) + ' LOGIN '
    + vDadosIni.vNomeUsuario + '|');

end;

procedure TConfigServiceHw._conectarServer;
begin
  f_client_socket.Active := False;
  f_client_socket.Host := f_adress_server;
  f_client_socket.Active := True;
  f_client_socket.Socket.SendText('OK|');
end;

procedure TConfigServiceHw._continuarServico;
begin
  if not vDadosIni.PesqPros('CFG040', 'CONTINUAR', '', '', '', buscas, False) then
    Exit;
  if FileExists(ExtractFilePath(Application.ExeName) + 'HwServico.exe') then
    vDadosIni.CreateProcessSimple(ExtractFilePath(Application.ExeName) + 'HwServico.exe');
  Sleep(500);

  f_client_socket.Socket.SendText('TESTE');

  f_client_socket.Socket.SendText('INICIAR');

end;

procedure TConfigServiceHw._iniciarServico;
begin
  if not vDadosIni.PesqPros('CFG037', 'INICIAR', '', '', '', buscas, true) then
    Exit;
  //  WinExec(pchar('sc start HwService'),SW_HIDE);
  //  if FileExists(ExtractFilePath(Application.ExeName) + 'HwServico.exe') then
  //    vDadosIni.CreateProcessSimple(ExtractFilePath(Application.ExeName) + 'HwServico.exe');
  //  Sleep(500);

  f_client_socket.Socket.SendText('INICIAR|COD USUARIO ' + IntToStr(vDadosIni.vCodUsuario) +
    ' LOGIN ' + vDadosIni.vNomeUsuario + '|');
end;

procedure TConfigServiceHw._installService;
begin
  if not vDadosIni.PesqPros('CFG035', 'INSTALAR', '', '', '', buscas, False) then
    Exit;
  WinExec(pchar('cmd /k "' + ExtractFilePath(Application.ExeName) + 'HwAtTerminal.exe" /install'),
    SW_HIDE);
end;

function TConfigServiceHw._lerParametros: Boolean;
var
  ArqIni: string;
  ArqConfig: TIniFile;
begin
  Result := False;

  try
    //    if not FileExists(ExtractFilePath(Application.ExeName) +'serviceHw.fdb') then
    //      raise exception.Create('Base de configuração não encontrada. Favor reinstalar o serviço')
    //    else
    //    begin
    //      fBuscas.Database.Connected := False;
    //      fBuscas.Database.DatabaseName :=
    //        ExtractFilePath(Application.ExeName) +'serviceHw.fdb';
    //
    //      fBuscas.Database.Connected := True;
    //
    //    end;
    //
    //    f_bbkp_diaUltimoBkp := '';
    //
    //    fBuscas.Close;
    //    fBuscas.SQL.Text := 'select max(DATA_BKP) DATA_BKP from HISTORICO_BACKUP' +
    //      ' where STATUS_BKP = ' + QuotedStr('CONCLUIDO');
    //    fBuscas.Open;

    _lerConfigHwService;

    //    if Trim(fBuscas.FieldByName('DATA_BKP').AsString) <> '' then
    //      f_bbkp_diaUltimoBkp := FormatDateTime('DD/MM/YYYY', fBuscas.FieldByName('DATA_BKP').AsDateTime);

//    if Trim(f_bbkp_diaUltimoBkp) = '' then
//      f_bbkp_diaUltimoBkp := ''//FormatDateTime('DD/MM/YYYY', Date - 30)
//    else
//      f_bbkp_diaUltimoBkp := FormatDateTime('DD/MM/YYYY', StrToDate(f_bbkp_diaUltimoBkp));
//
//    if Trim(f_bbkp_diaUltimoBkpFin) = '' then
//      f_bbkp_diaUltimoBkpFin := ''//FormatDateTime('DD/MM/YYYY', Date - 30)
//    else
//      f_bbkp_diaUltimoBkpFin := FormatDateTime('DD/MM/YYYY', StrToDate(f_bbkp_diaUltimoBkpFin));

    if (f_bbkp_status = 'A') then
    begin
      if f_bbkp_formaBackup = '' then
        raise exception.create('Forma de Backup em branco')
      else if f_bbkp_dataBase = '' then
        raise exception.create('Banco de dados em branco')
      else if f_bbkp_pathDestino = '' then
        raise exception.create('Destino do backup em branco')
          //    else if f_bbkp_tipoBackup = '' then
//      raise exception.create('Tipo de backup em branco')
      else if f_bbkp_tipoSalvamento = '' then
        raise exception.create('Tipo de salvamento em branco')
      else if f_bbkp_horaBkp = '  :  ' then
        raise exception.create('Hora de backup não informada');
    end;

    if (f_bbkp_status = 'A') then
    try
      StrToTime(f_bbkp_horaBkp);
    except
      raise exception.create('Hora de backup inválida');
    end;
    if (f_bbkp_status = 'A') then
    begin
      f_bbkp_horaBkp := FormatDateTime('HH:MM', StrToDateTime(f_bbkp_horaBkp));
    end;

    Result := True;
  except
    on e: exception do
    begin
      Result := False;
      Application.MessageBox(pchar('Erro ao obter atributos. Erro: ' + e.Message), 'Atenção', 0 +
        64);
    end;
  end;
end;

procedure TConfigServiceHw._logServidor;
begin
  f_client_socket.Socket.SendText('LOG|COD USUARIO ' + IntToStr(vDadosIni.vCodUsuario) + ' LOGIN ' +
    vDadosIni.vNomeUsuario + '|');
end;

function TConfigServiceHw._lerConfigHwService: Boolean;
var
  ArqIni: string;
  ArqConfig: TIniFile;
  I: Integer;
begin
  Result := true;
  try
    ArqIni := ExtractFilePath(Application.Exename) + 'HwService.ini';
    ArqConfig := TIniFile.Create(ArqIni);
    try
      f_bbkp_status := ArqConfig.ReadString('BancoBkp', 'Status', 'D');
      f_bbkp_formaBackup := ArqConfig.ReadString('BancoBkp', 'Forma', 'C');
      f_bbkp_ServerName := ArqConfig.ReadString('BancoBkp', 'Server', '');
      f_bbkp_dataBase := ArqConfig.ReadString('BancoBkp', 'Database', '');
      f_bbkp_dataBasePath := ArqConfig.ReadString('BancoBkp', 'DatabasePath', '');
      f_bbkp_pathDestino := ArqConfig.ReadString('BancoBkp', 'PathDestino', '');
      f_bbkp_pathDestinoExt := ArqConfig.ReadString('BancoBkp', 'PathDestinoExt', '');
      f_bbkp_horaBkp := ArqConfig.ReadString('BancoBkp', 'HoraBkp', '');
      f_bbkp_tipoSalvamento := ArqConfig.ReadString('BancoBkp', 'TipoSalvamento', '');
      f_bbkp_removerFbk := ArqConfig.ReadString('BancoBkp', 'RemoverFbk', '');
      f_bbkp_diaUltimoBkp := ArqConfig.ReadString('BancoBkp', 'DiaUltimoBkp', '');
      f_bbkp_diaUltimoBkpFin := ArqConfig.ReadString('BancoBkp', 'DiaUltimoBkpFin', '');
      f_bbkp_backup_auditoria := ArqConfig.ReadString('BancoBkp', 'BackupAuditoria', 'S');

      f_t_status := ArqConfig.ReadString('Terminal', 'Status', 'D');
      f_t_hora := ArqConfig.ReadString('Terminal', 'Hora', '');
      f_t_codEmpresa := ArqConfig.ReadString('Terminal', 'Cod Empresa', '');
      f_t_bancoHw := ArqConfig.ReadString('Terminal', 'Banco Hw', '');
      f_t_bancoHwF := ArqConfig.ReadString('Terminal', 'Banco HwF', '');

      f_obkp_status := ArqConfig.ReadString('OutrosBkp', 'Status', 'D');
      f_obkp_pathDestino := ArqConfig.ReadString('OutrosBkp', 'PathDestino', '');
      f_obkp_horaBkp := ArqConfig.ReadString('OutrosBkp', 'HoraBkp', '');
      f_obkp_tipoSalvamento := ArqConfig.ReadString('OutrosBkp', 'TipoSalvamento', '');
      f_obkp_qtde := ArqConfig.ReadInteger('OutrosBkp', 'Qtde', 0);
      f_obkp_diaUltimoBkp := ArqConfig.ReadString('OutrosBkp', 'DiaUltimoBkp', '');
      f_obkp_diaUltimoBkpFin := ArqConfig.ReadString('OutrosBkp', 'DiaUltimoBkpFin', '');

      bp_status := ArqConfig.ReadString('ConsultaPreco', 'Status', 'D');
      bp_Hora := ArqConfig.ReadString('ConsultaPreco', 'Hora', '');
      bp_codEmpresa := ArqConfig.ReadString('ConsultaPreco', 'Cod Empresa', '');
      bp_bancoHw := ArqConfig.ReadString('ConsultaPreco', 'Banco Hw', '');

      f_obkp_listaBackup.Clear;
      if f_obkp_qtde > 0 then
        for I := 1 to f_obkp_qtde do
          f_obkp_listaBackup.Add(ArqConfig.ReadString('OutrosBkp', 'PathOuArquivoBkp' + IntToStr(I),
            ''));

    finally
      ArqConfig.Free;
    end;

  except
    Result := false;
  end;

end;

procedure TConfigServiceHw._pararServico;
begin
  if not vDadosIni.PesqPros('CFG038', 'PARAR', '', '', '', buscas, true) then
    Exit;
  //  WinExec(pchar('sc stop HwService'),SW_HIDE);
  //  if FileExists(ExtractFilePath(Application.ExeName) + 'HwServico.exe') then
  //    vDadosIni.CreateProcessSimple(ExtractFilePath(Application.ExeName) + 'HwServico.exe');
  //  Sleep(500);
  f_client_socket.Socket.SendText('PARAR|COD USUARIO ' + IntToStr(vDadosIni.vCodUsuario) + ' LOGIN '
    + vDadosIni.vNomeUsuario + '|');
end;

procedure TConfigServiceHw._pausarServico;
begin
  if not vDadosIni.PesqPros('CFG039', 'PAUSAR', '', '', '', buscas, False) then
    Exit;
  //  WinExec(pchar('sc pause HwService'),SW_HIDE);
  if FileExists(ExtractFilePath(Application.ExeName) + 'HwServico.exe') then
    vDadosIni.CreateProcessSimple(ExtractFilePath(Application.ExeName) + 'HwServico.exe');
  Sleep(500);

  f_client_socket.Socket.SendText('TESTE');

  f_client_socket.Socket.SendText('PARAR');
end;

function TConfigServiceHw._salvarParametrosBkpBanco: boolean;
var
  ArqIni: string;
  ArqConfig: TIniFile;
begin
  Result := true;
  try
    ArqIni := ExtractFilePath(Application.Exename) + 'HwService.ini';
    ArqConfig := TIniFile.Create(ArqIni);
    try
    	if trim(ArqConfig.ReadString('BancoHw', 'Endereco', '')) <> trim(vDadosIni.vBancoHW) then
    		ArqConfig.WriteString('BancoHw', 'Endereco', trim(vDadosIni.vBancoHW));

      if trim(ArqConfig.ReadString('BancoHw', 'VerificarBackup', '')) <> trim(vDadosIni.vVerificarBackup) then
      	ArqConfig.WriteString('BancoHw', 'VerificarBackup', trim(vDadosIni.vVerificarBackup));

      if trim(ArqConfig.ReadString('BancoHw', 'TsPlus', '')) <> trim(vDadosIni.vTsPlus) then
      	ArqConfig.WriteString('BancoHw', 'TsPlus', trim(vDadosIni.vTsPlus));

      ArqConfig.WriteString('BancoBkp', 'Status', f_bbkp_status);
      ArqConfig.WriteString('BancoBkp', 'Forma', f_bbkp_formaBackup);
      ArqConfig.WriteString('BancoBkp', 'Server', f_bbkp_ServerName);
      ArqConfig.WriteString('BancoBkp', 'Database', f_bbkp_dataBase);
      ArqConfig.WriteString('BancoBkp', 'DatabasePath', f_bbkp_dataBasePath);
      ArqConfig.WriteString('BancoBkp', 'PathDestino', f_bbkp_pathDestino);
      ArqConfig.WriteString('BancoBkp', 'PathDestinoExt', f_bbkp_pathDestinoExt);
      ArqConfig.WriteString('BancoBkp', 'HoraBkp', f_bbkp_horaBkp);
      ArqConfig.WriteString('BancoBkp', 'TipoSalvamento', f_bbkp_tipoSalvamento);
      ArqConfig.WriteString('BancoBkp', 'RemoverFbk', f_bbkp_removerFbk);
      if f_bbkp_diaUltimoBkp <> '' then
        ArqConfig.WriteString('BancoBkp', 'DiaUltimoBkp', f_bbkp_diaUltimoBkp);
      if f_bbkp_diaUltimoBkpFin <> '' then
        ArqConfig.WriteString('BancoBkp', 'DiaUltimoBkp', f_bbkp_diaUltimoBkpFin);
      if f_bbkp_backup_auditoria <> '' then
      	ArqConfig.WriteString('BancoBkp', 'BackupAuditoria', f_bbkp_backup_auditoria);
    finally
      ArqConfig.Free;
    end;

    f_Stream := TMemoryStream.Create;
    f_log_receive := TStringList.Create;
    f_log_receive.LoadFromFile(ExtractFilePath(Application.ExeName) + 'HwService.ini');
    f_log_receive.SaveToStream(f_Stream);
    f_Stream.Position := 0;
    f_client_socket.Socket.SendText(IntToStr(f_Stream.Size) + #0);
    f_client_socket.Socket.SendStream(f_Stream);
    f_log_receive.Free;

    //    f_client_socket.Socket.SendText('CONFIG|COD USUARIO '+ IntToStr(vDadosIni.vCodUsuario) + ' LOGIN ' + vDadosIni.vNomeUsuario);

  except
    Result := false;
  end;
end;

function TConfigServiceHw._salvarParametrosBkpOutros: boolean;
var
  ArqIni: string;
  ArqConfig: TIniFile;
  I: Integer;
begin
  Result := true;
  try
    ArqIni := ExtractFilePath(Application.Exename) + 'HwService.ini';
    ArqConfig := TIniFile.Create(ArqIni);
    try
      f_obkp_qtde := f_obkp_listaBackup.Count;

      if trim(ArqConfig.ReadString('BancoHw', 'Endereco', '')) <> trim(vDadosIni.vBancoHW) then
      	ArqConfig.WriteString('BancoHw', 'Endereco', trim(vDadosIni.vBancoHW));

      if trim(ArqConfig.ReadString('BancoHw', 'VerificarBackup', '')) <> trim(vDadosIni.vVerificarBackup) then
      	ArqConfig.WriteString('BancoHw', 'VerificarBackup', trim(vDadosIni.vVerificarBackup));

      if trim(ArqConfig.ReadString('BancoHw', 'TsPlus', '')) <> trim(vDadosIni.vTsPlus) then
      	ArqConfig.WriteString('BancoHw', 'TsPlus', trim(vDadosIni.vTsPlus));

      ArqConfig.WriteString('OutrosBkp', 'Status', f_obkp_status);
      ArqConfig.WriteString('OutrosBkp', 'PathDestino', f_obkp_pathDestino);
      ArqConfig.WriteString('OutrosBkp', 'HoraBkp', f_obkp_horaBkp);
      ArqConfig.WriteString('OutrosBkp', 'TipoSalvamento', f_obkp_tipoSalvamento);
      ArqConfig.WriteInteger('OutrosBkp', 'Qtde', f_obkp_qtde);
      if f_obkp_diaUltimoBkp <> '' then
        ArqConfig.WriteString('OutrosBkp', 'DiaUltimoBkp', f_obkp_diaUltimoBkp);
      if f_obkp_diaUltimoBkpFin <> '' then
        ArqConfig.WriteString('OutrosBkp', 'DiaUltimoBkpFin', f_obkp_diaUltimoBkpFin);

      if f_obkp_qtde > 0 then
        for I := 1 to f_obkp_qtde do
        try
          ArqConfig.WriteString('OutrosBkp', 'PathOuArquivoBkp' + IntToStr(I), f_obkp_listaBackup[I
            - 1]);
        except
        end;

    finally
      ArqConfig.Free;
    end;

    f_Stream := TMemoryStream.Create;
    f_log_receive := TStringList.Create;
    f_log_receive.LoadFromFile(ExtractFilePath(Application.ExeName) + 'HwService.ini');
    f_log_receive.SaveToStream(f_Stream);
    f_Stream.Position := 0;
    f_client_socket.Socket.SendText(IntToStr(f_Stream.Size) + #0);
    f_client_socket.Socket.SendStream(f_Stream);
    f_log_receive.Free;

    //    f_client_socket.Socket.SendText('CONFIG|COD USUARIO '+ IntToStr(vDadosIni.vCodUsuario) + ' LOGIN ' + vDadosIni.vNomeUsuario);

  except
    Result := false;
  end;

end;

function TConfigServiceHw._salvarParametrosBuscaPreco: boolean;
var
  ArqIni: string;
  ArqConfig: TIniFile;
  I: Integer;
begin
  Result := true;
  try
    ArqIni := ExtractFilePath(Application.Exename) + 'HwService.ini';
    ArqConfig := TIniFile.Create(ArqIni);
    try
    	if trim(ArqConfig.ReadString('BancoHw', 'Endereco', '')) <> trim(vDadosIni.vBancoHW) then
				ArqConfig.WriteString('BancoHw', 'Endereco', trim(vDadosIni.vBancoHW));

      if trim(ArqConfig.ReadString('BancoHw', 'VerificarBackup', '')) <> trim(vDadosIni.vVerificarBackup) then
      	ArqConfig.WriteString('BancoHw', 'VerificarBackup', trim(vDadosIni.vVerificarBackup));

      if trim(ArqConfig.ReadString('BancoHw', 'TsPlus', '')) <> trim(vDadosIni.vTsPlus) then
      	ArqConfig.WriteString('BancoHw', 'TsPlus', trim(vDadosIni.vTsPlus));
        
      ArqConfig.WriteString('ConsultaPreco', 'Status', bp_status);
      ArqConfig.WriteString('ConsultaPreco', 'Hora', bp_Hora);
      ArqConfig.WriteString('ConsultaPreco', 'Cod Empresa', bp_codEmpresa);
      ArqConfig.WriteString('ConsultaPreco', 'Banco Hw', bp_bancoHw);

    finally
      ArqConfig.Free;
    end;

    f_Stream := TMemoryStream.Create;
    f_log_receive := TStringList.Create;
    f_log_receive.LoadFromFile(ExtractFilePath(Application.ExeName) + 'HwService.ini');
    f_log_receive.SaveToStream(f_Stream);
    f_Stream.Position := 0;
    f_client_socket.Socket.SendText(IntToStr(f_Stream.Size) + #0);
    f_client_socket.Socket.SendStream(f_Stream);
    f_log_receive.Free;

    //    f_client_socket.Socket.SendText('CONFIG|COD USUARIO '+ IntToStr(vDadosIni.vCodUsuario) + ' LOGIN ' + vDadosIni.vNomeUsuario);

  except
    Result := false;
  end;
end;

function TConfigServiceHw._salvarParametrosTerminal: boolean;
var
  ArqIni: string;
  ArqConfig: TIniFile;
  f_Config_hw: TStringList;
  I: Integer;
begin
  Result := true;
  try
    ArqIni := ExtractFilePath(Application.Exename) + 'HwService.ini';
    ArqConfig := TIniFile.Create(ArqIni);
    try
    	if trim(ArqConfig.ReadString('BancoHw', 'Endereco', '')) <> trim(vDadosIni.vBancoHW) then
      	ArqConfig.WriteString('BancoHw', 'Endereco', trim(vDadosIni.vBancoHW));

      if trim(ArqConfig.ReadString('BancoHw', 'VerificarBackup', '')) <> trim(vDadosIni.vVerificarBackup) then
      	ArqConfig.WriteString('BancoHw', 'VerificarBackup', trim(vDadosIni.vVerificarBackup));

      if trim(ArqConfig.ReadString('BancoHw', 'TsPlus', '')) <> trim(vDadosIni.vTsPlus) then
      	ArqConfig.WriteString('BancoHw', 'TsPlus', trim(vDadosIni.vTsPlus));

      ArqConfig.WriteString('Terminal', 'Status', f_t_status);
      ArqConfig.WriteString('Terminal', 'Hora', f_t_hora);
      ArqConfig.WriteString('Terminal', 'Cod Empresa', f_t_codEmpresa);
      ArqConfig.WriteString('Terminal', 'Banco Hw', f_t_bancoHw);
      ArqConfig.WriteString('Terminal', 'Banco HwF', f_t_bancoHwF);

    finally
      ArqConfig.Free;
    end;

    f_Stream := TMemoryStream.Create;
    f_log_receive := TStringList.Create;
    f_Config_hw := TStringList.Create;
    f_log_receive.LoadFromFile(ExtractFilePath(Application.ExeName) + 'HwService.ini');

    if FileExists(ExtractFilePath(Application.Exename) + 'hwsistemas.ini') then
      f_Config_hw.LoadFromFile(ExtractFilePath(Application.Exename) + 'hwsistemas.ini')
    else
      f_Config_hw.LoadFromFile(ExtractFilePath(Application.Exename) + 'Config.ini');

    f_log_receive.Add('&&&INI&&&');
    for I := 0 to f_Config_hw.Count - 1 do
      f_log_receive.Add(f_Config_hw[I]);
    f_log_receive.Add('&&&FIM&&&');

    f_log_receive.SaveToStream(f_Stream);
    f_Stream.Position := 0;
    f_client_socket.Socket.SendText(IntToStr(f_Stream.Size) + #0);
    f_client_socket.Socket.SendStream(f_Stream);
    f_log_receive.Free;

      //    f_client_socket.Socket.SendText('CONFIG|COD USUARIO '+ IntToStr(vDadosIni.vCodUsuario) + ' LOGIN ' + vDadosIni.vNomeUsuario);
    
  except
    Result := false;
  end;
end;

function TConfigServiceHw._selectDirectory(diretorioInicial: string): string;
var
  S: string;
begin
  SelectDirectory('Selecionar Pasta', '', S);
  if Trim(S) = '' then
    Result := diretorioInicial
  else
    Result := S;
end;

procedure TConfigServiceHw._testarConexao;
begin
  f_client_socket.Socket.SendText('TESTE|');
end;

procedure TConfigServiceHw._uninstallService;
begin
  if not vDadosIni.PesqPros('CFG036', 'DESINSTALAR', '', '', '', buscas, False) then
    Exit;
  WinExec(pchar('cmd /k "' + ExtractFilePath(Application.ExeName) + 'HwAtTerminal.exe" /uninstall'),
    SW_HIDE);
end;

{ TRegrasProgramasFidelidades }

function TRegrasProgramasFidelidades.abreFormAtuacao: boolean;
var
  formulario: TfrmPadrao;
  vOK: boolean;
  codigo: string;
begin
 try
   Result := false;

   if not vDadosIni.PesqPros('FID008', 'EDITAR', '', 'REGRAS_PROG_FIDELIDADE',
     dataSet.FieldByName('COD_TP_REGRA').AsString, buscas, true) then
     exit;

   codigo := dataSet.FieldByName('COD_TP_REGRA').AsString;
   
   formulario := TfrmPadrao.Create(Application);
   formulario.Width := 505;
   formulario.Height := 168;
   formulario.Position := poScreenCenter;

   formulario.Caption := 'Editar registro';
   frmCadRegrasProgramaFidelidade.pnAtuar.Parent := formulario;
   formulario.AutoSize := True;
   formulario.AutoScroll := False;
   formulario.ShowHint := true;
   formulario.BorderIcons := [];
   if trim(dataSet.FieldByName('ATUAR').AsString) = 'VENDAS' then
     frmCadRegrasProgramaFidelidade.ComboBoxAtuar.ItemIndex := 0
   else if trim(dataSet.FieldByName('ATUAR').AsString) = 'RECEBIMENTOS' then
     frmCadRegrasProgramaFidelidade.ComboBoxAtuar.ItemIndex := 1
   else
     frmCadRegrasProgramaFidelidade.ComboBoxAtuar.ItemIndex := 2;

   Result := (formulario.ShowModal = mrOk);
  finally
    if Result then
    begin
      vOK := false;

      dataSet.Edit;
      dataSet.FieldByName('ATUAR').AsString := trim(frmCadRegrasProgramaFidelidade.ComboBoxAtuar.Text);
      dataSet.Post;

      if dataSet.ChangeCount = 0 then
      begin
        Apply;
        CommitaTransacao;
        vOK := true;

        if vOK then
          vDadosIni.GravaAuditoria('FID010', 'EDITAR', 'SUCESSO', 'REGRAS_PROG_FIDELIDADE', codigo, buscas)
        else
          vDadosIni.GravaAuditoria('FID010', 'EDITAR', 'FALHA', 'REGRAS_PROG_FIDELIDADE', codigo, buscas);
        if vOK then
          Refresh;
      end;
      
      frmCadRegrasProgramaFidelidade.pnAtuar.Parent := frmCadRegrasProgramaFidelidade.tsAtuar;
      formulario.Free;
      formulario := nil;
    end;
  end;
end;

function TRegrasProgramasFidelidades.abreRegrasProgramaFidelidades: boolean;
begin
  Result := montaSelect(' select * from regras_prog_fidelidade ' +
   ' where cod_empresa = ' + vDadosIni.codEmpresa);
end;

function TRegrasProgramasFidelidades.abreRegrasProgramaFidelidades(
  ptipo: string): boolean;
begin
  Result := montaSelect(' select * from regras_prog_fidelidade ' +
   ' where cod_empresa = ' + vDadosIni.codEmpresa +
   ' and descricao_regra = ' + QuotedStr(ptipo));
end;

function TRegrasProgramasFidelidades.ativarDesativarClasse(pAtivar: boolean): boolean;
var
  acao, codigo, descricao, vtemp: string;
begin
  try
    Result := false;
    acao := vDadosIni.IfThen(pAtivar, 'ATIVAR', 'DESATIVAR');
    codigo := dataSet.FieldByName('cod_tp_regra').AsString;
    descricao := trim(dataSet.FieldByName('DESCRICAO_REGRA').AsString);

    if ((pAtivar) and (dataSet.FieldByName('situacao').AsString = 'ATIVA')) then
    begin
       Application.MessageBox(PChar('Classe "' + descricao + '" já está ativa!'), 'Atenção', 0 + 64);
       exit;
    end
    else if (not (pAtivar) and (dataSet.FieldByName('situacao').AsString = 'DESATIVADA')) then
    begin
       Application.MessageBox(PChar('Classe "' + descricao + '" já está desativada!'), 'Atenção', 0 + 64);
       exit;
    end;

    if not vDadosIni.PesqPros('FID008', acao, '', 'REGRAS_PROG_FIDELIDADE',
      codigo, buscas, true) then
      exit;
    
    if dataSet.IsEmpty then
    begin
     Result := true;
     exit;
    end;

    dataSet.Edit;
    dataSet.FieldByName('situacao').AsString := vDadosIni.IfThen(pAtivar, 'ATIVA', 'DESATIVADA');
    dataSet.Post;
  
    if dataSet.ChangeCount = 0 then
    begin
      Result := true;
      exit;
    end;

    Apply;
    CommitaTransacao;
    Result := true;

    if Result then
      vDadosIni.GravaAuditoria('FID008', acao, 'SUCESSO', 'REGRAS_PROG_FIDELIDADE', codigo, buscas)
    else
      vDadosIni.GravaAuditoria('FID008', acao, 'FALHA', 'REGRAS_PROG_FIDELIDADE', codigo, buscas);

    vtemp := vDadosIni.IfThen(pAtivar, 'ativada.', 'desativada.');
    Application.MessageBox(PChar('Classe "' + descricao + '" ' + vtemp), 'Atenção', 0 + 64);

    if Result then
      Refresh;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', 0 + 64);
    end;
  end;

end;

procedure TRegrasProgramasFidelidades.atualizarCombobox(pCombobox, pCombobox2: TComboBox; pLabel: TLabel);
begin
  pCombobox.Items.Clear;
  pCombobox2.Items.Clear;
  if (dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'ASSIDUIDADE') 
    or (dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA DE PONTOS POR ASSIDUIDADE') then
  begin
    pCombobox.Items.Add('T1 - COMPRAS ENTRE 0 A 90 DIAS');
    pCombobox.Items.Add('T2 - COMPRAS ENTRE 91 A 180 DIAS');
    pCombobox.Items.Add('T3 - COMPRAS ENTRE 181 A 360 DIAS');
    pCombobox.Items.Add('T4 - COMPRAS COM MAIS DE 360 DIAS');
//    pGroupBox.Caption := 'Assiduidade';
  end
  else if dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'RECEBIMENTO DE PRESTACAO' then
  begin
    pCombobox.Items.Add('PA - PAGAMENTO ANTECIPADO');
    pCombobox.Items.Add('PDV - PAGAMENTO NO DIA DO VENCIMENTO');
    pCombobox.Items.Add('PC - PAGAMENTO NA CARÊNCIA');
    pCombobox.Items.Add('PT - PAGAMENTO ATRASADO');

    pCombobox.Items.Add('PAX - PAGAMENTO ANTECIPADO X DIAS');
    pCombobox.Items.Add('PTX - PAGAMENTO ATRASADO X DIAS');

//    pGroupBox.Caption := 'Recebimento de prestação';
    pLabel.Caption := 'Dias:';
  end
  else if dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FORMAS DE PAGAMENTO' then
  begin
    pCombobox.Items.Add('DIN - DINHEIRO');
    pCombobox.Items.Add('CD - CARTÃO DE DÉBITO');
    pCombobox.Items.Add('CC - CARTÃO DE CRÉDITO');
    pCombobox.Items.Add('CA - CHEQUE À VISTA');
    pCombobox.Items.Add('CPD - CHEQUE PRÉ-DATADO');
    pCombobox.Items.Add('CRX - CRÉDIARIO COM X% ENTRADA');
    pCombobox.Items.Add('CRC - CRÉDIARIO COM ENTRADA');
    pCombobox.Items.Add('CRS - CRÉDIARIO SEM ENTRADA');
//    pGroupBox.Caption := 'Formas de pagamento';
    pLabel.Caption := 'Entrada (%):';
  end
  else if dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA VALOR DE COMPRA' then
  begin
//    pGroupBox.Caption := 'Faixa de valor';
  end
  else if dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA DE PONTOS POR MARCA DE PRODUTO' then
  begin
    SqlOpen(' select (cod_marca ||'' - ''|| descricao_marca) descricao from marca_prod  ' +
    	' where ativo = 1 and coalesce(tipo_marca, ''P'') = ''P'' ' +
      ' order by cod_marca ');
    buscas.First;
    while not buscas.Eof do
    begin
      pCombobox.Items.Add(buscas.FieldByName('DESCRICAO').AsString);
      
    	buscas.Next;
    end;
//    pGroupBox.Caption := 'Marca do produto';
  end
  else if dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA DE PONTOS POR GRUPO DE PRODUTO' then
  begin
    SqlOpen(' select (codigo_grup ||'' - ''|| descricao) descricao from grupos  ' +
    	' where ativo = 1 ' +
      ' order by codigo_grup ');
    buscas.First;
    while not buscas.Eof do
    begin
      pCombobox.Items.Add(buscas.FieldByName('DESCRICAO').AsString);

    	buscas.Next;
    end;
//    pGroupBox.Caption := 'Grupo do produto';
  end
  else if dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA DE PONTOS POR SUBGRUPO DE PRODUTO' then
  begin
    SqlOpen(' select (codigo_subgr ||'' - ''|| descricao) descricao from sub_grupo  ' +
    	' where ativo = 1 and coalesce(subservico, ''N'') = ''N'' ' +
      ' order by codigo_subgr ');
    buscas.First;
    while not buscas.Eof do
    begin
      pCombobox.Items.Add(buscas.FieldByName('DESCRICAO').AsString);
      
    	buscas.Next;
    end;
//    pGroupBox.Caption := 'Subgrupo do produto';
  end;
  pCombobox2.Items := pCombobox.Items;
end;

procedure TRegrasProgramasFidelidades.atualizarDataUltimaDefClasse(
  vLabel: TLabel);
begin
  SqlOpen(' select coalesce(data_def_classe, cast(''01.01.2000'' as timestamp)) data_def_classe from empresa ' +
    ' where cod_empresa = ' + vDadosIni.codEmpresa);
  vLabel.Caption := FormatDateTime('dd/MM/yyyy', buscas.FieldByName('data_def_classe').AsDateTime);
end;

procedure TRegrasProgramasFidelidades.cadRegrasProgramaFidelidades(pTipoForm: integer);
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Abrindo Regras Programa de Fidelidade');

    if dtmConfig = nil then
      dtmConfig := TdtmConfig.Create(dtmConfig);

    vDadosIni.vTipoForm := pTipoForm;

    if not vDadosIni.PesqPros('FID001', 'ABRIR', '', 'REGRAS_PROG_FIDELIDADE', '', dtmConfig.qrBuscas, False) then
      Exit;

    if frmCadRegrasProgramaFidelidade = nil then
    begin
      if pTipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';
      Application.CreateForm(TfrmCadRegrasProgramaFidelidade, frmCadRegrasProgramaFidelidade);
    end;

    if (pTipoForm > 0) and (not frmCadRegrasProgramaFidelidade.Visible) then
      frmCadRegrasProgramaFidelidade.ShowModal
    else if (not frmCadRegrasProgramaFidelidade.Visible) then
      frmCadRegrasProgramaFidelidade.Show
    else if frmCadRegrasProgramaFidelidade.FormStyle = fsMDIChild then
      frmCadRegrasProgramaFidelidade.Show
    else
      frmCadRegrasProgramaFidelidade.ShowModal;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TRegrasProgramasFidelidades.confirmarSimulacao(pValor, pPerc: Double; pPeriodoVencP: Integer; pTotFatPer, pTotPontosPer: Double;
	pQtdeVendas, pQtdeDev: Integer; pTotVendasPer, pTotDevPer: Double; pQtdeDevAvulsas: Integer; pTotDevAvulsasPer: Double;
   pQtdeVales: Integer; pTotVales: Double; pDataIni: string; pDataFim: string): boolean;
var
  vTemp: string;
  vcodigo: Integer;
  vMensagem, vCampo: string;
begin
  Result := false;
  try
    if Application.MessageBox('Deseja confirmar simulação?',
        'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> idYES then
       exit;

    if not vSimRealizada then
      raiseExceptionCreate('Favor realizar a simulação antes de continuar.', 'MaskEditIniSim');

    vTemp := 'PERIODO_VENC_PONTOS: ' + IntToStr(pPeriodoVencP) +
      ' VALOR_CONV: ' + FloatToStr(pValor) +
      ' TX_CONV: ' + FloatToStr(pPerc) +
      ' DATA_CAD: ' + FormatDateTime('dd/mm/yyyy', vDadosIni.getDataBanco(buscas));

    if not vDadosIni.PesqPros('FID013', 'CONFIRMAR', vTemp, 'TAXA_CONV_PROG_FIDELIDADE',
      '', buscas, true) then
      exit;

    if pValor <= 0 then
      raiseExceptionCreate('Campo Valor total programa de fidelidade	deve ser informado.', 'EditHwValorDesp');

    if pPerc <= 0 then
      raiseExceptionCreate('Campo Taxa de conversão (Valor monetário de cada ponto) deve ser informado.', 'EditHwTaxConv');

    if pPeriodoVencP <= 0 then
      raiseExceptionCreate('Campo Período vencimento dos pontos (Dias) deve ser informado.', 'EditHwPeriodoVenc');
     

//    if (trim(pDataVenc) = '') or (pDataVenc = '  /  /    ') then
//      raiseExceptionCreate('Campo Data de vencimento programa de fidelidade deve ser informado.', 'MaskEditDataVenc');

    if not testarDataSimulacao(vMensagem, vCampo, vTemp, true) then
      raiseExceptionCreate(vMensagem, vCampo);

    vTaxaProgramasFidelidades.dataSet.Insert;
    vcodigo := Gencodigo('TAXA_CONV_PROG_FIDELIDADE', dtmConfig.SpIncCodigo, vDadosIni.codEmpresa);
    vTaxaProgramasFidelidades.dataSet.FieldByName('CODIGO').AsInteger := vcodigo;
    vTaxaProgramasFidelidades.dataSet.FieldByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    vTaxaProgramasFidelidades.dataSet.FieldByName('VALOR_PROG_FID').AsFloat := pValor;
    vTaxaProgramasFidelidades.dataSet.FieldByName('PERC_PROG_FID').AsFloat := pPerc;
    vTaxaProgramasFidelidades.dataSet.FieldByName('PERIODO_VENC_PONTOS').AsInteger := pPeriodoVencP;
    //vTaxaProgramasFidelidades.dataSet.FieldByName('DATA_VENC').AsString := pDataVenc;
    vTaxaProgramasFidelidades.dataSet.FieldByName('COD_USUARIO').AsInteger := vDadosIni.vCodUsuario;
    vTaxaProgramasFidelidades.dataSet.FieldByName('DATA_CAD').AsDateTime := vDadosIni.getDataBanco(buscas);
    vTaxaProgramasFidelidades.dataSet.FieldByName('TOT_PONTOS_SIM').AsFloat := pTotPontosPer;
    vTaxaProgramasFidelidades.dataSet.FieldByName('TOT_FAT_SIM').AsFloat := pTotFatPer;
    vTaxaProgramasFidelidades.dataSet.FieldByName('QTDE_VENDAS_SIM').AsInteger := pQtdeVendas;
    vTaxaProgramasFidelidades.dataSet.FieldByName('QTDE_DEV_SIM').AsInteger := pQtdeDev;
    vTaxaProgramasFidelidades.dataSet.FieldByName('TOT_VENDAS_SIM').AsFloat := pTotVendasPer;
    vTaxaProgramasFidelidades.dataSet.FieldByName('TOT_DEV_SIM').AsFloat := Abs(pTotDevPer);
    vTaxaProgramasFidelidades.dataSet.FieldByName('QTDE_DEV_AV_SIM').AsInteger := pQtdeDevAvulsas;
    vTaxaProgramasFidelidades.dataSet.FieldByName('TOT_DEV_AV_SIM').AsFloat := Abs(pTotDevAvulsasPer);
    vTaxaProgramasFidelidades.dataSet.FieldByName('QTDE_VALES_SIM').AsInteger := pQtdeVales;
    vTaxaProgramasFidelidades.dataSet.FieldByName('TOT_VALES_SIM').AsFloat := Abs(pTotVales);
    vTaxaProgramasFidelidades.dataSet.FieldByName('DATA_INI').AsString := pDataIni;
    vTaxaProgramasFidelidades.dataSet.FieldByName('DATA_FIM').AsString := pDataFim;
    vTaxaProgramasFidelidades.dataSet.Post;
    if vTaxaProgramasFidelidades.dataSet.ChangeCount = 0 then
    begin
      result := true;
      exit;
    end;

    if vTaxaProgramasFidelidades.Apply then
    begin
      vTaxaProgramasFidelidades.CommitaTransacao;
      result := True;
    end
    else
    begin
      vTaxaProgramasFidelidades.Cancel;
      vTaxaProgramasFidelidades.RollBackTransacao;
      Result := False;
    end;

    if Result then
      vDadosIni.GravaAuditoria('FID013', 'CONFIRMAR', vTemp + ' SUCESSO', 'TAXA_CONV_PROG_FIDELIDADE', IntToStr(vcodigo), buscas)
    else
      vDadosIni.GravaAuditoria('FID013', 'CONFIRMAR', vTemp + ' FALHA', 'TAXA_CONV_PROG_FIDELIDADE', IntToStr(vcodigo), buscas);

    if Result then
      Application.MessageBox(PChar('Simulação do programa de fidelidade confirmada!'), 'Informação', 0 + 64);

  except
    on e: Exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

procedure TRegrasProgramasFidelidades.controlesconfigurados(pbuscas: TIBQuery);
var
  vtemp: string;
  vbuscas: TIBQuery;
  vdescrRegra: string;
begin
   try
      vbuscas := TIBQuery.Create(Application);
      vbuscas.Database := pbuscas.Database;
      vbuscas.Transaction := pbuscas.Transaction;

      if verificarRegra('FORMAS DE PAGAMENTO', vbuscas) then
      begin
        vdescrRegra := trim(vbuscas.FieldByName('descricao_regra').AsString);
        //Verificar controle não vinculados
        vbuscas.Close;
        vbuscas.SQL.Text := ' select ctr.codigo_ctrl, ctr.nome_ctrl from controles ctr ' +
          ' where codigo_emp = :cod_empresa and trim(coalesce(ctr.fp_regra_fidelidade, '''')) = '''' ' +
          ' order by ctr.codigo_ctrl ';
        vbuscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
        vbuscas.Open;

        if not vbuscas.IsEmpty then
        begin
         vtemp := '';
         vbuscas.First;
         while not vbuscas.Eof do
         begin
           if vbuscas.RecNo > 20 then
           begin
             vtemp := vtemp + '...';
             Break;
           end
           else
             vtemp := vtemp + IntToStr(vbuscas.FieldByName('codigo_ctrl').AsInteger) + ' - ' +
               trim(vbuscas.FieldByName('nome_ctrl').AsString) + #13;

           vbuscas.Next;
         end;

         Application.MessageBox(PChar('Controles não vinculados a classe "' + trim(vdescrRegra) +'":' + #13 + #13+
            vtemp + #13 + 'Favor verificar antes de continuar'), 'Atenção', 0 + 64);
        end;
      end;
   finally
      if Assigned(vbuscas) then
        FreeAndNil(vbuscas);
   end;
end;

constructor TRegrasProgramasFidelidades.create;
var
 I: Integer;
begin
  dataSet := TClientDataSet(dtmConfig.cdsRegrasProgramasFid);
  buscas := TIBQuery(dtmConfig.qrBuscas);
  transacao := TIBTransaction(dtmConfig.ibTransConfig);

  vConfigRegrasProgramasFidelidades := TConfigRegrasProgramasFidelidades.create;
  vTaxaProgramasFidelidades := TTaxaProgramasFidelidades.create;

  vSimRealizada := false;
  vDataIniSim := '';
  vDataFimSim := '';

  //Faturamento
  fTempFatP := TClientDataSet.Create(nil);
  fTempFatP.Close;
  fTempFatP.FieldDefs.Clear;
  fTempFatP.FieldDefs.Add('tipo', ftString, 3, false);
  fTempFatP.FieldDefs.Add('clultimacompra', ftString, 2, false);
  fTempFatP.FieldDefs.Add('qtde_total_vnd', ftFloat, 0, false);
  fTempFatP.FieldDefs.Add('valor_total_vnd', ftFloat, 0, false);
  fTempFatP.FieldDefs.Add('qtde_total_dev', ftFloat, 0, false);
  fTempFatP.FieldDefs.Add('valor_total_dev', ftFloat, 0, false);
  fTempFatP.FieldDefs.Add('qtde_total_deva', ftFloat, 0, false);
  fTempFatP.FieldDefs.Add('valor_total_avulsas', ftFloat, 0, false);
  fTempFatP.FieldDefs.Add('qtde_total_avulsas', ftFloat, 0, false);
  fTempFatP.FieldDefs.Add('valor_total_deva', ftFloat, 0, false);
  fTempFatP.FieldDefs.Add('valor_total', ftFloat, 0, false);

  if fTempFatP.Tag = 0 then
  try
    fTempFatP.CreateDataSet;
    fTempFatP.Tag := 1;
    fTempFatPDtSource := TDataSource.Create(nil);
    fTempFatPDtSource.DataSet := fTempFatP;
  except
  end;

  //Faixa de Pontos por valor
  fTempFaixaPontosValor := TClientDataSet.Create(nil);
  fTempFaixaPontosValor.Close;
  fTempFaixaPontosValor.FieldDefs.Clear;
  fTempFaixaPontosValor.FieldDefs.Add('cod_tp_regra', ftInteger, 0, false);
  fTempFaixaPontosValor.FieldDefs.Add('descricao_config', ftString, 100, false);
  fTempFaixaPontosValor.FieldDefs.Add('valor_f_ini', ftFloat, 0, false);
  fTempFaixaPontosValor.FieldDefs.Add('valor_f_fim', ftFloat, 0, false);
  fTempFaixaPontosValor.FieldDefs.Add('perc', ftFloat, 0, false);
  fTempFaixaPontosValor.FieldDefs.Add('qtde_total', ftFloat, 0, false);
  fTempFaixaPontosValor.FieldDefs.Add('valor_total', ftFloat, 0, false);
  fTempFaixaPontosValor.FieldDefs.Add('pontos', ftFloat, 0, false);
  fTempFaixaPontosValor.FieldDefs.Add('tot_pontos', ftFloat, 0, false);
  fTempFaixaPontosValor.FieldDefs.Add('perc_dia_real', ftFloat, 0, false);

  if fTempFaixaPontosValor.Tag = 0 then
  try
    fTempFaixaPontosValor.CreateDataSet;
    fTempFaixaPontosValor.Tag := 1;
    fTempFaixaPontosValor.FieldByName('cod_tp_regra').Visible := false;
    fTempFaixaPontosValor.FieldByName('pontos').Visible := false;
    fTempFaixaPontosValor.FieldByName('valor_f_ini').Visible := false;
    fTempFaixaPontosValor.FieldByName('valor_f_fim').Visible := false;
    fTempFaixaPontosValor.FieldByName('perc_dia_real').Visible := false;
    fTempFaixaPontosValor.FieldByName('qtde_total').Visible := false;

    fTempFaixaPontosValor.FieldByName('descricao_config').DisplayLabel := 'Tipo';
    fTempFaixaPontosValor.FieldByName('valor_total').DisplayLabel := 'Valor Total';
    fTempFaixaPontosValor.FieldByName('qtde_total').DisplayLabel := 'Quantidade';
    fTempFaixaPontosValor.FieldByName('perc').DisplayLabel := 'Perc (%)';
    fTempFaixaPontosValor.FieldByName('tot_pontos').DisplayLabel := 'Total pontos';
    TFloatField(fTempFaixaPontosValor.FieldByName('valor_total')).DisplayFormat := '#,##0.00';//'##0.' + vDadosIni.StrZero(0, 2);
    TFloatField(fTempFaixaPontosValor.FieldByName('tot_pontos')).DisplayFormat := '#,##0.00';//'##0.' + vDadosIni.StrZero(0, 2);
    TFloatField(fTempFaixaPontosValor.FieldByName('perc')).DisplayFormat := '##0.' + vDadosIni.StrZero(0, 2);
//    fTempFaixaPontosValor.FieldByName('descricao_config').DisplayWidth := 85;

    fTempFaixaPontosValorDtSource := TDataSource.Create(nil);
    fTempFaixaPontosValorDtSource.DataSet := fTempFaixaPontosValor;
  except
  end;

  //Asseduidade
  fTempAsseduidade := TClientDataSet.Create(nil);
  fTempAsseduidade.Close;
  fTempAsseduidade.FieldDefs.Clear;
  fTempAsseduidade.FieldDefs.Add('cod_tp_regra', ftInteger, 0, false);
  fTempAsseduidade.FieldDefs.Add('descricao_config', ftString, 100, false);
  fTempAsseduidade.FieldDefs.Add('valor_vc', ftString, 20, false);
  fTempAsseduidade.FieldDefs.Add('perc', ftFloat, 0, false);
  fTempAsseduidade.FieldDefs.Add('qtde_total', ftFloat, 0, false);
  fTempAsseduidade.FieldDefs.Add('valor_total', ftFloat, 0, false);
  fTempAsseduidade.FieldDefs.Add('pontos', ftFloat, 0, false);
  fTempAsseduidade.FieldDefs.Add('tot_pontos', ftFloat, 0, false);

  if fTempAsseduidade.Tag = 0 then
  try
    fTempAsseduidade.CreateDataSet;
    fTempAsseduidade.Tag := 1;
    fTempAsseduidade.FieldByName('cod_tp_regra').Visible := false;
    fTempAsseduidade.FieldByName('valor_vc').Visible := false;
    fTempAsseduidade.FieldByName('pontos').Visible := false;
    fTempAsseduidade.FieldByName('valor_total').Visible := false;

    fTempAsseduidade.FieldByName('descricao_config').DisplayLabel := 'Tipo';
    fTempAsseduidade.FieldByName('valor_total').DisplayLabel := 'Valor Total';
    fTempAsseduidade.FieldByName('qtde_total').DisplayLabel := 'Quantidade';
    fTempAsseduidade.FieldByName('perc').DisplayLabel := 'Perc (%)';
    fTempAsseduidade.FieldByName('tot_pontos').DisplayLabel := 'Total pontos';
    TFloatField(fTempAsseduidade.FieldByName('valor_total')).DisplayFormat := '#,##0.00';//'##0.' + vDadosIni.StrZero(0, 2);
    TFloatField(fTempAsseduidade.FieldByName('tot_pontos')).DisplayFormat := '#,##0.00';//'##0.' + vDadosIni.StrZero(0, 2);
    TFloatField(fTempAsseduidade.FieldByName('perc')).DisplayFormat := '##0.' + vDadosIni.StrZero(0, 2);
//    fTempAsseduidade.FieldByName('descricao_config').DisplayWidth := 85;

    fTempAsseduidadeDtSource := TDataSource.Create(nil);
    fTempAsseduidadeDtSource.DataSet := fTempAsseduidade;
  except
  end;

  //Faixa de pontos por Asseduidade
  fTempFaixaAsseduidade := TClientDataSet.Create(nil);
  fTempFaixaAsseduidade.Close;
  fTempFaixaAsseduidade.FieldDefs.Clear;
  fTempFaixaAsseduidade.FieldDefs.Add('cod_tp_regra', ftInteger, 0, false);
  fTempFaixaAsseduidade.FieldDefs.Add('descricao_config', ftString, 100, false);
  fTempFaixaAsseduidade.FieldDefs.Add('perc', ftFloat, 0, false);
  fTempFaixaAsseduidade.FieldDefs.Add('qtde_total', ftFloat, 0, false);
  fTempFaixaAsseduidade.FieldDefs.Add('valor_total', ftFloat, 0, false);
  fTempFaixaAsseduidade.FieldDefs.Add('pontos', ftFloat, 0, false);
  fTempFaixaAsseduidade.FieldDefs.Add('tot_pontos', ftFloat, 0, false);
  fTempFaixaAsseduidade.FieldDefs.Add('perc_dia_real', ftFloat, 0, false);
  fTempFaixaAsseduidade.FieldDefs.Add('valor_vc', ftString, 20, false);

  if fTempFaixaAsseduidade.Tag = 0 then
  try
    fTempFaixaAsseduidade.CreateDataSet;
    fTempFaixaAsseduidade.Tag := 1;
    fTempFaixaAsseduidade.FieldByName('cod_tp_regra').Visible := false;
    fTempFaixaAsseduidade.FieldByName('pontos').Visible := false;
    fTempFaixaAsseduidade.FieldByName('perc_dia_real').Visible := false;
    fTempFaixaAsseduidade.FieldByName('qtde_total').Visible := false;
    fTempFaixaAsseduidade.FieldByName('valor_vc').Visible := false;

    fTempFaixaAsseduidade.FieldByName('descricao_config').DisplayLabel := 'Tipo';
    fTempFaixaAsseduidade.FieldByName('valor_total').DisplayLabel := 'Valor Total';
    fTempFaixaAsseduidade.FieldByName('qtde_total').DisplayLabel := 'Quantidade';
    fTempFaixaAsseduidade.FieldByName('perc').DisplayLabel := 'Perc (%)';
    fTempFaixaAsseduidade.FieldByName('tot_pontos').DisplayLabel := 'Total pontos';
    TFloatField(fTempFaixaAsseduidade.FieldByName('valor_total')).DisplayFormat := '#,##0.00';//'##0.' + vDadosIni.StrZero(0, 2);
    TFloatField(fTempFaixaAsseduidade.FieldByName('tot_pontos')).DisplayFormat := '#,##0.00';//'##0.' + vDadosIni.StrZero(0, 2);
    TFloatField(fTempFaixaAsseduidade.FieldByName('perc')).DisplayFormat := '##0.' + vDadosIni.StrZero(0, 2);
//    fTempFaixaAsseduidade.FieldByName('descricao_config').DisplayWidth := 85;

    fTempFaixaAsseduidadeDtSource := TDataSource.Create(nil);
    fTempFaixaAsseduidadeDtSource.DataSet := fTempFaixaAsseduidade;
  except
  end;

  //Formas de pagamento
  fTempFormaPag := TClientDataSet.Create(nil);
  fTempFormaPag.Close;
  fTempFormaPag.FieldDefs.Clear;
  fTempFormaPag.FieldDefs.Add('cod_tp_regra', ftInteger, 0, false);
  fTempFormaPag.FieldDefs.Add('descricao_config', ftString, 100, false);
  fTempFormaPag.FieldDefs.Add('valor_vc', ftString, 20, false);
  fTempFormaPag.FieldDefs.Add('perc', ftFloat, 0, false);
  fTempFormaPag.FieldDefs.Add('qtde_total', ftFloat, 0, false);
  fTempFormaPag.FieldDefs.Add('valor_total', ftFloat, 0, false);
  fTempFormaPag.FieldDefs.Add('pontos', ftFloat, 0, false);
  fTempFormaPag.FieldDefs.Add('tot_pontos', ftFloat, 0, false);

  if fTempFormaPag.Tag = 0 then
  try
    fTempFormaPag.CreateDataSet;
    fTempFormaPag.Tag := 1;
    fTempFormaPag.FieldByName('cod_tp_regra').Visible := false;
    fTempFormaPag.FieldByName('valor_vc').Visible := false;
    fTempFormaPag.FieldByName('pontos').Visible := false;
    fTempFormaPag.FieldByName('valor_total').Visible := false;

    fTempFormaPag.FieldByName('descricao_config').DisplayLabel := 'Tipo';
    fTempFormaPag.FieldByName('valor_total').DisplayLabel := 'Valor Total';
    fTempFormaPag.FieldByName('qtde_total').DisplayLabel := 'Quantidade';
    fTempFormaPag.FieldByName('perc').DisplayLabel := 'Perc (%)';
    fTempFormaPag.FieldByName('tot_pontos').DisplayLabel := 'Total pontos';
    TFloatField(fTempFormaPag.FieldByName('valor_total')).DisplayFormat := '#,##0.00';//'##0.' + vDadosIni.StrZero(0, 2);
    TFloatField(fTempFormaPag.FieldByName('tot_pontos')).DisplayFormat := '#,##0.00';//'##0.' + vDadosIni.StrZero(0, 2);
    TFloatField(fTempFormaPag.FieldByName('perc')).DisplayFormat := '##0.' + vDadosIni.StrZero(0, 2);
//    fTempFormaPag.FieldByName('descricao_config').DisplayWidth := 85;

    fTempFormaPagDtSource := TDataSource.Create(nil);
    fTempFormaPagDtSource.DataSet := fTempFormaPag;
  except
  end;

  //Faixa Compra
  fTempFaixaCompra := TClientDataSet.Create(nil);
  fTempFaixaCompra.Close;
  fTempFaixaCompra.FieldDefs.Clear;
  fTempFaixaCompra.FieldDefs.Add('cod_tp_regra', ftInteger, 0, false);
  fTempFaixaCompra.FieldDefs.Add('descricao_config', ftString, 100, false);
  fTempFaixaCompra.FieldDefs.Add('valor_f_ini', ftFloat, 0, false);
  fTempFaixaCompra.FieldDefs.Add('valor_f_fim', ftFloat, 0, false);
  fTempFaixaCompra.FieldDefs.Add('perc', ftFloat, 0, false);
  fTempFaixaCompra.FieldDefs.Add('qtde_total', ftFloat, 0, false);
  fTempFaixaCompra.FieldDefs.Add('valor_total', ftFloat, 0, false);
  fTempFaixaCompra.FieldDefs.Add('pontos', ftFloat, 0, false);
  fTempFaixaCompra.FieldDefs.Add('tot_pontos', ftFloat, 0, false);
  fTempFaixaCompra.FieldDefs.Add('perc_dia_real', ftFloat, 0, false);

  if fTempFaixaCompra.Tag = 0 then
  try
    fTempFaixaCompra.CreateDataSet;
    fTempFaixaCompra.Tag := 1;
    fTempFaixaCompra.FieldByName('cod_tp_regra').Visible := false;
    fTempFaixaCompra.FieldByName('pontos').Visible := false;
    fTempFaixaCompra.FieldByName('valor_f_ini').Visible := false;
    fTempFaixaCompra.FieldByName('valor_f_fim').Visible := false;
    fTempFaixaCompra.FieldByName('perc_dia_real').Visible := false;
    fTempFaixaCompra.FieldByName('qtde_total').Visible := false;
//    fTempFaixaCompra.FieldByName('qtde_total').Visible := false;

    fTempFaixaCompra.FieldByName('descricao_config').DisplayLabel := 'Tipo';
    fTempFaixaCompra.FieldByName('valor_total').DisplayLabel := 'Valor Total';
    fTempFaixaCompra.FieldByName('qtde_total').DisplayLabel := 'Quantidade';
    fTempFaixaCompra.FieldByName('perc').DisplayLabel := 'Perc (%)';
    fTempFaixaCompra.FieldByName('tot_pontos').DisplayLabel := 'Total pontos';
    TFloatField(fTempFaixaCompra.FieldByName('valor_total')).DisplayFormat := '#,##0.00';//'##0.' + vDadosIni.StrZero(0, 2);
    TFloatField(fTempFaixaCompra.FieldByName('tot_pontos')).DisplayFormat := '#,##0.00';//'##0.' + vDadosIni.StrZero(0, 2);
    TFloatField(fTempFaixaCompra.FieldByName('perc')).DisplayFormat := '##0.' + vDadosIni.StrZero(0, 2);
//    fTempFaixaCompra.FieldByName('descricao_config').DisplayWidth := 90;

    fTempFaixaCompraDtSource := TDataSource.Create(nil);
    fTempFaixaCompraDtSource.DataSet := fTempFaixaCompra;
  except
  end;

 //Recebimento de prestação
  fTempRecPrest := TClientDataSet.Create(nil);
  fTempRecPrest.Close;
  fTempRecPrest.FieldDefs.Clear;
  fTempRecPrest.FieldDefs.Add('cod_tp_regra', ftInteger, 0, false);
  fTempRecPrest.FieldDefs.Add('descricao_config', ftString, 100, false);
  fTempRecPrest.FieldDefs.Add('valor_vc', ftString, 20, false);
  fTempRecPrest.FieldDefs.Add('perc', ftFloat, 0, false);
  fTempRecPrest.FieldDefs.Add('qtde_total', ftFloat, 0, false);
  fTempRecPrest.FieldDefs.Add('valor_total', ftFloat, 0, false);
  fTempRecPrest.FieldDefs.Add('pontos', ftFloat, 0, false);
  fTempRecPrest.FieldDefs.Add('tot_pontos', ftFloat, 0, false);

  if fTempRecPrest.Tag = 0 then
  try
    fTempRecPrest.CreateDataSet;
    fTempRecPrest.Tag := 1;
    fTempRecPrest.FieldByName('cod_tp_regra').Visible := false;
    fTempRecPrest.FieldByName('valor_vc').Visible := false;
    fTempRecPrest.FieldByName('pontos').Visible := false;
    fTempRecPrest.FieldByName('valor_total').Visible := false;

    fTempRecPrest.FieldByName('descricao_config').DisplayLabel := 'Tipo';
    fTempRecPrest.FieldByName('valor_total').DisplayLabel := 'Valor Total';
    fTempRecPrest.FieldByName('qtde_total').DisplayLabel := 'Quantidade';
    fTempRecPrest.FieldByName('perc').DisplayLabel := 'Perc (%)';
    fTempRecPrest.FieldByName('tot_pontos').DisplayLabel := 'Total pontos';
    TFloatField(fTempRecPrest.FieldByName('valor_total')).DisplayFormat := '#,##0.00';//'##0.' + vDadosIni.StrZero(0, 2);
    TFloatField(fTempRecPrest.FieldByName('tot_pontos')).DisplayFormat := '#,##0.00';//'##0.' + vDadosIni.StrZero(0, 2);
    TFloatField(fTempRecPrest.FieldByName('perc')).DisplayFormat := '##0.' + vDadosIni.StrZero(0, 2);
//    fTempRecPrest.FieldByName('descricao_config').DisplayWidth := 85;

    fTempRecPrestDtSource := TDataSource.Create(nil);
    fTempRecPrestDtSource.DataSet := fTempRecPrest;
  except
  end;

  //Faixa de pontos por Produto
  fTempFaixaProduto := TClientDataSet.Create(nil);
  fTempFaixaProduto.Close;
  fTempFaixaProduto.FieldDefs.Clear;
  fTempFaixaProduto.FieldDefs.Add('cod_tp_regra', ftInteger, 0, false);
  fTempFaixaProduto.FieldDefs.Add('descricao_config', ftString, 100, false);
  fTempFaixaProduto.FieldDefs.Add('perc', ftFloat, 0, false);
  fTempFaixaProduto.FieldDefs.Add('qtde_total', ftFloat, 0, false);
  fTempFaixaProduto.FieldDefs.Add('valor_total', ftFloat, 0, false);
  fTempFaixaProduto.FieldDefs.Add('pontos', ftFloat, 0, false);
  fTempFaixaProduto.FieldDefs.Add('tot_pontos', ftFloat, 0, false);
  fTempFaixaProduto.FieldDefs.Add('perc_dia_real', ftFloat, 0, false);
  fTempFaixaProduto.FieldDefs.Add('grupo_prod', ftInteger, 0, false);
  fTempFaixaProduto.FieldDefs.Add('cod_prod', ftString, 6, false);

  if fTempFaixaProduto.Tag = 0 then
  try
    fTempFaixaProduto.CreateDataSet;
    fTempFaixaProduto.Tag := 1;
    fTempFaixaProduto.FieldByName('cod_tp_regra').Visible := false;
    fTempFaixaProduto.FieldByName('pontos').Visible := false;
    fTempFaixaProduto.FieldByName('perc_dia_real').Visible := false;
    fTempFaixaProduto.FieldByName('qtde_total').Visible := false;
    fTempFaixaProduto.FieldByName('grupo_prod').Visible := false;
    fTempFaixaProduto.FieldByName('cod_prod').Visible := false;

    fTempFaixaProduto.FieldByName('descricao_config').DisplayLabel := 'Tipo';
    fTempFaixaProduto.FieldByName('valor_total').DisplayLabel := 'Valor Total';
    fTempFaixaProduto.FieldByName('qtde_total').DisplayLabel := 'Quantidade';
    fTempFaixaProduto.FieldByName('perc').DisplayLabel := 'Perc (%)';
    fTempFaixaProduto.FieldByName('tot_pontos').DisplayLabel := 'Total pontos';
    TFloatField(fTempFaixaProduto.FieldByName('valor_total')).DisplayFormat := '#,##0.00';//'##0.' + vDadosIni.StrZero(0, 2);
    TFloatField(fTempFaixaProduto.FieldByName('tot_pontos')).DisplayFormat := '#,##0.00';//'##0.' + vDadosIni.StrZero(0, 2);
    TFloatField(fTempFaixaProduto.FieldByName('perc')).DisplayFormat := '##0.' + vDadosIni.StrZero(0, 2);
//    fTempFaixaProduto.FieldByName('descricao_config').DisplayWidth := 85;

    fTempFaixaProdutoDtSource := TDataSource.Create(nil);
    fTempFaixaProdutoDtSource.DataSet := fTempFaixaProduto;
  except
  end;

  //Faixa de pontos por Grupo Produto
  fTempFaixaGrupoProduto := TClientDataSet.Create(nil);
  fTempFaixaGrupoProduto.Close;
  fTempFaixaGrupoProduto.FieldDefs.Clear;
  fTempFaixaGrupoProduto.FieldDefs.Add('cod_tp_regra', ftInteger, 0, false);
  fTempFaixaGrupoProduto.FieldDefs.Add('descricao_config', ftString, 100, false);
  fTempFaixaGrupoProduto.FieldDefs.Add('perc', ftFloat, 0, false);
  fTempFaixaGrupoProduto.FieldDefs.Add('qtde_total', ftFloat, 0, false);
  fTempFaixaGrupoProduto.FieldDefs.Add('valor_total', ftFloat, 0, false);
  fTempFaixaGrupoProduto.FieldDefs.Add('pontos', ftFloat, 0, false);
  fTempFaixaGrupoProduto.FieldDefs.Add('tot_pontos', ftFloat, 0, false);
  fTempFaixaGrupoProduto.FieldDefs.Add('perc_dia_real', ftFloat, 0, false);
  fTempFaixaGrupoProduto.FieldDefs.Add('valor_f_ini', ftFloat, 0, false);

  if fTempFaixaGrupoProduto.Tag = 0 then
  try
    fTempFaixaGrupoProduto.CreateDataSet;
    fTempFaixaGrupoProduto.Tag := 1;
    fTempFaixaGrupoProduto.FieldByName('cod_tp_regra').Visible := false;
    fTempFaixaGrupoProduto.FieldByName('pontos').Visible := false;
    fTempFaixaGrupoProduto.FieldByName('perc_dia_real').Visible := false;
    fTempFaixaGrupoProduto.FieldByName('qtde_total').Visible := false;
    fTempFaixaGrupoProduto.FieldByName('valor_f_ini').Visible := false;

    fTempFaixaGrupoProduto.FieldByName('descricao_config').DisplayLabel := 'Tipo';
    fTempFaixaGrupoProduto.FieldByName('valor_total').DisplayLabel := 'Valor Total';
    fTempFaixaGrupoProduto.FieldByName('qtde_total').DisplayLabel := 'Quantidade';
    fTempFaixaGrupoProduto.FieldByName('perc').DisplayLabel := 'Perc (%)';
    fTempFaixaGrupoProduto.FieldByName('tot_pontos').DisplayLabel := 'Total pontos';
    TFloatField(fTempFaixaGrupoProduto.FieldByName('valor_total')).DisplayFormat := '#,##0.00';//'##0.' + vDadosIni.StrZero(0, 2);
    TFloatField(fTempFaixaGrupoProduto.FieldByName('tot_pontos')).DisplayFormat := '#,##0.00';//'##0.' + vDadosIni.StrZero(0, 2);
    TFloatField(fTempFaixaGrupoProduto.FieldByName('perc')).DisplayFormat := '##0.' + vDadosIni.StrZero(0, 2);
//    fTempFaixaGrupoProduto.FieldByName('descricao_config').DisplayWidth := 85;

    fTempFaixaGrupoProdutoDtSource := TDataSource.Create(nil);
    fTempFaixaGrupoProdutoDtSource.DataSet := fTempFaixaGrupoProduto;
  except
  end;

  //Faixa de pontos SubGrupo Produto
  fTempFaixaSubGrupoProduto := TClientDataSet.Create(nil);
  fTempFaixaSubGrupoProduto.Close;
  fTempFaixaSubGrupoProduto.FieldDefs.Clear;
  fTempFaixaSubGrupoProduto.FieldDefs.Add('cod_tp_regra', ftInteger, 0, false);
  fTempFaixaSubGrupoProduto.FieldDefs.Add('descricao_config', ftString, 100, false);
  fTempFaixaSubGrupoProduto.FieldDefs.Add('perc', ftFloat, 0, false);
  fTempFaixaSubGrupoProduto.FieldDefs.Add('qtde_total', ftFloat, 0, false);
  fTempFaixaSubGrupoProduto.FieldDefs.Add('valor_total', ftFloat, 0, false);
  fTempFaixaSubGrupoProduto.FieldDefs.Add('pontos', ftFloat, 0, false);
  fTempFaixaSubGrupoProduto.FieldDefs.Add('tot_pontos', ftFloat, 0, false);
  fTempFaixaSubGrupoProduto.FieldDefs.Add('perc_dia_real', ftFloat, 0, false);
  fTempFaixaSubGrupoProduto.FieldDefs.Add('valor_f_ini', ftFloat, 0, false);

  if fTempFaixaSubGrupoProduto.Tag = 0 then
  try
    fTempFaixaSubGrupoProduto.CreateDataSet;
    fTempFaixaSubGrupoProduto.Tag := 1;
    fTempFaixaSubGrupoProduto.FieldByName('cod_tp_regra').Visible := false;
    fTempFaixaSubGrupoProduto.FieldByName('pontos').Visible := false;
    fTempFaixaSubGrupoProduto.FieldByName('perc_dia_real').Visible := false;
    fTempFaixaSubGrupoProduto.FieldByName('qtde_total').Visible := false;
    fTempFaixaSubGrupoProduto.FieldByName('valor_f_ini').Visible := false;

    fTempFaixaSubGrupoProduto.FieldByName('descricao_config').DisplayLabel := 'Tipo';
    fTempFaixaSubGrupoProduto.FieldByName('valor_total').DisplayLabel := 'Valor Total';
    fTempFaixaSubGrupoProduto.FieldByName('qtde_total').DisplayLabel := 'Quantidade';
    fTempFaixaSubGrupoProduto.FieldByName('perc').DisplayLabel := 'Perc (%)';
    fTempFaixaSubGrupoProduto.FieldByName('tot_pontos').DisplayLabel := 'Total pontos';
    TFloatField(fTempFaixaSubGrupoProduto.FieldByName('valor_total')).DisplayFormat := '#,##0.00';//'##0.' + vDadosIni.StrZero(0, 2);
    TFloatField(fTempFaixaSubGrupoProduto.FieldByName('tot_pontos')).DisplayFormat := '#,##0.00';//'##0.' + vDadosIni.StrZero(0, 2);
    TFloatField(fTempFaixaSubGrupoProduto.FieldByName('perc')).DisplayFormat := '##0.' + vDadosIni.StrZero(0, 2);
//    fTempFaixaSubGrupoProduto.FieldByName('descricao_config').DisplayWidth := 85;

    fTempFaixaSubGrupoProdutoDtSource := TDataSource.Create(nil);
    fTempFaixaSubGrupoProdutoDtSource.DataSet := fTempFaixaSubGrupoProduto;
  except
  end;

  //Faixa de pontos Marca Produto
  fTempFaixaMarcaProduto := TClientDataSet.Create(nil);
  fTempFaixaMarcaProduto.Close;
  fTempFaixaMarcaProduto.FieldDefs.Clear;
  fTempFaixaMarcaProduto.FieldDefs.Add('cod_tp_regra', ftInteger, 0, false);
  fTempFaixaMarcaProduto.FieldDefs.Add('descricao_config', ftString, 100, false);
  fTempFaixaMarcaProduto.FieldDefs.Add('perc', ftFloat, 0, false);
  fTempFaixaMarcaProduto.FieldDefs.Add('qtde_total', ftFloat, 0, false);
  fTempFaixaMarcaProduto.FieldDefs.Add('valor_total', ftFloat, 0, false);
  fTempFaixaMarcaProduto.FieldDefs.Add('pontos', ftFloat, 0, false);
  fTempFaixaMarcaProduto.FieldDefs.Add('tot_pontos', ftFloat, 0, false);
  fTempFaixaMarcaProduto.FieldDefs.Add('perc_dia_real', ftFloat, 0, false);
  fTempFaixaMarcaProduto.FieldDefs.Add('valor_f_ini', ftFloat, 0, false);

  if fTempFaixaMarcaProduto.Tag = 0 then
  try
    fTempFaixaMarcaProduto.CreateDataSet;
    fTempFaixaMarcaProduto.Tag := 1;
    fTempFaixaMarcaProduto.FieldByName('cod_tp_regra').Visible := false;
    fTempFaixaMarcaProduto.FieldByName('pontos').Visible := false;
    fTempFaixaMarcaProduto.FieldByName('perc_dia_real').Visible := false;
    fTempFaixaMarcaProduto.FieldByName('qtde_total').Visible := false;
    fTempFaixaMarcaProduto.FieldByName('valor_f_ini').Visible := false;

    fTempFaixaMarcaProduto.FieldByName('descricao_config').DisplayLabel := 'Tipo';
    fTempFaixaMarcaProduto.FieldByName('valor_total').DisplayLabel := 'Valor Total';
    fTempFaixaMarcaProduto.FieldByName('qtde_total').DisplayLabel := 'Quantidade';
    fTempFaixaMarcaProduto.FieldByName('perc').DisplayLabel := 'Perc (%)';
    fTempFaixaMarcaProduto.FieldByName('tot_pontos').DisplayLabel := 'Total pontos';
    TFloatField(fTempFaixaMarcaProduto.FieldByName('valor_total')).DisplayFormat := '#,##0.00';//'##0.' + vDadosIni.StrZero(0, 2);
    TFloatField(fTempFaixaMarcaProduto.FieldByName('tot_pontos')).DisplayFormat := '#,##0.00';//'##0.' + vDadosIni.StrZero(0, 2);
    TFloatField(fTempFaixaMarcaProduto.FieldByName('perc')).DisplayFormat := '##0.' + vDadosIni.StrZero(0, 2);
//    fTempFaixaMarcaProduto.FieldByName('descricao_config').DisplayWidth := 85;

    fTempFaixaMarcaProdutoDtSource := TDataSource.Create(nil);
    fTempFaixaMarcaProdutoDtSource.DataSet := fTempFaixaMarcaProduto;
  except
  end;

  //Faixa de pontos Kit Produto
  fTempFaixaKitProduto := TClientDataSet.Create(nil);
  fTempFaixaKitProduto.Close;
  fTempFaixaKitProduto.FieldDefs.Clear;
  fTempFaixaKitProduto.FieldDefs.Add('cod_tp_regra', ftInteger, 0, false);
  fTempFaixaKitProduto.FieldDefs.Add('descricao_config', ftString, 100, false);
  fTempFaixaKitProduto.FieldDefs.Add('perc', ftFloat, 0, false);
  fTempFaixaKitProduto.FieldDefs.Add('qtde_total', ftFloat, 0, false);
  fTempFaixaKitProduto.FieldDefs.Add('valor_total', ftFloat, 0, false);
  fTempFaixaKitProduto.FieldDefs.Add('pontos', ftFloat, 0, false);
  fTempFaixaKitProduto.FieldDefs.Add('tot_pontos', ftFloat, 0, false);
  fTempFaixaKitProduto.FieldDefs.Add('perc_dia_real', ftFloat, 0, false);
  fTempFaixaKitProduto.FieldDefs.Add('valor_f_ini', ftFloat, 0, false);

  if fTempFaixaKitProduto.Tag = 0 then
  try
    fTempFaixaKitProduto.CreateDataSet;
    fTempFaixaKitProduto.Tag := 1;
    fTempFaixaKitProduto.FieldByName('cod_tp_regra').Visible := false;
    fTempFaixaKitProduto.FieldByName('pontos').Visible := false;
    fTempFaixaKitProduto.FieldByName('perc_dia_real').Visible := false;
    fTempFaixaKitProduto.FieldByName('qtde_total').Visible := false;
    fTempFaixaKitProduto.FieldByName('valor_f_ini').Visible := false;

    fTempFaixaKitProduto.FieldByName('descricao_config').DisplayLabel := 'Tipo';
    fTempFaixaKitProduto.FieldByName('valor_total').DisplayLabel := 'Valor Total';
    fTempFaixaKitProduto.FieldByName('qtde_total').DisplayLabel := 'Quantidade';
    fTempFaixaKitProduto.FieldByName('perc').DisplayLabel := 'Perc (%)';
    fTempFaixaKitProduto.FieldByName('tot_pontos').DisplayLabel := 'Total pontos';
    TFloatField(fTempFaixaKitProduto.FieldByName('valor_total')).DisplayFormat := '#,##0.00';//'##0.' + vDadosIni.StrZero(0, 2);
    TFloatField(fTempFaixaKitProduto.FieldByName('tot_pontos')).DisplayFormat := '#,##0.00';//'##0.' + vDadosIni.StrZero(0, 2);
    TFloatField(fTempFaixaKitProduto.FieldByName('perc')).DisplayFormat := '##0.' + vDadosIni.StrZero(0, 2);
//    fTempFaixaKitProduto.FieldByName('descricao_config').DisplayWidth := 85;

    fTempFaixaKitProdutoDtSource := TDataSource.Create(nil);
    fTempFaixaKitProdutoDtSource.DataSet := fTempFaixaKitProduto;
  except
  end;
end;

destructor TRegrasProgramasFidelidades.destroy;
begin
  vConfigRegrasProgramasFidelidades.free;
  vConfigRegrasProgramasFidelidades := nil;
  vTaxaProgramasFidelidades.free;
  vTaxaProgramasFidelidades := nil;
  inherited;
end;

function TRegrasProgramasFidelidades.lancamentoRetroativo(pdataini,
  pdatafim: string): boolean;
var
  buscas2: TIBQuery;
begin
  Result := false;

  try
    try
      if not vDadosIni.vProgFid.vHabilitarProgFid then
      begin
        Application.MessageBox('Programa de fidelidade desabilitado!', 'Erro', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
        exit;
      end;

      if Application.MessageBox('Deseja realizar lançamento retroativo na conta corrente dos clientes?',
        'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> idYES then
       exit;   

      if not vDadosIni.verificaProgramaFid(buscas) then
        exit;

      buscas.Close;
      buscas.SQL.Text := ' select first 1 codigo from conta_corrente_prog_fidelidade ' +
        ' where data >= :dtini and data <= :dtfim and cod_empresa = :cod_empresa ';
      buscas.ParamByName('dtini').AsDate := StrToDate(pdataini);
      buscas.ParamByName('dtfim').AsDate := StrToDate(pdatafim);
      buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
      buscas.Open;

      if not buscas.IsEmpty then
      begin
        Application.MessageBox(pchar('Não é possível realizar os lançamentos retroativos,' +
          ' já existem lançamentos realizados neste período, favor verificar antes de continuar'), 'Atenção', MB_ICONERROR + MB_OK);
        exit;
      end;

      buscas2 := TIBQuery.Create(Application);
      buscas2.Database := buscas.Database;
      buscas2.Transaction := buscas.Transaction;

      buscas.Close;
      buscas.SQL.Text := ' update pedvenda set tp_venda = null, tp_gerar_pontos = null, ' +
      	' cl_gerar_pontos = null, cl_clultimacompra = null, cl_status_f = null ' +
        ' where tipo = ''REQ'' and status_ped = ''FECHADA'' ' +
        ' and data_fech >= :data_ini and data_fech <= :data_fim and cod_empresa = :cod_empresa; ';
      buscas.ParamByName('data_ini').AsDateTime := StrToDate(pdataini);
      buscas.ParamByName('data_fim').AsDateTime := StrToDate(pdatafim);
      buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
      buscas.ExecSQL;

      buscas.Close;
      buscas.SQL.Text := ' update pedvenda set tp_venda = null, tp_gerar_pontos = null, ' +
      	' cl_gerar_pontos = null, cl_clultimacompra = null, cl_status_f = null ' +
        ' where tipo = ''OS'' and status_ped = ''FECHADA'' ' +
        ' and data_fech >= :data_ini and data_fech <= :data_fim and cod_empresa = :cod_empresa; ';
      buscas.ParamByName('data_ini').AsDateTime := StrToDate(pdataini);
      buscas.ParamByName('data_fim').AsDateTime := StrToDate(pdatafim);
      buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
      buscas.ExecSQL;

      buscas.Close;
      buscas.SQL.Text := ' update com_fat set tp_venda = null, tp_gerar_pontos = null, ' +
      	' cl_gerar_pontos = null, cl_clultimacompra = null, cl_status_f = null ' +
        ' where data_fech >= :data_ini and data_fech <= :data_fim and status_v = ''FECHADO'' ' +
        ' and natureza = ''S'' and cod_empresa = :cod_empresa; ';
      buscas.ParamByName('data_ini').AsDateTime := StrToDate(pdataini);
      buscas.ParamByName('data_fim').AsDateTime := StrToDate(pdatafim);
      buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
      buscas.ExecSQL;

      buscas.Close;
      buscas.SQL.Text := ' update controle_creditos set ' +
      	' cl_gerar_pontos = null, cl_clultimacompra = null, cl_status_f = null ' +
        ' where dia_cxl >= :data_ini and dia_cxl <= :data_fim ' +
        ' and codigo_emp = :cod_empresa and tp_doc_v in (''REQ'', ''OS'', ''MOT''); ';
      buscas.ParamByName('data_ini').AsDateTime := StrToDate(pdataini);
      buscas.ParamByName('data_fim').AsDateTime := StrToDate(pdatafim);
      buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
      buscas.ExecSQL;
      
      buscas.Close;
      buscas.SQL.Text := ' update devolucao set ' +
      	' cl_gerar_pontos = null, cl_clultimacompra = null, cl_status_f = null ' +
        ' where data >= :data_ini and data <= :data_fim and cod_empresa = :cod_empresa; ';
      buscas.ParamByName('data_ini').AsDateTime := StrToDate(pdataini);
      buscas.ParamByName('data_fim').AsDateTime := StrToDate(pdatafim);
      buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
      buscas.ExecSQL;

      buscas.Close;
      buscas.SQL.Text := ' update notafiscal set ' +
      	' cl_gerar_pontos = null, cl_clultimacompra = null, cl_status_f = null ' +
        ' where cod_empresa = :cod_empresa ' +
        ' and data_lanc >= :data_ini and data_lanc <= :data_fim ' +
        ' and tipo_nf = ''V'' and natureza_nf = ''E'' and devolucao = ''SIM'' ' +
        ' and emissao_propria = ''S'' and status = ''Fechada'' and situacao_nfe = ''Autorizada''; ';
      buscas.ParamByName('data_ini').AsDateTime := StrToDate(pdataini);
      buscas.ParamByName('data_fim').AsDateTime := StrToDate(pdatafim);
      buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
      buscas.ExecSQL;

      buscas.Close;
      buscas.SQL.Text := ' update notafiscal set ' +
      	' cl_gerar_pontos = null, cl_clultimacompra = null, cl_status_f = null ' +
	      ' where cod_empresa = :cod_empresa ' +
        ' and data_lanc >= :data_ini and data_lanc <= :data_fim ' +
        ' and tipo_nf = ''V'' and natureza_nf = ''E'' and devolucao = ''SIM'' ' +
        ' and emissao_propria = ''N'' and status = ''Fechada'' ';
      buscas.ParamByName('data_ini').AsDateTime := StrToDate(pdataini);
      buscas.ParamByName('data_fim').AsDateTime := StrToDate(pdatafim);
      buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
      buscas.ExecSQL;
      CommitaTransacao;
      
      buscas.Close;
      buscas.SQL.Text :=
        //Requisição/Ordem de Serviço
        ' select pd.nped ndoc, pd.tipo, pd.status_ped status, ' +
        ' ''CRÉDITO'' natureza, pd.data_fech data, 0 ndoc2, '''' tipo2 from pedvenda pd ' +
        ' inner join clientes cl on cl.cod_cliente = pd.cod_cliente and cl.cod_empresa = pd.cod_empresa ' +
        ' left join tipo_faturamento tf on tf.codigo_faturamento = cl.codigo_faturamento and tf.ativo = 1 ' +
        ' left join tipo_vendas tpreq on trim(tpreq.tipo) = ''REQ'' and tpreq.sigla = pd.tipv ' +
        ' where pd.tipo = ''REQ'' and pd.status_ped = ''FECHADA'' ' +
        ' and pd.data_fech >= :data_ini and pd.data_fech <= :data_fim and pd.cod_empresa = :cod_empresa ' +
        ' and tpreq.gerar_pontos = ''S'' ' +
        ' and tpreq.venda = ''S'' ' +
        ' and coalesce(cl.cl_gerar_pontos, ''S'') <> ''N'' ' +
        ' and coalesce(tf.status_f, '''') <> ''BARRADO'' ' +
        ' and ((case when ((coalesce((select ndoc from existe_formas(pd.nped, pd.tipo, pd.cod_empresa)), 0)) > 0) then 1 else 0 end) > 0) ' +
        ' and pd.cod_cliente <> :cod_cliente ' +
        ' and pd.valor_total > abs(coalesce((select coalesce(valor_vale, 0) from existe_formas (pd.nped, pd.tipo, pd.cod_empresa)), 0)) ' +
        ' union ' +
        //Ordem de Serviço
        ' select pd.nped ndoc, pd.tipo, pd.status_ped status, ' +
        ' ''CRÉDITO'' natureza, pd.data_fech data, 0 ndoc2, '''' tipo2 from pedvenda pd ' +
        ' inner join clientes cl on cl.cod_cliente = pd.cod_cliente and cl.cod_empresa = pd.cod_empresa ' +
        ' left join tipo_faturamento tf on tf.codigo_faturamento = cl.codigo_faturamento and tf.ativo = 1 ' +
        ' left join tipo_vendas tpord on trim(tpord.tipo) = ''OS'' and tpord.tipo_os = pd.tipo_os ' +
        ' where pd.tipo = ''OS'' and pd.status_ped = ''FECHADA'' ' +
        ' and pd.data_fech >= :data_ini and pd.data_fech <= :data_fim and pd.cod_empresa = :cod_empresa ' +
        ' and tpord.gerar_pontos = ''S'' ' +
        ' and tpord.venda = ''S'' ' +
        ' and coalesce(cl.cl_gerar_pontos, ''S'') <> ''N'' ' +
        ' and coalesce(tf.status_f, '''') <> ''BARRADO'' ' +
        ' and ((case when ((coalesce((select ndoc from existe_formas(pd.nped, pd.tipo, pd.cod_empresa)), 0)) > 0) then 1 else 0 end) > 0) ' +
        ' and pd.cod_cliente <> :cod_cliente ' +
        ' and pd.valor_total > abs(coalesce((select coalesce(valor_vale, 0) from existe_formas (pd.nped, pd.tipo, pd.cod_empresa)), 0)) ' +
        ' union ' +
        //Comando de Faturamento
        ' select cf.n_comando ndoc, ''MOT'' tipo, cf.status_v status, ' +
        ' ''CRÉDITO'' natureza, cf.data_fech data, 0 ndoc2, '''' tipo2 from com_fat cf ' +
        ' inner join clientes cl on cl.cod_cliente = cf.clientes_v and cl.cod_empresa = cf.cod_empresa ' +
        ' left join tipo_faturamento tf on tf.codigo_faturamento = cl.codigo_faturamento and tf.ativo = 1 ' +
        ' inner join est_moto est on est.chassi_c = cf.chassiv and est.codigo = cf.cod_estmoto and est.cod_empresa = cf.cod_empresa ' +
        ' left join tipo_vendas tpv on trim(tpv.tipo) = ''VEI'' and tpv.tipo_os = cf.tipo_v ' +
        ' where cf.data_fech >= :data_ini and cf.data_fech <= :data_fim and cf.status_v = ''FECHADO'' ' +
        ' and cf.natureza = ''S'' and cf.cod_empresa = :cod_empresa ' +
        ' and tpv.gerar_pontos = ''S'' ' +
        ' and tpv.venda = ''S'' ' +
        ' and coalesce(cl.cl_gerar_pontos, ''S'') <> ''N'' ' +
        ' and coalesce(tf.status_f, '''') <> ''BARRADO'' ' +
        ' and ((case when ((coalesce((select ndoc from existe_formas(cf.n_comando, ''MOT'', cf.cod_empresa)), 0)) > 0) then 1 else 0 end) > 0) ' +
        ' and cf.clientes_v <> :cod_cliente ' +
//        ' and cf.valtot_v > abs(coalesce((select coalesce(valor_vale, 0) from existe_formas (cf.n_comando, ''MOT'', cf.cod_empresa)), 0)) ' +
        ' union ' +
        //Prestação
        ' select cr.cod_cred ndoc, ''PRE'' tipo, cr.status_cxl_rq status, ' +
        ' ''CRÉDITO'' natureza, cr.dia_cxl data, 0 ndoc2, '''' tipo2 from controle_creditos cr ' +
        ' inner join clientes cl on cl.cod_cliente = cr.cod_cliente and cl.cod_empresa = cr.cod_emp_mult ' +
        ' inner join controles ctrl on cr.codigo_ctrl = ctrl.codigo_ctrl and cr.codigo_emp = ctrl.codigo_emp ' +
        ' left join pedvenda pd on cr.n_doc_v = pd.nped and cr.tp_doc_v = pd.tipo and cr.codigo_emp = pd.cod_empresa ' +
        ' left join com_fat cf on cr.n_doc_v = cf.n_comando and cr.tp_doc_v = ''MOT'' and cr.codigo_emp = cf.cod_empresa ' +
        ' left join tipo_vendas tpreq on trim(tpreq.tipo) = ''REQ'' and tpreq.sigla = pd.tipv ' +
        ' left join tipo_vendas tpord on trim(tpord.tipo) = ''OS'' and tpord.tipo_os = pd.tipo_os ' +
        ' left join tipo_vendas tpv on trim(tpv.tipo) = ''VEI'' and tpv.tipo_os = cf.tipo_v ' +
        ' left join tipo_faturamento tf on tf.codigo_faturamento = cl.codigo_faturamento and tf.ativo = 1 ' +
        ' where ctrl.entra_prest_cxl = ''S'' ' +
        ' and cr.dia_cxl >= :data_ini and cr.dia_cxl <= :data_fim ' +
        ' and cr.codigo_emp = :cod_empresa and cr.tp_doc_v in (''REQ'', ''OS'', ''MOT'') ' +
        ' and ((case when ((coalesce((select ndoc from existe_formas(cr.lote_cxl, ''PRE'', cr.codigo_emp)), 0)) > 0) then 1 else 0 end) > 0) ' +
        				//venda
        ' and (case when (cr.tp_doc_v = ''MOT'') then ' +
        '  					  coalesce(cf.tp_venda, coalesce(tpv.venda, ''N'')) ' +
        ' 				 else ' +
        '   				  case when (pd.tipo = ''REQ'') then ' +
        '									  coalesce(pd.tp_venda, coalesce(tpreq.venda, ''N'')) ' +
        '   							else ' +
        '										coalesce(pd.tp_venda, coalesce(tpord.venda, ''N'')) ' +
        '						  end ' +
        ' 		end) = ''S'' ' +
                //gerar pontos
        ' and (case when (cr.tp_doc_v = ''MOT'') then ' +
        '    				  coalesce(cf.tp_gerar_pontos, coalesce(tpv.gerar_pontos, ''N'')) ' +
        ' 			   else ' +
        '    				  case when (pd.tipo = ''REQ'') then ' +
        '										coalesce(pd.tp_gerar_pontos, coalesce(tpreq.gerar_pontos, ''N'')) ' +
        '    						  else ' +
        ' 									coalesce(pd.tp_gerar_pontos, coalesce(tpord.gerar_pontos, ''N'')) ' +
        '						  end ' +
        ' 	  end) = ''S'' ' +
                //cl gerar pontos
//        ' and (case when (cr.tp_doc_v = ''MOT'') then ' +
//        '   				  coalesce(cf.cl_gerar_pontos, coalesce(cl.cl_gerar_pontos, ''S'')) ' +
//        ' 					else ' +
//        '   					case when (pd.tipo = ''REQ'') then ' +
//        '   	 							 coalesce(pd.cl_gerar_pontos, coalesce(cl.cl_gerar_pontos, ''S'')) ' +
//        '   							 else ' +
//        '		 								 coalesce(pd.cl_gerar_pontos, coalesce(cl.cl_gerar_pontos, ''S'')) ' +
//        '							end ' +
//        ' 		end) <> ''N'' ' +
        ' and coalesce(cl.cl_gerar_pontos, ''S'') <> ''N'' ' +
                //status faturamento
//        ' and (case when (cr.tp_doc_v = ''MOT'') then ' +
//        '   			    coalesce(cf.cl_status_f, coalesce(tf.status_f, '''')) ' +
//        ' 					else ' +
//        '   				  case when (pd.tipo = ''REQ'') then ' +
//        '		 							   coalesce(pd.cl_status_f, coalesce(tf.status_f, '''')) ' +
//        '   							 else ' +
//        '		 								 coalesce(pd.cl_status_f, coalesce(tf.status_f, '''')) ' +
//        '							end ' +
//        ' 		end) <> ''BARRADO'' ' +
        ' and coalesce(tf.status_f, '''') <> ''BARRADO'' ' +
        ' and cr.cod_cliente <> :cod_cliente ' +
        ' union ' +
        //Devolução avulsa
        ' select distinct dev.sequencia ndoc, ''DEV'' tipo, ''FECHADA'' status, ' +
        ' ''DÉBITO'' natureza, dev.data, 0 ndoc2, '''' tipo2 from devolucao dev ' +
        ' inner join clientes cl on cl.cod_cliente = dev.cod_cliente and cl.cod_empresa = dev.cod_empresa ' +
        ' left join tipo_faturamento tf on tf.codigo_faturamento = cl.codigo_faturamento and tf.ativo = 1 ' +
        ' where dev.data >= :data_ini and dev.data <= :data_fim and dev.cod_empresa = :cod_empresa ' +
        ' and coalesce(tf.status_f, '''') <> ''BARRADO'' ' +
        ' and not((coalesce(dev.cod_venda, 0) > 0) and (dev.tipo_venda in (''REQ'', ''OS''))) ' +
        ' and coalesce(cl.cl_gerar_pontos, ''S'') <> ''N'' ' +
        ' and coalesce(tf.status_f, '''') <> ''BARRADO'' ' +
        ' and dev.cod_cliente <> :cod_cliente ' +
        // Devolução com_fat
        ' union ' +
        ' select nf2.cod_nf ndoc, ''DEVV'' tipo, upper(nf2.status) status, ' +
        ' ''DÉBITO'' natureza, nf2.data_lanc data, ' +
        ' coalesce((select cf.n_comando from com_fat cf ' +
        '   where cf.cod_nf = nfi2.cod_nf_dev and cf.cod_empresa = nfi2.cod_empresa), 0) n_comando, ' +
        ' ''MOT'' tipo2 from notafiscal nf2 ' +
        ' inner join clientes cl on cl.cod_cliente = nf2.cod_cliente and cl.cod_empresa = nf2.cod_empresa ' +
        ' left join tipo_faturamento tf on tf.codigo_faturamento = cl.codigo_faturamento and tf.ativo = 1 ' +
        ' inner join notafiscal_item nfi2 on nfi2.cod_nf = nf2.cod_nf and nfi2.cod_empresa = nf2.cod_empresa ' +
        ' where nf2.cod_empresa = :cod_empresa ' +
        ' and nf2.data_lanc >= :data_ini and nf2.data_lanc <= :data_fim ' +
        ' and nf2.tipo_nf = ''V'' and nf2.natureza_nf = ''E'' and nf2.devolucao = ''SIM'' ' +
        ' and nf2.emissao_propria = ''S'' and nf2.status = ''Fechada'' and nf2.situacao_nfe = ''Autorizada'' ' +
        ' and coalesce(cl.cl_gerar_pontos, ''S'') <> ''N'' ' +
        ' and coalesce(tf.status_f, '''') <> ''BARRADO'' ' +
        ' and nf2.cod_cliente <> :cod_cliente ' +
        ' union ' +
        ' select nf2.cod_nf ndoc, ''DEVV'' tipo, upper(nf2.status) status, ' +
        ' ''DÉBITO'' natureza, nf2.data_lanc data, ' +
        ' coalesce((select cf.n_comando from com_fat cf ' +
        '   where cf.cod_nf = nfi2.cod_nf_dev and cf.cod_empresa = nfi2.cod_empresa), 0) n_comando, ' +
        ' ''MOT'' tipo2 from notafiscal nf2 ' +
        ' inner join clientes cl on cl.cod_cliente = nf2.cod_cliente and cl.cod_empresa = nf2.cod_empresa ' +
        ' left join tipo_faturamento tf on tf.codigo_faturamento = cl.codigo_faturamento and tf.ativo = 1 ' +
        ' inner join notafiscal_item nfi2 on nfi2.cod_nf = nf2.cod_nf and nfi2.cod_empresa = nf2.cod_empresa ' +
        ' where nf2.cod_empresa = :cod_empresa ' +
        ' and nf2.data_lanc >= :data_ini and nf2.data_lanc <= :data_fim ' +
        ' and nf2.tipo_nf = ''V'' and nf2.natureza_nf = ''E'' and nf2.devolucao = ''SIM'' ' +
        ' and nf2.emissao_propria = ''N'' and nf2.status = ''Fechada'' ' +
        ' and coalesce(cl.cl_gerar_pontos, ''S'') <> ''N'' ' +
        ' and coalesce(tf.status_f, '''') <> ''BARRADO'' ' +
        ' and nf2.cod_cliente <> :cod_cliente ' +
        ' order by 5 asc, 1 asc ';
       buscas.ParamByName('data_ini').AsDateTime := StrToDate(pdataini);
       buscas.ParamByName('data_fim').AsDateTime := StrToDate(pdatafim);
       buscas.ParamByName('cod_cliente').AsInteger := StrToInt(vDadosIni.vCliente.vCodClientePadrao);
       buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
       buscas.Open;
       buscas.FetchAll;

       frmCadRegrasProgramaFidelidade.PanelProg.Visible := buscas.RecordCount > 0;

       frmCadRegrasProgramaFidelidade.ProgressBar1.Min := 0;
       frmCadRegrasProgramaFidelidade.ProgressBar1.Max := buscas.RecordCount;
       frmCadRegrasProgramaFidelidade.ProgressBar1.Position := 0;

       frmCadRegrasProgramaFidelidade.Label79.Caption := IntToStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Position) +
          ' / ' + IntToStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Max);

       buscas.First;
       while not buscas.Eof do
       begin
          Application.ProcessMessages;
          if not vDadosIni.setarPontosProgFidelidade(
            buscas.FieldByName('ndoc').AsInteger, buscas.FieldByName('tipo').AsString, buscas2,
            vDadosIni.IfThen(trim(buscas.FieldByName('natureza').AsString) = 'DÉBITO', true, false),
            buscas.FieldByName('ndoc2').AsInteger, buscas.FieldByName('tipo2').AsString, true,
             false) then
          begin
            RollBackTransacao;
            Result := false;
            exit;
          end;

          buscas.Next;

          frmCadRegrasProgramaFidelidade.ProgressBar1.Position := frmCadRegrasProgramaFidelidade.ProgressBar1.Position + 1;
          frmCadRegrasProgramaFidelidade.Label79.Caption := InttoStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Position) +
           ' / ' + InttoStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Max);
       end;
       Result := CommitaTransacao;
       vDadosIni.GravaAuditoria('FID025', 'LANCAMENTO RETROATIVO', 'SUCESSO', 'CONTA_CORRENTE_PROG_FIDELIDADE', '', buscas);
       Application.MessageBox(PChar('Lançamento retroativos realizados com sucesso!'), 'Informação', 0 + 64);
    except
      on e: Exception do
      begin
        Result := false;
        RollBackTransacao;
        vDadosIni.GravaAuditoria('FID025', 'LANCAMENTO RETROATIVO', 'FALHA', 'CONTA_CORRENTE_PROG_FIDELIDADE', '', buscas);
        Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
        registraErro(e.Message);
      end;
    end;
  finally
    frmCadRegrasProgramaFidelidade.PanelProg.Visible := false; 
    if Assigned(buscas2) then
      FreeAndNil(buscas2);
  end;
end;

function TRegrasProgramasFidelidades.retornadados(pSql: string): boolean;
begin
  Result := montaSelect(pSql);
end;

function TRegrasProgramasFidelidades.simularProgramaFidelidade(pdataini, pdatafim: string; GridResumo: TStringGrid; pDet: boolean; pExibirMens: boolean = true): boolean;
var
  vtemp: string;
  buscas2: TIBQuery;
  vValorFat: Double;
  vQtdeVales, vValorVales: Double;
  vQtdeFatDeva, vValorFatDeva: Double;
  vQtdeFatDev, vValorFatDev: Double;
  vQtdeFatVnd, vValorFatVnd: Double;
  vValorTemp, vQtdTemp, vValorTempTot, vQtdTempTot, vPercTempTotal, vPontosTempTotal: Double;
  vTotPontosG: Double;
  vsqlPontosFaixaValor: string;
  vFocoResumo: boolean;
  I, J: Integer;
  vTaxaConversao, vValorDesp: Double;
  vMensagem, vCampo: string;
begin
  Result := false;
  vSimRealizada := false;

  try
    try
      if not vDadosIni.vProgFid.vHabilitarProgFid then
      begin
        Application.MessageBox('Programa de fidelidade desabilitado!', 'Erro', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
        exit;
      end;

      if Application.MessageBox('Deseja realizar simulação?',
        'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> idYES then
       exit;

      buscas2 := TIBQuery.Create(Application);
      buscas2.Database := buscas.Database;
      buscas2.Transaction := buscas.Transaction;

      frmCadRegrasProgramaFidelidade.ProgressBar1.Position := 1;
      frmCadRegrasProgramaFidelidade.ProgressBar1.Max := 1;

      if not testarDataSimulacao(vMensagem, vCampo, '', false) then
        Application.MessageBox(PChar(vMensagem), 'Atenção', 0 + 64);

      if not tiposvendasconfigurados(buscas2) then
        exit;

      atualizarDataUltimaDefClasse(frmCadRegrasProgramaFidelidade.LabelDataDefClasse);

      if pExibirMens then
        if buscas.FieldByName('data_def_classe').AsDateTime <> Date then
          Application.MessageBox('Data da última definição de classes de clientes desatualizada!', 'Atenção', 0 + 64);

      controlesconfigurados(buscas);   

      vsqlPontosFaixaValor := ' select pd.tipo, ' +
        ' sum(coalesce(pd.valor_total, 0) + ' +
        '     coalesce((select coalesce(dp.valor_dev, 0) from devolucao_nped (pd.nped, pd.tipo, pd.cod_empresa) dp), 0) + ' +
        '	  coalesce((select coalesce(valor_vale, 0) from existe_formas (pd.nped, pd.tipo, pd.cod_empresa)), 0)	) valor_total, ' +
        ' count(*) qtde_total from pedvenda pd ' +
        ' inner join tipo_vendas tv on pd.tipo = tv.tipo and ((pd.tipv = tv.sigla) or (pd.tipo_os = tv.tipo_os)) ' +
        '		and tv.venda = ''S'' and tv.gerar_pontos = ''S'' ' +
        ' inner join clientes cl on pd.cod_cliente = cl.cod_cliente and pd.cod_empresa = cl.cod_empresa ' +
        ' left join tipo_faturamento tf on tf.codigo_faturamento = cl.codigo_faturamento and tf.ativo = 1 ' +
        ' where trim(pd.tipo) in (''REQ'', ''OS'') and coalesce(pd.status_ped, '''') = ''FECHADA'' ' +
        ' and pd.data_fech >= :dtini and pd.data_fech <= :dtfim and pd.cod_empresa = :cod_empresa ' +
        ' and (coalesce(pd.valor_total, 0) + ' +
        '     coalesce((select coalesce(dp.valor_dev, 0) from devolucao_nped (pd.nped, pd.tipo, pd.cod_empresa) dp), 0) + ' +
        '     coalesce((select coalesce(valor_vale, 0) from existe_formas (pd.nped, pd.tipo, pd.cod_empresa)), 0)) ' +
        '     >= :valorini ' +
        ' and (coalesce(pd.valor_total, 0) + ' +
        '     coalesce((select coalesce(dp.valor_dev, 0) from devolucao_nped (pd.nped, pd.tipo, pd.cod_empresa) dp), 0) + ' +
        '	  coalesce((select coalesce(valor_vale, 0) from existe_formas (pd.nped, pd.tipo, pd.cod_empresa)), 0)) ' +
        '    <= :valorfim ' +
        ' and coalesce(cl.cl_gerar_pontos, ''S'') <> ''N'' ' +
        ' and coalesce(tf.status_f, '''') <> ''BARRADO'' ' +
        ' and ((case when ((coalesce((select ndoc from existe_formas(pd.nped, pd.tipo, pd.cod_empresa)), 0)) > 0) then 1 else 0 end) > 0) ' +
        ' and pd.cod_cliente <> :cod_cliente ' +
        ' and pd.valor_total > abs(coalesce((select coalesce(valor_vale, 0) from existe_formas (pd.nped, pd.tipo, pd.cod_empresa)), 0))  ' +
        ' group by 1 ' +
        ' union ' +
        ' select ''MOT'' as tipo, ' +
        ' sum(case when (select ndev from existe_dev_nf_v(cf.cod_nf, cf.cod_empresa)) > 0 then 0 ' +
        '     else (coalesce(cf.valor_real, 0) + ' +
        '			  coalesce((select coalesce(valor_vale, 0) from existe_formas (cf.n_comando, ''MOT'', cf.cod_empresa)), 0)) ' +
        ' end) as valor_total, ' +
        ' count(*) qtde_total from com_fat cf ' +
        ' inner join tipo_vendas tv on tv.tipo = ''VEI'' and tv.tipo_os = cf.tipo_v ' +
        '		and tv.venda = ''S'' and tv.gerar_pontos = ''S'' ' +
        ' inner join clientes cl on cf.clientes_v = cl.cod_cliente and cf.cod_empresa = cl.cod_empresa ' +
        ' left join tipo_faturamento tf on tf.codigo_faturamento = cl.codigo_faturamento and tf.ativo = 1 ' +
        ' where cf.status_v = ''FECHADO'' and cf.natureza = ''S'' ' +
        ' and cf.data_fech >= :dtini and cf.data_fech <= :dtfim and cf.cod_empresa = :cod_empresa ' +    
        ' and (case when (select ndev from existe_dev_nf_v(cf.cod_nf, cf.cod_empresa)) > 0 then 0 ' +
        '   	else (coalesce(cf.valor_real, 0) + ' +
        '				coalesce((select coalesce(valor_vale, 0) from existe_formas (cf.n_comando, ''MOT'', cf.cod_empresa)), 0)) ' +
        ' end) >= :valorini ' +
        ' and (case when (select ndev from existe_dev_nf_v(cf.cod_nf, cf.cod_empresa)) > 0 then 0 ' +
        '     	else (coalesce(cf.valor_real, 0) + ' +
        '				coalesce((select coalesce(valor_vale, 0) from existe_formas (cf.n_comando, ''MOT'', cf.cod_empresa)), 0)) ' +
        ' end) <= :valorfim ' +
        ' and coalesce(cl.cl_gerar_pontos, ''S'') <> ''N'' ' +
        ' and coalesce(tf.status_f, '''') <> ''BARRADO'' ' +
        ' and ((case when ((coalesce((select ndoc from existe_formas(cf.n_comando, ''MOT'', cf.cod_empresa)), 0)) > 0) then 1 else 0 end) > 0) ' +
        ' and cf.clientes_v <> :cod_cliente ' +
        ' and cf.valtot_v > abs(coalesce((select coalesce(valor_vale, 0) from existe_formas (cf.n_comando, ''MOT'', cf.cod_empresa)), 0)) ' +
        ' group by 1 ' +
        ' union ' +
        ' select ''DEVA'' tipo, ' +
        ' sum(-1 * case when (coalesce(dev.valor_tot, 0) > 0) then coalesce(dev.valor_tot, 0) else (coalesce(dev.quant, 0) * coalesce(dev.valor, 0)) end) as valor_total, ' +
        ' sum(-1) quant_dev from devolucao dev ' +
        ' inner join clientes cl on cl.cod_cliente = dev.cod_cliente and cl.cod_empresa = dev.cod_empresa ' +
        ' left join tipo_faturamento tf on tf.codigo_faturamento = cl.codigo_faturamento and tf.ativo = 1 ' +
        ' where dev.data >= :dtini and dev.data <= :dtfim and dev.cod_empresa = :cod_empresa ' +
        ' and coalesce(cl.cl_gerar_pontos, ''S'') <> ''N'' ' +
        ' and coalesce(tf.status_f, '''') <> ''BARRADO'' ' +
        ' and not((coalesce(dev.cod_venda, 0) > 0) and (dev.tipo_venda in (''REQ'', ''OS''))) ' +
        ' and coalesce(dev.quant * dev.valor, 0) >= :valorini ' +
        ' and coalesce(dev.quant * dev.valor, 0) <= :valorfim ' +
        ' and dev.cod_cliente <> :cod_cliente ' +
        ' group by 1 ' +
        ' union ' +
        ' select ''DEVA'' as tipo, ' +
        ' sum(coalesce(-1 * nfi2.valor_total, 0)), ' +
        ' sum(-1) qtde ' +
        ' from notafiscal nf2 ' +
        ' inner join clientes cl on nf2.cod_cliente = cl.cod_cliente and nf2.cod_empresa = cl.cod_empresa ' +
        ' left join tipo_faturamento tf on tf.codigo_faturamento = cl.codigo_faturamento and tf.ativo = 1 ' +
        ' inner join notafiscal_item nfi2 on nfi2.cod_nf = nf2.cod_nf and nfi2.cod_empresa = nf2.cod_empresa ' +
        ' where coalesce(nfi2.cod_nf_dev, 0) <= 0 ' +
        ' and nf2.tipo_nf = ''V'' and nf2.natureza_nf = ''E'' and nf2.devolucao = ''SIM'' ' +
        ' and nf2.emissao_propria = ''S'' and nf2.status = ''Fechada'' and nf2.situacao_nfe = ''Autorizada'' ' +
        ' and nf2.data_lanc >= :dtini and nf2.data_lanc <= :dtfim ' +
        ' and nf2.cod_empresa = :cod_empresa ' +
        ' and nfi2.valor_total >= :valorini and nfi2.valor_total <= :valorfim ' +
        ' and coalesce(cl.cl_gerar_pontos, ''S'') <> ''N'' ' +
        ' and coalesce(tf.status_f, '''') <> ''BARRADO'' ' +
        ' and nf2.cod_cliente <> :cod_cliente ' +
        ' group by 1 ' +
        ' union ' +
        ' select ''DEVA'' as tipo, ' +
        ' sum(coalesce(-1 * nfi2.valor_total, 0)), ' +
        ' sum(-1) qtde ' +
        ' from notafiscal nf2 ' +
        ' inner join clientes cl on nf2.cod_cliente = cl.cod_cliente and nf2.cod_empresa = cl.cod_empresa ' +
        ' left join tipo_faturamento tf on tf.codigo_faturamento = cl.codigo_faturamento and tf.ativo = 1 ' +
        ' inner join notafiscal_item nfi2 on nfi2.cod_nf = nf2.cod_nf and nfi2.cod_empresa = nf2.cod_empresa ' +
        ' where coalesce(nfi2.cod_nf_dev, 0) <= 0 ' +
        ' and nf2.tipo_nf = ''V'' and nf2.natureza_nf = ''E'' and nf2.devolucao = ''SIM'' ' +
        ' and nf2.emissao_propria = ''N'' and nf2.status = ''Fechada'' ' +
        ' and nf2.data_lanc >= :dtini and nf2.data_lanc <= :dtfim ' +
        ' and nf2.cod_empresa = :cod_empresa ' +
        ' and nfi2.valor_total >= :valorini and nfi2.valor_total <= :valorfim ' +
        ' and coalesce(cl.cl_gerar_pontos, ''S'') <> ''N'' ' +
        ' and coalesce(tf.status_f, '''') <> ''BARRADO'' ' +
        ' and nf2.cod_cliente <> :cod_cliente ' +
        ' group by 1 ';

      buscas.Close;
      buscas.SQL.Text :=
        ' select pd.tipo, ' +
        ' sum(coalesce(pd.valor_total, 0)) valor_total, ' +
        ' count(*) qtde_total from pedvenda pd ' +
        ' inner join clientes cl on cl.cod_cliente = pd.cod_cliente and cl.cod_empresa = pd.cod_empresa ' +
        ' inner join tipo_vendas tv on pd.tipo = tv.tipo and ((pd.tipv = tv.sigla) or (pd.tipo_os = tv.tipo_os)) ' +
        ' 	and tv.venda = ''S'' and tv.gerar_pontos = ''S'' ' +
        ' where trim(pd.tipo) in (''REQ'', ''OS'') and coalesce(pd.status_ped, '''') = ''FECHADA'' ' +
        ' and pd.data_fech >= :dtini and pd.data_fech <= :dtfim and pd.cod_empresa = :cod_empresa ' +
        ' group by 1 ' +
        ' union ' +
        ' select ''MOT'' as tipo, ' +
        ' sum(coalesce(cf.valor_real, 0)) as valor_total, ' +
        ' count(*) qtde_total from com_fat cf ' +
        ' inner join clientes cl on cl.cod_cliente = cf.clientes_v and cl.cod_empresa = cf.cod_empresa ' +
        ' inner join tipo_vendas tv on tv.tipo = ''VEI'' and tv.tipo_os = cf.tipo_v ' +
        ' 	and tv.venda = ''S'' and tv.gerar_pontos = ''S'' ' +
        ' where cf.status_v = ''FECHADO'' and cf.natureza = ''S'' ' +
        ' and cf.data_fech >= :dtini and cf.data_fech <= :dtfim and cf.cod_empresa = :cod_empresa ' +
        ' group by 1 ' +
        ' union ' +
        ' select ''VALE''||pd.tipo, ' +
        ' sum(coalesce((select coalesce(valor_vale, 0) from existe_formas (pd.nped, pd.tipo, pd.cod_empresa)), 0)) valor_total, ' +
        ' sum(case when (coalesce((select coalesce(valor_vale, 0) from existe_formas (pd.nped, pd.tipo, pd.cod_empresa)), 0) <> 0) then -1 else 0 end) qtde_total ' +
        '  from pedvenda pd ' +
        ' inner join clientes cl on cl.cod_cliente = pd.cod_cliente and cl.cod_empresa = pd.cod_empresa ' +
        ' inner join tipo_vendas tv on pd.tipo = tv.tipo and ((pd.tipv = tv.sigla) or (pd.tipo_os = tv.tipo_os)) ' +
        ' 	and tv.venda = ''S'' and tv.gerar_pontos = ''S'' ' +
        ' where trim(pd.tipo) in (''REQ'', ''OS'') and coalesce(pd.status_ped, '''') = ''FECHADA'' ' +
        ' and pd.data_fech >= :dtini and pd.data_fech <= :dtfim and pd.cod_empresa = :cod_empresa ' +
        ' group by 1 ' +
        ' union ' +
        ' select ''VALEMOT'' as tipo, ' +
        ' sum(coalesce((select coalesce(valor_vale, 0) from existe_formas (cf.n_comando, ''MOT'', cf.cod_empresa)), 0)) as valor_total, ' +
        ' sum(case when (coalesce((select coalesce(valor_vale, 0) from existe_formas (cf.n_comando, ''MOT'', cf.cod_empresa)), 0) <> 0) then -1 else 0 end) qtde_total from com_fat cf ' +
        ' inner join clientes cl on cl.cod_cliente = cf.clientes_v and cl.cod_empresa = cf.cod_empresa ' +
        ' inner join tipo_vendas tv on tv.tipo = ''VEI'' and tv.tipo_os = cf.tipo_v ' +
        ' 	and tv.venda = ''S'' and tv.gerar_pontos = ''S'' ' +
        ' where cf.status_v = ''FECHADO'' and cf.natureza = ''S'' ' +
        ' and cf.data_fech >= :dtini and cf.data_fech <= :dtfim and cf.cod_empresa = :cod_empresa ' +
        ' group by 1 ' +
        ' union ' +
        ' select ''DEV'' tipo, ' +
        ' sum(coalesce((select coalesce(dp.valor_dev, 0) from devolucao_nped (pd.nped, pd.tipo, pd.cod_empresa) dp), 0)) valor_total, ' +
        ' sum(coalesce((select coalesce(-1 * dp.quant_dev, 0) from devolucao_nped (pd.nped, pd.tipo, pd.cod_empresa) dp), 0)) qtde_total from pedvenda pd ' +
        ' inner join clientes cl on cl.cod_cliente = pd.cod_cliente and cl.cod_empresa = pd.cod_empresa ' +
        ' inner join tipo_vendas tv on pd.tipo = tv.tipo and ((pd.tipv = tv.sigla) or (pd.tipo_os = tv.tipo_os)) ' +
        ' 	and tv.venda = ''S'' and tv.gerar_pontos = ''S'' ' +
        ' where trim(pd.tipo) in (''REQ'', ''OS'') and coalesce(pd.status_ped, '''') = ''FECHADA'' ' +
        ' and pd.data_fech >= :dtini and pd.data_fech <= :dtfim and pd.cod_empresa = :cod_empresa ' +
        ' group by 1 ' +
        ' union ' +
        ' select ''DEV'' as tipo, ' +
        ' sum(case when (select ndev from existe_dev_nf_v(cf.cod_nf, cf.cod_empresa)) > 0 then ' +
        '    (coalesce(-1 * cf.valor_real, 0)) ' +
        ' else ' +
        '	0 ' +
        ' end) as valor_total, ' +
        ' sum(case when (select ndev from existe_dev_nf_v(cf.cod_nf, cf.cod_empresa)) > 0 then -1 else 0 end) qtde_total from com_fat cf ' +
        ' inner join clientes cl on cl.cod_cliente = cf.clientes_v and cl.cod_empresa = cf.cod_empresa ' +
        ' inner join tipo_vendas tv on tv.tipo = ''VEI'' and tv.tipo_os = cf.tipo_v ' +
        ' 	and tv.venda = ''S'' and tv.gerar_pontos = ''S'' ' +
        ' where cf.status_v = ''FECHADO'' and cf.natureza = ''S'' ' +
        ' and cf.data_fech >= :dtini and cf.data_fech <= :dtfim and cf.cod_empresa = :cod_empresa ' +
        ' group by 1 ' +
        ' union ' +
        ' select ''DEVA'' tipo, ' +
        ' sum(-1 * case when (coalesce(dev.valor_tot, 0) > 0) then coalesce(dev.valor_tot, 0) else (coalesce(dev.quant, 0) * coalesce(dev.valor, 0)) end) as valor_total, ' +
        ' sum(-1) quant_dev from devolucao dev ' +
        ' inner join clientes cl on cl.cod_cliente = dev.cod_cliente and cl.cod_empresa = dev.cod_empresa ' +
        ' where dev.data >= :dtini and dev.data <= :dtfim and dev.cod_empresa = :cod_empresa ' +
        ' and not((coalesce(dev.cod_venda, 0) > 0) and (dev.tipo_venda in (''REQ'', ''OS''))) ' +
        ' group by 1 ' +
        ' union ' +
        ' select ''DEVA'' as tipo, ' +
        ' sum(coalesce(-1 * nfi2.valor_total, 0)), sum(-1) qtde from notafiscal nf2 ' +
        ' inner join clientes cl on cl.cod_cliente = nf2.cod_cliente and cl.cod_empresa = nf2.cod_empresa ' +
        ' inner join notafiscal_item nfi2 on nfi2.cod_nf = nf2.cod_nf and nfi2.cod_empresa = nf2.cod_empresa ' +
        ' where coalesce(nfi2.cod_nf_dev, 0) <= 0 ' +
        ' and nf2.tipo_nf = ''V'' and nf2.natureza_nf = ''E'' and nf2.devolucao = ''SIM'' ' +
        ' and nf2.emissao_propria = ''S'' and nf2.status = ''Fechada'' and nf2.situacao_nfe = ''Autorizada'' ' +
        ' and nf2.data_lanc >= :dtini and nf2.data_lanc <= :dtfim and nf2.cod_empresa = :cod_empresa ' +
        ' group by 1 ' +
        ' union ' +
        ' select ''DEVA'' as tipo, ' +
        ' sum(coalesce(-1 * nfi2.valor_total, 0)), sum(-1) qtde from notafiscal nf2 ' +
        ' inner join clientes cl on cl.cod_cliente = nf2.cod_cliente and cl.cod_empresa = nf2.cod_empresa ' +
        ' inner join notafiscal_item nfi2 on nfi2.cod_nf = nf2.cod_nf and nfi2.cod_empresa = nf2.cod_empresa ' +
        ' where coalesce(nfi2.cod_nf_dev, 0) <= 0 ' +
        ' and nf2.tipo_nf = ''V'' and nf2.natureza_nf = ''E'' and nf2.devolucao = ''SIM'' ' +
        ' and nf2.emissao_propria = ''N'' and nf2.status = ''Fechada'' ' +
        ' and nf2.data_lanc >= :dtini and nf2.data_lanc <= :dtfim and nf2.cod_empresa = :cod_empresa ' +
        ' group by 1 ';
      buscas.ParamByName('dtini').AsString := pdataini;
      buscas.ParamByName('dtfim').AsString := pdatafim;
      buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
      buscas.Open;
      buscas.FetchAll;

      vTaxaConversao := 0;
      vValorDesp := 0;
      vTotPontosG := 0;

      vQtdeVales := 0;
      vValorVales := 0;

      vQtdeFatVnd := 0;
      vValorFatVnd := 0;

      vQtdeFatDev := 0;
      vValorFatDev := 0;

      vValorFat := 0;

      vFocoResumo := vDadosIni.IfThen(fTempFatP.IsEmpty, false, true);

      fTempFatP.EmptyDataSet;
      fTempFaixaPontosValor.EmptyDataSet;
      fTempAsseduidade.EmptyDataSet;
      fTempFaixaAsseduidade.EmptyDataSet;
      fTempFormaPag.EmptyDataSet;
      fTempFaixaCompra.EmptyDataSet;
      fTempRecPrest.EmptyDataSet;
      fTempFaixaProduto.EmptyDataSet;
      fTempFaixaGrupoProduto.EmptyDataSet;
      fTempFaixaSubGrupoProduto.EmptyDataSet;
      fTempFaixaMarcaProduto.EmptyDataSet;
      fTempFaixaKitProduto.EmptyDataSet;

      frmCadRegrasProgramaFidelidade.GroupBoxResumo.Caption := 'RESUMO';
      frmCadRegrasProgramaFidelidade.tsResumo.TabVisible := true;
      GridResumo.Cells[0, 0] := 'TIPO';
      GridResumo.Cells[1, 0] := 'PONTOS';
      GridResumo.ColWidths[0] := 700;
      GridResumo.ColWidths[1] := 100;

      frmCadRegrasProgramaFidelidade.PanelProg.Visible := buscas.RecordCount > 0;
      frmCadRegrasProgramaFidelidade.ProgressBar1.Min := 0;
      frmCadRegrasProgramaFidelidade.ProgressBar1.Max := buscas.RecordCount;
      frmCadRegrasProgramaFidelidade.ProgressBar1.Position := 0;

      frmCadRegrasProgramaFidelidade.Label79.Caption := IntToStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Position) +
        ' / ' + IntToStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Max);

      buscas.First;
      while not buscas.Eof do
      begin
        Application.ProcessMessages;

        fTempFatP.Insert;
        fTempFatP.FieldByName('tipo').AsString := buscas.FieldByName('tipo').AsString;
        if (trim(buscas.FieldByName('tipo').AsString) = 'VALEREQ')
        	or (trim(buscas.FieldByName('tipo').AsString) = 'VALEOS')
         or (trim(buscas.FieldByName('tipo').AsString) = 'VALEMOT') then
        begin
          fTempFatP.FieldByName('qtde_total_avulsas').AsFloat := buscas.FieldByName('qtde_total').AsFloat;
          fTempFatP.FieldByName('valor_total_avulsas').AsFloat := buscas.FieldByName('valor_total').AsFloat;
        end
        else if trim(buscas.FieldByName('tipo').AsString) = 'DEVA' then
        begin
          fTempFatP.FieldByName('qtde_total_deva').AsFloat := buscas.FieldByName('qtde_total').AsFloat;
          fTempFatP.FieldByName('valor_total_deva').AsFloat := buscas.FieldByName('valor_total').AsFloat;
        end
        else if trim(buscas.FieldByName('tipo').AsString) = 'DEV' then
        begin
          fTempFatP.FieldByName('qtde_total_dev').AsFloat := buscas.FieldByName('qtde_total').AsFloat;
          fTempFatP.FieldByName('valor_total_dev').AsFloat := buscas.FieldByName('valor_total').AsFloat;
        end
        else
        begin
          fTempFatP.FieldByName('qtde_total_vnd').AsFloat := buscas.FieldByName('qtde_total').AsFloat;
          fTempFatP.FieldByName('valor_total_vnd').AsFloat := buscas.FieldByName('valor_total').AsFloat;
        end;
        fTempFatP.FieldByName('valor_total').AsFloat := buscas.FieldByName('valor_total').AsFloat;
        fTempFatP.Post;

        if (trim(buscas.FieldByName('tipo').AsString) = 'VALEREQ')
        	or (trim(buscas.FieldByName('tipo').AsString) = 'VALEOS')
         or (trim(buscas.FieldByName('tipo').AsString) = 'VALEMOT') then
        begin
          vQtdeVales := vQtdeVales + buscas.FieldByName('qtde_total').AsFloat;
          vValorVales := vValorVales + buscas.FieldByName('valor_total').AsFloat;
        end
        else if trim(buscas.FieldByName('tipo').AsString) = 'DEVA' then
        begin
          vQtdeFatDeva := vQtdeFatDeva + buscas.FieldByName('qtde_total').AsFloat;
          vValorFatDeva := vValorFatDeva + buscas.FieldByName('valor_total').AsFloat;
        end
        else if trim(buscas.FieldByName('tipo').AsString) = 'DEV' then
        begin
          vQtdeFatDev := vQtdeFatDev + buscas.FieldByName('qtde_total').AsFloat;
          vValorFatDev := vValorFatDev + buscas.FieldByName('valor_total').AsFloat;
        end
        else
        begin
          vQtdeFatVnd := vQtdeFatVnd + buscas.FieldByName('qtde_total').AsFloat;
          vValorFatVnd := vValorFatVnd + buscas.FieldByName('valor_total').AsFloat;
        end;
        vValorFat := vValorFat + buscas.FieldByName('valor_total').AsFloat;

        frmCadRegrasProgramaFidelidade.Label79.Caption := IntToStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Position) +
          ' / ' + IntToStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Max);
        frmCadRegrasProgramaFidelidade.ProgressBar1.Position := frmCadRegrasProgramaFidelidade.ProgressBar1.Position + 1;
        
        buscas.Next;
      end;

      frmCadRegrasProgramaFidelidade.LabelQtdVndP.Caption := FormatFloat('#0', vQtdeFatVnd);
      frmCadRegrasProgramaFidelidade.LabelFatVndP.Caption := FormatFloat('#,##0.00', vValorFatVnd);

      frmCadRegrasProgramaFidelidade.LabelQtdDevP.Caption := FormatFloat('#0', Abs(vQtdeFatDev));
      frmCadRegrasProgramaFidelidade.LabelFatDevP.Caption := FormatFloat('#,##0.00', vValorFatDev);

      frmCadRegrasProgramaFidelidade.LabelQtdDevAvulsasP.Caption := FormatFloat('#0', Abs(vQtdeFatDeva));
      frmCadRegrasProgramaFidelidade.LabelFatDevAvulsasP.Caption := FormatFloat('#,##0.00', vValorFatDeva);

      frmCadRegrasProgramaFidelidade.LabelQtdVales.Caption := FormatFloat('#0', Abs(vQtdeVales));
      frmCadRegrasProgramaFidelidade.LabelFatVales.Caption := FormatFloat('#,##0.00', vValorVales);

      frmCadRegrasProgramaFidelidade.LabelFatP.Caption := FormatFloat('#,##0.00', vValorFat);
      frmCadRegrasProgramaFidelidade.LabelTotPontosG.Caption:= FormatFloat('#,##0', Round(vTotPontosG));

      vValorTemp := 0;
      vQtdTemp := 0;
      vValorTempTot := 0;
      vQtdTempTot := 0;
      vPercTempTotal := 0;
      vPontosTempTotal := 0;

      //Pontos por valor
      // Verificar se regra existe
      if verificarRegra('FAIXA DE PONTOS POR VALOR', buscas2) then
      begin
        frmCadRegrasProgramaFidelidade.tsFaixaPontosValor.Caption := buscas2.FieldByName('descricao_regra').AsString;
        frmCadRegrasProgramaFidelidade.GroupBoxFaixaPontosPorValor.Caption := buscas2.FieldByName('descricao_regra').AsString;

        vDadosIni.abreStatusProcessamento('', 'CLASSE ' + buscas2.FieldByName('descricao_regra').AsString);
    //    Inc(I);
    //    GridResumo.Cells[0, I] := 'CLASSE ' + buscas2.FieldByName('descricao_regra').AsString;

        buscas2.First;
        while not buscas2.Eof do
        begin
          fTempFaixaPontosValor.Insert;
          fTempFaixaPontosValor.FieldByName('cod_tp_regra').AsInteger := buscas2.FieldByName('cod_tp_regra').AsInteger;
          fTempFaixaPontosValor.FieldByName('descricao_config').AsString := trim(buscas2.FieldByName('descricao_config').AsString);
          fTempFaixaPontosValor.FieldByName('valor_f_ini').AsFloat := buscas2.FieldByName('valor_f_ini').AsFloat;
          fTempFaixaPontosValor.FieldByName('valor_f_fim').AsFloat := buscas2.FieldByName('valor_f_fim').AsFloat;
          fTempFaixaPontosValor.FieldByName('perc_dia_real').AsFloat := buscas2.FieldByName('perc_dia_real').AsFloat;
          fTempFaixaPontosValor.FieldByName('pontos').AsFloat := buscas2.FieldByName('pontos').AsFloat;
          fTempFaixaPontosValor.FieldByName('qtde_total').AsFloat := 0;
          fTempFaixaPontosValor.FieldByName('valor_total').AsFloat := 0;
          fTempFaixaPontosValor.FieldByName('perc').AsFloat := 0;
          fTempFaixaPontosValor.Post;

          buscas2.Next;
        end;
        fTempFaixaPontosValor.IndexFieldNames := 'valor_f_ini;valor_f_fim;';


        frmCadRegrasProgramaFidelidade.ProgressBar1.Min := 0;
        frmCadRegrasProgramaFidelidade.ProgressBar1.Max := fTempFaixaPontosValor.RecordCount;
        frmCadRegrasProgramaFidelidade.ProgressBar1.Position := 0;

        frmCadRegrasProgramaFidelidade.Label79.Caption := IntToStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Position) +
          ' / ' + IntToStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Max);

        fTempFaixaPontosValor.First;
        while not fTempFaixaPontosValor.Eof do
        begin
          Application.ProcessMessages;

          buscas.Close;
          buscas.SQL.Text := vsqlPontosFaixaValor;
          buscas.ParamByName('dtini').AsString := pdataini;
          buscas.ParamByName('dtfim').AsString := pdatafim;
          buscas.ParamByName('cod_cliente').AsInteger := StrToInt(vDadosIni.vCliente.vCodClientePadrao);
          buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
          buscas.ParamByName('valorini').AsFloat := fTempFaixaPontosValor.FieldByName('valor_f_ini').AsFloat;
          buscas.ParamByName('valorfim').AsFloat := fTempFaixaPontosValor.FieldByName('valor_f_fim').AsFloat;
          buscas.Open;
          buscas.FetchAll;

          vValorTemp := 0;
          vQtdTemp := 0;

          buscas.First;
          while not buscas.Eof do
          begin
            vValorTemp := vValorTemp + buscas.FieldByName('valor_total').AsFloat;
            vQtdTemp := vQtdTemp + buscas.FieldByName('qtde_total').AsFloat;

            vValorTempTot := vValorTempTot + buscas.FieldByName('valor_total').AsFloat;
            vQtdTempTot := vQtdTempTot + buscas.FieldByName('qtde_total').AsFloat;

            buscas.Next;
          end;
          fTempFaixaPontosValor.Edit;
          fTempFaixaPontosValor.FieldByName('valor_total').AsFloat := fTempFaixaPontosValor.FieldByName('valor_total').AsFloat +
             vValorTemp;
          fTempFaixaPontosValor.FieldByName('qtde_total').AsFloat := fTempFaixaPontosValor.FieldByName('qtde_total').AsFloat +
             vQtdTemp;
          fTempFaixaPontosValor.Post;

          fTempFaixaPontosValor.Next;

          frmCadRegrasProgramaFidelidade.Label79.Caption := IntToStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Position) +
            ' / ' + IntToStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Max);
          frmCadRegrasProgramaFidelidade.ProgressBar1.Position := frmCadRegrasProgramaFidelidade.ProgressBar1.Position + 1;
        end;

        fTempFaixaPontosValor.First;
        while not fTempFaixaPontosValor.Eof do
        begin
          fTempFaixaPontosValor.Edit;
          fTempFaixaPontosValor.FieldByName('perc').AsFloat :=
            vDadosIni.IfThen(vValorTempTot > 0,
              (fTempFaixaPontosValor.FieldByName('valor_total').AsFloat / vValorTempTot) * 100, 0);
          fTempFaixaPontosValor.FieldByName('tot_pontos').AsFloat :=
             fTempFaixaPontosValor.FieldByName('valor_total').AsFloat * fTempFaixaPontosValor.FieldByName('pontos').AsFloat;

          vPercTempTotal := vPercTempTotal + fTempFaixaPontosValor.FieldByName('perc').AsFloat;
          vPontosTempTotal := vPontosTempTotal + fTempFaixaPontosValor.FieldByName('tot_pontos').AsFloat;

          fTempFaixaPontosValor.Post;

          if pDet then
          begin
           Inc(I);
           GridResumo.Cells[0, I] := {IntToStr(fTempFaixaPontosValor.FieldByName('cod_tp_regra').AsInteger) + ' - ' +}
             fTempFaixaPontosValor.FieldByName('descricao_config').AsString;
           GridResumo.Cells[1, I] := FormatFloat('#,##0.00', fTempFaixaPontosValor.FieldByName('tot_pontos').AsFloat);
           GridResumo.RowCount := I + 1;
          end;

          fTempFaixaPontosValor.Next;
        end;

        fTempFaixaPontosValor.First;
        Inc(I);
        GridResumo.Cells[0, I] := {IntToStr(buscas2.FieldByName('cod_tp_regra').AsInteger) + ' - }'TOTAL CLASSE ' +
          buscas2.FieldByName('descricao_regra').AsString;
        GridResumo.Cells[1, I] := FormatFloat('#,##0.00', vPontosTempTotal);
        GridResumo.RowCount := I + 1;
      end;
      frmCadRegrasProgramaFidelidade.DBGridFaixaPontosPorValor.DataSource := fTempFaixaPontosValorDtSource;
      frmCadRegrasProgramaFidelidade.tsFaixaPontosValor.TabVisible := not fTempFaixaPontosValor.IsEmpty;
      frmCadRegrasProgramaFidelidade.LabelPercTotFaixaPontosValor.Caption := FormatFloat('#,##0.00', vPercTempTotal);
      frmCadRegrasProgramaFidelidade.LabelValorTotalFaixaPontosValor.Caption := FormatFloat('#,##0.00', vValorTempTot);
      frmCadRegrasProgramaFidelidade.LabelPontosTotalFaixaPontosValor.Caption := FormatFloat('#,##0.00', vPontosTempTotal);
      vTotPontosG := vTotPontosG + vPontosTempTotal;

      vValorTemp := 0;
      vQtdTemp := 0;
      vValorTempTot := 0;
      vQtdTempTot := 0;
      vPercTempTotal := 0;
      vPontosTempTotal := 0;

      //Asseduidade
      // Verificar se regra existe
      if verificarRegra('ASSIDUIDADE', buscas2) then
      begin
        frmCadRegrasProgramaFidelidade.tsAsseduidade.Caption := buscas2.FieldByName('descricao_regra').AsString;
        frmCadRegrasProgramaFidelidade.GroupBoxAssiduidade.Caption := buscas2.FieldByName('descricao_regra').AsString;

        vDadosIni.abreStatusProcessamento('', 'CLASSE ' + buscas2.FieldByName('descricao_regra').AsString);
    //    Inc(I);
    //    GridResumo.Cells[0, I] := 'CLASSE ' + buscas2.FieldByName('descricao_regra').AsString;

        buscas2.First;
        while not buscas2.Eof do
        begin
          fTempAsseduidade.Insert;
          fTempAsseduidade.FieldByName('cod_tp_regra').AsInteger := buscas2.FieldByName('cod_tp_regra').AsInteger;
          fTempAsseduidade.FieldByName('descricao_config').AsString := trim(buscas2.FieldByName('descricao_config').AsString);
          fTempAsseduidade.FieldByName('valor_vc').AsString := buscas2.FieldByName('valor_vc').AsString;
          fTempAsseduidade.FieldByName('pontos').AsFloat := buscas2.FieldByName('pontos').AsFloat;
          fTempAsseduidade.FieldByName('valor_total').AsFloat := 0;
          fTempAsseduidade.FieldByName('perc').AsFloat := 0;
          fTempAsseduidade.FieldByName('qtde_total').AsFloat := 0;
          fTempAsseduidade.Post;

          buscas2.Next;
        end;

        try
          buscas.Close;
          buscas.SQL.Text := ' select pd.tipo, ' +
             ' case when (pd.cl_clultimacompra is not null) then pd.cl_clultimacompra ' +
             '      when (cl.clultimacompra is not null) then cl.clultimacompra ' +
             '     else ''T4'' end clultimacompra, ' +
             ' sum(coalesce(pd.valor_total, 0) + ' +
             '     coalesce((select coalesce(dp.valor_dev, 0) from devolucao_nped (pd.nped, pd.tipo, pd.cod_empresa) dp), 0) + ' +
             '	    coalesce((select coalesce(valor_vale, 0) from existe_formas (pd.nped, pd.tipo, pd.cod_empresa)), 0) ) valor_total, ' +
             ' sum( ' +
             '     case when ((coalesce((select abs(coalesce(dp.valor_dev, 0)) from devolucao_nped (pd.nped, pd.tipo, pd.cod_empresa) dp), 0)) + ' +
             '				      (coalesce((select abs(coalesce(valor_vale, 0)) from existe_formas (pd.nped, pd.tipo, pd.cod_empresa)), 0))  >= ' +
             '         coalesce(pd.valor_total, 0)) then 0 ' +
             '     else 1 ' +
             ' end) qtde_total from pedvenda pd ' + 
             ' inner join clientes cl on cl.cod_cliente = pd.cod_cliente and cl.cod_empresa = pd.cod_empresa ' +
             ' left join tipo_faturamento tf on tf.codigo_faturamento = cl.codigo_faturamento and tf.ativo = 1 ' +
             ' inner join tipo_vendas tv on pd.tipo = tv.tipo and ((pd.tipv = tv.sigla) or (pd.tipo_os = tv.tipo_os)) ' +
             ' 		and tv.venda = ''S'' and tv.gerar_pontos = ''S'' ' +
             ' where trim(pd.tipo) in (''REQ'', ''OS'') and coalesce(pd.status_ped, '''') = ''FECHADA'' ' +
             ' and pd.data_fech >= :dtini and pd.data_fech <= :dtfim and pd.cod_empresa = :cod_empresa ' +
             ' and coalesce(cl.cl_gerar_pontos, ''S'') <> ''N'' ' +
		         ' and coalesce(tf.status_f, '''') <> ''BARRADO'' ' +
             ' and ((case when ((coalesce((select ndoc from existe_formas(pd.nped, pd.tipo, pd.cod_empresa)), 0)) > 0) then 1 else 0 end) > 0) ' +
             ' and pd.cod_cliente <> :cod_cliente ' +
             ' group by 1, 2 ' +
             ' union ' +
             ' select ''MOT'' as tipo, ' +
             ' case when (cf.cl_clultimacompra is not null) then cf.cl_clultimacompra ' +
             '      when (cl.clultimacompra is not null) then cl.clultimacompra ' +
             '      else ''T4'' end clultimacompra, ' +
             ' sum(case when (select ndev from existe_dev_nf_v(cf.cod_nf, cf.cod_empresa)) > 0 then 0 ' +
             '				when (coalesce((select abs(coalesce(valor_vale, 0)) from existe_formas (cf.n_comando, ''MOT'', cf.cod_empresa)), 0) >= coalesce(cf.valor_real, 0)) then 0 ' +
             '     		else coalesce(cf.valor_real, 0) + ' +
             '					coalesce((select coalesce(valor_vale, 0) from existe_formas (cf.n_comando, ''MOT'', cf.cod_empresa)), 0) ' +
             '     end) as valor_total, ' +
             ' sum(case when (select ndev from existe_dev_nf_v(cf.cod_nf, cf.cod_empresa)) > 0 then 0 ' +
             '     else 1 ' +
             '     end) as qtde_total ' +
             ' from com_fat cf ' +
             ' inner join clientes cl on cl.cod_cliente = cf.clientes_v and cl.cod_empresa = cf.cod_empresa ' +
             ' left join tipo_faturamento tf on tf.codigo_faturamento = cl.codigo_faturamento and tf.ativo = 1 ' +
             ' inner join tipo_vendas tv on tv.tipo = ''VEI'' and tv.tipo_os = cf.tipo_v ' +
             ' 		and tv.venda = ''S'' and tv.gerar_pontos = ''S'' ' +
             ' where cf.status_v = ''FECHADO'' and cf.natureza = ''S'' ' +
             ' and cf.data_fech >= :dtini and cf.data_fech <= :dtfim and cf.cod_empresa = :cod_empresa ' +
             ' and coalesce(cl.cl_gerar_pontos, ''S'') <> ''N'' ' +
		         ' and coalesce(tf.status_f, '''') <> ''BARRADO'' ' +
             ' and ((case when ((coalesce((select ndoc from existe_formas(cf.n_comando, ''MOT'', cf.cod_empresa)), 0)) > 0) then 1 else 0 end) > 0) ' +
             ' and cf.clientes_v <> :cod_cliente ' +
             ' group by 1, 2 ' +
             ' union ' +
             ' select ''DEVA'' tipo, ' +
             ' case when (dev.cl_clultimacompra is not null) then dev.cl_clultimacompra ' +
             '      when (cl.clultimacompra is not null) then cl.clultimacompra ' +
             '      else ''T4'' end clultimacompra, ' +
             ' sum(-1 * case when (coalesce(dev.valor_tot, 0) > 0) then coalesce(dev.valor_tot, 0) else (coalesce(dev.quant, 0) * coalesce(dev.valor, 0)) end) as valor_total, ' +
             ' sum(-1) quant_dev from devolucao dev ' +
             ' inner join clientes cl on cl.cod_cliente = dev.cod_cliente and cl.cod_empresa = dev.cod_empresa ' +
             ' left join tipo_faturamento tf on tf.codigo_faturamento = cl.codigo_faturamento and tf.ativo = 1 ' +
             ' where dev.data >= :dtini and dev.data <= :dtfim and dev.cod_empresa = :cod_empresa ' +
             ' and coalesce(cl.cl_gerar_pontos, ''S'') <> ''N'' ' +
		         ' and coalesce(tf.status_f, '''') <> ''BARRADO'' ' +
             ' and not((coalesce(dev.cod_venda, 0) > 0) and (dev.tipo_venda in (''REQ'', ''OS''))) ' +
             ' and dev.cod_cliente <> :cod_cliente ' +
             ' group by 1, 2 ' +
             ' union ' +
             ' select ''DEVA'' as tipo, ' +
             ' case when (nf2.cl_clultimacompra is not null) then nf2.cl_clultimacompra ' +
             '      when (cl.clultimacompra is not null) then cl.clultimacompra ' +
             '      else ''T4'' end clultimacompra, ' +
             ' sum(coalesce(-1 * nfi2.valor_total, 0)), sum(-1) qtde from notafiscal nf2 ' +
             ' inner join clientes cl on cl.cod_cliente = nf2.cod_cliente and cl.cod_empresa = nf2.cod_empresa ' +
             ' left join tipo_faturamento tf on tf.codigo_faturamento = cl.codigo_faturamento and tf.ativo = 1 ' +
             ' inner join notafiscal_item nfi2 on nfi2.cod_nf = nf2.cod_nf and nfi2.cod_empresa = nf2.cod_empresa ' +
             ' where coalesce(nfi2.cod_nf_dev, 0) <= 0 ' +
             ' and nf2.tipo_nf = ''V'' and nf2.natureza_nf = ''E'' and nf2.devolucao = ''SIM'' ' +
             ' and nf2.emissao_propria = ''S'' and nf2.status = ''Fechada'' and nf2.situacao_nfe = ''Autorizada'' ' +
             ' and nf2.data_lanc >= :dtini and nf2.data_lanc <= :dtfim and nf2.cod_empresa = :cod_empresa ' +
             ' and coalesce(cl.cl_gerar_pontos, ''S'') <> ''N'' ' +
		         ' and coalesce(tf.status_f, '''') <> ''BARRADO'' ' +
             ' and nf2.cod_cliente <> :cod_cliente ' +
             ' group by 1, 2 ' +
             ' union ' +
             ' select ''DEVA'' as tipo, ' +
             ' case when (nf2.cl_clultimacompra is not null) then nf2.cl_clultimacompra ' +
             '      when (cl.clultimacompra is not null) then cl.clultimacompra ' +
             '      else ''T4'' end clultimacompra, ' +
             ' sum(coalesce(-1 * nfi2.valor_total, 0)), sum(-1) qtde from notafiscal nf2 ' +
             ' inner join clientes cl on cl.cod_cliente = nf2.cod_cliente and cl.cod_empresa = nf2.cod_empresa ' +
             ' left join tipo_faturamento tf on tf.codigo_faturamento = cl.codigo_faturamento and tf.ativo = 1 ' +
             ' inner join notafiscal_item nfi2 on nfi2.cod_nf = nf2.cod_nf and nfi2.cod_empresa = nf2.cod_empresa ' +
             ' where coalesce(nfi2.cod_nf_dev, 0) <= 0 ' +
             ' and nf2.tipo_nf = ''V'' and nf2.natureza_nf = ''E'' and nf2.devolucao = ''SIM'' ' +
             ' and nf2.emissao_propria = ''N'' and nf2.status = ''Fechada'' ' +
             ' and nf2.data_lanc >= :dtini and nf2.data_lanc <= :dtfim and nf2.cod_empresa = :cod_empresa ' +
             ' and coalesce(cl.cl_gerar_pontos, ''S'') <> ''N'' ' +
	           ' and coalesce(tf.status_f, '''') <> ''BARRADO'' ' +
             ' and nf2.cod_cliente <> :cod_cliente ' +
             ' group by 1, 2 ';
          buscas.ParamByName('dtini').AsString := pdataini;
          buscas.ParamByName('dtfim').AsString := pdatafim;
          buscas.ParamByName('cod_cliente').AsInteger := StrToInt(vDadosIni.vCliente.vCodClientePadrao);
          buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
          buscas.Open;
          buscas.FetchAll;

          frmCadRegrasProgramaFidelidade.ProgressBar1.Min := 0;
          frmCadRegrasProgramaFidelidade.ProgressBar1.Max := buscas.RecordCount;
          frmCadRegrasProgramaFidelidade.ProgressBar1.Position := 0;
          
          frmCadRegrasProgramaFidelidade.Label79.Caption := IntToStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Position) +
            ' / ' + IntToStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Max);

          buscas.First;
          while not buscas.Eof do
          begin
            Application.ProcessMessages;

            fTempAsseduidade.Filtered := false;
            fTempAsseduidade.Filter := 'valor_vc = ' + QuotedStr(trim(buscas.FieldByName('clultimacompra').AsString));
            fTempAsseduidade.Filtered := true;

            if not fTempAsseduidade.IsEmpty then
            begin
              fTempAsseduidade.Edit;
              fTempAsseduidade.FieldByName('valor_total').AsFloat := fTempAsseduidade.FieldByName('valor_total').AsFloat +
                 buscas.FieldByName('valor_total').AsFloat;
              fTempAsseduidade.FieldByName('qtde_total').AsFloat := fTempAsseduidade.FieldByName('qtde_total').AsFloat +
                 buscas.FieldByName('qtde_total').AsFloat;
              fTempAsseduidade.Post;
            end;

            buscas.Next;

            frmCadRegrasProgramaFidelidade.Label79.Caption := IntToStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Position) +
              ' / ' + IntToStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Max);
            frmCadRegrasProgramaFidelidade.ProgressBar1.Position := frmCadRegrasProgramaFidelidade.ProgressBar1.Position + 1;
          end;
        finally
           fTempAsseduidade.Filtered := false;
           fTempAsseduidade.IndexFieldNames := 'valor_vc';
        end;

        fTempAsseduidade.First;
        while not fTempAsseduidade.Eof do
        begin
          fTempAsseduidade.Edit;
          fTempAsseduidade.FieldByName('perc').AsFloat :=
            vDadosIni.IfThen(vQtdeFatVnd > 0,
              (fTempAsseduidade.FieldByName('qtde_total').AsFloat / vQtdeFatVnd) * 100, 0);
          fTempAsseduidade.FieldByName('tot_pontos').AsFloat :=
             fTempAsseduidade.FieldByName('pontos').AsFloat * fTempAsseduidade.FieldByName('qtde_total').AsFloat;

          vQtdTempTot := vQtdTempTot + fTempAsseduidade.FieldByName('qtde_total').AsFloat;
          vPercTempTotal := vPercTempTotal + fTempAsseduidade.FieldByName('perc').AsFloat;
          vPontosTempTotal := vPontosTempTotal + fTempAsseduidade.FieldByName('tot_pontos').AsFloat;
          fTempAsseduidade.Post;

          if pDet then
          begin
           Inc(I);
           GridResumo.Cells[0, I] := {IntToStr(fTempAsseduidade.FieldByName('cod_tp_regra').AsInteger) + ' - ' +}
             fTempAsseduidade.FieldByName('descricao_config').AsString;
           GridResumo.Cells[1, I] := FormatFloat('#,##0.00', fTempAsseduidade.FieldByName('tot_pontos').AsFloat);
           GridResumo.RowCount := I + 1;
          end;

          fTempAsseduidade.Next;
        end;

        fTempAsseduidade.First;
        Inc(I);
        GridResumo.Cells[0, I] := {IntToStr(buscas2.FieldByName('cod_tp_regra').AsInteger) + ' - }'TOTAL CLASSE ' +
          buscas2.FieldByName('descricao_regra').AsString;
        GridResumo.Cells[1, I] := FormatFloat('#,##0.00', vPontosTempTotal);
        GridResumo.RowCount := I + 1;
      end;
      frmCadRegrasProgramaFidelidade.DBGridAssiduidade.DataSource := fTempAsseduidadeDtSource;
      frmCadRegrasProgramaFidelidade.tsAsseduidade.TabVisible := not fTempAsseduidade.IsEmpty;
      frmCadRegrasProgramaFidelidade.LabelPercTotAsseduidade.Caption := FormatFloat('#,##0.00', vPercTempTotal);
      frmCadRegrasProgramaFidelidade.LabelQtdeTotAsseduidade.Caption := FormatFloat('#0', vQtdTempTot);
      frmCadRegrasProgramaFidelidade.LabelPontosTotalAsseduidade.Caption := FormatFloat('#,##0.00', vPontosTempTotal);
      vTotPontosG := vTotPontosG + vPontosTempTotal;

      vValorTemp := 0;
      vQtdTemp := 0;
      vValorTempTot := 0;
      vQtdTempTot := 0;
      vPercTempTotal := 0;
      vPontosTempTotal := 0;
      //Faixa de Pontos por Assiduidade
      // Verificar se regra existe
      if verificarRegra('FAIXA DE PONTOS POR ASSIDUIDADE', buscas2) then
      begin
        frmCadRegrasProgramaFidelidade.tsFaixaAsseduidade.Caption := buscas2.FieldByName('descricao_regra').AsString;
        frmCadRegrasProgramaFidelidade.GroupBoxFaixaAssiduidade.Caption := buscas2.FieldByName('descricao_regra').AsString;

        vDadosIni.abreStatusProcessamento('', 'CLASSE ' + buscas2.FieldByName('descricao_regra').AsString);
    //    Inc(I);
    //    GridResumo.Cells[0, I] := 'CLASSE ' + buscas2.FieldByName('descricao_regra').AsString;

        buscas.Close;
        buscas.SQL.Text := ' select rf.cod_tp_regra, crf.descricao_config, crf.perc_dia_real, ' +
          ' crf.pontos, pd.tipo, ' +
          ' case when (pd.cl_clultimacompra is not null) then pd.cl_clultimacompra ' +
          '      when (cl.clultimacompra is not null) then cl.clultimacompra ' +
          '      else ''T4'' end clultimacompra, ' +
          ' sum(coalesce(pd.valor_total, 0) + ' +
          '		coalesce((select coalesce(dp.valor_dev, 0) from devolucao_nped (pd.nped, pd.tipo, pd.cod_empresa) dp), 0) + ' +
          '		coalesce((select coalesce(valor_vale, 0) from existe_formas (pd.nped, pd.tipo, pd.cod_empresa)), 0)	) valor_total, ' +
          ' count(*) qtde_total from pedvenda pd ' +
          ' inner join clientes cl on cl.cod_cliente = pd.cod_cliente and cl.cod_empresa = pd.cod_empresa ' +
          ' left join tipo_faturamento tf on tf.codigo_faturamento = cl.codigo_faturamento and tf.ativo = 1 ' +
          ' inner join tipo_vendas tv on pd.tipo = tv.tipo and ((pd.tipv = tv.sigla) or (pd.tipo_os = tv.tipo_os)) ' +
          ' 		and tv.venda = ''S'' and tv.gerar_pontos = ''S'' ' +
          ' inner join config_regras_prog_fidelidade crf on crf.valor_vc = ' +
          ' (case when (pd.cl_clultimacompra is not null) then pd.cl_clultimacompra ' +
          '       when (cl.clultimacompra is not null) then cl.clultimacompra ' +
          '       else ''T4'' end) and crf.cod_empresa = pd.cod_empresa ' +
          ' inner join regras_prog_fidelidade rf on rf.cod_tp_regra = crf.cod_tp_regra and rf.cod_empresa = crf.cod_empresa and rf.cod_tp_regra = :cod_tp_regra ' +
          ' where trim(pd.tipo) in (''REQ'', ''OS'') and coalesce(pd.status_ped, '''') = ''FECHADA'' ' +
          ' and pd.data_fech >= :dtini and pd.data_fech <= :dtfim and pd.cod_empresa = :cod_empresa ' +
          ' and coalesce(cl.cl_gerar_pontos, ''S'') <> ''N'' ' +
          ' and coalesce(tf.status_f, '''') <> ''BARRADO'' ' +
          ' and ((case when ((coalesce((select ndoc from existe_formas(pd.nped, pd.tipo, pd.cod_empresa)), 0)) > 0) then 1 else 0 end) > 0) ' +
          ' and pd.cod_cliente <> :cod_cliente ' +
          ' and pd.valor_total > abs(coalesce((select coalesce(valor_vale, 0) from existe_formas (pd.nped, pd.tipo, pd.cod_empresa)), 0)) ' +
          ' group by 1, 2, 3, 4, 5, 6 ' +
          ' union ' +
          ' select rf.cod_tp_regra, crf.descricao_config, crf.perc_dia_real, ' +
          ' crf.pontos, ''MOT'' as tipo, ' +
          ' case when (cf.cl_clultimacompra is not null) then cf.cl_clultimacompra ' +
          '      when (cl.clultimacompra is not null) then cl.clultimacompra ' +
          '      else ''T4'' end clultimacompra, ' +
          ' sum(case when (select ndev from existe_dev_nf_v(cf.cod_nf, cf.cod_empresa)) > 0 then 0 ' +
          '     else coalesce(cf.valor_real, 0) + ' +
          '		 coalesce((select coalesce(valor_vale, 0) from existe_formas (cf.n_comando, ''MOT'', cf.cod_empresa)), 0) ' +
          ' end) as valor_total, ' +
          ' count(*) qtde_total from com_fat cf ' +
          ' inner join clientes cl on cl.cod_cliente = cf.clientes_v and cl.cod_empresa = cf.cod_empresa ' +
          ' left join tipo_faturamento tf on tf.codigo_faturamento = cl.codigo_faturamento and tf.ativo = 1 ' +
          ' inner join tipo_vendas tv on tv.tipo = ''VEI'' and tv.tipo_os = cf.tipo_v ' +
          ' 		and tv.venda = ''S'' and tv.gerar_pontos = ''S'' ' +
          ' inner join config_regras_prog_fidelidade crf on crf.valor_vc = ' +
          ' (case when (cf.cl_clultimacompra is not null) then cf.cl_clultimacompra ' +
          '       when (cl.clultimacompra is not null) then cl.clultimacompra ' +
          '       else ''T4'' end) and crf.cod_empresa = cf.cod_empresa ' +
          ' inner join regras_prog_fidelidade rf on rf.cod_tp_regra = crf.cod_tp_regra and rf.cod_empresa = crf.cod_empresa and rf.cod_tp_regra = :cod_tp_regra ' +
          ' where cf.status_v = ''FECHADO'' and cf.natureza = ''S'' ' +
          ' and cf.data_fech >= :dtini and cf.data_fech <= :dtfim and cf.cod_empresa = :cod_empresa ' +
          ' and coalesce(cl.cl_gerar_pontos, ''S'') <> ''N'' ' +
          ' and coalesce(tf.status_f, '''') <> ''BARRADO'' ' +
          ' and ((case when ((coalesce((select ndoc from existe_formas(cf.n_comando, ''MOT'', cf.cod_empresa)), 0)) > 0) then 1 else 0 end) > 0) ' +
          ' and cf.clientes_v <> :cod_cliente ' +
          ' and cf.valtot_v > abs(coalesce((select coalesce(valor_vale, 0) from existe_formas (cf.n_comando, ''MOT'', cf.cod_empresa)), 0))  ' +
          ' group by 1, 2, 3, 4, 5, 6 ' +
          ' union ' +
          ' select rf.cod_tp_regra, crf.descricao_config, crf.perc_dia_real, ' +
          ' crf.pontos, ''DEVA'' tipo, ' +
          ' case when (dev.cl_clultimacompra is not null) then dev.cl_clultimacompra ' +
          '      when (cl.clultimacompra is not null) then cl.clultimacompra ' +
          '      else ''T4'' end clultimacompra, ' +
          ' sum((-1) * case when (coalesce(dev.valor_tot, 0) > 0) then coalesce(dev.valor_tot, 0) else (coalesce(dev.valor, 0) * coalesce(dev.quant, 0)) end) valor_total, ' +
          ' sum(-1) quant_dev from devolucao dev ' +
          ' inner join clientes cl on cl.cod_cliente = dev.cod_cliente and cl.cod_empresa = dev.cod_empresa ' +
          ' left join tipo_faturamento tf on tf.codigo_faturamento = cl.codigo_faturamento and tf.ativo = 1 ' +
          ' inner join config_regras_prog_fidelidade crf on crf.valor_vc = ' +
          ' (case when (dev.cl_clultimacompra is not null) then dev.cl_clultimacompra' +
          '       when (cl.clultimacompra is not null) then cl.clultimacompra ' +
          '       else ''T4'' end) and crf.cod_empresa = dev.cod_empresa ' +
          ' inner join regras_prog_fidelidade rf on rf.cod_tp_regra = crf.cod_tp_regra and rf.cod_empresa = crf.cod_empresa and rf.cod_tp_regra = :cod_tp_regra ' +
          ' where dev.data >= :dtini and dev.data <= :dtfim and dev.cod_empresa = :cod_empresa ' +
          ' and coalesce(cl.cl_gerar_pontos, ''S'') <> ''N'' ' +
          ' and coalesce(tf.status_f, '''') <> ''BARRADO'' ' +
          ' and not((coalesce(dev.cod_venda, 0) > 0) and (dev.tipo_venda in (''REQ'', ''OS''))) ' +
          ' and dev.cod_cliente <> :cod_cliente ' +
          ' group by 1, 2, 3, 4, 5, 6 ' +
          ' union ' +
          ' select rf.cod_tp_regra, crf.descricao_config, crf.perc_dia_real, ' +
          ' crf.pontos, ''DEVA'' as tipo, ' +
          ' case when (nf2.cl_clultimacompra is not null) then nf2.cl_clultimacompra ' +
          '      when (cl.clultimacompra is not null) then cl.clultimacompra ' +
          '      else ''T4'' end clultimacompra, ' +
          ' sum(coalesce(-1 * nfi2.valor_total, 0)), sum(-1) qtde from notafiscal nf2 ' +
          ' inner join clientes cl on cl.cod_cliente = nf2.cod_cliente and cl.cod_empresa = nf2.cod_empresa ' +
          ' left join tipo_faturamento tf on tf.codigo_faturamento = cl.codigo_faturamento and tf.ativo = 1 ' +
          ' inner join notafiscal_item nfi2 on nfi2.cod_nf = nf2.cod_nf and nfi2.cod_empresa = nf2.cod_empresa ' +
          ' inner join config_regras_prog_fidelidade crf on crf.valor_vc = ' +
          '     (case when (nf2.cl_clultimacompra is not null) then nf2.cl_clultimacompra ' +
          '           when (cl.clultimacompra is not null) then cl.clultimacompra ' +
          '           else ''T4'' end) and crf.cod_empresa = nf2.cod_empresa ' +
          ' inner join regras_prog_fidelidade rf on rf.cod_tp_regra = crf.cod_tp_regra and rf.cod_empresa = crf.cod_empresa and rf.cod_tp_regra = :cod_tp_regra ' +
          ' where coalesce(nfi2.cod_nf_dev, 0) <= 0 ' +
          ' and nf2.tipo_nf = ''V'' and nf2.natureza_nf = ''E'' and nf2.devolucao = ''SIM'' ' +
          ' and nf2.emissao_propria = ''S'' and nf2.status = ''Fechada'' and nf2.situacao_nfe = ''Autorizada'' ' +
          ' and nf2.data_lanc >= :dtini and nf2.data_lanc <= :dtfim and nf2.cod_empresa = :cod_empresa ' +
          ' and coalesce(cl.cl_gerar_pontos, ''S'') <> ''N'' ' +
          ' and coalesce(tf.status_f, '''') <> ''BARRADO'' ' +
          ' and nf2.cod_cliente <> :cod_cliente ' +
          ' group by 1, 2, 3, 4, 5, 6 ' +
          ' union ' +
          ' select rf.cod_tp_regra, crf.descricao_config, crf.perc_dia_real, ' +
          ' crf.pontos, ''DEVA'' as tipo, ' +
          ' case when (nf2.cl_clultimacompra is not null) then nf2.cl_clultimacompra ' +
          '      when (cl.clultimacompra is not null) then cl.clultimacompra ' +
          '      else ''T4'' end clultimacompra, ' +
          ' sum(coalesce(-1 * nfi2.valor_total, 0)), sum(-1) qtde from notafiscal nf2 ' +
          ' inner join clientes cl on cl.cod_cliente = nf2.cod_cliente and cl.cod_empresa = nf2.cod_empresa ' +
          ' left join tipo_faturamento tf on tf.codigo_faturamento = cl.codigo_faturamento and tf.ativo = 1 ' +
          ' inner join notafiscal_item nfi2 on nfi2.cod_nf = nf2.cod_nf and nfi2.cod_empresa = nf2.cod_empresa ' +
          ' inner join config_regras_prog_fidelidade crf on crf.valor_vc = ' +
          '     (case when (nf2.cl_clultimacompra is not null) then nf2.cl_clultimacompra ' +
          '           when (cl.clultimacompra is not null) then cl.clultimacompra ' +
          '           else ''T4'' end) and crf.cod_empresa = nf2.cod_empresa ' +
          ' inner join regras_prog_fidelidade rf on rf.cod_tp_regra = crf.cod_tp_regra and rf.cod_empresa = crf.cod_empresa and rf.cod_tp_regra = :cod_tp_regra ' +
          ' where coalesce(nfi2.cod_nf_dev, 0) <= 0 ' +
          ' and nf2.tipo_nf = ''V'' and nf2.natureza_nf = ''E'' and nf2.devolucao = ''SIM'' ' +
          ' and nf2.emissao_propria = ''N'' and nf2.status = ''Fechada'' ' +
          ' and nf2.data_lanc >= :dtini and nf2.data_lanc <= :dtfim and nf2.cod_empresa = :cod_empresa ' +
          ' and coalesce(cl.cl_gerar_pontos, ''S'') <> ''N'' ' +
          ' and coalesce(tf.status_f, '''') <> ''BARRADO'' ' +
          ' and nf2.cod_cliente <> :cod_cliente ' +
          ' group by 1, 2, 3, 4, 5, 6 ' +
          ' union ' +
          ' select rf.cod_tp_regra, crf.descricao_config, crf.perc_dia_real, crf.pontos, ' +
          ' '''' tipo, crf.valor_vc clultimacompra, 0 valor_total, 0 qtde_total  from regras_prog_fidelidade rf ' +
          ' inner join config_regras_prog_fidelidade crf on crf.cod_tp_regra = rf.cod_tp_regra and crf.cod_empresa = rf.cod_empresa ' +
          ' where rf.cod_tp_regra = :cod_tp_regra and rf.cod_empresa = :cod_empresa ';
        buscas.ParamByName('cod_tp_regra').AsInteger := buscas2.FieldByName('cod_tp_regra').AsInteger;
        buscas.ParamByName('dtini').AsString := pdataini;
        buscas.ParamByName('dtfim').AsString := pdatafim;
        buscas.ParamByName('cod_cliente').AsInteger := StrToInt(vDadosIni.vCliente.vCodClientePadrao);
        buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
        buscas.Open;
        buscas.FetchAll;

        frmCadRegrasProgramaFidelidade.ProgressBar1.Min := 0;
        frmCadRegrasProgramaFidelidade.ProgressBar1.Max := buscas.RecordCount;
        frmCadRegrasProgramaFidelidade.ProgressBar1.Position := 0;

        frmCadRegrasProgramaFidelidade.Label79.Caption := IntToStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Position) +
          ' / ' + IntToStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Max);

        try
          buscas.First;
          while not buscas.Eof do
          begin
            Application.ProcessMessages;
            
            fTempFaixaAsseduidade.Filtered := false;
            fTempFaixaAsseduidade.Filter := 'valor_vc = ' + QuotedStr(trim(buscas.FieldByName('clultimacompra').AsString));
            fTempFaixaAsseduidade.Filtered := true;

            vValorTemp := buscas.FieldByName('valor_total').AsFloat;
            vQtdTemp := buscas.FieldByName('qtde_total').AsFloat;

            vValorTempTot := vValorTempTot + buscas.FieldByName('valor_total').AsFloat;
            vQtdTempTot := vQtdTempTot + buscas.FieldByName('qtde_total').AsFloat;

            if fTempFaixaAsseduidade.IsEmpty then
            begin
              fTempFaixaAsseduidade.Insert;
              fTempFaixaAsseduidade.FieldByName('cod_tp_regra').AsInteger := buscas.FieldByName('cod_tp_regra').AsInteger;
              fTempFaixaAsseduidade.FieldByName('descricao_config').AsString := trim(buscas.FieldByName('descricao_config').AsString);
              fTempFaixaAsseduidade.FieldByName('valor_vc').AsString := buscas.FieldByName('clultimacompra').AsString;
              fTempFaixaAsseduidade.FieldByName('pontos').AsFloat := buscas.FieldByName('pontos').AsFloat;
              fTempFaixaAsseduidade.FieldByName('qtde_total').AsFloat := fTempFaixaAsseduidade.FieldByName('qtde_total').AsFloat + vQtdTemp;
              fTempFaixaAsseduidade.FieldByName('valor_total').AsFloat := fTempFaixaAsseduidade.FieldByName('valor_total').AsFloat + vValorTemp;
              fTempFaixaAsseduidade.FieldByName('perc').AsFloat := 0;
              fTempFaixaAsseduidade.Post;
            end
            else
            begin
              fTempFaixaAsseduidade.Edit;
              fTempFaixaAsseduidade.FieldByName('qtde_total').AsFloat := fTempFaixaAsseduidade.FieldByName('qtde_total').AsFloat + vQtdTemp;
              fTempFaixaAsseduidade.FieldByName('valor_total').AsFloat := fTempFaixaAsseduidade.FieldByName('valor_total').AsFloat + vValorTemp;
              fTempFaixaAsseduidade.FieldByName('perc').AsFloat := 0;
              fTempFaixaAsseduidade.Post;
            end;

            buscas.Next;

            frmCadRegrasProgramaFidelidade.Label79.Caption := IntToStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Position) +
              ' / ' + IntToStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Max);
            frmCadRegrasProgramaFidelidade.ProgressBar1.Position := frmCadRegrasProgramaFidelidade.ProgressBar1.Position + 1;
          end;
        finally
           fTempFaixaAsseduidade.Filtered := false;
           fTempFaixaAsseduidade.IndexFieldNames := 'valor_vc;';
        end;

        fTempFaixaAsseduidade.First;
        while not fTempFaixaAsseduidade.Eof do
        begin
          fTempFaixaAsseduidade.Edit;
          fTempFaixaAsseduidade.FieldByName('perc').AsFloat :=
            vDadosIni.IfThen(vValorTempTot > 0,
              (fTempFaixaAsseduidade.FieldByName('valor_total').AsFloat / vValorTempTot) * 100, 0);
          fTempFaixaAsseduidade.FieldByName('tot_pontos').AsFloat :=
             fTempFaixaAsseduidade.FieldByName('valor_total').AsFloat * fTempFaixaAsseduidade.FieldByName('pontos').AsFloat;

          vPercTempTotal := vPercTempTotal + fTempFaixaAsseduidade.FieldByName('perc').AsFloat;
          vPontosTempTotal := vPontosTempTotal + fTempFaixaAsseduidade.FieldByName('tot_pontos').AsFloat;

          fTempFaixaAsseduidade.Post;

          if pDet then
          begin
           Inc(I);
           GridResumo.Cells[0, I] := {IntToStr(fTempFaixaAsseduidade.FieldByName('cod_tp_regra').AsInteger) + ' - ' +}
             fTempFaixaAsseduidade.FieldByName('descricao_config').AsString;
           GridResumo.Cells[1, I] := FormatFloat('#,##0.00', fTempFaixaAsseduidade.FieldByName('tot_pontos').AsFloat);
           GridResumo.RowCount := I + 1;
          end;

          fTempFaixaAsseduidade.Next;
        end;

        fTempFaixaAsseduidade.First;
        Inc(I);
        GridResumo.Cells[0, I] := {IntToStr(buscas2.FieldByName('cod_tp_regra').AsInteger) + ' - }'TOTAL CLASSE ' +
          buscas2.FieldByName('descricao_regra').AsString;
        GridResumo.Cells[1, I] := FormatFloat('#,##0.00', vPontosTempTotal);
        GridResumo.RowCount := I + 1;
      end;
      frmCadRegrasProgramaFidelidade.DBGridFaixaAssiduidade.DataSource := fTempFaixaAsseduidadeDtSource;
      frmCadRegrasProgramaFidelidade.tsFaixaAsseduidade.TabVisible := not fTempFaixaAsseduidade.IsEmpty;
      frmCadRegrasProgramaFidelidade.LabelPercTotFaixaAsseduidade.Caption := FormatFloat('#,##0.00', vPercTempTotal);
      frmCadRegrasProgramaFidelidade.LabelValorTotFaixaAssiduidade.Caption := FormatFloat('#,##0.00', vValorTempTot);
      frmCadRegrasProgramaFidelidade.LabelPontosTotalFaixaAsseduidade.Caption := FormatFloat('#,##0.00', vPontosTempTotal);
      vTotPontosG := vTotPontosG + vPontosTempTotal;

      vValorTemp := 0;
      vQtdTemp := 0;
      vValorTempTot := 0;
      vQtdTempTot := 0;
      vPercTempTotal := 0;
      vPontosTempTotal := 0;
      //Faixa valor de compra por valor
      // Verificar se regra existe
      if verificarRegra('FAIXA VALOR DE COMPRA', buscas2) then
      begin
        frmCadRegrasProgramaFidelidade.tsFaixaCompra.Caption := buscas2.FieldByName('descricao_regra').AsString;
        frmCadRegrasProgramaFidelidade.GroupBoxFaixaCompra.Caption := buscas2.FieldByName('descricao_regra').AsString;
    
        vDadosIni.abreStatusProcessamento('', 'CLASSE ' + buscas2.FieldByName('descricao_regra').AsString);
    //    Inc(I);
    //    GridResumo.Cells[0, I] := 'CLASSE ' + buscas2.FieldByName('descricao_regra').AsString;

        buscas2.First;
        while not buscas2.Eof do
        begin
          fTempFaixaCompra.Insert;
          fTempFaixaCompra.FieldByName('cod_tp_regra').AsInteger := buscas2.FieldByName('cod_tp_regra').AsInteger;
          fTempFaixaCompra.FieldByName('descricao_config').AsString := trim(buscas2.FieldByName('descricao_config').AsString);
          fTempFaixaCompra.FieldByName('valor_f_ini').AsFloat := buscas2.FieldByName('valor_f_ini').AsFloat;
          fTempFaixaCompra.FieldByName('valor_f_fim').AsFloat := buscas2.FieldByName('valor_f_fim').AsFloat;
          fTempFaixaCompra.FieldByName('perc_dia_real').AsFloat := buscas2.FieldByName('perc_dia_real').AsFloat;
          fTempFaixaCompra.FieldByName('pontos').AsFloat := buscas2.FieldByName('pontos').AsFloat;
          fTempFaixaCompra.FieldByName('valor_total').AsFloat := 0;
          fTempFaixaCompra.FieldByName('perc').AsFloat := 0;
          fTempFaixaCompra.FieldByName('qtde_total').AsFloat := 0;
          fTempFaixaCompra.Post;

          buscas2.Next;
        end;
        fTempFaixaCompra.IndexFieldNames := 'valor_f_ini;valor_f_fim;';

        frmCadRegrasProgramaFidelidade.ProgressBar1.Min := 0;
        frmCadRegrasProgramaFidelidade.ProgressBar1.Max := fTempFaixaCompra.RecordCount;
        frmCadRegrasProgramaFidelidade.ProgressBar1.Position := 0;

        frmCadRegrasProgramaFidelidade.Label79.Caption := IntToStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Position) +
          ' / ' + IntToStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Max);

        fTempFaixaCompra.First;
        while not fTempFaixaCompra.Eof do
        begin
          Application.ProcessMessages;

          buscas.Close;
          buscas.SQL.Text := vsqlPontosFaixaValor;
          buscas.ParamByName('dtini').AsString := pdataini;
          buscas.ParamByName('dtfim').AsString := pdatafim;
          buscas.ParamByName('cod_cliente').AsInteger := StrToInt(vDadosIni.vCliente.vCodClientePadrao);
          buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
          buscas.ParamByName('valorini').AsFloat := fTempFaixaCompra.FieldByName('valor_f_ini').AsFloat;
          buscas.ParamByName('valorfim').AsFloat := fTempFaixaCompra.FieldByName('valor_f_fim').AsFloat;
          buscas.Open;
          buscas.FetchAll;

          vValorTemp := 0;
          vQtdTemp := 0;

          buscas.First;
          while not buscas.Eof do
          begin
            vValorTemp := vValorTemp + buscas.FieldByName('valor_total').AsFloat;
            vQtdTemp := vQtdTemp + buscas.FieldByName('qtde_total').AsFloat;

            vValorTempTot := vValorTempTot + buscas.FieldByName('valor_total').AsFloat;
            vQtdTempTot := vQtdTempTot + buscas.FieldByName('qtde_total').AsFloat;

            buscas.Next;
          end;
          fTempFaixaCompra.Edit;
          fTempFaixaCompra.FieldByName('valor_total').AsFloat := fTempFaixaCompra.FieldByName('valor_total').AsFloat +
             vValorTemp;
          fTempFaixaCompra.FieldByName('qtde_total').AsFloat := fTempFaixaCompra.FieldByName('qtde_total').AsFloat +
             vQtdTemp;
          fTempFaixaCompra.Post;

          fTempFaixaCompra.Next;

          frmCadRegrasProgramaFidelidade.Label79.Caption := IntToStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Position) +
              ' / ' + IntToStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Max);
          frmCadRegrasProgramaFidelidade.ProgressBar1.Position := frmCadRegrasProgramaFidelidade.ProgressBar1.Position + 1;
        end;

        fTempFaixaCompra.First;
        while not fTempFaixaCompra.Eof do
        begin
          fTempFaixaCompra.Edit;
          fTempFaixaCompra.FieldByName('perc').AsFloat :=
            vDadosIni.IfThen(vValorTempTot > 0,
              (fTempFaixaCompra.FieldByName('valor_total').AsFloat / vValorTempTot) * 100, 0);
          fTempFaixaCompra.FieldByName('tot_pontos').AsFloat :=
             fTempFaixaCompra.FieldByName('qtde_total').AsFloat * fTempFaixaCompra.FieldByName('pontos').AsFloat;
          vPercTempTotal := vPercTempTotal + fTempFaixaCompra.FieldByName('perc').AsFloat;
          vPontosTempTotal := vPontosTempTotal + fTempFaixaCompra.FieldByName('tot_pontos').AsFloat;
          fTempFaixaCompra.Post;

          if pDet then
          begin
           Inc(I);
           GridResumo.Cells[0, I] := {IntToStr(fTempFaixaCompra.FieldByName('cod_tp_regra').AsInteger) + ' - ' +}
             fTempFaixaCompra.FieldByName('descricao_config').AsString;
           GridResumo.Cells[1, I] := FormatFloat('#,##0.00', fTempFaixaCompra.FieldByName('tot_pontos').AsFloat);
           GridResumo.RowCount := I + 1;
          end;

          fTempFaixaCompra.Next;
        end;

        fTempFaixaCompra.First;
        Inc(I);
        GridResumo.Cells[0, I] := {IntToStr(buscas2.FieldByName('cod_tp_regra').AsInteger) + ' - }'TOTAL CLASSE ' +
          buscas2.FieldByName('descricao_regra').AsString;
        GridResumo.Cells[1, I] := FormatFloat('#,##0.00', vPontosTempTotal);
        GridResumo.RowCount := I + 1;
      end;
      frmCadRegrasProgramaFidelidade.DBGridFaixaCompra.DataSource := fTempFaixaCompraDtSource;
      frmCadRegrasProgramaFidelidade.tsFaixaCompra.TabVisible := not fTempFaixaCompra.IsEmpty;
      frmCadRegrasProgramaFidelidade.LabelPercTotFaixaCompra.Caption := FormatFloat('#,##0.00', vPercTempTotal);
      frmCadRegrasProgramaFidelidade.LabelValorTotalFaixaCompra.Caption := FormatFloat('#,##0.00', vValorTempTot);
      frmCadRegrasProgramaFidelidade.LabelPontosTotalFaixaCompra.Caption := FormatFloat('#,##0.00', vPontosTempTotal);
      vTotPontosG := vTotPontosG + vPontosTempTotal;

      vValorTemp := 0;
      vQtdTemp := 0;
      vValorTempTot := 0;
      vQtdTempTot := 0;
      vPercTempTotal := 0;
      vPontosTempTotal := 0;
      // Formas de pagamento
      // Verificar se regra existe
      if verificarRegra('FORMAS DE PAGAMENTO', buscas2) then
      begin
        frmCadRegrasProgramaFidelidade.tsFormasPag.Caption := buscas2.FieldByName('descricao_regra').AsString;
        frmCadRegrasProgramaFidelidade.GroupBoxFormasPag.Caption := buscas2.FieldByName('descricao_regra').AsString;

        vDadosIni.abreStatusProcessamento('', 'CLASSE ' + buscas2.FieldByName('descricao_regra').AsString);

        buscas.Close;
        buscas.SQL.Text := ' select fp.nrequisicao, fp.tpdocs, fp.data_fech, fp.cod_empresa, ' +
         ' fp.valorentrada, fp.valortotal, fp.dev, fp.cred, fp.fp_regra_fidelidade, ' +
         ' fp.perc_dia_real, fp.pontos, crf.cod_tp_regra, crf.descricao_config ' +
         '     from formas_prog_fid_det(:dtini, :dtfim, :cod_cliente, :cod_empresa, :regra, 0, '''', ''S'') fp ' +
         ' left join config_regras_prog_fidelidade crf ' +
         '   on trim(crf.valor_vc) = trim(fp.fp_regra_fidelidade) and coalesce(crf.perc_dia_real, 0) = coalesce(fp.perc_dia_real, 0) and crf.cod_empresa = fp.cod_empresa ' +
         ' left join regras_prog_fidelidade rf on rf.cod_tp_regra = crf.cod_tp_regra and rf.cod_empresa = crf.cod_empresa and rf.descricao_regra = :regra ' +
         ' union ' +
         ' select 0, '''', null, 0, ' +
         ' 0, 0, 0, ''N'', trim(crf.valor_vc), ' +
         ' crf.perc_dia_real, crf.pontos, crf.cod_tp_regra, crf.descricao_config  from regras_prog_fidelidade rf ' +
         ' inner join config_regras_prog_fidelidade crf on crf.cod_tp_regra = rf.cod_tp_regra and crf.cod_empresa = rf.cod_empresa ' +
         ' where rf.cod_empresa = :cod_empresa and rf.descricao_regra = :regra ';
        buscas.ParamByName('dtini').AsString := pdataini;
        buscas.ParamByName('dtfim').AsString := pdatafim;
        buscas.ParamByName('cod_cliente').AsInteger := StrToInt(vDadosIni.vCliente.vCodClientePadrao);
        buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
        buscas.ParamByName('regra').AsString := buscas2.FieldByName('descricao_regra').AsString;
        buscas.Open;
        buscas.FetchAll;

        frmCadRegrasProgramaFidelidade.ProgressBar1.Min := 0;
        frmCadRegrasProgramaFidelidade.ProgressBar1.Max := buscas.RecordCount;
        frmCadRegrasProgramaFidelidade.ProgressBar1.Position := 0;

        frmCadRegrasProgramaFidelidade.Label79.Caption := IntToStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Position) +
          ' / ' + IntToStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Max);

        try
          buscas.First;
          while not buscas.Eof do
          begin
            Application.ProcessMessages;
            
            fTempFormaPag.Filtered := false;
            fTempFormaPag.Filter := 'valor_vc = ' + QuotedStr(trim(buscas.FieldByName('fp_regra_fidelidade').AsString));
            fTempFormaPag.Filtered := true;

            if fTempFormaPag.IsEmpty then
            begin
               fTempFormaPag.Insert;
               fTempFormaPag.FieldByName('cod_tp_regra').AsInteger := buscas.FieldByName('cod_tp_regra').AsInteger;
               fTempFormaPag.FieldByName('descricao_config').AsString :=
                 vDadosIni.IfThen(trim(buscas.FieldByName('fp_regra_fidelidade').AsString) <> '',
                  trim(buscas.FieldByName('descricao_config').AsString),
                  'SEM - SEM RECEBIMENTO/VINCULO');
               fTempFormaPag.FieldByName('valor_vc').AsString := trim(buscas.FieldByName('fp_regra_fidelidade').AsString);
               fTempFormaPag.FieldByName('pontos').AsFloat := buscas.FieldByName('pontos').AsFloat;
               fTempFormaPag.FieldByName('valor_total').AsFloat := 0;
               fTempFormaPag.FieldByName('perc').AsFloat := 0;
               if buscas.FieldByName('nrequisicao').AsInteger > 0 then
               begin
                 vQtdTempTot := vQtdTempTot + 1;
                 fTempFormaPag.FieldByName('qtde_total').AsFloat := fTempFormaPag.FieldByName('qtde_total').AsFloat + 1;
               end
               else
                 fTempFormaPag.FieldByName('qtde_total').AsFloat := 0;
               fTempFormaPag.Post;
            end
            else
            begin
               fTempFormaPag.Edit;
               fTempFormaPag.FieldByName('valor_total').AsFloat := 0;
               fTempFormaPag.FieldByName('perc').AsFloat := 0;
               if buscas.FieldByName('nrequisicao').AsInteger > 0 then
               begin
                 vQtdTempTot := vQtdTempTot + 1;
                 fTempFormaPag.FieldByName('qtde_total').AsFloat := fTempFormaPag.FieldByName('qtde_total').AsFloat + 1;
               end;
               fTempFormaPag.Post;
            end;

            buscas.Next;

            frmCadRegrasProgramaFidelidade.Label79.Caption := IntToStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Position) +
              ' / ' + IntToStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Max);
            frmCadRegrasProgramaFidelidade.ProgressBar1.Position := frmCadRegrasProgramaFidelidade.ProgressBar1.Position + 1;
          end;
        finally
          fTempFormaPag.Filtered := false;
          fTempFormaPag.IndexFieldNames := 'valor_vc';
        end;

        fTempFormaPag.First;
        while not fTempFormaPag.Eof do
        begin
          fTempFormaPag.Edit;
          fTempFormaPag.FieldByName('perc').AsFloat :=
            vDadosIni.IfThen(vQtdTempTot > 0,
              (fTempFormaPag.FieldByName('qtde_total').AsFloat / vQtdTempTot) * 100, 0);
          fTempFormaPag.FieldByName('tot_pontos').AsFloat :=
             fTempFormaPag.FieldByName('pontos').AsFloat * fTempFormaPag.FieldByName('qtde_total').AsFloat;

    //      vQtdTempTot := vQtdTempTot + fTempFormaPag.FieldByName('qtde_total').AsFloat;
          vPercTempTotal := vPercTempTotal + fTempFormaPag.FieldByName('perc').AsFloat;
          vPontosTempTotal := vPontosTempTotal + fTempFormaPag.FieldByName('tot_pontos').AsFloat;
          fTempFormaPag.Post;

          if pDet then
          begin
           Inc(I);
           GridResumo.Cells[0, I] := {IntToStr(fTempFormaPag.FieldByName('cod_tp_regra').AsInteger) + ' - ' +}
             fTempFormaPag.FieldByName('descricao_config').AsString;
           GridResumo.Cells[1, I] := FormatFloat('#,##0.00', fTempFormaPag.FieldByName('tot_pontos').AsFloat);
           GridResumo.RowCount := I + 1;
          end;

          fTempFormaPag.Next;
        end;
        Inc(I);
        GridResumo.Cells[0, I] := {IntToStr(buscas2.FieldByName('cod_tp_regra').AsInteger) + ' - }'TOTAL CLASSE ' +
          buscas2.FieldByName('descricao_regra').AsString;
        GridResumo.Cells[1, I] := FormatFloat('#,##0.00', vPontosTempTotal);
        GridResumo.RowCount := I + 1;
      end;
      frmCadRegrasProgramaFidelidade.DBGridFormasPag.DataSource := fTempFormaPagDtSource;
      frmCadRegrasProgramaFidelidade.tsFormasPag.TabVisible := not fTempFormaPag.IsEmpty;
      frmCadRegrasProgramaFidelidade.LabelPercTotFormasPag.Caption := FormatFloat('#,##0.00', vPercTempTotal);
      frmCadRegrasProgramaFidelidade.LabelQtdeTotFormasPag.Caption := FormatFloat('#,##0.00', vQtdTempTot);
      frmCadRegrasProgramaFidelidade.LabelPontosTotalFormasPag.Caption := FormatFloat('#,##0.00', vPontosTempTotal);
      vTotPontosG := vTotPontosG + vPontosTempTotal;

      vValorTemp := 0;
      vQtdTemp := 0;
      vValorTempTot := 0;
      vQtdTempTot := 0;
      vPercTempTotal := 0;
      vPontosTempTotal := 0;
      // Recebimento de Prestação
      // Verificar se regra existe
      if verificarRegra('RECEBIMENTO DE PRESTACAO', buscas2) then
      begin
        frmCadRegrasProgramaFidelidade.tsRecPrest.Caption := buscas2.FieldByName('descricao_regra').AsString;
        frmCadRegrasProgramaFidelidade.GroupBoxRecPrest.Caption := buscas2.FieldByName('descricao_regra').AsString;

        vDadosIni.abreStatusProcessamento('', 'CLASSE ' + buscas2.FieldByName('descricao_regra').AsString);
    //    Inc(I);
    //    GridResumo.Cells[0, I] := 'CLASSE ' + buscas2.FieldByName('descricao_regra').AsString;

        buscas.Close;
        buscas.SQL.Text := ' select rp.cod_cred, rp.datq_c, rp.data_venc_c, rp.carencia, rp.cod_empresa, ' +
          ' rp.dias, rp.tipo, rp.perc_dia_real, crf.pontos, crf.cod_tp_regra, crf.descricao_config ' +
          '		from rec_prest_prog_fid_det(:dtini, :dtfim, :cod_cliente, :cod_empresa, :regra, 0, ''S'') rp ' +
          ' inner join config_regras_prog_fidelidade crf on trim(crf.valor_vc) = trim(rp.tipo) and coalesce(crf.perc_dia_real, 0) = coalesce(rp.perc_dia_real, 0) and crf.cod_empresa = rp.cod_empresa ' +
          ' inner join regras_prog_fidelidade rf on rf.cod_tp_regra = crf.cod_tp_regra and rf.cod_empresa = crf.cod_empresa and rf.descricao_regra = :regra ' +
          ' union ' +
          ' select 0, null, null, 0, 0, ' +
          ' 0, trim(crf.valor_vc), crf.perc_dia_real, crf.pontos, crf.cod_tp_regra, crf.descricao_config from regras_prog_fidelidade rf ' +
          ' inner join config_regras_prog_fidelidade crf on crf.cod_tp_regra = rf.cod_tp_regra and crf.cod_empresa = rf.cod_empresa ' +
          ' where rf.cod_empresa = :cod_empresa and rf.descricao_regra = :regra ';
        buscas.ParamByName('dtini').AsString := pdataini;
        buscas.ParamByName('dtfim').AsString := pdatafim;
        buscas.ParamByName('cod_cliente').AsInteger := StrToInt(vDadosIni.vCliente.vCodClientePadrao);
        buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
        buscas.ParamByName('regra').AsString := buscas2.FieldByName('descricao_regra').AsString;
        buscas.Open;
        buscas.FetchAll;

        frmCadRegrasProgramaFidelidade.ProgressBar1.Min := 0;
        frmCadRegrasProgramaFidelidade.ProgressBar1.Max := buscas.RecordCount;
        frmCadRegrasProgramaFidelidade.ProgressBar1.Position := 0;

        frmCadRegrasProgramaFidelidade.Label79.Caption := IntToStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Position) +
          ' / ' + IntToStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Max);

        try
          buscas.First;
          while not buscas.Eof do
          begin
            Application.ProcessMessages;

            fTempRecPrest.Filtered := false;
            fTempRecPrest.Filter := 'valor_vc = ' + QuotedStr(trim(buscas.FieldByName('tipo').AsString));
            fTempRecPrest.Filtered := true;

            if fTempRecPrest.IsEmpty then
            begin
               fTempRecPrest.Insert;
               fTempRecPrest.FieldByName('cod_tp_regra').AsInteger := buscas.FieldByName('cod_tp_regra').AsInteger;
               fTempRecPrest.FieldByName('descricao_config').AsString := trim(buscas.FieldByName('descricao_config').AsString);
               fTempRecPrest.FieldByName('valor_vc').AsString := trim(buscas.FieldByName('tipo').AsString);
               fTempRecPrest.FieldByName('pontos').AsFloat := buscas.FieldByName('pontos').AsFloat;
               fTempRecPrest.FieldByName('valor_total').AsFloat := 0;
               fTempRecPrest.FieldByName('perc').AsFloat := 0;
               if buscas.FieldByName('cod_cred').AsInteger > 0 then
               begin
                 vQtdTempTot := vQtdTempTot + 1;
                 fTempRecPrest.FieldByName('qtde_total').AsFloat := fTempRecPrest.FieldByName('qtde_total').AsFloat + 1;
               end
               else
                 fTempRecPrest.FieldByName('qtde_total').AsFloat := 0;
               fTempRecPrest.Post;
            end
            else
            begin
               fTempRecPrest.Edit;
               fTempRecPrest.FieldByName('valor_total').AsFloat := 0;
               fTempRecPrest.FieldByName('perc').AsFloat := 0;
               if buscas.FieldByName('cod_cred').AsInteger > 0 then
               begin
                 vQtdTempTot := vQtdTempTot + 1;
                 fTempRecPrest.FieldByName('qtde_total').AsFloat := fTempRecPrest.FieldByName('qtde_total').AsFloat + 1;
               end;
               fTempRecPrest.Post;
            end;

            buscas.Next;

            frmCadRegrasProgramaFidelidade.Label79.Caption := IntToStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Position) +
              ' / ' + IntToStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Max);
            frmCadRegrasProgramaFidelidade.ProgressBar1.Position := frmCadRegrasProgramaFidelidade.ProgressBar1.Position + 1;
          end;
        finally
          fTempRecPrest.Filtered := false;
          fTempRecPrest.IndexFieldNames := 'valor_vc';
        end;

        fTempRecPrest.First;
        while not fTempRecPrest.Eof do
        begin
          fTempRecPrest.Edit;
          fTempRecPrest.FieldByName('perc').AsFloat :=
            vDadosIni.IfThen(vQtdTempTot > 0,
              (fTempRecPrest.FieldByName('qtde_total').AsFloat / vQtdTempTot) * 100, 0);
          fTempRecPrest.FieldByName('tot_pontos').AsFloat :=
             fTempRecPrest.FieldByName('pontos').AsFloat * fTempRecPrest.FieldByName('qtde_total').AsFloat;

    //      vQtdTempTot := vQtdTempTot + fTempRecPrest.FieldByName('qtde_total').AsFloat;
          vPercTempTotal := vPercTempTotal + fTempRecPrest.FieldByName('perc').AsFloat;
          vPontosTempTotal := vPontosTempTotal + fTempRecPrest.FieldByName('tot_pontos').AsFloat;
          fTempRecPrest.Post;

          if pDet then
          begin
           Inc(I);
           GridResumo.Cells[0, I] := {IntToStr(fTempRecPrest.FieldByName('cod_tp_regra').AsInteger) + ' - ' +}
             fTempRecPrest.FieldByName('descricao_config').AsString;
           GridResumo.Cells[1, I] := FormatFloat('#,##0.00', fTempRecPrest.FieldByName('tot_pontos').AsFloat);
           GridResumo.RowCount := I + 1;
          end;

          fTempRecPrest.Next;
        end;
        fTempRecPrest.First;
        Inc(I);
        GridResumo.Cells[0, I] := {IntToStr(buscas2.FieldByName('cod_tp_regra').AsInteger) + ' - }'TOTAL CLASSE ' +
          buscas2.FieldByName('descricao_regra').AsString;
        GridResumo.Cells[1, I] := FormatFloat('#,##0.00', vPontosTempTotal);
        GridResumo.RowCount := I + 1;
      end;
      frmCadRegrasProgramaFidelidade.DBGridRecPrest.DataSource := fTempRecPrestDtSource;
      frmCadRegrasProgramaFidelidade.tsRecPrest.TabVisible := not fTempRecPrest.IsEmpty;
      frmCadRegrasProgramaFidelidade.LabelPercTotRecPrest.Caption := FormatFloat('#,##0.00', vPercTempTotal);
      frmCadRegrasProgramaFidelidade.LabelQtdeTotalRecPrest.Caption := FormatFloat('#,##0.00', vQtdTempTot);
      frmCadRegrasProgramaFidelidade.LabelPontosTotalRecPrest.Caption := FormatFloat('#,##0.00', vPontosTempTotal);
      vTotPontosG := vTotPontosG + vPontosTempTotal;

      vValorTemp := 0;
      vQtdTemp := 0;
      vValorTempTot := 0;
      vQtdTempTot := 0;
      vPercTempTotal := 0;
      vPontosTempTotal := 0;
      //Faixa de Pontos por Produto
      // Verificar se regra existe
      if verificarRegra('FAIXA DE PONTOS POR PRODUTO', buscas2) then
      begin
        frmCadRegrasProgramaFidelidade.tsFaixaProduto.Caption := buscas2.FieldByName('descricao_regra').AsString;
        frmCadRegrasProgramaFidelidade.GroupBoxFaixaProduto.Caption := buscas2.FieldByName('descricao_regra').AsString;

        vDadosIni.abreStatusProcessamento('', 'CLASSE ' + buscas2.FieldByName('descricao_regra').AsString);
    //    Inc(I);
    //    GridResumo.Cells[0, I] := 'CLASSE ' + buscas2.FieldByName('descricao_regra').AsString;

        buscas.Close;
        buscas.SQL.Text := ' select rf.cod_tp_regra, crf.descricao_config, crf.pontos, ' +
         ' crf.perc_dia_real, pd.tipo, pp.grupo_prod, pp.cod_prod, ' +
         ' coalesce(pd.valor_total, 0) valor_tot_vnd, ' +
         ' coalesce(pd.valor_vale_prg, 0) valor_vale_prg, ' +
         ' max(coalesce((select coalesce(dp.valor_dev, 0) from devolucao_prod (pd.nped, pd.tipo, pd.cod_empresa, pp.grupo_prod, pp.cod_prod) dp), 0)) valor_dev, ' +
         ' coalesce(sum(coalesce(pp.vltot_ped_item, 0)) + sum(coalesce(pp.rateio_acresc, 0)) - sum(coalesce(pp.rateio_desc, 0)), 0) valor_total, ' +
         ' count(*) qtde_total from pedvenda pd ' +
         ' inner join clientes cl on cl.cod_cliente = pd.cod_cliente and cl.cod_empresa = pd.cod_empresa ' +
         ' left join tipo_faturamento tf on tf.codigo_faturamento = cl.codigo_faturamento and tf.ativo = 1 ' +
         ' inner join pedvenda_prod pp on pp.nped = pd.nped and pp.tipo = pd.tipo and pp.cod_empresa = pd.cod_empresa ' +
         ' inner join tipo_vendas tv on pd.tipo = tv.tipo and ((pd.tipv = tv.sigla) or (pd.tipo_os = tv.tipo_os)) ' +
         ' 		and tv.venda = ''S'' and tv.gerar_pontos = ''S'' ' +
         ' inner join config_regras_prog_fidelidade crf on crf.grupo_prod = pp.grupo_prod and crf.cod_prod = pp.cod_prod and crf.cod_empresa = pp.cod_empresa ' +
         ' inner join regras_prog_fidelidade rf on rf.cod_tp_regra = crf.cod_tp_regra and rf.cod_empresa = crf.cod_empresa and rf.cod_tp_regra = :cod_tp_regra ' +
         ' where trim(pd.tipo) in (''REQ'', ''OS'') and coalesce(pd.status_ped, '''') = ''FECHADA'' ' +
         ' and (pp.status is null or pp.status = '''') ' +
         ' and pd.data_fech >= :dtini and pd.data_fech <= :dtfim and pd.cod_empresa = :cod_empresa ' +
         ' and coalesce(cl.cl_gerar_pontos, ''S'') <> ''N'' ' +
         ' and coalesce(tf.status_f, '''') <> ''BARRADO'' ' +
         ' and ((case when ((coalesce((select ndoc from existe_formas(pd.nped, pd.tipo, pd.cod_empresa)), 0)) > 0) then 1 else 0 end) > 0) ' +
         ' and pd.cod_cliente <> :cod_cliente ' +
         ' and pd.valor_total > abs(coalesce((select coalesce(valor_vale, 0) from existe_formas (pd.nped, pd.tipo, pd.cod_empresa)), 0)) ' +
         ' group by 1, 2, 3, 4, 5, 6, 7, 8, 9 ' +
         ' union ' +
         ' select rf.cod_tp_regra, crf.descricao_config, crf.pontos, ' +
         ' crf.perc_dia_real, ''DEV'', dev.grupo_prod, dev.cod_prod, ' +
         ' coalesce(pd.valor_total, 0) valor_tot_vnd, ' +
         ' coalesce(pd.valor_vale_prg, 0) valor_vale_prg, ' +
         ' max(coalesce((select coalesce(dp.valor_dev, 0) from devolucao_prod (pd.nped, pd.tipo, pd.cod_empresa, dev.grupo_prod, dev.cod_prod) dp), 0)) valor_dev, ' +
         ' sum((-1) * case when (coalesce(dev.valor_tot, 0) > 0) then coalesce(dev.valor_tot, 0) else (coalesce(dev.valor, 0) * coalesce(dev.quant, 0)) end) valor_total, ' +
         ' count(*) qtde_total from devolucao dev ' +
         ' inner join clientes cl on cl.cod_cliente = dev.cod_cliente and cl.cod_empresa = dev.cod_empresa ' +
         ' left join tipo_faturamento tf on tf.codigo_faturamento = cl.codigo_faturamento and tf.ativo = 1 ' +
         ' inner join pedvenda pd on pd.nped = coalesce(dev.cod_venda, 0) and trim(pd.tipo) = trim(dev.tipo_venda) and pd.cod_empresa = dev.cod_empresa ' +
         ' inner join tipo_vendas tv on pd.tipo = tv.tipo and ((pd.tipv = tv.sigla) or (pd.tipo_os = tv.tipo_os)) ' +
         ' 		and tv.venda = ''S'' and tv.gerar_pontos = ''S'' ' +
         ' inner join config_regras_prog_fidelidade crf on crf.grupo_prod = dev.grupo_prod and crf.cod_prod = dev.cod_prod and crf.cod_empresa = dev.cod_empresa ' +
         ' inner join regras_prog_fidelidade rf on rf.cod_tp_regra = crf.cod_tp_regra and rf.cod_empresa = crf.cod_empresa and rf.cod_tp_regra = :cod_tp_regra ' +
         ' where trim(dev.tipo_venda) in (''REQ'', ''OS'') ' +
         ' and pd.data_fech >= :dtini and pd.data_fech <= :dtfim and pd.cod_empresa = :cod_empresa ' +
         ' and coalesce(pd.cl_gerar_pontos, coalesce(cl.cl_gerar_pontos, ''S'')) <> ''N'' ' +
         ' and coalesce(pd.cl_status_f, coalesce(tf.status_f, '''')) <> ''BARRADO'' ' +
         ' and ((case when ((coalesce((select ndoc from existe_formas(pd.nped, pd.tipo, pd.cod_empresa)), 0)) > 0) then 1 else 0 end) > 0) ' +
         ' and pd.cod_cliente <> :cod_cliente ' +
         ' and pd.valor_total > abs(coalesce((select coalesce(valor_vale, 0) from existe_formas (pd.nped, pd.tipo, pd.cod_empresa)), 0)) ' +
         ' group by 1, 2, 3, 4, 5, 6, 7, 8, 9 ' +
         ' union ' +
         ' select rf.cod_tp_regra, crf.descricao_config, crf.pontos, ' +
         ' crf.perc_dia_real, ''DEVA'', dev.grupo_prod, dev.cod_prod, ' +
         ' 0 valor_tot_vnd, 0 valor_vale_prg, 0 valor_dev, ' +
         ' sum((-1) * case when (coalesce(dev.valor_tot, 0) > 0) then coalesce(dev.valor_tot, 0) else (coalesce(dev.valor, 0) * coalesce(dev.quant, 0)) end) valor_total, ' +
         ' count(*) qtde_total from devolucao dev ' +
         ' inner join clientes cl on cl.cod_cliente = dev.cod_cliente and cl.cod_empresa = dev.cod_empresa ' +
         ' left join tipo_faturamento tf on tf.codigo_faturamento = cl.codigo_faturamento and tf.ativo = 1 ' +
         ' inner join config_regras_prog_fidelidade crf on crf.grupo_prod = dev.grupo_prod and crf.cod_prod = dev.cod_prod and crf.cod_empresa = dev.cod_empresa ' +
         ' inner join regras_prog_fidelidade rf on rf.cod_tp_regra = crf.cod_tp_regra and rf.cod_empresa = crf.cod_empresa and rf.cod_tp_regra = :cod_tp_regra ' +
         ' where dev.data >= :dtini and dev.data <= :dtfim and dev.cod_empresa = :cod_empresa ' +
         ' and not((coalesce(dev.cod_venda, 0) > 0) and (dev.tipo_venda in (''REQ'', ''OS''))) ' +
         ' and coalesce(cl.cl_gerar_pontos, ''S'') <> ''N'' ' +
         ' and coalesce(tf.status_f, '''') <> ''BARRADO'' ' +
         ' and dev.cod_cliente <> :cod_cliente ' +
         ' group by 1, 2, 3, 4, 5, 6, 7, 8, 9 ' +
         ' union ' +
         ' select rf.cod_tp_regra, crf.descricao_config, crf.pontos, ' +
         ' crf.perc_dia_real, '''' tipo, crf.grupo_prod, crf.cod_prod, ' +
         ' 0 valor_tot_vnd, 0 valor_vale_prg, 0 valor_dev, ' +
         ' 0 valor_total, 0 qtde_total from regras_prog_fidelidade rf ' +
         ' inner join config_regras_prog_fidelidade crf on crf.cod_tp_regra = rf.cod_tp_regra and crf.cod_empresa = rf.cod_empresa ' +
         ' where rf.cod_tp_regra = :cod_tp_regra and rf.cod_empresa = :cod_empresa ' +
         ' order by 6, 7 ';
        buscas.ParamByName('cod_tp_regra').AsInteger := buscas2.FieldByName('cod_tp_regra').AsInteger;
        buscas.ParamByName('dtini').AsString := pdataini;
        buscas.ParamByName('dtfim').AsString := pdatafim;
        buscas.ParamByName('cod_cliente').AsInteger := StrToInt(vDadosIni.vCliente.vCodClientePadrao);
        buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
        buscas.Open;
        buscas.FetchAll;

        frmCadRegrasProgramaFidelidade.ProgressBar1.Min := 0;
        frmCadRegrasProgramaFidelidade.ProgressBar1.Max := buscas.RecordCount;
        frmCadRegrasProgramaFidelidade.ProgressBar1.Position := 0;

        frmCadRegrasProgramaFidelidade.Label79.Caption := IntToStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Position) +
          ' / ' + IntToStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Max);

        try
          buscas.First;
          while not buscas.Eof do
          begin
            Application.ProcessMessages;

            fTempFaixaProduto.Filtered := false;
            fTempFaixaProduto.Filter := 'grupo_prod = ' + IntToStr(buscas.FieldByName('grupo_prod').AsInteger) +
              ' and cod_prod = ' + QuotedStr(trim(buscas.FieldByName('cod_prod').AsString));
            fTempFaixaProduto.Filtered := true;

//            vValorTemp := buscas.FieldByName('valor_total').AsFloat
            vValorTemp := vDadosIni.IfThen(buscas.FieldByName('valor_tot_vnd').AsFloat > 0,
            	((buscas.FieldByName('valor_tot_vnd').AsFloat - buscas.FieldByName('valor_vale_prg').AsFloat) /
            	 buscas.FieldByName('valor_tot_vnd').AsFloat) * buscas.FieldByName('valor_total').AsFloat,
                buscas.FieldByName('valor_total').AsFloat - buscas.FieldByName('valor_dev').AsFloat);
            vQtdTemp := buscas.FieldByName('qtde_total').AsFloat;

//            vValorTempTot := vValorTempTot + buscas.FieldByName('valor_total').AsFloat;
         	vValorTempTot := vValorTempTot +
            	vDadosIni.IfThen(buscas.FieldByName('valor_tot_vnd').AsFloat > 0,
            	((buscas.FieldByName('valor_tot_vnd').AsFloat - buscas.FieldByName('valor_vale_prg').AsFloat) /
            	 buscas.FieldByName('valor_tot_vnd').AsFloat) * buscas.FieldByName('valor_total').AsFloat,
                buscas.FieldByName('valor_total').AsFloat - buscas.FieldByName('valor_dev').AsFloat);                
            vQtdTempTot := vQtdTempTot + buscas.FieldByName('qtde_total').AsFloat;

            if fTempFaixaProduto.IsEmpty then
            begin
              fTempFaixaProduto.Insert;
              fTempFaixaProduto.FieldByName('cod_tp_regra').AsInteger := buscas.FieldByName('cod_tp_regra').AsInteger;
              fTempFaixaProduto.FieldByName('descricao_config').AsString := trim(buscas.FieldByName('descricao_config').AsString);
              fTempFaixaProduto.FieldByName('grupo_prod').AsInteger := buscas.FieldByName('grupo_prod').AsInteger;
              fTempFaixaProduto.FieldByName('cod_prod').AsString := buscas.FieldByName('cod_prod').AsString;
              fTempFaixaProduto.FieldByName('pontos').AsFloat := buscas.FieldByName('pontos').AsFloat;
              fTempFaixaProduto.FieldByName('qtde_total').AsFloat := fTempFaixaProduto.FieldByName('qtde_total').AsFloat + vQtdTemp;
              fTempFaixaProduto.FieldByName('valor_total').AsFloat := fTempFaixaProduto.FieldByName('valor_total').AsFloat + vValorTemp;
              fTempFaixaProduto.FieldByName('perc').AsFloat := 0;
              fTempFaixaProduto.Post;
            end
            else
            begin
              fTempFaixaProduto.Edit;
              fTempFaixaProduto.FieldByName('qtde_total').AsFloat := fTempFaixaProduto.FieldByName('qtde_total').AsFloat + vQtdTemp;
              fTempFaixaProduto.FieldByName('valor_total').AsFloat := fTempFaixaProduto.FieldByName('valor_total').AsFloat + vValorTemp;
              fTempFaixaProduto.FieldByName('perc').AsFloat := 0;
              fTempFaixaProduto.Post;
            end;

            buscas.Next;

            frmCadRegrasProgramaFidelidade.Label79.Caption := IntToStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Position) +
              ' / ' + IntToStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Max);
            frmCadRegrasProgramaFidelidade.ProgressBar1.Position := frmCadRegrasProgramaFidelidade.ProgressBar1.Position + 1;
          end;
        finally
           fTempFaixaProduto.Filtered := false;
           fTempFaixaProduto.IndexFieldNames := 'grupo_prod;cod_prod;';
        end;

        fTempFaixaProduto.First;
        while not fTempFaixaProduto.Eof do
        begin
          fTempFaixaProduto.Edit;
          fTempFaixaProduto.FieldByName('perc').AsFloat :=
            vDadosIni.IfThen(vValorTempTot > 0,
              (fTempFaixaProduto.FieldByName('valor_total').AsFloat / vValorTempTot) * 100, 0);
          fTempFaixaProduto.FieldByName('tot_pontos').AsFloat :=
             fTempFaixaProduto.FieldByName('valor_total').AsFloat * fTempFaixaProduto.FieldByName('pontos').AsFloat;

          vPercTempTotal := vPercTempTotal + fTempFaixaProduto.FieldByName('perc').AsFloat;
          vPontosTempTotal := vPontosTempTotal + fTempFaixaProduto.FieldByName('tot_pontos').AsFloat;

          fTempFaixaProduto.Post;

          if pDet then
          begin
           Inc(I);
           GridResumo.Cells[0, I] := {IntToStr(fTempFaixaProduto.FieldByName('cod_tp_regra').AsInteger) + ' - ' +}
             fTempFaixaProduto.FieldByName('descricao_config').AsString;
           GridResumo.Cells[1, I] := FormatFloat('#,##0.00', fTempFaixaProduto.FieldByName('tot_pontos').AsFloat);
           GridResumo.RowCount := I + 1;
          end;

          fTempFaixaProduto.Next;
        end;

        fTempFaixaProduto.First;
        Inc(I);
        GridResumo.Cells[0, I] := {IntToStr(buscas2.FieldByName('cod_tp_regra').AsInteger) + ' - }'TOTAL CLASSE ' +
          buscas2.FieldByName('descricao_regra').AsString;
        GridResumo.Cells[1, I] := FormatFloat('#,##0.00', vPontosTempTotal);
        GridResumo.RowCount := I + 1;
      end;
      frmCadRegrasProgramaFidelidade.DBGridFaixaProduto.DataSource := fTempFaixaProdutoDtSource;
      frmCadRegrasProgramaFidelidade.tsFaixaProduto.TabVisible := not fTempFaixaProduto.IsEmpty;
      frmCadRegrasProgramaFidelidade.LabelPercTotFaixaProduto.Caption := FormatFloat('#,##0.00', vPercTempTotal);
      frmCadRegrasProgramaFidelidade.LabelValorTotFaixaProduto.Caption := FormatFloat('#,##0.00', vValorTempTot);
      frmCadRegrasProgramaFidelidade.LabelPontosTotalFaixaProduto.Caption := FormatFloat('#,##0.00', vPontosTempTotal);
      vTotPontosG := vTotPontosG + vPontosTempTotal;

      vValorTemp := 0;
      vQtdTemp := 0;
      vValorTempTot := 0;
      vQtdTempTot := 0;
      vPercTempTotal := 0;
      vPontosTempTotal := 0;
      //Faixa de Pontos por Grupo
      // Verificar se regra existe
      if verificarRegra('FAIXA DE PONTOS POR GRUPO DE PRODUTO', buscas2) then
      begin
        frmCadRegrasProgramaFidelidade.tsFaixaGrupoProd.Caption := buscas2.FieldByName('descricao_regra').AsString;
        frmCadRegrasProgramaFidelidade.GroupBoxFaixaGrupoProd.Caption := buscas2.FieldByName('descricao_regra').AsString;

        vDadosIni.abreStatusProcessamento('', 'CLASSE ' + buscas2.FieldByName('descricao_regra').AsString);
    //    Inc(I);
    //    GridResumo.Cells[0, I] := 'CLASSE ' + buscas2.FieldByName('descricao_regra').AsString;

        buscas.Close;
        buscas.SQL.Text := ' select rf.cod_tp_regra, crf.descricao_config, crf.perc_dia_real, ' +
          ' crf.pontos, pd.tipo, pp.grupo_prod, ' +
          ' coalesce(pd.valor_total, 0) valor_tot_vnd, ' +
          ' coalesce(pd.valor_vale_prg, 0) valor_vale_prg, ' +
          ' max(coalesce((select coalesce(dp.valor_dev, 0) from devolucao_grupo (pd.nped, pd.tipo, pd.cod_empresa, pp.grupo_prod) dp), 0)) valor_dev, ' +
          ' coalesce(sum(coalesce(pp.vltot_ped_item, 0)) + sum(coalesce(pp.rateio_acresc, 0)) - sum(coalesce(pp.rateio_desc, 0)), 0) valor_total, ' +
          ' count(*) qtde_total from pedvenda pd ' +
          ' inner join clientes cl on cl.cod_cliente = pd.cod_cliente and cl.cod_empresa = pd.cod_empresa ' +
          ' left join tipo_faturamento tf on tf.codigo_faturamento = cl.codigo_faturamento and tf.ativo = 1 ' +
          ' inner join pedvenda_prod pp on pp.nped = pd.nped and pp.tipo = pd.tipo and pp.cod_empresa = pd.cod_empresa ' +
          ' inner join tipo_vendas tv on pd.tipo = tv.tipo and ((pd.tipv = tv.sigla) or (pd.tipo_os = tv.tipo_os)) ' +
          ' 		and tv.venda = ''S'' and tv.gerar_pontos = ''S'' ' +
          ' inner join config_regras_prog_fidelidade crf on crf.valor_f_ini = pp.grupo_prod and crf.cod_empresa = pp.cod_empresa ' +
          ' inner join regras_prog_fidelidade rf on rf.cod_tp_regra = crf.cod_tp_regra and rf.cod_empresa = crf.cod_empresa and rf.cod_tp_regra = :cod_tp_regra ' +
          ' where trim(pd.tipo) in (''REQ'', ''OS'') and coalesce(pd.status_ped, '''') = ''FECHADA'' ' +
          ' and (pp.status is null or pp.status = '''') ' +
          ' and pd.data_fech >= :dtini and pd.data_fech <= :dtfim and pd.cod_empresa = :cod_empresa ' +
          ' and coalesce(cl.cl_gerar_pontos, ''S'') <> ''N'' ' +
          ' and coalesce(tf.status_f, '''') <> ''BARRADO'' ' +
          ' and ((case when ((coalesce((select ndoc from existe_formas(pd.nped, pd.tipo, pd.cod_empresa)), 0)) > 0) then 1 else 0 end) > 0) ' +
          ' and pd.cod_cliente <> :cod_cliente ' +
          ' and pd.valor_total > abs(coalesce((select coalesce(valor_vale, 0) from existe_formas (pd.nped, pd.tipo, pd.cod_empresa)), 0)) ' +
          ' group by 1, 2, 3, 4, 5, 6, 7, 8 ' +
          ' union ' +
          ' select rf.cod_tp_regra, crf.descricao_config, crf.perc_dia_real, ' +
          ' crf.pontos, ''DEV'', dev.grupo_prod,' +
          ' coalesce(pd.valor_total, 0) valor_tot_vnd, ' +
          ' coalesce(pd.valor_vale_prg, 0) valor_vale_prg, ' +
          ' max(coalesce((select coalesce(dp.valor_dev, 0) from devolucao_grupo (pd.nped, pd.tipo, pd.cod_empresa, dev.grupo_prod) dp), 0)) valor_dev, ' +
          ' sum((-1) * case when (coalesce(dev.valor_tot, 0) > 0) then coalesce(dev.valor_tot, 0) else (coalesce(dev.valor, 0) * coalesce(dev.quant, 0)) end) valor_total, ' +
          ' count(*) qtde_total  from devolucao dev ' +
          ' inner join clientes cl on cl.cod_cliente = dev.cod_cliente and cl.cod_empresa = dev.cod_empresa ' +
          ' left join tipo_faturamento tf on tf.codigo_faturamento = cl.codigo_faturamento and tf.ativo = 1 ' +
          ' inner join pedvenda pd on pd.nped = coalesce(dev.cod_venda, 0) and trim(pd.tipo) = trim(dev.tipo_venda) and pd.cod_empresa = dev.cod_empresa ' +
          ' inner join tipo_vendas tv on pd.tipo = tv.tipo and ((pd.tipv = tv.sigla) or (pd.tipo_os = tv.tipo_os)) ' +
          ' 		and tv.venda = ''S'' and tv.gerar_pontos = ''S'' ' +
          ' inner join config_regras_prog_fidelidade crf on crf.valor_f_ini = dev.grupo_prod and crf.cod_empresa = dev.cod_empresa ' +
          ' inner join regras_prog_fidelidade rf on rf.cod_tp_regra = crf.cod_tp_regra and rf.cod_empresa = crf.cod_empresa and rf.cod_tp_regra = :cod_tp_regra ' +
          ' where trim(dev.tipo_venda) in (''REQ'', ''OS'') ' +
          ' and pd.data_fech >= :dtini and pd.data_fech <= :dtfim and pd.cod_empresa = :cod_empresa ' +
          ' and coalesce(pd.cl_gerar_pontos, coalesce(cl.cl_gerar_pontos, ''S'')) <> ''N'' ' +
          ' and coalesce(pd.cl_status_f, coalesce(tf.status_f, '''')) <> ''BARRADO'' ' +
          ' and ((case when ((coalesce((select ndoc from existe_formas(pd.nped, pd.tipo, pd.cod_empresa)), 0)) > 0) then 1 else 0 end) > 0) ' +
          ' and pd.cod_cliente <> :cod_cliente ' +
          ' and pd.valor_total > abs(coalesce((select coalesce(valor_vale, 0) from existe_formas (pd.nped, pd.tipo, pd.cod_empresa)), 0)) ' +
          ' group by 1, 2, 3, 4, 5, 6, 7, 8 ' +
          ' union ' +
          ' select rf.cod_tp_regra, crf.descricao_config, crf.perc_dia_real, ' +
          ' crf.pontos, ''DEVA'', dev.grupo_prod, ' +
          ' 0 valor_tot_vnd, 0 valor_vale_prg, 0 valor_dev, ' +
          ' sum((-1) * case when (coalesce(dev.valor_tot, 0) > 0) then coalesce(dev.valor_tot, 0) else (coalesce(dev.valor, 0) * coalesce(dev.quant, 0)) end) valor_total, ' +
          ' count(*) qtde_total  from devolucao dev ' +
          ' inner join clientes cl on cl.cod_cliente = dev.cod_cliente and cl.cod_empresa = dev.cod_empresa ' +
          ' left join tipo_faturamento tf on tf.codigo_faturamento = cl.codigo_faturamento and tf.ativo = 1 ' +
          ' inner join config_regras_prog_fidelidade crf on crf.valor_f_ini = dev.grupo_prod and crf.cod_empresa = dev.cod_empresa ' +
          ' inner join regras_prog_fidelidade rf on rf.cod_tp_regra = crf.cod_tp_regra and rf.cod_empresa = crf.cod_empresa and rf.cod_tp_regra = :cod_tp_regra ' +
          ' where dev.data >= :dtini and dev.data <= :dtfim and dev.cod_empresa = :cod_empresa ' +
          ' and not((coalesce(dev.cod_venda, 0) > 0) and (dev.tipo_venda in (''REQ'', ''OS''))) ' +
          ' and coalesce(cl.cl_gerar_pontos, ''S'') <> ''N'' ' +
          ' and coalesce(tf.status_f, '''') <> ''BARRADO'' ' +
          ' and dev.cod_cliente <> :cod_cliente ' +
          ' group by 1, 2, 3, 4, 5, 6, 8 ' +
          ' union ' +
          ' select rf.cod_tp_regra, crf.descricao_config, crf.perc_dia_real, ' +
          ' crf.pontos, '''' tipo, crf.valor_f_ini,  ' +
          ' 0 valor_tot_vnd, 0 valor_vale_prg, 0 valor_dev, ' +
          ' 0 valor_total, 0 qtde_total from regras_prog_fidelidade rf ' +
          ' inner join config_regras_prog_fidelidade crf on crf.cod_tp_regra = rf.cod_tp_regra and crf.cod_empresa = rf.cod_empresa ' +
          ' where rf.cod_tp_regra = :cod_tp_regra and rf.cod_empresa = :cod_empresa ' +
          ' order by 6 ';
        buscas.ParamByName('cod_tp_regra').AsInteger := buscas2.FieldByName('cod_tp_regra').AsInteger;
        buscas.ParamByName('dtini').AsString := pdataini;
        buscas.ParamByName('dtfim').AsString := pdatafim;
        buscas.ParamByName('cod_cliente').AsInteger := StrToInt(vDadosIni.vCliente.vCodClientePadrao);
        buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
        buscas.Open;
        buscas.FetchAll;

        frmCadRegrasProgramaFidelidade.ProgressBar1.Min := 0;
        frmCadRegrasProgramaFidelidade.ProgressBar1.Max := buscas.RecordCount;
        frmCadRegrasProgramaFidelidade.ProgressBar1.Position := 0;

        frmCadRegrasProgramaFidelidade.Label79.Caption := IntToStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Position) +
          ' / ' + IntToStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Max);

        try
          buscas.First;
          while not buscas.Eof do
          begin
            Application.ProcessMessages;
           
            fTempFaixaGrupoProduto.Filtered := false;
            fTempFaixaGrupoProduto.Filter := 'valor_f_ini = ' + IntToStr(buscas.FieldByName('grupo_prod').AsInteger);
            fTempFaixaGrupoProduto.Filtered := true;

//            vValorTemp := buscas.FieldByName('valor_total').AsFloat;
         	vValorTemp := vDadosIni.IfThen(buscas.FieldByName('valor_tot_vnd').AsFloat > 0,
            	((buscas.FieldByName('valor_tot_vnd').AsFloat - buscas.FieldByName('valor_vale_prg').AsFloat) /
            	 buscas.FieldByName('valor_tot_vnd').AsFloat) * buscas.FieldByName('valor_total').AsFloat,
                buscas.FieldByName('valor_total').AsFloat - buscas.FieldByName('valor_dev').AsFloat);
            vQtdTemp := buscas.FieldByName('qtde_total').AsFloat;

//            vValorTempTot := vValorTempTot + buscas.FieldByName('valor_total').AsFloat;
         	vValorTempTot := vValorTempTot + vDadosIni.IfThen(buscas.FieldByName('valor_tot_vnd').AsFloat > 0,
            	((buscas.FieldByName('valor_tot_vnd').AsFloat - buscas.FieldByName('valor_vale_prg').AsFloat) /
            	 buscas.FieldByName('valor_tot_vnd').AsFloat) * buscas.FieldByName('valor_total').AsFloat,
                buscas.FieldByName('valor_total').AsFloat - buscas.FieldByName('valor_dev').AsFloat);
            vQtdTempTot := vQtdTempTot + buscas.FieldByName('qtde_total').AsFloat;

            if fTempFaixaGrupoProduto.IsEmpty then
            begin
              fTempFaixaGrupoProduto.Insert;
              fTempFaixaGrupoProduto.FieldByName('cod_tp_regra').AsInteger := buscas.FieldByName('cod_tp_regra').AsInteger;
              fTempFaixaGrupoProduto.FieldByName('descricao_config').AsString := trim(buscas.FieldByName('descricao_config').AsString);
              fTempFaixaGrupoProduto.FieldByName('valor_f_ini').AsInteger := buscas.FieldByName('grupo_prod').AsInteger;
              fTempFaixaGrupoProduto.FieldByName('pontos').AsFloat := buscas.FieldByName('pontos').AsFloat;
              fTempFaixaGrupoProduto.FieldByName('qtde_total').AsFloat := fTempFaixaGrupoProduto.FieldByName('qtde_total').AsFloat + vQtdTemp;
              fTempFaixaGrupoProduto.FieldByName('valor_total').AsFloat := fTempFaixaGrupoProduto.FieldByName('valor_total').AsFloat + vValorTemp;
              fTempFaixaGrupoProduto.FieldByName('perc').AsFloat := 0;
              fTempFaixaGrupoProduto.Post;
            end
            else
            begin
              fTempFaixaGrupoProduto.Edit;
              fTempFaixaGrupoProduto.FieldByName('qtde_total').AsFloat := fTempFaixaGrupoProduto.FieldByName('qtde_total').AsFloat + vQtdTemp;
              fTempFaixaGrupoProduto.FieldByName('valor_total').AsFloat := fTempFaixaGrupoProduto.FieldByName('valor_total').AsFloat + vValorTemp;
              fTempFaixaGrupoProduto.FieldByName('perc').AsFloat := 0;
              fTempFaixaGrupoProduto.Post;
            end;

            buscas.Next;

            frmCadRegrasProgramaFidelidade.Label79.Caption := IntToStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Position) +
              ' / ' + IntToStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Max);
            frmCadRegrasProgramaFidelidade.ProgressBar1.Position := frmCadRegrasProgramaFidelidade.ProgressBar1.Position + 1;
          end;
        finally
           fTempFaixaGrupoProduto.Filtered := false;
           fTempFaixaGrupoProduto.IndexFieldNames := 'valor_f_ini;';
        end;

        fTempFaixaGrupoProduto.First;
        while not fTempFaixaGrupoProduto.Eof do
        begin
          fTempFaixaGrupoProduto.Edit;
          fTempFaixaGrupoProduto.FieldByName('perc').AsFloat :=
            vDadosIni.IfThen(vValorTempTot > 0,
              (fTempFaixaGrupoProduto.FieldByName('valor_total').AsFloat / vValorTempTot) * 100, 0);
          fTempFaixaGrupoProduto.FieldByName('tot_pontos').AsFloat :=
             fTempFaixaGrupoProduto.FieldByName('valor_total').AsFloat * fTempFaixaGrupoProduto.FieldByName('pontos').AsFloat;

          vPercTempTotal := vPercTempTotal + fTempFaixaGrupoProduto.FieldByName('perc').AsFloat;
          vPontosTempTotal := vPontosTempTotal + fTempFaixaGrupoProduto.FieldByName('tot_pontos').AsFloat;

          fTempFaixaGrupoProduto.Post;

          if pDet then
          begin
           Inc(I);
           GridResumo.Cells[0, I] := {IntToStr(fTempFaixaGrupoProduto.FieldByName('cod_tp_regra').AsInteger) + ' - ' +}
             fTempFaixaGrupoProduto.FieldByName('descricao_config').AsString;
           GridResumo.Cells[1, I] := FormatFloat('#,##0.00', fTempFaixaGrupoProduto.FieldByName('tot_pontos').AsFloat);
           GridResumo.RowCount := I + 1;
          end;

          fTempFaixaGrupoProduto.Next;
        end;

        fTempFaixaGrupoProduto.First;
        Inc(I);
        GridResumo.Cells[0, I] := {IntToStr(buscas2.FieldByName('cod_tp_regra').AsInteger) + ' - }'TOTAL CLASSE ' +
          buscas2.FieldByName('descricao_regra').AsString;
        GridResumo.Cells[1, I] := FormatFloat('#,##0.00', vPontosTempTotal);
        GridResumo.RowCount := I + 1;
      end;
      frmCadRegrasProgramaFidelidade.DBGridFaixaGrupoProd.DataSource := fTempFaixaGrupoProdutoDtSource;
      frmCadRegrasProgramaFidelidade.tsFaixaGrupoProd.TabVisible := not fTempFaixaGrupoProduto.IsEmpty;
      frmCadRegrasProgramaFidelidade.LabelPercTotFaixaGrupo.Caption := FormatFloat('#,##0.00', vPercTempTotal);
      frmCadRegrasProgramaFidelidade.LabelValorTotFaixaGrupo.Caption := FormatFloat('#,##0.00', vValorTempTot);
      frmCadRegrasProgramaFidelidade.LabelPontosTotFaixaGrupo.Caption := FormatFloat('#,##0.00', vPontosTempTotal);
      vTotPontosG := vTotPontosG + vPontosTempTotal;

      vValorTemp := 0;
      vQtdTemp := 0;
      vValorTempTot := 0;
      vQtdTempTot := 0;
      vPercTempTotal := 0;
      vPontosTempTotal := 0;
      //Faixa de Pontos por SubGrupo
      // Verificar se regra existe
      if verificarRegra('FAIXA DE PONTOS POR SUBGRUPO DE PRODUTO', buscas2) then
      begin
        frmCadRegrasProgramaFidelidade.tsFaixaSubGrupoProd.Caption := buscas2.FieldByName('descricao_regra').AsString;
        frmCadRegrasProgramaFidelidade.GroupBoxFaixaSubGrupoProd.Caption := buscas2.FieldByName('descricao_regra').AsString;

        vDadosIni.abreStatusProcessamento('', 'CLASSE ' + buscas2.FieldByName('descricao_regra').AsString);
    //    Inc(I);
    //    GridResumo.Cells[0, I] := 'CLASSE ' + buscas2.FieldByName('descricao_regra').AsString;

        buscas.Close;
        buscas.SQL.Text := ' select rf.cod_tp_regra, crf.descricao_config, crf.perc_dia_real, ' +
         ' crf.pontos, pd.tipo, pr.sub_g_prod, ' +
         ' coalesce(pd.valor_total, 0) valor_tot_vnd, ' +
         ' coalesce(pd.valor_vale_prg, 0) valor_vale_prg, ' +
         ' max(coalesce((select coalesce(dp.valor_dev, 0) from devolucao_subgrupo (pd.nped, pd.tipo, pd.cod_empresa, pr.sub_g_prod) dp), 0)) valor_dev, ' +
         ' coalesce(sum(coalesce(pp.vltot_ped_item, 0)) + sum(coalesce(pp.rateio_acresc, 0)) - sum(coalesce(pp.rateio_desc, 0)), 0) valor_total, ' +
         ' count(*) qtde_total from pedvenda pd ' +
         ' inner join clientes cl on cl.cod_cliente = pd.cod_cliente and cl.cod_empresa = pd.cod_empresa ' +
         ' left join tipo_faturamento tf on tf.codigo_faturamento = cl.codigo_faturamento and tf.ativo = 1 ' +
         ' inner join pedvenda_prod pp on pp.nped = pd.nped and pp.tipo = pd.tipo and pp.cod_empresa = pd.cod_empresa ' +
         ' inner join produtos pr on pr.grupo_prod = pp.grupo_prod and pr.cod_prod = pp.cod_prod and pr.cod_empresa = pp.cod_empresa ' +
         ' inner join tipo_vendas tv on pd.tipo = tv.tipo and ((pd.tipv = tv.sigla) or (pd.tipo_os = tv.tipo_os)) ' +
         ' 		and tv.venda = ''S'' and tv.gerar_pontos = ''S'' ' +
         ' inner join config_regras_prog_fidelidade crf on crf.valor_f_ini = pr.sub_g_prod and crf.cod_empresa = pp.cod_empresa ' +
         ' inner join regras_prog_fidelidade rf on rf.cod_tp_regra = crf.cod_tp_regra and rf.cod_empresa = crf.cod_empresa and rf.cod_tp_regra = :cod_tp_regra ' +
         ' where trim(pd.tipo) in (''REQ'', ''OS'') and coalesce(pd.status_ped, '''') = ''FECHADA'' ' +
         ' and (pp.status is null or pp.status = '''') ' +
         ' and pd.data_fech >= :dtini and pd.data_fech <= :dtfim and pd.cod_empresa = :cod_empresa ' +
         ' and coalesce(cl.cl_gerar_pontos, ''S'') <> ''N'' ' +
         ' and coalesce(tf.status_f, '''') <> ''BARRADO'' ' +
         ' and ((case when ((coalesce((select ndoc from existe_formas(pd.nped, pd.tipo, pd.cod_empresa)), 0)) > 0) then 1 else 0 end) > 0) ' +
         ' and pd.cod_cliente <> :cod_cliente ' +
         ' and pd.valor_total > abs(coalesce((select coalesce(valor_vale, 0) from existe_formas (pd.nped, pd.tipo, pd.cod_empresa)), 0)) ' +
         ' group by 1, 2, 3, 4, 5, 6, 7, 8 ' +
         ' union ' +
         ' select rf.cod_tp_regra, crf.descricao_config, crf.perc_dia_real, ' +
         ' crf.pontos, ''DEV'', pr.sub_g_prod, ' + 
         ' coalesce(pd.valor_total, 0) valor_tot_vnd, ' +
         ' coalesce(pd.valor_vale_prg, 0) valor_vale_prg, ' +
         ' max(coalesce((select coalesce(dp.valor_dev, 0) from devolucao_subgrupo (pd.nped, pd.tipo, pd.cod_empresa, pr.sub_g_prod) dp), 0)) valor_dev, ' +
         ' sum((-1) * case when (coalesce(dev.valor_tot, 0) > 0) then coalesce(dev.valor_tot, 0) else (coalesce(dev.valor, 0) * coalesce(dev.quant, 0)) end) valor_total, ' +
         ' count(*) qtde_total  from devolucao dev ' +
         ' inner join clientes cl on cl.cod_cliente = dev.cod_cliente and cl.cod_empresa = dev.cod_empresa ' +
         ' left join tipo_faturamento tf on tf.codigo_faturamento = cl.codigo_faturamento and tf.ativo = 1 ' +
         ' inner join produtos pr on pr.grupo_prod = dev.grupo_prod and pr.cod_prod = dev.cod_prod and pr.cod_empresa = dev.cod_empresa ' +
         ' inner join pedvenda pd on pd.nped = coalesce(dev.cod_venda, 0) and trim(pd.tipo) = trim(dev.tipo_venda) and pd.cod_empresa = dev.cod_empresa ' +
         ' inner join tipo_vendas tv on pd.tipo = tv.tipo and ((pd.tipv = tv.sigla) or (pd.tipo_os = tv.tipo_os)) ' +
         ' 		and tv.venda = ''S'' and tv.gerar_pontos = ''S'' ' +
         ' inner join config_regras_prog_fidelidade crf on crf.valor_f_ini = pr.sub_g_prod and crf.cod_empresa = dev.cod_empresa ' +
         ' inner join regras_prog_fidelidade rf on rf.cod_tp_regra = crf.cod_tp_regra and rf.cod_empresa = crf.cod_empresa and rf.cod_tp_regra = :cod_tp_regra ' +
         ' where trim(dev.tipo_venda) in (''REQ'', ''OS'') ' +
         ' and pd.data_fech >= :dtini and pd.data_fech <= :dtfim and pd.cod_empresa = :cod_empresa ' +
         ' and coalesce(pd.cl_gerar_pontos, coalesce(cl.cl_gerar_pontos, ''S'')) <> ''N'' ' +
         ' and coalesce(pd.cl_status_f, coalesce(tf.status_f, '''')) <> ''BARRADO'' ' +
         ' and ((case when ((coalesce((select ndoc from existe_formas(pd.nped, pd.tipo, pd.cod_empresa)), 0)) > 0) then 1 else 0 end) > 0) ' +
         ' and pd.cod_cliente <> :cod_cliente ' +
         ' and pd.valor_total > abs(coalesce((select coalesce(valor_vale, 0) from existe_formas (pd.nped, pd.tipo, pd.cod_empresa)), 0)) ' +
         ' group by 1, 2, 3, 4, 5, 6, 7, 8 ' +
         ' union ' +
         ' select rf.cod_tp_regra, crf.descricao_config, crf.perc_dia_real, ' +
         ' crf.pontos, ''DEVA'', pr.sub_g_prod, ' +
         ' 0 valor_tot_vnd, 0 valor_vale_prg, 0 valor_dev, ' +
         ' sum((-1) * case when (coalesce(dev.valor_tot, 0) > 0) then coalesce(dev.valor_tot, 0) else (coalesce(dev.valor, 0) * coalesce(dev.quant, 0)) end) valor_total, ' +
         ' count(*) qtde_total  from devolucao dev ' +
         ' inner join clientes cl on cl.cod_cliente = dev.cod_cliente and cl.cod_empresa = dev.cod_empresa ' +
         ' left join tipo_faturamento tf on tf.codigo_faturamento = cl.codigo_faturamento and tf.ativo = 1 ' +
         ' inner join produtos pr on pr.grupo_prod = dev.grupo_prod and pr.cod_prod = dev.cod_prod and pr.cod_empresa = dev.cod_empresa ' +
         ' inner join config_regras_prog_fidelidade crf on crf.valor_f_ini = pr.sub_g_prod and crf.cod_empresa = dev.cod_empresa ' +
         ' inner join regras_prog_fidelidade rf on rf.cod_tp_regra = crf.cod_tp_regra and rf.cod_empresa = crf.cod_empresa and rf.cod_tp_regra = :cod_tp_regra ' +
         ' where dev.data >= :dtini and dev.data <= :dtfim and dev.cod_empresa = :cod_empresa ' +
         ' and not((coalesce(dev.cod_venda, 0) > 0) and (dev.tipo_venda in (''REQ'', ''OS''))) ' +
         ' and coalesce(cl.cl_gerar_pontos, ''S'') <> ''N'' ' +
         ' and coalesce(tf.status_f, '''') <> ''BARRADO'' ' +
         ' and dev.cod_cliente <> :cod_cliente ' +
         ' group by 1, 2, 3, 4, 5, 6, 8 ' +
         ' union ' +
         ' select rf.cod_tp_regra, crf.descricao_config, crf.perc_dia_real, ' +
         ' crf.pontos, '''' tipo, crf.valor_f_ini,  ' +
         ' 0 valor_tot_vnd, 0 valor_vale_prg, 0 valor_dev, ' +
         ' 0 valor_total, 0 qtde_total from regras_prog_fidelidade rf ' +
         ' inner join config_regras_prog_fidelidade crf on crf.cod_tp_regra = rf.cod_tp_regra and crf.cod_empresa = rf.cod_empresa ' +
         ' where rf.cod_tp_regra = :cod_tp_regra and rf.cod_empresa = :cod_empresa ' +
         ' order by 6 ';
        buscas.ParamByName('cod_tp_regra').AsInteger := buscas2.FieldByName('cod_tp_regra').AsInteger;
        buscas.ParamByName('dtini').AsString := pdataini;
        buscas.ParamByName('dtfim').AsString := pdatafim;
        buscas.ParamByName('cod_cliente').AsInteger := StrToInt(vDadosIni.vCliente.vCodClientePadrao);
        buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
        buscas.Open;
        buscas.FetchAll;

        frmCadRegrasProgramaFidelidade.ProgressBar1.Min := 0;
        frmCadRegrasProgramaFidelidade.ProgressBar1.Max := buscas.RecordCount;
        frmCadRegrasProgramaFidelidade.ProgressBar1.Position := 0;

        frmCadRegrasProgramaFidelidade.Label79.Caption := InttoStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Position) +
           ' / ' + InttoStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Max);

        try
          buscas.First;
          while not buscas.Eof do
          begin
            Application.ProcessMessages;

            fTempFaixaSubGrupoProduto.Filtered := false;
            fTempFaixaSubGrupoProduto.Filter := 'valor_f_ini = ' + IntToStr(buscas.FieldByName('sub_g_prod').AsInteger);
            fTempFaixaSubGrupoProduto.Filtered := true;

//            vValorTemp := buscas.FieldByName('valor_total').AsFloat;
         	vValorTemp := vDadosIni.IfThen(buscas.FieldByName('valor_tot_vnd').AsFloat > 0,
            	((buscas.FieldByName('valor_tot_vnd').AsFloat - buscas.FieldByName('valor_vale_prg').AsFloat) /
            	 buscas.FieldByName('valor_tot_vnd').AsFloat) * buscas.FieldByName('valor_total').AsFloat,
                buscas.FieldByName('valor_total').AsFloat - buscas.FieldByName('valor_dev').AsFloat);
            vQtdTemp := buscas.FieldByName('qtde_total').AsFloat;

//            vValorTempTot := vValorTempTot + buscas.FieldByName('valor_total').AsFloat;
         	vValorTempTot := vValorTempTot + vDadosIni.IfThen(buscas.FieldByName('valor_tot_vnd').AsFloat > 0,
            	((buscas.FieldByName('valor_tot_vnd').AsFloat - buscas.FieldByName('valor_vale_prg').AsFloat) /
            	 buscas.FieldByName('valor_tot_vnd').AsFloat) * buscas.FieldByName('valor_total').AsFloat,
                buscas.FieldByName('valor_total').AsFloat - buscas.FieldByName('valor_dev').AsFloat);
            vQtdTempTot := vQtdTempTot + buscas.FieldByName('qtde_total').AsFloat;

            if fTempFaixaSubGrupoProduto.IsEmpty then
            begin
              fTempFaixaSubGrupoProduto.Insert;
              fTempFaixaSubGrupoProduto.FieldByName('cod_tp_regra').AsInteger := buscas.FieldByName('cod_tp_regra').AsInteger;
              fTempFaixaSubGrupoProduto.FieldByName('descricao_config').AsString := trim(buscas.FieldByName('descricao_config').AsString);
              fTempFaixaSubGrupoProduto.FieldByName('valor_f_ini').AsInteger := buscas.FieldByName('sub_g_prod').AsInteger;
              fTempFaixaSubGrupoProduto.FieldByName('pontos').AsFloat := buscas.FieldByName('pontos').AsFloat;
              fTempFaixaSubGrupoProduto.FieldByName('qtde_total').AsFloat := fTempFaixaSubGrupoProduto.FieldByName('qtde_total').AsFloat + vQtdTemp;
              fTempFaixaSubGrupoProduto.FieldByName('valor_total').AsFloat := fTempFaixaSubGrupoProduto.FieldByName('valor_total').AsFloat + vValorTemp;
              fTempFaixaSubGrupoProduto.FieldByName('perc').AsFloat := 0;
              fTempFaixaSubGrupoProduto.Post;
            end
            else
            begin
              fTempFaixaSubGrupoProduto.Edit;
              fTempFaixaSubGrupoProduto.FieldByName('qtde_total').AsFloat := fTempFaixaSubGrupoProduto.FieldByName('qtde_total').AsFloat + vQtdTemp;
              fTempFaixaSubGrupoProduto.FieldByName('valor_total').AsFloat := fTempFaixaSubGrupoProduto.FieldByName('valor_total').AsFloat + vValorTemp;
              fTempFaixaSubGrupoProduto.FieldByName('perc').AsFloat := 0;
              fTempFaixaSubGrupoProduto.Post;
            end;

            buscas.Next;

            frmCadRegrasProgramaFidelidade.Label79.Caption := IntToStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Position) +
              ' / ' + IntToStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Max);
            frmCadRegrasProgramaFidelidade.ProgressBar1.Position := frmCadRegrasProgramaFidelidade.ProgressBar1.Position + 1;
          end;
        finally
           fTempFaixaSubGrupoProduto.Filtered := false;
           fTempFaixaSubGrupoProduto.IndexFieldNames := 'valor_f_ini;';
        end;

        fTempFaixaSubGrupoProduto.First;
        while not fTempFaixaSubGrupoProduto.Eof do
        begin
          fTempFaixaSubGrupoProduto.Edit;
          fTempFaixaSubGrupoProduto.FieldByName('perc').AsFloat :=
            vDadosIni.IfThen(vValorTempTot > 0,
              (fTempFaixaSubGrupoProduto.FieldByName('valor_total').AsFloat / vValorTempTot) * 100, 0);
          fTempFaixaSubGrupoProduto.FieldByName('tot_pontos').AsFloat :=
             fTempFaixaSubGrupoProduto.FieldByName('valor_total').AsFloat * fTempFaixaSubGrupoProduto.FieldByName('pontos').AsFloat;

          vPercTempTotal := vPercTempTotal + fTempFaixaSubGrupoProduto.FieldByName('perc').AsFloat;
          vPontosTempTotal := vPontosTempTotal + fTempFaixaSubGrupoProduto.FieldByName('tot_pontos').AsFloat;

          fTempFaixaSubGrupoProduto.Post;

          if pDet then
          begin
           Inc(I);
           GridResumo.Cells[0, I] := {IntToStr(fTempFaixaSubGrupoProduto.FieldByName('cod_tp_regra').AsInteger) + ' - ' +}
             fTempFaixaSubGrupoProduto.FieldByName('descricao_config').AsString;
           GridResumo.Cells[1, I] := FormatFloat('#,##0.00', fTempFaixaSubGrupoProduto.FieldByName('tot_pontos').AsFloat);
           GridResumo.RowCount := I + 1;
          end;

          fTempFaixaSubGrupoProduto.Next;
        end;

        fTempFaixaSubGrupoProduto.First;
        Inc(I);
        GridResumo.Cells[0, I] := {IntToStr(buscas2.FieldByName('cod_tp_regra').AsInteger) + ' - }'TOTAL CLASSE ' +
          buscas2.FieldByName('descricao_regra').AsString;
        GridResumo.Cells[1, I] := FormatFloat('#,##0.00', vPontosTempTotal);
        GridResumo.RowCount := I + 1;
      end;
      frmCadRegrasProgramaFidelidade.DBGridFaixaSubGrupoProd.DataSource := fTempFaixaSubGrupoProdutoDtSource;
      frmCadRegrasProgramaFidelidade.tsFaixaSubGrupoProd.TabVisible := not fTempFaixaSubGrupoProduto.IsEmpty;
      frmCadRegrasProgramaFidelidade.LabelPercTotFaixaSubGrupo.Caption := FormatFloat('#,##0.00', vPercTempTotal);
      frmCadRegrasProgramaFidelidade.LabelValorTotFaixaSubGrupo.Caption := FormatFloat('#,##0.00', vValorTempTot);
      frmCadRegrasProgramaFidelidade.LabelPontosTotalFaixaSubGrupo.Caption := FormatFloat('#,##0.00', vPontosTempTotal);
      vTotPontosG := vTotPontosG + vPontosTempTotal;

      vValorTemp := 0;
      vQtdTemp := 0;
      vValorTempTot := 0;
      vQtdTempTot := 0;
      vPercTempTotal := 0;
      vPontosTempTotal := 0;
      //Faixa de Pontos por Marca
      // Verificar se regra existe
      if verificarRegra('FAIXA DE PONTOS POR MARCA DE PRODUTO', buscas2) then
      begin
        frmCadRegrasProgramaFidelidade.tsFaixaMarcaProd.Caption := buscas2.FieldByName('descricao_regra').AsString;
        frmCadRegrasProgramaFidelidade.GroupBoxFaixaMarca.Caption := buscas2.FieldByName('descricao_regra').AsString;
    
        vDadosIni.abreStatusProcessamento('', 'CLASSE ' + buscas2.FieldByName('descricao_regra').AsString);
    //    Inc(I);
    //    GridResumo.Cells[0, I] := 'CLASSE ' + buscas2.FieldByName('descricao_regra').AsString;

        buscas.Close;
        buscas.SQL.Text := ' select rf.cod_tp_regra, crf.descricao_config, crf.perc_dia_real, ' +
         ' crf.pontos, pd.tipo, pr.cod_marca, ' +
         ' coalesce(pd.valor_total, 0) valor_tot_vnd, ' +
         ' coalesce(pd.valor_vale_prg, 0) valor_vale_prg, ' +
         ' max(coalesce((select coalesce(dp.valor_dev, 0) from devolucao_marca (pd.nped, pd.tipo, pd.cod_empresa, pr.cod_marca) dp), 0)) valor_dev, ' +
         ' coalesce(sum(coalesce(pp.vltot_ped_item, 0)) + sum(coalesce(pp.rateio_acresc, 0)) - sum(coalesce(pp.rateio_desc, 0)), 0) valor_total, ' +
         ' count(*) qtde_total from pedvenda pd ' +
         ' inner join clientes cl on cl.cod_cliente = pd.cod_cliente and cl.cod_empresa = pd.cod_empresa ' +
         ' left join tipo_faturamento tf on tf.codigo_faturamento = cl.codigo_faturamento and tf.ativo = 1 ' +
         ' inner join pedvenda_prod pp on pp.nped = pd.nped and pp.tipo = pd.tipo and pp.cod_empresa = pd.cod_empresa ' +
         ' inner join produtos pr on pr.grupo_prod = pp.grupo_prod and pr.cod_prod = pp.cod_prod and pr.cod_empresa = pp.cod_empresa ' +
         ' inner join tipo_vendas tv on pd.tipo = tv.tipo and ((pd.tipv = tv.sigla) or (pd.tipo_os = tv.tipo_os)) ' +
         '		and tv.venda = ''S'' and tv.gerar_pontos = ''S'' ' +
         ' inner join config_regras_prog_fidelidade crf on crf.valor_f_ini = pr.cod_marca and crf.cod_empresa = pp.cod_empresa ' +
         ' inner join regras_prog_fidelidade rf on rf.cod_tp_regra = crf.cod_tp_regra and rf.cod_empresa = crf.cod_empresa and rf.cod_tp_regra = :cod_tp_regra ' +
         ' where trim(pd.tipo) in (''REQ'', ''OS'') and coalesce(pd.status_ped, '''') = ''FECHADA'' ' +
         ' and (pp.status is null or pp.status = '''') ' +
         ' and pd.data_fech >= :dtini and pd.data_fech <= :dtfim and pd.cod_empresa = :cod_empresa ' +
         ' and coalesce(cl.cl_gerar_pontos, ''S'') <> ''N'' ' +
         ' and coalesce(tf.status_f, '''') <> ''BARRADO'' ' +
         ' and ((case when ((coalesce((select ndoc from existe_formas(pd.nped, pd.tipo, pd.cod_empresa)), 0)) > 0) then 1 else 0 end) > 0) ' +
         ' and pd.cod_cliente <> :cod_cliente ' +
         ' and pd.valor_total > abs(coalesce((select coalesce(valor_vale, 0) from existe_formas (pd.nped, pd.tipo, pd.cod_empresa)), 0)) ' +
         ' group by 1, 2, 3, 4, 5, 6, 7, 8 ' +
         ' union ' +
         ' select rf.cod_tp_regra, crf.descricao_config, crf.perc_dia_real, ' +
         ' crf.pontos, ''DEV'', pr.cod_marca, ' +
         ' coalesce(pd.valor_total, 0) valor_tot_vnd, ' +
         ' coalesce(pd.valor_vale_prg, 0) valor_vale_prg, ' +
         ' max(coalesce((select coalesce(dp.valor_dev, 0) from devolucao_marca (pd.nped, pd.tipo, pd.cod_empresa, pr.cod_marca) dp), 0)) valor_dev, ' +
         ' sum((-1) * case when (coalesce(dev.valor_tot, 0) > 0) then coalesce(dev.valor_tot, 0) else (coalesce(dev.valor, 0) * coalesce(dev.quant, 0)) end) valor_total, ' +
         ' count(*) qtde_total  from devolucao dev ' +
         ' inner join clientes cl on cl.cod_cliente = dev.cod_cliente and cl.cod_empresa = dev.cod_empresa ' +
         ' left join tipo_faturamento tf on tf.codigo_faturamento = cl.codigo_faturamento and tf.ativo = 1 ' +
         ' inner join produtos pr on pr.grupo_prod = dev.grupo_prod and pr.cod_prod = dev.cod_prod and pr.cod_empresa = dev.cod_empresa ' +
         ' inner join pedvenda pd on pd.nped = coalesce(dev.cod_venda, 0) and trim(pd.tipo) = trim(dev.tipo_venda) and pd.cod_empresa = dev.cod_empresa ' +
         ' inner join tipo_vendas tv on pd.tipo = tv.tipo and ((pd.tipv = tv.sigla) or (pd.tipo_os = tv.tipo_os)) ' +
         ' 		and tv.venda = ''S'' and tv.gerar_pontos = ''S'' ' +
         ' inner join config_regras_prog_fidelidade crf on crf.valor_f_ini = pr.cod_marca and crf.cod_empresa = dev.cod_empresa ' +
         ' inner join regras_prog_fidelidade rf on rf.cod_tp_regra = crf.cod_tp_regra and rf.cod_empresa = crf.cod_empresa and rf.cod_tp_regra = :cod_tp_regra ' +
         ' where trim(dev.tipo_venda) in (''REQ'', ''OS'') ' +
         ' and pd.data_fech >= :dtini and pd.data_fech <= :dtfim and pd.cod_empresa = :cod_empresa ' +
         ' and coalesce(pd.cl_gerar_pontos, coalesce(cl.cl_gerar_pontos, ''S'')) <> ''N'' ' +
         ' and coalesce(pd.cl_status_f, coalesce(tf.status_f, '''')) <> ''BARRADO'' ' +
         ' and ((case when ((coalesce((select ndoc from existe_formas(pd.nped, pd.tipo, pd.cod_empresa)), 0)) > 0) then 1 else 0 end) > 0) ' +
         ' and pd.cod_cliente <> :cod_cliente ' +
         ' and pd.valor_total > abs(coalesce((select coalesce(valor_vale, 0) from existe_formas (pd.nped, pd.tipo, pd.cod_empresa)), 0)) ' +
         ' group by 1, 2, 3, 4, 5, 6, 7, 8 ' +
         ' union ' +
         ' select rf.cod_tp_regra, crf.descricao_config, crf.perc_dia_real, ' +
         ' crf.pontos, ''DEVA'', pr.cod_marca, ' +
         ' 0 valor_tot_vnd, 0 valor_vale_prg, 0 valor_dev, ' +
         ' sum((-1) * case when (coalesce(dev.valor_tot, 0) > 0) then coalesce(dev.valor_tot, 0) else (coalesce(dev.valor, 0) * coalesce(dev.quant, 0)) end) valor_total, ' +
         ' count(*) qtde_total from devolucao dev ' +
         ' inner join clientes cl on cl.cod_cliente = dev.cod_cliente and cl.cod_empresa = dev.cod_empresa ' +
         ' left join tipo_faturamento tf on tf.codigo_faturamento = cl.codigo_faturamento and tf.ativo = 1 ' +
         ' inner join produtos pr on pr.grupo_prod = dev.grupo_prod and pr.cod_prod = dev.cod_prod and pr.cod_empresa = dev.cod_empresa ' +
         ' inner join config_regras_prog_fidelidade crf on crf.valor_f_ini = pr.cod_marca and crf.cod_empresa = dev.cod_empresa ' +
         ' inner join regras_prog_fidelidade rf on rf.cod_tp_regra = crf.cod_tp_regra and rf.cod_empresa = crf.cod_empresa and rf.cod_tp_regra = :cod_tp_regra ' +
         ' where dev.data >= :dtini and dev.data <= :dtfim and dev.cod_empresa = :cod_empresa ' +
         ' and not((coalesce(dev.cod_venda, 0) > 0) and (dev.tipo_venda in (''REQ'', ''OS''))) ' +
         ' and coalesce(cl.cl_gerar_pontos, ''S'') <> ''N'' ' +
         ' and coalesce(tf.status_f, '''') <> ''BARRADO'' ' +
         ' and dev.cod_cliente <> :cod_cliente ' +
         ' group by 1, 2, 3, 4, 5, 6, 7, 8 ' +
         ' union ' +
         ' select rf.cod_tp_regra, crf.descricao_config, crf.perc_dia_real, ' +
         ' crf.pontos, '''' tipo, crf.valor_f_ini, ' +
         ' 0 valor_tot_vnd, 0 valor_vale_prg, 0 valor_dev, ' +
         ' 0 valor_total, 0 qtde_total from regras_prog_fidelidade rf ' +
         ' inner join config_regras_prog_fidelidade crf on crf.cod_tp_regra = rf.cod_tp_regra and crf.cod_empresa = rf.cod_empresa ' +
         ' where rf.cod_tp_regra = :cod_tp_regra and rf.cod_empresa = :cod_empresa ' +
         ' order by 6 ';
        buscas.ParamByName('cod_tp_regra').AsInteger := buscas2.FieldByName('cod_tp_regra').AsInteger;
        buscas.ParamByName('dtini').AsString := pdataini;
        buscas.ParamByName('dtfim').AsString := pdatafim;
        buscas.ParamByName('cod_cliente').AsInteger := StrToInt(vDadosIni.vCliente.vCodClientePadrao);
        buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
        buscas.Open;
        buscas.FetchAll;

        frmCadRegrasProgramaFidelidade.ProgressBar1.Min := 0;
        frmCadRegrasProgramaFidelidade.ProgressBar1.Max := buscas.RecordCount;
        frmCadRegrasProgramaFidelidade.ProgressBar1.Position := 0;

        frmCadRegrasProgramaFidelidade.Label79.Caption := InttoStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Position) +
           ' / ' + InttoStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Max);

        try
          buscas.First;
          while not buscas.Eof do
          begin
            Application.ProcessMessages;
           
            fTempFaixaMarcaProduto.Filtered := false;
            fTempFaixaMarcaProduto.Filter := 'valor_f_ini = ' + IntToStr(buscas.FieldByName('cod_marca').AsInteger);
            fTempFaixaMarcaProduto.Filtered := true;

//            vValorTemp := buscas.FieldByName('valor_total').AsFloat;
         	vValorTemp := vDadosIni.IfThen(buscas.FieldByName('valor_tot_vnd').AsFloat > 0,
            	((buscas.FieldByName('valor_tot_vnd').AsFloat - buscas.FieldByName('valor_vale_prg').AsFloat) /
            	 buscas.FieldByName('valor_tot_vnd').AsFloat) * buscas.FieldByName('valor_total').AsFloat,
                buscas.FieldByName('valor_total').AsFloat - buscas.FieldByName('valor_dev').AsFloat);
            vQtdTemp := buscas.FieldByName('qtde_total').AsFloat;

//            vValorTempTot := vValorTempTot + buscas.FieldByName('valor_total').AsFloat;
         	vValorTempTot := vValorTempTot + vDadosIni.IfThen(buscas.FieldByName('valor_tot_vnd').AsFloat > 0,
            	((buscas.FieldByName('valor_tot_vnd').AsFloat - buscas.FieldByName('valor_vale_prg').AsFloat) /
            	 buscas.FieldByName('valor_tot_vnd').AsFloat) * buscas.FieldByName('valor_total').AsFloat,
                buscas.FieldByName('valor_total').AsFloat - buscas.FieldByName('valor_dev').AsFloat);
            vQtdTempTot := vQtdTempTot + buscas.FieldByName('qtde_total').AsFloat;

            if fTempFaixaMarcaProduto.IsEmpty then
            begin
              fTempFaixaMarcaProduto.Insert;
              fTempFaixaMarcaProduto.FieldByName('cod_tp_regra').AsInteger := buscas.FieldByName('cod_tp_regra').AsInteger;
              fTempFaixaMarcaProduto.FieldByName('descricao_config').AsString := trim(buscas.FieldByName('descricao_config').AsString);
              fTempFaixaMarcaProduto.FieldByName('valor_f_ini').AsInteger := buscas.FieldByName('cod_marca').AsInteger;
              fTempFaixaMarcaProduto.FieldByName('pontos').AsFloat := buscas.FieldByName('pontos').AsFloat;
              fTempFaixaMarcaProduto.FieldByName('qtde_total').AsFloat := fTempFaixaMarcaProduto.FieldByName('qtde_total').AsFloat + vQtdTemp;
              fTempFaixaMarcaProduto.FieldByName('valor_total').AsFloat := fTempFaixaMarcaProduto.FieldByName('valor_total').AsFloat + vValorTemp;
              fTempFaixaMarcaProduto.FieldByName('perc').AsFloat := 0;
              fTempFaixaMarcaProduto.Post;
            end
            else
            begin
              fTempFaixaMarcaProduto.Edit;
              fTempFaixaMarcaProduto.FieldByName('qtde_total').AsFloat := fTempFaixaMarcaProduto.FieldByName('qtde_total').AsFloat + vQtdTemp;
              fTempFaixaMarcaProduto.FieldByName('valor_total').AsFloat := fTempFaixaMarcaProduto.FieldByName('valor_total').AsFloat + vValorTemp;
              fTempFaixaMarcaProduto.FieldByName('perc').AsFloat := 0;
              fTempFaixaMarcaProduto.Post;
            end;

            buscas.Next;

            frmCadRegrasProgramaFidelidade.Label79.Caption := IntToStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Position) +
              ' / ' + IntToStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Max);
            frmCadRegrasProgramaFidelidade.ProgressBar1.Position := frmCadRegrasProgramaFidelidade.ProgressBar1.Position + 1;
          end;
        finally
           fTempFaixaMarcaProduto.Filtered := false;
           fTempFaixaMarcaProduto.IndexFieldNames := 'valor_f_ini;';
        end;

        fTempFaixaMarcaProduto.First;
        while not fTempFaixaMarcaProduto.Eof do
        begin
          fTempFaixaMarcaProduto.Edit;
          fTempFaixaMarcaProduto.FieldByName('perc').AsFloat :=
            vDadosIni.IfThen(vValorTempTot > 0,
              (fTempFaixaMarcaProduto.FieldByName('valor_total').AsFloat / vValorTempTot) * 100, 0);
          fTempFaixaMarcaProduto.FieldByName('tot_pontos').AsFloat :=
             fTempFaixaMarcaProduto.FieldByName('valor_total').AsFloat * fTempFaixaMarcaProduto.FieldByName('pontos').AsFloat;

          vPercTempTotal := vPercTempTotal + fTempFaixaMarcaProduto.FieldByName('perc').AsFloat;
          vPontosTempTotal := vPontosTempTotal + fTempFaixaMarcaProduto.FieldByName('tot_pontos').AsFloat;

          fTempFaixaMarcaProduto.Post;

          if pDet then
          begin
           Inc(I);
           GridResumo.Cells[0, I] := {IntToStr(fTempFaixaMarcaProduto.FieldByName('cod_tp_regra').AsInteger) + ' - ' +}
             fTempFaixaMarcaProduto.FieldByName('descricao_config').AsString;
           GridResumo.Cells[1, I] := FormatFloat('#,##0.00', fTempFaixaMarcaProduto.FieldByName('tot_pontos').AsFloat);
           GridResumo.RowCount := I + 1;
          end;

          fTempFaixaMarcaProduto.Next;
        end;

        fTempFaixaMarcaProduto.First;
        Inc(I);
        GridResumo.Cells[0, I] := {IntToStr(buscas2.FieldByName('cod_tp_regra').AsInteger) + ' - }'TOTAL CLASSE ' +
          buscas2.FieldByName('descricao_regra').AsString;
        GridResumo.Cells[1, I] := FormatFloat('#,##0.00', vPontosTempTotal);
        GridResumo.RowCount := I + 1;
      end;
      frmCadRegrasProgramaFidelidade.DBGridFaixaMarca.DataSource := fTempFaixaMarcaProdutoDtSource;
      frmCadRegrasProgramaFidelidade.tsFaixaMarcaProd.TabVisible := not fTempFaixaMarcaProduto.IsEmpty;
      frmCadRegrasProgramaFidelidade.LabelPercTotFaixaMarca.Caption := FormatFloat('#,##0.00', vPercTempTotal);
      frmCadRegrasProgramaFidelidade.LabelValorTotFaixaMarca.Caption := FormatFloat('#,##0.00', vValorTempTot);
      frmCadRegrasProgramaFidelidade.LabelPontosTotalFaixaMarca.Caption := FormatFloat('#,##0.00', vPontosTempTotal);
      vTotPontosG := vTotPontosG + vPontosTempTotal;

      vValorTemp := 0;
      vQtdTemp := 0;
      vValorTempTot := 0;
      vQtdTempTot := 0;
      vPercTempTotal := 0;
      vPontosTempTotal := 0;
      //Faixa de Pontos por Kit
      // Verificar se regra existe
      if verificarRegra('FAIXA DE PONTOS POR KIT DE PRODUTO', buscas2) then
      begin
        frmCadRegrasProgramaFidelidade.tsFaixaKitProd.Caption := buscas2.FieldByName('descricao_regra').AsString;
        frmCadRegrasProgramaFidelidade.GroupBoxFaixaKitProd.Caption := buscas2.FieldByName('descricao_regra').AsString;

        vDadosIni.abreStatusProcessamento('', 'CLASSE ' + buscas2.FieldByName('descricao_regra').AsString);
    //    Inc(I);
    //    GridResumo.Cells[0, I] := 'CLASSE ' + buscas2.FieldByName('descricao_regra').AsString;

        buscas.Close;
        buscas.SQL.Text := ' select rf.cod_tp_regra, crf.descricao_config, crf.perc_dia_real, ' +
          ' crf.pontos, pd.tipo, pp.codigo_kit, ' +
          ' coalesce(pd.valor_total, 0) valor_tot_vnd, ' +
          ' coalesce(pd.valor_vale_prg, 0) valor_vale_prg, 0 valor_dev, ' +
          ' coalesce(sum(coalesce(pp.vltot_ped_item, 0)) + sum(coalesce(pp.rateio_acresc, 0)) - sum(coalesce(pp.rateio_desc, 0)), 0) valor_total, ' +
          ' count(*) qtde_total from pedvenda pd ' +
          ' inner join clientes cl on cl.cod_cliente = pd.cod_cliente and cl.cod_empresa = pd.cod_empresa ' +
          ' left join tipo_faturamento tf on tf.codigo_faturamento = cl.codigo_faturamento and tf.ativo = 1 ' +
          ' inner join pedvenda_prod pp on pp.nped = pd.nped and pp.tipo = pd.tipo and pp.cod_empresa = pd.cod_empresa ' +
          ' inner join tipo_vendas tv on pd.tipo = tv.tipo and ((pd.tipv = tv.sigla) or (pd.tipo_os = tv.tipo_os)) ' +
          ' 		and tv.venda = ''S'' and tv.gerar_pontos = ''S'' ' +
          ' inner join config_regras_prog_fidelidade crf on crf.valor_f_ini = pp.codigo_kit and crf.cod_empresa = pp.cod_empresa ' +
          ' inner join regras_prog_fidelidade rf on rf.cod_tp_regra = crf.cod_tp_regra and rf.cod_empresa = crf.cod_empresa and rf.cod_tp_regra = :cod_tp_regra ' +
          ' where trim(pd.tipo) in (''REQ'', ''OS'') and coalesce(pd.status_ped, '''') = ''FECHADA'' ' +
          ' and (pp.status is null or pp.status = '''') ' +
          ' and pd.data_fech >= :dtini and pd.data_fech <= :dtfim and pd.cod_empresa = :cod_empresa ' +
          ' and coalesce(cl.cl_gerar_pontos, ''S'') <> ''N'' ' +
          ' and coalesce(tf.status_f, '''') <> ''BARRADO'' ' +
          ' and ((case when ((coalesce((select ndoc from existe_formas(pd.nped, pd.tipo, pd.cod_empresa)), 0)) > 0) then 1 else 0 end) > 0) ' +
          ' and pd.cod_cliente <> :cod_cliente ' +
          ' and pd.valor_total > abs(coalesce((select coalesce(valor_vale, 0) from existe_formas (pd.nped, pd.tipo, pd.cod_empresa)), 0)) ' +
          ' group by 1, 2, 3, 4, 5, 6, 7, 8 ' +
          ' union ' +
          ' select rf.cod_tp_regra, crf.descricao_config, crf.perc_dia_real, ' +
          ' crf.pontos, '''' tipo, crf.valor_f_ini, ' +
          ' 0 valor_tot_vnd, 0 valor_vale_prg, 0 valor_dev, ' +
          ' 0 valor_total, 0 qtde_total from regras_prog_fidelidade rf ' +
          ' inner join config_regras_prog_fidelidade crf on crf.cod_tp_regra = rf.cod_tp_regra and crf.cod_empresa = rf.cod_empresa ' +
          ' where rf.cod_tp_regra = :cod_tp_regra and rf.cod_empresa = :cod_empresa ' +
          ' order by 6 ';
        buscas.ParamByName('cod_tp_regra').AsInteger := buscas2.FieldByName('cod_tp_regra').AsInteger;
        buscas.ParamByName('dtini').AsString := pdataini;
        buscas.ParamByName('dtfim').AsString := pdatafim;
        buscas.ParamByName('cod_cliente').AsInteger := StrToInt(vDadosIni.vCliente.vCodClientePadrao);
        buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
        buscas.Open;
        buscas.FetchAll;

        frmCadRegrasProgramaFidelidade.ProgressBar1.Min := 0;
        frmCadRegrasProgramaFidelidade.ProgressBar1.Max := buscas.RecordCount;
        frmCadRegrasProgramaFidelidade.ProgressBar1.Position := 0;

        frmCadRegrasProgramaFidelidade.Label79.Caption := InttoStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Position) +
           ' / ' + InttoStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Max);

        try
          buscas.First;
          while not buscas.Eof do
          begin
            Application.ProcessMessages;
           
            fTempFaixaKitProduto.Filtered := false;
            fTempFaixaKitProduto.Filter := 'valor_f_ini = ' + IntToStr(buscas.FieldByName('codigo_kit').AsInteger);
            fTempFaixaKitProduto.Filtered := true;

//            vValorTemp := buscas.FieldByName('valor_total').AsFloat;
         	vValorTemp := vDadosIni.IfThen(buscas.FieldByName('valor_tot_vnd').AsFloat > 0,
            	((buscas.FieldByName('valor_tot_vnd').AsFloat - buscas.FieldByName('valor_vale_prg').AsFloat) /
            	 buscas.FieldByName('valor_tot_vnd').AsFloat) * buscas.FieldByName('valor_total').AsFloat,
                buscas.FieldByName('valor_total').AsFloat - buscas.FieldByName('valor_dev').AsFloat);
            vQtdTemp := buscas.FieldByName('qtde_total').AsFloat;

//            vValorTempTot := vValorTempTot + buscas.FieldByName('valor_total').AsFloat;
         	vValorTempTot := vValorTempTot + vDadosIni.IfThen(buscas.FieldByName('valor_tot_vnd').AsFloat > 0,
            	((buscas.FieldByName('valor_tot_vnd').AsFloat - buscas.FieldByName('valor_vale_prg').AsFloat) /
            	 buscas.FieldByName('valor_tot_vnd').AsFloat) * buscas.FieldByName('valor_total').AsFloat,
                buscas.FieldByName('valor_total').AsFloat - buscas.FieldByName('valor_dev').AsFloat);
            vQtdTempTot := vQtdTempTot + buscas.FieldByName('qtde_total').AsFloat;

            if fTempFaixaKitProduto.IsEmpty then
            begin
              fTempFaixaKitProduto.Insert;
              fTempFaixaKitProduto.FieldByName('cod_tp_regra').AsInteger := buscas.FieldByName('cod_tp_regra').AsInteger;
              fTempFaixaKitProduto.FieldByName('descricao_config').AsString := trim(buscas.FieldByName('descricao_config').AsString);
              fTempFaixaKitProduto.FieldByName('valor_f_ini').AsInteger := buscas.FieldByName('codigo_kit').AsInteger;
              fTempFaixaKitProduto.FieldByName('pontos').AsFloat := buscas.FieldByName('pontos').AsFloat;
              fTempFaixaKitProduto.FieldByName('qtde_total').AsFloat := fTempFaixaKitProduto.FieldByName('qtde_total').AsFloat + vQtdTemp;
              fTempFaixaKitProduto.FieldByName('valor_total').AsFloat := fTempFaixaKitProduto.FieldByName('valor_total').AsFloat + vValorTemp;
              fTempFaixaKitProduto.FieldByName('perc').AsFloat := 0;
              fTempFaixaKitProduto.Post;
            end
            else
            begin
              fTempFaixaKitProduto.Edit;
              fTempFaixaKitProduto.FieldByName('qtde_total').AsFloat := fTempFaixaKitProduto.FieldByName('qtde_total').AsFloat + vQtdTemp;
              fTempFaixaKitProduto.FieldByName('valor_total').AsFloat := fTempFaixaKitProduto.FieldByName('valor_total').AsFloat + vValorTemp;
              fTempFaixaKitProduto.FieldByName('perc').AsFloat := 0;
              fTempFaixaKitProduto.Post;
            end;

            buscas.Next;

            frmCadRegrasProgramaFidelidade.Label79.Caption := IntToStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Position) +
              ' / ' + IntToStr(frmCadRegrasProgramaFidelidade.ProgressBar1.Max);
            frmCadRegrasProgramaFidelidade.ProgressBar1.Position := frmCadRegrasProgramaFidelidade.ProgressBar1.Position + 1;
          end;
        finally
           fTempFaixaKitProduto.Filtered := false;
           fTempFaixaKitProduto.IndexFieldNames := 'valor_f_ini;';
        end;

        fTempFaixaKitProduto.First;
        while not fTempFaixaKitProduto.Eof do
        begin
          fTempFaixaKitProduto.Edit;
          fTempFaixaKitProduto.FieldByName('perc').AsFloat :=
            vDadosIni.IfThen(vValorTempTot > 0,
              (fTempFaixaKitProduto.FieldByName('valor_total').AsFloat / vValorTempTot) * 100, 0);
          fTempFaixaKitProduto.FieldByName('tot_pontos').AsFloat :=
             fTempFaixaKitProduto.FieldByName('valor_total').AsFloat * fTempFaixaKitProduto.FieldByName('pontos').AsFloat;

          vPercTempTotal := vPercTempTotal + fTempFaixaKitProduto.FieldByName('perc').AsFloat;
          vPontosTempTotal := vPontosTempTotal + fTempFaixaKitProduto.FieldByName('tot_pontos').AsFloat;

          fTempFaixaKitProduto.Post;

          if pDet then
          begin
           Inc(I);
           GridResumo.Cells[0, I] := {IntToStr(fTempFaixaKitProduto.FieldByName('cod_tp_regra').AsInteger) + ' - ' +}
             fTempFaixaKitProduto.FieldByName('descricao_config').AsString;
           GridResumo.Cells[1, I] := FormatFloat('#,##0.00', fTempFaixaKitProduto.FieldByName('tot_pontos').AsFloat);
           GridResumo.RowCount := I + 1;
          end;


          fTempFaixaKitProduto.Next;
        end;

        fTempFaixaKitProduto.First;
        Inc(I);
        GridResumo.Cells[0, I] := {IntToStr(buscas2.FieldByName('cod_tp_regra').AsInteger) + ' - }'TOTAL CLASSE ' +
          buscas2.FieldByName('descricao_regra').AsString;
        GridResumo.Cells[1, I] := FormatFloat('#,##0.00', vPontosTempTotal);
        GridResumo.RowCount := I + 1;
      end;
      frmCadRegrasProgramaFidelidade.DBGridFaixaKitProd.DataSource := fTempFaixaKitProdutoDtSource;
      frmCadRegrasProgramaFidelidade.tsFaixaKitProd.TabVisible := not fTempFaixaKitProduto.IsEmpty;
      frmCadRegrasProgramaFidelidade.LabelPercTotFaixaKitProd.Caption := FormatFloat('#,##0.00', vPercTempTotal);
      frmCadRegrasProgramaFidelidade.LabelValorTotFaixaKitProd.Caption := FormatFloat('#,##0.00', vValorTempTot);
      frmCadRegrasProgramaFidelidade.LabelPontosTotalFaixaKitProd.Caption := FormatFloat('#,##0.00', vPontosTempTotal);
      vTotPontosG := vTotPontosG + vPontosTempTotal;

      frmCadRegrasProgramaFidelidade.LabelTotPontosG.Caption:= FormatFloat('#,##0', Round(vTotPontosG));

      Inc(I);
      GridResumo.Cells[0, I] := 'TOTAL GERAL';
      GridResumo.Cells[1, I] := FormatFloat('#,##0.00', vTotPontosG);
      GridResumo.RowCount := I + 1;
      vDadosIni.fechaStatusProcessamento;

      if not vFocoResumo then
      begin
        frmCadRegrasProgramaFidelidade.PageControl2.ActivePage := frmCadRegrasProgramaFidelidade.tsResumo;
        frmCadRegrasProgramaFidelidade.tsResumo.Show;
      end;

      vDataIniSim := pdataini;
      vDataFimSim := pdatafim;
      vSimRealizada := true;

      Result := true;
  except
    on e: Exception do
    begin
      Result := false;
      RollBackTransacao;
      Application.MessageBox(pchar('simularProgramaFidelidade: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro('simularProgramaFidelidade: ' + e.Message);
    end;
  end;
  finally
     frmCadRegrasProgramaFidelidade.PanelProg.Visible := false;
     if Assigned(buscas2) then
       FreeAndNil(buscas2);
  end;
end;

function TRegrasProgramasFidelidades.testarDataSimulacao(var pMensagem: string; var pCampo: string; pTemp: string; pExibirProc: boolean = false): boolean;
var
  vOK: boolean;
begin
  vOK := vDadosIni.IfThen(pExibirProc, true, false);
  Result := false;

  if not vTaxaProgramasFidelidades.dataSet.Active then
    vTaxaProgramasFidelidades.abreTaxaProgramaFidelidades;

  if vTaxaProgramasFidelidades.dataSet.IsEmpty then
  begin
    Result := true;
    exit;
  end; 

  if not vTaxaProgramasFidelidades.dataSet.IsEmpty then
    if (vTaxaProgramasFidelidades.dataSet.FieldByName('DATA_CAD').AsDateTime = vDadosIni.getDataBanco(buscas)) then
    begin
      pMensagem := 'Já existe uma simulação realizada nesta data.';
      pCampo := '';

      if pExibirProc then
        if Application.MessageBox('Já existe simulação uma simulação realizada na data atual, deseja continuar assim mesmo?',
          'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> idYES then
          vOK := false
        else
          vOK := true;

      if pExibirProc then
        if vOK then
          if not vDadosIni.PesqPros('FID014', 'CONFIRMAR', pTemp, 'TAXA_CONV_PROG_FIDELIDADE', '', buscas, true) then
            vOK := false
          else
            vOK := true;

      if not vOK then
       exit;
    end;

  Result := true;
end;

function TRegrasProgramasFidelidades.tiposvendasconfigurados(
  pbuscas: TIBQuery): boolean;
begin
   Result := true;

   SqlOpen(' select count(*) from tipo_vendas ' +
      ' where tipo in (''REQ'', ''OS'', ''VEI'') and gerar_pontos = ''S'' ', pbuscas);
   if pbuscas.FieldByName('COUNT').AsInteger <= 0 then
   begin
     Result := false;
     Application.MessageBox('Nenhum tipo de venda configurado para gerar pontos!', 'Atenção', 0 + 64);
     Exit;
   end;
end;

function TRegrasProgramasFidelidades.verificarRegra(pTipo: string; pBuscas: TIBQuery): boolean;
begin
  Result := false;

  SqlOpen('select rf.descricao_regra, cf.valor_vc, cf.valor_f_ini, cf.valor_f_fim, cf.perc_dia_real, ' +
     ' cf.cod_tp_regra, cf.descricao_config, cf.pontos, ' +
     ' cf.grupo_prod, cf.cod_prod from config_regras_prog_fidelidade cf ' +
     ' inner join regras_prog_fidelidade rf on rf.cod_tp_regra = cf.cod_tp_regra  and rf.cod_empresa = cf.cod_empresa ' +
     ' where cf.cod_empresa = ' + vDadosIni.codEmpresa + ' and rf.situacao = ''ATIVA'' ' +
     ' and rf.descricao_regra = ' + QuotedStr(pTipo) +
     ' order by 1, 2 ', pBuscas);
  pBuscas.FetchAll;

  Result := not pBuscas.IsEmpty;
end;

{ TConfigRegrasProgramasFidelidades }

function TConfigRegrasProgramasFidelidades.abreConfigRegrasProgramaFidelidades(pCodTipo: Integer): boolean;
begin
  Result := montaSelect(' select cf.*, rg.descricao_regra from config_regras_prog_fidelidade cf ' +
   	' inner join regras_prog_fidelidade rg on rg.cod_tp_regra = cf.cod_tp_regra and rg.cod_empresa = cf.cod_empresa ' +
   	' where cf.cod_tp_regra = ' + IntToStr(pCodTipo) + ' and cf.cod_empresa = ' + vDadosIni.codEmpresa + 
      ' order by cf.pontos ');
end;

function TConfigRegrasProgramasFidelidades.buscaGrupo(pcodgrupo: Integer;
  var pgrupo: string): boolean;
begin
  Result := false;

  try
    SqlOpen(' select descricao from grupos ' +
      ' where codigo_grup = ' + IntToStr(pcodgrupo) +
      ' and ativo = 1 ');

    if buscas.IsEmpty then
     raise exception.create('Grupo não encontrado');

    pgrupo := trim(buscas.FieldByName('descricao').AsString);

  	 Result := true;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TConfigRegrasProgramasFidelidades.buscaKit(pcodkit: Integer;
  var pkit: string): boolean;
begin
  Result := false;

  try
    SqlOpen(' select descricao_kit from kits_prod ' +
      ' where codigo_kit = ' + IntToStr(pcodkit) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and ativo = 1 ');

    if buscas.IsEmpty then
     raise exception.create('Kit não encontrado');

    pkit := trim(buscas.FieldByName('descricao_kit').AsString);

  	 Result := true;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TConfigRegrasProgramasFidelidades.buscaMarca(pcodmarca: Integer;
  var pmarca: string): boolean;
begin
   Result := false;

  try
    SqlOpen(' select descricao_marca from marca_prod ' +
      ' where cod_marca = ' + IntToStr(pcodmarca) +
      ' and ativo = 1 ');

    if buscas.IsEmpty then
     raise exception.create('Marca não encontrada');

    pmarca := trim(buscas.FieldByName('descricao_marca').AsString);

  	 Result := true;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TConfigRegrasProgramasFidelidades.buscaProduto(codBarra: string; var pgrupoprod: string; var pcodprod: string; var vdescricaoprod: string): boolean;
var
 buscas2: TIBQuery;
 vgrupoprod: Integer;
 vcodprod: string;
begin
  Result := false;

  try
    buscas2 := TIBQuery.Create(Application);
    buscas2.Database := buscas.Database;
    buscas2.Transaction := buscas.Transaction;

    SqlOpen(' select distinct(p.*) from produtos p inner join cod_barra cb ' +
        ' on p.grupo_prod=cb.grupo_prod and p.cod_prod=cb.cod_prod and p.cod_empresa=cb.cod_empresa ' +
        ' where p.cod_empresa = ' + vDadosIni.codEmpresa +
        ' and cb.cod_barra=' + QuotedStr(codBarra) + ' and p.ativo = 1');

     if buscas.IsEmpty then
     begin
       SqlOpen('select * from cod_barra ' +
         ' where cod_barra = ' + QuotedStr(codBarra) + ' and ativo = 1 and cod_empresa = ' + vDadosIni.codEmpresa, buscas2);
       if buscas2.IsEmpty then
         raise exception.create('Produto não encontrado');

       vgrupoprod := buscas2.FieldByName('grupo_prod').AsInteger;
       vcodprod := buscas2.FieldByName('cod_prod').AsString;

       SqlOpen(' select * from produtos ' +
         ' where grupo_prod = ' + IntToStr(vgrupoprod) +
         ' and cod_prod = ' + QuotedStr(trim(vcodprod)) +
         ' and ativo = 1 and cod_empresa = ' + vDadosIni.codEmpresa, buscas2);
       if buscas2.IsEmpty then
         raise exception.create('Produto não encontrado');

       pgrupoprod := buscas2.FieldByName('grupo_prod').AsString;
       pcodprod := buscas2.FieldByName('cod_prod').AsString;
       vdescricaoprod := trim(buscas2.FieldByName('descr_prod').AsString);
     end
     else
     begin
       pgrupoprod := buscas.FieldByName('grupo_prod').AsString;
       pcodprod := buscas.FieldByName('cod_prod').AsString;
       vdescricaoprod := trim(buscas.FieldByName('descr_prod').AsString);
     end;
     
     Result := true;
   except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TConfigRegrasProgramasFidelidades.buscaSubGrupo(pcodsubgrupo: Integer;
  var psubgrupo: string): boolean;
begin
  Result := false;

  try
    SqlOpen(' select descricao from sub_grupo ' +
      ' where codigo_subgr = ' + IntToStr(pcodsubgrupo) +
      ' and ativo = 1 ');

    if buscas.IsEmpty then
     raise exception.create('Sub Grupo não encontrado');

    psubgrupo := trim(buscas.FieldByName('descricao').AsString);

  	 Result := true;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TConfigRegrasProgramasFidelidades.verificarGrupo(
  pcodgrupo: Integer): boolean;
begin
  Result := false;

  SqlOpen(' select descricao from grupos ' +
    ' where codigo_grup = ' + IntToStr(pcodgrupo) +
    ' and ativo = 1 ');
  Result := not buscas.IsEmpty;
end;

function TConfigRegrasProgramasFidelidades.verificarKit(pcodkit: Integer): boolean;
begin
  Result := false;

  SqlOpen(' select descricao_kit from kits_prod ' +
    ' where codigo_kit = ' + IntToStr(pcodkit) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa +
    ' and ativo = 1 ');
  Result := not buscas.IsEmpty;
end;

function TConfigRegrasProgramasFidelidades.verificarMarca(
  pcodmarca: Integer): boolean;
begin
  Result := false;

  SqlOpen(' select descricao_marca from marca_prod ' +
    ' where cod_marca = ' + IntToStr(pcodmarca) +
    ' and ativo = 1 ');
  Result := not buscas.IsEmpty;
end;

function TConfigRegrasProgramasFidelidades.verificarProduto(pgrupoprod: Integer; pcodprod: string): boolean;
begin
  Result := false;

  SqlOpen(' select * from produtos ' +
    ' where grupo_prod = ' + IntToStr(pgrupoprod) +
    ' and cod_prod = ' + QuotedStr(trim(pcodprod)) +
    ' and ativo = 1 and cod_empresa = ' + vDadosIni.codEmpresa);
  Result := not buscas.IsEmpty;
end;

constructor TConfigRegrasProgramasFidelidades.create;
begin
  dataSet := TClientDataSet(dtmConfig.cdsConfigRegrasFid);
  buscas := TIBQuery(dtmConfig.qrBuscas);
  transacao := TIBTransaction(dtmConfig.ibTransConfig);
end;

function TConfigRegrasProgramasFidelidades.delete(pCodTipo: Integer): boolean;
var
  vCodigo: string;
begin
  Result := False;
  if dataSet.IsEmpty then
    Exit;

  vCodigo := dataSet.FieldByName('CODIGO').AsString;
  
  if not vDadosIni.PesqPros('FID007', 'EXCLUIR', '', 'CONFIG_REGRAS_PROG_FIDELIDADE', vCodigo, buscas, true) then
    Exit;
  if Application.MessageBox(pchar('Deseja mesmo excluir o registro?'), 'Confirmação',
    MB_ICONQUESTION + MB_YESNO) <> IDYES then
    exit;

   buscas.Close;
   buscas.SQL.Text := 'delete from config_regras_prog_fidelidade ' +
     ' where codigo = ' + IntToStr(dataSet.FieldByName('CODIGO').AsInteger) +
     ' and cod_tp_regra = ' + IntToStr(pCodTipo) +
     ' and cod_empresa = ' + vDadosIni.codEmpresa;

   try
     buscas.ExecSQL;

     CommitaTransacao;
     vDadosIni.GravaAuditoria('FID007', 'EXCLUIR', 'SUCESSO', 'CONFIG_REGRAS_PROG_FIDELIDADE', vCodigo, buscas);
   except
     RollBackTransacao;
     vDadosIni.GravaAuditoria('FID007', 'EXCLUIR', 'FALHA', 'CONFIG_REGRAS_PROG_FIDELIDADE', vCodigo, buscas);
   end;
   Refresh;
end;

function TConfigRegrasProgramasFidelidades.insert(pCodTipo: Integer): boolean;
var
  vNitem: Integer;
begin
  Result := False;
  if not vDadosIni.PesqPros('FID006', 'INCLUIR', '', 'CONFIG_REGRAS_PROG_FIDELIDADE', '', buscas, true) then
    Exit;
  if not dataSet.Active then
    abreConfigRegrasProgramaFidelidades(pCodTipo);

  if inherited insert then
  begin
    dataSet.FieldByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    Result := True;
  end;
end;

function TConfigRegrasProgramasFidelidades.post(Regra: TRegrasProgramasFidelidades; pCodTipo: Integer): boolean;
var
  acao: string;
  vmensagem, vcampo: string;
  vtemp: string;
begin
  try
    Result := false;
    if dataSet.State = dsInsert then
      acao := 'INSERIR'
    else
      acao := 'EDITAR';

    if not vDadosIni.PesqPros('FID008', acao, '', 'CONFIG_REGRAS_PROG_FIDELIDADE', '', buscas, true) then
      Exit;

    if not (dataSet.State in [dsEdit, dsInsert]) then
    begin
      Result := true;
      exit;
    end;

    if (Regra.dataSet.FieldByName('descricao_regra').AsString = 'FAIXA DE PONTOS POR PRODUTO') then
    begin
       if dataSet.FieldByName('valor_vc').AsString = '' then
         raiseExceptionCreate('Produto não informado!', 'EditNumFabProduto');

       if dataSet.FieldByName('grupo_prod').AsInteger <= 0 then
         raiseExceptionCreate('Produto não informado!', 'EditNumFabProduto');

       if trim(dataSet.FieldByName('cod_prod').AsString) = '' then
         raiseExceptionCreate('Produto não informado!', 'EditNumFabProduto');

       if not verificarProduto(dataSet.FieldByName('grupo_prod').AsInteger, dataSet.FieldByName('cod_prod').AsString) then
         raiseExceptionCreate('Produto não encontrado!', 'EditNumFabProduto');

       if dataSet.FieldByName('pontos').AsFloat <= 0 then
         raiseExceptionCreate('Pontos não informados!', 'EditHwPontosProduto');
    end
    else if (Regra.dataSet.FieldByName('descricao_regra').AsString = 'FAIXA DE PONTOS POR KIT DE PRODUTO')
     or (Regra.dataSet.FieldByName('descricao_regra').AsString = 'FAIXA DE PONTOS POR GRUPO DE PRODUTO')
     or (Regra.dataSet.FieldByName('descricao_regra').AsString = 'FAIXA DE PONTOS POR SUBGRUPO DE PRODUTO')
     or (Regra.dataSet.FieldByName('descricao_regra').AsString = 'FAIXA DE PONTOS POR MARCA DE PRODUTO') then
    begin
       if (Regra.dataSet.FieldByName('descricao_regra').AsString = 'FAIXA DE PONTOS POR KIT DE PRODUTO') then
         vtemp := 'Kit'
       else if (Regra.dataSet.FieldByName('descricao_regra').AsString = 'FAIXA DE PONTOS POR GRUPO DE PRODUTO') then
         vtemp := 'Grupo'
       else if (Regra.dataSet.FieldByName('descricao_regra').AsString = 'FAIXA DE PONTOS POR SUBGRUPO DE PRODUTO') then
         vtemp := 'Sub Grupo'
       else if (Regra.dataSet.FieldByName('descricao_regra').AsString = 'FAIXA DE PONTOS POR MARCA DE PRODUTO') then
         vtemp := 'Marca';

       if dataSet.FieldByName('valor_f_ini').AsInteger < 0 then
         raiseExceptionCreate(vtemp + ' não informado!', 'EditHwKit');

       if (Regra.dataSet.FieldByName('descricao_regra').AsString = 'FAIXA DE PONTOS POR KIT DE PRODUTO') then
       begin
         if not verificarKit(dataSet.FieldByName('valor_f_ini').AsInteger) then
           raiseExceptionCreate(vtemp + ' não encontrado!', 'EditHwKit');
       end
       else if (Regra.dataSet.FieldByName('descricao_regra').AsString = 'FAIXA DE PONTOS POR GRUPO DE PRODUTO') then
       begin
         if not verificarGrupo(dataSet.FieldByName('valor_f_ini').AsInteger) then
           raiseExceptionCreate(vtemp + ' não encontrado!', 'EditHwKit');
       end
       else if (Regra.dataSet.FieldByName('descricao_regra').AsString = 'FAIXA DE PONTOS POR SUBGRUPO DE PRODUTO') then
       begin
         if not verificarSubGrupo(dataSet.FieldByName('valor_f_ini').AsInteger) then
           raiseExceptionCreate(vtemp + ' não encontrado!', 'EditHwKit');
       end
       else if (Regra.dataSet.FieldByName('descricao_regra').AsString = 'FAIXA DE PONTOS POR MARCA DE PRODUTO') then
       begin
         if not verificarMarca(dataSet.FieldByName('valor_f_ini').AsInteger) then
           raiseExceptionCreate(vtemp + ' não encontrada!', 'EditHwKit');
       end;

       if dataSet.FieldByName('pontos').AsFloat <= 0 then
         raiseExceptionCreate('Pontos não informados!', 'EditHwPontosKit');  
    end
    else if (Regra.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA DE PONTOS POR VALOR')
  	   or (Regra.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA VALOR DE COMPRA') then
    begin
       if dataSet.FieldByName('condicao_ini').AsString = '' then
         raiseExceptionCreate('Condição inicial não informada!', 'ComboBoxCondInicialFaixaCompra');

       if dataSet.FieldByName('condicao_fim').AsString = '' then
         raiseExceptionCreate('Condição final não informada!', 'ComboBoxCondFinalFaixaCompra');

       if dataSet.FieldByName('valor_f_ini').AsFloat <= 0 then
         raiseExceptionCreate('Valor inicial não informado!', 'EditHwValorIniFaixaCompra');

       if dataSet.FieldByName('valor_f_fim').AsFloat <= 0 then
         raiseExceptionCreate('Valor final não informado!', 'EditHwValorFimFaixaCompra');

       if (Regra.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA VALOR DE COMPRA') then
       begin
         if dataSet.FieldByName('pontos').AsFloat <= 0 then
           raiseExceptionCreate('Pontos não informados!', 'EditHwPontosFC');
       end
       else
       begin
//         if dataSet.FieldByName('perc_dia_real').AsFloat <= 0 then
//           raiseExceptionCreate('R$ não informado!', 'EditHwRealFV');

         if dataSet.FieldByName('pontos').AsFloat <= 0 then
           raiseExceptionCreate('Pontos não informados!', 'EditHwPontosFV');
       end;
    end
    else
    begin
        if (Regra.dataSet.FieldByName('descricao_regra').AsString = 'FORMAS DE PAGAMENTO')
          or (Regra.dataSet.FieldByName('descricao_regra').AsString = 'RECEBIMENTO DE PRESTACAO') then
        begin
          if dataSet.FieldByName('descricao_config').AsString = '' then
            raiseExceptionCreate('Campo não informado!', 'ComboBoxOutros2');
        end
        else
        begin
          if dataSet.FieldByName('descricao_config').AsString = '' then
            raiseExceptionCreate('Campo não informado!', 'ComboBoxOutros');
        end;

        if (Regra.dataSet.FieldByName('descricao_regra').AsString = 'FORMAS DE PAGAMENTO')
          and (dataSet.FieldByName('valor_vc').AsString = 'CRX') then
        begin
          if dataSet.FieldByName('perc_dia_real').AsFloat <= 0 then
             raiseExceptionCreate('Percentual não informado!', 'EditHwDiasPercOutros2');
             
          if dataSet.FieldByName('pontos').AsFloat <= 0 then
            raiseExceptionCreate('Pontos não informados!', 'EditHwPontosOutros2');
        end
        else if (Regra.dataSet.FieldByName('descricao_regra').AsString = 'RECEBIMENTO DE PRESTACAO')
          and ((dataSet.FieldByName('valor_vc').AsString = 'PAX') or (dataSet.FieldByName('valor_vc').AsString = 'PAX')) then
        begin
            if dataSet.FieldByName('perc_dia_real').AsFloat <= 0 then
              raiseExceptionCreate('Dias não informados!', 'EditHwDiasPercOutros2');

            if dataSet.FieldByName('pontos').AsFloat <= 0 then
             raiseExceptionCreate('Pontos não informados!', 'EditHwPontosOutros2');  
        end
        else
        begin
          if dataSet.FieldByName('pontos').AsFloat <= 0 then
            raiseExceptionCreate('Pontos não informados!', 'EditHwPontosOutros');
        end;
    end;

    if not verificarRegraCadastradas(Regra, vmensagem, vcampo) then
      raiseExceptionCreate(vmensagem, vcampo);

    if dataSet.State = dsInsert then
       dataSet.FieldByName('CODIGO').asInteger := Gencodigo('CONFIG_REGRAS_PROG_FIDELIDADE', dtmConfig.SpIncCodigo, vDadosIni.codEmpresa);
    dataSet.post;

    if dataSet.ChangeCount = 0 then
    begin
      Result := true;
      exit;
    end;

    Apply;
    CommitaTransacao;
    Result := true;

    if Result then
      vDadosIni.GravaAuditoria('FID008', acao, 'SUCESSO', 'CONFIG_REGRAS_PROG_FIDELIDADE', '', buscas)
    else
      vDadosIni.GravaAuditoria('FID008', acao, 'FALHA', 'CONFIG_REGRAS_PROG_FIDELIDADE', '', buscas);
    if Result then
      Refresh;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TConfigRegrasProgramasFidelidades.verificarRegraCadastradas(Regra: TRegrasProgramasFidelidades; var pmensagem, pcampo: string): boolean;
begin
  Result := true;

  try
    if (Regra.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA DE PONTOS POR VALOR')
      or (Regra.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA VALOR DE COMPRA') then
    begin
       buscas.Close;
       buscas.SQL.Text := ' select cf.codigo, cf.descricao_config from config_regras_prog_fidelidade cf ' +
         ' inner join regras_prog_fidelidade rf on rf.cod_tp_regra = cf.cod_tp_regra and rf.cod_empresa = cf.cod_empresa ' +
         ' where cf.cod_tp_regra = :cod_tp_regra and cf.cod_empresa = :cod_empresa ' +
         ' and (:valor >= cf.valor_f_ini and :valor <= cf.valor_f_fim) ';
       buscas.ParamByName('cod_tp_regra').AsInteger := Regra.dataSet.FieldByName('cod_tp_regra').AsInteger;
       buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
       buscas.ParamByName('valor').AsFloat := dataSet.FieldByName('valor_f_ini').AsFloat;
       buscas.Open;

       if buscas.IsEmpty then
       begin
         buscas.Close;
         buscas.SQL.Text := ' select cf.codigo, cf.descricao_config from config_regras_prog_fidelidade cf ' +
           ' inner join regras_prog_fidelidade rf on rf.cod_tp_regra = cf.cod_tp_regra and rf.cod_empresa = cf.cod_empresa ' +
           ' where cf.cod_tp_regra = :cod_tp_regra and cf.cod_empresa = :cod_empresa ' +
           ' and (:valor >= cf.valor_f_ini and :valor <= cf.valor_f_fim) ';
         buscas.ParamByName('cod_tp_regra').AsInteger := Regra.dataSet.FieldByName('cod_tp_regra').AsInteger;
         buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
         buscas.ParamByName('valor').AsFloat := dataSet.FieldByName('valor_f_fim').AsFloat;
         buscas.Open;
       end;
       
       if not buscas.IsEmpty then
       begin
         pmensagem := 'CLASSE ' + Regra.dataSet.FieldByName('DESCRICAO_REGRA').AsString + ':' +  #13 + #13 +
           buscas.FieldByName('descricao_config').AsString + #13 + #13 +
           'Valor de compra inicial e final informados estão entre a faixa de atuação da classe acima';
         pcampo := 'EditHwPontosFC';
         Result := false;
         exit;
       end;
    end
    else if (Regra.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'RECEBIMENTO DE PRESTACAO')
      or (Regra.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FORMAS DE PAGAMENTO') then
    begin
       buscas.Close;
       buscas.SQL.Text := ' select cf.codigo, cf.descricao_config from config_regras_prog_fidelidade cf ' +
         ' inner join regras_prog_fidelidade rf on rf.cod_tp_regra = cf.cod_tp_regra and rf.cod_empresa = cf.cod_empresa ' +
         ' where cf.cod_tp_regra = :cod_tp_regra and cf.cod_empresa = :cod_empresa ' +
         ' and cf.valor_vc = :valor_vc ' +
       vDadosIni.IfThen(dataSet.FieldByName('perc_dia_real').AsFloat > 0,
         ' and cf.perc_dia_real = :perc_dia_real ', ' and cf.perc_dia_real is null ');
       buscas.ParamByName('cod_tp_regra').AsInteger := Regra.dataSet.FieldByName('cod_tp_regra').AsInteger;
       buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
       buscas.ParamByName('valor_vc').AsString := dataSet.FieldByName('valor_vc').AsString;
       if dataSet.FieldByName('perc_dia_real').AsFloat > 0 then
         buscas.ParamByName('perc_dia_real').AsFloat := dataSet.FieldByName('perc_dia_real').AsFloat;
       buscas.Open;
       if not buscas.IsEmpty then
       begin
         pmensagem := 'CLASSE ' + Regra.dataSet.FieldByName('DESCRICAO_REGRA').AsString + ':' +  #13 + #13 +
           buscas.FieldByName('descricao_config').AsString + #13 + #13 +
           'Classe acima já definida';
         pcampo := 'ComboBoxOutros2';
         Result := false;
         exit;
       end;
    end
    else if Regra.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'ASSIDUIDADE' then
    begin
      SqlOpen(' select cf.codigo, cf.descricao_config from config_regras_prog_fidelidade cf ' +
        ' inner join regras_prog_fidelidade rf on rf.cod_tp_regra = cf.cod_tp_regra and rf.cod_empresa = cf.cod_empresa ' +
        ' where cf.cod_tp_regra = ' + IntToStr(Regra.dataSet.FieldByName('cod_tp_regra').AsInteger) +
        ' and cf.cod_empresa = ' + vDadosIni.codEmpresa +
        ' and cf.valor_vc = ' + QuotedStr(dataSet.FieldByName('valor_vc').AsString));
       if not buscas.IsEmpty then
       begin
         pmensagem := 'CLASSE ' + Regra.dataSet.FieldByName('DESCRICAO_REGRA').AsString + ':' +  #13 + #13 +
           buscas.FieldByName('descricao_config').AsString + #13 + #13 +
           'Classe acima já definida';
         pcampo := 'ComboBoxOutros';
         Result := false;
         exit;
       end;
    end
    else if (Regra.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA DE PONTOS POR MARCA DE PRODUTO')
      or (Regra.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA DE PONTOS POR GRUPO DE PRODUTO')
      or (Regra.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA DE PONTOS POR SUBGRUPO DE PRODUTO') then
    begin
      SqlOpen(' select cf.codigo, cf.descricao_config from config_regras_prog_fidelidade cf ' +
        ' inner join regras_prog_fidelidade rf on rf.cod_tp_regra = cf.cod_tp_regra and rf.cod_empresa = cf.cod_empresa ' +
        ' where cf.cod_tp_regra = ' + IntToStr(Regra.dataSet.FieldByName('cod_tp_regra').AsInteger) +
        ' and cf.cod_empresa = ' + vDadosIni.codEmpresa +
        ' and cf.valor_f_ini = ' + IntToStr(Trunc(dataSet.FieldByName('valor_f_ini').AsFloat)));
       if not buscas.IsEmpty then
       begin
         pmensagem := 'CLASSE ' + Regra.dataSet.FieldByName('DESCRICAO_REGRA').AsString + ':' + #13 + #13 +
           buscas.FieldByName('descricao_config').AsString + #13 + #13 +
           'Classe acima já definida';
         pcampo := 'ComboBoxOutros';
         Result := false;
         exit;
       end;
    end
    else if (Regra.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA DE PONTOS POR PRODUTO') then
    begin
      SqlOpen(' select cf.codigo, cf.descricao_config from config_regras_prog_fidelidade cf ' +
        ' inner join regras_prog_fidelidade rf on rf.cod_tp_regra = cf.cod_tp_regra and rf.cod_empresa = cf.cod_empresa ' +
        ' where cf.cod_tp_regra = ' + IntToStr(Regra.dataSet.FieldByName('cod_tp_regra').AsInteger) +
        ' and cf.grupo_prod = ' + IntToStr(dataSet.FieldByName('grupo_prod').AsInteger) +
        ' and cf.cod_prod = ' + QuotedStr(dataSet.FieldByName('cod_prod').AsString) +
        ' and cf.cod_empresa = ' + vDadosIni.codEmpresa);
       if not buscas.IsEmpty then
       begin
         pmensagem := 'CLASSE ' + Regra.dataSet.FieldByName('DESCRICAO_REGRA').AsString + ':' +  #13 + #13 +
           buscas.FieldByName('descricao_config').AsString + #13 + #13 +
           'Classe acima já definida';
         pcampo := 'EditNumFabProduto';
         Result := false;
         exit;
       end;
    end
    else if (Regra.dataSet.FieldByName('DESCRICAO_REGRA').AsString = 'FAIXA DE PONTOS POR KIT DE PRODUTO') then
    begin
     SqlOpen(' select cf.codigo, cf.descricao_config from config_regras_prog_fidelidade cf ' +
        ' inner join regras_prog_fidelidade rf on rf.cod_tp_regra = cf.cod_tp_regra and rf.cod_empresa = cf.cod_empresa ' +
        ' where cf.cod_tp_regra = ' + IntToStr(Regra.dataSet.FieldByName('cod_tp_regra').AsInteger) +
        ' and cf.cod_empresa = ' + vDadosIni.codEmpresa +
        ' and cf.valor_f_ini = ' + IntToStr(Trunc(dataSet.FieldByName('valor_f_ini').AsFloat)));
       if not buscas.IsEmpty then
       begin
         pmensagem := 'CLASSE ' + Regra.dataSet.FieldByName('DESCRICAO_REGRA').AsString + ':' + #13 + #13 +
           buscas.FieldByName('descricao_config').AsString + #13 + #13 +
           'Classe acima já definida';
         pcampo := 'EditHwKit';
         Result := false;
         exit;
       end;
    end;

  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TConfigRegrasProgramasFidelidades.verificarSubGrupo(
  pcodsubgrupo: Integer): boolean;
begin
  Result := false;

  SqlOpen(' select descricao from sub_grupo ' +
    ' where codigo_subgr = ' + IntToStr(pcodsubgrupo) +
    ' and ativo = 1 ');
  Result := not buscas.IsEmpty;
end;

{ TTaxaProgramasFidelidades }

function TTaxaProgramasFidelidades.abreTaxaProgramaFidelidades: boolean;
begin
  Result := montaSelect(' select first 1 tx.*, col.nome_vendedor from taxa_conv_prog_fidelidade tx ' +
  	 ' inner join colaborador col on col.cod_vendedor = tx.cod_usuario and col.cod_empresa = tx.cod_empresa ' +
    ' where tx.cod_empresa = ' + vDadosIni.codEmpresa +
    ' order by tx.codigo desc ');
end;

constructor TTaxaProgramasFidelidades.create;
begin
  dataSet := TClientDataSet(dtmConfig.cdsTaxaProgramasFid);
  buscas := TIBQuery(dtmConfig.qrBuscas);
  transacao := TIBTransaction(dtmConfig.ibTransConfig);
end;

{ TRegrasValeTrocaProgFid }

function TRegrasValeTrocaProgFid.abreRegrasValeTrocaProgFid: boolean;
begin
	Result := montaSelect('select * from regras_vale_troca_prog_fid ' +
     ' where cod_empresa =' + vDadosIni.codEmpresa + ' and ativo = 1 ');
end;

procedure TRegrasValeTrocaProgFid.atualizarTaxaConv;
var
   buscas2: TIBQuery;
begin
  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;

  vDadosIni.buscasdadostaxaConv(buscas2);
  vTaxaConv := buscas2.FieldByName('perc_prog_fid').AsFloat;
end;

function TRegrasValeTrocaProgFid.buscarProduto: boolean;
begin
  Result := true;

  if trim(dataSet.FieldByName('NUM_FAB_PROD').AsString) = '' then
    exit;

  if trim(vNumFab) <> trim(dataSet.FieldByName('NUM_FAB_PROD').AsString) then
  begin
     dataSet.FieldByName('PONTOS').AsFloat := 0;
     dataSet.FieldByName('VALOR').AsFloat := 0;
  end;                                              

  //Atualizar percentual de conversão
  atualizarTaxaConv;
  SqlOpen(' select grupo_prod, cod_prod, num_fab_prod, descr_prod, prec_tab_prod, coalesce(consumo, ''N'') consumo from produtos ' +
    ' where num_fab_prod = ''' + dataSet.FieldByName('NUM_FAB_PROD').AsString + ''' and cod_empresa = ' + vDadosIni.codEmpresa);

  if buscas.IsEmpty then
  begin
    SqlOpen(' select distinct(p.*) from produtos p ' +
      ' inner join cod_barra cb on p.grupo_prod = cb.grupo_prod and p.cod_prod = cb.cod_prod and p.cod_empresa = cb.cod_empresa ' +
      ' where p.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and cb.cod_barra = ''' + dataSet.FieldByName('NUM_FAB_PROD').AsString + ''' and p.ativo = 1 ');
  end;

  dataSet.FieldByName('GRUPO_PROD').AsInteger := vDadosIni.IfThen(not buscas.IsEmpty,
     vDadosIni.IfThen(buscas.FieldByName('consumo').AsString = 'S', 0, buscas.FieldByName('GRUPO_PROD').AsInteger), 0);
  dataSet.FieldByName('COD_PROD').AsString := vDadosIni.IfThen(not buscas.IsEmpty,
  	  vDadosIni.IfThen(buscas.FieldByName('consumo').AsString = 'S', '',	buscas.FieldByName('COD_PROD').AsString), '');
  dataSet.FieldByName('DESCR_PROD').AsString := vDadosIni.IfThen(not buscas.IsEmpty,
  	  vDadosIni.IfThen(buscas.FieldByName('consumo').AsString = 'S', '', buscas.FieldByName('DESCR_PROD').AsString), '');
  dataSet.FieldByName('VALOR').AsFloat := vDadosIni.IfThen(not buscas.IsEmpty,
  	  vDadosIni.IfThen(buscas.FieldByName('consumo').AsString = 'S', 0, buscas.FieldByName('PREC_TAB_PROD').AsFloat), 0);
  dataSet.FieldByName('PONTOS').AsInteger := Trunc(dataSet.FieldByName('VALOR').AsFloat / vTaxaConv);

  if buscas.IsEmpty then
  begin
    Application.MessageBox(pchar('Produto não encontrado!'), 'Atenção', MB_ICONERROR + MB_OK);
    Result := false;
    exit;
  end;
  if trim(buscas.FieldByName('CONSUMO').AsString) = 'S' then
  begin
    Application.MessageBox(pchar('Produto definido para consumo!'), 'Atenção', MB_ICONERROR + MB_OK);
    Result := false;
    exit;
  end;
  
  vNumFab := dataSet.FieldByName('NUM_FAB_PROD').AsString;
end;

procedure TRegrasValeTrocaProgFid.cadRegrasValeTrocaProgFid(pTipoForm: integer);
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Abrindo Regras Programa de Fidelidade');

    if dtmConfig = nil then   
      dtmConfig := TdtmConfig.Create(dtmConfig);

    vDadosIni.vTipoForm := pTipoForm;

    if not vDadosIni.PesqPros('FID016', 'ABRIR', '', 'REGRAS_VALE_TROCA_PROG_FID', '', dtmConfig.qrBuscas, False) then
      Exit;

    if frmCadRegrasValeTrocaProgFid = nil then
    begin
      if pTipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';
      Application.CreateForm(TfrmCadRegrasValeTrocaProgFid, frmCadRegrasValeTrocaProgFid);
    end;

    if (pTipoForm > 0) and (not frmCadRegrasValeTrocaProgFid.Visible) then
      frmCadRegrasValeTrocaProgFid.ShowModal
    else if (not frmCadRegrasValeTrocaProgFid.Visible) then
      frmCadRegrasValeTrocaProgFid.Show
    else if frmCadRegrasValeTrocaProgFid.FormStyle = fsMDIChild then
      frmCadRegrasValeTrocaProgFid.Show
    else
      frmCadRegrasValeTrocaProgFid.ShowModal;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

constructor TRegrasValeTrocaProgFid.create;
begin
  dataSet := TClientDataSet(dtmConfig.cdsRegrasValeTrocaProgFid);
  buscas := TIBQuery(dtmConfig.qrBuscas);
  transacao := TIBTransaction(dtmConfig.ibTransConfig);
end;

function TRegrasValeTrocaProgFid.delete: boolean;
var
  vCodigo: string;
begin
  Result := False;

  if dataSet.IsEmpty then
    exit;

  vCodigo := dataSet.FieldByName('CODIGO').AsString;

  if dataSet.FieldByName('ATIVO').AsInteger = 1 then
  begin

    if not vDadosIni.PesqPros('FID023', 'EXCLUIR', '', 'REGRAS_VALE_TROCA_PROG_FID',
      dataSet.FieldByName('CODIGO').AsString, buscas, false) then
      Exit;

    if Application.MessageBox('Tem certeza que deseja enviar este registro para Lixeira?',
      'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> IDYES then
      Exit;

    dataSet.Edit;
    dataSet.FieldByName('ATIVO').AsInteger := 0;
    dataSet.Post;

    result := Apply;
    if result then
      result := CommitaTransacao;
    if Result then
      vDadosIni.GravaAuditoria('FID023', 'EXCLUIR', 'SUCESSO', 'REGRAS_VALE_TROCA_PROG_FID', vCodigo, buscas)
    else
      vDadosIni.GravaAuditoria('FID023', 'EXCLUIR', 'FALHA', 'REGRAS_VALE_TROCA_PROG_FID', vCodigo, buscas);

    Result := true;
    Refresh;

    Exit;
  end;
    
  if not vDadosIni.PesqPros('FID019', 'EXCLUIR', '', 'REGRAS_VALE_TROCA_PROG_FID',
    dataSet.FieldByName('CODIGO').AsString, buscas, false) then
      Exit;


  if Application.MessageBox('Tem certeza que deseja excluir?',
    'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> IDYES then
    Exit;

  result := inherited Delete;
  if Result then
    result := Apply;

  if result then
    result := CommitaTransacao;
  if Result then
    vDadosIni.GravaAuditoria('FID019', 'EXCLUIR', 'SUCESSO', 'REGRAS_VALE_TROCA_PROG_FID', vCodigo, buscas)
  else
    vDadosIni.GravaAuditoria('FID019', 'EXCLUIR', 'FALHA', 'REGRAS_VALE_TROCA_PROG_FID', vCodigo, buscas);

  Result := true;
  Refresh;
end;

function TRegrasValeTrocaProgFid.edit: boolean;
begin
  Result := False;
  if not vDadosIni.PesqPros('FID021', 'ALTERAR', '', 'REGRAS_VALE_TROCA_PROG_FID',
    '', buscas, false) then
    Exit;

  if inherited Edit then
  begin
    Result := True;
    dataSet.FieldByName('US_MOD').AsInteger := vDadosIni.vCodUsuario;
    dataSet.FieldByName('DATA_MOD').AsDateTime := vDadosIni.getDataBanco(buscas);
    dataSet.FieldByName('TIPO').AsString := dataSet.FieldByName('TIPO').AsString;
    vNumFab := dataSet.FieldByName('NUM_FAB_PROD').AsString;
  end;
end;

function TRegrasValeTrocaProgFid.insert: boolean;
begin
  if not vDadosIni.PesqPros('FID018', 'INCLUIR', '', 'REGRAS_VALE_TROCA_PROG_FID',
    '', buscas, True) then
    Exit;

  if not dataSet.Active then
    montaSelect('select * from regras_vale_troca_prog_fid ' +
      ' where cod_empresa =0 ');

  Result := False;
  if inherited Insert then
  begin
    Result := True;
    dataSet.FieldByName('US_CAD').AsInteger := vDadosIni.vCodUsuario;
    dataSet.FieldByName('DATA_CAD').AsDateTime := vDadosIni.getDataBanco(buscas);
    dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
    vNumFab := '';
  end;
end;

function TRegrasValeTrocaProgFid.post: boolean;
var
  acao: string;
  codigo: integer;
  vMensagem, vCampo: string;
begin
  try
    Result := false;

    if not vDadosIni.PesqPros('FID020', 'SALVAR', '', 'REGRAS_VALE_TROCA_PROG_FID',
      dataSet.FieldByName('CODIGO').AsString, buscas, true) then
      Exit;

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    if trim(dataSet.FieldByName('TIPO').AsString) = '' then
      raiseExceptionCreate('Tipo deve ser informado', 'DBComboBox1');

    if trim(dataSet.FieldByName('TIPO').AsString) = 'TROCA' then
    begin
      if trim(dataSet.FieldByName('NUM_FAB_PROD').AsString) = '' then
        raiseExceptionCreate('Produto deve ser informado', 'DBEdit3');
        
      if dataSet.FieldByName('GRUPO_PROD').AsInteger <= 0 then
        raiseExceptionCreate('Produto deve ser informado', 'DBEdit3');

      if trim(dataSet.FieldByName('COD_PROD').AsString) = '' then
        raiseExceptionCreate('Produto deve ser informado', 'DBEdit3');
    end;

//    if trim(dataSet.FieldByName('TIPO').AsString) = 'RESGATE' then
    begin
      if dataSet.FieldByName('PONTOS').AsInteger <= 0 then
        raiseExceptionCreate('Pontos deve ser informado', 'DBEdit1');

      if dataSet.FieldByName('VALOR').AsFloat <= 0 then
        raiseExceptionCreate('Valor deve ser informado', 'DBEdit2');
    end;
    dataSet.FieldByName('PONTOS').AsInteger := Trunc(dataSet.FieldByName('PONTOS').AsFloat);

    if not verificarRegra(vMensagem, vCampo) then
      raiseExceptionCreate(vMensagem, vCampo);

    if acao = 'INSERIR' then
      dataSet.FieldByName('CODIGO').AsInteger := Gencodigo('REGRAS_VALE_TROCA_PROG_FID', dtmConfig.SpIncCodigo, vDadosIni.codEmpresa);

    Result := inherited post;

    if (DataSet.ChangeCount = 0) then
      Result := True
    else
      Result := Apply;

    if result then
      result := CommitaTransacao;

    if Result then
      vDadosIni.GravaAuditoria('MOB008', acao, 'SUCESSO', 'REGRAS_VALE_TROCA_PROG_FID',
        dataSet.FieldByName('CODIGO').AsString, buscas)
    else
      vDadosIni.GravaAuditoria('MOB008', acao, 'FALHA', 'REGRAS_VALE_TROCA_PROG_FID',
        dataSet.FieldByName('CODIGO').AsString, buscas);

    if Result then
      Refresh;

  except
    on e: exception do
    begin
      Result := false;
      if dataSet.State = dsBrowse then
        dataSet.Edit;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TRegrasValeTrocaProgFid.verificarRegra(var pMensagem, pCampo: string): boolean;
begin
  Result := true;

  if trim(dataSet.FieldByName('TIPO').AsString) = 'RESGATE' then
  begin
    SqlOpen(' select codigo, pontos, valor from regras_vale_troca_prog_fid ' +
      ' where tipo = ''RESGATE'' ' +
      ' and pontos = ' + IntToStr(dataSet.FieldByName('PONTOS').AsInteger) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and codigo <> ' +  IntToStr(dataSet.FieldByName('CODIGO').AsInteger));
    if not buscas.IsEmpty then
    begin
      pMensagem := 'Valor de Pontos já definido para vale resgate';
      pCampo := 'DBEdit1';
      Result := false;
      exit;
    end;
  end
  else
  begin
    SqlOpen(' select codigo, cod_prod, num_fab_prod, descr_prod from regras_vale_troca_prog_fid ' +
      ' where tipo = ''TROCA'' ' +
      ' and grupo_prod = ' + IntToStr(dataSet.FieldByName('GRUPO_PROD').AsInteger) +
      ' and cod_prod = ''' + dataSet.FieldByName('COD_PROD').AsString + ''' ' +
      ' and cod_grade = ' + IntToStr(dataSet.FieldByName('COD_GRADE').AsInteger) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and codigo <> ' +  IntToStr(dataSet.FieldByName('CODIGO').AsInteger));
    if not buscas.IsEmpty then
    begin
      pMensagem := 'Produto já adicionado';
      pCampo := 'DBEdit3';
      Result := false;
      exit;
    end;
  end;
end;

function TRegrasValeTrocaProgFid._abrelixeira(ptipo: string): boolean;
begin
  if not _lixeiraCheia(ptipo) then
  begin
    Application.MessageBox('A lixeira está vazia.', 'Informação', 0 + 64);
    Result := False;
  end
  else
    result := montaSelect('select * from regras_vale_troca_prog_fid ' +
      ' where cod_empresa= ' + vDadosIni.codEmpresa + ' and ativo = 0 '+
      ' and tipo = ''' +ptipo+ ''' ');
end;

function TRegrasValeTrocaProgFid._lixeiraCheia(ptipo: string): boolean;
begin
   Result := ExecutaComandosSql('Select first 1 codigo from regras_vale_troca_prog_fid ' +
    ' where ativo = 0 and cod_empresa = ' + vDadosIni.codEmpresa  +
    ' and tipo = ''' +ptipo+ ''' ');
end;

function TRegrasValeTrocaProgFid._restauralixeira: boolean;
begin
  if not dataSet.IsEmpty then
    if dataSet.FieldByName('ATIVO').asinteger = 0 then
    begin
      if Application.MessageBox('Tem certeza que deseja restaurar o registro selecionado?',
        'Confirmação', MB_YESNO + MB_ICONQUESTION) = IDYES then
      begin
        if (Edit) or (dataSet.State = dsEdit) then
        begin
          dataSet.FieldByName('ATIVO').asinteger := 1;
          Result := Post;
          if Result then
            Result := CommitaTransacao;

          if Result then
            vDadosIni.GravaAuditoria('FID024', 'RESTAURAR REGISTRO', 'SUCESSO',
              'REGRAS_VALE_TROCA_PROG_FID', dataSet.FieldByName('CODIGO').AsString, buscas)
          else
            vDadosIni.GravaAuditoria('FID024', 'RESTAURAR REGISTRO', 'FALHA',
              'REGRAS_VALE_TROCA_PROG_FID', dataSet.FieldByName('CODIGO').AsString, buscas);

        end;
      end;
    end
    else
      Application.MessageBox('Registro já está ativo' + #13 +
        'Não é necessário restaurá-lo', 'Informação', 0 + 64);
  Refresh;
end;

end.

