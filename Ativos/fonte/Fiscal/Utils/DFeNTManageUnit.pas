unit DFeNTManageUnit;

interface

uses
  Sysutils, Classes;

type
  // Classe que gerencia as regas em vigor para as notas técnicas
  NotaTecOuRegra = (
    nt2026_002,
    regRefDocConsumidor,
    regAlertas
  );

  DFeNTManager = class
  public
    class function RegraEmVigor(NTouRegra: NotaTecOuRegra ; Producao: Boolean): Boolean; static;
  end;

  NTVersaoPrazos = array[NotaTecOuRegra] of string;
const
  NTVersaoPrazosHom: NTVersaoPrazos = ('01/07/2026', '01/09/2026', '01/09/2026');
  NTVersaoPrazosPro: NTVersaoPrazos = ('03/08/2026', '14/12/2026', '05/10/2026');

implementation

{ DFeNTManager }

class function DFeNTManager.RegraEmVigor(NTouRegra: NotaTecOuRegra; Producao: Boolean): Boolean;
var
  NTVerPrazo: NTVersaoPrazos;
  FS: TFormatSettings;
  DataRegra: TDateTime;
begin
  if Producao then
    NTVerPrazo := NTVersaoPrazosPro
  else
    NTVerPrazo := NTVersaoPrazosHom;

  FS.ShortDateFormat := 'dd/mm/yyyy';
  FS.DateSeparator := '/';

  DataRegra := StrToDate(NTVerPrazo[NTouRegra], FS);

  Result := Date() >= DataRegra;
end;

end.
