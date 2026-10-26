unit uReestrutura_Aplicar_View;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, Grids, DBGrids, ExtCtrls, DB, Menus, Buttons;

type
  TfrmReestrutura_Aplicar_View = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    Panel5: TPanel;
    BitBtn1: TBitBtn;
    Panel6: TPanel;
    Panel7: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Panel8: TPanel;
    Label4: TLabel;
    Panel9: TPanel;
    DBMemo1: TDBMemo;
    Panel10: TPanel;
    Panel11: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBMemo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReestrutura_Aplicar_View: TfrmReestrutura_Aplicar_View;

implementation

uses uReestrutura_Classes;

{$R *.dfm}

procedure TfrmReestrutura_Aplicar_View.DBMemo1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F2 then
  begin
    DBMemo1.WordWrap := not DBMemo1.WordWrap;
    if DBMemo1.WordWrap then
      DBMemo1.Hint := 'Script a executar - F2: Ativar ou desativar quebra de linha - Quebra de Linha -> Ativada'
    else
      DBMemo1.Hint := 'Script a executar - F2: Ativar ou desativar quebra de linha - Quebra de Linha -> Desativada';
  end;
end;

procedure TfrmReestrutura_Aplicar_View.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmReestrutura_Aplicar_View := nil;
end;

procedure TfrmReestrutura_Aplicar_View.FormShow(Sender: TObject);
begin
  DBGrid1.DataSource := reestrutura.DataSource_Script;
  DBEdit1.DataSource := reestrutura.DataSource_Script;
  DBEdit2.DataSource := reestrutura.DataSource_Script;
  DBEdit3.DataSource := reestrutura.DataSource_Script;
  DBMemo1.DataSource := reestrutura.DataSource_Script;

  DBEdit1.DataField := 'versao';
  DBEdit2.DataField := 'build';;
  DBEdit3.DataField := 'opcoes';
  DBMemo1.DataField := 'script';
end;

procedure TfrmReestrutura_Aplicar_View.SpeedButton1Click(Sender: TObject);
begin
  if reestrutura.DataSource_Script.DataSet <> nil then
    reestrutura.DataSource_Script.DataSet.Prior;
end;

procedure TfrmReestrutura_Aplicar_View.SpeedButton2Click(Sender: TObject);
begin
  if reestrutura.DataSource_Script.DataSet <> nil then
    reestrutura.DataSource_Script.DataSet.Next;
end;

end.
