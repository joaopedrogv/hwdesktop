unit UclassesintegraFab;

interface

uses
  uDataSet_OOP, DBClient, uDtmAtivo, Db, Windows, Forms, Controls, Variants,
  ComObj, ComCtrls, ExtCtrls, RDprint, IBQuery, IBStoredProc,
  uCadPadrao, IniFiles, FileCtrl, DateUtils;

type


  TIntegraFab= class
  //(TDataSet_OOP)
  private
  public
    destructor Destroy; override;
    constructor create;
    procedure cadIntegraFab(TipoForm: Integer);
//  var
  end;

implementation

uses UintegraHonda;

{ TIntegraFab }

procedure TIntegraFab.cadIntegraFab(TipoForm: Integer);
begin
 if vDadosIni.vfabrica = 'HONDA'  then
 begin
  Application.CreateForm(TFrmIntegraHonda, FrmIntegraHonda);
  FrmIntegraHonda.ShowModal;
 end;
end;

constructor TIntegraFab.create;
begin

end;

destructor TIntegraFab.Destroy;
begin

  inherited;
end;

end.
