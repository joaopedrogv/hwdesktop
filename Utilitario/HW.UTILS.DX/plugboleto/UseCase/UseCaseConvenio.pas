unit UseCaseConvenio;

interface

uses
  BaseUseCasePlugBoleto,
  BoletoResponseModels;

type

  TUseCaseConvenio = class(TUseCaseBasePlugBoleto)
  public
    function Run(pCodConvenio: Integer): Boolean;
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

{ TUseCaseConvenio }

function TUseCaseConvenio.Run(pCodConvenio: Integer): Boolean;
var
  conveniosDB: Conexao_OOP;
  item: TConvenio;
  id: string;
  vConvenioEncontrada: boolean;
begin
  Result := False;
  vConvenioEncontrada := False;
  try
    InitUseCase;

    repo := TPlugBoletoRepoSingleton.GetInstance();
    api := TApiPlugBoletoSingleton.GetInstance();

    var conf := repo.GetConfigApi(CONF_API);

    if conf.empresaId <= 0 then
      raise Exception.Create('Configuração para boletos não encontrada no Cadastro de API');

    conveniosDB := repo.GetConvenio(pCodConvenio);

    var convenio := TGetConvenioResponse.Create;

    convenio := api.GetConvenio(
      conveniosDB.fstr('api_idconvenio'),
      conveniosDB.fstr('codigoconvenio')
    );

    if not Assigned(convenio) then
      convenio := api.GetConvenio('', conveniosDB.fstr('codigoconvenio'))
    else if Length(convenio._dados) <= 0 then
      if not conveniosDB.fempty('api_idconvenio') then
        convenio := api.GetConvenio('', conveniosDB.fstr('codigoconvenio'));

    if not Assigned(convenio) then
      convenio := api.GetConvenio('', '')
    else if Length(convenio._dados) <= 0 then
      if not conveniosDB.fempty('api_idconvenio') then
        convenio := api.GetConvenio('', '');

    if not Assigned(convenio) then
      raise Exception.Create('Consulta conta sem resposta da API');

    if not convenio._status.Trim.Equals(STS_SUCESSO) then
      if not convenio._mensagem.IsEmpty then
        raise Exception.Create(convenio._mensagem)
      else
        raise Exception.Create('Nenhuma conta encontrado com os parametros informados');

    if conveniosDB.fempty('api_idconta') then
      raise Exception.Create('Conta não cadastrada, favor cadastrar conta antes de incluir/alterar convênio');

    item                              := TConvenio.Create;
    //if StrZero(conveniosDB.fstr('banco').Trim.ToUpper, 3) = '756' then
    //  item.ConvenioNumero             := OnlyNumber(conveniosDB.fstr('numerocontacorrente', 1, Length(conveniosDB.fstr('numerocontacorrente')) - 1)).Trim.ToUpper
    //else
      item.ConvenioNumero             := conveniosDB.fstr('codigoconvenio').Trim.ToUpper;

    item.ConvenioDescricao            := UTF8Encode(conveniosDB.fstr('descricao').Trim.ToUpper);
    item.ConvenioCarteira             := conveniosDB.fstr('outrodadoconfiguracao1').Trim.ToUpper;
    item.ConvenioEspecie              := 'R$';
    item.ConvenioPadraoCNAB           := conveniosDB.fstr('layoutarquivoremessa').Trim.ToUpper;
    item.ConvenioReiniciarDiariamente := False;
    item.ConvenioNumeroRemessa        := conveniosDB.fstr('sequencia_remessa');
    item.Conta                        := conveniosDB.fint('api_idconta');

    if Length(convenio._dados) <= 0 then
    begin
      var _dados := api.PostConvenio(item);

      if Assigned(_dados) then
      begin
        if Assigned(_dados.sucesso) then
        begin
          if _dados.sucesso._status.Trim.Equals(STS_SUCESSO) then
            Result := repo.PostConvenio(pCodConvenio, _dados.sucesso._dados.id.ToString())
          else
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
    end
    else
    begin
      if Assigned(convenio._dados) then
      begin
        for var itemConsOk in convenio._dados do
        begin
          if (itemConsOk.id_conta = item.Conta)
            and (StrZero(OnlyNumber(itemConsOk.numero_convenio).Trim.ToUpper, 10).Trim = StrZero(OnlyNumber(item.ConvenioNumero).Trim.ToUpper, 10).Trim)
            and (itemConsOk.carteira.Trim.ToUpper = item.ConvenioCarteira.Trim.ToUpper) then
          begin
            vConvenioEncontrada := True;

            var _dados := api.PutConvenio(item, itemConsOk.id.ToString());

            if Assigned(_dados) then
            begin
              if Assigned(_dados.sucesso) then
              begin
                if _dados.sucesso._status.Trim.Equals(STS_SUCESSO) then
                  Result := repo.PostConvenio(pCodConvenio, _dados.sucesso._dados.id.ToString())
                else
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

    if not vConvenioEncontrada then
    begin
      var _dados := api.PostConvenio(item);

      if Assigned(_dados) then
      begin
        if Assigned(_dados.sucesso) then
        begin
          if _dados.sucesso._status.Trim.Equals(STS_SUCESSO) then
            Result := repo.PostConvenio(pCodConvenio, _dados.sucesso._dados.id.ToString())
          else
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

    Result := True;
  except on E: Exception do
    begin
      Result := False;
      LastError := E.message;
      ShowAtencao('Erro ao incluir/alterar convênio' + sLineBreak + sLineBreak + E.Message);
    end;
  end;
end;

end.
