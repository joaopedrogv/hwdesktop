unit uClassesNotasFiscais_Tipos;

interface

type

	TNotaFiscalRefenciaResult = record
  private
    FChaveNFe: string;
    procedure SetChaveNFe(const Value: string);
  public
    Numero: Integer;
    Serie: string;
    Emissao: string;
    NItem: Integer;
  public
    property ChaveNFe: string read FChaveNFe write SetChaveNFe;
  end;

implementation

uses
  SysUtils;

{ TNotaFiscalRefenciaResult }

procedure TNotaFiscalRefenciaResult.SetChaveNFe(const Value: string);
begin
  FChaveNFe := Value;
  Emissao := Copy(FChaveNFe, 5, 2) + '/' + Copy(FChaveNFe, 3, 2);
  Serie := Copy(FChaveNFe, 23, 3);
  Numero := StrToInt(Copy(FChaveNFe, 26, 9));
end;

end.
