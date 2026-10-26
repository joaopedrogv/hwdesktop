unit uTMO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, uClassesTMO, StdCtrls, Buttons, DBCtrls, Grids, DBGrids,
  ComCtrls, ExtCtrls, dateutils, uEditHw;

type
  TfrmTMO = class(TfrmPadrao)
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit1: TEdit;
    BtnAbrirDia: TBitBtn;
    BtnPausa: TBitBtn;
    BtnTiraPausa: TBitBtn;
    btnFechardia: TBitBtn;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    lbStatus: TLabel;
    CheckBox1: TCheckBox;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Timer1: TTimer;
    Label2: TLabel;
    EditHw5: TEditHw;
    DBLookupComboBox19: TDBLookupComboBox;
    procedure DBLookupComboBox19Exit(Sender: TObject);
    procedure EditHw5Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFechardiaClick(Sender: TObject);
    procedure BtnTiraPausaClick(Sender: TObject);
    procedure BtnPausaClick(Sender: TObject);
    procedure BtnAbrirDiaClick(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    TimeOld: TDateTime;
    INICIO: TDateTime;
    //  TMO: Float;
      { Private declarations }
    procedure gravaConfiguracoesRegistro;
    procedure leConfiguracoesRegistro;
    function GerarTimerRegressivo(Data1, Data2: TTime): string;
    function GerarTimerProgressivo(Data: TTime): string;
  public
    { Public declarations }
  end;

var
  frmTMO: TfrmTMO;
  obTMO: TTMO;
  obServ: TServTMO;

implementation

uses udtmTMO, Registry, uDtmAtivo, uDataSet_OOP, DBClient, DB;

{$R *.dfm}

function TfrmTMO.GerarTimerRegressivo(Data1, Data2: TTime): string;
var
  iData1, iData2: string;
begin
  iData1 := TimeToStr(Data1);
  iData2 := TimeToStr(Data2);

  if (StrToDateTime(iData1) <= (StrToTime('01:00:00') * vServ.dataSet.FieldByName('TMO').AsFloat))  then
  iData2 := TimeToStr((StrToTime(iData2) -  StrToTime('00:00:01')))
  else
  iData2 := '('+TimeToStr((StrToTime(iData2) +  StrToTime('00:00:01')))+')';

  if iData2 ='(00:00:01)' then
  obTMO.atualizarLembreteAgenda('AVISO');


  Result := iData2;
end;

function TfrmTMO.GerarTimerProgressivo(Data: TTime): string;
var
  iData1, iData2: string;
begin
  iData1 := TimeToStr(Data);
  iData2 := TimeToStr((StrToTime(iData1) +  StrToTime('00:00:01')));
  iData1 := iData2;

  Result := iData1;
end;

procedure TfrmTMO.BitBtn1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmTMO.BtnAbrirDiaClick(Sender: TObject);
begin
  inherited;
  if EditHw5.AsInteger <= 0 then
  begin
  	if vDadosIni.vEmp.vUsarAparelho = 'S' then
    	Application.MessageBox(PChar('Técnico não informado!'),  'Atenção', MB_ICONERROR + MB_OK)
    else
      Application.MessageBox(PChar('Mecânico não informado!'), 'Atenção', MB_ICONERROR + MB_OK);
    if (Self.Enabled) and (Self.Visible) and (EditHw5.CanFocus) then
      EditHw5.SetFocus;
    exit;
  end;

  if not obTMO.existe(EditHw5.AsInteger) then
  begin
    if (Self.Enabled) and (Self.Visible) and (EditHw5.CanFocus) then
     EditHw5.SetFocus;
  end;

  if not obTMO.abrirDia then
    exit;

  Edit1.Text := '';
  Label1.Visible := False;
  Label2.Visible := False;
  obTMO.vColab.vServ.dataSet.EmptyDataSet;
  if (Self.Enabled) and (Self.Visible) and (EditHw5.CanFocus) then
    EditHw5.SetFocus;
end;

procedure TfrmTMO.btnFechardiaClick(Sender: TObject);
begin
  inherited;

  if EditHw5.AsInteger <= 0 then
  begin
    if vDadosIni.vEmp.vUsarAparelho = 'S' then
    	Application.MessageBox(PChar('Técnico não informado!'),  'Atenção', MB_ICONERROR + MB_OK)
    else
      Application.MessageBox(PChar('Mecânico não informado!'), 'Atenção', MB_ICONERROR + MB_OK);
    if (Self.Enabled) and (Self.Visible) and (EditHw5.CanFocus) then
      EditHw5.SetFocus;
    exit;
  end;

  if not obTMO.existe(EditHw5.AsInteger) then
  begin
    if (Self.Enabled) and (Self.Visible) and (EditHw5.CanFocus) then
     EditHw5.SetFocus;
  end;

  if application.messagebox('Tem Certeza que Deseja Fechar o Dia de Serviço?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) <> IDYES then
    exit;

  if not obTMO.fecharDia then
    exit;

  Edit1.Text := '';
  Label1.Visible := False;
  Label2.Visible := False;
  obTMO.vColab.vServ.dataSet.EmptyDataSet;
  if (Self.Enabled) and (Self.Visible) and (EditHw5.CanFocus) then
    EditHw5.SetFocus;
end;

procedure TfrmTMO.BtnPausaClick(Sender: TObject);
begin
  inherited;
  if EditHw5.AsInteger <= 0 then
  begin
    if vDadosIni.vEmp.vUsarAparelho = 'S' then
    	Application.MessageBox(PChar('Técnico não informado!'),  'Atenção', MB_ICONERROR + MB_OK)
    else
      Application.MessageBox(PChar('Mecânico não informado!'), 'Atenção', MB_ICONERROR + MB_OK);
    if (Self.Enabled) and (Self.Visible) and (EditHw5.CanFocus) then
      EditHw5.SetFocus;
    exit;
  end;

  if not obTMO.existe(EditHw5.AsInteger) then
  begin
    if (Self.Enabled) and (Self.Visible) and (EditHw5.CanFocus) then
     EditHw5.SetFocus;
  end;
  
  if not obTMO.pausarServico then
    exit;

  Edit1.Text := '';
  Label1.Visible := False;
  Label2.Visible := False;
  obTMO.vColab.vServ.dataSet.EmptyDataSet;
  if (Self.Enabled) and (Self.Visible) and (EditHw5.CanFocus) then
    EditHw5.SetFocus;
end;

procedure TfrmTMO.BtnTiraPausaClick(Sender: TObject);
begin
  inherited;
  if EditHw5.AsInteger <= 0 then
  begin
    if vDadosIni.vEmp.vUsarAparelho = 'S' then
    	Application.MessageBox(PChar('Técnico não informado!'),  'Atenção', MB_ICONERROR + MB_OK)
    else
      Application.MessageBox(PChar('Mecânico não informado!'), 'Atenção', MB_ICONERROR + MB_OK);
    if (Self.Enabled) and (Self.Visible) and (EditHw5.CanFocus) then
      EditHw5.SetFocus;
    exit;
  end;

  if not obTMO.existe(EditHw5.AsInteger) then
  begin
    if (Self.Enabled) and (Self.Visible) and (EditHw5.CanFocus) then
     EditHw5.SetFocus;
  end;
  
  if not obTMO.removerPausa then
    exit;

  Edit1.Text := '';
  Label1.Visible := False;
  Label2.Visible := False;
  obTMO.vColab.vServ.dataSet.EmptyDataSet;
  if (Self.Enabled) and (Self.Visible) and (EditHw5.CanFocus) then
    EditHw5.SetFocus;
end;

procedure TfrmTMO.Button1Click(Sender: TObject);
begin
  inherited;
Timer1.Enabled := true;
Label1.Caption :='00:00:00';
Label1.Caption :='00:00:05';
end;

procedure TfrmTMO.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  sh: TShiftState;
begin
  inherited;
  if Key = VK_RETURN then
    Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmTMO.DBLookupComboBox19Exit(Sender: TObject);
begin
  inherited;
  try
    EditHw5.AsValue := DBLookupComboBox19.KeyValue;
  except
  end;
end;

procedure TfrmTMO.Edit1Exit(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
  if ActiveControl = BitBtn1 then
    exit;
  if not obTMO.existeOS(Edit1.Text, CheckBox1.Checked) then
  begin
   if (Self.Enabled) and (Self.Visible) and (Edit1.CanFocus) then
     Edit1.SetFocus
  end
  else
    if (Self.Enabled) and (Self.Visible) and (DBGrid2.CanFocus) then
      DBGrid2.SetFocus;
//    if (Self.Enabled) and (Self.Visible) and (DBGrid3.CanFocus) then
//     DBGrid3.SetFocus;
  finally
      Screen.Cursor := crDefault;
  end;
end;

procedure TfrmTMO.EditHw5Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = BitBtn1) then
    Exit;

  try
    if EditHw5.AsInteger <= 0 then
    begin
     DBLookupComboBox19.KeyValue := EditHw5.AsInteger; 
     exit;
    end;

    if not obTMO.existe(EditHw5.AsInteger) then
    begin
      if (Self.Enabled) and (Self.Visible) and (EditHw5.CanFocus) then
        EditHw5.SetFocus;
    end;
    DBLookupComboBox19.KeyValue := EditHw5.AsInteger;
  except
  end;
end;

procedure TfrmTMO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  gravaConfiguracoesRegistro;
  obTMO.Free;
  obTMO := nil;
  Action := caFree;
  frmTMO := nil;
end;

procedure TfrmTMO.FormCreate(Sender: TObject);
begin
  inherited;
  vServ:= TServTMO.create;
end;

procedure TfrmTMO.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
    CheckBox1.Checked := not CheckBox1.Checked;
end;

procedure TfrmTMO.FormShow(Sender: TObject);
begin
  inherited;
  obTMO := TTMO.create;
  leConfiguracoesRegistro;
  if vDadosIni.vEmp.vUsarAparelho = 'S' then
    Label7.caption := 'Técnico:'
  else
    Label7.caption := 'Mecânico:';
  EditHw5.AsValue := vDadosIni.vCodUsuario;
  DBLookupComboBox19.KeyValue := EditHw5.AsInteger;
  obTMO.vColab.abreColab;
end;

procedure TfrmTMO.gravaConfiguracoesRegistro;
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
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
      Registro.WriteString('Numero', Edit1.Text);
      Registro.WriteBool('Todos', CheckBox1.Checked);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

procedure TfrmTMO.leConfiguracoesRegistro;
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
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
      Edit1.Text := Registro.ReadString('Numero');
      CheckBox1.Checked := Registro.ReadBool('Todos');
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

procedure TfrmTMO.Timer1Timer(Sender: TObject);
var
tempo1, tempo2, teste:string;
begin
  if (Timer1.Enabled = true) then
  begin
    tempo1:= Label1.Caption;
    tempo2:= StringReplace(Label2.Caption,'(','',[rfReplaceAll]);
    tempo2:= StringReplace(tempo2,')','',[rfReplaceAll]);
    Label1.Caption := GerarTimerProgressivo(StrToTime(tempo1));
    Label2.Caption :=GerarTimerRegressivo(StrToTime(tempo1), StrToTime(tempo2));
  end;
end;

end.




