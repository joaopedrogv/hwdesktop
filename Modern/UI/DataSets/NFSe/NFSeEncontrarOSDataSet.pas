unit NFSeEncontrarOSDataSet;

interface       

uses
  DataSetGrid, DB, FieldsConfigUnit, IntegerNullableUnit, DateAndTimeNullableUnit, StringNullableUnit, TipoComunsUnit;

type
  TNFSeEncontrarOSDataSetInput = record
  private
    NumeroOS: IntegerNullable;
    DataIni, DataFim: DateNullable;
    NomeCliente: StringNullable;
  public
    class function Create(
      const NumeroOS: IntegerNullable;
      const DataIni, DataFim: DateNullable;
      const NomeCliente: StringNullable
    ): TNFSeEncontrarOSDataSetInput; static;
  end;

  TNFSeEncontrarOSDataSet = class(TDataSetGrid)
  private
    procedure GetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure Setup(Builder: IFieldsConfigBuilder; const ASelectionField: string);
  public
    constructor Create(Builder: IFieldsConfigBuilder; const ASelectionField: string);

    procedure Executar(const Input: TNFSeEncontrarOSDataSetInput);
    function GetSelecionados(): TArrayInteger;
  end;

implementation

uses
  SysUtils, StrUtils,
  hw_filters, uDataSet_OOP,
  MasksConstsUnit, DFeTypesUnit, NumberServiceUnit;

{ TNFSeEncontrarOSDataSetInput }

class function TNFSeEncontrarOSDataSetInput.Create(
  const NumeroOS: IntegerNullable;
  const DataIni, DataFim: DateNullable;
  const NomeCliente: StringNullable
): TNFSeEncontrarOSDataSetInput;
begin
  Result.NumeroOS := NumeroOS;
  Result.DataIni := DataIni;
  Result.DataFim := DataFim;
  Result.NomeCliente := NomeCliente;
end;

{ TNFSeEncontrarOSDataSet }

function TNFSeEncontrarOSDataSet.GetSelecionados: TArrayInteger;
var
  Count, rNo: Integer;
begin
  storeRecNo;
  dataSet.DisableControls;
  try
    Count := 0;
    SetLength(Result, dataSet.RecordCount);
    dataSet.First();
    while not Self.Eof do
    begin
      if Count >= Length(Result) then
        SetLength(Result, Length(Result) + 32);

      // Caso o grid nao tenha o campo de selecao, entao tudo para criar
      if not Assigned(SelectionField) or SelectionField.AsBoolean then
      begin
        Inc(Count);
        Result[Count - 1] := fint('nped');
      end;

      Self.Next;
    end;

    SetLength(Result, Count);

  finally
    restoreRecNo;
    dataSet.EnableControls;
  end;
end;

procedure TNFSeEncontrarOSDataSet.GetText(Sender: TField; var Text: string; DisplayText: Boolean);
const
  CAMPOS_RET: array[0..6] of string = (
    'iss_ret_cli', 'iss_ret_serv', 'irrf_ret', 'csll_ret', 'pis_ret', 'cofins_ret', 'cp_ret'
  );
  RET_FED_STR: array[0..3] of string = (
    'Sem retenção', 'Com Retenção do IR', 'Com Retenção PIS, COFINS e CSLL', 'Com Retenção do IR, PIS, COFINS e CSLL'
  );
begin
  if Sender.FieldName = 'TIPO_ENTE_GOV' then
    Text := TipoEnteGovEnumStr[TipoEnteGovEnum(Sender.AsInteger)]

  else if Sender.FieldName = 'RET_FED_NFS' then
    Text := RET_FED_STR[NumberService.RangeOrDefault(0, 3, Sender.AsInteger, 0)]

  else if MatchText(Sender.FieldName, CAMPOS_RET) then
    if Sender.AsInteger > 0 then
      Text := 'Sim'
    else
      Text := 'Não';
end;

procedure TNFSeEncontrarOSDataSet.Setup(Builder: IFieldsConfigBuilder; const ASelectionField: string);
var
  S: string;
begin       
  if ASelectionField <> '' then
    builder.Add(ASelectionField, '..', fvSempreVisivel);

  ConfigFields( Builder
    .Add('cod_empresa,tipo', '', fvInvisivel)
    .Add('nped', 'Numero OS')
    .Add('data_fech', 'Data Fech O.S.').Width(75)
    .Add('nome_cliente', 'Cliente - Nome').Width(200)
    .Add('processamento_nfse', 'Processamento')
    .Add('valor_total', 'Total R$', '', MSK_DEC_00)
    .Add('valor_Servicos', 'Serviços Próprios', '', MSK_DEC_00)
    .Add('valor_terceiros', 'Serviços Terceiros', '', MSK_DEC_00)
    .Add('lc116', 'Qtde LC116')
    .Add('ctribnac', 'Qtde CTrib Nacional')
    .Add('iss_ret_cli', 'Retenção ISS - Cliente', GetText)
    .Add('iss_ret_serv', 'Retenção ISS - Serviço', GetText)
    .Add('irrf_ret', 'Retenção IRRF', GetText)
    .Add('csll_ret', 'Retenção CSLL', GetText)
    .Add('pis_ret', 'Retenção PIS', GetText)
    .Add('cofins_ret', 'Retenção COFINS', GetText)
    .Add('cp_ret', 'Retenção CP', GetText)
    .Add('data_ped', 'Data Abertura')
    .Add('cpfcnpj', 'Cliente - CPF/CNPJ')
    .Add('tipo_ente_gov', 'Cliente - Tipo Ente Governamental', GetText)
    .Add('ret_fed_nfs', 'Cliente - Retenções Fedeais', GetText)
  );

  SQLMaker.FilterMk.FreeFilters()
    .AddIsNull('nped', True);

  S := SQLMaker.GetSQL();

  CreateFieldsBySQL( S );

  if ASelectionField <> '' then
    CreateSelectionField(ASelectionField);
end;

constructor TNFSeEncontrarOSDataSet.Create(Builder: IFieldsConfigBuilder; const ASelectionField: string);
begin
  inherited Create( 'cdsNFSePesqOS', 'PEDVENDA' );

  SQLMaker.Build( TableName, 'os',
    'os.nped, os.tipo, os.cod_empresa, os.data_ped, os.data_fech, os.valor_total, os.cod_cliente, ' +
//    'iif(s.nfse_id is null, ''DISPONIVEL'', ''JA VINCULADA'') processamento_nfse, ' +
    'cl.nome_cliente, cl.cpfcgc cpfcnpj, cl.tipo_ente_gov, cl.ret_fed_nfs,  ' +
    '       case ' +
    '        when coalesce(s.n_nf, 0) > 0 then ''Indisponível'' ' +
    '        when ns.id is null then ''Disponível'' ' +
    '        when ns.situacao in (1,2) then ''Iniciado e Disponível'' ' +
    '        when ns.situacao in (3,4) then ''Em Emissão'' ' +
    '        else ''Indisponível'' ' +
    '      end processamento_nfse, ' +
    'sum(coalesce(s.valor_tot_serv, 0) + coalesce(s.rateio_acresc, 0) - coalesce(s.rateio_desc, 0)) valor_Servicos, ' +
    'sum(distinct coalesce(( ' +
    '    select sum(t.vl_servt) from pedvenda_serv_terc t ' +
    '    where t.nped = os.nped and t.tipo = os.tipo and t.cod_empresa = os.cod_empresa' +
    '  ), 0) ' +
    ') valor_terceiros, ' +
    'count(distinct ts.nfs_servico) lc116, ' +
    'count(distinct ts.ctribnac) ctribnac, ' +
    'sum(iif(cl.iss_retido = 1, 1, 0)) iss_ret_cli, ' +
    'sum(iif(ts.iss_retido = 1, 1, 0)) iss_ret_serv, ' +
    'sum(iif(tse.irrf_servico > 0, 1, 0)) irrf_ret, ' +
    'sum(iif(tse.aliq_cssl_ret > 0, 1, 0)) csll_ret, ' + 
    'sum(iif(tse.aliq_pis_ret > 0, 1, 0)) pis_ret, ' +
    'sum(iif(tse.aliq_cofins_ret > 0, 1, 0)) cofins_ret, ' + 
    'sum(iif(tse.aliq_cp_ret > 0, 1, 0)) cp_ret ',
    'inner join clientes cl on cl.cod_cliente = os.cod_cliente and cl.cod_empresa = os.cod_empresa ' +
    'left join pedvenda_serv s on s.nped = os.nped and s.tipo = os.tipo and s.cod_empresa = os.cod_empresa ' +
    'left join nfse ns on s.nfse_id is not null and ns.id = s.nfse_id and ns.cod_empresa = s.cod_empresa '+
    'left join tipo_servico ts on ts.cod_servico = s.cod_servico ' +
    'left join tiposerviconfse tse on tse.cod_tpservico = ts.nfs_servico',
    'os.tipo = ''OS'' and os.data_fech is not null ',
    '1,2,3,4,5,6,7,8,9,10,11,12 ',
    'data_fech desc, nped desc'
  );

  Setup( Builder, ASelectionField );
end;

procedure TNFSeEncontrarOSDataSet.Executar(const Input: TNFSeEncontrarOSDataSetInput);
begin
  with SQLMaker.FilterMk.FreeFilters() do
  begin
    if Input.DataIni.HasValue and Input.DataFim.HasValue then
      Add('data_fech', Input.DataIni.Value, Input.DataFim.Value)
    else if Input.DataIni.HasValue then
      Add('data_fech', Input.DataIni.Value, Input.DataIni.Value)
    else if Input.DataFim.HasValue then
      Add('data_fech', Input.DataFim.Value, Input.DataFim.Value);

    if Input.NumeroOS.HasValue then
      Add('nped', Input.NumeroOS.Value);

    if Input.NomeCliente.HasValue then
      Add( 'nome_cliente', Input.NomeCliente.Value, feStartsWith );

    if Length(SQLMaker.FilterMk.Items) = 0 then
      Add('data_fech', Date(), Date());

    Add('cod_empresa', EmpresaId);
  end;  

  RunSQLMaker();
end;

end.
