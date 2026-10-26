unit uFormSpedPISCOFINS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, ExtCtrls, Menus, StdCtrls, Buttons, Mask, ComCtrls;

type
  TfrmSpedPISCOFINS = class(TForm)
    PopupMenu1: TPopupMenu;
    SalvarLogSpedFiscal1: TMenuItem;
    SaveDialog1: TSaveDialog;
    Timer1: TTimer;
    XPManifest1: TXPManifest;
    Panel3: TPanel;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    dtIni: TMaskEdit;
    dtFim: TMaskEdit;
    GroupBox4: TGroupBox;
    ckBloco0: TCheckBox;
    ckBlocoA: TCheckBox;
    ckBlocoC: TCheckBox;
    ckBlocoM: TCheckBox;
    ckBlocoD: TCheckBox;
    ckBloco1: TCheckBox;
    ckBlocoF: TCheckBox;
    ckBloco9: TCheckBox;
    edDestino: TEdit;
    ComboBox1: TComboBox;
    ckRefazerCalculoPISCOFINS: TCheckBox;
    ckAltCST4998: TCheckBox;
    GroupBox2: TGroupBox;
    lbBloco: TLabel;
    lbTempo: TLabel;
    lbCupons: TLabel;
    lbStatus: TLabel;
    lbEmpresa: TLabel;
    ProgressBar1: TProgressBar;
    ProgressBar2: TProgressBar;
    Panel1: TPanel;
    btIniciar: TBitBtn;
    btSair: TBitBtn;
    Panel2: TPanel;
    GroupBox5: TGroupBox;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    MainMenu1: TMainMenu;
    CreditosAnteriores1: TMenuItem;
    RetencoesAnteriores1: TMenuItem;
    SpeedButton59: TSpeedButton;
    ck_0900: TCheckBox;
    procedure RetencoesAnteriores1Click(Sender: TObject);
    procedure CreditosAnteriores1Click(Sender: TObject);
    procedure edDestinoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ckRefazerCalculoPISCOFINSClick(Sender: TObject);
    procedure Panel2Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btIniciarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure dtIniExit(Sender: TObject);
    procedure dtFimExit(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton59Click(Sender: TObject);
  private
    { Private declarations }
    vTempoGasto: TTime;
    procedure _GravaConfiguracoesString(NomeVariavel,Valor : string);
    function _LerConfiguracoesRegistroString(NomeVariavel : string; pDefault: string = '') : string;
  public
    { Public declarations }
    vCodEmpresa, vEndBanco, vCNPJ:string;
  end;

var
  frmSpedPISCOFINS: TfrmSpedPISCOFINS;

implementation

uses
  DateUtils, uClassesSpedPISCOFINS, Registry, uSpedHw;

function hw_config_sistema_dx( pChaveIdent, pUsuario: WideString; pCodEmpresa, pNivel: Integer): Integer; stdcall; external 'cons40.dll';

{$R *.dfm}

procedure TfrmSpedPISCOFINS.BitBtn1Click(Sender: TObject);
begin
  Panel2.Visible := False;
end;

procedure TfrmSpedPISCOFINS.btIniciarClick(Sender: TObject);
var
  vSped:TSpedPISCOFINS;
  vOK: Boolean;
begin
  vSped := TSpedPISCOFINS.create;
  try
    vSped.EnderecoBanco := vEndBanco;
    vOK:= True;

    if not vSped.conectarBanco then
      Exit;
    if not vDadosIniSPED.PesqPros('EFD003', 'GERAR', 'DTINI:' + dtIni.Text + ' DTFIM:' + dtFim.Text + ' DEST:' + edDestino.Text, 'SPED_PISCOFINS', '', vSped.qrAux, True) then
      Exit;

    vSped.NumeroReciboAnterior := '';

    if ComboBox1.Text = 'Substituto' then
    begin
      Panel2.Top := 71;
      Panel2.Left := 8;
      Panel2.Visible := True;
      Panel2.BringToFront;
      Edit1.SetFocus;
      try
        GroupBox2.Visible := false;
        GroupBox3.Visible := false;
        Panel1.Visible := false;
        while Panel2.Visible do
          Application.ProcessMessages;
        if trim(Edit1.Text) = '' then
        begin
          Application.MessageBox(pchar('Número do recibo anterior não informado'),'Atenção',0+64);
          vOK := False;
          Exit;
        end
        else
        begin
          vSped.NumeroReciboAnterior := Trim(Edit1.Text);
          vSped.NumeroReciboAnterior := StringReplace(vSped.NumeroReciboAnterior, '.', '',[rfReplaceAll]);
          vSped.NumeroReciboAnterior := StringReplace(vSped.NumeroReciboAnterior, '-', '',[rfReplaceAll]);
        end;
      finally
        GroupBox2.Visible := True;
        GroupBox3.Visible := True;
        Panel1.Visible := True;
      end;
    end;

    vTempoGasto := Now;
    Timer1.Enabled := True;
    GroupBox3.Enabled := False;
    Panel1.Enabled := False;
    //vSped.CodEmpresa:= vCodEmpresa;
    vSped.EnderecoBanco := vEndBanco;
    vSped.DataIni := dtIni.Text;
    vSped.DataFim := dtFim.Text;
    vSped.Finalidade :=ComboBox1.Text;
    vSped.FLabelStatus := TLabel(lbStatus);
    vSped.FLabelBloco := TLabel(lbBloco);
    vSped.FLabelCupons := TLabel(lbCupons);
    vSped.FLabelEmpresas:= TLabel(lbEmpresa);
    vSped.FProgressBar := TProgressBar(ProgressBar1);
    vSped.FProgressBar2 := TProgressBar(ProgressBar2);
    vSped.Destino := edDestino.Text;

    vSped.vBloco0 := ckBloco0.Checked;
    vSped.vBlocoA := ckBlocoA.Checked;
    vSped.vBlocoC := ckBlocoC.Checked;
    vSped.vBlocoD := ckBlocoD.Checked;
    vSped.vBlocoF := ckBlocoF.Checked;
    vSped.vBlocoM := ckBlocoM.Checked;
    vSped.vBloco1 := ckBloco1.Checked;
    vSped.vBloco9 := ckBloco9.Checked;
    vSped.reg0900 := ck_0900.Visible and ck_0900.Enabled;
    vSped.vRefazerCalculoPISCOFINS := ckRefazerCalculoPISCOFINS.Checked;
    vSped.vAlterarCST4998 := (ckAltCST4998.Checked) and (ckAltCST4998.Enabled);
    vOK:= vSped.iniciaSpedPISCOFINS(vCNPJ);
  finally 
    GroupBox3.Enabled := True;
    Panel1.Enabled := True;
    vSped.Free;
    vSped := nil;
    Timer1.Enabled := False;
    lbTempo.Caption := 'Tempo Gasto: '+TimeToStr(Now - vTempoGasto);
    if vOK then    
      Application.MessageBox(pchar('Arquivo gerado com sucesso: '+#13+
        edDestino.Text),'Atenção',0+64);
    ProgressBar1.Position := 0;
    ProgressBar2.Position := 0;
    if vOK then
      Close;
  end;
end;

procedure TfrmSpedPISCOFINS.btSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSpedPISCOFINS.ckRefazerCalculoPISCOFINSClick(Sender: TObject);
begin
  ckAltCST4998.Enabled := ckRefazerCalculoPISCOFINS.Checked;
  if not ckAltCST4998.Enabled then
    ckAltCST4998.Checked := False;
end;

procedure TfrmSpedPISCOFINS.CreditosAnteriores1Click(Sender: TObject);
var
  vSped:TSpedPISCOFINS;
begin
  vSped := TSpedPISCOFINS.create;
    try

      vSped.CodEmpresa:= vCodEmpresa;
      vSped.EnderecoBanco := vEndBanco;
      vSped.DataIni := dtIni.Text;
      vSped.DataFim := dtFim.Text;
      vSped.setCNPJGrupo(vCNPJ);

      
      vSped.EnderecoBanco := vEndBanco;

      if not vSped.conectarBanco then
        Exit;
      if not vDadosIniSPED.PesqPros('EFD004', 'CONSULTAR', '', 'SPED_CREDITOS_PERIODO', '', vSped.qrAux, True) then
        Exit;

      vSped._verificarCreditosPISCOFINS(False, 0, 0);
    finally
      vSped.Free;
      vSped := nil;
    end;
end;

procedure TfrmSpedPISCOFINS.dtFimExit(Sender: TObject);
begin
  edDestino.Text := ExtractFilePath(_LerConfiguracoesRegistroString(edDestino.Name, Application.ExeName))+'PC'+
    copy(StringReplace(dtIni.Text,'/','',[rfReplaceAll]),3,6)+'.txt';
end;

procedure TfrmSpedPISCOFINS.dtIniExit(Sender: TObject);
var
  vSped:TSpedPISCOFINS;
begin
  try
    StrToDate(dtIni.Text);
    dtFim.Text := DateToStr(EndOfTheMonth(StrToDate(dtIni.Text)));
    edDestino.Text := ExtractFilePath(_LerConfiguracoesRegistroString(edDestino.Name, Application.ExeName))+'PC'+
    copy(StringReplace(dtIni.Text,'/','',[rfReplaceAll]),3,6)+'.txt';
    ck_0900.Visible := StrToDate(dtIni.Text) >= EncodeDate(2020, 1, 1);

//    vSped := TSpedPISCOFINS.create;
//    try
//      vSped.CodEmpresa:= vCodEmpresa;
//      vSped.EnderecoBanco := vEndBanco;
//      vSped.getCreditoPeriodoAnterior(dtIni.Text, vCNPJ);
//      edCreditoPeriodoAnteriorPIS.Caption := Format('%0.2n', [vSped.vValorCredPerAnt_Pis]);
//      edCreditoPeriodoAnteriorCOFINS.Caption := Format('%0.2n', [vSped.vValorCredPerAnt_Cofins]);
//    finally
//      vSped.Free;
//      vSped := nil;
//    end;
  except
  end;
end;

procedure TfrmSpedPISCOFINS.edDestinoExit(Sender: TObject);
begin
  _GravaConfiguracoesString(edDestino.Name, edDestino.Text);
end;

procedure TfrmSpedPISCOFINS.FormCreate(Sender: TObject);
begin
  vCNPJ := '';
end;

procedure TfrmSpedPISCOFINS.FormShow(Sender: TObject);
var
  vSped:TSpedPISCOFINS;
begin
  lbTempo.Caption := '';
  lbCupons.Caption := '';
  lbEmpresa.Caption := '';
  ckAltCST4998.Enabled := ckRefazerCalculoPISCOFINS.Checked;
  if Trim(vCNPJ) <> '' then
    Self.Caption := 'EFD Contribuições - CNPJ: ' + vCNPJ
  else
    InputQuery('Informe o CNPJ', 'Informe o CNPJ da empresa', vCNPJ);
  vSped := TSpedPISCOFINS.create;
  try
    vSped.CodEmpresa:= vCodEmpresa;
    vSped.EnderecoBanco := vEndBanco;
    vSped.setCNPJGrupo(vCNPJ);
    vCNPJ := vSped.CNPJGrupo;

    ckRefazerCalculoPISCOFINS.Enabled := vDadosIniSPED.PesqPros('EFD014', 'HABILITAR', '', 'SPED_PISCOFINS', '', vSped.qrAux, True);

  finally
    vSped.Free;
    vSped := nil;
  end;
  dtIni.Text := DateToStr(StartOfTheMonth(IncMonth(Date, -1)));
  dtFim.Text := DateToStr(endOfTheMonth(IncMonth(Date, -1)));
  Self.Caption := 'EFD Contribuições - CNPJ: ' + vCNPJ;
end;

procedure TfrmSpedPISCOFINS.Panel2Exit(Sender: TObject);
begin
  Panel2.Visible := False;
end;

procedure TfrmSpedPISCOFINS.RetencoesAnteriores1Click(Sender: TObject);
var
  vSped:TSpedPISCOFINS;
begin
  vSped := TSpedPISCOFINS.create;
    try

      vSped.CodEmpresa:= vCodEmpresa;
      vSped.EnderecoBanco := vEndBanco;
      vSped.DataIni := dtIni.Text;
      vSped.DataFim := dtFim.Text;
      vSped.setCNPJGrupo(vCNPJ);

      
      vSped.EnderecoBanco := vEndBanco;

      if not vSped.conectarBanco then
        Exit;
      if not vDadosIniSPED.PesqPros('EFD004', 'CONSULTAR', '', 'SPED_CREDITOS_PERIODO', '', vSped.qrAux, True) then
        Exit;

      vSped._verificarRetencoesPISCOFINS(False, 0, 0);
    finally
      vSped.Free;
      vSped := nil;
    end;
end;

procedure TfrmSpedPISCOFINS.SpeedButton1Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
    edDestino.Text := SaveDialog1.FileName;
    _GravaConfiguracoesString(edDestino.Name, edDestino.Text);
  end;
end;

procedure TfrmSpedPISCOFINS.SpeedButton59Click(Sender: TObject);
var
  vSped:TSpedPISCOFINS;
begin
  try
    vSped := TSpedPISCOFINS.create;
    try
      vSped.CodEmpresa:= vDadosIniSPED.vCodEmpresa;
      vSped.CNPJGrupo := vCNPJ;
      vSped.EnderecoBanco := vEndBanco;

      if not vSped.conectarBanco then
        Exit;

      vSped.setCodEmpresa;
      vSped.verificarConfiguracoes;

      if vSped.CodEmpresa <> '' then
        hw_config_sistema_dx(WideString('efd_piscofins_%'), WideString(vDadosIniSPED.vNomeUsuario), StrToInt(vSped.CodEmpresa), vDadosIniSPED.vNivel);
    finally
      vSped.Free;
      vSped := nil;
    end;
  except
  end;
end;

procedure TfrmSpedPISCOFINS.Timer1Timer(Sender: TObject);
begin
  lbTempo.Caption := TimeToStr(Now - vTempoGasto);
  Application.ProcessMessages;
end;

procedure TfrmSpedPISCOFINS._GravaConfiguracoesString(NomeVariavel, Valor: string);
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

function TfrmSpedPISCOFINS._LerConfiguracoesRegistroString(NomeVariavel, pDefault: string): string;
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
