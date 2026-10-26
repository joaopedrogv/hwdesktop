unit UseCaseGerarRemessa;

interface

uses
  BaseUseCasePlugBoleto;

type

  TUseCaseGerarRemessa = class(TUseCaseBasePlugBoleto)
  public
    function Run(ids: array of Integer; diretorio: string): Boolean;
    function retornaSeqRemessa(pNomeArquivo: string): Integer;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  PlugBoletoRepo,
  ApiPlugBoleto,
  PlugBoletoModels,
  hw_utils,
  EncdDecd, config_sistema_class;

{ TUseCaseGerarRemessa }

function TUseCaseGerarRemessa.retornaSeqRemessa(pNomeArquivo: string): Integer;
begin
  var vNomeArquivo := pNomeArquivo.Trim();
    Result := 0;
    while (Pos('_', vNomeArquivo) > 0) do
    begin
      vNomeArquivo := Copy(vNomeArquivo, Pos('_', vNomeArquivo) + 1, Length(vNomeArquivo) - Pos('_', vNomeArquivo));
    end;

    if vNomeArquivo.Trim() <> '' then
      vNomeArquivo := Copy(vNomeArquivo, 1, Pos('.', vNomeArquivo) - 1);

    try
      Result := StrToInt(vNomeArquivo);
    except
      Result := 0;
    end;
end;

function TUseCaseGerarRemessa.Run(ids: array of Integer; diretorio: string): Boolean;
var
  boletosDB: Conexao_OOP;
  arrayboleto: TArray<string>;
  vAtivarConfiguracoesRemessaGeral: string;
  vExtensaoArquivoRemessa: string;
  vNomeArquivoRemessa: string;
  I: Integer;
  AConf: TConfig_sistema_class;
  vOrigemArq: string;
  vDestinoArq: string;
  vMens: string;
  vDia, vMes, vAno: Word;

  function apenasLetras(pTexto: string;
    CaseSensitive: Boolean = True): string;
  var
    I: Integer;
    TextoU, TextoL: string;
  begin
    Result := '';
    TextoU := UpperCase('ABCDEFGHIJKLMNOPQRSTUVXYWZ');
    TextoL := LowerCase('abcdefghijklmnopqrstuvxywz');

    for I := 1 to (Length(pTexto)) do
    begin
      if CaseSensitive then
      begin
        if (Pos(pTexto[I], TextoU) > 0) or (Pos(pTexto[I], TextoL) > 0) then
          Result := Result + pTexto[I];
      end
      else if Pos(UpperCase(pTexto[I]), TextoU) > 0 then
        Result := Result + pTexto[I];
    end;
  end;

begin
  Result := False;
  try
    diretorio := diretorio + 'REMESSA\';

    if Length(ids) = 0 then
      raise Exception.Create('Nenhum id de boleto informado para gerar remessa');

    InitUseCase();

    repo := TPlugBoletoRepoSingleton.GetInstance();
    api := TApiPlugBoletoSingleton.GetInstance();

    var conf := repo.GetConfigApi(CONF_API);

    if conf.empresaId <= 0 then
      raise Exception.Create('Configuração para boletos não encontrada no Cadastro de API');

    boletosDB := repo.GetBoletosRemessa(ids);
    if boletosDB.IsEmpty then
      raise Exception.Create('Nenhum boleto encontrado com os ids informados');

    var vCods := '';
    var vCodCobrebem := 0;
    var vBanco := '';

    if not boletosDB.IsEmpty then
    begin
      vCodCobrebem := boletosDB.fint('cod_cobrebem');
      vBanco       := boletosDB.fstr('banco');
    end;

    try
      Aconf               := TConfig_sistema_class.create;
      AConf.value1_b.Text := repo.retornaOutrosConf(vCodCobrebem);

      if Assigned(AConf) then
      begin
        vAtivarConfiguracoesRemessaGeral := AConf.ReadString('ConfRemessaGeral', 'Ativar Configuracoes (S ou N)', '');
        vExtensaoArquivoRemessa          := AConf.ReadString('ConfRemessaGeral', 'Extensao do arquivo de remessa', '');
        vNomeArquivoRemessa              := AConf.ReadString('ConfRemessaGeral', 'Nome do arquivo de remessa', '');

        if trim(vAtivarConfiguracoesRemessaGeral) <> 'S' then
        begin
          vExtensaoArquivoRemessa := 'REM';
          vNomeArquivoRemessa     := '';
        end;
      end
      else
      begin
        vAtivarConfiguracoesRemessaGeral := 'N';
        vExtensaoArquivoRemessa := 'REM';
        vNomeArquivoRemessa     := '';
      end;
    finally
      if Assigned(AConf) then
        FreeAndNil(AConf);
    end;

    boletosDB.First;
    while not boletosDB.Eof do
    begin
      if trim(boletosDB.fstr('nosso_numero_banco')) = '' then
        raise Exception
          .Create(Format('Boleto sem nosso número gerado' + sLineBreak + sLineBreak +
                         'Num Doc: %s'+ sLineBreak +
                         'Valor Doc: %f' + sLineBreak +
                         'Cliente: %s' + sLineBreak + sLineBreak +
                         'Por favor limpe os dados da remessa se necessário para gerar outra',
                         [boletosDB.fstr('n_doc_bol'),
                          boletosDB.ffloat('vl_doc_bol'),
                          boletosDB.fstr('razao')]))
      else if vCodCobrebem <> boletosDB.fint('cod_cobrebem') then
        raise Exception
          .Create(Format('Boleto informados de configurações diferentes' + sLineBreak + sLineBreak +
                         'Num Doc: %s'+ sLineBreak +
                         'Valor Doc: %f' + sLineBreak +
                         'Cliente: %s' + sLineBreak + sLineBreak +
                         'Nosso Número: %s' + sLineBreak + sLineBreak +
                         'Por favor selecionar boletos da mesma configuração antes de continuar',
                         [boletosDB.fstr('n_doc_bol'),
                          boletosDB.ffloat('vl_doc_bol'),
                          boletosDB.fstr('razao')]))
      else if trim(boletosDB.fstr('api_idremintegracao')) <> '' then
        raise Exception
          .Create(Format('Boleto já possui remessa gerada pela API' + sLineBreak + sLineBreak +
                         'Num Doc: %s'+ sLineBreak +
                         'Valor Doc: %f' + sLineBreak +
                         'Cliente: %s' + sLineBreak +
                         'Nosso Número: %s' + sLineBreak + sLineBreak +
                         'Por favor limpe os dados da remessa se necessário para gerar outra',
                         [boletosDB.fstr('n_doc_bol'),
                          boletosDB.ffloat('vl_doc_bol'),
                          boletosDB.fstr('razao'),
                          boletosDB.fstr('nosso_numero_banco')]))
      else if trim(boletosDB.fstr('remessa_enviada')) = 'S' then
        raise Exception
          .Create(Format('Boleto já possui remessa gerada' + sLineBreak + sLineBreak +
                         'Num Doc: %s'+ sLineBreak +
                         'Valor Doc: %f' + sLineBreak +
                         'Cliente: %s' + sLineBreak +
                         'Nosso Número: %s' + sLineBreak + sLineBreak +
                         'Por favor limpe os dados da remessa se necessário para gerar outra',
                         [boletosDB.fstr('n_doc_bol'),
                          boletosDB.ffloat('vl_doc_bol'),
                          boletosDB.fstr('razao'),
                          boletosDB.fstr('nosso_numero_banco')]));

      vCods := vCods + IfThen(trim(vCods) <> '', ',') + boletosDB.fstr('api_idintegracao');

      boletosDB.Next;
    end;

    if vCods = '' then
      raise Exception.Create('Nenhum boleto encontrado com os ids informados');

    var count := Length(ids);
    var boletos := api.GetBoleto(['limit=' + count.ToString, 'idintegracao=' + vCods]);

    if not Assigned(boletos) then
      raise Exception.Create('Consulta boletos sem resposta da API');

    if not boletos._status.Trim.Equals(STS_SUCESSO) then
      if not boletos._mensagem.IsEmpty then
        raise Exception.Create(boletos._mensagem)
      else
        raise Exception.Create('Nenhum boleto encontrado com os parametros informados');


    setLength(arrayboleto, Length(boletos._dados));
    for I := 0 to Length(boletos._dados) - 1 do
      arrayboleto[I] := boletos._dados[I].idintegracao;

    var _dados := api.PostRemessa(arrayboleto);

    vMens := '';
    if Assigned(_dados.sucesso) then
    begin
      for I := 0 to Length(_dados.sucesso._dados._falha) - 1 do
      begin
        var vNossoNumero := repo.SqlOpen(' select bol.nosso_numero_banco from boletas bol ' +
          ' where bol.api_idintegracao = ' + QuotedStr(_dados.sucesso._dados._falha[I].idintegracao) +
          ' and bol.cod_empresa = ' + IntToStr(repo.CodEmpresa)).FieldByName('nosso_numero_banco').AsString;

        if trim(vNossoNumero) <> '' then
          vMens := vMens + vNossoNumero + ' ' + _dados.sucesso._dados._falha[I]._erro + #13
        else
          vMens := vMens + _dados.sucesso._dados._falha[I].idintegracao + ' ' + _dados.sucesso._dados._falha[I]._erro + #13;
      end;

      if trim(vMens) <> '' then
        ShowWarning(vMens);

      if not repo.PostRemessa(_dados.sucesso, vCodCobrebem, diretorio) then
        raise Exception.Create('Não foi possivel salvar dados remesssa nos boletos retornados pela API. Consulte o log para mais detalhes');

      if _dados.sucesso._dados._sucesso[0].TransmissaoAutomatica then
        ShowAtencao('Arquivo de remessa enviado ao banco')
      else
      begin
        vOrigemArq := diretorio + '\' + UpperCase(_dados.sucesso._dados._sucesso[0].Arquivo);

        var vSequenciaRem := retornaSeqRemessa(_dados.sucesso._dados._sucesso[0].Arquivo);

        var vTmp := vBanco + '_' + StrZero(vCodCobrebem, 3) + '_' + IntToStr(vSequenciaRem);

        if (trim(vAtivarConfiguracoesRemessaGeral) = 'S')
          and (UpperCase(trim(vExtensaoArquivoRemessa)) <> '')
          and (UpperCase(trim(vExtensaoArquivoRemessa)) <> 'REM') then
        begin
          vTmp := vTmp + '.' + apenasLetras(trim(vExtensaoArquivoRemessa));
        end
        else
        begin
          vTmp := vTmp + '.REM';
        end;

        if FileExists(vOrigemArq) then
        begin
          if (trim(vNomeArquivoRemessa) <> '')
            and (ContainsText(UpperCase(trim(vNomeArquivoRemessa)), 'MDD'))
            and (ContainsStr(UpperCase(trim(vNomeArquivoRemessa)), '.001')) then
          begin
            DecodeDate(Date, vAno, vMes, vDia);

            vTmp := UpperCase(trim(vNomeArquivoRemessa));

            if vMes <= 9 then
              vTmp := StringReplace(vTmp, 'M', IntToStr(vMes), [rfReplaceAll])
            else if vMes = 10 then
              vTmp := StringReplace(vTmp, 'M', 'O', [rfReplaceAll])
            else if vMes = 11 then
              vTmp := StringReplace(vTmp, 'M', 'N', [rfReplaceAll])
            else
              vTmp := StringReplace(vTmp, 'M', 'D', [rfReplaceAll]);

            vTmp := StringReplace(vTmp, 'DD.', StrZero(vDia, 2) + '.', [rfReplaceAll]);

            while FileExists(diretorio + '\' + vTmp) do
            begin
              var vTmp2 := Copy(vTmp, Pos('.', vTmp) + 1, 3);
              var vTmp3 := StrZero(StrToInt(Copy(vTmp, Pos('.', vTmp) + 1, 3)) + 1, 3);
              vTmp := StringReplace(vTmp, '.' + vTmp2, '.' + vTmp3, [rfReplaceAll]);
            end;
          end;

          vDestinoArq := diretorio + '\' + vTmp;

          RenameFile(vOrigemArq, vDestinoArq);

          if not FileExists(vDestinoArq) then
            raise Exception.Create('Não foi possivel renomear a remessa. De: ' + vOrigemArq + ' Para: ' + vDestinoArq);

          ShowAtencao('Arquivo de remessa criado. Na pasta: ' + sLineBreak +
            vDestinoArq);
        end;
      end;
    end;

    Result := True;
  except on E: Exception do
    begin
      Result := False;
      LastError := E.message;
      ShowAtencao('Erro ao gerar remessa' + sLineBreak + sLineBreak + E.Message);
    end;
  end;
end;

end.
