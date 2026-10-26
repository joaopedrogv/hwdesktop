unit uExportPadrao;

interface

uses
  DBGrids;

type
  TCloseQueryMainFormMsg = function (AFormName: string; ADBGrid: TDBGrid; AForm: string; AFechar: Boolean; AExibirPerg: Boolean): Boolean of object;
  TShowFormMainForm = function (AFormName: string; AForm: string): Boolean of object;
  TShowModalFormMainForm = function (AFormName: string; AForm: string): Boolean of object;

var
  padrao_EmpresaId: Integer;
  padrao_DBName: string;

  eventoCloseQueryMainForm: TCloseQueryMainFormMsg;
  eventoShowFormMainForm: TShowFormMainForm;
  eventoShowModalFormMainForm: TShowModalFormMainForm;

implementation

procedure setPadraoEmpresaId(value: Integer; dbName: string);
begin
  padrao_EmpresaId := value;
  padrao_DBName := dbName;
end;

procedure setEventoCloseQueryMainForm(evento: TCloseQueryMainFormMsg);
begin
  eventoCloseQueryMainForm := evento;
end;

procedure setEventoShowFormMainForm(evento: TShowFormMainForm);
begin
  eventoShowFormMainForm := evento;
end;

procedure setEventoShowModalFormMainForm(evento: TShowModalFormMainForm);
begin
  eventoShowModalFormMainForm := evento;
end;

exports
  setPadraoEmpresaId, setEventoCloseQueryMainForm, setEventoShowFormMainForm, setEventoShowModalFormMainForm;

end.
