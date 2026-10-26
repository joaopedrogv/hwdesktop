unit uValeResgateTroca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, uEditHw, Grids, DBGrids, ComCtrls, ExtCtrls, 
  UClassesClientes, Menus;

type
  TfrmValeResgateTroca = class(TForm)
    Panel62: TPanel;
    Label353: TLabel;
    Label354: TLabel;
    Label356: TLabel;
    PageControl7: TPageControl;
    tsOpcaoValeCompra: TTabSheet;
    DBGridValeCompraProgFid: TDBGrid;
    pnInfValorVale: TPanel;
    Label358: TLabel;
    Label355: TLabel;
    lbValorVale: TLabel;
    EditHwPontosVale: TEditHw;
    EditHwValorVale: TEditHw;
    Panel63: TPanel;
    lbInfVale: TLabel;
    tsOpcaoValeTroca: TTabSheet;
    Panel64: TPanel;
    Label360: TLabel;
    Panel65: TPanel;
    Label361: TLabel;
    ComboBoxFiltro: TComboBox;
    EditFiltro: TEdit;
    GroupBox59: TGroupBox;
    DBGridTempValeTroca: TDBGrid;
    Panel67: TPanel;
    LabelPontosValeTroca: TLabel;
    LabelValorValeTroca: TLabel;
    BitBtn106: TBitBtn;
    DBGrid19: TDBGrid;
    Panel66: TPanel;
    BitBtn107: TBitBtn;
    Panel61: TPanel;
    BitBtn62: TBitBtn;
    BitBtn63: TBitBtn;
    PopupMenu5: TPopupMenu;
    EditarQtdeValeTroca: TMenuItem;
    SpeedButton1: TSpeedButton;
    GroupBoxDoc: TGroupBox;
    Label1: TLabel;
    lbNumDoc: TLabel;
    Label3: TLabel;
    lbTipoDoc: TLabel;
    Label2: TLabel;
    lbValorDoc: TLabel;
    Label349: TLabel;
    Label350: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGridTempValeTrocaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBGridTempValeTrocaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridTempValeTrocaDblClick(Sender: TObject);
    procedure DBGrid19KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid19DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid19DblClick(Sender: TObject);
    procedure BitBtn63Click(Sender: TObject);
    procedure EditFiltroChange(Sender: TObject);
    procedure BitBtn106Click(Sender: TObject);
    procedure BitBtn107Click(Sender: TObject);
    procedure EditarQtdeValeTrocaClick(Sender: TObject);
    procedure BitBtn62Click(Sender: TObject);
    procedure DBGridValeCompraProgFidKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditHwValorValeExit(Sender: TObject);
    procedure EditHwPontosValeExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vReq: Integer;
    vTiporeq: string;
    vValorReq: Double;
  end;

var
  frmValeResgateTroca: TfrmValeResgateTroca;
  vRegrasValeCompraProgFid: TRegrasValeCompraProgFid;
  vRegrasValeTrocaProgFid: TRegrasValeTrocaProgFid;
  vCodCliente: Integer;
  vCPFCGC: string;
  vSaldoCC, vValorCC, vPontosTroca: Double;
  vDadosNummus: string;
  vSaldoCashbackClienteNummus, vSaldoAcumuladoClienteNummus: Double;
  
implementation

uses uDataSet_OOP, uDadosIni, uDtmAtivo, DBClient, DB, config_sistema_class;

{$R *.dfm}

function nummus_consultar_saldo_cliente(
	banco: WideString;
  DadosNummus: WideString;
  CodCliente: Integer;
  CodEmpresa: Integer): Double; stdcall; external 'hw.utils.dx.dll';

function nummus_simular_resgate_cliente(
	banco: WideString;
  DadosNummus: WideString;
  CodCliente: Integer;
  CodEmpresa: Integer;
  ValorCompra: Double): Double; stdcall; external 'hw.utils.dx.dll';

procedure TfrmValeResgateTroca.BitBtn106Click(Sender: TObject);
begin
 if not vRegrasValeTrocaProgFid.excluirMercadoriasTroca(vCodCliente, LabelPontosValeTroca, LabelValorValeTroca) then
   exit;
end;

procedure TfrmValeResgateTroca.BitBtn107Click(Sender: TObject);
begin
  if not vRegrasValeTrocaProgFid.incluirMercadoriasTroca(vCodCliente, LabelPontosValeTroca, LabelValorValeTroca) then
    exit;
end;

procedure TfrmValeResgateTroca.BitBtn62Click(Sender: TObject);
var
  vEstoqueDisponivel: Double;
  Config: TConfig_sistema_class;
  vValorMinValeCashback: Double;
  vValorMaxValeCashback: Double;
  vPercValeCashback: Double;
begin
  try
    // Atualizar saldo conta corrente
    if (Self.Enabled) and (Self.Visible) and (BitBtn62.CanFocus) then
    	BitBtn62.SetFocus;
    vDadosIni.verSaldoCC(vCodCliente, vCPFCGC, vRegrasValeCompraProgFid.buscas, vSaldoCC, vValorCC);
    if frmValeResgateTroca.Tag = 99 then
	    vSaldoCC := vDadosIni.vTempValorValesTroca;

    if vDadosIni.vProgFid.vHabilitarProgFid then
    	Label354.Caption := FormatFloat('#,##0', vSaldoCC);

    vDadosIni.vTempPontosResgateTroca := 0;
    vDadosIni.vTempValorResgateTroca := 0;

    if PageControl7.ActivePage = tsOpcaoValeCompra then
    begin
      // Vale Compra
      if vRegrasValeCompraProgFid.dataSet.IsEmpty then
      begin
      	if (vDadosIni.vProgFid.vHabilitarProgFid) and (EditHwPontosVale.AsValue <= 0) then
        begin
          Application.MessageBox(PChar('Pontos não foi informado!'), 'Atenção', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
           if (Self.Enabled) and (Self.Visible) and (EditHwPontosVale.CanFocus) then
             EditHwPontosVale.SetFocus;
           exit;
        end;
        if EditHwValorVale.AsValue <= 0 then
        begin
          Application.MessageBox(PChar('Valor não foi informado!'), 'Atenção', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
           if (Self.Enabled) and (Self.Visible) and (EditHwValorVale.CanFocus) then
             EditHwValorVale.SetFocus;
           exit;
        end;

        vDadosIni.vTempPontosResgateTroca := EditHwPontosVale.AsValue;
        vDadosIni.vTempValorResgateTroca  := EditHwValorVale.AsValue;
      end
      else
      begin
        if vRegrasValeCompraProgFid.dataSet.FieldByName('PONTOS').AsFloat > vSaldoCC then
        begin
          Application.MessageBox(PChar('Saldo disponível é menor que o valor de pontos selecionado: ' + #13 + #13 +
            'Saldo disponível (Pontos): ' + FormatFloat('#,##0', vSaldoCC) + #13 +
            'Valor selecionado..............: ' + FormatFloat('#,##0', vRegrasValeCompraProgFid.dataSet.FieldByName('PONTOS').AsFloat)),
            'Atenção', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
          exit;
        end;
        vDadosIni.vTempPontosResgateTroca := vRegrasValeCompraProgFid.dataSet.FieldByName('PONTOS').AsFloat;
        vDadosIni.vTempValorResgateTroca := vRegrasValeCompraProgFid.dataSet.FieldByName('VALOR').AsFloat;
      end;
    end
    else
    begin
       if vRegrasValeTrocaProgFid.fTempDtValeTroca.DataSet.IsEmpty then
       begin
         Application.MessageBox(PChar('Nenhuma mercadoria adicionada!'), 'Atenção', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
         exit;
       end;
       if vDadosIni.vTempPontosResgateTroca > vSaldoCC then
       begin
         Application.MessageBox(PChar('Saldo disponível é menor que o valor dos pontos do vale troca: ' + #13 + #13 +
           'Saldo disponível (Pontos): ' + FormatFloat('#,##0', vSaldoCC) + #13 +
           'Pontos das mercadorias...: ' + FormatFloat('#,##0', vDadosIni.vTempPontosResgateTroca)),
           'Atenção', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
         exit;
       end;

        vRegrasValeTrocaProgFid.fTempValeTroca.First;
        while not vRegrasValeTrocaProgFid.fTempValeTroca.Eof do
        begin
          vEstoqueDisponivel := vDadosIni.getEstoqueDisponivel(vRegrasValeTrocaProgFid.buscas,
            vRegrasValeTrocaProgFid.fTempValeTroca.FieldByName('grupo_prod').AsInteger,
            vRegrasValeTrocaProgFid.fTempValeTroca.FieldByName('cod_prod').AsString,
            vRegrasValeTrocaProgFid.fTempValeTroca.FieldByName('cod_grade').AsInteger);

          if (vRegrasValeTrocaProgFid.fTempValeTroca.FieldByName('qtde').AsFloat > vEstoqueDisponivel) then
          begin
            if vDadosIni.vEstoqueNegativo = 'S' then
              Application.MessageBox(Pchar('Produto ' + QuotedStr(trim(vRegrasValeTrocaProgFid.fTempValeTroca.FieldByName('num_fab_prod').AsString)) +
                  ' está com quantidade requisitada maior que a do estoque.'), 'Atenção',
                  vDadosIni.IfThen(vDadosIni.vEstoqueNegativo = 'S', MB_OK + MB_ICONINFORMATION, MB_ICONERROR + MB_OK))
            else
              Application.MessageBox(Pchar('Produto ' + QuotedStr(trim(vRegrasValeTrocaProgFid.fTempValeTroca.FieldByName('num_fab_prod').AsString)) +
                  ' está com quantidade requisitada maior que a do estoque.'), 'Erro',
                  vDadosIni.IfThen(vDadosIni.vEstoqueNegativo = 'S', MB_OK + MB_ICONINFORMATION, MB_ICONERROR + MB_OK));
            if vDadosIni.vEstoqueNegativo <> 'S' then
              exit;
          end;

          vDadosIni.vTempPontosResgateTroca := vDadosIni.vTempPontosResgateTroca +
          		vRegrasValeTrocaProgFid.fTempValeTroca.FieldByName('tot_pontos').AsFloat;
          vDadosIni.vTempValorResgateTroca := vDadosIni.vTempValorResgateTroca +
          		vRegrasValeTrocaProgFid.fTempValeTroca.FieldByName('valor_tot').AsFloat;

          vRegrasValeTrocaProgFid.fTempValeTroca.Next;
        end;
    end;

    // Atualizar saldo conta corrente
    if vDadosIni.vProgFid.vHabilitarProgFid then
    	vDadosIni.verSaldoCC(vCodCliente, vCPFCGC, vRegrasValeCompraProgFid.buscas, vSaldoCC, vValorCC)
    else if vDadosIni.vCashback.vHabilitarCashback then
    begin
      vDadosNummus := vDadosIni.retornaDadosNummus(vRegrasValeCompraProgFid.buscas);

      if trim(vDadosNummus) = '' then
        vSaldoCashbackClienteNummus := 0
      else
        vSaldoCashbackClienteNummus :=
          nummus_simular_resgate_cliente(
            PChar(vDadosIni.vBancoHW),
            PChar(vDadosIni.getCampoPipe(trim(vDadosNummus), 1) + '|' +
              vDadosIni.getCampoPipe(trim(vDadosNummus), 2) + '|' +
              vDadosIni.getCampoPipe(trim(vDadosNummus), 3) + '|'),
            vCodCliente,
            vDadosIni.cod_empresa,
            vValorReq);
    end;

    if vDadosIni.vProgFid.vHabilitarProgFid then
    begin
      if frmValeResgateTroca.Tag = 99 then
        vSaldoCC := vDadosIni.vTempValorValesTroca;
      if vDadosIni.vTempPontosResgateTroca > vSaldoCC then
      begin
        if frmValeResgateTroca.Tag = 99 then
          Application.MessageBox(PChar(
            'Valor informado maior que o valor dos vales selecionados: ' + #13 + #13 +
            'Saldo disponível (Pontos): ' + FormatFloat('#,##0', vSaldoCC) + #13 +
            'Valor informado (Pontos): ' + FormatFloat('#,##0', vDadosIni.vTempPontosResgateTroca)), 'Atenção', MB_ICONERROR + MB_OK)
        else
          Application.MessageBox(PChar(
            'Cliente sem saldo disponível:' + #13 + #13 +
            'Saldo disponível (Pontos): ' + FormatFloat('#,##0', vSaldoCC) + #13 +
            'Valor informado (Pontos): ' + FormatFloat('#,##0', vDadosIni.vTempPontosResgateTroca)), 'Atenção', MB_ICONERROR + MB_OK);
        exit;
      end;
    end
    else if vDadosIni.vCashback.vHabilitarCashback then
    begin
    	if vDadosIni.vTempValorResgateTroca > vSaldoCashbackClienteNummus then
      begin
        Application.MessageBox(PChar(
          'Cliente sem saldo disponível:' + #13 + #13 +
          'Saldo disponível (R$): ' + FormatFloat('#,##0.00', vSaldoCashbackClienteNummus) + #13 +
          'Valor informado (R$): ' + FormatFloat('#,##0.00', vDadosIni.vTempValorResgateTroca)), 'Atenção', MB_ICONERROR + MB_OK);
        exit;
      end;

      if vDadosIni.vTempValorResgateTroca > vValorReq then
      begin
        Application.MessageBox(PChar(
          'Cliente sem saldo disponível:' + #13 + #13 +
          'Valor venda (R$): ' + FormatFloat('#,##0.00', vValorReq) + #13 +
          'Valor informado (R$): ' + FormatFloat('#,##0.00', vDadosIni.vTempValorResgateTroca)), 'Atenção', MB_ICONERROR + MB_OK);
        exit;
      end;
    end;

    if vDadosIni.vProgFid.vHabilitarProgFid then
    begin
      if vDadosIni.vProgFid.vValorMinPontosValeProgFid > 0 then
        if vDadosIni.vProgFid.vValorMinPontosValeProgFid > vDadosIni.vTempPontosResgateTroca then
        begin
          Application.MessageBox(pchar('Valor informado está abaixo do permitido: ' + #13 + #13 +
            'Valor mínimo (Pontos).....: ' + FormatFloat('#,##0', vDadosIni.vProgFid.vValorMinPontosValeProgFid) + #13 +
            'Valor informado (Pontos): ' + FormatFloat('#,##0', vDadosIni.vTempPontosResgateTroca)), 'Atenção', MB_ICONERROR + MB_OK);
          exit;
        end;
    end
    else if vDadosIni.vCashback.vHabilitarCashback then
    begin
      try
        Config := TConfig_sistema_class.getConf('cashback_conf_vales', vRegrasValeCompraProgFid.buscas, vDadosIni.cod_empresa);

        if trim(Config.ReadString('Conf', 'RegraVale')) = 'RegrasValeMinimoMaximo' then
        begin
        	try
            if StrToFloat(Config.ReadString('RegrasValeMinimoMaximo', 'ValorMin')) > 0 then
              vValorMinValeCashback := StrToFloat(Config.ReadString('RegrasValeMinimoMaximo', 'ValorMin'))
            else
              vValorMinValeCashback := 0;
          except
            vValorMinValeCashback := 0;
          end;

          try
          	if StrToFloat(Config.ReadString('RegrasValeMinimoMaximo', 'ValorMax')) > 0 then
              vValorMaxValeCashback := StrToFloat(Config.ReadString('RegrasValeMinimoMaximo', 'ValorMax'))
            else
              vValorMaxValeCashback := 0;
          except
            vValorMaxValeCashback := 0;
          end;

          if vValorMinValeCashback > 0 then
            if vDadosIni.StrToFloatFormat(vValorMinValeCashback, 2) > vDadosIni.StrToFloatFormat(vDadosIni.vTempValorResgateTroca, 2) then
            begin
              Application.MessageBox(pchar('Valor informado está abaixo do permitido: ' + #13 + #13 +
                'Valor mínimo (R$)....: ' + FormatFloat('#,##0.00', vDadosIni.StrToFloatFormat(vValorMinValeCashback, 2)) + #13 +
                'Valor informado (R$): ' + FormatFloat('#,##0.00', vDadosIni.StrToFloatFormat(vDadosIni.vTempValorResgateTroca, 2))), 'Atenção', MB_ICONERROR + MB_OK);
              exit;
            end;

          if vValorMaxValeCashback > 0 then
            if vDadosIni.StrToFloatFormat(vDadosIni.vTempValorResgateTroca, 2) > vDadosIni.StrToFloatFormat(vValorMaxValeCashback, 2) then
            begin
              Application.MessageBox(pchar('Valor informado está acima do permitido: ' + #13 + #13 +
                'Valor máximo (R$)...: ' + FormatFloat('#,##0.00', vDadosIni.StrToFloatFormat(vValorMaxValeCashback, 2)) + #13 +
                'Valor informado (R$): ' + FormatFloat('#,##0.00', vDadosIni.StrToFloatFormat(vDadosIni.vTempValorResgateTroca, 2))), 'Atenção', MB_ICONERROR + MB_OK);
              exit;
            end;
        end
        else if trim(Config.ReadString('Conf', 'RegraVale')) = 'RegrasValePercentual' then
        begin
        	try
          	if StrToFloat(Config.ReadString('RegrasValePercentual', 'Perc')) > 100 then
            	vPercValeCashback := 100
            else if StrToFloat(Config.ReadString('RegrasValePercentual', 'Perc')) > 0 then
              vPercValeCashback := StrToFloat(Config.ReadString('RegrasValePercentual', 'Perc'))
            else
              vPercValeCashback := 0;
          except
            vPercValeCashback := 100;
          end;

          if vPercValeCashback > 0 then
          	if vDadosIni.StrToFloatFormat(((vDadosIni.vTempValorResgateTroca / vValorReq) * 100), 2) > vDadosIni.StrToFloatFormat(vPercValeCashback, 2) then
            begin
              Application.MessageBox(pchar('Valor informado está acima do permitido: ' + #13 + #13 +
                'Percentual permitido (%).: ' + FormatFloat('#,##0.00', vDadosIni.StrToFloatFormat(vPercValeCashback, 2)) + #13 +
                'Percentual informado (%): ' + FormatFloat('#,##0.00', vDadosIni.StrToFloatFormat(((vDadosIni.vTempValorResgateTroca / vValorReq) * 100), 2))), 'Atenção', MB_ICONERROR + MB_OK);
              exit;
            end;
        end
        else
        begin
          try
            if StrToFloat(Config.ReadString('RegrasValeIlimitado', 'ValorMin')) > 0 then
              vValorMinValeCashback := StrToFloat(Config.ReadString('RegrasValeIlimitado', 'ValorMin'))
            else
              vValorMinValeCashback := 0;
          except
            vValorMinValeCashback := 0;
          end;

          if vValorMinValeCashback > 0 then
            if vDadosIni.StrToFloatFormat(vValorMinValeCashback, 2) > vDadosIni.StrToFloatFormat(vDadosIni.vTempValorResgateTroca, 2) then
            begin
              Application.MessageBox(pchar('Valor informado está abaixo do permitido: ' + #13 + #13 +
                'Valor mínimo (R$).....: ' + FormatFloat('#,##0.00', vDadosIni.StrToFloatFormat(vValorMinValeCashback, 2)) + #13 +
                'Valor informado (R$): ' + FormatFloat('#,##0.00', vDadosIni.StrToFloatFormat(vDadosIni.vTempValorResgateTroca, 2))), 'Atenção', MB_ICONERROR + MB_OK);
              exit;
            end;
        end;
      finally
        if Assigned(Config) then
          FreeAndNil(Config);
      end;
    end;

    vDadosIni.vPesquisa := 'PROGFID|' +
      vDadosIni.IfThen(PageControl7.ActivePage = tsOpcaoValeCompra, 'RESGATE', 'TROCA') + '|';
    ModalResult:= IDOK;
  finally
    vDadosIni._GravaConfiguracoesInteger('frmValeResgateTroca.PageControl7.TabIndex', PageControl7.TabIndex);
    vDadosIni._GravaConfiguracoesInteger('frmValeResgateTroca.ComboBoxFiltro.ItemIndex', ComboBoxFiltro.ItemIndex);
  end;
end;

procedure TfrmValeResgateTroca.BitBtn63Click(Sender: TObject);
begin
  vDadosIni.vPesquisa := '';
  vDadosIni._GravaConfiguracoesInteger('frmValeResgateTroca.PageControl7.TabIndex', PageControl7.TabIndex);
  vDadosIni._GravaConfiguracoesInteger('frmValeResgateTroca.ComboBoxFiltro.ItemIndex', ComboBoxFiltro.ItemIndex);
  ModalResult:= IDCLOSE;
end;

procedure TfrmValeResgateTroca.DBGrid19DblClick(Sender: TObject);
begin
  vRegrasValeTrocaProgFid.checkUnCheckRow('SEL');
end;

procedure TfrmValeResgateTroca.DBGrid19DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if TDBGrid(Sender).DataSource.dataSet.FieldByName('SEL').AsString = 'S' then
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := clHighlight;
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    DBGrid19.Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); //Diminue o tamanho do CheckBox
    DrawFrameControl(DBGrid19.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmValeResgateTroca.DBGrid19KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((Key = VK_RETURN) or (Key = VK_TAB)) then
    Perform(WM_NEXTDLGCTL, 0, 0)
  else if Key = VK_SPACE then
    vRegrasValeTrocaProgFid.checkUnCheckRow('SEL');
end;

procedure TfrmValeResgateTroca.DBGridTempValeTrocaDblClick(Sender: TObject);
begin
 vRegrasValeTrocaProgFid.marcarDesmarcaLinha(vRegrasValeTrocaProgFid.fTempValeTroca);
end;

procedure TfrmValeResgateTroca.DBGridTempValeTrocaDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if TDBGrid(Sender).DataSource.dataSet.FieldByName('SEL').AsString = 'S' then
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := clHighlight;
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    DBGridTempValeTroca.Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); //Diminue o tamanho do CheckBox
    DrawFrameControl(DBGridTempValeTroca.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmValeResgateTroca.DBGridTempValeTrocaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    Perform(WM_NEXTDLGCTL, 0, 0)
  else if Key = VK_RETURN then
    BitBtn62Click(Sender)
  else if Key = VK_SPACE then
    vRegrasValeTrocaProgFid.marcarDesmarcaLinha(vRegrasValeTrocaProgFid.fTempValeTroca);
end;

procedure TfrmValeResgateTroca.DBGridValeCompraProgFidKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (Key = VK_TAB) then
   Perform(WM_NEXTDLGCTL, 0, 0)
 else if Key = VK_RETURN then
   BitBtn62Click(Sender);
end;

procedure TfrmValeResgateTroca.EditarQtdeValeTrocaClick(Sender: TObject);
begin
  if not vRegrasValeTrocaProgFid.editarQtdeMercadoriasTroca(vCodCliente, LabelPontosValeTroca, LabelValorValeTroca) then
   exit;
end;

procedure TfrmValeResgateTroca.EditFiltroChange(Sender: TObject);
begin
  if (trim(EditFiltro.Text) <> '') then
  begin
    vRegrasValeTrocaProgFid.IndexFieldNames :=
      vDadosIni.IfThen(ComboBoxFiltro.ItemIndex = 0, 'NUM_FAB_PROD', 'DESCR_PROD');
    vRegrasValeTrocaProgFid.FindNearest([trim(EditFiltro.Text)]);
  end
  else
  begin
    vRegrasValeTrocaProgFid.IndexFieldNames := 'CODIGO';
    vRegrasValeTrocaProgFid.FindNearest([1]);
  end;
end;

procedure TfrmValeResgateTroca.EditHwPontosValeExit(Sender: TObject);
begin
	if not EditHwPontosVale.Visible then
    Exit;

  if not vDadosIni.vProgFid.vHabilitarProgFid then
    Exit;

  // Buscas dados taxa conversão
  vDadosIni.buscasdadostaxaConv(vRegrasValeCompraProgFid.buscas);
  EditHwValorVale.AsValue :=
  	 (EditHwPontosVale.AsValue * vRegrasValeCompraProgFid.buscas.FieldByName('PERC_PROG_FID').AsFloat);
  lbValorVale.Caption := 'R$ ' + FormatFloat('#,##0.00',
    (EditHwPontosVale.AsValue * vRegrasValeCompraProgFid.buscas.FieldByName('PERC_PROG_FID').AsFloat));

  if EditHwValorVale.AsValue > 0 then
    if (Self.Enabled) and (Self.Visible) and (BitBtn62.CanFocus) then
      BitBtn62.SetFocus;
end;

procedure TfrmValeResgateTroca.EditHwValorValeExit(Sender: TObject);
begin
	if not EditHwValorVale.Visible then
    Exit;

  if not vDadosIni.vProgFid.vHabilitarProgFid then
    Exit;

  // Buscas dados taxa conversão
  vDadosIni.buscasdadostaxaConv(vRegrasValeCompraProgFid.buscas);
  EditHwPontosVale.AsValue :=
  	 (EditHwValorVale.AsValue / vRegrasValeCompraProgFid.buscas.FieldByName('PERC_PROG_FID').AsFloat);
end;

procedure TfrmValeResgateTroca.FormCreate(Sender: TObject);
begin
  vRegrasValeCompraProgFid := TRegrasValeCompraProgFid.create;
  vRegrasValeTrocaProgFid := TRegrasValeTrocaProgFid.create;
end;

procedure TfrmValeResgateTroca.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    BitBtn63Click(Sender);
end;

procedure TfrmValeResgateTroca.FormShow(Sender: TObject);
begin
  vCodCliente := StrToInt(vDadosIni.vPesquisaCliente);
  vCPFCGC := trim(vDadosIni.vPesquisaCPFCGC);
  BitBtn62.Enabled := (vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'PROGFID')
    and (vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2) = 'C');
  vRegrasValeCompraProgFid.abreRegrasValeCompraProgFid;
  vRegrasValeTrocaProgFid.abreRegrasValeTrocaProgFid;
  vRegrasValeTrocaProgFid.fTempValeTroca.EmptyDataSet;
  DBGridTempValeTroca.DataSource := vRegrasValeTrocaProgFid.fTempDtValeTroca;

  vDadosIni.verSaldoCC(vCodCliente, vCPFCGC, vRegrasValeCompraProgFid.buscas, vSaldoCC, vValorCC);
  if frmValeResgateTroca.Tag = 99 then
  	vSaldoCC := vDadosIni.vTempValorValesTroca;

  if vDadosIni.vProgFid.vHabilitarProgFid then
  	Label354.Caption := FormatFloat('#,##0', vSaldoCC);

  Label356.Visible := vDadosIni.IfThen(vDadosIni.vProgFid.vHabilitarProgFid,
  	vDadosIni.IfThen(vDadosIni.vProgFid.vValorMinPontosValeProgFid > 0, true, false),
    False);
  Label356.Caption := '* Valor mínimo de pontos: ' + FormatFloat('#,##0', vDadosIni.vProgFid.vValorMinPontosValeProgFid);

  LabelPontosValeTroca.Caption := 'Pontos: 0';
  LabelValorValeTroca.Caption := 'Valor : 0';

  if vDadosIni.vProgFid.vHabilitarProgFid then
  begin
    EditHwPontosVale.AsValue := vDadosIni.vProgFid.vValorMinPontosValeProgFid;
    EditHwPontosValeExit(Sender);
  end;

  pnInfValorVale.Visible := vRegrasValeCompraProgFid.dataSet.IsEmpty;
  DBGridValeCompraProgFid.Visible := not vRegrasValeCompraProgFid.dataSet.IsEmpty;
  lbInfVale.Caption := vDadosIni.IfThen((not vDadosIni.vProgFid.vHabilitarProgFid) or (not vRegrasValeCompraProgFid.dataSet.IsEmpty),
    'Selecione o valor do vale desejado:', 'Informe o pontos que serão debitados da conta corrente do cliente:');

  PageControl7.TabIndex :=
    vDadosIni.IfThen(((vDadosIni._LerConfiguracoesRegistroInteger('frmValeResgateTroca.PageControl7.TabIndex') <> 0)
     and (vDadosIni._LerConfiguracoesRegistroInteger('frmValeResgateTroca.PageControl7.TabIndex') <> 1)), 0,
    vDadosIni._LerConfiguracoesRegistroInteger('frmValeResgateTroca.PageControl7.TabIndex'));

  ComboBoxFiltro.ItemIndex :=
    vDadosIni.IfThen(((vDadosIni._LerConfiguracoesRegistroInteger('frmValeResgateTroca.ComboBoxFiltro.ItemIndex') <> 0)
     and (vDadosIni._LerConfiguracoesRegistroInteger('frmValeResgateTroca.ComboBoxFiltro.ItemIndex') <> 1)), 0,
    vDadosIni._LerConfiguracoesRegistroInteger('frmValeResgateTroca.ComboBoxFiltro.ItemIndex'));

  if (Self.Enabled) and (Self.Visible) and (EditHwPontosVale.CanFocus) then
    EditHwPontosVale.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (EditHwValorVale.CanFocus) then
    EditHwValorVale.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBGridValeCompraProgFid.CanFocus) then
    DBGridValeCompraProgFid.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (ComboBoxFiltro.CanFocus) then
    ComboBoxFiltro.SetFocus;
  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmValeResgateTroca.SpeedButton1Click(Sender: TObject);
begin
	try
    Cursor := crHourGlass;

    if vDadosIni.vProgFid.vHabilitarProgFid then
      //
    else if vDadosIni.vCashback.vHabilitarCashback then
    begin
      vDadosNummus := vDadosIni.retornaDadosNummus(vRegrasValeCompraProgFid.buscas);

      if trim(vDadosNummus) = '' then
      begin
        vSaldoCashbackClienteNummus  := 0;
        vSaldoAcumuladoClienteNummus := 0;
      end
      else
      begin
        vSaldoCashbackClienteNummus :=
          nummus_simular_resgate_cliente(
            PChar(vDadosIni.vBancoHW),
            PChar(vDadosIni.getCampoPipe(trim(vDadosNummus), 1) + '|' +
              vDadosIni.getCampoPipe(trim(vDadosNummus), 2) + '|' +
              vDadosIni.getCampoPipe(trim(vDadosNummus), 3) + '|'),
            vCodCliente,
            vDadosIni.cod_empresa,
            vValorReq);

        vSaldoAcumuladoClienteNummus :=
       	  nummus_consultar_saldo_cliente(
            PChar(vDadosIni.vBancoHW),
            PChar(vDadosIni.getCampoPipe(trim(vDadosNummus), 1) + '|' +
              vDadosIni.getCampoPipe(trim(vDadosNummus), 2) + '|' +
              vDadosIni.getCampoPipe(trim(vDadosNummus), 3) + '|'),
            vCodCliente,
            vDadosIni.cod_empresa);
      end;

      Label354.Caption := 'R$ ' + FormatFloat('#,##0.00', vSaldoCashbackClienteNummus);
      Label350.Caption := 'R$ ' + FormatFloat('#,##0.00', vSaldoAcumuladoClienteNummus);
    end;
  finally
    Cursor := crDefault;
  end;
end;

end.
