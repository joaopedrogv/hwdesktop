unit uSangSup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Buttons, StdCtrls, jpeg, ExtCtrls, Mask, DBCtrls, Grids,
  DBGrids, Menus;

type
  TfrmSangSup = class(TfrmPadrao)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Image1: TImage;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    MaskEdit1: TMaskEdit;
    MainMenu1: TMainMenu;
    MenuFiscal1: TMenuItem;
    procedure MenuFiscal1Click(Sender: TObject);
    procedure DBEdit2Enter(Sender: TObject);
    procedure DBEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSangSup: TfrmSangSup;

implementation

uses
  uCupom, uPrincipalF, uDtmFiscal, uDtmConfigF, DB, uDtmAtivo,
    uDadosIniFiscal, uClassesRetaguarda;

{$R *.dfm}

procedure TfrmSangSup.BitBtn1Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    BitBtn4.SetFocus;
    if not obSangSup.sangriaPermitida(obFinalizador.dataSet.FieldByName('cod_finalizador').AsInteger) then
      exit;

    if vDadosIniF.SangriaOuSuprimento(obSangSup.dataSet.FieldByName('valor').AsFloat,
      copy(obSangSup.dataSet.FieldByName('sangsuprimento').AsString, 1, 3)) then
    begin
      if obSangSup.Post1(obFinalizador.dataSet.FieldByName('cod_finalizador').AsInteger) then
      begin
        //        obSangSup.CommitaTransacao;
        //      obSangSup.Refresh;
        obSangSup.vFinCupom.insereFimCupom(obSangSup.dataSet.FieldByName('nreg').AsInteger,
          obSangSup.dataSet.FieldByName('coonaofiscal').AsInteger,
          obSangSup.dataSet.FieldByName('finalizador').AsInteger, 0,
          StrToInt(Trim(CImpressoraF.numeroGNF)), 0,
          obSangSup.dataSet.FieldByName('valor').AsCurrency,
          obSangSup.dataSet.FieldByName('valor').AsCurrency,
          copy(obSangSup.dataSet.FieldByName('sangsuprimento').AsString, 1, 3));
        vDadosIni.GravaAuditoria('FIS010', 'SANGRIA/SUPRIMENTO', 'EMISSÃO DE SANGRIA/SUPRIMENTO',
          'SANGSUP', '');
        try
          Screen.Cursor := crHourGlass;
          if vDadosIniF.vSincronizacaoEmSegundoPlano <> 'S' then
            try
              vDadosIniF.abreStatusProcessamento('Sincronização', 'Aguarde. Sincronizando dados');
              vHwSinc._sincronizarDados;
            finally
              vDadosIniF.fechaStatusProcessamento;
            end;
        finally
          Screen.Cursor := crDefault;
          vDadosIniF.limpaMensagem;
        end;
        if vDadosIniF.vUsaTecladoPDV = 'S' then
        begin
          close;
        end;
        BitBtn1.Enabled := False;
      end;
    end
    else
      DBEdit1.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmSangSup.BitBtn2Click(Sender: TObject);
begin
  inherited;
  obSangSup.Cancel;
  BitBtn1.Enabled := False;
  Close;
end;

procedure TfrmSangSup.BitBtn4Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmSangSup.DBEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = 13 then
    DBEdit2.SetFocus;
end;

procedure TfrmSangSup.DBEdit2Enter(Sender: TObject);
begin
  inherited;
  Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmSangSup.DBEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = 13 then
    DBGrid1.SetFocus;
end;

procedure TfrmSangSup.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = 13 then
    Perform(WM_NEXTDLGCTL,0,0);
//    BitBtn1.SetFocus;
end;

procedure TfrmSangSup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  obSangSup.Cancel;
end;

procedure TfrmSangSup.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if vDadosIniF.vUsaTecladoPDV = 'S' then
    begin
      if Key = VK_ESCAPE then
        close;
      if obSangSup.dataSet.State = dsBrowse then
      begin
        if key = VK_UP then
          SpeedButton1Click(Sender)
        else if key = VK_DOWN then
          SpeedButton4Click(Sender)
        else if key = VK_LEFT then
          SpeedButton2Click(Sender)
        else if key = VK_RIGHT then
          SpeedButton3Click(Sender);
      end;
    end
    else
    begin
      if Key = VK_F2 then
        BitBtn1Click(Sender)
      else if Key = VK_F3 then
        BitBtn2Click(Sender)
      else if Key = VK_F4 then
        SpeedButton5Click(Sender)
      else if Key = VK_F5 then
        SpeedButton6Click(Sender)
      else if key = VK_F6 then
        BitBtn1Click(Sender)
      else if key = VK_ESCAPE then
        close;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmSangSup.FormShow(Sender: TObject);
begin
  inherited;
  obSangSup.abreSangSupParaInclusao;
  obFinalizador.getTodos;
  BitBtn1.Enabled := False;
  if vDadosIniF.vUsaTecladoPDV = 'S' then
  begin
    SpeedButton5.Caption := 'Sangria (1)';
    SpeedButton6.Caption := 'Suprimento (2)';
    BitBtn2.Caption := 'Cancela (Esc)';
    MaskEdit1.Visible := true;
    MaskEdit1.SetFocus;
    Label3.Visible := true;
  end;
end;

procedure TfrmSangSup.MaskEdit1Exit(Sender: TObject);
begin
  inherited;
  if (MaskEdit1.Text <> '1') and (MaskEdit1.Text <> '2') then
  begin
    Application.MessageBox('Opção inválida', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    MaskEdit1.SetFocus;
    exit;
  end;
  if (MaskEdit1.Text = '1') then
  begin
    SpeedButton5Click(Sender);
  end
  else if (MaskEdit1.Text = '2') then
  begin
    SpeedButton6Click(Sender);
  end;
end;

procedure TfrmSangSup.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = 13 then
    DBEdit1.SetFocus;
end;

procedure TfrmSangSup.MenuFiscal1Click(Sender: TObject);
begin
  inherited;
  vDadosIniF.MenuFiscal;
end;

procedure TfrmSangSup.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  obsangsup.first;
end;

procedure TfrmSangSup.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  obSangSup.Prior;
end;

procedure TfrmSangSup.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  obSangSup.Next;
end;

procedure TfrmSangSup.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  obSangSup.Last;
end;

procedure TfrmSangSup.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    obSangSup.insereSangria;
    DBEdit1.SetFocus;
    BitBtn1.Enabled := True;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmSangSup.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    obSangSup.insereSuprimento;
    DBEdit1.SetFocus;
    BitBtn1.Enabled := True;
  finally
    Screen.Cursor := crDefault;
  end;
end;

end.

