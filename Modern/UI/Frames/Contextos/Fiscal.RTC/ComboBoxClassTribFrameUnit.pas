unit ComboBoxClassTribFrameUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ClassificacaoTributariaEtdUnit, TipoTributoFiscalEnumUnit,
  ExtCtrls, TipoTributoEnumUnit, PercentualReducaoEtdUnit, TratamentoClassificacaoEtdUnit,
  TipoComunsUnit, Buttons;

type
  TComboBoxClassTribFrameChange = procedure(Sender: TObject; ClassificacaoTrib: ClassificacaoTributariaEtd) of object;

  TComboBoxClassTribFrame = class(TFrame)
    edCClassTrib: TMaskEdit;
    edCClassTribList: TComboBox;
    pnVigencia: TPanel;
    lbInfo: TLabel;
    btDetalhes: TSpeedButton;
    procedure btDetalhesClick(Sender: TObject);
    procedure edCClassTribListExit(Sender: TObject);
    procedure edCClassTribExit(Sender: TObject);
    procedure edCClassTribListChange(Sender: TObject);
  private
    FData: TDate;
    FTipoTributo: TipoTributoFiscalEnum;
    FClassificacoes: ClassificacoesTributariasEtd;
    FOnClassificacaoChange: TComboBoxClassTribFrameChange;
    procedure SetLabelInfo(classTrib: ClassificacaoTributariaEtd);
    function GetPercentualReducaoEtdFromUseCase(
      const CClassTrib: string; TipoTributo: TipoTributoEnum; Data: TDate
    ): PercentualReducaoEtd;
  public
    procedure Setup(const cClassTrib: string; TipoTributo: TipoTributoFiscalEnum; Data: TDate);
    destructor Destroy; override;

    function GetCClassTrib(): string;
    function GetClassificacao: ClassificacaoTributariaEtd;
    function GetTratamentoClassificacao: TratamentoClassificacaoEtd;

    property OnClassificacaoChange: TComboBoxClassTribFrameChange read FOnClassificacaoChange write FOnClassificacaoChange;
  end;

implementation

uses
  Math,
  StrUtils,
  Contnrs,
  ContainerUnit,
  DateTimeServiceUnit, UIUtilsUnit;

{$R *.dfm}

{ TComboBoxClassTribFrame }

procedure TComboBoxClassTribFrame.btDetalhesClick(Sender: TObject);
var
  tratClass: TratamentoClassificacaoEtd;
  S: string;
var
  classTrib: ClassificacaoTributariaEtd;
  tipoTribCalc: TipoTributoEnum;
  percRed: PercentualReducaoEtd;
begin
  classTrib := nil;
  if (edCClassTribList.ItemIndex >= 0) and
    (edCClassTribList.ItemIndex < edCClassTribList.Items.Count) then
    classTrib := ClassificacaoTributariaEtd(edCClassTribList.Items.Objects[edCClassTribList.ItemIndex]);

  if classTrib = nil then
    UIUtils.HintInfo(edCClassTribList, 'Classificação não encontrada!')

  else
    S := Format(
      '--- CLASSIFICAÇÃO TRIBUTÁRIA ---' + sLineBreak + sLineBreak +
      'cClassTrib: %s' + sLineBreak +
      'Descrição: %s' + sLineBreak +
      'CST: %s' + sLineBreak +
      'Início Vigência: %s' + sLineBreak +
      'Fim Vigência: %s' + sLineBreak +
      'Tipo de Alíquota: %s' + sLineBreak +
      'Nomeclatura: %s' + sLineBreak +
      'Apropriação de crédito pelo adquirente - IBS: [%s]' + sLineBreak +
      'Apropriação de crédito pelo adquirente - CBS: [%s]' + sLineBreak +
      'Crédito Presumido Fornecedor: [%s]' + sLineBreak +
      'Crédito Presumido Adquirente: [%s]' + sLineBreak +
      'Crédito da Operação Antecedente: [%s]' + sLineBreak + sLineBreak,
      [
        classTrib.Codigo,
        classTrib.Descricao,
        classTrib.SituacaoTributaria.Codigo,
        DateToStr(classTrib.InicioVigencia),
        IfThen(not classTrib.FimVigencia.IsNull, DateToStr(classTrib.FimVigencia.Value)),
        classTrib.TipoAliquota,
        classTrib.Nomenclatura,
        classTrib.InApropriacaoCreditosAdquirentesIBS.ToText(),
        classTrib.InApropriacaoCreditosAdquirentesCBS.ToText(),
        classTrib.InCreditoPresumidoFornecedor.ToText(),
        classTrib.InCreditoPresumidoAdquirente.ToText(),
        classTrib.CreditoOperacaoAntecedente.ToText()
      ]
    );

  tratClass := GetTratamentoClassificacao();
  try

    if (tratClass = nil) or (tratClass.TratamentoTributario.Id = 0) then
      UIUtils.HintInfo( Format('Classificação sem tratamento tributário vigênte na data %s', [DateToStr(FData)]))

    else
      S := S + Format(
        '--- TRATAMENTO TRIBUTÁRIO ---' + sLineBreak + sLineBreak +
        'Descrição: %s' + sLineBreak +
        'Início Vigência: %s' + sLineBreak +
        'Fim Vigência: %s' + sLineBreak +
        'Exige Tributação Regular: [%s]' + sLineBreak +
        'Operação compatível com Suspensao: [%s]' + sLineBreak +
        'Possui Percentual Redução: [%s]' + sLineBreak + sLineBreak,
        [
          tratClass.TratamentoTributario.Descricao,
          DateToStr(tratClass.TratamentoTributario.InicioVigencia),
          IfThen(not tratClass.TratamentoTributario.FimVigencia.IsNull, DateToStr(tratClass.TratamentoTributario.FimVigencia.Value)),
          IfThen( tratClass.TratamentoTributario.InExigeGrupoDesoneracao, 'Sim', 'Não' ),
          IfThen( tratClass.TratamentoTributario.InIncompativelComSuspensao, 'Não', 'Sim' ),
          IfThen( tratClass.TratamentoTributario.InPossuiPercentualReducao, 'Sim', 'Não' )
        ]
      );
  finally
    tratClass.Free;
  end;
  
  S := S + '--- PERCENDUAIS DE REDUÇÃO ---' + sLineBreak + sLineBreak;

  percRed := GetPercentualReducaoEtdFromUseCase( classTrib.Codigo, tbtCBS, FData );

  S := S + Format( 'CBS : %n' + sLineBreak, [ percRed.Valor ]);

  percRed := GetPercentualReducaoEtdFromUseCase( classTrib.Codigo, tbtIBSUF, FData );

  S := S + Format( 'IBS Estadual : %n' + sLineBreak, [ percRed.Valor ]);

  percRed := GetPercentualReducaoEtdFromUseCase( classTrib.Codigo, tbtIBSMun, FData );

  S := S + Format( 'IBS Muncipal: %n' + sLineBreak, [ percRed.Valor ]);

  UIUtils.ShowInfo(S);
end;

destructor TComboBoxClassTribFrame.Destroy;
begin
  FClassificacoes.Free();
  inherited;
end;

procedure TComboBoxClassTribFrame.edCClassTribExit(Sender: TObject);
var
  I: Integer;
  classTrib: ClassificacaoTributariaEtd;
begin
  // Se for o mesmo codigo entao sai e nao faz nada
  if (edCClassTribList.ItemIndex >= 0) and
    (edCClassTribList.ItemIndex < edCClassTribList.Items.Count) then
  begin
    classTrib := ClassificacaoTributariaEtd(edCClassTribList.Items.Objects[edCClassTribList.ItemIndex]);
    if classTrib.Codigo = edCClassTrib.Text then
      Exit;
  end;

  // Testa na lista
  for I := 0 to edCClassTribList.Items.Count - 1 do
  begin
    classTrib := ClassificacaoTributariaEtd(edCClassTribList.Items.Objects[I]);
    if classTrib.Codigo = edCClassTrib.Text then
    begin
      edCClassTribList.ItemIndex := I;

      if Assigned(FOnClassificacaoChange) then
        FOnClassificacaoChange(Self, classTrib);      

      Exit;
    end;
  end;
  lbInfo.Caption := 'Classificação não encontrada';
end;

procedure TComboBoxClassTribFrame.edCClassTribListChange(Sender: TObject);
var
  classTrib: ClassificacaoTributariaEtd;
  tipoTribCalc: TipoTributoEnum;
begin
  classTrib := nil;
  if (edCClassTribList.ItemIndex >= 0) and
    (edCClassTribList.ItemIndex < edCClassTribList.Items.Count) then
  begin
    classTrib := ClassificacaoTributariaEtd(edCClassTribList.Items.Objects[edCClassTribList.ItemIndex]);

    if Assigned(FOnClassificacaoChange) then
      FOnClassificacaoChange(Self, classTrib);
  end;

  SetLabelInfo( classTrib );
end;

procedure TComboBoxClassTribFrame.edCClassTribListExit(Sender: TObject);
var
  classTrib: ClassificacaoTributariaEtd;
begin
  if (edCClassTribList.ItemIndex >= 0) and
    (edCClassTribList.ItemIndex < edCClassTribList.Items.Count) then
  begin
    classTrib := ClassificacaoTributariaEtd(edCClassTribList.Items.Objects[edCClassTribList.ItemIndex]);
    if classTrib.Codigo <> edCClassTrib.Text then
      edCClassTrib.Text := classTrib.Codigo;
  end;
end;

function TComboBoxClassTribFrame.GetCClassTrib: string;
begin
  Result := edCClassTrib.Text;
end;

function TComboBoxClassTribFrame.GetClassificacao: ClassificacaoTributariaEtd;
var
  classTrib: ClassificacaoTributariaEtd;
begin
  Result := nil;

  if (edCClassTribList.ItemIndex >= 0) and
    (edCClassTribList.ItemIndex < edCClassTribList.Items.Count) then
  begin
    classTrib := ClassificacaoTributariaEtd(edCClassTribList.Items.Objects[edCClassTribList.ItemIndex]);

    Result := ClassificacaoTributariaEtd(classTrib.Clone());
  end;
end;

function TComboBoxClassTribFrame.GetPercentualReducaoEtdFromUseCase(
  const CClassTrib: string; TipoTributo: TipoTributoEnum; Data: TDate
): PercentualReducaoEtd;
begin
with Container.GetInstance().FiscalCalculosFactory.CreateObterPercentualDeReducaoUseCase() do
  try
    Result := Executar( CClassTrib, TipoTributo, Data );
  finally
    FreeSafe();
  end;
end;

function TComboBoxClassTribFrame.GetTratamentoClassificacao: TratamentoClassificacaoEtd;
var
  classTrib: ClassificacaoTributariaEtd;
  tipoTribCalc: TipoTributoEnum;
begin
  Result := nil;
  classTrib := nil;

  if (edCClassTribList.ItemIndex >= 0) and
    (edCClassTribList.ItemIndex < edCClassTribList.Items.Count) then
  begin
    classTrib := ClassificacaoTributariaEtd(edCClassTribList.Items.Objects[edCClassTribList.ItemIndex]);

    case FTipoTributo of
      tfIS:
        tipoTribCalc := tbtIS
    else
      tipoTribCalc := tbtCBS;
    end;

    if classTrib <> nil then
      with Container.GetInstance().FiscalCalculosFactory.CreateObterTratamentoClassificacaoUseCase() do
      try
        Result := Executar( classTrib.Codigo, tipoTribCalc, FData);
      finally
        FreeSafe();
      end;
  end;
end;

procedure TComboBoxClassTribFrame.SetLabelInfo(
  classTrib: ClassificacaoTributariaEtd);
begin
  if classTrib = nil then
    lbInfo.Caption := ''

  else if not classTrib.FimVigencia.IsNull then
    lbInfo.Caption := Format('Vigência: De %s até %s', [ DateService.ParseLocal(classTrib.InicioVigencia), DateService.ParseLocal(classTrib.FimVigencia.Value) ])
    
  else
    lbInfo.Caption := Format('Início Vigência: %s', [ DateService.ParseLocal(classTrib.InicioVigencia) ]);
end;

procedure TComboBoxClassTribFrame.Setup(const cClassTrib: string;
  TipoTributo: TipoTributoFiscalEnum; Data: TDate);
var
  tipoTribRTC: TipoTributoEnum;
  classTrib: ClassificacaoTributariaEtd;
  I: Integer;
begin
  FreeAndNil(FClassificacoes);
  edCClassTribList.Items.Clear();
  FTipoTributo := TipoTributo;
  FData := Data;

  case TipoTributo of
    tfIBSCBS: tipoTribRTC := tbtCBS;
    tfIS    : tipoTribRTC := tbtIS;
    else
      raise Exception.Create('Setup Combobox ClassTrib TipoTributo invalido');
  end;

  with Container.GetInstance().FiscalCalculosFactory.CreateListarClassificacoesTributariasUseCase() do
  try
    FClassificacoes := Executar( cClassTrib, tipoTribRTC );
  finally
    FreeSafe();
  end;

  classTrib := nil;
  for I := 0 to FClassificacoes.Count - 1 do
  begin
    classTrib := ClassificacaoTributariaEtd(FClassificacoes.Items[I]);

    edCClassTribList.AddItem(Format('%s - %s', [classTrib.Codigo, classTrib.Descricao ]), classTrib);
    if classTrib.Codigo = cClassTrib then
      SetLabelInfo( classTrib );
//      edCClassTribList.ItemIndex := I;
  end;
  edCClassTrib.Text := cClassTrib;
  edCClassTribExit(edCClassTrib);
//  edCClassTribListChange(edCClassTribList);
end;

end.
