unit AjustesRedBenefPcPresenter;

interface

uses
  SysUtils, Classes,
  TipoComunsUnit, AjustesRedBenefPcView, SalvarAjusteRedBenefPcUseCaseUnit, AjusteRedBenefPcModelUnit,
  RemoverAjusteRedBenefPcUseCaseUnit, ListarRegrasRedBenefPcUseCaseUnit, ObterAjusteRedBenefPcPorIdUseCaseUnit;

type
  TAjustesRedBenefPcPresenter = class
  private
    FView: IAjustesRedBenefPcView;
    FSalvarUseCase: ISalvarAjusteRedBenefPcUseCase;
    FRemoverUseCase: IRemoverAjusteRedBenefPcUseCase;
    FListarRegrasUseCase: IListarRegrasRedBenefPcVigentesEAtualUseCase;
    FObterUseCase: IObterAjusteRedBenefPcPorIdUseCase;
  public
    constructor Create(
      AView: IAjustesRedBenefPcView;
      ASalvarUseCase: ISalvarAjusteRedBenefPcUseCase;
      ARemoverUseCase: IRemoverAjusteRedBenefPcUseCase;
      AListarRegrasUseCase: IListarRegrasRedBenefPcVigentesEAtualUseCase;
      AObterUseCase: IObterAjusteRedBenefPcPorIdUseCase
    );

    function Salvar(AAjuste: AjusteRedBenefPcModel): Boolean;
    function Remover(Id: string): Boolean;
    function CarregarRegras(const ARegraAtualId: string; ADataReferencia: TDate): Boolean;
    function ObterParaEdicao(const AId: string; out AAjuste: AjusteRedBenefPcModel): Boolean;
  end;

implementation

uses
  CreateEntityUseCaseOutPutUnit, RegraRedBenefPcEtdUnit;

{ TAjustesRedBenefPcPresenter }

constructor TAjustesRedBenefPcPresenter.Create(
  AView: IAjustesRedBenefPcView;
  ASalvarUseCase: ISalvarAjusteRedBenefPcUseCase;
  ARemoverUseCase: IRemoverAjusteRedBenefPcUseCase;
  AListarRegrasUseCase: IListarRegrasRedBenefPcVigentesEAtualUseCase;
  AObterUseCase: IObterAjusteRedBenefPcPorIdUseCase
);
begin
  inherited Create;
  FView := AView;
  FSalvarUseCase := ASalvarUseCase;
  FRemoverUseCase := ARemoverUseCase;            
  FListarRegrasUseCase := AListarRegrasUseCase;
  FObterUseCase := AObterUseCase;
end;

function TAjustesRedBenefPcPresenter.Remover(Id: string): Boolean;
begin
  Result := False;

  try
    FRemoverUseCase.Executar(Id);

    Result := True;
  except
    on E: Exception do
      FView.ExibirErro(E);
  end;
end;

function TAjustesRedBenefPcPresenter.Salvar(AAjuste: AjusteRedBenefPcModel): Boolean;
var
  resultado: CreateEntityUseCaseOutPut;
begin
  Result := False;

  try
    resultado := FSalvarUseCase.Executar(AAjuste);
    try
      if not resultado.Validation.IsValid then
        FView.ExibirValidacoes(resultado.Validation)
      else
        Result := True;
    finally
      resultado.Free;
    end;
  except
    on E: Exception do
      FView.ExibirErro(E);
  end;
end;

function TAjustesRedBenefPcPresenter.CarregarRegras(
  const ARegraAtualId: string;
  ADataReferencia: TDate): Boolean;
var
  regras: RegraRedBenefPcEtdList;
begin
  Result := False;

  try
    regras := FListarRegrasUseCase.Executar(
      ARegraAtualId, ADataReferencia);
    try
      FView.ExibirRegras(regras);
      Result := True;
    finally
      regras.Free;
    end;
  except
    on E: Exception do
      FView.ExibirErro(E);
  end;
end;

function TAjustesRedBenefPcPresenter.ObterParaEdicao(
  const AId: string;
  out AAjuste: AjusteRedBenefPcModel): Boolean;
begin
  Result := False;
  AAjuste := nil;

  try
    AAjuste := FObterUseCase.Executar(AId);

    if AAjuste = nil then
      FView.ExibirInformacao(
        'Registro não se encontra mais disponível')
    else
      Result := True;
  except
    on E: Exception do
      FView.ExibirErro(E);
  end;
end;

end.
