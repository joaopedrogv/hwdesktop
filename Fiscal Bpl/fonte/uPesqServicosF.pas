unit uPesqServicosF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Menus, uEditHw;

type
  TfrmPesqServicos = class(TfrmPadrao)
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    MainMenu1: TMainMenu;
    MenuFiscal1: TMenuItem;
    Edit1: TEditFiscal;
    procedure MenuFiscal1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesqServicos: TfrmPesqServicos;

implementation

uses uDtmFiscalHwF, uPrincipalF, uDadosIniFiscal;

{$R *.dfm}

procedure TfrmPesqServicos.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  SpeedButton2Click(Sender);
end;

procedure TfrmPesqServicos.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if vDadosIniF.vUsaTecladoPDV <> 'S' then
  begin
    if key = VK_TAB then
      ActiveControl := Edit1
    else if (key = VK_RETURN) or (key = vk_f3) then
      SpeedButton2Click(Sender);
  end;
end;

procedure TfrmPesqServicos.Edit1Change(Sender: TObject);
begin
  inherited;
  obServ.FindNearest([Edit1.Text]);
end;

procedure TfrmPesqServicos.Edit1Enter(Sender: TObject);
begin
  inherited;
  if vDadosIniF.vModoConsulta <> 'A' then
  begin
    Edit1.OnChange := nil;
  end
  else
  begin
    Edit1.OnChange := Edit1Change;
  end;
end;

procedure TfrmPesqServicos.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_TAB then
    ActiveControl := DBGrid1
  else if key = VK_UP then
  begin
    obServ.Prior;
    DBGrid1.SelectedRows.CurrentRowSelected := true;
  end
  else if key = VK_DOWN then
  begin
    obServ.Next;
    DBGrid1.SelectedRows.CurrentRowSelected := true;
  end
  else if (key = VK_RETURN) and (vDadosIniF.vModoConsulta <> 'A') then
  begin
    obServ.selecionaServico(Edit1.Text);
    DBGrid1.SetFocus;
  end
  else if (key = VK_RETURN) then
    SpeedButton2Click(sender);
end;

procedure TfrmPesqServicos.FormCreate(Sender: TObject);
begin
  inherited;
  if vDadosIniF.vModoConsulta <> 'A' then
    Edit1.OnChange := nil;
end;

procedure TfrmPesqServicos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if vDadosIniF.vUsaTecladoPDV = 'S' then
  begin
    if Key = VK_ESCAPE then
      ModalResult := mrCancel
    else if (key = 13) then
      ModalResult := mrOk
    else if key = 66 then
      vDadosIniF.PostKeyEx32(66, [ssShift], false)
    else if key = 67 then
      vDadosIniF.MenuFiscal;
  end
  else
  begin
    if (key = VK_F3) then //or ((key = VK_RETURN) and (vDadosIniF.vModoConsulta = 'A')) then
      ModalResult := mrOk
    else if key = VK_ESCAPE then
      ModalResult := mrCancel
    else if key = VK_F2 then
    begin
      if ActiveControl = DBGrid1 then
        Edit1.SetFocus
      else
        DBGrid1.SetFocus;
    end;
  end;
end;

procedure TfrmPesqServicos.FormShow(Sender: TObject);
begin
  inherited;
  obServ.IndexFieldNames := 'DESC_SERVICO';
  Edit1.Clear;
  if vDadosIniF.vUsaTecladoPDV = 'S' then
  begin
    GroupBox2.Caption := 'Produtos               Pressione enter para escolher';
    GroupBox1.Caption := 'Função não disponível com uso do teclado PDV';
    GroupBox1.Enabled := false;
  end;
end;

procedure TfrmPesqServicos.MenuFiscal1Click(Sender: TObject);
begin
  inherited;
  vDadosIniF.MenuFiscal;
end;

procedure TfrmPesqServicos.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TfrmPesqServicos.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

end.

