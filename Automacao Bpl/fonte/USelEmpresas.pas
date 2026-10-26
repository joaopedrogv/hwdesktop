unit USelEmpresas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, CheckLst, registry;

type
  TFormSelEmpresas = class(TForm)
    GroupBox1: TGroupBox;
    ckMarcar: TCheckBox;
    cklbEmpresas: TCheckListBox;
    Panel1: TPanel;
    BitBtn27: TBitBtn;
    BitBtn28: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ckMarcarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn28Click(Sender: TObject);
    procedure BitBtn27Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function mudaregistro: boolean;
  private
    { Private declarations }
  public
    { Public declarations }
   codEmp: string;
  end;

var
  FormSelEmpresas: TFormSelEmpresas;

implementation

uses UDtmRelatorios, IBQuery, uDtmAtivo, uDadosIni, DB;

{$R *.dfm}

procedure TFormSelEmpresas.BitBtn27Click(Sender: TObject);
var
 i: Integer;
 vOk: boolean;
begin
   vOk := False;

   for i := 0 to cklbEmpresas.Items.Count - 1 do
   begin
      if cklbEmpresas.Checked[i] = true then
      begin
        vOk := true;
        break;
      end;
   end;

  if not vOk then
    Application.MessageBox('Pelo menos uma empresa deve ser selecionada!', 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1)
  else
  begin
    vDadosIni.vPesquisa := '';
    for i := 0 to cklbEmpresas.Items.Count - 1 do
    begin
      if cklbEmpresas.Checked[i] then
        vDadosIni.vPesquisa := vDadosIni.vPesquisa +
         Copy(trim(cklbEmpresas.Items[i]), 1, Pos('-', trim(cklbEmpresas.Items[i])) - 1)  + ',';
    end;
    vDadosIni.vPesquisa := trim(Copy(trim(vDadosIni.vPesquisa), 1, Length(trim(vDadosIni.vPesquisa)) -1));
    vDadosIni.vPesquisa := '[' + trim(vDadosIni.vPesquisa) + ']';
    ModalResult := mrOk;
  end;
end;

procedure TFormSelEmpresas.BitBtn28Click(Sender: TObject);
begin
 ModalResult := mrCancel;
end;

procedure TFormSelEmpresas.ckMarcarClick(Sender: TObject);
var
  i: Integer;
begin
  if (ckMarcar.Checked = true) then
  begin
    for i := 0 to cklbEmpresas.Items.Count - 1 do
      cklbEmpresas.Checked[i] := true;
  end
  else
  begin
    for i := 0 to cklbEmpresas.Items.Count - 1 do
      cklbEmpresas.Checked[i] := false;
  end

end;

procedure TFormSelEmpresas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  if (FormSelEmpresas<> nil) then
    FormSelEmpresas := nil;
end;

procedure TFormSelEmpresas.FormCreate(Sender: TObject);
begin
 if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TFormSelEmpresas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    BitBtn28Click(Sender);
end;

procedure TFormSelEmpresas.FormShow(Sender: TObject);
var
  i, k: Integer;
  buscas: TIBQuery;
begin
  i := 0;
  buscas := TIBQuery.Create(Application);
  buscas.Database := dtmAtivo.bancoHw;
  buscas.Transaction := buscas.Transaction;
  Buscas := TIBQuery(dtmRelatorios.qrBuscas);

  mudaregistro;
  
  buscas.Close;
  buscas.Sql.Text := 'select COD_EMPRESA, IDENTIFICACAO_EMP from EMPRESA where ATIVO = 1';
  buscas.Prepare;
  buscas.Open;
  buscas.First;
  cklbEmpresas.Clear;
  codEmp := '';
  while not buscas.Eof do
  begin
    cklbEmpresas.Items.Add(buscas.FieldByName('COD_EMPRESA').AsString +' - '+ trim(buscas.FieldByName('IDENTIFICACAO_EMP').AsString));
    if trim(codEmp) <> '' then
      codEmp := codEmp + ',';
    codEmp:= codEmp + (buscas.FieldByName('COD_EMPRESA').AsString);
    if (StrToInt(vDadosIni.codEmpresa) = buscas.FieldByName('COD_EMPRESA').AsInteger) then
      k := i;
    i := i + 1;
    buscas.Next;
  end;
  buscas.Close;

  if cklbEmpresas.Items.Count = 1 then
    cklbEmpresas.Checked[0] := true;

  cklbEmpresas.Checked[K] := true;

  vDadosIni.fechaStatusProcessamento;
  
  if ckMarcar.CanFocus then
    ckMarcar.SetFocus;

end;

function TFormSelEmpresas.mudaregistro: boolean;
var
 registro: TRegistry;
 vatual: string;
begin
 Result:=false;
 try
  vDadosIni.mudaregistroODBC('Admin');
  vDadosIni._acertarRegistroCrystal;
  {Registro := TRegistry.Create(KEY_WRITE); // Chama o construtor do objeto
  Registro.RootKey := HKEY_LOCAL_MACHINE; //Define a chave raiz
  Registro.OpenKey('SOFTWARE\ODBC\ODBC.INI\admin', True); //Cria a chave
  vatual:=registro.ReadString('Database');
  if vatual <> vDadosIni.vBancoHW then
   Registro.WriteString('Database', vDadosIni.vBancoHW); //Grava o endereço da sua aplicação no Registro
  Registro.CloseKey; // Fecha a chave e o objeto
  Registro.Free;}
  Result:=true;
 except
   MessageDlg('Erro ao gravar no registro endereco do ODBC para: '+vDadosIni.vBancoHW,mtError,[mbOK],0);
   Result:=false;
 end;
end;

end.
