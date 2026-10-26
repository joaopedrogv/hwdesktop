unit USincTerminais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, Mask, ComCtrls, UClassesFinalizadores, 
  DBGrids, ExtCtrls;

type
  TFrmSincTerminais = class(TfrmPadrao)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ProgressBar1: TProgressBar;
    BitBtn3: TBitBtn;
    CheckBox10: TCheckBox;
    GroupBox2: TGroupBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    BitBtn4: TBitBtn;
    Label5: TLabel;
    MaskEdit3: TMaskEdit;
    ProgressBar2: TProgressBar;
    Label6: TLabel;
    CheckBox16: TCheckBox;
    SaveDialog1: TSaveDialog;
    SpeedButton1: TSpeedButton;
    BitBtn5: TBitBtn;
    OpenDialog1: TOpenDialog;
    Label7: TLabel;
    MaskEdit4: TMaskEdit;
    SpeedButton2: TSpeedButton;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    RadioGroup3: TRadioGroup;
    GroupBox3: TGroupBox;
    MaskEdit5: TMaskEdit;
    procedure MaskEdit5Exit(Sender: TObject);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var
//      vterminais: TTerminaisF;
      vgrid: tdbgrid;
  end;

var
  FrmSincTerminais: TFrmSincTerminais;

implementation

uses UdtmAtivo, uDadosIni;

{$R *.dfm}

procedure TFrmSincTerminais.BitBtn1Click(Sender: TObject);
begin
  inherited;
 cadTerminais.First;
 try
  cadTerminais.vdtini:=StrToDate(MaskEdit1.text);
  cadTerminais.vdtfim:=StrToDate(MaskEdit2.text);
 except
  application.messagebox('Datas inválidas ou não preenchidas', 'Informação', MB_ICONINFORMATION + MB_OK);
  exit;
 end;
 while not cadTerminais.eof do
 begin
  if vgrid.SelectedRows.CurrentRowSelected then
  begin
    if vDadosIni.conectaBanco(dtmAtivo.bancoFiscal,cadTerminais.dataSet.FieldByName('END_TERMINAL').AsString,true) then
    begin
     if CheckBox15.Checked then
       cadTerminais.sincterminal(1,ProgressBar1,label3,'');
     if CheckBox10.Checked then
       cadTerminais.sincterminal(2,ProgressBar1,label3,'');
    end;
  end;
  cadTerminais.next;
 end;
 if cadTerminais.vparar <> 0 then
    application.messagebox('Sincronização Terminal -> Retaguarda foi Cancelada com Sucesso',
      'Informação', MB_ICONINFORMATION + MB_OK)
  else if vDadosIni.vInibeMensPesqPros <> 'S' then
  begin
    application.messagebox('Sincronização Terminal - >Retaguarda foi executado com Sucesso',
      'Informação', MB_ICONINFORMATION + MB_OK);
    Close;
  end;
end;

procedure TFrmSincTerminais.BitBtn3Click(Sender: TObject);
begin
  inherited;
  cadTerminais.vparar:=1;
end;

procedure TFrmSincTerminais.BitBtn4Click(Sender: TObject);
var
  vTime: TTime;
begin
  inherited;
  try

    if not vDadosIni.PesqPros('TERM012', 'VISUALIZAR', '','TERMINALF',
      cadTerminais.dataSet.FieldByName('COD_TERMINAL').AsString+'-'+
      cadTerminais.dataSet.FieldByName('NOME_TERMINAL').AsString,
      cadTerminais.buscas, true) then
       exit;

    Screen.Cursor := crHourGlass;
    BitBtn4.Enabled := False;
    BitBtn5.Visible := True;
    vDadosIni.vParar := 0;
    cadTerminais.vSincMercadorias := RadioGroup1.ItemIndex;
    cadTerminais.vSincClientes := RadioGroup2.ItemIndex;
    cadTerminais.vSincDemais := RadioGroup3.ItemIndex;
    cadTerminais.vSincDataBase := StrToDate(MaskEdit5.Text);

    _GravaConfiguracoesInteger(RadioGroup1.Name, RadioGroup1.ItemIndex);
    _GravaConfiguracoesInteger(RadioGroup2.Name, RadioGroup2.ItemIndex);
    _GravaConfiguracoesInteger(RadioGroup3.Name, RadioGroup3.ItemIndex);

    vTime := now;
    if vgrid = nil then
      cadTerminais.MontarArquivoHwF(ProgressBar2, Label6, MaskEdit3.text,nil)
    else
      cadTerminais.MontarArquivoHwF(ProgressBar2, Label6, MaskEdit3.text,vgrid);
  finally
    Screen.Cursor := crDefault;
    BitBtn4.Enabled := True;
    BitBtn5.Visible := False;
    _GravaConfiguracoesString(MaskEdit3.Name, MaskEdit3.Text);
  end;
end;

procedure TFrmSincTerminais.BitBtn5Click(Sender: TObject);
begin
  inherited;
  vDadosIni.vParar := 1;
end;

procedure TFrmSincTerminais.FormShow(Sender: TObject);
begin
  inherited;
//  MaskEdit3.Text:=cadTerminais.enderecohwfdb;

  if cadTerminais = nil then
    cadTerminais := TTerminaisF.create;

  if Self.Tag = 1 then
  begin
    cadTerminais.abreTerminais;
    TabSheet1.TabVisible := False;
    TabSheet2.TabVisible := False;
    PageControl1.ActivePage := TabSheet2;
  end;

  MaskEdit3.Text:= _LerConfiguracoesRegistroString(MaskEdit3.Name);

  Label7.Enabled := False;
  MaskEdit4.Enabled := False;
  SpeedButton2.Enabled := False;
  if vDadosIni.vEmp.vResponsavelCopiaHwF = 'R' then
  else
    MaskEdit4.Text:= vDadosIni.vEmp.vDirCopiaHwFTerminais;

  RadioGroup1.ItemIndex := _LerConfiguracoesRegistroInteger(RadioGroup1.Name);
  RadioGroup2.ItemIndex := _LerConfiguracoesRegistroInteger(RadioGroup2.Name);
  RadioGroup3.ItemIndex := _LerConfiguracoesRegistroInteger(RadioGroup3.Name);

  if PageControl1.ActivePage = TabSheet2 then
		if (Self.Enabled) and (Self.Visible) and (MaskEdit3.CanFocus) then
      MaskEdit3.SetFocus;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TFrmSincTerminais.MaskEdit3Exit(Sender: TObject);
begin
  inherited;
  MaskEdit3.Text := ExtractFilePath(MaskEdit3.Text) + 'HwF.fdb';
  cadTerminais.ValidarArquivoHwF(MaskEdit3.Text);
  MaskEdit5.Text := DateToStr(cadTerminais.vSincDataBase);
end;

procedure TFrmSincTerminais.MaskEdit5Exit(Sender: TObject);
begin
  inherited;
  if StrToDate(MaskEdit5.Text) > cadTerminais.vSincDataBase then
  begin

    Application.MessageBox(pchar('Data Base não pode ser maior a data da última alteração: ' + DateToStr(cadTerminais.vSincDataBase)),
      'Atenção', 0 + 64 );
    MaskEdit5.Text := DateToStr(cadTerminais.vSincDataBase);

  end;
end;

procedure TFrmSincTerminais.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if OpenDialog1.Execute then
    MaskEdit3.Text := ExtractFilePath(OpenDialog1.FileName) + 'HwF.fdb';
end;

procedure TFrmSincTerminais.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if OpenDialog1.Execute then
    MaskEdit4.Text := OpenDialog1.FileName;
end;

end.
