unit UseCaseEmitirBoletos;

interface

uses
  BaseUseCasePlugBoleto;

type

  TUseCaseEmitirBoletos = class(TUseCaseBasePlugBoleto)
  public
    function Run(ids: array of Integer): Boolean;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  System.Math,
  PlugBoletoRepo,
  ApiPlugBoleto,
  PlugBoletoModels,
  hw_utils,
  UseCaseConsultaBoletoIntegrado,
  UseCaseImprimirBoleto;

{ TUseCaseEmitirBoletos }

function TUseCaseEmitirBoletos.Run(ids: array of Integer): Boolean;
var
  payload: TArray<TBoleto>;
  item: TBoleto;
  boletosDB: Conexao_OOP;
  vEmitirBoletos: boolean;
  imprimirbol: boolean;
  vmensagem, vmensagem2, vmensagem3, vmensagem4, vmensagem5, vmensagem6, vmensagem7: string;
  vobs_bol, vobs_bol1, vmensagem_bol, vmensagem_adc, videntificacaocedente, videntificacaocedente1, vhomologacao: boolean;
  vobs_homologacao: string;
begin
  Result := False;

  vobs_homologacao :=  'BOLETO EMITIDO EM AMBIENTE DE HOMOLOGAÇÃO';
  try
    if Length(ids) = 0 then
      raise Exception.Create('Nenhum id de boleto informado para emitir');

    InitUseCase();

    repo := TPlugBoletoRepoSingleton.GetInstance();
    api := TApiPlugBoletoSingleton.GetInstance();

    var conf := repo.GetConfigApi(CONF_API);

    if conf.empresaId <= 0 then
      raise Exception.Create('Configuração para boletos não encontrada no Cadastro de API');

    boletosDB := repo.GetBoletos(ids);
    if boletosDB.IsEmpty then
      raise Exception.Create('Nenhum boleto encontrado com os ids informados');

    vEmitirBoletos := False;

    if not TryStrToBool(ParamsUC['print'], imprimirbol) then
      imprimirbol := True;

    while not boletosDB.Eof do
    begin
//      if not boletosDB.fempty('api_idintegracao') then
//        raise Exception
//          .Create(Format('Boleto já possui integração com a API' + sLineBreak + sLineBreak +
//                         'Num Doc: %s' + sLineBreak +
//                         'Valor Doc: %f' + sLineBreak +
//                         'Cliente: %s' + sLineBreak + sLineBreak +
//                         'Por favor descarte o boleto se necessário para emitir outro',
//                         [boletosDB.fstr('n_doc_bol'),
//                          boletosDB.ffloat('vl_doc_bol'),
//                          boletosDB.fstr('razao')]));

      if boletosDB.fempty('api_idintegracao') then
      begin
        vEmitirBoletos := True;

        item := TBoleto.Create;

        if trim(boletosDB.fstr('qrcode_pix')) = 'S' then
          item.Hibrido := True
        else
          item.Hibrido := False;

        item.CedenteContaCodigoBanco := StrZero(Trim(boletosDB.fstr('banco').Trim.ToUpper), 3);
        item.CedenteContaNumero := OnlyNumber(boletosDB.fstr('numerocontacorrente', 1, Length(boletosDB.fstr('numerocontacorrente')) - 1)).Trim.ToUpper;
        item.CedenteContaNumeroDV := boletosDB.fstr('numerocontacorrente', Length(boletosDB.fstr('numerocontacorrente')), 1).Trim.ToUpper;

        //if StrZero(boletosDB.fstr('banco').Trim.ToUpper, 3) = '756' then
        //  item.CedenteConvenioNumero   := OnlyNumber(boletosDB.fstr('numerocontacorrente', 1, Length(boletosDB.fstr('numerocontacorrente')) - 1)).Trim.ToUpper
        //else

        item.CedenteConvenioNumero   := boletosDB.fstr('codigoconvenio').Trim.ToUpper;
        item.TituloCodigoReferencia    := Format('%d-%d', [boletosDB.fint('n_seq_bol'), boletosDB.fint('cod_empresa')]).ToUpper;

        {$REGION 'dados do Sacado'}
        var emails := NewStringList(StrReplace(boletosDB.fstr('email'), [',', ';', ' ', '|'], ';'), ';');
        var email := '';
        if emails.Count > 0 then
          email := emails[0];

        item.SacadoCPFCNPJ := boletosDB.fstr('cpfcgc');
        item.SacadoEnderecoLogradouro := boletosDB.fstr('end_cobranca');
        item.SacadoEmail := email;
        item.SacadoEnderecoNumero := '';//boletosDB.fstr('num_end_cobranca');
        item.SacadoEnderecoBairro := boletosDB.fstr('bairro_cobranca');
        item.SacadoEnderecoCep := boletosDB.fstr('cep_cobranca');
        item.SacadoEnderecoCidade := boletosDB.fstr('cida_cobranca');
        item.SacadoEnderecoComplemento := '';//boletosDB.fstr('complementoida_cobranca');
        item.SacadoEnderecoPais := boletosDB.fstr('nome_pais');
        item.SacadoEnderecoUf := boletosDB.fstr('sigla_uf');
        item.SacadoNome := boletosDB.fstr('razao');
        item.SacadoTelefone := boletosDB.fstr('fone_cliente');
        item.SacadoCelular := boletosDB.fstr('fone_celular');
        {$ENDREGION}

        {$REGION 'dados do Titulo'}
        item.TituloNossoNumero := boletosDB.retirar_zeros_esquerda(boletosDB.fstr('api_nossoNumero'));

        if (boletosDB.ffloat('vl_desc_bol') > 0) then
          item.TituloValor := Format('%0.2f', [boletosDB.ffloat('vl_doc_bol') + boletosDB.ffloat('vl_desc_bol')])
        else
          item.TituloValor := Format('%0.2f', [boletosDB.ffloat('vl_doc_bol')]);
        item.TituloNumeroDocumento := boletosDB.fstr('n_doc_bol');
        item.TituloDataEmissao := FormatDateTime('dd/MM/yyyy', boletosDB.fdate('data_em_bol'));
        item.TituloDataVencimento := FormatDateTime('dd/MM/yyyy', boletosDB.fdate('data_ven_bol'));
        item.TituloDocEspecie := boletosDB.fstr('n_doc_bol');
        item.TituloLocalPagamento := UTF8Encode(boletosDB.fstr('localpag'));
        item.TituloCodDesconto := '';
        item.TituloDataDesconto := '';
        item.TituloValorDescontoTaxa := '';
        item.TituloCodDesconto2 := '';
        item.TituloDataDesconto2 := '';
        item.TituloValorDescontoTaxa2 := '';
        item.TituloValorDesconto := '';
        item.TituloCodigoJuros := '';
        item.TituloDataJuros := '';
        item.TituloValorJuros := '';
        item.TituloCodigoMulta := '';
        item.TituloDataMulta := '';
        item.TituloValorMultaTaxa := '';
        item.TituloValorMulta := '';
        item.TituloCodProtesto := '';
        item.TituloPrazoProtesto := '';
        item.TituloCodBaixaDevolucao := '';
        item.TituloPrazoBaixa := '';
        item.TituloSacadorAvalista := '';
        item.TituloSacadorAvalistaEndereco := '';
        item.TituloSacadorAvalistaCidade := '';
        item.TituloSacadorAvalistaCEP := '';
        item.TituloSacadorAvalistaUF := '';
        item.TituloInscricaoSacadorAvalista := '';
        item.TituloEmissaoBoleto := 'B';
        item.TituloCategoria := '2';
        item.TituloPostagemBoleto := 'N';
        item.TituloCodEmissaoBloqueto := '';
        item.TituloOutrosAcrescimos := '';
        item.TituloInscricaoSacadorAvalista := '';
        if (boletosDB.fint('nparcela') > 0)  then
          item.TituloParcela := StrZero(boletosDB.fint('nparcela'), 2);

        if trim(boletosDB.fstr('outrodadoconfiguracao2')) <> '' then
          item.TituloVariacaoCarteira := trim(boletosDB.fstr('outrodadoconfiguracao2'))
        else
          item.TituloVariacaoCarteira := '';

        if trim(boletosDB.fstr('tipodocumentocobranca')) = '' then
          item.TituloDocEspecie := '01'
        else
          item.TituloDocEspecie := Copy(trim(boletosDB.fstr('tipodocumentocobranca')), 1, 2);
        item.TituloAceite := 'N';

        item.TituloLocalPagamento := UTF8Encode(Copy(trim(boletosDB.fstr('localpag')), 1, 200));

        item.TituloInstrucoes := '';

        item.TituloInstrucoes := boletosDB.fstr('obs_bol1');

        if (boletosDB.ffloat('vl_desc_bol') > 0) then
           if (boletosDB.fstr('mensagem_desc').Trim() <> '') then
           begin
             if trim(item.TituloInstrucoes) <> '' then
               item.TituloInstrucoes := item.TituloInstrucoes + ' ';

             item.TituloInstrucoes := item.TituloInstrucoes + boletosDB.fstr('mensagem_desc').Trim();
           end;

        if (boletosDB.ffloat('multas') > 0)
          and (StrToFloat(FormatFloat('0.00', ((boletosDB.ffloat('vl_doc_bol') * (boletosDB.ffloat('multas') / 100))))) > 0)
          and (boletosDB.ffloat('tx_juros') > 0)
          and (StrToFloat(FormatFloat('0.00', ((boletosDB.ffloat('vl_doc_bol') * (boletosDB.ffloat('tx_juros') / 100)) / 30))) > 0) then
        begin
          if trim(item.TituloInstrucoes) <> '' then
            item.TituloInstrucoes := item.TituloInstrucoes + ' ';

          item.TituloInstrucoes := item.TituloInstrucoes +
            Copy(
                 'APÓS VENCIMENTO COBRAR MULTA DE R$' + FormatFloat('0.00', ((boletosDB.ffloat('vl_doc_bol') * (boletosDB.ffloat('multas') / 100)))) +
                 ' E JUROS DE R$ '+ FormatFloat('0.00', ((boletosDB.ffloat('vl_doc_bol') * (boletosDB.ffloat('tx_juros') / 100)) / 30)) + ' AO DIA'
              , 1, 100);
        end
        else if (boletosDB.ffloat('multas') > 0)
          and (StrToFloat(FormatFloat('0.00', ((boletosDB.ffloat('vl_doc_bol') * (boletosDB.ffloat('multas') / 100))))) > 0) then
        begin
          if trim(item.TituloInstrucoes) <> '' then
            item.TituloInstrucoes := item.TituloInstrucoes + ' ';

          item.TituloInstrucoes := item.TituloInstrucoes +
            Copy(
                 'APÓS VENCIMENTO COBRAR MULTA DE R$' + FormatFloat('0.00', ((boletosDB.ffloat('vl_doc_bol') * (boletosDB.ffloat('multas') / 100))))
              , 1, 100);
        end
        else if (boletosDB.ffloat('tx_juros') > 0)
          and (StrToFloat(FormatFloat('0.00', ((boletosDB.ffloat('vl_doc_bol') * (boletosDB.ffloat('tx_juros') / 100)) / 30))) > 0) then
        begin
          if trim(item.TituloInstrucoes) <> '' then
            item.TituloInstrucoes := item.TituloInstrucoes + ' ';

          item.TituloInstrucoes := item.TituloInstrucoes +
            Copy(
                 'APÓS VENCIMENTO COBRAR JUROS DE R$ '+ FormatFloat('0.00', ((boletosDB.ffloat('vl_doc_bol') * (boletosDB.ffloat('tx_juros') / 100)) / 30)) + ' AO DIA'
              , 1, 100);
        end;

        item.TituloInstrucoes := UTF8Encode(item.TituloInstrucoes);

        vobs_bol := false;
        vobs_bol1 := false;
        vmensagem_bol := false;
        vmensagem_adc := false;
        videntificacaocedente := false;
        videntificacaocedente1 := false;
        vhomologacao := false;

        vmensagem  := '';
        vmensagem2 := '';
        vmensagem3 := '';
        vmensagem4 := '';
        vmensagem5 := '';
        vmensagem6 := '';
        vmensagem7 := '';

        if (trim(boletosDB.fstr('obs_bol')) <> '') and (not vobs_bol) then
        begin
          vmensagem  := trim(boletosDB.fstr('obs_bol'));
          vobs_bol := true;
        end
        else if (trim(boletosDB.fstr('obs_bol1')) <> '') and (not vobs_bol1) then
        begin
          vmensagem  := trim(boletosDB.fstr('obs_bol1'));
          vobs_bol1 := true;
        end
        else if (trim(boletosDB.fstr('mensagem_bol')) <> '') and (not vmensagem_bol) then
        begin
          vmensagem  := trim(boletosDB.fstr('mensagem_bol'));
          vmensagem_bol := true;
        end
        else if (trim(boletosDB.fstr('mensagem_adc')) <> '') and (not vmensagem_adc) then
        begin
          vmensagem  := trim(boletosDB.fstr('mensagem_adc'));
          vmensagem_adc := true;
        end
        else if (trim(boletosDB.fstr('identificacaocedente')) <> '') and (not videntificacaocedente) then
        begin
          vmensagem  := trim(boletosDB.fstr('identificacaocedente'));
          videntificacaocedente := true;
        end
        else if (trim(boletosDB.fstr('identificacaocedente1')) <> '') and (not videntificacaocedente1) then
        begin
          vmensagem  := trim(boletosDB.fstr('identificacaocedente1'));
          videntificacaocedente1 := true;
        end
        else if (repo.DevelopmentMode) and (trim(vobs_homologacao) <> '') and (not vhomologacao) then
        begin
          vmensagem := trim(vobs_homologacao);
          vhomologacao := true;
        end;

        if trim(vmensagem) <> '' then
          if (trim(boletosDB.fstr('obs_bol')) <> '') and (not vobs_bol) then
          begin
            vmensagem2 := trim(boletosDB.fstr('obs_bol'));
            vobs_bol := true;
          end
          else if (trim(boletosDB.fstr('obs_bol1')) <> '') and (not vobs_bol1) then
          begin
            vmensagem2 := trim(boletosDB.fstr('obs_bol1'));
            vobs_bol1 := true;
          end
          else if (trim(boletosDB.fstr('mensagem_bol')) <> '') and (not vmensagem_bol) then
          begin
            vmensagem2 := trim(boletosDB.fstr('mensagem_bol'));
            vmensagem_bol := true;
          end
          else if (trim(boletosDB.fstr('mensagem_adc')) <> '') and (not vmensagem_adc) then
          begin
            vmensagem2 := trim(boletosDB.fstr('mensagem_adc'));
            vmensagem_adc := true;
          end
          else if (trim(boletosDB.fstr('identificacaocedente')) <> '') and (not videntificacaocedente) then
          begin
            vmensagem2 := trim(boletosDB.fstr('identificacaocedente'));
            videntificacaocedente := true;
          end
          else if (trim(boletosDB.fstr('identificacaocedente1')) <> '') and (not videntificacaocedente1) then
          begin
            vmensagem2 := trim(boletosDB.fstr('identificacaocedente1'));
            videntificacaocedente1 := true;
          end
          else if (repo.DevelopmentMode) and (trim(vobs_homologacao) <> '') and (not vhomologacao) then
          begin
            vmensagem2 := trim(vobs_homologacao);
            vhomologacao := true;
          end;

        if trim(vmensagem2) <> '' then
          if (trim(boletosDB.fstr('obs_bol')) <> '') and (not vobs_bol) then
          begin
            vmensagem3 := trim(boletosDB.fstr('obs_bol'));
            vobs_bol := true;
          end
          else if (trim(boletosDB.fstr('obs_bol1')) <> '') and (not vobs_bol1) then
          begin
            vmensagem3 := trim(boletosDB.fstr('obs_bol1'));
            vobs_bol1 := true;
          end
          else if (trim(boletosDB.fstr('mensagem_bol')) <> '') and (not vmensagem_bol) then
          begin
            vmensagem3 := trim(boletosDB.fstr('mensagem_bol'));
            vmensagem_bol := true;
          end
          else if (trim(boletosDB.fstr('mensagem_adc')) <> '') and (not vmensagem_adc) then
          begin
            vmensagem3 := trim(boletosDB.fstr('mensagem_adc'));
            vmensagem_adc := true;
          end
          else if (trim(boletosDB.fstr('identificacaocedente')) <> '') and (not videntificacaocedente) then
          begin
            vmensagem3 := trim(boletosDB.fstr('identificacaocedente'));
            videntificacaocedente := true;
          end
          else if (trim(boletosDB.fstr('identificacaocedente1')) <> '') and (not videntificacaocedente1) then
          begin
            vmensagem3 := trim(boletosDB.fstr('identificacaocedente1'));
            videntificacaocedente1 := true;
          end
          else if (repo.DevelopmentMode) and (trim(vobs_homologacao) <> '') and (not vhomologacao) then
          begin
            vmensagem3 := trim(vobs_homologacao);
            vhomologacao := true;
          end;

        if trim(vmensagem3) <> '' then
          if (trim(boletosDB.fstr('obs_bol')) <> '') and (not vobs_bol) then
          begin
            vmensagem4 := trim(boletosDB.fstr('obs_bol'));
            vobs_bol := true;
          end
          else if (trim(boletosDB.fstr('obs_bol1')) <> '') and (not vobs_bol1) then
          begin
            vmensagem4 := trim(boletosDB.fstr('obs_bol1'));
            vobs_bol1 := true;
          end
          else if (trim(boletosDB.fstr('mensagem_bol')) <> '') and (not vmensagem_bol) then
          begin
            vmensagem4 := trim(boletosDB.fstr('mensagem_bol'));
            vmensagem_bol := true;
          end
          else if (trim(boletosDB.fstr('mensagem_adc')) <> '') and (not vmensagem_adc) then
          begin
            vmensagem4 := trim(boletosDB.fstr('mensagem_adc'));
            vmensagem_adc := true;
          end
          else if (trim(boletosDB.fstr('identificacaocedente')) <> '') and (not videntificacaocedente) then
          begin
            vmensagem4 := trim(boletosDB.fstr('identificacaocedente'));
            videntificacaocedente := true;
          end
          else if (trim(boletosDB.fstr('identificacaocedente1')) <> '') and (not videntificacaocedente1) then
          begin
            vmensagem4 := trim(boletosDB.fstr('identificacaocedente1'));
            videntificacaocedente1 := true;
          end
          else if (repo.DevelopmentMode) and (trim(vobs_homologacao) <> '') and (not vhomologacao) then
          begin
            vmensagem4 := trim(vobs_homologacao);
            vhomologacao := true;
          end;

        if trim(vmensagem4) <> '' then
          if (trim(boletosDB.fstr('obs_bol')) <> '') and (not vobs_bol) then
          begin
            vmensagem5 := trim(boletosDB.fstr('obs_bol'));
            vobs_bol := true;
          end
          else if (trim(boletosDB.fstr('obs_bol1')) <> '') and (not vobs_bol1) then
          begin
            vmensagem5 := trim(boletosDB.fstr('obs_bol1'));
            vobs_bol1 := true;
          end
          else if (trim(boletosDB.fstr('mensagem_bol')) <> '') and (not vmensagem_bol) then
          begin
            vmensagem5 := trim(boletosDB.fstr('mensagem_bol'));
            vmensagem_bol := true;
          end
          else if (trim(boletosDB.fstr('mensagem_adc')) <> '') and (not vmensagem_adc) then
          begin
            vmensagem5 := trim(boletosDB.fstr('mensagem_adc'));
            vmensagem_adc := true;
          end
          else if (trim(boletosDB.fstr('identificacaocedente')) <> '') and (not videntificacaocedente) then
          begin
            vmensagem5 := trim(boletosDB.fstr('identificacaocedente'));
            videntificacaocedente := true;
          end
          else if (trim(boletosDB.fstr('identificacaocedente1')) <> '') and (not videntificacaocedente1) then
          begin
            vmensagem5 := trim(boletosDB.fstr('identificacaocedente1'));
            videntificacaocedente1 := true;
          end
          else if (repo.DevelopmentMode) and (trim(vobs_homologacao) <> '') and (not vhomologacao) then
          begin
            vmensagem5 := trim(vobs_homologacao);
            vhomologacao := true;
          end;

        if trim(vmensagem5) <> '' then
          if (trim(boletosDB.fstr('obs_bol')) <> '') and (not vobs_bol) then
          begin
            vmensagem6 := trim(boletosDB.fstr('obs_bol'));
            vobs_bol := true;
          end
          else if (trim(boletosDB.fstr('obs_bol1')) <> '') and (not vobs_bol1) then
          begin
            vmensagem6 := trim(boletosDB.fstr('obs_bol1'));
            vobs_bol1 := true;
          end
          else if (trim(boletosDB.fstr('mensagem_bol')) <> '') and (not vmensagem_bol) then
          begin
            vmensagem6 := trim(boletosDB.fstr('mensagem_bol'));
            vmensagem_bol := true;
          end
          else if (trim(boletosDB.fstr('mensagem_adc')) <> '') and (not vmensagem_adc) then
          begin
            vmensagem6 := trim(boletosDB.fstr('mensagem_adc'));
            vmensagem_adc := true;
          end
          else if (trim(boletosDB.fstr('identificacaocedente')) <> '') and (not videntificacaocedente) then
          begin
            vmensagem6 := trim(boletosDB.fstr('identificacaocedente'));
            videntificacaocedente := true;
          end
          else if (trim(boletosDB.fstr('identificacaocedente1')) <> '') and (not videntificacaocedente1) then
          begin
            vmensagem6 := trim(boletosDB.fstr('identificacaocedente1'));
            videntificacaocedente1 := true;
          end
          else if (repo.DevelopmentMode) and (trim(vobs_homologacao) <> '') and (not vhomologacao) then
          begin
            vmensagem6 := trim(vobs_homologacao);
            vhomologacao := true;
          end;

         if trim(vmensagem6) <> '' then
          if (trim(boletosDB.fstr('obs_bol')) <> '') and (not vobs_bol) then
          begin
            vmensagem7 := trim(boletosDB.fstr('obs_bol'));
            vobs_bol := true;
          end
          else if (trim(boletosDB.fstr('obs_bol1')) <> '') and (not vobs_bol1) then
          begin
            vmensagem7 := trim(boletosDB.fstr('obs_bol1'));
            vobs_bol1 := true;
          end
          else if (trim(boletosDB.fstr('mensagem_bol')) <> '') and (not vmensagem_bol) then
          begin
            vmensagem7 := trim(boletosDB.fstr('mensagem_bol'));
            vmensagem_bol := true;
          end
          else if (trim(boletosDB.fstr('mensagem_adc')) <> '') and (not vmensagem_adc) then
          begin
            vmensagem7 := trim(boletosDB.fstr('mensagem_adc'));
            vmensagem_adc := true;
          end
          else if (trim(boletosDB.fstr('identificacaocedente')) <> '') and (not videntificacaocedente) then
          begin
            vmensagem7 := trim(boletosDB.fstr('identificacaocedente'));
            videntificacaocedente := true;
          end
          else if (trim(boletosDB.fstr('identificacaocedente1')) <> '') and (not videntificacaocedente1) then
          begin
            vmensagem7 := trim(boletosDB.fstr('identificacaocedente1'));
            videntificacaocedente1 := true;
          end
          else if (repo.DevelopmentMode) and (trim(vobs_homologacao) <> '') and (not vhomologacao) then
          begin
            vmensagem7 := trim(vobs_homologacao);
            vhomologacao := true;
          end;

        if (trim(boletosDB.fstr('permite_protesto')) = 'S') and (boletosDB.fint('diasprotesto') > 0) then
          item.TituloInformacoesAdicionais := UTF8Encode(Copy(trim(boletosDB.fstr('obs_bol')), 1, 100));

        if trim(vmensagem) <> '' then
          item.TituloMensagem01 :=  UTF8Encode(Copy(UpperCase(vmensagem), 1, 80));

        if trim(vmensagem2) <> '' then
          item.TituloMensagem02 := UTF8Encode(Copy(UpperCase(vmensagem2), 1, 80));

        if trim(vmensagem3) <> '' then
          item.TituloMensagem03 := UTF8Encode(Copy(UpperCase(vmensagem3), 1, 80));

        if trim(vmensagem4) <> '' then
          item.TituloMensagem04 := UTF8Encode(Copy(UpperCase(vmensagem4), 1, 80));

        if trim(vmensagem5) <> '' then
          item.TituloMensagem05 := UTF8Encode(Copy(UpperCase(vmensagem5), 1, 80));

        if trim(vmensagem6) <> '' then
          item.TituloMensagem06 := UTF8Encode(Copy(UpperCase(vmensagem6), 1, 80));

        if trim(vmensagem7) <> '' then
          item.TituloMensagem07 := UTF8Encode(Copy(UpperCase(vmensagem7), 1, 80));

        {$ENDREGION}

        {$REGION 'dados desconto'}
        if (boletosDB.ffloat('vl_desc_bol') > 0) then
        begin
          item.TituloCodDesconto         := '1';
          item.TituloDataDesconto        := FormatDateTime('dd/mm/yyyy', boletosDB.fdate('data_lim_desc'));
          item.TituloValorDescontoTaxa   := FormatFloat('0.00', boletosDB.ffloat('vl_desc_bol'));
          item.TituloValorDesconto       := FormatFloat('0.00', boletosDB.ffloat('vl_desc_bol'));

          if StrToFloat(item.TituloValorDescontoTaxa) <= 0 then
          begin
            item.TituloCodDesconto       := '0';
            item.TituloDataDesconto      := '';
            item.TituloValorDescontoTaxa := '';
            item.TituloValorDesconto     := '';
          end;
        end
        else
        begin
          item.TituloCodDesconto         := '0';
          item.TituloDataDesconto        := '';
          item.TituloValorDescontoTaxa   := '';
          item.TituloValorDesconto       := '';
        end;
        {$ENDREGION}

        {$REGION 'dados juros'}
        if (boletosDB.ffloat('tx_juros') > 0) then
        begin
          if trim(boletosDB.fstr('titulocodigojuros')) = '1' then
          begin
            item.TituloCodigoJuros    := '1';
            item.TituloDataJuros      := FormatDateTime('dd/mm/yyyy', boletosDB.fdate('data_ven_bol') + 1);

            if (boletosDB.ffloat('vl_desc_bol') > 0) then
              item.TituloValorJuros   := Format('%0.2f', [
                ((boletosDB.ffloat('vl_doc_bol') + boletosDB.ffloat('vl_desc_bol')) * (boletosDB.ffloat('tx_juros') / 100)) / 30])
            else
              item.TituloValorJuros   := Format('%0.2f', [
                (boletosDB.ffloat('vl_doc_bol') * (boletosDB.ffloat('tx_juros') / 100)) / 30]);

            if StrToFloat(item.TituloValorJuros) <= 0 then
            begin
              item.TituloCodigoJuros  := '3';
              item.TituloDataJuros    := '';
              item.TituloValorJuros   := '';
            end;
          end
          else
          begin
            item.TituloCodigoJuros    := '2';
            item.TituloDataJuros      := FormatDateTime('dd/mm/yyyy', boletosDB.fdate('data_ven_bol') + 1);
            item.TituloValorJuros     := Format('%0.2f', [boletosDB.ffloat('tx_juros')]);
          end;
        end
        else
        begin
          item.TituloCodigoJuros      := '3';
          item.TituloDataJuros        := '';
          item.TituloValorJuros       := '';
        end;
        {$ENDREGION}

        {$REGION 'dados multa'}
        if (boletosDB.ffloat('multas') > 0)
          and (trim(boletosDB.fstr('data_ven_bol')) <> '')  then
        begin
          if trim(boletosDB.fstr('titulocodigomulta')) = '1' then
          begin
            item.TituloCodigoMulta      := '1';
            item.TituloDataMulta        := FormatDateTime('dd/mm/yyyy', boletosDB.fdate('data_ven_bol') + 1);

            if (boletosDB.ffloat('vl_desc_bol') > 0) then
              item.TituloValorMultaTaxa := Format('%0.2f', [
                ((boletosDB.ffloat('vl_doc_bol') + boletosDB.ffloat('vl_desc_bol')) * (boletosDB.ffloat('multas') / 100))])
            else
              item.TituloValorMultaTaxa := Format('%0.2f', [
                (boletosDB.ffloat('vl_doc_bol') * (boletosDB.ffloat('multas') / 100))]);

            if StrToFloat(item.TituloValorMultaTaxa) <= 0 then
            begin
              item.TituloCodigoMulta    := '0';
              item.TituloDataMulta      := '';
              item.TituloValorMultaTaxa := '';
            end;
          end
          else
          begin
            item.TituloCodigoMulta      := '2';
            item.TituloDataMulta        := FormatDateTime('dd/mm/yyyy', boletosDB.fdate('data_ven_bol') + 1);
            item.TituloValorMultaTaxa   := Format('%0.2f', [boletosDB.ffloat('multas')]);
          end
        end
        else
        begin
          item.TituloCodigoMulta        := '0';
          item.TituloDataMulta          := '';
          item.TituloValorMultaTaxa     := '';
        end;

        {$ENDREGION}

        {$REGION 'dados protesto'}
        if (trim(boletosDB.fstr('permite_protesto')) = 'S') and (boletosDB.fint('diasprotesto') > 0) then
        begin
          item.TituloCodProtesto := boletosDB.fstr('titulocodigoprotesto');
          item.TituloPrazoProtesto := boletosDB.fstr('diasprotesto');
        end
        else if StrZero(Trim(boletosDB.fstr('banco').Trim.ToUpper), 3) = '104' then// Instruição para caixa
        begin
          item.TituloCodBaixaDevolucao := '1';
          item.TituloPrazoBaixa := '30';
        end;
        {$ENDREGION}

        payload := payload + [item];
      end;

      boletosDB.Next;
    end;

    if not vEmitirBoletos then
    begin
      var useCase := TUseCaseConsultaBoletoIntegrado.Create(Self.GetStrParamsUC, False);
      try
        if not useCase.Run(ids) then
          exit;
      finally
        useCase.Free;
      end;

      if imprimirbol then
      begin
        var useCasePrint := TUseCaseImprimirBoleto.Create(Self.GetStrParamsUC, False);
        try
          if (not useCasePrint.Run(ids)) and (not useCasePrint.LastError.IsEmpty) then
            raise Exception.Create(useCasePrint.LastError);
        finally
          useCasePrint.Free;
        end;
      end;

      if repo.DevelopmentMode then
        ShowAtencao('Boleto(s) emitido(s) em ambiente de homologação');
    end
    else
    begin
      var _dados := api.PostBoleto(payload);

      if Assigned(_dados.sucesso) then
      begin
        Result := repo.PostBoletos(_dados.sucesso);

        if Length(_dados.sucesso._dados._sucesso) > 0 then
        begin

          var useCase := TUseCaseConsultaBoletoIntegrado.Create(Self.GetStrParamsUC, False);
          try
            if not useCase.Run(_dados.sucesso) then
              exit;
          finally
            useCase.Free;
          end;

          if imprimirbol then
          begin
            var useCasePrint := TUseCaseImprimirBoleto.Create(Self.GetStrParamsUC, False);
            try
              if (not useCasePrint.Run(ids)) and (not useCasePrint.LastError.IsEmpty) then
                raise Exception.Create(useCasePrint.LastError);
            finally
              useCasePrint.Free;
            end;
          end;
        end;

        if Length(_dados.sucesso._dados._falha) > 0 then
          if Length(_dados.sucesso._dados._sucesso) = 0 then
            raise Exception.Create(_dados.sucesso._dados.ErrosToString)
          else
            ShowWarning(Format('Alguns boletos não foram validados com sucesso.' + sLineBreak +
                               'Por favor identifique os boletos com problema,' + sLineBreak +
                               'resolva e depois tente emitir novamente' + sLineBreak +
                               ' >> Mais informações <<' + sLineBreak +
                               'Boletos emitidos: %d' + sLineBreak +
                               'Boletos não emitidos: %d' + sLineBreak + sLineBreak +
                               ' ** Problemas ** ' + sLineBreak +
                               _dados.sucesso._dados.ErrosToString,
                               [Length(_dados.sucesso._dados._sucesso), Length(_dados.sucesso._dados._falha)]));
      end
      else if Assigned(_dados.erro) then
        raise Exception.Create(_dados.erro.ErrosToString)
      else
        raise Exception.Create('Sem resposta da API dos boletos');

      if repo.DevelopmentMode then
        ShowAtencao('Boleto(s) emitido(s) em ambiente de homologação');
    end;

    Result := True;
  except on E: Exception do
    begin
      Result := False;
      LastError := E.message;
      ShowAtencao('Erro ao emitir boleto(s)' + sLineBreak + sLineBreak + E.Message);
    end;
  end;
end;

end.
