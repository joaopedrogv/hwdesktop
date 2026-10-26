unit UCadOpInternasComTiposVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Mask, ExtCtrls, Grids, DBGrids, Buttons, FilterFR,
  CheckListBoxEntityPickerFrameUnit, FilterPadraoFR, uDataSet_OOP,
  OpInternaComTpVendaEtdUnit, IUIFormValidatorUnit, hw_audit_utils;

type
  TfrmCadOpInternasComTiposVendas = class(TForm)
    PageControl1: TPageControl;
    tabConsulta: TTabSheet;
    tabVincTipoVendaAOpInternas: TTabSheet;
    tabVincOpInternasATipoVenda: TTabSheet;
    GroupBox1: TGroupBox;
    FilterFramePadrao1: TFilterFramePadrao;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBGrid1: TDBGrid;
    CheckListBoxEntityPickerFrameTpVendas: TCheckListBoxEntityPickerFrame;
    Panel3: TPanel;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Label1: TLabel;
    edDescricaoOpInterna: TMaskEdit;
    Label2: TLabel;
    CheckListBoxEntityPickerFrameOpInternas: TCheckListBoxEntityPickerFrame;
    Panel1: TPanel;
    BitBtn3: TBitBtn;
    Label3: TLabel;
    edDescricaoTpVenda: TMaskEdit;
    Label4: TLabel;
    Panel2: TPanel;
    Panel4: TPanel;
    BitBtn6: TBitBtn;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FData: TDataSet_OOP;
    FAuditor: TAudit_OOP;                
    FFormValidator: IUIFormValidator;
    FState: OpInternaComTpVendaEtd;
    FStateList: OpInternasComTpVendasEtd;
    procedure EventAddTpVendas(Sender: TObject; Entity: TObject; out Display: string; out SetSelected: Boolean);
  public
    destructor Destroy; override;

    procedure Inicializar(const OpInternaId: string); overload;
    procedure Inicializar(CodTpVenda: Integer; const TipoTpVenda: string); overload;
  end;

var
  frmCadOpInternasComTiposVendas: TfrmCadOpInternasComTiposVendas;

implementation

uses
  StrUtils,
  FieldsConfigUnit, DB, uDtmAtivo, ContainerUnit, OperacaoInternaEtdUnit,
  TipoVendaEtdUnit, Contnrs, TipoComunsUnit, ArrayServiceUnit,
  StringServiceUnit, VincularTiposVendasAOpInternaInputUnit,
  OpInternaTpVendaVinculoModelUnit, CreateEntityUseCaseOutputUnit,
  ErpFeaturesFactoryUnit, VincularOpInternasATipoVendaInputUnit, UIUtilsUnit,
  UIFormValidatorFactoryUnit;

type
  TOpInternaComTpVendaOOP = class(TDataSet_OOP)
  private
    procedure GetText(Sender: TField; var Text: string; DisplayText: Boolean);
  public
    constructor Create();
  end;

{ TOpInternaComTpVendaOOP }

constructor TOpInternaComTpVendaOOP.Create;
begin
  TableName := 'OP_INTERNAS_TPVENDAS';
  inherited Create(dtmAtivo.bancoHw, nil, True, 'cds_opintcomtpvendas');
  {
  SQLMaker.Build(
    TableName, 'o',
     // 'select' +
    'o.op_interna_id, o.cod_tipo, o.tipo, o.padrao, o.data_cadastro, ' +
    'op.id op_id, op.seqid op_seqid, op.descricao op_descricao, op.ativo op_ativo, ' +
    //'op.data_cadastro op_data_cadastro, op.data_alteracao op_data_alteracao, ' +
    'tv.cod_tipo tv_cod_tipo, tv.tipo tv_tipo, tv.descricao tv_descricao, ' +
    'tv.tipo_os tv_tipo_os, tv.sigla tv_sigla, tv.venda tv_venda, tv.ativo tv_ativo ',
    // 'from op_internas_tpvendas o ' +
    'left join op_internas op on op.id = o.op_interna_id ' +
    'left join tipo_vendas tv on tv.cod_tipo = o.cod_tipo and tv.tipo = o.tipo ',
    '','op.descricao, tv.tipo, tv.descricao'
  );                              

  ConfigFields(
    FieldsConfigFactory.Create()
      .Add('op_interna_id,op_id,op_ativo,tv_ativo,tv_cod_tipo,tv_tipo', fvInvisivel)
      .Add('cod_tipo', 'Cod Tp Venda')
      .Add('tipo', 'Tipo de Venda')
      .Add('padrao', 'Op Padrao para Tp Venda?')
      .Add('op_seqid', 'Cod Op Interna')
      .Add('op_descricao', 'Operação Interna', fvSempreVisivel)
      .Add('tv_descricao', 'Tipo de Venda', fvSempreVisivel)
      .Add('tv_tipo_os', 'Tipo para OS')
      .Add('tv_sigla', 'Tipo para REQ')
      .Add('tv_venda', 'Venda?')
  );

  SQLMaker.FilterMk.FreeFilters()
    .AddIsNull('op_interna_id', True);

  RunSQLMaker();
  }
end;

procedure TOpInternaComTpVendaOOP.GetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin

end;

{$R *.dfm}

{ TfrmCadOpInternasComTiposVendas }

procedure TfrmCadOpInternasComTiposVendas.BitBtn3Click(Sender: TObject);
var
  opInternas: OpInternaTpVendaVinculoModelArray;
  selecteds: TObjectList;
  createResult: CreateEntityUseCaseOutPut;
  I: Integer;
  SAudit: string;
begin
  if not FAuditor.Processo('MOD027').Alterar()
    .Permitido() then
    Exit;

  selecteds := CheckListBoxEntityPickerFrameOpInternas.GetSelecteds();
  SetLength(opInternas, selecteds.Count);

  SAudit := FState.TipoTpVenda + FState.TipoVenda.Descricao;

  for I := 0 to selecteds.Count - 1 do
  begin
    opInternas[I] := OpInternaTpVendaVinculoModel.Create(
      OperacaoInternaEtd(selecteds[I]).Id,
      FState.CodTpVenda,
      FState.TipoTpVenda,
      False
    );
    SAudit := SAudit + Format(', (%d %s)', [ OperacaoInternaEtd(selecteds[I]).SeqId, OperacaoInternaEtd(selecteds[I]).Descricao ]);
  end;

  try
    try
      with Container.GetInstance().ErpFeaturesFactory.CreateVincularOpInternasATipoVendaUseCase() do
      try
        createResult := Executar( VincularOpInternasATipoVendaInput.Create( FState.CodTpVenda, FState.TipoTpVenda, opInternas ) );
      finally
        FreeSafe();
      end;

      if not createResult.Validation.IsValid then
          FFormValidator.Validate(createResult.Validation)
      else
      begin
        FAuditor.Sucesso().GravarMensagem( SAudit );
        Close();
      end;

    finally
      createResult.Free();
    end;
  except on E: Exception do
    UIUtils.HandleError(E);
  end;
end;

procedure TfrmCadOpInternasComTiposVendas.BitBtn4Click(Sender: TObject);
var
  tpVendas: OpInternaTpVendaVinculoModelArray;
  selecteds: TObjectList;
  createResult: CreateEntityUseCaseOutPut;
  I: Integer;
  SAudit: string;
begin
  if not FAuditor.Processo('MOD026').Alterar()
    .Permitido() then
    Exit;

  selecteds := CheckListBoxEntityPickerFrameTpVendas.GetSelecteds();
  SetLength(tpVendas, selecteds.Count);

  SAudit := FState.OperacaoInterna.Descricao;

  for I := 0 to selecteds.Count - 1 do
  begin
    tpVendas[I] := OpInternaTpVendaVinculoModel.Create(
      FState.OperacaoInternaId,
      TipoVendaEtd(selecteds[I]).Codigo,
      TipoVendaEtd(selecteds[I]).Tipo,
      False
    );
    SAudit := SAudit + { IfThen( I > 0, SAudit + ', ') + } Format(', (%s %s)', [ TipoVendaEtd(selecteds[I]).Tipo, TipoVendaEtd(selecteds[I]).Descricao ]);
  end;

  try

    with Container.GetInstance().ErpFeaturesFactory.CreateVincularTiposVendasAOpInternaUseCase() do
    try
      createResult := Executar( VincularTiposVendasAOpInternaInput.Create( FState.OperacaoInternaId, tpVendas ) );
    finally
      FreeSafe();
    end;

    if not createResult.Validation.IsValid then
        FFormValidator.Validate(createResult.Validation)
    else
    begin
      FAuditor.Sucesso().GravarMensagem( SAudit );
      Close();
    end;

  finally
    createResult.Free();
  end;
end;

procedure TfrmCadOpInternasComTiposVendas.BitBtn5Click(Sender: TObject);
begin
  Close();
end;

destructor TfrmCadOpInternasComTiposVendas.Destroy;
begin
  FData.Free();
  FState.Free();
  FStateList.Free();
  inherited;
end;

procedure TfrmCadOpInternasComTiposVendas.EventAddTpVendas(Sender,
  Entity: TObject; out Display: string; out SetSelected: Boolean);
var
  I: Integer;
begin
  SetSelected := False;
  Display := '';
  if Entity = nil then
    Exit;

  if Sender = CheckListBoxEntityPickerFrameTpVendas then
  begin
    Display := Format('[%s] - %s', [TipoVendaEtd(Entity).Tipo, TipoVendaEtd(Entity).Descricao ]);

    for I := 0 to FStateList.Count - 1 do
      if (OpInternaComTpVendaEtd(FStateList[I]).CodTpVenda = TipoVendaEtd(Entity).Codigo) and
        (OpInternaComTpVendaEtd(FStateList[I]).TipoTpVenda = TipoVendaEtd(Entity).Tipo) then
      begin
        SetSelected := True;
        Break;
      end;
  end
  else if Sender = CheckListBoxEntityPickerFrameOpInternas then
  begin
    Display := Format('%d - %s', [OperacaoInternaEtd(Entity).SeqId, OperacaoInternaEtd(Entity).Descricao ]);

    for I := 0 to FStateList.Count - 1 do
      if OpInternaComTpVendaEtd(FStateList[I]).OperacaoInternaId = OperacaoInternaEtd(Entity).Id then
      begin
        SetSelected := True;
        Break;
      end;
  end;
end;

procedure TfrmCadOpInternasComTiposVendas.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePage := tabConsulta;
  tabConsulta.TabVisible := False;
  tabVincOpInternasATipoVenda.TabVisible := False;
  tabVincTipoVendaAOpInternas.TabVisible := False;

  FData    := TOpInternaComTpVendaOOP.Create();
  FAuditor := FData.Auditor;

  FState := OpInternaComTpVendaEtd.Create();
  FStateList := OpInternasComTpVendasEtd.Create();

  FFormValidator := UIFormValidatorFactory.Create()
    .Builder()
    .Bind('OpInternaId', edDescricaoOpInterna)
    .Bind('CodTpVenda', edDescricaoTpVenda)
    .Bind('TipoTpVenda', edDescricaoTpVenda)
    .Validator();
end;

procedure TfrmCadOpInternasComTiposVendas.Inicializar(CodTpVenda: Integer;
  const TipoTpVenda: string);
var
  tpVenda: TipoVendaEtd;
begin
  FStateList.Free();
  with Container.GetInstance().ErpFeaturesFactory.CreateListarOpInternasComTpVendasPorTpVendaUSeCase() do
  try
    FStateList := Executar( CodTpVenda, TipoTpVenda );
  finally
    FreeSafe();
  end;

  if FStateList.Count = 0 then
  begin
    with Container.GetInstance().ErpFeaturesFactory.CreateObterTipoVendaPorIdUseCase() do
    try
      tpVenda := Executar( CodTpVenda, TipoTpVenda );
    finally
      FreeSafe();
    end;

    if tpVenda = nil then
      raise Exception.Create('Tipo de Venda não encontrada');

    FState.Free();
    FState := OpInternaComTpVendaEtd.Create(tpVenda);

    edDescricaoTpVenda.Text := Format('[%s] - %s', [ FState.TipoVenda.Tipo, FState.TipoVenda.Descricao ]);
  end
  else
  begin
    FState.Free();
    FState := OpInternaComTpVendaEtd.Create(TipoVendaEtd(OpInternaComTpVendaEtd(FStateList[0]).TipoVenda.Clone()));
  end;
  edDescricaoTpVenda.Text := Format('[%s] - %s', [ FState.TipoVenda.Tipo, FState.TipoVenda.Descricao ]);

  CheckListBoxEntityPickerFrameOpInternas.OnEntityAdd := EventAddTpVendas;
  with Container.GetInstance().ErpFeaturesFactory.CreateListarAtualeTodasOperacoesInternasUseCase() do
  try
    CheckListBoxEntityPickerFrameOpInternas.LoadEntities( Executar( '' ), True );
  finally
    FreeSafe();
  end;
  PageControl1.ActivePage := tabVincOpInternasATipoVenda;
end;

procedure TfrmCadOpInternasComTiposVendas.Inicializar(
  const OpInternaId: string);
var
  op: OperacaoInternaEtd;
begin
  FStateList.Free();
  with Container.GetInstance().ErpFeaturesFactory.CreateListarOpInternasComTpVendasPorOpInternaUseCase() do
  try
    FStateList := Executar( OpInternaId );
  finally
    FreeSafe();
  end;

  if FStateList.Count = 0 then
  begin
    with Container.GetInstance().ErpFeaturesFactory.CreateObterOperacaoInternaPorIdUseCase() do
    try
      op := Executar( OpInternaId );
    finally
      FreeSafe();
    end;

    if op = nil then
      raise Exception.Create('Operação Interna não encontrada');

    FState.Free();
    FState := OpInternaComTpVendaEtd.Create( op );
  end
  else
  begin
    FState.Free();
    FState := OpInternaComTpVendaEtd.Create( OperacaoInternaEtd(OpInternaComTpVendaEtd(FStateList[0]).OperacaoInterna.Clone()) );
  end;
  edDescricaoOpInterna.Text := FState.OperacaoInterna.Descricao;

  CheckListBoxEntityPickerFrameTpVendas.OnEntityAdd := EventAddTpVendas;
  with Container.GetInstance().ErpFeaturesFactory.CreateListarTiposVendasPermitidasUseCase() do
  try
    CheckListBoxEntityPickerFrameTpVendas.LoadEntities(
      Executar( StringService.Split([','], 'REQ,OS') ),
    True
  );
  finally
    FreeSafe();
  end;

  PageControl1.ActivePage := tabVincTipoVendaAOpInternas;
end;

end.

