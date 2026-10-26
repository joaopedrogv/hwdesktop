unit uClassesSpedFBlocoH;

interface

uses
  uDataSet_OOP, DB, DBClient, StdCtrls, IBQuery, Classes;

type
  TEvent = procedure of object;
  THwOpInventario = (oi88, oi02, oi03, oi04, oi05);
  HwOpInventario = set of THwOpInventario;
  HwOpcoesSelecao = (osSel, osUnSel, osSelAll, osUnSelAll);

  THwOpcaoCalculoICMSInventario = (ocCustoComoBase, ocFatorConversao, ocMVAConversao, ocUsarAliqInternaProd, ocUsarCSTProd);
  HwOpcaoCalculoICMSInventario = set of THwOpcaoCalculoICMSInventario;

  TManutencaoInventarioBlocoH = class;

  TManutencaoInventarioBlocoH = class(TDataSet_OOP)
  private
    fEventFiltro: TEvent;
    procedure SetEventFiltro(const Value: TEvent);
    procedure ClientDataSetCalcFields(DataSet: TDataSet);
  public
    destructor Destroy; override;
    constructor create;

    procedure abreForm(TipoForm: Smallint);
    procedure selecionarRegistros(DataInventario, DescricaoProduto: string; ListNCM: TStrings); overload;
    procedure marcarDesmarcar(Opcao: HwOpcoesSelecao);
    procedure aplicarFiltro(Opcoes: HwOpInventario; CST_ICMS: string; CondicionalOu: Boolean);
    procedure alterarRegistros(Opcoes: HwOpInventario); overload;
    procedure alterarRegistros(CST_ICMS: string; BaseICMS, ValorICMS, AliqICMS, FatorConversao: Double; Opcoes: HwOpcaoCalculoICMSInventario); overload;

    property EventFiltro: TEvent read fEventFiltro write SetEventFiltro;
  end;

var
  ManutInv: TManutencaoInventarioBlocoH;

implementation

uses
  uDtmSPED, Forms, uManutencaoInventario, uDtmAtivo, IBDatabase, SysUtils;

{ TManutencaoInventarioBlocoH }

procedure TManutencaoInventarioBlocoH.abreForm(TipoForm: Smallint);
begin
	try
    vDadosIni.abreStatusProcessamento('','Abrindo Obrigãções do ICMS Recolhido ou a Recolher - DIFAL...');
    if dtmSPED = nil then
      dtmSPED := TdtmSPED.Create(dtmSPED);

    vDadosIni.vTipoForm := TipoForm;

    if not vDadosIni.PesqPros('SPED106', 'CONSULTA', '', 'INV_TIPO74_SPED_SINT', '',
      dtmSPED.qrBuscas) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    if frmManutencaoInventario = nil then
    begin
      if TipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';

      Application.CreateForm(TfrmManutencaoInventario, frmManutencaoInventario);
    end;

    if (TipoForm > 0) and (not frmManutencaoInventario.Visible) then
      frmManutencaoInventario.ShowModal
    else if (not frmManutencaoInventario.Visible) then
      frmManutencaoInventario.Show
    else if frmManutencaoInventario.FormStyle = fsMDIChild then
      frmManutencaoInventario.Show
    else
      frmManutencaoInventario.ShowModal;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TManutencaoInventarioBlocoH.alterarRegistros(
  Opcoes: HwOpInventario);
var
  StrTipo: string;
  RecNo: Integer;
  Perc: Double;
begin
  try
    RecNo := dataSet.RecNo;
    dataSet.DisableControls;
    StrTipo := '';
    if oi02 in Opcoes then
      StrTipo := StrTipo + '02|';
    if oi03 in Opcoes then
      StrTipo := StrTipo + '03|';
    if oi04 in Opcoes then
      StrTipo := StrTipo + '04|';
    if oi05 in Opcoes then
      StrTipo := StrTipo + '05|';
    if oi88 in Opcoes then
      StrTipo := StrTipo + '88|';
    if StrTipo <> '' then
      StrTipo := '|' + StrTipo;

    try
      dataSet.Filter := 'SEL = ''S''';
      dataSet.Filtered := True;

      if dataSet.IsEmpty then
      begin
        Application.MessageBox('Nenhum registro selecionado', 'Atenção', 0 + 64);
        Exit;
      end;

      if not vDadosIni.PesqPros('SPED108', 'ALTERAR',
        'DATA_INV ' + FormatDateTime('DD/MM/YYYY', dataSet.FieldByName('DATA_INV').AsDateTime), 'INV_TIPO74_SPED_SINT',
        FormatDateTime('DD/MM/YYYY', dataSet.FieldByName('DATA_INV').AsDateTime), buscas) then
        Exit;

      Perc := 0;
      vDadosIni.abreStatusProcessamento('Processando', 'Aguarde... ' + IntToStr(Trunc(Perc)) + '%');

      dataSet.First;
      while not dataSet.Eof do
      begin
        if (dataSet.RecNo mod 10) = 0 then
        begin
          Perc := dataSet.RecNo / dataSet.RecordCount * 100;
          vDadosIni.abreStatusProcessamento('Processando', 'Aguarde... ' + IntToStr(Trunc(Perc)) + '%');
        end;

        buscas.Close;
        buscas.SQL.Text := 'update or insert into inv_tipo74_sped_sint (data_inv, cod_empresa, grupo_prod, cod_prod, tp_arq_fiscal)' +
          ' values (:data_inv, :cod_empresa, :grupo_prod, :cod_prod, :tp_arq_fiscal)' +
          ' matching (data_inv, cod_empresa, grupo_prod, cod_prod)';
        buscas.ParamByName('data_inv').AsDate := dataSet.FieldByName('data_inv').AsDateTime;
        buscas.ParamByName('cod_empresa').AsInteger := dataSet.FieldByName('cod_empresa').AsInteger;
        buscas.ParamByName('grupo_prod').AsInteger := dataSet.FieldByName('grupo_prod').AsInteger;
        buscas.ParamByName('cod_prod').AsString := dataSet.FieldByName('cod_prod').AsString;
        buscas.ParamByName('tp_arq_fiscal').AsString := StrTipo;
        buscas.ExecSQL;


//        vDadosIni.GravaAuditoria('SPED108', 'ALTERAR',
//          'DATA_INV ' + FormatDateTime('DD/MM/YYYY', dataSet.FieldByName('DATA_INV').AsDateTime) +
//          'TPARQ ' + StrTipo , 'INV_TIPO74_SPED_SINT',
//          IntToStr(dataSet.FieldByName('grupo_prod').AsInteger) + '-' +
//          Trim(dataSet.FieldByName('cod_prod').AsString), buscas);

        dataSet.Next;
      end;
      vDadosIni.abreStatusProcessamento('Processando', 'Aguarde... 100%');
      if buscas.Transaction.InTransaction then
      begin
        buscas.Transaction.Commit;

        vDadosIni.GravaAuditoria('SPED108', 'ALTERAR',
          'DATA_INV ' + FormatDateTime('DD/MM/YYYY', dataSet.FieldByName('DATA_INV').AsDateTime) + ' - SUCESSO', 'INV_TIPO74_SPED_SINT',
          FormatDateTime('DD/MM/YYYY', dataSet.FieldByName('DATA_INV').AsDateTime), buscas);
      end;
    finally
      vDadosIni.fechaStatusProcessamento;
      dataSet.Filtered := False;
    end;

    dataSet.Refresh;
    dataSet.RecNo := RecNo;

  finally
    if Assigned(fEventFiltro) then
      fEventFiltro;
    dataSet.EnableControls;
  end;
end;

procedure TManutencaoInventarioBlocoH.alterarRegistros(CST_ICMS: string;
  BaseICMS, ValorICMS, AliqICMS, FatorConversao: Double;
  Opcoes: HwOpcaoCalculoICMSInventario);
var
  RecNo: Integer;
  ProdMVA, ProdICM: Double;
  ProdCST: string;
  Perc: Double;
begin

  // zerando caso usuario tenha informado valores negativos
  BaseICMS  := vDadosIni.IfThen(BaseICMS > 0, BaseICMS, 0);
  ValorICMS := vDadosIni.IfThen(ValorICMS > 0, ValorICMS, 0);


  // validando quando informado pelo usuario
  if not (ocCustoComoBase in Opcoes) then
    if (BaseICMS > 0) or (ValorICMS > 0) then
      if (BaseICMS = 0) or (ValorICMS = 0) then
      begin
        Application.MessageBox('Por favor, se preencher o campo de Valor também preencha o campode de Base de calculo e vice versa', 'Atenção', 0 + 64);
        Exit;
      end;

  // validando quando usuario informa o cst e as bases e valores
  if not (ocUsarCSTProd in Opcoes) then
    if not (ocCustoComoBase in Opcoes) then
      if Trim(CST_ICMS) = '' then
        if (BaseICMS > 0) or (ValorICMS > 0 ) then
        begin
          Application.MessageBox('CST deve ser preenchido quando o informado o valor, base ou aliquota de icms', 'Atenção', 0 + 64);
          Exit;
        end;

  try
    RecNo := dataSet.RecNo;
    dataSet.DisableControls;

    try
      dataSet.Filter := 'SEL = ''S''';
      dataSet.Filtered := True;

      if dataSet.IsEmpty then
      begin
        Application.MessageBox('Nenhum registro selecionado', 'Atenção', 0 + 64);
        Exit;
      end;
      
      if not vDadosIni.PesqPros('SPED108', 'ALTERAR',
        'DATA_INV ' + FormatDateTime('DD/MM/YYYY', dataSet.FieldByName('DATA_INV').AsDateTime), 'INV_TIPO74_SPED_SINT',
        FormatDateTime('DD/MM/YYYY', dataSet.FieldByName('DATA_INV').AsDateTime), buscas) then
        Exit;

      Perc := 0;
      vDadosIni.abreStatusProcessamento('Processando', 'Aguarde... ' + IntToStr(Trunc(Perc)) + '%');

      dataSet.First;
      while not dataSet.Eof do
      begin
        if (dataSet.RecNo mod 10) = 0 then
        begin
          Perc := dataSet.RecNo / dataSet.RecordCount * 100;
          vDadosIni.abreStatusProcessamento('Processando', 'Aguarde... ' + IntToStr(Trunc(Perc)) + '%');
        end;
        // obtendo valores do cadastro do produto e NCM
        if (ocCustoComoBase in Opcoes) or (ocUsarCSTProd in Opcoes) then
        begin
          buscas.Close;
          buscas.SQL.Text := 'select n.mva, pr.icm_prod, pr.cst_prod from produtos pr' +
            ' left join nbm n on n.cod_ncm = pr.nbm' +
            ' where pr.grupo_prod = :grupo_prod and pr.cod_prod = :cod_prod' +
            ' and cod_empresa = ' + vDadosIni.codEmpresa;
          buscas.ParamByName('grupo_prod').AsInteger := dataSet.FieldByName('grupo_prod').AsInteger;
          buscas.ParamByName('cod_prod').AsString := Trim(dataSet.FieldByName('cod_prod').AsString);
          buscas.Open;
          ProdMVA := buscas.FieldByName('mva').AsFloat;
          ProdICM := buscas.FieldByName('icm_prod').AsFloat;
          ProdCST := buscas.FieldByName('cst_prod').AsString;
        end;

        // caso marcado custo como base o sistema utilizar o fator de conversao ou mva se informado ou existir
        if ocCustoComoBase in Opcoes then
        begin
          BaseICMS := dataSet.FieldByName('valor_prod').AsFloat;
          if ocFatorConversao in Opcoes then
            BaseICMS := BaseICMS * Abs(FatorConversao)
          else if ocMVAConversao in Opcoes then
          begin
            FatorConversao := ProdMVA;
            if FatorConversao > 0 then
              BaseICMS := BaseICMS * Abs( 1 + (FatorConversao / 100) );
          end;

          // caso o usuario tenha marcado a opcao de usar aliquota do produto, porém
          // se menor ou igual a zero o sistema usa a informada na tela
          if ocUsarAliqInternaProd in Opcoes then
            if ProdICM > 0 then
              AliqICMS := ProdICM;
        end;

        // caso o usuario marcor que vai usar o cst do produto
        if ocUsarCSTProd in Opcoes then
          CST_ICMS := ProdCST;

        // efetuando o calculo
        if ocCustoComoBase in Opcoes then
        begin
          ValorICMS := 0;
          BaseICMS := vDadosIni.StrToFloatFormat(BaseICMS, 2);
          if AliqICMS > 0 then
            ValorICMS := vDadosIni.StrToFloatFormat(BaseICMS * AliqICMS / 100, 2);
        end;

        // zernado os valores caso negativo
        if (ValorICMS <= 0) or (BaseICMS <= 0) then
        begin
          ValorICMS := 0;
          BaseICMS := 0;
        end;

        // aplicando alteracoes no banco de dados
        buscas.Close;
        buscas.SQL.Text := 'update or insert into inv_tipo74_sped_sint (data_inv, cod_empresa, grupo_prod, cod_prod, h020_cst, h020_bc_icms, h020_vl_icms)' +
          ' values (:data_inv, :cod_empresa, :grupo_prod, :cod_prod, :h020_cst, :h020_bc_icms, :h020_vl_icms)' +
          ' matching (data_inv, cod_empresa, grupo_prod, cod_prod)';
        buscas.ParamByName('data_inv').AsDate := dataSet.FieldByName('data_inv').AsDateTime;
        buscas.ParamByName('cod_empresa').AsInteger := dataSet.FieldByName('cod_empresa').AsInteger;
        buscas.ParamByName('grupo_prod').AsInteger := dataSet.FieldByName('grupo_prod').AsInteger;
        buscas.ParamByName('cod_prod').AsString := Trim(dataSet.FieldByName('cod_prod').AsString);
        buscas.ParamByName('h020_cst').AsString := CST_ICMS;
        buscas.ParamByName('h020_bc_icms').AsFloat := BaseICMS;
        buscas.ParamByName('h020_vl_icms').AsFloat := ValorICMS;
        buscas.ExecSQL;

//        vDadosIni.GravaAuditoria('SPED108', 'ALTERAR',
//          'DATA_INV ' + FormatDateTime('DD/MM/YYYY', dataSet.FieldByName('DATA_INV').AsDateTime) +
//          'BC/VL ICMS ' + FloatToStr(BaseICMS) + '/' + FloatToStr(ValorICMS) , 'INV_TIPO74_SPED_SINT',
//          IntToStr(dataSet.FieldByName('grupo_prod').AsInteger) + '-' +
//          Trim(dataSet.FieldByName('cod_prod').AsString), buscas);

        dataSet.Next;
      end;

      vDadosIni.abreStatusProcessamento('Processando', 'Aguarde... 100%');

      if buscas.Transaction.InTransaction then
      begin
        buscas.Transaction.Commit;

        vDadosIni.GravaAuditoria('SPED108', 'ALTERAR',
          'DATA_INV ' + FormatDateTime('DD/MM/YYYY', dataSet.FieldByName('DATA_INV').AsDateTime) + ' - SUCESSO', 'INV_TIPO74_SPED_SINT',
          FormatDateTime('DD/MM/YYYY', dataSet.FieldByName('DATA_INV').AsDateTime), buscas);
      end;
    finally
      vDadosIni.fechaStatusProcessamento;
      dataSet.Filtered := False;
    end;

    dataSet.Refresh;
    dataSet.RecNo := RecNo;

  finally
    if Assigned(fEventFiltro) then
      fEventFiltro;
    dataSet.EnableControls;
  end;
end;

procedure TManutencaoInventarioBlocoH.aplicarFiltro(Opcoes: HwOpInventario;
  CST_ICMS: string; CondicionalOu: Boolean);
var
  Filtro: string;
  Condicao: string;
begin
  try
    dataSet.Filtered := False;
    Condicao := vDadosIni.IfThen(CondicionalOu, '  or', ' and');

    if oi02 in Opcoes then
      Filtro := Filtro + Condicao + ' tp_arq_fiscal like ''%|02|%''';
    if oi03 in Opcoes then
      Filtro := Filtro + Condicao + ' tp_arq_fiscal like ''%|03|%''';
    if oi04 in Opcoes then
      Filtro := Filtro + Condicao + ' tp_arq_fiscal like ''%|04|%''';
    if oi05 in Opcoes then
      Filtro := Filtro + Condicao + ' tp_arq_fiscal like ''%|05|%''';
    if oi88 in Opcoes then
      Filtro := Filtro + Condicao + ' tp_arq_fiscal like ''%|88|%''';
    if Trim(CST_ICMS) <> '' then
      Filtro := Filtro + Condicao + ' h020_cst = ' + QuotedStr(CST_ICMS);
    if Filtro <> '' then
      System.Delete(Filtro, 1, 4);
    dataSet.Filter := Filtro;

  finally
    dataSet.Filtered := dataSet.Filter <> ''
  end;

end;

procedure TManutencaoInventarioBlocoH.ClientDataSetCalcFields(
  DataSet: TDataSet);
begin
//  DataSet.FieldByName('custo_total').AsFloat := vDadosIni.StrToFloatFormat(
//    DataSet.FieldByName('valor_prod').AsFloat * DataSet.FieldByName('quantidade').AsFloat, 2);
end;

constructor TManutencaoInventarioBlocoH.create;
begin
  if dtmSPED = nil then
    dtmSPED := TdtmSPED.Create(dtmSPED);

  dataSet := TClientDataSet(dtmSPED.cdsManutInv);
  transacao := TIBTransaction(dtmSPED.transacao);
  buscas := TIBQuery(dtmSPED.qrBuscas);
  dataSet.OnCalcFields := ClientDataSetCalcFields;
end;

destructor TManutencaoInventarioBlocoH.Destroy;
begin

  inherited;
end;

procedure TManutencaoInventarioBlocoH.marcarDesmarcar(Opcao: HwOpcoesSelecao);
var
  RecNo: Integer;
begin
  if dataSet.IsEmpty then
    Exit;
  try
    RecNo := dataSet.RecNo;
    dataSet.DisableControls;
    if (osSel = Opcao) or (osUnSel = Opcao) then
    begin
      dataSet.Edit;
      dataSet.FieldByName('sel').AsString := vDadosIni.IfThen(osSel = Opcao, 'S', '');
      dataSet.Post;
    end
    else if (osSelAll = Opcao) or (osUnSelAll = Opcao) then
    begin
      try
        vDadosIni.abreStatusProcessamento('Selecionando', 'Aguarde...');
        dataSet.Last;
        dataSet.First;
        while not dataSet.Eof do
        begin
          vDadosIni.abreStatusProcessamento('Selecionando', 'Aguarde... ' + IntToStr(dataSet.RecNo) + ' de ' + IntToStr(dataSet.RecordCount));
          dataSet.Edit;
          dataSet.FieldByName('sel').AsString := vDadosIni.IfThen(osSelAll = Opcao, 'S', '');
          dataSet.Post;
          dataSet.Next;
        end;
      finally
        vDadosIni.fechaStatusProcessamento;
      end;
    end;
    dataSet.RecNo := RecNo;
  finally
    dataSet.EnableControls;
  end;
end;

procedure TManutencaoInventarioBlocoH.selecionarRegistros(DataInventario,
  DescricaoProduto: string; ListNCM: TStrings);
var
  List, ListIn, ListSelect: TStrings;
  I, J: Integer;
  Linha, NCM, SqlAdicional: string;
  Numero: Integer;
  NCMFoiInformado: Boolean;
begin
  if not vDadosIni.PesqPros('SPED107', 'CONSULTA', '', 'INV_TIPO74_SPED_SINT', '',
    buscas) then
    Exit;

  NCMFoiInformado := False;
  List := TStringList.Create;
  ListIn := TStringList.Create;
  ListSelect := TStringList.Create;
  TStringList(ListIn).Duplicates := dupIgnore;
  TStringList(ListSelect).Duplicates := dupIgnore;
  List.Clear;
  ListIn.Clear;
  ListSelect.Clear;
  for I := 0 to ListNCM.Count - 1 do
  begin
    Linha := ListNCM[i];
    NCM := '';
    for J := 1 to Length(Linha) do
    begin
      if TryStrToInt(Linha[J], Numero) then
        NCM := NCM + IntToStr(Numero)
      else if Trim(NCM) <> '' then
      begin
        if Length(Trim(NCM)) = 8 then
          ListIn.Add(Trim(NCM))
        else if Length(Trim(NCM)) < 8 then
          ListSelect.Add(Trim(NCM));
        NCM := '';
        NCMFoiInformado := True;
      end;
    end;
    if Trim(NCM) <> '' then
    begin
      case Length(Trim(NCM)) of
        8: ListIn.Add(Trim(NCM));
        else
          ListSelect.Add(Trim(NCM));
      end;
      NCMFoiInformado := True;
    end;
  end;
  for I := 0 to ListSelect.Count - 1 do
  begin
    buscas.Close;
    buscas.SQL.Text := 'select distinct pr.nbm as ncm from produtos pr' +
      ' where pr.nbm starting with ' + QuotedStr(Trim(ListSelect[i])) +
      ' and pr.cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.Open;
    buscas.First;
    while not buscas.Eof do
    begin
      ListIn.Add(Trim(buscas.FieldByName('ncm').AsString));
      buscas.Next;
    end;
  end;
  SqlAdicional := '';
  for I := 0 to ListIn.Count - 1 do
    SqlAdicional := SqlAdicional +  QuotedStr(ListIn[i]) + ',';
  if SqlAdicional <> '' then
  begin
    System.Delete(SqlAdicional, Length(SqlAdicional), 1);
    SqlAdicional := ' and pr.nbm in (' + SqlAdicional + ')';
  end
  else if NCMFoiInformado then
    SqlAdicional := ' and pr.nbm = ''NCMNCMNC''';

  montaSelect('select i7.data_inv, i7.cod_empresa, i7.grupo_prod, i7.cod_prod, pr.num_fab_prod, pr.nbm ncm,' +
    ' pr.descr_prod, i7.quantidade, i7.valor_prod, (i7.quantidade * i7.valor_prod) custo_total,' +
    ' i7s.tp_arq_fiscal, i7s.h020_cst,' +
    ' i7s.h020_bc_icms, i7s.h020_vl_icms from inv_tipo74 i7' +
    ' inner join produtos pr on pr.grupo_prod = i7.grupo_prod and pr.cod_prod = i7.cod_prod and pr.cod_empresa = i7.cod_empresa' +
    ' left join inv_tipo74_sped_sint i7s on i7s.data_inv = i7.data_inv and i7s.cod_empresa = i7.cod_empresa and i7s.grupo_prod = i7.grupo_prod and i7s.cod_prod = i7.cod_prod' +
    ' where i7.data_inv = :dataIni and i7.data_inv = :dataFim' +
    ' and i7.cod_empresa = ' + vDadosIni.codEmpresa +
      vDadosIni.IfThen(Trim(DescricaoProduto) <> '',
        ' and pr.descr_prod like ' + QuotedStr(Trim(DescricaoProduto) + '%'), '') +
      SqlAdicional + ' order by pr.descr_prod', StrToDateDef(DataInventario, 0), StrToDateDef(DataInventario, 0));
  if Assigned(fEventFiltro) then
    fEventFiltro;
end;

procedure TManutencaoInventarioBlocoH.SetEventFiltro(const Value: TEvent);
begin
  fEventFiltro := Value;
end;

end.
