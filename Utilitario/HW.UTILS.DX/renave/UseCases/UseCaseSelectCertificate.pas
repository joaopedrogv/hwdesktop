unit UseCaseSelectCertificate;

interface

uses
  BaseUseCaseRenave;

type

  TUseCaseConfigure = class(TUseCaseBaseRenave)
  public
    function Run: Boolean;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  Vcl.Forms,
  frmSelectCertificate,
  hw_utils;

{ TUseCaseConfigure }

function TUseCaseConfigure.Run: Boolean;
begin

  try
    InitUseCase();

    Application.CreateForm(TformSelectCertificate, formSelectCertificate);
    formSelectCertificate.ShowModal;

    Result := True;

  except on E: Exception do
    begin
      Result := False;
      LastError := E.message;
      ShowAtencao(StrConcat(['Erro ao configurar', _LB, _LB, E.Message]));
    end;
  end;

end;

end.
