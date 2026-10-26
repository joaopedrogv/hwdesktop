unit UseCaseCadPessoa;

interface

uses
   BaseUseCaseHwCloud, System.Classes, System.Generics.Collections;

type

  TUseCaseCadPessoa = class(TUseCaseBaseHwCloud)
  public
    function Run(
      pCodCliente: Integer;
      pTipoCliente: WideString;
      pAtivo: Integer;
      pTipoOp: WideString): Boolean; overload;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  System.Math,
  System.NetEncoding,
  System.Net.Mime,
  HwCloudRepo,
  ApiHwCloud,
  HwCloudModels,
  hw_utils,
  hw_win_utils,
  config_sistema_class;

{ TUseCaseCadPessoa }

function TUseCaseCadPessoa.Run(
  pCodCliente: Integer;
  pTipoCliente: WideString;
  pAtivo: Integer;
  pTipoOp: WideString): Boolean;
var
  cadPessoaCE: TCadPessoaCE;
  cadPessoaCI: TCadPessoaCI;
  dadoCE: TDadosPessoaCE;
  dadoCI: TDadosPessoaCI;
begin
  Result := False;
  try
    InitUseCase;

    repo := THwCloudRepoSingleton.GetInstance();
    api := TApiHwCloudSingleton.GetInstance();

    var conf := repo.GetConfigApi(CONF_API);

    if conf.empresaId <= 0 then
      if not silent then
        raise Exception.Create('Configuração para hwcloud não encontrada no Cadastro de API');

    var cliente := repo.GetCliente(pCodCliente, pTipoCliente);
    if not Assigned(cliente) then
      Exit;

    if (pTipoOp = 'I') and (cliente.sinc_hwcloud = 'S') then
    begin
      Result := True;
      Exit;
    end;

    if pTipoCliente = 'CE' then
    begin
      try
        cadPessoaCE := TCadPessoaCE.Create;
        cadPessoaCE.cnpj := conf.cnpj;
        cadPessoaCE.action := 'crud';
        cadPessoaCE.tpdados := 'gest_pessoas';
        cadPessoaCE.tpop := pTipoOp;

        dadoCE := TDadosPessoaCE.Create;
        dadoCE.cdpessoa := cliente.cod_cliente.ToString();
        dadoCE.tipo_pessoa := pTipoCliente;

        if pTipoOp = 'I' then
        begin
          dadoCE.nmcliente := Trim(cliente.nome_cliente);
          dadoCE.razao_social := Trim(cliente.razao);
          if trim(dadoCE.razao_social) = '' then
            dadoCE.razao_social := Trim(dadoCE.nmcliente);

          dadoCE.cpfcnpj := cliente.cpfcgc;
          dadoCE.rg := Trim(cliente.rg);
          dadoCE.ativo := pAtivo;

          dadoCE.conjuge := cliente.conjuge;
          dadoCE.pai := cliente.pai;
          dadoCE.mae := cliente.mae;

          dadoCE.observacao := cliente.observacao;
          dadoCE.fone_cliente := cliente.fone_cliente;
          dadoCE.estado_civil := cliente.estado_civil;
          dadoCE.naturalidade := cliente.naturalid;
          dadoCE.sexo := cliente.sexo;

          dadoCE.data_nasc := cliente.data_cadastro;
        end
        else
          dadoCE.ativo := 0;

        cadPessoaCE.dados := cadPessoaCE.dados + [dadoCE];

        var useCase := api.cadPessoa(cadPessoaCE);

        if not Assigned(useCase) then
          if not silent then
            raise Exception.Create('Cadastrar pessoa sem resposta da API');

        if useCase.status.Trim() <> 'OK' then
          if not silent then
            raise Exception.Create(useCase.resposta.Trim());

        if not repo.SincHwCloudPessoa(pCodCliente, pTipoCliente) then
          Exit;

        Result := True;

      finally
        if Assigned(dadoCE) then
          FreeAndNil(dadoCE);
        if Assigned(cadPessoaCE) then
          FreeAndNil(cadPessoaCE);
      end;
    end
    else
    begin
      try
        cadPessoaCI := TCadPessoaCI.Create;
        cadPessoaCI.cnpj := conf.cnpj;
        cadPessoaCI.action := 'crud';
        cadPessoaCI.tpdados := 'gest_pessoas';
        cadPessoaCI.tpop := pTipoOp;

        dadoCI := TDadosPessoaCI.Create;
        dadoCI.cdpessoa := pCodCliente.ToString();
        dadoCI.tipo_pessoa := pTipoCliente;

        if pTipoOp = 'I' then
        begin
          dadoCI.nmcliente := Trim(cliente.nome_cliente);
          dadoCI.razao_social := Trim(cliente.razao);
          if trim(dadoCI.razao_social) = '' then
            dadoCI.razao_social := Trim(cliente.nome_cliente);

          dadoCI.cpfcnpj := cliente.cpfcgc;
          dadoCI.rg := Trim(cliente.rg);
          dadoCI.ativo := cliente.ativo;

          dadoCI.hora_inicio_padrao := IfThen(trim(cliente.horario_ini_padrao) = '', trim(conf.horario_semana_ini), trim(cliente.horario_ini_padrao));
          dadoCI.hora_fim_padrao := IfThen(trim(cliente.horario_fim_padrao) = '', trim(conf.horario_semana_fim), trim(cliente.horario_fim_padrao));
          dadoCI.dias_folga_semanais := IfThen(trim(cliente.dias_folga_semana) = '', '{0}', trim(cliente.dias_folga_semana));
          dadoCI.is_vendedor := cliente.is_vendedor;

          dadoCI.observacao := cliente.observacao;
          dadoCI.fone_cliente := cliente.fone_cliente;

          dadoCI.data_nasc := cliente.data_cadastro;
        end
        else
          dadoCI.ativo := 0;

        cadPessoaCI.dados := cadPessoaCI.dados + [dadoCI];

        var useCase := api.cadPessoa(cadPessoaCI);

        if not Assigned(useCase) then
          if not silent then
            raise Exception.Create('Cadastrar pessoa sem resposta da API');

        if useCase.status.Trim() <> 'OK' then
          if not silent then
            raise Exception.Create(useCase.resposta.Trim());

        if not repo.SincHwCloudPessoa(pCodCliente, pTipoCliente) then
          Exit;

        Result := True;

      finally
        if Assigned(dadoCI) then
          FreeAndNil(dadoCI);
        if Assigned(cadPessoaCI) then
          FreeAndNil(cadPessoaCI);
      end;
    end;

  except on E: Exception do
    begin
      Result := False;
      LastError := E.message;
      if not silent then
        ShowAtencao('Erro ao cadastrar pessoa' + sLineBreak + sLineBreak + E.Message);
    end;
  end;
end;

end.
