unit uImpressaoNaECF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmImpressaoNaECF = class(TForm)
    Panel3: TPanel;
    ListBox1: TListBox;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
//    POSPrinter: string;
  public
    { Public declarations }
    TxtNaoFiscal: string;
  end;

var
  frmImpressaoNaECF: TfrmImpressaoNaECF;

implementation

uses
  uDtmAtivo, RDPrint, uPrincipalF, uDadosIniFiscal, uDadosIni, StrUtils, hw_win_utils;

function HwPosPrintFromText(Text, ConfName: WideString; QtdeVias: Integer): Integer; stdcall; external 'HWPosPrinter.dll';
function HwPosUltimoErro: WideString; stdcall; external 'HWPosPrinter.dll';
function cloud_agente_print_text(text: WideString; params: WideString): Boolean; stdcall; external 'hw.utils.dx.dll';
function cloud_agente_last_error: WideString; stdcall; external 'hw.utils.dx.dll';

{$R *.dfm}

procedure TfrmImpressaoNaECF.BitBtn1Click(Sender: TObject);
var
  vRel: TStringList;
  I: Integer;
  vPrint: TRDprint;
  vLinha, vPagina: Integer;
begin
  try
    Screen.Cursor := crHourGlass;
    vRel := TStringList.Create;
    vRel.Text := ListBox1.Items.Text;

    vPrint := TRDprint.Create(Application);
    vPrint.OpcoesPreview.CaptionPreview := 'Comprovante de transação TEF';
    vPrint.CaptionSetup := 'Configurar impressão do comprovante de transação TEF';
    vPrint.TitulodoRelatorio := 'Comprovante TEF';
    vPrint.OpcoesPreview.Preview := true;
    vPrint.FonteTamanhoPadrao := S17cpp;
    vPrint.TamanhoQteColunas := 42;
    vPrint.TamanhoQteLinhas := 66;
    vlinha := 1;
    vPagina := 1;
    vDadosIni.ModImp(vPrint);
    if vPrint.EstaAberto then
      vPrint.Abortar;
    vPrint.Abrir;
    for I := 0 to vRel.Count - 1 do
    begin
      if vLinha >= 66 then
      begin
        vPrint.Novapagina;
        vLinha:= 1;
      end;
      vPrint.Imp(vLinha, 1, vRel[I]);
      vLinha := vLinha + 1;
    end;
    vPrint.Fechar;
    vPrint.Free;
    vPrint := nil;

    ModalResult := IDOK;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmImpressaoNaECF.BitBtn2Click(Sender: TObject);
var
  Resposta: Integer;
  txt: string;
begin
  if Trim(vDadosIni.vModoImpressao.TxtNaoFiscal) <> '' then
    txt := vDadosIni.vModoImpressao.TxtNaoFiscal
  else
    txt := ListBox1.Items.Text;


    if IniConf.ReadStr('MD', 'Debug') = 'S' then
    begin
      LogApp.Log('tefprint', 'frmImpressaoNaECF variavel' + sLineBreak + vDadosIni.vModoImpressao.TxtNaoFiscal);
      LogApp.Log('tefprint', 'frmImpressaoNaECF tela' + sLineBreak + ListBox1.Items.Text);
    end;

  if not vDadosIni.vModoImpressao.IsLocalAgent then
  begin

    if IniConf.ReadStr('MD', 'Debug') = 'S' then
      LogApp.Log('tefprint', 'Antes agente' + sLineBreak + txt);

    if not cloud_agente_print_text(WideString(txt), WideString(Format('confName=%s;agentId=%s;copies=1;cnpj=%s', [vDadosIni.vModoImpressao.PosPrinter, vDadosIni.vModoImpressao.AgenteId, vDadosIni.vEmp.vCNPJ]))) then
      Application.MessageBox(PChar(string(cloud_agente_last_error)), 'Atenção', 0 + 64)
  end
  else
  begin

    if IniConf.ReadStr('MD', 'Debug') = 'S' then
      LogApp.Log('tefprint', 'Antes Posprint' + sLineBreak + txt);

    Resposta := HwPosPrintFromText(WideString(txt), WideString(vDadosIni.vModoImpressao.PosPrinter), 1);
    if Resposta = 0 then
      Application.MessageBox(PChar(string(HwPosUltimoErro)), 'Atenção', 0 + 64)
    else
      ModalResult := IDOK;
  end;
end;

procedure TfrmImpressaoNaECF.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmImpressaoNaECF.BitBtn4Click(Sender: TObject);
var
	vRel: TStringList;
	I: Integer;
  vPrint: TRDprint;
  vLinha, vPagina: Integer;
  Colunas: Integer;
begin
  try
    Screen.Cursor := crHourGlass;
    vRel := TStringList.Create;
    vRel.Text := ListBox1.Items.Text;

    if not vDadosIniF.EnvCmdsCupom(2) then
      exit;

    vDadosIni.abreStatusProcessamento('Impressão', 'Imprimindo. Aguarde...');
    Colunas := StrToIntDef( vDadosIni.GetIni('Fiscal', 'QtdeColunas', '48'), 48);

    try CImpressoraF.FechaRelatorioGerencial; finally end;
    CImpressoraF.abrerelatorioGer;
    for I:= 0 to vRel.Count - 1 do
      CImpressoraF.RelatorioGerencial( CImpressoraF.TamDescricao(Colunas, vRel[I]));
    CImpressoraF.FechaRelatorioGerencial;

    ModalResult := IDOK;
  finally
    Screen.Cursor := crDefault;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TfrmImpressaoNaECF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  vDadosIni.vModoImpressao.TxtNaoFiscal := '';
  Action := caFree;
  frmImpressaoNaECF := nil;
end;

procedure TfrmImpressaoNaECF.FormShow(Sender: TObject);
begin
  BitBtn4.Visible := (vDadosIni.vFiscalAtivo = 'S') and (CImpressoraF <> nil);

//  POSPrinter := Trim(vDadosIni.GetIni('TEF', 'POSPrinter', ''));

//  if FileExists(ExtractFilePath(Application.ExeName) + POSPrinter) then
//    POSPrinter := '';
  BitBtn2.Visible := vDadosIni.vModoImpressao.PosPrinter <> '';

  if BitBtn2.CanFocus then
    BitBtn2.SetFocus
  else if BitBtn4.CanFocus then
    BitBtn4.SetFocus
  else if BitBtn1.CanFocus then
    BitBtn1.SetFocus;

  if vDadosIni.vModoImpressao.vLinhasImpressao = nil then
  begin
    vDadosIni.vModoImpressao.vLinhasImpressao := TStringList.Create;
    vDadosIni.vModoImpressao.vLinhasImpressao.Clear;
  end;

  ListBox1.Items.Text := vDadosIni.vModoImpressao.vLinhasImpressao.Text;
end;

initialization
  RegisterClass(TfrmImpressaoNaECF);
finalization
  UnRegisterClass(TfrmImpressaoNaECF);

end.
