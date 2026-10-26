unit TipoVendaEtdUnit;

interface

uses
  Contnrs,
  StatusRegistroEnumUnit,
  EntityBaseUnit;

type
  TipoVendaEtd = class(EntityBase)
  private
    FCodigo: Integer;
    FTipo: string;
    FDescricao: string;
    FTipoOS: string;
    FSigla: string;
    FIsVenda: Boolean;
    FAtivo: StatusRegistroEnum;
  public
    constructor Create(
      Codigo: Integer;
      const Tipo: string;
      const Descricao: string;
      const TipoOS: string;
      const Sigla: string;
      IsVenda: Boolean;
      Ativo: StatusRegistroEnum
    );

  public
    function Clone(): EntityBase; override;

    property Codigo: Integer read FCodigo;
    property Tipo: string read FTipo;
    property Descricao: string read FDescricao;
    property TipoOS: string read FTipoOS;
    property Sigla: string read FSigla;
    property IsVenda: Boolean read FIsVenda write FIsVenda;
    property Ativo: StatusRegistroEnum read FAtivo;
  end;

  TipoVendaEtdList = class(TObjectList);

implementation

{ TipoVendaEtd }

function TipoVendaEtd.Clone: EntityBase;
begin
  Result := TipoVendaEtd.Create(
    FCodigo, FTipo, FDescricao, FTipoOS, FSigla, FIsVenda, FAtivo
  );
end;

constructor TipoVendaEtd.Create(
  Codigo: Integer;
  const Tipo: string;
  const Descricao: string;
  const TipoOS: string;
  const Sigla: string;
  IsVenda: Boolean;
  Ativo: StatusRegistroEnum
);
begin
  FCodigo := Codigo;
  FTipo := Tipo;
  FDescricao := Descricao;
  FTipoOS := TipoOS;
  FSigla := Sigla;
  FIsVenda := IsVenda;
  FAtivo := Ativo;
end;

end.
