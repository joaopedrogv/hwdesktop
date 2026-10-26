unit uCadPedVenda_ValoresNF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ComCtrls, DBCtrls, StdCtrls, Buttons, Mask, ExtCtrls,
  uDataSet_OOP, uClassesPedVenda;

type
  TfrmCadPedVenda_ValoresNF = class(TfrmPadrao)
    pn_valores_nf: TPanel;
    pn_valores_nf_client: TPanel;
    pn_valores_nf_dados: TPanel;
    lb_nf_ac_outras: TLabel;
    lb_nf_ac_seguro: TLabel;
    lb_nf_ac_frete: TLabel;
    lb_nf_ac_ipi: TLabel;
    lb_nf_ac_icmsst: TLabel;
    lb_nf_ac_fcpst: TLabel;
    lb_nf_ac_imposto_ii: TLabel;
    lb_nf_ac_calctrib: TLabel;
    lb_nf_freteconta: TLabel;
    lb_nf_dc_desconto: TLabel;
    lb_nf_ac_vicmdeson: TLabel;
    lb_nf_dc_vicmdeson: TLabel;
    lb_nf_cf_deson: TLabel;
    el_perc_desconto: TLabel;
    ed_nf_ac_outras: TDBEdit;
    ed_nf_ac_seguro: TDBEdit;
    ed_nf_ac_frete: TDBEdit;
    ed_nf_ac_ipi: TDBEdit;
    ed_nf_ac_icmsst: TDBEdit;
    ed_nf_ac_fcpst: TDBEdit;
    ed_nf_ac_imposto_ii: TDBEdit;
    bt_obter_valores_nf: TBitBtn;
    pn_valores_nf_tot_e_acres: TPanel;
    lb_acrescimo_valores_nf: TLabel;
    lb_valor_total_valores_nf: TLabel;
    lb_desconto_valor: TLabel;
    ed_acrescimo_valores_nf: TDBEdit;
    ed_valor_total_valores_nf: TDBEdit;
    ed_desconto_valor: TDBEdit;
    ed_nf_ac_calctrib: TDBLookupComboBox;
    ed_nf_freteconta: TDBLookupComboBox;
    ed_nf_dc_desconto: TDBEdit;
    ed_nf_ac_vicmdeson: TDBEdit;
    ed_nf_dc_vicmdeson: TDBEdit;
    ed_nf_cf_deson_emb: TDBLookupComboBox;
    ed_desc_p_prod: TDBEdit;
    pn_valores_nf_tv: TPanel;
    tv_nf_valores: TTreeView;
    pn_valores_nf_bottom: TPanel;
    bt_valors_nf_voltar: TBitBtn;
    lk_finalidadeid: TDBLookupComboBox;
    Label1: TLabel;
    lb_finalidade: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tv_nf_valoresCustomDrawItem(Sender: TCustomTreeView;
      Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure ed_nf_dc_descontoExit(Sender: TObject);
    procedure ed_nf_ac_outrasExit(Sender: TObject);
    procedure bt_obter_valores_nfClick(Sender: TObject);
  private
    FPedVenda: TPedVenda;
    Fnf_ac_calctrib_lookup: TDadosLookUp_OOP;
    Fnf_freteconta: TDadosLookUp_OOP;
    FfinalidadeId: TDadosLookUp_OOP;
  public                             
    procedure faturamento_calc_valores_nota(Sender: TObject);
    property PedVenda: TPedVenda read FPedVenda write FPedVenda;
  end;

var
  frmCadPedVenda_ValoresNF: TfrmCadPedVenda_ValoresNF;

implementation

uses
  DB, uDtmAtivo, uDtmPedVenda, faturamento_hw_class, hw_erro_class,
  StrUtils;

{$R *.dfm}

procedure TfrmCadPedVenda_ValoresNF.bt_obter_valores_nfClick(Sender: TObject);
begin
  inherited;
 try
    Screen.Cursor := crHourGlass;
    bt_obter_valores_nf.Enabled := False;
    vDadosIni.abreStatusProcessamento('Calculando valores da NF', 'Aguarde enquanto o sistema está processando');

    FPedVenda.fat_ped.calcular_valores_nf();
  finally
    vDadosIni.fechaStatusProcessamento;
    Screen.Cursor := crDefault;
    bt_obter_valores_nf.Enabled := True;
  end;
end;

procedure TfrmCadPedVenda_ValoresNF.ed_nf_ac_outrasExit(Sender: TObject);
begin
  inherited;
  with FPedVenda do if (dataSet.State in [dsinsert, dsedit]) then
  begin
    dataSet.FieldByName('ACRESCIMO').AsFloat := f_float('NF_AC_SEGURO') +
                                                f_float('NF_AC_OUTRAS') +
                                                f_float('NF_AC_FRETE') +
                                                f_float('NF_AC_IPI') +
                                                f_float('NF_AC_ICMSST') +
                                                f_float('NF_AC_FCPST') +
                                                f_float('NF_AC_IMPOSTO_II') +
                                                f_float('NF_AC_VICMDESON');
    calculaDescontoAcrescimo;
  end;
end;

procedure TfrmCadPedVenda_ValoresNF.ed_nf_dc_descontoExit(Sender: TObject);
begin
  inherited;  
  with FPedVenda do if (dataSet.State in [dsinsert, dsedit]) then
  begin
    dataSet.FieldByName('DESCONTO').AsFloat := f_float('NF_DC_DESCONTO') +
                                               f_float('NF_DC_VICMDESON');
    if not calculaDescontoAcrescimo then
      if (Self.Enabled) and (Self.Visible) and (TDBEdit(Sender).CanFocus) then
        TDBEdit(Sender).SetFocus;
  end;
end;

procedure TfrmCadPedVenda_ValoresNF.faturamento_calc_valores_nota(
  Sender: TObject);
var
  Anf: THw_notafiscal_class;
  Ait: THw_notafiscal_item_class;
  Aerros: THw_erro_classList;
  Alevel0, Alevel1, Alevel2: TTreeNode;
  I, J: Integer;
  Alist: TStrings;
  strFinalidade: string;
begin
  tv_nf_valores.Items.Clear;
  lb_finalidade.Caption := '';
  if not Assigned(Sender) then
  begin
    tv_nf_valores.Items.AddChild(nil, 'Sem dados para apresentar. Contacte o suporte técnico');
  end
  else if Sender is THw_notafiscal_class then
  begin
    Anf := THw_notafiscal_class(Sender);
    
    if Anf.finalidadeid > 0 then
      strFinalidade := IntToStr(Anf.finalidadeid) + ' - ' +
        PedVenda.SqlScalar('select descricao from finalidade where id = %d and cod_empresa = %d', [Anf.finalidadeid, vDadosIni.cod_empresa]).AsString
    else
      strFinalidade := '';

    if Anf.erros.Count > 0 then
    begin
      Alevel0 := tv_nf_valores.Items.AddChild(nil, 'Erros no processamento');
      for I := 0 to Pred(Aerros.Count) do
      begin
        Alevel1 := tv_nf_valores.Items.AddChild(Alevel0, Aerros.Items[I].erro);
        if Aerros.Items[I].detalhe <> '' then
          tv_nf_valores.Items.AddChild(Alevel1, Aerros.Items[I].detalhe);
      end;
    end;
    Alevel0 := tv_nf_valores.Items.AddChild(nil, 'Dados da nota fiscal');
    Alevel1 := tv_nf_valores.Items.AddChild(Alevel0, Format('Total.....: %n', [Anf.valor_total]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('BC ICMS.............: %n', [Anf.base_icm]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('ICMS................: %n', [Anf.valor_icm]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('BC ICMS ST..........: %n', [Anf.base_icmsub]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('*ICMS ST............: %n', [Anf.valor_icmsub]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('*Produtos...........: %n', [Anf.valor_prod]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('*Descontos..........: %n', [Anf.valor_desc]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('*IPI................: %n', [Anf.valor_ipi]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('*Frete..............: %n', [Anf.valor_frete]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('*Seguro.............: %n', [Anf.valor_seguro]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('*Outros.............: %n', [Anf.valor_out_desp]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('*Imposto Importação.: %n', [Anf.valor_ii]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('*ICMS Desonerado....: %n', [Anf.vicmdeson]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('*PIS Desonerado.....: %n', [Anf.vpisdeson]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('*COFINS Desonerado..: %n', [Anf.vcofinsdeson]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('Val Aprox tributos..: %n', [Anf.vtottrib]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('ICMS Inter Dest.....: %n', [Anf.vicmsufdest]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('ICMS Inter Rem......: %n', [Anf.vicmsufremet]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('FCP Inter Dest......: %n', [Anf.vfcpufdest]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('FCP.................: %n', [Anf.fcp_vfcp]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('*FCP ST.............: %n', [Anf.fcp_vfcpst]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('FCP ST Ant..........: %n', [Anf.fcp_vfcpstret]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('Frete por conta.....: %s', [IfThen(Anf.freteconta_tr = '0', 'Terceiros')    +
                                                                              IfThen(Anf.freteconta_tr = '1', 'Emitente')     +
                                                                              IfThen(Anf.freteconta_tr = '2', 'Destinatário') +
                                                                              IfThen(IndexText(Anf.freteconta_tr, ['0', '1', '2']) = -1, 'Sem frete')]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('Consumidor Final....: %s', [IfThen(Anf.consumidor_final = 'S', 'Sim', 'Não')]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('Indicador de IE.....: %d', [Anf.nfe_indiedest]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('Finalidade..........: %s', [strFinalidade]));
    lb_finalidade.Caption := strFinalidade;

    Alevel1 := tv_nf_valores.Items.AddChild(Alevel0, Format('Itens da nota - Qtde %d', [Anf.itens.Count]));
    for I := 0 to Pred(Anf.itens.Count) do
    begin
      Ait := Anf.itens.Items[I];
      Alevel2 := tv_nf_valores.Items.AddChild(Alevel1, Format('%d - %s', [Ait.nitem, Ait.descricao_item]));

      tv_nf_valores.Items.AddChild(Alevel2, Format('CFOP................: %4.0f', [Ait.codigo_nop]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('CST ICMS............: %s'   , [Ait.cst]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('Valor Unitário......: %0.6n', [Ait.valor_unitario]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('Quantidade..........: %0.6n', [Ait.quantidade]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('Valor Total.........: %0.2n', [Ait.valor_total]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('BC ICMS.............: %n', [Ait.base_icm]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('Aliq ICMS...........: %n', [Ait.aliq_icm]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('ICMS................: %n', [Ait.valor_icm]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('MVA.................: %n', [Ait.mva]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('BC ICMS ST..........: %n', [Ait.base_icmsub]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('Aliq ICMS ST........: %n', [Ait.aliq_icmsub]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('*ICMS ST............: %n', [Ait.valor_icmsub]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('*Descontos..........: %n', [Ait.rateio_desconto]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('*IPI................: %n', [Ait.valor_ipi]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('*Frete..............: %n', [Ait.rateio_frete]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('*Seguro.............: %n', [Ait.rateio_seguro]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('*Outros.............: %n', [Ait.rateio_outdesp]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('*Imposto Importação.: %n', [Ait.valor_ii]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('*ICMS Desonerado....: %n', [Ait.vicmdeson]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('*PIS Desonerado.....: %n', [Ait.vpisdeson]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('*COFINS Desonerado..: %n', [Ait.vcofinsdeson]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('Val Aprox tributos..: %n', [Ait.vtottrib]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('ICMS Inter Dest.....: %n', [Ait.vicmsufdest]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('ICMS Inter Rem......: %n', [Ait.vicmsufremet]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('FCP Inter Dest......: %n', [Ait.vfcpufdest]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('FCP.................: %n', [Ait.fcp_vfcp]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('*FCP ST.............: %n', [Ait.fcp_vfcpst]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('FCP ST Ant..........: %n', [Ait.fcp_vfcpstret]));
    end;
    for I := 0 to Pred(tv_nf_valores.Items.Count) do
      if tv_nf_valores.Items[I].Level = 0 then
        tv_nf_valores.Items[i].Expand(False)
      else if (tv_nf_valores.Items[I].Level = 1) and (Pos('Itens da nota - Qtde', tv_nf_valores.Items[I].Text) = 1) then
        tv_nf_valores.Items[i].Expand(False);
//      else if (tv_nf_valores.Items[I].Level = 2) then
//        tv_nf_valores.Items[i].Expand(False);
  end
  else if Sender is THw_erro_classList then
  begin
    Aerros := THw_erro_classList(Sender);

    for I := 0 to Pred(Aerros.Count) do with Aerros.Items[I] do
    begin
      Alevel0 := tv_nf_valores.Items.AddChild(nil, erro);
      if detalhe <> '' then
        if Pos(sLineBreak, detalhe) = 0 then
          tv_nf_valores.Items.AddChild(Alevel0, detalhe)
        else
        begin
          Alist := TStringList.Create;
          try
            Alist.Text := detalhe;
            for J := 0 to Pred(Alist.Count) do
              tv_nf_valores.Items.AddChild(Alevel0, Alist[J]);
          finally
            FreeAndNil(Alist);
          end;
        end;
    end;
  end;
end;

procedure TfrmCadPedVenda_ValoresNF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  if Assigned(Fnf_ac_calctrib_lookup) then
    FreeAndNil(Fnf_ac_calctrib_lookup);

  if Assigned(Fnf_freteconta) then
    FreeAndNil(Fnf_freteconta);
  
  FfinalidadeId.Free;

  Action := caFree;
  frmCadPedVenda_ValoresNF := nil;
end;

procedure TfrmCadPedVenda_ValoresNF.FormCreate(Sender: TObject);
begin
  inherited;
  FfinalidadeId := TDadosLookUp_OOP.create;
end;

procedure TfrmCadPedVenda_ValoresNF.FormShow(Sender: TObject);
begin
  inherited; 

  if not Assigned(Fnf_ac_calctrib_lookup) then
  begin
    Fnf_ac_calctrib_lookup := TDadosLookUp_OOP.create;
    TDadosLookUp_OOP(Fnf_ac_calctrib_lookup).setDadosDataSet(['S', 'N'], ['Sim', 'Não'], ed_nf_ac_calctrib);
    TDadosLookUp_OOP(Fnf_ac_calctrib_lookup).setDBLookupComboBox(ed_nf_cf_deson_emb);
  end;

  if not Assigned(Fnf_freteconta) then
  begin
    Fnf_freteconta := TDadosLookUp_OOP.create;
    TDadosLookUp_OOP(Fnf_freteconta).setDadosDataSet(['T', 'E', 'D'], ['Terceiros', 'Emitente', 'Destinatário'], ed_nf_freteconta);
  end;

  FfinalidadeId.setDadosDataSet('ID', 'DESCRICAO', PedVenda.SqlOpen('select fi.id, fi.descricao, 1 ordem from finalidade fi' +
                                                                    ' where cod_empresa = %s' +
                                                                    ' union ' +
                                                                    ' select 0 id, ''Automático'' descricao, 2 ordem from rdb$database' +
                                                                    ' order by 1 ', [vDadosIni.codEmpresa]),
                                                                    lk_finalidadeid);
end;

procedure TfrmCadPedVenda_ValoresNF.tv_nf_valoresCustomDrawItem(
  Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState;
  var DefaultDraw: Boolean);
begin
  inherited;
  if (Node.Level = 1) or (Copy(Node.Text,1 ,1 ) = '*') then
    Sender.Canvas.Font.Style := [FSBOLD];
end;

end.
