unit EstadoEtdUnit;

interface

type
  EstadoEtd = record
  private
    FCodigo: Integer;
    FSigla: string;
    FNome: string;
  public
    class function Create(
      Codigo: Integer;
      const Sigla, Nome: string
    ): EstadoEtd; static;

    function Clone(): EstadoEtd;

    function IsValido(): Boolean;

    property Codigo: Integer read FCodigo;
    property Sigla: string read FSigla;
    property Nome: string read FNome;
  end;

  EstadosEtd = array of EstadoEtd;

implementation

{ EstadoEtd }

function EstadoEtd.Clone: EstadoEtd;
begin
  Result := EstadoEtd.Create(
    FCodigo, FSigla, FNome
  );
end;

class function EstadoEtd.Create(Codigo: Integer; const Sigla, Nome: string): EstadoEtd;
begin
  Result.FCodigo := Codigo;
  Result.FSigla := Sigla;
  Result.FNome := Nome;
end;

function EstadoEtd.IsValido: Boolean;
begin
  Result := (FCodigo > 0) and (FSigla <> '');
end;

end.
