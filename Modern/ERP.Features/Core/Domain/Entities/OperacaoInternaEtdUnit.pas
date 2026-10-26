unit OperacaoInternaEtdUnit;

interface

uses
  StatusRegistroEnumUnit,
  TipoComunsUnit,
  EntityBaseUnit,
  Contnrs;

type

  OperacaoInternaEtd = class(EntityBase)
  private
    FId: string;
    FSeqId: Integer;
    FDescricao: string;
    FDataCadastro: TDateTime;
    FDataAlteracao: TDateTime;
    FAtivo: StatusRegistroEnum;
    FEmpressasId: TArrayInteger;
  public
    constructor Create(); overload;
    constructor Create(
      const Id: string;
      SeqId: Integer;
      const Descricao: string;
      DataCadastro: TDateTime;
      DataAlteracao: TDateTime;
      Ativo: StatusRegistroEnum;
      const EmpresasId: TArrayInteger
    ); overload;
                        
    function Clone(): EntityBase; override;

    property Id: string read FId;
    property SeqId: Integer read FSeqId;
    property Descricao: string read FDescricao write FDescricao;
    property DataCadastro: TDateTime read FDataCadastro;
    property DataAlteracao: TDateTime read FDataAlteracao;
    property Ativo: StatusRegistroEnum read FAtivo write FAtivo;
    property EmpresasId: TArrayInteger read FEmpressasId write FEmpressasId;
  end;

  OperacoesInternasEtd = class(TObjectList);

implementation

{ OperacaoInternaEtd }

constructor OperacaoInternaEtd.Create;
begin
  FSeqId := 0;
  FAtivo := saAtivo;
end;

function OperacaoInternaEtd.Clone: EntityBase;
begin
  Result := OperacaoInternaEtd.Create(
    FId, FSeqId, FDescricao, FDataCadastro, DataAlteracao, FAtivo, FEmpressasId
  );
end;

constructor OperacaoInternaEtd.Create(
  const Id: string;
  SeqId: Integer;
  const Descricao: string;
  DataCadastro: TDateTime;
  DataAlteracao: TDateTime;
  Ativo: StatusRegistroEnum;
  const EmpresasId: TArrayInteger
);
begin
  FId := Id;
  FSeqId := SeqId;
  FDescricao := Descricao;
  FDataCadastro := DataCadastro;
  FDataAlteracao := DataAlteracao;
  FAtivo := Ativo;
  FEmpressasId := EmpresasId;
end;

end.
