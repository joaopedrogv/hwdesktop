unit RegraRedBenefPcEtdUnit;

interface

uses
  Classes, SysUtils, Contnrs,
  EntityBaseUnit, StatusRegistroEnumUnit, TipoComunsUnit, DateAndTimeNullableUnit;

type
  RegraRedBenefPcEtd = class(EntityBase)
  private
    FId: string;
    FSeqId: Integer;
    FCst: string;
    FDescricao: string;
    FPercReducao: Currency;
    FIndAjusteEFD: Integer;
    FCodAjusteEFD: Integer;
    FDescricaoAjusteEFD: string;
    FInfComplementarAjusteEFD: string;
    FCodContaContabil: string;
    FFimVigencia: DateNullable;
    FInicioVigencia: TDate;
    FAtivo: StatusRegistroEnum;
    FEmpresasId: TArrayInteger;
    FNaturezasReceita: TArrayString;
    FRestricoesNcm: TArrayString;
  public
    constructor Create(); overload;
    constructor Create(
      const AId: string;
      ASeqId: Integer;
      const ACst, ADescricao: string;
      APercReducao: Currency;
      AIndAjusteEFD, ACodAjusteEFD: Integer;
      const ADescricaoAjusteEFD, AInfComplementarAjusteEFD, ACodContaContabil: string;
      AInicioVigencia: TDate;
      const AFimVigencia: DateNullable;
      const AAtivo: StatusRegistroEnum;
      const AEmpresasId: TArrayInteger;
      const ANaturezasReceita, ARestricoesNcm: TArrayString
    ); overload;

    function Clone: EntityBase; override;

    function AplicaAoItem(const ACst, ANatReceita, ANcm: string): Boolean;

    property Id: string read FId write FId;
    property SeqId: Integer read FSeqId write FSeqId;
    property Cst: string read FCst write FCst;
    property Descricao: string read FDescricao write FDescricao;
    property PercReducao: Currency read FPercReducao write FPercReducao;
    property IndAjusteEFD: Integer read FIndAjusteEFD write FIndAjusteEFD;
    property CodAjusteEFD: Integer read FCodAjusteEFD write FCodAjusteEFD;
    property DescricaoAjusteEFD: string read FDescricaoAjusteEFD write FDescricaoAjusteEFD;
    property InfComplementarAjusteEFD: string read FInfComplementarAjusteEFD write FInfComplementarAjusteEFD;
    property CodContaContabil: string read FCodContaContabil write FCodContaContabil;
    property InicioVigencia: TDate read FInicioVigencia write FInicioVigencia;
    property FimVigencia: DateNullable read FFimVigencia write FFimVigencia;
    property Ativo: StatusRegistroEnum read FAtivo write FAtivo;
    property EmpresasId: TArrayInteger read FEmpresasId write FEmpresasId;
    property NaturezasReceita: TArrayString read FNaturezasReceita write FNaturezasReceita;
    property RestricoesNcm: TArrayString read FRestricoesNcm write FRestricoesNcm;
  end;

  RegraRedBenefPcEtdList = class(TObjectList)
  private
    function GetItem(Index: Integer): RegraRedBenefPcEtd;
    procedure SetItem(Index: Integer; const Value: RegraRedBenefPcEtd);
  public
    property Items[Index: Integer]: RegraRedBenefPcEtd read GetItem write SetItem;
  end;

implementation

uses
  StrUtils;

{ RegraRedBenefPcEtd }

constructor RegraRedBenefPcEtd.Create();
begin
  inherited Create;
  FPercReducao              := 10.0;
  FAtivo                    := saAtivo;
  FInicioVigencia           := EncodeDate(2026, 04, 01);
  FFimVigencia              := DateNullable.Create(EncodeDate(2026, 12, 31));
  FIndAjusteEFD             := 1;
  FDescricaoAjusteEFD       := 'Redução linear de benefícios fiscais - LC 224/2025';
  FInfComplementarAjusteEFD := 'Redução linear dos benefícios';
end;

function RegraRedBenefPcEtd.AplicaAoItem(const ACst, ANatReceita, ANcm: string): Boolean;
var
  I: Integer;
begin
  Result := False;
  // 1. CST deve bater
  if CST <> ACST then
    Exit;

  // 2. Natureza deve estar na lista
  for I := 0 to High(FNaturezasReceita) do
    if FNaturezasReceita[I] = ANatReceita then
      Break;

  if I > High(FNaturezasReceita) then
    Exit;

  // 3. NCM NAO pode estar na lista de exclusão
  for I := 0 to High(FRestricoesNcm) do
    if StartsStr(FRestricoesNcm[I], ANcm) then
      Exit;

  Result := True;
end;

function RegraRedBenefPcEtd.Clone: EntityBase;
begin
  if Self = nil then
    Result := nil

  else
    Result := RegraRedBenefPcEtd.Create(
      FId, FSeqId, FCst, FDescricao, FPercReducao, FIndAjusteEFD, FCodAjusteEFD, FDescricaoAjusteEFD,
      FInfComplementarAjusteEFD, FCodContaContabil, FInicioVigencia, FFimVigencia, FAtivo, FEmpresasId,
      FNaturezasReceita, FRestricoesNcm
    );
end;

constructor RegraRedBenefPcEtd.Create(
  const AId: string;
  ASeqId: Integer;
  const ACst, ADescricao: string;
  APercReducao: Currency;
  AIndAjusteEFD, ACodAjusteEFD: Integer;
  const ADescricaoAjusteEFD, AInfComplementarAjusteEFD, ACodContaContabil: string;
  AInicioVigencia: TDate;
  const AFimVigencia: DateNullable;
  const AAtivo: StatusRegistroEnum;
  const AEmpresasId: TArrayInteger;
  const ANaturezasReceita, ARestricoesNcm: TArrayString
);
begin
  Create();
  FId := AId;
  FSeqId := ASeqId;
  FCst := ACst;
  FDescricao := ADescricao;
  FPercReducao := APercReducao;
  FIndAjusteEFD := AIndAjusteEFD;
  FCodAjusteEFD := ACodAjusteEFD;
  FDescricaoAjusteEFD := ADescricaoAjusteEFD;
  FInfComplementarAjusteEFD := AInfComplementarAjusteEFD;
  FCodContaContabil := ACodContaContabil;
  FInicioVigencia := AInicioVigencia;
  FFimVigencia := AFimVigencia;
  FAtivo := AAtivo;
  FEmpresasId := AEmpresasId;      
  FNaturezasReceita := ANaturezasReceita;
  FRestricoesNcm := ARestricoesNcm;
end;

{ RegraRedBenefPcEtdList }

function RegraRedBenefPcEtdList.GetItem(Index: Integer): RegraRedBenefPcEtd;
begin
  Result := RegraRedBenefPcEtd(inherited Items[Index]);
end;

procedure RegraRedBenefPcEtdList.SetItem(Index: Integer; const Value: RegraRedBenefPcEtd);
begin
  Put(Index, Value);
end;

end.
