unit MultiSelectAnexosFrameUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, CheckLst, ExtCtrls,
  AnexoEtdUnit, TipoTributoFiscalEnumUnit, ListarAnexosUseCaseUnit;

type

  TMultiSelectAnexosFrameModoEnum = (msaResumido, msaDetalhesItens);

  TMultiSelectAnexosFrameModoChange = procedure(AModoSelecionado: TMultiSelectAnexosFrameModoEnum) of object;

  TMultiSelectAnexosFramePopulateItem = procedure(const Anexo: AnexoEtd; var TextPrint: string; var Cheched: Boolean) of object;

  TMultiSelectAnexosFrameSetup = record
  private
    FDataReferencia: TDate;
    FTipoTributo: TipoTributoFiscalEnum;
    FModo: TMultiSelectAnexosFrameModoEnum;
  public
    class function Create(
      DataReferencia: TDate;
      TipoTributo: TipoTributoFiscalEnum;
      Modo: TMultiSelectAnexosFrameModoEnum
    ): TMultiSelectAnexosFrameSetup; static;

    property Modo: TMultiSelectAnexosFrameModoEnum read FModo;
    property TipoTributo: TipoTributoFiscalEnum read FTipoTributo;
    property DataReferencia: TDate read FDataReferencia;
  end;

  TMultiSelectAnexosFrame = class(TFrame)
    checkListAnexos: TCheckListBox;
    Panel1: TPanel;
    lbDataReferencia: TLabel;
    Label2: TLabel;
    alr: TLabel;
    lbModoExibicao: TLabel;
    procedure lbModoExibicaoClick(Sender: TObject);
    procedure alrClick(Sender: TObject);
  private
    FOnModoChange: TMultiSelectAnexosFrameModoChange;
    FOnPopulateItem: TMultiSelectAnexosFramePopulateItem;

    FAnexos: AnexosEtd;
    FAnexosAgrupados: AnexosEtd;
    FDataReferencia: TDate;
    FTipoTributo: TipoTributoFiscalEnum;
    FModoAtual: TMultiSelectAnexosFrameModoEnum;

    procedure PopulateList();
    function GetAnexoSelecionado(): AnexoEtd;

  public
    procedure Setup(const Input: TMultiSelectAnexosFrameSetup);
    destructor Destroy; override;

    function GetSelecionados(): AnexosEtd;

    property OnModoChange: TMultiSelectAnexosFrameModoChange read FOnModoChange write FOnModoChange;
    property OnDrawItem: TMultiSelectAnexosFramePopulateItem read FOnPopulateItem write FOnPopulateItem;
    property ModoAtual: TMultiSelectAnexosFrameModoEnum read FModoAtual;
  end;

implementation

uses
  ContainerUnit,
  StrUtils, ShellAPI,
  AnexosServiceUnit,
  TipoTributoEnumUnit,
  NumberServiceUnit, TiposTributosServiceUnit;

{$R *.dfm} 

{ TMultiSelectAnexosFrameSetup }

class function TMultiSelectAnexosFrameSetup.Create(DataReferencia: TDate;
  TipoTributo: TipoTributoFiscalEnum;
  Modo: TMultiSelectAnexosFrameModoEnum
): TMultiSelectAnexosFrameSetup;
begin
  Result.FDataReferencia := DataReferencia;
  Result.FTipoTributo := TipoTributo;
  Result.FModo := Modo;
end;

{ TMultiSelectAnexosFrame }

procedure TMultiSelectAnexosFrame.alrClick(Sender: TObject);
var
  A: AnexoEtd;
  L: string;
begin
  A := GetAnexoSelecionado;

  if A.IsNull then
    Exit;

  L := 'https://www.planalto.gov.br/ccivil_03/leis/lcp/lcp214.htm#anexo' + NumberService.ParseRomano(A.Numero);

  ShellExecute(Application.Handle, nil, PChar(L), nil, nil, SW_SHOWNORMAL);
end;

destructor TMultiSelectAnexosFrame.Destroy;
begin

  inherited;
end;

function TMultiSelectAnexosFrame.GetAnexoSelecionado: AnexoEtd;
begin
  if (checkListAnexos.Count = 0) or (checkListAnexos.ItemIndex = -1) then
  begin
    Result := AnexoEtd.NullInstance();
    Exit;
  end;

  if FModoAtual = msaResumido then
    Result := FAnexosAgrupados[checkListAnexos.ItemIndex]
  else
    Result := FAnexos[checkListAnexos.ItemIndex];
end;

function TMultiSelectAnexosFrame.GetSelecionados: AnexosEtd;
var
  I: Integer;
  Count: Integer;
begin
  Count := 0;
  SetLength(Result, checkListAnexos.Count);
  for I := 0 to checkListAnexos.Count - 1 do
    if checkListAnexos.Checked[I] then
    begin
      Inc(Count);
      if FModoAtual = msaResumido then
        Result[Count -1] := FAnexosAgrupados[I]
      else
        Result[Count -1] := FAnexos[I];
    end;
  SetLength(Result, Count);
end;

procedure TMultiSelectAnexosFrame.lbModoExibicaoClick(Sender: TObject);
begin
  if FModoAtual = msaResumido then
    FModoAtual := msaDetalhesItens
  else
    FModoAtual := msaResumido;

  lbModoExibicao.Caption := IfThen( FModoAtual = msaResumido, 'Exibir modo detalhado', 'Exibir modo resumido' );

  PopulateList();
end;

procedure TMultiSelectAnexosFrame.PopulateList;
var
  L: AnexosEtd;
  I: Integer;
  S: string;
  B: Boolean;
begin
  checkListAnexos.Clear;
  if FModoAtual = msaResumido then
    L := FAnexosAgrupados
  else
    L := FAnexos;

  for I := Low(L) to High(L) do
  begin
    S := 'Anexo ' + L[I].Numero;
    if FModoAtual = msaDetalhesItens then
      S := S + ' - Num: ' + L[I].NumeroItem + ' - ' + L[I].TextoItem;

    B := False;
    if Assigned(FOnPopulateItem) then
      FOnPopulateItem(L[I], S, B );

    checkListAnexos.Items.Add( S );
    checkListAnexos.Checked[ checkListAnexos.Count - 1 ] := B;
  end;
end;

procedure TMultiSelectAnexosFrame.Setup(
  const Input: TMultiSelectAnexosFrameSetup
);
var
  Count: Integer;
  I: Integer;

  {$REGION 'AddDistinctAnexosAgrupados'}
  procedure AddDistinctAnexosAgrupados(const Anexo: AnexoEtd);
  var
    J: Integer;
  begin
    for J := Low(FAnexosAgrupados) to Count do
      if FAnexosAgrupados[J].Numero = Anexo.Numero then
        Exit;

    Inc(Count);
    FAnexosAgrupados[Count - 1] := Anexo;
  end;
  {$ENDREGION}

begin
  FDataReferencia := Input.DataReferencia;
  FTipoTributo := Input.TipoTributo;
  FModoAtual := Input.Modo;

  FAnexos := Container.GetInstance().ErpFeaturesFactory.CreateListarAnexosUseCase()
    .Executar(
      TiposTributosService.FiscalToRtcSet(Input.TipoTributo),
      Input.DataReferencia
    );

  AnexosSerice.OrdenarPorNumeroRomano( FAnexos );

  Count := 0;
  SetLength(FAnexosAgrupados, Length(FAnexos));
  for I := Low(FAnexos) to High(FAnexos) do
    AddDistinctAnexosAgrupados(FAnexos[I]);
  SetLength(FAnexosAgrupados, Count);

  lbDataReferencia.Caption := FormatDateTime('dd/MM/yyyy', Input.DataReferencia);
  lbModoExibicao.Caption := IfThen( FModoAtual = msaResumido, 'Exibir modo detalhado', 'Exibir modo resumido' );

  PopulateList();
end;

end.
