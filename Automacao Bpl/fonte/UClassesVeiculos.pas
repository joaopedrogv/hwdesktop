unit UClassesVeiculos;

interface
uses
  uDataSet_OOP, DBClient, uDtmAtivo, Db, Windows, Forms, Controls,
  ComCtrls, ExtCtrls, RDprint, UDtmVeiculos, IBQuery, DBCtrls;

type
  TVeiculos = class;
  TTabelaFipe = class;
  TLocCliente = class;
  TEspecieVeiculo = class;
  TLocColaborador = class;
  TModVeiculo = class;
  TTabPrecoVeic = class;
  TModVeiculo_CodigoFab = class;
  TServicosSugeridos = class;

  RConsultaVeic = record
    campo, ordem, condicao, valor, dataIni, dataFim: string;
    porData, porDataAd: Boolean;
    //Opçoes Avanças
    avancada, adicional: boolean;
  end;

  TServicosSugeridos = class(TDataSet_OOP)
  private
  public
   	constructor create;
    function abreServico(pDataset: TDataSet): boolean;
    procedure _marcaDesmarcaLinha;
    procedure _marcarLinha;
    procedure _desmarcarLinha;
    procedure SalvarServicos(pDataset: TDataSet);
    function verificarServicos(pDataset: TDataSet): boolean;
  end;

  TTabPrecoVeic = class(TDataSet_OOP)
  public
    constructor create;
    function edit: boolean; override;
    function delete: boolean; override;
    function _AbreTabPrecoVeic(vModVeic: TModVeiculo): boolean;
    function _existePrecoVeic(pCodMod, pAnoFab, pAnoMod: string): boolean;
    function post: boolean; override;
    function insert(vModVeic: TModVeiculo): boolean;
  end;

  TLocCliente = class(TDataSet_OOP)
  private
  public
    destructor destroy; override;
    constructor create;
    function abreClientes(codcli: integer): boolean; overload;
    function verificacliente(vcod: integer): boolean;
  var
  end;

  TLocColaborador = class(TDataSet_OOP)
  private
  public
    destructor destroy; override;
    constructor create;
    function abreLocColaborador: boolean; overload;
  var
  end;

  TEspecieVeiculo = class(TDataSet_OOP)
  private
  public
    destructor destroy; override;
    constructor create;
    function abreEspecieVeiculo: boolean; overload;
  var
  end;

  TVeiculos = class(TDataSet_OOP)
  private
    //    QtdMesEmpresa, NumeroCasasDecimais: Integer;
    //    linha, coluna, pagina: integer; //Variáveis para relatórios crystal
    vcodveicpesq: integer;
    vchassipesq, vplacapesq: string;
  public
    destructor destroy; override;
    constructor create;
    function post: boolean; override;
    function insert: boolean; override;
    function edit: boolean; override;
    function delete: boolean; override;
    function restaurarRegistro: boolean;
    function abreVeiculos: boolean; overload;
    function abreVeiculos(EmpNula: string): boolean; overload;
    function abreVeiculos(pPlaca: string; pChassi: string; pCodigo: Integer): boolean; overload;
    function StatusLixeira: boolean;
    function AbrirLixeira: boolean;
    procedure CadVeiculos(TipoForm: integer);
    function confirmaAlteracao: boolean;
    function verificajacad(vit: integer): boolean;
    function verificatipovenda(vtop: integer; vcomb: TDbCombobox; vtipo, vtpescol: string): boolean;
    function consulta: boolean;
    procedure _marcarTodos;
    procedure _desmarcarTodos;
    procedure _marcaDesmarcaLinha;
  var
  	vCons: RConsultaVeic;
    LocCliente: TLocCliente;
    EspecieVeiculo: TEspecieVeiculo;
    LocColaborador: TLocColaborador;
    vModVei: TModVeiculo;
  end;

  TListaTPComb = class(TDataSet_OOP)
  private
  public
    constructor create;
    destructor destroy; override;
  var

  end;
  TTabelaFipe = class(TDataSet_OOP)
  public
    constructor create;
    destructor destroy; override;
  end;

  TModVeiculo = class(TDataSet_OOP)
  private
  public
    destructor destroy; override;
    constructor create;
    function post: boolean; override;
    function insert: boolean; override;
    function edit: boolean; override;
    function delete: boolean; override;
    function restaurarRegistro: boolean;
    function abreModVeiculos: boolean; overload;
    function StatusLixeira: boolean;
    function AbrirLixeira: boolean;
    function confirmaAlteracao: boolean;
    function abreTipoCombustiveis: boolean;
    function abreTabelaFipe: boolean;
    procedure CadModVeiculos(TipoForm: integer);
    procedure _marcarTodos;
    procedure _desmarcarTodos;
    procedure _marcaDesmarcaLinha;
  var
    TabelaFipe: TTabelaFipe;
    LTPComb: TListaTPComb;
    vTabPreco: TTabPrecoVeic;
    vCodFab: TModVeiculo_CodigoFab;
    vServicosSugeridos: TServicosSugeridos;
    ultimasql:string;
  end;

  TModVeiculo_CodigoFab = class(TDataSet_OOP)
  public
    constructor create;
    function abreCodigo(pCodigo: Integer): Boolean;
    function insereCodigoFab(pCodigo: Integer; pCodFab: string): boolean;
    function delete: Boolean; override;
  end;

implementation

uses
  uDadosIni, SysUtils, IBDatabase, UCadVeiculos, UCadModVeiculos, Classes;

{ TVeiculos }

function TVeiculos.abreVeiculos: boolean;
begin
  result := montaSelect(' SELECT VEICULOS.*, ' +
  	' CLIENTES.NOME_CLIENTE, CLIENTES.RAZAO, CLIENTES.CEP, CLIENTES.ENDERECO, CLIENTES.NUM_END_CLIENTE, ' +
    ' CLIENTES.FONE_CLIENTE, CLIENTES.FONE_CELULAR, CLIENTES.EMAIL, ' +
    ' ESTADOS.SIGLA_UF, CIDADES.NOME_CIDADE, BAIRROS.NOME_BAIRRO, LOCALIDADE.LOCALIDADE, SETOR.SETOR FROM VEICULOS ' +
    ' LEFT JOIN CLIENTES ON CLIENTES.COD_CLIENTE = VEICULOS.COD_CLIENTE AND CLIENTES.COD_EMPRESA = VEICULOS.COD_EMPRESA ' +
    ' LEFT JOIN ESTADOS ON ESTADOS.CODIGO_UF = CLIENTES.CODIGO_UF ' +
    ' LEFT JOIN CIDADES ON CIDADES.COD_CIDADE = CLIENTES.COD_CIDADE ' +
    ' LEFT JOIN BAIRROS ON BAIRROS.COD_BAIRRO = CLIENTES.COD_BAIRRO ' +
    ' LEFT JOIN LOCALIDADE ON LOCALIDADE.COD_LOCALIDADE = CLIENTES.COD_LOCALIDADE AND LOCALIDADE.COD_EMPRESA = CLIENTES.COD_EMPRESA '+
    ' LEFT JOIN SETOR ON SETOR.COD_SETOR = LOCALIDADE.COD_SETOR AND SETOR.COD_EMPRESA = LOCALIDADE.COD_EMPRESA ' +
  	' where VEICULOS.CODIGO = ' + inttostr(vcodveicpesq)+
    ' and VEICULOS.PLACA = ' + QuotedStr(vplacapesq) +
    ' and VEICULOS.CHASSI = ' + QuotedStr(vchassipesq) +
    ' and VEICULOS.COD_EMPRESA =' + vDadosIni.codEmpresa);
  dataset.Edit;
end;

function TVeiculos.abreVeiculos(EmpNula: string): boolean;
begin
  result := montaSelect(' SELECT VEICULOS.*, ' +
  	' CLIENTES.NOME_CLIENTE, CLIENTES.RAZAO, CLIENTES.CEP, CLIENTES.ENDERECO, CLIENTES.NUM_END_CLIENTE, ' +
    ' CLIENTES.FONE_CLIENTE, CLIENTES.FONE_CELULAR, CLIENTES.EMAIL, ' +
    ' ESTADOS.SIGLA_UF, CIDADES.NOME_CIDADE, BAIRROS.NOME_BAIRRO, LOCALIDADE.LOCALIDADE, SETOR.SETOR FROM VEICULOS ' +
  	' LEFT JOIN CLIENTES ON CLIENTES.COD_CLIENTE = VEICULOS.COD_CLIENTE AND CLIENTES.COD_EMPRESA = VEICULOS.COD_EMPRESA ' +
    ' LEFT JOIN ESTADOS ON ESTADOS.CODIGO_UF = CLIENTES.CODIGO_UF ' +
    ' LEFT JOIN CIDADES ON CIDADES.COD_CIDADE = CLIENTES.COD_CIDADE ' +
    ' LEFT JOIN BAIRROS ON BAIRROS.COD_BAIRRO = CLIENTES.COD_BAIRRO ' +
    ' LEFT JOIN LOCALIDADE ON LOCALIDADE.COD_LOCALIDADE = CLIENTES.COD_LOCALIDADE AND LOCALIDADE.COD_EMPRESA = CLIENTES.COD_EMPRESA '+
    ' LEFT JOIN SETOR ON SETOR.COD_SETOR = LOCALIDADE.COD_SETOR AND SETOR.COD_EMPRESA = LOCALIDADE.COD_EMPRESA ' +
  	' where VEICULOS.CODIGO = 0 ' +
    ' and VEICULOS.CHASSI = '''' ' +
    ' and VEICULOS.PLACA = '''' ' +
    ' and VEICULOS.COD_EMPRESA =' + vDadosIni.codEmpresa);
end;

function TVeiculos.abreVeiculos(pPlaca, pChassi: string;
  pCodigo: Integer): boolean;
begin
	result := montaSelect(' SELECT VEICULOS.*, ' +
  	' CLIENTES.NOME_CLIENTE, CLIENTES.RAZAO, CLIENTES.CEP, CLIENTES.ENDERECO, CLIENTES.NUM_END_CLIENTE, ' +
    ' CLIENTES.FONE_CLIENTE, CLIENTES.FONE_CELULAR, CLIENTES.EMAIL, ' +
    ' ESTADOS.SIGLA_UF, CIDADES.NOME_CIDADE, BAIRROS.NOME_BAIRRO, LOCALIDADE.LOCALIDADE, SETOR.SETOR FROM VEICULOS ' +
    ' LEFT JOIN CLIENTES ON CLIENTES.COD_CLIENTE = VEICULOS.COD_CLIENTE AND CLIENTES.COD_EMPRESA = VEICULOS.COD_EMPRESA ' +
    ' LEFT JOIN ESTADOS ON ESTADOS.CODIGO_UF = CLIENTES.CODIGO_UF ' +
    ' LEFT JOIN CIDADES ON CIDADES.COD_CIDADE = CLIENTES.COD_CIDADE ' +
    ' LEFT JOIN BAIRROS ON BAIRROS.COD_BAIRRO = CLIENTES.COD_BAIRRO ' +
    ' LEFT JOIN LOCALIDADE ON LOCALIDADE.COD_LOCALIDADE = CLIENTES.COD_LOCALIDADE AND LOCALIDADE.COD_EMPRESA = CLIENTES.COD_EMPRESA '+
    ' LEFT JOIN SETOR ON SETOR.COD_SETOR = LOCALIDADE.COD_SETOR AND SETOR.COD_EMPRESA = LOCALIDADE.COD_EMPRESA ' +
  	' where VEICULOS.CODIGO = ' + inttostr(pCodigo)+
    ' and VEICULOS.PLACA = ' + QuotedStr(pPlaca) +
    ' and VEICULOS.CHASSI = ' + QuotedStr(pChassi) +
    ' and VEICULOS.COD_EMPRESA = ' + vDadosIni.codEmpresa);
end;

function TVeiculos.AbrirLixeira: boolean;
begin
  if not StatusLixeira then
  begin
    Application.MessageBox('A lixeira está vazia.', 'Informação', MB_OK + MB_ICONINFORMATION +
      MB_DEFBUTTON1);
    montaSelect(' SELECT VEICULOS.*, ' +
    	' CLIENTES.NOME_CLIENTE, CLIENTES.RAZAO, CLIENTES.CEP, CLIENTES.ENDERECO, CLIENTES.NUM_END_CLIENTE, ' +
      ' CLIENTES.FONE_CLIENTE, CLIENTES.FONE_CELULAR, CLIENTES.EMAIL, ' +
      ' ESTADOS.SIGLA_UF, CIDADES.NOME_CIDADE, BAIRROS.NOME_BAIRRO, LOCALIDADE.LOCALIDADE, SETOR.SETOR FROM VEICULOS ' +
    	' LEFT JOIN CLIENTES ON CLIENTES.COD_CLIENTE = VEICULOS.COD_CLIENTE AND CLIENTES.COD_EMPRESA = VEICULOS.COD_EMPRESA ' +
      ' LEFT JOIN ESTADOS ON ESTADOS.CODIGO_UF = CLIENTES.CODIGO_UF ' +
      ' LEFT JOIN CIDADES ON CIDADES.COD_CIDADE = CLIENTES.COD_CIDADE ' +
      ' LEFT JOIN BAIRROS ON BAIRROS.COD_BAIRRO = CLIENTES.COD_BAIRRO ' +
      ' LEFT JOIN LOCALIDADE ON LOCALIDADE.COD_LOCALIDADE = CLIENTES.COD_LOCALIDADE AND LOCALIDADE.COD_EMPRESA = CLIENTES.COD_EMPRESA '+
      ' LEFT JOIN SETOR ON SETOR.COD_SETOR = LOCALIDADE.COD_SETOR AND SETOR.COD_EMPRESA = LOCALIDADE.COD_EMPRESA ' +
      ' WHERE VEICULOS.ATIVO = 1' +
      ' and VEICULOS.COD_EMPRESA = ' + vDadosIni.codEmpresa);
    result := false;
  end
  else
    result := montaSelect(' SELECT VEICULOS.*, ' +
    	' CLIENTES.NOME_CLIENTE, CLIENTES.RAZAO, CLIENTES.CEP, CLIENTES.ENDERECO, CLIENTES.NUM_END_CLIENTE, ' +
      ' CLIENTES.FONE_CLIENTE, CLIENTES.FONE_CELULAR, CLIENTES.EMAIL, ' +
      ' ESTADOS.SIGLA_UF, CIDADES.NOME_CIDADE, BAIRROS.NOME_BAIRRO, LOCALIDADE.LOCALIDADE, SETOR.SETOR FROM VEICULOS ' +
      ' LEFT JOIN CLIENTES ON CLIENTES.COD_CLIENTE = VEICULOS.COD_CLIENTE AND CLIENTES.COD_EMPRESA = VEICULOS.COD_EMPRESA ' +
      ' LEFT JOIN ESTADOS ON ESTADOS.CODIGO_UF = CLIENTES.CODIGO_UF ' +
      ' LEFT JOIN CIDADES ON CIDADES.COD_CIDADE = CLIENTES.COD_CIDADE ' +
      ' LEFT JOIN BAIRROS ON BAIRROS.COD_BAIRRO = CLIENTES.COD_BAIRRO ' +
      ' LEFT JOIN LOCALIDADE ON LOCALIDADE.COD_LOCALIDADE = CLIENTES.COD_LOCALIDADE AND LOCALIDADE.COD_EMPRESA = CLIENTES.COD_EMPRESA '+
      ' LEFT JOIN SETOR ON SETOR.COD_SETOR = LOCALIDADE.COD_SETOR AND SETOR.COD_EMPRESA = LOCALIDADE.COD_EMPRESA ' +
    	' WHERE VEICULOS.ATIVO = 0' +
      ' and VEICULOS.COD_EMPRESA = ' + vDadosIni.codEmpresa);
end;

procedure TVeiculos.CadVeiculos(TipoForm: integer);
begin
  vDadosIni.vTipoForm := TipoForm;
  if DtmVeiculos = nil then
    DtmVeiculos := TDtmVeiculos.Create(DtmVeiculos);
  if FrmCadVeiculos = nil then
  begin
    if TipoForm > 0 then
      vDadosIni.vModalOuChild := 'M';
    Application.CreateForm(TFrmCadVeiculos, FrmCadVeiculos);
  end;

  if (TipoForm > 0) and (not FrmCadVeiculos.Visible) then
    FrmCadVeiculos.ShowModal
  else if (not FrmCadVeiculos.Visible) then
    FrmCadVeiculos.Show
  else if FrmCadVeiculos.FormStyle = fsMDIChild then
    FrmCadVeiculos.Show
  else
    FrmCadVeiculos.ShowModal;
end;

constructor TVeiculos.create;
begin
  if DtmVeiculos = nil then
    DtmVeiculos := TDtmVeiculos.Create(DtmVeiculos);
  DataSet := TClientDataSet(DtmVeiculos.CdsVeiculos);
  transacao := TIBTransaction(DtmVeiculos.IBTransVeiculos);
  Buscas := TIBQuery(DtmVeiculos.qrBuscasV);
  LocCliente := TLocCliente.create;
  EspecieVeiculo := TEspecieVeiculo.create;
  LocColaborador := TLocColaborador.create;
  vModVei := TModVeiculo.create;
  vModVei.dataSet := TClientDataSet(DtmVeiculos.cdsLocModVeiculos);
end;

function TVeiculos.delete: boolean;
var
  vtemp: string;
	vApagar: boolean;
  vCod_Veic: string;
  vChassi: string;
  vPlaca: string;
  vDescricao: string;
  I: Integer;
begin
  try
    Result := False;
    if dataSet.IsEmpty then
      exit;

    try
      vApagar    := dataSet.FieldByName('ATIVO').AsInteger = 0;
      vCod_Veic  := trim(dataSet.FieldByName('CODIGO').AsString);
      vChassi    := trim(dataSet.FieldByName('CHASSI').AsString);
      vPlaca     := trim(dataSet.FieldByName('PLACA').AsString);
      vDescricao := trim(dataSet.FieldByName('DESCMODELO').AsString);

      prepare_loop('SEL = ''S''');

      if not dataset.IsEmpty then
      begin
        vApagar    := dataSet.FieldByName('ATIVO').AsInteger = 0;
        vCod_Veic  := '';
        vChassi    := '';
        vPlaca     := '';
        vDescricao := '';
      end;
    finally
      prepare_loop_done;
    end;

    try
      if (trim(vCod_Veic) <> '') then
        prepare_loop('CODIGO = ' + vCod_Veic)
      else
        prepare_loop('SEL = ''S''');

      if vApagar then
      begin
        vtemp := 'Tem certeza que deseja excluir este registro permanentemente?' + #13 + #13 +
          'VEÍCULO' + #13 +
          'Código: ' + vCod_Veic + #13 +
          'Chassi: ' + vChassi + #13 +
          'Placa: ' + vPlaca + #13 +
          'Descrição: ' + vDescricao;

        if (trim(vCod_Veic) = '') then
          vtemp := 'Tem certeza que deseja excluir os ' + IntToStr(dataSet.RecordCount) + ' registros selecionados permanentemente?';

        if not vDadosIni.PesqPros('VEI012', 'EXCLUIR', '', 'VEICULOS',
          vDadosIni.IfThen(trim(vCod_Veic) <> '', vCod_Veic, ''), buscas, true) then
            exit;

        if Application.MessageBox(PChar(vtemp),
          'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> mrYES then
          exit;
      end
      else
      begin
        vtemp := 'Tem certeza que deseja mover este registro para a lixeira?' + #13 + #13 +
          'VEÍCULO' + #13 +
          'Código: ' + vCod_Veic + #13 +
          'Chassi: ' + vChassi + #13 +
          'Placa: ' + vPlaca + #13 +
          'Descrição: ' + vDescricao;

        if (trim(vCod_Veic) = '') then
          vtemp := 'Tem certeza que deseja mover os ' + IntToStr(dataSet.RecordCount) + ' registros selecionados para a lixeira?';

        if not vDadosIni.PesqPros('VEI008', 'EXCLUIR', '', 'VEICULOS',
           vDadosIni.IfThen(trim(vCod_Veic) <> '', vCod_Veic, ''), buscas, true) then
            exit;

        if Application.MessageBox(PChar(vtemp),
          'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> mrYES then
          exit;
      end;

      if vApagar then
        vDadosIni.abreStatusProcessamento('', 'Excluíndo veículo(s) permanentemente')
      else
        vDadosIni.abreStatusProcessamento('', 'Movendo veículo(s) para lixeira');

      dataset.First;
      while not dataset.Eof do
      begin
        if vApagar then
          vDadosIni.abreStatusProcessamento('', 'Excluíndo veículo(s) permanentemente (' + IntToStr(dataSet.RecNo) + '/' + IntToStr(dataSet.RecordCount) + ')')
        else
          vDadosIni.abreStatusProcessamento('', 'Movendo veículo(s) para lixeira (' + IntToStr(dataSet.RecNo) + '/' + IntToStr(dataSet.RecordCount) + ')');

        if vApagar then
        begin
          SqlExec(' update veiculos set ativo = 99 ' +
            ' where placa = %s and chassi = %s and codigo = %d and cod_empresa = %d ',
            [fstrq('placa'), fstrq('chassi'), fint('codigo'), fint('cod_empresa')], buscas);
          if (trim(vCod_Veic) = '') then
            vDadosIni.GravaAuditoria('VEI012', 'EXCLUIR', '', 'VEICULOS',
              dataSet.FieldByName('CODIGO').AsString, buscas);
        end
        else
        begin
          SqlExec(' update veiculos set ativo = 0 ' +
            ' where placa = %s and chassi = %s and codigo = %d and cod_empresa = %d ',
            [fstrq('placa'), fstrq('chassi'), fint('codigo'), fint('cod_empresa')], buscas);

          if (trim(vCod_Veic) = '') then
            vDadosIni.GravaAuditoria('VEI008', 'EXCLUIR', '', 'VEICULOS',
              dataSet.FieldByName('CODIGO').AsString, buscas);
        end;

        dataset.Next;
      end;
    finally
      vDadosIni.fechaStatusProcessamento;
      prepare_loop_done;
    end;

    Result := CommitaTransacao;
    if Result then
    begin
      vDadosIni.GravaAuditoria(vDadosIni.IfThen(vApagar, 'VEI012', 'VEI008'),
        'EXCLUIR', 'SUCESSO', 'VEICULOS',
        vDadosIni.IfThen(trim(vCod_Veic) <> '', vCod_Veic, ''), buscas);
    end
    else
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria(vDadosIni.IfThen(vApagar, 'VEI012', 'VEI008'),
        'EXCLUIR', 'FALHA', 'VEICULOS',
        vDadosIni.IfThen(trim(vCod_Veic) <> '', vCod_Veic, ''), buscas);
    end;
    if Result then
     Refresh;
  except
    on E: Exception do
		begin
			RollBackTransacao;
      vDadosIni.fechaStatusProcessamento;
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

destructor TVeiculos.destroy;
begin
  if LocCliente <> nil then
    LocCliente.buscas.Close;
  if EspecieVeiculo <> nil then
    EspecieVeiculo.buscas.Close;
  FreeAndNil(vModVei);
  inherited;
end;

function TVeiculos.edit: boolean;
begin
  Result := inherited edit;
  if not result then
    Exit;

  dataSet.FieldByName('PLACA').AsString := trim(dataSet.FieldByName('PLACA').AsString);
  dataSet.FieldByName('CHASSI').AsString := trim(dataSet.FieldByName('CHASSI').AsString);

  if not EspecieVeiculo.buscas.Active then
    EspecieVeiculo.abreEspecieVeiculo;
  if not LocColaborador.buscas.Active then
    LocColaborador.abreLocColaborador;
  if not vModVei.dataSet.Active then
    vModVei.abreModVeiculos;
  if dataSet.FieldByName('COD_CLIENTE').AsInteger = 0 then
    LocCliente.abreClientes(-1)
  else
    LocCliente.abreClientes(dataSet.FieldByName('COD_CLIENTE').AsInteger);
end;

function TVeiculos.insert: boolean;
begin
  if inherited insert then
  begin
    dataSet.FieldByName('DATA_CAD').AsDateTime := date;
    dataSet.FieldByName('US_CAD').AsInteger := vDadosIni.vCodUsuario;
    dataSet.FieldByName('COD_EMPRESA').AsInteger := strToInt(vDadosIni.codEmpresa);
    if not EspecieVeiculo.buscas.Active then
      EspecieVeiculo.abreEspecieVeiculo;
    if not LocColaborador.buscas.Active then
      LocColaborador.abreLocColaborador;
    if not vModVei.dataSet.Active then
      vModVei.abreModVeiculos;
    Result := true;
  end;
end;

function TVeiculos.post: boolean;
begin
  try
    Result := false;               

    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      result := true;
      exit;
    end;

    if not vDadosIni.vVeic.vDesabilitarChassi then
      if trim(dataSet.FieldByName('CHASSI').AsString) = '' then
        raiseExceptionCreate('Chassi não informado!', 'DBEdit3');

    if trim(dataSet.FieldByName('PLACA').AsString) = '' then
      raiseExceptionCreate('Placa no veículo não informada!', 'DBEdit2');
    if trim(dataSet.FieldByName('cod_cliente').AsString) = '' then
      raiseExceptionCreate('Cliente não informado!', 'DBEdit4');
    if trim(dataSet.FieldByName('DESCMODELO').AsString) = '' then
      raiseExceptionCreate('Descrição do modelo não informada!', 'DBEdit12');
    if trim(dataSet.FieldByName('COD_ESPE_SEG').AsString) = '' then
      raiseExceptionCreate('Tipo de Segmento não informado!', 'DBLookupComboBox4');
    if (vDadosIni.vSugServico.vHabilitarSug) and (vDadosIni.vEmp.vUsarAparelho <> 'S') then
	  	if dataSet.FieldByName('KM_V').IsNull then
  	    raiseExceptionCreate('Km não informada', 'DBEdit5');

    if (vDadosIni.vVeic.vDesabilitarChassi)
    	and (trim(dataSet.FieldByName('PLACA').AsString) <> '')
    	and (trim(dataSet.FieldByName('CHASSI').AsString) = '') then
    		dataSet.FieldByName('CHASSI').AsString := dataSet.FieldByName('PLACA').AsString;

    dataSet.FieldByName('PLACA').AsString := UpperCase(trim(dataSet.FieldByName('PLACA').AsString));
  	dataSet.FieldByName('CHASSI').AsString := UpperCase(trim(dataSet.FieldByName('CHASSI').AsString));
    if dataSet.State in [dsInsert] then
      dataSet.FieldByName('CODIGO').AsInteger := Gencodigo('VEICULOS', DtmVeiculos.SpIncCodigoV,
        vDadosIni.codEmpresa)
    else
    begin
     if dataSet.FieldByName('COD_CLIENTE').OldValue <> dataSet.FieldByName('COD_CLIENTE').NewValue then
       dataSet.FieldByName('TIPO_OS').AsString:='';
    end;

    vDadosIni.vPesquisa:=dataSet.FieldByName('CODIGO').AsString;
    vDadosIni.vPesquisaPlaca := Trim(dataSet.FieldByName('placa').AsString);
    vDadosIni.vPesquisaChassi := Trim(dataSet.FieldByName('chassi').AsString);

    Result := inherited post;

    if dataSet.ChangeCount = 0 then
    begin
      Result := true;
      exit;
    end;

    if Apply then
    begin
      if CommitaTransacao then
        vDadosIni.GravaAuditoria('VEI011', 'GRAVAR', 'SUCESSO', 'VEICULOS',
        dataSet.FieldByName('CODIGO').AsString, buscas)
//        vDadosIni.GravaAuditoria('VEI011', dataSet.FieldByName('CODIGO').AsString +
//          ' Gravação Confirmada', buscas)
      else
        vDadosIni.GravaAuditoria('VEI011', 'GRAVAR', 'FALHA', 'VEICULOS',
        dataSet.FieldByName('CODIGO').AsString, buscas);
//        vDadosIni.GravaAuditoria('VEI011', dataSet.FieldByName('CODIGO').AsString +
//          ' Gravação não Confirmada', buscas);
    end
    else
    begin
      Cancel;
      RollBackTransacao;
      vDadosIni.GravaAuditoria('VEI011', 'GRAVAR', 'FALHA', 'VEICULOS',
        dataSet.FieldByName('CODIGO').AsString, buscas);
//
//      vDadosIni.GravaAuditoria('VEI011', dataSet.FieldByName('CODIGO').AsString +
//        ' Gravação não Confirmada', buscas);
    end;
    Refresh;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;

end;

function TVeiculos.restaurarRegistro: boolean;
var
	vCodVeiculo: string;
	vChassi: string;
  vPlaca: string;
  vDescricao: string;
  vtemp: string;
begin
	try
  	result := false;
    if dataSet.IsEmpty then
      exit;

    if dataSet.FieldByName('ATIVO').asinteger <> 0 then
    begin
      Application.MessageBox('Registro já está ativo' + chr(13) +
          'Não é necessário restaurá-lo', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      exit;
    end;

    try
      vCodVeiculo := trim(dataSet.FieldByName('CODIGO').AsString);
      vChassi     := trim(dataSet.FieldByName('CHASSI').AsString);
      vPlaca      := trim(dataSet.FieldByName('PLACA').AsString);
      vDescricao  := trim(dataSet.FieldByName('DESCMODELO').AsString);

      prepare_loop('SEL = ''S''');
      if not dataset.IsEmpty then
      begin
        vCodVeiculo := '';
        vChassi := '';
      end;
    finally
      prepare_loop_done;
    end;

    try
    	if (trim(vCodVeiculo) <> '') then
      	prepare_loop('CODIGO = ' + vCodVeiculo)
      else
		    prepare_loop('SEL = ''S''');

      vtemp := 'Tem certeza que deseja restaurar este registro?' + #13 + #13 +
        'VEÍCULO' + #13 +
        'Código: ' + vCodVeiculo + #13 +
        'Descrição: ' + vChassi + #13 +
        'Placa: ' + vPlaca + #13 +
        'Descrição: ' + vDescricao;

      if (trim(vChassi) = '') then
          vtemp := 'Tem certeza que deseja restaurar os ' + IntToStr(dataSet.RecordCount) + ' registros selecionados?';

      if not vDadosIni.PesqPros('VEI010', 'RESTAURAR', '', 'VEICULOS',
        vDadosIni.IfThen(trim(vCodVeiculo) <> '', vCodVeiculo, ''), buscas, true) then
          exit;

      if Application.MessageBox(PChar(vtemp),
        'Restaurar Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> mrYES then
        exit;

      vDadosIni.abreStatusProcessamento('', 'Restaurando condição(ões) de pagamento');

      dataset.First;
      while not dataset.Eof do
      begin
      	vDadosIni.abreStatusProcessamento('', 'Restaurando condição(ões) de pagamento (' + IntToStr(dataSet.RecNo) + '/' + IntToStr(dataSet.RecordCount) + ')');

        SqlExec(' update veiculos set ativo = 1 ' +
          ' where placa = %s and chassi = %s and codigo = %d and cod_empresa = %d ',
          [fstrq('placa'), fstrq('chassi'), fint('codigo'), fint('cod_empresa')], buscas);

        if (trim(vCodVeiculo) = '') then
          vDadosIni.GravaAuditoria('VEI010', 'RESTAURAR', '', 'VEICULOS',
            dataSet.FieldByName('CODIGO').AsString, buscas);

        dataset.Next;
      end;
    finally
    	vDadosIni.fechaStatusProcessamento;
      prepare_loop_done;
    end;
    Result := CommitaTransacao;
    if Result then
    begin
    	vDadosIni.GravaAuditoria('VEI010', 'RESTAURAR', 'SUCESSO', 'VEICULOS',
        vDadosIni.IfThen(trim(vCodVeiculo) <> '', vCodVeiculo, ''), buscas);
    end
    else
    begin
    	RollBackTransacao;
    	vDadosIni.GravaAuditoria('VEI010', 'RESTAURAR', 'FALHA', 'VEICULOS',
        vDadosIni.IfThen(trim(vCodVeiculo) <> '', vCodVeiculo, ''), buscas);
    end;

    if Result then
      Refresh;
  except
    on E: Exception do
		begin
			RollBackTransacao;
      vDadosIni.fechaStatusProcessamento;
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TVeiculos.StatusLixeira: boolean;
begin
  //Se lixeira vazia retorna falso senão verdadeiro
  result := ExecutaComandosSql(' SELECT * FROM VEICULOS WHERE ativo = 0' +
    ' and COD_EMPRESA =' + vDadosIni.codEmpresa);
end;

function TVeiculos.verificajacad(vit: integer): boolean;
begin
  if vit = 1 then
  begin
    buscas.Close;
    buscas.sql.text := ' select * from veiculos ' +
  	  ' where chassi = ' + QuotedStr(dataSet.FieldByName('CHASSI').AsString) +
      ' and codigo <> ' + IntToStr(dataset.FieldByName('CODIGO').AsInteger) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and ativo <> 99 ';
    buscas.open;
    if not buscas.isempty then
    begin
      result := true;
      vcodveicpesq := buscas.FieldByName('CODIGO').AsInteger;
      vchassipesq := Trim(buscas.FieldByName('CHASSI').AsString);
      vplacapesq := Trim(buscas.FieldByName('PLACA').AsString);
    end
    else
      Result := false;
  end
  else
  begin
    buscas.Close;
    buscas.sql.text := ' select * from veiculos ' +
    	' where placa = ' + QuotedStr(dataSet.FieldByName('PLACA').AsString) +
      ' and codigo <> ' + IntToStr(dataset.FieldByName('CODIGO').AsInteger) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and ativo <> 99 ';
    buscas.open;
    if not buscas.isempty then
    begin
      result := true;
      vcodveicpesq := buscas.FieldByName('CODIGO').AsInteger;
      vchassipesq := Trim(buscas.FieldByName('CHASSI').AsString);
      vplacapesq := Trim(buscas.FieldByName('PLACA').AsString);
    end
    else
      Result := false;
  end;
end;

function TVeiculos.verificatipovenda(vtop: integer; vcomb: TDbCombobox; vtipo,
  vtpescol: string): boolean;
begin
  result:=false;
  if vtop = 1 then
  begin
    buscas.close;
    buscas.sql.text := 'select * from tipo_vendas where tipo = ''' + vtipo + ''' and venda = ''S'' order by cod_tipo';
    buscas.open;
    vcomb.Items.Clear;
    while not buscas.eof do
    begin
      if (buscas.FieldByName('TIPO').AsString = 'REQ') or (buscas.FieldByName('TIPO').AsString = 'ORC') then
        vcomb.Items.Add(buscas.FieldByName('DESCRICAO').AsString);
      if (trim(buscas.FieldByName('TIPO').AsString) = 'OS') or (trim(buscas.FieldByName('TIPO').AsString) = 'TMO') then
        vcomb.Items.Add(buscas.FieldByName('TIPO_OS').AsString);
      buscas.next;
    end;
    Result := true;
  end;

  if vtop = 2 then
  begin
    try
      buscas.close;
      if vtipo = 'OS' then
        buscas.sql.text := 'select * from tipo_vendas where tipo = '+QuotedStr(vtipo) + ' and tipo_os = ' + QuotedStr(vtpescol);
      buscas.open;
      if buscas.isempty then
        raiseExceptionCreate('Tipo de OS informado é inválido','DBComboBox4')
      else
        Result := true;
    except
      on e: exception do
      begin
        Result := false;
        Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
        registraErro(e.Message);
      end;
    end;
  end;
end;

procedure TVeiculos._desmarcarTodos;
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Desfazendo a seleção de todos os registros');

    if not dataSet.Active then
      Exit;

    dataSet.DisableControls;
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
  	dataSet.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TVeiculos._marcaDesmarcaLinha;
begin
	if dataSet.IsEmpty then
    exit;

  dataSet.Edit;
  if dataSet.FieldByName('SEL').AsString = 'S' then
    dataSet.FieldByName('SEL').AsString := ''
  else
    dataSet.FieldByName('SEL').AsString := 'S';
  dataSet.Post;
end;

procedure TVeiculos._marcarTodos;
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Selecionando todos os registros');

    if not dataSet.Active then
      Exit;

    dataSet.DisableControls;
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
  	dataSet.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TVeiculos.confirmaAlteracao: boolean;
begin
  result := false;
  if (DataSet <> nil) and (DataSet.Active) and (DataSet.ChangeCount > 0) then
    if Application.MessageBox('Foram feitas alterações no banco de dados.' + chr(13) +
      'Deseja confirmar as alterções?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1)
      = mrYES then
      result := true;
end;

function TVeiculos.consulta: boolean;
var
	I, erro: Integer;
	vCampoTemp: string;
	vCondicaoTmp: string; 
  vsqlAdicional: string;
begin
	vCampoTemp := '';
  vsqlAdicional := '';
  
	if UpperCase(trim(vCons.campo)) = 'PLACA' then
  	vCampoTemp := 'VEICULOS.PLACA'
  else if UpperCase(trim(vCons.campo)) = 'NOME CLIENTE (NOME FANTASIA)' then
    vCampoTemp := 'CLIENTES.NOME_CLIENTE'
  else if UpperCase(trim(vCons.campo)) = 'NOME CLIENTE (RAZAO SOCIAL)' then
    vCampoTemp := 'CLIENTES.RAZAO'
  else if UpperCase(trim(vCons.campo)) = 'CEP CLIENTE' then
  	vCampoTemp := 'CLIENTES.CEP'
  else if UpperCase(trim(vCons.campo)) = 'ENDERECO CLIENTE' then
    vCampoTemp := 'CLIENTES.ENDERECO'
  else if UpperCase(trim(vCons.campo)) = 'NUM ENDERECO CLIENTE' then
	  vCampoTemp := 'CLIENTES.NUM_END_CLIENTE'
  else if UpperCase(trim(vCons.campo)) = 'TELEFONE CLIENTE' then
    vCampoTemp := 'CLIENTES.FONE_CLIENTE'
  else if UpperCase(trim(vCons.campo)) = 'CELULAR CLIENTE' then
    vCampoTemp := 'CLIENTES.FONE_CELULAR'
  else if UpperCase(trim(vCons.campo)) = 'EMAIL CLIENTE' then
  	vCampoTemp := 'CLIENTES.EMAIL'
  else if UpperCase(trim(vCons.campo)) = 'ESTADO CLIENTE' then
    vCampoTemp := 'ESTADOS.SIGLA_UF'
  else if UpperCase(trim(vCons.campo)) = 'CIDADE CLIENTE' then
    vCampoTemp := 'CIDADES.NOME_CIDADE'
  else if UpperCase(trim(vCons.campo)) = 'BAIRRO CLIENTE' then
    vCampoTemp := 'BAIRROS.NOME_BAIRRO'
  else if UpperCase(trim(vCons.campo)) = 'LOCALIDADE CLIENTE' then
    vCampoTemp := 'LOCALIDADE.LOCALIDADE'
  else if UpperCase(trim(vCons.campo)) = 'SETOR CLIENTE' then
    vCampoTemp := 'SETOR.SETOR';

	if vCons.porData then
  begin
    try
      erro := 0;
      StrToDate(vCons.dataIni);
    except
      vCons.dataIni := '';
      erro := erro + 1;
    end;
    try
      StrToDate(vCons.dataFim);
    except
      vCons.dataFim := '';
      erro := erro + 1;
    end;
    if erro = 2 then
    begin
      Application.MessageBox('Data Inválida. Informe no mínimo uma data correta', 'Atenção',
        MB_OK + MB_ICONINFORMATION);
    end;
  end; //porData

  if Trim(vCampoTemp) <> '' then
  begin
    vCondicaoTmp := vCons.Condicao;
    if vCondicaoTmp = 'Igual' then
      vCondicaoTmp := '='
    else if vCondicaoTmp = 'Maior' then
      vCondicaoTmp := '>'
    else if vCondicaoTmp = 'Maior ou Igual' then
      vCondicaoTmp := '>='
    else if vCondicaoTmp = 'Menor' then
      vCondicaoTmp := '<'
    else if vCondicaoTmp = 'Menor ou Igual' then
      vCondicaoTmp := '<='
    else if vCondicaoTmp = 'Diferente' then
      vCondicaoTmp := '<>'
    else if (vCondicaoTmp = 'Esta contido') then
      vCondicaoTmp := 'like'
    else if (vCondicaoTmp = 'Começa') then
      vCondicaoTmp := 'Começa'
    else
      vCondicaoTmp := '=';
    if trim(vsqlAdicional) <> '' then
     vsqlAdicional := vsqlAdicional + ' and ';
    if vCondicaoTmp = 'like' then
    begin
    	if (UpperCase(trim(vCons.campo)) = 'PLACA') and (trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valor)) <> trim(vCons.valor)) then
      	vsqlAdicional := vsqlAdicional + ' ((' + vCampoTemp + ' like ' + QuotedStr('%' + UpperCase(trim(vCons.valor)) + '%') + ') ' +
        	' or (' + vCampoTemp + ' like ' + QuotedStr('%' + UpperCase(trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valor))) + '%') + ')) '
      else
	      vsqlAdicional := vsqlAdicional + ' ' + vCampoTemp + ' like ' + QuotedStr('%' + UpperCase(trim(vCons.valor)) + '%');
    end
    else if vCondicaoTmp = 'Começa' then
    begin
    	if (UpperCase(trim(vCons.campo)) = 'PLACA') and (trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valor)) <> trim(vCons.valor)) then
       	vsqlAdicional := vsqlAdicional + ' ((' + vCampoTemp + ' like ' + QuotedStr(UpperCase(trim(vCons.valor)) + '%') + ') ' +
         	' or (' + vCampoTemp + ' like ' + QuotedStr(UpperCase(trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valor))) + '%') + ')) '
      else
      	vsqlAdicional := vsqlAdicional + ' ' + vCampoTemp + ' like ' + QuotedStr(UpperCase(trim(vCons.valor)) + '%')
    end
    else
    begin
    	if (UpperCase(trim(vCons.campo)) = 'PLACA') and (trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valor)) <> trim(vCons.valor)) then
	      vsqlAdicional := vsqlAdicional + ' ((' + vCampoTemp + ' ' + vCondicaoTmp + ' ' + QuotedStr(UpperCase(trim(vCons.valor))) + ') ' +
  	      ' or (' + vCampoTemp + ' ' + vCondicaoTmp + ' ' + QuotedStr(UpperCase(trim(vDadosIni.retornaPlacaNovaAntiga(vCons.valor)))) + ')) '
      else
	      vsqlAdicional := vsqlAdicional + ' ' + vCampoTemp + ' ' + vCondicaoTmp + ' ' + QuotedStr(UpperCase(trim(vCons.valor)));
    end;
    vCons.valor := '';
    vCons.campo := '';
    vCons.ordem := vCampoTemp;
  end;

  if vCons.porData then
    result := ConsultaCampos('VEICULOS', vCons.campo, vCons.ordem, vCons.dataIni,
      vCons.dataFim, vDadosIni.codEmpresa, 1,
      ' VEICULOS.*, CLIENTES.NOME_CLIENTE, CLIENTES.RAZAO, CLIENTES.CEP, CLIENTES.ENDERECO, CLIENTES.NUM_END_CLIENTE, ' +
      ' CLIENTES.FONE_CLIENTE, CLIENTES.FONE_CELULAR, CLIENTES.EMAIL, ' +
      ' ESTADOS.SIGLA_UF, CIDADES.NOME_CIDADE, BAIRROS.NOME_BAIRRO, LOCALIDADE.LOCALIDADE, SETOR.SETOR ',
      ' LEFT JOIN CLIENTES ON CLIENTES.COD_CLIENTE = VEICULOS.COD_CLIENTE AND CLIENTES.COD_EMPRESA = VEICULOS.COD_EMPRESA ' +
      ' LEFT JOIN ESTADOS ON ESTADOS.CODIGO_UF = CLIENTES.CODIGO_UF ' +
      ' LEFT JOIN CIDADES ON CIDADES.COD_CIDADE = CLIENTES.COD_CIDADE ' +
      ' LEFT JOIN BAIRROS ON BAIRROS.COD_BAIRRO = CLIENTES.COD_BAIRRO ' +
      ' LEFT JOIN LOCALIDADE ON LOCALIDADE.COD_LOCALIDADE = CLIENTES.COD_LOCALIDADE AND LOCALIDADE.COD_EMPRESA = CLIENTES.COD_EMPRESA '+
      ' LEFT JOIN SETOR ON SETOR.COD_SETOR = LOCALIDADE.COD_SETOR AND SETOR.COD_EMPRESA = LOCALIDADE.COD_EMPRESA ',
      vsqlAdicional)
  else
  	result := ConsultaCampos('VEICULOS', vCons.valor, vCons.campo, vCons.condicao,
      vCons.ordem, False, vDadosIni.codEmpresa,
      ' VEICULOS.*, CLIENTES.NOME_CLIENTE, CLIENTES.RAZAO, CLIENTES.CEP, CLIENTES.ENDERECO, CLIENTES.NUM_END_CLIENTE, ' +
      ' CLIENTES.FONE_CLIENTE, CLIENTES.FONE_CELULAR, CLIENTES.EMAIL, ' +
      ' ESTADOS.SIGLA_UF, CIDADES.NOME_CIDADE, BAIRROS.NOME_BAIRRO, LOCALIDADE.LOCALIDADE, SETOR.SETOR ',
      ' LEFT JOIN CLIENTES ON CLIENTES.COD_CLIENTE = VEICULOS.COD_CLIENTE AND CLIENTES.COD_EMPRESA = VEICULOS.COD_EMPRESA ' +
      ' LEFT JOIN ESTADOS ON ESTADOS.CODIGO_UF = CLIENTES.CODIGO_UF ' +
      ' LEFT JOIN CIDADES ON CIDADES.COD_CIDADE = CLIENTES.COD_CIDADE ' +
      ' LEFT JOIN BAIRROS ON BAIRROS.COD_BAIRRO = CLIENTES.COD_BAIRRO ' +
      ' LEFT JOIN LOCALIDADE ON LOCALIDADE.COD_LOCALIDADE = CLIENTES.COD_LOCALIDADE AND LOCALIDADE.COD_EMPRESA = CLIENTES.COD_EMPRESA '+
      ' LEFT JOIN SETOR ON SETOR.COD_SETOR = LOCALIDADE.COD_SETOR AND SETOR.COD_EMPRESA = LOCALIDADE.COD_EMPRESA ',
      vsqlAdicional);
end;

{ TModVeiculo }

function TModVeiculo.abreModVeiculos: boolean;
begin
  result := montaSelect('SELECT * FROM TIPMODELO where ativo = 1' +
    ' and COD_EMPRESA =' + vDadosIni.codEmpresa + ' ORDER BY DESCRICAO ');
end;

function TModVeiculo.abreTabelaFipe: boolean;
begin
  if TabelaFipe = nil then
    TabelaFipe := TabelaFipe.create;
  TabelaFipe.buscas.Close;
  TabelaFipe.buscas.SQL.Text := 'select * from tab_fipe where ativo=1 order by desc_mod';
  TabelaFipe.buscas.Open;
  TabelaFipe.buscas.FetchAll;
end;

function TModVeiculo.abreTipoCombustiveis: boolean;
begin
  if LTPComb = nil then
    LTPComb := TListaTPComb.create;
  LTPComb.buscas.Close;
  LTPComb.buscas.SQL.Text := 'SELECT  CODIGO_TPCOMB,DESCR_COMB FROM TP_COMB_RENAVAM WHERE ativo=1';
  LTPComb.buscas.Open;
  LTPComb.buscas.FetchAll;
end;

function TModVeiculo.AbrirLixeira: boolean;
begin
  if not StatusLixeira then
  begin
    Application.MessageBox('A lixeira está vazia.', 'Informação', MB_OK + MB_ICONINFORMATION +
      MB_DEFBUTTON1);
    montaSelect(ultimasql);
    result := false;
  end
  else
    result := montaSelect(' select * from tipmodelo ' +
    	' where ativo = 0 ' +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' order by codigo ');
end;

procedure TModVeiculo.CadModVeiculos(TipoForm: integer);
begin
  vDadosIni.vTipoForm := TipoForm;
  if DtmVeiculos = nil then
    DtmVeiculos := TDtmVeiculos.Create(DtmVeiculos);

  if FrmCadModVeiculos = nil then
  begin
    if TipoForm > 0 then
      vDadosIni.vModalOuChild := 'M';
    Application.CreateForm(TFrmCadModVeiculos, FrmCadModVeiculos);
  end;

  if (TipoForm > 0) and (not FrmCadModVeiculos.Visible) then
    FrmCadModVeiculos.ShowModal
  else if (not FrmCadModVeiculos.Visible) then
    FrmCadModVeiculos.Show
  else if FrmCadModVeiculos.FormStyle = fsMDIChild then
    FrmCadModVeiculos.Show
  else
    FrmCadModVeiculos.ShowModal;
end;

constructor TModVeiculo.create;
begin
  if DtmVeiculos = nil then
    DtmVeiculos := TDtmVeiculos.Create(DtmVeiculos);
  DataSet := TClientDataSet(DtmVeiculos.cdsModVeiculos);
  transacao := TIBTransaction(DtmVeiculos.IBTransModVeiculos);
  Buscas := TIBQuery(DtmVeiculos.qrBuscasMV);
  TabelaFipe := TTabelaFipe.create;
  vTabPreco := TTabPrecoVeic.create;
  vCodFab := TModVeiculo_CodigoFab.create;
  vServicosSugeridos := TServicosSugeridos.create;
end;

function TModVeiculo.delete: boolean;
var
  vtemp: string;
	vApagar: boolean;
  vCod_Mod_Veic: string;
  vDesc_Mod_Veic: string;
  I: Integer;
begin
  try
    Result := False;
    if dataSet.IsEmpty then
      exit;

    try
      vApagar        := dataSet.FieldByName('ATIVO').AsInteger = 0;
      vCod_Mod_Veic  := trim(dataSet.FieldByName('CODIGO').AsString);
      vDesc_Mod_Veic := trim(dataSet.FieldByName('DESCRICAO').AsString);

      prepare_loop('SEL = ''S''');

      if not dataset.IsEmpty then
      begin
        vApagar        := dataSet.FieldByName('ATIVO').AsInteger = 0;
        vCod_Mod_Veic  := '';
        vDesc_Mod_Veic := '';
      end;
    finally
      prepare_loop_done;
    end;

    try
      if (trim(vCod_Mod_Veic) <> '') then
        prepare_loop('CODIGO = ' + vCod_Mod_Veic)
      else
        prepare_loop('SEL = ''S''');

      if vApagar then
      begin
        vtemp := 'Tem certeza que deseja excluir este registro permanentemente?' + #13 + #13 +
          'MODELO DE VEÍCULO' + #13 +
          'Código: ' + vCod_Mod_Veic + #13 +
          'Descrição: ' + vDesc_Mod_Veic;

        if (trim(vCod_Mod_Veic) = '') then
          vtemp := 'Tem certeza que deseja excluir os ' + IntToStr(dataSet.RecordCount) + ' registros selecionados permanentemente?';

        if not vDadosIni.PesqPros('VEI019', 'EXCLUIR', '', 'TIPMODELO',
          vDadosIni.IfThen(trim(vCod_Mod_Veic) <> '', vCod_Mod_Veic, ''), buscas, true) then
            exit;

        if Application.MessageBox(PChar(vtemp),
          'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> mrYES then
          exit;
      end
      else
      begin
        vtemp := 'Tem certeza que deseja mover este registro para a lixeira?' + #13 + #13 +
          'MODELO DE VEÍCULO' + #13 +
          'Código: ' + vCod_Mod_Veic + #13 +
          'Descrição: ' + vDesc_Mod_Veic;

        if (trim(vCod_Mod_Veic) = '') then
          vtemp := 'Tem certeza que deseja mover os ' + IntToStr(dataSet.RecordCount) + ' registros selecionados para a lixeira?';

        if not vDadosIni.PesqPros('VEI015', 'EXCLUIR', '', 'TIPMODELO',
           vDadosIni.IfThen(trim(vCod_Mod_Veic) <> '', vCod_Mod_Veic, ''), buscas, true) then
            exit;

        if Application.MessageBox(PChar(vtemp),
          'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> mrYES then
          exit;
      end;

      if vApagar then
        vDadosIni.abreStatusProcessamento('', 'Excluíndo modelo(s) de veículo permanentemente')
      else
        vDadosIni.abreStatusProcessamento('', 'Movendo modelo(s) de veículo para lixeira');

      dataset.First;
      while not dataset.Eof do
      begin
        if vApagar then
          vDadosIni.abreStatusProcessamento('', 'Excluíndo modelo(s) de veículo permanentemente (' + IntToStr(dataSet.RecNo) + '/' + IntToStr(dataSet.RecordCount) + ')')
        else
          vDadosIni.abreStatusProcessamento('', 'Movendo modelo(s) de veículo para lixeira (' + IntToStr(dataSet.RecNo) + '/' + IntToStr(dataSet.RecordCount) + ')');

        if vApagar then
        begin
          SqlExec(' update tipmodelo set ativo = 99 ' +
            ' where codigo = %d and cod_empresa = %d ',
            [fint('codigo'), fint('cod_empresa')], buscas);
          if (trim(vCod_Mod_Veic) = '') then
            vDadosIni.GravaAuditoria('VEI019', 'EXCLUIR', '', 'TIPMODELO',
              dataSet.FieldByName('CODIGO').AsString, buscas);
        end
        else
        begin
          SqlExec(' update tipmodelo set ativo = 0 ' +
            ' where codigo = %d and cod_empresa = %d ',
            [fint('codigo'), fint('cod_empresa')], buscas);

          if (trim(vCod_Mod_Veic) = '') then
            vDadosIni.GravaAuditoria('VEI015', 'EXCLUIR', '', 'TIPMODELO',
              dataSet.FieldByName('CODIGO').AsString, buscas);
        end;

        dataset.Next;
      end;
    finally
      vDadosIni.fechaStatusProcessamento;
      prepare_loop_done;
    end;

    Result := CommitaTransacao;
    if Result then
    begin
      vDadosIni.GravaAuditoria(vDadosIni.IfThen(vApagar, 'VEI019', 'VEI015'),
        'EXCLUIR', 'SUCESSO', 'TIPMODELO',
        vDadosIni.IfThen(trim(vCod_Mod_Veic) <> '', vCod_Mod_Veic, ''), buscas);
    end
    else
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria(vDadosIni.IfThen(vApagar, 'VEI019', 'VEI015'),
        'EXCLUIR', 'FALHA', 'TIPMODELO',
        vDadosIni.IfThen(trim(vCod_Mod_Veic) <> '', vCod_Mod_Veic, ''), buscas);
    end;
    if Result then
     Refresh;
  except
    on E: Exception do
		begin
			RollBackTransacao;
      vDadosIni.fechaStatusProcessamento;
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

destructor TModVeiculo.destroy;
begin
//  dataSet := TClientDataSet(DtmVeiculos.cdsModVeiculos);
  if TabelaFipe <> nil then
    TabelaFipe.buscas.Close;
  if LTPComb<>nil then
    LTPComb.buscas.Close;
  vTabPreco.Free;
  vTabPreco := nil;
  vServicosSugeridos.Free;
  vServicosSugeridos := nil;
  FreeAndNil(vCodFab);
  inherited;
end;

function TModVeiculo.edit: boolean;
begin
  Result := inherited edit;
  if result then
  begin
    abreTabelaFipe;
    abreTipoCombustiveis;
    vServicosSugeridos.abreServico(dataSet);
    vCodFab.abreCodigo(dataSet.FieldByName('codigo').AsInteger);
    if Trim(dataSet.FieldByName('TPCOMB').AsString) <> '' then
      try
        dataSet.FieldByName('TPCOMB').AsString := IntToStr(StrToInt(Trim(dataSet.FieldByName('TPCOMB').AsString)));
      except
      end;
//    dataSet.FieldByName('TPCOMB').AsInteger := dataSet.FieldByName('TPCOMB').AsInteger;
  end;
end;

function TModVeiculo.insert: boolean;
begin
  result := inherited insert;
  if result then
  begin
    abreTabelaFipe;
    abreTipoCombustiveis;
    vServicosSugeridos.abreServico(dataSet);
    dataSet.FieldByName('COD_EMPRESA').AsInteger := strToInt(vDadosIni.codEmpresa);
    
    buscas.Close;
    buscas.SQL.Text := ' select COD_CTA_EST_VEIC_NOVO, COD_CTA_EST_VEIC_SEMI from CONT_LIG_CONTABIL' +
      ' where cod_empresa = ' +vDadosIni.codEmpresa;
    buscas.Open;

    dataSet.FieldByName('COD_CTA_EST_VEIC').AsString := buscas.FieldByName('COD_CTA_EST_VEIC_NOVO').AsString;
    dataSet.FieldByName('COD_CTA_EST_SEMI').AsString := buscas.FieldByName('COD_CTA_EST_VEIC_SEMI').AsString;
  end;
end;

function TModVeiculo.post: boolean;
var
  acao: string;
begin
  try
    Result := false;

    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      result := true;
      exit;
    end;
    if dataSet.State = dsInsert then
      acao := 'INSERIR'
    else
      acao := 'EDITAR';

    if trim(dataSet.FieldByName('DESCRICAO').AsString) = '' then
    begin
      FrmCadModVeiculos.TabSheet3.Show;
      raiseExceptionCreate('Descrição do modelo não informada.', 'DBEDIT2');
    end;
    
    if vDadosIni.vRegistro.vSisVeiculos then
    begin
      if (trim(dataSet.FieldByName('TPCOMB').AsString) = '') then
      begin
        FrmCadModVeiculos.TabSheet3.Show;
        raiseExceptionCreate('Tipo de combustível não informado.', 'DBLookupComboBox2');
      end;
      if trim(dataSet.FieldByName('NCMSH').AsString) = '' then
      begin
        FrmCadModVeiculos.TabSheet3.Show;
        raiseExceptionCreate('O campo NCM/SH precisa ser preenchido.', 'DBEDIT7');
      end;
      if (trim(dataSet.FieldByName('RENAVAM').AsString) = '') then
      begin
        FrmCadModVeiculos.TabSheet3.Show;
        raiseExceptionCreate('Renavam (código do produto na fábrica) não informado.', 'DBEDIT11');
      end;
      if trim(dataSet.FieldByName('ESPRENAVAM').AsString) = '' then
      begin
        FrmCadModVeiculos.TabSheet3.Show;
        raiseExceptionCreate('Espécie Renavam não informada.', 'DBCOMBOBOX6');
      end;
      if trim(dataSet.FieldByName('TIP_VEICULO').AsString) = '' then
      begin
        FrmCadModVeiculos.TabSheet3.Show;
        raiseExceptionCreate('Modelo Renavan não informado.', 'DBCOMBOBOX5');
      end;
      if (trim(dataSet.FieldByName('VNDESTOQUE').AsString) = 'S') and (dataSet.FieldByName('VL_UNITARIO_NF').AsFloat <= 0) then
      begin
        FrmCadModVeiculos.TabSheet3.Show;
        raiseExceptionCreate('Valor unitário de NF inválido.' + chr(13) + 'Valor deve ser maior que zero.', 'DBEDIT50');
      end;
      if trim(dataSet.FieldByName('CMKG').AsString) = '' then
      begin
        FrmCadModVeiculos.TabSheet3.Show;
        raiseExceptionCreate('CMKG não informado.', 'DBEDIT51');
      end;
      if trim(dataSet.FieldByName('DISTANCIAEIXO').AsString) = '' then
      begin
        FrmCadModVeiculos.TabSheet3.Show;
        raiseExceptionCreate('Distância entre eixos não informada.', 'DBEDIT52');
      end;
      if dataSet.FieldByName('PESOB').AsFloat <= 0 then
      begin
        FrmCadModVeiculos.TabSheet3.Show;
        raiseExceptionCreate('Peso bruto não informado.' + chr(13) + 'Valor deve ser maior que zero.', 'DBEDIT53');
      end;
      if dataSet.FieldByName('PESOL').AsFloat <= 0 then
      begin
        FrmCadModVeiculos.TabSheet3.Show;
        raiseExceptionCreate('Peso liquido inválido.' + chr(13) + 'Valor deve ser maior que zero.', 'DBEDIT54');
      end;
      if dataSet.FieldByName('VALOR_PIS').Asfloat <= 0 then
      begin
        FrmCadModVeiculos.TabSheet3.Show;
        raiseExceptionCreate('Valor PIS inválido.' + chr(13) + 'Valor deve ser maior que zero.', 'DBEDIT28');
      end;
      if dataSet.FieldByName('VALOR_COFINS').AsFloat <= 0 then
      begin
        FrmCadModVeiculos.TabSheet3.Show;
        raiseExceptionCreate('Valor COFINS inválido.' + chr(13) + 'Valor deve ser maior que zero.', 'DBEDIT29');
      end;
      if vTabPreco.dataSet.State in [dsInsert, dsEdit] then
      begin
        FrmCadModVeiculos.TabSheet4.Show;
        raiseExceptionCreate('Confime ou cancele antes de confirmar a operação', 'BitBtn_Salvar_Tab');
      end;
    end;

    if not vServicosSugeridos.verificarServicos(dataSet) then
    begin
    	FrmCadModVeiculos.TabSheet6.Show;
     	raiseExceptionCreate('Nenhum serviço informado', 'DBGrid4');
    end;

    dataSet.FieldByName('RENAVAM').AsString := copy(trim(dataSet.FieldByName('RENAVAM').AsString), 1, 6);
    dataSet.FieldByName('TPCOMB').AsString := vDadosIni.StrZero(dataSet.FieldByName('TPCOMB').AsString, 2);
    dataSet.FieldByName('ESPRENAVAM').AsString:=vDadosIni.StrZero(dataSet.FieldByName('ESPRENAVAM').AsString, 2);
    dataSet.FieldByName('TIP_VEICULO').AsString:=vDadosIni.StrZero(dataSet.FieldByName('TIP_VEICULO').AsString, 2);
    dataSet.FieldByName('PISCOFINS').AsCurrency := dataSet.FieldByName('VALOR_PIS').AsCurrency + dataSet.FieldByName('VALOR_COFINS').AsCurrency;
    dataSet.FieldByName('COMBUSTIVEL').AsString := LTPComb.buscas.FieldByName('DESCR_COMB').AsString;
    if dataSet.State in [dsInsert] then
    begin
      dataSet.FieldByName('CODIGO').AsInteger := Gencodigo('TIPMODELO', DtmVeiculos.SpIncCodigoMV,
        vDadosIni.codEmpresa);
    end;

    Result := inherited post;

    if result and (dataSet.ChangeCount = 0) and (acao = 'EDITAR') then
    begin
      Cancel;
      Result := true;
      Exit;
    end;
    
    vServicosSugeridos.SalvarServicos(dataSet);

    if result then
      result := apply;
    if result then
      result := CommitaTransacao;

    if Result then
    begin
      vDadosIni.GravaAuditoria('VEI018', acao, 'SUCESSO', 'TIPMODELO', dataSet.FieldByName('CODIGO').AsString, buscas);
      if acao = 'INSERIR' then
      begin
        if (trim(dataSet.FieldByName('VNDESTOQUE').AsString) = 'S') then
        begin
          if dataSet.State in [dsInsert] then
           Application.MessageBox('Favor editar este Modelo e colocar os valores mínimos/tabela por ano e modelo', 'Atenção', MB_ICONERROR + MB_OK);
        end;
      end;
    end
    else
      vDadosIni.GravaAuditoria('VEI018', acao, 'FALHA', 'TIPMODELO', dataSet.FieldByName('CODIGO').AsString, buscas);
    if Result then
      Refresh

  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TModVeiculo.restaurarRegistro: boolean;
var
	vCodModVeic: string;
	vDescModVeic: string;
  vtemp: string;
begin
	try
  	result := false;
    if dataSet.IsEmpty then
      exit;

    if dataSet.FieldByName('ATIVO').asinteger <> 0 then
    begin
      Application.MessageBox('Registro já está ativo' + chr(13) +
          'Não é necessário restaurá-lo', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      exit;
    end;

    try
      vCodModVeic := trim(dataSet.FieldByName('CODIGO').AsString);
      vDescModVeic := trim(dataSet.FieldByName('DESCRICAO').AsString);

      prepare_loop('SEL = ''S''');
      if not dataset.IsEmpty then
      begin
        vCodModVeic := '';
        vDescModVeic := '';
      end;
    finally
      prepare_loop_done;
    end;

    try
    	if (trim(vCodModVeic) <> '') then
      	prepare_loop('CODIGO = ' + vCodModVeic)
      else
		    prepare_loop('SEL = ''S''');

      vtemp := 'Tem certeza que deseja restaurar este registro?' + #13 + #13 +
        'MODELO DE VEÍCULO' + #13 +
        'Código: ' + vCodModVeic + #13 +
        'Descrição: ' + vDescModVeic;

      if (trim(vDescModVeic) = '') then
          vtemp := 'Tem certeza que deseja restaurar os ' + IntToStr(dataSet.RecordCount) + ' registros selecionados?';

      if not vDadosIni.PesqPros('VEI017', 'RESTAURAR', '', 'TIPMODELO',
        vDadosIni.IfThen(trim(vCodModVeic) <> '', vCodModVeic, ''), buscas, true) then
          exit;

      if Application.MessageBox(PChar(vtemp),
        'Restaurar Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> mrYES then
        exit;

      vDadosIni.abreStatusProcessamento('', 'Restaurando modelo(s) de veículo');

      dataset.First;
      while not dataset.Eof do
      begin
      	vDadosIni.abreStatusProcessamento('', 'Restaurando modelo(s) de veículo (' + IntToStr(dataSet.RecNo) + '/' + IntToStr(dataSet.RecordCount) + ')');

        SqlExec(' update tipmodelo set ativo = 1 ' +
          ' where codigo = %d and cod_empresa = %d ',
          [fint('codigo'), fint('cod_empresa')], buscas);

        if (trim(vCodModVeic) = '') then
          vDadosIni.GravaAuditoria('VEI017', 'RESTAURAR', '', 'TIPMODELO',
            dataSet.FieldByName('CODIGO').AsString, buscas);

        dataset.Next;
      end;
    finally
    	vDadosIni.fechaStatusProcessamento;
      prepare_loop_done;
    end;
    Result := CommitaTransacao;
    if Result then
    begin
    	vDadosIni.GravaAuditoria('VEI017', 'RESTAURAR', 'SUCESSO', 'TIPMODELO',
        vDadosIni.IfThen(trim(vCodModVeic) <> '', vCodModVeic, ''), buscas);
    end
    else
    begin
    	RollBackTransacao;
    	vDadosIni.GravaAuditoria('VEI017', 'RESTAURAR', 'FALHA', 'TIPMODELO',
        vDadosIni.IfThen(trim(vCodModVeic) <> '', vCodModVeic, ''), buscas);
    end;

    if Result then
      Refresh;
  except
    on E: Exception do
		begin
			RollBackTransacao;
      vDadosIni.fechaStatusProcessamento;
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TModVeiculo.StatusLixeira: boolean;
begin
  //Se lixeira vazia retorna falso senão verdadeiro
  result := ExecutaComandosSql('SELECT first 1 codigo FROM TIPMODELO ' +
  	' where ativo = 0 ' +
    ' and cod_empresa = ' + vDadosIni.codEmpresa);
end;

procedure TModVeiculo._desmarcarTodos;
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Desfazendo a seleção de todos os registros');

    if not dataSet.Active then
      Exit;

    dataSet.DisableControls;
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
  	dataSet.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TModVeiculo._marcaDesmarcaLinha;
begin
	if dataSet.IsEmpty then
    exit;

  dataSet.Edit;
  if dataSet.FieldByName('SEL').AsString = 'S' then
    dataSet.FieldByName('SEL').AsString := ''
  else
    dataSet.FieldByName('SEL').AsString := 'S';
  dataSet.Post;
end;

procedure TModVeiculo._marcarTodos;
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Selecionando todos os registros');

    if not dataSet.Active then
      Exit;

    dataSet.DisableControls;
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
  	dataSet.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TModVeiculo.confirmaAlteracao: boolean;
begin
  result := false;
  if (DataSet <> nil) and (DataSet.Active) and (DataSet.ChangeCount > 0) then
    if Application.MessageBox('Foram feitas alterações no banco de dados.' + chr(13) +
      'Deseja confirmar as alterções?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1)
      = mrYES then
      result := true;
end;

{ TTabelaFipe }

constructor TTabelaFipe.create;
begin
  transacao := TIBTransaction(DtmVeiculos.IBTransPesquisa);
  Buscas := TIBQuery(DtmVeiculos.qrTabelaFipe)
end;

destructor TTabelaFipe.destroy;
begin
  buscas.Close;
end;

{ TLocCliente }

function TLocCliente.abreClientes(codcli: integer): boolean;
begin
  buscas.Close;
  buscas.SQL.Text := 'SELECT * FROM CLIENTES WHERE ativo = 1' +
    ' and COD_EMPRESA =' + vDadosIni.codEmpresa + ' and cod_cliente = ' + inttostr(codcli);
  buscas.Open;
  if buscas.IsEmpty then
    result:=false
  else
    Result:=true;
end;

constructor TLocCliente.create;
begin
  transacao := TIBTransaction(DtmVeiculos.IBTransVeiculos);
  Buscas := TIBQuery(DtmVeiculos.qrLocClientes)
end;

destructor TLocCliente.destroy;
begin

  inherited;
end;

function TLocCliente.verificacliente(vcod: integer): boolean;
begin
{  buscas.close;
  buscas.SQL.text:='select count(*) from clientes where cod_cliente = '+IntToStr(vcod)+
  ' and cod_empresa = '+vDadosIni.codEmpresa;
  buscas.open;
  if buscas.IsEmpty then
    result:=false
  else
    Result:=true;
  buscas.close;}  
end;

{ TEspecieVeiculo }

function TEspecieVeiculo.abreEspecieVeiculo: boolean;
begin
  buscas.Close;
  buscas.SQL.Text := 'SELECT * FROM ESPECIE_VEICULO';
  buscas.Open;
end;

constructor TEspecieVeiculo.create;
begin
  transacao := TIBTransaction(DtmVeiculos.IBTransVeiculos);
  Buscas := TIBQuery(DtmVeiculos.qrEspecieVeiculo)
end;

destructor TEspecieVeiculo.destroy;
begin

  inherited;
end;

{ TLocColaborador }

function TLocColaborador.abreLocColaborador: boolean;
begin
  buscas.Close;
  buscas.SQL.Text := 'SELECT * FROM COLABORADOR WHERE ativo = 1' +
    ' and COD_EMPRESA =' + vDadosIni.codEmpresa;
  buscas.Open;
end;

constructor TLocColaborador.create;
begin
  transacao := TIBTransaction(DtmVeiculos.IBTransVeiculos);
  Buscas := TIBQuery(DtmVeiculos.qrLocColaborador)
end;

destructor TLocColaborador.destroy;
begin

  inherited;
end;

{ TListaTPComb }

constructor TListaTPComb.create;
begin
  transacao := TIBTransaction(DtmVeiculos.IBTransPesquisa);
  Buscas := TIBQuery(DtmVeiculos.qrAbreTPComb);
end;

destructor TListaTPComb.destroy;
begin
  buscas.Close;
end;

{ TTabPrecoVeic }

constructor TTabPrecoVeic.create;
begin
if DtmVeiculos = nil then
    DtmVeiculos := TDtmVeiculos.Create(DtmVeiculos);
  DataSet := TClientDataSet(DtmVeiculos.cdsTabPrecoVeic);
  transacao := TIBTransaction(DtmVeiculos.IBTransVeiculos);
  Buscas := TIBQuery(DtmVeiculos.qrBuscasV);
end;

function TTabPrecoVeic.delete: boolean;
var
  codigo: string;
begin
  Result := False;
  if dataSet.IsEmpty then
    exit;
  codigo := dataSet.FieldByName('cod_veiculo').AsString;

  if Application.MessageBox('Deseja excluir Tabela Preço?',
    'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IDYES then
  begin
    buscas.Close;
    buscas.SQL.Text := 'delete from tabpreco_veiculo where cod_veiculo = ' + codigo
      + ' and cod_empresa = ' + vDadosIni.codEmpresa;

    try
      buscas.ExecSQL;
      vDadosIni.GravaAuditoria('VEI092', 'EXCLUIR', 'SUCESSO', 'TABPRECO_VEICULO', codigo, buscas);
      CommitaTransacao;
    except
      RollBackTransacao;
      vDadosIni.GravaAuditoria('VEI092', 'EXCLUIR', 'FALHA', 'TABPRECO_VEICULO', codigo, buscas);
    end;
  end;
  result := true;
  Refresh;
end;

function TTabPrecoVeic.edit: boolean;
begin
    Result := inherited Edit;
  if not result then
    Exit;
end;

function TTabPrecoVeic.insert(vModVeic: TModVeiculo): boolean;
begin
   Result := inherited insert;
  if not result then
    Exit;
  dataSet.FieldByName('COD_EMPRESA').AsInteger := strToInt(vDadosIni.codEmpresa);
  dataSet.FieldByName('COD_VEICULO').AsInteger := vModVeic.dataSet.FieldByName('CODIGO').AsInteger;
end;

function TTabPrecoVeic.post: boolean;
var
  acao: string;
begin
  try
    Result := false;

    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      result := true;
      exit;
    end;

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    if dataSet.FieldByName('ano_fab').IsNull then
    begin
      FrmCadModVeiculos.TabSheet4.Show;
      raiseExceptionCreate('Ano Fabricação não informado!', 'DBEdit24');
    end;

    if Length(trim(dataSet.FieldByName('ano_fab').AsString)) < 4 then
    begin
     FrmCadModVeiculos.TabSheet4.Show;
     raiseExceptionCreate('Ano Fabricação incorreto!', 'DBEdit24');
    end;

    if (dataSet.FieldByName('ano_mod').isnull) then
    begin
      FrmCadModVeiculos.TabSheet4.Show;
      raiseExceptionCreate('Ano Modelo não informado!', 'DBEdit25');
    end;

    if Length(trim(dataSet.FieldByName('ano_mod').AsString)) < 4 then
    begin
     FrmCadModVeiculos.TabSheet4.Show;
     raiseExceptionCreate('Ano Modelo incorreto!', 'DBEdit25');
    end;

    if vDadosIni.StrToFloatFormat(dataSet.FieldByName('prec_min').AsFloat, 2) <= 0 then
    begin
      FrmCadModVeiculos.TabSheet4.Show;
      raiseExceptionCreate('Preço Mínimo não informado!', 'DBEdit26');
    end;

    if vDadosIni.StrToFloatFormat(dataSet.FieldByName('prec_tab').AsFloat, 2) <= 0 then
    begin
      FrmCadModVeiculos.TabSheet4.Show;
      raiseExceptionCreate('Preço Tabela não informado!', 'DBEdit27');
    end;


    if vDadosIni.StrToFloatFormat(dataSet.FieldByName('prec_tab').AsFloat, 2) < vDadosIni.StrToFloatFormat(dataSet.FieldByName('prec_min').AsFloat, 2) then
    begin
      FrmCadModVeiculos.TabSheet4.Show;
      raiseExceptionCreate('Preço Tabela não deve ser menor que Preço Mínimo!', 'DBEdit26');
    end;

    if dataSet.State = dsInsert then
      if not _existePrecoVeic(dataSet.FieldByName('cod_veiculo').AsString, dataSet.FieldByName('ano_fab').AsString, dataSet.FieldByName('ano_mod').AsString) then
      begin
        FrmCadModVeiculos.TabSheet4.Show;
        Application.MessageBox('Já existe um preço cadastrado para esse Ano/Mod!', 'Atenção', MB_OK + MB_ICONINFORMATION +  MB_DEFBUTTON1);
        exit;
      end;

    Result := inherited post;

    if dataSet.ChangeCount = 0 then
    begin
      Result := true;
      exit;
    end;

    if result then
      result := apply;
    if result then
      result := CommitaTransacao;

    if Result then
      vDadosIni.GravaAuditoria('VEI089', acao, 'SUCESSO', 'TABPRECO_VEICULO', dataSet.FieldByName('cod_veiculo').AsString, buscas)
    else
      vDadosIni.GravaAuditoria('VEI089', acao, 'FALHA', 'TABPRECO_VEICULO', dataSet.FieldByName('cod_veiculo').AsString, buscas);
    if Result then
      Refresh;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TTabPrecoVeic._AbreTabPrecoVeic(vModVeic: TModVeiculo): boolean;
begin
  if vModVeic.dataSet.IsEmpty then
    exit;
  Result := montaSelect('SELECT TABPRECO_VEICULO.* FROM TABPRECO_VEICULO' +
    ' INNER JOIN TIPMODELO ON TIPMODELO.CODIGO = TABPRECO_VEICULO.COD_VEICULO AND TIPMODELO.COD_EMPRESA = TABPRECO_VEICULO.COD_EMPRESA' +
    ' WHERE TABPRECO_VEICULO.COD_VEICULO = ' + vModVeic.dataSet.FieldByName('CODIGO').AsString +
    ' AND TABPRECO_VEICULO.COD_EMPRESA  = ' + vDadosIni.codEmpresa + ' and TABPRECO_VEICULO.COD_VEICULO <> 0');
end;

function TTabPrecoVeic._existePrecoVeic(pCodMod, pAnoFab,
  pAnoMod: string): boolean;
begin
  buscas.Close;
  buscas.SQL.Text := 'select cod_veiculo from tabpreco_veiculo' +
  '  where cod_veiculo =' + pCodMod + ' and ano_fab = ' + pAnoFab + ' and ano_mod = '+pAnoMod+'  and cod_empresa = '+vDadosIni.codEmpresa+'';
  buscas.Open;

  Result := buscas.IsEmpty;
end;

{ TModVeiculo_CodigoFab }

function TModVeiculo_CodigoFab.abreCodigo(pCodigo: Integer): Boolean;
begin
  montaSelect('select * from TIPMODELO_CODIGOFAB where codigo = ' + IntToStr(pCodigo) +
  ' and cod_empresa = ' + vDadosIni.codEmpresa);
end;

constructor TModVeiculo_CodigoFab.create;
begin
  if DtmVeiculos = nil then
    DtmVeiculos := TDtmVeiculos.Create(DtmVeiculos);
  DataSet := TClientDataSet(DtmVeiculos.cdsModVCorF);
  transacao := TIBTransaction(DtmVeiculos.IBTransModVeiculos);
  Buscas := TIBQuery(DtmVeiculos.qrBuscasMV);
end;

function TModVeiculo_CodigoFab.delete: Boolean;
begin
  Result := False;

  if not dataSet.IsEmpty then
   Result := inherited delete;

  if Result then
    Result := Apply;

  if Result then
    CommitaTransacao
  else
    RollBackTransacao;
end;

function TModVeiculo_CodigoFab.insereCodigoFab(pCodigo: Integer; pCodFab: string): boolean;
begin
  Result := False;
  try
    dataSet.Filter := 'CODIGO_FAB = ' + QuotedStr(Trim(pCodFab));
    dataSet.Filtered := True;

    if Trim(dataSet.FieldByName('codigo_fab').AsString) = trim(pCodFab) then
      raiseExceptionCreate('Codigo informado já existe para o modelo selecionado','');

    if Length(Trim(pCodFab)) > 60  then
      raiseExceptionCreate('Codigo informado deve conter até 60 caracteres','');

    buscas.Close;
    buscas.SQL.Text := 'select * from TIPMODELO_CODIGOFAB' +
      ' where codigo <> ' + IntToStr(pCodigo) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and codigo_fab = ' + QuotedStr(Trim(pCodFab));
    buscas.Open;

    if not buscas.IsEmpty then
      raiseExceptionCreate('Codigo informado já existe para outro modelo de codigo: ' + buscas.FieldByName('codigo').AsString,'');

    dataSet.Insert;
    dataSet.FieldByName('codigo').AsInteger := pCodigo;
    dataSet.FieldByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
    dataSet.FieldByName('codigo_fab').AsString := Trim(pCodFab);
    dataSet.Post;

    Result := Apply;

    if Result then
      CommitaTransacao
    else
      RollBackTransacao;

  finally
    dataSet.Filtered := False;
    dataSet.Filter := '';
  end;
end;

{ TServicosSugeridos }

function TServicosSugeridos.abreServico(pDataset: TDataSet): boolean;
begin
 Result := montaSelect(' select regras_sug.codigo, regras_sug.descricao, ' +
  	' regras_sug.mes_ret_serv1, regras_sug.mes_ret_serv2, regras_sug.interv_mes_serv, ' +
    ' regras_sug.km_ret_serv1, regras_sug.km_ret_serv2, regras_sug.interv_km_serv from regras_sug ' +
  	' where regras_sug.tipo = ''V'' ' +
    ' and regras_sug.cod_empresa = ' + vDadosIni.codEmpresa + ' and regras_sug.ativo = 1 ' +
    ' order by regras_sug.descricao ');

 if pDataset.FieldByName('CODIGO').AsInteger > 0 then
 begin
   dataSet.First;
   while not dataSet.Eof do
   begin
     buscas.Close;
     buscas.SQL.Text := ' select regras_sug_itens.codigo, regras_sug_itens.cod_tipo from regras_sug_itens ' +
      ' where regras_sug_itens.codigo = :codigo and regras_sug_itens.cod_tipo = :cod_tipo ' +
      ' and regras_sug_itens.cod_empresa = :cod_empresa and regras_sug_itens.tipo = :tipo ';
     buscas.ParamByName('CODIGO').AsInteger := dataset.FieldByName('CODIGO').AsInteger;
     buscas.ParamByName('COD_TIPO').AsInteger := pDataset.FieldByName('CODIGO').AsInteger;
     buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
     buscas.ParamByName('TIPO').AsString := 'V';
     buscas.Open;

     if not buscas.IsEmpty then
     begin
       dataSet.Edit;
       dataSet.FieldByName('SEL').AsString := 'S';
       dataSet.Post;
     end;

     dataSet.Next;
   end;
   dataSet.First;
 end;
end;

constructor TServicosSugeridos.create;
begin
  if DtmVeiculos = nil then
    DtmVeiculos := TDtmVeiculos.Create(DtmVeiculos);
  dataSet := TClientDataSet(DtmVeiculos.cdsServicosSugeridos);
  transacao := TIBTransaction(DtmVeiculos.IBTransVeiculos);
  buscas := TIBQuery(DtmVeiculos.qrBuscasV);
end;

procedure TServicosSugeridos.SalvarServicos(pDataset: TDataSet);
begin
  if dataSet.IsEmpty then
  	exit;

  if not vDadosIni.vSugServico.vHabilitarSug then
  	exit;  

  try
    dataSet.Filter := 'SEL = ''S''';
    dataSet.Filtered := True;

    vDadosIni.abreStatusProcessamento('', 'Aguarde. Incluindo serviços para o(s) modelo(s) de veículo');

    buscas.Close;
    buscas.SQL.Text := ' DELETE FROM REGRAS_SUG_ITENS ' +
      ' WHERE COD_TIPO = :COD_TIPO AND COD_EMPRESA = :COD_EMPRESA AND TIPO = :TIPO; ';
    buscas.ParamByName('COD_TIPO').AsInteger := pDataset.FieldByName('CODIGO').AsInteger;
    buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.ParamByName('TIPO').AsString := 'V';
    buscas.ExecSQL;

    dataSet.First;
    while not dataSet.Eof do
    begin
      if dataSet.FieldByName('SEL').AsString = 'S' then
      begin
        buscas.Close;
        buscas.SQL.Text := ' INSERT INTO REGRAS_SUG_ITENS (CODIGO, COD_TIPO, COD_EMPRESA, TIPO) ' +
          ' VALUES (:CODIGO, :COD_TIPO, :COD_EMPRESA, :TIPO); ';
        buscas.ParamByName('CODIGO').AsInteger := dataSet.FieldByName('CODIGO').AsInteger;
        buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
        buscas.ParamByName('COD_TIPO').AsInteger := pDataset.FieldByName('CODIGO').AsInteger;
        buscas.ParamByName('TIPO').AsString := 'V';
        buscas.ExecSQL;
      end;

      dataSet.Next;
    end;
  finally
  	dataSet.Filtered := False;
	  dataSet.First;
  end;

  vDadosIni.fechaStatusProcessamento;
end;

function TServicosSugeridos.verificarServicos(pDataset: TDataSet): boolean;
var
	vSelec: boolean;
  vList: TStrings;
begin
  Result := true;

  if dataSet.IsEmpty then
  	exit;

  if not vDadosIni.vSugServico.vHabilitarSug then
  	exit;

  vSelec := false;

  try
    dataSet.Filter := 'SEL = ''S''';
    dataSet.Filtered := True;

    vDadosIni.abreStatusProcessamento('', 'Aguarde. Verificando serviços para o(s) modelo(s) de veículo');

    dataSet.First;
    while not dataSet.Eof do
    begin
      if dataSet.FieldByName('SEL').AsString = 'S' then
      	vSelec := true;
      dataSet.Next;
    end;
  finally
  	dataSet.Filtered := False;
	  dataSet.First;
    vDadosIni.fechaStatusProcessamento;
  end;

  if not vSelec then
  begin
    if vDadosIni.getConfSisBool('sug_serv_testar_regras', buscas) then
    begin
      try
        vList := TStringList.Create;
        vList := vDadosIni.getConfSisBlob('sug_serv_testar_regras', buscas);
        if vList.Count > 1 then
        begin
          if (vDadosIni.getValue(vList[1], 1) = 'V') then
          begin
            Result := false;
            if not Application.MessageBox('Nenhum serviço informado.' + chr(13) +
				      'Deseja confirmar as assim mesmo?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2)= mrYES then
              exit;

            if vDadosIni.PesqPros('BAS407', 'PERMITIR', '', 'TIPMODELO', pDataset.FieldByName('CODIGO').AsString, buscas, true) then
            begin
            	Result := true;
              exit;
            end;

			      Result := false;
      			Exit;
          end;
        end;
      finally
        FreeAndNil(vList);
      end;
    end;
  end;
end;

procedure TServicosSugeridos._desmarcarLinha;
begin
  if dataSet.IsEmpty then
  	exit;

  dataSet.Edit;
  dataSet.FieldByName('SEL').AsString := '';
  dataSet.Post;
end;

procedure TServicosSugeridos._marcaDesmarcaLinha;
begin
  if dataSet.IsEmpty then
  	exit;

  dataSet.Edit;
  if dataSet.FieldByName('SEL').AsString = 'S' then
    dataSet.FieldByName('SEL').AsString := ''
  else
    dataSet.FieldByName('SEL').AsString := 'S';
  dataSet.Post;
end;

procedure TServicosSugeridos._marcarLinha;
begin
   if dataSet.IsEmpty then
  	exit;

  dataSet.Edit;
  dataSet.FieldByName('SEL').AsString := 'S';
  dataSet.Post;
end;

end.

