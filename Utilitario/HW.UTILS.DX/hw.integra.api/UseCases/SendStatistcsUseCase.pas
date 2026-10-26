unit SendStatistcsUseCase;

interface

uses
  Config_sistema_class,
  UseCaseBaseIntegra;

type
//  TStatusEnvio = (seSemEvento, seError, seSucesso);

  TSendStatistcsUseCase = class(TUseCaseBaseIntegra)
  private
//    statusEnv: TStatusEnvio;
//    conf: TConfig_sistema_class;
//    function IsTimeToRun: Boolean; override;
//    procedure HandleDataConsulta;
    procedure TrimAppMemorySize;
  public
    function Run(): Boolean;
  end;


implementation

uses
  hw_utils,
  hw_win_utils,
  RepoIntegraHW,
  System.SysUtils,
  System.StrUtils,
  System.DateUtils,
  System.Math,
  System.Classes,
  EstatisticaEtd,
  Winapi.Windows;

{ TSendStatistcsUseCase }

function TSendStatistcsUseCase.Run: Boolean;
const M = 'TSendStatistcsUseCase.Run';
var
  dtLastRun: TDateTime;
  tipos: TiposEstatisticas;
begin
  try

    InitUseCase();

    if repo.IsCnpjHW then
      Exit(True);

    var conf := repo.GetConfig('hw_ws_envio_statisticas', repo.CodEmpresa);
    conf.AtivarMapeamentoKeys;
//    statusEnv := seSemEvento;

//    if not IsTimeToRun then
//      Exit;
    dtLastRun := IncDay(repo.DataHoraAtual, -1);
    TryStrToDateTime(conf.AsString, dtLastRun);

//    if DateOf(dtLastRun) = DateOf(repo.DataHoraAtual) then
//      Exit(True);

    var confApi := api.GetConfsEstatisticas;
    try

      conf.WriteBool('Conf', 'RegistroGeral', confApi.RegistroGeral);
      conf.WriteBool('Conf', 'RegistroUsuarios', confApi.RegistroUsuarios);
      conf.WriteBool('Conf', 'RegistroPersonalizado', confApi.RegistroPersonalizado);

      {$REGION 'Registros Personalizados'}

      if confApi.RegistroPersonalizado then
      begin
        var customApi := api.GetEstatisticasCustom(conf.ReadInteger('Custom', 'LastUpdateSeq'));
        if (Length(customApi) > 0) and repo.UpdateEstatisticasCustom(customApi) then
        begin
          var lastUpdateSeq := 0;
          for var custom in customApi do
            lastUpdateSeq := IfThen(custom.seqUpdate > lastUpdateSeq, custom.seqUpdate, lastUpdateSeq);

          conf.WriteInteger('Custom', 'LastUpdateSeq', lastUpdateSeq);
        end;

        var customsDB := repo.GetEstatisticasCustom();

        for var customDb in customsDB do
          repo.RunEstatisticasCustom(customDb);
      end;

      {$ENDREGION}

      {$REGION 'Registro Geral e de Usuários'}

      tipos := [];
      if confApi.EnviarGeral then
        tipos := tipos + [teGeral];
      if confApi.EnvioUsuarios then
        tipos := tipos + [teUsuarios];
      if confApi.EnvioPersonalizado then
        tipos := tipos + [tePersonalizado];
      if confApi.EnviarGeralResumido then
        tipos := tipos + [teGeralResumido];
      if confApi.EnvioUsuariosResumido then
        tipos := tipos + [teUsuariosResumido];

      var countErros := 0; //se chegar a 3 não continua

      var estatisticas := repo.GetEstatisticas(tipos);

      while (Length(estatisticas) > 0) and (countErros < 3) do
      begin
        var resp := api.PostEstatisticas(estatisticas);
        if resp.isSuccess then
          repo.UpdateStatusEnvioEstatistica(estatisticas)
        else if resp.data.ToLower.Contains('to store duplicate value') then
        begin
          for var item in estatisticas do
            with api.PostEstatistica(item) do
              if isSuccess or (code = 409) then
                repo.UpdateStatusEnvioEstatistica([item])
              else if countErros >= 3 then
                Break
              else
                countErros := countErros + 1;
        end;


        for var iFree := Low(estatisticas) to High(estatisticas) do
          try
            FreeAndNil(estatisticas[iFree])
          except on E: Exception do
          end;

        try
           TrimAppMemorySize;
        except on E: Exception do
        end;


        estatisticas := repo.GetEstatisticas(tipos);
      end;

      {$ENDREGION}

    finally
      conf.value1_vc := DateTimeToStr(repo.DataHoraAtual);
      conf.SaveConfDB(repo.QrAux).Transaction.Commit;
    end;

    Result := True;

//insert into stats (dia, cod_e, descricao, quantidade, valor)
//select b.data_em_bol data, b.cod_empresa, 'BOLETO ' || cb.banco descricao,
//count(b.n_seq_bol) quantidade, sum(b.vl_doc_bol) valor
//from boletas b
//inner join cobrebem cb on cb.cod_cobrebem = b.cod_cobrebem and cb.cod_empresa = b.cod_empresa
//left join stats s on s.dia = b.data_em_bol and s.cod_e = b.cod_empresa and s.descricao = 'BOLETO ' || cb.banco
//where b.cod_empresa = :cod_empresa and b.data_em_bol >= '01.01.2021' and b.data_em_bol <= '31.01.2021'
//and b.nosso_numero_banco <> '' and s.dia is null
//group by 1,2,3

  except on E: Exception do
    begin
      Result := False;
//      statusEnv := seError;
//      HandleDataConsulta;
//
      LogApp.Error('%s - %s', [M, e.Message]);
      if not silent then
        ShowErro(E.Message);
    end;
  end;

end;

procedure TSendStatistcsUseCase.TrimAppMemorySize;
var
  MainHandle : THandle;
begin
    if IniConf.ReadStr('TrimAppMemorySize', 'Log', 'N') = 'N' then
      Exit;
  //LIBERA MEMORIA NAO UTILIZADA, SEMELHANTE AO GARBAGE COLECTOR
  try
    MainHandle := OpenProcess(PROCESS_ALL_ACCESS, False, GetCurrentProcessID) ;
    SetProcessWorkingSetSize(MainHandle, $FFFFFFFF, $FFFFFFFF) ;
    CloseHandle(MainHandle) ;

    if IniConf.ReadStr('TrimAppMemorySize', 'Log', 'N') = 'S' then
      LogApp.Log('TrimAppMemorySize', 'Rodando', True, True);
  except on E: Exception do
    begin
     if IniConf.ReadStr('TrimAppMemorySize', 'Log', 'N') = 'S' then
        LogApp.Log('TrimAppMemorySizeErro', E.Message);
    end;
  end;
end;

end.
