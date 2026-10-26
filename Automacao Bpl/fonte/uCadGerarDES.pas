unit uCadGerarDES;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ExtCtrls, ComCtrls, StdCtrls, Buttons, Mask, uClassesDES,
  ExtDlgs, DateUtils;

type
  TfrmCadGerarDES = class(TfrmPadrao)
    pnFundo: TPanel;
    gbMontagem: TGroupBox;
    lbDataInicial: TLabel;
    edtDataInicial: TMaskEdit;
    lbDataFinal: TLabel;
    edtDataFinal: TMaskEdit;
    gbRegistros: TGroupBox;
    pnSalvar: TPanel;
    edtSalvar: TEdit;
    sbSalvar: TSpeedButton;
    lbSalvar: TLabel;
    cbH: TCheckBox;
    cbE: TCheckBox;
    cbD: TCheckBox;
    cbR: TCheckBox;
    cbT: TCheckBox;
    cbI: TCheckBox;
    gbStatusMontagem: TGroupBox;
    pnBotoes: TPanel;
    lbStatus: TLabel;
    pbTotal: TProgressBar;
    btnParar: TBitBtn;
    btnIniciar: TBitBtn;
    SaveDialog1: TSaveDialog;
    tmrStatus: TTimer;
    lbTempo: TLabel;
    procedure tmrStatusTimer(Sender: TObject);
    procedure btnPararClick(Sender: TObject);
    procedure edtDataInicialExit(Sender: TObject);
    procedure sbSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnIniciarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadGerarDES: TfrmCadGerarDES;
  vTempoInicial: TDateTime;

implementation

{$R *.dfm}

procedure TfrmCadGerarDES.btnIniciarClick(Sender: TObject);
begin
	try
    try
    	if vCadGerarDES = nil then
      	Exit;        
      vTempoInicial := Now;
      tmrStatus.Enabled := True;
      Screen.Cursor := crHourGlass;
      btnIniciar.Enabled := False;
      vCadGerarDES.vDES.DT_INI := StrToDate(edtDataInicial.Text);
      vCadGerarDES.vDES.DT_FIN := StrToDate(edtDataFinal.Text);
      vCadGerarDES.vDES.NomeArquivo := edtSalvar.Text;
      DecimalSeparator := '.';
      vCadGerarDES.preencheRegistroH;
      vCadGerarDES.preencheRegistroE(pbTotal, lbStatus);
      vCadGerarDES.preencheRegistroR(pbTotal, lbStatus);
      vCadGerarDES.vDES.SaveFileTXT;
      lbStatus.Caption := 'Concluido!';
      tmrStatus.Enabled := False;
      Application.MessageBox(pchar('Arquivo Gerado com Sucesso!'), 'Atenção', 0 + 64 );
    except
      Application.MessageBox(pchar('A Data digitada é invalida!'), 'Atenção', 0 + 64 );
    end;
  finally
  	btnIniciar.Enabled := True;
    Screen.Cursor := crDefault;
    tmrStatus.Enabled := False;
  end;
end;

procedure TfrmCadGerarDES.btnPararClick(Sender: TObject);
begin
	try
		Screen.Cursor := crHourGlass;
    tmrStatus.Enabled := False;
    if vCadGerarDES <> nil then
    	vCadGerarDES.Parar := True;
	finally
  	Screen.Cursor := crDefault;
	end;
end;

procedure TfrmCadGerarDES.edtDataInicialExit(Sender: TObject);
begin
	try
    edtDataFinal.Text :=  DateToStr(EndOfTheMonth(StrToDate(edtDataInicial.Text)));
    SaveDialog1.FileName := 'D' + FormatDateTime('mmyyyy', StrToDate(edtDataFinal.Text)) + '.txt';
    edtSalvar.Text := ExtractFilePath(Application.ExeName) + 'D' + FormatDateTime('mmyyyy', StrToDate(edtDataFinal.Text)) + '.txt'
  except
  
  end;
end;

procedure TfrmCadGerarDES.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
//  FreeAndNil(vCadGerarDES);

//  Action := caFree;
//  frmCadGerarDES := nil;
end;

procedure TfrmCadGerarDES.sbSalvarClick(Sender: TObject);
begin
	if SaveDialog1.Execute then
		edtSalvar.Text := SaveDialog1.FileName;
end;

procedure TfrmCadGerarDES.tmrStatusTimer(Sender: TObject);
begin
  lbTempo.Caption := FormatDateTime('hh:nn:ss', vTempoInicial - Now);
  Application.ProcessMessages;
end;

end.


