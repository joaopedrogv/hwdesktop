unit ConfigureAssineOnUseCase;

interface

uses
  BaseUseCaseAO;

type
  TConfigureAssineOnUseCase = class(TUseCaseBaseAssineOn)
  public
    procedure Run();
  end;

implementation

{ TConfigureAssineOnUseCase }

uses
  System.SysUtils,
  System.StrUtils,
  Vcl.Forms,
  frmConfAssineOn,
  hw_utils;

procedure TConfigureAssineOnUseCase.Run;
begin
  try
    InitUseCase();

    Application.CreateForm(TformConfAssineOn, formConfAssineOn);
    formConfAssineOn.ShowModal;

  except on E: Exception do
    begin
      LastError := E.message;
      ShowAtencao(StrConcat(['Erro ao configurar', _LB, _LB, E.Message]));
    end;
  end;
end;

end.
