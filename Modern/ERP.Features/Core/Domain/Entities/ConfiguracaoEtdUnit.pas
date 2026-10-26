unit ConfiguracaoEtdUnit;

interface

uses
	Contnrs,
	Classes,
	EntityBaseUnit,
	StatusRegistroEnumUnit,
	StringNullableUnit,
	DoubleNullableUnit,
	DateAndTimeNullableUnit,
	ConfiguracaoTipoEnumUnit,
	IntegerNullableUnit;

type
  ConfiguracaoEtdTipoEnum = ( tctBlob, tctBool, tctBString, tctInt, tctFloat, tctDateTime );

	ConfiguracaoEtd = class(EntityBase)
	private
		FChave: string;
		FEmpresaId: Integer;
		FDisplay: string;
    FTipo: string;
		FValorString: StringNullable;
		FValorDouble: DoubleNullable;
		FValorStrings: TStrings;
		FValorDateTime: DateTimeNullable;
		FValorInt: IntegerNullable;
		FTags: string;
		FAtivo: StatusRegistroEnum;
		function GetValorBool: Boolean;
	public
		constructor Create(
			const AChave: string;
			AEmpresaId: Integer;
			const ADisplay: string;
			const ATipo: string;
			const AValorString: StringNullable;
			const AValorDouble: DoubleNullable;
			AValorStrings: TStrings;
			const AValorDateTime: DateTimeNullable;
			const ATags: string;
			AAtivo: StatusRegistroEnum
		);
		destructor Destroy; override;

		function Clone(): EntityBase; override;

		property Chave: string read FChave;
		property EmpresaId: Integer read FEmpresaId;
		property Display: string read FDisplay;
		property Tipo: string read FTipo;
		property ValorString: StringNullable read FValorString;
		property ValorDouble: DoubleNullable read FValorDouble;
		property ValorStrings: TStrings read FValorStrings;
		property ValorDateTime: DateTimeNullable read FValorDateTime;
		property ValorInt: IntegerNullable read FValorInt;
		property ValorBool: Boolean read GetValorBool;
    property Tags: string read FTags;
    property Ativo: StatusRegistroEnum read FAtivo;
  end;

  ConfiguracaoEtdList = class(TObjectList)
  private
    function GetItem(const Key: string): ConfiguracaoEtd;
  public
    function TryGet(const Key: string; var Obj: ConfiguracaoEtd): Boolean;
    property Item[const Key: string]: ConfiguracaoEtd read GetItem;
  end;

const
  ConfiguracaoEtdTipoEnumStr: array[ConfiguracaoEtdTipoEnum] of string = (
    'blob', 'boolean', 'string', 'integer', 'float', 'datetime'
  );

implementation

uses
  SysUtils;

{ ConfiguracaoEtd }

function ConfiguracaoEtd.Clone: EntityBase;
begin
  if Self = nil then
    Result := nil
  else
    Result := ConfiguracaoEtd.Create(
      FChave, FEmpresaId, FDisplay, FTipo, FValorString, FValorDouble, FValorStrings, FValorDateTime, FTags, FAtivo
    );
end;

constructor ConfiguracaoEtd.Create(
  const AChave: string;
  AEmpresaId: Integer;
  const ADisplay: string;
  const ATipo: string;
  const AValorString: StringNullable;
  const AValorDouble: DoubleNullable;
  AValorStrings: TStrings;
  const AValorDateTime: DateTimeNullable;
  const ATags: string;
  AAtivo: StatusRegistroEnum
);
begin
	FChave := AChave;
	FEmpresaId := AEmpresaId;
	FDisplay := ADisplay;
  FTipo := ATipo;
	FValorString := AValorString;
	FValorDouble := AValorDouble;
	FValorStrings := AValorStrings;
	FValorDateTime := AValorDateTime;
	FValorInt := IntegerNullable.Create(Trunc(AValorDouble.Value), AValorDouble.IsNull );
  FTags := ATags;
  FAtivo := AAtivo;
end;

destructor ConfiguracaoEtd.Destroy;
begin
  if Assigned(FValorStrings) then
    FreeAndNil(FValorStrings);

  inherited;
end;

function ConfiguracaoEtd.GetValorBool: Boolean;
begin
	Result := not FValorInt.IsNull and (FValorInt.Value = 1);
end;

{ ConfiguracaoEtdList }

function ConfiguracaoEtdList.GetItem(const Key: string): ConfiguracaoEtd;
var
  I: Integer;
begin
  for I := 0 to Self.Count - 1 do
    if ConfiguracaoEtd(Self.Items[I]).Chave = Key then
    begin
      Result := ConfiguracaoEtd(Self.Items[I]);
      Exit;
    end;

  Result := nil;
end;

function ConfiguracaoEtdList.TryGet(const Key: string;
  var Obj: ConfiguracaoEtd): Boolean;
var
  Reference: ConfiguracaoEtd;
begin
  Reference := Self.Item[Key];

  if Reference <> nil then
  begin
    Result := True;
    Obj := Reference;
  end
  else
    Result := False;
end;

end.
