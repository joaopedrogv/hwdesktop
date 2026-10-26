unit UseCaseDescartarBoletos;

interface

uses
  BaseUseCasePlugBoleto;

type

  TUseCaseDescartarBoletos = class(TUseCaseBasePlugBoleto)
  public
    function Run(ids: array of Integer): Boolean;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  PlugBoletoRepo,
  ApiPlugBoleto,
  PlugBoletoModels,
  hw_utils;

{ TUseCaseDescartarBoletos }

function TUseCaseDescartarBoletos.Run(ids: array of Integer): Boolean;
var
  boletosDB: Conexao_OOP;
  arrayboleto: TArray<string>;
  I: Integer;
begin
  Result := False;
  try
    if Length(ids) = 0 then
      raise Exception.Create('Nenhum id de boleto informado para descartar boleto');

    InitUseCase();

    repo := TPlugBoletoRepoSingleton.GetInstance();
    api := TApiPlugBoletoSingleton.GetInstance();

    var conf := repo.GetConfigApi(CONF_API);

    if conf.empresaId <= 0 then
      raise Exception.Create('Configuração para boletos não encontrada no Cadastro de API');

    boletosDB := repo.GetBoletosDescartar(ids);
    if boletosDB.IsEmpty then
      raise Exception.Create('Nenhum boleto encontrado com os ids informados');

    var vCods := '';

    boletosDB.First;
    while not boletosDB.Eof do
    begin
      if trim(boletosDB.fstr('remessa_enviada')) = 'S' then
        raise Exception
          .Create(Format('Boleto com remessa gerada' + sLineBreak + sLineBreak +
                         'Num Doc: %s'+ sLineBreak +
                         'Valor Doc: %f' + sLineBreak +
                         'Cliente: %s' + sLineBreak +
                         'Nosso Número: %s' + sLineBreak + sLineBreak +
                         'Por favor limpe os dados da remessa se necessário para descartar boleto',
                         [boletosDB.fstr('n_doc_bol'),
                          boletosDB.ffloat('vl_doc_bol'),
                          boletosDB.fstr('razao'),
                          boletosDB.fstr('nosso_numero_banco')]));

      vCods := vCods + IfThen(trim(vCods) <> '', ',') + boletosDB.fstr('api_idintegracao');

      boletosDB.Next;
    end;

    if not repo.LimparDadosBoletosSemIntegracao(ids) then
      exit;

    if vCods = '' then
    begin
      raise Exception.Create('Nenhum boleto encontrado com os ids informados');
      exit;
    end;

    var count := Length(ids);
    var boletos := api.GetBoleto(['limit=' + count.ToString, 'idintegracao=' + vCods]);

    if not Assigned(boletos) then
      raise Exception.Create('Consulta boletos sem resposta da API');

    if not boletos._status.Trim.Equals(STS_SUCESSO) then
      if not boletos._mensagem.IsEmpty then
        raise Exception.Create(boletos._mensagem)
      else
        raise Exception.Create('Nenhum boleto encontrado com os parametros informados');


    setLength(arrayboleto, Length(boletos._dados));
    for I := 0 to Length(boletos._dados) - 1 do
      arrayboleto[I] := boletos._dados[I].idintegracao;

    var _dados := api.PostDescartar(arrayboleto);

    if Assigned(_dados.sucesso) then
    begin
      if not repo.PostDescartar(_dados.sucesso) then
        raise Exception.Create('Não foi possivel remover descartar dados dos boletos retornados pela API. Consulte o log para mais detalhes');
    end;

    Result := True;
   except on E: Exception do
    begin
      Result := False;
      LastError := E.message;
      ShowAtencao('Erro ao descartar boletos' + sLineBreak + sLineBreak + E.Message);
    end;
  end;
end;

end.
