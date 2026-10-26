unit UTransDepVeiculosCCIA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, uClassesVeiculosCCIA;

type
  TfrmTransDepVeiculosCCIA = class(TForm)
    Panel1: TPanel;
    Label30: TLabel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn19: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTransDepVeiculosCCIA: TfrmTransDepVeiculosCCIA;
  TransfDep: TTransfDepCCIA;

implementation
uses  uDtmAtivo, UDtmVeiculosCCIA, uDataSet_OOP, DBClient, Clipbrd, Registry;

{$R *.dfm}

procedure TfrmTransDepVeiculosCCIA.BitBtn19Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('VEI084', 'RETIRAR RESERVA VEICULO DEPOSITO', '', 'TRANSF_DEP', '',
    TransfDep.buscas, true) then
    Exit;

  TransfDep.RetirarReservaTranfDep;
end;

procedure TfrmTransDepVeiculosCCIA.BitBtn1Click(Sender: TObject);
begin
// if not vDadosIni.PesqPros('VEI083', 'RESERVAR VEICULO DEPOSITO', '', 'TRANSF_DEP', '',
//    TransfDep.buscas, true) then
//    Exit;
//
// TransfDep.SalvarReservaTranfDep;

 try
    if TransfDep.dataSet.IsEmpty then
      Exit;

    if not vDadosIni.PesqPros('VEI062', 'CONSULTA', '', 'EST_MOTO', '',
      TransfDep.buscas, true) then
      Exit;

    Screen.Cursor := crHourGlass;

    if not TransfDep.vReserva.abreFormReserva(
    	1,
      TransfDep.dataSet.FieldByName('CODIGO').AsInteger,
     	TransfDep.dataSet.FieldByName('COD_EMPRESA').AsInteger,
      TransfDep.dataSet.FieldByName('CHASSI_C').AsString) then
        exit;

    TransfDep.dataSet.Refresh;  
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmTransDepVeiculosCCIA.BitBtn4Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmTransDepVeiculosCCIA.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ((Key = VK_TAB) or (key = VK_RETURN)) then
  begin
    if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
     BitBtn4.SetFocus;
  end
  else if Key = VK_ESCAPE then
   BitBtn4Click(Sender);
end;

procedure TfrmTransDepVeiculosCCIA.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if (TransfDep <> nil) then
    TransfDep.Cancel;

  TransfDep.free;
  TransfDep := nil;

  Action := caFree;
  if (frmTransDepVeiculosCCIA<> nil) then
    frmTransDepVeiculosCCIA := nil;
end;

procedure TfrmTransDepVeiculosCCIA.FormCreate(Sender: TObject);
begin
  if DtmVeiculosCCIA = nil then
    DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);
  TransfDep := TTransfDepCCIA.create;
end;

initialization
  RegisterClass(TfrmTransDepVeiculosCCIA);
finalization
  UnRegisterClass(TfrmTransDepVeiculosCCIA);

end.
