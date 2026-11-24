unit EventoDFe211130EtdUnit;

interface

uses
  EventoDFeEtdUnit,
  EventoDFe211130ItemEtdUnit,
  TipoEventoDFeUnit,
  StatusRegistroEnumUnit;

type
  EventoDFe211130Etd = class(EventoDFeEtd)
  private
    FItens: EventoDFe211130ItemEtdArray;
  public
    constructor Create(); overload;
    constructor Create(const AId: string; ASeqId: Integer;
      const AChaveDocumento: string; ACodEmpresa: Integer;
      AAtivo: StatusRegistroEnum;
      const AItens: EventoDFe211130ItemEtdArray;
      ADataCadastro, ADataAlteracao: TDateTime); overload;

    property Itens: EventoDFe211130ItemEtdArray read FItens write FItens;
    function Clone: EventoDFeEtd; override;
  end;

implementation

{ EventoDFe211130Etd }

constructor EventoDFe211130Etd.Create;
begin
  inherited CreateRascunho(fdNFe, teImobilizacaoItem);

  SetLength(FItens, 0);
end;

constructor EventoDFe211130Etd.Create(const AId: string; ASeqId: Integer;
  const AChaveDocumento: string; ACodEmpresa: Integer;
  AAtivo: StatusRegistroEnum; const AItens: EventoDFe211130ItemEtdArray;
  ADataCadastro, ADataAlteracao: TDateTime);
begin
  inherited Create(AId, ASeqId, fdNFe, teImobilizacaoItem,
    AChaveDocumento, ACodEmpresa, AAtivo, ADataCadastro, ADataAlteracao);

  FItens := Copy(AItens, 0, Length(AItens));
end;

function EventoDFe211130Etd.Clone: EventoDFeEtd;
begin
  Result := EventoDFe211130Etd.Create(
    Id,
    SeqId,
    ChaveDocumento,
    CodEmpresa,
    Ativo,
    FItens,
    DataCadastro,
    DataAlteracao
  );
end;

end.
