unit ClassificacaoTributariaCalculoModelUnit;

interface

uses
  TipoComunsUnit;

type
  ClassificacaoTributariaCalculoModel = record
  private
    FInstance: RecordInstance;
    FId: Integer;
    FCodigo: string;
    FTipoAliquota: string;
    FInGrupoMonofasiaPadrao: Boolean;
    FInGrupoMonofasiaReten: Boolean;
    FInGrupoMonofasiaRet: Boolean;
    FInGrupoMonofasiaDiferimento: Boolean;
    FInGrupoReducao: Boolean;
  public
    class function NullInstance(): ClassificacaoTributariaCalculoModel; static;

    class function Create(
      AId: Integer;
      const ACodigo: string;
      const ATipoAliquota: string;
      AInGrupoMonofasiaPadrao: Boolean;
      AInGrupoMonofasiaReten: Boolean;
      AInGrupoMonofasiaRet: Boolean;
      AInGrupoMonofasiaDiferimento: Boolean;
      AInGrupoReducao: Boolean
    ): ClassificacaoTributariaCalculoModel; static;

    function IsNull(): Boolean;

    property Id: Integer read FId;
    property Codigo: string read FCodigo;
    property TipoAliquota: string read FTipoAliquota;
    property InGrupoMonofasiaPadrao: Boolean read FInGrupoMonofasiaPadrao;
    property InGrupoMonofasiaReten: Boolean read FInGrupoMonofasiaReten;
    property InGrupoMonofasiaRet: Boolean read FInGrupoMonofasiaRet;
    property InGrupoMonofasiaDiferimento: Boolean read FInGrupoMonofasiaDiferimento;
    property InGrupoReducao: Boolean read FInGrupoReducao;
  end;

implementation

{ ClassificacaoTributariaCalculoModel }

class function ClassificacaoTributariaCalculoModel.Create(
  AId: Integer;
  const ACodigo: string;
  const ATipoAliquota: string;
  AInGrupoMonofasiaPadrao: Boolean;
  AInGrupoMonofasiaReten: Boolean;
  AInGrupoMonofasiaRet: Boolean;
  AInGrupoMonofasiaDiferimento: Boolean;
  AInGrupoReducao: Boolean
): ClassificacaoTributariaCalculoModel;
begin
  Result.FInstance := riNotNull;
  Result.FId := AId;
  Result.FCodigo := ACodigo;
  Result.FTipoAliquota := ATipoAliquota;
  Result.FInGrupoMonofasiaPadrao := AInGrupoMonofasiaPadrao;
  Result.FInGrupoMonofasiaReten := AInGrupoMonofasiaReten;
  Result.FInGrupoMonofasiaRet := AInGrupoMonofasiaRet;
  Result.FInGrupoMonofasiaDiferimento := AInGrupoMonofasiaDiferimento;
  Result.FInGrupoReducao := AInGrupoReducao;
end;

function ClassificacaoTributariaCalculoModel.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

class function ClassificacaoTributariaCalculoModel.NullInstance: ClassificacaoTributariaCalculoModel;
begin
  Result.FInstance := riNull;
end;

end.
