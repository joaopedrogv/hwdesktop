unit PackageSetuptUnit;

interface

implementation

uses
  Forms, SysUtils, StrUtils,
  uDtmAtivo, hw_win_utils,
  SetupUnit, SetupConfigUnit, FileConfigUnit, ISqlLoggerUnit,
  UCadGruposFiscais, ContainerUnit, FiscalCalculosFactoryUnit,
  ErpFeaturesFactoryUnit, UCadOperacoesInternas, UCadRegrasFiscaisIbsCbs,
  UCadOperacoesFiscaisIbsCbs, UCadOpInternasComTiposVendas,
  SharedFactoryContainerUnit, SharedRepoContainerUnit, FiscalRepoContainerUnit,
  ErpFeaturesRepoContainerUnit, UCentralDadosFiscais, UCadNFSe, ISharedFactoryUnit, ISessionContextUnit,
  UCadRegrasRedBenefPC, UCadAjustesRedBenefPC;

var
  GFiscalFactoryInst: IFiscalCalculosFactory;
  GErpFeaturesInst: IErpFeaturesFactory;
  formGruposFiscais: TfrmCadGruposFiscais;
  formOperacoInterna: TfrmCadOperacoesInternas;
  formRegrasFiscaisIbsCbs: TfrmCadRegrasFiscaisIbsCbs;
  formOperacoesFiscaisIbsCbs: TfrmCadOperacoesFiscaisIbsCbs;
  formOpInternasComTiposVendas: TfrmCadOpInternasComTiposVendas;

procedure ModernInitialize();
var
  FSharedFactory: ISharedFactory;
  Session: ISessionContext;
begin
  Session := Container.GetInstance().GetSessionContext();

  Session.SetEnviroment(vDadosIni.bancoConectado, GetPathTemp('modern'));

  AppSetup.Initialize(
    dtmAtivo.bancoHw,
    SetupConfig.Create(
      FileConfig.Create(IfThen(vDadosIni.loggeral = 'S', ExtractFilePath(ParamStr(0)) + 'log\'), ''),
      FileConfig.Create(ExtractFilePath(ParamStr(0)), 'erros.log')
  ));

  AppSetup.SqlLogger.SetOptions([loQuery, loParam]);

  FSharedFactory := SharedFactory.Create(AppSetup.DatabaseConnection, Session);

  GFiscalFactoryInst := FiscalCalculosFactory.Create(AppSetup.DatabaseConnection, FSharedFactory);
  GErpFeaturesInst := ErpFeaturesFactory.Create(AppSetup.DatabaseConnection, FSharedFactory, Session);

  Container.GetInstance().RegisterFiscalCalculosFactory(GFiscalFactoryInst);
  Container.GetInstance().RegisterErpFeatures(GErpFeaturesInst);
end;

procedure ModernShutDown();
begin
  Container.ReleaseInstance();
  ErpFeaturesRepoContainer.ReleaseInstance();
  SharedRepoContainer.ReleaseInstance();
  FiscalRepoContainer.ReleaseInstance();

  {$IFDEF INTF_ON}
  if Assigned(GErpFeaturesInst) then
    FreeAndNil(GErpFeaturesInst);

  if Assigned(GFiscalFactoryInst) then
    FreeAndNil(GFiscalFactoryInst);
  {$ELSE}
  GErpFeaturesInst := nil;
  GFiscalFactoryInst := nil;
  {$ENDIF}

  AppSetupShutdown();
end;

procedure ShowGruposFiscais(Amodal: Boolean);
begin
  if not Assigned(formGruposFiscais) then
  begin
    vDadosIni.vModalOuChild := IfThen(Amodal, 'M', 'C');
    Application.CreateForm( TfrmCadGruposFiscais, formGruposFiscais );
  end;

  if Amodal then
    formGruposFiscais.ShowModal()
  else
    formGruposFiscais.Show();
end;

procedure ShowOperacoesInternas(Amodal: Boolean);
begin
  if not Assigned(formOperacoInterna) then
  begin
    vDadosIni.vModalOuChild := IfThen(Amodal, 'M', 'C');
    Application.CreateForm( TfrmCadOperacoesInternas, formOperacoInterna );
  end;

  if Amodal then
    formOperacoInterna.ShowModal()
  else
    formOperacoInterna.Show();
end;

procedure ShowRegrasFiscaisIbsCbs(Amodal: Boolean);
begin
  if not Assigned(formRegrasFiscaisIbsCbs) then
  begin
    vDadosIni.vModalOuChild := IfThen(Amodal, 'M', 'C');
    Application.CreateForm( TfrmCadRegrasFiscaisIbsCbs, formRegrasFiscaisIbsCbs );
  end;

  if Amodal then
    formRegrasFiscaisIbsCbs.ShowModal()
  else
    formRegrasFiscaisIbsCbs.Show();
end;

procedure ShowOperacoesFiscaisIbsCbs(Amodal: Boolean);
begin
  if not Assigned(formOperacoesFiscaisIbsCbs) then
  begin
    vDadosIni.vModalOuChild := IfThen(Amodal, 'M', 'C');
    Application.CreateForm( TfrmCadOperacoesFiscaisIbsCbs, formOperacoesFiscaisIbsCbs );
  end;

  if Amodal then
    formOperacoesFiscaisIbsCbs.ShowModal()
  else
    formOperacoesFiscaisIbsCbs.Show();
end;

procedure ShowVinculosComTipoVenda(CodTipoVenda: Integer; const TipoVenda: string);
begin
  Application.CreateForm( TfrmCadOpInternasComTiposVendas, formOpInternasComTiposVendas );
  try
    formOpInternasComTiposVendas.Inicializar(CodTipoVenda, TipoVenda);
    formOpInternasComTiposVendas.ShowModal()
  finally
    formOpInternasComTiposVendas.Free();
  end;
end;

procedure ShowCentralDeDadosFiscais(Amodal: Boolean);
begin
   //Menu: RTC_CentraldeInformacoesFiscais1 / 9 / Central de Informações Fiscais
  if not Assigned(FrmCentralDadosFiscais) then
  begin
    vDadosIni.vModalOuChild := IfThen(Amodal, 'M', 'C');
    Application.CreateForm( TFrmCentralDadosFiscais, FrmCentralDadosFiscais );
  end;

  if Amodal then
    FrmCentralDadosFiscais.ShowModal()
  else
    FrmCentralDadosFiscais.Show();
end;

procedure ShowDPS(Amodal: Boolean);
begin
  if not Assigned(FrmCadNFSe) then
  begin
    vDadosIni.vModalOuChild := IfThen(Amodal, 'M', 'C');
    Application.CreateForm( TFrmCadNFSe, FrmCadNFSe );
  end;

  if Amodal then
    FrmCadNFSe.ShowModal()
  else
    FrmCadNFSe.Show();
end;

procedure ShowRegrasRedBenefPC(Amodal: Boolean);
begin
  if not Assigned(FrmCadRegrasRedBenefPC) then
  begin
    vDadosIni.vModalOuChild := IfThen(Amodal, 'M', 'C');
    Application.CreateForm( TFrmCadRegrasRedBenefPC, FrmCadRegrasRedBenefPC );
  end;

  if Amodal then
    FrmCadRegrasRedBenefPC.ShowModal()
  else
    FrmCadRegrasRedBenefPC.Show();
end;

procedure ShowAjustesRedBenefPC(Amodal: Boolean);
begin
  if not Assigned(FrmCadAjustesRedBenefPC) then
  begin
    vDadosIni.vModalOuChild := IfThen(Amodal, 'M', 'C');
    Application.CreateForm( TFrmCadAjustesRedBenefPC, FrmCadAjustesRedBenefPC );
  end;

  if Amodal then
    FrmCadAjustesRedBenefPC.ShowModal()
  else
    FrmCadAjustesRedBenefPC.Show();
end;

exports
  ModernInitialize,
  ModernShutDown,
  ShowGruposFiscais,
  ShowOperacoesInternas,
  ShowRegrasFiscaisIbsCbs,
  ShowOperacoesFiscaisIbsCbs,
  ShowVinculosComTipoVenda,
  ShowCentralDeDadosFiscais,
  ShowDPS,
  ShowRegrasRedBenefPC,
  ShowAjustesRedBenefPC;
end.
