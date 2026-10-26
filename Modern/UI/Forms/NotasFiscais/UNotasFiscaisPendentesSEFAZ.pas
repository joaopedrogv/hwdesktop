unit UNotasFiscaisPendentesSEFAZ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, FilterFR, NFePendentesSefazDataSet, DBGridFrameUnit, ExtCtrls, Buttons, StdCtrls, Mask,
  hw_audit_utils;

type
  TFrmNotasFiscaisPendentesSEFAZ = class(TfrmPadrao)
    pnGrid: TPanel;
    DBGridFrame1: TDBGridFrame;
    Panel8: TPanel;
    SpeedButton1: TSpeedButton;
    FilterFrame1: TFilterFrame;
    Panel1: TPanel;
    btResolverPendencia: TBitBtn;
    btMarcarComoResolvido: TBitBtn;
    procedure btMarcarComoResolvidoClick(Sender: TObject);
    procedure btResolverPendenciaClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    DataSet: TNFePendentesSefazDataSet;
    Auditor: TAudit_OOP;
  public
    procedure Setup();
  end;

var
  FrmNotasFiscaisPendentesSEFAZ: TFrmNotasFiscaisPendentesSEFAZ;

implementation

uses
  DateUtils,
  uDtmAtivo, hw_filters,
  ContainerUnit, FieldsConfigUnit, NotaFiscalPendenciaSefMetadataUnit, EntityMetadataUnit, DbGridConfigUtilsUnit,
  StatusResolucaoNFeSefEnumUnit, UIUtilsUnit, LegacyDFeDLLAdapterUnit,
  ErpFeaturesFactoryUnit, uDataSet_OOP, EValidacaoNegocioUnit;

{$R *.dfm}

{ TFrmNotasFiscaisPendentesSEFAZ }

procedure TFrmNotasFiscaisPendentesSEFAZ.btMarcarComoResolvidoClick(Sender: TObject);
begin
  try

    if not Auditor.Alterar.Processo('NF0261',
      Format('STATUS: - NF CONTING:[%d - %s] NF PEND:[%d - %s]', [
        DataSet.fint('num_nf_cont'), DataSet.fstr('situacao_cont'), DataSet.fint('num_nf_pend'), DataSet.fstr('situacao_pend')
      ]), DataSet.fstr('cod_nf')).Permitido() then
      Exit;

    Container.GetInstance().ErpFeaturesFactory.CreateResolverManualmentePendenciaSefazUseCase()
      .Executar(DataSet.fint('cod_nf'), DataSet.fint('cod_empresa'));

    Auditor.GravarMensagemProcesso('SUCESSO');

    DataSet.Refresh();

    UIUtils.ShowInfo('Processo concluído');

  except on E: Exception do
    UIUtils.HandleError(E);
  end;
end;

procedure TFrmNotasFiscaisPendentesSEFAZ.btResolverPendenciaClick(Sender: TObject);
var
  erros: WideString;
begin
  if StatusResolucaoNFeSefEnum(DataSet.fint('status_resolucao')) in [ srsResolvida, srsResolvidaManual] then
  begin
    UIUtils.ShowInfo('Pendencia já foi resolvida');
    Exit;
  end;

  if not Auditor.Alterar.Processo('NF0262',
    Format('STATUS: - NF CONTING:[%d - %s] NF PEND:[%d - %s]', [
      DataSet.fint('num_nf_cont'), DataSet.fstr('situacao_cont'), DataSet.fint('num_nf_pend'), DataSet.fstr('situacao_pend')
    ]), DataSet.fstr('cod_nf')).Permitido() then
    Exit;

  if not LegacyDFeDLLAdapter.ResolverPendenciaNFeSefaz(
    DataSet.fint('cod_nf'),
    DataSet.fint('cod_empresa'),
    vDadosIni.vBancoHW,
    erros
    ) then
  begin
    UIUtils.ShowError(erros);
  end;
  DataSet.Refresh;
end;

procedure TFrmNotasFiscaisPendentesSEFAZ.Setup();
var
  builder: IFieldsConfigBuilder;
  meta: EntityMetadata;
  defDisplay: string;
  dataIni, dataFim: TDateTime;

begin
  builder := FieldsConfigFactory.Create();
  meta := NotaFiscalPendenciaSefMetadata.GetMetadata();

  DataSet := TNFePendentesSefazDataSet.Create();
  DataSet.Setup(builder, meta);

  Auditor := DataSet.Auditor;

  DBGridFrame1.Setup(TDBGridFrameSetup.CreateClean());
  DBGridFrame1.DataSource := DataSet._dataSourceOOP;

  DbGridConfigUtils.ApplyToDBGrid(DBGridFrame1.DBGrid, builder.List);

  defDisplay := builder.List.Field['dhemi'].DisplayLabel;

  FilterFrame1.TodosToggle(True).FillForm(DataSet.dataSet, nil, defDisplay);

  if (FilterFrame1.edCampos.Text = defDisplay) and (FilterFrame1.edCondicao.Text = COND_LIST_ALL[feBetween])
    and not TryStrToDate(FilterFrame1.edConteudo1.Text, dataIni)
    and not TryStrToDate(FilterFrame1.edConteudo2.Text, dataFim) then
  begin
    FilterFrame1.edConteudo1.Text := DateToStr(StartOfTheMonth(Date()));
    FilterFrame1.edConteudo2.Text := DateToStr(EndOfTheMonth(Date()));
  end;
  try
    SpeedButton1.Click();
  except
  end;
end;

procedure TFrmNotasFiscaisPendentesSEFAZ.SpeedButton1Click(Sender: TObject);
begin
  DataSet.SQLMaker.FilterMk.FreeFilters()
    .Add('cod_empresa', vDadosIni.cod_empresa)
    .Add(FilterFrame1.GetFiltros());
  DataSet.RunSQLMaker();
end;

end.
