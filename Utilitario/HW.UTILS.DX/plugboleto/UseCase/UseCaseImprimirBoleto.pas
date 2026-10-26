unit UseCaseImprimirBoleto;

interface

uses
  System.Classes,
  BaseUseCasePlugBoleto;

type

  TFilesModel = class
  private
    Flink: string;
    Fbase64: string;
  published
    property link: string read Flink write Flink;
    property base64: string read Fbase64 write Fbase64;
  end;

  TUseCaseImprimirBoleto = class(TUseCaseBasePlugBoleto)
  strict private
    procedure LogError(value: string);
  public
    function Run(payload: TArray<TFilesModel>): Boolean; overload;
    function Run(ids: array of Integer): Boolean; overload;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  PlugBoletoRepo,
  ApiPlugBoleto,
  PlugBoletoModels,
  hw_utils,
  EncdDecd, hw_boleto_utils, hw_win_utils;

{ TUseCaseImprimirBoleto }

procedure TUseCaseImprimirBoleto.LogError(value: string);
begin
  LastError := LastError + IfThen(not LastError.IsEmpty, sLineBreak + '--' + sLineBreak) +
               value;
end;

function TUseCaseImprimirBoleto.Run(ids: array of Integer): Boolean;
var
  boletosDB: Conexao_OOP;
  links: TArray<TFilesModel>;
  link: TFilesModel;
  filesB64: TArray<string>;
  vtemp: string;
  I: Integer;
  vOK: Boolean;
begin
  Result := False;
  try
    if Length(ids) = 0 then
      raise Exception.Create('Nenhum id de boleto informado para impressão');

    InitUseCase();

    repo := TPlugBoletoRepoSingleton.GetInstance();

    boletosDB := repo.GetBoletosRemessa(ids);
    if boletosDB.IsEmpty then
      raise Exception.Create('Nenhum boleto encontrado com os ids informados');

    links := [];

    vOK := True;
    boletosDB.First;
    while not boletosDB.Eof do
    begin
      if (not boletosDB.fstr('htmlboleto').IsEmpty)
        and (StartsText(boletosDB.fstr('api_idintegracao') + '|', boletosDB.fstr('htmlboleto')))
        and (MatchText(boletosDB.fstr('api_situacao'), [SIT_EMITIDO, SIT_REGISTRADO, SIT_LIQUIDADO, SIT_BAIXADO])) then
      begin
        link := TFilesModel.Create;
        link.link := boletosDB.fstr('api_urlboleto');
        link.base64 := boletosDB.fstr('htmlboleto').Substring(boletosDB.fstr('htmlboleto').IndexOf('|') + 1);
        links := links + [link];
      end
      else if (not boletosDB.fstr('api_urlboleto').IsEmpty)
        and (MatchText(boletosDB.fstr('api_situacao'), [SIT_EMITIDO, SIT_REGISTRADO, SIT_LIQUIDADO, SIT_BAIXADO])) then
      begin
        link := TFilesModel.Create;
        link.link := boletosDB.fstr('api_urlboleto');
        links := links + [link];
        //links := links + [boletosDB.fstr('api_urlboleto')]
      end
      else
      begin
        if (vOK) then vOK := False;

        if trim(boletosDB.fstr('api_urlboleto')) = '' then
          vtemp := 'Boleto pendente sem link para download'
        else
          vtemp := 'Boleto pendente favor reimprimir';

        LogError(Format(vtemp + sLineBreak + sLineBreak +
                        'Num Doc: %s'+ sLineBreak +
                        'Valor Doc: %f' + sLineBreak +
                        'Nosso numero: %s' + sLineBreak +
                        'Cliente: %s' + sLineBreak + sLineBreak,
                        [boletosDB.fstr('n_doc_bol'),
                         boletosDB.ffloat('vl_doc_bol'),
                         boletosDB.fstr('nosso_numero_banco'),
                         boletosDB.fstr('razao')]));
      end;

      boletosDB.Next;
    end;

    if not vOK then
      Result := False
    else
      Result := Self.Run(links)
  except on E: Exception do
    begin
      Result := False;
      LastError :=  LastError + IfThen(not LastError.IsEmpty, sLineBreak + '--' + sLineBreak) + E.message;
      ShowAtencao('Erro ao imprimir boletos' + sLineBreak + sLineBreak + LastError);
    end;
  end;
end;

function TUseCaseImprimirBoleto.Run(payload: TArray<TFilesModel>): Boolean;
var
  downloads: TArray<string>;
  files: TArray<string>;
  Prev: TBoletoPreview;
  fileName: string;
begin
  Result := False;
  try
    if Length(payload) = 0 then
      raise Exception.Create('Nenhum id de boleto informado para impressão');

    InitUseCase();

    api := TApiPlugBoletoSingleton.GetInstance();

    files := [];

    for var item in payload do
    begin
      if (not item.base64.IsEmpty) then
      begin
        if item.base64.Contains('eyJzdGF0dXNDb2RlIjo1MDAsIm1lc3NhZ2UiOiJJbnRlcm5hbCBzZXJ2ZXIgZXJyb3IifQ==') then
          files := files + api.DownloadlPDFBoleto([item.link.Trim])
        else
          files := files + [Base64Helper.DecodeFile(item.base64, GetPathTemp('') + NewGuid + '.pdf')];
      end
      else
        files := files + api.DownloadlPDFBoleto([item.link.Trim]);
    end;

    //files := api.DownloadlPDFBoleto(downloads);

    Prev := TBoletoPreview.Create;
    try
      for fileName in files do
        if FileExists(fileName) then
          Prev.NewFromFile(fileName)
        else
          LogError('Erro: ' + fileName);

      if Prev.Count > 0 then
        Prev.Preview;

    finally
      Prev.Free;

      for fileName in files do
        if FileExists(fileName) then
          DeleteFile(fileName)
    end;

    Result := LastError.IsEmpty;
  except on E: Exception do
    begin
      Result := False;
      LastError :=  LastError + IfThen(not LastError.IsEmpty, sLineBreak + '--' + sLineBreak) + E.message;
      ShowAtencao('Erro ao imprimir boletos' + sLineBreak + sLineBreak + LastError);
    end;
  end;
end;

end.
