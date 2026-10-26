unit uSelecionarServico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TFrmSelecionarServico = class(TForm)
    Panel3: TPanel;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSelecionarServico: TFrmSelecionarServico;

implementation

uses
  uDtmAtivo, DB;

{$R *.dfm}

procedure TFrmSelecionarServico.BitBtn4Click(Sender: TObject);
begin
  if DBGrid1.DataSource.DataSet.IsEmpty then
  begin
    Application.MessageBox(Pchar('Nenhum serviço encontrado.'), 'Atenção', MB_ICONINFORMATION + MB_OK);
    ModalResult := mrCancel;
    exit;
  end;

  vDadosIni.vPesquisaCodServico := DBGrid1.DataSource.DataSet.FieldByName('COD_SERVICO').AsInteger;
  vDadosIni.vPesquisaNitem := DBGrid1.DataSource.DataSet.FieldByName('NITEM_SERV').AsInteger;
  ModalResult := mrOK;
end;

procedure TFrmSelecionarServico.BitBtn5Click(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TFrmSelecionarServico.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then
 begin
   BitBtn4Click(Sender);
   Key := #0;
 end;      
end;

procedure TFrmSelecionarServico.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_ESCAPE then
   BitBtn5Click(Sender);
end;

procedure TFrmSelecionarServico.FormShow(Sender: TObject);
begin
  vDadosIni.fechaStatusProcessamento;
  if vDadosIni.vPesquisaCodServico > 0 then  
    DBGrid1.DataSource.DataSet.Locate('NITEM',  vDadosIni.vPesquisaCodServico, [loCaseInsensitive, loPartialKey]);
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    DBGrid1.SetFocus;
end;

end.
