unit UReservaVeiculosCCIA;

(************************ Hw Sistemas e Computadores ***************************
1 - Se o usuário tiver o nível baixo ele mostra somente o CHASSI
 e o usuário que está realizando a reserva e o botão de CANCELAR e OK, se o
 usuário tiver um nivel de acesso maior aparece os demais campos.
2 - Se o usuário informa o tempo o campo de dias fica desabilitado, também
invertendo as ordens.
3 - O usuário só pode retirar a reserva se for o proprio usuário ou outro
usuário com o nível maior de acesso (ex.GERENTE)
*******************************************************************************)

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, UClassesVeiculosCCIA,
  AppEvnts, Menus, ComCtrls, Grids, DBGrids, uCadPadraoModal;

type
  TFrmReservaVeiculosCCIA = class(TfrmCadPadraoM)
    TabSheet4: TTabSheet;
    ScrollBox4: TScrollBox;
    Panel7: TPanel;
    BitBtn19: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    GroupBox4: TGroupBox;
    pnReserva: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label26: TLabel;
    Label31: TLabel;
    Label48: TLabel;
    Label56: TLabel;
    Image1: TImage;
    Label6: TLabel;
    Memo1: TMemo;
    DBEdit3: TDBEdit;
    DBEdit6: TDBEdit;
    DBLookupComboBox10: TDBLookupComboBox;
    DBComboBox4: TDBComboBox;
    DBMemo1: TDBMemo;
    DBEdit7: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit16: TDBEdit;
    DBComboBox8: TDBComboBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    DBEdit5: TDBEdit;
    BitBtn16: TBitBtn;
    GroupBox5: TGroupBox;
    Label7: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBComboBox1: TDBComboBox;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    Label13: TLabel;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    PopupMenu3: TPopupMenu;
    Configurarcolunas2: TMenuItem;
    procedure DBEdit5Exit(Sender: TObject);
    procedure DBEdit5Enter(Sender: TObject);
    procedure BitBtn99Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure DBEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pnReservaEnter(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure DBEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit1Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBComboBox4Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure ConfigurarForm(pValor: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmReservaVeiculosCCIA: TFrmReservaVeiculosCCIA;
  ReservaEstMotos: TReservaEstMotoCCIA;
  vTelaCadastro, vTipoForm: Integer;
  vChassiTemp: string;
  vCodigoTemp, vCodEmpTemp: Integer;
  vDataHoraBanco: TDateTime;
  vHabilitarDtReserva: boolean;
  
implementation

uses
  uDtmAtivo, UDtmVeiculosCCIA, uDataSet_OOP, DB, Registry, uDadosIni;
{$R *.dfm}

procedure TFrmReservaVeiculosCCIA.BitBtn10Click(Sender: TObject);
begin
  inherited;
  if ReservaEstMotos.IsEmpty then
    Exit;

  if not ReservaEstMotos.verificarReservaExiste then
   exit;

  if ReservaEstMotos.IsEmpty then
    Exit; 
    
  ReservaEstMotos.ObterDadosReserva;
  PageControl1.ActivePage := TabSheet4;
  TabSheet4.Show;

  if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
    DBEdit3.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit7.CanFocus) then
    DBEdit7.SetFocus;
end;

procedure TFrmReservaVeiculosCCIA.BitBtn12Click(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := TabSheet2;
  TabSheet2.Show;
end;

procedure TFrmReservaVeiculosCCIA.BitBtn16Click(Sender: TObject);
var
 vProc: string;
begin
  try
    if ReservaEstMotos.dataSet.IsEmpty then
      Exit;
      
    if ReservaEstMotos.vTipoRes = 'B' then
      vProc := 'VEI150'
    else if ReservaEstMotos.vTipoRes = 'C' then
      vProc := 'VEI151'
    else
      vProc := 'VEI149';

    if not vDadosIni.PesqPros(vProc, 'RENOVAR', '', 'EST_MOTO', '', ReservaEstMotos.buscas2, true) then
      exit;

    if not ReservaEstMotos.RenovarReserva then
    begin
      setFocusCampoErro(ReservaEstMotos.vNomeCampoErro, ReservaEstMotos.vMensagemErro);
      exit;
    end;
    Close;
    inherited;
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFrmReservaVeiculosCCIA.BitBtn17Click(Sender: TObject);
begin
  inherited;
  try
  	if (Self.Enabled) and (Self.Visible) and (BitBtn17.CanFocus) then
    	BitBtn17.SetFocus;
    Screen.Cursor := crHourGlass;
    if not vDadosIni.PesqPros('VEI063', 'CONFIRMAR RESERVA', '', 'EST_MOTO', '', ReservaEstMotos.buscas, true) then
      exit;

    if not ReservaEstMotos.SalvarReserva then
    begin
      setFocusCampoErro(ReservaEstMotos.vNomeCampoErro, ReservaEstMotos.vMensagemErro);
      exit;
    end;
    inherited;
    close;
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFrmReservaVeiculosCCIA.BitBtn18Click(Sender: TObject);
begin
  inherited;
  try
    ReservaEstMotos.Cancel;
    ReservaEstMotos.RollBackTransacao;
    close;  
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFrmReservaVeiculosCCIA.BitBtn19Click(Sender: TObject);
var
 vProc: string;
begin
  try
    if ReservaEstMotos.dataSet.IsEmpty then
      Exit;

    ReservaEstMotos.buscarDadosReserva;
    if ReservaEstMotos.vTipoRes = 'B' then
      vProc := 'VEI131'
    else if ReservaEstMotos.vTipoRes = 'C' then
      vProc := 'VEI133'
    else
      vProc := 'VEI064';

    if not vDadosIni.PesqPros(vProc, 'RETIRAR', '', 'EST_MOTO', '', ReservaEstMotos.buscas2, true) then
      exit;

    if not ReservaEstMotos.verificarReservaExiste then
       exit;

    if not ReservaEstMotos.RetirarReserva then
      exit;
    Close;
    inherited;
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFrmReservaVeiculosCCIA.BitBtn7Click(Sender: TObject);
var
 vProc: string;
 vAlterarVendededor: boolean;
begin
  try
    vAlterarVendededor := false;
    
    if ReservaEstMotos.vTipoRes = 'B' then
      vProc := 'VEI132'
    else if ReservaEstMotos.vTipoRes = 'C' then
      vProc := 'VEI134'
    else
      vProc := 'VEI130';

    if not vDadosIni.PesqPros(vProc, 'ALTERAR', '', 'EST_MOTO', '', ReservaEstMotos.buscas2, true) then
      exit;

    if (Application.MessageBox(pchar('Deseja alterar reserva?'), 'Confirmação',  MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> IDYES) then
      exit;

    if not ReservaEstMotos.ObterDadosReserva then
      exit;

    if ReservaEstMotos.vTipoRes <> 'M' then
    begin
      ReservaEstMotos.dataSet.FieldByName('TIPO_RES_OLD').AsString := ReservaEstMotos.dataSet.FieldByName('TIPO_RES').AsString;
      ReservaEstMotos.dataSet.FieldByName('DATA_RES_OLD').Value := ReservaEstMotos.dataSet.FieldByName('DATA_RES').Value;
      ReservaEstMotos.dataSet.FieldByName('HORA_RES_OLD').AsString := ReservaEstMotos.dataSet.FieldByName('HORA_RES').AsString;
      ReservaEstMotos.dataSet.FieldByName('GRUPO_COTA_RD_OLD').AsString := ReservaEstMotos.dataSet.FieldByName('GRUPO_COTA_RD').AsString;
      ReservaEstMotos.dataSet.FieldByName('DATA_ASSEMBLEIA_OLD').Value := ReservaEstMotos.dataSet.FieldByName('DATA_ASSEMBLEIA').Value;
      ReservaEstMotos.dataSet.FieldByName('DATA_VENC_RES_OLD').Value := ReservaEstMotos.dataSet.FieldByName('DATA_VENC_RES').Value;
      ReservaEstMotos.dataSet.FieldByName('HORA_VENC_RES_OLD').AsString := ReservaEstMotos.dataSet.FieldByName('HORA_VENC_RES').AsString;
    end;
    ReservaEstMotos.dataSet.FieldByName('STATUS_RES').AsString := 'N';
    ReservaEstMotos.dataSet.FieldByName('DATA_RES').AsDateTime := vDadosIni.getDataBanco(ReservaEstMotos.buscas);
    ReservaEstMotos.dataSet.FieldByName('HORA_RES').AsString := FormatDateTime('HH:MM', vDadosIni.getDataHoraBanco(ReservaEstMotos.buscas));

    if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
      DBEdit3.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit6.CanFocus) then
      DBEdit6.SetFocus;
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFrmReservaVeiculosCCIA.BitBtn8Click(Sender: TObject);
begin
 Close;
end;

procedure TFrmReservaVeiculosCCIA.BitBtn99Click(Sender: TObject);
begin
  ReservaEstMotos.Refresh;
end;

procedure TFrmReservaVeiculosCCIA.btSelectAllClick(Sender: TObject);
begin
  inherited;
  ReservaEstMotos._marcarDemarcarTodos;
end;

procedure TFrmReservaVeiculosCCIA.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
  ReservaEstMotos._marcarDemarcarTodos(1);
end;

procedure TFrmReservaVeiculosCCIA.ConfigurarForm(pValor: string);
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
begin
  try
    if (TelaCadastro <= 0 ) then
      exit;
      
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + 'TfrmPrincipalS', True);
      // Grava as informações do form
      Registro.WriteString('JanelasMaximizadas', pValor);
      Registro.WriteString('ExibirPropagandaFlash', 'N');
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

procedure TFrmReservaVeiculosCCIA.DBComboBox4Exit(Sender: TObject);
var
 vTipoRes, vTipoResOld, vGrupoCotaRD, vDataVenc, vHoraVenc, vDataAssembleia: Variant;
begin
  inherited;
  vTipoResOld := ReservaEstMotos.retornaValor(' select tipo_res as valor from tipo_reserva res ' +
      ' where res.tipo = ''VEI'' and res.sigla = ' + QuotedStr(trim(ReservaEstMotos.dataSet.FieldByName('TIPO_RES_OLD').AsString)));
  if not vDadosIni.RetornaDataHoraVenc(ReservaEstMotos.buscas,
    ReservaEstMotos.dataSet.FieldByName('POSICAO').AsString,
    ReservaEstMotos.dataSet.FieldByName('TIPO_RES').AsString,
    ReservaEstMotos.dataSet.FieldByName('GRUPO_COTA_RD').AsString,
    ReservaEstMotos.dataSet.FieldByName('DATA_RES').AsDateTime,
    ReservaEstMotos.dataSet.FieldByName('HORA_RES').AsString,
    ReservaEstMotos.dataSet.FieldByName('DATA_ASSEMBLEIA').AsDateTime,
    vTipoRes, vGrupoCotaRD, vDataVenc, vHoraVenc, vDataAssembleia) then
  begin
   DBComboBox4.Enabled := trim(ReservaEstMotos.dataSet.FieldByName('STATUS_RES').AsString) <> 'S';
   DBEdit5.Enabled := (trim(vTipoRes) = 'C') and (vHabilitarDtReserva) 
  	and (trim(ReservaEstMotos.dataSet.FieldByName('STATUS_RES').AsString) <> 'S');
   BitBtn7.Enabled := trim(ReservaEstMotos.dataSet.FieldByName('STATUS_RES').AsString) = 'S';
   BitBtn19.Enabled := trim(ReservaEstMotos.dataSet.FieldByName('STATUS_RES').AsString) = 'S';
   BitBtn16.Enabled := (trim(ReservaEstMotos.dataSet.FieldByName('STATUS_RES').AsString) = 'S')
    and (ReservaEstMotos.dataSet.FieldByName('DATA_VENC_RES').AsDateTime > 0);
   Label8.Visible := False;
   DBEdit8.Visible := False;
   Label6.Visible := False;
   DBEdit5.Visible := False;
   Label7.Visible := False;
   DBComboBox1.Visible := False;
   Label12.Visible := False;
   DBEdit12.Visible := False;
   Label11.Visible := False;
   DBEdit13.Visible := False;
   Label9.Visible := False;
   DBEdit10.Visible := False;
   Label10.Visible := False;
   DBEdit11.Visible := False;
   Label13.Visible := False;
   DBEdit14.Visible := False;
   Label14.Visible := False;
   DBEdit15.Visible := False;
   GroupBox5.Visible := False;
   exit;
  end;

  Label6.Visible := trim(vTipoRes) = 'C';
  DBEdit5.Visible := trim(vTipoRes) = 'C';
  Label8.Visible := trim(vTipoRes) = 'C';
  DBEdit8.Visible := trim(vTipoRes) = 'C';
  Label6.Visible := trim(vTipoRes) = 'C';
  DBEdit5.Visible := trim(vTipoRes) = 'C';  
  Label7.Visible := (trim(vTipoRes) = 'M') and (trim(ReservaEstMotos.dataSet.FieldByName('TIPO_RES_OLD').AsString) <> '');
  DBComboBox1.Visible := (trim(vTipoRes) = 'M') and (trim(ReservaEstMotos.dataSet.FieldByName('TIPO_RES_OLD').AsString) <> '');
  Label9.Visible := (trim(vTipoRes) = 'M') and (trim(ReservaEstMotos.dataSet.FieldByName('TIPO_RES_OLD').AsString) <> '');
  DBEdit10.Visible := (trim(vTipoRes) = 'M') and (trim(ReservaEstMotos.dataSet.FieldByName('TIPO_RES_OLD').AsString) <> '');
  Label10.Visible := (trim(vTipoRes) = 'M') and (trim(ReservaEstMotos.dataSet.FieldByName('TIPO_RES_OLD').AsString) <> '');
  DBEdit11.Visible := (trim(vTipoRes) = 'M') and (trim(ReservaEstMotos.dataSet.FieldByName('TIPO_RES_OLD').AsString) <> '');
  Label13.Visible := (trim(vTipoRes) = 'M') and (trim(ReservaEstMotos.dataSet.FieldByName('TIPO_RES_OLD').AsString) <> '');
  DBEdit14.Visible := (trim(vTipoRes) = 'M') and (trim(ReservaEstMotos.dataSet.FieldByName('TIPO_RES_OLD').AsString) <> '');
  Label14.Visible := (trim(vTipoRes) = 'M') and (trim(ReservaEstMotos.dataSet.FieldByName('TIPO_RES_OLD').AsString) <> '');
  DBEdit15.Visible := (trim(vTipoRes) = 'M') and (trim(ReservaEstMotos.dataSet.FieldByName('TIPO_RES_OLD').AsString) <> '');
  GroupBox5.Visible := (trim(vTipoRes) = 'M') and (trim(ReservaEstMotos.dataSet.FieldByName('TIPO_RES_OLD').AsString) <> '');
  Label12.Visible := (trim(vTipoResOld) = 'C') and (trim(vTipoRes) = 'M')
     and (trim(ReservaEstMotos.dataSet.FieldByName('TIPO_RES_OLD').AsString) <> '');
  DBEdit12.Visible := (trim(vTipoResOld) = 'C') and (trim(vTipoRes) = 'M')
     and (trim(ReservaEstMotos.dataSet.FieldByName('TIPO_RES_OLD').AsString) <> '');
  DBEdit13.Visible := (trim(vTipoResOld) = 'C') and (trim(vTipoRes) = 'M')
     and (trim(ReservaEstMotos.dataSet.FieldByName('TIPO_RES_OLD').AsString) <> '');
  Label11.Visible := (trim(vTipoResOld) = 'C') and (trim(vTipoRes) = 'M')
     and (trim(ReservaEstMotos.dataSet.FieldByName('TIPO_RES_OLD').AsString) <> '');


  DBComboBox4.Enabled := trim(ReservaEstMotos.dataSet.FieldByName('STATUS_RES').AsString) <> 'S';
  DBEdit5.Enabled := (trim(vTipoRes) = 'C') and (vHabilitarDtReserva) 
  	and (trim(ReservaEstMotos.dataSet.FieldByName('STATUS_RES').AsString) <> 'S');
  DBComboBox8.Enabled := trim(ReservaEstMotos.dataSet.FieldByName('STATUS_RES').AsString) <> 'S';

  if trim(ReservaEstMotos.dataSet.FieldByName('STATUS_RES').AsString) = 'S' then
    exit;

  ReservaEstMotos.dataSet.FieldByName('DATA_VENC_RES').Value := vDataVenc;
  ReservaEstMotos.dataSet.FieldByName('HORA_VENC_RES').Value := vHoraVenc;
  ReservaEstMotos.dataSet.FieldByName('GRUPO_COTA_RD').Value := vGrupoCotaRD;
  ReservaEstMotos.dataSet.FieldByName('DATA_ASSEMBLEIA').Value := vDataAssembleia;
end;

procedure TFrmReservaVeiculosCCIA.DBEdit1Exit(Sender: TObject);
begin
  inherited;
   if (ActiveControl = BitBtn18) then
    Exit;
    
  if ReservaEstMotos.dataSet.FieldByName('VENDEDOR_RES').AsInteger > 0 then
  begin
    if not ReservaEstMotos.vColaboradorVeic.buscarColaborador(ReservaEstMotos.dataSet.FieldByName('VENDEDOR_RES').asinteger) then
    begin
      Application.MessageBox('Vendedor não encontrado', 'Informação', MB_OK + MB_ICONINFORMATION +
        MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
        DBEdit1.SetFocus;
    end;
  end;
end;

procedure TFrmReservaVeiculosCCIA.DBEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      ReservaEstMotos.dataSet.FieldByName('VENDEDOR_RES').AsString := vDadosIni.pesquisaRapida('COLABORADOR');
    finally
      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TFrmReservaVeiculosCCIA.DBEdit3Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = BitBtn18) then
    Exit;

  if ReservaEstMotos.dataSet.FieldByName('COD_CLIENTE').AsInteger > 0 then
  begin
    if not ReservaEstMotos.vClientesVeic.abreClientes(ReservaEstMotos.dataSet.FieldByName('COD_CLIENTE').asinteger) then
    begin
      Application.MessageBox('Cliente não encontrado', 'Informação', MB_OK + MB_ICONINFORMATION +
        MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
        DBEdit3.SetFocus;
    end
    else
    begin      
      ReservaEstMotos.dataSet.FieldByName('NOME_RES').AsString := ReservaEstMotos.vClientesVeic.dataSet.FieldByName('NOME_CLIENTE').AsString;
      if (vDadosIni.apenasNumeros(ReservaEstMotos.dataSet.FieldByName('FONE_RES').AsString) <> '') 
        and (ReservaEstMotos.vCodCliente > 0)
        and (ReservaEstMotos.vCodCliente <> ReservaEstMotos.dataSet.FieldByName('COD_CLIENTE').AsInteger) then             
      begin
         if Application.MessageBox(pchar('Deseja carregar o telefone do cadastro do cliente?'), 'Atenção',
          MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES then
            ReservaEstMotos.dataSet.FieldByName('FONE_RES').AsString := vDadosIni.apenasNumeros(ReservaEstMotos.vClientesVeic.dataSet.FieldByName('FONE_CLIENTE').AsString);
      end
      else if trim(ReservaEstMotos.dataSet.FieldByName('FONE_RES').AsString) = '' then           
        ReservaEstMotos.dataSet.FieldByName('FONE_RES').AsString := vDadosIni.apenasNumeros(ReservaEstMotos.vClientesVeic.dataSet.FieldByName('FONE_CLIENTE').AsString);
      ReservaEstMotos.vCodCliente := ReservaEstMotos.dataSet.FieldByName('COD_CLIENTE').AsInteger;  
    end;
  end;
  DBEdit6.ReadOnly := (ReservaEstMotos.dataSet.FieldByName('COD_CLIENTE').AsInteger > 0);
  DBComboBox4Exit(Sender);
end;

procedure TFrmReservaVeiculosCCIA.DBEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      ReservaEstMotos.dataSet.FieldByName('COD_CLIENTE').AsString := vDadosIni.pesquisaRapida('CLIENTES');
    finally
      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TFrmReservaVeiculosCCIA.DBEdit5Enter(Sender: TObject);
begin
  mostrarHintEmBalao(DBEdit5.Handle, PChar('Data da assembleia' + #13 +
    'Pressione "ESC" para limpar o conteúdo'), 'Atenção', TTI_INFO);
end;

procedure TFrmReservaVeiculosCCIA.DBEdit5Exit(Sender: TObject);
begin
  ReservaEstMotos.atualizarDataVenc;  
end;

procedure TFrmReservaVeiculosCCIA.DBEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
  begin
  	try
      ReservaEstMotos.dataSet.FieldByName('DATA_ASSEMBLEIA').EditMask := '';
      ReservaEstMotos.dataSet.FieldByName('DATA_ASSEMBLEIA').Value := Null;
      DBEdit5.Text := '99/99/9999';
      DBEdit5.Clear;
    finally
			ReservaEstMotos.dataSet.FieldByName('DATA_ASSEMBLEIA').EditMask := '!99/99/0000;1;_';
    end;
  end;
end;

procedure TFrmReservaVeiculosCCIA.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if (ReservaEstMotos <> nil) then
  begin
    ReservaEstMotos.Cancel;
    ReservaEstMotos.RollBackTransacao;
  end;
  ReservaEstMotos.free;
  ReservaEstMotos := nil;

  Action := caFree;
  if (FrmReservaVeiculosCCIA <> nil) then
    FrmReservaVeiculosCCIA := nil;
end;

procedure TFrmReservaVeiculosCCIA.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  tsMemo.TabVisible := False;
  TabSheet1.TabVisible := False;
  TabSheet2.TabVisible := False;
  TabSheet3.TabVisible := False;
  TabSheet4.TabVisible := False;

  ReservaEstMotos := TReservaEstMotoCCIA.create;
  ReservaEstMotos.verificatiporeserva(1, DBComboBox4, 'VEI', '');
  ReservaEstMotos.verificatiporeserva(1, DBComboBox1, 'VEI', '');
	vTipoForm := 0;


  if trim(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1)) = 'RESERVAVEIC' then
  begin
    if DtmVeiculosCCIA = nil then
      DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);
    FrmReservaVeiculosCCIA.Caption := 'Reserva de veículos';
    vTipoForm := 8;
    vCodigoTemp := StrToInt(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2));
    vCodEmpTemp := StrToInt(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 3));
    vChassiTemp := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 4);
  end;
  vDadosIni.vPesquisa := '';

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TFrmReservaVeiculosCCIA.FormShow(Sender: TObject);
var
 I: Integer;
begin
	if not Self.Enabled then
  	Exit;

  ConfigurarForm('N');
  vTelaCadastro := 1;
  vDadosIni.vInibeMensPesqPros := 'S';
  DBComboBox4.Enabled := vDadosIni.PesqPros('VEI100', 'HABILITAR', '', 'EST_MOTO', '', ReservaEstMotos.buscas, true);
  vDadosIni.vInibeMensPesqPros := 'S';
  ReservaEstMotos.vHabilitarVend := vDadosIni.PesqPros('VEI129', 'HABILITAR', '', 'EST_MOTO', '', ReservaEstMotos.buscas, true);
  vDadosIni.vInibeMensPesqPros := 'S';
  vHabilitarDtReserva := vDadosIni.PesqPros('VEI165', 'HABILITAR', '', 'EST_MOTO', '', ReservaEstMotos.buscas, true);
  if (vTipoForm = 8) then
  begin
     vTelaCadastro := 0;
     if not ReservaEstMotos.BuscaVeiculos(
        vCodigoTemp, vCodEmpTemp, vChassiTemp) then
     begin
     	 FrmReservaVeiculosCCIA.fechar := True;
       PostMessage(FrmReservaVeiculosCCIA.Handle, WM_CLOSE, 0, 0);
       Exit;
     end;
     if not ReservaEstMotos.ObterDadosReserva then
     begin
     	 FrmReservaVeiculosCCIA.fechar := True;
       PostMessage(FrmReservaVeiculosCCIA.Handle, WM_CLOSE, 0, 0);
       Exit;
     end;

     PageControl1.ActivePage := TabSheet4;
     TabSheet4.Show;
  end;

  if (trim(ReservaEstMotos.dataSet.FieldByName('POSICAO').AsString) = 'MORTO')
   and (trim(ReservaEstMotos.dataSet.FieldByName('STATUS_TRANSDEP').AsString) = 'S')
   and (ReservaEstMotos.dataSet.FieldByName('DATA_TRANS_RET').IsNull) then
  begin
    BitBtn19.Enabled := trim(ReservaEstMotos.dataSet.FieldByName('STATUS_RES').AsString) = 'S';
    BitBtn7.Enabled := trim(ReservaEstMotos.dataSet.FieldByName('STATUS_RES').AsString) = 'S';
    BitBtn16.Enabled := (trim(ReservaEstMotos.dataSet.FieldByName('STATUS_RES').AsString) = 'S')
     and (ReservaEstMotos.dataSet.FieldByName('DATA_VENC_RES').AsDateTime > 0);
  end
  else if (trim(ReservaEstMotos.dataSet.FieldByName('POSICAO').AsString) = 'MORTO') then
  begin
    BitBtn19.Enabled := false;
    BitBtn7.Enabled := false;
    BitBtn17.Enabled := false;
    BitBtn16.Enabled := false;
  end
  else
  begin
    BitBtn19.Enabled := trim(ReservaEstMotos.dataSet.FieldByName('STATUS_RES').AsString) = 'S';
    BitBtn7.Enabled := trim(ReservaEstMotos.dataSet.FieldByName('STATUS_RES').AsString) = 'S';
    BitBtn16.Enabled := (trim(ReservaEstMotos.dataSet.FieldByName('STATUS_RES').AsString) = 'S')
     and (ReservaEstMotos.dataSet.FieldByName('DATA_VENC_RES').AsDateTime > 0);
  end;
  imgInformation.Hint :=
    'Processo "VEI100" HABILITAR CAMPO TIPO DE RESERVA' + #13 +
    'Processo "VEI129" HABILITAR CAMPO VENDEDOR' + #13 +
    'Processo "VEI146" RESERVAR VEICULO PARA MESMO VENDEDOR MAIS DE UMA VEZ' + #13 +
    'Processo "VEI152" RETIRAR RESERVA DE OUTRO VENDEDOR' + #13 +
    'Processo "VEI153" RENOVAR RESERVA DE OUTRO VENDEDOR' + #13 +
    'Processo "VEI155" TESTAR CAMPO TELEFONE AO FAZER RESERVA' + #13 +
    'Processo "VEI159" EDITAR RESERVA DE OUTRO VENDEDOR' + #13 +
    'Processo "VEI160" RENOVAR RESERVA DE VEICULO MAIS DE UMA VEZ' + #13 +
    'Processo "VEI165" HABLITAR CAMPO DATA DA ASSEMBLEIA' + #13 +
    'Processo "VEI166" TESTAR CAMPO DATA DA ASSEMBLEIA AO FAZER RESERVA' + #13 +
    'Processo "VEI167" PERMITIR RESERVA DO TIPO MONTAGEM AO FAZER PRIMEIRA RESERVA';
  Image1.Hint := imgInformation.Hint;
  SpeedButton4.Visible := False;

  if trim(vDadosIni.vEmp.vMascaraGrupoCotaRd) <> '' then
    ReservaEstMotos.dataSet.FieldByName('GRUPO_COTA_RD').EditMask := vDadosIni.vEmp.vMascaraGrupoCotaRd;

  vDataHoraBanco := vDadosIni.getDataHoraBanco(ReservaEstMotos.buscas);
  if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
    DBEdit3.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit7.CanFocus) then
    DBEdit7.SetFocus;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TFrmReservaVeiculosCCIA.pnReservaEnter(Sender: TObject);
begin
  inherited;
  DBComboBox4Exit(Sender);
end;

procedure TFrmReservaVeiculosCCIA.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  ReservaEstMotos.dataSet.Refresh;
end;

initialization
  RegisterClass(TFrmReservaVeiculosCCIA);
finalization
  UnRegisterClass(TFrmReservaVeiculosCCIA);

end.
