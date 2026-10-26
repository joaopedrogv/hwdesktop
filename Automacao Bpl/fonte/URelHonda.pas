unit URelHonda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ComObj, Mask, IniFiles, uDataSet_OOP,
   DB, IBQuery, DBClient, QRCtrls, AppEvnts, UClassesFabrica, ExtCtrls, FileCtrl;


type
  TfrmRelHonda = class(TForm)
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    MaskEdit2: TMaskEdit;
    Label3: TLabel;
    MaskEdit3: TMaskEdit;
    ProgressBar1: TProgressBar;
    Panel2: TPanel;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    ComboBox1: TComboBox;
    BitBtn1: TBitBtn;
    Label4: TLabel;
    EditDiretorio: TEdit;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelHonda: TfrmRelHonda;
  auxstr: ANSIstring;
  inifile: Tinifile;
  ObFabrica: TFabricaHonda;

implementation

uses
 DBCtrls, RTLConsts, uDadosIni, uDtmAtivo, Printers, IBCustomDataSet;

{$R *.dfm}

procedure TfrmRelHonda.BitBtn1Click(Sender: TObject);
begin
 try
   BitBtn4.Enabled:=false;
   BitBtn5.Enabled:=false;
   ObFabrica.TipoRelatorio := 'RelEstoqueInicial';
   ObFabrica.MontarArquivoHonda;
  finally
   vDadosIni._GravaConfiguracoesString('EditDiretorio', trim(EditDiretorio.Text));
   BitBtn4.Enabled:=true;
   BitBtn5.Enabled:=true;
  end;
end;

procedure TfrmRelHonda.BitBtn2Click(Sender: TObject);
var
 vTemp: string;
begin
  try
    SelectDirectory('Favor informar o local do Arquivo!', '', vTemp);
    EditDiretorio.Text := vTemp;
    vDadosIni._GravaConfiguracoesString('EditDiretorio', trim(EditDiretorio.Text));
  except
  end;
end;

procedure TfrmRelHonda.BitBtn4Click(Sender: TObject);
begin
  if MaskEdit1.Text = '  /  /    ' then
  begin
    Application.MessageBox('Data Inicial não informada', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    if (Self.Enabled) and (Self.Visible) and (MaskEdit1.CanFocus) then
      MaskEdit1.SetFocus;
    Exit;
  end;
  if MaskEdit2.Text = '  /  /    ' then
  begin
    Application.MessageBox('Data Final não informada', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    if (Self.Enabled) and (Self.Visible) and (MaskEdit2.CanFocus) then
      MaskEdit2.SetFocus;
    Exit;
  end;

  try
   StrToDate(MaskEdit1.Text);
  except
    Application.MessageBox('Data Inicial inválida', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    if (Self.Enabled) and (Self.Visible) and (MaskEdit1.CanFocus) then
      MaskEdit1.SetFocus;
    Exit;
  end;

  try
   StrToDate(MaskEdit2.Text);
  except
    Application.MessageBox('Data Final inválida', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    if (Self.Enabled) and (Self.Visible) and (MaskEdit2.CanFocus) then
      MaskEdit2.SetFocus;
    Exit;
  end;

  if trim(EditDiretorio.Text) = '' then
  begin
    Application.MessageBox('Diretório não informado', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    if (Self.Enabled) and (Self.Visible) and (EditDiretorio.CanFocus) then
      EditDiretorio.SetFocus;
    Exit;
  end;

  try
   ObFabrica.datainicial := strtodate(MaskEdit1.Text);
   ObFabrica.datafinal := StrToDate(MaskEdit2.Text);
   ObFabrica.TipoRelatorio := trim(ComboBox1.Text);
   ObFabrica.Diretorio := trim(EditDiretorio.Text);

   BitBtn4.Enabled:=false;
   BitBtn5.Enabled:=false;

   ObFabrica.MontarArquivoHonda;
  finally
   vDadosIni._GravaConfiguracoesString('EditDiretorio', trim(EditDiretorio.Text));
   BitBtn4.Enabled:=true;
   BitBtn5.Enabled:=true;
  end;
end;

procedure TfrmRelHonda.BitBtn5Click(Sender: TObject);
begin
 vDadosIni._GravaConfiguracoesString('EditDiretorio', trim(EditDiretorio.Text));
 Close;
end;

procedure TfrmRelHonda.ComboBox1Exit(Sender: TObject);
begin
  if ComboBox1.ItemIndex = 0 then
  begin
    BitBtn1.Visible := True;
    BitBtn4.Hint := 'Montar Arquivo de Vendas por Chassi - [FAB006]';
  end
  else
  begin
    BitBtn1.Visible := False;
    BitBtn4.Hint := 'Montar Arquivo de Clientes - [FAB007]';
  end;
end;

procedure TfrmRelHonda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if Assigned(ObFabrica) then
  FreeAndNil(ObFabrica);
  Action := caFree;
end;

procedure TfrmRelHonda.FormCreate(Sender: TObject);
begin
  ObFabrica := TFabricaHonda.create;
  FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmRelHonda.FormShow(Sender: TObject);
var
 vDiretorio: string;
begin
 EditDiretorio.Text := 'C:\';
 vDiretorio := vDadosIni._LerConfiguracoesRegistroString('EditDiretorio');
 if trim(vDiretorio) <> '' then
   EditDiretorio.Text := trim(vDiretorio);
 frmRelHonda := TfrmRelHonda(Self);
 if vDadosIni.getCampoPipe(UpperCase(vDadosIni.vPesquisa), 1) = 'RELARQUIVOVENDAPORCHASSI' then
 begin
   ComboBox1.ItemIndex := 0;
   BitBtn1.Visible := True;
   BitBtn4.Hint := 'Montar Arquivo de Vendas por Chassi - [FAB006]';
 end
 else
 begin
   ComboBox1.ItemIndex := 1;
   BitBtn1.Visible := False;
   BitBtn4.Hint := 'Montar Arquivo de Clientes - [FAB007]';
 end;
end;

initialization
  RegisterClass(TfrmRelHonda);
finalization
  UnRegisterClass(TfrmRelHonda);


end.
