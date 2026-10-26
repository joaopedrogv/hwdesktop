unit hw_pedido_cliente;

interface

uses
  Query_OOP;

type
  PedidoCompraClienteNFe = record
    Numero: string;
    NumItem: Integer;
    DataPedido: TDateTime;
    QtdePed: Double;
    QtdeEnv: Double;
  end;

  PedidosCompraClienteNFe = array of PedidoCompraClienteNFe;

  TPedidoCompraCliente = class
  private
    FQuery: TQuery_OOP;
  public
    constructor Create(AQuery: TQuery_OOP);
    // Apenas retorna os dados de um pedido livre
    function GetPedidos(CodProd: string; Grupo, CodGrade, CodCliente: Integer): PedidosCompraClienteNFe;
    procedure AutoPreencheItemsNf(ACodNf: Integer);
  end;

implementation

uses uDtmAtivo, config_sistema_class, nf_item_class, hw_utils;

{ TPedidoCompraCliente }

procedure TPedidoCompraCliente.AutoPreencheItemsNf(ACodNf: Integer);
var
  Nitems: array of Integer;
  items: Tnf_item_classList;
  pdc: PedidosCompraClienteNFe;
  qtde: Double;
  I, IPDC, iCodCliente: Integer;
  conf: TConfig_sistema_class;
begin
  conf := TConfig_sistema_class.getConf('nf_inf_pedido_compra', FQuery.query, vDadosIni.cod_empresa);
  try
    if conf.ReadString('CadastroPedidosClienteNFe', 'PreencheNotaFiscalAutomaticamente') <> 'S' then
      Exit;
  finally
    conf.Free;
  end;

  items := Tnf_item_classList.Create();
  try
    FQuery.SQL(
      'select coalesce(nf.cod_cli_ped, nf.cod_cliente) cod_cliente, nfi.nitem, nfi.grupo_prod, nfi.cod_prod, nfi.cod_grade, nfi.quantidade' +
      ' from notafiscal_item nfi' +
      ' inner join notafiscal nf on nf.cod_nf = nfi.cod_nf and nf.cod_empresa = nfi.cod_empresa' +
      ' where nfi.cod_nf = %d and nfi.cod_empresa = %d' +
      ' and coalesce(trim(nfi.xped_compra), '''') = '''' and coalesce(nfi.nitemped_compra,  0) <= 0' +
      'order by nitem',
      [ACodNf, vDadosIni.cod_empresa]
    ).Open();

    iCodCliente := FQuery.fint('cod_cliente');

    items.CopyFrom(Tnf_item_class, FQuery.query);

    for I := 0 to items.Count - 1 do
    begin
      pdc := Self.GetPedidos(items.Items[I].cod_prod, VarToInt(items.Items[I].grupo_prod, -1), VarToInt(items.Items[I].cod_grade, -1), iCodCliente);

      if Length(pdc) > 0 then
      begin
        qtde := VarToFloat(items.Items[I].quantidade, -1);
        for IPDC := Low(pdc) to High(pdc) do
          if qtde > 0 then
          begin
            FQuery.SQL(
              'update notafiscal_item set xped_compra = ''%s'', nitemped_compra = %d' +
              ' where cod_nf = %d and nitem = %d and cod_empresa = %d',
              [pdc[IPDC].Numero, pdc[IPDC].NumItem, ACodNf, VarToInt(items.Items[I].nitem), vDadosIni.cod_empresa]
            ).ExecSQL();

            Break;
          end;
      end;
    end;

  finally
    items.Free;
  end;

end;

constructor TPedidoCompraCliente.Create(AQuery: TQuery_OOP);
begin
  FQuery := AQuery;
end;

function TPedidoCompraCliente.GetPedidos(CodProd: string; Grupo,
  CodGrade, CodCliente: Integer): PedidosCompraClienteNFe;
begin
  FQuery.SQL(
    'select pc.data_pedido, pc.codigo, pc.num_pedido, pit.nitem_nfe, pit.quant, sum(env.qtde_env) qtde_env' +
    ' from pedidocompracl_itens pit' +
    ' left join pedidocompracl_itens_env env on env.codigo = pit.codigo and env.cod_empresa = pit.cod_empresa' +
    '   and env.nitem = pit.nitem' +
    ' inner join pedidocompracl pc on pc.codigo = pit.codigo and pc.cod_empresa = pit.cod_empresa and pc.cod_cliente = %d' +
    ' where pit.grupo_prod = %d and pit.cod_prod = ''%s'' and pit.cod_grade = %d and pit.cod_empresa = %d' +
    '   and coalesce(pit.enviado, ''N'') <> ''S''' +
    ' group by data_pedido, codigo, num_pedido, nitem_nfe, quant' +
    ' order by data_pedido, codigo, num_pedido, nitem_nfe',
    [CodCliente, Grupo, CodProd, CodGrade, vDadosIni.cod_empresa]).Open().Last().First();

  SetLength(Result, FQuery.query.RecordCount);

  while not FQuery.Eof() do
  begin
    Result[ FQuery.query.RecNo - 1].Numero  := FQuery.fstr('num_pedido');
    Result[ FQuery.query.RecNo - 1].NumItem := FQuery.fint('nitem_nfe');
    Result[ FQuery.query.RecNo - 1].DataPedido := FQuery.fdate('data_pedido');
    Result[ FQuery.query.RecNo - 1].QtdePed := FQuery.ffloat('quant');
    Result[ FQuery.query.RecNo - 1].QtdeEnv := FQuery.ffloat('qtde_env');

    FQuery.Next();
  end;
end;

end.
