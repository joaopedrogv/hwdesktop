unit PeriodoMultiEmpresaVOUnit;

interface

uses
  TipoComunsUnit;

type
  PeriodoMultiEmpresaVO = record
  private
    FDataInicial: TDate;
    FDataFinal: TDate;
    FEmpresasId: TArrayInteger;
  public
    class function Create(
      ADataInicial, ADataFinal: TDate
    ): PeriodoMultiEmpresaVO; static;

    procedure AddEmpresa(EmpresaId: Integer);

    property DataInicial: TDate read FDataInicial;
    property DataFinal: TDate read FDataFinal;
    property EmpresasId: TArrayInteger read FEmpresasId;
  end;

implementation

{ PeriodoMultiEmpresaVO }

procedure PeriodoMultiEmpresaVO.AddEmpresa(EmpresaId: Integer);
var
  I: Integer;
begin
  for I := 0 to High(FEmpresasid) do
    if FEmpresasId[I] = EmpresaId then
      Exit;

  SetLength(FEmpresasId, Length(FEmpresasId) + 1);
  FEmpresasId[High(FEmpresasId)] := EmpresaId;
end;

class function PeriodoMultiEmpresaVO.Create(
  ADataInicial, ADataFinal: TDate
): PeriodoMultiEmpresaVO;
begin
  Result.FDataInicial := ADataInicial;
  Result.FDataFinal := ADataFinal;
  SetLength(Result.FEmpresasId, 0);//Length(AEmpresasId));
  //Copy(AEmpresasId, 0, Length(Result.FEmpresasId));
end;

end.
