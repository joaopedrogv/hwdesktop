unit UseCaseVendaVeiculos;

interface

uses
  BaseUseCaseSuzuki, System.Classes;

type

  TUseCaseVendaVeiculos = class(TUseCaseBaseSuzuki)
  public
    function Run(cod_nfs: array of Integer): Boolean;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  System.Math,
  System.NetEncoding,
  SuzukiRepo,
  ApiSuzuki,
  SuzukiModels,
  hw_utils,
  hw_win_utils,
  config_sistema_class;

{ TUseCaseVendaVeiculos }

function TUseCaseVendaVeiculos.Run(cod_nfs: array of Integer): Boolean;
var
  Config: TConfig_sistema_class;
  vStringList: TStringList;
  autenticacao: TAutenticacao;
  payload: TNotaFiscal;
  notasDB: Conexao_OOP;
  vErros: TStringList;
  vNfEnv: Boolean;
  I: Integer;
begin
  Result := False;
  vNfEnv := True;
  try
    if Length(cod_nfs) = 0 then
      raise Exception.Create('Nenhum nota fiscal informado para enviar para Suzuki');

    InitUseCase(True);

    repo := TSuzukiRepoSingleton.GetInstance();
    api := TApiSuzukiSingleton.GetInstance();

    var conf := repo.GetConfigApi(CONF_API);

    if conf.empresaId <= 0 then
      raise Exception.Create('Configuração para API Suzuki não encontrada no Cadastro de API');

    var codmarcas := '';
    try
      Config := TConfig_sistema_class.getConf('vei_codmarca', repo.QrAux, conf.empresaId);
      var marcas := Config.ReadString('SUZUKI', 'Codigo');

      try
        vStringList := TStringList.Create;
        vStringList := Split(marcas, ',');

        for I := 0 to vStringList.Count - 1 do
          if (trim(vStringList[I]) <> '') and (trim(vStringList[I]) <> '0') then
            codmarcas := codmarcas + IfThen(trim(codmarcas) <> '', ',') + trim(vStringList[I]);
      finally
        if Assigned(vStringList) then
          FreeAndNil(vStringList);
      end;
    finally
      if Assigned(Config) then
        FreeAndNil(Config);
    end;

    if (trim(codmarcas) = '') or (trim(codmarcas) = '0') then
      raise Exception.Create('Nenhuma marca (Suzuki) definida nas configurações (vei_codmarca)');

    notasDB := repo.GetNotasFiscais(cod_nfs, codmarcas);
    if notasDB.IsEmpty then
      raise Exception.Create('Nenhuma nota fiscal (Suzuki) encontrada com os cod_nf(s) informados');

    while not notasDB.Eof do
    begin
      if (trim(notasDB.fstr('xml_nfe')) <> '') and (notasDB.fint('id_protocolo') <= 0) then
      begin
        payload := TNotaFiscal.Create;
        payload.danfeBase64   := TNetEncoding.Base64.Encode(trim(notasDB.fstr('xml_nfe')));
        payload.chassi        := notasDB.fstr('chassi');

        var _nota := api.PostNotaFiscal(payload);

        if _nota.IsValId then
          repo.AtualizarProtocoloNF(notasDB.fint('cod_nf'), notasDB.fstr('situacao_nfe'), _nota.Retorno.IdProcesso, _nota.Retorno.IdProtocolo)
        else
        begin
          if (_nota.Retorno.IdProcesso > 0) or (_nota.Retorno.IdProtocolo > 0) then
            repo.AtualizarProtocoloNF(notasDB.fint('cod_nf'), notasDB.fstr('situacao_nfe'), _nota.Retorno.IdProcesso, _nota.Retorno.IdProtocolo);

          var erros := _nota.Errors;

          if Assigned(erros) then
            if Length(erros) > 0 then
            begin
              vNfEnv := False;

              try
                vErros := TStringList.Create;
                vErros.Clear;

                vErros.Add(erros[0].PropertyName);
                vErros.Add('');
                vErros.Add(erros[0].ErrorMessage);
                vErros.Add('');
                vErros.Add(erros[0].ErrorCode);
                ShowErro(vErros.Text);
              finally
                if Assigned(vErros) then
                  vErros.Free;
              end;
            end;
        end;
      end;

      notasDB.Next;
    end;

    Result := vNfEnv;

    if Result then
      ShowAtencao('Notas enviadas');

  except on E: Exception do
    begin
      Result := False;
      LastError := E.message;
      ShowAtencao('Erro ao enviar venda de veículo' + sLineBreak + sLineBreak + E.Message);
    end;
  end;
end;

end.
