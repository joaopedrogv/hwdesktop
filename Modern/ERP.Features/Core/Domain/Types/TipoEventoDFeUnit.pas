unit TipoEventoDFeUnit;

interface

type
  TFamiliaDocumentoDFe = (fdNFe = 1, fdNFCe = 2, fdNFSe = 3);

  TipoEventoDFe = (
    teAtualizacaoPrevisaoEntrega = 112150,
    teImobilizacaoItem = 211130
  );

  TipoEventoDFeArray = array of TipoEventoDFe;

function FamiliaDocumentoDFeDisplay(const AFamilia: TFamiliaDocumentoDFe): string;
function FamiliaDocumentoDFeCodigo(const AFamilia: TFamiliaDocumentoDFe): Integer;
function FamiliaDocumentoDFeFromCodigo(ACodigo: Integer): TFamiliaDocumentoDFe;
function TipoEventoDFeDisplay(const ATipo: TipoEventoDFe): string;
function TipoEventoDFeSuportado(ACodigo: Integer): Boolean;
function TipoEventoDFeFromCodigo(ACodigo: Integer): TipoEventoDFe;
function TipoEventoDFeCodigo(const ATipo: TipoEventoDFe): Integer;
function TipoEventoDFeTpAutor(const ATipo: TipoEventoDFe): Integer;
function TipoEventoDFeOpcoes: TipoEventoDFeArray;

implementation

uses
  SysUtils;

function FamiliaDocumentoDFeDisplay(const AFamilia: TFamiliaDocumentoDFe): string;
begin
  case AFamilia of
    fdNFe: Result := 'NF-e';
    fdNFCe: Result := 'NFC-e';
    fdNFSe: Result := 'NFS-e';
  else
    Result := 'Documento desconhecido';
  end;
end;

function FamiliaDocumentoDFeCodigo(const AFamilia: TFamiliaDocumentoDFe): Integer;
begin
  Result := Ord(AFamilia);
end;

function FamiliaDocumentoDFeFromCodigo(ACodigo: Integer): TFamiliaDocumentoDFe;
begin
  case ACodigo of
    1: Result := fdNFe;
    2: Result := fdNFCe;
    3: Result := fdNFSe;
  else
    raise Exception.CreateFmt('Família de documento DF-e inválida: %d', [ACodigo]);
  end;
end;

function TipoEventoDFeDisplay(const ATipo: TipoEventoDFe): string;
begin
  case ATipo of
    teAtualizacaoPrevisaoEntrega: Result := 'Atualização da Data de Previsão de Entrega';
    teImobilizacaoItem: Result := 'Imobilização de Item';
  else
    Result := 'Evento desconhecido';
  end;
end;

function TipoEventoDFeSuportado(ACodigo: Integer): Boolean;
begin
  Result := (ACodigo = Ord(teAtualizacaoPrevisaoEntrega)) or
    (ACodigo = Ord(teImobilizacaoItem));
end;

function TipoEventoDFeFromCodigo(ACodigo: Integer): TipoEventoDFe;
begin
  case ACodigo of
    Ord(teAtualizacaoPrevisaoEntrega): Result := teAtualizacaoPrevisaoEntrega;
    Ord(teImobilizacaoItem): Result := teImobilizacaoItem;
  else
    raise Exception.CreateFmt('Tipo de evento DF-e não suportado: %d', [ACodigo]);
  end;
end;

function TipoEventoDFeCodigo(const ATipo: TipoEventoDFe): Integer;
begin
  Result := Ord(ATipo);
end;

function TipoEventoDFeTpAutor(const ATipo: TipoEventoDFe): Integer;
begin
  case ATipo of
    teAtualizacaoPrevisaoEntrega: Result := 1;
    teImobilizacaoItem: Result := 2;
  else
    Result := 0;
  end;
end;

function TipoEventoDFeOpcoes: TipoEventoDFeArray;
begin
  SetLength(Result, 2);
  Result[0] := teAtualizacaoPrevisaoEntrega;
  Result[1] := teImobilizacaoItem;
end;

end.
