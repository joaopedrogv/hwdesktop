unit EValidacaoRTCUnit;

interface

uses
  SysUtils;

type
  // Exception criada para ser resolvida no array de validação nos servicos de cálculo dos tributos
  EValidacaoRTC = class(Exception)
  private
    FCodigo: string;
  public
    constructor Create(const AMensagem: string); reintroduce; overload;
    constructor Create(const ACodigo, AMensagem: string); overload;
    property Codigo: string read FCodigo;
  end;

implementation

constructor EValidacaoRTC.Create(const AMensagem: string);
begin
  inherited Create(AMensagem);
end;

constructor EValidacaoRTC.Create(const ACodigo, AMensagem: string);
begin
  inherited Create(AMensagem);
  FCodigo := ACodigo;
end;

end.
