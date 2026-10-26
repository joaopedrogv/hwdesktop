unit TransferenciaCBSEnteGovEtdUnit;

interface

uses
  Contnrs,
  TipoComunsUnit,
  DateAndTimeNullableUnit;

type
  TransferenciaCBSEnteGovEtd = class
  private
    FId: Integer;
    FValor: Double;
    FInicioVigencia: TDate;
    FFimVigencia: DateNullable;
  public
    constructor Create(); overload;
    constructor Create(
      AId: Integer;
      AValor: Double;
      AInicioVigencia: TDate;
      const AFimVigencia: DateNullable
    ); overload;

    property Id: Integer read FId write FId;
    property Valor: Double read FValor write FValor;
    property InicioVigencia: TDate read FInicioVigencia write FInicioVigencia;
    property FimVigencia: DateNullable read FFimVigencia write FFimVigencia;
  end;

  TransferenciaCBSEnteGovEtdList = class(TObjectList)
  private
    function GetItem(Index: Integer): TransferenciaCBSEnteGovEtd ;
    procedure SetItem(Index: Integer; const Value: TransferenciaCBSEnteGovEtd );
  public
    property Items[Index: Integer]: TransferenciaCBSEnteGovEtd  read GetItem write SetItem;
  end;

implementation

{ TransferenciaCBSEnteGovEtd  }

constructor TransferenciaCBSEnteGovEtd .Create();
begin
  inherited Create;
end;

constructor TransferenciaCBSEnteGovEtd .Create(
  AId: Integer;
  AValor: Double;
  AInicioVigencia: TDate;
  const AFimVigencia: DateNullable
);
begin
  Create();
  FId := AId;
  FValor := AValor;
  FInicioVigencia := AInicioVigencia;
  FFimVigencia := AFimVigencia;
end;

{ TransferenciaCBSEnteGovEtdList }

function TransferenciaCBSEnteGovEtdList.GetItem(Index: Integer): TransferenciaCBSEnteGovEtd ;
begin
  Result := TransferenciaCBSEnteGovEtd (inherited Items[Index]);
end;

procedure TransferenciaCBSEnteGovEtdList.SetItem(Index: Integer; const Value: TransferenciaCBSEnteGovEtd );
begin
  Put(Index, Value);
end;

end.
