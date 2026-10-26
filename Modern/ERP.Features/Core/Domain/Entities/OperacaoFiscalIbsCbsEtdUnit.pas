unit OperacaoFiscalIbsCbsEtdUnit;

interface

uses
  Contnrs,
  OperacaoFiscalIbsCbsCondicaoEtdUnit,
  TipoComunsUnit,
  IntegerNullableUnit,
  StringNullableUnit,
  DateAndTimeNullableUnit,
  StatusRegistroEnumUnit;

type
  OperacaoFiscalIbsCbsEtd = class
  private
    FId: string;
    FOperacaoInternaId: string;
    FRegraFiscalId: string;
    FGrupoFiscalId: StringNullable;
    FInicioVigencia: TDate;
    FFimVigencia: DateNullable;
    FDataCadastro: TDateTime;
    FDataAlteracao: TDateTime;
    FAtivo: StatusRegistroEnum;
    FEmpresasId: TArrayInteger;
    FCondicoes: OperacaoFiscalIbsCbsCondicaoEtdArray;
  public
    constructor Create(); overload;
    constructor Create(
      const Id: string;
      const OperacaoInternaId: string;
      const RegraFiscalId: string;
      const GrupoFiscalId: StringNullable;
      InicioVigencia: TDate;
      const FimVigencia: DateNullable;
      DataCadastro: TDateTime;
      DataAlteracao: TDateTime;
      Ativo: StatusRegistroEnum;
      const EmpresasId: TArrayInteger
    ); overload;

    property Id: string read FId;
    property OperacaoInternaId: string read FOperacaoInternaId write FOperacaoInternaId;
    property RegraFiscalId: string read FRegraFiscalId write FRegraFiscalId;
    property GrupoFiscalId: StringNullable read FGrupoFiscalId write FGrupoFiscalId;
    property InicioVigencia: TDate read FInicioVigencia write FInicioVigencia;
    property FimVigencia: DateNullable read FFimVigencia write FFimVigencia;
    property DataCadastro: TDateTime read FDataCadastro write FDataCadastro;
    property DataAlteracao: TDateTime read FDataAlteracao write FDataAlteracao;
    property Ativo: StatusRegistroEnum read FAtivo write FAtivo;
    property EmpresasId: TArrayInteger read FEmpresasId write FEmpresasId;
    property Condicoes: OperacaoFiscalIbsCbsCondicaoEtdArray read FCondicoes write FCondicoes;
  end;

  OperacaoFiscalIbsCbsEtdList = class(TObjectList);

implementation

uses
  SysUtils;

{ OperacaoFiscalIbsCbsEtd }

constructor OperacaoFiscalIbsCbsEtd.Create(
  const Id: string;
  const OperacaoInternaId: string;
  const RegraFiscalId: string;
  const GrupoFiscalId: StringNullable;
  InicioVigencia: TDate;
  const FimVigencia: DateNullable;
  DataCadastro: TDateTime;
  DataAlteracao: TDateTime;
  Ativo: StatusRegistroEnum;
  const EmpresasId: TArrayInteger
);
begin
  FId := Id;
  FOperacaoInternaId := OperacaoInternaId;
  FRegraFiscalId := RegraFiscalId;
  FGrupoFiscalId := GrupoFiscalId;
  FInicioVigencia := InicioVigencia;
  FFimVigencia := FimVigencia;
  FDataCadastro := DataCadastro;
  FDataAlteracao := DataAlteracao;
  FAtivo := Ativo;
  FEmpresasId := EmpresasId;
  SetLength(FCondicoes, 0); // por enquanto
end;

constructor OperacaoFiscalIbsCbsEtd.Create;
begin
  FId := '';
  FAtivo := saAtivo;
  FInicioVigencia := Date();
  SetLength(FEmpresasId, 0);
  SetLength(FCondicoes, 0);
end;

end.
