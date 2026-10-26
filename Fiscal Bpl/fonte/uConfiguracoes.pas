unit uConfiguracoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, ExtCtrls, uCadastrosF;

type
  TfrmConfiguracoes = class(TfrmPadrao)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfiguracoes: TfrmConfiguracoes;
  obConf:TConfImp;
  obFinal: TFinalizador;
  obTec:TTeclado;
  obProc:TProcesso;

implementation

uses uConfigImp, uFinalizador, uTeclado, uProcessoF, uDtmConfigF, uDadosIni, 
  uDtmAtivo;

{$R *.dfm}

procedure TfrmConfiguracoes.BitBtn1Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmConfigImp, frmConfigImp);
  if obConf = nil then
    obConf := TConfImp.create;
  obConf.Close;
  frmConfigImp.ShowModal;
end;

procedure TfrmConfiguracoes.BitBtn2Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmTeclado, frmTeclado);
  frmTeclado.ShowModal;
end;

procedure TfrmConfiguracoes.BitBtn4Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmFinalizador, frmFinalizador);
  if obFinal = nil then
    obFinal := TFinalizador.create;
  frmFinalizador.ShowModal;
end;

procedure TfrmConfiguracoes.BitBtn5Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmProcesso, frmProcesso);
  frmProcesso.ShowModal;
end;

procedure TfrmConfiguracoes.BitBtn6Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmConfiguracoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := cafree;
  frmConfiguracoes := nil;
end;

procedure TfrmConfiguracoes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = vk_f2 then
    BitBtn1Click(Sender)
  else if key = vk_f3 then
    BitBtn2Click(Sender)
  else if key = vk_f4 then
    BitBtn5Click(Sender)
  else if key = vk_f5 then
    BitBtn4Click(Sender)
  else if key = VK_ESCAPE then
    BitBtn6Click(Sender);
end;

procedure TfrmConfiguracoes.FormShow(Sender: TObject);
begin
  inherited;
  if dtmAtivo = nil then
    dtmAtivo := TdtmAtivo.Create(dtmAtivo);
  if DtmConfigF = nil then
    DtmConfigF := TDtmConfigF.Create(DtmConfigF);
  if obConf = nil then
    obConf := TConfImp.create;
  obConf.Close;
  obConf.Open;
  vDadosIni.vNumSerieEcf := vDadosIni.decodifica(obConf.dataSet.FieldByName('num_serie_ecf').AsString);
  vDadosIni.vCodTerminal := obConf.dataSet.FieldByName('cod_terminal').AsString;
end;

initialization
  RegisterClass(TfrmConfiguracoes);
finalization
  UnRegisterClass(TfrmConfiguracoes);

end.

