unit uFormSpedFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, StdCtrls, Menus, ExtCtrls, Mask, XPMan;

type
  TfrmSpedFiscal = class(TForm)
    PopupMenu1: TPopupMenu;
    SalvarLogSpedFiscal1: TMenuItem;
    SaveDialog1: TSaveDialog;
    Timer1: TTimer;
    XPManifest1: TXPManifest;
    Panel2: TPanel;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    Label5: TLabel;
    dtIni: TMaskEdit;
    dtFim: TMaskEdit;
    GroupBox4: TGroupBox;
    ckBloco0: TCheckBox;
    ckBlocoC: TCheckBox;
    ckBlocoD: TCheckBox;
    ckBlocoH: TCheckBox;
    ckBlocoE: TCheckBox;
    ckBloco1: TCheckBox;
    ckBlocoG: TCheckBox;
    ckBloco9: TCheckBox;
    edDestino: TEdit;
    ComboBox1: TComboBox;
    dtInventario: TMaskEdit;
    GroupBox2: TGroupBox;
    lbBloco: TLabel;
    lbTempo: TLabel;
    lbCupons: TLabel;
    lbStatus: TLabel;
    ProgressBar1: TProgressBar;
    ProgressBar2: TProgressBar;
    Panel1: TPanel;
    btIniciar: TBitBtn;
    btSair: TBitBtn;
    GroupBox1: TGroupBox;
    SpeedButton2: TSpeedButton;
    edCreditoPeriodoAnterior: TPanel;
    SpeedButton59: TSpeedButton;
    procedure SpeedButton59Click(Sender: TObject);
    procedure edDestinoExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure dtFimExit(Sender: TObject);
    procedure ckBlocoHClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure btIniciarClick(Sender: TObject);
    procedure dtIniExit(Sender: TObject);
  private
    { Private declarations }
    procedure _GravaConfiguracoesString(NomeVariavel,Valor : string);
    function _LerConfiguracoesRegistroString(NomeVariavel : string; pDefault: string = '') : string;
  public
    { Public declarations }
    vCodEmpresa, vEndBanco:string;
    vTempoGasto: TTime;
  end;

var
  frmSpedFiscal: TfrmSpedFiscal;

implementation

uses DateUtils, uClassesSpedFiscal, Registry, uSpedHw;

function verificarCampoOutrasNotaFiscal(pDataIni, pDataFim, pCodEmpresa, pEnderecoBanco:
      PChar): LongBool; stdcall; external 'CompativelHW.dll';

function hw_config_sistema( pChaveIdent, pUsuario: PChar; pCodEmpresa, pNivel: Integer): Integer; stdcall; external 'cons40.dll';

{$R *.dfm}

procedure TfrmSpedFiscal.btIniciarClick(Sender: TObject);
var
  vSped:TSpedFiscal;
  vrTemp: string;
begin
  vSped := TSpedFiscal.create;
  vTempoGasto := Now;
  Timer1.Enabled := True;
  try
    GroupBox3.Enabled := False;
    Panel1.Enabled := False;
    vSped.CodEmpresa:= vCodEmpresa;
    vSped.EnderecoBanco := vEndBanco;

    if not vSped.conectarBanco then
      Exit;
    if not vDadosIniSPED.PesqPros('EFD001', 'GERAR', 'DTINI:' + dtIni.Text + ' DTFIM:' + dtFim.Text + ' DEST:' + edDestino.Text, 'SPED_FISCAL', '', vSped.qrAux, True) then
      Exit;

    vSped.DataIni := dtIni.Text;
    vSped.DataFim := dtFim.Text;
    vSped.DataInv := dtInventario.Text;
    vSped.Finalidade :=ComboBox1.Text;
    vSped.FLabelStatus := TLabel(lbStatus);
    vSped.FLabelBloco := TLabel(lbBloco);
    vSped.FLabelCupons := TLabel(lbCupons);
    vSped.FProgressBar := TProgressBar(ProgressBar1);
    vSped.FProgressBar2 := TProgressBar(ProgressBar2);
    vSped.Destino := edDestino.Text ;
    vrTemp := StringReplace(edCreditoPeriodoAnterior.Caption, '.', '', [rfReplaceAll]);
    vSped.vValorCredPerAnt_ICMS := StrToFloatDef(vrTemp, 0);

    vSped.vBloco0 := ckBloco0.Checked;
    vSped.vBlocoC := ckBlocoC.Checked;
    vSped.vBlocoD := ckBlocoD.Checked;
    vSped.vBlocoE := ckBlocoE.Checked;
    vSped.vBlocoG := ckBlocoG.Checked;
    vSped.vBlocoH := ckBlocoH.Checked;
    vSped.vBloco1 := ckBloco1.Checked;
    vSped.vBloco9 := ckBloco9.Checked;

    verificarCampoOutrasNotaFiscal(PChar(vSped.DataIni), PChar(vSped.DataFim), PChar(vSped.CodEmpresa), PChar(vSped.EnderecoBanco));
    
    vSped.iniciaSpedFiscal;
  finally
    GroupBox3.Enabled := True;
    Panel1.Enabled := True;
    vSped.Free;
    vSped := nil;
    Timer1.Enabled := False;
    lbTempo.Caption := 'Tempo Gasto: '+TimeToStr(Now - vTempoGasto);
    Application.MessageBox(pchar('Arquivo gerado com sucesso: '+#13+
      edDestino.Text),'Atenção',0+64);
    ProgressBar1.Position := 0;
    ProgressBar2.Position := 0;
    Close;
  end;           
end;

procedure TfrmSpedFiscal.btSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSpedFiscal.ckBlocoHClick(Sender: TObject);
var
  Data: TDate;
begin
  dtInventario.Enabled := ckBlocoH.Checked ;
  if dtInventario.Text = '  /  /    ' then
    if dtFim.Text <> '  /  /    ' then
    begin
      Data := StrToDate(dtFim.Text);
      Data := IncMonth(Data, - 2);
      dtInventario.Text := DateToStr(EndOfTheMonth(Data));
    end;
end;

procedure TfrmSpedFiscal.dtFimExit(Sender: TObject);
begin
  edDestino.Text := ExtractFilePath(_LerConfiguracoesRegistroString(edDestino.Name, Application.ExeName))+'S'+
    copy(StringReplace(dtIni.Text,'/','',[rfReplaceAll]),3,6)+'.txt';
end;

procedure TfrmSpedFiscal.dtIniExit(Sender: TObject);
var
  vSped:TSpedFiscal;
begin
  try
    StrToDate(dtIni.Text);
    dtFim.Text := DateToStr(EndOfTheMonth(StrToDate(dtIni.Text)));
    edDestino.Text := ExtractFilePath(_LerConfiguracoesRegistroString(edDestino.Name, Application.ExeName))+'S'+
      copy(StringReplace(dtIni.Text,'/','',[rfReplaceAll]),3,6)+'.txt';
    vSped := TSpedFiscal.create;
    try
      vSped.CodEmpresa:= vCodEmpresa;
      vSped.EnderecoBanco := vEndBanco;
      vSped.getCreditoPeriodoAnterior(dtIni.Text);
      edCreditoPeriodoAnterior.Caption := Format('%0.2n', [vSped.vValorCredPerAnt_ICMS]);
    finally
      vSped.Free;
      vSped := nil;
    end;
  except
  end;
end;

procedure TfrmSpedFiscal.edDestinoExit(Sender: TObject);
begin
  _GravaConfiguracoesString(edDestino.Name, edDestino.Text);
end;

procedure TfrmSpedFiscal.FormShow(Sender: TObject);
begin
  lbTempo.Caption := '';
  lbCupons.Caption := '';
end;

procedure TfrmSpedFiscal.SpeedButton1Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
    edDestino.Text := SaveDialog1.FileName;
    _GravaConfiguracoesString(edDestino.Name, edDestino.Text);
  end;
end;

procedure TfrmSpedFiscal.SpeedButton2Click(Sender: TObject);
var
  vrTemp: string;
  vSped: TSpedFiscal;
begin
  vSped := TSpedFiscal.create;
  try
    vSped.CodEmpresa:= vCodEmpresa;
    vSped.EnderecoBanco := vEndBanco;

    if not vSped.conectarBanco then
      Exit;
    if not vDadosIniSPED.PesqPros('EFD002', 'ALTERAR', 'DTINI:' + dtIni.Text + ' DTFIM:' + dtFim.Text + ' VLANT:' + edCreditoPeriodoAnterior.Caption, 'SPED_FISCAL', '', vSped.qrAux, True) then
      Exit;

    if not InputQuery('Valor do Crédito', 'Informe o novo valor', vrTemp) then
      Exit;
    if StrToFloatDef(vrTemp, -1) >= 0 then
    begin
      edCreditoPeriodoAnterior.Caption := Format('%0.2n', [StrToFloatDef(vrTemp, 0)]);
      vDadosIniSPED.GravaAuditoria('EFD002', 'ALTERAR', 'DTINI:' + dtIni.Text + ' DTFIM:' + dtFim.Text + ' VLNOVO:' + edCreditoPeriodoAnterior.Caption, 'SPED_FISCAL', '', vSped.qrAux);
    end;
  finally
    vSped.Free;
    vSped := nil;
  end;
end;

procedure TfrmSpedFiscal.SpeedButton59Click(Sender: TObject);
var
  vSped:TSpedFiscal;
begin
  try
    vSped := TSpedFiscal.create;
    try
      vSped.CodEmpresa:= vDadosIniSPED.vCodEmpresa;
      vSped.EnderecoBanco := vEndBanco;
      vSped.verificarConfiguracoes;
    finally
      vSped.Free;
      vSped := nil;
    end;
  except
  end;
  hw_config_sistema(PChar('efd_icms_%'), PChar(vDadosIniSPED.vNomeUsuario), StrToInt(vDadosIniSPED.vCodEmpresa), vDadosIniSPED.vNivel);
end;

procedure TfrmSpedFiscal.Timer1Timer(Sender: TObject);
var
  vrTemp: string;
begin
  lbTempo.Caption := TimeToStr(Now - vTempoGasto);
  Application.ProcessMessages;
end;

procedure TfrmSpedFiscal._GravaConfiguracoesString(NomeVariavel, Valor: string);
const
  Conf: string = 'Software\Hw\Configuracao\Classes\';
var
  Registro: TRegistry;
begin
  try
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      // Grava as informações do form
      Registro.WriteString(NomeVariavel, Valor);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

function TfrmSpedFiscal._LerConfiguracoesRegistroString(NomeVariavel, pDefault: string): string;
const
  Conf: string = 'Software\Hw\Configuracao\Classes\';
var
  Registro: TRegistry;
  vTemp: string;
begin
  Result := pDefault;
  try
    vTemp := pDefault;
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      if not Registro.ValueExists(NomeVariavel) then
        Exit;
      // L~e a informação da variavel
      vTemp := Registro.ReadString(NomeVariavel);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Result := vTemp;
      Registro.Free;
    end;
  except
  end;
end;

end.
