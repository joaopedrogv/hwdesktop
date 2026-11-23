unit EventoDFeStatusUnit;

interface

type
  TStatusEventoDFe = (sePendente, seEnviando, seAutorizado, seRejeitado);

const
  STATUS_EVENTO_DFE: array [TStatusEventoDFe] of string = (
    'PENDENTE', 'ENVIANDO', 'AUTORIZADO', 'REJEITADO');

function StatusEventoDFeParaTexto(const AStatus: TStatusEventoDFe): string;
function TextoParaStatusEventoDFe(const ATexto: string): TStatusEventoDFe;
function TryTextoParaStatusEventoDFe(const ATexto: string;
  out AStatus: TStatusEventoDFe): Boolean;

implementation

uses
  SysUtils;

function StatusEventoDFeParaTexto(const AStatus: TStatusEventoDFe): string;
begin
  Result := STATUS_EVENTO_DFE[AStatus];
end;

function TryTextoParaStatusEventoDFe(const ATexto: string;
  out AStatus: TStatusEventoDFe): Boolean;
var
  LStatus: TStatusEventoDFe;
begin
  for LStatus := Low(TStatusEventoDFe) to High(TStatusEventoDFe) do
    if SameText(STATUS_EVENTO_DFE[LStatus], ATexto) then
    begin
      AStatus := LStatus;
      Exit(True);
    end;

  Result := False;
end;

function TextoParaStatusEventoDFe(const ATexto: string): TStatusEventoDFe;
begin
  if not TryTextoParaStatusEventoDFe(ATexto, Result) then
    raise Exception.CreateFmt('Status de evento DF-e desconhecido: %s', [ATexto]);
end;

end.
