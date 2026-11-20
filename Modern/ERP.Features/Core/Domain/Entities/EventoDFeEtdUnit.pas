unit EventoDFeEtdUnit;

interface

uses
  TipoEventoDFeUnit,
  StatusRegistroEnumUnit;

type
  EventoDFeEtd = class
  private
    FId: string;
    FSeqId: Integer;
    FFamiliaDocumento: TFamiliaDocumentoDFe;
    FTipoEvento: TipoEventoDFe;
    FChaveDocumento: string;
    FCodEmpresa: Integer;
    FAtivo: StatusRegistroEnum;
    FDataCadastro: TDateTime;
    FDataAlteracao: TDateTime;
    FRestaurar: Boolean;
  protected
    constructor CreateRascunho(AFamiliaDocumento: TFamiliaDocumentoDFe;
      ATipoEvento: TipoEventoDFe);
  public
    constructor Create(); overload;
    constructor Create(const AId: string; ASeqId: Integer;
      AFamiliaDocumento: TFamiliaDocumentoDFe; ATipoEvento: TipoEventoDFe;
      const AChaveDocumento: string;
      ACodEmpresa: Integer; AAtivo: StatusRegistroEnum;
      ADataCadastro, ADataAlteracao: TDateTime;
      ARestaurar: Boolean = False); overload;

    property Id: string read FId;
    property SeqId: Integer read FSeqId;
    property FamiliaDocumento: TFamiliaDocumentoDFe read FFamiliaDocumento;
    property TipoEvento: TipoEventoDFe read FTipoEvento;
    property ChaveDocumento: string read FChaveDocumento write FChaveDocumento;
    property CodEmpresa: Integer read FCodEmpresa write FCodEmpresa;
    property Ativo: StatusRegistroEnum read FAtivo write FAtivo;
    property DataCadastro: TDateTime read FDataCadastro;
    property DataAlteracao: TDateTime read FDataAlteracao;
    // Intenção de aplicação; não é persistida.
    property Restaurar: Boolean read FRestaurar write FRestaurar;

    procedure DefinirSeqIdInclusao(ASeqId: Integer);
    function Clone: EventoDFeEtd; virtual; abstract;
  end;

implementation

uses
  SysUtils;

{ EventoDFeEtd }

constructor EventoDFeEtd.Create;
begin
  CreateRascunho(fdNFe, teAtualizacaoPrevisaoEntrega);
end;

constructor EventoDFeEtd.CreateRascunho(AFamiliaDocumento: TFamiliaDocumentoDFe;
  ATipoEvento: TipoEventoDFe);
begin
  FId := '';
  FSeqId := 0;
  FFamiliaDocumento := AFamiliaDocumento;
  FTipoEvento := ATipoEvento;
  FChaveDocumento := '';
  FCodEmpresa := 0;
  FAtivo := saAtivo;
  FDataCadastro := 0;
  FDataAlteracao := 0;
  FRestaurar := False;
end;

constructor EventoDFeEtd.Create(const AId: string; ASeqId: Integer;
  AFamiliaDocumento: TFamiliaDocumentoDFe; ATipoEvento: TipoEventoDFe;
  const AChaveDocumento: string;
  ACodEmpresa: Integer; AAtivo: StatusRegistroEnum;
  ADataCadastro, ADataAlteracao: TDateTime; ARestaurar: Boolean);
begin
  FId := AId;
  FSeqId := ASeqId;
  FFamiliaDocumento := AFamiliaDocumento;
  FTipoEvento := ATipoEvento;
  FChaveDocumento := AChaveDocumento;
  FCodEmpresa := ACodEmpresa;
  FAtivo := AAtivo;
  FDataCadastro := ADataCadastro;
  FDataAlteracao := ADataAlteracao;
  FRestaurar := ARestaurar;
end;

procedure EventoDFeEtd.DefinirSeqIdInclusao(ASeqId: Integer);
begin
  if FId <> '' then
    raise Exception.Create('O código de inclusão só pode ser definido em um rascunho não persistido.');

  FSeqId := ASeqId;
end;

end.
