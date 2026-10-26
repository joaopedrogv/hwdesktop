unit VersaoSerproEtdUnit;

interface

uses
  TipoComunsUnit,
  StringNullableUnit;

type
  /// <summary>
  ///   Equivale a VersaoBaseDados.Java
  /// </summary>
  VersaoSerproEtd = record
  private
    FInstance: RecordInstance;
    FId: Integer;
    FData: TDateTime;
    FDescricao: string;
    FVersao: StringNullable;
  public
    class function NullInstance(): VersaoSerproEtd; static;
    class function Create(
      Id: Integer;
      Data: TDateTime;
      const Descricao: string;
      const Versao: StringNullable
    ): VersaoSerproEtd; static;

    function IsNull(): Boolean;

    property Id: Integer read FId;
    property Data: TDateTime read FData;
    property Descricao: string read FDescricao;
    /// <summary>
    ///   Equuivale a numeroVersao
    /// </summary>
    property Versao: StringNullable read FVersao;
  end;

  VersaoSerprosEtd = array of VersaoSerproEtd;

implementation

{ VersaoSerproEtd }

class function VersaoSerproEtd.Create(
  Id: Integer;
  Data: TDateTime;
  const Descricao: string;
  const Versao: StringNullable
): VersaoSerproEtd;
begin
  Result.FInstance := riNotNull;

  Result.FId := Id;
  Result.FData := Data;
  Result.FDescricao := Descricao;
  Result.FVersao := Versao;
end;

function VersaoSerproEtd.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

class function VersaoSerproEtd.NullInstance: VersaoSerproEtd;
begin
  Result := VersaoSerproEtd.Create( 0, 0, '', StringNullable.NullInstance() );
  Result.FInstance := riNull;
end;

end.
