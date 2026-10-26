unit uClassesManutencaoInventario;

interface

uses
  uDataSet_OOP,
  inv_tipo74_class,
  inv_tipo74_posse_class,
  pedvenda_inv_posse_class,
  DB, Classes, Contnrs;

type
  TNotaRelIcms = class
  private
    FChaveNFe: string;
    FQtdeItem: Double;
    FUnidadeNf: string;
    FFator: Double;
    FQtdeUtil: Double;
    FValor: Double;
    FBaseST: Double;
    FRedBas: Double;
    FCredito: Double;  
    FVicms: Double;
    FQtdePrinc: Double;
  public
    property ChaveNfe: string read FChaveNFe write FChaveNFe;
    property QtdeItem: Double read FQtdeItem write FQtdeItem;
    property QtdePrinc: Double read FQtdePrinc write FQtdePrinc;
    property UnidadeNf: string read FUnidadeNf write FUnidadeNf;
    property Fator: Double read FFator write FFator;
    property QtdeUtil: Double read FQtdeUtil write FQtdeUtil;
    property Valor: Double read FValor write FValor;
    property BaseST: Double read FBaseST write FBaseST;
    property RedBas: Double read FRedBas write FRedBas;
    property Credito: Double read FCredito write FCredito;
    property Vicms: Double read FVicms write FVicms;
  end;

  TNotaRelIcmsList = class(TObjectList)
  private
    iIndex: Integer;
    FprintTotais: Integer;
    FTotalMercadorias: Double;
    FTotalCreditoCalcICMS: Double;
    FTotalBaseST: Double;
    FTotalCreditoCalcST: Double;
    FCreditoUnitario: Double;
    FCreditoICMSUnitario: Double;
    FBaseSTUnitario: Double;
    FValorMercadoriaUnitario: Double;
    FQtdeEstoque: Double;
    function GetItem(Index: Integer): TNotaRelIcms;
    procedure SetItem(Index: Integer; const Value: TNotaRelIcms);
  public
    procedure Reset;
    procedure Totalizar;
    function PrintTotais(): Integer;

    function New: TNotaRelIcms;
    function Next: TNotaRelIcms;
    function Current: TNotaRelIcms;

    property Items[Index: Integer]: TNotaRelIcms read GetItem write SetItem;

    property QtdeEstoque: Double read FQtdeEstoque write FQtdeEstoque;
    property TotalMercadorias: Double read FTotalMercadorias write FTotalMercadorias;
    property TotalBaseST: Double read FTotalBaseST write FTotalBaseST;
    property TotalCreditoCalcST: Double read FTotalCreditoCalcST write FTotalCreditoCalcST;
    property TotalCreditoCalcICMS: Double read FTotalCreditoCalcICMS write FTotalCreditoCalcICMS;
    property ValorMercadoriaUnitario: Double read FValorMercadoriaUnitario write FValorMercadoriaUnitario;
    property BaseSTUnitario: Double read FBaseSTUnitario write FBaseSTUnitario;
    property CreditoUnitario: Double read FCreditoUnitario write FCreditoUnitario;
    property CreditoICMSUnitario: Double read FCreditoICMSUnitario write FCreditoICMSUnitario;
  end; 

  TItemInventario = class(TInv_tipo74_class)
  private
    FPosse   : TInv_tipo74_posse_class;
    FRefVenda: TPedvenda_inv_posses_class;
  public
    constructor Create;
    destructor Destroy; override;

    function KeyAudit: string;
    function DataAudit: string;

    function DataAuditRevVnd(Index: Integer): string;

    property Posse   : TInv_tipo74_posse_class    read FPosse    write FPosse;
    property RefVenda: TPedvenda_inv_posses_class read FRefVenda write FRefVenda;
  end;

  TManutencaoInventario = class(TDataSet_OOP)
  private
    FProdutos: TDataSet_OOP;
    FPosses: TDataSet_OOP;
    FVendas: TDataSet_OOP;
    FVndPosse: TDataSet_OOP;
    FOnVndPosseScroll: TNotifyEvent;

    procedure dataSetProdGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure dataSetVendasAfterScroll(DataSet: TDataSet);
    procedure dataSetVendasBerofeInser(DataSet: TDataSet);
  public
    constructor Create();
    destructor Destroy; override;
    function GetPeriodo(DataIni, DataFim: TDateTime): TDataSet_OOP;
    function GetProdutos(): TDataSet_OOP;
    function GetVendas(CodCliente: Integer; DataIni, DataFim: TDateTime): TDataSet_OOP;

    function UpdateItem(Item: TItemInventario): Boolean;
    function InsertItem(Item: TItemInventario): Boolean;
    function SalvarItem(Item: TItemInventario; ApplyCommit: Boolean = True): Boolean;
    function ExcluirItem(Item: TItemInventario): Boolean;
    function NomeCliente(CodCliente: Integer): string;
    function DescricaoProduto(GrupoProd: Integer; CodProd: string): string;
    function IncluirItensDaVenda(UsarValorUn: Boolean): Boolean;
    function ExcluirItemPelaVenda(): Boolean;

    function Inv_KeyAudit: string;
    function Inv_DataAudit: string;
    function InvProd_KeyAudit: string;
    function InvProd_DataAudit: string;
    //function DataAudit: string;

    property Produtos: TDataSet_OOP read FProdutos write FProdutos;
    property Posses  : TDataSet_OOP read FPosses write FPosses;
    property Vendas  : TDataSet_OOP read FVendas write FVendas;
    property VndPosse: TDataSet_OOP read FVndPosse write FVndPosse;

    property VndPosseScroll: TNotifyEvent read FOnVndPosseScroll write FOnVndPosseScroll;
  end;

  TRelatorioCreditoStRet = class(TDataSet_OOP)
  private 
    skip: Integer;
    limit: Integer;
    dataInventario: TDateTime;
    notasL: TNotaRelIcmsList;
    FNotas: TDataSet_OOP;
    FSumMercadorias: Double;
    FSumCreditoICMS: Double;
    FSumBaseST: Double;
    FSumCreditoST: Double;

   procedure InitConf;
  public
    destructor Destroy; override;
    constructor Create();
              
    function Start(dataInv: TDateTime): Integer;
    procedure GetMore();

    procedure StartNotas();

    property Notas: TNotaRelIcmsList read notasL;

    property SumMercadorias: Double read FSumMercadorias write FSumMercadorias;
    property SumBaseST: Double read FSumBaseST write FSumBaseST;
    property SumCreditoST: Double read FSumCreditoST write FSumCreditoST;
    property SumCreditoICMS: Double read FSumCreditoICMS write FSumCreditoICMS;
  end;

var
  Inventario: TManutencaoInventario;

implementation

uses
  TypInfo, SysUtils, uDtmAtivo, hw_utils, uDadosIni, basefb_class,
  StrUtils, Math, Windows, hw_audit_utils, Variants, config_sistema_class;

{ TManutencaoInventario }

constructor TManutencaoInventario.Create;
begin
  inherited Create(dtmAtivo.bancoHw);
  FProdutos := TDataSet_OOP.Create(dtmAtivo.bancoHw);
  FPosses   := TDataSet_OOP.Create(dtmAtivo.bancoHw);
  FVendas   := TDataSet_OOP.Create(dtmAtivo.bancoHw);
  FVndPosse := TDataSet_OOP.Create(dtmAtivo.bancoHw);

  TableName := 'INV_TIPO74';
end;

procedure TManutencaoInventario.dataSetProdGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if Sender.FieldName = 'IND_PROP' then
    Text := IfThen(Sender.AsString = '1',
                   '1 - Empresa / Terceiros',
                   IfThen(Sender.AsString = '2', '2 - Terceiros / Empresa', '0 - Empresa / Empresa'));
end;

procedure TManutencaoInventario.dataSetVendasAfterScroll(DataSet: TDataSet);
begin
  FVndPosse.ClientOpen('select c.*, (c.qtde_aplic * c.valor_aplic) total_aplic, (c.qtde * c.valor) valor_total, (c.qtde * c.custo) custo_total from(' +
                       'select pvp.tipo, pvp.nped, pv.data_fech data, pvp.nitem, pvp.num_fab_prod Num_fab, pvp.descr_prod_ped descr_prod,' +
                       ' pvp.quant_ped_item qtde, ((pvp.vltot_ped_nf + pvp.rateio_acresc - pvp.rateio_desc) / pvp.quant_ped_item) valor,' +
                       ' pvp.pcust_mc custo, pvi.cod_empresa, pvi.data_inv, pvi.posse_id, pvi.qtde_aplic, pvi.valor_aplic' +
                       '  from pedvenda_inv_posse pvi' +
                       ' inner join pedvenda_prod pvp on pvp.nped = pvi.nped and pvp.tipo = pvi.tipo and pvp.cod_empresa = pvi.cod_empresa' +
                       '   and pvp.nitem = pvi.nitem' +
                       ' inner join pedvenda pv on pvp.nped = pv.nped and pvp.tipo = pv.tipo and pvp.cod_empresa = pv.cod_empresa' +
                       ' where pvi.posse_id = %d and pvi.cod_empresa = %d) as c',
                       [FProdutos.fint('posse_id'), vDadosIni.cod_empresa]);

  FVndPosse.dataSet.Tag := 1;
  TFloatField(FVndPosse.dataSet.FieldByName('qtde')).DisplayFormat        := '#,###,###,##0.000';
  TFloatField(FVndPosse.dataSet.FieldByName('qtde_aplic')).DisplayFormat  := '#,###,###,##0.000';
  TFloatField(FVndPosse.dataSet.FieldByName('valor')).DisplayFormat       := '#,###,###,##0.000000';
  TFloatField(FVndPosse.dataSet.FieldByName('valor_aplic')).DisplayFormat := '#,###,###,##0.000000';
  TFloatField(FVndPosse.dataSet.FieldByName('valor_total')).DisplayFormat := '#,###,###,##0.00';
  TFloatField(FVndPosse.dataSet.FieldByName('custo_total')).DisplayFormat := '#,###,###,##0.00';
  TFloatField(FVndPosse.dataSet.FieldByName('total_aplic')).DisplayFormat := '#,###,###,##0.00';

  if Assigned(FOnVndPosseScroll) then
    FOnVndPosseScroll(Self);
end;

procedure TManutencaoInventario.dataSetVendasBerofeInser(DataSet: TDataSet);
begin
  FVendas.dataSet.Cancel;
end;

function TManutencaoInventario.DescricaoProduto(GrupoProd: Integer;
  CodProd: string): string;
begin
  Result := SqlOpen('select descr_prod from produtos' +
                    ' where grupo_prod = %d and cod_prod = %s and cod_empresa = %d',
                    [GrupoProd, QuotedStr(CodProd), vDadosIni.cod_empresa]).FieldByName('descr_prod').AsString;
end;

destructor TManutencaoInventario.Destroy;
begin
  FProdutos.Free;
  FPosses.Free;
  FVendas.Free;
  FVndPosse.Free;
  inherited;
end;

function TManutencaoInventario.ExcluirItem(Item: TItemInventario): Boolean;
begin
  Result := False;
  try
    if (VarToInt(Item.Posse.id) > 0) or
       (Item.cod_prod <> '') then
    begin
      if (VarToInt(Item.Posse.id) > 0) then
        SqlExec(Item.Posse.SQLMotor().SQLDelete)
      else
        SqlExec(Item.SQLMotor().SQLDelete);

      if transacao.InTransaction then
        transacao.Commit;

      with Auditor.Excluir.Sucesso do
        GravarMensagem(Mensagem);

      Result := True;

      FProdutos.dataSet.Refresh;

      if not fProdutos.dataSet.IsEmpty then
        dataSet.RefreshRecord;
    end;

  except on E: Exception do
    begin
      if transacao.InTransaction then
        transacao.Rollback;

      with Auditor.Excluir.Falha do
        GravarMensagem(Mensagem);

      Result := False;
      registraErro('TManutencaoInventario.ExcluirItem ' + e.Message);
      ShowErro('Erro ao excluir produto no inventário: ' + e.Message);
    end;
  end;
end;

function TManutencaoInventario.ExcluirItemPelaVenda: Boolean;
var
  ValorDel, ValorPosse, ValorRestante, Qtdedel, QtdeRestante: Double;
  PosseDB: TInv_tipo74_posse_class;
  PedVendaPosse: TPedvenda_inv_posse_class;
begin
  Result := False;

  try

    //ValorDel := FVndPosse.ffloat(IfThen(FVndPosse.fequals('us_vlun', 'S'), 'valor_total', 'custo_total'));
    Qtdedel  := FVndPosse.ffloat('qtde_aplic');
    ValorDel := FVndPosse.ffloat('valor_aplic');

    PosseDB := TInv_tipo74_posse_class.Create;
    PedVendaPosse := TPedvenda_inv_posse_class.Create;
    try
      PosseDB.CopyFrom(SqlOpen('select * from inv_tipo74_posse' +
                               ' where id = %d and cod_empresa = %d',
                               [FVndPosse.fint('posse_id'), vDadosIni.cod_empresa]));
      if PosseDB.id = 0 then
      begin
        ShowErro('Não foi encontrada a posse');
        Exit;
      end;

      ValorPosse := VarToFloat(PosseDB.qtde) * VarToFloat(PosseDB.valor);

      if (ValorDel >= ValorPosse) or (Qtdedel >= VarToFloat(PosseDB.qtde)) then
        SqlExec(PosseDB.SQLMotor().SQLDelete)
      else
      begin
        ValorRestante := ValorPosse - ValorDel;
        QtdeRestante := VarToFloat(PosseDB.qtde) - Qtdedel;

        PosseDB.valor := ValorRestante / QtdeRestante;
        PosseDB.qtde := QtdeRestante;

        SqlExec(PosseDB.SQLMotor().SQLUpdate);

        SqlExec('delete from pedvenda_inv_posse' +
                ' where nped = %d and tipo = %s and cod_empresa = %d' +
                ' and nitem = %d and data_inv = %s',
                [FVndPosse.fint('nped'), FVndPosse.fstrq('tipo'), vDadosIni.cod_empresa,
                 FVndPosse.fint('nitem'), FVndPosse.fdate_fb('data_inv')]);
      end;

      CommitaTransacao;

      with Auditor.Excluir.Sucesso do
        GravarMensagem(Mensagem);

      Result := True;

      FProdutos.dataSet.Refresh;

      if not FProdutos.dataSet.IsEmpty then
        dataSet.RefreshRecord;

    finally
      PosseDB.Free;
      PedVendaPosse.Free;
    end;
        
  except on E: Exception do
    begin
      RollBackTransacao;

      with Auditor.Excluir.Falha do
        GravarMensagem(Mensagem);
      
      Result := False;
      registraErro('TManutencaoInventario.ExcluirItemPelaVenda ' + e.Message);
      ShowErro('Erro ao excluir dados de posse pela venda: ' + e.Message);
    end;
  end;
end;

function TManutencaoInventario.GetPeriodo(DataIni,
  DataFim: TDateTime): TDataSet_OOP;
begin
  Result := Self;

  ClientOpen('select i74.data_inv,' +
             ' sum(iif(ip.id is null, i74.quantidade * i74.valor_prod, ip.qtde * ip.valor)) valor from inv_tipo74 i74' +
             ' left join inv_tipo74_posse ip on ip.inv_id = i74.id and ip.cod_empresa = i74.cod_empresa and ip.ativo = 1' +
             ' where i74.cod_empresa = %d and i74.data_inv >= %s and i74.data_inv <= %s' +
             ' group by i74.data_inv' +
             ' order by i74.data_inv desc',
             [vDadosIni.cod_empresa, date_fb(DataIni), date_fb(DataFim)]);
  TFloatField(dataSet.FieldByName('valor')).DisplayFormat := '#,###,###,##0.00';
end;

function TManutencaoInventario.GetProdutos(): TDataSet_OOP;
var
  I: Integer;
begin
  Result := FProdutos;
  FProdutos.ClientOpen('select pr.grupo_prod,  pr.cod_prod, pr.num_fab_prod, pr.descr_prod,' +
                       ' iif(ip.id is null, 0, ip.ind_prop) ind_prop,' +
                       ' iif(ip.id is null, i74.quantidade, ip.qtde) quantidade,' +
                       ' iif(ip.id is null, i74.valor_prod, ip.valor) valor_prod,' +
                       ' iif(ip.id is null, i74.quantidade * i74.valor_prod, ip.qtde * ip.valor) valor,' +
                       ' i74.cod_empresa, i74.id inv_id, ip.id posse_id, i74.data_inv, ip.cod_cliente, cl.nome_cliente' +
                       ' from inv_tipo74 i74' +
                       ' left join inv_tipo74_posse ip on ip.inv_id = i74.id and ip.cod_empresa = i74.cod_empresa and ip.ativo = 1' +
                       ' left join produtos pr on pr.grupo_prod = i74.grupo_prod and pr.cod_prod = i74.cod_prod and pr.cod_empresa = i74.cod_empresa' +
                       ' left join clientes cl on cl.cod_cliente = ip.cod_cliente and cl.cod_empresa = ip.cod_empresa' +
                       ' where i74.cod_empresa = %d and i74.data_inv = %s' +
                       ' order by pr.descr_prod',
                       [vDadosIni.cod_empresa, Self.fdate_fb('data_inv')]);
  FProdutos.dataSet.FieldByName('ind_prop').OnGetText                    := dataSetProdGetText;
  FProdutos.dataSet.FieldByName('ind_prop').Alignment                    := taLeftJustify;
  TFloatField(FProdutos.dataSet.FieldByName('quantidade')).DisplayFormat := '#,###,###,##0.000';
  TFloatField(FProdutos.dataSet.FieldByName('valor_prod')).DisplayFormat := '#,###,###,##0.000000';
  TFloatField(FProdutos.dataSet.FieldByName('valor')).DisplayFormat      := '#,###,###,##0.00';
  FProdutos.dataSet.AfterScroll                                          := dataSetVendasAfterScroll;
  FProdutos.dataSet.AfterRefresh                                         := dataSetVendasAfterScroll;
end;

function TManutencaoInventario.GetVendas(CodCliente: Integer; DataIni,
  DataFim: TDateTime): TDataSet_OOP;
begin
  Result := FVendas;
  FVendas.ClientOpen('select ''N'' sel, pv.tipo, pv.nped, pv.data_fech, pr.descr_prod, pvp.quant_ped_item qtde,' +
                     '  pvp.pcust_mc custo,' +
                     '  ((pvp.vltot_ped_nf + pvp.rateio_acresc - pvp.rateio_desc) / pvp.quant_ped_item) valor,' +
                     ' pvp.quant_ped_item qtde_usar,' +
                     ' iif(pv.tipo = ''OS'', pv.tipo_os, pv.tipv) tipv,' +
                     ' pv.data_ped, pr.num_fab_prod, pr.grupo_prod, pr.cod_prod, pv.cod_cliente, pvp.nitem' +
                     ' from pedvenda pv' +
                     ' inner join pedvenda_prod pvp on pvp.nped = pv.nped and pvp.tipo = pv.tipo and pvp.cod_empresa = pv.cod_empresa' +
                     ' inner join produtos pr on pr.grupo_prod = pvp.grupo_prod and pr.cod_prod = pvp.cod_prod and pr.cod_empresa = pvp.cod_empresa' +
                     ' where pv.cod_cliente = %d and pvp.cod_empresa = %d and pvp.tipo <> ''ORC''' +
                     ' and pv.data_fech >= %s and pv.data_fech <= %s and pv.status_ped = ''FECHADA''' +
                     ' order by pv.data_fech, pvp.nitem',
                     [CodCliente, vDadosIni.cod_empresa, date_fb(DataIni), date_fb(DataFim)]);
  TFloatField(FVendas.dataSet.FieldByName('qtde')).DisplayFormat      := '#,###,###,##0.000';
  TFloatField(FVendas.dataSet.FieldByName('qtde_usar')).DisplayFormat := '#,###,###,##0.000';
  TFloatField(FVendas.dataSet.FieldByName('custo')).DisplayFormat     := '#,###,###,##0.000000';
  TFloatField(FVendas.dataSet.FieldByName('valor')).DisplayFormat     := '#,###,###,##0.000000';
  FVendas.dataSet.AfterInsert                                        := dataSetVendasBerofeInser;
end;

function TManutencaoInventario.IncluirItensDaVenda(
  UsarValorUn: Boolean): Boolean;
var
  PedVendaPosse: TPedvenda_inv_posse_class;
  ListaItens   : TObjectList;
  Item         : TItemInventario;
  PosseDB      : TInv_tipo74_posse_class;
  StrErros: string;
  I, J: Integer;
  Quantidade, Total: Double;
  InList: Boolean;
begin
  Result :=  False;

  if not Auditor.Processo('PRO370').Inserir.Permitido then
    Exit;

  //Validações
  StrErros      := '';
  ListaItens    := TObjectList.Create;
  PedVendaPosse := TPedvenda_inv_posse_class.Create;;
  try


    FVendas.prepare_loop('SEL = ''S''');

    try
      if FVendas.IsEmpty then
      begin
        ShowErro('Nenhum item selecionado');
        Exit;
      end;

      if NomeCliente(FVendas.fint('cod_cliente')) = '' then
      begin
        ShowErro('Cliente não encontrado. O cliente deve conter CPF ou CNPJ');
        Exit;
      end;

      while not FVendas.dataSet.Eof do
      begin
        //carregando do banco o vinculo que diz que o item da venda ja foi vinculado
        PedVendaPosse.CopyFrom(SqlOpen('select * from pedvenda_inv_posse' +
                                       ' where nped = %d and tipo = %s and cod_empresa = %d' +
                                       ' and nitem = %d and data_inv = %s',
                                       [FVendas.fint('nped'), FVendas.fstrq('tipo'), vDadosIni.cod_empresa,
                                        FVendas.fint('nitem'), fdate_fb('data_inv')]));

        if PedVendaPosse.posse_id > 0 then
          StrErros := StrErros + Format('Venda "%s" nº %d %s Item %d - %s já adicionado ao inventrário de data %s',
                                        [FVendas.fstr('tipo'), FVendas.fint('nped'), FVendas.fstr('data_fech'),
                                         FVendas.fint('nitem'), FVendas.fstr('descr_prod'), fstr('data_inv')]) + sLineBreak
        else
        begin
          //Aqui serve para agrupar os itens
          InList := False;
          Item := nil;
          for I := 0 to ListaItens.Count - 1 do with TItemInventario(ListaItens.Items[i]) do
          begin
            if (grupo_prod = FVendas.fint('grupo_prod')) and (cod_prod = FVendas.fstr('cod_prod')) then
            begin
              InList := True;
              Item := TItemInventario(ListaItens.Items[i]);
              Break;
            end;
          end;

          //Caso o item ja tenha um cadastro na tada então é carregado o registro para procurar uma posse mais abaixo
          if Item = nil then
          begin
            Item            := TItemInventario.Create;
            Item.CopyFrom(SqlOpen('select * from inv_tipo74' +
                                  ' where grupo_prod = %d and cod_prod = %s' +
                                  ' and cod_empresa = %d and data_inv = %s',
                                  [FVendas.fint('grupo_prod'), FVendas.fstr('cod_prod'),
                                   vDadosIni.cod_empresa, fdate_fb('data_inv')]));
            if Item.cod_empresa = 0  then // caso nao tenha nada no banco aqui seta os dados chaves
            begin
              Item.data_inv   := fdate('data_inv');
              Item.grupo_prod := FVendas.fint('grupo_prod');
              Item.cod_prod   := FVendas.fstr('cod_prod');
            end;
          end;

          Item.quantidade := FVendas.ffloat(IfThen(FVendas.ffloat('qtde_usar') > FVendas.ffloat('qtde'), 'qtde', 'qtde_usar'));
          Item.valor_prod := FVendas.ffloat(IfThen(UsarValorUn, 'valor', 'custo'));

          //Caso nao tenha uma posse, procura no banco o dado para alteração  
          if (VarToInt(Item.id) > 0) and (Item.Posse.id = 0) then
          begin
            PosseDB := TInv_tipo74_posse_class.Create;
            PosseDB.CopyFrom(SqlOpen('select * from inv_tipo74_posse' +
                                     ' where inv_id = %d and cod_empresa = %d and cod_cliente = %d and ind_prop = 2',
                                     [VarToInt(Item.id), vDadosIni.cod_empresa, FVendas.fint('cod_cliente')]));
            if PosseDB.id > 0 then
            begin
              Item.Posse.id          := PosseDB.id;
              Item.Posse.cod_empresa := PosseDB.cod_empresa;
              Item.Posse.qtde        := PosseDB.qtde;
              Item.Posse.valor       := PosseDB.valor;
            end;
            PosseDB.Free;
          end;

          //Aqui soma as quantidades e faz a media do custo caso o item foi repetido
          with Item.Posse do
          begin
            Quantidade  := VarToFloat(qtde) + VarToFloat(Item.quantidade);
            Total       := (VarToFloat(qtde) * VarToFloat(valor)) + (VarToFloat(Item.quantidade) * VarToFloat(Item.valor_prod));
            ind_prop    := 2;
            cod_cliente := FVendas.fint('cod_cliente');
            valor       := Total / Quantidade;
            qtde        := Quantidade;
          end;

          //aqui cria a referencia do pedido e do item
          with Item.RefVenda.New do
          begin
            nped        := FVendas.fint('nped');
            tipo        := FVendas.fstr('tipo');
            nitem       := FVendas.fint('nitem');
            data_inv    := fdate('data_inv');
            qtde_aplic  := VarToFloat(Item.quantidade);
            valor_aplic := VarToFloat(Item.valor_prod);
          end;

          if not InList then
            ListaItens.Add(Item);
        end;
        FVendas.Next;
      end;
    finally
      FVendas.prepare_loop_done();
    end;

    if StrErros <> '' then
      if ListaItens.Count = 0 then
      begin
        ShowErro('Nenhum item pode ser cadastrado %s %s %s', [sLineBreak , sLineBreak, StrErros]);
        Exit;
      end
      else if ShowConfirmacao('Alguns itens já estão cadastrados no inventário e foram desmarcados%s' +
                              '%s %s %sDeseja continuar mesmo assim?',
                              [sLineBreak, sLineBreak, StrErros, sLineBreak]) <> ID_YES then
        Exit;

    for I := 0 to ListaItens.Count - 1 do
    begin
      for J := 0 to TItemInventario(ListaItens.Items[I]).RefVenda.Count - 1 do
        with Auditor.SetChave(TItemInventario(ListaItens.Items[I]).KeyAudit) do
          Auditor.GravarMensagem(TItemInventario(ListaItens.Items[I]).DataAuditRevVnd(J));

      if not SalvarItem(TItemInventario(ListaItens.Items[I]), False) then
      begin
        RollBackTransacao;
         with Auditor.Salvar.Falha do
           GravarMensagemProcesso(Mensagem);
        Exit;
      end;
    end;

    CommitaTransacao;

    with Auditor.Salvar.Sucesso do
      GravarMensagemProcesso(Mensagem);

    FProdutos.Refresh;
    dataSet.RefreshRecord;

    Result := True;

  finally
    ListaItens.Clear;
    ListaItens.Free;
    PedVendaPosse.Free;
  end;
end;

function TManutencaoInventario.InsertItem(Item: TItemInventario): Boolean;
begin
  Result := False;

  if not Auditor.Processo('PRO368', False).Salvar.Permitido then // avulso
    Exit;

  Result := SalvarItem(Item);
end;

function TManutencaoInventario.InvProd_DataAudit: string;
begin
  Result := Format('%s %d-%s I:%d%s Q:%0.3f V:%0.4f',
                   [fstr('data_inv'),
                    Produtos.fint('grupo_prod'),
                    Produtos.fstr('cod_prod'),
                    Produtos.fint('ind_prop'),
                    IfThen(Produtos.fint('cod_cliente') > 0, ' CL:' + Produtos.fstr('cod_cliente')),
                    Produtos.ffloat('quantidade'),
                    Produtos.ffloat('valor_prod')]);
end;

function TManutencaoInventario.InvProd_KeyAudit: string;
begin  
  Result := Format('%s %d-%s I:%d',
                   [fstr('data_inv'),
                    Produtos.fint('grupo_prod'),
                    Produtos.fstr('cod_prod'),
                    Produtos.fint('ind_prop')]);
  if Produtos.fint('cod_cliente') > 0 then
    Result := Result + ' CL:' + Produtos.fstr('cod_cliente');
end;

function TManutencaoInventario.Inv_DataAudit: string;
begin
  Result := Format('%s - %f', [FormatDateTime('dd/MM/yyyy', fdate('data_inv')), ffloat('valor')]);
end;

function TManutencaoInventario.Inv_KeyAudit: string;
begin
  Result := FormatDateTime('dd/MM/yyyy', fdate('data_inv'));
end;

function TManutencaoInventario.SalvarItem(Item: TItemInventario;
  ApplyCommit: Boolean): Boolean;
var
  InvDB: TInv_tipo74_class;
  PosseDB: TInv_tipo74_posse_class;
  RefDB: TPedvenda_inv_posse_class;
  IdInv: Integer;
  I: Integer;
begin
  Result := False;

  try
    InvDB := TInv_tipo74_class.Create;
    PosseDB := TInv_tipo74_posse_class.Create;

    try

      InvDB.CopyFrom(SqlOpen('select * from inv_tipo74' +
                             ' where grupo_prod = %d and cod_prod = %s' +
                             ' and cod_empresa = %d and data_inv = %s',
                             [Item.grupo_prod, QuotedStr(Item.cod_prod),
                              vDadosIni.cod_empresa, date_fb(Item.data_inv)]));

      if InvDB.cod_empresa = 0 then
      begin
        FreeAndNil(InvDB);
        InvDB              := TInv_tipo74_class.Create;
        InvDB.cod_empresa  := vDadosIni.cod_empresa;
        InvDB.data_inv     := Item.data_inv;
        InvDB.grupo_prod   := Item.grupo_prod;
        InvDB.cod_prod     := Item.cod_prod;
        InvDB.quantidade   := Item.quantidade;
        InvDB.valor_prod   := Item.valor_prod;
        InvDB.codigo_posse := '1';
        InvDB.cnpj_posse   := '00000000000000';

        with InvDB.SQLMotor('ID') do
          IdInv := SqlInsertID(SQLInsertAutoInc, 'ID');
      end
      else if VarToInt(InvDB.id) = 0 then
      begin
        if VarToInt(Item.Posse.ind_prop) = 0 then
        begin
          ShowErro('Já existe este produto no inventário com mesma posse');
          Exit;
        end;

        IdInv := SqlInsertID('update inv_tipo74 set id = (select cod from incrementa_codigo(cod_empresa, %s))' +
                             ' where grupo_prod = %d and cod_prod = %s and cod_empresa = %d and data_inv = %s',
                             [QuotedStr('INV_TIPO74'), InvDB.grupo_prod, InvDB.cod_prod, vDadosIni.cod_empresa, date_fb(InvDB.data_inv)], 'id');

        PosseDB.qtde        := FProdutos.ffloat('quantidade');
        PosseDB.valor       := FProdutos.ffloat('valor_prod');
        PosseDB.ind_prop    := 0;
        PosseDB.inv_id      := IdInv;
        PosseDB.cod_empresa := vDadosIni.cod_empresa;
        PosseDB.ativo       := 1;
        SqlExec(PosseDB.SQLMotor().SQLInsert);

        PosseDB.Free;
        PosseDB := TInv_tipo74_posse_class.Create;
      end
      else
      begin
        if not SqlOpen('select id from inv_tipo74_posse' +
                       ' where inv_id = %d and cod_empresa = %d and coalesce(cod_cliente, 0) = %d and ind_prop = %d' +
                       ' and id <> %d',
                       [VarToInt(InvDB.id), vDadosIni.cod_empresa, VarToInt(Item.Posse.cod_cliente),
                        VarToInt(Item.Posse.ind_prop), VarToInt(Item.Posse.id)]).IsEmpty then
        begin
          ShowErro('Já existe este produto no inventário com mesma posse %s', [IfThen(VarToInt(Item.Posse.ind_prop) = 2, ' e cliente')]);
          Exit;
        end;

        IdInv := InvDB.id;
      end;

      with Item do
      begin
        if Posse.id > 0 then
          PosseDB.CopyFrom(SqlOpen('select * from inv_tipo74_posse where id = %d and cod_empresa = %d',
                                   [Posse.id, vDadosIni.cod_empresa]));

        PosseDB.qtde        := Posse.qtde;
        PosseDB.valor       := Posse.valor;
        PosseDB.cod_cliente := Posse.cod_cliente;
        PosseDB.ind_prop    := Posse.ind_prop;
        PosseDB.inv_id      := IdInv;
        PosseDB.cod_empresa := vDadosIni.cod_empresa;
        PosseDB.ativo       := 1;

        with PosseDB.SQLMotor('id') do
          if PosseDB.id = 0 then
            PosseDB.id := SqlInsertID(SQLInsertAutoInc, 'id')
          else if PosseDB.FoundChanges() then
            SqlExec(SQLUpdate);

        for I := 0 to RefVenda.Count - 1 do
          if RefVenda.Items[I].nped > 0 then
          begin
            RefDB := TPedvenda_inv_posse_class.Create;
            RefDB.CopyFrom(RefVenda.Items[I]);
            RefDB.cod_empresa := vDadosIni.cod_empresa;
            RefDB.posse_id := PosseDB.id;
            SqlExec(RefDB.SQLMotor().SQLInsert);
          end;
      end;

      if ApplyCommit then
      begin
        CommitaTransacao;
        Auditor.Salvar.Sucesso.GravarMensagem(Item.DataAudit);

        if dataSet.Active then
          dataSet.RefreshRecord;
        FProdutos.Refresh;
      end;

      Result := True;

    finally
      InvDB.Free;
      PosseDB.Free;
    end;
  except on E: Exception do
    begin
      if ApplyCommit then
      begin
        RollBackTransacao;
        with Auditor.Salvar.Falha do
          GravarMensagem(Item.DataAudit);
      end;

      Result := False;
      registraErro('TManutencaoInventario_Item.Insert ' + e.Message);
      ShowErro('Erro ao inserir produto no inventário: ' + e.Message);
    end;
  end;
end;

function TManutencaoInventario.UpdateItem(Item: TItemInventario): Boolean;
var
  InvDB: TInv_tipo74_class;
begin
  Result := False;

  if not Auditor.Processo('PRO368', False).Salvar.Permitido then // avulso
    Exit;

  try
    InvDB := TInv_tipo74_class.Create;
    try

      InvDB.CopyFrom(SqlOpen('select * from inv_tipo74' +
                             ' where grupo_prod = %d and cod_prod = %s' +
                             ' and cod_empresa = %d and data_inv = %s',
                             [Item.grupo_prod, QuotedStr(Item.cod_prod),
                              vDadosIni.cod_empresa, date_fb(Item.data_inv)]));

      if (InvDB.cod_empresa > 0) and (VarToInt(InvDB.id) = 0) then
      begin

        InvDB.id := SqlInsertID('update inv_tipo74 set id = (select cod from incrementa_codigo(cod_empresa, %s))' +
                                ' where grupo_prod = %d and cod_prod = %s and cod_empresa = %d and data_inv = %s',
                                [QuotedStr('INV_TIPO74'),
                                 InvDB.grupo_prod, InvDB.cod_prod, vDadosIni.cod_empresa, date_fb(InvDB.data_inv)], 'id');
        SqlExec(InvDB.SQLMotor().SQLUpdate);
      end;
    finally
      InvDB.Free;
    end;

    Result := SalvarItem(Item);

  except on E: Exception do
    begin
      RollBackTransacao;

      Result := False;
      registraErro('TManutencaoInventario.InsertItem ' + e.Message);
      ShowErro('Erro ao inserir produto no inventário: ' + e.Message);
    end;
  end;
end;

function TManutencaoInventario.NomeCliente(CodCliente: Integer): string;
begin
  Result := '';
  if CodCliente = 0 then
    Exit;
  
  Result := SqlOpen('select nome_cliente from clientes' +
                    ' where cod_cliente = %d and cod_empresa = %d' +
                    ' and char_length(trim(cpfcgc)) in (11,14)',
                    [CodCliente, vDadosIni.cod_empresa]).FieldByName('nome_cliente').AsString;
end;

{ TItemInventario }

constructor TItemInventario.Create;
begin
  inherited Create;
  FPosse    := TInv_tipo74_posse_class.Create;
  FRefVenda := TPedvenda_inv_posses_class.Create;
end;

destructor TItemInventario.Destroy;
begin            
  FRefVenda.Clear;
  FPosse.Free;
  FRefVenda.Free;
  inherited;
end;

function TItemInventario.DataAuditRevVnd(Index: Integer): string;
begin
  Result := Format('%s %d %s %d-%s I:%d%s Q:%0.3f V:%0.4f',
                   [FRefVenda.Items[index].tipo,
                    FRefVenda.Items[index].nped,
                    DateToStr(Self.data_inv),
                    Self.grupo_prod,
                    Self.cod_prod,
                    VarToInt(Self.Posse.ind_prop),
                    IfThen(VarToInt(Self.Posse.cod_cliente) > 0, ' CL:' + VarToStr(Self.Posse.cod_cliente)),
                    FRefVenda.Items[index].qtde_aplic,
                    FRefVenda.Items[index].valor_aplic]);
end;

function TItemInventario.DataAudit: string;
begin
  Result := Format('%s %d-%s I:%d%s Q:%0.3f V:%0.4f',
                   [DateToStr(Self.data_inv),
                    Self.grupo_prod,
                    Self.cod_prod,
                    VarToInt(Self.Posse.ind_prop),
                    IfThen(VarToInt(Self.Posse.cod_cliente) > 0, ' CL:' + VarToStr(Self.Posse.cod_cliente)),
                    VarToFloat(Self.Posse.qtde),
                    VarToFloat(Self.Posse.valor)]);
end;

function TItemInventario.KeyAudit: string;
begin
  Result := Format('%s %d-%s I:%d', [DateToStr(Self.data_inv),
                                     Self.grupo_prod,
                                     Self.cod_prod,
                                     VarToInt(Self.Posse.ind_prop)])
end;

{ TRelatorioCreditoStRet }

constructor TRelatorioCreditoStRet.Create;
begin
  inherited Create(dtmAtivo.bancoHw);
  FNotas := TDataSet_OOP.Create(dtmAtivo.bancoHw);
  notasL := TNotaRelIcmsList.Create;
end;

destructor TRelatorioCreditoStRet.Destroy;
begin
  FNotas.Free;
  notasL.Free;
  inherited;
end;

procedure TRelatorioCreditoStRet.GetMore;
begin
  skip := skip + limit;

  Self.Close;
  Self.ParamValue('first', limit)  
    .ParamValue('skip', skip)
    .Open();
end;

procedure TRelatorioCreditoStRet.InitConf;
var
  conf: TConfig_sistema_class;
  list: TStrings;
  cfop: string;
  I: Integer;
begin
  FNotas.SqlExec('delete from EFD_ICMSST_CR_CFOPS');
  conf := TConfig_sistema_class.Create;
  try
    conf := TCfg_sis.getConf('inv_cfop_compra_rel_icms', FNotas.buscas, vDadosIni.cod_empresa);
    if conf.value1_b.Text = '' then
      conf.value1_b
        .Add('1101,1102,1111,1113,1116,1117,1118,1120,1121,1122,1126,' + 
             '1251,1252,1253,1254,1255,1256,1257,1401,1403,1406,1407,1551,1556,1651,1652,1653,' + 
             '2101,2102,2111,2113,2116,2117,2118,2120,2121,2122,2126,' + 
             '2251,2252,2253,2254,2255,2256,2257,2401,2403,2406,2407,2551,2556,2651,2652,2653,' + 
             '3101,3102,3126,3127,3217,3251,3551,3556,3651,3652,3653,1128,2128,3128,3129');
    
    list := NewStringList(StrReplace(conf.value1_b.Text, [sLineBreak, ' ', '.', '-', ';', '|', '/', ':'], ','), ',');
    try
      for I := 0 to List.Count - 1 do
      begin
        cfop := Trim(list[I]);
        if (Length(cfop) = 4) and (OnlyNumber(cfop) = cfop) then               
          FNotas.SqlExec('insert into EFD_ICMSST_CR_CFOPS values (%s)', [cfop]);
      end;      
    finally
      list.Free;
    end;   
    
  finally
    conf.Free;
  end;  
end;

function TRelatorioCreditoStRet.Start(dataInv: TDateTime): Integer;
begin
  InitConf;

  skip := 0;
  limit := 500;

  FSumMercadorias := 0;
  FSumBaseST := 0;
  FSumCreditoST := 0;
  FSumCreditoICMS := 0;
  dataInventario := dataInv;

  Result := Self
    .SqlScalar('select count(*) from inv_tipo74 i' +
               ' inner join produtos p on p.grupo_prod = i.grupo_prod and p.cod_prod = i.cod_prod and p.cod_empresa = i.cod_empresa' +
               ' inner join empresa e on e.cod_empresa = p.cod_empresa' +
               ' left join inv_tipo74_posse ip on ip.inv_id = i.id and ip.cod_empresa = i.cod_empresa and ip.ind_prop in (0,1)' +
               ' left join nbm n on n.cod_ncm = p.nbm' +
               ' left join estados uf on uf.codigo_uf = e.uf_emp' +
               ' where i.data_inv = %s and i.cod_empresa = %d', [date_fb(dataInv), vDadosIni.cod_empresa]).AsInteger;

  Self.Close;
  Self.SQLClient(
    Format('select first :first skip :skip' +    
           ' p.grupo_prod, p.cod_prod,  p.num_fab_prod, p.nbm ncm, p.cest, p.unidade,p.descr_prod,' +
           ' iif(p.icm_prod > 0, p.icm_prod, iif(n.aliq_intra > 0, n.aliq_intra, uf.aliq_intra)) aliquota,' +
           ' sum(i.quantidade) quantidade,' +
           ' sum(iif(ip.id is null, i.quantidade * i.valor_prod, ip.qtde * ip.valor)) valor' +
           ' from inv_tipo74 i' +
           ' inner join produtos p on p.grupo_prod = i.grupo_prod and p.cod_prod = i.cod_prod and p.cod_empresa = i.cod_empresa' +
           ' inner join empresa e on e.cod_empresa = p.cod_empresa' +
           ' left join inv_tipo74_posse ip on ip.inv_id = i.id and ip.cod_empresa = i.cod_empresa and ip.ind_prop in (0,1)' +
           ' left join nbm n on n.cod_ncm = p.nbm' +
           ' left join estados uf on uf.codigo_uf = e.uf_emp' +
           ' where i.data_inv = %s and i.cod_empresa = %d' +
           //' and i.cod_prod in (''00280'', ''01272'', ''02704'', ''01473'', ''03405'', ''00540'', ''00786'')' +                                    // linha comentario para testes
           ' group by 1,2,3,4,5,6,7,8' +
           ' order by ncm, grupo_prod, cod_prod', [date_fb(dataInv), vDadosIni.cod_empresa]))
    .ParamValue('first', limit)
    .ParamValue('skip', skip)
    .Open();

  
end;

procedure TRelatorioCreditoStRet.StartNotas;
var
  estoque, qtdNf, fator: Double;
  iLimit, iSkip: Integer;
  nfit: TNotaRelIcms;
begin
  iSkip := 0;
  iLimit := 100;
  estoque := ffloat('quantidade');

  notasL.Reset;
  
  FNotas.Close;
  FNotas.SQLClient(
    Format('select first :first skip :skip n.chave_nfe, ni.ucom, ni.qcom, ni.referencia, ni.quantidade,' +
           ' ni.qtdemb, ni.unidade_nf, ni.qtdembrec, ni.valor_total,' +
           ' ni.base_icm, ni.valor_icm, ni.icm_vbc, ni.icm_vicm,' +
           ' ni.antec_trib, ni.base_icmsub, ni.valor_icmsub, ni.perc_red_prod_sub,' +
           ' ni.icm_vbcst, ni.icm_vicmst, ni.icm_predbcst,' +
           ' n.import_xml' +
           ' from notafiscal n' +
           ' inner join notafiscal_item ni on ni.cod_nf = n.cod_nf and ni.cod_empresa = n.cod_empresa' +
           ' inner join efd_icmsst_cr_cfops cf on cf.cfop = ni.codigo_nop' +
           ' where n.natureza_nf = ''E'' and n.tipo_nf = ''P'' and n.status = ''Fechada'' and coalesce(n.da, ''N'') <> ''S''' +
           ' and n.emissao_propria = ''N'' and n.data_lanc <= %s and n.cod_empresa = %d' +
           ' and ni.grupo_prod = :grupo_prod and ni.cod_prod = :cod_prod' +
           ' order by n.data_lanc desc, ni.nitem desc', [datet_fb(dataInventario), vDadosIni.cod_empresa]))
    .ParamValue('grupo_prod', fint('grupo_prod'))
    .ParamValue('cod_prod', fstr('cod_prod'))
    .ParamValue('first', iLimit)
    .ParamValue('skip', iSkip)
    .Open();   

  while True do
  begin
    if (FNotas.IsEmpty) or (estoque <= 0) then
      Break;
  
    FNotas.First;
    while not FNotas.Eof do
    begin
      nfit := notasL.New;

      nfit.ChaveNfe := FNotas.fstr('chave_nfe');
      nfit.QtdePrinc := FNotas.ffloat('quantidade'); 
      nfit.Valor := FNotas.ffloat('valor_total');

      if (not FNotas.fempty('ucom')) and (FNotas.ffloat('qcom') > 0) then
      begin
        nfit.Fator := FNotas.ffloat('quantidade') / FNotas.ffloat('qcom');
        nfit.UnidadeNf := FNotas.fstr('ucom');
        nfit.QtdeItem := FNotas.ffloat('qcom'); 
      end
      else if (not FNotas.fempty('unidade_nf')) and (FNotas.ffloat('qtdembrec') > 0) then
      begin  
        nfit.Fator := FNotas.ffloat('quantidade') / FNotas.ffloat('qtdembrec');
        nfit.UnidadeNf := FNotas.fstr('unidade_nf');
        nfit.QtdeItem := FNotas.ffloat('qtdembrec');       
      end
      else
      begin                                                
        nfit.Fator := 1;
        nfit.UnidadeNf := FNotas.fstr('referencia');
        nfit.QtdeItem := FNotas.ffloat('quantidade');       
      end;  

      if (FNotas.ffloat('icm_vbcst') > 0) and (FNotas.ffloat('icm_vicmst') > 0) then
      begin
        nfit.BaseST  := FNotas.ffloat('icm_vbcst');       
        nfit.Credito := FNotas.ffloat('icm_vicmst');       
        nfit.RedBas  := FNotas.ffloat('icm_predbcst');       
      end
      else if (FNotas.ffloat('base_icmsub') > 0) and (FNotas.ffloat('valor_icmsub') > 0) then
      begin
        nfit.BaseST  := FNotas.ffloat('base_icmsub');       
        nfit.Credito := FNotas.ffloat('valor_icmsub');       
        nfit.RedBas  := FNotas.ffloat('perc_red_prod_sub');       
      end;        

      if (FNotas.ffloat('icm_vicm') > 0) then
        nfit.Vicms := FNotas.ffloat('icm_vicm')
      else if (FNotas.ffloat('valor_icm') > 0) then
        nfit.Vicms := FNotas.ffloat('valor_icm');       
           
      if nfit.QtdePrinc >= estoque then
      begin
        nfit.QtdeUtil := estoque;
        estoque := 0;
      end
      else
      begin
        nfit.QtdeUtil := nfit.QtdePrinc;
        estoque := estoque - nfit.QtdePrinc;
      end;

      if (FNotas.ffloat('quantidade') > 0)
        and (nfit.QtdeUtil > 0) then
      begin
        nfit.Valor := nfit.Valor / FNotas.ffloat('quantidade') * nfit.QtdeUtil;
        nfit.BaseST := nfit.BaseST / FNotas.ffloat('quantidade') * nfit.QtdeUtil;
        nfit.Credito := nfit.Credito / FNotas.ffloat('quantidade') * nfit.QtdeUtil;
        nfit.Vicms := nfit.Vicms / FNotas.ffloat('quantidade') * nfit.QtdeUtil;
      end;

      if estoque <= 0 then
        Break;

      FNotas.Next;
    end;
    
    if estoque <= 0 then
      Break;

    iSkip := iSkip + iLimit;

    FNotas.Close;
    FNotas.ParamValue('first', iLimit)
      .ParamValue('skip', iSkip)
      .Open();
  end;

  notasL.Totalizar;

  //FSumMercadorias := FSumMercadorias + notasL.TotalMercadorias;//ffloat('valor');
  FSumMercadorias := FSumMercadorias + ffloat('valor');
  FSumBaseST := FSumBaseST + notasL.TotalBaseST;
  FSumCreditoST := FSumCreditoST + notasL.TotalCreditoCalcST;
  FSumCreditoICMS := FSumCreditoICMS + notasL.TotalCreditoCalcICMS;

  FNotas.Close;
end;


{ TNotaRelIcmsList }

function TNotaRelIcmsList.Current: TNotaRelIcms;
begin
  Result := nil;

  if (Self.Count = 0) or (iIndex = -1) then
    Exit;

  if iIndex > (Self.Count - 1) then
    Exit;

  Result := Self.Items[iIndex];
end;

function TNotaRelIcmsList.GetItem(Index: Integer): TNotaRelIcms;
begin
  Result := TNotaRelIcms(inherited Items[Index]);
end;

function TNotaRelIcmsList.New: TNotaRelIcms;
begin
  Result := TNotaRelIcms.Create;
  Add(Result);

  if iIndex = -1  then
    iIndex := 0;
end;

function TNotaRelIcmsList.Next: TNotaRelIcms;
begin
  Result := nil;

  if Self.Count = 0 then
    Exit;

  iIndex := iIndex + 1;
  if iIndex > (Self.Count - 1) then
    Exit;

  Result := Self.Items[iIndex];  
end;

function TNotaRelIcmsList.PrintTotais: Integer;
begin
  Result := FprintTotais;
  FprintTotais := FprintTotais + 1
end;

procedure TNotaRelIcmsList.Reset;
begin
  Self.Clear;
  iIndex := -1;
  FprintTotais := 0;
end;

procedure TNotaRelIcmsList.SetItem(Index: Integer; const Value: TNotaRelIcms);
begin
  Put(Index, Value);
end;

procedure TNotaRelIcmsList.Totalizar;
var
  I: Integer;
begin
  FTotalMercadorias := 0;
  FTotalBaseST := 0;
  FTotalCreditoCalcST := 0;
  FTotalCreditoCalcICMS := 0;
  FValorMercadoriaUnitario := 0;
  FBaseSTUnitario := 0;
  FCreditoUnitario := 0;
  FCreditoICMSUnitario := 0;
  FQtdeEstoque := 0;

  for I := 0 to Self.Count - 1 do
  begin
    FQtdeEstoque          := FQtdeEstoque          + Self.Items[I].QtdeUtil;
    FTotalMercadorias     := FTotalMercadorias     + Self.Items[I].Valor;
    FTotalBaseST          := FTotalBaseST          + Self.Items[I].BaseST;
    FTotalCreditoCalcST   := FTotalCreditoCalcST   + Self.Items[I].Credito;
    FTotalCreditoCalcICMS := FTotalCreditoCalcICMS + Self.Items[I].Vicms;
  end;

  if FQtdeEstoque > 0 then
  begin
    FValorMercadoriaUnitario := FTotalMercadorias     / FQtdeEstoque;
    FBaseSTUnitario          := FTotalBaseST          / FQtdeEstoque;
    FCreditoUnitario         := FTotalCreditoCalcST   / FQtdeEstoque;
    FCreditoICMSUnitario     := FTotalCreditoCalcICMS / FQtdeEstoque;
  end;
end;

end.

