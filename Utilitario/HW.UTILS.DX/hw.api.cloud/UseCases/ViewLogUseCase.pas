unit ViewLogUseCase;

interface

uses
  UseCaseBase;

type
  TViewLogUseCase = class(TUseCaseBase)
  public
    procedure Run();
  end;

implementation

{ TViewLogUseCase }

uses
  uFormLogView,
  hw_utils,
  Vcl.Forms,
  System.SysUtils;

procedure TViewLogUseCase.Run;
begin
  var cnpj := paramsUC.Values['cnpj'];
//  var silent := StrToBoolDef(paramsUC.Values['silent'], False);
  var empId := -1;
  var caiId := -1;

  if (not TryStrToInt(paramsUC.Values['empresaId'], empId)) then
  begin
    if not silent then
      ShowAtencao('Parametro empresaId não localizado na string');
    Exit;
  end;
  if (not TryStrToInt(paramsUC.Values['caixaId'], caiId)) then
  begin
    if not silent then
      ShowAtencao('Parametro caixaId não localizado na string');
    Exit;
  end;

  Application.CreateForm(TfrmLogView, frmLogView);

  frmLogView.log.cnpj := cnpj;
  frmLogView.empresaId := empId;
  frmLogView.caixaId := caiId;

  frmLogView.ShowModal;
end;

end.
