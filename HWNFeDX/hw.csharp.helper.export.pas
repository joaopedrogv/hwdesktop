unit hw.csharp.helper.export;

interface

uses
  //uDLL_ClassesNFC,
  System.SysUtils;

var
  LastError: string;

implementation

uses
  uHelperPosPrinter;

function CSharpHelperPrintNFCe(XMLAut, XMLCanc, confName, confFile, nfceConfName, nfceConfFile, paramsAdd: PWideString): Integer; stdcall;
begin
  Result := 0;
  LastError := '';
  var helper := THelperPosPrinter.Create;
  try
    if helper.SaveConfFile(string(confName), string(confFile)) then
      if helper.SaveConfFile(string(nfceConfName), string(nfceConfFile)) then
        Result := helper.PrintNFCe(string(XMLAut), string(XMLCanc), string(confName), string(nfceConfName), string(paramsAdd));

    LastError := helper.lastError;

  finally
    helper.Free;
  end;
end;

function CSharpHelperOpenDrawer(confName, confFile, nfceConfName, nfceConfFile: PWideString): Integer; stdcall;
begin
  Result := 0;
  LastError := '';
  var helper := THelperPosPrinter.Create;
  try
    if helper.SaveConfFile(string(confName), string(confFile)) then
      if helper.SaveConfFile(string(nfceConfName), string(nfceConfFile)) then
        Result := helper.OpenDrawer(Format('confName=%s;nfceConfName=%s',[string(confName), string(nfceConfName)]));

    LastError := helper.lastError;

  finally
    helper.Free;
  end;
end;

function CSharpHelperLastError(var resp: PWideChar; var BufferSize: Integer ): Boolean; stdcall;
begin
  try
    StrLCopy(resp, PWideChar(LastError), BufferSize - 1);
    Result := True;
  except on E: Exception do
    Result := False;
  end;
end;

//usado pelo agente para comunicar com impressoras nao fiscais
exports
  CSharpHelperPrintNFCe,
  CSharpHelperOpenDrawer,
  CSharpHelperLastError;

end.
