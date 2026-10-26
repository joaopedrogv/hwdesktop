unit URelCrystal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, UCrpe32,Mask, IniFiles,db, UCrpeClasses,registry, ExtCtrls, IBQuery,
  ComCtrls;

type
  TFrRelCrystal = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    PageControl1: TPageControl;
    tsRelatorios: TTabSheet;
    tsComentario: TTabSheet;
    ScrollBox1: TScrollBox;
    Memo1: TMemo;
    pnComentario: TPanel;
    Panel12: TPanel;
    BitBtn5: TBitBtn;
    GroupBox2: TGroupBox;
    MemoComentario2: TMemo;
    GroupBox1: TGroupBox;
    MemoComentario: TMemo;
    procedure BitBtn2Click(Sender: TObject);
    procedure pnComentarioEnter(Sender: TObject);
    procedure MemoComentarioDblClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function validasistemas(vdepart: string): boolean;
    procedure somenteNumerosKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDownComentario(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure onKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShowCrpe(Sender: TObject);
  private
    Crpe1: TCrpe;
    ClassRef: TControlClass;
    function mudaregistro: boolean;
  public
    { Public declarations }
    DValues : TStringList;
    CValues : TStringList;
  var
    vEmpresaUnificada, vSetarUnificada, vSetarCodUnificada: boolean;
    { Public declarations }
  end;

var
  FrRelCrystal: TFrRelCrystal;
  vnv: integer;
  vsubtitulo: string;

implementation

{$R *.DFM}

uses TypInfo,UCrpeUtl, uDtmAtivo, uDadosIni, ShlObj, hw_pdf_utils, hw_print_utils, hw_win_utils;

function __getSenhaFDB: PChar; stdcall; external 'cons40.dll';
function __getUsuarioFDB: PChar; stdcall; external 'cons40.dll';
function __descriptografaTextoFDB(pTexto: PChar): PChar; stdcall; external 'cons40.dll';

procedure TFrRelCrystal.FormShow(Sender: TObject);
var
  NewCtrl: TControl;
  MyName: String;
  iimp,itx,tamant,x,y,i: integer;
  vdeprel,vsenharel: string;
  cnt: integer;
  vparametro: string;
begin
  tsRelatorios.TabVisible := false;
  tsComentario.TabVisible := false;
  tsRelatorios.Show;

  {$REGION 'criando o crpe1'}
  if not Assigned(Crpe1) then
  begin
    Crpe1 := TCrpe.Create(Self);
    Crpe1.WindowState := wsMaximized;
    Crpe1.WindowButtonBar.AllowDrillDown := True;
    Crpe1.WindowButtonBar.CancelBtn      := True;
    Crpe1.WindowButtonBar.DocumentTips   := True;
    Crpe1.WindowButtonBar.GroupTree      := True;
    Crpe1.WindowButtonBar.PrintSetupBtn  := True;
    Crpe1.WindowButtonBar.SearchBtn      := True;
    Crpe1.WindowButtonBar.ExportBtn			 := True;
    Crpe1.WindowState := wsMaximized;
    Crpe1.WindowStyle.BorderStyle := bsNone;
    vDadosIni.titleTmp := Caption;
    vDadosIni.crpeTmp := Crpe1;
  end;

  if not FileExists(ExtractFilePath(Application.ExeName) + 'emailrel.bmp') then
 		vDadosIni.saveResourceToFile('emailrel', 'bmp', ExtractFilePath(Application.ExeName) + 'emailrel.bmp');
  {$ENDREGION}
  // create the control
//  bitbtn1.Enabled:=false;
//  Crpe1.selection.Formula.clear;
//  DecodeDate(vdata1,vano,vmes,vdia);
  vEmpresaUnificada := (vDadosIni.vEmp.vFinanceiroUnificado) and (vDadosIni.vEmp.vCodigoUnificadora = StrToInt(vDadosIni.codEmpresa));
  vSetarCodUnificada := True;
  vSetarUnificada := True;
  mudaregistro;
  Crpe1.ReportName :=Hint+'\'+caption+'.rpt';
//  if Crpe1.EngineOpen then
//   ShowMessage(Crpe1.ReportName);

//   ShowMessage('The Engine is Open!');
//  Crpe1.Selection.Formula.Text:='{ORDEM_SERV.STATUS_OS} = "FECHADA" and '+
//  '{ORDEM_SERV.DATA_FEC_OS} in DateTime ('+inttostr(vano)+','+strzero(vmes,2)+','+strzero(vdia,2)+',00, 00, 00) to ';
//  DecodeDate(vdata2,vano,vmes,vdia);
//  Crpe1.Selection.Formula.Text:=Crpe1.Selection.Formula.Text+'DateTime ('+inttostr(vano)+','+strzero(vmes,2)+','+strzero(vdia,2)+',00, 00, 00) ';
//  Crpe1.LogOnInfo.
{  for cnt := 1 to (Crpe1.Subreports.Count - 1) do
   memo1.Lines.Add(Crpe1.Subreports[cnt].Name);
  Crpe1.Subreports[0];}
  Crpe1.SummaryInfo.Author;
  try
  vsenharel:=crpe1.SummaryInfo.Comments.Strings[0];
  except
   messagedlg('Sem Parametros de Senha, nivel e Departamento',mtinformation,[mbOK],0);
   exit;
  end;
  try
   vnv:=strtoint(crpe1.SummaryInfo.Comments.Strings[1]);
  except
   messagedlg('Erro de conversão do nível de acesso',mtinformation,[mbOK],0);
   exit;
  end;
  vdeprel:=crpe1.SummaryInfo.Comments.Strings[2];
//  memo1.lines[2];
  memo1.Clear;
  if tag < vnv then
  begin
   messagedlg('Nivel de acesso não Permitido',mtinformation,[mbOK],0);
   bitbtn1.enabled:=false;
   bitbtn2.enabled:=false;
   exit;
  end
  else
  begin
   bitbtn1.enabled:=true;
   bitbtn2.enabled:=true;
  end;
  if not validasistemas(vdeprel) then
//  'ESTOQUE' <> vdeprel then
  begin
   messagedlg('Departamento difere do Depto permitido para o Relatório',mtinformation,[mbOK],0);
   bitbtn1.enabled:=false;
   bitbtn2.enabled:=false;
   exit;
  end
  else
  begin
   bitbtn1.enabled:=true;
   bitbtn2.enabled:=true;
  end;
//
  if Crpe1.LogOnServer.Retrieve then
  begin
   // Depois olhar nos Summary...
    for cnt := 0 to (Crpe1.LogOnServer.Count - 1) do
      Crpe1.LogOnServer[cnt].Password:=vsenharel;

//   Crpe1.LogOnServer.Password:=vsenharel;
//   'masterkey';
   x:=8;
   y:=6;
//   crpe1.ParamFields.Retrieve;
   if  (Pos('Cheques por período.rpt', Crpe1.ReportName) > 0)
    or (Pos('Conciliação Bancária.rpt', Crpe1.ReportName) > 0)
    or (Pos('Conferencia de Lancamento por referencia.rpt', Crpe1.ReportName) > 0)
    or (Pos('Contas a Pagar por dia Base.rpt', Crpe1.ReportName) > 0)
    or (Pos('Controle de Cheque por Dia Base sem grafico.rpt', Crpe1.ReportName) > 0)
    or (Pos('Controle de Cheque por Dia Base.rpt', Crpe1.ReportName) > 0)
    or (Pos('Controle de Creditos por dia base sem gráfico.rpt', Crpe1.ReportName) > 0)
    or (Pos('Controle de Creditos por dia base.rpt', Crpe1.ReportName) > 0)
    or (Pos('Creditos por periodo.rpt', Crpe1.ReportName) > 0)
    or (Pos('Entradas de creditos por periodo.rpt', Crpe1.ReportName) > 0)
    or (Pos('Entradas e Saídas Por Controle Financeiro e Data.rpt', Crpe1.ReportName) > 0)
    or (Pos('Entradas e Saídas Por Controle Financeiro.rpt', Crpe1.ReportName) > 0)
    or (Pos('Mapa de Despesas Analítico.rpt', Crpe1.ReportName) > 0)
    or (Pos('Mapa de Despesas Sintético.rpt', Crpe1.ReportName) > 0)
    or (Pos('Prestações Recebidas Após Prazo X Vencimento.rpt', Crpe1.ReportName) > 0)
    or (Pos('Relatorio controle juridico.rpt', Crpe1.ReportName) > 0)
    or (Pos('Saida de Creditos por período.rpt', Crpe1.ReportName) > 0)
    or (Pos('Recebimentos financeiro.rpt', Crpe1.ReportName) > 0)
    or (Pos('Resumo financeiro.rpt', Crpe1.ReportName) > 0) then
   begin
     if not vDadosIni.validarAcessoEmpresasUnificadas(nil) then
     begin
       vDadosIni.fechaStatusProcessamento;
       PostMessage(FrRelCrystal.Handle, WM_CLOSE, 0, 0);
       Exit;
     end;
   end;

   for i := 0 to (Crpe1.ParamFields.Count - 1) do
   begin
    if (Pos('Conciliação Bancária.rpt', Crpe1.ReportName) > 0)	and (crpe1.ParamFields[i].Name = 'data_inicio_conc_banc') then
    	// Não fazer nada
    else if  (pos('DATE',UPPERCASE(GetEnumName(TypeInfo(TCrParamFieldType),Ord(Crpe1.ParamFields[i].ParamType)))) > 0) and
    	(pos('Pm-',(Crpe1.ParamFields[i].Name)) = 0) then
    begin
      ClassRef := TLabel;
      NewCtrl := ClassRef.Create (self);
      // hide it temporarily, to avoid flickering
      NewCtrl.Visible := False;
      // set parent and position
      NewCtrl.Parent := ScrollBox1;
      NewCtrl.Left := X;
      NewCtrl.Top := Y;
      // compute the unique name (and caption)
      MyName := ClassRef.ClassName + IntToStr (i);
      Delete (MyName, 1, 1);
      NewCtrl.Name := MyName;
      // now show it
      NewCtrl.Visible := True;
      (newctrl as TLabel).Caption:=Crpe1.ParamFields[i].Prompt;
      tamant:=210;
      //
      ClassRef := TMaskedit;
      NewCtrl := ClassRef.Create (self);
      // hide it temporarily, to avoid flickering
      NewCtrl.Visible := False;
      // set parent and position
      NewCtrl.Parent := ScrollBox1;
      //self;
      NewCtrl.Left := tamant;
      NewCtrl.Top := Y;
      // compute the unique name (and caption)
      MyName := crpe1.ParamFields[i].Name;
//      ClassRef.ClassName + IntToStr (i);
//      Delete (MyName, 1, 1);
      NewCtrl.Name := MyName;
      // now show it
      NewCtrl.Visible := True;
      (newctrl as Tmaskedit).clear;
      (newctrl as Tmaskedit).editmask:='!99/99/0000;1;_';
      (newctrl as Tmaskedit).CharCase := ecUpperCase;
      (newctrl as Tmaskedit).Text := FormatDateTime('dd/mm/yyyy', Date);
      y:=y+NewCtrl.Height+10;

      if (Pos('Conciliação Bancária.rpt', Crpe1.ReportName) > 0)
        and (UpperCase(crpe1.ParamFields[i].Name) = 'DIAFINANCEIRO') then
      begin
         (newctrl as Tmaskedit).Text := FormatDateTime('dd/mm/yyyy', vDadosIni.diaFFinanceiro+1);
//         (newctrl as Tmaskedit).Enabled := false;
      end
      else if ((Pos('Recebimento Caixa Auxiliar.rpt', Crpe1.ReportName) > 0) or (Pos('Recebimentos Caixa Auxiliar.rpt', Crpe1.ReportName) > 0))
        and ((UpperCase(crpe1.ParamFields[i].Name) = 'DATAINI') or (UpperCase(crpe1.ParamFields[i].Name) = 'DATAFIM')) then
      begin
        if (UpperCase(vDadosIni.vSistema) = 'CXL') then
      	  (newctrl as Tmaskedit).Text := FormatDateTime('dd/mm/yyyy', vDadosIni.diaAbertoCxl)
        else
          (newctrl as Tmaskedit).Text := FormatDateTime('dd/mm/yyyy', vDadosIni.diaFFinanceiro+1);
//         (newctrl as Tmaskedit).Enabled := false;
      end
      else if (Pos('Pagamentos financeiro.rpt', Crpe1.ReportName) > 0)
        and ((UpperCase(crpe1.ParamFields[i].Name) = 'DATAINI') or (UpperCase(crpe1.ParamFields[i].Name) = 'DATAFIM')) then
      begin
         (newctrl as Tmaskedit).Text := FormatDateTime('dd/mm/yyyy', vDadosIni.diaFFinanceiro+1);
//         (newctrl as Tmaskedit).Enabled := false;
      end
      else if (Pos('Recebimentos financeiro.rpt', Crpe1.ReportName) > 0)
        and ((UpperCase(crpe1.ParamFields[i].Name) = 'DATAINI') or (UpperCase(crpe1.ParamFields[i].Name) = 'DATAFIM')) then
      begin
         (newctrl as Tmaskedit).Text := FormatDateTime('dd/mm/yyyy', vDadosIni.diaFFinanceiro+1);
//         (newctrl as Tmaskedit).Enabled := false;
      end
      else if (Pos('Resumo financeiro.rpt', Crpe1.ReportName) > 0)
        and ((UpperCase(crpe1.ParamFields[i].Name) = 'DATAINI') or (UpperCase(crpe1.ParamFields[i].Name) = 'DATAFIM')) then
      begin
         (newctrl as Tmaskedit).Text := FormatDateTime('dd/mm/yyyy', vDadosIni.diaFFinanceiro+1);
//         (newctrl as Tmaskedit).Enabled := false;
      end
    end
    else
    begin
//    if  pos('STRING',UPPERCASE(GetEnumName(TypeInfo(TCrParamFieldType),Ord(Crpe1.ParamFields[i].ParamType)))) > 0 then
//    begin
{       if pos('Pm-',(Crpe1.ParamFields[i].Name)) > 0 then
       else
        Crpe1.ParamFields[i].RetrieveValues;}
       if (Crpe1.ParamFields[i].Name = 'ComentarioREL') then
       begin
        MemoComentario.Clear;
//        if (Pos('Resumo financeiro.rpt', Crpe1.ReportName) > 0) then
//        begin
//          MemoComentario.Lines.Add('O relatório exibe a movimentação do financeiro no período informado, para conferência do fluxo de caixa realizável (Saldo em caixa) com movimento da empresa (Lançamentos)');
//          MemoComentario.Lines.Add('Receb: No modo analítico, em recebimentos exibe os lançamentos a vista, créditos e cheque');
//          MemoComentario.Lines.Add('Pag: No modo analítico, em pagamentos despesas exibe os lançamentos e as contas a pagar de despesa, e em pagamentos fornecedor exibir os lançamentos e as contas a pagar de origem fornecedor');
//          MemoComentario.Lines.Add('Conferência: No modo analítico, em conferência exibe todos os lançamentos no financeiro no período informado por controle para conferência com o saldo em caixa ');
//          MemoComentario.Lines.Add('Regime de Caixa: Exibir informações por regime de caixa ou competência');
//          MemoComentario.Lines.Add('Todas contas: Exibir todos as contas do plano de contas, ou apenas as contas movimentadas no período');
//          MemoComentario.Lines.Add('Agrupar Entr/Saíd Diversas: Agrupar lançamentos de entrada e saídas diversas');
//          MemoComentario.Lines.Add('Observação:');
//          MemoComentario.Lines.Add('Recebimentos: Exibe os lançamentos a vista (Controle do tipo dinheiro) e crédiarios (Créditos e Cheques), nos recebimentos a vista não são exibidos os lançamento avulsos e sem vinculo com as formas de pagamento (Lançamentos com vínculo são obtidos através das formas de pagamento do processamento retaguarda)');
//          MemoComentario.Lines.Add('Entradas e saídas diversas: Exibe os lançamentos e contas a pagar dos planos de contas configuradas como outras entradas, outras saídas, correção de saldo e etc, exibe somente as contas a pagar com lote de pagamento');
//          MemoComentario.Lines.Add('Pagamentos Despesas: Exibe os lançamentos e contas a pagar dos planos de contas configuradas como despesa (Grupo do plano de conta de despesa), são exibos os lançamento sem lote de pagamento e contas a pagar com lote de pagamento');
//          MemoComentario.Lines.Add('Pagamentos Fornecedor: Exibe os lançamentos e contas a pagar dos planos de contas configuradas como fornecedor (Tipo da conta no plano de contas definida como fornecedor), são exibos os lançamento sem lote de pagamento e contas a pagar com lote de pagamento');
//          MemoComentario.Lines.Add('Conferência: Exibe todos os lançamentos realizados no financeiro no período informado para conferência com o saldo em caixa');
//          MemoComentario.Lines.Add('Contas a receber vencidas: Exibe todos os créditos e cheques vencidos não quitados ou quitados após o período informado');
//          MemoComentario.Lines.Add('Contas a pagar vencidas: Exibe todas as contas a pagar vencidas não quitadas ou quitadas após o período informado');
//        end
//        else
//        begin
          for itx := 0 to (Crpe1.ParamFields[i].PromptValues.Count-1) do
            MemoComentario.Lines.Add(Crpe1.ParamFields[i].PromptValues.Items[itx].Text);
//        end;
        MemoComentario.SelStart := 0;
			  MemoComentario.SelLength := 0;
       end
       else if (Pos('Resumo financeiro.rpt', Crpe1.ReportName) > 0) and (Crpe1.ParamFields[i].Name = 'Regime_caixa_qsrt') then
         // Não fazer nada
       else if (Pos('Resumo financeiro.rpt', Crpe1.ReportName) > 0) and (Crpe1.ParamFields[i].Name = 'ExibirRecFin') then
         // Não fazer nada
       else if (Crpe1.ParamFields[i].Name <> 'NomeEmpresa')
       	 and (Crpe1.ParamFields[i].Name <> 'OutrosDados')
         and (pos('Pm-',(Crpe1.ParamFields[i].Name)) = 0)
         and (Crpe1.ParamFields[i].Name <> 'CodEmpresa')
         and (Pos('AgruparUnificadas', Crpe1.ParamFields[i].Name) <= 0)
         and (Crpe1.ParamFields[i].Name <> 'CodEmpUnificada') then
       begin
         ClassRef := TLabel;
         NewCtrl := ClassRef.Create (self);
         // hide it temporarily, to avoid flickering
         NewCtrl.Visible := False;
         // set parent and position
         NewCtrl.Parent := ScrollBox1;
   //      self;
         NewCtrl.Left := X;
         NewCtrl.Top := Y;
         // compute the unique name (and caption)
         MyName := ClassRef.ClassName + IntToStr (i);
         Delete (MyName, 1, 1);
         NewCtrl.Name := MyName;
         // now show it
         NewCtrl.Visible := True;
         (newctrl as TLabel).Caption:=Crpe1.ParamFields[i].Prompt;
         tamant:=210;
   //      x+(newctrl as TLabel).width+20;        //
         ClassRef := TCombobox;
         NewCtrl := ClassRef.Create (self);
         // hide it temporarily, to avoid flickering
         NewCtrl.Visible := False;
         // set parent and position
         NewCtrl.Parent := ScrollBox1;
         //self;
         NewCtrl.Left := tamant;
         NewCtrl.Top := Y;
         // compute the unique name (and caption)
         MyName := crpe1.ParamFields[i].Name;
   //      ClassRef.ClassName + IntToStr (i);
   //      Delete (MyName, 1, 1);
         NewCtrl.Name := MyName;
         NewCtrl.Width := 200;
         // now show it
 //        DValues := Crpe1.ParamFields[i].promp
         NewCtrl.Visible := True;
        if (UpperCase(vDadosIni.vSistema) = 'CXL')
       	  and ((Pos('Recebimento Caixa Auxiliar.rpt', Crpe1.ReportName) > 0) or (Pos('Recebimentos Caixa Auxiliar.rpt', Crpe1.ReportName) > 0))
       	  and (Crpe1.ParamFields[i].Name = 'opCXL') then
        begin
          (newctrl as TCombobox).Items.Add(IntToStr(vDadosIni.vCodOpCxl));
          (newctrl as TCombobox).Enabled := false;
        end
        else
        begin
          for itx := 0 to (Crpe1.ParamFields[i].PromptValues.Count-1) do
          begin
 //        (DValues.Count - 1) do
            vparametro := Crpe1.ParamFields[i].PromptValues.Items[itx].Text;
            if (Pos('_qsrt', Crpe1.ParamFields[i].Name) > 0) then
              vparametro := StringReplace(vparametro, '''', '', [rfReplaceAll]);
            (newctrl as TCombobox).Items.Add(vparametro);
            if (Pos('_qsrt', Crpe1.ParamFields[i].Name) > 0)
           	  and (Crpe1.ParamFields[i].PromptValues.Count <= 1) then
            begin
              vparametro := Crpe1.ParamFields[i].PromptValues.Items[itx].Text;
              vparametro := StringReplace(vparametro, '''', '', [rfReplaceAll]);
              if (vparametro = 'S') then
                (newctrl as TCombobox).Items.Add('N')
              else if (vparametro = 'N') then
                (newctrl as TCombobox).Items.Add('S');
            end;
  //         DValues[itx]);
        	end;
  	   end;
       (newctrl as TCombobox).ItemIndex:=0;
       (newctrl as TCombobox).CharCase := ecUpperCase;
       (newctrl as TCombobox).OnKeyDown := onKeyDown;
       if (pos('NUMBER',UPPERCASE(GetEnumName(TypeInfo(TCrParamFieldType),Ord(Crpe1.ParamFields[i].ParamType)))) > 0) then
         (newctrl as TCombobox).OnKeyPress := somenteNumerosKeyPress;
       y:=y+NewCtrl.Height+10;
  		end;
    end;
   end;
   for cnt := 0 to (Crpe1.LogOnServer.Count - 1) do
    Crpe1.LogOnServer[cnt].LogOff;
//   crpe1.LogOnServer.LogOff;
  end;

  for i := 0 to (Crpe1.ParamFields.Count - 1) do
  begin
    if (UpperCase(vDadosIni.vSistema) <> 'CXL')
    	and (Pos('AgruparUnificadas', Crpe1.ParamFields[i].Name) > 0) and (vEmpresaUnificada) then
    begin
      vSetarUnificada := False;
      ClassRef := TLabel;
      NewCtrl := ClassRef.Create (self);
      // hide it temporarily, to avoid flickering
      NewCtrl.Visible := False;
      // set parent and position
      NewCtrl.Parent := ScrollBox1;
//      self;
      NewCtrl.Left := X;
      NewCtrl.Top := Y;
      // compute the unique name (and caption)
      MyName := ClassRef.ClassName + IntToStr (i);
      Delete (MyName, 1, 1);
      NewCtrl.Name := MyName;
      // now show it
      NewCtrl.Visible := True;
      (newctrl as TLabel).Caption:=Crpe1.ParamFields[i].Prompt;
      tamant:=210;
//      x+(newctrl as TLabel).width+20;
      //
      ClassRef := TCombobox;
      NewCtrl := ClassRef.Create (self);
      // hide it temporarily, to avoid flickering
      NewCtrl.Visible := False;
      // set parent and position
      NewCtrl.Parent := ScrollBox1;
      //self;
      NewCtrl.Left := tamant;
      NewCtrl.Top := Y;
      // compute the unique name (and caption)
      MyName := crpe1.ParamFields[i].Name;
//      ClassRef.ClassName + IntToStr (i);
//      Delete (MyName, 1, 1);
      NewCtrl.Name := MyName;
      NewCtrl.Width := 200;
      // now show it
//        DValues := Crpe1.ParamFields[i].promp
      NewCtrl.Visible := True;
      for itx := 0 to (Crpe1.ParamFields[i].PromptValues.Count-1) do
      begin
//        (DValues.Count - 1) do
        vparametro := Crpe1.ParamFields[i].PromptValues.Items[itx].Text;
        if (Pos('_qsrt', Crpe1.ParamFields[i].Name) > 0) then
          vparametro := StringReplace(vparametro, '''', '', [rfReplaceAll]);
        (newctrl as TCombobox).Items.Add(vparametro);
        if (Pos('_qsrt', Crpe1.ParamFields[i].Name) > 0)
          and (Crpe1.ParamFields[i].PromptValues.Count <= 1) then
        begin
          vparametro := Crpe1.ParamFields[i].PromptValues.Items[itx].Text;
          vparametro := StringReplace(vparametro, '''', '', [rfReplaceAll]);
          if (vparametro = 'S') then
            (newctrl as TCombobox).Items.Add('N')
          else if (vparametro = 'N') then
            (newctrl as TCombobox).Items.Add('S');
         end;
//         DValues[itx]);
      end;
      (newctrl as TCombobox).ItemIndex:=0;
      (newctrl as TCombobox).CharCase := ecUpperCase;
      if (pos('NUMBER',UPPERCASE(GetEnumName(TypeInfo(TCrParamFieldType),Ord(Crpe1.ParamFields[i].ParamType)))) > 0) then
        (newctrl as TCombobox).OnKeyPress := somenteNumerosKeyPress;
      y:=y+NewCtrl.Height+10;
    end
    else if (UpperCase(vDadosIni.vSistema) <> 'CXL')
    	and (Crpe1.ParamFields[i].Name = 'CodEmpUnificada') and (vEmpresaUnificada) then
    begin
      vSetarCodUnificada := False;
      ClassRef := TLabel;
      NewCtrl := ClassRef.Create (self);
      // hide it temporarily, to avoid flickering
      NewCtrl.Visible := False;
      // set parent and position
      NewCtrl.Parent := ScrollBox1;
//      self;
      NewCtrl.Left := X;
      NewCtrl.Top := Y;
      // compute the unique name (and caption)
      MyName := ClassRef.ClassName + IntToStr (i);
      Delete (MyName, 1, 1);
      NewCtrl.Name := MyName;
      // now show it
      NewCtrl.Visible := True;
      (newctrl as TLabel).Caption:=Crpe1.ParamFields[i].Prompt;
      tamant:=210;
//      x+(newctrl as TLabel).width+20;
      //
      ClassRef := TCombobox;
      NewCtrl := ClassRef.Create (self);
      // hide it temporarily, to avoid flickering
      NewCtrl.Visible := False;
      // set parent and position
      NewCtrl.Parent := ScrollBox1;
      //self;
      NewCtrl.Left := tamant;
      NewCtrl.Top := Y;
      // compute the unique name (and caption)
      MyName := crpe1.ParamFields[i].Name;
//      ClassRef.ClassName + IntToStr (i);
//      Delete (MyName, 1, 1);
      NewCtrl.Name := MyName;
      NewCtrl.Width := 200;
      // now show it
//        DValues := Crpe1.ParamFields[i].promp
      NewCtrl.Visible := True;
      for itx := 0 to (Crpe1.ParamFields[i].PromptValues.Count-1) do
      begin
  //        (DValues.Count - 1) do
        vparametro := Crpe1.ParamFields[i].PromptValues.Items[itx].Text;
        if (Pos('_qsrt', Crpe1.ParamFields[i].Name) > 0) then
          vparametro := StringReplace(vparametro, '''', '', [rfReplaceAll]);
        (newctrl as TCombobox).Items.Add(vparametro);
  //         DValues[itx]);
      end;
      (newctrl as TCombobox).ItemIndex:=0;
      (newctrl as TCombobox).CharCase := ecUpperCase;
      if (pos('NUMBER',UPPERCASE(GetEnumName(TypeInfo(TCrParamFieldType),Ord(Crpe1.ParamFields[i].ParamType)))) > 0) then
        (newctrl as TCombobox).OnKeyPress := somenteNumerosKeyPress;
      y:=y+NewCtrl.Height+10;
      if (Pos('Resumo financeiro.rpt', Crpe1.ReportName) > 0)
        or (Pos('Conciliação Bancária.rpt', Crpe1.ReportName) > 0) then
        	(newctrl as TCombobox).Enabled := false;
    end;
  end;
  scrollbox1.Refresh;
  for iimp := 0 to ComponentCount-1 do
  begin
    if (Components[iimp] is Tmaskedit) then
    begin
      ActiveControl:=(Components[iimp] as TMaskedit);
      break;
    end;
    if (Components[iimp] is TCombobox) then
    begin
      ActiveControl:=(Components[iimp] as TCombobox);
      break;
    end;
  end;
//  crpe1.Selection.Retrieve;
  memo1.Lines.Assign(Crpe1.selection.formula);
end;

procedure TFrRelCrystal.FormShowCrpe(Sender: TObject);
begin
	try
    Screen.Cursor := crHourGlass;

		Crpe1.Execute;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrRelCrystal.MemoComentarioDblClick(Sender: TObject);
begin
  MemoComentario2.Text := MemoComentario.Text;
  vDadosIni.abreForm('Comentário', pnComentario, [ofEscapeExit, ofBISystemMenuOff, ofAlignAllClientWinCtrl]);
end;

function TFrRelCrystal.mudaregistro: boolean;
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

procedure TFrRelCrystal.onKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if (ssShift in Shift) and (Key = VK_F3) then
	begin
    try
      Screen.Cursor := crHourGlass;
      Tmaskedit(Sender).Text := vDadosIni.pesquisaRapida('PRODUTOS');
    finally
      Screen.Cursor := crDefault;
    end;
  end
	else if (ssShift in Shift) and (Key = VK_F4) then
  begin
    try
      Screen.Cursor := crHourGlass;
      Tmaskedit(Sender).Text := vDadosIni.pesquisaRapida('CLIENTES');
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if (ssShift in Shift) and (Key = VK_F6) then
  begin
    try
      Screen.Cursor := crHourGlass;
      Tmaskedit(Sender).Text := vDadosIni.pesquisaRapida('KITS_PROD');
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if (ssShift in Shift) and (Key = VK_F8) then
  begin
    try
      Screen.Cursor := crHourGlass;
      Tmaskedit(Sender).Text := vDadosIni.pesquisaRapida('CIDADES');
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if (ssShift in Shift) and (Key = VK_F9) then
  begin
    try
      Screen.Cursor := crHourGlass;
      Tmaskedit(Sender).Text := vDadosIni.pesquisaRapida('BAIRROS');
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFrRelCrystal.pnComentarioEnter(Sender: TObject);
begin
  TForm(pnComentario.Parent).OnKeyDown := FormKeyDownComentario;
end;

procedure TFrRelCrystal.somenteNumerosKeyPress(Sender: TObject; var Key: Char);
begin
 if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then
    key := #0;
end;

procedure TFrRelCrystal.FormKeyDownComentario(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  	BitBtn5Click(Sender);
end;

function TFrRelCrystal.validasistemas(vdepart: string): boolean;
begin
  result:=false;
  if vDadosIni.vSistemasUsuario.vSisAutomacao then
   if pos(vdepart,'ESTOQUE,OFICINA') > 0 then
    result:=true;
  if vDadosIni.vSistemasUsuario.vSisCaixaGeral then
   if pos(vdepart,'CAIXA') > 0 then
     result:=true;
 if vDadosIni.vSistemasUsuario.vSisCaixaAuxiliar then
   if pos(vdepart,'CAIXA,CXL') > 0 then
     result:=true;
 if vDadosIni.vSistemasUsuario.vSisVeiculos then
   if pos(vdepart,'VEICULOS') > 0 then
     result:=true;
 if vDadosIni.vSistemasUsuario.vSisGestor then
   if pos(vdepart,'GESTOR') > 0 then
     result:=true;

//  vDadosIni.vSistemasUsuario.vSisCRM := false;
//  vDadosIni.vSistemasUsuario.vSisGestor := false;
//  vDadosIni.vSistemasUsuario.vSisSupervisor := false;

end;

procedure TFrRelCrystal.BitBtn1Click(Sender: TObject);
var
 vflgerr,cnt,ic,i: integer;
 T: TComponent;
 DataBase : String;
 teste: TDateTime;
 vPw, vUs, sText: string;
 vForm: TForm;
 vPanel: TPanel;
 vSpeedButton: TSpeedButton;
begin
 try
// Crpe1.LogOnServer.Logoff;
// crpe1.ParamFields.Retrieve;
// if dtm02.QRYempresa.state = dsinactive then
//  dtm02.QRYempresa.open;
  Screen.Cursor := crHourGlass;

  vDadosIni.titleTmp := Caption;
  if tag >= vnv then
  begin
    vsubtitulo:='';
    for i := 0 to (Crpe1.ParamFields.Count - 1) do
    begin
      if crpe1.ParamFields[i].Name = 'NomeEmpresa' then
        crpe1.ParamFields[i].CurrentValue := vDadosIni.vEmp.vnomeEmpresa;// trim(emp.DataSet.FieldByName('Nome_emp').AsString);

      if crpe1.ParamFields[i].Name = 'CodEmpresa' then
        crpe1.ParamFields[i].CurrentValue := vdadosIni.codEmpresa;

      if (Pos('AgruparUnificadas', Crpe1.ParamFields[i].Name) > 0) and (vSetarUnificada) then
        if (Pos('_qsrt', Crpe1.ParamFields[i].Name) > 0) then
          crpe1.ParamFields[i].CurrentValue := QuotedStr('S')
        else
          crpe1.ParamFields[i].CurrentValue := 'S';
          
     if (Crpe1.ParamFields[i].Name = 'CodEmpUnificada') and (vSetarCodUnificada) then
        crpe1.ParamFields[i].CurrentValue := vDadosIni.codEmpresa;

     if (Pos('Conciliação Bancária.rpt', Crpe1.ReportName) > 0) and (crpe1.ParamFields[i].Name = 'data_inicio_conc_banc') then
       crpe1.ParamFields[i].CurrentValue := FormatDateTime('yyyy,mm,dd', StrToDateTime(vDadosIni.vConcBanc.vDataInicioConcBanc));

     if (Pos('Resumo financeiro.rpt', Crpe1.ReportName) > 0) and (crpe1.ParamFields[i].Name = 'Regime_caixa_qsrt') then
       crpe1.ParamFields[i].CurrentValue := QuotedStr('S');

     if (Pos('Resumo financeiro.rpt', Crpe1.ReportName) > 0) and (crpe1.ParamFields[i].Name = 'ExibirRecFin') then
       crpe1.ParamFields[i].CurrentValue := 'S';

  //     crpe1.ParamFields[i].CurrentValue := vDadosIni.IfThen(
  //     	(UpperCase(vDadosIni.vSistema) = 'CXL'), vDadosIni.codEmpresa, '0');

     if (UpperCase(vDadosIni.vSistema) = 'CXL') and
       (Crpe1.ParamFields[i].Name = 'opCXL') then
        crpe1.ParamFields[i].CurrentValue := IntToStr(vDadosIni.vCodOpCxl);
      //CrFloatingToStr(1);
     for Ic := ComponentCount - 1 downto 0 do
     begin
       T :=Components[Ic];
       if crpe1.ParamFields[i].Name = 'ComentarioREL' then
         // Não fazer nada
       else if (Pos('Conciliação Bancária.rpt', Crpe1.ReportName) > 0) and (crpe1.ParamFields[i].Name = 'data_inicio_conc_banc') then
         // Não fazer nada
       else if crpe1.ParamFields[i].Name = T.name then
       begin
         if (T is Tmaskedit) and ((T as TMaskEdit).editmask ='!99/99/0000;1;_') then
         begin
           vsubtitulo:=vsubtitulo+' '+crpe1.ParamFields[i].Prompt+': '+(T as TMaskEdit).text+' - ';
         end;
         if (T is Tcombobox) then
         begin
           vsubtitulo:=vsubtitulo+' '+crpe1.ParamFields[i].Prompt+' '+(T as Tcombobox).text+' ';
         end;
       end;
     end;
  end;
//
//
  for i := 0 to (Crpe1.ParamFields.Count - 1) do
  begin
    if crpe1.ParamFields[i].Name = 'OutrosDados' then
      crpe1.ParamFields[i].CurrentValue:=vsubtitulo;

    for Ic := ComponentCount - 1 downto 0 do
    begin
      T :=Components[Ic];
      if crpe1.ParamFields[i].Name = T.name then
      begin
        if (T is Tmaskedit) and ((T as TMaskEdit).editmask ='!99/99/0000;1;_') then
        begin
          CrStrToDateTime(copy((T as TMaskEdit).text,7,4)+','+
          copy((T as TMaskEdit).text,4,2)+','+copy((T as TMaskEdit).text,1,2)+' 00:00:00',teste);
          crpe1.ParamFields[i].CurrentValue:=CrDateTimeToStr(teste,false);
          //strtodate((T as TMaskEdit).text);
        end;
        if (T is Tcombobox) then
        begin
          if (Pos('_qsrt', Crpe1.ParamFields[i].Name) > 0) then
            crpe1.ParamFields[i].CurrentValue:=QuotedStr((T as TCombobox).text)
          else
            crpe1.ParamFields[i].CurrentValue:=(T as TCombobox).text;
        end;
      end;
    end;
  end;
//  memo1.Clear;
//  for i := 0 to (Crpe1.ParamFields.Count - 1) do
//  begin
//   memo1.Lines.Add(crpe1.ParamFields[i].CurrentValue)
// end;
//  ShowMessage('confirmar');
{  vflgerr:=0;
  for cnt := 0 to (Crpe1.LogOnServer.Count - 1) do
  begin
   if not Crpe1.LogOnServer[cnt].LogOn then
    vflgerr:=1;
  end;
  if vflgerr = 0 then
  begin
   Crpe1.Execute;
//   close;
  end;}

  vUs := string(__getUsuarioFDB);
  vPw := string(__getSenhaFDB);

  if (Trim(vPw) <> '') then
    crpe1.LogOnServer.Item.Password := string(__descriptografaTextoFDB(Pchar(vPw)))
  else
    crpe1.LogOnServer.Item.Password := 'masterkey';
  Crpe1.LogOnServer.Item.DLLName := 'pdsodbc.dll';
  if (Trim(vPw) <> '') then
    crpe1.Connect.Password := string(__descriptografaTextoFDB(Pchar(vPw)))
  else
    crpe1.Connect.Password := 'masterkey';
  crpe1.Connect.ServerName := 'Admin';
  if (Trim(vUs) <> '') then
    crpe1.Connect.UserID := string(__descriptografaTextoFDB(Pchar(vUs)))
  else
    crpe1.Connect.UserID := 'SYSDBA';
  crpe1.Connect.DatabaseName := vDadosIni.vBancoHW;
  for cnt := 0 to (Crpe1.LogOnServer.Count - 1) do
  begin
    if not crpe1.LogOnServer.Items[cnt].LogOn then
    begin
      Application.MessageBox(pchar('Erro de conexão com o banco de dados: '+crpe1.LastErrorString), 'Informação', MB_ICONERROR + MB_OK);
      exit;
    end;
  end;
  Crpe1.ExportOptions.FileType := AdobeAcrobatPDF;
//  Crpe1.Output := toExport;
//  Crpe1.ExportOptions.Destination := toApplication;
  Crpe1.ExportOptions.FileName := GetPathTemp(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp\') + vDadosIni.apenasLetras(Caption) +'.pdf';
//  Crpe1.WindowParent := Self;
//  Crpe1.WindowState := wsMinimized;

	//if CheckBox1.Checked then
  if IniConf.ReadStr('Sistema', 'TSPlus') = 'S' then
  begin
    Crpe1.Output := toExport;
    Crpe1.Export;

    vDadosIni.registraErro(PrintHelper.GetDefaultPrinter());

    sText := PdfHelper.Print(Crpe1.ExportOptions.FileName, PrintHelper.GetDefaultPrinter(), True);

    if sText = '' then
      Exit
    else
    begin
      vDadosIni.registraErro(sText);
//      ShowMessage(sText);
      if FileExists(Crpe1.ExportOptions.FileName) then
        DeleteFile(Crpe1.ExportOptions.FileName);

      Crpe1.Output := toWindow;
    end;
  end;

	try
    if not Assigned(vForm) then
    begin
      vForm := TForm.Create(Self);
      vForm.bordericons:= [bisystemmenu];
      vForm.OnResize:= vDadosIni.OnCrpeViewerResize;
      vForm.ShowHint := true;
      vForm.Caption := Caption;
      Crpe1.WindowParent := vForm;
    end;

    if not Assigned(vPanel) then
    begin
      vPanel := TPanel.Create(Self);
      vPanel.Parent := vForm;
      vPanel.Height := 19;
      vPanel.Width := 19;
      vPanel.Top := 4;
      vPanel.Left := 513;
      vPanel.TabOrder := 0;
      vPanel.BevelInner := bvNone;
      vPanel.BevelKind := bkNone;
      vPanel.BevelOuter := bvNone;
      vPanel.Name := 'vPanel';
      vPanel.Caption := '';
    end;

    if not Assigned(vSpeedButton) then
    begin
      vSpeedButton := TSpeedButton.Create(Self);
      vSpeedButton.Parent := vPanel;
      vSpeedButton.Flat := true;
      vSpeedButton.Align := alClient;
      vSpeedButton.Enabled := true;
      vSpeedButton.Visible := true;
      vSpeedButton.Name := 'vSpeedButton';
      vSpeedButton.Hint := 'Send E-mail';
      vSpeedButton.Caption := '';
    end;

    if Assigned(vSpeedButton) then
      if FileExists(ExtractFilePath(Application.ExeName) + 'emailrel.bmp') then
        vSpeedButton.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName) + 'emailrel.bmp');

    if Assigned(vSpeedButton) then
      vSpeedButton.OnClick := vDadosIni.onClickSendEmailCrystalReport;

    vDadosIni._AlterarFonteCrystalReport(crpe1);

    if Crpe1.Connect.Test then
    begin
//  	  crpe1.Show;
    	vForm.WindowState := wsMaximized;
    	vForm.BorderIcons := [biSystemMenu, biMinimize, biMaximize];
      Screen.Cursor := crDefault;
      vForm.OnShow := FormShowCrpe;
      vForm.ShowModal;
      Close;
//      crpe1.Execute;
    end;
  finally
    if Assigned(vSpeedButton) then
      FreeAndNil(vSpeedButton);
    if Assigned(vPanel) then
      FreeAndNil(vPanel);
    if Assigned(vForm) then
      FreeAndNil(vForm);
  end;

    //   if Crpe1.LogOnServer.LogOn then
    vDadosIni.hw_registra_estatistica('Crystal.' + Caption);
  end;
 finally
   Screen.Cursor := crDefault;
   vDadosIni.titleTmp := '';
 end;
end;

procedure TFrRelCrystal.BitBtn2Click(Sender: TObject);
begin
 Close;
end;

procedure TFrRelCrystal.BitBtn3Click(Sender: TObject);
begin
   Crpe1.Selection.Formula.Text:=Memo1.Lines.Text;
end;

procedure TFrRelCrystal.BitBtn5Click(Sender: TObject);
begin
  TForm(pnComentario.Parent).ModalResult := IDOK;
end;

procedure TFrRelCrystal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Assigned(Crpe1) then
    FreeAndNil(Crpe1);

 action:=cafree;
 FrRelCrystal:=NIL;
end;

procedure TFrRelCrystal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  	BitBtn2Click(Sender);
//  if (key = vk_f1) then
//    VdadosIni.MostraAjuda(TForm(Sender).Name);
end;

end.
