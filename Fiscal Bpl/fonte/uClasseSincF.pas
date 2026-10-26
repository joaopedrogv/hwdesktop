unit uClasseSincF;

interface

uses
  uDataSet_OOP, ComCtrls, StdCtrls, uCupom, DBClient, IBDatabase, 
  IBQuery;

type
  TSincronizacao_NAOUSADOMAIS = class(TDataSet_OOP)
  private
    dtSetSinc: TClientDataSet;
    vCupom: TCupom;
    vCupom2: TCupom2;
    vResumoD: TResumoD;
    vDocNf: TDoc_Nao_Fiscais;
    vFormPag: TFormPG;
    vFinCupom: TFinCupom;
//    vNfSerieD:TNfSerieD;
    vRecPrest: TRecebimentoPrestacao;
    transSinc: TIBTransaction;
    vQrTemp, vQrTemp2, vQrTemp3, vQrExec: TIBQuery;
    function defineCupom: boolean;
    function defineCampos(vDtSet: TClientDataSet): boolean;
    function definirPISCOFINSTeste(progresso: TProgressBar): boolean;
    function definirPISCOFINS(progresso: TProgressBar): boolean; overload;
    function definirPISCOFINS(vItem: TClientDataSet): boolean; overload;
  public
    destructor Destroy; override;
    constructor create;
    function sincronizacao_nao_usar(parar: integer; progresso: TProgressBar): boolean;
    function sincronizacaoApenasCupom_nao_usar(parar: integer; progresso: TProgressBar): boolean;
    function ExecutaComandos(Sql: string): boolean;
  end;

implementation

uses uDtmSincF, uDtmAtivo, uDadosIni, uPrincipalF, uDadosIniFiscal,
  SysUtils, DB, uClasseDAVF, Forms, Windows;

{ TSincronizacao_NAOUSADOMAIS }

constructor TSincronizacao_NAOUSADOMAIS.create;
begin
  if dtmSincF = nil then
    dtmSincF := TdtmSincF.Create(dtmSincF);
  dataSet := TClientDataSet(dtmSincF.cdsSincF);
  dtSetSinc := TClientDataSet(dtmSincF.cdsSinc2F);
  transacao := TIBTransaction(dtmSincF.transacaoFiscal);
  buscas := TIBQuery(dtmSincF.qrBuscas);
  transSinc := TIBTransaction(dtmSincF.transacaoBancoHw);

  vQrExec := TIBQuery(dtmSincF.ibqrExec);
  vQrTemp := TIBQuery(dtmSincF.ibqrTemp);
  vQrTemp2 := TIBQuery(dtmSincF.ibqrTemp2);
  vQrTemp3 := TIBQuery(dtmSincF.ibqrTemp3);
end;

function TSincronizacao_NAOUSADOMAIS.defineCampos(vDtSet: TClientDataSet): boolean;
var
  I: Integer;
begin
  try
    dataSet.Cancel;
    dtSetSinc.Cancel;
    dataSet.FieldDefs.Clear;
    dtSetSinc.FieldDefs.Clear;
    for I := 0 to vDtSet.FieldDefs.Count - 1 do
    begin
      dataSet.FieldDefs.Add(
        vDtSet.FieldDefs[i].Name,
        vDtSet.FieldDefs[i].DataType,
        vDtSet.FieldDefs[i].Size,
        false);
//      if vDtSet.FieldDefs[i].Name <> 'ENVIADO_RET' then
//        dtSetSinc.FieldDefs.Add(
//          vDtSet.FieldDefs[i].Name,
//          vDtSet.FieldDefs[i].DataType,
//          vDtSet.FieldDefs[i].Size,
//          false);
    end;
    for I := 0 to dataSet.FieldDefs.Count - 1 do
    begin
      if dataSet.FieldDefs[i].Name = 'ENVIADO_RET' then
      begin
        Result := true;
        Exit;
      end;
    end;
    dataSet.FieldDefs.Add('ENVIADO_RET', ftString, 1, false);
    Result := True;
  except
    Result := false;
  end;
end;

function TSincronizacao_NAOUSADOMAIS.defineCupom: boolean;
var
  I: Integer;
begin
  try
    vCupom := TCupom.create;
    dataSet.Cancel;
    dtSetSinc.Cancel;
    dataSet.FieldDefs.Clear;
    dtSetSinc.FieldDefs.Clear;
    for I := 0 to vCupom.dataSet.FieldDefs.Count do
    begin
      dataSet.FieldDefs.Add(
        vCupom.dataSet.FieldDefs[i].Name,
        vCupom.dataSet.FieldDefs[i].DataType,
        vCupom.dataSet.FieldDefs[i].Size,
        false);
      dtSetSinc.FieldDefs.Add(
        vCupom.dataSet.FieldDefs[i].Name,
        vCupom.dataSet.FieldDefs[i].DataType,
        vCupom.dataSet.FieldDefs[i].Size,
        false);
    end;
    Result := True;
  except
    Result := false;
  end;
end;

function TSincronizacao_NAOUSADOMAIS.definirPISCOFINS(vItem: TClientDataSet): boolean;
var

  vValorPIS, vBasePIS: Currency;
  vValorCOFINS, vBaseCOFINS: Currency;
  vValorAcumuladoPIS: Currency;
  vValorAcumuladoCOFINS: Currency;

  vTempCSTPIS, vTempCSTCOFINS: String;
  vTempAliqPIS, vTempAliqCOFINS: Double;

begin
  vTempAliqPIS := 0;
  vTempAliqCOFINS := 0;
  vTempCSTPIS := '';
  vTempCSTCOFINS := '';

  if Trim(vTempCSTPIS) = '' then
  begin
    if vItem.FieldByName('prod_serv').AsString = 'P' then
    begin
      vQrTemp3.Close;
      vQrTemp3.SQL.Text := 'select isento_pis, cst_pis, cst_cofins,' +
        ' ALIQ_PIS_DIFERENCIADA, ALIQ_COFINS_DIFERENCIADA  from produtos' +
        ' where grupo_prod = ' + IntToStr(vItem.FieldByName('grupo_prod').AsInteger)+
        ' and cod_prod = ' + QuotedStr(Trim(vItem.FieldByName('cod_prod').AsString)) +
        ' and cod_empresa = ' + vDadosIniF.codEmpresa;
      vQrTemp3.Open;

      if Trim(vQrTemp3.FieldByName('isento_pis').AsString) = 'S' then
      begin
        vTempCSTPIS := '04';
        vTempCSTCOFINS := '04';
      end
      else
      begin
        //PIS
        if (Trim(vQrTemp3.FieldByName('cst_pis').AsString) = '01') or
          (Trim(vQrTemp3.FieldByName('cst_pis').AsString) = '') then
        begin
          vTempCSTPIS := '01';
          vTempAliqPIS := vDadosIniF.vEmp.vAliqPIS;
          vTempCSTCOFINS := '01';
          vTempAliqCOFINS := vDadosIniF.vEmp.vAliqCOFINS;
        end
        else
        begin
          vTempCSTPIS := Trim(vQrTemp3.FieldByName('cst_pis').AsString);
          vTempCSTCOFINS := Trim(vQrTemp3.FieldByName('cst_cofins').AsString);
//          if (vTempCSTPIS = '02') or (vTempCSTPIS = '03') then
          begin
            vTempAliqPIS := vQrTemp3.FieldByName('ALIQ_PIS_DIFERENCIADA').AsFloat;
            vTempAliqCOFINS := vQrTemp3.FieldByName('ALIQ_COFINS_DIFERENCIADA').AsFloat;
          end;
        end;
      end;
    end
    else if vItem.FieldByName('prod_serv').AsString = 'S' then
    begin
      vQrTemp3.Close;
      vQrTemp3.SQL.Text := 'select isento_pis, cst_pis, cst_cofins,' +
        ' 0 aliq_pis, 0 aliq_cofins  from tipo_servico' +
        ' where cod_servico = ' + IntToStr(vItem.FieldByName('grupo_prod').AsInteger);
      vQrTemp3.Open;

      if (vQrTemp3.FieldByName('isento_pis').AsString = 'S') then
      begin
        vTempCSTPIS := '04';
        vTempCSTCOFINS := '04';
        vTempAliqPIS := 0;
        vTempAliqCOFINS := 0;
      end
      else
      begin
        if (Trim(vQrTemp3.FieldByName('cst_pis').AsString) <> '') then
          vTempCSTPIS := Trim(vQrTemp3.FieldByName('cst_pis').AsString)
        else if vDadosIniF.vEmp.vAliqPIS > 0 then
          vTempCSTPIS := '01'
        else
          vTempCSTPIS := '49';

        if (vTempCSTPIS = '01') then
          vTempAliqPIS := vDadosIniF.vEmp.vAliqPIS
        else if (vTempCSTPIS = '02') or (vTempCSTPIS = '03') or
          (vTempCSTPIS = '05') or (vTempCSTPIS = '49') then
          vTempAliqPIS := vQrTemp3.FieldByName('aliq_pis').AsFloat
        else if (vTempCSTPIS = '04') or (vTempCSTPIS = '06') or
          (vTempCSTPIS = '07') or (vTempCSTPIS = '08') or
          (vTempCSTPIS = '09') then
          vTempAliqPIS := 0;

        if (Trim(vQrTemp3.FieldByName('cst_cofins').AsString) <> '') then
          vTempCSTCOFINS := Trim(vQrTemp3.FieldByName('cst_cofins').AsString)
        else if vDadosIniF.vEmp.vAliqCOFINS > 0 then
          vTempCSTCOFINS := '01'
        else
          vTempCSTCOFINS := '49';

        if (vTempCSTCOFINS = '01') then
          vTempAliqCOFINS := vDadosIniF.vEmp.vAliqCOFINS
        else if (vTempCSTCOFINS = '02') or (vTempCSTCOFINS = '03') or
          (vTempCSTCOFINS = '05') or (vTempCSTCOFINS = '49') then
          vTempAliqCOFINS := vQrTemp3.FieldByName('aliq_cofins').AsFloat
        else if (vTempCSTCOFINS = '04') or (vTempCSTCOFINS = '06') or
          (vTempCSTCOFINS = '07') or (vTempCSTCOFINS = '08') or
          (vTempCSTCOFINS = '09') then
          vTempAliqCOFINS := 0;
      end;

    end;

  end;

  vValorPIS := 0;
  vBasePIS := 0;   
  vValorCOFINS := 0;
  vBaseCOFINS := 0;
  if vTempAliqPIS > 0 then
    if (vTempCSTPIS = '01') or (vTempCSTPIS = '02') or (vTempCSTPIS = '05') or
      (vTempCSTPIS = '50') or (vTempCSTPIS = '51') or
      (vTempCSTPIS = '52') or (vTempCSTPIS = '53') or
      (vTempCSTPIS = '54') or (vTempCSTPIS = '55') or
      (vTempCSTPIS = '56') or (vTempCSTPIS = '03') then
    begin
      vBasePIS := vItem.FieldByName('total').AsFloat +
        vItem.FieldByName('rat_acres').AsFloat -
        vItem.FieldByName('rat_desc').AsFloat;         
      vBaseCOFINS := vItem.FieldByName('total').AsFloat +
        vItem.FieldByName('rat_acres').AsFloat -
        vItem.FieldByName('rat_desc').AsFloat;

      if (vTempCSTPIS = '03') then
      begin
        vBasePIS := 0;
        vValorPIS := vDadosIniF.StrToFloatFormat(vItem.FieldByName('quantidade').AsFloat * vTempAliqPIS, 2);
        vBaseCOFINS := 0;
        vValorCOFINS := vDadosIniF.StrToFloatFormat(vItem.FieldByName('quantidade').AsFloat * vTempAliqCOFINS, 2);
      end
      else
      begin
        vValorPIS := vDadosIniF.StrToFloatFormat( vBasePIS * vTempAliqPIS / 100 , 2); 
        vValorCOFINS := vDadosIniF.StrToFloatFormat( vBaseCOFINS * vTempAliqCOFINS / 100 , 2);
      end;
    end;

  vItem.FieldByName('valor_pis').AsCurrency := vValorPIS;
  vItem.FieldByName('valor_cofins').AsCurrency := vValorCOFINS;
  vItem.FieldByName('base_pis').AsCurrency := vBasePIS;
  vItem.FieldByName('base_cofins').AsCurrency := vBaseCOFINS;
  vItem.FieldByName('aliq_pis').AsCurrency := vTempAliqPIS;
  vItem.FieldByName('aliq_cofins').AsCurrency := vTempAliqCOFINS;
  vItem.FieldByName('cst_pis').AsString := vTempCSTPIS;
  vItem.FieldByName('cst_cofins').AsString := vTempCSTCOFINS;  

end;

function TSincronizacao_NAOUSADOMAIS.definirPISCOFINSTeste(progresso: TProgressBar): boolean;
var

  vValorPIS, vBasePIS: Currency;
  vValorCOFINS, vBaseCOFINS: Currency;
  vValorAcumuladoPIS: Currency;
  vValorAcumuladoCOFINS: Currency;

  vTempCSTPIS, vTempCSTCOFINS: String;
  vTempAliqPIS, vTempAliqCOFINS: Double;

begin

  try
    vDadosIniF.MensagemFiscal('Definindo PIS/COFINS dos Cupons',False);
    progresso.Position := 0;
    vQrExec.Transaction := transSinc;
    Application.ProcessMessages;

    vQrTemp.Close;
    vQrTemp.SQL.Text := 'select cp.registro, cp.cupom from cupom cp' +
      ' where cp.cod_terminal = :cod_terminal and cp.nserieecf = :nserie' +
      ' and cp.cod_empresa = :cod_empresa and cp.data >= :dataIni and cp.data <= :dataFim' +
      ' and ((cp.valor_pis is null) or (cp.valor_cofins is null)) '; //and cp.status_cp <> ''CANCELADO''';
    vQrTemp.ParamByName('dataIni').AsDate := Date;
    vQrTemp.ParamByName('dataFim').AsDate := Date;
    vQrTemp.ParamByName('cod_terminal').AsInteger := StrToInt(vDadosIniF.vCodTerminal);
    vQrTemp.ParamByName('nserie').AsString := vDadosIniF.vNumSerieEcf;
    vQrTemp.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIniF.codEmpresa);
    vQrTemp.Open;

    vQrTemp.FetchAll;

    progresso.Min := 0;
    progresso.Max := vQrTemp.RecordCount;
    progresso.Position := 0;

    vQrTemp.First;
    while not vQrTemp.Eof do
    begin
      vValorAcumuladoPIS := 0;
      vValorAcumuladoCOFINS := 0;

      Application.ProcessMessages;
      vQrTemp2.Close;
      vQrTemp2.SQL.Text :=
        'select cp2.registro, cp2.nitem, cp2.cupom, cp2.ordem, cp2.total,' +
        ' (coalesce(cp2.rat_acres,0) + coalesce(cp2.perc_acresc, 0)) rat_acres,' +
        ' (coalesce(cp2.rat_desc,0) + coalesce(cp2.perc_desc, 0)) rat_desc,' +
        ' cp2.prod_serv tipo_item, cp2.quantidade, cp2.grupo_prod, cp2.cod_prod' +
        ' from cupom2 cp2' +
        ' where cp2.cod_terminal = :cod_terminal and cp2.nserieecf = :nserie' +
        ' and cp2.cod_empresa = :cod_empresa and cp2.cupom = :cupom and cp2.ordem = :ordem';
      vQrTemp2.ParamByName('cod_terminal').AsInteger := StrToInt(vDadosIniF.vCodTerminal);
      vQrTemp2.ParamByName('nserie').AsString := vDadosIniF.vNumSerieEcf;
      vQrTemp2.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIniF.codEmpresa);
      vQrTemp2.ParamByName('cupom').AsInteger := vQrTemp.FieldByName('cupom').AsInteger;
      vQrTemp2.ParamByName('ordem').AsInteger := vQrTemp.FieldByName('registro').AsInteger;
      vQrTemp2.Open;

      vQrTemp2.First;
      while not vQrTemp2.Eof do
      begin
        vTempAliqPIS := 0;
        vTempAliqCOFINS := 0;
        vTempCSTPIS := '';
        vTempCSTCOFINS := '';

        if Trim(vTempCSTPIS) = '' then
        begin
          if vQrTemp2.FieldByName('prod_serv').AsString = 'P' then
          begin
            vQrTemp3.Close;
            vQrTemp3.SQL.Text := 'select isento_pis, cst_pis, cst_cofins,' +
              ' ALIQ_PIS_DIFERENCIADA, ALIQ_COFINS_DIFERENCIADA  from produtos' +
              ' where grupo_prod = ' + IntToStr(vQrTemp2.FieldByName('grupo_prod').AsInteger)+
              ' and cod_prod = ' + QuotedStr(Trim(vQrTemp2.FieldByName('cod_prod').AsString)) +
              ' and cod_empresa = ' + vDadosIniF.codEmpresa;
            vQrTemp3.Open;

            if Trim(vQrTemp3.FieldByName('isento_pis').AsString) = 'S' then
            begin
              vTempCSTPIS := '04';
              vTempCSTCOFINS := '04';
            end
            else
            begin
              //PIS
              if (Trim(vQrTemp3.FieldByName('cst_pis').AsString) = '01') or
                (Trim(vQrTemp3.FieldByName('cst_pis').AsString) = '') then
              begin
                vTempCSTPIS := '01';
                vTempAliqPIS := vDadosIniF.vEmp.vAliqPIS;
                vTempCSTCOFINS := '01';
                vTempAliqCOFINS := vDadosIniF.vEmp.vAliqCOFINS;
              end
              else
              begin
                vTempCSTPIS := Trim(vQrTemp3.FieldByName('cst_pis').AsString);
                vTempCSTCOFINS := Trim(vQrTemp3.FieldByName('cst_cofins').AsString);
                if (vTempCSTPIS = '02') or (vTempCSTPIS = '03') or (vTempCSTPIS = '05') then
                begin
                  vTempAliqPIS := vQrTemp3.FieldByName('ALIQ_PIS_DIFERENCIADA').AsFloat;
                  vTempAliqCOFINS := vQrTemp3.FieldByName('ALIQ_COFINS_DIFERENCIADA').AsFloat;
                end;
              end;
            end;
          end
          else if vQrTemp2.FieldByName('prod_serv').AsString = 'S' then
          begin
            vQrTemp3.Close;
            vQrTemp3.SQL.Text := 'select isento_pis, cst_pis, cst_cofins,' +
              ' 0 aliq_pis, 0 aliq_cofins  from tipo_servico' +
              ' where cod_servico = ' + IntToStr(vQrTemp2.FieldByName('grupo_prod').AsInteger);
            vQrTemp3.Open;

            if (vQrTemp3.FieldByName('isento_pis').AsString = 'S') then
            begin
              vTempCSTPIS := '04';
              vTempCSTCOFINS := '04';
              vTempAliqPIS := 0;
              vTempAliqCOFINS := 0;
            end
            else
            begin
              if (Trim(vQrTemp3.FieldByName('cst_pis').AsString) <> '') then
                vTempCSTPIS := Trim(vQrTemp3.FieldByName('cst_pis').AsString)
              else if vDadosIniF.vEmp.vAliqPIS > 0 then
                vTempCSTPIS := '01'
              else
                vTempCSTPIS := '49';

              if (vTempCSTPIS = '01') then
                vTempAliqPIS := vDadosIniF.vEmp.vAliqPIS
              else if (vTempCSTPIS = '02') or (vTempCSTPIS = '03') or
                (vTempCSTPIS = '05') or (vTempCSTPIS = '49') then
                vTempAliqPIS := vQrTemp3.FieldByName('aliq_pis').AsFloat
              else if (vTempCSTPIS = '04') or (vTempCSTPIS = '06') or
                (vTempCSTPIS = '07') or (vTempCSTPIS = '08') or
                (vTempCSTPIS = '09') then
                vTempAliqPIS := 0;

              if (Trim(vQrTemp3.FieldByName('cst_cofins').AsString) <> '') then
                vTempCSTCOFINS := Trim(vQrTemp3.FieldByName('cst_cofins').AsString)
              else if vDadosIniF.vEmp.vAliqCOFINS > 0 then
                vTempCSTCOFINS := '01'
              else
                vTempCSTCOFINS := '49';

              if (vTempCSTCOFINS = '01') then
                vTempAliqCOFINS := vDadosIniF.vEmp.vAliqCOFINS
              else if (vTempCSTCOFINS = '02') or (vTempCSTCOFINS = '03') or
                (vTempCSTCOFINS = '05') or (vTempCSTCOFINS = '49') then
                vTempAliqCOFINS := vQrTemp3.FieldByName('aliq_cofins').AsFloat
              else if (vTempCSTCOFINS = '04') or (vTempCSTCOFINS = '06') or
                (vTempCSTCOFINS = '07') or (vTempCSTCOFINS = '08') or
                (vTempCSTCOFINS = '09') then
                vTempAliqCOFINS := 0;
            end;

          end;

        end;

        vValorPIS := 0;
        vBasePIS := 0;      
        vValorCOFINS := 0;
        vBaseCOFINS := 0;
        if vTempAliqPIS > 0 then
          if (vTempCSTPIS = '01') or (vTempCSTPIS = '02') or (vTempCSTPIS = '05') or
            (vTempCSTPIS = '50') or (vTempCSTPIS = '51') or
            (vTempCSTPIS = '52') or (vTempCSTPIS = '53') or
            (vTempCSTPIS = '54') or (vTempCSTPIS = '55') or
            (vTempCSTPIS = '56') or (vTempCSTPIS = '03') then
          begin
            vBasePIS := vQrTemp2.FieldByName('total').AsFloat +
              vQrTemp2.FieldByName('rat_acres').AsFloat -
              vQrTemp2.FieldByName('rat_desc').AsFloat;
            vBaseCOFINS := vQrTemp2.FieldByName('total').AsFloat +
              vQrTemp2.FieldByName('rat_acres').AsFloat -
              vQrTemp2.FieldByName('rat_desc').AsFloat;

            if (vTempCSTPIS = '03') then
            begin
              vBasePIS := 0;
              vValorPIS := vDadosIniF.StrToFloatFormat(vQrTemp2.FieldByName('quantidade').AsFloat * vTempAliqPIS, 2);
              vBaseCOFINS := 0;
              vValorCOFINS := vDadosIniF.StrToFloatFormat(vQrTemp2.FieldByName('quantidade').AsFloat * vTempAliqCOFINS, 2);
            end
            else
            begin
              vValorPIS := vDadosIniF.StrToFloatFormat( vBasePIS * vTempAliqPIS / 100 , 2);    
              vValorCOFINS := vDadosIniF.StrToFloatFormat( vBaseCOFINS * vTempAliqCOFINS / 100 , 2);
            end;
          end;

        vQrExec.Close;
        vQrExec.SQL.Text :=
          'update cupom2 cp2 set cp2.valor_pis = :valor_pis, cp2.valor_cofins = :valor_cofins,' +
          ' base_pis = :base_pis, base_cofins = :base_cofins,' +
          ' cst_pis = :cst_pis, cst_cofins = :cst_cofins,' +
          ' aliq_pis = :aliq_pis, aliq_cofins = :aliq_cofins' +
          ' where cp2.cod_terminal = :cod_terminal and cp2.nserieecf = :nserie' +
          ' and cp2.cod_empresa = :cod_empresa and cp2.registro = :registro' +
          ' and cp2.nitem = :nitem and cp2.cupom = :cupom and cp2.ordem = :ordem';
        vQrExec.ParamByName('cod_terminal').AsInteger := StrToInt(vDadosIniF.vCodTerminal);
        vQrExec.ParamByName('nserie').AsString := vDadosIniF.vNumSerieEcf;
        vQrExec.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIniF.codEmpresa);
        vQrExec.ParamByName('registro').AsInteger := vQrTemp2.FieldByName('registro').AsInteger;
        vQrExec.ParamByName('nitem').AsInteger := vQrTemp2.FieldByName('nitem').AsInteger;
        vQrExec.ParamByName('cupom').AsInteger := vQrTemp.FieldByName('cupom').AsInteger;
        vQrExec.ParamByName('ordem').AsInteger := vQrTemp.FieldByName('registro').AsInteger;
        vQrExec.ParamByName('valor_pis').AsCurrency := vValorPIS;
        vQrExec.ParamByName('valor_cofins').AsCurrency := vValorCOFINS;

        vQrExec.ParamByName('base_pis').AsCurrency := vBasePIS;
        vQrExec.ParamByName('base_cofins').AsCurrency := vBaseCOFINS;
        vQrExec.ParamByName('aliq_pis').AsCurrency := vTempAliqPIS;
        vQrExec.ParamByName('aliq_cofins').AsCurrency := vTempAliqCOFINS;
        vQrExec.ParamByName('cst_pis').AsString := vTempCSTPIS;
        vQrExec.ParamByName('cst_cofins').AsString := vTempCSTCOFINS;
        vQrExec.Prepare;
        vQrExec.ExecSQL;

        vValorAcumuladoPIS := vValorAcumuladoPIS + vValorPIS;
        vValorAcumuladoCOFINS := vValorAcumuladoCOFINS + vValorCOFINS;

        vQrTemp2.Next;
      end;

      vQrExec.Close;
      vQrExec.SQL.Text :=
        'update cupom2 cp2 set cp2.valor_pis = 0, cp2.valor_cofins = 0,' +
        ' base_pis = 0, base_cofins = 0, cst_pis = ''49'', cst_cofins = ''49'',' +
        ' aliq_pis = 0, aliq_cofins = 0' +
        ' where cp2.cod_terminal = :cod_terminal and cp2.nserieecf = :nserie' +
        ' and cp2.cod_empresa = :cod_empresa and cp2.cupom = :cupom and cp2.ordem = :ordem'+
        ' and ((cp2.valor_pis is null) or (cp2.valor_cofins is null)) ';
      vQrExec.ParamByName('cod_terminal').AsInteger := StrToInt(vDadosIniF.codEmpresa);
      vQrExec.ParamByName('nserie').AsString := vDadosIniF.vNumSerieEcf;
      vQrExec.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIniF.codEmpresa);
      vQrExec.ParamByName('cupom').AsInteger := vQrTemp.FieldByName('cupom').AsInteger;
      vQrExec.ParamByName('ordem').AsInteger := vQrTemp.FieldByName('registro').AsInteger;
      vQrExec.Prepare;
      vQrExec.ExecSQL;

      vQrExec.Close;
      vQrExec.SQL.Text :=
        'update cupom cp set cp.valor_pis = :valor_pis, cp.valor_cofins = :valor_cofins' +
        ' where cp.cod_terminal = :cod_terminal and cp.nserieecf = :nserie' +
        ' and cp.cod_empresa = :cod_empresa and cp.registro = :registro and cp.cupom = :cupom';
      vQrExec.ParamByName('cod_terminal').AsInteger := StrToInt(vDadosIniF.codEmpresa);
      vQrExec.ParamByName('nserie').AsString := vDadosIniF.vNumSerieEcf;
      vQrExec.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIniF.codEmpresa);
      vQrExec.ParamByName('registro').AsInteger := vQrTemp.FieldByName('registro').AsInteger;
      vQrExec.ParamByName('cupom').AsInteger := vQrTemp.FieldByName('cupom').AsInteger;
      vQrExec.ParamByName('valor_pis').AsCurrency := vValorAcumuladoPIS;
      vQrExec.ParamByName('valor_cofins').AsCurrency := vValorAcumuladoCOFINS;
      vQrExec.Prepare;
      vQrExec.ExecSQL;

      vQrTemp.Next;
      progresso.Position := progresso.Position + 1;
    end;

    if vQrExec.Transaction.InTransaction then
      vQrExec.Transaction.Commit;

  except
    if vQrExec.Transaction.InTransaction then
      vQrExec.Transaction.Rollback;
  end;
end;

function TSincronizacao_NAOUSADOMAIS.definirPISCOFINS(progresso: TProgressBar): boolean;
var

  vValorPIS, vBasePIS: Currency;
  vValorCOFINS, vBaseCOFINS: Currency;
  vValorAcumuladoPIS: Currency;
  vValorAcumuladoCOFINS: Currency;

  vTempCSTPIS, vTempCSTCOFINS: String;
  vTempAliqPIS, vTempAliqCOFINS: Double;

begin

  try
    vDadosIniF.MensagemFiscal('Definindo PIS/COFINS dos Cupons',False);
    progresso.Position := 0;
    Application.ProcessMessages;

    dtSetSinc.close;
    dtSetSinc.CommandText := 'select * from cupom cp' +
      ' where cp.cod_terminal = ' + vDadosIniF.vCodTerminal +
      ' and cp.nserieecf = ' + QuotedStr(vDadosIniF.vNumSerieEcf) +
      ' and cp.cod_empresa = ' + vDadosIniF.codEmpresa +
      ' and cp.data >= :dataIni and cp.data <= :dataFim' +
      ' and ((cp.valor_pis is null) or (cp.valor_cofins is null)) ';
    dtSetSinc.Params[0].AsDate := date;
    dtSetSinc.Params[1].AsDate := date;
    dtSetSinc.Open;

    progresso.Min := 0;
    progresso.Max := dtSetSinc.RecordCount;
    progresso.Position := 0;

    dtSetSinc.First;
    while not dtSetSinc.Eof do
    begin

      Application.ProcessMessages;
      vQrTemp2.Close;
      vQrTemp2.SQL.Text :=
        'select sum(cp2.valor_pis) valor_pis, sum(cp2.valor_cofins) valor_cofins from cupom2 cp2' +
        ' where cp2.cod_terminal = :cod_terminal and cp2.nserieecf = :nserie' +
        ' and cp2.cod_empresa = :cod_empresa and cp2.cupom = :cupom and cp2.ordem = :ordem';
      vQrTemp2.ParamByName('cod_terminal').AsInteger := StrToInt(vDadosIniF.vCodTerminal);
      vQrTemp2.ParamByName('nserie').AsString := vDadosIniF.vNumSerieEcf;
      vQrTemp2.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIniF.codEmpresa);
      vQrTemp2.ParamByName('cupom').AsInteger := dtSetSinc.FieldByName('cupom').AsInteger;
      vQrTemp2.ParamByName('ordem').AsInteger := dtSetSinc.FieldByName('registro').AsInteger;
      vQrTemp2.Open;

      dtSetSinc.Edit;
      dtSetSinc.FieldByName('valor_pis').AsCurrency := vQrTemp2.FieldByName('valor_pis').AsFloat;
      dtSetSinc.FieldByName('valor_cofins').AsCurrency := vQrTemp2.FieldByName('valor_cofins').AsFloat;
      dtSetSinc.Post;
      dtSetSinc.ApplyUpdates(-1);

      dtSetSinc.Next;
      progresso.Position := progresso.Position + 1;
    end;

    if transSinc.InTransaction then
      transSinc.Commit;

  except
    if transSinc.InTransaction then
      transSinc.Rollback;
  end;
end;

destructor TSincronizacao_NAOUSADOMAIS.Destroy;
begin
  dtSetSinc.Free;
  dtSetSinc := nil;
  inherited;
end;

function TSincronizacao_NAOUSADOMAIS.ExecutaComandos(Sql: string): boolean;
begin
  try
    dtSetSinc.close;
    dtSetSinc.CommandText := Sql;
    dtSetSinc.Open;
    if dtSetSinc.IsEmpty then
      Result := false
    else
      Result := true;
  except
    on E: Exception do
    begin
      result := false;
      registraErro('E0006 ' + e.Message + ' ' + Sql);
    end;
  end;
end;

function TSincronizacao_NAOUSADOMAIS.sincronizacao_nao_usar(parar: integer; progresso: TProgressBar): boolean;
var
  I: Integer;
  temp: string;
  vVendaRet: TDAVF;
  vCooRed: Integer;
  buscas2: TIBQuery;
  vPos: Integer;
begin
  Result := false;
  if vDadosIniF.bancoConectado = 'local' then
    exit;
  
  // Testando conexao para conectar;
//  if not dtmAtivo.bancoHw.Connected then
  vDadosIniF.conectaBanco(dtmAtivo.bancoHw, vDadosIniF.vBancoHW, false);

  if dtmAtivo.bancoHw.Connected then
  begin
    if dtmAtivo.bancoHw.DatabaseName <> vDadosInif.vBancoHW then
      Exit;
  end;
  vDadosIniF.MensagemFiscal('Sincronização! Cupons...',False);
  //Sincronizaondo Cupons
  if vCupom = nil then
    vCupom := TCupom.create;
  defineCampos(vCupom.dataSet);
  dtSetSinc.FieldDefs.Add('MD5', ftString, 256, False);
  montaSelect('select * from cupom where cod_terminal = ' + vDadosIniF.vCodTerminal +
    ' and nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)) +
    ' and cod_empresa = ' + vDadosIniF.codEmpresa +
    ' and (enviado_ret <> ''S'' or enviado_ret is null)');
  if not dataSet.IsEmpty then
  begin
    progresso.Position := 0;
    progresso.Min := 0;
    progresso.Max := dataSet.RecordCount;

    try
      while not dataSet.Eof do
      begin
        Application.ProcessMessages;
        if ExecutaComandos('select * from cupom where cod_terminal = ' + vDadosIniF.vCodTerminal +
          ' and nserieecf = ''' + vDadosIniF.vNumSerieEcf +
          ''' and cod_empresa = ' + vDadosIniF.codEmpresa +
          ' and registro = ' + dataSet.FieldByName('registro').AsString +
          ' and cupom = ' + dataSet.FieldByName('cupom').AsString) then
          dtSetSinc.Edit
        else
          dtSetSinc.Insert;
        for I := 0 to dataSet.FieldCount - 1 do
          if dataSet.Fields[i].FieldName <> 'ENVIADO_RET' then
            dtSetSinc.FieldByName(dataSet.Fields[i].FieldName).AsString :=
              dataSet.FieldByName(dataSet.Fields[i].FieldName).AsString;
        dtSetSinc.FieldByName('nserieecf').AsString :=
          vDadosIniF.decodifica(dtSetSinc.FieldByName('nserieecf').AsString);
        dtSetSinc.FieldByName('MD5').AsString := 'SISTEMA';
        dtSetSinc.Post;
        dtSetSinc.ApplyUpdates(0);
        if dataSet.FieldByName('prevenda').AsInteger = 0 then
        else
        begin
          vVendaRet := TDAVF.create;
          if vDadosIniF.bancoConectado <> 'local' then
          try
            vVendaRet.apagarVendasRetaguarda := 'N';
//            vVendaRet.sincronizaDAVNoRet(dataSet.FieldByName('cupom').AsInteger,
//            dataSet.FieldByName('registro').AsInteger,
//            dataSet.FieldByName('prevenda').AsInteger,
//              vDadosIniF.MensagemFiscal('Aguarde! Atualizando DAV no Retaguarda', true));
          finally
            vDadosIniF.limpaMensagem;
          end;
        end;

        progresso.Position := progresso.Position + 1;
        try
          dataSet.Edit;
          dataSet.FieldByName('enviado_ret').AsString := 'S';
          dataSet.Post;
        except
          dataSet.Cancel;
        end;
        dataSet.Next;
      end;
    except
      on e:exception do
      begin
        Application.MessageBox(pchar('Erro de sincronização. Tabela CUPOM.'+#13+'Erro: '+e.Message),'Atenção',MB_OK + MB_ICONERROR);
        Exit;
      end;
    end;
    try
      //      if dtSetSinc.ApplyUpdates(0) = 0 then
      begin
        if transSinc.InTransaction then
          transSinc.Commit;

//        buscas2:= TIBQuery(dtmSincF.qrBuscas2);
//        dataSet.First;
//        while not dataSet.Eof do
//        begin
//          vMD5Func._gravaMD5_Cupom( buscas2,
//            dataSet.FieldByName('cupom').AsInteger,
//            dataSet.FieldByName('COD_TERMINAL').AsInteger,
//            dataSet.FieldByName('registro').AsInteger,
//            vDadosIni.decodifica(dataSet.FieldByName('nserieecf').AsString)
//          );
//          dataSet.Next;
//        end;

        Result := true;
        transSinc.StartTransaction;
      end;
    except
      on e:exception do
      begin
        transSinc.Rollback;
        Application.MessageBox(pchar('Erro de sincronização. Transação CUPOM.'+#13+'Erro: '+e.Message),'Atenção',MB_OK + MB_ICONERROR);
      end;
    end;
    try
      if Apply then
        if CommitaTransacao then
          Result := true;
      IniciaTransacao;
    except
      RollBackTransacao;
    end;
  end;
  //Itens do Cupom
  vDadosIniF.MensagemFiscal('Sincronização! Itens dos Cupons...',False);
  if vCupom2 = nil then
    vCupom2 := TCupom2.create;
  defineCampos(vCupom2.dataSet);
  dtSetSinc.FieldDefs.Add( 'VALOR_PIS', ftFloat, 0, False);
  dtSetSinc.FieldDefs.Add( 'VALOR_COFINS', ftFloat, 0, False);
  dtSetSinc.FieldDefs.Add( 'BASE_PIS', ftFloat, 0, False);
  dtSetSinc.FieldDefs.Add( 'BASE_COFINS', ftFloat, 0, False);
  dtSetSinc.FieldDefs.Add( 'ALIQ_PIS', ftFloat, 0, False);
  dtSetSinc.FieldDefs.Add( 'ALIQ_COFINS', ftFloat, 0, False);
  dtSetSinc.FieldDefs.Add( 'CST_PIS', ftString, 2, False);
  dtSetSinc.FieldDefs.Add( 'CST_COFINS', ftString, 2, False);
  dtSetSinc.FieldDefs.Add('MD5', ftString, 256, False);

  montaSelect('select * from cupom2 where cod_terminal = ' + vDadosIniF.vCodTerminal +
    ' and nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)) +
    ' and cod_empresa = ' + vDadosIniF.codEmpresa +
    ' and (enviado_ret <> ''S'' or enviado_ret is null)');
  if not dataSet.IsEmpty then
  begin
    progresso.Position := 0;
    progresso.Min := 0;
    progresso.Max := dataSet.RecordCount;
    vPos:= 0;
    try
      while not dataSet.Eof do
      begin
        Application.ProcessMessages;
        if ExecutaComandos('select * from cupom2 where cod_terminal = ' + vDadosIniF.vCodTerminal +
          ' and nserieecf = ''' + vDadosIniF.vNumSerieEcf +
          ''' and cod_empresa = ' + vDadosIniF.codEmpresa +
          ' and registro = ' + dataSet.FieldByName('registro').AsString +
          ' and ordem = ' + dataSet.FieldByName('ordem').AsString +
          ' and cupom = ' + dataSet.FieldByName('cupom').AsString) then
          dtSetSinc.Edit
        else
          dtSetSinc.Insert;
        for I := 0 to dataSet.FieldCount - 1 do
          if dataSet.Fields[i].FieldName <> 'ENVIADO_RET' then
            dtSetSinc.FieldByName(dataSet.Fields[i].FieldName).AsString :=
              dataSet.FieldByName(dataSet.Fields[i].FieldName).AsString;
        dtSetSinc.FieldByName('nserieecf').AsString :=
          vDadosIniF.decodifica(dtSetSinc.FieldByName('nserieecf').AsString);
        dtSetSinc.FieldByName('MD5').AsString := 'SISTEMA';

        definirPISCOFINS(dtSetSinc);
        
        dtSetSinc.Post;
        dtSetSinc.ApplyUpdates(0);
        vpos := vpos + 1;
        progresso.Position := vpos;
        try
          dataSet.Edit;
          dataSet.FieldByName('enviado_ret').AsString := 'S';
          dataSet.Post;
        except
          dataSet.Cancel;
        end;
        dataSet.Next;
      end;
    except
      on e:exception do
      begin
        Application.MessageBox(pchar('Erro de sincronização. Tabela CUPOM2.'+#13+'Erro: '+e.Message),'Atenção',MB_OK + MB_ICONERROR);
        Exit;
      end;
    end;
    try
      //      if dtSetSinc.ApplyUpdates(0) = 0 then
      begin
        if transSinc.InTransaction then
          transSinc.Commit;

//        buscas2:= TIBQuery(dtmSincF.qrBuscas2);
//        dataSet.First;
//        while not dataSet.Eof do
//        begin
//          vMD5Func._gravaMD5_Cupom2( buscas2,
//            dataSet.FieldByName('cod_terminal').AsInteger,
//            dataSet.FieldByName('registro').AsInteger,
//            dataSet.FieldByName('nitem').AsInteger,
//            dataSet.FieldByName('cupom').AsInteger,
//            dataSet.FieldByName('ordem').AsInteger,
//            vDadosIni.decodifica(dataSet.FieldByName('nserieecf').AsString)
//          );
//          dataSet.Next;
//        end;

        Result := true;
        transSinc.StartTransaction;
      end;
    except
      on e:exception do
      begin
        transSinc.Rollback;
        Application.MessageBox(pchar('Erro de sincronização. Transação CUPOM2.'+#13+'Erro: '+e.Message),'Atenção',MB_OK + MB_ICONERROR);
      end;
    end;
    try
      if Apply then
        if CommitaTransacao then
          Result := true;
      IniciaTransacao;
    except
      RollBackTransacao;
    end;
  end;
  //Fim Sincronizando Cupons

  // Definindo PIS/COFINS dos Cupons
  definirPISCOFINS(progresso);
//  definirPISCOFINSCuponsPorPeriodoPorECF(
//    pchar(vDadosIniF.codEmpresa),
//    pchar(vDadosIniF.vBancoHW),
//    pchar(DateToStr(Date)),
//    pchar(DateToStr(Date)),
//    pchar(vDadosIniF.vNumSerieEcf),
//    pchar(vDadosIniF.vCodTerminal));

  //Sincronizando Resumo D
  vDadosIniF.MensagemFiscal('Sincronização! Resumo Diário...',False);
  if vResumoD = nil then
    vResumoD := TResumoD.create;
  defineCampos(vResumoD.dataSet);
  dtSetSinc.FieldDefs.Add('MD5', ftString, 256, False);
  montaSelect('select * from resumod where cod_empresa = ' + vDadosIniF.codEmpresa +
    ' and nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)) +
    ' and cod_terminal = ' + vDadosIniF.vCodTerminal +
    ' and cod_empresa = ' + vDadosIniF.codEmpresa +
    ' and (enviado_ret <> ''S'' or enviado_ret is null)');
  if not dataSet.IsEmpty then
  begin
    progresso.Position := 0;
    progresso.Min := 0;
    progresso.Max := dataSet.RecordCount;
    try
      while not dataSet.Eof do
      begin
        Application.ProcessMessages;
        if ExecutaComandos('select * from resumod where cod_empresa = ' + vDadosIniF.codEmpresa +
          ' and nserieecf = ' + QuotedStr((vDadosIniF.vNumSerieEcf)) +
          ' and cod_terminal = ' + vDadosIniF.vCodTerminal +
          ' and cod_empresa = ' + vDadosIniF.codEmpresa +
          ' and coored = ' + dataSet.FieldByName('coored').AsString) then
          dtSetSinc.Edit
        else
          dtSetSinc.Insert;
        for I := 0 to dataSet.FieldCount - 1 do
          if dataSet.Fields[i].FieldName <> 'ENVIADO_RET' then
            dtSetSinc.FieldByName(dataSet.Fields[i].FieldName).AsString :=
              dataSet.FieldByName(dataSet.Fields[i].FieldName).AsString;
        dtSetSinc.FieldByName('nserieecf').AsString :=
          vDadosIniF.decodifica(dtSetSinc.FieldByName('nserieecf').AsString);
        dtSetSinc.FieldByName('MD5').AsString := 'SISTEMA';
        dtSetSinc.Post;
        dtSetSinc.ApplyUpdates(0);
        progresso.Position := progresso.Position + 1;
        try
          dataSet.Edit;
          dataSet.FieldByName('enviado_ret').AsString := 'S';
          dataSet.Post;
        except
          dataSet.Cancel;
        end;
        dataSet.Next;
      end;
    except
      on e:exception do
      begin
        Application.MessageBox(pchar('Erro de sincronização. Tabela RESUMOD.'+#13+'Erro: '+e.Message),'Atenção',MB_OK + MB_ICONERROR);
        Exit;
      end;
    end;
    try
      //      if dtSetSinc.ApplyUpdates(0) = 0 then
      begin
        if transSinc.InTransaction then
          transSinc.Commit;
        buscas2:= TIBQuery(dtmSincF.qrBuscas2);
        dataSet.First;
        while not dataSet.Eof do
        begin
//          vMD5Func._gravaMD5_ReducaoZ( buscas2,
//            dataSet.FieldByName('coored').AsInteger,
//            dataSet.FieldByName('cod_terminal').AsInteger,
//            vDadosIniF.decodifica(dataSet.FieldByName('nserieecf').AsString),
//            dataSet.FieldByName('data_mov').AsString
//          );
          dataSet.Next;
        end;
        
        Result := true;
        transSinc.StartTransaction;
      end;
    except
      on e:exception do
      begin
        transSinc.Rollback;
        Application.MessageBox(pchar('Erro de sincronização. Transação RESUMOD.'+#13+'Erro: '+e.Message),'Atenção',MB_OK + MB_ICONERROR);
      end;
    end;
    try
      if Apply then
        if CommitaTransacao then
          Result := true;
      IniciaTransacao;
    except
      RollBackTransacao;
    end;
  end;
  //Fim

  //Sincronizando Mapa Resumo
  vDadosIniF.MensagemFiscal('Sincronização! Mapa Resumo...',False);
  if vResumoD.mpRes = nil then
    vResumoD.mpRes := TMapaResumo.create;
  defineCampos(vResumoD.mpRes.dataSet);
  dtSetSinc.FieldDefs.Add('MD5', ftString, 256, False);
  montaSelect('SELECT * FROM MAPA_RESUMO_ALIQ WHERE COD_TERMINAL = ' +
    vDadosIniF.vCodTerminal + ' AND COD_EMPRESA = ' + vDadosIniF.codEmpresa + ' AND NSERIEECF = ' +
    QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)) +
    ' and (enviado_ret <> ''S'' or enviado_ret is null) order by coored');
  if not dataSet.IsEmpty then
  begin
    vCooRed := 0;
    buscas2:= TIBQuery(dtmSincF.qrBuscas2);
    progresso.Position := 0;
    progresso.Min := 0;
    progresso.Max := dataSet.RecordCount;
    TRY
      while not dataSet.Eof do
      begin
        Application.ProcessMessages;
        if (vCooRed <> dataSet.FieldByName('coored').AsInteger) then
        begin
          buscas2.Close;
          buscas2.SQL.Text := 'delete from mapa_resumo_aliq '+
            ' where cod_empresa = ' + vDadosIniF.codEmpresa +
            ' and nserieecf = ' + QuotedStr(vDadosIniF.vNumSerieEcf) +
            ' and cod_terminal = ' + vDadosIniF.vCodTerminal +
            ' and coored = '+IntToStr(dataSet.FieldByName('coored').AsInteger);
          buscas2.ExecSQL;
        end;

        if ExecutaComandos('SELECT * FROM MAPA_RESUMO_ALIQ WHERE COD_TERMINAL = ' +
          vDadosIniF.vCodTerminal + ' AND COD_EMPRESA = ' + vDadosIniF.codEmpresa +
          ' AND NSERIEECF = ' + QuotedStr((vDadosIniF.vNumSerieEcf)) +
          ' and coored = ' + dataSet.FieldByName('coored').AsString +
          ' and aliq_seq = ' + dataSet.FieldByName('aliq_seq').AsString) then
          dtSetSinc.Edit
        else
          dtSetSinc.Insert;
        for I := 0 to dataSet.FieldCount - 1 do
          if dataSet.Fields[i].FieldName <> 'ENVIADO_RET' then
            dtSetSinc.FieldByName(dataSet.Fields[i].FieldName).AsString :=
              dataSet.FieldByName(dataSet.Fields[i].FieldName).AsString;
        dtSetSinc.FieldByName('nserieecf').AsString :=
          vDadosIniF.decodifica(dtSetSinc.FieldByName('nserieecf').AsString);
        dtSetSinc.FieldByName('MD5').AsString := 'SISTEMA';
        dtSetSinc.Post;
        dtSetSinc.ApplyUpdates(0);
        progresso.Position := progresso.Position + 1;
        try
          dataSet.Edit;
          dataSet.FieldByName('enviado_ret').AsString := 'S';
          dataSet.Post;
        except
          dataSet.Cancel;
        end;
        vCooRed := dataSet.FieldByName('coored').AsInteger;
        dataSet.Next;
      end;
    except
      on e:exception do
      begin
        Application.MessageBox(pchar('Erro de sincronização. Tabela MAPA_RESUMO_ALIQ.'+#13+'Erro: '+e.Message),'Atenção',MB_OK + MB_ICONERROR);
        Exit;
      end;
    end;
    try
      //      if dtSetSinc.ApplyUpdates(0) = 0 then
      begin
        if transSinc.InTransaction then
          transSinc.Commit;

//        buscas2:= TIBQuery(dtmSincF.qrBuscas2);
//        dataSet.First;
//        while not dataSet.Eof do
//        begin
//          vMD5Func._gravaMD5_DetalhesReducaoZ( buscas2,
//            dataSet.FieldByName('coored').AsInteger,
//            dataSet.FieldByName('cod_terminal').AsInteger,
//            vDadosIniF.decodifica(dataSet.FieldByName('nserieecf').AsString),
//            dataSet.FieldByName('descaliq').AsString
//          );
//          dataSet.Next;
//        end;

        Result := true;
        transSinc.StartTransaction;
      end;
    except
      on e:exception do
      begin
        transSinc.Rollback;
        Application.MessageBox(pchar('Erro de sincronização. Transação MAPA_RESUMO_ALIQ.'+#13+'Erro: '+e.Message),'Atenção',MB_OK + MB_ICONERROR);
      end;
    end;
    try
      if Apply then
        if CommitaTransacao then
          Result := true;
      IniciaTransacao;
    except
      RollBackTransacao;
    end;
  end;
  //Fim

  //Sincronizando DocNaoFiscais
  vDadosIniF.MensagemFiscal('Sincronização! Outros Documentos...',False);
  if vDocNf = nil then
    vDocNf := TDoc_Nao_Fiscais.create;
  defineCampos(vDocNf.dataSet);
  dtSetSinc.FieldDefs.Add('MD5', ftString, 256, False);
  montaSelect('select * from DOC_NAOFISCAL_TERMINAL where cod_terminal = ' + vDadosIniF.vCodTerminal
    +
    ' and nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)) +
    ' and cod_empresa = ' + vDadosIniF.codEmpresa +
    ' and (enviado_ret <> ''S'' or enviado_ret is null)');
  if not dataSet.IsEmpty then
  begin
    progresso.Position := 0;
    progresso.Min := 0;
    progresso.Max := dataSet.RecordCount;
    TRY
      while not dataSet.Eof do
      begin
        Application.ProcessMessages;
        if ExecutaComandos('select * from DOC_NAOFISCAL_TERMINAL where cod_terminal = ' +
          vDadosIniF.vCodTerminal +
          ' and nserieecf = ' + QuotedStr((vDadosIniF.vNumSerieEcf)) +
          ' and cod_empresa = ' + vDadosIniF.codEmpresa +
          ' and coo_ecf = ' + dataSet.FieldByName('coo_ecf').AsString) then
          dtSetSinc.Edit
        else
          dtSetSinc.Insert;
        for I := 0 to dataSet.FieldCount - 1 do
          if dataSet.Fields[i].FieldName <> 'ENVIADO_RET' then
            dtSetSinc.FieldByName(dataSet.Fields[i].FieldName).AsString :=
              dataSet.FieldByName(dataSet.Fields[i].FieldName).AsString;
        dtSetSinc.FieldByName('nserieecf').AsString :=
          vDadosIniF.decodifica(dtSetSinc.FieldByName('nserieecf').AsString);
        dtSetSinc.FieldByName('MD5').AsString := 'SISTEMA';
        dtSetSinc.Post;
        dtSetSinc.ApplyUpdates(0);
        progresso.Position := progresso.Position + 1;
        try
          dataSet.Edit;
          dataSet.FieldByName('enviado_ret').AsString := 'S';
          dataSet.Post;
        except
          dataSet.Cancel;
        end;
        dataSet.Next;
      end;
    except
      on e:exception do
      begin
        Application.MessageBox(pchar('Erro de sincronização. Tabela DOC_NAOFISCAL_TERMINAL.'+#13+'Erro: '+e.Message),'Atenção',MB_OK + MB_ICONERROR);
        Exit;
      end;
    end;
    try
      //      if dtSetSinc.ApplyUpdates(0) = 0 then
      begin
        if transSinc.InTransaction then
          transSinc.Commit;

//        buscas2:= TIBQuery(dtmSincF.qrBuscas2);
//        dataSet.First;
//        while not dataSet.Eof do
//        begin
//          vMD5Func._gravaMD5_DocNaoFiscal( buscas2,
//            dataSet.FieldByName('coo_ecf').AsInteger,
//            dataSet.FieldByName('cod_terminal').AsInteger,
//            vDadosIni.decodifica(dataSet.FieldByName('nserieecf').AsString)
//          );
//          dataSet.Next;
//        end;

        Result := true;
        transSinc.StartTransaction;
      end;
    except
      on e:exception do
      begin
        transSinc.Rollback;
        Application.MessageBox(pchar('Erro de sincronização. Transação DOC_NAOFISCAL_TERMINAL.'+#13+'Erro: '+e.Message),'Atenção',MB_OK + MB_ICONERROR);
      end;
    end;
    try
      if Apply then
        if CommitaTransacao then
          Result := true;
      IniciaTransacao;
    except
      RollBackTransacao;
    end;
  end;
  //Fim

  //Sincronizando Finalizadores do Cupom
  vDadosIniF.MensagemFiscal('Sincronização! Pagamentos Finalizados...',False);
  if vFinCupom = nil then
    vFinCupom := TFinCupom.create;
  defineCampos(vFinCupom.dataSet);
  dtSetSinc.FieldDefs.Add('MD5', ftString, 256, False);
  montaSelect('select * from fincupom where cod_terminal = ' + vDadosIniF.vCodTerminal +
    ' and nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)) +
    ' and cod_empresa = ' + vDadosIniF.codEmpresa +
    ' and (enviado_ret <> ''S'' or enviado_ret is null)');
  if not dataSet.IsEmpty then
  begin
    progresso.Position := 0;
    progresso.Min := 0;
    progresso.Max := dataSet.RecordCount;
    TRY
      while not dataSet.Eof do
      begin
        Application.ProcessMessages;
        if ExecutaComandos('select * from fincupom where cod_terminal = ' + vDadosIniF.vCodTerminal +
          ' and nserieecf = ' + QuotedStr((vDadosIniF.vNumSerieEcf)) +
          ' and cod_empresa = ' + vDadosIniF.codEmpresa +
          ' and registro = ' + dataSet.FieldByName('registro').AsString +
          ' and tipo_doc = ' + QuotedStr(dataSet.FieldByName('tipo_doc').AsString)) then
          dtSetSinc.Edit
        else
          dtSetSinc.Insert;
        for I := 0 to dataSet.FieldCount - 1 do
          if dataSet.Fields[i].FieldName <> 'ENVIADO_RET' then
            dtSetSinc.FieldByName(dataSet.Fields[i].FieldName).AsString :=
              dataSet.FieldByName(dataSet.Fields[i].FieldName).AsString;
        dtSetSinc.FieldByName('nserieecf').AsString :=
          vDadosIniF.decodifica(dtSetSinc.FieldByName('nserieecf').AsString);
        dtSetSinc.FieldByName('MD5').AsString := 'SISTEMA';
        dtSetSinc.Post;
        dtSetSinc.ApplyUpdates(0);
        progresso.Position := progresso.Position + 1;
        try
          dataSet.Edit;
          dataSet.FieldByName('enviado_ret').AsString := 'S';
          dataSet.Post;
        except
          dataSet.Cancel;
        end;
        dataSet.Next;
      end;
    except
      on e:exception do
      begin
        Application.MessageBox(pchar('Erro de sincronização. Tabela FINCUPOM.'+#13+'Erro: '+e.Message),'Atenção',MB_OK + MB_ICONERROR);
        Exit;
      end;
    end;
    try
      //      if dtSetSinc.ApplyUpdates(0) = 0 then
      begin
        if transSinc.InTransaction then
          transSinc.Commit;

//        buscas2:= TIBQuery(dtmSincF.qrBuscas2);
//        dataSet.First;
//        while not dataSet.Eof do
//        begin
//          vMD5Func._gravaMD5_FinCupom( buscas2,
//            dataSet.FieldByName('registro').AsInteger,
//            dataSet.FieldByName('cod_terminal').AsInteger,
//            vDadosIni.decodifica(dataSet.FieldByName('nserieecf').AsString)
//          );
//          dataSet.Next;
//        end;

        Result := true;
        transSinc.StartTransaction;
      end;
    except
      on e:exception do
      begin
        transSinc.Rollback;
        Application.MessageBox(pchar('Erro de sincronização. Transação FINCUPOM.'+#13+'Erro: '+e.Message),'Atenção',MB_OK + MB_ICONERROR);
      end;
    end;
    try
      if Apply then
        if CommitaTransacao then
          Result := true;
      IniciaTransacao;
    except
      RollBackTransacao;
    end;
  end;
  //Fim

  //Sincronizando Formas de Pagamento do Cupom
  vDadosIniF.MensagemFiscal('Sincronização! Formas de Pagamento...',False);
  if vFormPag = nil then
    vFormPag := TFormPG.create;
  defineCampos(vFormPag.dataSet);
  montaSelect('select * from formpagamento where cod_terminal = ' + vDadosIniF.vCodTerminal +
    ' and nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)) +
    ' and cod_empresa = ' + vDadosIniF.codEmpresa +
    ' and (enviado_ret <> ''S'' or enviado_ret is null)');
  if not dataSet.IsEmpty then
  begin
    progresso.Position := 0;
    progresso.Min := 0;
    progresso.Max := dataSet.RecordCount;
    TRY
      while not dataSet.Eof do
      begin
        Application.ProcessMessages;
        temp:='';
        if Trim(dataSet.FieldByName('ndoc').AsString) <> '' then
          temp := ' and NDOC = ' + QuotedStr(trim(dataSet.FieldByName('NDOC').AsString));
        if ExecutaComandos('select * from formpagamento where cod_terminal = ' + vDadosIniF.vCodTerminal +
          ' and nserieecf = ' + QuotedStr(vDadosIniF.vNumSerieEcf) +
          ' and cod_empresa = ' + vDadosIniF.codEmpresa +
          ' and registro = ' + dataSet.FieldByName('registro').AsString +
          ' and ncoo_ecf = ' + dataSet.FieldByName('ncoo_ecf').AsString +
          ' and tipdoc = ' + QuotedStr(trim(dataSet.FieldByName('tipdoc').AsString)) + temp +
          ' and secao = ' + dataSet.FieldByName('secao').AsString)  then
          dtSetSinc.Edit
        else
          dtSetSinc.Insert;
        for I := 0 to dataSet.FieldCount - 1 do
          if dataSet.Fields[i].FieldName <> 'ENVIADO_RET' then
            dtSetSinc.FieldByName(dataSet.Fields[i].FieldName).AsString :=
              dataSet.FieldByName(dataSet.Fields[i].FieldName).AsString;
        dtSetSinc.FieldByName('nserieecf').AsString :=
          vDadosIniF.decodifica(dtSetSinc.FieldByName('nserieecf').AsString);
        dtSetSinc.FieldByName('MD5').AsString := 'SISTEMA';
        dtSetSinc.Post;
        dtSetSinc.ApplyUpdates(0);
        progresso.Position := progresso.Position + 1;
        try
          dataSet.Edit;
          dataSet.FieldByName('enviado_ret').AsString := 'S';
          dataSet.Post;
        except
          dataSet.Cancel;
        end;
        dataSet.Next;
      end;
    except
      on e:exception do
      begin
        Application.MessageBox(pchar('Erro de sincronização. Tabela FORMPAGAMENTO.'+#13+'Erro: '+e.Message),'Atenção',MB_OK + MB_ICONERROR);
        Exit;
      end;
    end;
    try
      //      if dtSetSinc.ApplyUpdates(0) = 0 then
      begin
        if transSinc.InTransaction then
          transSinc.Commit;
        Result := true;
        transSinc.StartTransaction;
      end;
    except
      on e:exception do
      begin
        transSinc.Rollback;
        Application.MessageBox(pchar('Erro de sincronização. Transação FORMPAGAMENTO.'+#13+'Erro: '+e.Message),'Atenção',MB_OK + MB_ICONERROR);
      end;
    end;
    try
      if Apply then
        if CommitaTransacao then
          Result := true;
      IniciaTransacao;
    except
      RollBackTransacao;
    end;
  end;
  //Fim Formas de Pagamento

  vDadosIniF.MensagemFiscal('Sincronização! Ordem, Série Sub-Série...',False);
  //Sincronizaondo NF Serie D
//  if vNfSerieD = nil then
//    vNfSerieD := TNfSerieD.create;
//  defineCampos(vNfSerieD.dataSet);
  montaSelect('select * from nf_serie_d where '+
    ' cod_empresa = ' + vDadosIniF.codEmpresa +
    ' and (enviado_ret <> ''S'' or enviado_ret is null)');
  if not dataSet.IsEmpty then
  begin
    progresso.Position := 0;
    progresso.Min := 0;
    progresso.Max := dataSet.RecordCount;
    TRY
      while not dataSet.Eof do
      begin
        Application.ProcessMessages;
        if ExecutaComandos('select * from nf_serie_d where cod_empresa = ' +
         vDadosIniF.codEmpresa + ' and numeronota = ' +
          dataSet.FieldByName('numeronota').AsString) then
          dtSetSinc.Edit
        else
          dtSetSinc.Insert;
        for I := 0 to dataSet.FieldCount - 1 do
          if dataSet.Fields[i].FieldName <> 'ENVIADO_RET' then
            try
              dtSetSinc.FieldByName(dataSet.Fields[i].FieldName).AsString :=
                dataSet.FieldByName(dataSet.Fields[i].FieldName).AsString;
            except
            end;
        dtSetSinc.Post;
        dtSetSinc.ApplyUpdates(0);
        progresso.Position := progresso.Position + 1;
        try
          dataSet.Edit;
          dataSet.FieldByName('enviado_ret').AsString := 'S';
          dataSet.Post;
        except
          dataSet.Cancel;
        end;
        dataSet.Next;
      end;
    except
      on e:exception do
      begin
        Application.MessageBox(pchar('Erro de sincronização. Tabela NF_SERIE_D.'+#13+'Erro: '+e.Message),'Atenção',MB_OK + MB_ICONERROR);
        Exit;
      end;
    end;
    try
      //      if dtSetSinc.ApplyUpdates(0) = 0 then
      begin
        if transSinc.InTransaction then
          transSinc.Commit;
        Result := true;
        transSinc.StartTransaction;
      end;
    except
      on e:exception do
      begin
        transSinc.Rollback;
        Application.MessageBox(pchar('Erro de sincronização. Transação NF_SERIE_D.'+#13+'Erro: '+e.Message),'Atenção',MB_OK + MB_ICONERROR);
      end;
    end;
    try
      if Apply then
        if CommitaTransacao then
          Result := true;
      IniciaTransacao;
    except
      RollBackTransacao;
    end;
  end;
  //Itens do Cupom
  vDadosIniF.MensagemFiscal('Sincronização! Itens Ordem, Série...',False);
//  if vNfSerieD.vItem = nil then
//    vNfSerieD.vItem := TCupom2.create;
//  defineCampos(vNfSerieD.vItem.dataSet);
  montaSelect('select * from nf_serie_d_itens where '+
    ' cod_empresa = ' + vDadosIniF.codEmpresa +
    ' and (enviado_ret <> ''S'' or enviado_ret is null)');
  if not dataSet.IsEmpty then
  begin
    progresso.Position := 0;
    progresso.Min := 0;
    progresso.Max := dataSet.RecordCount;
    try
      while not dataSet.Eof do
      begin
        Application.ProcessMessages;
        if ExecutaComandos('select * from nf_serie_d_Itens where cod_empresa = ' +
        vDadosIniF.codEmpresa + ' and numeronota = ' +
          dataSet.FieldByName('numeronota').AsString + ' and grupo_prod = ' +
          dataSet.FieldByName('grupo_prod').AsString+ ' and cod_prod = ''' +
          dataSet.FieldByName('cod_prod').AsString+ ''' and nitem = ' +
          dataSet.FieldByName('nitem').AsString) then
          dtSetSinc.Edit
        else
          dtSetSinc.Insert;
        for I := 0 to dataSet.FieldCount - 1 do
          if dataSet.Fields[i].FieldName <> 'ENVIADO_RET' then
            try
              dtSetSinc.FieldByName(dataSet.Fields[i].FieldName).AsString :=
                dataSet.FieldByName(dataSet.Fields[i].FieldName).AsString;
            except
            end;
        dtSetSinc.Post;
        dtSetSinc.ApplyUpdates(0);
        progresso.Position := progresso.Position + 1;
        try
          dataSet.Edit;
          dataSet.FieldByName('enviado_ret').AsString := 'S';
          dataSet.Post;
        except
          dataSet.Cancel;
        end;
        dataSet.Next;
      end;
    except
      on e:exception do
      begin
        Application.MessageBox(pchar('Erro de sincronização. Tabela NF_SERIE_D_ITENS.'+#13+'Erro: '+e.Message),'Atenção',MB_OK + MB_ICONERROR);
        Exit;
      end;
    end;
    try
      //      if dtSetSinc.ApplyUpdates(0) = 0 then
      begin
        if transSinc.InTransaction then
          transSinc.Commit;
        Result := true;
        transSinc.StartTransaction;
      end;
    except
      on e:exception do
      begin
        transSinc.Rollback;
        Application.MessageBox(pchar('Erro de sincronização. Transação NF_SERIE_D_ITENS.'+#13+'Erro: '+e.Message),'Atenção',MB_OK + MB_ICONERROR);
      end;
    end;
    try
      if Apply then
        if CommitaTransacao then
          Result := true;
      IniciaTransacao;
    except
      RollBackTransacao;
    end;
  end;
  //Fim Sincronizando Cupons

  //Sincronizando Documentos nao FiscaisFinalizadores do Cupom
  vDadosIniF.MensagemFiscal('Sincronização! Sangria, Suprimentos Prestaçoes...',False);
  if vRecPrest = nil then
    vRecPrest := TRecebimentoPrestacao.create;
  defineCampos(vRecPrest.vSangSup.dataSet);
  montaSelect('select * from sangsup where cod_terminal = ' + vDadosIniF.vCodTerminal +
    ' and nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)) +
    ' and cod_empresa = ' + vDadosIniF.codEmpresa +
    ' and (enviado_ret <> ''S'' or enviado_ret is null)');
  if not dataSet.IsEmpty then
  begin
    progresso.Position := 0;
    progresso.Min := 0;
    progresso.Max := dataSet.RecordCount;
    TRY
      while not dataSet.Eof do
      begin
        Application.ProcessMessages;
        if (dataSet.FieldByName('coonaofiscal').AsInteger > 0) and
          (Trim(dataSet.FieldByName('status').AsString) = 'CANCELADO') then
          vRecPrest.vPrestCxF.vPrestRet.cancelaPrestacao(dataSet.FieldByName('coonaofiscal').AsInteger);
        progresso.Position := progresso.Position + 1;
        try
          dataSet.Edit;
          dataSet.FieldByName('enviado_ret').AsString := 'S';
          dataSet.Post;
        except
          dataSet.Cancel;
        end;
        dataSet.Next;
      end;
    except
      on e:exception do
      begin
        Application.MessageBox(pchar('Erro de sincronização. Tabela SANGSUP.'+#13+'Erro: '+e.Message),'Atenção',MB_OK + MB_ICONERROR);
        Exit;
      end;
    end;
    try
      if Apply then
        if CommitaTransacao then
          Result := true;
      IniciaTransacao;
    except
      RollBackTransacao;
    end;
  end;
  //Fim SANGSUP

  dataSet.Close;
  dtSetSinc.Close;
end;

function TSincronizacao_NAOUSADOMAIS.sincronizacaoApenasCupom_nao_usar(parar: integer;
  progresso: TProgressBar): boolean;
var
  I: Integer;
  temp: string;
  vVendaRet: TDAVF;
  vCooRed: Integer;
  buscas2: TIBQuery;
  vPos: Integer;
begin
  Result := false;
  if vDadosIniF.bancoConectado = 'local' then
    exit;

  // Testando conexao para conectar;
//  if not dtmAtivo.bancoHw.Connected then
  vDadosIniF.conectaBanco(dtmAtivo.bancoHw, vDadosIniF.vBancoHW, false);

  if dtmAtivo.bancoHw.Connected then
  begin
    if dtmAtivo.bancoHw.DatabaseName <> vDadosInif.vBancoHW then
      Exit;
  end;
  vDadosIniF.MensagemFiscal('Sincronização! Cupons...',False);
  //Sincronizaondo Cupons
  if vCupom = nil then
    vCupom := TCupom.create;
  defineCampos(vCupom.dataSet);
  dtSetSinc.FieldDefs.Add('MD5', ftString, 256, False);
  montaSelect('select * from cupom where cod_terminal = ' + vDadosIniF.vCodTerminal +
    ' and nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)) +
    ' and cod_empresa = ' + vDadosIniF.codEmpresa +
    ' and (enviado_ret <> ''S'' or enviado_ret is null)');
  if not dataSet.IsEmpty then
  begin
    progresso.Position := 0;
    progresso.Min := 0;
    progresso.Max := dataSet.RecordCount;

    try
      while not dataSet.Eof do
      begin
        Application.ProcessMessages;
        if ExecutaComandos('select * from cupom where cod_terminal = ' + vDadosIniF.vCodTerminal +
          ' and nserieecf = ''' + vDadosIniF.vNumSerieEcf +
          ''' and cod_empresa = ' + vDadosIniF.codEmpresa +
          ' and registro = ' + dataSet.FieldByName('registro').AsString +
          ' and cupom = ' + dataSet.FieldByName('cupom').AsString) then
          dtSetSinc.Edit
        else
          dtSetSinc.Insert;
        for I := 0 to dataSet.FieldCount - 1 do
          if dataSet.Fields[i].FieldName <> 'ENVIADO_RET' then
            dtSetSinc.FieldByName(dataSet.Fields[i].FieldName).AsString :=
              dataSet.FieldByName(dataSet.Fields[i].FieldName).AsString;
        dtSetSinc.FieldByName('nserieecf').AsString :=
          vDadosIniF.decodifica(dtSetSinc.FieldByName('nserieecf').AsString);
        dtSetSinc.FieldByName('MD5').AsString := 'SISTEMA';
        dtSetSinc.Post;
        dtSetSinc.ApplyUpdates(0);
        if dataSet.FieldByName('prevenda').AsInteger = 0 then
        else
        begin
          vVendaRet := TDAVF.create;
          if vDadosIniF.bancoConectado <> 'local' then
          try
            vVendaRet.apagarVendasRetaguarda := 'N';
//            vVendaRet.sincronizaDAVNoRet(dataSet.FieldByName('cupom').AsInteger,
//            dataSet.FieldByName('registro').AsInteger,
//            dataSet.FieldByName('prevenda').AsInteger,
//              vDadosIniF.MensagemFiscal('Aguarde! Atualizando DAV no Retaguarda', true));
          finally
            vDadosIniF.limpaMensagem;
          end;
        end;

        progresso.Position := progresso.Position + 1;
        try
          dataSet.Edit;
          dataSet.FieldByName('enviado_ret').AsString := 'S';
          dataSet.Post;
        except
          dataSet.Cancel;
        end;
        dataSet.Next;
      end;
    except
      on e:exception do
      begin
        Application.MessageBox(pchar('Erro de sincronização. Tabela CUPOM.'+#13+'Erro: '+e.Message),'Atenção',MB_OK + MB_ICONERROR);
        Exit;
      end;
    end;
    try
      //      if dtSetSinc.ApplyUpdates(0) = 0 then
      begin
        if transSinc.InTransaction then
          transSinc.Commit;

//        buscas2:= TIBQuery(dtmSincF.qrBuscas2);
//        dataSet.First;
//        while not dataSet.Eof do
//        begin
//          vMD5Func._gravaMD5_Cupom( buscas2,
//            dataSet.FieldByName('cupom').AsInteger,
//            dataSet.FieldByName('COD_TERMINAL').AsInteger,
//            dataSet.FieldByName('registro').AsInteger,
//            vDadosIni.decodifica(dataSet.FieldByName('nserieecf').AsString)
//          );
//          dataSet.Next;
//        end;

        Result := true;
        transSinc.StartTransaction;
      end;
    except
      on e:exception do
      begin
        transSinc.Rollback;
        Application.MessageBox(pchar('Erro de sincronização. Transação CUPOM.'+#13+'Erro: '+e.Message),'Atenção',MB_OK + MB_ICONERROR);
      end;
    end;
    try
      if Apply then
        if CommitaTransacao then
          Result := true;
      IniciaTransacao;
    except
      RollBackTransacao;
    end;
  end;
  //Itens do Cupom
  vDadosIniF.MensagemFiscal('Sincronização! Itens dos Cupons...',False);
  if vCupom2 = nil then
    vCupom2 := TCupom2.create;
  defineCampos(vCupom2.dataSet);
  dtSetSinc.FieldDefs.Add('MD5', ftString, 256, False);
//  dtSetSinc.FieldDefs.Add( 'VALOR_PIS', ftFloat, 0, False);
//  dtSetSinc.FieldDefs.Add( 'VALOR_COFINS', ftFloat, 0, False);
//  dtSetSinc.FieldDefs.Add( 'BASE_PIS', ftFloat, 0, False);
//  dtSetSinc.FieldDefs.Add( 'BASE_COFINS', ftFloat, 0, False);
//  dtSetSinc.FieldDefs.Add( 'ALIQ_PIS', ftFloat, 0, False);
//  dtSetSinc.FieldDefs.Add( 'ALIQ_COFINS', ftFloat, 0, False);
//  dtSetSinc.FieldDefs.Add( 'CST_PIS', ftString, 2, False);
//  dtSetSinc.FieldDefs.Add( 'CST_COFINS', ftString, 2, False);

  montaSelect('select * from cupom2 where cod_terminal = ' + vDadosIniF.vCodTerminal +
    ' and nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)) +
    ' and cod_empresa = ' + vDadosIniF.codEmpresa +
    ' and (enviado_ret <> ''S'' or enviado_ret is null)');
  if not dataSet.IsEmpty then
  begin
    progresso.Position := 0;
    progresso.Min := 0;
    progresso.Max := dataSet.RecordCount;
    vPos:= 0;
    try
      while not dataSet.Eof do
      begin
        Application.ProcessMessages;
        if ExecutaComandos('select * from cupom2 where cod_terminal = ' + vDadosIniF.vCodTerminal +
          ' and nserieecf = ''' + vDadosIniF.vNumSerieEcf +
          ''' and cod_empresa = ' + vDadosIniF.codEmpresa +
          ' and registro = ' + dataSet.FieldByName('registro').AsString +
          ' and ordem = ' + dataSet.FieldByName('ordem').AsString +
          ' and cupom = ' + dataSet.FieldByName('cupom').AsString) then
          dtSetSinc.Edit
        else
          dtSetSinc.Insert;
        for I := 0 to dataSet.FieldCount - 1 do
          if dataSet.Fields[i].FieldName <> 'ENVIADO_RET' then
            dtSetSinc.FieldByName(dataSet.Fields[i].FieldName).AsString :=
              dataSet.FieldByName(dataSet.Fields[i].FieldName).AsString;
        dtSetSinc.FieldByName('nserieecf').AsString :=
          vDadosIniF.decodifica(dtSetSinc.FieldByName('nserieecf').AsString);
        dtSetSinc.FieldByName('MD5').AsString := 'SISTEMA';

        definirPISCOFINS(dtSetSinc);
        
        dtSetSinc.Post;
        dtSetSinc.ApplyUpdates(0);
        vpos := vpos + 1;
        progresso.Position := vpos;
        try
          dataSet.Edit;
          dataSet.FieldByName('enviado_ret').AsString := 'S';
          dataSet.Post;
        except
          dataSet.Cancel;
        end;
        dataSet.Next;
      end;
    except
      on e:exception do
      begin
        Application.MessageBox(pchar('Erro de sincronização. Tabela CUPOM2.'+#13+'Erro: '+e.Message),'Atenção',MB_OK + MB_ICONERROR);
        Exit;
      end;
    end;
    try
      //      if dtSetSinc.ApplyUpdates(0) = 0 then
      begin
        if transSinc.InTransaction then
          transSinc.Commit;

//        buscas2:= TIBQuery(dtmSincF.qrBuscas2);
//        dataSet.First;
//        while not dataSet.Eof do
//        begin
//          vMD5Func._gravaMD5_Cupom2( buscas2,
//            dataSet.FieldByName('cod_terminal').AsInteger,
//            dataSet.FieldByName('registro').AsInteger,
//            dataSet.FieldByName('nitem').AsInteger,
//            dataSet.FieldByName('cupom').AsInteger,
//            dataSet.FieldByName('ordem').AsInteger,
//            vDadosIni.decodifica(dataSet.FieldByName('nserieecf').AsString)
//          );
//          dataSet.Next;
//        end;

        Result := true;
        transSinc.StartTransaction;
      end;
    except
      on e:exception do
      begin
        transSinc.Rollback;
        Application.MessageBox(pchar('Erro de sincronização. Transação CUPOM2.'+#13+'Erro: '+e.Message),'Atenção',MB_OK + MB_ICONERROR);
      end;
    end;
    try
      if Apply then
        if CommitaTransacao then
          Result := true;
      IniciaTransacao;
    except
      RollBackTransacao;
    end;
  end;
  //Fim Sincronizando Cupons

  // Definindo PIS/COFINS dos Cupons
  definirPISCOFINS(progresso);

//  definirPISCOFINSCuponsPorPeriodoPorECF(
//    pchar(vDadosIniF.codEmpresa),
//    pchar(vDadosIniF.vBancoHW),
//    pchar(DateToStr(Date)),
//    pchar(DateToStr(Date)),
//    pchar(vDadosIniF.vNumSerieEcf),
//    pchar(vDadosIniF.vCodTerminal));
end;



end.

