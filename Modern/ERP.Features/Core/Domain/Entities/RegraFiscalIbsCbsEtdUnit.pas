unit RegraFiscalIbsCbsEtdUnit;

interface

uses
  CurrencyNullableUnit,
  IntegerNullableUnit,
  DateAndTimeNullableUnit,
  StringNullableUnit,
  StatusRegistroEnumUnit,
  TipoComunsUnit,
  Contnrs;

type
  RegraFiscalIbsCbsEtd = class
  private
    FId: string;
    FDescricao: string;
    FCClassTrib: string;
    FPDifCbs: CurrencyNullable;
    FPDifIbsUF: CurrencyNullable;
    FPDifIbsMun: CurrencyNullable;
    FTpOperGov: IntegerNullable;
    FInicioVigencia: TDate;
    FFimVigencia: DateNullable;
    FDataCadastro: TDateTime;
    FDataAlteracao: TDateTime;
    FAtivo: StatusRegistroEnum;
    FEmpresasId: TArrayInteger;
    FRegraFiscalTribRegularId: StringNullable;
    FCClassTribRegular: StringNullable;
  public         
    constructor Create(); overload;
    constructor Create(
      const Id: string;
      const Descricao: string;
      const CClassTrib: string;
      const PDifCbs: CurrencyNullable;
      const PDifIbsUF: CurrencyNullable;
      const PDifIbsMun: CurrencyNullable;
      TpOperGov: IntegerNullable;
      InicioVigencia: TDate;
      const FimVigencia: DateNullable;
      DataCadastro: TDateTime;
      DataAlteracao: TDateTime;
      Ativo: StatusRegistroEnum;
      const RegraFiscalTribRegularId: StringNullable;
      const ACClassTribRegular: StringNullable;
      const EmpresasId: TArrayInteger
    ); overload;

    function Clone(): RegraFiscalIbsCbsEtd;

    property Id: string read FId;
    property Descricao: string read FDescricao write FDescricao;
    property CClassTrib: string read FCClassTrib write FCClassTrib;
    property PDifCbs: CurrencyNullable read FPDifCbs write FPDifCbs;
    property PDifIbsUF: CurrencyNullable read FPDifIbsUF write FPDifIbsUF;
    property PDifIbsMun: CurrencyNullable read FPDifIbsMun write FPDifIbsMun;
    property TpOperGov: IntegerNullable read FTpOperGov write FTpOperGov;
    property InicioVigencia: TDate read FInicioVigencia write FInicioVigencia;
    property FimVigencia: DateNullable read FFimVigencia write FFimVigencia;
    property DataCadastro: TDateTime read FDataCadastro;
    property DataAlteracao: TDateTime read FDataAlteracao;
    property Ativo: StatusRegistroEnum read FAtivo write FAtivo;
    property RegraFiscalTribRegularId: StringNullable read FRegraFiscalTribRegularId write FRegraFiscalTribRegularId;
    property CClassTribRegular: StringNullable read FCClassTribRegular;
    property EmpresasId: TArrayInteger read FEmpresasId write FEmpresasId;
  end;

  RegrasFiscaisIbsCbsEtd = class(TObjectList);

implementation

uses  SysUtils;

{ RegraFiscalIbsCbsEtd }

function RegraFiscalIbsCbsEtd.Clone: RegraFiscalIbsCbsEtd;
begin
  Result := RegraFiscalIbsCbsEtd.Create(
    FId,
    FDescricao,
    FCClassTrib,
    FPDifCbs,
    FPDifIbsUF,
    FPDifIbsMun,
    FTpOperGov,
    FInicioVigencia,
    FFimVigencia,
    FDataCadastro,
    FDataAlteracao,
    FAtivo,
    FRegraFiscalTribRegularId,
    FCClassTribRegular,
    FEmpresasId
  );
end;

constructor RegraFiscalIbsCbsEtd.Create(
  const Id: string;
  const Descricao: string;
  const CClassTrib: string;
  const PDifCbs: CurrencyNullable;
  const PDifIbsUF: CurrencyNullable;
  const PDifIbsMun: CurrencyNullable;
  TpOperGov: IntegerNullable;
  InicioVigencia: TDate;
  const FimVigencia: DateNullable;
  DataCadastro: TDateTime;
  DataAlteracao: TDateTime;
  Ativo: StatusRegistroEnum;
  const RegraFiscalTribRegularId: StringNullable;
  const ACClassTribRegular: StringNullable;
  const EmpresasId: TArrayInteger
);
begin
  FId := Id;
  FDescricao := Descricao;
  FCClassTrib := CClassTrib;
  FPDifCbs := PDifCbs;
  FPDifIbsUF := PDifIbsUF;
  FPDifIbsMun := PDifIbsMun;
  FTpOperGov := TpOperGov;
  FInicioVigencia := InicioVigencia;
  FFimVigencia := FimVigencia;
  FDataCadastro := DataCadastro;
  FDataAlteracao := DataAlteracao;
  FAtivo := Ativo;
  FRegraFiscalTribRegularId := RegraFiscalTribRegularId;
  FCClassTribRegular := ACClassTribRegular;
  FEmpresasId := EmpresasId;
end;

constructor RegraFiscalIbsCbsEtd.Create;
begin
  FId := '';
  FAtivo := saAtivo;
  FInicioVigencia := Date();
  SetLength(FEmpresasId, 0);
end;

end.
