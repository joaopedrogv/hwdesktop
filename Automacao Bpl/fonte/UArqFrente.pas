unit UArqFrente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ComCtrls, DB,
  Gauges, Mask, uClasseLayoutFiscal;

type
  TFrmArqFrente = class(TForm)
    GroupBox2: TGroupBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    OpenDialog1: TOpenDialog;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    Gauge1: TGauge;
    GroupBox3: TGroupBox;
    aliq: TCheckBox;
    Barra: TCheckBox;
    CadFP: TCheckBox;
    Cliente: TCheckBox;
    ConfImp: TCheckBox;
    ConsPw: TCheckBox;
    Cupom: TCheckBox;
    Cupom2: TCheckBox;
    CupomInt: TCheckBox;
    Cupom2Int: TCheckBox;
    DA: TCheckBox;
    Empresa: TCheckBox;
    FinCupom: TCheckBox;
    FormPag: TCheckBox;
    ForPgto: TCheckBox;
    Funcion: TCheckBox;
    Itbx: TCheckBox;
    PendPreV: TCheckBox;
    PrestTemp: TCheckBox;
    Processos: TCheckBox;
    Produto: TCheckBox;
    ResumoD: TCheckBox;
    SangSup: TCheckBox;
    Tecl: TCheckBox;
    TempOp: TCheckBox;
    Terminais: TCheckBox;
    TipFinal: TCheckBox;
    Tip75: TCheckBox;
    TransTEF: TCheckBox;
    BitBtn2: TBitBtn;
    Edit2: TEdit;
    SpeedButton2: TSpeedButton;
    SaveDialog1: TSaveDialog;
    Gauge2: TGauge;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Servicos: TCheckBox;
    Label8: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);

    procedure cancelatudo;
    function validaArquivo: boolean;
    function transformadata(data: string): TDate;
    function transformafloat(valor: string): Double;
    function transformainteiro(valor: string): integer;

  private
    { Private declarations }
    function existeProduto(codigo, grupo: string): boolean;
  public
    { Public declarations }
  end;

var
  FrmArqFrente: TFrmArqFrente;
  patharquiv: string;
  arqtxt: TextFile;
  linha: AnsiString;
  cancelar: Boolean;
  obLayout: TLayoutFiscal40;


implementation

  uses udtmTerminalF, uDtmAtivo, uDadosIni;

{$R *.dfm}

procedure TFrmArqFrente.BitBtn1Click(Sender: TObject);
begin
  obLayout.iniciaImportacao(Edit1.Text,Label5,Label8, Label6,Label7,Gauge1);
end;

procedure TFrmArqFrente.BitBtn2Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if (MaskEdit1.Text = '') or (MaskEdit2.Text = '') then
    begin
      MessageDlg('Data para importação dos cupons não preenchida!', mtInformation, [mbOK], 0);
      exit;
    end;
    if (MaskEdit1.Text = '  /  /    ') or (MaskEdit2.Text = '  /  /    ') then
    begin
      MessageDlg('Data para importação dos cupons não preenchida corretamente!', mtInformation,
        [mbOK], 0);
      exit;
    end;
    if trim(Edit2.Text) = '' then
          begin
            SaveDialog1.Title:='Salvar arquivo para o Terminal '+vDadosIni.vCodTerminal;
            SaveDialog1.FileName:='Terminal '+vDadosIni.vCodTerminal;
            if SaveDialog1.Execute then
            begin
              if Pos('.txt',LowerCase(SaveDialog1.FileName))=0 then
                SaveDialog1.FileName:=SaveDialog1.FileName+'.txt';
              Edit2.Text:=SaveDialog1.FileName;
              if not validaArquivo then
                exit;
            end
            else
              exit;
          end;
    Screen.Cursor:=crHourGlass;
    obLayout.iniciaExportacao(StrToDate(MaskEdit1.Text), StrToDate(MaskEdit2.Text), Label4, Gauge2,
      Edit2.Text);
  finally
    Screen.Cursor := crDefault;
    Barra.Checked := False;
    Cliente.Checked := False;
    Cupom.Checked := False;
    Cupom2.Checked := False;
    Empresa.Checked := False;
    FinCupom.Checked := False;
    FormPag.Checked := False;
    Funcion.Checked := False;
    Produto.Checked := False;
    ResumoD.Checked := False;
    SangSup.Checked := False;
    Servicos.Checked := False;
    TipFinal.Checked := False;
  end;
  (*  try
      Screen.Cursor:=crHourGlass;
      if (MaskEdit1.Text = '') or (MaskEdit2.Text = '')then
      begin
        MessageDlg('Data para importação dos cupons não preenchida!',mtInformation,[mbOK],0);
        exit;
      end;
      if (MaskEdit1.Text = '  /  /    ') or (MaskEdit2.Text = '  /  /    ') then
      begin
        MessageDlg('Data para importação dos cupons não preenchida corretamente!',mtInformation,[mbOK],0);
        exit;
      end;
      DtmSup.cdsTerminalF.First;
      while not DtmSup.cdsTerminalF.eof do
      begin
        if DBGrid1.SelectedRows.CurrentRowSelected then
        begin
          if trim(Edit2.Text) = '' then
          begin
            SaveDialog1.Title:='Salvar arquivo para o '+DtmSup.cdsTerminalFNOME_TERMINAL.AsString;
            SaveDialog1.FileName:=DtmSup.cdsTerminalFNOME_TERMINAL.AsString;
            if SaveDialog1.Execute then
            begin
              if Pos('.txt',LowerCase(SaveDialog1.FileName))=0 then
                SaveDialog1.FileName:=SaveDialog1.FileName+'.txt';
              Edit2.Text:=SaveDialog1.FileName;
              if not validaArquivo then
                exit;
            end
            else
              exit;
          end;
          try
            Screen.Cursor:=crHourGlass;
            Gauge2.Visible:=true;
            Label4.Visible:=true;
            patharquiv:=Edit2.Text;
            AssignFile(arqtxt,patharquiv);
            Rewrite(arqtxt);
            Writeln(arqtxt,'Supervisor');
            if Barra.Checked then
              montaCodBarra;
            if Cliente.Checked then
              montaclientes;
            if Cupom.Checked then
              montaCupom;
            if Cupom2.Checked then
              montaCupom2;
            if Empresa.Checked then
              montaEmpresa;
            if FinCupom.Checked then
              montaFimCupom;
            if FormPag.Checked then
              montaFormPag;
            if Funcion.Checked then
              montaFuncionarios;
            if Produto.Checked then
              montaProdutos;
            if ResumoD.Checked then
              montaResumoD;
            if SangSup.Checked then
              montaSangSup;
            if Servicos.Checked then
              montaServicos;
            if TipFinal.Checked then
              montaTipFinal;
            Writeln(arqtxt,'fimarquivo');
            Label4.Caption:='Arquivo montado com sucesso! '+Edit2.Text;
          finally
            CloseFile(arqtxt);
            Gauge2.Visible:=false;
      //      Label4.Visible:=false;
          end;
        end;
        Edit2.Text:='';
        DtmSup.cdsTerminalF.Next;
      end;
    finally
      Screen.Cursor:=crDefault;
      Barra.Checked:=False;
      Cliente.Checked:=False;
      Cupom.Checked:=False;
      Cupom2.Checked:=False;
      Empresa.Checked:=False;
      FinCupom.Checked:=False;
      FormPag.Checked:=False;
      Funcion.Checked:=False;
      Produto.Checked:=False;
      ResumoD.Checked:=False;
      SangSup.Checked:=False;
      Servicos.Checked:=False;
      TipFinal.Checked:=False;
    end;    *)
end;

procedure TFrmArqFrente.cancelatudo;
begin
  PageControl1.ActivePage.Show;
end;

function TFrmArqFrente.existeProduto(codigo, grupo: string): boolean;
begin
  (*  try
      result:=true;
      dbisbuscas.close;
      dbisbuscas.DatabaseName:= trim(DtmSup.cdsTerminalFEND_TERMINAL.AsString);
      dbisbuscas.SQL.Text:='select * from produto where grupo = '+grupo+
      ' and codigo = '+codigo;
      dbisbuscas.Open;
      if dbisbuscas.IsEmpty then
        result:=false;
      dbisbuscas.close;
    except
      result:=false;
    end;                                   *)
end;

procedure TFrmArqFrente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //  DtmSup.cdsTerminalF.Close;
  Action := caFree;
  FrmArqFrente := nil;
end;

procedure TFrmArqFrente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //  if (key = vk_f1) then
  //    VdadosIni.MostraAjuda(TForm(Sender).Name);
end;

procedure TFrmArqFrente.FormShow(Sender: TObject);
begin
  obLayout := TLayoutFiscal40.create;
//  obLayout.abreTerminais;
  //  cancelar:=false;
  //  DtmSup.cdsTerminalF.Close;
  //  DtmSup.cdsTerminalF.Open;
end;

procedure TFrmArqFrente.SpeedButton1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    Edit1.Text := OpenDialog1.FileName;
end;

procedure TFrmArqFrente.SpeedButton2Click(Sender: TObject);
begin
  //  SaveDialog1.FileName:=DtmSup.cdsTerminalFNOME_TERMINAL.AsString;
  //  SaveDialog1.Title:='Salvar arquivo para o '+DtmSup.cdsTerminalFNOME_TERMINAL.AsString;
  //  if SaveDialog1.Execute then
  //    Edit2.Text:=SaveDialog1.FileName;
end;

procedure TFrmArqFrente.TabSheet1Show(Sender: TObject);
begin
  Gauge1.Visible := false;
  Label5.Visible := false;
end;

procedure TFrmArqFrente.TabSheet2Show(Sender: TObject);
begin
  Gauge2.Progress := 0;
//  Gauge2.Visible := false;
//  Cliente.Checked := false;
//  Cupom.Checked := false;
//  Cupom2.Checked := false;
//  ResumoD.Checked := false;
//  SangSup.Checked := false;
//  FinCupom.Checked := false;
//  TipFinal.Checked := false;
//  FormPaG.Checked := false;
  Label4.Caption := 'Aguardando...';
  Edit2.Clear;
end;

function TFrmArqFrente.transformadata(data: string): TDate;
begin
  try
    result := StrToDate(Copy(data, 1, 2) + '/' + Copy(data, 3, 2) + '/' + Copy(data, 5, 4));
  except
    result := 0;
  end;
end;

function TFrmArqFrente.transformafloat(valor: string): Double;
var
  vdouble: Double;
  temp: string;
begin
  try
    temp := Copy(valor, 1, 6) + ',' + Copy(valor, 7, 2);
    vdouble := StrToFloat(temp);
    Result := vdouble;
  except
    result := 0;
  end;
end;

function TFrmArqFrente.transformainteiro(valor: string): integer;
var
  inteiro: integer;
begin
  try
    inteiro := StrToInt(valor);
    result := inteiro;
  except
    result := 0;
  end;
end;

function TFrmArqFrente.validaArquivo: boolean;
var
  i: Integer;
begin
  if Trim(Edit2.Text) = '' then
  begin
    MessageDlg('Diretório informado não encontrado.', mtInformation, [mbOK], 0);
    result := false;
  end
  else
  begin
    if Pos('.TXT', UpperCase(Edit2.Text)) > 0 then
    begin
      i := Length(Edit2.Text);
      while i <> 0 do
      begin
        if Edit2.Text[i] = '\' then
        begin
          if DirectoryExists(Copy(Edit2.Text, 1, i - 1)) then
          begin
            result := true;
            exit;
          end
          else
          begin
            //            if MessageDlg('Diretório informado não encontrado.',mtInformation,[mbYes,mbNo],0) = mrYes then
            if Application.MessageBox('Diretório informado não encontrado.', 'Confirmação',
              MB_YESNO + MB_DEFBUTTON2) = mrYES then
            begin
              if CreateDir(Copy(Edit2.Text, 1, i - 1)) then
              begin
                result := true;
                exit;
              end
              else
              begin
                MessageDlg('Não foi possivel criar o diretório.', mtInformation, [mbOK], 0);
                result := false;
              end;
            end;
          end;
        end;
        Dec(i);
      end;
      MessageDlg('Diretório informado não encontrado.', mtInformation, [mbOK], 0);
    end
    else
    begin
      MessageDlg('Extensão do arquivo diferente do esperado: *.txt', mtInformation, [mbOK], 0);
      result := false;
    end;
  end;
end;

end.

