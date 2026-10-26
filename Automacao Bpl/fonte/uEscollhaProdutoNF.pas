unit uEscollhaProdutoNF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Menus, DBCtrls;

type
  TEventConf = procedure (ADBGrid: TDBGrid) of object;
  TfrmEscolhaProdutoNf = class(TfrmPadrao)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    GroupBox2: TGroupBox;
    DBGrid2: TDBGrid;
    PopupMenu1: TPopupMenu;
    ConfigurarColunas1: TMenuItem;
    Panel2: TPanel;
    DBText1: TDBText;
    DBText2: TDBText;
    Label1: TLabel;
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure DBGrid2Exit(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
    procedure ConfigurarColunas1Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    FAbrirConfColunas: TEventConf;
    FSalvarConfColunas: TEventConf;
    procedure SetAbrirConfColunas(const Value: TEventConf);
    procedure SetSalvarConfColunas(const Value: TEventConf);
    { Private declarations }
  public
    { Public declarations }
    property AbrirConfColunas: TEventConf read FAbrirConfColunas write SetAbrirConfColunas;
    property SalvarConfColunas: TEventConf read FSalvarConfColunas write SetSalvarConfColunas;
  end;

var
  frmEscolhaProdutoNf: TfrmEscolhaProdutoNf;

implementation

uses uDtmNf, uDtmAtivo;

{$R *.dfm}

procedure TfrmEscolhaProdutoNf.BitBtn2Click(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

procedure TfrmEscolhaProdutoNf.BitBtn4Click(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TfrmEscolhaProdutoNf.ConfigurarColunas1Click(Sender: TObject);
begin
  inherited;
  if Assigned(FAbrirConfColunas) then
    FAbrirConfColunas(DBGrid1);
  if Assigned(FSalvarConfColunas) then
    FSalvarConfColunas(DBGrid1);
end;

procedure TfrmEscolhaProdutoNf.DBGrid1Exit(Sender: TObject);
begin
  inherited;
  if Assigned(FSalvarConfColunas) then
    FSalvarConfColunas(DBGrid1);
end;

procedure TfrmEscolhaProdutoNf.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    ModalResult := mrOk;
end;

procedure TfrmEscolhaProdutoNf.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(DBGrid1, Column);
end;

procedure TfrmEscolhaProdutoNf.DBGrid2Exit(Sender: TObject);
begin
  inherited;
	if Assigned(FSalvarConfColunas) then
    FSalvarConfColunas(DBGrid2);
end;

procedure TfrmEscolhaProdutoNf.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = VK_RETURN then
    ModalResult := mrOk;
end;

procedure TfrmEscolhaProdutoNf.DBGrid2TitleClick(Column: TColumn);
begin
  inherited;
	vDadosIni.DBGridOnTitleClick(DBGrid2, Column);
end;

procedure TfrmEscolhaProdutoNf.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    ModalResult := mrCancel;
end;

procedure TfrmEscolhaProdutoNf.FormShow(Sender: TObject);
begin
  inherited;
  if GroupBox1.Visible then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
    Caption:='Escolha o Produto para compor a Nota Fiscal';
    if Tag > 0 then
    Caption := Caption + ' - Item ' + vDadosIni.StrZero(Tag,3);
  end
  else if GroupBox2.Visible then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBGrid2.CanFocus) then
    	DBGrid2.SetFocus;
    Caption:='Escolha o Serviço para compor a Nota Fiscal';
  end;
  Panel2.Align := alBottom;
end;

procedure TfrmEscolhaProdutoNf.SetAbrirConfColunas(const Value: TEventConf);
begin
  FAbrirConfColunas := Value;
end;

procedure TfrmEscolhaProdutoNf.SetSalvarConfColunas(const Value: TEventConf);
begin
  FSalvarConfColunas := Value;
end;

end.

