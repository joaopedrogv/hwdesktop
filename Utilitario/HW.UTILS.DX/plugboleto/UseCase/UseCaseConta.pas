unit UseCaseConta;

interface

uses
  BaseUseCasePlugBoleto,
  BoletoResponseModels;

type

  TUseCaseConta = class(TUseCaseBasePlugBoleto)
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

{ TUseCaseCedente }

function TUseCaseConta.Run(pCodConvenio: Integer): Boolean;
var
  conveniosDB: Conexao_OOP;
  item: TConta;
  id: string;
  vContaEncontrada: boolean;
begin
  Result := False;
  vContaEncontrada := False;
  try
    InitUseCase;

    repo := TPlugBoletoRepoSingleton.GetInstance();
    api := TApiPlugBoletoSingleton.GetInstance();

    var conf := repo.GetConfigApi(CONF_API);

    if conf.empresaId <= 0 then
      raise Exception.Create('Configuração para boletos não encontrada no Cadastro de API');

    conveniosDB := repo.GetConvenio(pCodConvenio);

    var conta := TGetContaResponse.Create;

    conta := api.GetConta(
      conveniosDB.fstr('api_idconta'),
      conveniosDB.fstr('banco'),
      conveniosDB.fstr('codigoagencia'),
      conveniosDB.fstr('numerocontacorrente')
    );

    if not Assigned(conta) then
      conta := api.GetConta(
          '',
          conveniosDB.fstr('banco'),
          conveniosDB.fstr('codigoagencia'),
          conveniosDB.fstr('numerocontacorrente')
        )
    else if Length(conta._dados) <= 0 then
      if not conveniosDB.fempty('api_idconta') then
        conta := api.GetConta(
          '',
          conveniosDB.fstr('banco'),
          conveniosDB.fstr('codigoagencia'),
          conveniosDB.fstr('numerocontacorrente')
        );

    if not Assigned(conta) then
      conta := api.GetConta('', '', '', '')
    else if Length(conta._dados) <= 0 then
      if not conveniosDB.fempty('api_idconta') then
        conta := api.GetConta('', '', '', '');

    if not Assigned(conta) then
      raise Exception.Create('Consulta conta sem resposta da API');

    if not conta._status.Trim.Equals(STS_SUCESSO) then
      if not conta._mensagem.IsEmpty then
        raise Exception.Create(conta._mensagem)
      else
        raise Exception.Create('Nenhuma conta encontrado com os parametros informados');

    item                                   := TConta.Create;
    item.ContaCodigoBanco                  := StrZero(conveniosDB.fstr('banco').Trim.ToUpper, 3);
    item.ContaNumero                       := OnlyNumber(conveniosDB.fstr('numerocontacorrente', 1, Length(conveniosDB.fstr('numerocontacorrente')) - 1)).Trim.ToUpper;
    item.ContaNumeroDV                     := conveniosDB.fstr('numerocontacorrente', Length(conveniosDB.fstr('numerocontacorrente')), 1).Trim.ToUpper;
    item.ContaCodigoBeneficiario           := OnlyNumber(conveniosDB.fstr('numerocontacorrente', 1, Length(conveniosDB.fstr('numerocontacorrente')) - 1)).Trim.ToUpper; //conveniosDB.fstr('codigocedente').Trim.ToUpper;

    if Pos('-', conveniosDB.fstr('codigoagencia')) > 0 then
    begin
      item.ContaAgencia                    := OnlyNumber(conveniosDB.fstr('codigoagencia', 1, Length(conveniosDB.fstr('codigoagencia')) - 1)).Trim.ToUpper;
      item.ContaAgenciaDV                  := conveniosDB.fstr('codigoagencia', Length(conveniosDB.fstr('codigoagencia')), 1).Trim.ToUpper;
    end
    else
    begin
      item.ContaAgencia                    := conveniosDB.fstr('codigoagencia').Trim.ToUpper;
      item.ContaAgenciaDV                  := '';
    end;
    item.ContaTipo                         := conveniosDB.fstr('tipo_conta').Trim;

    if StrZero(conveniosDB.fstr('banco').Trim.ToUpper, 3) = '756' then
      item.ContaCodigoBeneficiario         := conveniosDB.fstr('codigoconvenio').Trim.ToUpper
    else if (StrZero(conveniosDB.fstr('banco').Trim.ToUpper, 3) = '033') and (conveniosDB.fstr('codigocedente').Trim <> '') then
      item.ContaCodigoBeneficiario         := conveniosDB.fstr('codigocedente').Trim.ToUpper
    else
      item.ContaCodigoBeneficiario         := OnlyNumber(conveniosDB.fstr('numerocontacorrente', 1, Length(conveniosDB.fstr('numerocontacorrente')) - 1)).Trim.ToUpper;
    item.ContaCodigoEmpresa                := conveniosDB.fstr('codigocedente').Trim.ToUpper;

    item.ContaValidacaoAtiva               := True;
    item.ContaImpressaoAtualizada          := True;
    item.ContaImpressaoAtualizadaAlteracao := True;
    item.ContaImpressaoAtualizadaLiquidado := True;

    if Length(conta._dados) <= 0 then
    begin
      var _dados := api.PostConta(item);

      if Assigned(_dados) then
      begin
        if Assigned(_dados.sucesso) then
        begin
          if _dados.sucesso._status.Trim.Equals(STS_SUCESSO) then
            Result := repo.PostConta(pCodConvenio, _dados.sucesso._dados.id.ToString())
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
      if Assigned(conta._dados) then
      begin
        for var itemConsOk in conta._dados do
        begin
          if ((StrZero(itemConsOk.codigo_banco.ToString.Trim.ToUpper, 3).Trim) = (StrZero(item.ContaCodigoBanco.Trim.ToUpper, 3).Trim))
            and ((StrZero(OnlyNumber(itemConsOk.agencia).Trim.ToUpper + itemConsOk.agencia_dv.Trim.ToUpper, 10).Trim) = (StrZero(OnlyNumber(item.ContaAgencia).Trim.ToUpper + item.ContaAgenciaDV.Trim.ToUpper, 10).Trim))
            and ((StrZero(OnlyNumber(itemConsOk.conta).Trim.ToUpper + itemConsOk.conta_dv.Trim.ToUpper, 10).Trim) = (StrZero(OnlyNumber(item.ContaNumero).Trim.ToUpper + item.ContaNumeroDV.Trim.ToUpper, 10).Trim)) then
          begin
            vContaEncontrada := True;

            var _dados := api.PutConta(item, itemConsOk.id);

            if Assigned(_dados) then
            begin
              if Assigned(_dados.sucesso) then
              begin
                if _dados.sucesso._status.Trim.Equals(STS_SUCESSO) then
                  Result := repo.PostConta(pCodConvenio, _dados.sucesso._dados.id.ToString())
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

    if not vContaEncontrada then
    begin
      var _dados := api.PostConta(item);

      if Assigned(_dados) then
      begin
        if Assigned(_dados.sucesso) then
        begin
          if _dados.sucesso._status.Trim.Equals(STS_SUCESSO) then
            Result := repo.PostConta(pCodConvenio, _dados.sucesso._dados.id.ToString())
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
      ShowAtencao('Erro ao incluir/alterar conta' + sLineBreak + sLineBreak + E.Message);
    end;
  end;
end;

end.
