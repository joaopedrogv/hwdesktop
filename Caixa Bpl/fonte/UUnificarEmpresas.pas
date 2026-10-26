unit UUnificarEmpresas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uEditMoeda, Buttons, Grids, DBGrids, DBCtrls, ExtCtrls,
  uClassesImportacaoFinanceiro, IBDatabase, DB, IBCustomDataSet, IBQuery;

type
  TFrmUnificarEmpresas = class(TForm)
    pnEmpresasUnificadas: TPanel;
    Panel23: TPanel;
    panelControles: TPanel;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    DBLookupComboBox9: TDBLookupComboBox;
    EditMoeda2: TEditMoeda;
    BitBtn22: TBitBtn;
    Panel25: TPanel;
    BitBtn23: TBitBtn;
    Panel26: TPanel;
    BitBtn24: TBitBtn;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    pnLancamentos: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    DBGrid3: TDBGrid;
    Label4: TLabel;
    btControles: TSpeedButton;
    PanelUnificada: TPanel;
    RadioGroupReplicador: TRadioGroup;
    Panel4: TPanel;
    Label5: TLabel;
    EditDataBase: TEdit;
    Panel5: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DBLookupComboBox8: TDBLookupComboBox;
    ComboBox1: TComboBox;
    EditMoeda1: TEditMoeda;
    EditMoeda3: TEditMoeda;
    BitBtn25: TBitBtn;
    RadioGroupControle: TRadioGroup;
    procedure RadioGroupReplicadorClick(Sender: TObject);
    procedure btControlesClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn24Click(Sender: TObject);
    procedure BitBtn22Click(Sender: TObject);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure BitBtn25Click(Sender: TObject);
    procedure DBLookupComboBox8Exit(Sender: TObject);
    procedure EditMoeda3Exit(Sender: TObject);
    procedure DBLookupComboBox9Exit(Sender: TObject);
    procedure EditMoeda2Exit(Sender: TObject);
    procedure BitBtn23Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function _LerConfiguracoesRegistroInteger(NomeVariavel : string; Adefault: Integer = 0) : Integer;
    procedure _GravaConfiguracoesInteger(NomeVariavel : string; Valor : Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmUnificarEmpresas: TFrmUnificarEmpresas;
  Unificar: TUnificarEmpresa;

implementation

uses uDtmImportPDVFinan, uDtmAtivo, uDadosIni, uDataSet_OOP, Registry;

{$R *.dfm}

procedure TFrmUnificarEmpresas.BitBtn1Click(Sender: TObject);
begin
 try
    Screen.Cursor := crHourGlass;
    BitBtn1.Enabled := False;
    BitBtn24.Enabled := False;
    BitBtn23.Enabled := False;
    BitBtn25.Enabled := False;
    RadioGroupControle.Enabled := False;
    BitBtn22.Enabled := False;
    btSelectAll.Enabled := False;
    btUnSelectAll.Enabled := False;
    btControles.Enabled := False;
    if (Self.Enabled) and (Self.Visible) and (pnLancamentos.CanFocus) then
      pnLancamentos.SetFocus;
    Unificar.DesunificarFinanceiro;
  finally
    Label3.Caption := '';
    Label5.Caption := '';
    BitBtn24.Enabled := False;
    BitBtn1.Enabled := False;
    BitBtn23.Enabled := True;
    BitBtn25.Enabled := True;
    RadioGroupControle.Enabled := True;
    BitBtn22.Enabled := True;
    btSelectAll.Enabled := True;
    btUnSelectAll.Enabled := True;
    btControles.Enabled := True;
    panelControles.Enabled := False;
    EditMoeda2.Enabled := True;
    DBLookupComboBox9.Enabled := True;
    btSelectAll.Enabled := False;
    btUnSelectAll.Enabled := False;
    btControles.Enabled := False;
    RadioGroupReplicador.Enabled := False;
    EditDataBase.Enabled := False;
    PanelUnificada.Visible := False;
    
    Screen.Cursor := crDefault;
  end;
end;
                                                    
procedure TFrmUnificarEmpresas.BitBtn22Click(Sender: TObject);
begin
 try
   Screen.Cursor := crHourGlass;
   Unificar.MudarControles(Trunc(EditMoeda2.Valor));
 finally
   Screen.Cursor := crDefault;
 end;
end;

procedure TFrmUnificarEmpresas.BitBtn23Click(Sender: TObject);
begin
 Close;
end;

procedure TFrmUnificarEmpresas.BitBtn24Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    BitBtn1.Enabled := False;
    BitBtn24.Enabled := False;
    BitBtn23.Enabled := False;
    BitBtn25.Enabled := False;
    RadioGroupControle.Enabled := False;
    BitBtn22.Enabled := False;
    btSelectAll.Enabled := False;
    btUnSelectAll.Enabled := False;
    btControles.Enabled := False;
    if (Self.Enabled) and (Self.Visible) and (pnLancamentos.CanFocus) then
      pnLancamentos.SetFocus;
      
    Unificar.UnificarFinanceiro;
  finally
    Label3.Caption := '';
    Label5.Caption := '';
    BitBtn24.Enabled := False;
    BitBtn1.Enabled := False;
    BitBtn23.Enabled := True;
    BitBtn25.Enabled := True;
    RadioGroupControle.Enabled := True;
    BitBtn22.Enabled := True;
    btSelectAll.Enabled := True;
    btUnSelectAll.Enabled := True;
    btControles.Enabled := True;
    panelControles.Enabled := False;
    EditMoeda2.Enabled := True;
    DBLookupComboBox9.Enabled := True;
    btSelectAll.Enabled := False;
    btUnSelectAll.Enabled := False;
    btControles.Enabled := False;
    RadioGroupReplicador.Enabled := False;
    EditDataBase.Enabled := False;
    PanelUnificada.Visible := False;

    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmUnificarEmpresas.BitBtn25Click(Sender: TObject);
begin
 try
   Screen.Cursor := crHourGlass;
   Unificar.ExibirLancamento;
   if Unificar.IsEmpty then
   begin
     if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox8.CanFocus) then
       DBLookupComboBox8.SetFocus;
   end
   else
   begin
    if (Self.Enabled) and (Self.Visible) and (EditMoeda2.CanFocus) then
      EditMoeda2.SetFocus;
   end;
 finally
   _GravaConfiguracoesInteger(RadioGroupControle.Name, RadioGroupControle.ItemIndex);
   Screen.Cursor := crDefault;
 end;
end;

procedure TFrmUnificarEmpresas.btControlesClick(Sender: TObject);
begin
 try
   Screen.Cursor := crHourGlass;
   Unificar._marcaTodosControles;
 finally
   Screen.Cursor := crDefault;
 end;
end;

procedure TFrmUnificarEmpresas.btSelectAllClick(Sender: TObject);
begin
 try
   Screen.Cursor := crHourGlass;
   Unificar._marcaDesmarcaTodos(1);
 finally
   Screen.Cursor := crDefault;
 end;
end;

procedure TFrmUnificarEmpresas.btUnSelectAllClick(Sender: TObject);
begin
 try
   Screen.Cursor := crHourGlass;
   Unificar._marcaDesmarcaTodos(0);
 finally
   Screen.Cursor := crDefault;
 end;

end;

procedure TFrmUnificarEmpresas.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (Column.Field.Dataset.FieldbyName('COD_CONTROLE').AsInteger > 0)
    and (Column.Field.Dataset.FieldbyName('COD_CONTROLE_UNIFICADORA').AsInteger <= 0) then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($005E5EFF);
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  end;

  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TFrmUnificarEmpresas.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_SPACE then
   Unificar._marcaDesmarcaLinha;
end;

procedure TFrmUnificarEmpresas.DBLookupComboBox8Exit(Sender: TObject);
begin
 try
   EditMoeda3.Valor := DBLookupComboBox8.KeyValue;
 except
 end;
 Unificar.fTempLancamentos.EmptyDataSet;
 Unificar.fTempControles.EmptyDataSet;
 BitBtn1.Enabled := False;
 BitBtn24.Enabled := False;
end;

procedure TFrmUnificarEmpresas.DBLookupComboBox9Exit(Sender: TObject);
begin
 try
   EditMoeda2.Valor := DBLookupComboBox9.KeyValue;
 except
 end;
end;

procedure TFrmUnificarEmpresas.EditMoeda2Exit(Sender: TObject);
begin
 if (ActiveControl = BitBtn23) then
    Exit;

 try
   DBLookupComboBox9.KeyValue := EditMoeda2.Text;
 except
 end;
 try
   if EditMoeda2.Valor > 0 then
   begin
    if not Unificar.vCtrl.buscaControles(trunc(EditMoeda2.Valor)) then
    begin
     Application.MessageBox('Controle não encontrado!', 'Erro', MB_ICONERROR + MB_OK);
     if (Self.Enabled) and (Self.Visible) and (EditMoeda2.CanFocus) then
       EditMoeda2.SetFocus;
     exit;
    end;
   end;
 except
 end;
end;

procedure TFrmUnificarEmpresas.EditMoeda3Exit(Sender: TObject);
begin

 if (ActiveControl = BitBtn23) then
    Exit;
 try
   DBLookupComboBox8.KeyValue := EditMoeda3.Valor;
 except
 end;
 try
   if EditMoeda3.Valor > 0 then
   begin
    if trim(DBLookupComboBox8.Text) = '' then
    begin
     Application.MessageBox('Unificada não encontrada!', 'Erro', MB_ICONERROR + MB_OK);
     if (Self.Enabled) and (Self.Visible) and (EditMoeda3.CanFocus) then
       EditMoeda3.SetFocus;
     exit;
    end;
   end;
 except
 end;
 Unificar.fTempLancamentos.EmptyDataSet;
 Unificar.fTempControles.EmptyDataSet;
 BitBtn1.Enabled := False;
 BitBtn24.Enabled := False;
end;

procedure TFrmUnificarEmpresas.FormCreate(Sender: TObject);
begin
  Unificar := TUnificarEmpresa.create;
  FrmUnificarEmpresas := TFrmUnificarEmpresas(self);
  EditMoeda1.Text := vDadosIni.codEmpresa;
  ComboBox1.Text := vDadosIni.vEmp.vnomeEmpresa + ' - ' + vDadosIni.vEmp.vCNPJ;
  EditDataBase.Text := '';
end;

procedure TFrmUnificarEmpresas.FormShow(Sender: TObject);
begin
  Unificar.abreEmpresasUnificadas;
  if not Unificar.IsEmpty then
  begin
    EditMoeda3.Text := Unificar.dataSet.FieldByName('COD_EMPRESA').AsString;
    DBLookupComboBox8.KeyValue := Unificar.dataSet.FieldByName('COD_EMPRESA').AsInteger;
  end;
  DBGrid3.DataSource := Unificar.fTempLancamentosDataSource;
  DBGrid1.DataSource := Unificar.fTempControlesDataSource;
  BitBtn1.Enabled := False;
  BitBtn24.Enabled := False;
  panelControles.Enabled := False;
  EditMoeda2.Enabled := False;
  DBLookupComboBox9.Enabled := False;
  BitBtn22.Enabled := False;
  btSelectAll.Enabled := False;
  btUnSelectAll.Enabled := False;
  btControles.Enabled := False;
  RadioGroupReplicador.Enabled := False;
  RadioGroupReplicador.ItemIndex := 0;
  EditDataBase.Enabled := False;
  Label3.Caption := '';
  Label5.Caption := '';
  PanelUnificada.Visible := False;
  RadioGroupControle.ItemIndex := _LerConfiguracoesRegistroInteger(RadioGroupControle.Name);
end;

procedure TFrmUnificarEmpresas.RadioGroupReplicadorClick(Sender: TObject);
begin
 EditDataBase.Enabled := RadioGroupReplicador.ItemIndex = 1;
end;

procedure TFrmUnificarEmpresas._GravaConfiguracoesInteger(NomeVariavel: string;
  Valor: Integer);
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
      Registro.WriteInteger(NomeVariavel, Valor);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

function TFrmUnificarEmpresas._LerConfiguracoesRegistroInteger(
  NomeVariavel: string; Adefault: Integer): Integer;
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
  vTemp: Integer;
begin
  try
    vTemp := Adefault;
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      // L~e a informação da variavel
      vTemp := Registro.ReadInteger(NomeVariavel);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Result := vTemp;
      Registro.Free;
    end;
  except
  end;
end;

initialization
  RegisterClass(TFrmUnificarEmpresas);
finalization
  UnRegisterClass(TFrmUnificarEmpresas);

end.
