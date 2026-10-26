unit UDetContrl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, UclassesPend;

type
  TFrmDetContrl = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    SpeedButton1: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    caddet: TFormRecCXL;
  end;

var
  FrmDetContrl: TFrmDetContrl;

implementation

uses UDtmBalcao, uDtmAtivo, uDadosIni;

{$R *.dfm}

procedure TFrmDetContrl.BitBtn1Click(Sender: TObject);
begin
  caddet.fechdet;
  caddet.free;
end;

procedure TFrmDetContrl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 action:=cafree;
 FrmDetContrl:=nil;
end;

procedure TFrmDetContrl.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  caddet := TFormRecCXL.create;
  caddet.SomaFormCXL;

  for I := 0 to DBGrid1.FieldCount - 1 do
  begin
    if not vDadosIni.vRecibo.HabRecPorDepart then
    begin
      if (DBGrid1.Columns[I].FieldName = 'NUM_REC_DEP') OR (DBGrid1.Columns[I].FieldName = 'NUM_REC_PARC') then
        DBGrid1.Columns[I].Visible := false;
    end
    else
    begin
      if (DBGrid1.Columns[I].FieldName = 'NREQUISICAO') OR (DBGrid1.Columns[I].FieldName = 'NDOC') then
        DBGrid1.Columns[I].Visible := false;
    end;
  end;
end;

procedure TFrmDetContrl.SpeedButton1Click(Sender: TObject);
begin
  vDadosIni.montarExcel(DBGrid1, 'Detalhes CXL por Controle');
end;

end.

