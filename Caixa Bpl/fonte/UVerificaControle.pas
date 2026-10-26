unit UVerificaControle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons;

type
  TfrmVerificaControle = class(TfrmPadrao)
    Panel_Principal: TPanel;
    Panel_Cabecalho: TPanel;
    DBGrid_Retorno: TDBGrid;
    Label1: TLabel;
    BitBtn_OK: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid_RetornoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid_RetornoDblClick(Sender: TObject);
    procedure BitBtn_OKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVerificaControle: TfrmVerificaControle;

implementation

uses
    udtmimportpdvfinan;

{$R *.dfm}

procedure TfrmVerificaControle.BitBtn_OKClick(Sender: TObject);
begin
  inherited;
if not DBGrid_Retorno.SelectedRows.CurrentRowSelected then
      begin
        ShowMessage('Selecione um valor para processar');
        Exit;
      end
      else
      close;

end;

procedure TfrmVerificaControle.DBGrid_RetornoDblClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmVerificaControle.DBGrid_RetornoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key = VK_RETURN) then
  close;
end;

procedure TfrmVerificaControle.FormCreate(Sender: TObject);
 var
   hwndHandle : THANDLE;
   hMenuHandle : HMenu;
begin

  DBGrid_Retorno.DataSource := dtmImportPDVFinan.dsControleCreditos;

   hwndHandle := Self.Handle;
   if (hwndHandle <> 0) then
   begin
   hMenuHandle := GetSystemMenu(hwndHandle, FALSE);
      if (hMenuHandle <> 0) then
      DeleteMenu(hMenuHandle, SC_CLOSE, MF_BYCOMMAND);
   end;
end;

end.
