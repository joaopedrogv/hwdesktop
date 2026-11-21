unit EventoDFe211130ItemFrame;

interface

uses
  System.SysUtils, System.Classes, Vcl.StdCtrls, hw_edits_dx, CadastroEditorFrame,
  EditorCadastro, EventoDFe211130ItemView, EventoDFe211130ItemPresenter,
  EventoDFe211130ItemEtdUnit, ValidationEntityOutputUnit;

type
  TfrmEventoDFe211130ItemFrame = class(TfrmCadastroEditor,
    IEventoDFe211130ItemView)
    lblNItem: TLabel;
    edNItem: TEditHw;
    lblVIbs: TLabel;
    edVIbs: TEditHw;
    lblVCbs: TLabel;
    edVCbs: TEditHw;
    lblQImobilizado: TLabel;
    edQImobilizado: TEditHw;
    lblUImobilizado: TLabel;
    edUImobilizado: TEdit;
  private
    FId: string;
    FItemPreparado: Boolean;
    function GetPresenter: TEventoDFe211130ItemPresenter;
    property Presenter: TEventoDFe211130ItemPresenter read GetPresenter;
  public
    constructor Create(AOwner: TComponent; const AHost: IEditorCadastroHost); override;
    // A composição entrega o apresentador ao frame, que passa a liberá-lo.
    procedure ConfigurarPresenter(APresenter: TEventoDFe211130ItemPresenter);
    procedure PrepararItem(const AItem: EventoDFe211130ItemEtd);
    function ColetarItem(out AItem: EventoDFe211130ItemEtd): Boolean;
    function HasPendingChanges: Boolean; override;
    function TryFocus: Boolean; override;
  protected
    function Salvar: Boolean; override;
  end;

implementation

{$R *.dfm}

constructor TfrmEventoDFe211130ItemFrame.Create(AOwner: TComponent;
  const AHost: IEditorCadastroHost);
begin
  inherited Create(AOwner, AHost);

  fraValidacao.Bind('NItem', edNItem, 'nItem');
  fraValidacao.Bind('VIbs', edVIbs, 'Valor IBS');
  fraValidacao.Bind('VCbs', edVCbs, 'Valor CBS');
  fraValidacao.Bind('QImobilizado', edQImobilizado, 'Quantidade imobilizada');
  fraValidacao.Bind('UImobilizado', edUImobilizado, 'Unidade');
end;

procedure TfrmEventoDFe211130ItemFrame.ConfigurarPresenter(
  APresenter: TEventoDFe211130ItemPresenter);
begin
  if APresenter = nil then
    raise Exception.Create('O apresentador do item do evento 211130 não foi informado.');

  AssociarPresenter(APresenter);
end;

procedure TfrmEventoDFe211130ItemFrame.PrepararItem(
  const AItem: EventoDFe211130ItemEtd);
begin
  FId := AItem.Id;
  fraValidacao.Limpar;

  edNItem.AsValue := AItem.NItem;
  edVIbs.AsValue := AItem.VIbs;
  edVCbs.AsValue := AItem.VCbs;
  edQImobilizado.AsValue := AItem.QImobilizado;
  edUImobilizado.Text := AItem.UImobilizado;

  FItemPreparado := True;
  // O teste de focus passa, porém o modal ainda não está disponivel e dá erro.
  // Deixe a linha comentada, ou se ningué utilizar `TryFocus`, remova o metodo,
  // pois naturalmente o foco vai para o primeiro componente focavel da tela.
  // TryFocus;
end;

function TfrmEventoDFe211130ItemFrame.ColetarItem(
  out AItem: EventoDFe211130ItemEtd): Boolean;
var
  NItem: Integer;
  VIbs: Currency;
  VCbs: Currency;
  QImobilizado: Currency;
  Validacao: ValidationEntityOutput;
begin
  AItem := Default(EventoDFe211130ItemEtd);
  Result := False;

  if not FItemPreparado then
    Exit;

  if not TryStrToInt(Trim(edNItem.Text), NItem) then
  begin
    Validacao := ValidationEntityOutput.Create;
    Validacao.Add('NItem', 'nItem deve ser um número inteiro.');
    ShowValidation(Validacao);
    Exit;
  end;

  // A saída do campo normaliza o texto para a escala configurada.
  edVIbs.AsValue := edVIbs.AsValue;
  edVCbs.AsValue := edVCbs.AsValue;
  edQImobilizado.AsValue := edQImobilizado.AsValue;

  VIbs := edVIbs.AsValue;
  VCbs := edVCbs.AsValue;
  QImobilizado := edQImobilizado.AsValue;

  AItem := EventoDFe211130ItemEtd.Create(FId, NItem, VIbs, VCbs,
    QImobilizado, Trim(edUImobilizado.Text));
  Result := True;
end;

function TfrmEventoDFe211130ItemFrame.GetPresenter: TEventoDFe211130ItemPresenter;
begin
  Result := TEventoDFe211130ItemPresenter(PresenterCadastro);
end;

function TfrmEventoDFe211130ItemFrame.Salvar: Boolean;
begin
  Result := False;

  fraValidacao.Limpar;
  if PresenterCadastro = nil then
    Exit;

  Result := Presenter.Salvar;
  if Result then
    FItemPreparado := False;
end;

function TfrmEventoDFe211130ItemFrame.HasPendingChanges: Boolean;
begin
  Result := FItemPreparado;
end;

function TfrmEventoDFe211130ItemFrame.TryFocus: Boolean;
begin
  Result := fraValidacao.FocarPrimeiroErro;
  if Result then
    Exit;

  if edNItem.CanFocus then
  begin
    edNItem.SetFocus;
    Result := True;
  end;
end;

end.
