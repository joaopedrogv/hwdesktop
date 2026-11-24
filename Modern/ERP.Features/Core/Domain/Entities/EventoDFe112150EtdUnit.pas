unit EventoDFe112150EtdUnit;

interface

uses
  EventoDFeEtdUnit,
  TipoEventoDFeUnit,
  StatusRegistroEnumUnit;

type
  EventoDFe112150Etd = class(EventoDFeEtd)
  private
    FDataPrevisaoEntrega: TDate;
  public
    constructor Create(); overload;
    constructor Create(const AId: string; ASeqId: Integer;
      const AChaveDocumento: string; ACodEmpresa: Integer;
      AAtivo: StatusRegistroEnum; ADataPrevisaoEntrega: TDate;
      ADataCadastro, ADataAlteracao: TDateTime); overload;

    property DataPrevisaoEntrega: TDate read FDataPrevisaoEntrega
      write FDataPrevisaoEntrega;
    function Clone: EventoDFeEtd; override;
  end;

implementation

{ EventoDFe112150Etd }

constructor EventoDFe112150Etd.Create;
begin
  inherited CreateRascunho(fdNFe, teAtualizacaoPrevisaoEntrega);

  FDataPrevisaoEntrega := 0;
end;

constructor EventoDFe112150Etd.Create(const AId: string; ASeqId: Integer;
  const AChaveDocumento: string; ACodEmpresa: Integer;
  AAtivo: StatusRegistroEnum; ADataPrevisaoEntrega: TDate;
  ADataCadastro, ADataAlteracao: TDateTime);
begin
  inherited Create(AId, ASeqId, fdNFe, teAtualizacaoPrevisaoEntrega,
    AChaveDocumento, ACodEmpresa, AAtivo, ADataCadastro, ADataAlteracao);

  FDataPrevisaoEntrega := ADataPrevisaoEntrega;
end;

function EventoDFe112150Etd.Clone: EventoDFeEtd;
begin
  Result := EventoDFe112150Etd.Create(
    Id,
    SeqId,
    ChaveDocumento,
    CodEmpresa,
    Ativo,
    DataPrevisaoEntrega,
    DataCadastro,
    DataAlteracao
  );
end;

end.
