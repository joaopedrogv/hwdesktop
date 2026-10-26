unit UClassesEquipamentos;

interface

uses
  uDataSet_OOP, DBClient, uDtmAtivo, Db, Windows, Forms, Controls,
  ComCtrls, ExtCtrls, RDprint, IBQuery, DBCtrls, StdCtrls, UClassesCadastrosBasicos;

type

  TEquipamentos = class;
  TLocDepartamentos = class;
  TLocProprietario = class;
  TServicosSugeridos = class;

  RConsulta = record
    campo, ordem, condicao, valor, dataIni, dataFim: string;
    porData, porDataAd: Boolean;
    //Opçoes Avanças
    avancada, adicional: boolean;
    campoAd, valorAd, dataIniAd, dataFimAd, condicaoAd: string;
  end;

  TLocDepartamentos = class(TDataSet_OOP)
  public
    constructor create;
    function abreDepartamentos: boolean; overload;
  end;

  TLocProprietario = class(TDataSet_OOP)
  public
    constructor create;
    function abreClienteColaborador(DBLookupComboBox: TDBLookupComboBox): boolean; overload;
  end;

  TLocDadosBalanco = class(TDataSet_OOP)
  public
    constructor create;
    function abreDadosBalanco: boolean;
  end;

  TServicosSugeridos = class(TDataSet_OOP)
  private
  public
   	constructor create;
    function abreServico(pDataset: TDataSet): boolean;
    procedure _marcaDesmarcaLinha;
    procedure _marcarLinha;
    procedure _desmarcarLinha;
    procedure SalvarServicos(pDataset: TDataSet; pCommitaTransacao: boolean = false);
    function verificarServicos(pDataset: TDataSet): boolean;
  end;

  TDepreciacao = class(TDataSet_OOP)
  private
    function ContaData(DtInicial, DtFinal: TDate): Integer;
  public
    constructor create;
    function verificaDepreciacao(equip: TEquipamentos): boolean;
    function abreDepreciacao(codEquipamento: integer): boolean;
    function SomaDepreciacaoGeral(vempresas: string; vdatabase: Tdate): boolean;
    function AbredepreciacaoMes(vmes, vano: integer): boolean;
  var
    ValorDepreciado: currency;
  end;

  TContasAPagarEquip = class(TDataSet_OOP)
  public
    constructor create;
    function abreContasAPagar(loteConta: integer): boolean;
  end;

  TLocEquipamentosManut = class(TDataSet_OOP)
  public
    constructor create;
    function abreLocEquipManu: boolean;
  end;

  TManutencaoEquipamentos = class(TDataSet_OOP)
  public
    destructor Destroy; override;
    constructor create;
    function insert: boolean; override;
    function edit: boolean; override;
    function post: boolean; override;
    function StatusLixeira: boolean;
    function AbrirLixeira: boolean;
    function abreManutencao(codEquipamento: integer): boolean;
    procedure cadManutencaoEquipamentos(TipoForm: integer);
    function existeFornecedor: boolean;
    function enviaManutencaoParaCaixa: boolean;
    function detalhesNoCaixa: boolean;
    function statusNoCaixa: integer;
    procedure montaCondPag(lista: TComboBox; codigoCondicao: integer);
  var
    vCP: TContasAPagarEquip;
    vCondPag: TCondicaoPagamento;
    vlocEquip: TLocEquipamentosManut;
  end;

  TReplicaModel = class
  private
//    FReplicarQuantidade: Integer;
//    FReplicarParcelas: Integer;
    FReplicasCriadas: Integer;
    FOriginalId: Integer;
    FParcelasCriadas: Integer;
  public
    property OriginalId: Integer read FOriginalId write FOriginalId;
    property ReplicasCriadas: Integer read FReplicasCriadas write FReplicasCriadas;
    property ParcelasCriadas: Integer read FParcelasCriadas write FParcelasCriadas;
//    property ReplicarParcelas: Integer read FReplicarParcelas write FReplicarParcelas;
//    property ReplicarQuantidade: Integer read FReplicarQuantidade write FReplicarQuantidade;
  end;

  TEquipamentos = class(TDataSet_OOP)
  private
    procedure renconciliaErro(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
  public
    ultimaSql, campoComErro: string;
    destructor destroy; override;
    constructor create;
    function consulta: boolean;
    function post: boolean; override;
    function insert: boolean; override;
    function edit: boolean; override;
    function abreEquipamentos(codigo: Integer): boolean; overload;
    function abreEquipamentos(EmpNula: string): boolean; overload;
    function abreEquipamentos(pEmpresas: string; pData: TDate): boolean; overload;
    function StatusLixeira: boolean;
    function AbrirLixeira: boolean;
    procedure CadEquipamentos(TipoForm: integer);
    function confirmaAlteracao: boolean;
    function ChecaMarma: boolean;
    function ChecaProprietario: boolean;
    function delete: boolean; override;
    function restaurarRegistro: boolean;
    function salvaDadosSped: boolean;
    function abreFormDadosSped: boolean;
    function verificatipovenda(vtop: integer; vcomb: TDbCombobox; vtipo: string; vtpescol: string): boolean;
    function verificaComando: boolean;
    function GetReplica(equipamentoId: Integer): TReplicaModel;
    function RemoverReplicas(equipamentoId: Integer): Boolean;
    function ReplicarEquipamento(equipamentoId, qtde: Integer; replicarParcelas: Boolean): Boolean;
    procedure _marcarTodos;
    procedure _desmarcarTodos;
    procedure _marcaDesmarcaLinha;
  var
    LocDepartamentos: TLocDepartamentos;
    LocProprietario: TLocProprietario;
    LocDadosBalanco: TLocDadosBalanco;
    vDepreciacao: TDepreciacao;
    vServicosSugeridos: TServicosSugeridos;
    vCons: RConsulta;
  end;

implementation

uses
  SysUtils, IBDatabase, UDtmEquipamentos, UCadEquipamentos, uDadosIni,
  uCadManutencaoEquip, Variants, uPadrao, funcoes, uRecord, Classes, equipamento_class,
  hw_utils, movimento_ciap_class, basefb_class;

{ TEquipamentos }

function TEquipamentos.abreEquipamentos(EmpNula: string): boolean;
begin
  result := montaSelect(' SELECT EQUIPAMENTO.*, ' +
  	' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
    '     CLIENTES.NOME_CLIENTE ' +
    ' ELSE ' +
    '     COLABORADOR.NOME_VENDEDOR END NOME_PROPRIETARIO, ' +
    ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
    '     CLIENTES.RAZAO ' +
    ' ELSE ' +
    '     COLABORADOR.NOME_VENDEDOR END RAZAO_PROPRIETARIO, ' +
    ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
    '     CLIENTES.CEP ' +
    ' ELSE ' +
    '     COLABORADOR.CEP_VENDEDOR END CEP_PROPRIETARIO, ' +
    ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
    '     CLIENTES.ENDERECO ' +
    ' ELSE ' +
    '     COLABORADOR.END_VENDEDOR END ENDERECO_PROPRIETARIO, ' +
    ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
    '     CLIENTES.NUM_END_CLIENTE ' +
    ' ELSE ' +
    '     '''' END NUM_END_PROPRIETARIO, ' +
    ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
    '     CLIENTES.FONE_CLIENTE ' +
    ' ELSE ' +
    '     COLABORADOR.FONE_VENDEDOR END FONE_PROPRIETARIO, ' +
    ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
    '     CLIENTES.FONE_CELULAR ' +
    ' ELSE ' +
    '     '''' END CELULAR_PROPRIETARIO, ' +
    ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
    '     CLIENTES.EMAIL ' +
    ' ELSE ' +
    '     COLABORADOR.EMAIL END EMAIL_PROPRIETARIO, ' +
    ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
    '    ESTADOS.SIGLA_UF ' +
    ' ELSE ' +
    '    EST.SIGLA_UF END SIGLA_PROPRIETARIO, ' +
    ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
    '    CIDADES.NOME_CIDADE ' +
    ' ELSE ' +
    '    CID.NOME_CIDADE END CIDADE_PROPRIETARIO, ' +
    ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
    '    BAIRROS.NOME_BAIRRO ' +
    ' ELSE ' +
    '    BAI.NOME_BAIRRO END BAIRRO_PROPRIETARIO, ' +
    ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
	  '     LOCALIDADE.LOCALIDADE ' +
    ' ELSE ' +
    '     '''' END LOCALIDADE_PROPRIETARIO, ' +
    ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
    '     SETOR.SETOR ' +
    ' ELSE ' +
    '     '''' END SETOR_PROPRIETARIO ' +
    '  FROM EQUIPAMENTO ' +
    ' LEFT JOIN CLIENTES ON CLIENTES.COD_CLIENTE = EQUIPAMENTO.COD_PROP AND CLIENTES.COD_EMPRESA = EQUIPAMENTO.COD_EMPRESA ' +
    ' LEFT JOIN ESTADOS ON ESTADOS.CODIGO_UF = CLIENTES.CODIGO_UF ' +
    ' LEFT JOIN CIDADES ON CIDADES.COD_CIDADE = CLIENTES.COD_CIDADE ' +
    ' LEFT JOIN BAIRROS ON BAIRROS.COD_BAIRRO = CLIENTES.COD_BAIRRO ' +
    ' LEFT JOIN LOCALIDADE ON LOCALIDADE.COD_LOCALIDADE = CLIENTES.COD_LOCALIDADE AND LOCALIDADE.COD_EMPRESA = CLIENTES.COD_EMPRESA ' +
    ' LEFT JOIN SETOR ON SETOR.COD_SETOR = LOCALIDADE.COD_SETOR AND SETOR.COD_EMPRESA = LOCALIDADE.COD_EMPRESA ' +
    ' LEFT JOIN COLABORADOR ON COLABORADOR.COD_VENDEDOR = EQUIPAMENTO.COD_PROP AND COLABORADOR.COD_EMPRESA = EQUIPAMENTO.COD_EMPRESA ' +
    ' LEFT JOIN ESTADOS EST ON EST.CODIGO_UF = COLABORADOR.CODIGO_UF ' +
    ' LEFT JOIN CIDADES CID ON CID.COD_CIDADE = COLABORADOR.COD_CIDADE ' +
    ' LEFT JOIN BAIRROS BAI ON BAI.COD_BAIRRO = COLABORADOR.COD_BAIRRO ' +
    ' WHERE EQUIPAMENTO.ATIVO = 1 ' +
    ' AND EQUIPAMENTO.COD_EMPRESA is null');
end;

function TEquipamentos.abreEquipamentos(pEmpresas: string;
  pData: TDate): boolean;
begin
	result := montaSelect(' SELECT EQUIPAMENTO.*, ' +
      ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
      '     CLIENTES.NOME_CLIENTE ' +
      ' ELSE ' +
      '     COLABORADOR.NOME_VENDEDOR END NOME_PROPRIETARIO, ' +
      ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
      '     CLIENTES.RAZAO ' +
      ' ELSE ' +
      '     COLABORADOR.NOME_VENDEDOR END RAZAO_PROPRIETARIO, ' +
      ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
      '     CLIENTES.CEP ' +
      ' ELSE ' +
      '     COLABORADOR.CEP_VENDEDOR END CEP_PROPRIETARIO, ' +
      ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
      '     CLIENTES.ENDERECO ' +
      ' ELSE ' +
      '     COLABORADOR.END_VENDEDOR END ENDERECO_PROPRIETARIO, ' +
      ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
      '     CLIENTES.NUM_END_CLIENTE ' +
      ' ELSE ' +
      '     '''' END NUM_END_PROPRIETARIO, ' +
      ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
      '     CLIENTES.FONE_CLIENTE ' +
      ' ELSE ' +
      '     COLABORADOR.FONE_VENDEDOR END FONE_PROPRIETARIO, ' +
      ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
      '     CLIENTES.FONE_CELULAR ' +
      ' ELSE ' +
      '     '''' END CELULAR_PROPRIETARIO, ' +
      ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
      '     CLIENTES.EMAIL ' +
      ' ELSE ' +
      '     COLABORADOR.EMAIL END EMAIL_PROPRIETARIO, ' +
      ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
      '    ESTADOS.SIGLA_UF ' +
      ' ELSE ' +
      '    EST.SIGLA_UF END SIGLA_PROPRIETARIO, ' +
      ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
      '    CIDADES.NOME_CIDADE ' +
      ' ELSE ' +
      '    CID.NOME_CIDADE END CIDADE_PROPRIETARIO, ' +
      ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
      '    BAIRROS.NOME_BAIRRO ' +
      ' ELSE ' +
      '    BAI.NOME_BAIRRO END BAIRRO_PROPRIETARIO, ' +
      ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
      '     LOCALIDADE.LOCALIDADE ' +
      ' ELSE ' +
      '     '''' END LOCALIDADE_PROPRIETARIO, ' +
      ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
      '     SETOR.SETOR ' +
      ' ELSE ' +
      '     '''' END SETOR_PROPRIETARIO ' +
    	' FROM EQUIPAMENTO ' +
      ' LEFT JOIN CLIENTES ON CLIENTES.COD_CLIENTE = EQUIPAMENTO.COD_PROP AND CLIENTES.COD_EMPRESA = EQUIPAMENTO.COD_EMPRESA ' +
      ' LEFT JOIN ESTADOS ON ESTADOS.CODIGO_UF = CLIENTES.CODIGO_UF ' +
      ' LEFT JOIN CIDADES ON CIDADES.COD_CIDADE = CLIENTES.COD_CIDADE ' +
      ' LEFT JOIN BAIRROS ON BAIRROS.COD_BAIRRO = CLIENTES.COD_BAIRRO ' +
      ' LEFT JOIN LOCALIDADE ON LOCALIDADE.COD_LOCALIDADE = CLIENTES.COD_LOCALIDADE AND LOCALIDADE.COD_EMPRESA = CLIENTES.COD_EMPRESA ' +
      ' LEFT JOIN SETOR ON SETOR.COD_SETOR = LOCALIDADE.COD_SETOR AND SETOR.COD_EMPRESA = LOCALIDADE.COD_EMPRESA ' +
      ' LEFT JOIN COLABORADOR ON COLABORADOR.COD_VENDEDOR = EQUIPAMENTO.COD_PROP AND COLABORADOR.COD_EMPRESA = EQUIPAMENTO.COD_EMPRESA ' +
      ' LEFT JOIN ESTADOS EST ON EST.CODIGO_UF = COLABORADOR.CODIGO_UF ' +
	    ' LEFT JOIN CIDADES CID ON CID.COD_CIDADE = COLABORADOR.COD_CIDADE ' +
  	  ' LEFT JOIN BAIRROS BAI ON BAI.COD_BAIRRO = COLABORADOR.COD_BAIRRO ' +
    	' WHERE EQUIPAMENTO.TIP_EQUIP = ''I'' ' +
      ' AND EQUIPAMENTO.ATIVO = 1 ' +
      ' AND EQUIPAMENTO.COD_EMPRESA in ('+pEmpresas+') ' +
      ' AND EQUIPAMENTO.DAT_CAD_EQUI <= '''+FormatDateTime('mm/dd/yyyy', pData)+''' ');
end;

function TEquipamentos.abreFormDadosSped: boolean;
var
  formulario: TfrmPadrao;
begin
  if dataSet.FieldByName('TIP_EQUIP').AsString <> 'I' then
  begin
    Application.MessageBox('Equipamento não é interno', 'Atenção', 0 + 64);
    Exit;
  end;
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption :=
      'Manutenção de Dados para o Sped Fiscal';
    FrmCadEquipamentos.pnDadosSped.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    result := (formulario.ShowModal = IDOK);
  finally
    FrmCadEquipamentos.pnDadosSped.Parent := FrmCadEquipamentos.tsDadosSped;
    formulario.Free;
    formulario := nil;
    Cancel;
  end;
end;

function TEquipamentos.abreEquipamentos(codigo: Integer): boolean;
begin
  result := montaSelect(' SELECT EQUIPAMENTO.*, ' +
  	' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
    '     CLIENTES.NOME_CLIENTE ' +
    ' ELSE ' +
    '     COLABORADOR.NOME_VENDEDOR END NOME_PROPRIETARIO, ' +
    ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
    '     CLIENTES.RAZAO ' +
    ' ELSE ' +
    '     COLABORADOR.NOME_VENDEDOR END RAZAO_PROPRIETARIO, ' +
    ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
    '     CLIENTES.CEP ' +
    ' ELSE ' +
    '     COLABORADOR.CEP_VENDEDOR END CEP_PROPRIETARIO, ' +
    ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
    '     CLIENTES.ENDERECO ' +
    ' ELSE ' +
    '     COLABORADOR.END_VENDEDOR END ENDERECO_PROPRIETARIO, ' +
    ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
    '     CLIENTES.NUM_END_CLIENTE ' +
    ' ELSE ' +
    '     '''' END NUM_END_PROPRIETARIO, ' +
    ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
    '     CLIENTES.FONE_CLIENTE ' +
    ' ELSE ' +
    '     COLABORADOR.FONE_VENDEDOR END FONE_PROPRIETARIO, ' +
    ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
    '     CLIENTES.FONE_CELULAR ' +
    ' ELSE ' +
    '     '''' END CELULAR_PROPRIETARIO, ' +
    ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
    '     CLIENTES.EMAIL ' +
    ' ELSE ' +
    '     COLABORADOR.EMAIL END EMAIL_PROPRIETARIO, ' +
    ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
    '    ESTADOS.SIGLA_UF ' +
    ' ELSE ' +
    '    EST.SIGLA_UF END SIGLA_PROPRIETARIO, ' +
    ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
    '    CIDADES.NOME_CIDADE ' +
    ' ELSE ' +
    '    CID.NOME_CIDADE END CIDADE_PROPRIETARIO, ' +
    ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
    '    BAIRROS.NOME_BAIRRO ' +
    ' ELSE ' +
    '    BAI.NOME_BAIRRO END BAIRRO_PROPRIETARIO, ' +
    ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
	  '     LOCALIDADE.LOCALIDADE ' +
    ' ELSE ' +
    '     '''' END LOCALIDADE_PROPRIETARIO, ' +
    ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
    '     SETOR.SETOR ' +
    ' ELSE ' +
    '     '''' END SETOR_PROPRIETARIO ' +
    '  FROM EQUIPAMENTO ' +
    ' LEFT JOIN CLIENTES ON CLIENTES.COD_CLIENTE = EQUIPAMENTO.COD_PROP AND CLIENTES.COD_EMPRESA = EQUIPAMENTO.COD_EMPRESA ' +
    ' LEFT JOIN ESTADOS ON ESTADOS.CODIGO_UF = CLIENTES.CODIGO_UF ' +
    ' LEFT JOIN CIDADES ON CIDADES.COD_CIDADE = CLIENTES.COD_CIDADE ' +
    ' LEFT JOIN BAIRROS ON BAIRROS.COD_BAIRRO = CLIENTES.COD_BAIRRO ' +
    ' LEFT JOIN LOCALIDADE ON LOCALIDADE.COD_LOCALIDADE = CLIENTES.COD_LOCALIDADE AND LOCALIDADE.COD_EMPRESA = CLIENTES.COD_EMPRESA ' +
    ' LEFT JOIN SETOR ON SETOR.COD_SETOR = LOCALIDADE.COD_SETOR AND SETOR.COD_EMPRESA = LOCALIDADE.COD_EMPRESA ' +
    ' LEFT JOIN COLABORADOR ON COLABORADOR.COD_VENDEDOR = EQUIPAMENTO.COD_PROP AND COLABORADOR.COD_EMPRESA = EQUIPAMENTO.COD_EMPRESA ' +
    ' LEFT JOIN ESTADOS EST ON EST.CODIGO_UF = COLABORADOR.CODIGO_UF ' +
    ' LEFT JOIN CIDADES CID ON CID.COD_CIDADE = COLABORADOR.COD_CIDADE ' +
    ' LEFT JOIN BAIRROS BAI ON BAI.COD_BAIRRO = COLABORADOR.COD_BAIRRO ' +
    ' WHERE EQUIPAMENTO.COD_EQUIP = %d and EQUIPAMENTO.ATIVO = 1 ' +
    ' AND EQUIPAMENTO.COD_EMPRESA = ' + vDadosIni.codEmpresa, [codigo]);
end;

function TEquipamentos.AbrirLixeira: boolean;
begin
  if not StatusLixeira then
  begin
    Application.MessageBox('A lixeira está vazia.', 'Informação', MB_OK + MB_ICONINFORMATION +
      MB_DEFBUTTON1);
    montaSelect(ultimaSql);
    result := false;
  end
  else
    result := montaSelect(' SELECT EQUIPAMENTO.*, ' +
      ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
      '     CLIENTES.NOME_CLIENTE ' +
      ' ELSE ' +
      '     COLABORADOR.NOME_VENDEDOR END NOME_PROPRIETARIO, ' +
      ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
      '     CLIENTES.RAZAO ' +
      ' ELSE ' +
      '     COLABORADOR.NOME_VENDEDOR END RAZAO_PROPRIETARIO, ' +
      ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
      '     CLIENTES.CEP ' +
      ' ELSE ' +
      '     COLABORADOR.CEP_VENDEDOR END CEP_PROPRIETARIO, ' +
      ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
      '     CLIENTES.ENDERECO ' +
      ' ELSE ' +
      '     COLABORADOR.END_VENDEDOR END ENDERECO_PROPRIETARIO, ' +
      ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
      '     CLIENTES.NUM_END_CLIENTE ' +
      ' ELSE ' +
      '     '''' END NUM_END_PROPRIETARIO, ' +
      ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
      '     CLIENTES.FONE_CLIENTE ' +
      ' ELSE ' +
      '     COLABORADOR.FONE_VENDEDOR END FONE_PROPRIETARIO, ' +
      ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
      '     CLIENTES.FONE_CELULAR ' +
      ' ELSE ' +
      '     '''' END CELULAR_PROPRIETARIO, ' +
      ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
      '     CLIENTES.EMAIL ' +
      ' ELSE ' +
      '     COLABORADOR.EMAIL END EMAIL_PROPRIETARIO, ' +
      ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
      '    ESTADOS.SIGLA_UF ' +
      ' ELSE ' +
      '    EST.SIGLA_UF END SIGLA_PROPRIETARIO, ' +
      ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
      '    CIDADES.NOME_CIDADE ' +
      ' ELSE ' +
      '    CID.NOME_CIDADE END CIDADE_PROPRIETARIO, ' +
      ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
      '    BAIRROS.NOME_BAIRRO ' +
      ' ELSE ' +
      '    BAI.NOME_BAIRRO END BAIRRO_PROPRIETARIO, ' +
      ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
      '     LOCALIDADE.LOCALIDADE ' +
      ' ELSE ' +
      '     '''' END LOCALIDADE_PROPRIETARIO, ' +
      ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
      '     SETOR.SETOR ' +
      ' ELSE ' +
      '     '''' END SETOR_PROPRIETARIO ' +
      '  FROM EQUIPAMENTO ' +
      ' LEFT JOIN CLIENTES ON CLIENTES.COD_CLIENTE = EQUIPAMENTO.COD_PROP AND CLIENTES.COD_EMPRESA = EQUIPAMENTO.COD_EMPRESA ' +
      ' LEFT JOIN ESTADOS ON ESTADOS.CODIGO_UF = CLIENTES.CODIGO_UF ' +
      ' LEFT JOIN CIDADES ON CIDADES.COD_CIDADE = CLIENTES.COD_CIDADE ' +
      ' LEFT JOIN BAIRROS ON BAIRROS.COD_BAIRRO = CLIENTES.COD_BAIRRO ' +
      ' LEFT JOIN LOCALIDADE ON LOCALIDADE.COD_LOCALIDADE = CLIENTES.COD_LOCALIDADE AND LOCALIDADE.COD_EMPRESA = CLIENTES.COD_EMPRESA ' +
      ' LEFT JOIN SETOR ON SETOR.COD_SETOR = LOCALIDADE.COD_SETOR AND SETOR.COD_EMPRESA = LOCALIDADE.COD_EMPRESA ' +
      ' LEFT JOIN COLABORADOR ON COLABORADOR.COD_VENDEDOR = EQUIPAMENTO.COD_PROP AND COLABORADOR.COD_EMPRESA = EQUIPAMENTO.COD_EMPRESA ' +
      ' LEFT JOIN ESTADOS EST ON EST.CODIGO_UF = COLABORADOR.CODIGO_UF ' +
      ' LEFT JOIN CIDADES CID ON CID.COD_CIDADE = COLABORADOR.COD_CIDADE ' +
      ' LEFT JOIN BAIRROS BAI ON BAI.COD_BAIRRO = COLABORADOR.COD_BAIRRO ' +
	    ' WHERE EQUIPAMENTO.ATIVO = 0 ' +
      ' AND EQUIPAMENTO.COD_EMPRESA =' + vDadosIni.codEmpresa);
end;

procedure TEquipamentos.CadEquipamentos(TipoForm: integer);
begin
  vDadosIni.vTipoForm := TipoForm;
  if DtmEquipamentos = nil then
    DtmEquipamentos := TDtmEquipamentos.Create(DtmEquipamentos);
  if FrmCadEquipamentos = nil then
  begin
    if TipoForm > 0 then
      vDadosIni.vModalOuChild := 'M';
    Application.CreateForm(TFrmCadEquipamentos, FrmCadEquipamentos);
  end;

  if (TipoForm > 0) and (not FrmCadEquipamentos.Visible) then
    FrmCadEquipamentos.ShowModal
  else if (not FrmCadEquipamentos.Visible) then
    FrmCadEquipamentos.Show
  else if FrmCadEquipamentos.FormStyle = fsMDIChild then
    FrmCadEquipamentos.Show
  else
    FrmCadEquipamentos.ShowModal;
end;

function TEquipamentos.ChecaMarma: boolean;
begin
  result := true;
  buscas.Close;
  buscas.SQL.Text := 'SELECT  * FROM MARCA_PROD WHERE COD_MARCA = ' +
    inttostr(dataSet.FieldByName('COD_MARCA').asinteger) + ' AND ATIVO = 1';
  buscas.open;
  if Buscas.isempty then
  begin
    Application.MessageBox('Marca não encontrada.', 'Informação', MB_OK + MB_ICONWARNING +
      MB_DEFBUTTON1);
    dataSet.FieldByName('COD_MARCA').AsVariant := null;
    result := false;
  end
  else
    dataSet.FieldByName('MARCA').AsString := Buscas.fieldbyname('DESCRICAO_MARCA').asstring;
end;

function TEquipamentos.ChecaProprietario: boolean;
begin
  result := true;
  if dataSet.FieldByName('TIP_EQUIP').AsString = 'E' then
  begin
    if not ExecutaComandosSql('SELECT  cod_cliente FROM clientes WHERE cod_cliente = ' +
      inttostr(dataSet.FieldByName('COD_PROP').asinteger) + ' and cod_empresa =' +
      vDadosIni.codEmpresa +
      ' AND ATIVO = 1 ') then
    begin
//      Application.MessageBox('Proprietário não encontrado.', 'Atenção', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      result := false;
    end;
  end
  else if not ExecutaComandosSql('SELECT  COD_VENDEDOR FROM colaborador WHERE COD_VENDEDOR = ' +
    inttostr(dataSet.FieldByName('COD_PROP').asinteger) + ' and cod_empresa =' + vDadosIni.codEmpresa +
    ' AND ATIVO = 1') then
  begin
//    Application.MessageBox('Proprietário não encontrado.', 'Atenção', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
    result := false;
  end;
  if result = false then
    dataSet.FieldByName('COD_PROP').AsVariant := null;
end;

function TEquipamentos.confirmaAlteracao: boolean;
begin
  result := false;
  if (DataSet <> nil) and (DataSet.Active) and (DataSet.ChangeCount > 0) then
    if Application.MessageBox('Foram feitas alterações no banco de dados.' + chr(13) +
      'Deseja confirmar as alterções?', 'Confirmação', MB_YESNO + MB_ICONQUESTION +
      MB_DEFBUTTON1)
      = mrYES then
      result := true;
end;

function TEquipamentos.consulta: boolean;
var
  I, erro, vcontCTR: Integer;
  vsqlAdicional: string;
  formatodata: string;
  tempTipo: string;
  tempSql: string;
  vCampoTemp, vCampoTempAd, vCondicaoTmp, vCondicaoTmpAd, vTemp: string;
  vValorTemp: string;
begin
  try
    vsqlAdicional := '';
    vCampoTemp:= '';
    vCampoTempAd := '';

    if not vCons.adicional then
    begin
     vCons.campoAd := '';
     vCons.valorAd := '';
     vCons.condicaoAd := '';
     vCons.porDataAd := false;
     vCons.dataIniAd := '';
     vCons.dataFimAd := '';
    end;

    if UpperCase(trim(vCons.campo)) = 'NOME PROPRIETARIO (NOME FANTASIA)' then
  		vCampoTemp := 'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN CLIENTES.NOME_CLIENTE ELSE COLABORADOR.NOME_VENDEDOR END '
    else if UpperCase(trim(vCons.campo)) = 'NOME PROPRIETARIO (RAZAO SOCIAL)' then
    	vCampoTemp := 'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN CLIENTES.RAZAO ELSE COLABORADOR.NOME_VENDEDOR END '
    else if UpperCase(trim(vCons.campo)) = 'CEP PROPRIETARIO' then
      vCampoTemp := 'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN CLIENTES.CEP ELSE COLABORADOR.CEP_VENDEDOR END '
    else if UpperCase(trim(vCons.campo)) = 'ENDERECO PROPRIETARIO' then
    	vCampoTemp := 'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN CLIENTES.ENDERECO ELSE COLABORADOR.END_VENDEDOR END '
    else if UpperCase(trim(vCons.campo)) = 'NUM ENDERECO PROPRIETARIO' then
	    vCampoTemp := 'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN CLIENTES.NUM_END_CLIENTE ELSE '''' END '
    else if UpperCase(trim(vCons.campo)) = 'TELEFONE PROPRIETARIO' then
    	vCampoTemp := 'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN CLIENTES.FONE_CLIENTE ELSE COLABORADOR.FONE_VENDEDOR END '
    else if UpperCase(trim(vCons.campo)) = 'CELULAR PROPRIETARIO' then
    	vCampoTemp := 'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN CLIENTES.FONE_CELULAR ELSE '''' END '
    else if UpperCase(trim(vCons.campo)) = 'EMAIL PROPRIETARIO' then
    	vCampoTemp := 'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN CLIENTES.EMAIL ELSE COLABORADOR.EMAIL END '
    else if UpperCase(trim(vCons.campo)) = 'ESTADO PROPRIETARIO' then
    	vCampoTemp := 'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ESTADOS.SIGLA_UF ELSE EST.SIGLA_UF END '
    else if UpperCase(trim(vCons.campo)) = 'CIDADE PROPRIETARIO' THEN
    	vCampoTemp := 'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN CIDADES.NOME_CIDADE ELSE CID.NOME_CIDADE END '
    else if UpperCase(trim(vCons.campo)) = 'BAIRRO PROPRIETARIO' THEN
    	vCampoTemp := 'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN BAIRROS.NOME_BAIRRO ELSE BAI.NOME_BAIRRO END '
    else if UpperCase(trim(vCons.campo)) = 'LOCALIDADE PROPRIETARIO' then
    	vCampoTemp := 'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN LOCALIDADE.LOCALIDADE ELSE '''' END '
    else if UpperCase(trim(vCons.campo)) = 'SETOR PROPRIETARIO' then
    	vCampoTemp := 'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN SETOR.SETOR ELSE '''' END ';

    if UpperCase(trim(vCons.campoAd)) = 'NOME PROPRIETARIO (NOME FANTASIA)' then
  		vCampoTempAd := 'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN CLIENTES.NOME_CLIENTE ELSE COLABORADOR.NOME_VENDEDOR END '
    else if UpperCase(trim(vCons.campoAd)) = 'NOME PROPRIETARIO (RAZAO SOCIAL)' then
    	vCampoTempAd := 'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN CLIENTES.RAZAO ELSE COLABORADOR.NOME_VENDEDOR END '
    else if UpperCase(trim(vCons.campoAd)) = 'CEP PROPRIETARIO' then
      vCampoTempAd := 'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN CLIENTES.CEP ELSE COLABORADOR.CEP_VENDEDOR END '
    else if UpperCase(trim(vCons.campoAd)) = 'ENDERECO PROPRIETARIO' then
    	vCampoTempAd := 'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN CLIENTES.ENDERECO ELSE COLABORADOR.END_VENDEDOR END '
    else if UpperCase(trim(vCons.campoAd)) = 'NUM ENDERECO PROPRIETARIO' then
      vCampoTempAd := 'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN CLIENTES.NUM_END_CLIENTE ELSE '''' END '
    else if UpperCase(trim(vCons.campoAd)) = 'TELEFONE PROPRIETARIO' then
    	vCampoTempAd := 'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN CLIENTES.FONE_CLIENTE ELSE COLABORADOR.FONE_VENDEDOR END '
    else if UpperCase(trim(vCons.campoAd)) = 'CELULAR PROPRIETARIO' then
    	vCampoTempAd := 'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN CLIENTES.FONE_CELULAR ELSE '''' END '
    else if UpperCase(trim(vCons.campoAd)) = 'EMAIL PROPRIETARIO' then
    	vCampoTempAd := 'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN CLIENTES.EMAIL ELSE COLABORADOR.EMAIL END '
    else if UpperCase(trim(vCons.campoAd)) = 'ESTADO PROPRIETARIO' then
    	vCampoTempAd := 'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ESTADOS.SIGLA_UF ELSE EST.SIGLA_UF END '
    else if UpperCase(trim(vCons.campoAd)) = 'CIDADE PROPRIETARIO' then
    	vCampoTempAd := 'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN CIDADES.NOME_CIDADE ELSE CID.NOME_CIDADE END '
    else if UpperCase(trim(vCons.campoAd)) = 'BAIRRO PROPRIETARIO' THEN
    	vCampoTempAd := 'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN BAIRROS.NOME_BAIRRO ELSE BAI.NOME_BAIRRO END '
    else if UpperCase(trim(vCons.campoAd)) = 'LOCALIDADE PROPRIETARIO' then
    	vCampoTempAd := 'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN LOCALIDADE.LOCALIDADE ELSE '''' END '
    else if UpperCase(trim(vCons.campoAd)) = 'SETOR PROPRIETARIO' then
    	vCampoTempAd := 'CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN SETOR.SETOR ELSE '''' END ';

    if Trim(vCampoTemp) <> '' then
    begin
      vCondicaoTmp := vCons.Condicao;
      if UpperCase(trim(vCondicaoTmp)) = 'IGUAL' then
        vCondicaoTmp := '='
      else if UpperCase(trim(vCondicaoTmp)) = 'MAIOR' then
        vCondicaoTmp := '>'
      else if UpperCase(trim(vCondicaoTmp)) = 'MAIOR OU IGUAL' then
        vCondicaoTmp := '>='
      else if UpperCase(trim(vCondicaoTmp)) = 'MENOR' then
        vCondicaoTmp := '<'
      else if UpperCase(trim(vCondicaoTmp)) = 'MENOR OU IGUAL' then
        vCondicaoTmp := '<='
      else if UpperCase(trim(vCondicaoTmp)) = 'DIFERENTE' then
        vCondicaoTmp := '<>'
      else if UpperCase(trim(vCondicaoTmp)) = 'ESTA CONTIDO' then
        vCondicaoTmp := 'like'
      else if LowerCase(trim(vCondicaoTmp)) = 'começa' then
        vCondicaoTmp := 'Começa'
      else
        vCondicaoTmp := '=';
      if trim(vsqlAdicional) <> '' then
      	vsqlAdicional := vsqlAdicional + ' and ';
      if vCondicaoTmp = 'like' then
      	vsqlAdicional := vsqlAdicional + ' ' + vCampoTemp + ' like ' + QuotedStr('%' + UpperCase(trim(vCons.valor)) + '%')
      else if vCondicaoTmp = 'Começa' then
      	vsqlAdicional := vsqlAdicional + ' ' + vCampoTemp + ' like ' + QuotedStr(UpperCase(trim(vCons.valor)) + '%')
      else
      	vsqlAdicional := vsqlAdicional + ' ' + vCampoTemp + ' ' + vCondicaoTmp + ' ' + QuotedStr(UpperCase(trim(vCons.valor)));
      vCons.valor := '';
      vCons.campo := '';
      vCons.ordem := vCampoTemp;
    end;

    if Trim(vCampoTempAd) <> '' then
    begin
      vCondicaoTmpAd := vCons.CondicaoAd;
      if UpperCase(trim(vCondicaoTmpAd)) = 'IGUAL' then
        vCondicaoTmpAd := '='
      else if UpperCase(trim(vCondicaoTmpAd)) = 'MAIOR' then
        vCondicaoTmpAd := '>'
      else if UpperCase(trim(vCondicaoTmpAd)) = 'MAIOR OU IGUAL' then
        vCondicaoTmpAd := '>='
      else if UpperCase(trim(vCondicaoTmpAd)) = 'MENOR' then
        vCondicaoTmpAd := '<'
      else if UpperCase(trim(vCondicaoTmpAd)) = 'MENOR OU IGUAL' then
        vCondicaoTmpAd := '<='
      else if UpperCase(trim(vCondicaoTmpAd)) = 'DIFERENTE' then
        vCondicaoTmpAd := '<>'
      else if UpperCase(trim(vCondicaoTmpAd)) = 'ESTA CONTIDO' then
        vCondicaoTmpAd := 'like'
      else if LowerCase(trim(vCondicaoTmpAd)) = 'começa' then
        vCondicaoTmpAd := 'Começa'
      else
        vCondicaoTmpAd := '=';
      if trim(vsqlAdicional) <> '' then
       vsqlAdicional := vsqlAdicional + ' and ';
      if vCondicaoTmpAd = 'like' then
      	vsqlAdicional := vsqlAdicional + ' ' + vCampoTempAd + ' like ' + QuotedStr('%' + UpperCase(trim(vCons.valorAd)) + '%')
      else if vCondicaoTmpAd = 'Começa' then
      	vsqlAdicional := vsqlAdicional + ' ' + vCampoTempAd + ' like ' + QuotedStr(UpperCase(trim(vCons.valorAd)) + '%')
      else
	      vsqlAdicional := vsqlAdicional + ' ' + vCampoTempAd + ' ' + vCondicaoTmpAd + ' ' + QuotedStr(UpperCase(trim(vCons.valorAd)));
      vCons.valorAd := '';
      vCons.campoAd := '';
    end;

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
    if vCons.adicional then
    begin
      if vCons.porDataAd then
      begin
        try
          erro := 0;
          StrToDate(vCons.dataIniAd);
        except
          vCons.dataIniAd := '';
          erro := erro + 1;
        end;
        try
          StrToDate(vCons.dataFimAd);
        except
          vCons.dataFimAd := '';
          erro := erro + 1;
        end;
        if erro = 2 then
        begin
          Application.MessageBox('Data adicional Inválida. Informe no mínimo uma data correta',
            'Atenção', MB_OK + MB_ICONINFORMATION);
        end
        else
        begin
          if (pos('/', ShortDateFormat) <> 0) or (pos('-', ShortDateFormat) <> 0) then
            formatodata := 'mm/dd/yyyy'
          else if pos('.', ShortDateFormat) <> 0 then
            formatodata := 'dd.mm.yyyy';
          if vCons.dataIniAd <> '' then
            vCons.dataIniAd := QuotedStr(FormatDateTime(formatodata, strtodate(vCons.dataIniAd)));
          if vCons.dataFimAd <> '' then
            vCons.dataFimAd := QuotedStr(FormatDateTime(formatodata, strtodate(vCons.dataFimAd)));
        end;
      end
      else
      begin
        vCons.dataIniAd := '';
        vCons.dataFimAd := '';
      end;

      if vCons.condicaoAd = 'Igual' then
        vCons.condicaoAd := '='
      else if vCons.condicaoAd = 'Maior' then
        vCons.condicaoAd := '>'
      else if vCons.condicaoAd = 'Menor' then
        vCons.condicaoAd := '<'
      else if vCons.condicaoAd = 'Diferente' then
        vCons.condicaoAd := '<>'
      else if (vCons.condicaoAd = 'Esta contido') then
        vCons.condicaoAd := 'like'
      else if (vCons.condicaoAd = 'Começa') then
        vCons.condicaoAd := 'Começa'
      else
        vCons.condicaoAd := '=';
      for I := 0 to dataSet.FieldCount - 1 do
      begin
        if Dataset.Fields[I].FieldKind = fkData then
        begin
          if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(vCons.campoAd) then
          begin
            vCons.campoAd := DataSet.Fields[I].FieldName;
            if ((Dataset.Fields[I] is TIntegerField) or (Dataset.Fields[I] is TFloatField) or
              (Dataset.Fields[I] is TCurrencyField) or (DataSet.Fields[I] is TSmallintField)) and
              ((vCons.condicaoAd = 'Começa') or (vCons.condicaoAd = 'Começa')) then
            begin
              vCons.condicaoAd := '=';
              if (Dataset.Fields[I] is TIntegerField) or (DataSet.Fields[I] is TSmallintField)
              or (DataSet.Fields[I] is TFloatField) or (DataSet.Fields[I] is TCurrencyField) then
              begin
                try
                  if (Dataset.Fields[I] is TIntegerField) or (DataSet.Fields[I] is TSmallintField) then
                    vCons.valorAd := IntToStr(StrToInt(Trim(vCons.valorAd)))
                  else if (DataSet.Fields[I] is TFloatField) or (DataSet.Fields[I] is TCurrencyField) then
                    vCons.valorAd := FloatToStr(StrToFloat(Trim(vCons.valorAd)))
                except
                  vCons.valorAd := '0';
                  Application.MessageBox('Valor inválido', 'Atenção', 0 + 64);
                end;
              end
              else
                vCons.valorAd := vDadosIni.tirapontos(vCons.valorAd, 4);
            end
            else if (DataSet.Fields[i] is TDateField) or (DataSet.Fields[i] is TDateTimeField) then
            begin
            	if trim(vsqlAdicional) <> '' then
				      	vsqlAdicional := vsqlAdicional + ' and ';
              if (vCons.dataIniAd <> '') and (vCons.dataFimAd <> '') then
                vsqlAdicional := vsqlAdicional + ' EQUIPAMENTO.' + vCons.campoAd + ' >= ' + vCons.dataIniAd +
                	' and EQUIPAMENTO.' + vCons.campoAd + ' <= ' + vCons.dataIniAd
              else if (vCons.dataFimAd <> '') then
                vsqlAdicional := vsqlAdicional + ' EQUIPAMENTO.' + vCons.campoAd + ' <= ' + vCons.dataIniAd
              else if (vCons.dataIniAd <> '') and (vCons.dataFimAd <> '') then
                vsqlAdicional := vsqlAdicional + ' EQUIPAMENTO.' + vCons.campoAd + ' >= ' + vCons.dataIniAd;
              Break;
            end;
            if trim(vsqlAdicional) <> '' then
			      	vsqlAdicional := vsqlAdicional + ' and ';
            if vCons.condicaoAd = 'like' then
            	vsqlAdicional := vsqlAdicional + ' EQUIPAMENTO.' + vCons.campoAd + ' like ' + QuotedStr('%' + UpperCase(trim(vCons.valorAd)) + '%')
            else if vCons.condicaoAd = 'Começa' then
	            vsqlAdicional := vsqlAdicional + ' EQUIPAMENTO.' + vCons.campoAd + ' like ' + QuotedStr(UpperCase(trim(vCons.valorAd)) + '%')
            else
            	vsqlAdicional := vsqlAdicional + ' EQUIPAMENTO.' + vCons.campoAd + ' ' + vCons.condicaoAd + ' ' + QuotedStr(UpperCase(trim(vCons.valorAd)));
            Break;
          end;
        end;
      end;
    end; //adicional

    if vCons.porData then
      result := ConsultaCampos('EQUIPAMENTO', vCons.campo, vCons.ordem, vCons.dataIni,
        vCons.dataFim, vDadosIni.codEmpresa, 1,
        ' EQUIPAMENTO.*, ' +
        ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
        '     CLIENTES.NOME_CLIENTE ' +
        ' ELSE ' +
        '     COLABORADOR.NOME_VENDEDOR END NOME_PROPRIETARIO, ' +
        ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
        '     CLIENTES.RAZAO ' +
        ' ELSE ' +
        '     COLABORADOR.NOME_VENDEDOR END RAZAO_PROPRIETARIO, ' +
        ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
        '     CLIENTES.CEP ' +
        ' ELSE ' +
        '     COLABORADOR.CEP_VENDEDOR END CEP_PROPRIETARIO, ' +
        ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
        '     CLIENTES.ENDERECO ' +
        ' ELSE ' +
        '     COLABORADOR.END_VENDEDOR END ENDERECO_PROPRIETARIO, ' +
        ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
        '     CLIENTES.NUM_END_CLIENTE ' +
        ' ELSE ' +
        '     '''' END NUM_END_PROPRIETARIO, ' +
        ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
        '     CLIENTES.FONE_CLIENTE ' +
        ' ELSE ' +
        '     COLABORADOR.FONE_VENDEDOR END FONE_PROPRIETARIO, ' +
        ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
        '     CLIENTES.FONE_CELULAR ' +
        ' ELSE ' +
        '     '''' END CELULAR_PROPRIETARIO, ' +
        ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
        '     CLIENTES.EMAIL ' +
        ' ELSE ' +
        '     COLABORADOR.EMAIL END EMAIL_PROPRIETARIO, ' +
        ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
        '    ESTADOS.SIGLA_UF ' +
        ' ELSE ' +
        '    EST.SIGLA_UF END SIGLA_PROPRIETARIO, ' +
        ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
        '    CIDADES.NOME_CIDADE ' +
        ' ELSE ' +
        '    CID.NOME_CIDADE END CIDADE_PROPRIETARIO, ' +
        ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
        '    BAIRROS.NOME_BAIRRO ' +
        ' ELSE ' +
        '    BAI.NOME_BAIRRO END BAIRRO_PROPRIETARIO, ' +
        ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
        '     LOCALIDADE.LOCALIDADE ' +
        ' ELSE ' +
        '     '''' END LOCALIDADE_PROPRIETARIO, ' +
        ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
        '     SETOR.SETOR ' +
        ' ELSE ' +
        '     '''' END SETOR_PROPRIETARIO ', 
        ' LEFT JOIN CLIENTES ON CLIENTES.COD_CLIENTE = EQUIPAMENTO.COD_PROP AND CLIENTES.COD_EMPRESA = EQUIPAMENTO.COD_EMPRESA ' +
        ' LEFT JOIN ESTADOS ON ESTADOS.CODIGO_UF = CLIENTES.CODIGO_UF ' +
        ' LEFT JOIN CIDADES ON CIDADES.COD_CIDADE = CLIENTES.COD_CIDADE ' +
        ' LEFT JOIN BAIRROS ON BAIRROS.COD_BAIRRO = CLIENTES.COD_BAIRRO ' +
        ' LEFT JOIN LOCALIDADE ON LOCALIDADE.COD_LOCALIDADE = CLIENTES.COD_LOCALIDADE AND LOCALIDADE.COD_EMPRESA = CLIENTES.COD_EMPRESA ' +
        ' LEFT JOIN SETOR ON SETOR.COD_SETOR = LOCALIDADE.COD_SETOR AND SETOR.COD_EMPRESA = LOCALIDADE.COD_EMPRESA ' +
        ' LEFT JOIN COLABORADOR ON COLABORADOR.COD_VENDEDOR = EQUIPAMENTO.COD_PROP AND COLABORADOR.COD_EMPRESA = EQUIPAMENTO.COD_EMPRESA ' +
        ' LEFT JOIN ESTADOS EST ON EST.CODIGO_UF = COLABORADOR.CODIGO_UF ' +
        ' LEFT JOIN CIDADES CID ON CID.COD_CIDADE = COLABORADOR.COD_CIDADE ' +
        ' LEFT JOIN BAIRROS BAI ON BAI.COD_BAIRRO = COLABORADOR.COD_BAIRRO ',
        vsqlAdicional)
    else
      result := ConsultaCampos('EQUIPAMENTO', vCons.valor, vCons.campo, vCons.condicao,
        vCons.ordem, False, vDadosIni.codEmpresa,
        ' EQUIPAMENTO.*, ' +
        ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
        '     CLIENTES.NOME_CLIENTE ' +
        ' ELSE ' +
        '     COLABORADOR.NOME_VENDEDOR END NOME_PROPRIETARIO, ' +
        ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
        '     CLIENTES.RAZAO ' +
        ' ELSE ' +
        '     COLABORADOR.NOME_VENDEDOR END RAZAO_PROPRIETARIO, ' +
        ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
        '     CLIENTES.CEP ' +
        ' ELSE ' +
        '     COLABORADOR.CEP_VENDEDOR END CEP_PROPRIETARIO, ' +
        ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
        '     CLIENTES.ENDERECO ' +
        ' ELSE ' +
        '     COLABORADOR.END_VENDEDOR END ENDERECO_PROPRIETARIO, ' +
        ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
        '     CLIENTES.NUM_END_CLIENTE ' +
        ' ELSE ' +
        '     '''' END NUM_END_PROPRIETARIO, ' +
        ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
        '     CLIENTES.FONE_CLIENTE ' +
        ' ELSE ' +
        '     COLABORADOR.FONE_VENDEDOR END FONE_PROPRIETARIO, ' +
        ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
        '     CLIENTES.FONE_CELULAR ' +
        ' ELSE ' +
        '     '''' END CELULAR_PROPRIETARIO, ' +
        ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
        '     CLIENTES.EMAIL ' +
        ' ELSE ' +
        '     COLABORADOR.EMAIL END EMAIL_PROPRIETARIO, ' +
        ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
        '    ESTADOS.SIGLA_UF ' +
        ' ELSE ' +
        '    EST.SIGLA_UF END SIGLA_PROPRIETARIO, ' +
        ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
        '    CIDADES.NOME_CIDADE ' +
        ' ELSE ' +
        '    CID.NOME_CIDADE END CIDADE_PROPRIETARIO, ' +
        ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
        '    BAIRROS.NOME_BAIRRO ' +
        ' ELSE ' +
        '    BAI.NOME_BAIRRO END BAIRRO_PROPRIETARIO, ' +
        ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
        '     LOCALIDADE.LOCALIDADE ' +
        ' ELSE ' +
        '     '''' END LOCALIDADE_PROPRIETARIO, ' +
        ' CASE WHEN (EQUIPAMENTO.TIP_EQUIP = ''E'') THEN ' +
        '     SETOR.SETOR ' +
        ' ELSE ' +
        '     '''' END SETOR_PROPRIETARIO ',
        ' LEFT JOIN CLIENTES ON CLIENTES.COD_CLIENTE = EQUIPAMENTO.COD_PROP AND CLIENTES.COD_EMPRESA = EQUIPAMENTO.COD_EMPRESA ' +
        ' LEFT JOIN ESTADOS ON ESTADOS.CODIGO_UF = CLIENTES.CODIGO_UF ' +
        ' LEFT JOIN CIDADES ON CIDADES.COD_CIDADE = CLIENTES.COD_CIDADE ' +
        ' LEFT JOIN BAIRROS ON BAIRROS.COD_BAIRRO = CLIENTES.COD_BAIRRO ' +
        ' LEFT JOIN LOCALIDADE ON LOCALIDADE.COD_LOCALIDADE = CLIENTES.COD_LOCALIDADE AND LOCALIDADE.COD_EMPRESA = CLIENTES.COD_EMPRESA ' +
        ' LEFT JOIN SETOR ON SETOR.COD_SETOR = LOCALIDADE.COD_SETOR AND SETOR.COD_EMPRESA = LOCALIDADE.COD_EMPRESA ' +
        ' LEFT JOIN COLABORADOR ON COLABORADOR.COD_VENDEDOR = EQUIPAMENTO.COD_PROP AND COLABORADOR.COD_EMPRESA = EQUIPAMENTO.COD_EMPRESA ' +
        ' LEFT JOIN ESTADOS EST ON EST.CODIGO_UF = COLABORADOR.CODIGO_UF ' +
        ' LEFT JOIN CIDADES CID ON CID.COD_CIDADE = COLABORADOR.COD_CIDADE ' +
        ' LEFT JOIN BAIRROS BAI ON BAI.COD_BAIRRO = COLABORADOR.COD_BAIRRO ',
        vsqlAdicional);
  finally
//    vsqlTemp := dataSet.CommandText;
  end;
end;

constructor TEquipamentos.create;
begin
  if DtmEquipamentos = nil then
    DtmEquipamentos := TDtmEquipamentos.Create(DtmEquipamentos);
  DataSet := TClientDataSet(DtmEquipamentos.cdsEquipamentos);
  DtmEquipamentos.qrEquipamentos.Close;
  DtmEquipamentos.qrBuscasEquip.Close;
  DtmEquipamentos.qrEquipamentos.Transaction := TIBTransaction(DtmEquipamentos.IBTransEquipamentos);
  DtmEquipamentos.qrBuscasEquip.Transaction := TIBTransaction(DtmEquipamentos.IBTransEquipamentos);
  DtmEquipamentos.SpIncCodigo.Transaction := TIBTransaction(DtmEquipamentos.IBTransEquipamentos);
  if vDadosIni.vEquipamento.COD_NF_ENT > 0 then
  begin
    dataSet.Close;
    DtmEquipamentos.qrEquipamentos.Transaction := TIBTransaction(vDadosIni.vEquipamento.transacao);
    DtmEquipamentos.qrBuscasEquip.Transaction := TIBTransaction(vDadosIni.vEquipamento.transacao);
    DtmEquipamentos.SpIncCodigo.Transaction := TIBTransaction(vDadosIni.vEquipamento.transacao);
    transacao := TIBTransaction(vDadosIni.vEquipamento.transacao);
  end
  else
  transacao := TIBTransaction(DtmEquipamentos.IBTransEquipamentos);
  Buscas := TIBQuery(DtmEquipamentos.qrBuscasEquip);
  LocDepartamentos := TLocDepartamentos.create;
  LocProprietario := TLocProprietario.create;
  LocDadosBalanco := TLocDadosBalanco.create;
  vDepreciacao := TDepreciacao.create;
  vServicosSugeridos := TServicosSugeridos.create;
end;

function TEquipamentos.delete: boolean;
var
  vtemp: string;
	vApagar: boolean;
  vCod_Equip: string;
  vNome_Equip: string;
  I: Integer;
begin
  try
    Result := False;
    if dataSet.IsEmpty then
      exit;

    try
      vApagar        := dataSet.FieldByName('ATIVO').AsInteger = 0;
      vCod_Equip  := trim(dataSet.FieldByName('COD_EQUIP').AsString);
      vNome_Equip := trim(dataSet.FieldByName('NOM_EQUIP').AsString);

      prepare_loop('SEL = ''S''');

      if not dataset.IsEmpty then
      begin
        vApagar        := dataSet.FieldByName('ATIVO').AsInteger = 0;
        vCod_Equip  := '';
        vNome_Equip := '';
      end;
    finally
      prepare_loop_done;
    end;

    try
      if (trim(vCod_Equip) <> '') then
        prepare_loop('COD_EQUIP = ' + vCod_Equip)
      else
        prepare_loop('SEL = ''S''');

      if vApagar then
      begin
        vtemp := 'Tem certeza que deseja excluir este registro permanentemente?' + #13 + #13 +
          'EQUIPAMENTO' + #13 +
          'Código: ' + vCod_Equip + #13 +
          'Nome: ' + vNome_Equip;

        if (trim(vCod_Equip) = '') then
          vtemp := 'Tem certeza que deseja excluir os ' + IntToStr(dataSet.RecordCount) + ' registros selecionados permanentemente?';

        if not vDadosIni.PesqPros('EQU014', 'EXCLUIR', '', 'EQUIPAMENTO',
          vDadosIni.IfThen(trim(vCod_Equip) <> '', vCod_Equip, ''), buscas, true) then
            exit;

        if Application.MessageBox(PChar(vtemp),
          'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> mrYES then
          exit;
      end
      else
      begin
        vtemp := 'Tem certeza que deseja mover este registro para a lixeira?' + #13 + #13 +
          'EQUIPAMENTO' + #13 +
          'Código: ' + vCod_Equip + #13 +
          'Nome: ' + vNome_Equip;

        if (trim(vCod_Equip) = '') then
          vtemp := 'Tem certeza que deseja mover os ' + IntToStr(dataSet.RecordCount) + ' registros selecionados para a lixeira?';

        if not vDadosIni.PesqPros('EQU003', 'EXCLUIR', '', 'EQUIPAMENTO',
           vDadosIni.IfThen(trim(vCod_Equip) <> '', vCod_Equip, ''), buscas, true) then
            exit;

        if Application.MessageBox(PChar(vtemp),
          'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> mrYES then
          exit;
      end;

      if vApagar then
        vDadosIni.abreStatusProcessamento('', 'Excluíndo equipamento(s) permanentemente')
      else
        vDadosIni.abreStatusProcessamento('', 'Movendo equipamento(s) para lixeira');

      dataset.First;
      while not dataset.Eof do
      begin
        if vApagar then
          vDadosIni.abreStatusProcessamento('', 'Excluíndo equipamento(s) permanentemente (' + IntToStr(dataSet.RecNo) + '/' + IntToStr(dataSet.RecordCount) + ')')
        else
          vDadosIni.abreStatusProcessamento('', 'Movendo equipamento(s) para lixeira (' + IntToStr(dataSet.RecNo) + '/' + IntToStr(dataSet.RecordCount) + ')');

        if vApagar then
        begin
          SqlExec(' update equipamento set ativo = 99 ' +
            ' where cod_equip = %d and cod_empresa = %d ',
            [fint('cod_equip'), fint('cod_empresa')], buscas);
          if (trim(vCod_Equip) = '') then
            vDadosIni.GravaAuditoria('EQU014', 'EXCLUIR', '', 'EQUIPAMENTO',
              dataSet.FieldByName('COD_EQUIP').AsString, buscas);
        end
        else
        begin
          SqlExec(' update equipamento set ativo = 0 ' +
            ' where cod_equip = %d and cod_empresa = %d ',
            [fint('cod_equip'), fint('cod_empresa')], buscas);

          if (trim(vCod_Equip) = '') then
            vDadosIni.GravaAuditoria('EQU003', 'EXCLUIR', '', 'EQUIPAMENTO',
              dataSet.FieldByName('COD_EQUIP').AsString, buscas);
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
      vDadosIni.GravaAuditoria(vDadosIni.IfThen(vApagar, 'EQU014', 'EQU003'),
        'EXCLUIR', 'SUCESSO', 'EQUIPAMENTO',
        vDadosIni.IfThen(trim(vCod_Equip) <> '', vCod_Equip, ''), buscas);
    end
    else
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria(vDadosIni.IfThen(vApagar, 'EQU014', 'EQU003'),
        'EXCLUIR', 'FALHA', 'EQUIPAMENTO',
        vDadosIni.IfThen(trim(vCod_Equip) <> '', vCod_Equip, ''), buscas);
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

destructor TEquipamentos.destroy;
begin
  LocDepartamentos.buscas.Close;
  LocProprietario.buscas.Close;
  FreeAndNil(vDepreciacao);
  FreeAndNil(vServicosSugeridos);
  inherited;
end;

function TEquipamentos.edit: boolean;
begin
  Result := False;

  if inherited Edit then
  begin
    Result := True;
    dataSet.FieldByName('COD_EMPRESA').AsInteger := strToInt(vDadosIni.codEmpresa);
    dataSet.FieldByName('NOM_EQUIP').AsString := dataSet.FieldByName('NOM_EQUIP').AsString;
    vServicosSugeridos.abreServico(dataSet);
  end;
end;

function TEquipamentos.GetReplica(equipamentoId: Integer): TReplicaModel;
begin

  Result := TReplicaModel.Create;
  Result.ReplicasCriadas := SqlScalar('select count(e.cod_equip) from equipamento e' +
                                      ' where e.origem_equip_id = %d and e.cod_empresa = %d', [equipamentoId, vDadosIni.cod_empresa]).AsInteger;
  Result.ParcelasCriadas := SqlScalar('select count(m.cod_ind_bem) count_equip from movimento_ciap m' +
                                      ' where m.cod_ind_bem = %d and m.cod_empresa = %d', [equipamentoId, vDadosIni.cod_empresa]).AsInteger;
  Result.OriginalId := SqlScalar('select origem_equip_id from equipamento where cod_equip = %d and cod_empresa = %d',
                                 [equipamentoId, vDadosIni.cod_empresa]).AsInteger;
end;

function TEquipamentos.insert: boolean;
begin
  if inherited Insert then
  begin
    dataSet.FieldByName('TIP_EQUIP').AsString := 'E';
    dataSet.FieldByName('COD_EMPRESA').AsInteger := strToInt(vDadosIni.codEmpresa);
    dataSet.FieldByName('US_CAD').AsInteger := vDadosIni.vCodUsuario;
    dataSet.FieldByName('DAT_CAD_EQUI').AsDateTime := vDadosIni.getDataBanco(buscas);
    dataSet.FieldByName('IND_DEPREC').AsFloat := 0;
    dataSet.FieldByName('COMCONTRATO').AsString := 'N';
    LocDadosBalanco.abreDadosBalanco;
    vServicosSugeridos.abreServico(dataSet);
    if vDadosIni.vEquipamento.COD_NF_ENT > 0 then
    begin
      dataSet.FieldByName('COD_NF_ENT').AsInteger := vDadosIni.vEquipamento.COD_NF_ENT;
      dataSet.FieldByName('NITEM_ENT').AsInteger := vDadosIni.vEquipamento.NITEM_ENT;
      dataSet.FieldByName('COD_MARCA').AsInteger := vDadosIni.vEquipamento.COD_MARCA;
      dataSet.FieldByName('NOM_EQUIP').AsString := vDadosIni.vEquipamento.NOM_EQUIP;
      dataSet.FieldByName('MARCA').AsString := vDadosIni.vEquipamento.MARCA;
      dataSet.FieldByName('TIPEQUIP').AsString := vDadosIni.vEquipamento.TIPEQUIP;
      dataSet.FieldByName('VLR_EQUI').AsFloat := vDadosIni.vEquipamento.VLR_EQUI;
      dataSet.FieldByName('TIP_EQUIP').AsString := 'I';
      dataSet.FieldByName('STATUS_V').AsString := 'N';
    end;
    Result := true;
  end;
end;

function TEquipamentos.post: boolean;
var
  acao: string;
begin
  try
    Result := false;
    campoComErro := '';
    
    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      result := true;
      exit;
    end;

    if dataSet.State = dsInsert then
      acao := 'INSERIR'
    else
      acao := 'EDITAR';

    if dataSet.FieldByName('COD_PROP').IsNull then
    begin
      FrmCadEquipamentos.TabSheet3.Show;
	    raiseExceptionCreate('Proprietário não informado.' + chr(13) + 'Campo requerido.', 'DBEdit2');
    end;

    if not ChecaProprietario then
    begin
      FrmCadEquipamentos.TabSheet3.Show;
	    raiseExceptionCreate('Proprietário não encontrado.', 'DBEdit2');
      exit;
    end;

    if trim(dataSet.FieldByName('N_SERIE').AsString)<>'' then
    begin
      try
        buscas.Close;
        buscas.SQL.Text:='select e.cod_equip,e.n_serie,e.nom_equip from equipamento e '+
        ' where e.n_serie='+ QuotedStr(trim(dataSet.FieldByName('N_SERIE').AsString))+
        ' and e.cod_equip<>'+inttostr(dataSet.FieldByName('cod_equip').AsInteger)+
        ' and e.cod_empresa='+vDadosIni.codEmpresa;
        buscas.Open;
        if not buscas.IsEmpty then
        begin
          if Application.MessageBox(Pchar('Número de série '+QuotedStr(trim(dataSet.FieldByName('N_SERIE').AsString))+
            ' informado já existe para o equipamento de código '+buscas.FieldByName('COD_EQUIP').AsString +
            ' - '+trim(buscas.FieldByName('NOM_EQUIP').AsString) +chr(13) +
            'Deseja continuar assim mesmo?'), 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrNo then
          begin
            FrmCadEquipamentos.TabSheet3.Show;
				    raiseExceptionCreate('Número de série '+ QuotedStr(trim(dataSet.FieldByName('N_SERIE').AsString)) +
            	' informado já existe para o equipamento de código '+buscas.FieldByName('COD_EQUIP').AsString +
	            ' - '+trim(buscas.FieldByName('NOM_EQUIP').AsString), 'DBEdit5');
          end;
        end;
      finally
        buscas.Close;
      end;
    end;

    if dataSet.FieldByName('COD_MARCA').IsNull then
    begin
      FrmCadEquipamentos.TabSheet3.Show;
	    raiseExceptionCreate('Marca não informada.' + chr(13) +  'Campo requerido.', 'DBEdit9');
    end;
    if dataSet.FieldByName('TIP_EQUIP').AsString = 'I' then
    begin
      if dataSet.FieldByName('IND_DEPREC').IsNull then
        dataSet.FieldByName('IND_DEPREC').AsFloat := 0;
      if dataSet.FieldByName('VLR_EQUI').IsNull then
        dataSet.FieldByName('VLR_EQUI').AsFloat := 0;
    end
    else
    begin
      dataSet.FieldByName('IND_DEPREC').AsVariant := null;
//      dataSet.FieldByName('VLR_EQUI').AsVariant := null;
    end;

    if trim(vDadosIni.vEmp.vCredencInterventor) <> '' then
    begin                                
      if ((trim(dataSet.FieldByName('IDENTIFICACAO').AsString) <> '') or
        (dataSet.FieldByName('N_SERIE_FAB').AsString <> '')
        or (dataSet.FieldByName('N_MEMORIA_FISCAL').AsString <> '')) and
        ((trim(dataSet.FieldByName('IDENTIFICACAO').AsString) = '')
        or (dataSet.FieldByName('N_SERIE_FAB').AsString = '') or
        (dataSet.FieldByName('N_MEMORIA_FISCAL').AsString = '')) then
      begin
        FrmCadEquipamentos.TabSheet3.Show;
        if trim(dataSet.FieldByName('IDENTIFICACAO').AsString) = '' then
      	  raiseExceptionCreate('Dados para ECF estão incompletos. Por favor preencha todos os dados do ECF.', 'DBEdit16')
        else if trim(dataSet.FieldByName('N_SERIE_FAB').AsString) = '' then
        	raiseExceptionCreate('Dados para ECF estão incompletos. Por favor preencha todos os dados do ECF.', 'DBEdit17')
        else
		      raiseExceptionCreate('Dados para ECF estão incompletos. Por favor preencha todos os dados do ECF.', 'DBEdit18');
      end;
    end;

    if (dataSet.FieldByName('CODSEQ_BALANCO').IsNull) and (dataSet.FieldByName('TIP_EQUIP').AsString = 'I') then
    begin
      FrmCadEquipamentos.TabSheet3.Show;
      raiseExceptionCreate('Dados para Balanço gerencial precisa ser preenchido.', 'DBLookupComboBox3');
    end;
    //    begin
    //      campoComErro:='IND_DEPREC';
    //      raise exception.create('Índice de depreciação não informado.' + chr(13) +
    //        'Campo requerido.');
    //    end;

    dataSet.FieldByName('TIPEQUIP').AsString := trim(dataSet.FieldByName('TIPEQUIP').AsString);

    if trim(dataSet.FieldByName('TIPEQUIP').AsString) <> '' then
      if ((dataSet.FieldByName('TIPEQUIP').AsString <> 'E') and (dataSet.FieldByName('TIPEQUIP').AsString <> 'V')
        and (dataSet.FieldByName('TIPEQUIP').AsString <> 'M') and (dataSet.FieldByName('TIPEQUIP').AsString <> 'F')
        and (dataSet.FieldByName('TIPEQUIP').AsString <> 'I')) then
        begin
        	FrmCadEquipamentos.TabSheet3.Show;
          raiseExceptionCreate('Tipo de Imobilizado inválido.', 'DBComboBox2');
        end;


   if trim(dataSet.FieldByName('STATUS_V').AsString) <> '' then
     if (trim(dataSet.FieldByName('STATUS_V').AsString) <> 'N')
       and (trim(dataSet.FieldByName('STATUS_V').AsString) <> 'V') then
        begin
        	FrmCadEquipamentos.TabSheet3.Show;
          raiseExceptionCreate('Status inválido.', 'DBComboBox5');
        end;

   if not vServicosSugeridos.verificarServicos(dataSet) then
   begin
   	 FrmCadEquipamentos.TabSheet4.Show;
     raiseExceptionCreate('Nenhum serviço informado', 'DBGrid3');
   end;

    if dataSet.State in [dsInsert] then
      dataSet.FieldByName('COD_EQUIP').AsInteger := Gencodigo('EQUIPAMENTO', DtmEquipamentos.SpIncCodigo, vDadosIni.codEmpresa)
    else if dataSet.State in [dsedit] then
    begin
      if dataSet.FieldByName('DAT_CAD_EQUI').IsNull then
        dataSet.FieldByName('DAT_CAD_EQUI').AsDateTime := vDadosIni.getDataBanco(buscas);
    end;

    vDadosIni.vPesquisa:=dataSet.FieldByName('COD_EQUIP').AsString;
    if dataSet.FieldByName('COMCONTRATO').AsString <> 'S' then
    	dataSet.FieldByName('TIPOOSVINC').AsVariant:=null;

    Result := inherited post;

    if result and (dataSet.ChangeCount = 0) and (acao = 'EDITAR') then
    begin
      vServicosSugeridos.SalvarServicos(dataSet, true);
      Result := true;
      exit;
    end;
    vServicosSugeridos.SalvarServicos(dataSet);

    if Apply then
    begin
      if vDadosIni.vEquipamento.COD_NF_ENT = 0 then
      begin
        if CommitaTransacao then
          vDadosIni.GravaAuditoria('EQU006', 'GRAVAR', 'SUCESSO', 'EQUIPAMENTO', dataSet.FieldByName('COD_EQUIP').AsString,buscas)
        else
          vDadosIni.GravaAuditoria('EQU006', 'GRAVAR', 'FALHA', 'EQUIPAMENTO', dataSet.FieldByName('COD_EQUIP').AsString,buscas);
      end
      else
        vDadosIni.GravaAuditoria('EQU006', 'GRAVAR', 'AGUARDANDO CONFIRMACAO NF', 'EQUIPAMENTO', dataSet.FieldByName('COD_EQUIP').AsString,buscas);

    end
    else
    begin
      Cancel;
      if vDadosIni.vEquipamento.COD_NF_ENT = 0 then
        RollBackTransacao;
      vDadosIni.GravaAuditoria('EQU006', 'GRAVAR', 'FALHA', 'EQUIPAMENTO', dataSet.FieldByName('COD_EQUIP').AsString,buscas);
      Result := FALSE;
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

function TEquipamentos.RemoverReplicas(equipamentoId: Integer): Boolean;
begin
  try
    SqlExec('delete from movimento_ciap where cod_empresa = %d and cod_ind_bem in (%s)',
            [vDadosIni.cod_empresa,
             Format('select cod_equip from equipamento where origem_equip_id = %d and cod_empresa = %d',
                    [equipamentoId, vDadosIni.cod_empresa])
            ]);

    SqlExec('delete from equipamento where origem_equip_id = %d and cod_empresa = %d',
            [equipamentoId, vDadosIni.cod_empresa]);

    SqlExec('update codigo set valor = coalesce((%s), 0)' +
            ' where tabela = ''EQUIPAMENTO'' and cod_empresa = %d',
            [Format('select max(cod_equip) from equipamento where cod_empresa = %d', [vDadosIni.cod_empresa]),
             vDadosIni.cod_empresa]);

    CommitaTransacao;

    vDadosIni.GravaAuditoria('EQU003', 'EXCLUIR', 'SUCESSO REPLICAS DE ' + IntToStr(equipamentoId), 'EQUIPAMENTO', '', buscas);

    Result := True;

  except on E: Exception do
    begin
      Result := False;
      RollBackTransacao;
      registraErro('TEquipamentos.RemoverReplicas %s', [e.Message]);
      vDadosIni.GravaAuditoria('EQU003', 'EXCLUIR', 'FALHA REPLICAS DE ' + IntToStr(equipamentoId), 'EQUIPAMENTO', '', buscas);
      ShowErro('Erro ao remover replicas: %s', [e.Message]);
    end;
  end;
end;

procedure TEquipamentos.renconciliaErro(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  try
    if (Pos('FK_ATESTADO_ECF_EQUIP', UpperCase(e.Message)) <> 0) then
    begin
      Application.MessageBox('Erro ao deletar equipamento.' + chr(13) +
        'Equipamento sendo utilizado em outra tabela! ''ATESTADO_ECF''', 'Erro', MB_OK +
        MB_ICONERROR);
      registraErro('E0002 ' + e.Message);
      Abort;
    end;
  finally
    RollBackTransacao;
    Self.DataSet.CancelUpdates;
  end;
end;

function TEquipamentos.ReplicarEquipamento(equipamentoId, qtde: Integer;
  replicarParcelas: Boolean): Boolean;
var
  equip: TEquipamento_class;
  movs: TMovimento_ciaps_class;
  mov: TMovimento_ciap_class;
  I, J, seqId: Integer;
begin

  try

    equip := TEquipamento_class.Create;
    equip.CopyFrom(SqlOpen('select * from equipamento where cod_equip = %d and cod_empresa = %d',
                           [equipamentoId, vDadosIni.cod_empresa]));

    if replicarParcelas then
    begin
      movs := TMovimento_ciaps_class.Create;
      movs.CopyFrom(TMovimento_ciap_class,
                    SqlOpen('select * from movimento_ciap where cod_ind_bem = %d and cod_empresa = %d',
                            [equipamentoId, vDadosIni.cod_empresa]));
    end;

    for I := 1 to qtde do
    begin

      equip.origem_equip_id := equipamentoId;
      equip.cod_equip := 0;

      with equip.SQLMotor('cod_equip') do
      begin
        Options.UpdateFields := buAll;
        seqId := SqlInsertID(SQLInsertAutoInc, 'cod_equip');
      end;

      if replicarParcelas then
        for J := 0 to movs.Count - 1 do
        begin
          mov := movs.Items[J];
          mov.cod_ind_bem := seqId;
          with mov.SQLMotor() do
          begin
            Options.UpdateFields := buAll;
            SqlExec(SQLInsert);
          end;
        end;
    end;

    CommitaTransacao;

    vDadosIni.GravaAuditoria('EQU006', 'GRAVAR', 'SUCESSO REPLICAS DE ' + IntToStr(equipamentoId), 'EQUIPAMENTO', '', buscas);

    Result := True;

  except on E: Exception do
    begin
      Result := False;
      RollBackTransacao;
      registraErro('TEquipamentos.ReplicarEquipamento %s', [e.Message]);
      vDadosIni.GravaAuditoria('EQU006', 'GRAVAR', 'FALHA REPLICAS DE ' + IntToStr(equipamentoId), 'EQUIPAMENTO', '', buscas);
      ShowErro('Erro ao criar replicas: %s', [e.Message]);
    end;
  end;
end;

function TEquipamentos.restaurarRegistro: boolean;
var
	vCodEquip: string;
	vNomeEquip: string;
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
      vCodEquip  := trim(dataSet.FieldByName('COD_EQUIP').AsString);
      vNomeEquip := trim(dataSet.FieldByName('NOM_EQUIP').AsString);

      prepare_loop('SEL = ''S''');
      if not dataset.IsEmpty then
      begin
        vCodEquip := '';
        vNomeEquip := '';
      end;
    finally
      prepare_loop_done;
    end;

    try
    	if (trim(vCodEquip) <> '') then
      	prepare_loop('COD_EQUIP = ' + vCodEquip)
      else
		    prepare_loop('SEL = ''S''');

      vtemp := 'Tem certeza que deseja restaurar este registro?' + #13 + #13 +
        'EQUIPAMENTO' + #13 +
        'Código: ' + vCodEquip + #13 +
        'Nome: ' + vNomeEquip;

      if (trim(vNomeEquip) = '') then
          vtemp := 'Tem certeza que deseja restaurar os ' + IntToStr(dataSet.RecordCount) + ' registros selecionados?';

      if not vDadosIni.PesqPros('EQU005', 'RESTAURAR', '', 'EQUIPAMENTO',
        vDadosIni.IfThen(trim(vCodEquip) <> '', vCodEquip, ''), buscas, true) then
          exit;

      if Application.MessageBox(PChar(vtemp),
        'Restaurar Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> mrYES then
        exit;

      vDadosIni.abreStatusProcessamento('', 'Restaurando equipamento(s)');

      dataset.First;
      while not dataset.Eof do
      begin
      	vDadosIni.abreStatusProcessamento('', 'Restaurando equipamento(s) (' + IntToStr(dataSet.RecNo) + '/' + IntToStr(dataSet.RecordCount) + ')');

        SqlExec(' update equipamento set ativo = 1 ' +
          ' where cod_equip = %d and cod_empresa = %d ',
          [fint('cod_equip'), fint('cod_empresa')], buscas);

        if (trim(vCodEquip) = '') then
          vDadosIni.GravaAuditoria('EQU005', 'RESTAURAR', '', 'EQUIPAMENTO',
            dataSet.FieldByName('COD_EQUIP').AsString, buscas);

        dataset.Next;
      end;
    finally
    	vDadosIni.fechaStatusProcessamento;
      prepare_loop_done;
    end;
    Result := CommitaTransacao;
    if Result then
    begin
    	vDadosIni.GravaAuditoria('EQU005', 'RESTAURAR', 'SUCESSO', 'EQUIPAMENTO',
        vDadosIni.IfThen(trim(vCodEquip) <> '', vCodEquip, ''), buscas);
    end
    else
    begin
    	RollBackTransacao;
    	vDadosIni.GravaAuditoria('EQU005', 'RESTAURAR', 'FALHA', 'EQUIPAMENTO',
        vDadosIni.IfThen(trim(vCodEquip) <> '', vCodEquip, ''), buscas);
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

function TEquipamentos.salvaDadosSped: boolean;
begin
  try
    Result := false;
    campoComErro := '';
    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      result := true;
      exit;
    end;
    if (dataSet.FieldByName('IDENT_MERC').AsString <> '1') and
      (dataSet.FieldByName('IDENT_MERC').AsString <> '2') then
      raiseexceptioncreate('Informe se a mercadoria é um Bem ou Componente', 'DBRadioGroup2');
    if (dataSet.FieldByName('IDENT_MERC').AsString = '2') and
      (Trim(dataSet.FieldByName('COD_PRNC').AsString) = '') then
      raiseexceptioncreate('Para um Componente informar o Bem principal a quem ele esta ligado',
        'DBEdit14');
    if (Trim(dataSet.FieldByName('COD_CTA_EQ').AsString) = '') then
      raiseexceptioncreate('Informar o Codigo da Conta Contabil a que pertence esta mercadoria',
        'DBEdit15');
    if (Trim(dataSet.FieldByName('COD_CCUS').AsString) = '') then
      raiseexceptioncreate('Informar o Codigo do Centro de Custos a que pertence esta mercadoria',
        'DBEdit13');
    if (Trim(dataSet.FieldByName('FUNC').AsString) = '') then
      raiseexceptioncreate('Informar uma Descrição sucinta da função do bem na atividade da empresa', 'DBMemo2');

    Result := inherited post;

    if dataSet.ChangeCount = 0 then
    begin
      Result := true;
      exit;
    end;

    if Apply then
    begin
      if CommitaTransacao then
        vDadosIni.GravaAuditoria('EQU006', 'GRAVAR', 'SUCESSO', 'EQUIPAMENTO', dataSet.FieldByName('COD_EQUIP').AsString + ' - ' +
              dataSet.FieldByName('NOM_EQUIP').AsString,buscas)
//        vDadosIni.GravaAuditoria('EQU006', dataSet.FieldByName('COD_EQUIP').AsString +
//          ' Gravação Confirmada', buscas)
      else
        vDadosIni.GravaAuditoria('EQU006', 'GRAVAR', 'FALHA', 'EQUIPAMENTO', dataSet.FieldByName('COD_EQUIP').AsString + ' - ' +
              dataSet.FieldByName('NOM_EQUIP').AsString,buscas)
//        vDadosIni.GravaAuditoria('EQU006', dataSet.FieldByName('COD_EQUIP').AsString +
//          ' Gravação não Confirmada', buscas);
    end
    else
    begin
      Cancel;
      RollBackTransacao;
      vDadosIni.GravaAuditoria('EQU006', 'GRAVAR', 'FALHA', 'EQUIPAMENTO', dataSet.FieldByName('COD_EQUIP').AsString + ' - ' +
      dataSet.FieldByName('NOM_EQUIP').AsString,buscas);
//      vDadosIni.GravaAuditoria('EQU006', Equipamento.dataSet.FieldByName('COD_EQUIP').AsString +
//        ' Gravação não Confirmada', Equipamento.buscas);
      Result := FALSE;
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

function TEquipamentos.StatusLixeira: boolean;
begin
  //Se lixeira vazia retorna falso senão verdadeiro
  result := ExecutaComandosSql(' SELECT * FROM EQUIPAMENTO ' +
  	' WHERE ativo = 0 ' +
    ' and COD_EMPRESA = ' + vDadosIni.codEmpresa);
end;

function TEquipamentos.verificaComando: boolean;
var
  formulario: TForm;
  hdTemp: THandle;
begin
  Result := True;
  try
    if dataSet.FieldByName('COD_ESTMOTO').AsInteger <= 0 then
    begin
     Result := False;
     Application.MessageBox(pchar('Não é possível realizar venda, equipamento não possui Nota Fiscal!'), 'Atenção', MB_ICONERROR + MB_OK);
     exit;
    end;
    vDadosIni.abreStatusProcessamento('', 'Abrindo Entrada/Saída de Veículos');
    vDadosIni.vPesquisa := 'COMFAT_EQUIP|' + IntToStr(dataSet.FieldByName('COD_ESTMOTO').AsInteger) + '|';
    formulario := Funcoes.AbreForm('pkVeiculosCCIA', 'TfrmMovVeiculosCCIA', hdTemp);
    formulario.ShowModal;
  finally
    if Result then
    begin
      formulario.Free;
      unLoadPackage(hdTemp);
      vDadosIni.vPesquisa := '';
      vDadosIni.fechaStatusProcessamento;
    end;
  end;
end;

function TEquipamentos.verificatipovenda(vtop: integer; vcomb: TDbCombobox;
  vtipo, vtpescol: string): boolean;
begin
  result:=false;
  if vtop = 1 then
  begin
    buscas.close;
    buscas.sql.text := 'select * from tipo_vendas where tipo = ''' + vtipo + ''' order by cod_tipo';
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

procedure TEquipamentos._desmarcarTodos;
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

procedure TEquipamentos._marcaDesmarcaLinha;
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

procedure TEquipamentos._marcarTodos;
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

{ TLocProprietario }

function TLocProprietario.abreClienteColaborador(DBLookupComboBox: TDBLookupComboBox): boolean;
begin
  try
    result := true;
    DBLookupComboBox.ListSource := nil;
    DBLookupComboBox.ListField := '';
    DBLookupComboBox.KeyField := '';
    if Equipamento.dataSet.FieldByName('TIP_EQUIP').AsString = 'I' then
    begin
      buscas.close;
      buscas.SQL.Text := 'SELECT COD_VENDEDOR,NOME_VENDEDOR FROM COLABORADOR ' +
        ' where ativo = 1 and cod_empresa = ' + vDadosIni.codEmpresa;
      buscas.Open;
      DBLookupComboBox.ListSource := DtmEquipamentos.dsLocProprietario;
      DBLookupComboBox.ListField := 'NOME_VENDEDOR';
      DBLookupComboBox.KeyField := 'COD_VENDEDOR';
    end
    else
    begin
      //    dbedit3.Enabled := false;
      //    DBLookupComboBox2.Enabled := false;
      //    DBEdit7.Enabled := false;
      //    DBEdit8.Enabled := false;
      buscas.close;
      buscas.SQL.Text := 'SELECT COD_CLIENTE,NOME_CLIENTE FROM CLIENTES ' +
        ' where ativo = 1 and cod_empresa = ' + vDadosIni.codEmpresa;
      buscas.Open;
      DBLookupComboBox.ListSource := DtmEquipamentos.dsLocProprietario;
      DBLookupComboBox.ListField := 'NOME_CLIENTE';
      DBLookupComboBox.KeyField := 'COD_CLIENTE';

    end;
    DBLookupComboBox.DataField := 'COD_PROP';
    DBLookupComboBox.DataSource := DtmEquipamentos.dsEquipamentos;
  except
    result := false;
  end;
end;

constructor TLocProprietario.create;
begin
  transacao := TIBTransaction(DtmEquipamentos.IBTransEquipamentos);
  Buscas := TIBQuery(DtmEquipamentos.qrLocProprietario)
end;

{ TLocDepartamentos }

function TLocDepartamentos.abreDepartamentos: boolean;
begin
  buscas.Close;
  buscas.SQL.Text := 'SELECT * FROM DEPTO where ativo = 1';
  buscas.Open;
end;

constructor TLocDepartamentos.create;
begin
  transacao := TIBTransaction(DtmEquipamentos.IBTransEquipamentos);
  Buscas := TIBQuery(DtmEquipamentos.qrLocDepartamento)
end;

{ TDepreciacao }

function TDepreciacao.abreDepreciacao(codEquipamento: integer): boolean;
begin
  Result := montaSelect('select * from DEPRECIACAO where cod_empresa = ' + vDadosIni.codEmpresa +
    ' and ativo = 1 and COD_EQUIP = ' + IntToStr(codEquipamento)+' order by ano,mes,cod_equip,cod_empresa');
end;

function TDepreciacao.AbredepreciacaoMes(vmes, vano: integer): boolean;
begin
  buscas.Close;
  buscas.SQL.Text :=
    'select eq.nom_equip "Nome do Equipamento",eq.modelo "Modelo do Equipamento",eq.cor,dpto.nome_depto "Nome do Departamento",' +
    'dp.mes,dp.ano,dp.valor_depreci from ' +
    'DEPRECIACAO dp,EQUIPAMENTO eq,depto dpto where dp.cod_equip = eq.cod_equip and ' +
    'dp.cod_empresa = eq.cod_empresa and eq.cod_depart = dpto.cod_depto and ' +
    'dp.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and dp.ativo = 1 and dp.mes = ' + IntToStr(vmes) + ' and dp.ano = ' + IntToStr(vano);
  buscas.Open;
  TFloatField(buscas.FieldByName('valor_depreci')).DisplayFormat:='#,##0.00';
  buscas.FieldByName('valor_depreci').DisplayLabel:='Saldo';
  Result := montaSelect('select * from DEPRECIACAO where cod_empresa = ' + vDadosIni.codEmpresa +
    ' and ativo = 1 and mes = ' + IntToStr(vmes) + ' and ano = ' + IntToStr(vano));
end;

function TDepreciacao.ContaData(DtInicial, DtFinal: TDate): Integer;
var
  cont: Integer;
begin
  cont := 0;
  while DtInicial < DtFinal do
  begin
    DtInicial := IncMonth(DtInicial, 1);
    Inc(cont);
  end;
  Result := cont;
end;

constructor TDepreciacao.create;
begin
  if DtmEquipamentos = nil then
    DtmEquipamentos := TDtmEquipamentos.Create(DtmEquipamentos);
  DataSet := TClientDataSet(DtmEquipamentos.cdsDepreciacao);
  transacao := TIBTransaction(DtmEquipamentos.IBTransEquipamentos);
  Buscas := TIBQuery(DtmEquipamentos.qrBuscasEquip);
end;

function TDepreciacao.SomaDepreciacaoGeral(vempresas: string; vdatabase: Tdate): boolean;
begin
  // dataSet.Close;
  buscas.close;
  buscas.SQL.text := 'SELECT SUM(DP.VALOR_DEPRECI) as soma FROM EQUIPAMENTO EQ, DEPRECIACAO DP ' +
    'WHERE EQ.TIP_EQUIP = ''I'' and EQ.COD_EQUIP = DP.COD_EQUIP AND EQ.COD_EMPRESA = DP.COD_EMPRESA ' +
    ' AND EQ.COD_EMPRESA IN (' + vempresas + ') ' +
    ' AND EQ.DAT_CAD_EQUI <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vdatabase)) +
    ' AND DP.DATA_DEPRECI <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vdatabase)) +
    ' AND EQ.ATIVO = 1';
  buscas.Open;
  ValorDepreciado := buscas.FieldByName('SOMA').AsCurrency;
  buscas.Close;
end;

function TDepreciacao.verificaDepreciacao(equip: TEquipamentos): boolean;
var
  contData: Integer;
  I: Integer;
  Data: TDate;
  Year: Word;
  Month: Word;
  Day: Word;
  //  ValorDepreciado: Currency;
begin
  try

    if equip.dataSet.IsEmpty then
      raise exception.create('Nenhum equipamento encontrado');

    if equip.dataSet.FieldByName('TIP_EQUIP').AsString <> 'I' then
      raise exception.create('Equipamento Externo');

    if equip.dataSet.FieldByName('DAT_CAD_EQUI').AsString = '' then
      raise
        exception.create('Equipamento ''' + equip.dataSet.fieldbyname('NOM_EQUIP').AsString +
        ''' sem data de cadastro. Impossível calcular depreciação');

    contData := ContaData(equip.dataSet.FieldByName('DAT_CAD_EQUI').AsDateTime,
      vDadosIni.getDataBanco(buscas));
    abreDepreciacao(equip.dataSet.FieldByName('COD_EQUIP').AsInteger);
    Data := equip.dataSet.FieldByName('DAT_CAD_EQUI').AsDateTime;
    ValorDepreciado := 0;
    dataSet.First;
    while not dataSet.Eof do
    begin
      ValorDepreciado := ValorDepreciado+dataSet.FieldByName('VALOR_DEPRECI').AsFloat;
      dataSet.Next;
    end;

    if ValorDepreciado < equip.dataSet.FieldByName('VLR_EQUI').AsCurrency then
    begin
      for I := 1 to contData do
      begin
        DecodeDate(Data, Year, Month, Day);
        if ExecutaComandosSql('select * from DEPRECIACAO where cod_empresa = ' +
          vDadosIni.CodEmpresa + ' and ativo=1 and COD_EQUIP = ' +
          equip.dataSet.FieldByName('COD_EQUIP').AsString
          + ' and MES = ''' + IntToStr(Month) + ''' and ANO = ''' + IntToStr(Year) + '''') then
         begin
          Data := IncMonth(Data, 1);
          continue;
         end;
        Insert;

        dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.COdEmpresa;
        dataSet.FieldByName('COD_EQUIP').AsInteger :=
          equip.dataSet.FieldByName('COD_EQUIP').AsInteger;
        dataSet.FieldByName('MES').AsInteger := Month;
        dataSet.FieldByName('ANO').AsInteger := Year;
        dataSet.FieldByName('DATA_DEPRECI').AsDateTime :=
          strtodate(inttostr(vDadosIni.UltimoDia(strtodate('01/' + inttostr(Month) + '/' +
          inttostr(Year)))) +
          '/' + inttostr(Month) + '/' + inttostr(Year));
        //        vDadosIni.getDataBanco(buscas);
        dataSet.FieldByName('VALOR_DEPRECI').AsFloat :=
          ((equip.dataSet.FieldByName('IND_DEPREC').AsFloat / 12) / 100) *
          equip.dataSet.FieldByName('VLR_EQUI').AsFloat;
        Post;
        Data := IncMonth(Data, 1);
      end;
      if Apply then
        CommitaTransacao
      else
      begin
        Cancel;
        RollBackTransacao;
      end;

      if dataSet.IsEmpty then
        raise exception.create('O Equipamento ''' +
          equip.dataSet.fieldbyname('NOM_EQUIP').AsString + ''' Dt. Cad: ''' +
          equip.dataSet.fieldbyname('DAT_CAD_EQUI').AsString +
          ''' selecionado ainda não sofreu depreciação!');
      ValorDepreciado := 0;
      dataSet.First;
      while not dataSet.Eof do
      begin
        ValorDepreciado := ValorDepreciado+dataSet.FieldByName('VALOR_DEPRECI').AsFloat;
        dataSet.Next;
      end;
    end;
    First;
    Result := true;
  except
    on e: exception do
    begin
      Result := false;
      dataSet.Close;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;

end;

{ TManutencaoEquipamentos }

function TManutencaoEquipamentos.abreManutencao(
  codEquipamento: integer): boolean;
begin
  result := montaSelect('SELECT * FROM manutencao where ativo = 1' +
    ' and cod_equip = ' + IntToStr(codEquipamento) +
    ' and COD_EMPRESA = ' + vDadosIni.codEmpresa);
end;

function TManutencaoEquipamentos.AbrirLixeira: boolean;
begin
  if not StatusLixeira then
  begin
    Application.MessageBox('A lixeira está vazia.', 'Informação', MB_OK + MB_ICONINFORMATION +
      MB_DEFBUTTON1);
    montaSelect('SELECT * FROM manutencao WHERE ativo=1' +
      ' and COD_EMPRESA =' + vDadosIni.codEmpresa);
    result := false;
  end
  else
    result := montaSelect('SELECT * FROM manutencao WHERE ativo<>1' +
      ' and COD_EMPRESA =' + vDadosIni.codEmpresa);
end;

procedure TManutencaoEquipamentos.cadManutencaoEquipamentos(TipoForm: integer);
begin
  vDadosIni.vTipoForm := TipoForm;
  if DtmEquipamentos = nil then
    DtmEquipamentos := TDtmEquipamentos.Create(DtmEquipamentos);
  if frmCadManutencaoEquip = nil then
  begin
  	if TipoForm > 0 then
      vDadosIni.vModalOuChild := 'M';
    Application.CreateForm(TfrmCadManutencaoEquip, frmCadManutencaoEquip);
  end;

  if (TipoForm > 0) and (not frmCadManutencaoEquip.Visible) then
    frmCadManutencaoEquip.ShowModal
  else if (not frmCadManutencaoEquip.Visible) then
    frmCadManutencaoEquip.Show
  else if frmCadManutencaoEquip.FormStyle = fsMDIChild then
    frmCadManutencaoEquip.Show
  else
    frmCadManutencaoEquip.ShowModal;
end;

constructor TManutencaoEquipamentos.create;
begin
  if DtmEquipamentos = nil then
    DtmEquipamentos := TDtmEquipamentos.Create(DtmEquipamentos);
  DataSet := TClientDataSet(DtmEquipamentos.cdsManuEquip);
  transacao := TIBTransaction(DtmEquipamentos.IBTransEquipamentos);
  Buscas := TIBQuery(DtmEquipamentos.qrBuscasEquip);
  vCP := TContasAPagarEquip.create;
  vCondPag := TCondicaoPagamento.create;
  vlocEquip := TLocEquipamentosManut.create;
end;

destructor TManutencaoEquipamentos.Destroy;
begin
  FreeAndNil(vCP);
  FreeAndNil(vCondPag);
  FreeAndNil(vlocEquip);
  inherited;
end;

function TManutencaoEquipamentos.detalhesNoCaixa: boolean;
begin
  Result := false;
  if statusNoCaixa <> 0 then
  begin
    vCP.abreContasAPagar(dataSet.FieldByName('COD_CONTRP').AsInteger);
    Result := not vCP.dataSet.IsEmpty;
  end;
  if not Result then
    Application.MessageBox('Sem detalhes no Financeiro', 'Antenção', mb_ok
      + MB_ICONINFORMATION);
end;

function TManutencaoEquipamentos.edit: boolean;
begin
  if vlocEquip.dataSet.State = dsInactive then
    vlocEquip.abreLocEquipManu;
  Result := inherited edit;
end;

function TManutencaoEquipamentos.enviaManutencaoParaCaixa: boolean;
var
  vConta: string;
  vControle: string;
  I: Integer;
  lote: Integer;
  qtdeDocumento: Integer;
begin
  if statusNoCaixa <> 0 then
  begin
    Application.MessageBox('Manutenção já foi enviada para o Contas a Pagar', 'Antenção', mb_ok
      + MB_ICONINFORMATION);
    Result := false;
    exit;
  end;

  try
    if trim(dataSet.FieldByName('num_doc_desp').AsString) = '' then
      raise exception.Create('Número do documento precisa ser informado');

    vConta := retornaValor('select cont_lig.ncon_manu_equip as valor from cont_lig where cod_emp = '
      + vDadosIni.codEmpresa);
    vControle :=
      retornaValor('select cont_lig.contr_manu_equip as valor from cont_lig where cod_emp = ' +
      vDadosIni.codEmpresa);
    if vConta = '' then
      raise exception.create('Sem conta de Ligação para manutenção de Equipamentos' + #13 +
        'Verifique Contas de Ligação no Financeiro');
    if vControle = '' then
      raise exception.create('Sem controle para manutenção de Equipamentos' + #13 +
        'Verifique Contas de Ligação no Financeiro');

    dataSet.FieldByName('data_envio_caixa').AsDateTime := vDadosIni.getDataBanco(buscas);
    lote := Gencodigo('LOTE_LANC', DtmEquipamentos.SpIncCodigo, vDadosIni.codEmpresa);
    vCP.abreContasAPagar(lote);
    qtdeDocumento := vCondPag.getQuantidade;
    for I := 0 to qtdeDocumento - 1 do
    begin
      vCP.Insert;
      vCP.dataSet.FieldByName('CODIGO_EMP').AsString := vDadosIni.codEmpresa;
      vCP.dataSet.FieldByName('COD_FORN_NFE').AsString := dataSet.FieldByName('codigo_f').AsString;
      vCP.dataSet.FieldByName('NOME_FOR_CTP').AsString :=
        dataSet.FieldByName('nome_fornecedor').AsString;
      vCP.dataSet.FieldByName('N_CONTA_PLC').AsString := vConta;
      vCP.dataSet.FieldByName('CODIGO_CTRL').AsString := vControle;
      vCP.dataSet.FieldByName('TIPO_CTP').AsString := 'D';
      vCP.dataSet.FieldByName('N_DOC_CTP').AsString := vCondPag.getDocParcela(I);
      //      dataSet.FieldByName('num_doc_despesa').AsString;
      vCP.dataSet.FieldByName('DATA_VENC_CTP').AsString := vCondPag.getVencimentoParcela(I);
      //      dataSet.FieldByName('data_vencimento').AsDateTime;
      vCP.dataSet.FieldByName('VALOR_CTP').AsCurrency := vCondPag.getValorParcela(I);
      //      dataSet.FieldByName('custo_manuten').AsCurrency;
      vCP.dataSet.FieldByName('DATA_ENT_CTP').AsCurrency :=
        dataSet.FieldByName('data_envio_caixa').AsDateTime;
      vCP.dataSet.FieldByName('NATL_CTP').AsString := 'C';
      vCP.dataSet.FieldByName('HISTORICO_CTP').AsString :=
        'PAGAMENTO MANUTENCAO EQUIPAMENTO CONFORME DOC ' +
        dataSet.FieldByName('NUM_DOC_DESP').AsString;
      vCP.dataSet.FieldByName('COD_CONTRP').AsInteger := Gencodigo('CONTAS_A_PAGAR',
        DtmEquipamentos.SpIncCodigo, vDadosIni.codEmpresa);
      vCP.dataSet.FieldByName('LOTE').AsInteger := lote;
      vCP.Post;
    end;

    if vCP.dataSet.ChangeCount > 0 then
      if vCP.dataSet.ApplyUpdates(-1) > 0 then
        raise exception.create('Contas a pagar não pode ser cadastrada. Verifique com suporte');

    dataSet.FieldByName('COD_CONTRP').AsInteger := lote;
    dataSet.Post;
    if not Apply then
      raise exception.create('Contas a pagar não pode ser cadastrada. Verifique com suporte' + #13
        + 'Erro ao alterar manutenção');
    CommitaTransacao;
    vDadosIni.GravaAuditoria('EQU026', 'GRAVAR', 'SUCESSO', 'EQUIPAMENTO',
    obManutEquip.dataSet.FieldByName('cod_manutencao').AsString,obManutEquip.buscas);

//    vDadosIni.GravaAuditoria('EQU026', 'TRANSACAO CONFIRMADA' +
//      obManutEquip.dataSet.FieldByName('cod_manutencao').AsString,
//      obManutEquip.buscas);
    vCP.abreContasAPagar(dataSet.FieldByName('COD_CONTRP').AsInteger);
    Result := true;
  except
    on e: exception do
    begin
      Cancel;
      RollBackTransacao;
      vDadosIni.GravaAuditoria('EQU026', 'GRAVAR', 'FALHA', 'EQUIPAMENTO',
      obManutEquip.dataSet.FieldByName('cod_manutencao').AsString,obManutEquip.buscas);
//      vDadosIni.GravaAuditoria('EQU026', 'ROOLBACK TRANSACAO' +
//        obManutEquip.dataSet.FieldByName('cod_manutencao').AsString,
//        obManutEquip.buscas);
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TManutencaoEquipamentos.existeFornecedor: boolean;
var
  temp: string;
begin
  if dataSet.FieldByName('CODIGO_F').AsString <> '' then
  begin
   temp := retornaValor('select nome_cliente as valor from clientes where cod_cliente = ' +
     dataSet.FieldByName('CODIGO_F').AsString + ' and cod_empresa = ' + vDadosIni.codEmpresa);
   if temp <> '' then
    dataSet.FieldByName('nome_fornecedor').AsString := temp;
   Result := temp <> '';
  end
  else
   result:=false;
end;

function TManutencaoEquipamentos.insert: boolean;
begin
  if vlocEquip.dataSet.State = dsInactive then
    vlocEquip.abreLocEquipManu;
  if dataSet.State = dsInactive then
    abreManutencao(0);
  if inherited Insert then
  begin
    dataSet.FieldByName('data_lancamento').AsDateTime := vDadosIni.getDataBanco(buscas);
    dataSet.FieldByName('dat_entrada').AsDateTime := vDadosIni.getDataBanco(buscas);
    dataSet.FieldByName('cod_Empresa').AsString := vDadosIni.codEmpresa;
    Result := true;
  end;
end;

procedure TManutencaoEquipamentos.montaCondPag(lista: TComboBox;
  codigoCondicao: integer);
begin
  buscas.Close;
  buscas.SQL.Text := 'select * from COND_PAG where NATUREZA_CP <> ''V''';
  buscas.Open;
  lista.Clear;
  lista.Items.Add('NENHUMA');
  buscas.First;
  while not buscas.eof do
  begin
    lista.Items.Add(buscas.FieldByName('desc_cond_pag').AsString);
    buscas.Next;
  end;
  lista.Text := 'NENHUMA';
  buscas.Close;
end;

function TManutencaoEquipamentos.post: boolean;
var
  temp: string;
begin
  try
    Result := false;

    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      result := true;
      exit;
    end;

    if dataSet.FieldByName('CODIGO_F').AsInteger <> 0 then
    begin
      temp := retornaValor('select nome_cliente as valor from clientes where cod_cliente = ' +
        dataSet.FieldByName('CODIGO_F').AsString + ' and cod_empresa = ' + vDadosIni.codEmpresa);
      if (temp = '') and (trim(dataSet.FieldByName('nome_fornecedor').AsString) = '') then
        raise exception.create('Fornecedor não encontrado e sem nome informado');
      if dataSet.FieldByName('CODIGO_F').NewValue <> dataSet.FieldByName('CODIGO_F').OldValue then
        dataSet.FieldByName('nome_fornecedor').AsString := temp
      else if dataSet.FieldByName('nome_fornecedor').NewValue <>
        dataSet.FieldByName('nome_fornecedor').OldValue then
        dataSet.FieldByName('codigo_f').AsString := '';
    end;
    if trim(dataSet.FieldByName('nome_fornecedor').AsString) = '' then
      raise exception.create('Fornecedor não informado');

    if dataSet.State in [dsInsert] then
      dataSet.FieldByName('COD_MANUTENCAO').AsInteger := Gencodigo('MANUTENCAO',
        DtmEquipamentos.SpIncCodigo, vDadosIni.codEmpresa);

    Result := inherited post;

    if dataSet.ChangeCount = 0 then
    begin
      Result := true;
      exit;
    end;

    if Apply then
    begin
      if CommitaTransacao then
       vDadosIni.GravaAuditoria('EQU025', 'GRAVAR', 'SUCESSO', 'MANUTENCAO',
       dataSet.FieldByName('COD_MANUTENCAO').AsString,buscas)
//       vDadosIni.GravaAuditoria('EQU025', dataSet.FieldByName('COD_MANUTENCAO').AsString +
//          ' Gravação Confirmada', buscas)
      else
        vDadosIni.GravaAuditoria('EQU025', 'GRAVAR', 'FALHA', 'MANUTENCAO',
        dataSet.FieldByName('COD_MANUTENCAO').AsString,buscas);
//        vDadosIni.GravaAuditoria('EQU025', dataSet.FieldByName('COD_MANUTENCAO').AsString +
//          ' Gravação não Confirmada', buscas);
    end
    else
    begin
      Cancel;
      RollBackTransacao;
      vDadosIni.GravaAuditoria('EQU025', 'GRAVAR', 'FALHA', 'MANUTENCAO',
        dataSet.FieldByName('COD_MANUTENCAO').AsString,buscas);
//      vDadosIni.GravaAuditoria('EQU025', dataSet.FieldByName('COD_MANUTENCAO').AsString
//        +
//        ' Gravação não Confirmada', buscas);
      Result := FALSE;
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

function TManutencaoEquipamentos.StatusLixeira: boolean;
begin
  //Se lixeira vazia retorna falso senão verdadeiro
  result := ExecutaComandosSql('SELECT * FROM manutencao WHERE ativo=0' +
    ' and COD_EMPRESA =' + vDadosIni.codEmpresa);
end;

function TManutencaoEquipamentos.statusNoCaixa: integer;
begin // 0 = Sem lancamento no caixa.  1 = Lancamento encontrado mas em aberto.  2 = Lancamento quitado
  Result := 0;
  if (dataSet.FieldByName('DATA_ENVIO_CAIXA').AsString = '') and
    (dataSet.FieldByName('COD_CONTRP').AsInteger = 0) then
    Exit;
  if not ExecutaComandosSql('SELECT COD_CONTRP FROM contas_a_pagar WHERE CODIGO_EMP = ' +
    vDadosIni.codEmpresa +
    ' AND COD_CONTRP = ' + dataSet.FieldByName('COD_CONTRP').AsString) then
    exit;
  if retornaValor('SELECT STATUS_CTP as valor FROM contas_a_pagar WHERE CODIGO_EMP = ' +
    vDadosIni.codEmpresa +
    ' AND COD_CONTRP = ' + dataSet.FieldByName('COD_CONTRP').AsString) = 'QUITADO' then
    Result := 2
  else
    Result := 1;
end;

{ TContasAPagarEquip }

function TContasAPagarEquip.abreContasAPagar(loteConta: integer): boolean;
begin
  Result := montaSelect('SELECT * FROM contas_a_pagar WHERE CODIGO_EMP = ' + vDadosIni.codEmpresa +
    ' AND lote = ' + IntToStr(loteConta));
end;

constructor TContasAPagarEquip.create;
begin
  if DtmEquipamentos = nil then
    DtmEquipamentos := TDtmEquipamentos.Create(DtmEquipamentos);
  DataSet := TClientDataSet(DtmEquipamentos.cdsCPManutEq);
  transacao := TIBTransaction(DtmEquipamentos.IBTransEquipamentos);
  Buscas := TIBQuery(DtmEquipamentos.qrBuscasEquip);
end;

{ TLocEquipamentosManut }

function TLocEquipamentosManut.abreLocEquipManu: boolean;
begin
  result := montaSelect('SELECT * FROM EQUIPAMENTO where ativo = 1' +
    ' and COD_EMPRESA = ' + vDadosIni.codEmpresa + ' and tip_equip = ''I''');
end;

constructor TLocEquipamentosManut.create;
begin
  DataSet := TClientDataSet(DtmEquipamentos.cdsLocEquip);
  transacao := TIBTransaction(DtmEquipamentos.IBTransEquipamentos);
  Buscas := TIBQuery(DtmEquipamentos.qrBuscasEquip);
end;

{ TLocDadosBalanco }

function TLocDadosBalanco.abreDadosBalanco: boolean;
begin
  buscas.close;
  buscas.SQL.Text := 'SELECT * FROM DADOS_BALANCO WHERE ATIVO = 1 and CODSEQ_BALANCO <> 11 and CODSEQ_BALANCO <> 18 ';
  buscas.Open;
end;

constructor TLocDadosBalanco.create;
begin
  transacao := TIBTransaction(DtmEquipamentos.IBTransEquipamentos);
  Buscas := TIBQuery(DtmEquipamentos.qrDadosBalanco)
end;

{ TServicosSugeridos }

function TServicosSugeridos.abreServico(pDataset: TDataSet): boolean;
begin
 Result := montaSelect(' select regras_sug.codigo, regras_sug.descricao, regras_sug.interv_mes_serv from regras_sug ' +
  	' where regras_sug.tipo = ''E'' ' +
    ' and regras_sug.cod_empresa = ' + vDadosIni.codEmpresa + ' and regras_sug.ativo = 1 ' +
    ' order by regras_sug.descricao ');

 if pDataset.FieldByName('COD_EQUIP').AsInteger > 0 then
 begin
   dataSet.First;
   while not dataSet.Eof do
   begin
     buscas.Close;
     buscas.SQL.Text := ' select regras_sug_itens.codigo, regras_sug_itens.cod_tipo from regras_sug_itens ' +
      ' where regras_sug_itens.codigo = :codigo and regras_sug_itens.cod_tipo = :cod_tipo ' +
      ' and regras_sug_itens.cod_empresa = :cod_empresa and regras_sug_itens.tipo = :tipo ';
     buscas.ParamByName('CODIGO').AsInteger := dataset.FieldByName('CODIGO').AsInteger;
     buscas.ParamByName('COD_TIPO').AsInteger := pDataset.FieldByName('COD_EQUIP').AsInteger;
     buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
     buscas.ParamByName('TIPO').AsString := 'E';
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
  if DtmEquipamentos = nil then
    DtmEquipamentos := TDtmEquipamentos.Create(DtmEquipamentos);
  dataSet := TClientDataSet(DtmEquipamentos.cdsServicosSugeridos);
  transacao := TIBTransaction(DtmEquipamentos.IBTransEquipamentos);
  buscas := TIBQuery(DtmEquipamentos.qrBuscasEquip);
end;

procedure TServicosSugeridos.SalvarServicos(pDataset: TDataSet; pCommitaTransacao: boolean);
begin
  if dataSet.IsEmpty then
  	exit;

  if not vDadosIni.vSugServico.vHabilitarSug then
  	exit;

  try
    dataSet.Filter := 'SEL = ''S''';
    dataSet.Filtered := True;

    vDadosIni.abreStatusProcessamento('', 'Aguarde. Incluindo serviços para o(s) equipamento(s) ');

    buscas.Close;
    buscas.SQL.Text := ' DELETE FROM REGRAS_SUG_ITENS ' +
      ' WHERE COD_TIPO = :COD_TIPO AND COD_EMPRESA = :COD_EMPRESA AND TIPO = :TIPO; ';
    buscas.ParamByName('COD_TIPO').AsInteger := pDataset.FieldByName('COD_EQUIP').AsInteger;
    buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.ParamByName('TIPO').AsString := 'E';
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
        buscas.ParamByName('COD_TIPO').AsInteger := pDataset.FieldByName('COD_EQUIP').AsInteger;
        buscas.ParamByName('TIPO').AsString := 'E';
        buscas.ExecSQL;
      end;

      dataSet.Next;
    end;
	finally
  	dataSet.Filtered := False;
	  dataSet.First;
    vDadosIni.fechaStatusProcessamento;
  end;

  if pCommitaTransacao then
	  CommitaTransacao;
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
  
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Verificando serviços para o(s) equipamento(s) ');

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
          if ((vDadosIni.getValue(vList[1], 1) = 'I') and (pDataset.FieldByName('TIP_EQUIP').AsString = 'I'))
	          or ((vDadosIni.getValue(vList[1], 1) = 'E') and (pDataset.FieldByName('TIP_EQUIP').AsString = 'E'))
            or (vDadosIni.getValue(vList[1], 1) = 'A') then
          begin
            Result := false;
            if not Application.MessageBox('Nenhum serviço informado.' + chr(13) +
				      'Deseja confirmar as assim mesmo?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2)= mrYES then
              exit;

            if vDadosIni.PesqPros('BAS406', 'PERMITIR', '', 'EQUIPAMENTO', pDataset.FieldByName('COD_EQUIP').AsString, buscas, true) then
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

