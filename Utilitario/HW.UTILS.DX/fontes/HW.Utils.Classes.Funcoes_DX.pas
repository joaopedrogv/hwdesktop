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

unit HW.Utils.Classes.Funcoes_DX;

interface

uses
  System.SysUtils,
  IBX.IBQuery, System.JSON, System.Generics.Collections, Vcl.Forms;

type
  THwUtilsClass = class
  public
    class function getCampoPipe(plinha: string; pOrdem: integer; pDelimitador: string = '|'): string;
    class function GetIni(AChave, AIdentificador, AValorDefault: string): string;
    class function SetIni(AChave, AIdentificador, AValue: string): Boolean;
    class function ComputadorDaRedeHwSistemas: Boolean;
    class function EncodeURIParameter(const Value: string): UTF8String;
    class function EncodeASCIIBase64(AText: string): string;
    class function DecodeASCIIBase64(ATextBase64: string): string;
    class function Codifica(wtexto: string): string;
    class function GetFormatSettings(const AShortDateFormat: string = 'DD/MM/YYYY';
                                     const AShortTimeFormat: string = 'hh:nn:ss';
                                     const ADateSeparator: Char = '/';
                                     const ATimeSeparator: Char = ':'): TFormatSettings;
    class function JsonToArrayJson(AJSONValue: TJSONValue): TJSONArray;
    class function ShowAtencao(AValue: string; AFlags: Longint = 64): Integer;
    class function ShowErro(AValue: string; AFlags: Longint = 16): Integer;
    class function ShowConfirmacao(AValue: string; AFlags: Longint = 36): Integer;
    class function GetDictionaryFromJson(AJSONString: string): TDictionary<string,string>;
    class function GetSpecialFolderPath(folder: integer): string;
    class function AddTagXML(ATag, AText: string): string;
    class function ExtractTagXML(ATag: string; var AText: string): string;
    class function CalculaChaveLoginChatWeb(ACnpj: string): string; overload;
    class function CalculaChaveLoginChatWeb(AEmail: string; ACnpj: string): string; overload;
    class procedure RegistraErro(AError: string; AFileName: string = '');
    class function InputMemo(const ACaption, APrompt: string; var AValue: string): Boolean;
    class function ReplaceCaracteresEspeciais(AValue: string): string;
    class function IncludeTrailingBackslash(AValue: string): string;
  end;

  THwUtilsClassDB = class
  public
    class procedure SetParamVal(AQuery: TIBQuery; AFieldName: string; Value: Double; ATipoData: Boolean = False; Nullable: Boolean = True); overload;
    class procedure SetParamVal(AQuery: TIBQuery; AFieldName: string; Value: Integer; Nullable: Boolean = True); overload;
    class procedure SetParamVal(AQuery: TIBQuery; AFieldName: string; Value: string; ALength: Integer; Nullable: Boolean = True; AUpper: Boolean = True); overload;
    class procedure SetParamVal(AQuery: TIBQuery; AFieldName: string; Value: Boolean; TrueValue, FalseValue: string; ALength: Integer); overload;
  end;

implementation

uses
  System.Classes,
  System.Variants,
  System.DateUtils,
  System.StrUtils,
  System.IniFiles,
  REST.Json,
  Winapi.Windows,
  Winapi.SHFolder, System.NetEncoding, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Controls;

{ TUtils }

class function THwUtilsClass.AddTagXML(ATag, AText: string): string;
begin
  Result := '<' + ATag + '>' + AText + '<' + ATag + '/>';
end;

class function THwUtilsClass.CalculaChaveLoginChatWeb(ACnpj: string): string;
var
  ADia, AMes, AAno, AValorDinamico, ALength: Integer;
  AChave, AChaveCodificada, AChaveBase64: string;
  AChaveCodBytes: TArray<Byte>;
  ADigito: Char;
begin
  ADia             := DayOf(Date);
  ACNPJ            := ACNPJ.PadLeft(14, '0');
  AMes             := MonthOf(Date);
  ALength          := 0;

  for ADigito in ACnpj do
    ALength        := ALength + StrToIntDef(ADigito, 0);

  AAno             := StrToInt(Copy(IntToStr(YearOf(Date)).PadLeft(4, '0'), 3, 2));

  AValorDinamico   := Abs((ADia * AMes * ALength ) - AAno);

  AChave           := IntToStr(ADia).PadLeft(2, '0') +
                      ACNPJ +
                      IntToStr(AMes).PadLeft(2, '0') +
                      IntToStr(ALength).PadLeft(3, '0') +
                      IntToStr(AAno).PadLeft(2, '0') +
                      IntToStr(AValorDinamico).PadLeft(10, '0');

  AChaveCodificada := THwUtilsClass.Codifica(AChave);

  AChaveCodBytes   := TEncoding.ASCII.GetBytes(AChaveCodificada);

  AChaveBase64     := TNetEncoding.Base64.EncodeBytesToString(AChaveCodBytes);

  Result           := AChaveBase64;
end;

class function THwUtilsClass.CalculaChaveLoginChatWeb(AEmail, ACnpj: string): string;
var
  ADia, AMes, AAno, AValorDinamico, ALength: Integer;
  AChave, AChaveCodificada, AChaveBase64: string;
  AChaveCodBytes: TArray<Byte>;
begin
  ADia             := DayOf(Date);
  ACNPJ            := ACNPJ.PadLeft(14, '0');
  AMes             := MonthOf(Date);
  ALength          := Length(AEmail);
  AAno             := StrToInt(Copy(IntToStr(YearOf(Date)).PadLeft(4, '0'), 3, 2));

  AValorDinamico   := Abs((ADia * AMes * ALength ) - AAno);

  AChave           := IntToStr(ADia).PadLeft(2, '0') +
                      ACNPJ +
                      IntToStr(AMes).PadLeft(2, '0') +
                      IntToStr(ALength).PadLeft(3, '0') +
                      IntToStr(AAno).PadLeft(2, '0') +
                      IntToStr(AValorDinamico).PadLeft(10, '0');

  AChaveCodificada := THwUtilsClass.Codifica(AChave);

  AChaveCodBytes   := TEncoding.ASCII.GetBytes(AChaveCodificada);

  AChaveBase64     := TNetEncoding.Base64.EncodeBytesToString(AChaveCodBytes);

  Result           := AChaveBase64;
end;

class function THwUtilsClass.Codifica(wtexto: string): string;
var
  wnormal, wcripto, wsembranco, wresultado: string;
  wtam, wi, wposicao: integer;
begin
  wsembranco := wtexto;
  wresultado := '';
  wtam := length(trim(wsembranco));
  wnormal := ' _ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-&*:\/.@!#$%|?~;Ççº{}[]<>';
  wcripto := 'œ!=#$%^&*(-|\][›?><:@Ÿ/{}¯àQWERTYUIOPASDFGHJKLZXCVBNM1324580976+ºusabcdefghijklmnopqrstuv';
  for wi := 1 to wtam do
  begin
    wposicao := pos(copy(wsembranco, wi, 1), wnormal);
    wresultado := wresultado + copy(wcripto, wposicao, 1);
  end;
  codifica := wresultado;
end;

class function THwUtilsClass.ComputadorDaRedeHwSistemas: Boolean;
var
  AFile: TStrings;
begin
  Result := False;
  try
    if THwUtilsClass.GetIni('MD', 'CHECKHOSTS', '') <> 'N' then
    begin
      AFile := TStringList.Create;
      try
        if FileExists('C:\Windows\System32\drivers\etc\hosts') then
        begin
          try
            AFile.LoadFromFile('C:\Windows\System32\drivers\etc\hosts');
            Result :=
              (Pos('hwsistemas.homelinux.com'   , LowerCase(AFile.Text)) > 0) or
              (Pos('www.hwsistemas.com.br'      , LowerCase(AFile.Text)) > 0) or
              (Pos('servidorhw.nao.enviar.colab', LowerCase(AFile.Text)) > 0);
          except
          end;
        end;
      finally
        AFile.Free;
      end;
    end;

    {
    if not Result then
    begin
      if GetIni('MD', 'APIH', '') = 'S' then //API HW em Homologação = Sim
        Result := True;
    end
    else if Result then
      if GetIni('MD', 'APIH', '') = 'N' then //API HW em Homologação = Não
        Result := False;
    }
  except
  end;
end;

class function THwUtilsClass.DecodeASCIIBase64(ATextBase64: string): string;
var
  ATextDecoded: string;
  ATextBytes: TArray<Byte>;
begin
  ATextBytes := TNetEncoding.Base64.DecodeStringToBytes(ATextBase64);

  ATextDecoded := TEncoding.ASCII.GetString(ATextBytes);

  Result := ATextDecoded;
end;

class function THwUtilsClass.EncodeASCIIBase64(AText: string): string;
var
  ATextBase64: string;
  ATextBytes: TArray<Byte>;
begin
  ATextBytes  := TEncoding.ASCII.GetBytes(AText);

  ATextBase64 := TNetEncoding.Base64.EncodeBytesToString(ATextBytes);

  Result := ATextBase64;
end;

class function THwUtilsClass.EncodeURIParameter(const Value: string): UTF8String;
const
  HexMap: UTF8String = '0123456789ABCDEF';

  function IsSafeChar(ch: Integer): Boolean;
  begin
    if      (ch >= 048) and (ch <= 057) then Result := True // 0-9
    else if (ch >= 065) and (ch <= 090) then Result := True // A-Z
    else if (ch >= 097) and (ch <= 122) then Result := True // a-z
    else if (ch = 033 )                 then Result := True // !
    else if (ch >= 039) and (ch <= 042) then Result := True // '()*
    else if (ch >= 045) and (ch <= 046) then Result := True // -.
    else if (ch = 095 )                 then Result := True // _
    else if (ch = 126 )                 then Result := True // ~
    else                                     Result := False;
  end;
var
  I, J: Integer;
  ASrcUTF8: UTF8String;
begin
  Result := '';    {Do not Localize}

  ASrcUTF8 := UTF8Encode(Value);
  // UTF8Encode call not strictly necessary but
  // prevents implicit conversion warning

  I := 1; J := 1;
  SetLength(Result, Length(ASrcUTF8) * 3); // space to %xx encode every byte
  while I <= Length(ASrcUTF8) do
  begin
    if IsSafeChar(Ord(ASrcUTF8[I])) then
    begin
      Result[J] := ASrcUTF8[I];
      Inc(J);
    end
    else if ASrcUTF8[I] = ' ' then
    begin
      Result[J] := '+';
      Inc(J);
    end
    else
    begin
      Result[J] := '%';
      Result[J+1] := HexMap[(Ord(ASrcUTF8[I]) shr 4) + 1];
      Result[J+2] := HexMap[(Ord(ASrcUTF8[I]) and 15) + 1];
      Inc(J,3);
    end;
    Inc(I);
  end;

  SetLength(Result, J-1);
end;

class function THwUtilsClass.ExtractTagXML(ATag: string; var AText: string): string;
var
  AtagIni, AtagFim: string;
  PosTagIni, PosTagFim: Integer;
begin
  AtagIni   := '<' + ATag + '>';
  AtagFim   := '<' + ATag + '/>';
  PosTagIni := Pos(AtagIni, AText);
  PosTagFim := Pos(AtagFim, AText);

  if ( PosTagIni > 0) and (PosTagFim > PosTagIni)  then
  begin
    Result := Copy(AText, PosTagIni + Length(AtagIni), PosTagFim - PosTagIni - Length(AtagIni));
    System.Delete(AText, PosTagIni, PosTagFim + Length(AtagIni));
  end
  else
    Result := '';
end;

class function THwUtilsClass.GetDictionaryFromJson(AJSONString: string): TDictionary<string, string>;
var
  AJsonArray: TJSONArray;
  AJsonCorpo: TJSONObject;
  AParCorpo: TJSONPair;
  AJsonValue: TJSONValue;
  //ADictionary: TDictionary<string, string>;
begin
  Result := TDictionary<string, string>.Create();
  AJsonArray := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(AJSONString), 0) as TJSONArray;

  for AJsonValue in AJsonArray do
  begin
    AJsonCorpo := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(AJsonValue.ToJSON), 0) as TJSONObject;
    for AParCorpo in AJsonCorpo do
       Result.Add(AParCorpo.JsonString.Value, AParCorpo.JsonValue.Value);
  end;
  Exit(Result);
end;

class function THwUtilsClass.GetFormatSettings(const AShortDateFormat: string = 'DD/MM/YYYY';
                                     const AShortTimeFormat: string = 'hh:nn:ss';
                                     const ADateSeparator: Char = '/';
                                     const ATimeSeparator: Char = ':'): TFormatSettings;
begin
  Result.DateSeparator := ADateSeparator;
  Result.TimeSeparator := ATimeSeparator;
  Result.ShortDateFormat := AShortDateFormat;
  Result.ShortTimeFormat := AShortTimeFormat;
end;

class function THwUtilsClass.GetIni(AChave, AIdentificador, AValorDefault: string): string;
var
  AFileName: string;
  AFile: TIniFile;
begin
  try
    AFileName := ExtractFilePath(ParamStr(0)) + 'hwsistemas.ini';
    if not FileExists(AFileName) then
      AFileName := ExtractFilePath(ParamStr(0)) + 'Config.ini';
    AFile := TIniFile.Create(AFileName);
    Result := AFile.ReadString(AChave, AIdentificador, AValorDefault);
  finally
    FreeAndNil(AFile);
  end;
end;

class function THwUtilsClass.GetSpecialFolderPath(folder: integer): string;
const
    SHGFP_TYPE_CURRENT = 0;
var
  APath: array[0..MAX_PATH] of Char;
begin
  if SUCCEEDED(SHGetFolderPath(0, folder, 0, SHGFP_TYPE_CURRENT, @APath[0])) then
    Result := APath
  else
    Result := 'C:\WINDOWS\TEMP';
end;

class function THwUtilsClass.IncludeTrailingBackslash(AValue: string): string;
begin
  if AValue.Trim.IsEmpty then
    Result :=  AValue + '/'
  else if AValue[Length(AValue)] = '/' then
    Result := AValue
  else
    Result := AValue + '/';
end;

class function THwUtilsClass.InputMemo(const ACaption, APrompt: string; var AValue: string): Boolean;
var
  AForm: TForm;
  APanelForm: TPanel;
  APanelMemo: TPanel;
  APanelBtns: TPanel;
  ALabelPrompt: TLabel;
  AMemoValues: TMemo;
  ABtnOK: TButton;
  ABtnCancel: TButton;
begin
  Result := False;
  AForm        := TForm.Create(Application);
  APanelForm   := TPanel.Create(AForm);
  APanelMemo   := TPanel.Create(AForm);
  APanelBtns   := TPanel.Create(AForm);
  ALabelPrompt := TLabel.Create(AForm);
  AMemoValues  := TMemo.Create(AForm);
  ABtnOK       := TButton.Create(AForm);
  ABtnCancel   := TButton.Create(AForm);

  try
    try
      APanelForm.Parent         := AForm;
      APanelForm.Height         := 200;
      APanelForm.Width          := 400;
      APanelForm.BevelOuter     := bvNone;
      APanelForm.BorderWidth    := 8;
      APanelForm.Caption        := '';

      AForm.AutoSize            := True;
      AForm.Position            := poScreenCenter;
      AForm.BorderIcons         := [biSystemMenu];

      ALabelPrompt.Parent       := APanelForm;
      ALabelPrompt.Align        := alTop;

      APanelMemo.Parent         := APanelForm;
      APanelMemo.Align          := alClient;
      APanelMemo.BevelOuter     := bvNone;
      APanelMemo.Padding.Top    := 6;
      APanelMemo.Padding.Bottom := 6;
      APanelMemo.Caption        := '';

      AMemoValues.Parent        := APanelMemo;
      AMemoValues.Align         := alClient;

      APanelBtns.Parent         := APanelForm;
      APanelBtns.Align          := alBottom;
      APanelBtns.BevelKind      := bkTile;
      APanelBtns.BevelOuter     := bvNone;
      APanelBtns.Caption        := '';

      ABtnOK.Parent             := APanelBtns;
      ABtnOK.Left               := 112;
      ABtnOK.Top                := 6;
      ABtnOK.Caption            := '&OK';
      ABtnOK.ModalResult        := mrOk;

      ABtnCancel.Parent         := APanelBtns;
      ABtnCancel.Left           := 193;
      ABtnCancel.Top            := 6;
      ABtnCancel.Caption        := '&Cancelar';
      ABtnCancel.ModalResult    := mrCancel;

      ///// Atribuindo parametros

      AForm.Caption             := ACaption;
      ALabelPrompt.Caption      := Trim(APrompt);
      ALabelPrompt.WordWrap     := True;

      AMemoValues.Clear;
      AMemoValues.Lines.Add(AValue);
      AMemoValues.SelectAll;

      if AForm.ShowModal = mrOk then
      begin
        Result := True;
        AValue := AMemoValues.Lines.Text;
      end;

    except on E: Exception do
      begin
        Application.MessageBox( PWideChar(e.message), 'Erro', MB_OK + MB_ICONERROR);
      end;
    end;
  finally
    FreeAndNil(ABtnCancel);
    FreeAndNil(ABtnOK);
    FreeAndNil(AMemoValues);
    FreeAndNil(ALabelPrompt);
    FreeAndNil(APanelBtns);
    FreeAndNil(APanelMemo);
    FreeAndNil(APanelForm);
    FreeAndNil(AForm);
  end;
end;

class function THwUtilsClass.JsonToArrayJson(AJSONValue: TJSONValue): TJSONArray;
begin
  Result := TJSONObject.ParseJSONValue(
              TEncoding.UTF8.GetBytes(TJson.JsonEncode(AJSONValue)), 0) as TJSONArray;
end;

class procedure THwUtilsClass.RegistraErro(AError, AFileName: string);
var
  ATextFile: TextFile;
  AText: string;
begin
  AFileName := IfThen( AFileName.IsEmpty, ExtractFilePath(Application.Exename) + 'erros.log', AFileName);
  try
    AssignFile(ATextFile, AFileName);
    try
      if not FileExists(AFileName) then
        Rewrite(ATextFile)
      else
        Append(ATextFile);
      AText := 'ERRO: ' + AError + ' Dia: ' + DateToStr(Date) + ' Hora: ' + TimeToStr(Time) + ' ' + 'hw.utils.dx.dll';
      WriteLn(ATextFile, AText);
    finally
      CloseFile(ATextFile);
    end;
  except
  end;
end;

class function THwUtilsClass.ReplaceCaracteresEspeciais(AValue: string): string;
var
  AChar, AResultado: Char;
begin
   Result := '';
   for AChar in AValue do
   begin
      case AChar of
         'á', 'â', 'ã', 'à', 'ä', 'å' : AResultado := 'a';
         'Á', 'Â', 'Ã', 'À', 'Ä', 'Å' : AResultado := 'A';
         'é', 'ê', 'è', 'ë'           : AResultado := 'e';
         'É', 'Ê', 'È', 'Ë'           : AResultado := 'E';
         'í', 'î', 'ì', 'ï'           : AResultado := 'i';
         'Í', 'Î', 'Ì', 'Ï'           : AResultado := 'I';
         'ó', 'ô', 'õ', 'ò', 'ö'      : AResultado := 'o';
         'Ó', 'Ô', 'Õ', 'Ò', 'Ö'      : AResultado := 'O';
         'ú', 'û', 'ù', 'ü'           : AResultado := 'u';
         'Ú', 'Û', 'Ù', 'Ü'           : AResultado := 'U';
         'ç'                          : AResultado := 'c';
         'Ç'                          : AResultado := 'C';
         'ñ'                          : AResultado := 'n';
         'Ñ'                          : AResultado := 'N';
         'ý', 'ÿ'                     : AResultado := 'y';
         'Ý', 'Y'                     : AResultado := 'Y';
         '<', '>'                     : AResultado := '.';
      else
                                        AResultado := AChar;
      end;
      Result := Result + AResultado;
   end;
end;

class function THwUtilsClass.SetIni(AChave, AIdentificador, AValue: string): Boolean;
var
  AFileName: string;
  AFile: TIniFile;
begin
  try

    try

      AFileName := ExtractFilePath(ParamStr(0)) + 'hwsistemas.ini';
      if not FileExists(AFileName) then
        AFileName := ExtractFilePath(ParamStr(0)) + 'Config.ini';
      AFile := TIniFile.Create(AFileName);
      AFile.WriteString(AChave, AIdentificador, AValue);
      Result := True;

    finally
      FreeAndNil(AFile);
    end;

  except
    Result := False;
  end;
end;

class function THwUtilsClass.ShowAtencao(AValue: string; AFlags: Integer): Integer;
begin
  Result := Application.MessageBox(PChar(AValue), 'Atenção', AFlags);
end;

class function THwUtilsClass.ShowConfirmacao(AValue: string; AFlags: Integer): Integer;
begin
  Result := Application.MessageBox(PChar(AValue), 'Confirmação', AFlags);
end;

class function THwUtilsClass.ShowErro(AValue: string; AFlags: Integer): Integer;
begin
  Result := Application.MessageBox(PChar(AValue), 'Erro', AFlags);
end;

class function THwUtilsClass.getCampoPipe(plinha: string; pOrdem: integer;
  pDelimitador: string): string;
var
  vTemp: string;
  vInc: Smallint;
begin
  vTemp := plinha;
  vInc := 0;
  while pos(pDelimitador, vTemp) > 0 do
  begin
    inc(vInc);
    if pOrdem = vInc then
    begin
      vTemp := Copy(vTemp, 1, pos(pDelimitador, vTemp) - 1);
      Result := Trim(vTemp);
      exit;
    end;
    vTemp := Copy(vTemp, pos(pDelimitador, vTemp) + 1, length(vTemp));
  end;
  Result := '';
end;

{ THwUtilsClassDB }

class procedure THwUtilsClassDB.SetParamVal(AQuery: TIBQuery; AFieldName: string;
  Value: Integer; Nullable: Boolean);
begin
  if (Value = 0) and (Nullable) then
    AQuery.ParamByName(AFieldName).Value := Unassigned
  else
    AQuery.ParamByName(AFieldName).Value := Value;
end;

class procedure THwUtilsClassDB.SetParamVal(AQuery: TIBQuery; AFieldName: string;
  Value: Double; ATipoData, Nullable: Boolean);
begin
  if (Value = 0) and (Nullable) then
    AQuery.ParamByName(AFieldName).Value := Unassigned
  else if ATipoData then
    AQuery.ParamByName(AFieldName).AsDateTime := DateOf(Value) + TimeOf(Value)
  else
    AQuery.ParamByName(AFieldName).AsFloat := Value;
end;

class procedure THwUtilsClassDB.SetParamVal(AQuery: TIBQuery; AFieldName: string;
  Value: Boolean; TrueValue, FalseValue: string; ALength: Integer);
begin
  AQuery.ParamByName(AFieldName).AsString := Copy(string(IfThen(Value, TrueValue, FalseValue)), 1, ALength);
end;

class procedure THwUtilsClassDB.SetParamVal(AQuery: TIBQuery; AFieldName,
  Value: string; ALength: Integer; Nullable, AUpper: Boolean);
begin
  if AUpper then
    Value := UpperCase(Value);
  if (Value = '') and (Nullable) then
    AQuery.ParamByName(AFieldName).Value := Unassigned
  else
    AQuery.ParamByName(AFieldName).AsString := Copy(Value, 1, ALength);
end;

end.
