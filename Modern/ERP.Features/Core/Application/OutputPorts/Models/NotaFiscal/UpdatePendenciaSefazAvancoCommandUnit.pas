unit UpdatePendenciaSefazAvancoCommandUnit;

interface

uses
  SysUtils, StatusResolucaoNFeSefEnumUnit;

type
 UpdatePendenciaSefazAvancoCommand = record
 private
   FNotaFiscalId: Integer;
   FEmpresaId: Integer;
   FStatusResolucao: StatusResolucaoNFeSefEnum;
 public
    class function Create(
      ANotaFiscalId: Integer;
      AEmpresaId: Integer;
      AStatusResolucao: StatusResolucaoNFeSefEnum
    ): UpdatePendenciaSefazAvancoCommand; static;

    property NotaFiscalId: Integer read FNotaFiscalId;
    property EmpresaId: Integer read FEmpresaId;
    property StatusResolucao: StatusResolucaoNFeSefEnum read FStatusResolucao;
 end;

implementation

{ UpdatePendenciaSefazAvancoCommand }

class function UpdatePendenciaSefazAvancoCommand.Create(
  ANotaFiscalId: Integer;
  AEmpresaId: Integer;
  AStatusResolucao: StatusResolucaoNFeSefEnum
): UpdatePendenciaSefazAvancoCommand;
begin
  Result.FNotaFiscalId := ANotaFiscalId;
  Result.FEmpresaId := AEmpresaId;
  Result.FStatusResolucao := AStatusResolucao;
end;

end.
