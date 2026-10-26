unit UAnexoVI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ComCtrls, StdCtrls, Buttons, Mask, DB, DBClient, Grids,
  DBGrids, UClasseAdig;

type
  TFrmAnexoVI = class(TfrmPadrao)
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    ProgressBar1: TProgressBar;
    Label4: TLabel;
    Label5: TLabel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CheckBox1: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ArqAnexoVI: TRelProdAnexoVI;

  end;

var
  FrmAnexoVI: TFrmAnexoVI;

implementation

uses UDtmArqsDig, funcoes, uDtmAtivo, dateutils;

{$R *.dfm}

procedure TFrmAnexoVI.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TFrmAnexoVI.BitBtn1Click(Sender: TObject);
var
  vDataIni, vDataFim: TDate;
  vListaArq: TStringList;
begin
  inherited;
  try
    BitBtn1.Enabled := False;
    BitBtn2.Enabled := False;
    Screen.Cursor := crHourGlass;
    ProgressBar1.Visible := True;
    vListaArq := TStringList.Create;
    vListaArq.Clear;
    ArqAnexoVI.dtini := MaskEdit1.text;
    ArqAnexoVI.DtFinal := MaskEdit2.text;

    try
      vDataIni := strtodate(ArqAnexoVI.dtini);
      vDataFim := strtodate(ArqAnexoVI.DtFinal);
    except
      Application.MessageBox('Data inicial ou Final inválida(s) para o período informado!!!', 'Atenção', 0 + 64);
      exit;
    end;

    if strtodate(ArqAnexoVI.dtini) > strtodate(ArqAnexoVI.DtFinal) then
    begin
      Application.MessageBox('Data inicial maior que a data Final!!!', 'Atenção', 0 + 64);
      Exit;
    end;

    while vDataIni <= vDataFim do
    begin
      ArqAnexoVI.dtini := DateToStr(vDataIni);
      ArqAnexoVI.DtFinal := DateToStr(vDataIni);
      ArqAnexoVI.vDtMov := DateToStr(vDataIni);
      ArqAnexoVI.vcdterminal := ArqAnexoVI.Fterminais.dataSet.FieldByName('COD_TERMINAL').AsInteger;
      ArqAnexoVI.vPelaReducao := 'N';
      ArqAnexoVI.vGerarArqMesmoSemMov := CheckBox1.Checked;
      ArqAnexoVI.montarquivoVI(vdadosini.vPathArquivosDigitais + '\', ProgressBar1, Label4);
      if Trim(ArqAnexoVI.NomeArq) <> '' then
        vListaArq.Add(ArqAnexoVI.NomeArq);
      vDataIni := vDataIni + 1;
    end;

    if vListaArq.Count >= 1 then    
      Application.MessageBox(pchar('Processo concluído. Arquivos criados abaixo:' + #13 + vListaArq.Text ), 'Atenção', 0 + 64)
    else
      Application.MessageBox(pchar('Processo concluído. Sem movimento no periodo informado'), 'Atenção', 0 + 64);

    ModalResult := mrOK;
  finally
    BitBtn1.Enabled := True;
    BitBtn2.Enabled := True;
    ProgressBar1.Visible := False;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmAnexoVI.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := cafree;
  FrmAnexoVI := nil;
end;

procedure TFrmAnexoVI.FormCreate(Sender: TObject);
begin
  inherited;
  if DtmArqsDig = nil then
  begin
    DtmArqsDig := TDtmArqsDig.Create(Self);
    DtmArqsDig.criaDtm;
  end;
  ArqAnexoVI := TRelProdAnexoVI.create;
end;

procedure TFrmAnexoVI.FormShow(Sender: TObject);
begin
  inherited;
  MaskEdit1.Text := DateToStr(StartOfTheMonth(Date));
  MaskEdit2.Text := DateToStr(EndOfTheMonth(Date));
end;

//initialization
//  RegisterClass(TFrmAnexoVI);
//finalization
//  UnRegisterClass(TFrmAnexoVI);
end.

