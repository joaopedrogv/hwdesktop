unit uClassesNotasFiscais_gerar_enviar;

interface

uses
  Windows, Forms, uDtmNF, faturamento_hw_class, uDtmAtivo, uDataSet_OOP;

type

	TGerarEnviarNF = class(TDataSet_OOP)
  public
    constructor create;
    destructor Destroy; override;
    function GerarEnviarNF(
    	pNped: Integer;
      pTipo: string;
      pCodNF: Integer = 0;
      pNumNF: Integer = 0;
      pSerieNF: string = '';
      pExibirMensagem: Boolean = True): Boolean;
  var
  	Ffatu: THw_faturamento;
//    Faux: TAux_faturamento;
  end;

implementation

uses
	DFeHwLibUnit, SysUtils, IBQuery, IBDatabase, notafiscal_class, Classes, DB, SituacaoNFeEnumUnit,
  uDadosIni;

function GerarEnviarNF(
	pNped: Integer;
  pTipo: string;
  pCodNF: Integer = 0;
  pNumNF: Integer = 0;
  pSerieNF: string = '';
  pExibirMensagem: Boolean = True): boolean;
var
	GerarEnviarNF: TGerarEnviarNF;
begin
	try
    Result := True;

    try
      GerarEnviarNF := TGerarEnviarNF.create;
      Result := GerarEnviarNF.GerarEnviarNF(
        pNped,
        pTipo,
        pCodNF,
        pNumNF,
        pSerieNF,
        pExibirMensagem);
    finally
      if Assigned(GerarEnviarNF) then
        FreeAndNil(GerarEnviarNF);
    end;
  except on E: Exception do
    begin
      Result := False;
      Application.MessageBox(PChar('Erro ao gerar e enviar nf : ' + pchar(e.Message)), 'Atenção', MB_ICONERROR + MB_OK);
      vDadosIni.registraErro('Erro ao gerar e nf: ' + e.Message);
    end;
  end;
end;

exports GerarEnviarNF;

{ TGerarEnviarNF }

constructor TGerarEnviarNF.create;
begin
	if dtmNF = nil then
    dtmNF := TdtmNF.Create(dtmNF);
  buscas := TIBQuery(dtmNF.qrBuscas);
  transacao := TIBTransaction(DtmNF.transacaoNf);

  Ffatu := THw_faturamento.Create;
end;

destructor TGerarEnviarNF.Destroy;
begin
	if Assigned(Ffatu) then
  	FreeAndNil(Ffatu);
  inherited;
end;

function TGerarEnviarNF.GerarEnviarNF(
	pNped: Integer;
  pTipo: string;
  pCodNF: Integer = 0;
  pNumNF: Integer = 0;
  pSerieNF: string = '';
  pExibirMensagem: Boolean = True): Boolean;
var
	I, J: Integer;
  AstrWide: WideString;
  Anfs: array of Integer;
  vCodNF: Integer;
  vPedido: THw_pedvenda_class;
  vErros: string;
begin
  try
    Result := True;
    vCodNF := 0;

    if (pNumNF <= 0) and (trim(pSerieNF) = '') then
    begin
      Ffatu.erros.Clear;

      //Obtendo dados dos pedidos
      Ffatu.pedidos.New.pedvenda_dados_obter(pNped, pTipo, True);

      //Gerar lote de faturamento
      Ffatu.gerar_lote_faturamento;

      //Montando notas fiscais
      Ffatu.notafiscal_adicionar(Ffatu.pedidos.Items[0]);
      if Ffatu.erros.Count > 0 then
      begin
        vDadosIni.ShowErro(Ffatu.erros.formato_string(10));
        Exit;
      end;

      if Ffatu.notas.Items[0].pag.Count > 1 then
        Ffatu.notas.Items[0].pag.Delete(0);
      if Ffatu.notas.Items[0].pag.Count > 0 then
      	Ffatu.notas.Items[0].pag.Items[0].vpag := Ffatu.notas.Items[0].valor_total;
      Ffatu.notas.Items[0].pag_vtroco := 0;

      if Ffatu.notas.Items[0].dup.Count > 1 then
        Ffatu.notas.Items[0].dup.Delete(0);
      for I := 0 to Ffatu.notas.Items[0].dup.Count - 1 do
      	Ffatu.notas.Items[0].dup.Items[I].ndup := vDadosIni.StrZero(I + 1, 3);

      if Ffatu.notas.Items[0].dup.Count > 0 then
      begin
      	Ffatu.notas.Items[0].dup.Items[0].vdup := Ffatu.notas.Items[0].valor_total;

        Ffatu.notas.Items[0].fat_vorig := Ffatu.notas.Items[0].valor_total;
	      Ffatu.notas.Items[0].fat_vliq  := Ffatu.notas.Items[0].valor_total;
      end;

      if Ffatu.notas.Items[0].erros.Count > 0 then
      begin
        if Ffatu.Transacao.InTransaction then
          Ffatu.Transacao.Rollback;

        vDadosIni.ShowErro(Ffatu.erros.formato_string(10));
        Exit;
      end;

      //Salvar nota no banco de dados
      Ffatu.notas.Items[0].salvar(False);

      if Ffatu.notas.Items[0].erros.Count > 0 then
      begin
        if Ffatu.Transacao.InTransaction then
          Ffatu.Transacao.Rollback;

        vDadosIni.ShowErro(Ffatu.erros.formato_string(10));
        Exit;
      end;

      //Salvando dados da nota fiscal nos pedidos
    	Ffatu.pedidos.Items[0].pedvenda_dados_nf_salvar(False);

      if Ffatu.pedidos.Items[0].erros.Count > 0 then
      begin
        if Ffatu.Transacao.InTransaction then
          Ffatu.Transacao.Rollback;

        vDadosIni.ShowErro(Ffatu.pedidos.Items[0].erros.formato_string(10));
        Exit;
      end;

      if Ffatu.Transacao.InTransaction then
	      Ffatu.Transacao.Commit;

      if vDadosIni.vEmp.vNfe.modeloNF <> '55' then
        exit;

      if hdNFE = 0 then
        carregaDLLNfe;
      if hdNFE > 0 then
      begin
        SetLength(Anfs, Ffatu.notas.Count);
        for I := 0 to Pred(Ffatu.notas.Count) do
          Anfs[I] := Ffatu.notas.Items[I].cod_nf;

        if not DFeHwLib.Autorizar(Anfs, AstrWide) then
          if Trim(AstrWide) <> '' then
          begin
            vErros := AstrWide;
            if pExibirMensagem then
              Application.MessageBox(PChar(trim(vErros)), 'Atenção', MB_ICONERROR + MB_OK);
            Ffatu.erros.New(AstrWide);
          end;
      end;
    end
    else
    begin
    	if pCodNF <= 0 then
      begin
      	SqlOpen('select cod_nf from notafiscal' +
          ' where num_nf = ' + IntToStr(pNumNF) +
          ' and serie = ' + QuotedStr(pSerieNF) +
          vDadosIni.IfThen(trim(vDadosIni.vEmp.vNfe.modeloNF) = '55',
          	' and modelo_nf = ' + QuotedStr(trim(vDadosIni.vEmp.vNfe.modeloNF)), '') +
          ' and cod_empresa = ' + vDadosIni.codEmpresa +
          ' and natureza_nf = ''S'' ', buscas);
        vCodNF := buscas.FieldByName('cod_nf').AsInteger;
      end;

      if vDadosIni.IfThen(pCodNF > 0, pCodNF, vCodNF) <= 0 then
      begin
      	if pExibirMensagem then
          Application.MessageBox(PChar('Nota Fiscal não encontrada.' + #13 + #13 +
            'NF' + #13 +
            'Número NF: ' + IntToStr(pNumNF) +  #13 +
            'Série NF: ' + trim(pSerieNF) + #13 +
            'Modelo NF: ' + trim(vDadosIni.vEmp.vNfe.modeloNF) +
            'Favor verificar antes de continuar.'), 'Atenção', MB_ICONERROR + MB_OK);
        Exit;
      end
      else
      begin
        SqlOpen(' select cod_nf, cod_empresa, situacao_nfe from notafiscal ' +
          ' where cod_nf = ' + IntToStr(vDadosIni.IfThen(pCodNF > 0, pCodNF, vCodNF)) +
          ' and cod_empresa = ' + vDadosIni.codEmpresa, buscas);
        if (trim(buscas.FieldByName('situacao_nfe').AsString) = '')
          or (trim(buscas.FieldByName('situacao_nfe').AsString) = sitEnviando)
          or (trim(buscas.FieldByName('situacao_nfe').AsString) = sitEmProcessamento) then
        begin
          if vDadosIni.vEmp.vNfe.modeloNF <> '55' then
            exit;

          if hdNFE = 0 then
            carregaDLLNfe;
          if hdNFE > 0 then
          begin
            SetLength(Anfs, 1);
            Anfs[0] := buscas.FieldByName('cod_nf').AsInteger;

            if not DFeHwLib.Autorizar(Anfs, AstrWide) then
              if Trim(AstrWide) <> '' then
              begin
                vErros := AstrWide;
                if pExibirMensagem then
                  Application.MessageBox(PChar(trim(vErros)), 'Atenção', MB_ICONERROR + MB_OK);
                Ffatu.erros.New(AstrWide);
              end;
          end;
        end
        else if (trim(buscas.FieldByName('situacao_nfe').AsString) <> sitAutorizada) then
        begin
        	if pExibirMensagem then
            Application.MessageBox(PChar('Não é possível enviar Nota Fiscal.' + #13 +
              'NF' + #13 +
              'Cod NF: ' + IntToStr(vDadosIni.IfThen(pCodNF > 0, pCodNF, vCodNF)) +
              'Número NF: ' + IntToStr(pNumNF) +  #13 +
              'Série NF: ' + trim(pSerieNF) + #13 +
              'Modelo NF: ' + trim(vDadosIni.vEmp.vNfe.modeloNF) +  #13 +
              'Situação NF: ' + trim(buscas.FieldByName('situacao_nfe').AsString) + #13 + #13 +
              'Favor entrar no modulo de Nota Fiscal e verificar.'), 'Atenção', MB_ICONERROR + MB_OK);
          Exit;
        end;
      end;
    end;

  except on E: Exception do
    begin
      Result := False;
      Application.MessageBox(PChar('Erro ao enviar nf contratos cliente: ' + pchar(e.Message)), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro('Erro ao enviar nf contratos cliente: ' + e.Message);
    end;
  end;
end;

end.
