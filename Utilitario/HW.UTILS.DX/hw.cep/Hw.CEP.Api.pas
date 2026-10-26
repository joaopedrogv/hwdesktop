unit Hw.CEP.Api;

interface

uses
  Hw.Api,
  REST.Client,
  REST.Types,
  uClasseConexao;

const
  Const_Estados: array[1..27] of string = ('Rondônia', 'Acre', 'Amazonas', 'Roraima', 'Pará', 'Amapá', 'Tocantins',
                                           'Maranhão', 'Piauí', 'Ceará', 'Rio Grande do Norte', 'Paraíba', 'Pernambuco',
                                           'Alagoas', 'Sergipe', 'Bahia', 'Minas Gerais', 'Espírito Santo', 'Rio de Janeiro',
                                           'São Paulo', 'Paraná', 'Santa Catarina', 'Rio Grande do Sul', 'Mato Grosso do Sul',
                                           'Mato Grosso', 'Goiás', 'Distrito Federal');
  Const_UF: array[1..27] of string       = ('RO', 'AC', 'AM', 'RR', 'PA', 'AP', 'TO', 'MA', 'PI', 'CE', 'RN', 'PB', 'PE',
                                            'AL', 'SE', 'BA', 'MG', 'ES', 'RJ', 'SP', 'PR', 'SC', 'RS', 'MS', 'MT', 'GO', 'DF');
  Const_IBGE_UF: array[1..27] of Integer = ( 11, 12, 13, 14, 15, 16, 17, 21, 22, 23, 24, 25, 26, 27, 28, 29, 31, 32, 33, 35, 41, 42, 43, 50, 51, 52, 53);

type
  TDevmediaUser = class
  private
    Femail: string;
    Flogin: string;
    Fnome: string;
    Ftelefone: string;
  published
    property login: string read Flogin write Flogin;
    property nome: string read Fnome write Fnome;
    property email: string read Femail write Femail;
    property telefone: string read Ftelefone write Ftelefone;
  end;

  TDevmediaCEP = class
  private
    Flogradouro: string;
    Fbairro: string;
    Fcpc: string;
    Fuf: string;
    Flogradouro_curto: string;
    Fiscapital: Integer;
    Funidade: string;
    Fresultado_txt: string;
    Fusuario: TDevmediaUser;
    Fcidade: string;
    Fcodigomunicipio: Integer;
    Festado: string;
  published
    property resultado_txt: string read Fresultado_txt write Fresultado_txt;
    property usuario: TDevmediaUser read Fusuario write Fusuario;// class
    property uf: string read Fuf write Fuf;
    property cidade: string read Fcidade write Fcidade;
    property bairro: string read Fbairro write Fbairro;
    property estado: string read Festado write Festado;
    property logradouro: string read Flogradouro write Flogradouro;
    property unidade: string read Funidade write Funidade;
    property cpc: string read Fcpc write Fcpc;
    property logradouro_curto: string read Flogradouro_curto write Flogradouro_curto;
    property codigomunicipio: Integer read Fcodigomunicipio write Fcodigomunicipio;
    property iscapital: Integer read Fiscapital write Fiscapital;
  end;

  TViaCEP = class
  private
    Flogradouro: string;
    Fibge: string;
    Fbairro: string;
    Fddd: string;
    Fuf: string;
    Fcep: string;
    Fsiafi: string;
    Flocalidade: string;
    Fcomplemento: string;
    Fgia: string;
    Ferro: Boolean;
  published
    property cep: string read Fcep write Fcep;
    property logradouro: string read Flogradouro write Flogradouro;
    property complemento: string read Fcomplemento write Fcomplemento;
    property bairro: string read Fbairro write Fbairro;
    property localidade: string read Flocalidade write Flocalidade;
    property uf: string read Fuf write Fuf;
    property ibge: string read Fibge write Fibge;
    property gia: string read Fgia write Fgia;
    property ddd: string read Fddd write Fddd;
    property siafi: string read Fsiafi write Fsiafi;
    property erro: Boolean read Ferro write Ferro;
  end;

  THwCEP = class
  private
    Fcep: string;
    FLogradouro: string;
    FBairro: string;
    FIBGE: Integer;
    FUF: string;
    FCidade: string;
    FEstado: string;
  published
    property cep: string read Fcep write Fcep;
    property Logradouro: string read FLogradouro write FLogradouro;
    property Bairro: string read FBairro write FBairro;
    property Cidade: string read FCidade write FCidade;
    property Estado: string read FEstado write FEstado;
    property IBGE: Integer read FIBGE write FIBGE;
    property UF: string read FUF write FUF;
  end;

  THwCEPApi = class(TConexao)
  strict private

    function GetDevmediaCEP(cep: string): THwCEP;
    function GetViaCEP(cep: string): THwCEP;
  private
    FLastError: string;
    FDataBase: string;
    FCodEmpresa: Integer;
  public
    constructor Create;
    destructor Destroy; override;

    function ConsultaCEP(value: string): Boolean;

    property LastError: string read FLastError write FLastError;
    property DataBase: string read FDataBase write FDataBase;
    property CodEmpresa: Integer read FCodEmpresa write FCodEmpresa;
  end;


implementation

{ THwCEPApi }

uses
  HW.Json,
  REST.Json,
  cep_class,
  hw_utils,
  System.SysUtils,
  System.StrUtils,
  System.Classes;

function THwCEPApi.ConsultaCEP(value: string): Boolean;
var
  cep: TCep_class;
  error: string;
  hwCEP: THwCEP;
  nomeUF: string;
  indexUF, I: Integer;
begin
  Result := False;
  LastError := '';
  if not conectar(DataBase, False) then
  begin
    registraErro(Format('THwCEPApi.ConsultaCEP Erro ao conectar com o Banco %s', [DataBase]));
    Exit;
  end;

  try
    value := OnlyNumber(value);
    try

      if value.Length <> 8 then
        raise Exception.Create('CEP inválido. Deve conter 8 dígitos');

      hwCEP := GetDevmediaCEP(value);

      if not Assigned(hwCEP) then
      begin
        error := LastError;

        hwCEP := GetViaCEP(value);

        if not Assigned(hwCEP) then
          LastError := error + sLineBreak + sLineBreak + LastError;
      end;

      if not LastError.IsEmpty then
        Exit;

      cep := TCep_class.Create;
      cep.CopyFrom(SqlOpen('select * from cep where cod_correios = %s', [value.QuotedString]));

      cep.cidade := hwCEP.Cidade.ToUpper.Substring(0, 50).Trim;
      cep.bairro := hwCEP.Bairro.ToUpper.Substring(0, 50).Trim;
      cep.estado := hwCEP.Estado.ToUpper.Substring(0, 50).Trim;
      cep.endereco := hwCEP.Logradouro.ToUpper.Substring(0, 50).Trim;
      cep.sigla_estado := hwCEP.UF.ToUpper.Substring(0, 2).Trim;

      indexUF := -1;
      for I := Low(Const_IBGE_UF) to High(Const_IBGE_UF) do
        if Const_IBGE_UF[I].ToString.Equals(hwCEP.IBGE.ToString.Substring(0, 2)) then
        begin
          indexUF := I;
          Break;
        end;

      if (indexUF > -1) and (cep.sigla_estado.Trim.IsEmpty) then
        cep.sigla_estado := Const_UF[indexUF].ToUpper.Substring(0, 2).Trim;
      if (indexUF > -1) and (cep.estado.Trim.IsEmpty) then
        cep.estado := Const_Estados[indexUF].ToUpper.Substring(0, 50).Trim;

      if not cep.sigla_estado.Trim.IsEmpty then
        if SqlOpen('select count(*) cont from estados where sigla_uf = %s', [cep.sigla_estado.QuotedString])
          .FieldByName('cont').AsInteger = 0 then
          SqlExec('insert into estados (nome_uf, sigla_uf, ibge_codigo_uf) values (%s, %s, %s)',
                  [cep.estado.Substring(0,30).QuotedString,
                   cep.sigla_estado,
                   IfThen(hwCEP.IBGE > 0, hwCEP.IBGE.ToString.Substring(0, 2), 'null')]);

      if not hwCEP.Bairro.Trim.IsEmpty then
        if SqlOpen('select count(*) cont from bairros where nome_bairro = %s', [cep.bairro.QuotedString])
          .FieldByName('cont').AsInteger = 0 then
          SqlExec('insert into bairros (nome_bairro) values (%s)', [cep.bairro.QuotedString]);

      if hwCEP.IBGE > 0 then
        if SqlOpen('select count(*) cont from cidades_ibge where codigo_mun_ibge = %s', [hwCEP.IBGE.ToString])
          .FieldByName('cont').AsInteger = 0 then
          if indexUF > 0 then
            SqlExec('insert into cidades_ibge (codigo_uf_ibge, nome_uf, codigo_mun_ibge, nome_municipio) values (%d, %s, %d, %s)',
                    [Const_IBGE_UF[indexUF], Const_Estados[indexUF].ToUpper.QuotedString,
                     hwCEP.IBGE, cep.cidade.QuotedString]);

      if hwCEP.IBGE > 0 then
        if SqlOpen('select count(*) cont from cidades where ibge_cod_cidade = %d', [hwCEP.IBGE])
          .FieldByName('cont').AsInteger = 0 then
          SqlExec('insert into cidades (nome_cidade, ibge_cod_cidade) values (%s, %d)',
                  [cep.cidade.Substring(0, 30).QuotedString,
                   hwCEP.IBGE]);

      cep.cod_estado := SqlOpen('select first 1 codigo_uf from estados where sigla_uf = %s', [cep.sigla_estado.QuotedString]).FieldByName('codigo_uf').AsInteger;
      if not cep.bairro.Trim.IsEmpty then
        cep.cod_bairro := SqlOpen('select first 1 cod_bairro from bairros where nome_bairro = %s order by cod_bairro', [cep.bairro.QuotedString]).FieldByName('cod_bairro').AsInteger;
      cep.cod_cidade := SqlOpen('select first 1 cod_cidade from cidades where ibge_cod_cidade = %d order by cod_cidade', [hwCEP.IBGE]).FieldByName('cod_cidade').AsInteger;

      if cep.cod_correios.Trim.Equals(value)  then
      begin
        if cep.FoundChanges then
          SqlExec(cep.SQLMotor().SQLUpdate).Transaction.Commit
      end
      else
      begin
        cep.cod_correios := value;
        SqlExec(cep.SQLMotor().SQLInsert).Transaction.Commit;
      end;

      Result := True;

    except on E: Exception do
      begin
        Transacao.Rollback;
        registraErro('THwCEPApi.ConsultaCEP ' + e.Message);
        LastError := LastError + e.Message;
      end;
    end;

  finally
    desconectar;
  end;
end;

constructor THwCEPApi.Create;
begin
  inherited Create();
end;

destructor THwCEPApi.Destroy;
begin

  inherited;
end;

function THwCEPApi.GetDevmediaCEP(cep: string): THwCEP;
var
 client: TRESTClient;
 request: TRESTRequest;
 response: TRESTResponse;
 strresponse, url: string;
 devmedia: TDevmediaCEP;
begin
  client := TRESTClient.Create(nil);
  request := TRESTRequest.Create(client);
  response := TRESTResponse.Create(client);
  client.RaiseExceptionOn500 := False;
  try

    try
      LastError := '';
      url := 'http://www.devmedia.com.br/api/cep/service/?cep=' + cep.Trim + '&chave=YYIMEJTGSU&&formato=json';

      request.Response := response;
      request.Method := rmGET;

      client.BaseURL := url;

      response.ResetToDefaults;
      request.Execute;

      if not Assigned(response) then
        raise Exception.Create('Sem resposta do servidor, problema de comunicação');

      if response.StatusCode = 200 then
      begin
        if Assigned(response.JSONValue) then
        begin
          strresponse := TJson.Format(response.JSONValue);

          try
            with NewStringList(strresponse) do
            begin
              SaveToFile(ExtractFilePath(ParamStr(0)) + 'cep_dev.json');
              Free;
            end;
          except
          end;

          devmedia := TJsonHw.ToObject<TDevmediaCEP>(strresponse);

          if not Assigned(devmedia) then
            raise Exception.Create('Sem resposta do serviço Devmedia');

          if not devmedia.resultado_txt.Trim.ToLower.Equals('sucesso')  then
          begin
            if devmedia.resultado_txt.Trim.IsEmpty then
              raise Exception.Create('Resposta com valores em branco. Provável que o CEP seja muito novo')
            else
              raise Exception.Create(devmedia.resultado_txt)
          end
          else
          begin
            Result := THwCEP.Create;
            Result.cep := cep;
            Result.Logradouro := devmedia.logradouro;
            Result.Bairro := devmedia.bairro;
            Result.IBGE := devmedia.codigomunicipio;
            Result.UF := devmedia.uf;
            Result.Cidade := devmedia.cidade;
            Result.Estado := devmedia.estado;
          end;

        end;
      end
      else
        raise Exception.Create('Servidor de consulta CEP não respondeu como esperado. Status code ' + response.StatusCode.ToString);

    except on E: Exception do
      begin
        LastError := 'Serv Dev: ' + e.Message;
        registraErro(Format('THwCEPApi.GetDevmediaCEP cep %s url %s response %s erro %s', [cep, url, strresponse, E.Message]));
      end;
    end;

  finally
    response.Free;
    request.Free;
    client.Free;
  end;
end;

function THwCEPApi.GetViaCEP(cep: string): THwCEP;
var
 client: TRESTClient;
 request: TRESTRequest;
 response: TRESTResponse;
 strresponse, url: string;
 viaCEP: TViaCEP;
 ibg: Integer;
begin
  client := TRESTClient.Create(nil);
  request := TRESTRequest.Create(client);
  response := TRESTResponse.Create(client);
  client.RaiseExceptionOn500 := False;
  try

    try
      LastError := '';
      url := 'https://viacep.com.br/ws/' + cep.Trim + '/json/';

      request.Response := response;
      request.Method := rmGET;

      client.BaseURL := url;

      try
      response.ResetToDefaults;
      except

      end;
      request.Execute;

      if not Assigned(response) then
        raise Exception.Create('Sem resposta do servidor, problema de comunicação');

      if response.StatusCode = 200 then
      begin
        if Assigned(response.JSONValue) then
        begin
          strresponse := TJson.Format(response.JSONValue);

          try
            with NewStringList(strresponse) do
            begin
              SaveToFile(ExtractFilePath(ParamStr(0)) + 'cep_via.json');
              Free;
            end;
          except
          end;

          viaCEP := TJsonHw.ToObject<TViaCEP>(strresponse);

          if not Assigned(viaCEP) then
            raise Exception.Create('Sem resposta do serviço Devmedia');

          if viaCEP.erro then
            raise Exception.Create('CEP consultado não consta na base de dados do servidor')
          else
          begin
            Result := THwCEP.Create;
            Result.cep := cep;
            Result.Logradouro := viaCEP.logradouro + IfThen(not viaCEP.complemento.Trim.IsEmpty, ', ' + viaCEP.complemento.Trim) ;
            Result.Bairro := viaCEP.bairro;
            if TryStrToInt(viaCEP.ibge.Trim, ibg) then
              Result.IBGE := ibg;
            Result.UF := viaCEP.uf;
            Result.Cidade := viaCEP.localidade;
          end;

        end;
      end
      else
        raise Exception.Create('Servidor de consulta CEP não respondeu como esperado. Status code ' + response.StatusCode.ToString);

    except on E: Exception do
      begin
        LastError := 'Serv Via: ' + e.Message;
        registraErro(Format('THwCEPApi.GetViaCEP cep %s url %s response %s erro %s', [cep, url, strresponse, E.Message]));
      end;
    end;

  finally
    response.Free;
    request.Free;
    client.Free;
  end;
end;

end.
