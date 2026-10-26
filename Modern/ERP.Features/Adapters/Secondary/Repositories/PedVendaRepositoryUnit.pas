unit PedVendaRepositoryUnit;

interface

uses
  IPedVendaRepositoryUnit,
  TipoComunsUnit,
  OSItemFiscalEtdUnit,
  UpdatePedvendaVinculoNFSeCommandsUnit,
  UpdatePedvendaEmissaoNFSeCommandsUnit,
  UpdatePedvendaVinculoDpsNFSeCommandUnit,
  UpdatePedvendaVinculoNFSeSubstituidaCommandUnit;

type
  PedVendaRepository = class(IPedVendaRepository)
  public
    function ListarItensFiscaisOS(const NumerosOS: TArrayInteger): OSItemFiscalEtdlList; override;
    procedure VincularComNFSe(const Input: UpdatePedvendaVinculoNFSeCommand); override;
    procedure RemoverVinculoComNFSe(const Input: UpdatePedvendaRemoverVinculoNFSeCommand); override;
    procedure AtualizarVinculoEmissaoNFSe(const Input: UpdatePedvendaEmissaoNFSeCommand); override;
    procedure AtualizarVinculoDPS(const Input: UpdatePedvendaVinculoDpsNFSeCommand); override;
    procedure AtualizarVinculoNFSeSubstituicao(const Input: UpdatePedvendaVinculoNFSeSubstituidaCommand); override;
  end;

implementation

{ PedVendaRepository }

uses
  SysUtils, DateUtils,
  QueryResultUnit, StringServiceUnit, ArrayServiceUnit, ParameterValueUnit;

procedure PedVendaRepository.AtualizarVinculoDPS(const Input: UpdatePedvendaVinculoDpsNFSeCommand);
begin
  FConnection.ExecuteCommand(
    'UPDATE PEDVENDA_SERV SET ' +
    'COD_RPS = :COD_RPS, EMISSAO_RPS = :EMISSAO_RPS ' +
    'WHERE NPED = :NPED AND TIPO = :TIPO AND COD_EMPRESA = :COD_EMPRESA AND NFSE_ID = :NFSE_ID ',
    ParametersBuilder.Create(5)
      .ByName('COD_RPS', Input.NDPS )
      .ByName('EMISSAO_RPS', Input.DhEmissao )
      .ByName('NPED', Input.NumeroOS )
      .ByName('TIPO', 'OS' )
      .ByName('COD_EMPRESA', Input.EmpresaId )
      .ByName('NFSE_ID', Input.NFSeId )
      .Build()
  );
end;

procedure PedVendaRepository.AtualizarVinculoNFSeSubstituicao(const Input: UpdatePedvendaVinculoNFSeSubstituidaCommand);
begin
  FConnection.ExecuteCommand(
    'UPDATE PEDVENDA_SERV SET ' +
    'NFSE_ID = :NOVA_NFSE_ID ' +
    'WHERE NPED = :NPED AND TIPO = :TIPO AND COD_EMPRESA = :COD_EMPRESA AND NFSE_ID = :NFSE_ID ',
    ParametersBuilder.Create(5)
      .ByName('NPED', Input.NumeroOS )
      .ByName('TIPO', 'OS' )
      .ByName('COD_EMPRESA', Input.EmpresaId )
      .ByName('NFSE_ID', Input.NFSeSubstituidaId )
      .ByName('NOVA_NFSE_ID', Input.NFSeSubstituidoraId )
      .Build()
  );
end;

procedure PedVendaRepository.AtualizarVinculoEmissaoNFSe(const Input: UpdatePedvendaEmissaoNFSeCommand);
begin
  FConnection.ExecuteCommand(
    'UPDATE PEDVENDA_SERV SET ' +
    'COD_RPS = :COD_RPS, EMISSAO_RPS = :EMISSAO_RPS, ' +
    'N_NF = :N_NF, EMISSAO_NFSE = :EMISSAO_NFSE, STATUS_NFSE = :STATUS_NFSE ' +
    'WHERE NPED = :NPED AND TIPO = :TIPO AND COD_EMPRESA = :COD_EMPRESA AND NFSE_ID = :NFSE_ID ',
    ParametersBuilder.Create(5)
      .ByName('COD_RPS', Input.NDPS )
      .ByName('EMISSAO_RPS', Input.DhEmissao )
      .ByName('N_NF', Input.NNFSe )
      .ByName('EMISSAO_NFSE', Input.DhProcessamento )
      .ByName('STATUS_NFSE', 'Autorzada' )
      .ByName('NPED', Input.NumeroOS )
      .ByName('TIPO', 'OS' )
      .ByName('COD_EMPRESA', Input.EmpresaId )
      .ByName('NFSE_ID', Input.NFSeId )
      .Build()
  );

  FConnection.ExecuteCommand(
    'UPDATE PEDVENDA SET ' +
    'NUM_NFEEXT = :NUM_NFEEXT ' +
    ',VALOR_NFEXT = :VALOR_NFEXT ' +
    ',DATA_NFEXT = :DATA_NFEXT ' +
    'WHERE NPED = :NPED AND TIPO = :TIPO AND COD_EMPRESA = :COD_EMPRESA AND coalesce(NUM_NFEEXT, 0) = 0 ',
    ParametersBuilder.Create(5)
      .ByName('NUM_NFEEXT', Input.NNFSe )
      .ByNameC('VALOR_NFEXT', Input.ValorLiquido )
      .ByName('DATA_NFEXT', DateOf(Input.DhEmissao.Value) )
      .ByName('NPED', Input.NumeroOS )
      .ByName('TIPO', 'OS' )
      .ByName('COD_EMPRESA', Input.EmpresaId )
      .Build()
  );
end;

function PedVendaRepository.ListarItensFiscaisOS(const NumerosOS: TArrayInteger): OSItemFiscalEtdlList;
var
  Q: QueryResult;
  sNumeros: string;
begin
  sNumeros := StringService.Default( StringService.Join(',', ArrayService.IntArrayToStringArray(NumerosOS) ), '-1');

  Q := FConnection.CreateQuery( Format(
    'select c.*, d.doc descricao_predefinida from ( ' +
    '  select ' +
    '    os.nped, os.cod_empresa, os.cod_cliente, s.cod_servico, os.data_fech, ' +
    '    s.desc_serv_ped descricao, s.nfse_id, s.n_nf, iif(s.nfse_id is null, s.cod_rps, null) cod_rps_legado, ' +
    '    ts.nfs_servico, ts.ctribnac, os.obs_os, 0 isterceiro, ' +
    '    sum(coalesce(s.valor_tot_serv, 0)) valor_tot_serv, ' +
    '    sum(coalesce(s.rateio_acresc, 0)) rateio_acresc, ' +
    '    sum(coalesce(s.rateio_desc, 0)) rateio_desc ' +
    '  from pedvenda os ' +
    '  inner join clientes cl on cl.cod_cliente = os.cod_cliente and cl.cod_empresa = os.cod_empresa ' +
    '  inner join pedvenda_serv s on s.nped = os.nped and s.tipo = os.tipo and s.cod_empresa = os.cod_empresa ' +
    '  left join tipo_servico ts on ts.cod_servico = s.cod_servico ' +
    '  where os.tipo = ''OS'' and os.data_fech is not null ' +
    '  group by 1,2,3,4,5,6,7,8,9,10,11,12 ' +
    '  union all ' +
    '  select ' +
    '    os.nped, os.cod_empresa, os.cod_cliente, null cod_servico, os.data_fech, ' +
    '    t.descr_servt descricao, null nfse_id, null n_nf, null cod_rps_legado, ' +
    '    null nfs_servico,  null ctribnac, null obs_os, 1 isterceiro, ' +
    '    sum(coalesce(t.vl_servt, 0)) valor_tot_serv, ' +
    '    0 rateio_acresc, ' +
    '    0 rateio_desc ' +
    '  from pedvenda os ' +
    '  inner join clientes cl on cl.cod_cliente = os.cod_cliente and cl.cod_empresa = os.cod_empresa ' +
    '  inner join pedvenda_serv_terc t on t.nped = os.nped and t.tipo = os.tipo and t.cod_empresa = os.cod_empresa ' +
    '  where os.tipo = ''OS'' and os.data_fech is not null ' +
    '  group by 1,2,3,4,5,6,7,8,9,10,11 ' +
    ') as c ' +
    'left join doc_eletronico d on d.cod_empresa = c.cod_empresa and d.id_doc = ''DISCRIMINACAO_NFS_OS_'' || c.nped ' +
    'where c.cod_empresa = :COD_EMPRESA ' +
    'and c.nped in (%s) ', [ sNumeros ]
    ),
    ParametersBuilder.Create(1).Add(FSession.EmpresaId).Build()
  );
  try
    Result := OSItemFiscalEtdlList.Create();

    while not Q.Eof do
    begin
      Result.Add( OSItemFiscalEtd.Create(
        q.FieldAsInteger('NPED'),
        q.FieldAsInteger('COD_EMPRESA'),
        q.FieldAsInteger('COD_CLIENTE'),
        q.FieldAsIntNullable('COD_SERVICO'),
        q.FieldAsDate('DATA_FECH'),
        q.FieldAsString('DESCRICAO'),
        q.FieldAsStringNullable('OBS_OS'),
        q.FieldAsStringNullable('DESCRICAO_PREDEFINIDA'),
        q.FieldAsCurrency('VALOR_TOT_SERV'),
        q.FieldAsCurrency('RATEIO_ACRESC'),
        q.FieldAsCurrency('RATEIO_DESC'),
        q.FieldAsString('NFS_SERVICO'),
        q.FieldAsString('CTRIBNAC'),
        q.FieldAsStringNullable('NFSE_ID'),
        q.FieldAsInt64Nullable('N_NF'),
        q.FieldAsIntNullable('COD_RPS_LEGADO'),
        q.FieldAreEquals('ISTERCEIRO', 1)
      ));
      Q.Next();
    end;

  finally
    Q.Free();
  end;
end;

procedure PedVendaRepository.VincularComNFSe(const Input: UpdatePedvendaVinculoNFSeCommand);
var
  sNumeros: string;
begin
  sNumeros := StringService.Default( StringService.Join(',', ArrayService.IntArrayToStringArray(Input.ServicosId) ), '-1');

//  FConnection.ExecuteCommand(
//    'UPDATE PEDVENDA SET ' +
//    'PROCESSAMENTO_NFSE = :P0 ' +
//    'WHERE NPED = :P1 AND TIPO = :P2 AND COD_EMPRESA = :P3',
//    ParametersBuilder.Create(4)
//      .Add( Ord( pnfsProcessada ))
//      .Add( Input.NumeroOS )
//      .Add( 'OS' )
//      .Add( Input.EmpresaId )
//      .Build()
//  );

  FConnection.ExecuteCommand( Format(
      'UPDATE PEDVENDA_SERV SET ' +
      'NFSE_ID = :NFSE_ID ' +
      'WHERE NPED = :NPED AND TIPO = :TIPO AND COD_EMPRESA = :COD_EMPRESA AND NFSE_ID IS NULL AND COD_SERVICO IN (%s) ',
      [ sNumeros ]
    ),
    ParametersBuilder.Create(5)
      .ByName('NFSE_ID', Input.NFSeId )
      .ByName('NPED', Input.NumeroOS )
      .ByName('TIPO', 'OS' )
      .ByName('COD_EMPRESA', Input.EmpresaId )
      .Build()
  );
end;

procedure PedVendaRepository.RemoverVinculoComNFSe(const Input: UpdatePedvendaRemoverVinculoNFSeCommand);
begin
  FConnection.ExecuteCommand(
    'UPDATE PEDVENDA_SERV SET ' +
    'NFSE_ID = NULL, COD_RPS = NULL, EMISSAO_RPS = NULL, N_NF = NULL, EMISSAO_NFSE = NULL ' +
    'WHERE NPED = :NPED AND TIPO = :TIPO AND COD_EMPRESA = :COD_EMPRESA AND NFSE_ID = :NFSE_ID ',
    ParametersBuilder.Create(5)
      .ByName('NPED', Input.NumeroOS )
      .ByName('TIPO', 'OS' )
      .ByName('COD_EMPRESA', Input.EmpresaId )
      .ByName('NFSE_ID', Input.NFSeId )
      .Build()
  );
end;

end.
