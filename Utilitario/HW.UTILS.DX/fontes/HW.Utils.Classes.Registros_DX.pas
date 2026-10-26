{******************************************************************************}
{ Projeto: REST HW                                                             }
{  Biblioteca para ser usada em maior parte para consumir a api da HW Sistemas }
{ outras apis também são podem ser consumidas utilizando esta biblioteca       }
{                                                                              }
{ Direitos Autorais Reservados (c) 2017   Hw Sistemas e Computadores           }
{                                                                              }
{ Autor: João Pedro Rodrigues Costa                                            }
{                                                                              }
{            HW Sistemas e Computadores Ltda - www.hwsistemas.com.br           }
{    Rua Mogno, 236, Santo Agostinho - Governador Valadares - MG - 35.065-019  }
{                                                                              }
{******************************************************************************}

{******************************************************************************
|* Historico
|*
|* 23/02/2017: João Pedro
|*  - Criação e distribuição da Primeira Versao
*******************************************************************************}

unit HW.Utils.Classes.Registros_DX;

interface

uses
  REST.Json,
  Data.DB,
  DataSnap.DBClient,
  HW.Utils.Classes.Rtti,
  System.JSON,
  System.Classes;

type
  THwClassRegistros = class;

  /// <summary> Conversoes em dataset -> object e vice versa</summary>
  THwDbConverter = class
  public
    /// <summary>
    ///   Cria um Objeto do tipo TClientDataSet usando como base uma Classe com seus CustomAttributes
    /// </summary>
    /// <param name="AMemoryDataSet">Quando True chama o metodo CreateDataset e automaticamente o metodo <see cref="THwRttiConverter.SetPropertiesFields"/></param>
    class function ClassToDBClient(AClass: TClass; AMemoryDataSet: Boolean = True; AOwner: TComponent = nil): TClientDataSet;
    /// <summary>
    ///   Modifica displays e mascaras do dataset com base nos CustomAttributes
    /// </summary>
    class procedure SetPropertiesFields(AClass: TClass; ADataSet: TDataSet);
    /// <summary>
    ///   Posta os dados de um objeto em um dataset
    /// </summary>
    class function ObjectToDataSetRow(AObject: TObject; ADataSet: TDataSet; AAction: THwRttiEnumActionDataSet = hwrtacInsert;
      AOptions: THwRttiEnumActionDataSetOptions = []): TDataSet;
    /// <summary>
    ///   Posta os dados de um objeto em um ClientDataSet
    /// </summary>
    class function ObjectToDBClientRow(AObject: TObject; ADBClient: TClientDataSet = nil;
      AAction: THwRttiEnumActionDataSet = hwrtacInsert; AOptions: THwRttiEnumActionDataSetOptions = []): TClientDataSet;
    /// <summary>
    ///   Posta os dados de um array de objetos em um DataSet
    /// </summary>
    /// <param name="T"> Representa a classe de um único item (objeto) do array. Ex: <c>TPessoa</c> </param>
    /// <param name="AObjectArray"> Array de objetos contendo os a serem postados no dataset </param>
    /// <param name="ADataSet"> DataSet onde serão postados os dados</param>
    class function ObjectToDataSet<T: class>(AObjectArray: TArray<T>; ADataSet: TDataSet): TDataSet;
    /// <summary>
    ///   Posta os dados de um array de objetos em um ClientDataSet
    /// </summary>
    /// <param name="T"> Representa a classe de um único item (objeto) do array. Ex: <c>TPessoa</c> </param>
    /// <param name="AObjectArray"> Array de objetos contendo os a serem postados no dataset </param>
    /// <param name="ADataSet"> DataSet onde serão postados os dados</param>
    /// <remarks> Caso o parametro ADataSet = nil então um novo ClientDataSet será criado usando o metodo
    /// <see cref="THwRttiConverter.ClassToEmptyDataSet"/></remarks>
    class function ObjectToDBClient<T: class>(AObjectArray: TArray<T>; ADBClient: TClientDataSet = nil): TClientDataSet;
    /// <summary>
    ///   Converte os valores do registro corrente no dataset em um novo objeto
    /// </summary>
    /// <param name="T"> Representa a classe usada para criar um objeto. Ex: <c>TPessoa</c> </param>
    /// <returns> Objeto do tipo <c>T</c>  </returns>
    class function DataSetRowToObject<T: class, constructor>(ADataSet: TDataSet): T;
    /// <summary>
    ///   Converte cada registro de um dataset em um objeto e o adiciona em um array
    /// </summary>
    /// <param name="T"> Representa a classe usada para criar um objeto. Ex: TPessoa </param>
    /// <returns> Array de objetos do tipo <c>T</c>. EX: <c>TArray&lt;TPessoa&gt;"</c></returns>
    class function DataSetToObject<T: class, constructor>(ADataSet: TDataSet): TArray<T>;
  end;

  THwClassArrayRegistros = TArray<THwClassRegistros>;

  /// <summary> Classe Pai dos registros manipuladores de dados</summary>
  THwClassRegistros = class
  public
    function GetDateTimeStr(Value: TDateTime): string;
    function GetDateTimeVal(Value: string): TDateTime;
    /// <summary>
    ///   Cria um Objeto do tipo TClientDataSet usando como base uma Classe com seus CustomAttributes
    /// </summary>
    /// <param name="AMemoryDataSet">Quando True chama o metodo CreateDataset e automaticamente o metodo <see cref="THwRttiConverter.SetPropertiesFields"/></param>
    function ToDBClient(AMemoryDataSet: Boolean = True): TClientDataSet;
    /// <summary>
    ///   Modifica displays e mascaras do dataset com base nos CustomAttributes
    /// </summary>
    procedure SetPropertiesFields(ADataSet: TDataSet);
    /// <summary>
    ///   Posta os dados do objeto em um dataset
    /// </summary>
    function ToDataSetRow(ADataSet: TDataSet; AAction: THwRttiEnumActionDataSet = hwrtacInsert;
      AOptions: THwRttiEnumActionDataSetOptions = []): TDataSet;
    /// <summary>
    ///   Posta os dados do objeto em um ClientDataSet
    /// </summary>
    function ToDBClientRow(ADBClient: TClientDataSet = nil;
      AAction: THwRttiEnumActionDataSet = hwrtacInsert; AOptions: THwRttiEnumActionDataSetOptions = []): TClientDataSet;
    /// <summary>
    ///   Modifica displays e mascaras do dataset com base nos CustomAttributes
    /// </summary>
    procedure SetObjectToDataSetParams(AParams: TParams);
    /// <summary>
    ///   Converte o objeto para o formato JSon usando o metodo "TJson.Format( TJson.ObjectToJsonObject(Self) )"
    ///  da unit <see cref="REST.Json"/>
    /// </summary>
    function ToJsonStringFormat: string;
    /// <summary>
    ///   Converte o objeto para o formato JSon usando o metodo "TJson.ObjectToJsonString( Self )"
    ///  da unit <see cref="REST.Json"/>
    /// </summary>
    function ToJsonStringEncode: string;
    /// <summary>
    ///   Converte o array de objetos para o formato JSon usando o metodo "TJson.ObjectToJsonString( Self )"
    ///  da unit <see cref="REST.Json"/>
    /// </summary>
    class function ArrayObjectToJsonStringEncode<T: class>(AObjectArray: TArray<T>): string;
    /// <summary>
    ///   Converte um string JSon em um objeto usando o metodo "TJson.JsonToObject&lt;T&gt;(AJsonString)"
    ///  da unit <see cref="REST.Json"/>
    /// </summary>
    /// <param name="T"> Representa a classe usada para criar um objeto. Ex: <c>TPessoa</c> </param>
    class function FromJsonString<T: class, constructor>(AJsonString: string): T;
    /// <summary>
    ///   Converte um string JSon em um objeto usando o metodo "TJson.JsonToObject&lt;T&gt;(AJsonString)"
    ///  da unit <see cref="REST.Json"/>
    /// </summary>
    /// <param name="T"> Representa a classe usada para criar um objeto. Ex: <c>TPessoa</c> </param>
    class function FromJsonValue<T: class, constructor>(AJsonValue: TJSONValue): T;
    /// <summary>
    ///   Converte um array de objeto JSon em um array de objeto usando o metodo "TJson.JsonToObject&lt;T&gt;(AJsonString)"
    ///  da unit <see cref="REST.Json"/>
    /// </summary>
    /// <param name="T"> Representa a classe usada para criar um objeto. Ex: <c>TPessoa</c> </param>
    class function FromJsonToArray<T: class, constructor>(AJSONValue: TJSONValue): TArray<T>; overload;
    /// <summary>
    ///   Converte um array de JSon em um array de objeto usando o metodo "TJson.JsonToObject&lt;T&gt;(AJsonString)"
    ///  da unit <see cref="REST.Json"/>
    /// </summary>
    /// <param name="T"> Representa a classe usada para criar um objeto. Ex: <c>TPessoa</c> </param>
    class function FromJsonToArray<T: class, constructor>(AJSONEncode: string): TArray<T>; overload;
  end;

  TEstatistica = class(THwClassRegistros)
  private
    FDescricao: string;
    FQuantidade: Integer;
    FData: string;
    procedure SetDescricao(const Value: string);
    procedure SetQuantidade(const Value: Integer);
  public
    procedure SetData(const Value: TDateTime);
    class function FromJsonString(AJsonString: string): TEstatistica;
  published
    property Data: string read FData;
    property Descricao: string read FDescricao write SetDescricao;
    property Quantidade: Integer read FQuantidade write SetQuantidade;
  end;

  TRegistrosEstatisticas = class(THwClassRegistros)
  private
    Festatisticas: TArray<TEstatistica>;
    Fcnpj: string;
    procedure Setestatisticas(const Value: TArray<TEstatistica>);
    procedure Setcnpj(const Value: string);
  public
    destructor Destroy; override;
    procedure Add(Value: TEstatistica);
  published
    property estatisticas: TArray<TEstatistica> read Festatisticas write Setestatisticas;
    property cnpj: string read Fcnpj write Setcnpj;
  end;

  [THwDBTableName('IBPT')]
  TIBPTProdutoNCM = class(THwClassRegistros)
  private
    FVigenciaFim: String;
    FVigenciaInicio: String;
    FVersao: String;
    FEstadual: Double;
    FUF: String;
    FDescricao: String;
    FCodigo: String;
    FNacional: Double;
    FImportado: Double;
    FMunicipal: Double;
    FChave: String;
    FTipo: String;
    FFonte: String;
    FEX: Integer;
    Fdataconsulta: TDateTime;
    procedure SetChave(const Value: String);
    procedure SetCodigo(const Value: String);
    procedure SetDescricao(const Value: String);
    procedure SetEstadual(const Value: Double);
    procedure SetEX(const Value: Integer);
    procedure SetFonte(const Value: String);
    procedure SetImportado(const Value: Double);
    procedure SetMunicipal(const Value: Double);
    procedure SetNacional(const Value: Double);
    procedure SetTipo(const Value: String);
    procedure SetUF(const Value: String);
    procedure SetVersao(const Value: String);
    procedure SetVigenciaFim(const Value: String);
    procedure SetVigenciaInicio(const Value: String);
    procedure Setdataconsulta(const Value: TDateTime);
  public
    class function FromJsonString(AJsonString: string): TIBPTProdutoNCM;
  published
    [THwDBField('codigo', '', True, 8)]
    property Codigo: String read FCodigo write SetCodigo;
    [THwDBField('uf', 'UF', True, 2)]
    property UF: String read FUF write SetUF;
    [THwDBField('ex', 'EX', True)]
    property EX: Integer read FEX write SetEX;
    [THwDBField('descricao', 'Descricao', 50)]
    property Descricao: String read FDescricao write SetDescricao;
    property Nacional: Double read FNacional write SetNacional;
    property Estadual: Double read FEstadual write SetEstadual;
    property Importado: Double read FImportado write SetImportado;
    property Municipal: Double read FMunicipal write SetMunicipal;
    [THwDBField('tipo', 50)]
    property Tipo: String read FTipo write SetTipo;
    [THwConvertDateTimeFormat('dd/mm/yyyy')]
    property VigenciaInicio: String read FVigenciaInicio write SetVigenciaInicio;
    [THwConvertDateTimeFormat('dd/mm/yyyy')]
    property VigenciaFim: String read FVigenciaFim write SetVigenciaFim;
    [THwDBField('Chave', 50)]
    property Chave: String read FChave write SetChave;
    [THwDBField('Versao', 50)]
    property Versao: String read FVersao write SetVersao;
    [THwDBFieldNotIn()]
    property Fonte: String read FFonte write SetFonte;
    property dataconsulta: TDateTime read Fdataconsulta write Setdataconsulta;
  end;

  THW_StatusApi = class(THwClassRegistros)
  private
    Fstatus: string;
    Fsite_url: String;
    Fapi_url: string;
    Fdata_inat: string;
  public
    property status: string read Fstatus write Fstatus;
    property site_url: string read Fsite_url write Fsite_url;
    property api_url: string read Fapi_url write Fapi_url;
    property data_inat: string read Fdata_inat write Fdata_inat;
  end;

implementation

uses
  Winapi.Windows,
  System.SysUtils;

{ TEstatistica }

class function TEstatistica.FromJsonString(AJsonString: string): TEstatistica;
begin
  Result := TJson.JsonToObject<TEstatistica>(AJsonString);
end;

procedure TEstatistica.SetData(const Value: TDateTime);
begin
  FData := GetDateTimeStr(Value);
end;

procedure TEstatistica.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TEstatistica.SetQuantidade(const Value: Integer);
begin
  FQuantidade := Value;
end;

{ THwClassRegistros }

class function THwClassRegistros.ArrayObjectToJsonStringEncode<T>(AObjectArray: TArray<T>): string;
var
  AJsonArray: string;
  AObj: T;
begin
   if Length(AObjectArray) = 0 then
    Exit('[]');

  AJsonArray := '';
  for AObj in AObjectArray do
  begin
    AJsonArray := AJsonArray + ',' +
      TJson.ObjectToJsonString( AObj, [] );
  end;
  System.Delete(AJsonArray, 1, 1);
  Result := '[' + AJsonArray + ']';
end;

class function THwClassRegistros.FromJsonString<T>(AJsonString: string): T;
begin
  if (AJsonString.Trim = '') or (AJsonString.Trim.ToLower = 'null') then
    Result := nil
  else
    Result := TJson.JsonToObject<T>(AJsonString);
end;

class function THwClassRegistros.FromJsonToArray<T>(AJSONValue: TJSONValue): TArray<T>;
var
  AAraayJson: TJSONArray;
  AValue: TJSONValue;
  AArrayValue: TArray<T>;
begin
  if AJSONValue = nil then
    Exit(nil);

  AAraayJson :=
    TJSONObject.ParseJSONValue(
      TEncoding.UTF8.GetBytes(TJson.JsonEncode(AJSONValue)),
      0) as TJSONArray;

  if AAraayJson = nil then
    Exit(nil);

  SetLength(AArrayValue, 0);
  for AValue in AAraayJson do
  begin
    SetLength(AArrayValue, Length(AArrayValue) + 1);
    AArrayValue[Length(AArrayValue) - 1] := FromJsonString<T>(TJson.JsonEncode(AValue)) as T;
  end;

  Result := AArrayValue;
end;

class function THwClassRegistros.FromJsonToArray<T>(AJSONEncode: string): TArray<T>;
var
  AAraayJson: TJSONArray;
  AValue: TJSONValue;
  AArrayValue: TArray<T>;
begin
  if AJSONEncode.ToLower.Trim.Equals('null') then
    Exit(nil);

  AAraayJson :=
    TJSONObject.ParseJSONValue(
      TEncoding.UTF8.GetBytes(AJSONEncode),
      0) as TJSONArray;

  if AAraayJson = nil then
    Exit(nil);

  SetLength(AArrayValue, 0);
  for AValue in AAraayJson do
  begin
    SetLength(AArrayValue, Length(AArrayValue) + 1);
    AArrayValue[Length(AArrayValue) - 1] := FromJsonString<T>(TJson.JsonEncode(AValue)) as T;
  end;

  Result := AArrayValue;
end;

class function THwClassRegistros.FromJsonValue<T>(AJsonValue: TJSONValue): T;
begin
  if (AJsonValue = nil) then
    Result := nil
  else
    Result := FromJsonString<T>(TJson.JsonEncode(AJsonValue));
end;

function THwClassRegistros.GetDateTimeStr(Value: TDateTime): string;
var
  TimeZone: TTimeZoneInformation;
begin
  GetTimeZoneInformation(TimeZone);
  Result :=
    FormatDateTime('YYYY"-"MM"-"DD"T"hh":"mm":"ss' +
      FormatFloat('00', TimeZone.Bias div -60) + ':00', Value);
end;

function THwClassRegistros.GetDateTimeVal(Value: string): TDateTime;
var
  localFormatSettings: TFormatSettings;
  ADate: string;
begin
  localFormatSettings.DateSeparator := '-';
  localFormatSettings.TimeSeparator := ':';
  localFormatSettings.ShortDateFormat := 'YYYY-MM-DD';
  localFormatSettings.ShortTimeFormat := 'hh:nn:ss';

  ADate := Copy(Value, 1, 19);
  ADate := StringReplace(ADate, 'T', ' ', []);
  Result := StrToDateTime(ADate, localFormatSettings);
end;

procedure THwClassRegistros.SetObjectToDataSetParams(AParams: TParams);
begin
  THwRttiConverter.SetObjectToDataSetParams(Self, AParams);
end;

procedure THwClassRegistros.SetPropertiesFields(ADataSet: TDataSet);
begin
  THwDbConverter.SetPropertiesFields(Self.ClassType, ADataSet);
end;

function THwClassRegistros.ToDataSetRow(ADataSet: TDataSet; AAction: THwRttiEnumActionDataSet;
  AOptions: THwRttiEnumActionDataSetOptions): TDataSet;
begin
  Result := ADataSet;
  THwRttiConverter.ObjectPostInDataSetRow(Self, ADataSet, AAction, AOptions);
end;

function THwClassRegistros.ToDBClient(AMemoryDataSet: Boolean): TClientDataSet;
begin
  Result := THwRttiConverter.ClassToEmptyDataSet(Self.ClassType, AMemoryDataSet);
end;

function THwClassRegistros.ToDBClientRow(ADBClient: TClientDataSet;
  AAction: THwRttiEnumActionDataSet; AOptions: THwRttiEnumActionDataSetOptions): TClientDataSet;
begin
  if ADBClient = nil then
    ADBClient := THwRttiConverter.ClassToEmptyDataSet(Self.ClassType);
  Result := ADBClient;
  THwRttiConverter.ObjectPostInDataSetRow(Self, ADBClient, AAction, AOptions);
end;

function THwClassRegistros.ToJsonStringEncode: string;
var
  AField: THwJsonSerializer;
begin
  Result := TJson.ObjectToJsonString( Self, [joDateIsUTC, joDateFormatISO8601, joIgnoreEmptyStrings, joIgnoreEmptyArrays] );

  for AField in THwRttiConverter.GetCustomFieldsJsonSerializer(Self.ClassType) do
  begin
    if AField.DefaultValue <> '' then
    begin
      if AField.IsNumber then
      begin
        Result := StringReplace(Result, '"' + AField.Name + '":0,',
                                        '"' + AField.Name + '":0,' + AField.DefaultValue, [rfReplaceAll]); //inicio e meio
        Result := StringReplace(Result, '"' + AField.Name + '":0}',
                                        '"' + AField.Name + '":0}' + AField.DefaultValue + '}', [rfReplaceAll]); //final
      end
      else
      begin
        Result := StringReplace(Result, '"' + AField.Name + '":"",',
                                        '"' + AField.Name + '":"",' + '"' + AField.DefaultValue + '"',[rfReplaceAll]); //inicio e meio
        Result := StringReplace(Result, '"' + AField.Name + '":""}',
                                        '"' + AField.Name + '":"",' + '"' + AField.DefaultValue + '"}',[rfReplaceAll]); //final
      end;
    end;

    if not AField.NotNull then
    begin
      if AField.IsNumber then
      begin
        Result := StringReplace(Result, '"' + AField.Name + '":0,', '' ,[rfReplaceAll]); //inicio e meio
        Result := StringReplace(Result, ',"' + AField.Name + '":0}', '}',[rfReplaceAll]); //final
      end
      else
      begin
        Result := StringReplace(Result, '"' + AField.Name + '":"",', '' ,[rfReplaceAll]); //inicio e meio
        Result := StringReplace(Result, ',"' + AField.Name + '":""}', '}',[rfReplaceAll]); //final
      end
    end;
  end;
end;

function THwClassRegistros.ToJsonStringFormat: string;
begin
  Result := TJson.Format( TJson.ObjectToJsonObject(Self) );
end;

{ TRegistrosEstatisticas }

procedure TRegistrosEstatisticas.Add(Value: TEstatistica);
begin
  SetLength(Festatisticas, Length(Festatisticas) + 1);
  Festatisticas[Length(Festatisticas) -1] := Value;
end;

destructor TRegistrosEstatisticas.Destroy;
var
  itemEstatistica: TEstatistica;
begin
  for itemEstatistica in Festatisticas do
    itemEstatistica.Free;
  inherited;
end;

procedure TRegistrosEstatisticas.Setcnpj(const Value: string);
begin
  Fcnpj := Value;
end;

procedure TRegistrosEstatisticas.Setestatisticas(
  const Value: TArray<TEstatistica>);
begin
  Festatisticas := Value;
end;

{ TIBPTProdutoNCM }

class function TIBPTProdutoNCM.FromJsonString(
  AJsonString: string): TIBPTProdutoNCM;
begin
  Result := TJson.JsonToObject<TIBPTProdutoNCM>(AJsonString);
end;

procedure TIBPTProdutoNCM.SetChave(const Value: String);
begin
  FChave := Value;
end;

procedure TIBPTProdutoNCM.SetCodigo(const Value: String);
begin
  FCodigo := Value.PadLeft(8, '0');
end;

procedure TIBPTProdutoNCM.Setdataconsulta(const Value: TDateTime);
begin
  Fdataconsulta := Value;
end;

procedure TIBPTProdutoNCM.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TIBPTProdutoNCM.SetEstadual(const Value: Double);
begin
  FEstadual := Value;
end;

procedure TIBPTProdutoNCM.SetEX(const Value: Integer);
begin
  FEX := Value;
end;

procedure TIBPTProdutoNCM.SetFonte(const Value: String);
begin
  FFonte := Value;
end;

procedure TIBPTProdutoNCM.SetImportado(const Value: Double);
begin
  FImportado := Value;
end;

procedure TIBPTProdutoNCM.SetMunicipal(const Value: Double);
begin
  FMunicipal := Value;
end;

procedure TIBPTProdutoNCM.SetNacional(const Value: Double);
begin
  FNacional := Value;
end;

procedure TIBPTProdutoNCM.SetTipo(const Value: String);
begin
  FTipo := Value;
end;

procedure TIBPTProdutoNCM.SetUF(const Value: String);
begin
  FUF := Value;
end;

procedure TIBPTProdutoNCM.SetVersao(const Value: String);
begin
  FVersao := Value;
end;

procedure TIBPTProdutoNCM.SetVigenciaFim(const Value: String);
begin
  FVigenciaFim := Value;
end;

procedure TIBPTProdutoNCM.SetVigenciaInicio(const Value: String);
begin
  FVigenciaInicio := Value;
end;

{ THwDbConverter }

class function THwDbConverter.ClassToDBClient(AClass: TClass; AMemoryDataSet: Boolean;
  AOwner: TComponent): TClientDataSet;
begin
  Result := THwRttiConverter.ClassToEmptyDataSet(AClass, AMemoryDataSet, True, AOwner);
end;

class function THwDbConverter.DataSetRowToObject<T>(ADataSet: TDataSet): T;
var
  AConverter: THwRttiConverter;
begin
  AConverter := THwRttiConverter.Create;
  try
    Result := AConverter.DataSetRowToObject(T, ADataSet) as T;
  finally
    FreeAndNil(AConverter);
  end;
end;

class function THwDbConverter.DataSetToObject<T>(ADataSet: TDataSet): TArray<T>;
var
  AConverter: THwRttiConverter;
  AArrayValue: TArray<T>;
begin
  AConverter := THwRttiConverter.Create;
  try
    ADataSet.Last;

    SetLength(AArrayValue, ADataSet.RecordCount);
    ADataSet.First;
    while not ADataSet.Eof do
    begin
      AArrayValue[ADataSet.RecNo - 1] := AConverter.DataSetRowToObject(T, ADataSet) as T;

      ADataSet.Next;
    end;

    Result := AArrayValue;

  finally
    FreeAndNil(AConverter);
  end;
end;

class function THwDbConverter.ObjectToDataSet<T>(AObjectArray: TArray<T>; ADataSet: TDataSet): TDataSet;
var
  AItemArray: T;
begin
  Result := ADataSet;
  for AItemArray in AObjectArray do
    THwRttiConverter.ObjectPostInDataSetRow(AItemArray, ADataSet, hwrtacApend);
end;

class function THwDbConverter.ObjectToDataSetRow(AObject: TObject; ADataSet: TDataSet;
  AAction: THwRttiEnumActionDataSet; AOptions: THwRttiEnumActionDataSetOptions): TDataSet;
begin
  Result := ADataSet;
  THwRttiConverter.ObjectPostInDataSetRow(AObject, ADataSet, AAction, AOptions);
end;

class function THwDbConverter.ObjectToDBClient<T>(AObjectArray: TArray<T>; ADBClient: TClientDataSet): TClientDataSet;
var
  AItemArray: T;
begin
  if ADBClient = nil then
    ADBClient := THwRttiConverter.ClassToEmptyDataSet(T);

  Result := ADBClient;
  for AItemArray in AObjectArray do
    THwRttiConverter.ObjectPostInDataSetRow(AItemArray, ADBClient, hwrtacApend);
end;

class function THwDbConverter.ObjectToDBClientRow(AObject: TObject; ADBClient: TClientDataSet;
  AAction: THwRttiEnumActionDataSet; AOptions: THwRttiEnumActionDataSetOptions): TClientDataSet;
begin
  if ADBClient = nil then
    ADBClient := THwRttiConverter.ClassToEmptyDataSet(AObject.ClassType);
  Result := ADBClient;
  THwRttiConverter.ObjectPostInDataSetRow(AObject, ADBClient, AAction, AOptions);
end;

class procedure THwDbConverter.SetPropertiesFields(AClass: TClass; ADataSet: TDataSet);
begin
  THwRttiConverter.SetPropertiesFields(AClass, ADataSet);
end;

end.
