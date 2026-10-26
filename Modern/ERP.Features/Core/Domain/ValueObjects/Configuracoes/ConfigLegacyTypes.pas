unit ConfigLegacyTypes;

interface

uses
  ScalarResultUnit;

type
  ConfigLegacyEnum = (
		ceCNPJ, ceIM, ceRegimeFederal, ceCMun, ceSerieNFSe, ceNFSeOpetanteSN, ceNFSeRegEspTrib, ceAliqCheiaSN, ceAliqIcmsSN,
    ceAliqIssSN, ceAliqPis, ceAliqCofins, ceCertDigCaminho, ceCertDigSenha, ceCertDigNumSerie, ceNFSeFraseSecr,
    csNFSeWSSenha, ceWSAmbiente, ceWSArquivos, ceWSFraseSercreta, ceWSSenha, ceNFSeIncntvCult, ceNFSeSemQuebraLinha,
    ceNFeDhEntCont, ceNFeXJustCont, ceDFeGravarLog
  );
  ConfigLegacySet = set of ConfigLegacyEnum;
  ConfigLegacyArray = array[ConfigLegacyEnum] of ScalarResult;

  ConfigLegacyData = record
  private
    FValues: ConfigLegacyArray;
    FSets: array[ConfigLegacyEnum] of Boolean;
    procedure CheckConf(AConfig: ConfigLegacyEnum);
  public
    function GetInt(AConfig: ConfigLegacyEnum): Integer;
		function GetString(AConfig: ConfigLegacyEnum): string;
		function GetCurrency(AConfig: ConfigLegacyEnum): Currency;
		function GetDouble(AConfig: ConfigLegacyEnum): Double;
		function GetScalar(AConfig: ConfigLegacyEnum): ScalarResult;

		function HasValue(AConfig: ConfigLegacyEnum): Boolean;

    class function Create(AConfigs: ConfigLegacySet; const Values: ConfigLegacyArray): ConfigLegacyData; static;
  end;


implementation

uses
  SysUtils, TypInfo;

{ ConfigLegacyData }

procedure ConfigLegacyData.CheckConf(AConfig: ConfigLegacyEnum);
begin
  if not FSets[AConfig] then
  begin

    raise Exception.CreateFmt('ConfigLegacyData.CheckConf [%d - %s] not set',
      [ Ord(AConfig), GetEnumName(TypeInfo(ConfigLegacyEnum), Ord(AConfig)) ]
    );
  end;
end;

class function ConfigLegacyData.Create(
  AConfigs: ConfigLegacySet;
  const Values: ConfigLegacyArray): ConfigLegacyData;
var
  E: ConfigLegacyEnum;
begin
  Result.FValues := Values;
  for E := Low(ConfigLegacyEnum) to High(ConfigLegacyEnum) do
    Result.FSets[E] := E in AConfigs;
end;

function ConfigLegacyData.GetCurrency(AConfig: ConfigLegacyEnum): Currency;
begin
  CheckConf(AConfig);

  Result := FValues[AConfig].AsCurrency;
end;

function ConfigLegacyData.GetDouble(AConfig: ConfigLegacyEnum): Double;
begin
  CheckConf(AConfig);

	Result := FValues[AConfig].AsFloat;
end;

function ConfigLegacyData.GetInt(AConfig: ConfigLegacyEnum): Integer;
begin
  CheckConf(AConfig);

  Result := FValues[AConfig].AsInteger;
end;

function ConfigLegacyData.GetScalar(AConfig: ConfigLegacyEnum): ScalarResult;
begin
  Result := FValues[AConfig];
end;

function ConfigLegacyData.GetString(AConfig: ConfigLegacyEnum): string;
begin
  CheckConf(AConfig);

  Result := FValues[AConfig].AsString;
end;

function ConfigLegacyData.HasValue(AConfig: ConfigLegacyEnum): Boolean;
begin
  Result := FSets[AConfig];
end;

end.
