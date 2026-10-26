unit uInstalarVersao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Gauges, jpeg, ExtCtrls, GifImageHw;

const
  HW_MENS_UPDATE = WM_COPYDATA;

type
  TfrmInstalarVersao = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    lbTitulo: TLabel;
    lbStatus: TLabel;
    Panel2: TPanel;
    Gauge1: TGauge;
    lbProcesso: TLabel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    lbxArquivos: TListBox;
    BitBtn2: TBitBtn;
    timerVerificar: TTimer;
    procedure timerVerificarTimer(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    function _atualizarHwUpdate: Boolean;
  public
    { Public declarations }
  end;

var
  frmInstalarVersao: TfrmInstalarVersao;

implementation

uses uClassesHwUpdate;

{$R *.dfm}

procedure TfrmInstalarVersao.BitBtn1Click(Sender: TObject);
var
  vRetornoMult: THWuRetornoMultiplo;
begin
  if _atualizarHwUpdate then
    Exit;
  try
    BitBtn1.Enabled := False;
    BitBtn2.Enabled := False;
    lbxArquivos.Visible := True;

//    if BitBtn1.Caption = '&Instalar' then
//    begin

      try
        vDadosIni.vGauge := TGauge(Gauge1);
        vDadosIni.vLbStatus := TLabel(lbProcesso);
        vDadosIni.vListBox := TListBox(lbxArquivos);

        vRetornoMult := vAtHw._instalarNovaVersao;
        if vRetornoMult = rmInstaladoSucesso then
        begin
          lbStatus.Caption := 'Versão ' + vAtHw.vConfig._getVersaoCaption(vAtHw.vConfig.VERSAO_INST) + ' instalada com sucesso';
          Application.MessageBox(pchar(lbStatus.Caption), 'Atenção', 0 + 64);
          Close;
        end
        else if vRetornoMult = rmInstaladoFalhas then
        begin
          lbStatus.Caption := 'Atenção. Versão ' + vAtHw.vConfig._getVersaoCaption(vAtHw.vConfig.VERSAO_INST) + ' instalada. Houve falhas no processo. Consulte o log';
          Application.MessageBox(pchar(lbStatus.Caption), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
          BitBtn2.Enabled := True;
        end
        else if vRetornoMult = rmSistemaAberto then
        begin
          lbStatus.Caption := 'Atenção. Alguma instancia do Sistema está aberta. Por favor feche todas as instancias e tente novamente';
          Application.MessageBox(pchar(lbStatus.Caption), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
          BitBtn2.Enabled := True;
        end
        else
        begin
          lbStatus.Caption := 'Atenção. Versão ' + vAtHw.vConfig._getVersaoCaption(vAtHw.vConfig.VERSAO_INST) + ' não instalada. Houve falhas no processo. Consulte o log';
          Application.MessageBox(pchar(lbStatus.Caption), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
          BitBtn2.Enabled := True;
        end;

      finally
        vDadosIni.vGauge := nil;
        vDadosIni.vLbStatus := nil;
        vDadosIni.vListBox := nil;
      end;

//      BitBtn1.Caption := 'Concluir';
//      Close;
//    end
//    else if BitBtn1.Caption = 'Concluir' then
//      Close;

  finally
//    Close;
//    BitBtn1.Enabled := True;
  end;
end;

procedure TfrmInstalarVersao.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmInstalarVersao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  vAtHw.EmExecucao := False;
end;

procedure TfrmInstalarVersao.FormShow(Sender: TObject);
begin
  lbxArquivos.Visible := False;
  lbStatus.Caption := 'O sistema será atualizado para a versão ' + vAtHw.vConfig._getVersaoCaption(vAtHw.vConfig.VERSAO_INST) + ', basta clicar no botão Instalar';

	Gauge1.Visible := False;
  if Tag = 1 then
  begin
    BitBtn1.Enabled := False;
    BitBtn2.Enabled := False;
    timerVerificar.Enabled := True;
  end;
end;

procedure TfrmInstalarVersao.timerVerificarTimer(Sender: TObject);
begin
	timerVerificar.Enabled := False;
  BitBtn1.Click;
end;

function TfrmInstalarVersao._atualizarHwUpdate: Boolean;
var
  vLista: TStringList;
  vCopyDataStruct: TCopyDataStruct;
  vProgRecep : THandle;
  vRetorno: Integer;
begin
  Result := False;

  if not vAtHw.vConfig._getConfig(False) then
    Exit;

  if not vAtHw.vCopyFiles._novaVersaoAtualizador(vAtHw._getPathNovaVersao) then
    Exit;

  Result := True;

  vProgRecep := FindWindow('TfrmGuardUp', nil);
  if vProgRecep = 0 then
  begin
    if not FileExists(ExtractFilePath(Application.ExeName) + 'HwGuardUp.exe') then
    begin
      Application.MessageBox('Sistema incompleto. Falta HwGuardUp', 'Atenção', 0 + 64);
      Exit;
    end;

    WinExec(pchar( ExtractFilePath(Application.ExeName) + 'HwGuardUp.exe'), SW_HIDE);
    Application.MessageBox('Iniciando HwGuardUp que não estava em execução', 'Atenção', 0 + 64);
    Exit;
  end;

  vLista := TStringList.Create;
  vLista.Clear;
  vLista.Add('HwUpdate');
  if Trim(vAtHw.vSw.VERSAO) <> '' then
    vLista.Add(vAtHw.vSw.VERSAO)
  else
    vLista.Add(vAtHw.vConfig.VERSAO_INST);
  vLista.Text := vLista.Text + vAtHw.vCopyFiles.filesAtualizador.Text;
  vCopyDataStruct.dwData := 0; //use it to identify the message contents
  vCopyDataStruct.cbData := 1 + Length(vLista.Text) ;
  vCopyDataStruct.lpData := PChar(vLista.Text);
  Sleep(2000);
  vRetorno := SendMessage(vProgRecep, HW_MENS_UPDATE, Integer(Handle), Integer(@vCopyDataStruct));

  if vRetorno = 0 then
  begin
    Application.MessageBox('Sem resposta do HwGuardUp, HwUpdate precisa ser atualizado manualmente para prosseguir!', 'Atenção', 0 + 64);
    Halt(0);
  end
  else if vRetorno = 1 then
  begin
    Halt(0);
  end
  else if vRetorno = 2 then
  begin
    Application.MessageBox('HwGuardUp em execução. Aguarde alguns segundos e tente novamente!', 'Atenção', 0 + 64);
  end
  else
  begin
    Application.MessageBox('Tente novamente!', 'Atenção', 0 + 64);
  end;
end;

end.
