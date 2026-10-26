unit uClassesNotasFiscais_Cobranca;

interface

uses
  uDataSet_OOP,
  DB,
  DBClient,
  uClassesNotasFiscais_consts,
  Classes,
  uDadosIni;

type

  TNFCab_Pag_Forma = class(TDataSet_OOP)
  public
    constructor create;
    procedure AbreRegistros;
    function GetNomeControle(Acodigo: Integer): string;
  end;

  TNFCab_pag = class(TDataSet_OOP)
  private
    FID          : Integer;
    FOwner       : TDataSet_OOP;
    Fformas      : TNFCab_Pag_Forma;
    FlkBandeira  : TDadosLookUp_OOP;
    Ftroco       : Double;
    Ftotal       : Double;
    Ffalta       : Double;
    FChangesValue: TEvent;
    Fvalorduplicata: Double;
    procedure atualizarValores;
    procedure dataSetPagamentosGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  public
    constructor create(AOwner: TDataSet_OOP);
    destructor Destroy; override;
    function Insert: Boolean; override;
    function Post: Boolean; override;
    function Apply: Boolean; override;
    function delete: Boolean;

    procedure OwnerDataSetValorTotalChange;
    function selecionaPag: Boolean;
    function semPagamento(Aquestion: Boolean = True): Boolean;
    function pagamentoEmDuplicataMercantil(Avalor: Double; Acontrole: Integer): Boolean;
    function pagamentoDosPedidos: Boolean;

    property formas        : TNFCab_Pag_Forma read Fformas       write Fformas;
    property lkBandeira    : TDadosLookUp_OOP read FlkBandeira   write FlkBandeira;
    property total         : Double           read Ftotal;
    property troco         : Double           read Ftroco;
    property falta         : Double           read Ffalta;
    property valorduplicata: Double           read Fvalorduplicata;
    property onChangesValue: TEvent           read FChangesValue write FChangesValue;
  end;

  TNFCab_dup = class(TDataSet_OOP)
  private
    FID: Integer;
    FOwner: TDataSet_OOP;
    FlkCondPag: TDadosLookUp_OOP;
    FlkControles: TDadosLookUp_OOP;
    FcontrolePad: Integer;
    procedure atualizarValores;
    procedure dataSetPagamentosGetText(Sender: TField; var Text: string; DisplayText: Boolean);//colocar o controle aqui
    procedure nf_verificar_mensagem;
    procedure AjustarVencimentoDeAcordoCreditos(var parcelas: RParcelamentos; codcontrole: Integer);
  public
    constructor create(AOwner: TDataSet_OOP);
    destructor Destroy; override;
    function Insert: Boolean; override;
    function Post: Boolean; override;
    function Apply: Boolean; override;
    function delete: Boolean;

    function selecionaDup(Acod_nf: Integer = 0): Boolean;
    function getControleVenda: Integer;
    function gerarAvulso(Avalor, AvalorST: Double; AVencimento: TDateTime; Anumero: string): Boolean;
    function aproveitarDosPedidos(AgerarPagamento: Boolean = True): Boolean;
    function boletosPendentes(Acod_nf: Integer): Boolean;
    function gerarBoletosPendentes(Acod_nf: Integer): Boolean;
    procedure nf_formatar_mensagem;

    property lkControles: TDadosLookUp_OOP read FlkControles write FlkControles;
    property lkCondPag  : TDadosLookUp_OOP read FlkCondPag   write FlkCondPag;
    property controlePad: Integer          read FcontrolePad write FcontrolePad;
  end;

implementation

uses
  SysUtils, IBDatabase, IBQuery, uDtmAtivo, uDtmNF,
  Forms, Windows, StrUtils, uClassesNotasFiscais,
  Variants, config_sistema_class, uClassesCadastrosBasicos,
  notafiscal_class, SituacaoNFeEnumUnit,
  Math;

{ TNFCab_Pag_Forma }

procedure TNFCab_Pag_Forma.AbreRegistros;
begin
  ClientOpen('select ''C''||controles.codigo_ctrl ID, controles.codigo_ctrl, controles.nome_ctrl,' +
    ' controles.nfce_tpag, clientes.cpfcgc, controles.cartao_sped, coalesce(controles.qseqperf, 900) qseqperf,' +
    ' controles.nat_ctrl from controles ' +
    ' inner join clientes on clientes.cod_cliente = controles.cartao_sped_part and clientes.cod_empresa = controles.codigo_emp' +
    ' where controles.cxent = ''S'' ' +
    ' and controles.codigo_emp = ' + vDadosIni.codEmpresa +
    ' and controles.nfce_tpag > 0 ' +
    ' and controles.cartao_sped in (1, 2) ' +
    ' and controles.ativo <> 99 ' +
    ' union' +
    ' select ''C''||controles.codigo_ctrl ID, controles.codigo_ctrl, controles.nome_ctrl,' +
    ' controles.nfce_tpag, '' '' cpfcgc, controles.cartao_sped, coalesce(controles.qseqperf, 900) qseqperf,' +
    ' controles.nat_ctrl  from controles' +
    ' where controles.cxent = ''S'' ' +
    ' and controles.codigo_emp = ' + vDadosIni.codEmpresa +
    ' and controles.nfce_tpag > 0' +
    ' and coalesce(controles.cartao_sped, 0) not in (1, 2)' +
    ' and controles.ativo <> 99 ' +
    ' union' +
    ' select ''N'' || lpad(tpag,2,''0'') id, 0 codigo_ctrl,' +
    ' lpad(tpag,2,''0'') || '' - '' || descricao, ' +
    ' tpag, '' '' cpfcgc, 0 cartao_sped, cast((900 + tpag) as integer) qseqperf,' +
    ' ''A'' from sp_nfe_meios_pag where tpag not in (0)' +
    ' order by 7');

//      16: Text := '
//      17: Text := '17 - Pagamento Instantâneo (PIX) - ' + Trim(Text);
//      18: Text := '18 - Transferência bancária, Carteira Digital - ' + Trim(Text);
//      19: Text := '19 - Programa de fidelidade, Cashback, Crédito Virtual - ' + Trim(Text);
end;

constructor TNFCab_Pag_Forma.create;
begin
  dataSet := TClientDataSet(dtmNF.cdsCtrlFormPag);
  transacao := TIBTransaction(dtmNF.transacaoNF);
  buscas := TIBQuery(dtmNF.qrBuscas);
end;

function TNFCab_Pag_Forma.GetNomeControle(Acodigo: Integer): string;
begin
  Result := '';
  if dataSet.IsEmpty then
    Exit;

  storeRecNo;
  try
    dataSet.First;
    while not dataSet.Eof do
    begin
      if (dataSet.FieldByName('codigo_ctrl').AsInteger > 0) and
         (dataSet.FieldByName('codigo_ctrl').AsInteger = Acodigo) then
      begin
        Result := Trim(dataSet.FieldByName('nome_ctrl').AsString);
        Break;
      end;
      dataSet.Next;
    end;

  finally
    restoreRecNo;
  end;
end;

{ TNFCab_pag }

function TNFCab_pag.Apply: Boolean;
begin
  dataSet.DisableControls;
  try
    dataSet.First;
    while not dataSet.Eof do
    begin
      if dataSet.FieldByName('cod_nf').AsInteger = 0 then
      begin
        dataSet.Edit;
        dataSet.FieldByName('cod_nf').AsInteger := FOwner.dataSet.FieldByName('cod_nf').AsInteger;
        dataSet.Post;
      end;
      dataSet.Next;
    end;
  finally
    dataSet.EnableControls;
  end;
  if dataSet.ChangeCount > 0 then
  begin
    Result := inherited Apply;
    selecionaPag;
    dataSet.Refresh;
  end
  else
    Result := True;
end;

procedure TNFCab_pag.atualizarValores;
begin
  Ftotal := 0;
  Ftroco := 0;
  Fvalorduplicata := 0;
  Ffalta := FOwner.dataSet.FieldByName('valor_total').AsFloat;
  if dataSet.IsEmpty then
    Exit;

  storeRecNo;
  dataSet.DisableControls;
  try
    dataSet.First;
    while not dataSet.Eof do
    begin
      if dataSet.FieldByName('tpag').AsInteger = 90 then
      begin
        Ffalta := 0;
        Ftotal := FOwner.dataSet.FieldByName('valor_total').AsFloat;
        Ftroco := 0;
        if FOwner.dataSet.State in [dsInsert, dsEdit] then
          FOwner.dataSet.FieldByName('pag_vtroco').AsFloat := Ftroco;
        Exit;
      end;

      Ftotal := Ftotal + dataSet.FieldByName('vpag').AsFloat;
      Fvalorduplicata := Fvalorduplicata + IfThen(dataSet.FieldByName('tpag').AsInteger = 14, dataSet.FieldByName('vpag').AsFloat);
      dataSet.Next;
    end;

    if Ftotal < FOwner.dataSet.FieldByName('valor_total').AsFloat then
      Ffalta := FOwner.dataSet.FieldByName('valor_total').AsFloat - Ftotal
    else
      Ffalta := 0;

    if Ftotal > FOwner.dataSet.FieldByName('valor_total').AsFloat then
      Ftroco := Ftotal - FOwner.dataSet.FieldByName('valor_total').AsFloat;

    if FOwner.dataSet.State in [dsInsert, dsEdit] then
      FOwner.dataSet.FieldByName('pag_vtroco').AsFloat := Ftroco;
  finally
    restoreRecNo;
    dataSet.EnableControls;
    if Assigned(FChangesValue) then
      FChangesValue;
  end;
end;

constructor TNFCab_pag.create(AOwner: TDataSet_OOP);
begin
  FOwner      := TNFCab(AOwner);

  dataSet     := TClientDataSet(DtmNF.cdsNFPag);
  transacao   := TIBTransaction(FOwner.transacao);
  buscas      := TIBQuery(DtmNF.qrBuscasNF);
  Fformas     := TNFCab_Pag_Forma.create;
  FlkBandeira := TDadosLookUp_OOP.create;

  dataSet.FieldByName('tpag').OnGetText  := dataSetPagamentosGetText;
  dataSet.FieldByName('tband').OnGetText := dataSetPagamentosGetText;
end;

procedure TNFCab_pag.dataSetPagamentosGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Text := Trim(Sender.AsString);
  if Sender.FieldName = 'TPAG' then
  begin
    if //(Trim(Text) = '') and
      (dataSet.FieldByName('cod_controle').AsInteger > 0) then
      Text := Fformas.GetNomeControle(dataSet.FieldByName('cod_controle').AsInteger);
    
    case dataSet.FieldByName('tpag').AsInteger of
      01: Text := '01 - Dinheiro - ' + Trim(Text);
      02: Text := '02 - Cheque - ' + Trim(Text);
      03: Text := '03 - Cartão de Crédito - ' + Trim(Text);
      04: Text := '04 - Cartão de Débito - ' + Trim(Text);
      05: Text := '05 - Crédito Loja - ' + Trim(Text);
      10: Text := '10 - Vale Alimentação - ' + Trim(Text);
      11: Text := '11 - Vale Refeição - ' + Trim(Text);
      12: Text := '12 - Vale Presente - ' + Trim(Text);
      13: Text := '13 - Vale Combustível - ' + Trim(Text);
      14: Text := '14 - Duplicata Mercantil - ' + Trim(Text);
      15: Text := '15 - Boleto Bancário - ' + Trim(Text);
      16: Text := '16 - Depósito Bancário - ' + Trim(Text);
      17: Text := '17 - Pagamento Instantâneo (PIX) - ' + Trim(Text);
      18: Text := '18 - Transferência bancária, Carteira Digital - ' + Trim(Text);
      19: Text := '19 - Programa de fidelidade, Cashback, Crédito Virtual - ' + Trim(Text);
      90: Text := '90 - Sem pagamento - ' + Trim(Text);
      99: Text := '99 - Outros - ' + Trim(Text);
    end;
  end
  else if Sender.FieldName = 'TBAND' then
  begin 
    case dataSet.FieldByName('tband').AsInteger of
      01: Text := '01 - Visa';
      02: Text := '02 - Mastercard';
      03: Text := '03 - American Express';
      04: Text := '04 - SorocredExpress';
      05: Text := '05 - Diners Club';
      06: Text := '06 - Elo';
      07: Text := '07 - Hipercard';
      08: Text := '08 - Aura';
      09: Text := '09 - Cabal';
      99: Text := '99 - Outros';
    end;
  end;
end;

function TNFCab_pag.delete: Boolean;
begin  
  Result := inherited delete;
  atualizarValores;
end;

destructor TNFCab_pag.Destroy;
begin
  if Assigned(Fformas   )  then FreeAndNil(Fformas);
  if Assigned(FlkBandeira) then FreeAndNil(FlkBandeira);
  inherited;
end;

function TNFCab_pag.Insert: Boolean;
begin
  if dataSet.RecordCount >= 100 then
    raiseExceptionCreate('Máximo de 100 detalhes de pagamento já informado', '');

  dataSet.First;
  while not dataSet.Eof do
  begin
    if dataSet.FieldByName('tpag').AsInteger = 90 then
      raiseExceptionCreate('Tipo de pagamento "Sem pagamento" já informado', '');
    dataSet.Next;
  end;

  Result := inherited insert;
  if Result then
  begin
    dataSet.FieldByName('cod_nf').AsInteger      := FOwner.dataSet.FieldByName('cod_nf').AsInteger;
    dataSet.FieldByName('cod_empresa').AsInteger := FOwner.dataSet.FieldByName('cod_empresa').AsInteger;
    dataSet.FieldByName('seqid').AsInteger       := FID;
    dataSet.FieldByName('vpag').AsFloat          := Ffalta;
    FID := FID - 1;
  end;
end;

procedure TNFCab_pag.OwnerDataSetValorTotalChange;
begin
  if Ftotal < FOwner.dataSet.FieldByName('valor_total').AsFloat then
    Ffalta := FOwner.dataSet.FieldByName('valor_total').AsFloat - Ftotal
  else
    Ffalta := 0;

  Ftroco := 0;
  if Ftotal > FOwner.dataSet.FieldByName('valor_total').AsFloat then
    Ftroco := Ftotal - FOwner.dataSet.FieldByName('valor_total').AsFloat;

  if FOwner.dataSet.State in [dsInsert, dsEdit] then
  begin
    FOwner.dataSet.FieldByName('pag_vtroco').AsFloat := Ftroco;
    if (FOwner.dataSet.FieldByName('tipo_emissao').AsInteger in [3,4]) then
      semPagamento(False);
  end;

  if Assigned(FChangesValue) then
    FChangesValue; 
end;

function TNFCab_pag.pagamentoDosPedidos: Boolean;
var
  Apedidos: array of RPedVenda2;
  Acontrol: array of RAcumulado;
  AControlsDisabled: Boolean;
  I: Integer;

  procedure addPedvenda(Anped: Integer; Atipo: string);
  var
    Aicont: Integer;
  begin
    if (Anped = 0) or (Trim(Atipo) = '') then
      Exit;

    for Aicont := Low(Apedidos) to High(Apedidos) do
      if (Apedidos[Aicont].NPed = Anped) and (Apedidos[Aicont].TipoVenda = Atipo) then
        Exit;

    SetLength(Apedidos, Length(Apedidos) + 1);
    Apedidos[High(Apedidos)].NPed      := Anped;
    Apedidos[High(Apedidos)].TipoVenda := Atipo;
  end;

  procedure addControle(Acontrole: Integer; Avalor: Double; Aaut: string);
  var
    Aicont: Integer;
  begin
    if (Acontrole = 0) or (Avalor <= 0) then
      Exit;

    for Aicont := Low(Acontrol) to High(Acontrol) do
      if (Acontrol[Aicont].codigo = Acontrole) and
        (Acontrol[Aicont].Texto = Aaut) then
      begin
        Acontrol[Aicont].Valor := Acontrol[Aicont].Valor + Avalor;
        Exit;
      end;

    SetLength(Acontrol, Length(Acontrol) + 1);
    Acontrol[High(Acontrol)].codigo := Acontrole;
    Acontrol[High(Acontrol)].Valor  := Avalor;
    Acontrol[High(Acontrol)].Texto  := Aaut;
  end;
begin
  if not (FOwner as TNFCab).vItem.dataSet.Active then
    (FOwner as TNFCab).vItem.selecionaItens(FOwner.dataSet.FieldByName('cod_nf').AsInteger);

  if Trim(FOwner.dataSet.FieldByName('natureza_nf').AsString) <> 'S' then
    Exit;

  SetLength(Acontrol, 0);
  if (FOwner.dataSet.FieldByName('tipo_nf').AsString = 'V') and
    (FOwner.dataSet.FieldByName('n_comando').AsInteger > 0) then
  begin
    SetLength(Apedidos, 1);
    Apedidos[High(Apedidos)].NPed       := FOwner.dataSet.FieldByName('n_comando').AsInteger;
    Apedidos[High(Apedidos)].TipoVenda  := 'MOT';
    Apedidos[High(Apedidos)].ValorVenda := FOwner.dataSet.FieldByName('valor_total').AsInteger;
  end
  else
  begin
    SetLength(Apedidos, 0);

    (FOwner as TNFCab).vItem.storeRecNo;
    AControlsDisabled := (FOwner as TNFCab).vItem.dataSet.ControlsDisabled;
    (FOwner as TNFCab).vItem.dataSet.DisableControls;
    try
      (FOwner as TNFCab).vItem.dataSet.First;
      while not (FOwner as TNFCab).vItem.dataSet.Eof do
      begin
        addPedvenda((FOwner as TNFCab).vItem.dataSet.FieldByName('nped').AsInteger, (FOwner as TNFCab).vItem.dataSet.FieldByName('tipo_ped').AsString);
        (FOwner as TNFCab).vItem.dataSet.Next;
      end;

    finally
      (FOwner as TNFCab).vItem.restoreRecNo;
      if AControlsDisabled then
        (FOwner as TNFCab).vItem.dataSet.EnableControls;
    end;
  end;

  try

    while not dataSet.IsEmpty do
      dataSet.Delete;

    (FOwner as TNFCab).dupNFe.aproveitarDosPedidos(True);

    for I := Low(Apedidos) to High(Apedidos) do
    begin
      SqlOpen('select fp.cod_controle, co.nfce_tpag, fp.n_aut_cart, sum(fp.valordoc) valordoc  from formpagamento fp' +
              ' inner join controles co on co.codigo_ctrl = fp.cod_controle and co.codigo_emp = fp.cod_empresa and coalesce(co.usar_boleto, ''N'') <> ''S'' ' +
              ' where fp.tpdocs = ' + QuotedStr(Apedidos[I].TipoVenda) +
              ' and fp.nrequisicao = ' + IntToStr(Apedidos[I].NPed) +
              ' and fp.cod_empresa = ' + vDadosIni.codEmpresa +
              ' group by 1, 2, 3').First;
      while not buscas.Eof do
      begin
        addControle(buscas.FieldByName('cod_controle').AsInteger,
                    buscas.FieldByName('valordoc').AsFloat,
                    buscas.FieldByName('n_aut_cart').AsString);

        buscas.Next;
      end;
    end;

    for I := Low(Acontrol) to High(Acontrol) do
    begin
      Fformas.filterStr('codigo_ctrl = ' + IntToStr(Acontrol[I].codigo));
      try
        if Insert then
        begin
          dataSet.FieldByName('vpag').AsFloat := RoundTo(Acontrol[I].Valor, -2);
          dataSet.FieldByName('caut').AsString := Acontrol[I].Texto;

          if ((Fformas.dataSet.FieldByName('nfce_tpag').AsInteger > 0) and (Fformas.dataSet.FieldByName('nfce_tpag').AsInteger <= 90)) then
            dataSet.FieldByName('tpag').AsInteger := Fformas.dataSet.FieldByName('nfce_tpag').AsInteger
          else
            dataSet.FieldByName('tpag').AsInteger := 99;

          if Fformas.dataSet.FieldByName('codigo_ctrl').AsInteger > 0 then
          begin
            dataSet.FieldByName('cod_controle').AsInteger := Fformas.dataSet.FieldByName('codigo_ctrl').AsInteger;
            if vDadosIni.strIn(Fformas.dataSet.FieldByName('nat_ctrl').AsString, ['A', 'P']) then
              dataSet.FieldByName('indpag').AsString := IfThen(Fformas.dataSet.FieldByName('nat_ctrl').AsString = 'A', '0', '1');
          end
          else
            dataSet.FieldByName('cod_controle').Value := Null;

          if not (dataSet.FieldByName('tpag').AsInteger in [ 3, 4 ]) then
          begin
            dataSet.FieldByName('cnpj').Value      := Null;
            dataSet.FieldByName('tband').Value     := Null;
            dataSet.FieldByName('caut').Value      := Null;
            dataSet.FieldByName('tpintegra').Value := Null;
          end
          else
          begin
            dataSet.FieldByName('tpintegra').AsString := IntToStr((FOwner as TNFCab).Config.Conf_Geral.nfe_pag_carta_tpintegra_padrao);
            dataSet.FieldByName('cnpj').AsString := IfThen(Length(Trim(Fformas.dataSet.FieldByName('cpfcgc').AsString)) = 14,
                                                                  Trim(Fformas.dataSet.FieldByName('cpfcgc').AsString));
          end;
          dataSet.FieldByName('origem_ped').AsString := 'S';
          Result := inherited Post;
        end;
      finally
        Fformas.filterClear;
      end;
    end;

  finally
    atualizarValores;
  end;
end;

function TNFCab_pag.pagamentoEmDuplicataMercantil(Avalor: Double;
  Acontrole: Integer): Boolean;
begin
  Result := False;

  dataSet.DisableControls;
  try
//    dataSet.Filter := 'tpag = 14 and cod_controle = ' + IntToStr(Acontrole);
//    dataSet.Filtered := True;
    filterStr('cod_controle = ' + IntToStr(Acontrole));
    try
      if dataSet.IsEmpty then
        Result := Insert
      else
        Result := Edit;

      if Result then
      begin
        try
          formas.filterStr('codigo_ctrl = ' + IntToStr(Acontrole));
          if Fformas.dataSet.FieldByName('nfce_tpag').AsInteger > 0 then
            dataSet.FieldByName('tpag').AsInteger := Fformas.dataSet.FieldByName('nfce_tpag').AsInteger
          else
            dataSet.FieldByName('tpag').AsInteger := 99;
          if vDadosIni.strIn(Fformas.dataSet.FieldByName('nat_ctrl').AsString, ['A', 'P']) then
            dataSet.FieldByName('indpag').AsString := IfThen(Fformas.dataSet.FieldByName('nat_ctrl').AsString = 'A', '0', '1');
        finally
          formas.filterClear;;
        end;
        dataSet.FieldByName('cod_controle').AsInteger := Acontrole;
        dataSet.FieldByName('vpag').AsFloat           := Avalor;
        dataSet.Post;
        Ftotal := FOwner.dataSet.FieldByName('valor_total').AsFloat;
        Ffalta := 0;
        Ftroco := 0;
      end;
    finally
      filterClear;
    end;

  finally
    dataSet.Cancel;
    atualizarValores;
    dataSet.EnableControls
  end;
end;

function TNFCab_pag.Post: Boolean;
begin
  Result := False;
  try
    if dataSet.FieldByName('tpag').AsInteger = 90 then
      dataSet.FieldByName('vpag').AsFloat := 0
    else
      dataSet.FieldByName('vpag').AsFloat := RoundTo(dataSet.FieldByName('vpag').AsFloat, -2);

    if dataSet.FieldByName('tpag').AsInteger <> 90 then
      checkFieldEmpty('VPAG', 'Valor precisa ser preenchido'      , 'edvpag');

    dataSet.FieldByName('tpag').AsInteger        := Fformas.dataSet.FieldByName('nfce_tpag').AsInteger;
    if Fformas.dataSet.FieldByName('codigo_ctrl').AsInteger > 0 then
    begin
      dataSet.FieldByName('cod_controle').AsInteger := Fformas.dataSet.FieldByName('codigo_ctrl').AsInteger;
      if vDadosIni.strIn(Fformas.dataSet.FieldByName('nat_ctrl').AsString, ['A', 'P']) then
        dataSet.FieldByName('indpag').AsString := IfThen(Fformas.dataSet.FieldByName('nat_ctrl').AsString = 'A', '0', '1');
    end
    else
      dataSet.FieldByName('cod_controle').Value := Null;

    if fequals('tpag', '99') and (fint('cod_controle') = 0) and (Length(fstr('xpag')) < 2) then
      raiseExceptionCreate('Tipo de pagamento 99 Outros, é necessário preencher o campo de descrição(2 a 60 caracteres)');

    if not (dataSet.FieldByName('tpag').AsInteger in [ 3, 4 ]) then
    begin
      dataSet.FieldByName('cnpj').Value      := Null;
      dataSet.FieldByName('tband').Value     := Null;
      dataSet.FieldByName('caut').Value      := Null;
      dataSet.FieldByName('tpintegra').Value := Null;
    end
    else
    begin
      dataSet.FieldByName('tpintegra').AsString := IntToStr((FOwner as TNFCab).Config.Conf_Geral.nfe_pag_carta_tpintegra_padrao);
      dataSet.FieldByName('cnpj').AsString := IfThen(Length(Trim(Fformas.dataSet.FieldByName('cpfcgc').AsString)) = 14,
                                                            Trim(Fformas.dataSet.FieldByName('cpfcgc').AsString));
    end;

    Result := inherited Post;

    atualizarValores;

  except on E: Exception do
    begin
      registraErro('TNFCab_pag.Post Erro: ' + e.Message);
      vDadosIni.ShowErro('Erro ao salvar dados' + sLineBreak + sLineBreak + E.Message);    
    end;
  end;
end;

function TNFCab_pag.selecionaPag: Boolean;
begin
  FID := 0;
  Fformas.AbreRegistros;

  Result := montaSelect('select' +
                        ' notafiscal_pag.cod_nf, notafiscal_pag.cod_empresa, notafiscal_pag.seqid,' +
                        ' notafiscal_pag.tpag, notafiscal_pag.vpag, notafiscal_pag.cnpj, notafiscal_pag.tband,' +
                        ' notafiscal_pag.caut, notafiscal_pag.cod_controle, notafiscal_pag.tpintegra, notafiscal_pag.origem_ped,' + //, controles.nome_ctrl' +
                        ' notafiscal_pag.indpag, notafiscal_pag.xpag ' + 
                        ' from notafiscal_pag' +
                        //' left join controles on controles.codigo_ctrl = notafiscal_pag.cod_controle and' +
                        //' controles.codigo_emp = notafiscal_pag.cod_empresa' +
                        ' where notafiscal_pag.cod_nf = ' + IntToStr(FOwner.dataSet.FieldByName('cod_nf').AsInteger) +
                        ' and notafiscal_pag.cod_empresa = ' + IntToStr(FOwner.dataSet.FieldByName('cod_empresa').AsInteger) +
                        ' order by notafiscal_pag.seqid');
  atualizarValores;
end;

function TNFCab_pag.semPagamento(Aquestion: Boolean): Boolean;
begin
  Result := False;

  if not dataSet.IsEmpty then
    if Aquestion then
      if vDadosIni.ShowConfirmacao('Existem registros. Excluir e prosseguir?') <> ID_YES then
        Exit;
  dataSet.DisableControls;
  try
    dataSet.Filter := 'tpag <> 90';
    dataSet.Filtered := True;
    try

      while not dataSet.IsEmpty do
        dataSet.Delete;

    finally
      dataSet.Filtered := False;
      dataSet.Filter := '';
    end;

    if dataSet.IsEmpty then
      Result := Insert
    else
      Result := Edit;

    if Result then
    begin
      dataSet.FieldByName('tpag').AsInteger := 90;
      dataSet.FieldByName('vpag').AsFloat   := 0;
      dataSet.Post;
      Ftotal := FOwner.dataSet.FieldByName('valor_total').AsFloat;
      Ffalta := 0;
      Ftroco := 0;
    end;

  finally
    dataSet.Cancel;
    atualizarValores;
    dataSet.EnableControls
  end;
end;

{ TNFCab_dup }

procedure TNFCab_dup.AjustarVencimentoDeAcordoCreditos(
  var parcelas: RParcelamentos; codcontrole: Integer);
var
  vendas: ArrayVendas;
  I: Integer;
  NewDate: TDateTime;
begin
  if not TConfig_sistema_class.getConf('nf_boletos_avulsos_data_credito', buscas, vDadosIni.cod_empresa).AsBoolean then
    Exit;

  vendas := (FOwner as TNFCab).GetVendasDaNF;
  if Length(vendas) <> 1 then
    Exit;

  for I := Low(parcelas) to High(parcelas) do
  begin
    NewDate := SqlOpen('select cc.data_venc_c from controle_creditos cc' +
                       ' where cc.n_doc_v = %d and cc.tp_doc_v = %s and cc.cod_emp_mult = %d' +
                       ' and cc.nparcela = %d and cc.codigo_ctrl = %d and cc.datq_c is null' +
                       ' and cc.data_venc_c >= ' + vDadosIni.FusoSqlDate,
                       [vendas[Low(vendas)].NPed, QuotedStr(vendas[Low(vendas)].TipoVenda),
                        vDadosIni.cod_empresa, I + 1, codcontrole]).FieldByName('data_venc_c').AsDateTime;

    if (NewDate = 0) then
      NewDate := SqlOpen('select fp.data_venc from formpagamento fp' +
                         ' where fp.nrequisicao = %d and fp.tpdocs = %s and fp.cod_empresa = d' +
                         ' and fp.nparcela = %d and fp.cod_controle = %d and fp.data_venc > ' + vDadosIni.FusoSqlDate,
                         [vendas[Low(vendas)].NPed, QuotedStr(vendas[Low(vendas)].TipoVenda),
                          vDadosIni.cod_empresa, I + 1, codcontrole]).FieldByName('data_venc_c').AsDateTime;

    if NewDate > 0 then
      parcelas[I].DataVencimento := NewDate;
  end;
end;

function TNFCab_dup.Apply: Boolean;
begin
  dataSet.DisableControls;
  try
    dataSet.First;
    while not dataSet.Eof do
    begin
      if dataSet.FieldByName('cod_nf').AsInteger = 0 then
      begin
        dataSet.Edit;
        dataSet.FieldByName('cod_nf').AsInteger := FOwner.dataSet.FieldByName('cod_nf').AsInteger;
        if Pos('000000', dataSet.FieldByName('ndoc').AsString) = 1 then
          dataSet.FieldByName('ndoc').AsString := StringReplace(dataSet.FieldByName('ndoc').AsString,
                                                                '000000', vDadosIni.StrZero(FOwner.dataSet.FieldByName('num_nf').AsInteger, 6), []);
        dataSet.Post;
      end
      else if (Pos('000000', dataSet.FieldByName('ndoc').AsString) = 1) or
              (Pos(IntToStr((FOwner as TNFCab).fint('num_nf')), dataSet.FieldByName('ndoc').AsString) = 0) then
      begin
        dataSet.Edit;
        dataSet.FieldByName('ndoc').AsString := vDadosIni.StrZero(FOwner.fint('num_nf'), 6) + '-' +
                                                Copy(dataSet.FieldByName('ndoc').AsString,
                                                     Pos('-', dataSet.FieldByName('ndoc').AsString) + 1,
                                                     Length(dataSet.FieldByName('ndoc').AsString));
        //StringReplace(dataSet.FieldByName('ndoc').AsString, '000000', vDadosIni.StrZero(FOwner.dataSet.FieldByName('num_nf').AsInteger, 6), []);
        dataSet.Post;
      end;           
      dataSet.Next;
    end;

    IndexFieldNames := 'DVENC';
    dataSet.First;
    while not dataSet.Eof do
    begin
      dataSet.Edit;
      dataSet.FieldByName('ndup').AsString := vDadosIni.StrZero(dataSet.RecNo, 3);
      dataSet.Post;
      dataSet.Next;
    end;
    IndexFieldNames := '';

  finally
    dataSet.EnableControls;
  end;
  if dataSet.ChangeCount > 0 then
  begin
    Result := inherited Apply;
    selecionaDup();
  end
  else
    Result := True;
end;

function TNFCab_dup.aproveitarDosPedidos(AgerarPagamento: Boolean): Boolean;
var
  Apedidos: array of RPedVenda2;
  Acontrol: array of RAcumulado;
  AControlsDisabled: Boolean;
  I: Integer;

  procedure addPedvenda(Anped: Integer; Atipo: string);
  var
    Aicont: Integer;
  begin
    if (Anped = 0) or (Trim(Atipo) = '') then
      Exit;

    for Aicont := Low(Apedidos) to High(Apedidos) do
      if (Apedidos[Aicont].NPed = Anped) and (Apedidos[Aicont].TipoVenda = Atipo) then
        Exit;

    SetLength(Apedidos, Length(Apedidos) + 1);
    Apedidos[High(Apedidos)].NPed      := Anped;
    Apedidos[High(Apedidos)].TipoVenda := Atipo;
  end;

  procedure addControle(Acontrole: Integer; Avalor: Double);
  var
    Aicont: Integer;
  begin
    if (Acontrole = 0) or (Avalor <= 0) then
      Exit;

    for Aicont := Low(Acontrol) to High(Acontrol) do
      if (Acontrol[Aicont].codigo = Acontrole) then
      begin
        Acontrol[Aicont].Valor := Acontrol[Aicont].Valor + Avalor;
        Exit;
      end;

    SetLength(Acontrol, Length(Acontrol) + 1);
    Acontrol[High(Acontrol)].codigo := Acontrole;
    Acontrol[High(Acontrol)].Valor  := Avalor;
  end;

begin
  if not (FOwner as TNFCab).vItem.dataSet.Active then
    (FOwner as TNFCab).vItem.selecionaItens(FOwner.dataSet.FieldByName('cod_nf').AsInteger);

  if Trim(FOwner.dataSet.FieldByName('natureza_nf').AsString) <> 'S' then
    Exit;

  SetLength(Acontrol, 0);
  if (FOwner.dataSet.FieldByName('tipo_nf').AsString = 'V') and
    (FOwner.dataSet.FieldByName('n_comando').AsInteger > 0) then
  begin
    SetLength(Apedidos, 1);
    Apedidos[High(Apedidos)].NPed       := FOwner.dataSet.FieldByName('n_comando').AsInteger;
    Apedidos[High(Apedidos)].TipoVenda  := 'MOT';
    Apedidos[High(Apedidos)].ValorVenda := FOwner.dataSet.FieldByName('valor_total').AsInteger;
  end
  else
  begin
    SetLength(Apedidos, 0);

    (FOwner as TNFCab).vItem.storeRecNo;
    AControlsDisabled := (FOwner as TNFCab).vItem.dataSet.ControlsDisabled;
    (FOwner as TNFCab).vItem.dataSet.DisableControls;
    try
      (FOwner as TNFCab).vItem.dataSet.First;
      while not (FOwner as TNFCab).vItem.dataSet.Eof do
      begin
        addPedvenda((FOwner as TNFCab).vItem.dataSet.FieldByName('nped').AsInteger, (FOwner as TNFCab).vItem.dataSet.FieldByName('tipo_ped').AsString);
        (FOwner as TNFCab).vItem.dataSet.Next;
      end;

    finally
      (FOwner as TNFCab).vItem.restoreRecNo;
      if AControlsDisabled then
        (FOwner as TNFCab).vItem.dataSet.EnableControls;
    end;
  end;

  try
  
    while not dataSet.IsEmpty do
      dataSet.Delete;

    for I := Low(Apedidos) to High(Apedidos) do
    begin

      SqlOpen('select fp.seqform, fp.ndoc, fp.data_venc,  fp.valordoc, fp.tpdocs, fp.nrequisicao, fp.cod_controle,' +
              ' (select first 1 b.N_SEQ_BOL from BOLETAS b where b.SEQFORM = fp.seqform and b.COD_EMPRESA = fp.cod_empresa) N_SEQ_BOL' +
              ' from formpagamento fp' +
              ' inner join controles co on co.codigo_ctrl = fp.cod_controle and co.codigo_emp = fp.cod_empresa' +
              ' where co.usar_boleto = ''S'' and tpdocs = ' + QuotedStr(Apedidos[I].TipoVenda) +
              ' and nrequisicao = ' + IntToStr(Apedidos[I].NPed) +
              ' and fp.cod_empresa = ' + vDadosIni.codEmpresa +
              ' order by fp.ndoc, fp.data_venc').First;
      while not buscas.Eof do
      begin
        if Insert then
        begin
          dataSet.FieldByName('dvenc').AsDateTime   := buscas.FieldByName('data_venc').AsDateTime;
          dataSet.FieldByName('vdup').AsFloat       := buscas.FieldByName('valordoc').AsFloat;
          dataSet.FieldByName('ndoc').AsString      := buscas.FieldByName('ndoc').AsString;
          dataSet.FieldByName('seqform').AsInteger  := buscas.FieldByName('seqform').AsInteger;
          dataSet.FieldByName('cod_controle').Value := buscas.FieldByName('cod_controle').Value;
          dataSet.FieldByName('n_seq_bol').Value    := buscas.FieldByName('n_seq_bol').Value;
          dataSet.Post;

          if AgerarPagamento then
            addControle(buscas.FieldByName('cod_controle').AsInteger, buscas.FieldByName('valordoc').AsFloat);

        end;
        buscas.Next;
      end;
    end;

    if AgerarPagamento then
      for I := Low(Acontrol) to High(Acontrol) do
        (FOwner as TNFCab).pagNFe.pagamentoEmDuplicataMercantil(Acontrol[I].Valor, Acontrol[I].codigo);

  finally
    atualizarValores;
  end;
end;

procedure TNFCab_dup.atualizarValores;
var
  Atotal: Double;
begin
  storeRecNo;
  try
    Atotal := 0;
    dataSet.First;
    while not dataSet.Eof do
    begin
      Atotal := Atotal + dataSet.FieldByName('vdup').AsFloat;
      dataSet.Next;
    end;

    if FOwner.dataSet.State in [dsInsert, dsEdit] then
    begin
      FOwner.dataSet.FieldByName('fat_vorig').AsFloat := Atotal;
      FOwner.dataSet.FieldByName('fat_vliq').AsFloat  := Atotal - FOwner.dataSet.FieldByName('fat_vdesc').AsFloat;
    end;
  finally
    restoreRecNo;
  end;
end;

function TNFCab_dup.boletosPendentes(Acod_nf: Integer): Boolean;
begin
//  if (not dataSet.Active) or (dataSet.IsEmpty) or (not FOwner.Active) or (FOwner.campo_cod_nf <> Acod_nf) then
    selecionaDup;

  Result := False;
  dataSet.First;
  while not dataSet.Eof do
  begin
    if dataSet.FieldByName('n_seq_bol').AsInteger = 0 then
    begin
      Result := True;
      Break;
    end
    else if SqlOpen('select n_seq_bol from boletas' +
                    ' where n_seq_bol = ' + IntToStr(dataSet.FieldByName('n_seq_bol').AsInteger) +
                    ' and cod_empresa = ' + vDadosIni.codEmpresa +
                    ' and ativo = 1').FieldByName('n_seq_bol').AsInteger <> dataSet.FieldByName('n_seq_bol').AsInteger then
    begin
      Result := True;
      Break;
    end;

    dataSet.Next;
  end;
end;

constructor TNFCab_dup.create(AOwner: TDataSet_OOP);
begin
  FOwner       := TNFCab(AOwner);

  dataSet      := TClientDataSet(DtmNF.cdsNFDup);
  transacao    := TIBTransaction(FOwner.transacao);
  buscas       := TIBQuery(DtmNF.qrBuscasNF);
  FlkControles := TDadosLookUp_OOP.create;
  FlkCondPag   := TDadosLookUp_OOP.create;

  dataSet.FieldByName('cod_controle').OnGetText := dataSetPagamentosGetText;
end;

procedure TNFCab_dup.dataSetPagamentosGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Text := Trim(Sender.AsString);
  if Sender.FieldName = 'COD_CONTROLE' then
  begin
    if (dataSet.FieldByName('cod_controle').AsInteger > 0) and (Assigned(FlkControles.dataSet))then
    begin
      FlkControles.dataSet.DisableControls;
      try
        FlkControles.dataSet.First;
        while not FlkControles.dataSet.Eof do
        begin
          if FlkControles.dataSet.FieldByName('codigo_ctrl').AsInteger = dataSet.FieldByName('cod_controle').AsInteger then
          begin
            Text := Trim(Sender.AsString) + ' - ' + FlkControles.dataSet.FieldByName('nome_ctrl').AsString;
            Break;
          end;
          FlkControles.dataSet.Next;
        end;
      finally
        FlkControles.dataSet.EnableControls;
      end;
    end;
  end;
end;

function TNFCab_dup.delete: Boolean;
begin
  Result := inherited delete;
  atualizarValores;
end;

destructor TNFCab_dup.Destroy;
begin
  if Assigned(FlkControles) then FreeAndNil(FlkControles);
  if Assigned(FlkCondPag  ) then FreeAndNil(FlkCondPag);
  inherited;
end;

function TNFCab_dup.gerarAvulso(Avalor, AvalorST: Double;
  AVencimento: TDateTime; Anumero: string): Boolean;
var
  AParcCP: RParcelamentos;
  ACondPag: TCondicaoPagamento;
  I: Integer;
begin
  Result := False;
  Avalor := RoundTo(Avalor, -2);
  try
    if RoundTo(Avalor + AvalorST, -2) > RoundTo(FOwner.dataSet.FieldByName('valor_total').AsFloat, -2) then
      raiseExceptionCreate('Valor + o Valor da ST não pode ultrapassar o valor da Nota Fiscal', 'eddup_gerar_valor')
    else if (RoundTo(AvalorST, -2) > 0) and (AVencimento < Date - 30) then
      raiseExceptionCreate('Data de vencimento da ST muito antiga', 'eddup_vencimentost');

    try

      while not dataSet.IsEmpty do
        dataSet.Delete;

      if AvalorST > 0 then
        if Insert then
        begin
          dataSet.FieldByName('dvenc').AsDateTime := AVencimento;
          dataSet.FieldByName('vdup').AsFloat     := AvalorST;
          dataSet.FieldByName('ndoc').AsString    := IfThen(Trim(Anumero) <> '', Anumero,
                                                         vDadosIni.StrZero(FOwner.dataSet.FieldByName('num_nf').AsInteger, 6) + '-ST');
          dataSet.FieldByName('cod_controle').Value := FlkControles.dataSet.FieldByName('codigo_ctrl').Value;
          dataSet.Post;
        end;

      if Avalor > 0 then
      begin
        try
          ACondPag := TCondicaoPagamento.create;

//          if FFatura.codControle = 0 then
//            FFatura.codControle := _LerConfiguracoesRegistroInteger('FFatura.codControle');

          AParcCP := ACondPag.MontarPacelamento(FlkCondPag.dataSet.FieldByName('cod_cond_pag').AsInteger,
                                                FlkCondPag.dataSet.FieldByName('desc_cond_pag').AsString,
                                                Avalor,
                                                FOwner.dataSet.FieldByName('num_nf').AsString, '', '', '', '',
                                                FOwner.dataSet.FieldByName('cod_cliente').AsInteger, 0,
                                                FOwner.dataSet.FieldByName('data_lanc').AsDateTime,
                                                FlkControles.dataSet.FieldByName('codigo_ctrl').AsInteger);
        finally
          FreeAndNil(ACondPag);
        end;

//        AjustarVencimentoDeAcordoCreditos(AParcCP, FlkControles.dataSet.FieldByName('codigo_ctrl').AsInteger);

        for I := Low(AParcCP) to High(AParcCP) do
        begin
          if Insert then
          begin
            dataSet.FieldByName('dvenc').AsDateTime   := AParcCP[I].DataVencimento;
            dataSet.FieldByName('vdup').AsFloat       := AParcCP[I].ValorParcela;
            dataSet.FieldByName('ndoc').AsString      := AParcCP[I].NumeroDocumento;
            dataSet.FieldByName('cod_controle').Value := FlkControles.dataSet.FieldByName('codigo_ctrl').Value;
            dataSet.Post;
          end;
        end;
      end;

      if FlkControles.dataSet.FieldByName('codigo_ctrl').AsInteger > 0 then
      begin
        FcontrolePad := FlkControles.dataSet.FieldByName('codigo_ctrl').AsInteger;
         FOwner._GravaConfiguracoesInteger('FFatura.codControle', FcontrolePad);

        (FOwner as TNFCab).pagNFe.pagamentoEmDuplicataMercantil(Avalor + AvalorST, FcontrolePad);
      end;

      Result := True;

      if dataSet.RecordCount > 0 then
        nf_verificar_mensagem;

    finally
      atualizarValores;
    end;
  except on E: Exception do
    begin
      registraErro('TNFCab_pag.Post Erro: ' + e.Message);
      vDadosIni.ShowErro('Erro ao salvar dados' + sLineBreak + sLineBreak + E.Message);
    end;
  end;
end;

function TNFCab_dup.gerarBoletosPendentes(Acod_nf: Integer): Boolean;
var
	vvalorDescontoNF: Double;
  vvalortmp: array of Currency;
  vdescontotmp: array of Currency;
  vqtdetmp: Integer;
  vvalorboletostmp: Double;
  AseqBol: Integer;
  Anf: TNotafiscal_class;
  Agerar: Boolean;
  I: Integer;
begin
  Result := True;
  try

    if SqlOpen('select ' + TNotafiscal_class.GetFieldsSql + ' from notafiscal' +
              ' where cod_nf = ' + IntToStr(Acod_nf) +
              ' and cod_empresa = ' + vDadosIni.codEmpresa).IsEmpty then
      Exit;
    Anf := TNotafiscal_class.Create;
    try
      Anf.SetValuesFrom(buscas);

      if not vDadosIni.strIn(Anf.situacao_nfe, [sitAutorizada, sitEmEPEC]) then
        Exit;

      selecionaDup(Anf.cod_nf);

      if dataSet.IsEmpty then
        Exit;

      vvalorDescontoNF := 0;
      vvalorboletostmp := 0;

      buscas.Close;
      buscas.SQL.Text := ' select coalesce(cl.inf_desc_bol, ''N'') inf_desc_bol from clientes cl ' +
        ' where cl.cod_cliente = :cod_cliente ' +
        ' and cl.cod_empresa = :cod_empresa ';
      buscas.ParamByName('cod_cliente').AsInteger := Anf.cod_cliente;
      buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
      buscas.Open;
      if buscas.FieldByName('inf_desc_bol').AsString = 'S' then
      begin
        vvalorDescontoNF := Anf.valor_desc +
          IfThen(Anf.totais_com_deson = 'S',
            Anf.vicmdeson, 0);
      end;

      if vvalorDescontoNF > 0 then
      begin
        vqtdetmp := 0;
        vvalorboletostmp := 0;
        try
          dataSet.DisableControls;
          dataSet.First;
          while not dataSet.Eof do
          begin
            Agerar := False;
            if dataSet.FieldByName('n_seq_bol').AsInteger = 0 then
              Agerar := True
            else if SqlOpen('select n_seq_bol from boletas' +
                            ' where n_seq_bol = ' + IntToStr(dataSet.FieldByName('n_seq_bol').AsInteger) +
                            ' and cod_empresa = ' + vDadosIni.codEmpresa +
                            ' and ativo = 1').FieldByName('n_seq_bol').AsInteger <> dataSet.FieldByName('n_seq_bol').AsInteger then
              Agerar := True;

            if Agerar then
            begin
              Inc(vqtdetmp);

              vvalorboletostmp := vvalorboletostmp + dataSet.FieldByName('VDUP').AsFloat;
            end;

            dataSet.Next;
          end;
        finally
          dataSet.EnableControls;
        end;

        I := 0;
        SetLength(vvalortmp, vqtdetmp);
        SetLength(vdescontotmp, vqtdetmp);

        try
          dataSet.DisableControls;
          dataSet.First;
          while not dataSet.Eof do
          begin
            Agerar := False;
            if dataSet.FieldByName('n_seq_bol').AsInteger = 0 then
              Agerar := True
            else if SqlOpen('select n_seq_bol from boletas' +
                            ' where n_seq_bol = ' + IntToStr(dataSet.FieldByName('n_seq_bol').AsInteger) +
                            ' and cod_empresa = ' + vDadosIni.codEmpresa +
                            ' and ativo = 1').FieldByName('n_seq_bol').AsInteger <> dataSet.FieldByName('n_seq_bol').AsInteger then
              Agerar := True;

            if Agerar then
            begin
              vvalortmp[I]    := dataSet.FieldByName('VDUP').AsFloat;
              vdescontotmp[I] := 0;

              Inc(I);
            end;

            dataSet.Next;
          end;
        finally
          dataSet.EnableControls;
        end;

        vDadosIni.atualizarValorDesconto(
          Anf.valor_total,
          vvalorDescontoNF,
          vvalorboletostmp,
          vvalortmp,
          vdescontotmp);
      end;

      try
        I := 0;
        Result := False;
        dataSet.DisableControls;
        dataSet.First;
        while not dataSet.Eof do
        begin
          Agerar := False;
          if dataSet.FieldByName('n_seq_bol').AsInteger = 0 then
            Agerar := True
          else if SqlOpen('select n_seq_bol from boletas' +
                          ' where n_seq_bol = ' + IntToStr(dataSet.FieldByName('n_seq_bol').AsInteger) +
                          ' and cod_empresa = ' + vDadosIni.codEmpresa +
                          ' and ativo = 1').FieldByName('n_seq_bol').AsInteger <> dataSet.FieldByName('n_seq_bol').AsInteger then
            Agerar := True;

          if Agerar then
          begin
            AseqBol := Gencodigo('BOLETAS', buscas, vDadosIni.codEmpresa);

            buscas.Close;
            buscas.SQL.Text := 'INSERT INTO BOLETAS (N_SEQ_BOL, COD_EMPRESA, NUM_NF_VND, DATA_EM_BOL, ' +
            	' DATA_VEN_BOL, N_DOC_BOL, VL_DOC_BOL, VL_DESC_BOL, COD_CLIENTE, OBS_BOL1, SUB_SERIE, COD_CONTROLE_CX, ' +
              ' TIPO_EMISSAO, NF_AUT, COD_CARGA, COD_NF, NPARCELA, TOTALPARCELAS)' +
              ' VALUES' +
              ' (:N_SEQ_BOL, :COD_EMPRESA, :NUM_NF_VND, :DATA_EM_BOL, ' +
              ' :DATA_VEN_BOL, :N_DOC_BOL, :VL_DOC_BOL, :VL_DESC_BOL, :COD_CLIENTE, :OBS_BOL1, :SUB_SERIE, :COD_CONTROLE_CX, ' +
              ' ''NF'', ''S'', :COD_CARGA, :COD_NF, :NPARCELA, :TOTALPARCELAS)';
            buscas.Close;
            buscas.ParamByName('N_SEQ_BOL').AsInteger       := AseqBol;
            buscas.ParamByName('COD_EMPRESA').AsString      := vDadosIni.codEmpresa;
            buscas.ParamByName('NPARCELA').AsInteger        := dataSet.RecNo;
            buscas.ParamByName('TOTALPARCELAS').AsInteger   := dataSet.RecordCount;
            buscas.ParamByName('NUM_NF_VND').AsInteger      := Anf.num_nf;
            buscas.ParamByName('SUB_SERIE').AsInteger       := StrToIntDef(Anf.serie, 0);
            buscas.ParamByName('OBS_BOL1').AsString         := Copy(Anf.obs_bol1, 1, 45);
            buscas.ParamByName('COD_CLIENTE').AsInteger     := Anf.cod_cliente;
            buscas.ParamByName('DATA_EM_BOL').AsDate        := Anf.data_lanc;
            buscas.ParamByName('DATA_VEN_BOL').AsDate       := dataSet.FieldByName('DVENC').AsDateTime;
            buscas.ParamByName('N_DOC_BOL').AsString        := Copy(dataSet.FieldByName('NDOC').AsString, 1, 10);

            if vvalorDescontoNF > 0 then
            begin
              buscas.ParamByName('VL_DOC_BOL').AsCurrency     := dataSet.FieldByName('VDUP').AsFloat;
              buscas.ParamByName('VL_DESC_BOL').AsCurrency    := 0;

              if Length(vdescontotmp) - 1 >= I then
              begin
                buscas.ParamByName('VL_DOC_BOL').AsCurrency := vvalortmp[I];
                buscas.ParamByName('VL_DESC_BOL').AsCurrency := vdescontotmp[I];
              end;
            end
            else
            begin
              buscas.ParamByName('VL_DOC_BOL').AsCurrency     := dataSet.FieldByName('VDUP').AsFloat;
              buscas.ParamByName('VL_DESC_BOL').AsCurrency    := 0;
            end;

            if dataSet.FieldByName('COD_CONTROLE').AsInteger > 0 then
              buscas.ParamByName('COD_CONTROLE_CX').AsInteger := dataSet.FieldByName('COD_CONTROLE').AsInteger;
            if Anf.cod_carga > 0 then
              buscas.ParamByName('COD_CARGA').AsInteger     := Anf.cod_carga;
            buscas.ParamByName('COD_NF').AsInteger          := Anf.cod_nf;
            buscas.Prepare;
            buscas.ExecSQL;

            SqlExec('update notafiscal_dup set n_seq_bol = ' + IntToStr(AseqBol) +
                    ' where cod_nf = ' + IntToStr(Anf.cod_nf) +
                    ' and cod_empresa = ' + vDadosIni.codEmpresa +
                    ' and seqid = ' + IntToStr(DataSet.FieldByName('seqid').AsInteger));

            Inc(I);
          end;

          dataSet.Next;
        end;
      finally
      	dataSet.EnableControls;
      end;

      if buscas.Transaction.InTransaction then
        buscas.Transaction.Commit;

    finally
      FreeAndNil(Anf);
    end;
  except on E: Exception do
    begin
      Result := False; 
      registraErro('TNFCab_dup.gerarBoletosPendentes Erro: ' + e.Message);
      vDadosIni.ShowErro('Erro ao gerar boletos' + sLineBreak + sLineBreak + E.Message);
    end;
  end;
end;

function TNFCab_dup.getControleVenda: Integer;
var
	ConfigPoliticaPag: TConfig_sistema_class;
  vUsarControlesVenda: string;
begin
	try
    Result := 0;

    ConfigPoliticaPag := TConfig_sistema_class.getConf('ped_vnd_definir_politica_pagamento', buscas, vDadosIni.cod_empresa);
		vUsarControlesVenda := UpperCase(ConfigPoliticaPag.ReadString('CONTROLE', 'Usar'));

    if (vDadosIni.vEmp.vUsarUmaVendaPorNF = 'S') and (vUsarControlesVenda = 'S') and
      (FOwner.dataSet.FieldByName('nped').AsInteger > 0) and (FOwner.dataSet.FieldByName('tipo_ped').AsString = 'REQ') then
      Result := SqlOpen('select cod_controle from pedvenda' +
                        ' where nped = ' + IntToStr(FOwner.dataSet.FieldByName('nped').AsInteger) +
                        ' and tipo = ''REQ'' and cod_empresa = ' + vDadosIni.codEmpresa).FieldByName('cod_controle').AsInteger;
  finally
  	if Assigned(ConfigPoliticaPag) then
      FreeAndNil(ConfigPoliticaPag);
  end;
end;

function TNFCab_dup.Insert: Boolean;
begin
  if dataSet.RecordCount >= 120 then
    raiseExceptionCreate('Máximo de 120 duplicatas  já informado', '');

//  if inherited insert then
  begin
    dataSet.Append;
    dataSet.FieldByName('cod_nf').AsInteger      := FOwner.dataSet.FieldByName('cod_nf').AsInteger;
    dataSet.FieldByName('cod_empresa').AsInteger := FOwner.dataSet.FieldByName('cod_empresa').AsInteger;
    dataSet.FieldByName('seqid').AsInteger       := FID;
    FID := FID + 1;
    Result := True;
  end;
end;

procedure TNFCab_dup.nf_formatar_mensagem;
var
  Astr: string;
  I: Integer;
begin
  if FOwner.dataSet.State in [dsInsert, dsEdit] then
    if (Trim(FOwner.dataSet.FieldByName('obs_bol1').AsString) <> '') and
       (FOwner.fint('num_nf') > 0) then
    begin
      Astr := FOwner.dataSet.FieldByName('obs_bol1').AsString;
      for I := 0 to FOwner.dataSet.FieldCount - 1 do
        if Pos('[@' + UpperCase(FOwner.dataSet.Fields[I].FieldName) + ']', UpperCase(Astr)) > 0 then
          Astr := StringReplace(Astr, '[@' + UpperCase(FOwner.dataSet.Fields[I].FieldName) + ']',
                                FOwner.dataSet.Fields[I].Text, [rfReplaceAll, rfIgnoreCase]);
      FOwner.dataSet.FieldByName('obs_bol1').AsString := Astr;
    end;
end;

procedure TNFCab_dup.nf_verificar_mensagem;
begin
  if FOwner.dataSet.State in [dsInsert, dsEdit] then
    if Trim(FOwner.dataSet.FieldByName('obs_bol1').AsString) = '' then
      if Trim((FOwner as TNFCab).Config.Conf_Geral.nf_s_obs_pad_bol) <> '' then
        FOwner.dataSet.FieldByName('obs_bol1').AsString := Trim((FOwner as TNFCab).Config.Conf_Geral.nf_s_obs_pad_bol);
end;

function TNFCab_dup.Post: Boolean;
begin
  Result := False;
  try
    dataSet.FieldByName('vdup').AsFloat := RoundTo(dataSet.FieldByName('vdup').AsFloat, -2);

    if dataSet.FieldByName('dvenc').AsDateTime <= Date - 30 then
      raiseExceptionCreate('Data de vencimento muito antiga', 'eddup_dvenc');

    checkFieldEmpty('VDUP', 'Valor precisa ser preenchido'  , 'eddup_vdup');

    Result := inherited Post;

    atualizarValores;

  except on E: Exception do
    begin
      registraErro('TNFCab_dup.Post Erro: ' + e.Message);
      vDadosIni.ShowErro('Erro ao salvar dados' + sLineBreak + sLineBreak + E.Message);    
    end;
  end;
end;

function TNFCab_dup.selecionaDup(Acod_nf: Integer): Boolean;
begin
  FID := -99999;
  Acod_nf := IfThen(Acod_nf = 0, FOwner.dataSet.FieldByName('cod_nf').AsInteger, Acod_nf);
  Result := montaSelect('select * from notafiscal_dup' +
                        ' where cod_nf = ' + IntToStr(Acod_nf) +
                        ' and cod_empresa = ' + vDadosIni.codEmpresa +
                        ' order by seqid');

  FcontrolePad := FOwner._LerConfiguracoesRegistroInteger('FFatura.codControle');
end;


end.
