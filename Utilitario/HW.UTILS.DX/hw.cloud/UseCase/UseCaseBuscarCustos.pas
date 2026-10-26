unit UseCaseBuscarCustos;

interface

uses
   BaseUseCaseHwCloud, System.Classes, System.Generics.Collections;

type
  TFaturamentoDatas = record
    StartDate: string;
    EndDate: string;
  end;

  TUseCaseConsCustos = class(TUseCaseBaseHwCloud)
  public
    function CalcularDatasFaturamento(const ACurrentDateStr: string; AStartDayOfMonth: Integer): TFaturamentoDatas;
    function Run(): Boolean;
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
  config_sistema_class, System.DateUtils;

{ TUseCaseConsCustos }

function TUseCaseConsCustos.CalcularDatasFaturamento(
  const ACurrentDateStr: string; AStartDayOfMonth: Integer): TFaturamentoDatas;
var
  LDataAtualDt: TDateTime;
  LDataInicialDt: TDateTime;
  LDataFinalDt: TDateTime;
  LYear, LMonth, LDay: Word;
begin
  // Realiza o parse da string em ISO 8601 para TDateTime
  LDataAtualDt := ISO8601ToDate(ACurrentDateStr, True);

  // Extrai Ano e Mês da data atual
  DecodeDate(LDataAtualDt, LYear, LMonth, LDay);

  // Constrói a data inicial usando o ano e mês atuais com o dia fornecido
  LDataInicialDt := EncodeDateTime(LYear, LMonth, AStartDayOfMonth, 0, 0, 0, 0);

  // Se a data inicial for posterior à data atual, retrocede 1 mês
  if LDataInicialDt > LDataAtualDt then
  begin
    LDataInicialDt := IncMonth(LDataInicialDt, -1);
  end;

  // A data final é a própria data atual
  LDataFinalDt := LDataAtualDt;

  // Retorna formatado em ISO 8601
  Result.StartDate := DateToISO8601(LDataInicialDt, True);
  Result.EndDate := DateToISO8601(LDataFinalDt, True);
end;

function TUseCaseConsCustos.Run: Boolean;
var
  Datas: TFaturamentoDatas;
  DataString: string;
  buscarCusto: TBuscarCusto;
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

    DataString := DateToISO8601(Now);

    Datas := CalcularDatasFaturamento(DataString, conf.dia_mes_ini_fat_meta);

    buscarCusto := TBuscarCusto.Create;
    buscarCusto.cnpj := conf.cnpj;
    buscarCusto.data_inicial := Datas.StartDate;
    buscarCusto.data_final := Datas.EndDate;

    var useCase := api.BuscarCustos(buscarCusto);

    if not Assigned(useCase) then
      if not silent then
        raise Exception.Create('Consultar limite de gastos sem resposta da API');

    if useCase.resposta.meta.custo_total > useCase.resposta.meta.limite_gastos_meta then
      raise Exception.Create('Limite de gastos meta ultrapassado - Limite $ ' + FormatFloat('0.0000', useCase.resposta.meta.limite_gastos_meta) + ' Gasto $ ' + FormatFloat('0.0000', useCase.resposta.meta.custo_total));

    Result := true;
  except on E: Exception do
    begin
      Result := False;
      LastError := E.message;
      if not silent then
        ShowAtencao('Erro ao consultar limite de gastos ' + sLineBreak + sLineBreak + E.Message);
    end;
  end;
end;

end.
