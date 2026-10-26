unit UseCaseCedente;

interface

uses
  BaseUseCasePlugBoleto,
  BoletoResponseModels;

type

  TUseCaseCedente = class(TUseCaseBasePlugBoleto)
  public
    function Run: Boolean;
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

{ TUseCaseCedente }

function TUseCaseCedente.Run: Boolean;
var
  empresasDB: Conexao_OOP;
  item: TCedente;
begin
  Result := False;
  try
    InitUseCase(True);

    repo := TPlugBoletoRepoSingleton.GetInstance();
    api := TApiPlugBoletoSingleton.GetInstance();

    var conf := repo.GetConfigApi(CONF_API);

    if conf.empresaId <= 0 then
      raise Exception.Create('Configuração para boletos não encontrada no Cadastro de API');

    var cedente := api.GetCedente(['cpf_cnpj=' + conf.chave]);

    if not Assigned(cedente) then
      raise Exception.Create('Consulta cedente sem resposta da API');

    if not cedente._status.Trim.Equals(STS_SUCESSO) then
      if not cedente._mensagem.IsEmpty then
        raise Exception.Create(cedente._mensagem)
      else
        raise Exception.Create('Nenhum cedente encontrado com os parametros informados');

    empresasDB := repo.GetEmpresa(conf.chave);

    if empresasDB.fint('cod_empresa') <= 0 then
      raise Exception.Create('Empresa não cadastrada para CPF/CNPJ ' + conf.chave);

    if empresasDB.fempty('ibge_cod_cidade') then
      raise Exception.Create('Descrição da cidade informada no cadastro de empresa não encontrada no cadastro de cidades' + sLineBreak + sLineBreak +
        'EMPRESA' + sLineBreak +
        'Razão Social: ' + empresasDB.fstr('fantasia_emp') + sLineBreak +
        'Nome Fantasia: ' +  empresasDB.fstr('nome_emp') + sLineBreak +
        'CPF/CNPJ: ' + empresasDB.fstr('cgc_emp') + sLineBreak +
        'Favor verificar antes de continuar');

    item                            := TCedente.Create;
    item.CedenteRazaoSocial         := UTF8Encode(empresasDB.fstr('nome_emp'));
    item.CedenteNomeFantasia        := UTF8Encode(empresasDB.fstr('fantasia_emp'));
    item.CedenteCPFCNPJ             := empresasDB.fstr('cgc_emp');
    item.CedenteEnderecoLogradouro  := UTF8Encode(empresasDB.fstr('endreco_emp'));
    item.CedenteEnderecoNumero      := empresasDB.fstr('numero_end');
    item.CedenteEnderecoComplemento := UTF8Encode(empresasDB.fstr('complemento_emp'));
    item.CedenteEnderecoBairro      := UTF8Encode(empresasDB.fstr('bairro_emp'));
    item.CedenteEnderecoCEP         := empresasDB.fstr('cep_emp');
    item.CedenteEnderecoCidadeIBGE  := empresasDB.fstr('ibge_cod_cidade');
    item.CedenteTelefone            := empresasDB.fstr('telefone_emp');
    if Pos(';', UTF8Encode(empresasDB.fstr('email_emp'))) > 0 then
    begin
      var listaEmail                := SplitString(UTF8Encode(empresasDB.fstr('email_emp')), ';');
      if Length(listaEmail) > 0 then
        item.CedenteEmail           := listaEmail[0];
    end
    else if Pos(',', UTF8Encode(empresasDB.fstr('email_emp'))) > 0 then
    begin
      var listaEmail                := SplitString(UTF8Encode(empresasDB.fstr('email_emp')), ',');
      if Length(listaEmail) > 0 then
        item.CedenteEmail           := listaEmail[0];
    end
    else
      item.CedenteEmail             := UTF8Encode(empresasDB.fstr('email_emp'));

    if Length(cedente._dados) <= 0 then
    begin
      InitUseCase(True);
      var _dados := api.PostCedente(item);

      if Assigned(_dados) then
      begin
        if Assigned(_dados.sucesso) then
        begin
          if not _dados.sucesso._status.Trim.Equals(STS_SUCESSO) then
          begin
            var itemERRO := _dados.sucesso._dados;
            raise Exception.Create(
              IfThen(_dados.erro._mensagem.Trim <> '', _dados.erro._mensagem + sLineBreak, '') +
              IfThen(itemERRO._mensagem.Trim <> '', itemERRO._mensagem.Trim + sLineBreak, '') +
              IfThen(itemERRO._campo.Trim <> '', itemERRO._campo + sLineBreak, '') +
              IfThen(itemERRO._erro.Trim <> '', itemERRO._erro + sLineBreak, '') + sLineBreak +
                'Favor verificar antes de continuar');
          end;
        end
        else if Assigned(_dados.erro) then
        begin
          for var itemERRO in _dados.erro._dados do
            raise Exception.Create(
              IfThen(_dados.erro._mensagem.Trim <> '', _dados.erro._mensagem + sLineBreak, '') +
              IfThen(itemERRO._mensagem.Trim <> '', itemERRO._mensagem.Trim + sLineBreak, '') +
              IfThen(itemERRO._campo.Trim <> '', itemERRO._campo.Trim + sLineBreak, '') +
              IfThen(itemERRO._erro.Trim <> '', itemERRO._erro.Trim + sLineBreak, '') + sLineBreak +
              'Favor verificar antes de continuar');
        end;
      end;
    end
    else
    begin
      if Assigned(cedente._dados) then
      begin
        for var itemConsOk in cedente._dados do
        begin
          if (itemConsOk.cpf_cnpj.Trim.ToUpper = item.CedenteCPFCNPJ.Trim.ToUpper) then
          begin
            InitUseCase;
            var _dados := api.PutCedente(item, itemConsOk.id);

            if Assigned(_dados) then
            begin
              if Assigned(_dados.sucesso) then
              begin
                if not _dados.sucesso._status.Trim.Equals(STS_SUCESSO) then
                begin
                  var itemERRO := _dados.sucesso._dados;
                    raise Exception.Create(
                      IfThen(_dados.erro._mensagem.Trim <> '', _dados.erro._mensagem + sLineBreak, '') +
                      IfThen(itemERRO._mensagem.Trim <> '', itemERRO._mensagem.Trim + sLineBreak, '') +
                      IfThen(itemERRO._campo.Trim <> '', itemERRO._campo + sLineBreak, '') +
                      IfThen(itemERRO._erro.Trim <> '', itemERRO._erro + sLineBreak, '') + sLineBreak +
                      'Favor verificar antes de continuar');
                end
              end
              else if Assigned(_dados.erro) then
              begin
                for var itemERRO in _dados.erro._dados do
                  raise Exception.Create(
                    IfThen(_dados.erro._mensagem.Trim <> '', _dados.erro._mensagem + sLineBreak, '') +
                    IfThen(itemERRO._mensagem.Trim <> '', itemERRO._mensagem.Trim + sLineBreak, '') +
                    IfThen(itemERRO._campo.Trim <> '', itemERRO._campo.Trim + sLineBreak, '') +
                    IfThen(itemERRO._erro.Trim <> '', itemERRO._erro.Trim + sLineBreak, '') + sLineBreak +
                    'Favor verificar antes de continuar');
              end;
            end;
          end;
        end;
      end;
    end;

    Result := True;
  except on E: Exception do
    begin
      Result := False;
      LastError := E.message;
      ShowAtencao('Erro ao incluir/alterar cedente' + sLineBreak + sLineBreak + E.Message);
    end;
  end;
end;

end.
