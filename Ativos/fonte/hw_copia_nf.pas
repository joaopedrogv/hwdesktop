unit hw_copia_nf;

interface

uses
  hw_icopia_nf,
  hw_copia_nf_models,
  hw_const_types,
  DB;

type

  TClipBoardItem = class(TInterfacedObject, IClipBoardItem)
  private
    FNota: TNFModel;
    FProds: TNFProdList;
    function GetProds: TNFProdList;
    procedure SetProds(const Value: TNFProdList);
    function GetNota: TNFModel;
    procedure SetNota(const Value: TNFModel);
  public
    constructor Create();
    //constructor Create(ACopyProps: TNewCopyProps); overload;
    destructor Destroy; override;

    property Nota: TNFModel read GetNota write SetNota;
    property Prods: TNFProdList read GetProds write SetProds;

    class function New(): IClipBoardItem;
  end;

  TClipBoardCopiador = class(TInterfacedObject, IClipBoardCopiador)
  private
    FNota: TNFModel;
    FProds: TNFProdList;
    FItems: IClipBoardItems;
  public
    function GetCount: Integer;
    function GetItems(Index: Integer): IClipBoardItem;
    procedure SetItems(Index: Integer; const Value: IClipBoardItem);
    function GetNota: TNFModel;
    function GetProds: TNFProdList;
  public
    constructor Create();
    destructor Destroy; override;

    function Add(Value: IClipBoardItem): IClipBoardCopiador;
    function NewItem(): IClipBoardItem;
    procedure Delete(const Index: Integer; ACount: Integer = 1);
    function FindProd(nfId, nitemNf: Integer; out indexProd: Integer): IClipBoardItem;


    property Nota: TNFModel read GetNota;
    property Prods: TNFProdList read GetProds;
    property Items[Index: Integer]: IClipBoardItem read GetItems write SetItems;
    property Count: Integer read GetCount;

    class function New(): IClipBoardCopiador;
  end;

  TCopiadorNF = class(TInterfacedObject, ICopiadorNF)
  private
    FClipBoardNF: IClipBoardCopiador;
    FAlreadyAsked, FCopyAnyWay: Boolean;
    function GetClipBoardNF: IClipBoardCopiador;
    procedure SetClipBoardNF(const Value: IClipBoardCopiador);
  public
    constructor Create();

    // recNoDtsNF: Vai vai servir para indicar ao metodo que deve armazenar as respostas na classe, pois está em loop a sua chamada
    // na primeira chamad o loop sempre passar "0" para resetar as variaveis globais, depois qualquer valor maior que zero
    function CopyFrom(dsetNF, dsetItemNF: TDataSet; ALogEvent: TLogEvent; recNoDtsNF: Integer = 0): Boolean;
    function NewCopy(props: TNewCopyProps): IClipBoardItem;

    property ClipBoardNF: IClipBoardCopiador read GetClipBoardNF write SetClipBoardNF;
    class function New: ICopiadorNF;
  end;

var
  GlobalCopiadorNF: ICopiadorNF;

implementation

uses
  Contnrs, Classes, SysUtils, StrUtils, Controls, Variants, hw_confirmacao, Math,
  nf_class, nf_item_class, hw_utils;

{ TClipBoardItem }

function TClipBoardItem.GetProds: TNFProdList;
begin
  Result := FProds;
end;

class function TClipBoardItem.New: IClipBoardItem;
begin
  Result := TClipBoardItem.Create;
end;

constructor TClipBoardItem.Create;
begin
  FProds := TNFProdList.Create;
  FNota := TNFModel.Create(FProds);
end;

destructor TClipBoardItem.Destroy;
begin
  FProds.Clear;
  FProds.Free;

  FNota.Free;
  inherited;
end;

function TClipBoardItem.GetNota: TNFModel;
begin
  Result := FNota;
end;

procedure TClipBoardItem.SetProds(const Value: TNFProdList);
begin
  FProds := Value;
end;

procedure TClipBoardItem.SetNota(const Value: TNFModel);
begin
  FNota := Value;
end;

{ TClipBoardCopiador }

function TClipBoardCopiador.Add(Value: IClipBoardItem): IClipBoardCopiador;
begin
 SetLength(FItems, Self.Count + 1);
 FItems[High(FItems)] := Value;
end;

constructor TClipBoardCopiador.Create;
begin
  SetLength(FItems, 0);
  FProds := TNFProdList.Create;
  FNota := TNFModel.Create(FProds);
end;

procedure TClipBoardCopiador.Delete(const Index: Integer;
  ACount: Integer);
var
  Alen, I: Integer;
begin
  Alen := Count;
  Assert(Alen > 0);
  Assert(ACount > 0);
  Assert(ACount <= Alen - Index);
  Assert(Index < Alen);
  // 0: A  1: HIAI  2: JSHS  3: aJJS

  for I := Index + ACount to Alen - 1 do
  begin
    // ? FItems[I - Count]._Release;
    // ? FItems[I - Count].Nota.Free;

    FItems[I - Count] := FItems[I];
  end;
end;

destructor TClipBoardCopiador.Destroy;
begin
  if Assigned(FNota) then
    Nota.Free;

  FProds.Clear;
  FProds.Free;
  
  inherited;
end;

function TClipBoardCopiador.FindProd(nfId, nitemNf: Integer;
  out indexProd: Integer): IClipBoardItem;
var
  iNF, iIt: Integer;
begin
  Result := nil;
  for iNF := 0 to Self.Count - 1 do
    if Self.Items[iNF].Nota.cod_nf = nfId then
      for iIt := 0 to Self.Items[iNF].Prods.Count - 1 do
        if Self.Items[iNF].Prods.Items[iIt].nitem = nitemNf then
        begin
          Result := Self.Items[iNF];
          indexProd := iIt;
          Break;
        end;
end;

function TClipBoardCopiador.GetCount: Integer;
begin
  Result := Length(FItems);
end;

function TClipBoardCopiador.GetItems(Index: Integer): IClipBoardItem;
begin
  Result := FItems[Index];
end;

function TClipBoardCopiador.GetNota: TNFModel;
begin
  Result := FNota;
end;

function TClipBoardCopiador.GetProds: TNFProdList;
begin
  Result := FProds;
end;

class function TClipBoardCopiador.New: IClipBoardCopiador;
begin
  Result := TClipBoardCopiador.Create;
end;

function TClipBoardCopiador.NewItem: IClipBoardItem;
begin
  Result := TClipBoardItem.New;
  Add(Result);
end;

procedure TClipBoardCopiador.SetItems(Index: Integer;
  const Value: IClipBoardItem);
begin
  FItems[Index] := Value
end;

{ TCopiadorNF }

function TCopiadorNF.CopyFrom(dsetNF, dsetItemNF: TDataSet;
  ALogEvent: TLogEvent;
  recNoDtsNF: Integer): Boolean;

  procedure DoLog(const Value: string);
  begin
    if Assigned(ALogEvent) then
      ALogEvent(Value);
  end;

var
  item: IClipBoardItem;
  alreadyAsked, copyAnyWay, addItem: Boolean;
  ocurrences, iIt: Integer;
  temporary: IClipBoardItem;
  customMsg: ICustomizedDialog;
  prod: TNFProd;
begin
  inherited;
  if recNoDtsNF = 0 then
    FAlreadyAsked := False;

  alreadyAsked := FAlreadyAsked;
  copyAnyWay   := FCopyAnyWay;
  DoLog('Aguarde! Copiando itens');

  ocurrences := 0;

  dsetItemNF.First;
  while not dsetItemNF.Eof do
  begin
    prod := FClipBoardNF.Prods.FindProd(dsetItemNF.FieldByName('cod_nf').AsInteger, dsetItemNF.FieldByName('nitem').AsInteger);
    if prod <> nil then
      Inc(ocurrences);

    dsetItemNF.Next;
  end;

  dsetItemNF.First;
  while not dsetItemNF.Eof do
  begin
    if not alreadyAsked then
    begin
      prod := FClipBoardNF.Prods.FindProd(dsetItemNF.FieldByName('cod_nf').AsInteger, dsetItemNF.FieldByName('nitem').AsInteger);
      if prod <> nil then
      begin
        customMsg := ShowCustomDlg.Msg(Format('Nota: %s > Item %d - %s - %s já foi adicionado. Continuar mesmo assim?%s',
          [prod.nf_str, prod.nitem, prod.num_fab_prod, prod.descricao_item,
           IfThen(ocurrences > 1, sLineBreak + 'Total de ocorrências: ' + IntToStr(ocurrences))]),
          mdtQuestion);
        if ocurrences > 1 then
          customMsg.SetBtns([brYes, brYesToAll, brNo, brNoToAll, brCancel])
        else
          customMsg.SetBtns([brYes, brNo, brCancel]);
        Inc(ocurrences, -1);

        with customMsg.Show() do
        begin
          if IsAbortResult(ResultDlg) then
          begin
            DoLog('Processo abortado');
            Exit;
          end;

          addItem := IsPositiveResult(ResultDlg);
          alreadyAsked := IsAnAllResult(ResultDlg);
          copyAnyWay := alreadyAsked and addItem;
        end;
      end
      else
        addItem := True;
    end
    else
      addItem := copyAnyWay;

    if addItem then
    begin
      if temporary = nil then
      begin
        temporary := TClipBoardItem.New;
        temporary.Nota.CopyFrom(dsetNF, False);
      end;
      prod := temporary.Prods.New;
      prod.CopyFrom(dsetItemNF, False);
      prod.OrigemItemNF := TNFProdOrigem.Create( prod.cod_nf, prod.cod_empresa, prod.nitem );
      prod.nf_str := Format('%s - %d - %s - Emp %d',
        [DateToStr(VarToDateTime(temporary.Nota.data_lanc)), temporary.Nota.num_nf,
         IfThen(temporary.Nota.natureza_nf = 'E', 'Entrada', 'Saída'), prod.cod_empresa]);
      prod.CalcularQtdeSel();
    end;

    dsetItemNF.Next;
  end;

  FAlreadyAsked := alreadyAsked;
  FCopyAnyWay   := copyAnyWay;

  if temporary <> nil then
  begin
    temporary.Prods.OwnsObjects := False;
    FClipBoardNF.Prods.AddRange(temporary.Prods);
    if FClipBoardNF.Nota.cod_cliente = 0 then
      FClipBoardNF.Nota.CopyFrom(temporary.Nota);
  end;

  DoLog('Copia finalizada');

end;

constructor TCopiadorNF.Create;
begin
  FClipBoardNF := TClipBoardCopiador.New;
end;

function TCopiadorNF.GetClipBoardNF: IClipBoardCopiador;
begin
  Result := FClipBoardNF;
end;

class function TCopiadorNF.New: ICopiadorNF;
begin
  Result := TCopiadorNF.Create;
end;

function TCopiadorNF.NewCopy(props: TNewCopyProps): IClipBoardItem;

  procedure DoLog(const Value: string);
  begin
    if Assigned(props.OnLog) then
      props.OnLog(Value);
  end;

var
  I: Integer;
  prod: TNFProd;

  nota: TNFModel;
  prods: TNFProdList;
  firstDigIPI: string;

  AgruparProdutos: Boolean;

//  sEouS: string;
//  iClienteId: Integer;
//  isDev: Boolean;
begin
  inherited;

  // Apenas "TfrmCadNFCopiador.ContinuarComNotaFiscal" esta usando os dados do objeto Nota, e apenas quando é criada uma nova nota, veja que são poucos campos atribuidos

  Result := TClipBoardItem.New;

  nota := Result.Nota;
  prods := Result.Prods;

  if ClipBoardNF.Prods.Count = 0 then
    raise Exception.Create('Nenhum item na área de transferência');

  if props.ClienteId = 0 then
    raise Exception.Create('Informe o Destinatário/Rementente antes de continuar');

  if not MatchStr(props.EouS, ['E', 'S']) then
    raise Exception.Create('Entrada("E") ou Saída("S") precisa ser informada antes de continuar');

  if props.IsDev then
    DoLog('Calculando Nota fiscal de devolução')
  else
    DoLog('Calculando itens na nota fiscal');

  nota.natureza_nf        := props.EouS;
  nota.cod_cliente        := props.ClienteId;
  nota.tipo_emissao       := IfThen(props.IsDev, '4', '1');
  nota.nfe_indiedest      := ClipBoardNF.Nota.nfe_indiedest;
  nota.nfe_iddest         := ClipBoardNF.Nota.nfe_iddest;
  nota.dest_uf            := ClipBoardNF.Nota.dest_uf;
  nota.codigo_nop         := ClipBoardNF.Prods.Items[0].ToCfop(props.NatOp);
  nota.verificar_mud_cfop := IfThen(props.NatOp in [nopNone, nopCompraVenda], 'S', 'N');

  if props.IsDev then
  begin
    //nota.codigo_nop   := nota.ToCfopDevolucao(ClipBoardNF.Prods.Items[0].codigo_nop, ClipBoardNF.Prods.Items[0].cst);
    nota.codigo_nop   := ClipBoardNF.Prods.Items[0].ToCfop(nopDevolucao);
    nota.devolucao    := 'SIM';
    nota.tipo_emissao := '4';
  end;
  //else
    //nota.codigo_nop  := nota.ToCfop(ClipBoardNF.Prods.Items[0].codigo_nop);

  for I := 0 to ClipBoardNF.Prods.Count - 1 do
  begin
    prod := nil;

    AgruparProdutos := props.AgruparProdutos and (nota.tipo_emissao <> '4') and (not props.ManterCalcTrib);

    if AgruparProdutos then
      prod := nota.prods.FindProd(
        VarToInt(ClipBoardNF.Prods.Items[I].grupo_prod),
        VarToStr(ClipBoardNF.Prods.Items[I].cod_prod));

    if prod <> nil then
      prod.Acumular(ClipBoardNF.Prods.Items[I])
    else
    begin
      prod := nota.prods.New;
      prod.CopyFrom(ClipBoardNF.Prods.Items[I]);
      prod.OrigemItemNF := TNFProdOrigem.Create( ClipBoardNF.Prods.Items[I].cod_nf, ClipBoardNF.Prods.Items[I].cod_empresa, ClipBoardNF.Prods.Items[I].nitem );

      prod.OwnerNF := nota;

      if props.ReferenciarPorItem then
      begin
        prod.chave_nfe_ref := ClipBoardNF.Nota.chave_nfe;
        prod.nitem_nfe_ref := VarToInt(ClipBoardNF.Prods.Items[I].nitem_xml);
        if VarToInt(prod.nitem_nfe_ref) = 0 then
          prod.nitem_nfe_ref := ClipBoardNF.Prods.Items[I].nitem;
      end;

      prod.LimparDadosDeVinculos;

      DoLog('Calculando item ' + prod.descricao_item);

      prod.nitem       := nota.prods.Count;
      prod.cod_nf      := nota.cod_nf;
      prod.cod_empresa := nota.cod_empresa;

      // TTipoCalculo = (0 = tcCompleto, 1 = tcParcial, 2 = tcNenhum);
      if props.ManterCalcTrib then
      begin
        prod.tipo_calc        := IfThen(VarToInt(prod.tipo_calc       ) = 0, 1, VarToInt(prod.tipo_calc)); // para não efetuar calculos e permanecer com o valor original
        prod.tipo_calc_pc     := IfThen(VarToInt(prod.tipo_calc_pc    ) = 0, 1, VarToInt(prod.tipo_calc_pc));
        prod.tipo_calc_retfed := IfThen(VarToInt(prod.tipo_calc_retfed) = 0, 1, VarToInt(prod.tipo_calc_retfed));
      end
      else
      begin
        prod.tipo_calc        := 0;
        prod.tipo_calc_pc     := 0;
        prod.tipo_calc_retfed := 0;
      end;

      prod.codigo_nop := prod.ToCfop(props.NatOp);

      if nota.tipo_emissao = '4' then
      begin
        //prod.codigo_nop    := nota.ToCfopDevolucao(ClipBoardNF.Prods.Items[I].codigo_nop, ClipBoardNF.Prods.Items[I].cst);
        prod.cod_nf_dev    := ClipBoardNF.Prods.Items[I].cod_nf;
        prod.nitem_dev     := ClipBoardNF.Prods.Items[I].nitem;
        prod.nfe_pdevol    := 100;
        prod.nfe_vipidevol := prod.valor_ipi;
        prod.valor_ipi     := 0;
        prod.aliq_ipi      := 0;
        prod.base_ipi      := 0;
        if (nota.natureza_nf = 'S') and (props.IsSN) and
          ((prod.valor_icm > 0) or (prod.valor_icmsub > 0)) then
        begin
          prod.cst := Copy(prod.cst, 1, 1) + '90';
          prod.csosn := '900';
        end;
      end;
      //else
        //prod.codigo_nop := nota.ToCfop(ClipBoardNF.Prods.Items[I].codigo_nop);

      if prod.GetEntOuSai <> ClipBoardNF.Prods.Items[I].GetEntOuSai then
      begin
        firstDigIPI := Copy(prod.cst_ipi, 1, 1);
        firstDigIPI := StrReplaceA(firstDigIPI, ['0', '5', '4', '9'], ['5', '0', '9', '4']);
        prod.cst_ipi := firstDigIPI + Copy(prod.cst_ipi, 2, 1);
      end;

      if I = 0 then
        nota.codigo_nop := prod.codigo_nop;
    end;

  end;
  DoLog('Calculando itens. Concluído');  
end;

procedure TCopiadorNF.SetClipBoardNF(const Value: IClipBoardCopiador);
begin
  FClipBoardNF := Value;
end;

initialization
  GlobalCopiadorNF := TCopiadorNF.New();

finalization

end.
