unit UseCaseCadEmpresa;

interface

uses
   BaseUseCaseHwCloud, System.Classes, System.Generics.Collections;

type

  TUseCaseCadEmpresa = class(TUseCaseBaseHwCloud)
  public
    function Run(
      pAtivo: Integer;
      pTipoOp: WideString): Boolean;
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

{ TUseCaseCadEmpresa }

function TUseCaseCadEmpresa.Run(
  pAtivo: Integer;
  pTipoOp: WideString): Boolean;
var
  cadEmpresa: TCadEmpresa;
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

    var empresa := repo.GetEmpresa;
    if not Assigned(empresa) then
      Exit;

    if (pTipoOp = 'I') and (empresa.sinc_hwcloud = 'S') then
    begin
      Result := True;
      Exit;
    end;

    try
      cadEmpresa := TCadEmpresa.Create;
      cadEmpresa.cnpj := conf.cnpj;

      cadEmpresa.ambiente_id := IfThen(trim(conf.ambiente_api) <> '', conf.ambiente_api, conf.cnpj);

      cadEmpresa.action := 'crud';
      cadEmpresa.tpdados := 'gest_empresas';
      cadEmpresa.tpop := pTipoOp;

      if (pTipoOp = 'I') then
      begin
        cadEmpresa.dados.utiliza_apicog := IfThen(trim(conf.cnpj) = '03530705000109', 1, IfThen(conf.usar_api_cog = 'S', 1, 0));
        cadEmpresa.dados.modelo_padrao := conf.modelo_padrao;
        cadEmpresa.dados.nome_bot := conf.nome_bot;
        cadEmpresa.dados.nome_empresa := conf.identificacao_emp;
        cadEmpresa.dados.rag_padrao := 'hw_sistemas';
        cadEmpresa.dados.info_contato := conf.info_contato;

        cadEmpresa.dados.diames_ini_fatmeta := conf.dia_mes_ini_fat_meta;
        cadEmpresa.dados.limite_gastos_meta := conf.limite_gastos_meta;

        cadEmpresa.dados.util_recomendacao := conf.util_recomendacao;
        cadEmpresa.dados.interv_treino_recomenda := conf.interv_treino_recomenda;
        cadEmpresa.dados.dias_vnd_recomenda := conf.dias_vnd_recomenda;

        cadEmpresa.dados.classe_busca_usuario := 'ident_us_hwcloudia';
        cadEmpresa.dados.ativo := pAtivo;
        cadEmpresa.dados.hora_inicio_seg_sex := conf.horario_semana_ini;
        cadEmpresa.dados.hora_fim_seg_sex := conf.horario_semana_fim;
        cadEmpresa.dados.hora_inicio_sab := conf.horario_sabado_ini;
        cadEmpresa.dados.hora_fim_sab := conf.horario_sabado_fim;
        cadEmpresa.dados.timeout_saga := 4800;

        cadEmpresa.dados.indicador_giro_padrao.Baixo.Add(conf.giro_padrao_baixo_ini);
        cadEmpresa.dados.indicador_giro_padrao.Baixo.Add(conf.giro_padrao_baixo_fim);
        cadEmpresa.dados.indicador_giro_padrao.Medio.Add(conf.giro_padrao_medio_ini);
        cadEmpresa.dados.indicador_giro_padrao.Medio.Add(conf.giro_padrao_medio_fim);
        cadEmpresa.dados.indicador_giro_padrao.Alto.Add(conf.giro_padrao_alto_ini);
        cadEmpresa.dados.indicador_giro_padrao.Alto.Add(conf.giro_padrao_alto_fim);

        cadEmpresa.dados.pesos_emp.Popularidade := conf.peso_popularidade;
        cadEmpresa.dados.pesos_emp.NIVEL_GIRO_MEDIO := conf.peso_nivel_giro_medio;
        cadEmpresa.dados.pesos_emp.Demanda := conf.peso_demanda;
        cadEmpresa.dados.pesos_emp.Frequencia := conf.peso_frequencia;
        cadEmpresa.dados.pesos_emp.Preço := conf.peso_preco;
      end
      else
        cadEmpresa.dados.ativo := 0;

      var useCase := api.CadEmpresa(cadEmpresa);

      if not Assigned(useCase) then
        if not silent then
          raise Exception.Create('Cadastrar empresa sem resposta da API');

      if useCase.status.Trim() <> 'OK' then
        if not silent then
          raise Exception.Create(useCase.resposta.Trim());

      if not repo.SincHwCloudEmpresa then
        Exit;

      Result := True;

    finally
      if Assigned(cadEmpresa) then
        FreeAndNil(cadEmpresa);
    end;

  except on E: Exception do
    begin
      Result := False;
      LastError := E.message;
      if not silent then
        ShowAtencao('Erro ao cadastrar empresa' + sLineBreak + sLineBreak + E.Message);
    end;
  end;
end;

end.
