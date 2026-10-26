unit hw.nfe.export.dx;

interface

implementation

uses
  System.SysUtils,
  System.Classes,
  Vcl.Dialogs,
  uHandleFileACBrNFeServicos,
  hw_utils,
  HelperDFe,
  hw.nfe.classes.dx;

function nfe_autorizar(Acod_nf: array of Integer; Acod_empresa: Longint; AdbName: WideString; var Aerros: WideString): Boolean; stdcall;
var
  Anfe: THwCentralNFe;
begin
  HandleFileACBrNFeServicos;

  Anfe := THwCentralNFe.create;
  try
    Anfe.cod_empresa := Acod_empresa;
    Anfe.dbName      := AdbName;

    Result := Anfe.nfe_autorizar(Acod_nf);

    Aerros := Anfe.listError.Text;

  finally
    FreeAndNil(Anfe);
  end;
end;

function nfe_imprimir(Acod_nf: array of Integer; Aprint, AsavePDF: Boolean; ApathPDF: WideString; Acod_empresa: Longint; AdbName: WideString; var Aerros: WideString): Boolean; stdcall;
var
  Anfe: THwCentralNFe;
begin
  Anfe := THwCentralNFe.create;
  try
    Anfe.cod_empresa := Acod_empresa;
    Anfe.dbName      := AdbName;

    Result := Anfe.nfe_imprimir(Acod_nf, Aprint, AsavePDF, ApathPDF, '');

    Aerros := Anfe.listError.Text;

  finally
    FreeAndNil(Anfe);
  end;
end;

function nfe_print(Acod_nf: array of Integer; params: WideString; var Aerros: WideString): Boolean; stdcall;
var
  Anfe: THwCentralNFe;
  list: TStrings;
begin

  Anfe := THwCentralNFe.create;
  list := NewStringList(True, params, ';');

  try
    Anfe.cod_empresa := StrToInt(list.Values['empresaId']);
    Anfe.dbName      := list.Values['databaseName'];
    var print        := StrToBool(list.Values['print']);
    var savePDF      := StrToBool(list.Values['savePDF']);
    var pathPDF      := list.Values['pathPDF'];

    Result := Anfe.nfe_imprimir(Acod_nf, print, savePDF, pathPDF, list.Values['tipoDANFe']);

    Aerros := Anfe.listError.Text;

  finally
    list.Free;
    FreeAndNil(Anfe);
  end;
end;

function nfe_email(Acod_nf: array of Integer; AemailUnico, AcomEventos, AcomPDF, AcomBol: Boolean; Aemail, Aanexos: WideString; Acod_empresa: Longint; AdbName, Ausuario: WideString; var Aerros: WideString): Boolean; stdcall;
var
  Anfe: THwCentralNFe;
begin
  Anfe := THwCentralNFe.create;
  try
    Anfe.cod_empresa := Acod_empresa;
    Anfe.dbName      := AdbName;
    Anfe.Usuario     := Ausuario;

    Result := Anfe.nfe_email(Acod_nf, AemailUnico, AcomEventos, AcomPDF, AcomBol, Aemail, Aanexos);

    Aerros := Anfe.listError.Text;

  finally
    FreeAndNil(Anfe);
  end;
end;

function nfe_consultar(Acod_nf: array of Integer; Acod_empresa: Longint; AdbName: WideString; var Aerros: WideString): Boolean; stdcall;
var
  Anfe: THwCentralNFe;
begin
  Anfe := THwCentralNFe.create;
  try
    Anfe.cod_empresa := Acod_empresa;
    Anfe.dbName      := AdbName;

    Result := Anfe.nfe_consultar(Acod_nf);

    Aerros := Anfe.listError.Text;

  finally
    FreeAndNil(Anfe);
  end;
end;

function nfe_status_servico(AtpEmiss: WideString; Acod_empresa: Longint; AdbName: WideString; var Aerros: WideString): Boolean; stdcall;
var
  Anfe: THwCentralNFe;
begin
  Anfe := THwCentralNFe.create;
  try
    Anfe.cod_empresa := Acod_empresa;
    Anfe.dbName      := AdbName;

    Result := Anfe.nfe_status_servico(AtpEmiss);

    Aerros := Anfe.listError.Text;

  finally
    FreeAndNil(Anfe);
  end;
end;

function nfe_inutilizacao_enviar(Aseqid: Integer; Acod_empresa: Longint; AdbName: WideString; var Aerros: WideString): Boolean; stdcall;
var
  Anfe: THwCentralNFe;
begin
  Anfe := THwCentralNFe.create;
  try
    Anfe.cod_empresa := Acod_empresa;
    Anfe.dbName      := AdbName;

    Result := Anfe.nfe_inutilizacao_enviar(Aseqid);

    Aerros := Anfe.listError.Text;

  finally
    FreeAndNil(Anfe);
  end;
end;

function nfe_inutilizacao_imprimir(Aseqid: Integer; Aprint, AsavePDF: Boolean; ApathPDF: WideString; Acod_empresa: Longint; AdbName: WideString; var Aerros: WideString): Boolean; stdcall;
var
  Anfe: THwCentralNFe;
begin
  Anfe := THwCentralNFe.create;
  try
    Anfe.cod_empresa := Acod_empresa;
    Anfe.dbName      := AdbName;

    Result := Anfe.nfe_inutilizacao_imprimir(Aseqid, Aprint, AsavePDF, ApathPDF);

    Aerros := Anfe.listError.Text;

  finally
    FreeAndNil(Anfe);
  end;
end;

function nfe_inutilizacao_email(Aseqid: array of Integer; Aemail, Aanexos: WideString; Acod_empresa: Longint; AdbName: WideString; var Aerros: WideString): Boolean; stdcall;
var
  Anfe: THwCentralNFe;
begin
  Anfe := THwCentralNFe.create;
  try
    Anfe.cod_empresa := Acod_empresa;
    Anfe.dbName      := AdbName;

    Result := Anfe.nfe_inutilizacao_email(Aseqid, Aemail, Aanexos);

    Aerros := Anfe.listError.Text;

  finally
    FreeAndNil(Anfe);
  end;
end;

function nfe_evento_enviar(Acod_nf, Alote: Integer; Acod_empresa: Longint; AdbName: WideString; var Aerros: WideString): Boolean; stdcall;
var
  Anfe: THwCentralNFe;
begin
  Anfe := THwCentralNFe.create;
  try
    Anfe.cod_empresa := Acod_empresa;
    Anfe.dbName      := AdbName;

    Result := Anfe.nfe_evento_enviar(Acod_nf, Alote);

    Aerros := Anfe.listError.Text;

  finally
    FreeAndNil(Anfe);
  end;
end;

function nfe_evento_imprimir(Acod_nf, Alote: Integer; Aprint, AsavePDF: Boolean; ApathPDF: WideString; Acod_empresa: Longint; AdbName: WideString; var Aerros: WideString): Boolean; stdcall;
var
  Anfe: THwCentralNFe;
begin
  Anfe := THwCentralNFe.create;
  try
    Anfe.cod_empresa := Acod_empresa;
    Anfe.dbName      := AdbName;

    Result := Anfe.nfe_evento_imprimir(Acod_nf, Alote, Aprint, AsavePDF, ApathPDF);

    Aerros := Anfe.listError.Text;

  finally
    FreeAndNil(Anfe);
  end;
end;

function nfe_evento_email(Acod_nf, Alote: Integer; Aemail, Aanexos: WideString; Acod_empresa: Longint; AdbName: WideString; var Aerros: WideString): Boolean; stdcall;
var
  Anfe: THwCentralNFe;
begin
  Anfe := THwCentralNFe.create;
  try
    Anfe.cod_empresa := Acod_empresa;
    Anfe.dbName      := AdbName;

    Result := Anfe.nfe_evento_email(Acod_nf, Alote, Aemail, Aanexos);

    Aerros := Anfe.listError.Text;

  finally
    FreeAndNil(Anfe);
  end;
end;

function nfe_atualizar_valores_xml(codigos_nf: array of Integer; cod_empresa: Longint; dbName: WideString; var Aerros: WideString): Integer; stdcall;
var
  Anfe: THwCentralNFe;
begin
  Anfe := THwCentralNFe.create;
  try
    Anfe.cod_empresa := cod_empresa;
    Anfe.dbName      := dbName;

    Result := Anfe.nfe_atualizar_valores_xml(codigos_nf);

    Aerros := Anfe.listError.Text;

  finally
    FreeAndNil(Anfe);
  end;

end;

function dfe_dados_certificado(cod_empresa: Longint; dbName, modelo: WideString; var Aerros: WideString): WideString; stdcall;
var
  Anfe: THwCentralNFe;
begin
  Anfe := THwCentralNFe.create;
  try
    Anfe.cod_empresa := cod_empresa;
    Anfe.dbName      := dbName;

    Result := Anfe.dfe_dados_certificado(modelo);

    Aerros := Anfe.listError.Text;

  finally
    FreeAndNil(Anfe);
  end;

end;

function file_open_dialog(var Afolter: WideString): Boolean; stdcall;
var
  Afileopen: TFileOpenDialog;
begin
  Result := False;
  Afileopen := TFileOpenDialog.Create(nil);
  try
    Afileopen.DefaultFolder := Afolter;
    Afileopen.Options := [fdoPickFolders];
    Afileopen.Title         := 'Selecione o diretório';

    Result := Afileopen.Execute;
    if Result then
      Afolter := Afileopen.FileName;

  finally
    FreeAndNil(Afileopen);
  end;
end;

function cert_obter_dados(Parametros: WideString): WideString; stdcall;
var
  certData: TCertificateData;
  Leitor: TStringList;
begin
  certData := TCertificateData.Create();
  Leitor := TStringList.Create;
  try
    Leitor.Text := Parametros;

    certData.FileName     := Leitor.Values['FileName'];
    certData.SerialNumber := Leitor.Values['SerialNumber'];
    certData.Password     := Leitor.Values['Password'];
    certData.Base64PFX    := Leitor.Values['Base64PFX'];

    Result := THelperDFe.GetCertificateData(certData);

  finally
    Leitor.Free();
    certData.Free();
  end;
end;

function nfe_anexos(Acod_nf: array of Integer; params: WideString): WideString; stdcall;
var
  Anfe: THwCentralNFe;
  list: TStrings;
begin

  Anfe := THwCentralNFe.create;
  list := NewStringList(True, params, ';');

  try try
    Anfe.cod_empresa := StrToInt(list.Values['empresaId']);
    Anfe.dbName      := list.Values['databaseName'];
    var comPDF       := StrToBool(list.Values['ComPDF']);
    var comEventos   := StrToBool(list.Values['ComEventos']);
    var comBoletos   := StrToBool(list.Values['ComBoletos']);

    Result := Anfe.nfe_anexos(Acod_nf, comPDF, comEventos, comBoletos);

  except on E: Exception do
    Result := 'ERROR|' + E.Message;
  end;
  finally
    list.Free;
    FreeAndNil(Anfe);
  end;
end;

function nfe_anexos_csharp(CodigoNF: Integer; Params: WideString; var AResultado: WideString): Integer; stdcall;
var
  CodigosNF: array of Integer;
begin
  CodigosNF := [ CodigoNF ];

  AResultado := nfe_anexos(CodigosNF, Params);

  if string(AResultado).Substring(0,6) = 'ERROR|' then
    Result := 0
  else
    Result := 1;
end;

function nfe_anexos_csharp_buffer(CodigoNF: Integer; Params: WideString; var AResultado: PAnsiChar; var AResultadoSize: Integer): Integer; stdcall;
var
  CodigosNF: array of Integer;
  Resposta: AnsiString;
begin
  CodigosNF := [ CodigoNF ];

  Resposta := nfe_anexos(CodigosNF, Params);

  if Assigned(AResultado) and (AResultadoSize >= Length(Resposta) + 1) then
  begin //StrLCopy(AResultado, PAnsiChar(Resposta), AResultadoSize - 1);
    StrPCopy(AResultado, PAnsiChar(Resposta));
    if string(AResultado).Substring(0,6) = 'ERROR|' then
      Result := 0
    else
      Result := 1;
  end
  else
    Result := 0;

  AResultadoSize := Length(Resposta) + 1;
end;

function nfe_converter_em_contingencia(CodigoNF: Integer; EmpresaId: Integer; AdbName: WideString; var Aerros: WideString): Boolean; stdcall;
var
  Anfe: THwCentralNFe;
begin
  HandleFileACBrNFeServicos;

  Anfe := THwCentralNFe.create;
  try try
    Anfe.cod_empresa := EmpresaId;
    Anfe.dbName      := AdbName;

    Aerros := '';

    Result := Anfe.nfe_converter_em_contingencia(CodigoNF);

  except on E: Exception do
    begin
      Result := False;
      Aerros := E.Message;

      Anfe.registraErro('nfe_converter_em_contingencia' + e.Message);
    end;
  end;
  finally
    FreeAndNil(Anfe);
  end;
end;

function nfe_resolver_pendencia_sefaz(CodigoNF: Integer; EmpresaId: Integer; AdbName: WideString; var Aerros: WideString): Boolean; stdcall;
var
  Anfe: THwCentralNFe;
begin
  HandleFileACBrNFeServicos;

  Anfe := THwCentralNFe.create;
  try try
    Anfe.cod_empresa := EmpresaId;
    Anfe.dbName      := AdbName;

    Aerros := '';

    Result := Anfe.nfe_resolver_pendencia_sefaz(CodigoNF);

  except on E: Exception do
    begin
      Result := False;
      Aerros := E.Message;

      Anfe.registraErro('nfe_converter_em_contingencia' + e.Message);
    end;
  end;
  finally
    FreeAndNil(Anfe);
  end;
end;

exports
  nfe_autorizar,
  nfe_imprimir,
  nfe_print,
  nfe_email,
  nfe_consultar,
  nfe_status_servico,
  nfe_inutilizacao_enviar,
  nfe_inutilizacao_imprimir,
  nfe_inutilizacao_email,
  nfe_evento_enviar,
  nfe_evento_imprimir,
  nfe_evento_email,
  nfe_atualizar_valores_xml,
  nfe_anexos,
  nfe_anexos_csharp,
  nfe_anexos_csharp_buffer,
  nfe_converter_em_contingencia,
  nfe_resolver_pendencia_sefaz,
  dfe_dados_certificado,
  cert_obter_dados,
  file_open_dialog;

end.
