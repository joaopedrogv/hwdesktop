unit TributoDFeContextEtdUnit;

interface

uses
  TributoDFeIbsCbsEtdUnit,
  TributoDFeImpostoSeletivoEtdUnit,
  TributoDFeOrigemEnumUnit,
  Contnrs
  ;

type
  TributoDFeContextEtd = class
  private
    FId: string;
    FImpostoSeletivo: TributoDFeImpostoSeletivoEtd;
    FIbsCbs: TributoDFeIbsCbsEtd;
    FOrigem: TributoDFeOrigemEnum;
    procedure SetIbsCbs(const Value: TributoDFeIbsCbsEtd);
    procedure SetImpostoSeletivo(const Value: TributoDFeImpostoSeletivoEtd);
  public
    constructor Create(
      const AId: string;
      AOrigem: TributoDFeOrigemEnum;
      AImpostoSeletivo: TributoDFeImpostoSeletivoEtd;
      AIbsCbs: TributoDFeIbsCbsEtd
    );
    destructor Destroy; override;
    function Clone(): TributoDFeContextEtd;
    function IsEqualTo(const Other: TributoDFeContextEtd): Boolean;

    property Id: string read FId write FId;
    property Origem: TributoDFeOrigemEnum read FOrigem write FOrigem;
    property ImpostoSeletivo: TributoDFeImpostoSeletivoEtd read FImpostoSeletivo write SetImpostoSeletivo;
    property IbsCbs: TributoDFeIbsCbsEtd read FIbsCbs write SetIbsCbs;
  end;

  TributoDFeContextEtdList = class(TObjectList)
  private
    function GetItem(Index: Integer): TributoDFeContextEtd;
    procedure SetItem(Index: Integer; const Value: TributoDFeContextEtd);
  public
    function GetById(const Id: string): TributoDFeContextEtd;
  public
    property Items[Index: Integer]: TributoDFeContextEtd read GetItem write SetItem; default;
  end;

implementation

uses
  SysUtils;

{ TNotaFiscalItemRTC }

function TributoDFeContextEtd.Clone: TributoDFeContextEtd;
begin
  if Self = nil then
    Result := nil
  else
    Result := TributoDFeContextEtd.Create(
      Self.Id,
      Self.Origem,
      FImpostoSeletivo.Clone(),
      FIbsCbs.Clone()
    );
end;

constructor TributoDFeContextEtd.Create(
  const AId: string;
  AOrigem: TributoDFeOrigemEnum;
  AImpostoSeletivo: TributoDFeImpostoSeletivoEtd;
  AIbsCbs: TributoDFeIbsCbsEtd
);
begin
  FId := AId;
  FOrigem := AOrigem;
  FImpostoSeletivo := AImpostoSeletivo;
  FIbsCbs := AIbsCbs;
end;

destructor TributoDFeContextEtd.Destroy;
begin
  if Assigned(FImpostoSeletivo) then
    FreeAndNil(FImpostoSeletivo);

  if Assigned(FIbsCbs) then
    FreeAndNil(FIbsCbs);

  inherited;
end;

procedure TributoDFeContextEtd.SetIbsCbs(const Value: TributoDFeIbsCbsEtd);
begin
  if Value <> FIbsCbs then
  begin
    FreeAndNil(FIbsCbs);
    FIbsCbs := Value;
  end;
end;

procedure TributoDFeContextEtd.SetImpostoSeletivo(
  const Value: TributoDFeImpostoSeletivoEtd);
begin
  if Value <> FImpostoSeletivo then
  begin
    FreeAndNil(FImpostoSeletivo);
    FImpostoSeletivo := Value;
  end;
end;

function TributoDFeContextEtd.IsEqualTo(const Other: TributoDFeContextEtd): Boolean;
begin
  if (Self = nil) or (Other = nil) then
    Result := (Self = nil) and (Other = nil)
  else
    Result := (Self.Id = Other.Id)
      and (Self.Origem = Other.Origem)
      and Self.ImpostoSeletivo.IsEqualTo(Other.ImpostoSeletivo)
      and Self.IbsCbs.IsEqualTo(Other.IbsCbs);
end;

{ TributoDFeContextEtdList }

function TributoDFeContextEtdList.GetById(const Id: string): TributoDFeContextEtd;
var
  I: Integer;
begin
  for I := 0 to Self.Count - 1 do
  begin
    Result := GetItem(I);

    if Result.FId = Id then
      Exit;
  end;

  Result := nil;
end;

function TributoDFeContextEtdList.GetItem(Index: Integer): TributoDFeContextEtd;
begin
  Result := TributoDFeContextEtd(inherited Items[Index]);
end;

procedure TributoDFeContextEtdList.SetItem(Index: Integer; const Value: TributoDFeContextEtd);
begin
  Put(Index, Value);
end;

end.
