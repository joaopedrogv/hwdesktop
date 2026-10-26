unit UOSHonda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, jpeg, QuickRpt, ExtCtrls, pQRBarCode,uDtmpedvenda, IBQuery;

type
  TFrmOSHonda = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRShape4: TQRShape;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRShape5: TQRShape;
    QRLabel49: TQRLabel;
    QRShape6: TQRShape;
    QRLabel51: TQRLabel;
    QRShape9: TQRShape;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRShape10: TQRShape;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRShape11: TQRShape;
    QRLabel70: TQRLabel;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape18: TQRShape;
    QRShape17: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRLabel81: TQRLabel;
    QRShape32: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape33: TQRShape;
    QRShape37: TQRShape;
    QRLabel105: TQRLabel;
    QRLabel106: TQRLabel;
    QRLabel107: TQRLabel;
    QRShape39: TQRShape;
    QRLabel108: TQRLabel;
    QRLabel109: TQRLabel;
    QRLabel111: TQRLabel;
    QRLabel112: TQRLabel;
    QRLabel114: TQRLabel;
    QRLabel115: TQRLabel;
    QRLabel116: TQRLabel;
    QRLabel117: TQRLabel;
    QRLabel118: TQRLabel;
    QRLabel119: TQRLabel;
    QRLabel120: TQRLabel;
    QRLabel121: TQRLabel;
    QRLabel52: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel53: TQRLabel;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShape31: TQRShape;
    QRShape30: TQRShape;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    QRLabel88: TQRLabel;
    QRShape61: TQRShape;
    QRLabel89: TQRLabel;
    QRShape62: TQRShape;
    QRLabel90: TQRLabel;
    QRShape63: TQRShape;
    QRLabel91: TQRLabel;
    QRShape64: TQRShape;
    QRLabel92: TQRLabel;
    QRShape34: TQRShape;
    QRShape65: TQRShape;
    QRLabel93: TQRLabel;
    QRShape66: TQRShape;
    QRLabel94: TQRLabel;
    QRImage1: TQRImage;
    QRShape38: TQRShape;
    QRShape40: TQRShape;
    QRLabel110: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel122: TQRLabel;
    QRLabel123: TQRLabel;
    QRLabel124: TQRLabel;
    QRLabel132: TQRLabel;
    QRLabel133: TQRLabel;
    QRLabel134: TQRLabel;
    QRLabel135: TQRLabel;
    QRLabel136: TQRLabel;
    QRLabel137: TQRLabel;
    QRLabel138: TQRLabel;
    QRLabel139: TQRLabel;
    QRLabel140: TQRLabel;
    QRLabel147: TQRLabel;
    QRLabel148: TQRLabel;
    QRLabel149: TQRLabel;
    QRLabel150: TQRLabel;
    QRLabel151: TQRLabel;
    QRLabel152: TQRLabel;
    QRLabel153: TQRLabel;
    QRLabel154: TQRLabel;
    QRLabel155: TQRLabel;
    QRLabel162: TQRLabel;
    QRLabel163: TQRLabel;
    QRLabel164: TQRLabel;
    QRLabel165: TQRLabel;
    QRLabel166: TQRLabel;
    QRLabel167: TQRLabel;
    QRLabel168: TQRLabel;
    QRLabel169: TQRLabel;
    QRLabel113: TQRLabel;
    QRDBRichText1: TQRDBRichText;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel170: TQRLabel;
    QRLabel171: TQRLabel;
    QRLabel172: TQRLabel;
    QRLabel173: TQRLabel;
    QRLabel174: TQRLabel;
    QRLabel175: TQRLabel;
    QRLabel176: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel23: TQRLabel;
    QRLabel102: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape67: TQRShape;
    QRLabel177: TQRLabel;
    QRDBRichText2: TQRDBRichText;
    QRLabel125: TQRLabel;
    QRLabel126: TQRLabel;
    QRShape50: TQRShape;
    QRLabel128: TQRLabel;
    QRLabel129: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
    QRLabel97: TQRLabel;
    QRLabel98: TQRLabel;
    QRLabel99: TQRLabel;
    QRLabel100: TQRLabel;
    QRLabel103: TQRLabel;
    QRLabel104: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel101: TQRLabel;
    QrNome_emp: TQRLabel;
    QrEndereco_emp: TQRLabel;
    QrCep_emp: TQRLabel;
    QrCidade_emp: TQRLabel;
    QrTELEFONE_EMP: TQRLabel;
    QrFAX: TQRLabel;
    QrCGC_EMP: TQRLabel;
    QrIE_EMP: TQRLabel;
    QrEMAIL_EMP: TQRLabel;
    QrN_OS: TQRLabel;
    QrFILIAL: TQRLabel;
    QRLabel50: TQRLabel;
    QRShape51: TQRShape;
    QRLabel127: TQRLabel;
    QRLabel130: TQRLabel;
    QRBarcode1: TQRBarcode;
    QRLabel131: TQRLabel;
    QRLabel141: TQRLabel;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    nped: Integer;
  	tipo: string;
  end;

var
  FrmOSHonda: TFrmOSHonda;

implementation

uses
 udtmAtivo, uDadosIni, uCadPedVenda, uDataSet_OOP, DB, UClassesPedVenda;

{$R *.dfm}

procedure TFrmOSHonda.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
  i, vflag: integer;
  vtotserv,vtotterc,vtotpos, vtotprq, vValReq: currency;
  vdescrq, vdescos: currency;
  vtotg: array[1..5] of currency;
  endereco:string;
  buscasVnd, buscasEqVei, buscasItens, buscas: TIBQuery;
begin
	try
    for i := 1 to 5 do
      vtotg[i] := 0;
    QrNome_emp.Caption:=vDadosIni.vEmp.vRazaoSocial;
    QRLabel131.Caption:=vDadosIni.vEmp.vRazaoSocial;
    QrEndereco_emp.Caption:=vDadosIni.vEmp.vEndereco;
    QrCep_emp.Caption:=vDadosIni.vEmp.vCEP;
    QrCidade_emp.Caption:=vDadosIni.vEmp.vCidade;
    QRLabel7.caption := 'UF: ' + vDadosIni.vEmp.vSiglaUF;
    QrTELEFONE_EMP.Caption:=vDadosIni.vEmp.vTelefone;
    QRLabel141.Caption:=vDadosIni.vEmp.vTelefone;
    QrFAX.Caption:=vDadosIni.vEmp.vTelefone;
    QrCGC_EMP.Caption:=vDadosIni.vEmp.vCNPJ;
    QrIE_EMP.Caption:=vDadosIni.vEmp.vIE;
    QrEMAIL_EMP.Caption:=vDadosIni.vEmp.vEmail;
    QrFILIAL.Caption:=vDadosIni.vEmp.vfilial;
    QrN_OS.Caption:=vDadosIni.StrZero(nped, 6);
    QRBarcode1.BarCode:=IntToStr(nped);

    if DtmPedVenda = nil then
      DtmPedVenda := TDtmPedVenda.create(DtmPedVenda);

    buscasVnd := TIBQuery.Create(Application);
    buscasVnd.Database := DtmPedVenda.qrBuscas.Database;
    buscasVnd.Transaction := DtmPedVenda.qrBuscas.Transaction;

    buscasEqVei := TIBQuery.Create(Application);
    buscasEqVei.Database := DtmPedVenda.qrBuscas.Database;
    buscasEqVei.Transaction := DtmPedVenda.qrBuscas.Transaction;

    buscasItens := TIBQuery.Create(Application);
    buscasItens.Database := DtmPedVenda.qrBuscas.Database;
    buscasItens.Transaction := DtmPedVenda.qrBuscas.Transaction;

    buscas := TIBQuery.Create(Application);
    buscas.Database := DtmPedVenda.qrBuscas.Database;
    buscas.Transaction := DtmPedVenda.qrBuscas.Transaction;

    buscasVnd.Close;
    buscasVnd.SQL.Text := ' select pedvenda.*, ' +
      ' clientes.cpfcgc, clientes.nome_cliente, clientes.razao, clientes.num_end_cliente, clientes.complemento, ' +
      ' clientes.cep, clientes.endereco, clientes.cidade, clientes.bairro, clientes.insc_est, ' +
      ' estados.nome_uf, estados.sigla_uf, cidades.nome_cidade, bairros.nome_bairro, ' +
      ' clientes.fone_cliente, clientes.fone_trab, clientes.email, ' +
      ' colaborador.nome_vendedor from pedvenda ' +
      ' inner join clientes on clientes.cod_cliente = pedvenda.cod_cliente and clientes.cod_empresa = pedvenda.cod_empresa ' +
      ' inner join estados on estados.codigo_uf = clientes.codigo_uf ' +
      ' inner join cidades on cidades.cod_cidade = clientes.cod_cidade ' +
      ' inner join bairros on bairros.cod_bairro = clientes.cod_bairro ' +
      ' inner join colaborador on colaborador.cod_vendedor = pedvenda.cod_vendedor and colaborador.cod_empresa = pedvenda.cod_empresa ' +
      ' where pedvenda.nped = ' + IntToStr(nped) +
      ' and pedvenda.tipo = ' + QuotedStr(tipo) +
      ' and pedvenda.cod_empresa = ' + vDadosIni.codEmpresa;
    buscasVnd.Open;

    buscasEqVei.Close;
    if buscasVnd.FieldByName('COD_VEICULO').AsInteger <> 0 then
    begin
      buscasEqVei.SQL.Text := ' select * from veiculos ' +
        ' where codigo = ' + buscasVnd.FieldByName('COD_VEICULO').AsString+
        ' and cod_empresa = ' + vDadosIni.codEmpresa +
        ' and ativo = 1 ';
    end
    else
    begin
      buscasEqVei.SQL.Text := ' select * from veiculos ' +
        ' where chassi = ' + QuotedStr(buscasVnd.FieldByName('chassi').AsString) +
        ' or placa = ' + QuotedStr(buscasVnd.FieldByName('placa').AsString) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa +
        ' and ativo = 1 ';
    end;
    buscasEqVei.Open;

    if vDadosIni.vEmp.vUsarDAVOS = 'S' then
      QRLabel3.caption := vDadosIni.strzero(buscasVnd.fieldbyname('NPREVENDA').asinteger, 7)
    else
      QRLabel3.caption := vDadosIni.strzero(buscasVnd.fieldbyname('NPED').asinteger, 5);

    Qrlabel55.caption := copy('MODELO: ' + buscasEqVei.FieldByName('DESCMODELO').AsString,1,30);
    Qrlabel56.caption := 'MOTOR: ' + buscasEqVei.FieldByName('MOTOR').AsString;
    Qrlabel57.caption := 'CHASSI: ' + buscasEqVei.FieldByName('CHASSI').AsString;
    Qrlabel58.caption := 'ANO/MOD..: ' + buscasEqVei.FieldByName('ANOFAB').AsString + '/' + buscasEqVei.FieldByName('ANOMOD').AsString;
    Qrlabel59.caption := 'COR: ' + buscasEqVei.FieldByName('COR').AsString;
    Qrlabel60.caption := 'PLACA: ' + buscasEqVei.FieldByName('PLACA').AsString;
    Qrlabel61.caption := 'KM: ' + buscasEqVei.FieldByName('KM_V').AsString;
    Qrlabel62.caption := 'DATA VENDA: ' + buscasEqVei.FieldByName('DATA_VENDA').AsString;
    Qrlabel63.caption := 'CONC. VENDEDORA: ' + buscasEqVei.FieldByName('OBS').AsString;
    Qrlabel66.caption := 'RECEPCIONISTA: ' + buscasVnd.FieldByName('NOME_VENDEDOR').AsString;
  //  dtm1.QRYclientes.close;
  //  Dtm1.QRYclientes.params[0].value := QRYOSCOD_CLIENTE.value;
  //  DTM1.QRYClientes.ParamByName('COD_EMPRESA').Text := FRMPrincipal.CodEmpresa;
  //  dtm1.QRYclientes.open;
    QRLabel36.caption := buscasVnd.FieldByName('NOME_CLIENTE').AsString;
    endereco := trim(buscasVnd.FieldByName('ENDERECO').AsString);
    if (buscasVnd.FieldByName('NUM_END_CLIENTE').AsString) <> '' then
      endereco := endereco + ', '+ buscasVnd.FieldByName('NUM_END_CLIENTE').AsString;
    if (buscasVnd.FieldByName('COMPLEMENTO').AsString) <> '' then
      endereco := endereco + ', '+buscasVnd.FieldByName('COMPLEMENTO').AsString;
    QRLabel37.caption := endereco;
    QRLabel38.caption := copy(buscasVnd.FieldByName('CEP').AsString, 1, 5) + '-' + copy(buscasVnd.FieldByName('CEP').AsString, 6, 3);
    QRLabel42.caption := buscasVnd.FieldByName('CIDADE').AsString;
    QRLabel44.caption := buscasVnd.FieldByName('SIGLA_UF').AsString;
    if length(trim(buscasVnd.FieldByName('CPFCGC').AsString)) = 11 then
      QRLabel39.caption := copy(buscasVnd.FieldByName('CPFCGC').AsString, 1, 3) + '.' +
        copy(buscasVnd.FieldByName('CPFCGC').AsString, 4, 3) + '.' +
        copy(buscasVnd.FieldByName('CPFCGC').AsString, 7, 3) + '-' +
        copy(buscasVnd.FieldByName('CPFCGC').AsString, 10, 2)
    else
      QRLabel39.caption := copy(buscasVnd.FieldByName('CPFCGC').AsString, 1, 2) + '.' +
        copy(buscasVnd.FieldByName('CPFCGC').AsString, 3, 3) + '.' +
        copy(buscasVnd.FieldByName('CPFCGC').AsString, 6, 3) + '/' +
        copy(buscasVnd.FieldByName('CPFCGC').AsString, 9, 4) + '-' +
        copy(buscasVnd.FieldByName('CPFCGC').AsString, 13, 2);
    //   DTM1.QRYclientesCPFCGC.value;
    //  else
    //  QRLabel39.caption:=DTM1.QRYclientesCPFCGC.value;
    QRLabel46.caption := buscasVnd.FieldByName('INSC_EST').AsString;
    QRLabel40.caption := buscasVnd.FieldByName('FONE_CLIENTE').AsString;
    QRLabel48.caption := buscasVnd.FieldByName('FONE_TRAB').AsString;
    QRLabel126.Caption:= buscasVnd.FieldByName('EMAIL').AsString;
    QRLabel5.Caption := '';
    QRLabel6.Caption := '';
    QRLabel9.Caption := '';
    QRLabel129.Caption:='';
    QRLabel130.Caption:='';
    if buscasVnd.FieldByName('TIPO_OS').AsString = 'CLIENTE' then
    begin
      QRLabel5.Caption := 'X';
      QRLabel6.Caption := '';
      QRLabel9.Caption := '';
    end
    else if buscasVnd.FieldByName('TIPO_OS').AsString = 'INTERNA' then
    begin
      QRLabel5.Caption := '';
      QRLabel6.Caption := '';
      QRLabel9.Caption := 'X';
    end
    else if buscasVnd.FieldByName('TIPO_OS').AsString = 'GARANTIA' then
    begin
      QRLabel5.Caption := '';
      QRLabel6.Caption := 'X';
      QRLabel9.Caption := '';
    end;

    if buscasVnd.FieldByName('TIPO_OS').AsString = 'EXPRESSO' then
    begin
      QRLabel129.Caption:='X';
      QRLabel6.Caption := '';
      QRLabel9.Caption := '';
    end;

    if buscasVnd.FieldByName('TIPO_OS').AsString = 'RETORNO' then
    begin
      QRLabel130.Caption:='X';
      QRLabel6.Caption := '';
      QRLabel9.Caption := '';
    end;

    buscasItens.Close;
    buscasItens.SQL.Text := ' select * from pedvenda_serv ' +
      ' where nped = ' + IntToStr(nped) +
      ' and tipo = ' + QuotedStr(tipo) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
    buscasItens.Open;
  //  CadPedVenda.vItServ.abrePedVendaServ(CadPedVenda.dataSet.FieldByName('NPED').AsInteger);
  //  QryitensS.close;
  //  QryitensS.Params[0].value := QRYOSN_OS.value;
  //  QRYItensS.ParamByName('COD_EMPRESA').Text := FRMPrincipal.CodEmpresa;
  //  QryitensS.open;

    if not buscasItens.IsEmpty then
    begin
      QRLabel132.caption := format('%6.2f', [buscasItens.FieldByName('TMO_SERV').AsFloat]);
      QRLabel147.caption := buscasItens.FieldByName('DESC_SERV_PED').AsString;
    end
    else
    begin
      QRLabel132.caption := '';
      QRLabel147.caption := '';
    end;
    buscasItens.Next;
    vflag := 0;
    if buscasItens.Eof then
      vflag := 1;
    if vflag = 0 then
    begin
      QRLabel133.caption := format('%6.2f', [buscasItens.FieldByName('TMO_SERV').AsFloat]);
      QRLabel148.caption := buscasItens.FieldByName('DESC_SERV_PED').AsString;
    end
    else
    begin
      QRLabel133.caption := '';
      QRLabel148.caption := '';
    end;
    buscasItens.Next;
    if buscasItens.Eof then
      vflag := 1;
    if vflag = 0 then
    begin
      QRLabel134.caption := format('%6.2f', [buscasItens.FieldByName('TMO_SERV').AsFloat]);
      QRLabel149.caption := buscasItens.FieldByName('DESC_SERV_PED').AsString;
    end
    else
    begin
      QRLabel134.caption := '';
      QRLabel149.caption := '';
    end;
    buscasItens.Next;
    if buscasItens.Eof then
      vflag := 1;
    if vflag = 0 then
    begin
      QRLabel135.caption := format('%6.2f', [buscasItens.FieldByName('TMO_SERV').AsFloat]);
      QRLabel150.caption := buscasItens.FieldByName('DESC_SERV_PED').AsString;
    end
    else
    begin
      QRLabel135.caption := '';
      QRLabel150.caption := '';
    end;
    buscasItens.Next;
    if buscasItens.Eof then
      vflag := 1;
    if vflag = 0 then
    begin
      QRLabel136.caption := format('%6.2f', [buscasItens.FieldByName('TMO_SERV').AsFloat]);
      QRLabel151.caption := buscasItens.FieldByName('DESC_SERV_PED').AsString;
    end
    else
    begin
      QRLabel136.caption := '';
      QRLabel151.caption := '';
    end;
    buscasItens.next;
    if buscasItens.Eof then
      vflag := 1;
    if vflag = 0 then
    begin
      QRLabel137.caption := format('%6.2f', [buscasItens.FieldByName('TMO_SERV').AsFloat]);
      QRLabel152.caption := buscasItens.FieldByName('DESC_SERV_PED').AsString;
    end
    else
    begin
      QRLabel137.caption := '';
      QRLabel152.caption := '';
    end;
    buscasItens.Next;
    if buscasItens.Eof then
      vflag := 1;
    if vflag = 0 then
    begin
      QRLabel138.caption := format('%6.2f', [buscasItens.FieldByName('TMO_SERV').AsFloat]);
      QRLabel153.caption := buscasItens.FieldByName('DESC_SERV_PED').AsString;
    end
    else
    begin
      QRLabel138.caption := '';
      QRLabel153.caption := '';
    end;
    buscasItens.Next;
    if buscasItens.Eof then
      vflag := 1;
    if vflag = 0 then
    begin
      QRLabel139.caption := format('%6.2f', [buscasItens.FieldByName('TMO_SERV').AsFloat]);
      QRLabel154.caption := buscasItens.FieldByName('DESC_SERV_PED').AsString;
    end
    else
    begin
      QRLabel139.caption := '';
      QRLabel154.caption := '';
    end;
    buscasItens.Next;
    QRLabel162.caption := '';
    QRLabel163.caption := '';
    QRLabel164.caption := '';
    QRLabel165.caption := '';
    QRLabel166.caption := '';
    QRLabel167.caption := '';
    QRLabel168.caption := '';
    QRLabel169.caption := '';
    (*
  //  CadPedVenda.vItProd.abrePedVendaProd(CadPedVenda.dataSet.FieldByName('NPED').AsInteger,'OS');
  //  QrReq.close;
  //  QrReq.params[0].value := QRYOSN_OS.value;
  //  QRReq.ParamByName('COD_EMPRESA').Text := FRMPrincipal.CodEmpresa;
  //  QrReq.open;
    vValReq := 0;
    while not CadPedVenda.vItProd.eof do
    begin
      vValReq := vValReq + CadPedVenda.vItProd.dataSet.FieldByName('VALOR_TOTAL.value;
      QrReq.next;
    end;
    QrReq.first;
    vflag := 0;
    if QrReq.Eof then
      vflag := 1;
    if vflag = 0 then
      QRLabel162.caption := strzero(QrReqNREQ.value, 6)
    else
      QRLabel162.caption := '';
    if QrReq.Eof then
      vflag := 1
    else
      QrReq.next;
    if QrReq.Eof then
      vflag := 1;
    if vflag = 0 then
      QRLabel163.caption := strzero(QrReqNREQ.value, 6)
    else
      QRLabel163.caption := '';
    if QrReq.Eof then
      vflag := 1
    else
      QrReq.next;
    if vflag = 0 then
      QRLabel164.caption := strzero(QrReqNREQ.value, 6)
    else
      QRLabel164.caption := '';
    if QrReq.Eof then
      vflag := 1
    else
      QrReq.next;
    if vflag = 0 then
      QRLabel165.caption := strzero(QrReqNREQ.value, 6)
    else
      QRLabel165.caption := '';
    if QrReq.Eof then
      vflag := 1
    else
      QrReq.next;
    if vflag = 0 then
      QRLabel166.caption := strzero(QrReqNREQ.value, 6)
    else
      QRLabel166.caption := '';
    if QrReq.Eof then
      vflag := 1
    else
      QrReq.next;
    if vflag = 0 then
      QRLabel167.caption := strzero(QrReqNREQ.value, 6)
    else
      QRLabel167.caption := '';
    if QrReq.Eof then
      vflag := 1
    else
      QrReq.next;
    if vflag = 0 then
      QRLabel168.caption := strzero(QrReqNREQ.value, 6)
    else
      QRLabel168.caption := '';
    if QrReq.Eof then
      vflag := 1
    else
      QrReq.next;
    if vflag = 0 then
      QRLabel169.caption := strzero(QrReqNREQ.value, 6)
    else
      QRLabel169.caption := '';
    *)
    if vDadosIni.vEmp.vUsarDAVOS = 'S' then
      QRLabel119.caption := vDadosIni.strzero(buscasVnd.fieldbyname('NPREVENDA').asinteger, 7)
    else
      QRLabel119.caption := vDadosIni.strzero(buscasVnd.fieldbyname('NPED').asinteger, 5);
  //  if dtm02.QRYempresaUSPREVENDA_OS.Value = 'S' then
  //    QRLabel119.caption := strzero(QRYOSNPREVENDA.value, 7)
  //  else
  //    QRLabel119.caption := strzero(QRYOSN_OS.value, 5);
  //  QrReq.close;
    if buscasVnd.FieldByName('TIPO_OS').AsString = 'GARANTIA' then
  //  if QRYOSTIPO_OS.value = 'GARANTIA' then
    begin
  //    CadPedVenda.vCliente.abreClientes(CadPedVenda.buscas.FieldByName('COD_CLIENTE').AsInteger);
  //    CadPedVenda.vCliente.vEst.abreEstado(CadpedVenda.vCliente.DataSet.FieldByName('CODIGO_UF').AsInteger);
      QRLabel96.caption := 'NOME: ' + buscasVnd.FieldByName('NOME_CLIENTE').AsString;
      QRLabel97.caption := 'ENDEREÇO: ' + buscasVnd.FieldByName('ENDERECO').AsString;
      QRLabel98.caption := 'CIDADE: ' + buscasVnd.FieldByName('CIDADE').AsString;
      QRLabel99.caption := 'FONE: ' + buscasVnd.FieldByName('FONE_CLIENTE').AsString;
      QRLabel104.caption := 'FAX: ';
      //+CadPedVenda.vCliente.dataSet.FieldByName('FAX').AsString;
  //    dTM1.QRYEstados.locate('codigo_uf', dtm1.QRYclientesCODIGO_UF.value, []);
      QRLabel103.caption := 'ESTADO: ' + buscasVnd.FieldByName('SIGLA_UF').AsString;
    end
    else
    begin
      QRLabel96.caption := 'NOME: ';
      QRLabel97.caption := 'ENDEREÇO: ';
      QRLabel98.caption := 'CIDADE: ';
      QRLabel99.caption := 'FONE: ';
      QRLabel104.caption := 'FAX: ';
      QRLabel103.caption := 'ESTADO: ';
    end;
    QRLabel113.caption := buscasVnd.FieldByName('COMBUST_VEIC').AsString;
    QRLabel23.caption := buscasVnd.FieldByName('DATA_PED').AsString;
    //   datetostr(date);
    buscasItens.Close;
    buscasItens.SQL.Text := ' select * from pedvenda_prod ' +
      ' where nped = ' + IntToStr(nped) +
      ' and tipo = ' + QuotedStr(tipo) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
    buscasItens.Open;
  //    QryitO.close;
  //  QryitO.params[0].value := QRYOSN_OS.value;
  //  QRYIto.ParamByName('COD_EMPRESA').Text := FRMPrincipal.CodEmpresa;
  //  QryitO.open;
    buscasItens.Close;
    buscasItens.SQL.Text := ' select * from pedvenda_serv_terc ' +
      ' where nped = ' + IntToStr(nped) +
      ' and tipo = ' + QuotedStr(tipo) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
    buscasItens.Open;

    //vItProdTerc.abreProdTerceiro(CadPedVenda.dataSet.FieldByName('NPED').AsInteger);
    vtotserv:=0;
    vtotterc:=0;
    while Not buscasItens.eof do
    //CadPedVenda.vItProdTerc.eof do
    begin
      vtotterc := vtotterc + buscasItens.FieldByName('VL_SERVT').AsCurrency;
      //vItProdTerc.dataSet.FieldByName('VL_SERVT').AsCurrency;
      buscasItens.next;
      //vItProdTerc.next;
    end;
  //  QrTerceiro.close;
  //  QrTerceiro.params[0].value := QRYOSN_OS.value;
  //  QRTerceiro.ParamByName('COD_EMPRESA').Text := FRMPrincipal.CodEmpresa;
  //  QrTerceiro.open;
    vdescos := (buscasVnd.FieldByName('TOT_PROD').AsCurrency +
      buscasVnd.FieldByName('TOT_SERV').AsCurrency +
      vtotterc) -
      buscasVnd.FieldByName('VALOR_TOTAL').AsCurrency;

    vtotpos := (buscasVnd.FieldByName('TOT_PROD').AsCurrency +
      buscasVnd.FieldByName('TOT_SERV').AsCurrency +
      vtotterc);

    QRLabel73.caption := format('%n', [vtotterc]);
    QRLabel71.caption := format('%n', [0.00]);
    QRLabel72.caption := format('%n', [0.00]);
    QRLabel74.caption := format('%n', [0.00]);
    QRLabel75.caption := format('%n', [0.00]);

    buscas.Close;
    buscas.SQL.Text := ' SELECT TP.STIPO, ' +
      ' sum(IT.VALOR_TOT_SERV-IT.RATEIO_DESC+IT.RATEIO_ACRESC) as TOTAL '+
      ' FROM PEDVENDA_SERV IT,TIPO_SERVICO TP '+
      ' WHERE IT.NPED = ' + IntToStr(nped) +
      ' AND IT.TIPO = ' + QuotedStr(tipo) +
      ' AND IT.COD_SERVICO = TP.COD_SERVICO '+
      ' and it.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and it.ativo = 1 '+
      ' GROUP BY TP.STIPO ';
    buscas.Open;

    while not buscas.Eof do
    begin
      if buscas.FieldByName('STIPO').AsString = 'R' then
       QRLabel71.caption := format('%n', [buscas.FieldByName('TOTAL').AsCurrency]);
      if buscas.FieldByName('STIPO').AsString = 'M' then
       QRLabel72.caption := format('%n', [buscas.FieldByName('TOTAL').AsCurrency]);
      if buscas.FieldByName('STIPO').AsString = 'L' then
       QRLabel74.caption := format('%n', [buscas.FieldByName('TOTAL').AsCurrency]);
      if buscas.FieldByName('STIPO').AsString = 'G' then
        QRLabel75.caption := format('%n', [buscas.FieldByName('TOTAL').AsCurrency]);
      if buscas.FieldByName('STIPO').AsString = '' then
       QRLabel72.caption := format('%n', [buscas.FieldByName('TOTAL').AsCurrency]);
      vtotserv:=vtotserv+buscas.FieldByName('TOTAL').AsCurrency;
      buscas.next;
    end;
  //  QryitO.close;
    // colocar os produtos classificados por subgrupos e em seguida
    // preencher os campos acessórios, etc
    buscas.Close;
    buscas.sql.text:='SELECT PR.SUB_G_PROD,SUM(IT.VLTOT_PED_ITEM-IT.RATEIO_DESC+IT.RATEIO_ACRESC) AS TOTAL FROM '+
      ' PEDVENDA_PROD IT,PRODUTOS PR ' +
      ' WHERE IT.NPED = ' + IntToStr(nped) +
      ' AND IT.TIPO = ' + QuotedStr(tipo) +
      ' AND IT.GRUPO_PROD = PR.GRUPO_PROD '+
      ' AND IT.COD_PROD = PR.COD_PROD '+
      ' and pr.cod_empresa = it.cod_empresa ' +
      ' and it.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and it.ativo=1 '+
      ' GROUP BY PR.SUB_G_PROD';
    buscas.open;
  //  QrItReq.close;
  //  QrItReq.params[0].value := QRYOSN_OS.value;
  //  QRitreq.ParamByName('COD_EMPRESA').Text := FRMPrincipal.CodEmpresa;
  //  QrItReq.open;
    vtotprq := 0;
    while not buscas.Eof do
    begin
      vtotprq := vtotprq + buscas.FieldByName('TOTAL').AsCurrency;
      buscas.Next;
    end;
    buscas.First;
  //  vdescrq := (vtotprq - vValReq);
    while not buscas.eof do
    begin
  //    if CadPedVenda.buscas.FieldByName('SUB_G_PROD').AsInteger = 0 then
  //    begin
  //      if (vtotprq <> 0) and (vdescrq <> 0) then
  //        vtotg[1] := vtotg[1] + (CadPedVenda.buscas.FieldByName('TOTAL').AsCurrency - ((((CadPedVenda.buscas.FieldByName('TOTAL').AsCurrency * 100) / vtotprq) * vdescrq) / 100))
  //      else
          vtotg[1] := vtotg[1] + buscas.FieldByName('TOTAL').AsCurrency;
  //    end
  //    else
  //    begin
  //       vtotg[CadPedVenda.buscas.FieldByName('SUB_G_PROD').AsInteger] := vtotg[CadPedVenda.buscas.FieldByName('SUB_G_PROD').AsInteger] + CadPedVenda.buscas.FieldByName('TOTAL').AsCurrency;
  //    end;
      buscas.next;
    end;

    {QrItOs.params[0].value := QRYOSN_OS.value;
    QRItos.ParamByName('COD_EMPRESA').Text := FRMPrincipal.CodEmpresa;
    QrItOs.open;
    while not QrItOs.eof do
    begin
      if QrItOsSUB_G_PROD.value = 0 then
      begin
        if (vtotpos <> 0) and (vdescos <> 0) then
          vtotg[1] := vtotg[1] + (QrItOsSUM.value - ((((QrItOsSUM.value * 100) / vtotpos) *
            vdescos) / 100))
        else
          vtotg[1] := vtotg[1] + QrItOsSUM.value;
      end
      else
      begin
        if (vtotpos <> 0) and (vdescos <> 0) then
          vtotg[QrItOsSUB_G_PROD.value] := vtotg[QrItOsSUB_G_PROD.value] +
            (QrItOsSUM.value - ((((QrItOsSUM.value * 100) / vtotpos) * vdescos) / 100))
        else
          vtotg[QrItOsSUB_G_PROD.value] := vtotg[QrItOsSUB_G_PROD.value] + QrItOsSUM.value;
      end;
      QrItOs.next;
    end;
    }
  //  if vdescos <> 0 then
  //    Qrlabel76.caption := format('%n', [(CadPedVenda.dataSet.FieldByName('TOT_SERV').AsCurrency - ((((CadPedVenda.dataSet.FieldByName('TOT_SERV').AsCurrency * 100) / vtotpos) * vdescos) / 100)) +
  //      (vtotterc - ((((vtotterc * 100) / vtotpos) * vdescos) / 100))])
  //  else
    Qrlabel76.caption :=format('%n', [vtotserv + vtotterc]);
    //format('%n', [CadPedVenda.dataSet.FieldByName('TOT_SERV').AsCurrency + vtotterc]);
    Qrlabel170.caption := format('%n', [vtotg[1]]);
    Qrlabel171.caption := format('%n', [vtotg[2]]);
    Qrlabel172.caption := format('%n', [vtotg[3]]);
    Qrlabel173.caption := format('%n', [vtotg[4]]);
    Qrlabel174.caption := format('%n', [vtotg[5]]);
    //      QRYOSTOT_PROD_OS.value+vValReq]);
    Qrlabel175.caption := format('%n', [vtotg[1] + vtotg[2] + vtotg[3] + vtotg[4] + vtotg[5]]);
    //QRYOSTOT_PROD_OS.value+vValReq]);
    Qrlabel176.caption := format('%n', [buscasVnd.FieldByName('VALOR_TOTAL').AsCurrency + vValReq]);
  finally
    if Assigned(buscasVnd) then
      FreeAndNil(buscasVnd);
    if Assigned(buscasEqVei) then
      FreeAndNil(buscasEqVei);
    if Assigned(buscasItens) then
      FreeAndNil(buscasItens);
    if Assigned(buscas) then
      FreeAndNil(buscas);
  end;
end;

end.
