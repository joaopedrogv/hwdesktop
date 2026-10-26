unit WebServiceResponseTypesUnit;

interface

uses
  SysUtils, Classes;

type
  WSResultado = ( wsFalhaComunicacao, wsFalhaImplementacao, wsSucesso, wsRejeicao, wsEmProcessamento );

  WSErro = record
  private
    FCodigo: string;
    FMensagem: string;
    FCorrecao: string;
  public
    class function Create(const Codigo, Mensagem, Correcao: string): WSErro; static;
    property Codigo: string read FCodigo;
    property Mensagem: string read FMensagem;
    property Correcao: string read FCorrecao;
  end;

  WSErros = array of WSErro;

  WSResposta = record
  private
    FResultado: WSResultado;
    FErros: WSErros;
    FProtocolo: string;
  public
    class function Create(
      Resultado: WSResultado;
      const Erros: WSErros;
      const Protocolo: string
    ): WSResposta; static;

    property Resultado: WSResultado read FResultado;
    property Erros: WSErros read FErros;
    property Protocolo: string read FProtocolo;
  end;

  WSErrorSerializer = class
  public
    class function Serialize(const Erros: WSErros): string; static;
    class function Deserialize(const Texto: string): WSErros; static;
    class function FormatarMensagem(const Erros: WSErros): string; static;
  private
    class function Escape(const S: string): string; static;
    class function Unescape(const S: string): string; static;
  end;

implementation

{ WSResposta }

uses TipoComunsUnit;

class function WSResposta.Create(
  Resultado: WSResultado;
  const Erros: WSErros;
  const Protocolo: string
): WSResposta;
begin
  Result.FResultado := Resultado;
  Result.FErros := Erros;
  Result.FProtocolo := Protocolo;
end;

{ WSErrorSerializer }

class function WSErrorSerializer.Escape(const S: string): string;
begin
  Result := StringReplace(S, '\', '\\', [rfReplaceAll]);
  Result := StringReplace(Result, '|', '\|', [rfReplaceAll]);
  Result := StringReplace(Result, #13#10, '\n', [rfReplaceAll]);
  Result := StringReplace(Result, #13, '\r', [rfReplaceAll]); //
  Result := StringReplace(Result, #10, '\n', [rfReplaceAll]); //
end;

class function WSErrorSerializer.FormatarMensagem(const Erros: WSErros): string;
var
  I: Integer;
  Linha: string;
begin
  Result := '';
  for I := 0 to High(Erros) do
  begin
    if I > 0 then
      Result := Result + sLineBreak;
    Linha := Format('[%s - %s -%s]',
      [ Erros[I].Codigo, Erros[I].Mensagem, Erros[I].Correcao ]
    );
    Result := Result + Linha;
  end;
end;

class function WSErrorSerializer.Unescape(const S: string): string;
begin
  Result := S;
  Result := StringReplace(Result, '\n', #13#10, [rfReplaceAll]);
  Result := StringReplace(Result, '\r', #13, [rfReplaceAll]);
  Result := StringReplace(Result, '\|', '|', [rfReplaceAll]);
  Result := StringReplace(Result, '\\', '\', [rfReplaceAll]);
end;

class function WSErrorSerializer.Serialize(const Erros: WSErros): string;
var
  I: Integer;
  Linha: string;
begin
  Result := '';
  for I := 0 to High(Erros) do
  begin
    if I > 0 then
      Result := Result + sLineBreak;
    Linha := Format('%s|%s|%s',
      [Escape(Erros[I].Codigo),
       Escape(Erros[I].Mensagem),
       Escape(Erros[I].Correcao)]);
    Result := Result + Linha;
  end;
end;

class function WSErrorSerializer.Deserialize(const Texto: string): WSErros;
var
  I, Start, Pos: Integer;
  Linha: string;
  Partes: array[0..2] of string;
  ParteIdx: Integer;
  Ch: Char;
  InEscape: Boolean;
  Current: string;
begin
  SetLength(Result, 0);
  if Texto = '' then
    Exit;

  // Dividir linhas manualmente
  I := 1;
  while I <= Length(Texto) do
  begin
    Start := I;
    while (I <= Length(Texto)) and (Texto[I] <> #13) and (Texto[I] <> #10) do
      Inc(I);
    Linha := Copy(Texto, Start, I - Start);

    // Pular quebras de linha
    if (I <= Length(Texto)) and (Texto[I] = #13) then Inc(I);
    if (I <= Length(Texto)) and (Texto[I] = #10) then Inc(I);

    if Linha = '' then
      Continue;

    // Parse da linha: até 3 partes separadas por |
    Partes[0] := ''; Partes[1] := ''; Partes[2] := '';
    ParteIdx := 0;
    Current := '';
    InEscape := False;

    for Pos := 1 to Length(Linha) do
    begin
      Ch := Linha[Pos];
      if InEscape then
      begin
        Current := Current + Ch;
        InEscape := False;
      end
      else if Ch = '\' then
        InEscape := True
      else if (Ch = '|') and (ParteIdx < 2) then
      begin
        Partes[ParteIdx] := Current;
        Inc(ParteIdx);
        Current := '';
      end
      else
        Current := Current + Ch;
    end;
    Partes[ParteIdx] := Current;

    SetLength(Result, Length(Result) + 1);
    Result[High(Result)] := WSErro.Create(
      Unescape(Partes[0]),
      Unescape(Partes[1]),
      Unescape(Partes[2])
    );
  end;
end;

{ WSErro }

class function WSErro.Create(const Codigo, Mensagem, Correcao: string): WSErro;
begin
  Result.FCodigo := Codigo;
  Result.FMensagem := Mensagem;
  Result.FCorrecao := Correcao;
end;

end.
