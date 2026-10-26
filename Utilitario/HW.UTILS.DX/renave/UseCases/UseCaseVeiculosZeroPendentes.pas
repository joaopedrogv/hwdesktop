unit UseCaseVeiculosZeroPendentes;

interface

uses
  BaseUseCaseRenave;

type

  TUseCaseVeiculosZeroPendentes = class(TUseCaseBaseRenave)
  public
    function Run: Boolean;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  Vcl.Forms,
  frmVeiculosZeroPendentes,
  hw_utils;

{ TUseCaseVeiculosZeroPendentes }

function TUseCaseVeiculosZeroPendentes.Run: Boolean;
begin

  try
    InitUseCase();

    Application.CreateForm(TformVeiculosZeroPendentes, formVeiculosZeroPendentes);
    formVeiculosZeroPendentes.ShowModal;

    Result := True;

  except on E: Exception do
    begin
      Result := False;
      LastError := E.message;
      ShowAtencao(StrConcat(['Erro ao visualizar', _LB, _LB, E.Message]));
    end;
  end;

end;

end.
