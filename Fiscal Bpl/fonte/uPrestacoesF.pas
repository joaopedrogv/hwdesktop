unit uPrestacoesF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, uEditMoeda,
  ComCtrls, Mask, Menus;

type
  TfrmPrestacoesF = class(TfrmPadrao)
    GroupBox2: TGroupBox;
    Panel1: TPanel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    GroupBox3: TGroupBox;
    DBGrid2: TDBGrid;
    GroupBox4: TGroupBox;
    DBGrid3: TDBGrid;
    EditMoeda1: TEditMoeda;
    Label1: TLabel;
    BitBtn4: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox5: TGroupBox;
    DBGrid4: TDBGrid;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    MainMenu1: TMainMenu;
    MenuFiscal1: TMenuItem;
    Label4: TLabel;
    MaskEdit3: TMaskEdit;
    BitBtn7: TBitBtn;
    procedure BitBtn7Click(Sender: TObject);
    procedure MenuFiscal1Click(Sender: TObject);
    procedure DBGrid4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrestacoesF: TfrmPrestacoesF;

implementation

uses
  uDtmFiscal, uPrincipalF, uDtmConfigF, uFileList, uDtmDavF, Registry,
    uDadosIniFiscal;

{$R *.dfm}

procedure TfrmPrestacoesF.BitBtn1Click(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := TabSheet1;
  GroupBox2.Visible := true;
  Label1.Visible := true;
  EditMoeda1.Visible := true;
  DBGrid2.SetFocus;
end;

procedure TfrmPrestacoesF.BitBtn2Click(Sender: TObject);
begin
  inherited;
  DBGrid1.SetFocus;
  EditMoeda1.Valor := 0;
  GroupBox2.Visible := false;
end;

procedure TfrmPrestacoesF.BitBtn3Click(Sender: TObject);
var
  vflagerr: Integer;
  vcoo,vgnf: string;
  gerencial: Boolean;
  i: Integer;
  vNaoConfOper: Integer;
  ValorPrestacao: Currency;
begin
  inherited;
  try
  Screen.Cursor := crHourGlass;
  if PageControl1.ActivePage =  TabSheet2 then
  begin
//    vflagerr := 0;
    if (obRecPrest.vPrestCxF.vPrestRet.dataSet.FieldByName('tp_rec_cxl').AsString = 'P') AND
    (obRecPrest.vPrestCxF.vPrestRet.dataSet.FieldByName('op_cxl').AsInteger > 0) then
      ValorPrestacao := vDadosIniF.StrToFloatFormat(
        obRecPrest.vPrestCxF.vPrestRet.dataSet.FieldByName('vl_rq_pg_cxl').AsFloat,2)
    else
      ValorPrestacao := vDadosIniF.StrToFloatFormat(
        obRecPrest.vPrestCxF.vPrestRet.dataSet.FieldByName('valor_c').AsFloat,2);

    if vDadosIniF.StrToFloatFormat(ValorPrestacao,2) <= 0 then
    begin
      Application.MessageBox('Recebimento não pode ser menor ou igual a zero','Atençõ',0+64);
      exit;
    end;
    if not obRecPrest.vPrestCxF.vPrestRet.iniciaRecebimento then
    begin
//      obRecPrest.vPrestCxF.vPrestRet.cancelaRecebimento;
      exit;
    end;
//    if not obRecPrest.vPrestCxF.iniciaRecebimentoDePrestacao(obRecPrest.vPrestCxF.vPrestRet.dataSet) then
//    begin
//      obRecPrest.vPrestCxF.RollBackTransacao;
//      exit;
//    end;

    if vdadosIniF.EnvCmdsCupom(2) then
    begin
      if not CImpressoraF.RecebimentoNaoFiscal(
        vDadosIniF.StrZero(obRecPrest.vTot.dataSet.FieldByName('sequencia').AsInteger, 2),
        CImpressoraF.defvalsangsup(vDadosIniF.StrToFloatFormat(ValorPrestacao,2)),
        copy(obFinalizador.dataSet.FieldByName('descricao').AsString, 1, 16)) then
        begin
          obRecPrest.vPrestCxF.vPrestRet.cancelaRecebimento;
          exit;
        end;
//        vflagerr := 1;
//      if not CImpressoraF.retorno_ImpGer(1) then
//        vflagerr := 1;
//      if vflagerr = 0 then
      begin
        Sleep(2 * 1000);

        vcoo := '      ';
        vcoo := CImpressoraF.NumeroCupom;
        vgnf := CImpressoraF.numeroGNF;
        if not obRecPrest.vPrestCxF.vPrestRet.confirmaRecebimento(
//          obRecPrest.vTot.dataSet.FieldByName('sequencia').AsInteger,
//          obFinalizador.dataSet.FieldByName('cod_finalizador').AsInteger,
          StrToInt(trim(vcoo))) then
        begin
//          obRecPrest.vPrestCxF.vPrestRet.cancelaRecebimento;
          exit;
        end;

//        if not obRecPrest.vPrestCxF.confirmaRecebimento(
//          obRecPrest.vTot.dataSet.FieldByName('sequencia').AsInteger,
//          obFinalizador.dataSet.FieldByName('cod_finalizador').AsInteger,
//          StrToInt(trim(vcoo))) then
//        begin
//          obRecPrest.vPrestCxF.RollBackTransacao;
//          exit;
//        end;
        if obRecPrest.insereRecebimento(StrToInt(trim(vgnf)),
          obFinalizador.dataSet.FieldByName('cod_finalizador').AsInteger,
          vDadosIniF.StrToFloatFormat(ValorPrestacao,2)) then
            obRecPrest.atualizaRecPrest;
      end;
      vdadosIniF.EnvCmdsCupom(10);
    end;
    obRecPrest.vPrestCxF.vPrestRet.montaSelect(obRecPrest.vPrestCxF.vPrestRet.dataSet.CommandText);
    Application.MessageBox('Recebimento não fiscal efetuado','Atençõ',0+64);
    exit;
  end;
  vflagerr := 0;
  if vdadosIniF.EnvCmdsCupom(2) then
  begin
    if vDadosIniF.StrToFloatFormat(EditMoeda1.Valor,2) <= 0 then
    begin
      Application.MessageBox('Recebimento não pode ser menor ou igual a zero','Atençõ',0+64);
      exit;
    end;
    if not CImpressoraF.RecebimentoNaoFiscal(
      vDadosIniF.StrZero(obRecPrest.vTot.dataSet.FieldByName('sequencia').AsInteger, 2),
      CImpressoraF.defvalsangsup(EditMoeda1.Valor),
      copy(obFinalizador.dataSet.FieldByName('descricao').AsString, 1, 16)) then
      exit;
//    if not CImpressoraF.retorno_ImpGer(1) then
//      vflagerr := 1;
//    if vflagerr = 0 then
    begin
      Sleep(2 * 1000);
      vcoo := '      ';
      vcoo := CImpressoraF.NumeroCupom;
      vgnf := CImpressoraF.numeroGNF;
      if obRecPrest.insereRecebimento(StrToInt(trim(vgnf)),
      obFinalizador.dataSet.FieldByName('cod_finalizador').AsInteger,EditMoeda1.Valor) then
        obRecPrest.atualizaRecPrest;
//      CImpressoraF.retorno_ImpGer(1);

      //TEF
//        if vDadosIniF.vUsaTef = 'S' then
//        begin
//          if (obFinalizador.dataSet.FieldByName('tipo_finalizador').AsInteger >= 1) then
//            if not obTef.venda(obFinalizador.dataSet.FieldByName('tipo_finalizador').AsInteger,
//              StrToInt(trim(vcoo)), 0, trim(obFinalizador.dataSet.FieldByName('verificar_credito').AsString),
//              CImpressoraF.defAtribTef, EditMoeda1.Valor) then
//            begin
//              if obTef.vmens = '1' then
//                obTef.cancelaBKP;
//              exit;
//            end;
//        end;
//
//        if (obFinalizador.dataSet.FieldByName('tipo_finalizador').AsInteger >= 1) and
//            (vDadosIniF.vUsaTef = 'S') then
//          begin
//            Application.CreateForm(TfrmFileList, frmFileList);
//            Application.CreateForm(tfrmFileList, frmFileList);
//            frmFileList.FileListBox1.Mask := '*.Imp';
//            frmFileList.FileListBox1.Directory := 'C:\KoneKTEF\';
//            frmFileList.FileListBox1.Refresh;
//            gerencial := false;
//            i := 0;
//            vNaoConfOper := 0;
//            while i <= frmFileList.FileListBox1.Items.Count - 1 do
//            begin
//              obTef.setContadorImpressao(i + 1);
//              try
//                vDadosIniF.MensagemFiscal('Aguarde! Imprimindo...');
//                if not obTef.gerenciamentoImpressaoTEF(CImpressoraF, gerencial, 'C:\KoneKTEF\' +
//                  frmFileList.FileListBox1.Items.Strings[i]) then
//                begin
//                  obTef.cancelaOperacoesAnteriores(CImpressoraF);
//                  vNaoConfOper := 1;
//                  Break;
//                end;
//              finally
//                vDadosIniF.limpaMensagem;
//              end;
//              if obTef.voltarParaPrimeiroArquivo then
//              begin
//                I := -1;
//                gerencial := true;
//              end;
//              inc(i);
//            end;
//            if vNaoConfOper = 0 then
//              obTef.finalizaOperacao(CImpressoraF);
//          end;
      //TEF
    end;
//    else
//    begin
//      vgnf := CImpressoraF.numeroGNF;
//      if obRecPrest.insereRecebimento(StrToInt(trim(vgnf)),
//      obFinalizador.dataSet.FieldByName('cod_finalizador').AsInteger,EditMoeda1.Valor) then
//        obRecPrest.atualizaRecPrest;
//    end;
    vdadosIniF.EnvCmdsCupom(10);
  end;
  BitBtn2Click(sender);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrestacoesF.BitBtn4Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmPrestacoesF.BitBtn5Click(Sender: TObject);
begin
  inherited;
  obRecPrest.vPrestCxF.vPrestRet.abrePrestacoes(StrToDate(MaskEdit1.Text),StrToDate(MaskEdit2.Text));
end;

procedure TfrmPrestacoesF.BitBtn6Click(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := TabSheet2;
  GroupBox2.Visible := true;
  Label1.Visible := False;
  EditMoeda1.Visible := False;
  DBGrid4.SetFocus;
end;

procedure TfrmPrestacoesF.BitBtn7Click(Sender: TObject);
begin
  inherited;
  obRecPrest.vPrestCxF.vPrestRet.abrePrestacoes(StrToDate(MaskEdit3.Text));
end;

procedure TfrmPrestacoesF.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_RETURN) or (key = VK_TAB) then
    DBGrid3.setfocus
  else if key = VK_ESCAPE then
    BitBtn2Click(Sender);
end;

procedure TfrmPrestacoesF.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_RETURN) or (key = VK_TAB) then
    Perform(WM_NEXTDLGCTL,0,0)
  else if key = VK_ESCAPE then
    BitBtn2Click(Sender);
end;

procedure TfrmPrestacoesF.DBGrid4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_TAB then
    Perform(WM_NEXTDLGCTL,0,0)
  else if key = VK_RETURN then
    DBGrid2.SetFocus;
end;

procedure TfrmPrestacoesF.FormClose(Sender: TObject; var Action: TCloseAction);
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
begin
  inherited;
  try
    Registro := TRegistry.Create;
    try
      Registro.OpenKey(Conf + Self.ClassName, True);
      Registro.WriteString(MaskEdit1.Name, MaskEdit1.Text);
      Registro.WriteString(MaskEdit2.Name, MaskEdit2.Text);
      Registro.WriteString(MaskEdit3.Name, MaskEdit3.Text);
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
  Action := caFree;
  frmPrestacoesF := nil;
end;

procedure TfrmPrestacoesF.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if vDadosIniF.vUsaTecladoPDV = 'S' then
  begin
    if key = VK_ESCAPE then
      Close;
  end
  else
  begin
  if (Key = VK_F2) and (GroupBox2.Visible) then
    BitBtn3Click(Sender)
  else if key = VK_F3 then
    BitBtn2Click(sender)
  else if (key = vk_f4) {and (not GroupBox2.Visible)} then
    BitBtn1Click(Sender)
  else if key = VK_F5 then
  begin
    if PageControl1.ActivePage = TabSheet1 then
      DBGrid1.SetFocus
    else if PageControl1.ActivePage = TabSheet2 then
      DBGrid4.SetFocus;
  end
  else if (Key = VK_F6) and (GroupBox2.Visible) then
    DBGrid2.SetFocus
  else if (Key = VK_F7) and (GroupBox2.Visible) then
    DBGrid3.SetFocus
  else if key = VK_ESCAPE then
    BitBtn4Click(sender)
  else if key = VK_F8 then
    BitBtn6Click(Sender);
end;
end;

procedure TfrmPrestacoesF.FormShow(Sender: TObject);
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
begin
  inherited;
  try
    Registro := TRegistry.Create;
    try
      Registro.OpenKey(Conf + Self.ClassName, True);
      MaskEdit1.Text := Registro.ReadString(MaskEdit1.Name);
      MaskEdit2.Text := Registro.ReadString(MaskEdit2.Name);
      MaskEdit3.Text := Registro.ReadString(MaskEdit3.Name);
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
  TabSheet1.TabVisible := false;
  TabSheet2.TabVisible := false;
  BitBtn6.Enabled := (vDadosIniF.bancoConectado <> 'local');
  //obRecPrest.iniciaRecebimento;
  obRecPrest.vTot.getTodos;
  obRecPrest.abreRecebimento(Date,Date);
  try
    if vDadosIniF.bancoConectado <> 'local' then
      obRecPrest.vPrestCxF.vPrestRet.abrePrestacoes(StrToDate(MaskEdit1.Text),StrToDate(MaskEdit2.Text));
  except
    obRecPrest.vPrestCxF.vPrestRet.abrePrestacoes(0,0);
  end;
//  MaskEdit1.Text := DateToStr(date);
//  MaskEdit2.Text := DateToStr(date);
  obFinalizador.getTodos;
  if vDadosIniF.vUsaTecladoPDV = 'S' then
  begin
    GroupBox1.Caption :='Relação de Prestações';
    GroupBox3.Caption :='Totalizador da Impressora';
    GroupBox4.Caption :='Finalizador';
    BitBtn3.Caption :='Imprimir';
    BitBtn2.Caption :='Cancelar';
    BitBtn1.Caption :='Recebimento';
    BitBtn1.SetFocus;
  end;
end;

procedure TfrmPrestacoesF.MenuFiscal1Click(Sender: TObject);
begin
  inherited;
  vDadosIniF.MenuFiscal;
end;

end.

