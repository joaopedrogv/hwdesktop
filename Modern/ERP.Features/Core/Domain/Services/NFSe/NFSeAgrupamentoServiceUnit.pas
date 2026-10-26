unit NFSeAgrupamentoServiceUnit;

interface

uses
  INFSeAgrupamentoServiceUnit, OSItemFiscalEtdUnit, TipoComunsUnit;

type
  NFSeAgrupamentoService = class(TInterfacedObject, INFSeAgrupamentoService)
  private
  public
    function AgruparItensParaNFSe(
      const ItensFiscais: OSItemFiscalEtdlList;
      AgruparPorCTribNac: Boolean
    ): NFSeAgrupamentosOS;
  end;

implementation

uses
  SysUtils, Contnrs, Classes,
  ArrayServiceUnit, NumberServiceUnit;

type
  TAgrupamento = class
    // Controle do agrupamento
    ClienteId: Integer;
    CodigoFiscal: string;
    // Somatorio do agrupamento
    ValorServicos: Currency;
    ValorDescontos: Currency;
    ValorTerceiro: Currency;
    // Numeros da OSs
    RegistrosOS: NFSeRegistroOSArray;
    //OSIDsArray: tarr

    ItemBase: OSItemFiscalEtd;

    constructor Create(const Input: OSItemFiscalEtd; const CodigoFiscal: string); overload;
    destructor Destroy(); override;
    procedure Somar(const AServ, ADesc, ATerc: Currency; AOSId: Integer; const AServicosId: TArrayInteger);
  end;

  TAgrupamentoList = class(TObjectList)
  public
    function FindByChave(AClienteId: Integer; const ACodigoFiscal: string): TAgrupamento;
  end;

  TTotal = record
    OS: Integer;
    Servicos: Currency;
    Terceiros: Currency;
    class function Create(AOS: Integer): TTotal; static;
    procedure AcumularServico(AValor: Currency);
    procedure AcumularTerceiro(AValor: Currency);
  end;

  TServico = record
    OS: Integer;
    ServicosId: TArrayInteger;
    Codigo: string;
    Valor: Currency;
    Desconto: Currency;
    Terceiro: Currency;
    class function Create(AOS: Integer; const ACodigo: string): TServico; static;
    procedure Acumular(AValor, ADesconto: Currency; AServicoId: Integer);
  end;

  TCliente = record
  private
    FClienteId: Integer;
    Totais: array of TTotal;
    Servicos: array of TServico;
    class function Create(AClienteId: Integer): TCliente; static;
  public
    procedure AdicionarItem(const Item: OSItemFiscalEtd; const CodigoFiscal: string);
    procedure ExecutarRateios();
    procedure AplicarRateio(Itens: TAgrupamentoList);

    property ClienteId: Integer read FClienteId;
  end;

  TRateio = record
    Clientes: array of TCliente;
    class function Create(): TRateio; static;

    procedure AdicionarItem(const Item: OSItemFiscalEtd; const CodigoFiscal: string);
    procedure AplicarRateio(Itens: TAgrupamentoList);
  end;

{ TTotal }

procedure TTotal.AcumularServico(AValor: Currency);
begin
  Self.Servicos := Self.Servicos + AValor;
end;

procedure TTotal.AcumularTerceiro(AValor: Currency);
begin
  Self.Terceiros := Self.Terceiros + AValor;
end;

class function TTotal.Create(AOS: Integer): TTotal;
begin
  Result.OS := AOS;
  Result.Servicos := 0;
  Result.Terceiros := 0;
end;

{ TCliente }

procedure TCliente.AdicionarItem(const Item: OSItemFiscalEtd; const CodigoFiscal: string);
var
  I, iServ, iTot: Integer;
  TercJaExiste: Boolean;
begin
  if not Item.IsTerceiro then
  begin
    iServ := -1;
    for I := Low(Servicos) to High(Servicos) do
      if (Servicos[I].OS = Item.OSId)
        and (Servicos[I].Codigo = CodigoFiscal) then
      begin
        iServ := I;
        Break;
      end;

    if iServ = -1 then
    begin
      iServ := Length(Servicos);
      SetLength(Servicos, iServ + 1);
      Servicos[iServ] := TServico.Create(Item.OSId, CodigoFiscal);
    end;

    Servicos[iServ].Acumular(Item.ValorServico + Item.ValorAcrescimo, Item.ValorDesconto, Item.ServicoId.Value);
  end;

  iTot := -1;
  for I := Low(Totais) to High(Totais) do
    if Totais[I].OS = Item.OSId then
    begin
      iTot := I;
      Break;
    end;

  if iTot = -1 then
  begin
    iTot := Length(Totais);
    SetLength(Totais, iTot + 1);
    Totais[iTot] := TTotal.Create(Item.OSId);
  end;

  if Item.IsTerceiro then
    Totais[iTot].AcumularTerceiro(Item.ValorLiquido)
  else
    Totais[iTot].AcumularServico(Item.ValorLiquido);
end;

class function TCliente.Create(AClienteId: Integer): TCliente;
begin
  Result.FClienteId := AClienteId;
  SetLength(Result.Totais, 0);
  SetLength(Result.Servicos, 0);
end;

procedure TCliente.AplicarRateio(Itens: TAgrupamentoList);
var
  I: Integer;
  Temp: TAgrupamento;
begin
  for I := 0 to High(Servicos) do
  begin
    Temp := Itens.FindByChave(FClienteId, Servicos[I].Codigo);
    if Temp <> nil then
      Temp.Somar( Servicos[I].Valor, Servicos[I].Desconto, Servicos[I].Terceiro, Servicos[I].OS, Servicos[I].ServicosId );
  end;
end;

procedure TCliente.ExecutarRateios;
var
  iTot, iServ, iLastServ: Integer;
  vTerc, vRat: Currency;
begin
  for iTot := Low(Totais) to High(Totais) do
    if Totais[iTot].Terceiros > 0 then
    begin
      vTerc := Totais[iTot].Terceiros; // Valor que vai ser diminuido
      iLastServ := -1;

      // Marcar o ultimo item que vai ficar com o resto do valor do rateio
      for iServ := High(Servicos) downto Low(Servicos) do
        if Totais[iTot].OS = Servicos[iServ].OS then
        begin
          iLastServ := iServ;
          Break;
        end;

      // Percorrendo os itens e aplicando os rateios
      for iServ := Low(Servicos) to High(Servicos) do
        if Totais[iTot].OS = Servicos[iServ].OS then
          if iServ = iLastServ then
          begin
            Servicos[iServ].Terceiro := vTerc;
            Break;
          end
          else
          begin // valor servico individual / valor servico total * valor total terceiros
            vRat := (Servicos[iServ].Valor - Servicos[iServ].Desconto) / Totais[iTot].Servicos * Totais[iTot].Terceiros;
            Servicos[iServ].Terceiro := NumberService.RoundHalfUpTo2(vRat);
            vTerc := vTerc - Servicos[iServ].Terceiro;
          end;
    end;
end;

{ TServico }

procedure TServico.Acumular(AValor, ADesconto: Currency; AServicoId: Integer);
begin
  Self.Valor := Self.Valor + AValor;
  Self.Desconto := Self.Desconto + ADesconto;

  if not ArrayService.Contains(ServicosId, AServicoId) then
  begin
    SetLength(ServicosId, Length(ServicosId) + 1);
    ServicosId[High(ServicosId)] := AServicoId;
  end;
end;

class function TServico.Create(AOS: Integer; const ACodigo: string): TServico;
begin
  Result.OS := AOS;
  Result.Codigo := ACodigo;
  Result.Valor := 0;
  Result.Desconto := 0;
  Result.Terceiro := 0;
  SetLength(Result.ServicosId, 0);
end;

{ TRateio }

class function TRateio.Create: TRateio;
begin
  SetLength(Result.Clientes, 0);
end;

procedure TRateio.AplicarRateio(Itens: TAgrupamentoList);
var
  I: Integer;
begin
  for I := Low(Clientes) to High(Clientes) do
  begin
    Clientes[I].ExecutarRateios();
    Clientes[I].AplicarRateio( Itens );
  end;
end;

procedure TRateio.AdicionarItem(const Item: OSItemFiscalEtd; const CodigoFiscal: string);
var
  I, iCliente: Integer;
begin
  iCliente := -1;
  for I := Low(Clientes) to High(Clientes) do
    if Item.ClienteId = Clientes[I].ClienteId then
    begin
      iCliente := I;
      break;
    end;

  if iCliente = -1 then
  begin
    iCliente := Length(Clientes);
    SetLength(Clientes, iCliente + 1);
    Clientes[iCliente] := TCliente.Create( Item.ClienteId );
  end;

  Clientes[iCliente].AdicionarItem(Item, CodigoFiscal);
end;

{ TAgrupamento }

constructor TAgrupamento.Create(const Input: OSItemFiscalEtd; const CodigoFiscal: string);
begin
  Self.ClienteId := Input.ClienteId;
  Self.CodigoFiscal := CodigoFiscal;
  //
  Self.ValorServicos := 0;
  Self.ValorDescontos := 0;
  Self.ValorTerceiro := 0;
  //
  SetLength(RegistrosOS, 0);
  //
  ItemBase := OSItemFiscalEtd( Input.Clone() );
end;

destructor TAgrupamento.Destroy;
begin
  ItemBase.Free();
  inherited;
end;

procedure TAgrupamento.Somar(const AServ, ADesc, ATerc: Currency; AOSId: Integer; const AServicosId: TArrayInteger);
var
  I, J: Integer;
  AInt: TArrayInteger;
begin
  ValorServicos := ValorServicos + AServ;
  ValorDescontos := ValorDescontos + ADesc;
  ValorTerceiro := ValorTerceiro + ATerc;

  for I := 0 to High(RegistrosOS) do
    if RegistrosOS[I].NumeroOS = AOSId then
    begin
      RegistrosOS[I].Acumular(AServ + ATerc, ADesc);
      for J := 0 to High(AServicosId) do
        RegistrosOS[I].AddServicoId( AServicosId[J] );

      Exit;
    end;

  I := Length(RegistrosOS);
  SetLength(RegistrosOS, I + 1);
  RegistrosOS[I] := NFSeRegistroOS.Create( AOSId );
  RegistrosOS[I].Acumular(AServ + ATerc, ADesc);
  for J := 0 to High(AServicosId) do
    RegistrosOS[I].AddServicoId( AServicosId[J] );
end;

{ TAgrupamentoList }

function TAgrupamentoList.FindByChave(AClienteId: Integer; const ACodigoFiscal: string): TAgrupamento;
var
  I: Integer;
  IT: TAgrupamento;
begin
  Result := nil;
  for I := 0 to Self.Count - 1 do
  begin
    IT := TAgrupamento(Self.Items[I]);
    if (IT.ClienteId = AClienteId) and
       (IT.CodigoFiscal = ACodigoFiscal) then
    begin
      Result := IT;
      Exit;
    end;
  end;
end;

{ NFSeAgrupamentoService }

function NFSeAgrupamentoService.AgruparItensParaNFSe(
  const ItensFiscais: OSItemFiscalEtdlList;
  AgruparPorCTribNac: Boolean
): NFSeAgrupamentosOS;
var
  Agrupamentos: TAgrupamentoList;
  ItemGrupo: TAgrupamento;
  Item: OSItemFiscalEtd;
  I: Integer;
  CodigoFiscal: string;
  rateio: TRateio;
begin
  rateio := TRateio.Create();
  Agrupamentos := TAgrupamentoList.Create(True);
  try
    // 1. Separa itens de terceiros e agrupa itens normais
    for I := 0 to ItensFiscais.Count - 1 do
    begin
      Item := ItensFiscais.Items[I];

      if not Item.IsTerceiro then
      begin
        // Determina código fiscal a usar
        if AgruparPorCTribNac then
          CodigoFiscal := Item.CTribNac
        else
          CodigoFiscal := Item.CLC116;

        ItemGrupo := Agrupamentos.FindByChave(Item.ClienteId, CodigoFiscal);

        if ItemGrupo = nil then
        begin
          ItemGrupo := TAgrupamento.Create(Item, CodigoFiscal);
          Agrupamentos.Add(ItemGrupo);
        end;
      end;

      rateio.AdicionarItem(Item, CodigoFiscal);
    end;

    rateio.AplicarRateio( Agrupamentos );

    SetLength(Result, Agrupamentos.Count);

    for I := 0 to Agrupamentos.Count - 1 do
    begin
      ItemGrupo := TAgrupamento(Agrupamentos[I]);

      Result[I] := NFSeAgrupamentoOS.Create(
        ItemGrupo.ClienteId,
        ItemGrupo.ItemBase.ServicoId.Value,
        ItemGrupo.ItemBase.DataFechamento,
        ItemGrupo.ValorServicos + ItemGrupo.ValorTerceiro,
        ItemGrupo.ValorDescontos,
        ItemGrupo.CodigoFiscal,
        ItemGrupo.RegistrosOS
      );
    end;

  finally
    Agrupamentos.Free();
  end;
end;

end.
