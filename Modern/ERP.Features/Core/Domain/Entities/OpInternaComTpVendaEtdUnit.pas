unit OpInternaComTpVendaEtdUnit;

interface

uses
  Contnrs,
  TipoComunsUnit,
  OperacaoInternaEtdUnit,
  TipoVendaEtdUnit;

type
  OpInternaComTpVendaEtd = class
  private
    FOperacaoInternaId: string;
    FCodTpVenda: Integer;
    FTipoTpVenda: string;
    FPadrao: Boolean;
    FDataCadastro: TDate;
    FOperacaoInterna: OperacaoInternaEtd;
    FTipoVenda: TipoVendaEtd;
  public
    constructor Create(); overload;
    constructor Create(
      const OperacaoInternaId: string;
      CodTpVenda: Integer;
      const TipoTpVenda: string;
      Padrao: Boolean;
      DataCadastro: TDate;
      OperacaoInterna: OperacaoInternaEtd;
      TipoVenda: TipoVendaEtd
    );  overload;
    constructor Create( TipoVenda: TipoVendaEtd ); overload;
    constructor Create( OperacaoInterna: OperacaoInternaEtd ); overload;

    destructor Destroy; override;

    property OperacaoInternaId: string read FOperacaoInternaId write FOperacaoInternaId;
    property CodTpVenda: Integer read FCodTpVenda write FCodTpVenda;
    property TipoTpVenda: string read FTipoTpVenda write FTipoTpVenda;
    property Padrao: Boolean read FPadrao write FPadrao;
    property DataCadastro: TDate read FDataCadastro;
    property OperacaoInterna: OperacaoInternaEtd read FOperacaoInterna;
    property TipoVenda: TipoVendaEtd read FTipoVenda;
  end;

  OpInternasComTpVendasEtd = class(TObjectList);

implementation

{ OpInternaComTpVendaEtd }

constructor OpInternaComTpVendaEtd.Create(
  const OperacaoInternaId: string;
  CodTpVenda: Integer;
  const TipoTpVenda: string;
  Padrao: Boolean;
  DataCadastro: TDate;
  OperacaoInterna: OperacaoInternaEtd;
  TipoVenda: TipoVendaEtd
);
begin
  FOperacaoInternaId := OperacaoInternaId;
  FCodTpVenda := CodTpVenda;
  FTipoTpVenda := TipoTpVenda;
  FPadrao := Padrao;
  FDataCadastro := DataCadastro;
  FOperacaoInterna := OperacaoInterna;
  FTipoVenda := TipoVenda;
end;

constructor OpInternaComTpVendaEtd.Create;
begin
  FOperacaoInternaId := '';
  FTipoTpVenda := '';
  FCodTpVenda := 0;
end;

constructor OpInternaComTpVendaEtd.Create(TipoVenda: TipoVendaEtd);
begin
  FCodTpVenda := TipoVenda.Codigo;
  FTipoTpVenda := TipoVenda.Tipo;
  FTipoVenda := TipoVenda;
end;

constructor OpInternaComTpVendaEtd.Create(OperacaoInterna: OperacaoInternaEtd);
begin
  FOperacaoInternaId := OperacaoInterna.Id;
  FOperacaoInterna := OperacaoInterna;
end;

destructor OpInternaComTpVendaEtd.Destroy;
begin
  FOperacaoInterna.Free();
  FTipoVenda.Free();
  inherited;
end;

end.
