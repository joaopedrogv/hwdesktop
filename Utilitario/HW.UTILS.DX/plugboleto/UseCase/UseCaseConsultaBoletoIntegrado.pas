unit UseCaseConsultaBoletoIntegrado;

interface

uses
  BaseUseCasePlugBoleto,
  BoletoResponseModels;

type

  TUseCaseConsultaBoletoIntegrado = class(TUseCaseBasePlugBoleto)
  strict private
    procedure DownloadPDFs(payload: TGetBoletoResponse; ids: array of Integer);
  public
    function Run(payload: TPostBoletoResponseSucesso): Boolean; overload;
    function Run(ids: array of Integer): Boolean; overload;
    function AtualizaDadosRet(ids: string; idintegracaoret: string; count: Integer = 1): Boolean; overload;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  System.NetEncoding,
  PlugBoletoRepo,
  ApiPlugBoleto,
  PlugBoletoModels,
  BoletoModel,
  hw_utils, hw_win_utils;

{ TUseCaseConsultaBoletoIntegrado }

function TUseCaseConsultaBoletoIntegrado.Run(payload: TPostBoletoResponseSucesso): Boolean;
var
  item: TBoleto;
  boletosDB: Conexao_OOP;
  integrado: TBoletoIntegrado;
  consultaNova: boolean;
  I: Integer;
begin
  Result := False;
  try
    if Length(payload._dados._sucesso) = 0 then
      raise Exception.Create('Nenhum boleto encontrado para consultar');

    InitUseCase();

    repo := TPlugBoletoRepoSingleton.GetInstance();
    repo.vConfigAPI := repo.retornaConfAPI;

    api := TApiPlugBoletoSingleton.GetInstance();

    var ids := '';
    var count := 0;

    for integrado in payload._dados._sucesso do
      if integrado.situacao.ToUpper.Trim.Equals(SIT_SALVO) then
      begin
        ids := ids + IfThen(not ids.IsEmpty, ',') + integrado.idintegracao;
        count := count + 1;
      end;

    if ids.IsEmpty then
      raise Exception.Create('Nenhum boleto SALVO para consultar');

    for I := 1 to repo.vConfigAPI.qtde_tentativas do
    begin
      consultaNova := false;

      if (I > 1) then
      begin
        Sleep(repo.vConfigAPI.tempo_entre_tentativas);
        Sleep(repo.vConfigAPI.tempo_aguarda_cada_tentativas);
      end;

      var boletos := api.GetBoleto(['limit=' + count.ToString, 'idintegracao=' + ids]);

      if not Assigned(boletos) then
        raise Exception.Create('Consulta boletos sem resposta da API');

      if not boletos._status.Trim.Equals(STS_SUCESSO) then
        if not boletos._mensagem.IsEmpty then
          raise Exception.Create(boletos._mensagem)
        else
          raise Exception.Create('Nenhum boleto encontrado com os parametros informados');

      for var itemOk in boletos._dados do
      begin
        if itemOk.situacao = 'SALVO' then
        begin
          consultaNova := True;
          Break;
        end
        else if trim(itemOk.TituloNossoNumeroImpressao) = '' then
        begin
          consultaNova := True;
          Break;
        end
      end;

      if not consultaNova then
      begin
        if not repo.PostBoletos(boletos) then
          raise Exception.Create('Não foi possivel salvar dados do boleto retornados pela API. Consulte o log para mais detalhes');

        DownloadPDFs(boletos, []);

        Break;
      end;
    end;

    Result := True;

  except on E: Exception do
    begin
      Result := False;
      LastError := E.message;
      ShowAtencao('Erro ao consultar boleto(s)' + sLineBreak + sLineBreak + E.Message);
    end;
  end;
end;

procedure TUseCaseConsultaBoletoIntegrado.DownloadPDFs(
  payload: TGetBoletoResponse; ids: array of Integer);
var
  boletosDB: Conexao_OOP;
  pdfs: TArray<TBoletoPdfBase64Model>;
  pdfB64: TBoletoPdfBase64Model;
  files: TArray<string>;
  fileName: string;
  I: Integer;
  newIds: array of Integer;
begin
  try
    files := [];
    pdfs := [];
    try
      if Assigned(payload) then
      begin
        SetLength(newIds, 0);
        for var item in payload._dados do
          begin
            SetLength(newIds, Length(newIds) + 1);
            newIds[High(newIds)] := item.TituloCodigoReferencia.Substring(0, item.TituloCodigoReferencia.IndexOf('-')).toInteger;
          end;
      end
      else
      begin
        SetLength(newIds, Length(ids));
        for I := Low(ids) to High(ids) do
          newIds[I] := ids[I];
      end;

      boletosDB := repo.GetBoletos(newIds);
      while not boletosDB.Eof do
      begin
        if (not boletosDB.fempty('api_idintegracao'))
          and (not boletosDB.fempty('htmlboleto'))
          and (boletosDB.fstr('htmlboleto').Contains('eyJzdGF0dXNDb2RlIjo1MDAsIm1lc3NhZ2UiOiJJbnRlcm5hbCBzZXJ2ZXIgZXJyb3IifQ=='))
          and (MatchText(boletosDB.fstr('api_situacao'), [SIT_EMITIDO, SIT_REGISTRADO, SIT_LIQUIDADO, SIT_BAIXADO])) then
        begin
          files := files + api.DownloadlPDFBoleto([boletosDB.fstr('api_urlboleto')]);

          fileName := files[High(files)];

          if FileExists(fileName) then
          begin
            pdfB64 := TBoletoPdfBase64Model.Create;
            pdfB64.pdfBase64 := Base64Helper.EncodeFile(fileName);
            pdfB64.nSeqBol := boletosDB.fint('n_seq_bol');
            pdfB64.idIntegracao := boletosDB.fstr('api_idintegracao');

            pdfs := pdfs + [pdfB64];
          end;
        end
        else if (not boletosDB.fempty('api_idintegracao'))
          and (not boletosDB.fstr('htmlboleto', 1, boletosDB.fstr('api_idintegracao').Length + 1).Equals(boletosDB.fstr('api_idintegracao') + '|'))
          and (MatchText(boletosDB.fstr('api_situacao'), [SIT_EMITIDO, SIT_REGISTRADO, SIT_LIQUIDADO, SIT_BAIXADO])) then
        begin
          files := files + api.DownloadlPDFBoleto([boletosDB.fstr('api_urlboleto')]);

          fileName := files[High(files)];

          if FileExists(fileName) then
          begin
            pdfB64 := TBoletoPdfBase64Model.Create;
            pdfB64.pdfBase64 := Base64Helper.EncodeFile(fileName);
            pdfB64.nSeqBol := boletosDB.fint('n_seq_bol');
            pdfB64.idIntegracao := boletosDB.fstr('api_idintegracao');

            pdfs := pdfs + [pdfB64];
          end;
        end;

        boletosDB.Next;
      end;

      repo.PostBoletos(pdfs);

    finally
      for fileName in files do
        DeleteFile(fileName);
    end;

  except on E: Exception do
    begin
      LogApp.Error('TUseCaseConsultaBoletoIntegrado.DownloadPDFs ' + E.Message);
    end;
  end;
end;

function TUseCaseConsultaBoletoIntegrado.Run(ids: array of Integer): Boolean;
var
  boletosDB: Conexao_OOP;
  I: Integer;
begin
  Result := False;
  try
    if Length(ids) = 0 then
      raise Exception.Create('Nenhum boleto encontrado para consultar');

    InitUseCase();

    repo := TPlugBoletoRepoSingleton.GetInstance();
    api := TApiPlugBoletoSingleton.GetInstance();

    var count := Length(ids);
    var idint := '';

    for I := Low(ids) to High(ids) do
    begin
       boletosDB := repo.GetBoletos(ids[I]);

      if boletosDB.fempty('api_idintegracao') then
        raise Exception
          .Create(Format('Boleto não encontrado (API)' + sLineBreak + sLineBreak +
                         'Num Doc: %s' + sLineBreak +
                         'Valor Doc: %f' + sLineBreak +
                         'Cliente: %s' + sLineBreak + sLineBreak +
                         'Por favor descarte o boleto se necessário para emitir outro',
                         [boletosDB.fstr('n_doc_bol'),
                          boletosDB.ffloat('vl_doc_bol'),
                          boletosDB.fstr('razao')]));


      idint := idint + IfThen(not idint.IsEmpty, ',') +
        boletosDB.fstr('api_idintegracao');
    end;

    var boletos := api.GetBoleto(['limit=' + count.ToString, 'idintegracao=' + idint]);

    if not Assigned(boletos) then
      raise Exception.Create('Consulta boletos sem resposta da API');

    if Length(boletos._dados) <= 0 then
      raise Exception
          .Create(Format('Boleto não encontrado (API)' + sLineBreak + sLineBreak +
                         'Num Doc: %s' + sLineBreak +
                         'Valor Doc: %f' + sLineBreak +
                         'Cliente: %s' + sLineBreak + sLineBreak +
                         'Por favor descarte o boleto se necessário para emitir outro',
                         [boletosDB.fstr('n_doc_bol'),
                          boletosDB.ffloat('vl_doc_bol'),
                          boletosDB.fstr('razao')]));

    if not boletos._status.Trim.Equals(STS_SUCESSO) then
      if not boletos._mensagem.IsEmpty then
        raise Exception.Create(boletos._mensagem)
      else
        raise Exception.Create('Nenhum boleto encontrado com os parametros informados');

    if not repo.PostBoletos(boletos) then
      raise Exception.Create('Não foi possivel salvar dados do boleto retornados pela API. Consulte o log para mais detalhes');

    DownloadPDFs(nil, ids);

    Result := True;
  except on E: Exception do
    begin
      Result := False;
      LastError := E.message;
      ShowAtencao('Erro ao consultar boleto(s)' + sLineBreak + sLineBreak + E.Message);
    end;
  end;
end;

function TUseCaseConsultaBoletoIntegrado.AtualizaDadosRet(ids: string; idintegracaoret: string; count: Integer = 1): Boolean;
begin
   Result := False;
  try
    if trim(ids) = '' then
      raise Exception.Create('Nenhum boleto encontrado para consultar');

    InitUseCase();

    repo := TPlugBoletoRepoSingleton.GetInstance();
    api := TApiPlugBoletoSingleton.GetInstance();

    var vcount := count;

    var boletos := api.GetBoleto(['limit=' + vcount.ToString, 'idintegracao=' + ids]);

    if not Assigned(boletos) then
      raise Exception.Create('Consulta boletos sem resposta da API');

    if not boletos._status.Trim.Equals(STS_SUCESSO) then
      if not boletos._mensagem.IsEmpty then
        raise Exception.Create(boletos._mensagem)
      else
        raise Exception.Create('Nenhum boleto encontrado com os parametros informados');

    if not repo.PostBoletos(boletos, idintegracaoret) then
      raise Exception.Create('Não foi possivel salvar dados do boleto retornados pela API. Consulte o log para mais detalhes');

    Result := True;
 except on E: Exception do
    begin
      Result := False;
      LastError := E.message;
      ShowAtencao('Erro ao consultar/atualizar boleto(s)' + sLineBreak + sLineBreak + E.Message);
    end;
  end;
end;


end.
