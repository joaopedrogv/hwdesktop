unit ComboBoxRegrasFiscaisFrameUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, RegraFiscalIbsCbsEtdUnit,
  PercentualReducaoEtdUnit, TipoTributoEnumUnit, ClassificacaoTributariaEtdUnit, TratamentoClassificacaoEtdUnit;

type
  TComboBoxRegrasFiscaisFrameChange = procedure(Sender: TObject; RegraFiscal: RegraFiscalIbsCbsEtd) of object;
             
  TComboBoxRegrasFiscaisFrameSetup = record
  private
    RegraFiscalId: string;
    ShowAddInfo, AddFirstNull: Boolean;
  public
    class function Create(
      RegraFiscalId: string; 
      ShowAddInfo, AddFirstNull: Boolean
    ): TComboBoxRegrasFiscaisFrameSetup; static;
  end;

  TComboBoxRegrasFiscaisFrame = class(TFrame)
    btDetalhes: TSpeedButton;
    edRegrasFiscais: TComboBox;
    pnVigencia: TPanel;
    lbInfo: TLabel;
    pnRegras: TPanel;
    procedure edRegrasFiscaisChange(Sender: TObject);
    procedure btDetalhesClick(Sender: TObject);
  private
    FOnRegraFiscalChange: TComboBoxRegrasFiscaisFrameChange;
    FRegras: RegrasFiscaisIbsCbsEtd;
    procedure SetLabelInfo(regraFiscal: RegraFiscalIbsCbsEtd);
    function GetPercentualReducaoEtdFromUseCase(
      const CClassTrib: string; TipoTributo: TipoTributoEnum; Data: TDate
    ): PercentualReducaoEtd;
  public
    procedure Setup(const RegraFiscalid: string; AddFirstNull: Boolean = False); overload;
    procedure Setup(const Input: TComboBoxRegrasFiscaisFrameSetup); overload;
    destructor Destroy; override;

    function GetCClassTrib(): string;
    function GetRegraFiscalId: string;
    function GetRegraFiscal: RegraFiscalIbsCbsEtd;
    function GetClassificacao: ClassificacaoTributariaEtd;
    function GetTratamentoClassificacao: TratamentoClassificacaoEtd;

    property OnRegraFiscalChange: TComboBoxRegrasFiscaisFrameChange read FOnRegraFiscalChange write FOnRegraFiscalChange;
  end;

implementation

uses
  ContainerUnit,
  MaskUtils, StrUtils,
  ErpFeaturesFactoryUnit,
  DateTimeServiceUnit,
  FiscalCalculosFactoryUnit,
  UIUtilsUnit;

{$R *.dfm}

procedure TComboBoxRegrasFiscaisFrame.btDetalhesClick(Sender: TObject);
var
  tratClass: TratamentoClassificacaoEtd;
  classTrib: ClassificacaoTributariaEtd;
  percRed: PercentualReducaoEtd;
  R, TR: RegraFiscalIbsCbsEtd;
  S, ST: string;
begin

  R := GetRegraFiscal();
  try

    if R = nil then
    begin
      UIUtils.HintInfo(edRegrasFiscais, 'Regra Fiscal não encontrada!');
      Exit;
    end
    else
    begin
      ST := '';
      if not R.RegraFiscalTribRegularId.IsNull then
      begin
        with Container.GetInstance().ErpFeaturesFactory.CreateObterRegraFiscalIbsCbsPorIdUseCase() do
        try
          TR :=  Executar(R.RegraFiscalTribRegularId.Value);
        finally
          FreeSafe();
        end;
        try
          if TR <> nil then
            ST := Format('%s : %s', [FormatMaskText('000-000;0;', tr.CClassTrib), TR.Descricao]);
        finally
          TR.Free();
        end;
      end;

      S := S + Format(
        '--- REGRA FISCAL ---' + sLineBreak + sLineBreak +
        'Descrição: %s' + sLineBreak +
        'Início Vigência: %s' + sLineBreak +
        'Fim Vigência: %s' + sLineBreak +
        'Perc. Diferimento CBS: [%s]' + sLineBreak +
        'Perc. Diferimento IBS UF: [%s]' + sLineBreak +
        'Perc. Diferimento IBS Município: [%s]' + sLineBreak +
        'Trib Regular: %s' + sLineBreak + sLineBreak,
        [
          R.Descricao,
          DateToStr(R.InicioVigencia),
          IfThen(not R.FimVigencia.IsNull, DateToStr(R.FimVigencia.Value)),
          IfThen(not R.PDifCbs.IsNull, Format('%0.4n', [R.PDifCbs.Value])),
          IfThen(not R.PDifIbsUF.IsNull, Format('%0.4n', [R.PDifIbsUF.Value])),
          IfThen(not R.PDifIbsMun.IsNull, Format('%0.4n', [R.PDifIbsMun.Value])),
          ST
        ]
      );
    end;

    classTrib := GetClassificacao();
    try
      if classTrib = nil then
        UIUtils.HintInfo(edRegrasFiscais, 'Classificação não encontrada!')

      else
        S := S + Format(
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
    finally
      classTrib.Free();
    end;

    tratClass := GetTratamentoClassificacao();
    try

      if (tratClass = nil) or (tratClass.TratamentoTributario.Id = 0) then
        UIUtils.HintInfo(edRegrasFiscais, Format('Classificação sem tratamento tributário vigênte na data %s', [DateToStr(R.InicioVigencia)]))

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


    percRed := GetPercentualReducaoEtdFromUseCase( R.CClassTrib, tbtCBS, R.InicioVigencia );

    S := S + Format( 'CBS : %n' + sLineBreak, [ percRed.Valor ]);

    percRed := GetPercentualReducaoEtdFromUseCase( R.CClassTrib, tbtIBSUF, R.InicioVigencia );

    S := S + Format( 'IBS Estadual : %n' + sLineBreak, [ percRed.Valor ]);

    percRed := GetPercentualReducaoEtdFromUseCase( R.CClassTrib, tbtIBSMun, R.InicioVigencia );

    S := S + Format( 'IBS Muncipal: %n' + sLineBreak, [ percRed.Valor ]);
                                                  
  finally
    R.Free();
  end;

  UIUtils.ShowInfo(S);
end;

destructor TComboBoxRegrasFiscaisFrame.Destroy;
begin
  FRegras.Free();

  inherited;
end;

procedure TComboBoxRegrasFiscaisFrame.edRegrasFiscaisChange(Sender: TObject);
var
  R: RegraFiscalIbsCbsEtd;
  tipoTribCalc: TipoTributoEnum;
begin
  R := nil;
  if (edRegrasFiscais.ItemIndex >= 0) and
    (edRegrasFiscais.ItemIndex < edRegrasFiscais.Items.Count) then
  begin
    R := RegraFiscalIbsCbsEtd(edRegrasFiscais.Items.Objects[edRegrasFiscais.ItemIndex]);

    if Assigned(FOnRegraFiscalChange) then
      FOnRegraFiscalChange(Self, R);
  end;

  SetLabelInfo( R );
end;

function TComboBoxRegrasFiscaisFrame.GetCClassTrib: string;
var
  R: RegraFiscalIbsCbsEtd;
begin
  Result := '';
  R := nil;

  if (edRegrasFiscais.ItemIndex >= 0) and
    (edRegrasFiscais.ItemIndex < edRegrasFiscais.Items.Count) then
  begin
    R := RegraFiscalIbsCbsEtd(edRegrasFiscais.Items.Objects[edRegrasFiscais.ItemIndex]);

    if R <> nil then
      Result := R.CClassTrib;
  end;
end;

function TComboBoxRegrasFiscaisFrame.GetClassificacao: ClassificacaoTributariaEtd;
var
  R: RegraFiscalIbsCbsEtd;
begin
  Result := nil;
  R := nil;

  if (edRegrasFiscais.ItemIndex >= 0) and
    (edRegrasFiscais.ItemIndex < edRegrasFiscais.Items.Count) then
  begin
    R := RegraFiscalIbsCbsEtd(edRegrasFiscais.Items.Objects[edRegrasFiscais.ItemIndex]);

    if R <> nil then
      with Container.GetInstance().FiscalCalculosFactory.CreateObterClassificacaoTributariaIbsCbsUseCase() do
      try
        Result := Executar( R.CClassTrib, R.InicioVigencia );
      finally
        FreeSafe();
      end;
  end;
end;

function TComboBoxRegrasFiscaisFrame.GetPercentualReducaoEtdFromUseCase(
  const CClassTrib: string; TipoTributo: TipoTributoEnum;
  Data: TDate): PercentualReducaoEtd;
begin
  with Container.GetInstance().FiscalCalculosFactory.CreateObterPercentualDeReducaoUseCase() do
  try
    Result := Executar( CClassTrib, TipoTributo, Data );
  finally
    FreeSafe();
  end;
end;

function TComboBoxRegrasFiscaisFrame.GetRegraFiscal: RegraFiscalIbsCbsEtd;
var
  regraFiscal: RegraFiscalIbsCbsEtd;
begin
  Result := nil;

  if (edRegrasFiscais.ItemIndex >= 0) and
    (edRegrasFiscais.ItemIndex < edRegrasFiscais.Items.Count) then
  begin
    regraFiscal := RegraFiscalIbsCbsEtd(edRegrasFiscais.Items.Objects[edRegrasFiscais.ItemIndex]);

    Result := RegraFiscalIbsCbsEtd(regraFiscal.Clone());
  end;
end;

function TComboBoxRegrasFiscaisFrame.GetRegraFiscalId: string;
var
  R: RegraFiscalIbsCbsEtd;
begin
  Result := '';
  R := nil;

  if (edRegrasFiscais.ItemIndex >= 0) and
    (edRegrasFiscais.ItemIndex < edRegrasFiscais.Items.Count) then
  begin
    R := RegraFiscalIbsCbsEtd(edRegrasFiscais.Items.Objects[edRegrasFiscais.ItemIndex]);

    if R <> nil then
      Result := R.Id;
  end;
end;

function TComboBoxRegrasFiscaisFrame.GetTratamentoClassificacao: TratamentoClassificacaoEtd;
var
  R: RegraFiscalIbsCbsEtd;
begin
  Result := nil;
  R := nil;

  if (edRegrasFiscais.ItemIndex >= 0) and
    (edRegrasFiscais.ItemIndex < edRegrasFiscais.Items.Count) then
  begin
    R := RegraFiscalIbsCbsEtd(edRegrasFiscais.Items.Objects[edRegrasFiscais.ItemIndex]);

    if R <> nil then
      with Container.GetInstance().FiscalCalculosFactory.CreateObterTratamentoClassificacaoUseCase() do
      try
        Result := Executar( R.CClassTrib, tbtCBS, R.InicioVigencia );
      finally
        FreeSafe();
      end;
  end;
end;

procedure TComboBoxRegrasFiscaisFrame.SetLabelInfo(
  regraFiscal: RegraFiscalIbsCbsEtd);
begin
  if regraFiscal = nil then
    lbInfo.Caption := ''

  else if not regraFiscal.FimVigencia.IsNull then
    lbInfo.Caption := Format('Vigência: De %s até %s', [ DateService.ParseLocal(regraFiscal.InicioVigencia), DateService.ParseLocal(regraFiscal.FimVigencia.Value) ])

  else
    lbInfo.Caption := Format('Início Vigência: %s', [ DateService.ParseLocal(regraFiscal.InicioVigencia) ]);
end;

procedure TComboBoxRegrasFiscaisFrame.Setup(const Input: TComboBoxRegrasFiscaisFrameSetup);
var
  regra, current: RegraFiscalIbsCbsEtd;
  I: Integer;
  RegraFiscalid: string;
  AddFirstNull: Boolean;
begin
  FreeAndNil(FRegras);
  edRegrasFiscais.Items.Clear();

  RegraFiscalid := Input.RegraFiscalId;
  AddFirstNull := Input.AddFirstNull;

  with Container.GetInstance().ErpFeaturesFactory.CreateListarAtualeTodosRegrasFiscaisUseCase() do
  try
    FRegras := Executar( RegraFiscalid );
  finally
    FreeSafe();
  end;

  current := nil;
  for I := 0 to FRegras.Count - 1 do
  begin
    regra := RegraFiscalIbsCbsEtd(FRegras.Items[I]);

    edRegrasFiscais.AddItem(
      Format('%s : %s', [
        FormatMaskText('000-000;0;', regra.CClassTrib),
        regra.Descricao
      ]),
      regra
    );
    if regra.Id = RegraFiscalid then
    begin
      current := RegraFiscalIbsCbsEtd(FRegras.Items[I]);
      edRegrasFiscais.ItemIndex := I;
    end;
  end;

  SetLabelInfo( current );

  if AddFirstNull then
    edRegrasFiscais.Items.InsertObject(0, '', nil);

  pnVigencia.Visible := Input.ShowAddInfo;
end;

procedure TComboBoxRegrasFiscaisFrame.Setup(const RegraFiscalid: string; AddFirstNull: Boolean);
begin
  Self.Setup( TComboBoxRegrasFiscaisFrameSetup.Create( RegraFiscalid, True, AddFirstNull ));
end;

{ TComboBoxRegrasFiscaisFrameSetup }

class function TComboBoxRegrasFiscaisFrameSetup.Create(RegraFiscalId: string; ShowAddInfo,
  AddFirstNull: Boolean): TComboBoxRegrasFiscaisFrameSetup;
begin
  Result.RegraFiscalId := RegraFiscalId;
  Result.ShowAddInfo := ShowAddInfo;
  Result.AddFirstNull := AddFirstNull;
end;

end.
