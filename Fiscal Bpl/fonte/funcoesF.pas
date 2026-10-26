unit funcoesF;

interface

uses
  Forms, Classes, UPadrao;

function AbreForm(NomeBPL, nomeForm: string; var pNumPacote: THandle): TForm;
function AbreFormPadrao(NomeBPL, nomeForm: string; var pNumPacote: THandle): TFrmPadrao;
function AbreDataModule(NomeBPL, nomeForm: string; var pNumPacote: THandle): TDataModule;
function CarregaPacote(NomeBPL: string; var pNumPacote: THandle): boolean;
function verificaArquivoIni: boolean;

var
  nomePacote: string;

implementation

uses
  IniFiles, SysUtils;

function AbreForm(NomeBPL, nomeForm: string; var pNumPacote: THandle): TForm;
var
  sPacote: string;
  hPacote: THandle;
  aClass: TPersistentClass;
  frmTela: TForm;
  frDtm: TDatamodule;
begin
  sPacote := ExtractFilePath(ParamStr(0)) + NomeBPL + '.bpl';
  if not FileExists(sPacote) then
    raise Exception.Create('Pacote ' + NomeBPL + ' não existe.');

  hPacote := LoadPackage(sPacote);
  if hPacote <> 0 then
  begin
    aClass := GetClass(nomeForm);
    Application.CreateForm(TComponentClass(aClass), frmTela);
  end
  else
  begin
    raise Exception.Create('Ocorreu um erro ao carregar o pacote: ' + sPacote);
  end;
  pNumPacote := hPacote;
  Result := frmTela;
end;

function AbreDataModule(NomeBPL, nomeForm: string; var pNumPacote: THandle): TDataModule;
var
  sPacote: string;
  hPacote: THandle;
  aClass: TDataModule;
  frDtm: TDatamodule;
begin
  sPacote := ExtractFilePath(ParamStr(0)) + NomeBPL + '.bpl';
  if not FileExists(sPacote) then
    raise Exception.Create('Pacote ' + NomeBPL + ' não existe.');

  hPacote := LoadPackage(sPacote);
  if hPacote <> 0 then
  begin
    aClass := TDataModule(GetClass(nomeForm));
    if Assigned(aClass) then
      frdtm := TDataModule.Create(Application);
  end
  else
  begin
    raise Exception.Create('Ocorreu um erro ao carregar o pacote: ' + sPacote);
  end;
  pNumPacote := hPacote;
  Result := frDtm;
end;

function CarregaPacote(NomeBPL: string; var pNumPacote: THandle): boolean;
var
  sPacote: string;
  hPacote: THandle;
  aClass: TPersistentClass;
begin
  try
    result := true;
    sPacote := ExtractFilePath(ParamStr(0)) + NomeBPL + '.bpl';
    if not FileExists(sPacote) then
    begin
      raise Exception.Create('Arquivo bpl não existe.');
    end;
    hPacote := LoadPackage(sPacote);
    pNumPacote := hPacote;
    Result := true;
  except;
    result := false;
  end;
end;

function verificaArquivoIni: boolean;
var
  arquivo: TIniFile;
  nomeArquivo: string;
begin
  try
    result := false;
    nomeArquivo := ExtractFilePath(Application.Exename) + 'hwsistemas.ini';
    if FileExists(nomeArquivo) then
    begin
      try
        arquivo := TIniFile.Create(nomeArquivo);
        nomePacote := arquivo.ReadString('Pacote', 'fileName', '');
        result := true;
      finally
        arquivo.Free;
      end;
    end;
  except
    result := false;
  end;

end;

function AbreFormPadrao(NomeBPL, nomeForm: string; var pNumPacote: THandle): TFrmPadrao;
var
  sPacote: string;
  hPacote: THandle;
  aClass: TPersistentClass;
  frmTela: TFrmPadrao;
  frDtm: TDatamodule;
begin
  sPacote := ExtractFilePath(ParamStr(0)) + NomeBPL + '.bpl';
  if not FileExists(sPacote) then
    raise Exception.Create('Pacote ' + NomeBPL + ' não existe.');

  hPacote := LoadPackage(sPacote);
  if hPacote <> 0 then
  begin
    aClass := GetClass(nomeForm);
    Application.CreateForm(TComponentClass(aClass), frmTela);
  end
  else
  begin
    raise Exception.Create('Ocorreu um erro ao carregar o pacote: ' + sPacote);
  end;
  pNumPacote := hPacote;
  Result := frmTela;
end;

end.

