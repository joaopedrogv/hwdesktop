unit UClassesFabrica;

interface

uses  uDataSet_OOP, DBClient, DB, IBQuery, RDprint, IBDatabase, DBTables, Controls,
  StdCtrls, Classes, UClasseSugestaoCompras, Variants, Forms, FileCtrl;

type
  ArrayOfString = array of WideString;          { "http://ws2.assohonda.org.br/estoque/" }
  ArrayOfInt = array of Integer;                { "http://ws2.assohonda.org.br/estoque/" }

  RParametros = record
    pMzM1, pQzQ1, pH0, pH2, pH3, pH4, pH5, pH6, pH7, pH8, pCA, pPZ, pPN, pAliqPadrao, pCSTPadrao, pNatOP, pCoefLoja: string;
    pProdSimilares, pCoefEmCimaPrecoPublico, pTipoArqCRE, pTipoArqFDC, pTipoArqPCF, pNCM, pPadrao: boolean;
    pDataIni, pDataFim, Memo: string;
    pNatOPST, pNatOpTrib, pAliqSt, pAliqTrib, pComitar: string;
    ContArq, TotArq: Integer;
  end;

  TFabrica = class(TDataSet_OOP)
  //(TObject)
  private
    FBuscas1: TIBQuery;
    Fdatafinal: TDate;
    FRdp: TRdPrint;
    Fdatainicial: Tdate;
    FTipoRelatorio, FCaminho, FDiretorio: string;
  protected
  public
   constructor create; virtual;
   destructor Destroy; virtual;
   function MontarArquivoPedido(nped, caminhoArquivo: string): boolean; virtual; abstract;
   procedure RelArquivo; virtual; abstract;
   property Rdp: TRdPrint read FRdp write FRdp;
   property datainicial: Tdate read Fdatainicial write Fdatainicial;
   property datafinal: TDate read Fdatafinal write Fdatafinal;
   property TipoRelatorio: string read FTipoRelatorio write FTipoRelatorio;
   property Diretorio: string read FDiretorio write FDiretorio;
   property Caminho: string read FCaminho write FCaminho;
   procedure CadFabrica(TipoForm: Integer; nomerel: string); //overload; // não precisa de virtual e abstract.
   function dataatualserv: TDate;
//   property buscas: TIBQuery read FBuscas write FBuscas;
   property buscas1: TIBQuery read FBuscas1 write FBuscas1;
  var
  end;

   //Saídas Balcão
  TFabricaHonda = class(TFabrica)
  public
    constructor create; override;
    function abreItemPedidoCompra(numPed: string): boolean;
    function MontarArquivoPedido(nped, caminhoArquivo: string): boolean; override;
    function MontarArquivoHonda: boolean;
    function ProcessarArquivo(pDirArquivo, pArquivo: string): boolean;
    function ProcessarArquivoTransito(pDirArquivo, pArquivo: string): boolean;
    function ProcessarArquivoPecas(pDirArquivo, pArquivo: string): boolean;
    function ProcessarArquivoContasAPagar(pDirArquivo, pArquivo: string): boolean;
    function MontarMSI(pDataIni, pDataFim: string): boolean;
    procedure _localizarArquivos(pPath: string; pLista: TStringList);
  var
    Arquivo: TextFile;
    fArquivos: TStringList;
    fArquivos1: TStringList;
    fArquivos2: TStringList;
    vParam: RParametros;
    vArqTrans, vArqCTP, vArqPecas: boolean;
  end;

  TFabricaYamaha = class(TFabrica)
  public
    constructor create; override;
    function ProcessarArquivo(pDirArquivo, pArquivo: string): boolean;
    function ProcessarArquivoPecas(pDirArquivo, pArquivo: string): boolean;
    procedure _localizarArquivos(pPath: string; pLista: TStringList);
  var
    fArquivos: TStringList;
    fArquivos1: TStringList;
    fArquivos2: TStringList;
    fProdutosNProcessados: TStringList;
    vParam: RParametros;
  end;


  TComunicaAssohonda = class(TFabrica)
   private
     FTipomodelo: TIBQuery;
     FCodfabrica: TIBQuery;
   public
    constructor create;
    function MontaenvioAssohonda(vdata: Tdate;vtpop: integer): boolean;
    function buscavetor(vmodelo,vcor: string;vetmodelo,vetcor: ArrayOfString): integer;
    function abrecomunicaAssohonda(vdata: Tdate): boolean; overload;
    function abrecomunicaAssohonda(vdat1,vdat2: Tdate): boolean;overload;
    function gravardadosinsform: boolean;
    function abreoufechatpmod(vtp: integer): boolean;
    function verificaduplicidade(vdata: Tdate;cod_modelo,cod_cor: integer): boolean;
    function enviaDadosWebservice(vdataatual: Tdate;vtpop: integer): boolean;
    function _FormEnvAssohonda: boolean;
    property Tipomodelo: TIBQuery read FTipomodelo write FTipomodelo;
    property Codfabrica: TIBQuery read FCodfabrica write FCodfabrica;
  end;
var
  ObFabrica: TFabrica;

implementation

uses
  SysUtils, Windows, uDtmFabrica, uDadosIni, uDtmAtivo,
  ComCtrls, uPadrao, Printers, IBCustomDataSet, URelHonda, UintegraHonda,
  dialogs, MaskUtils, uclassesprodutos, uclassesContasAPagar, UIntegraYamaha;

// function enviaEstoque(tgconcessionaria, vcnpj,
//  vdataref: Pchar; modelo, cor: ArrayOfString; estoquefisico, transito,
//  saldofaturar, pedidofirme, confirmadohonda, pedidoadicional, cancelamento,
//  vendasdia, vendasacumuladas: ArrayOfInt; vtpop: integer): WideString; stdcall; external 'cons40.dll';
function enviarEstoqueVendas(vTpOp, vtgconcessionaria, vvcnpj, vdataref: WideString;
  modelo, cor: ArrayOfString;estoquefisico, transito, saldofaturar, pedidofirme,
  confirmadohonda, pedidoadicional, cancelamento, vendasdia, vendasacumuladas: ArrayOfInt): WideString; stdcall; external 'wsHonda.dll';


{ TFabrica }

procedure TFabrica.CadFabrica(TipoForm: Integer; nomerel: string);
begin
  if UpperCase(vDadosIni.vfabrica) = 'HONDA' then
  begin
    if UpperCase(nomerel) = 'INTEGRAFABRICA' then
    begin
     Application.CreateForm(TFrmIntegraHonda, FrmIntegraHonda);
     FrmIntegraHonda.ShowModal;
    end
    else if UpperCase(nomerel) = 'RELARQUIVOVENDAPORCHASSI' then
    begin
      Application.CreateForm(TfrmRelHonda, frmRelHonda);
      frmRelHonda.ShowModal;
    end
    else if UpperCase(nomerel) = 'RELARQUIVOCLIENTES' then
    begin
      Application.CreateForm(TfrmRelHonda, frmRelHonda);
      frmRelHonda.ShowModal;
    end
    else if UpperCase(nomerel) = 'MONTARARQUIVOPEDIDO' then
    begin
      Application.CreateForm(TfrmRelHonda, frmRelHonda);
      frmRelHonda.ShowModal;
    end;
  end;
end;

constructor TFabrica.create;
begin
   if dtmFabrica = nil then
    dtmFabrica := TdtmFabrica.Create(dtmFabrica);

  Buscas := TIBQuery(dtmFabrica.qrBuscas);
  Buscas1 := TIBQuery(dtmFabrica.qrBuscas1);
  transacao:=TIBTransaction(dtmFabrica.transacao);
end;


function TFabrica.dataatualserv: TDate;
begin
 Result:=vDadosIni.getDataBanco(buscas);
end;

destructor TFabrica.Destroy;
begin

end;

{ TFabricaHonda }

function TFabricaHonda.abreItemPedidoCompra(numPed: string): boolean;
begin
   Result := False;

   buscas.Close;
   buscas.SQL.Text := ('SELECT ip.NUM_PED,ip.nitem, ip.GRUPO_PROD,' +
    ' ip.COD_PROD,ip.COD_EMPRESA,ip.QUANT_IT_PROD,ip.QUANT_PEN_IT,ip.QUANT_MIN_IT,' +
    ' ip.VAL_UNT_IT,ip.VAL_TOT_IT,ip.VL_V_EMP,ip.VL_V_HONDA, ip.ATIVO,' +
    ' ip.DESCR_PROD,ip.cod_grade,p.NUM_FAB_PROD,g.descricao ' +
    ' FROM ITEM_PEDIDO ip inner join PRODUTOS p' +
    ' on ip.GRUPO_PROD = p.GRUPO_PROD ' +
    ' and ip.COD_PROD = p.COD_PROD and ip.cod_empresa=p.cod_empresa' +
    ' left join grade g on ip.cod_grade=g.cod_grade and ip.cod_empresa=g.cod_empresa ' +
    ' WHERE ip.NUM_PED =' + numPed +
    ' and ip.cod_empresa = ' + vDadosIni.codEmpresa + ' and ip.ativo=1');
    buscas.Prepare;
    buscas.Open;
    buscas.FetchAll;

    Result := not buscas.IsEmpty;
end;

constructor TFabricaHonda.create;
begin
  if dtmFabrica = nil then
    dtmFabrica := TdtmFabrica.Create(dtmFabrica);

  Rdp := TRdPrint(dtmFabrica.RdPrint1);
  buscas := TIBQuery(dtmFabrica.qrBuscas);
  buscas1 := TIBQuery(dtmFabrica.qrBuscas1);
  transacao:=TIBTransaction(dtmFabrica.transacao);
  fArquivos := TStringList.Create;
  fArquivos1 := TStringList.Create;
  fArquivos2 := TStringList.Create;
end;


function TFabricaHonda.MontarArquivoPedido(nped, caminhoArquivo: string): Boolean;
var
  Arq: TextFile;
  NomeArq: string;
begin
  result := false;
  try
    NomeArq := caminhoArquivo;
    AssignFile(Arq, NomeArq);
    Rewrite(arq);

  except
    Application.MessageBox('Problema com o arquivo verifique caminho/ou Arquivo Bloqueado', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    closeFile(arq);
    exit;
  end;
  try
    if abreItemPedidoCompra(nped) then
    begin
      vDadosIni.auxstr := vDadosIni.space(26);
      while not buscas.eof do
      begin
        vDadosIni.MontaLinha(1, buscas.FieldByName('NUM_FAB_PROD').AsString);
        vDadosIni.MontaLinha(21, vDadosIni.StrZero(buscas.FieldByName('QUANT_IT_PROD').asinteger, 6));
        WriteLn(arq, vDadosIni.auxstr);
        vDadosIni.limpaLinha(vDadosIni.AuxStr);
        buscas.next;
      end;
      closeFile(arq);
      Application.MessageBox('Montagem Concluida com Sucesso.', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      buscas.Close;
      result := true;
    end;
  except
    Application.MessageBox('Problema com o arquivo verifique caminho/ou Arquivo Bloqueado', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
  end;
end;

function TFabricaHonda.MontarMSI(pDataIni, pDataFim: string): boolean;
var
 vtemp: string;
 Arq: TextFile;
 NomeArq: string;
 i: Integer;
begin
  if not vDadosIni.PesqPros('FAB005', 'MONTAR ARQUIVO', '', '','', buscas, true) then
    Exit;

  Result := False;

  try
    Nomearq := ExtractFilePath(Application.Exename) +
    inttostr(vDadosIni.vEmp.vcodconcess) + vDadosIni.vEmp.vnomeEmpresa+' TSI.TXT';
    InputQuery('Caminho do Arquivo', ' Caminho:', Nomearq);
    Application.MessageBox(PChar('O Arquivo será gerado na Pasta: ' + Nomearq), 'Informação', MB_OK + MB_ICONINFORMATION +  MB_DEFBUTTON1);
    try
      AssignFile(Arq, NomeArq);
      Rewrite(arq);
    except
      Application.MessageBox('Problema com o arquivo verifique caminho/ou Arquivo Bloqueado!', 'Informação', MB_OK + MB_ICONINFORMATION +  MB_DEFBUTTON1);
      exit;
    end;
     buscas.close;
     buscas.SQL.Text :='select distinct os.nped,os.tipo_os,os.data_ped,os.dt_prometida, '+
      ' os.data_fech,os.status_ped, os.chassi,os.km_v,vei.anofab,vei.anomod,tp.descricao,vei.data_venda,'+
      ' col.nome_vendedor,cl.nome_cliente,cl.endereco,cl.bairro,'+
      ' cl.cidade,est.sigla_uf,cl.cep,cl.email,cl.fone_cliente,cl.fone_trab,cl.fax '+
      ' from pedvenda os, colaborador col, clientes cl, estados est, veiculos vei, tipmodelo tp '+
      ' where data_ped >= '+ quotedstr(FormatDateTime('mm/dd/yyyy', strtodate(pDataIni))) +
      ' and data_ped <= '+ quotedstr(FormatDateTime('mm/dd/yyyy', strtodate(pDataFim))) +
      ' and os.cod_empresa = '+vDadosIni.codEmpresa+' and os.tipo = ''OS'' and '+
      ' os.cod_vendedor = col.cod_vendedor and os.cod_empresa = col.cod_empresa '+
      ' and os.cod_cliente = cl.cod_cliente and os.cod_empresa = cl.cod_empresa '+
      ' and cl.codigo_uf = est.codigo_uf '+
      ' and os.chassi = vei.chassi and os.cod_empresa = vei.cod_empresa and '+
      ' vei.modelo = tp.codigo and vei.cod_empresa = tp.cod_empresa ';
    buscas.Open;
    buscas.FetchAll;
    i := 0;
    while not buscas.eof do
    begin
    i := i + 1;
    vDadosIni.abreStatusProcessamento('', 'Montando MSI '+ IntToStr(i) +' de ' + IntToStr(buscas.RecordCount));
    vDadosIni.auxstr := '';
    vDadosIni.auxstr := vDadosIni.auxstr + vDadosIni.StrZero(vDadosIni.vEmp.vcodconcess,7) + '|';
    vDadosIni.auxstr := vDadosIni.auxstr + vDadosIni.vEmp.vnomeEmpresa+'|';
    vDadosIni.auxstr := vDadosIni.auxstr + vDadosIni.StrZero(buscas.FieldByName('NPED').AsInteger,6) + '|';
    if buscas.FieldByName('TIPO_OS').AsString = 'GARANTIA' then
      vDadosIni.auxstr := vDadosIni.auxstr + buscas.FieldByName('TIPO_OS').AsString+'|'
    else
     if buscas.FieldByName('TIPO_OS').AsString = 'INTERNA' then
       vDadosIni.auxstr := vDadosIni.auxstr + 'OS INTERNA|'
     else
       if buscas.FieldByName('TIPO_OS').AsString = 'CLIENTE' then
       begin
         buscas1.Close;
         buscas1.SQL.text := 'select count(*) as total from pedvenda_serv ' +
          ' where nped = ' + buscas.FieldByName('NPED').AsString +
          ' and tipo = ''OS'' and cod_empresa = ' + vDadosIni.codEmpresa +
          ' and prc_int_serv > 0 ';
         buscas1.Open;
         buscas1.FetchAll;
         if buscas1.FieldByName('total').AsInteger > 0 then
           vDadosIni.auxstr := vdadosini.auxstr + 'REVISÃO GRATUITA|'
         else
         begin
          buscas1.Close;
          buscas1.SQL.text := 'select count(*) as total from pedvenda_serv ' +
           ' where nped = ' + buscas.FieldByName('NPED').AsString+
           ' and tipo = ''OS'' and cod_empresa = ' + vDadosIni.codEmpresa +
           ' and desc_serv_ped like ''REVISAO%'' ';
          buscas1.Open;
          buscas1.FetchAll;
          if buscas1.FieldByName('total').AsInteger > 0 then
            vDadosIni.auxstr := vDadosIni.auxstr + 'REVISÃO PERIÓDICA|'
          else
            vDadosIni.auxstr := vDadosIni.auxstr + 'MECÂNICA|';
         end;
       end
       else
        vDadosIni.auxstr := vDadosIni.auxstr + buscas.FieldByName('TIPO_OS').AsString+'|';
       vDadosIni.auxstr := vDadosIni.auxstr + FormatDateTime('dd/mm/yy', buscas.FieldByName('DATA_PED').AsDateTime) + '|';
  //     copy(QrTSIosDATA_OS.AsString,1,2)+copy(QrTSIosDATA_OS.AsString,4,2)+copy(QrTSIosDATA_OS.AsString,7,4)+'|';
       if buscas.FieldByName('DT_PROMETIDA').IsNull then
        vDadosIni.auxstr := vDadosIni.auxstr + FormatDateTime('dd/mm/yy', buscas.FieldByName('DATA_PED').AsDateTime) + '|'
        //copy(QrTSIosDATA_OS.AsString,1,2)+copy(QrTSIosDATA_OS.AsString,4,2)+copy(QrTSIosDATA_OS.AsString,7,4)+'|'
       else
        vDadosIni.auxstr := vDadosIni.auxstr + FormatDateTime('dd/mm/yy', buscas.FieldByName('DT_PROMETIDA').AsDateTime) + '|';
        //copy(QrTSIosDT_PROMETIDA.AsString,1,2)+copy(QrTSIosDT_PROMETIDA.AsString,4,2)+copy(QrTSIosDT_PROMETIDA.AsString,7,4)+'|';
       if buscas.FieldByName('DATA_FECH').IsNull then
         vDadosIni.auxstr := vDadosIni.auxstr+'|'
       else
        vDadosIni.auxstr := vDadosIni.auxstr + FormatDateTime('dd/mm/yy', buscas.FieldByName('DATA_FECH').AsDateTime) + '|';
  //      copy(QrTSIosDATA_FEC_OS.AsString,1,2)+copy(QrTSIosDATA_FEC_OS.AsString,4,2)+copy(QrTSIosDATA_FEC_OS.AsString,7,4)+'|';
       if (buscas.FieldByName('STATUS_PED').IsNull) or (buscas.FieldByName('STATUS_PED').AsString = '') then
        vDadosIni.auxstr := vDadosIni.auxstr + 'Em Aberto|'
       else
        vDadosIni.auxstr := vDadosIni.auxstr + 'Encerrada|';
       buscas1.Close;
       buscas1.SQL.text := 'select desc_serv_ped from pedvenda_serv ' +
        ' where nped = ' + buscas.FieldByName('NPED').asstring +
        ' and tipo = ''OS'' and cod_empresa = '+vDadosIni.codEmpresa;
       vtemp := '';
       buscas1.Open;
       buscas1.FetchAll;
       while not buscas1.eof do
       begin
        vtemp := vtemp + buscas1.FieldByName('desc_serv_ped').AsString+' ';
        buscas1.next;
       end;
       vDadosIni.auxstr := vDadosIni.auxstr + vtemp+'|';
       vDadosIni.auxstr := vDadosIni.auxstr + buscas.FieldByName('CHASSI').AsString+'|';
       if buscas.FieldByName('DATA_PED').IsNull then
         vDadosIni.auxstr := vDadosIni.auxstr + '|'
       else
         vDadosIni.auxstr := vDadosIni.auxstr + FormatDateTime('dd/mm/yy', buscas.FieldByName('DATA_PED').AsDateTime) + '|';

       // Olhar com Herbert
       buscas1.Close;
       buscas1.SQL.Text := 'select count(*) as total from com_fat ' +
         ' where chassiv = ' + QuotedStr(buscas.FieldByName('CHASSI').AsString) +
         ' and natureza = ''S'' ' +
         ' and cod_empresa = ' + vDadosIni.codEmpresa;
       buscas1.Open;
       buscas1.FetchAll;
       if buscas1.FieldByName('total').AsInteger > 0 then
         vDadosIni.auxstr := vDadosIni.auxstr + vDadosIni.StrZero(vDadosIni.vEmp.vcodconcess,7) + '|'
       else
         vDadosIni.auxstr := vDadosIni.auxstr + '|';
       vDadosIni.auxstr := vDadosIni.auxstr + vDadosIni.StrZero(buscas.fieldbyname('KM_V').AsInteger,6)+'|';
       vDadosIni.auxstr := vDadosIni.auxstr + vDadosIni.StrZero(buscas.fieldbyname('ANOFAB').AsInteger,4)+'|';
       vDadosIni.auxstr := vDadosIni.auxstr + vDadosIni.StrZero(buscas.fieldbyname('ANOMOD').AsInteger,4)+'|';
       vDadosIni.auxstr := vDadosIni.auxstr + buscas.fieldbyname('DESCRICAO').asstring+'|';
       vDadosIni.auxstr := vDadosIni.auxstr + buscas.FieldByName('NOME_VENDEDOR').asstring+'|';
       vDadosIni.auxstr := vDadosIni.auxstr + buscas.FieldByName('NOME_CLIENTE').asstring+'|';
       vDadosIni.auxstr := vDadosIni.auxstr + buscas.FieldByName('ENDERECO').asstring+'|';
       vDadosIni.auxstr := vDadosIni.auxstr + buscas.FieldByName('BAIRRO').asstring+'|';
       vDadosIni.auxstr := vDadosIni.auxstr + buscas.FieldByName('CIDADE').asstring+'|';
       vDadosIni.auxstr := vDadosIni.auxstr + buscas.FieldByName('SIGLA_UF').asstring+'|';
       vDadosIni.auxstr := vDadosIni.auxstr + copy(buscas.FieldByName('CEP').AsString,1,5)+'-'+
       copy(buscas.FieldByName('CEP').AsString,6,3)+'|';
       vDadosIni.auxstr:=vDadosIni.auxstr + buscas.FieldByName('EMAIL').asstring+'|';
       if (buscas.FieldByName('FONE_CLIENTE').IsNull) or
       (buscas.FieldByName('FONE_CLIENTE').AsString = '') then
       begin
        vDadosIni.auxstr := vDadosIni.auxstr + '|'
       end
       else
        if Length(Trim(buscas.FieldByName('FONE_CLIENTE').AsString)) = 13 then
         vDadosIni.auxstr := vDadosIni.auxstr + buscas.FieldByName('FONE_CLIENTE').AsString+'|'
        else
         vDadosIni.auxstr := vDadosIni.auxstr + FormatMaskText('(00)0000-0000;0', buscas.FieldByName('FONE_CLIENTE').AsString)+'|';

       if (buscas.FieldByName('FONE_TRAB').IsNull) or (buscas.FieldByName('FONE_TRAB').AsString = '') then
       begin
         vDadosIni.auxstr := vDadosIni.auxstr + '|'
       end
       else
        if Length(Trim(buscas.FieldByName('FONE_TRAB').AsString)) = 13 then
         vDadosIni.auxstr := vDadosIni.auxstr + buscas.FieldByName('FONE_TRAB').AsString + '|'
        else
         vDadosIni.auxstr := vDadosIni.auxstr + FormatMaskText('(00)0000-0000;0', buscas.FieldByName('FONE_TRAB').AsString) + '|';

       if (buscas.FieldByName('FAX').IsNull) or (buscas.FieldByName('FAX').AsString = '') then
       begin
        vDadosIni.auxstr := vDadosIni.auxstr + '|'
       end
       else
        if Length(Trim(buscas.FieldByName('FAX').AsString)) = 13 then
         vDadosIni.auxstr := vDadosIni.auxstr+  buscas.FieldByName('FAX').AsString + '|'
        else
         vDadosIni.auxstr := vDadosIni.auxstr + FormatMaskText('(00)0000-0000;0', buscas.FieldByName('FAX').AsString) + '|';
    WriteLn(arq, vDadosIni.auxstr);
    buscas.next;
   end;
   vDadosIni.fechaStatusProcessamento;
   Result := True;
   closeFile(arq);
   buscas.Close;
   buscas1.Close;
   Application.MessageBox('Arquivo Magnético Criado com Sucesso!', 'Informação', MB_OK + MB_ICONINFORMATION +  MB_DEFBUTTON1);
 finally
   if Result then
     vDadosIni.GravaAuditoria('FAB005', 'MONTAR ARQUIVO', 'SUCESSO', '', '', buscas)
   else
     vDadosIni.GravaAuditoria('FAB005', 'MONTAR ARQUIVO', 'FALHA', '', '', buscas);
 end;
end;

function TFabricaHonda.ProcessarArquivo(pDirArquivo, pArquivo: string): boolean;
var
  F: TextFile;
  vflg: Integer;
  vOK: Boolean;
begin
  Result := True;
  vOK := True;
  AssignFile(F, pDirArquivo);
  Reset(F);
  while not System.eof(F) do
  begin
    Application.ProcessMessages;
    Readln(F, S);
    if (copy(s, 24, 3) = 'CRE') or (copy(s, 24, 3) = 'FDC') or
       (copy(s, 24, 3) = 'PCF') or (copy(s, 24, 3) = 'PCL') then
    begin
      vflg := 1;
      break;
    end
    else
    begin
      vflg := 0;
      break;
    end;
  end;
  CloseFile(F);

  vArqTrans := False;
  vArqCTP := False;
  vArqPecas := False;

  buscas.Close;
  buscas.SQL.Text := ' SELECT * FROM ARQ_FABRICA ' +
   ' WHERE UPPER(TRIM(NOMEARQUIVO)) LIKE :NOMEARQUIVO AND TIPOARQUIVO = :TIPOARQUIVO AND COD_EMPRESA = :COD_EMPRESA ';
  buscas.ParamByName('NOMEARQUIVO').AsString :=
    StringReplace(UpperCase(trim(pArquivo)), ExtractFileExt(UpperCase(trim(pArquivo))), '', [rfReplaceAll, rfIgnoreCase]) + '.%';
  buscas.ParamByName('TIPOARQUIVO').AsString := 'HONDA';
  buscas.ParamByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
  buscas.Open;

  if vflg = 1 then
  begin
    if not buscas.IsEmpty then
    begin
      if (pos('FDC', UpperCase(trim(pArquivo))) > 0) then
      begin
        if (trim(buscas.FieldByName('TP_FATMOTOS').AsString) = 'S')
          and (trim(buscas.FieldByName('TP_FATPECAS').AsString) = 'S') then
            vOK := False;
      end
      else if (pos('CRE', UpperCase(trim(pArquivo))) > 0) or (pos('PCF', UpperCase(trim(pArquivo))) > 0) then
      begin
         if (trim(buscas.FieldByName('TP_FATMOTOS').AsString) = '')
           and (trim(buscas.FieldByName('TP_FATPECAS').AsString) = 'S')  then
             vOK := False;
      end;

      if not vOK then
      begin
        Result := False;

        if Application.MessageBox(Pchar('Arquivo ' + QuotedStr(pArquivo) +' já foi processado, ' +
          'deseja processar arquivo novamente?'), 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDNO then
            exit;

        if not vDadosIni.PesqPros('FAB017', 'PROCESSAR', QuotedStr(trim(pArquivo)), '','', buscas, true) then
          Exit;

        Result := True;
      end;
    end;

    if not ProcessarArquivoTransito(pDirArquivo, pArquivo) then
    begin
      Result := False;
      exit;
    end;

    if not ProcessarArquivoContasAPagar(pDirArquivo, pArquivo) then
    begin
      Result := False;
      exit;
    end;

    if not ProcessarArquivoPecas(pDirArquivo, pArquivo) then
    begin
      Result := False;
      exit;
    end;

    Result := (vArqTrans) or (vArqCTP) or (vArqPecas);
  end
  else
  begin
    Application.MessageBox(PChar('Arquivo encontrado não corresponde a nenhum Lista de Integração!'
     + #13 + pDirArquivo), 'Atenção', MB_ICONERROR + MB_OK);
    Result := False;
  end;
end;

function TFabricaHonda.ProcessarArquivoContasAPagar(pDirArquivo, pArquivo: string): boolean;
var
  F, F1: TextFile;
  S, S1: string;
  vfrete, vnumnota, vserie, vv, vntit, vvalor, vndoc: string;
  vicmsub, vseg, vpis, vtpmn, vtp, vdtemit, Vdtvenc, vcodfat: string;
  vcons: array of variant;
  vflcad, i, totLinhas, vflg: integer;
  vdtvpci: Tdate;
  vchassi: array[1..99] of string;
  vqtmt,itxch: integer;
  obCTP: TContasAPagar;
  vdtvencd: Tdate;
  vCRE, vFDC, vPCF: boolean;
begin
   Result := True;
   vflg := 0;

   vCRE := False;
   vFDC := False;
   vPCF := False;

   obCTP := TContasAPagar.create;
   obCTP._definirContasPadrao;

   if obCTP.rCTP.vNumContaPadraoCH <= 0 then
   begin
     Application.MessageBox('Número de Conta Padrão de Ligação para Saída de Cheques não definida no cadastro da empresa!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
     Result := False;
     exit;
   end;

   if obCTP.rCTP.vNumContaPadraoCR <= 0 then
   begin
     Application.MessageBox('Número de Conta Padrão de Ligação para Saída de Créditos não definida no cadastro da empresa!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
     Result := False;
     exit;
   end;

   if obCTP.rCTP.vNumContaPadraoDif <= 0 then
   begin
     Application.MessageBox('Número de Conta Padrão de Ligação para Lançamento de diferença CTP não definida no cadastro da empresa!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
     Result := False;
     exit;
   end;

   if obCTP.rCTP.numContaCompraProd <= 0 then
   begin
     Application.MessageBox('Número de Conta Padrão de Ligação para Compras de Produtos não definida no cadastra da empresa!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
     Result := False;
     exit;
   end;

   if obCTP.rCTP.numCtrlCompra <= 0 then
   begin
     Application.MessageBox('Controle Padrão correspondente a Conta de Ligação para Compras de Produtos não definida no cadastro da empresa!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
     Result := False;
     exit;
   end;

   if obCTP.rCTP.vnumcontaicm <= 0 then
   begin
     Application.MessageBox('Número de Conta Padrão de Ligação para ICMS (Veículo) não definida no cadastro da empresa!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
     Result := False;
     exit;
   end;

   if obCTP.rCTP.vnumcontapiscofins <= 0 then
   begin
    Application.MessageBox('Número de Conta Padrão de Ligação para PIS/COFINS (Veículo) não definida no cadastro da empresa!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
     Result := False;
     exit;
   end;

   if obCTP.rCTP.vnumcontacveic <= 0 then
   begin
     Application.MessageBox('Número de Conta Padrão de Ligação para Compra Veículos não definida no cadastro da empresa!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
     Result := False;
     exit;
   end;

   obCTP.IniciaTransacao;
   SetLength(vcons, 2);
   AssignFile(F, pDirArquivo);
   Reset(F);
   while not System.eof(F) do
   begin
     Application.ProcessMessages;
     i := i + 1;
     Readln(F, S);
     if (copy(s, 24, 3) <> 'CRE') and (copy(s, 24, 3) <> 'FDC') and (copy(s, 24, 3) <> 'PCF') then
     begin
       vflg := 1;
       break;
     end;
   end;

   totLinhas := i;
   CloseFile(F);
   if vflg = 1 then
   begin
    exit;
   end;

   try
      if not vDadosIni.PesqPros('FAB015', 'PROCESSAR', QuotedStr(trim(pArquivo)), '','', buscas, true) then
      Exit;

    try
      i := 0;
      Reset(F);
      if vParam.pTipoArqCRE then
      begin
        vflcad := 0;
        while not System.Eof(F) do
        begin
          i := i + 1;
          Readln(F, S);
          if (copy(s, 1, 1) = 'H') then
          begin
            if copy(s, 24, 3) <> 'CRE' then
            begin
  //            Application.MessageBox('Arquivo não é CRE!', 'Atenção', MB_ICONERROR + MB_OK);
//              CloseFile(F);
              vCRE := False;
              break;
              exit;
            end;
          end;
          vCRE := True;
          vDadosIni.abreStatusProcessamento('Arquivo(s) ' + IntToStr(vParam.ContArq) + ' de '
           + IntToStr(vParam.TotArq), 'Processando CRE '+ IntToStr(i) +' de ' + IntToStr(totLinhas));
          if (copy(s, 1, 1) <> 'H') and (copy(s, 1, 1) <> 'T') then
          begin
            vndoc := copy(s, 43, 8);
            vdtemit := copy(s, 67, 2) + '/' + copy(s, 65, 2) + '/' + copy(s, 61, 4);
            vdtVenc := copy(s, 75, 2) + '/' + copy(s, 73, 2) + '/' + copy(s, 69, 4);
            vntit := copy(s, 82, 20);
            vvalor := copy(s, 107, 12) + ',' + copy(s, 119, 2);
            vtpmn := copy(s, 54, 2);
            vtp := copy(s, 41, 2);
            vpis := copy(s, 59, 2);
            vcons[0] := vndoc;
            vcons[1] := vdtvenc;
//            obCTP.close;
//            obCTP.dataSet.CommandText := 'select * from Contas_a_Pagar  ' +
//              ' where N_DOC_CTP = ' + QuotedStr(vndoc) +
//              ' and DATA_VENC_CTP = ' + Quotedstr(FormatDateTime('mm/dd/yyyy', strtodate(vdtvenc))) +
//              ' and codigo_emp = ' + vDadosIni.codEmpresa;
//            obCTP.Open;
//            if obctp.IsEmpty then
            if not obCTP.buscarContas(vndoc, Vdtvenc) then
            begin
              obCTP.buscas.Close;
              obCTP.buscas.sql.text := ' SELECT * FROM CONTAS_A_PAGAR ' +
               ' WHERE N_DOC_CTP = ' + QuotedStr(vndoc) +
               ' AND VALOR_CTP = '+vDadosIni.trocaVirgulaPorPonto(vvalor)+
               ' AND CODIGO_EMP = '+vDadosIni.codEmpresa;
              obCTP.buscas.Open;
              if not obCTP.buscas.IsEmpty then
              begin
                if Application.MessageBox(Pchar('Título Nº' + vndoc + ' Valor: ' + vvalor + ' na data: ' + vdtvenc + ' Ja esta Cadastrado' + #13 +
                  'Provavelmente com Data de Vencimento Diferente, Cadatrar?'), 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IDNO then
                  vflcad := 1
                else
                  vflcad := 0;
              end;
              if vflcad = 0 then
              begin
                obCTP.Insert;
                obCTP.dataSet.FieldByName('Codigo_ctrl').AsInteger:=obCTP.rCTP.numCtrlCompra;
                obCTP.dataSet.FieldByName('Nome_For_ctp').AsString:= 'MOTO HONDA DA AMAZÔNIA';
                obCTP.dataSet.FieldByName('Data_ent_ctp').AsDateTime:=vDadosIni.diaFFinanceiro+1;
                obCTP.dataSet.FieldByName('DTREFERENCIA').AsDateTime:=StrToDate(vdtemit);
                obCTP.dataSet.FieldByName('Historico_ctp').AsString:= 'DUPLICTAS IHS - Nº DO TÍTULO BANCO: ' + vntit;
                obCTP.dataSet.FieldByName('N_doc_ctp').AsString:= vndoc;
                obCTP.dataSet.FieldByName('Valor_ctp').AsCurrency:= strtocurr(vvalor);
                obCTP.dataSet.FieldByName('VL_CONTABIL').AsCurrency:=obCTP.dataSet.FieldByName('Valor_ctp').AsCurrency;
                obCTP.dataSet.FieldByName('Data_venc_ctp').AsDateTime:= strtodate(vdtvenc);
                obCTP.dataSet.FieldByName('TIPO_FOR_DUP').AsString:= vtp;
                obCTP.dataSet.FieldByName('SUBT_FOR_DUP').AsString:= vtpmn;
                obCTP.dataSet.FieldByName('TIP_CNT').value := 'C';
                obCTP.dataSet.FieldByName('ACEITE_CTP').AsString := 'S';
                obCTP.dataSet.FieldByName('ENTRA_PREVISAO').AsString := 'S';
                obCTP.dataSet.FieldByName('COD_FORN_NFE').asstring :=vDadosIni.vcodFornH;
                if (vtp = 'MN') and (vtpmn = '02') then
                begin
                  obCTP.dataSet.FieldByName('N_Conta_Plc').AsFloat:=obCTP.rCTP.vnumcontaicm;
                  obCTP.dataSet.FieldByName('Tipo_ctp').AsString:= 'F';
                end
                else
                begin
                  if (vtp = 'MN') and ((vpis = 'N0') or (vpis = 'N9')) then
                  begin
                    obCTP.dataSet.FieldByName('N_Conta_Plc').AsFloat:=obCTP.rCTP.vnumcontapiscofins;
                    obCTP.dataSet.FieldByName('Tipo_ctp').AsString:= 'F';
                  end
                  else
                  begin
                    obCTP.dataSet.FieldByName('N_Conta_Plc').AsFloat:=obCTP.rCTP.vnumcontacveic;
                    obCTP.dataSet.FieldByName('Tipo_ctp').AsString:= 'F';
                  end;
                end;
                obCTP.dataSet.FieldByName('CODIGO_EMP').AsString:=vDadosIni.codEmpresa;
                obCTP.dataSet.FieldByName('COD_EMP_MULT').AsString := obCTP.dataSet.FieldByName('CODIGO_EMP').AsString;
                obCTP.dataSet.FieldByName('COD_USUARIO_PROCESS').AsInteger := vDadosIni.vCodUsuario;
                obCTP.dataSet.FieldByName('DATA_PROCESS').AsDateTime := vDadosIni.getDataBanco(buscas);
                obCTP.dataSet.FieldByName('HORA_PROCESS').AsString := FormatDateTime('hh:mm:ss', vDadosIni.getDataHoraBanco(buscas));
                obCTP.dataSet.FieldByName('NOMEARQ_PROCESS').AsString := Trim(pArquivo);
                obCTP.post;
                obCTP.Apply;
              end;
            end;
          end;
        end;
      end;
      i := 0;
      Reset(F);
      if vParam.pTipoArqFDC then
      begin
        vflcad := 0;
        while not System.Eof(F) do
        begin
          i := i + 1;
          Readln(F, S);
          if (copy(s, 1, 1) = 'H') then
          begin
            if copy(s, 24, 3) <> 'FDC' then
            begin
  //            Application.MessageBox('Arquivo não é FDC!', 'Atenção', MB_ICONERROR + MB_OK);
//              CloseFile(F);
              vFDC := False;
              break;
              exit;
            end;
          end;
          vFDC := True;
          vDadosIni.abreStatusProcessamento('Arquivo(s) ' + IntToStr(vParam.ContArq) + ' de '
           + IntToStr(vParam.TotArq), 'Processando FDC '+ IntToStr(i) +' de ' + IntToStr(totLinhas));
          if (copy(s, 1, 1) <> 'H') and (copy(s, 1, 1) <> 'T') then
          begin
            if copy(s, 46, 1) = '1' then
            begin
              //
              AssignFile(F1, pDirArquivo);
              Reset(F1);
              for itxch := 1 to 99 do
                vchassi[itxch] := '';
              itxch := 1;
              while not System.Eof(F1) do
              begin
                Readln(F1, S1);
                if copy(s1, 46, 1) = '2' then
                begin
                  if copy(s, 37, 6) = copy(s1, 37, 6) then
                  begin
                    vchassi[itxch] := copy(s1, 47, 17);
                    itxch := itxch + 1;
                    //break;
                  end
                end;
              end;
              CloseFile(F1);
              //
              vnumnota := copy(s, 130, 9);
              vserie := copy(s, 43, 3);
              vdtVenc := copy(s, 61, 2) + '/' + copy(s, 59, 2) + '/' + copy(s, 55, 4);
              vdtemit := copy(s, 53, 2) + '/' + copy(s, 51, 2) + '/' + copy(s, 47, 4);
              vvalor := copy(s, 63, 13) + ',' + copy(s, 76, 2);
              vfrete := copy(s, 87, 13) + ',' + copy(s, 99, 2);
              vseg := copy(s, 102, 13) + ',' + copy(s, 114, 2);
              vicmsub := copy(s, 117, 11) + ',' + copy(s, 128, 2);
              vndoc := vnumnota + '/001';

              vcodfat := copy(s, 83, 1);
//              obCTP.close;
//              obCTP.dataSet.CommandText := 'select * from Contas_a_Pagar ' +
//                ' where N_DOC_CTP = ' + QuotedStr(vndoc) +
//                ' and DATA_VENC_CTP = ' + Quotedstr(FormatDateTime('mm/dd/yyyy', strtodate(vdtvenc))) +
//                ' and codigo_emp = ' + vDadosIni.codEmpresa;
//              obCTP.Open;
//              if obCTP.IsEmpty then
              if not obCTP.buscarContas(vndoc, Vdtvenc) then
              begin
                if strtoint(vcodfat) <> 9 then
                begin
                  obCTP.buscas.Close;
                  obCTP.buscas.sql.text := ' SELECT * FROM CONTAS_A_PAGAR ' +
                   ' WHERE N_DOC_CTP = ' + QuotedStr(vndoc) +
                   ' AND VALOR_CTP = '+ vDadosIni.trocaVirgulaPorPonto(floattostr(strtocurr(vvalor) - strtocurr(vicmsub)))+
                   ' AND CODIGO_EMP = '+vDadosIni.codEmpresa;
                  obCTP.buscas.Open;
                  if not obCTP.buscas.IsEmpty then
                  begin
                    if Application.MessageBox(Pchar('Título Nº' + vndoc + ' Valor: ' + floattostr(strtocurr(vvalor) - strtocurr(vicmsub)) + ' na data: ' + vdtvenc + ' Ja esta Cadastrado' + #13 +
                      'Provavelmente com Data de Vencimento Diferente, Cadatrar?'), 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IDNO then
                      vflcad := 1
                    else
                      vflcad := 0;
                  end;
                  if vflcad = 0 then
                  begin
                    obCTP.Insert;
                    obCTP.dataSet.FieldByName('Codigo_ctrl').AsInteger := obCTP.rCTP.numCtrlCompra;
                    obCTP.dataSet.FieldByName('COD_FORN_NFE').AsInteger := 0;
                    obCTP.dataSet.FieldByName('Nome_For_ctp').AsString := 'MOTO HONDA DA AMAZÔNIA';
                    obCTP.dataSet.FieldByName('Data_ent_ctp').AsDateTime := vDadosIni.diaFFinanceiro+1;
                    obCTP.dataSet.FieldByName('DTREFERENCIA').AsDateTime := StrToDate(vdtemit);
                    obCTP.dataSet.FieldByName('Historico_ctp').AsString := 'DUPLICTAS IHS - Nº DO TÍTULO BANCO: ' + vndoc;
                    obCTP.dataSet.FieldByName('N_doc_ctp').AsString := vndoc;
                    obCTP.dataSet.FieldByName('Valor_ctp').AsCurrency := (strtocurr(vvalor) - strtocurr(vicmsub));
                    obCTP.dataSet.FieldByName('VL_CONTABIL').AsCurrency := obCTP.dataSet.FieldByName('Valor_ctp').AsCurrency;
                    obCTP.dataSet.FieldByName('Data_venc_ctp').AsDateTime := strtodate(vdtvenc);
                    obCTP.dataSet.FieldByName('N_Conta_Plc').AsFloat := obCTP.rCTP.vnumcontacveic;
                    obCTP.dataSet.FieldByName('Tipo_ctp').AsString := 'F';
                    obCTP.dataSet.FieldByName('TIP_CNT').AsString := 'C';
                    obCTP.dataSet.FieldByName('ACEITE_CTP').AsString := 'S';
                    obCTP.dataSet.FieldByName('ENTRA_PREVISAO').AsString := 'S';
                    obCTP.dataSet.FieldByName('NUM_NOTA_NFE').asstring := vnumnota;
                    obCTP.dataSet.FieldByName('SERIE').asstring := vserie;
                    obCTP.dataSet.FieldByName('CHASSI_CONC').AsString := vchassi[1];
                    obCTP.dataSet.FieldByName('COD_FORN_NFE').asstring := vDadosIni.vcodFornH;
                    obCTP.dataSet.FieldByName('CODIGO_EMP').AsString := vDadosIni.codEmpresa;
                    obCTP.dataSet.FieldByName('COD_EMP_MULT').AsString := obCTP.dataSet.FieldByName('CODIGO_EMP').AsString;
                    obCTP.dataSet.FieldByName('COD_USUARIO_PROCESS').AsInteger := vDadosIni.vCodUsuario;
                    obCTP.dataSet.FieldByName('DATA_PROCESS').AsDateTime := vDadosIni.getDataBanco(buscas);
                    obCTP.dataSet.FieldByName('HORA_PROCESS').AsString := FormatDateTime('hh:mm:ss', vDadosIni.getDataHoraBanco(buscas));
                    obCTP.dataSet.FieldByName('NOMEARQ_PROCESS').AsString := Trim(pArquivo);
                    obCTP.post;
                    obCTP.Apply;
                  end;
                end;
              end
              else
              begin
                 if strtoint(vcodfat) = 9 then
                 begin
                    obCTP.buscas.Close;
                    if vDadosIni.vEmp.vFinanceiroUnificado then
                      obCTP.buscas.sql.text := ' DELETE FROM CONTAS_A_PAGAR ' +
                       ' WHERE N_DOC_CTP = :N_DOC_CTP AND COD_FORN_NFE = :COD_FORN_NFE ' +
                       ' AND COD_USUARIO_PROCESS > 0 AND COD_EMP_MULT = :CODIGO_EMP ' +
                       ' AND (( STATUS_CTP <> ''QUITADO'' ) OR ( STATUS_CTP IS NULL )); '
                    else
                      obCTP.buscas.sql.text := ' DELETE FROM CONTAS_A_PAGAR ' +
                       ' WHERE N_DOC_CTP = :N_DOC_CTP AND COD_FORN_NFE = :COD_FORN_NFE ' +
                       ' AND COD_USUARIO_PROCESS > 0 AND CODIGO_EMP = :CODIGO_EMP ' +
                       ' AND (( STATUS_CTP <> ''QUITADO'' ) OR ( STATUS_CTP IS NULL )); ';
                    obCTP.buscas.ParamByName('N_DOC_CTP').asstring := vndoc;
                    obCTP.buscas.ParamByName('COD_FORN_NFE').AsInteger := 0;
                    obCTP.buscas.ParamByName('CODIGO_EMP').asstring := vDadosIni.codEmpresa;
                    obCTP.buscas.ExecSQL;
                 end;
              end;
              // Icms Substr.
              vndoc := vnumnota + '/002';
              try
                vdtvpci := strtodate('30' + '/' + copy(s, 51, 2) + '/' + copy(s, 47, 4)) + 30;
                vdtvpci := strtodate('30' + copy(datetostr(vdtvpci), 3, 8));
              except
                try
                  vdtvpci := strtodate('29' + '/' + copy(s, 51, 2) + '/' + copy(s, 47, 4)) + 30;
                  vdtvpci := strtodate('29' + copy(datetostr(vdtvpci), 3, 8));
                except
                  vdtvpci := strtodate('28' + '/' + copy(s, 51, 2) + '/' + copy(s, 47, 4)) + 30;
                  vdtvpci := strtodate('28' + copy(datetostr(vdtvpci), 3, 8));
                end;
              end;
//              obCTP.close;
//              obCTP.dataSet.CommandText := 'select * from Contas_a_Pagar ' +
//                ' where N_DOC_CTP = ' + QuotedStr(vndoc) +
//                ' and DATA_VENC_CTP = '+ Quotedstr(FormatDateTime('mm/dd/yyyy', vdtvpci)) +
//                ' and codigo_emp = '+vDadosIni.codEmpresa;
//              obCTP.Open;
//              if obCTP.isempty then
              if not obCTP.buscarContas(vndoc, DateToStr(vdtvpci)) then
              begin
                if strtoint(vcodfat) <> 9 then
                begin
                  obCTP.buscas.Close;
                  obCTP.buscas.sql.text := ' SELECT * FROM CONTAS_A_PAGAR ' +
                   ' WHERE N_DOC_CTP = ' + QuotedStr(vndoc) +
                   ' AND VALOR_CTP = ' + vDadosIni.trocaVirgulaPorPonto(vicmsub) +
                   ' AND CODIGO_EMP = ' + vDadosIni.codEmpresa;
                  obCTP.buscas.Open;
                  if obCTP.buscas.IsEmpty then
                  begin
                    obCTP.Insert;
                    obCTP.dataSet.FieldByName('Codigo_ctrl').AsInteger := obCTP.rCTP.numCtrlCompra;
                    obCTP.dataSet.FieldByName('COD_FORN_NFE').AsInteger := 0;
                    obCTP.dataSet.FieldByName('Nome_For_ctp').AsString := 'MOTO HONDA DA AMAZÔNIA';
                    obCTP.dataSet.FieldByName('Data_ent_ctp').AsDateTime := vDadosIni.diaFFinanceiro+1;
                    obCTP.dataSet.FieldByName('DTREFERENCIA').AsDateTime := StrToDate(vdtemit);
                    obCTP.dataSet.FieldByName('Historico_ctp').AsString := 'ICMS SUBSTR. TRIB. MOTO: ' + vndoc;
                    obCTP.dataSet.FieldByName('N_doc_ctp').AsString := vndoc;
                    obCTP.dataSet.FieldByName('Valor_ctp').AsCurrency := strtocurr(vicmsub);
                    obCTP.dataSet.FieldByName('VL_CONTABIL').AsCurrency := obCTP.dataSet.FieldByName('Valor_ctp').AsCurrency;
                    obCTP.dataSet.FieldByName('Data_venc_ctp').AsDateTime := vdtvpci;
                    obCTP.dataSet.FieldByName('N_Conta_Plc').AsFloat := obCTP.rCTP.vnumcontaicm;
                    obCTP.dataSet.FieldByName('Tipo_ctp').AsString := 'F';
                    obCTP.dataSet.FieldByName('TIP_CNT').AsString := 'C';
                    obCTP.dataSet.FieldByName('ACEITE_CTP').AsString := 'S';
                    obCTP.dataSet.FieldByName('ENTRA_PREVISAO').AsString := 'S';
                    obCTP.dataSet.FieldByName('NUM_NOTA_NFE').asstring := vnumnota;
                    obCTP.dataSet.FieldByName('SERIE').asstring := vserie;
                    obCTP.dataSet.FieldByName('CHASSI_CONC').AsString := vchassi[1];
                    obCTP.dataSet.FieldByName('COD_FORN_NFE').asstring := vDadosIni.vcodFornH;
                    obCTP.dataSet.FieldByName('CODIGO_EMP').AsString := vDadosIni.codEmpresa;
                    obCTP.dataSet.FieldByName('COD_EMP_MULT').AsString := obCTP.dataSet.FieldByName('CODIGO_EMP').AsString;
                    obCTP.dataSet.FieldByName('COD_USUARIO_PROCESS').AsInteger := vDadosIni.vCodUsuario;
                    obCTP.dataSet.FieldByName('DATA_PROCESS').AsDateTime := vDadosIni.getDataBanco(buscas);
                    obCTP.dataSet.FieldByName('HORA_PROCESS').AsString := FormatDateTime('hh:mm:ss', vDadosIni.getDataHoraBanco(buscas));
                    obCTP.dataSet.FieldByName('NOMEARQ_PROCESS').AsString := Trim(pArquivo);
                    obCTP.post;
                    obCTP.Apply;
                  end;
                end;
              end
              else
              begin
                 if strtoint(vcodfat) = 9 then
                 begin
                    obCTP.buscas.Close;
                    if vDadosIni.vEmp.vFinanceiroUnificado then
                      obCTP.buscas.sql.text := ' DELETE FROM CONTAS_A_PAGAR ' +
                       ' WHERE N_DOC_CTP = :N_DOC_CTP AND COD_FORN_NFE = :COD_FORN_NFE ' +
                       ' AND COD_USUARIO_PROCESS > 0 AND COD_EMP_MULT = :CODIGO_EMP ' +
                       ' AND (( STATUS_CTP <> ''QUITADO'' ) OR ( STATUS_CTP IS NULL )); '
                    else
                      obCTP.buscas.sql.text := ' DELETE FROM CONTAS_A_PAGAR ' +
                       ' WHERE N_DOC_CTP = :N_DOC_CTP AND COD_FORN_NFE = :COD_FORN_NFE ' +
                       ' AND COD_USUARIO_PROCESS > 0 AND CODIGO_EMP = :CODIGO_EMP ' +
                       ' AND (( STATUS_CTP <> ''QUITADO'' ) OR ( STATUS_CTP IS NULL )); ';
                    obCTP.buscas.ParamByName('N_DOC_CTP').asstring := vndoc;
                    obCTP.buscas.ParamByName('COD_FORN_NFE').AsInteger := 0;
                    obCTP.buscas.ParamByName('CODIGO_EMP').asstring := vDadosIni.codEmpresa;
                    obCTP.buscas.ExecSQL;
                 end;
              end;
              // PIS/COFINS
              vndoc := vnumnota + '/003';
              vdtvpci := strtodate('15' + '/' + copy(s, 51, 2) + '/' + copy(s, 47, 4)) + 30;
              vdtvpci := strtodate('15' + copy(datetostr(vdtvpci), 3, 8));
//              obCTP.Close;
//              obCTP.dataSet.CommandText := ' select * from Contas_a_Pagar ' +
//               ' where N_DOC_CTP = ' + QuotedStr(vndoc) +
//               ' and DATA_VENC_CTP = ' + Quotedstr(FormatDateTime('mm/dd/yyyy', vdtvpci)) +
//               ' and codigo_emp = ' + vDadosIni.codEmpresa;
//              obCTP.Open;
//              if obCTP.isempty then
              if not obCTP.buscarContas(vndoc, DateToStr(vdtvpci)) then
              begin
                if strtoint(vcodfat) <> 9 then
                begin
                  obCTP.buscas.Close;
                  obCTP.buscas.sql.text := ' SELECT * FROM CONTAS_A_PAGAR ' +
                   ' WHERE N_DOC_CTP = ' + QuotedStr(vndoc) +
                   ' AND VALOR_CTP = ' + vDadosIni.trocaVirgulaPorPonto(floattostr((((strtocurr(vvalor) - strtocurr(vicmsub)) * strtocurr(vdadosini.vpiscof)) / 100))) +
                   ' AND CODIGO_EMP = '+vDadosIni.codEmpresa;
                  obCTP.buscas.Open;
                  if obCTP.buscas.IsEmpty then
                  begin
                    obCTP.Insert;
                    obCTP.dataSet.FieldByName('Codigo_ctrl').AsInteger := obCTP.rCTP.numCtrlCompra;
                    obCTP.dataSet.FieldByName('COD_FORN_NFE').AsInteger := 0;
                    obCTP.dataSet.FieldByName('Nome_For_ctp').AsString := 'MOTO HONDA DA AMAZÔNIA';
                    obCTP.dataSet.FieldByName('Data_ent_ctp').AsDateTime := vDadosIni.diaFFinanceiro+1;
                    obCTP.dataSet.FieldByName('DTREFERENCIA').AsDateTime := StrToDate(vdtemit);
                    obCTP.dataSet.FieldByName('Historico_ctp').AsString := 'PIS/COFINS MOTO: ' + vndoc;
                    obCTP.dataSet.FieldByName('N_doc_ctp').AsString := vndoc;
                    obCTP.dataSet.FieldByName('Valor_ctp').AsCurrency := (((strtocurr(vvalor) - strtocurr(vicmsub)) * strtocurr(vdadosini.vpiscof)) / 100);
                    obCTP.dataSet.FieldByName('VL_CONTABIL').AsCurrency := obCTP.dataSet.FieldByName('Valor_ctp').AsCurrency;
                    obCTP.dataSet.FieldByName('Data_venc_ctp').AsCurrency := vdtvpci;
                    obCTP.dataSet.FieldByName('N_Conta_Plc').AsFloat := obCTP.rCTP.vnumcontapiscofins;
                    obCTP.dataSet.FieldByName('Tipo_ctp').AsString := 'F';
                    obCTP.dataSet.FieldByName('TIP_CNT').AsString := 'C';
                    obCTP.dataSet.FieldByName('ACEITE_CTP').AsString := 'S';
                    obCTP.dataSet.FieldByName('ENTRA_PREVISAO').AsString := 'S';
                    obCTP.dataSet.FieldByName('NUM_NOTA_NFE').asstring := vnumnota;
                    obCTP.dataSet.FieldByName('SERIE').asstring := vserie;
                    obCTP.dataSet.FieldByName('CHASSI_CONC').AsString := vchassi[1];
                    obCTP.dataSet.FieldByName('COD_FORN_NFE').asstring := vDadosIni.vcodFornH;
                    obCTP.dataSet.FieldByName('CODIGO_EMP').AsString := vDadosIni.codEmpresa;
                    obCTP.dataSet.FieldByName('COD_EMP_MULT').AsString := obCTP.dataSet.FieldByName('CODIGO_EMP').AsString;
                    obCTP.dataSet.FieldByName('COD_USUARIO_PROCESS').AsInteger := vDadosIni.vCodUsuario;
                    obCTP.dataSet.FieldByName('DATA_PROCESS').AsDateTime := vDadosIni.getDataBanco(buscas);
                    obCTP.dataSet.FieldByName('HORA_PROCESS').AsString := FormatDateTime('hh:mm:ss', vDadosIni.getDataHoraBanco(buscas));
                    obCTP.dataSet.FieldByName('NOMEARQ_PROCESS').AsString := Trim(pArquivo);
                    obCTP.post;
                    obCTP.Apply;
                  end;
                end;
              end
              else
              begin
                 if strtoint(vcodfat) = 9 then
                 begin
                    obCTP.buscas.Close;
                    if vDadosIni.vEmp.vFinanceiroUnificado then
                      obCTP.buscas.sql.text := ' DELETE FROM CONTAS_A_PAGAR ' +
                       ' WHERE N_DOC_CTP = :N_DOC_CTP AND COD_FORN_NFE = :COD_FORN_NFE ' +
                       ' AND COD_USUARIO_PROCESS > 0 AND COD_EMP_MULT = :CODIGO_EMP ' +
                       ' AND (( STATUS_CTP <> ''QUITADO'' ) OR ( STATUS_CTP IS NULL )); '
                    else
                      obCTP.buscas.sql.text := ' DELETE FROM CONTAS_A_PAGAR ' +
                       ' WHERE N_DOC_CTP = :N_DOC_CTP AND COD_FORN_NFE = :COD_FORN_NFE ' +
                       ' AND COD_USUARIO_PROCESS > 0 AND CODIGO_EMP = :CODIGO_EMP ' +
                       ' AND (( STATUS_CTP <> ''QUITADO'' ) OR ( STATUS_CTP IS NULL )); ';
                    obCTP.buscas.ParamByName('N_DOC_CTP').asstring := vndoc;
                    obCTP.buscas.ParamByName('COD_FORN_NFE').AsInteger := 0;
                    obCTP.buscas.ParamByName('CODIGO_EMP').asstring := vDadosIni.codEmpresa;
                    obCTP.buscas.ExecSQL;
                 end;
              end;
            end;
          end;
        end;
      end;
      i := 0;
      Reset(F);
      if vParam.pTipoArqPCF then
      begin
        while not System.Eof(F) do
        begin
            i := i + 1;
            Readln(F, S);
            if (copy(s, 1, 1) = 'H') then
            begin
              if copy(s, 24, 3) <> 'PCF' then
              begin
//                Application.MessageBox('Arquivo não é de NF de Pecas Honda!', 'Atenção', MB_ICONERROR + MB_OK);
//                CloseFile(F);
                vPCF := False;
                break;
                exit;
              end;
            end;
            vPCF := True;
            vDadosIni.abreStatusProcessamento('Arquivo(s) ' + IntToStr(vParam.ContArq) + ' de '
             + IntToStr(vParam.TotArq), 'Processando PCF '+ IntToStr(i) +' de ' + IntToStr(totLinhas));
            if (copy(s, 1, 1) <> 'H') and (copy(s, 1, 1) <> 'T') then
            begin
              if copy(s, 57, 1) = '1' then
              begin
                vnumnota := copy(s, 47, 10);
                vserie := Copy(s, 64, 3);
                vdtVenc := copy(s, 95, 2) + '/' + copy(s, 93, 2) + '/' + copy(s, 89, 4);
                vdtemit := copy(s, 73, 02) + '/' + copy(s, 71, 2) + '/' + copy(s, 67, 4);
                vvalor := copy(s, 116, 11) + ',' + copy(s, 127, 2);
                vndoc := vnumnota + '/001';
                try
                  vdtvencd:=strtodate(vdtvenc);
                except
                  on e : exception do
                  begin
                    Application.MessageBox(pchar('Erro na data de vencimento. Erro: '+ e.Message+#13+
                    ' será considerada a data do financeiro como vencimento'), 'Atenção', 0+64 );
                    Vdtvenc:=datetostr(vDadosIni.diaFFinanceiro+1);
                  end;
                end;
//                obCTP.close;
//                obCTP.dataSet.CommandText:='select * from Contas_a_Pagar ' +
//                 ' where N_DOC_CTP = ' + QuotedStr(vndoc) +
//                 ' and DATA_VENC_CTP = ' + quotedstr(FormatDateTime('mm/dd/yyyy', strtodate(vdtvenc))) +
//                 ' and codigo_emp = ' + vDadosIni.codEmpresa;
//                obCTP.Open;
//                if obCTP.dataSet.IsEmpty then
               if not obCTP.buscarContas(vndoc, Vdtvenc) then
               begin
                  obCTP.buscas.Close;
                  obCTP.buscas.sql.text:='select ctp.*, '''' identificacao_emp from Contas_a_Pagar ctp' +
                   ' where ctp.N_DOC_CTP = ' + QuotedStr(vndoc) +
                   ' and ctp.valor_ctp = ' + vDadosIni.trocaVirgulaPorPonto(vvalor) +
                   ' and ctp.codigo_emp = ' + vDadosIni.codEmpresa;
                  obCTP.buscas.Open;
                  if not obCTP.buscas.IsEmpty then
                  begin
                    if Application.MessageBox(Pchar('Título Nº' + vndoc + ' Valor: ' + vvalor + ' na data: ' + vdtvenc + ' Ja esta Cadastrado' + #13 +
                      'Provavelmente com Data de Vencimento Diferente, Cadatrar?'), 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IDNO then
                      vflcad := 1
                    else
                      vflcad := 0;
                  end;
                  if vflcad = 0 then
                  begin
                    obCTP.Insert;
                    obCTP.dataSet.FieldByName('Codigo_ctrl').AsInteger := obCTP.rCTP.numCtrlCompra;
                    obCTP.dataSet.FieldByName('COD_FORN_NFE').asstring := vDadosIni.vcodFornP;
                    obCTP.dataSet.FieldByName('Nome_For_ctp').AsString := 'MOTO HONDA DA AMAZÔNIA';
                    obCTP.dataSet.FieldByName('Data_ent_ctp').AsDateTime := vDadosIni.diaFFinanceiro+1;
                    obCTP.dataSet.FieldByName('DTREFERENCIA').AsDateTime := StrToDate(vdtemit);
                    obCTP.dataSet.FieldByName('Historico_ctp').AsString := 'DUPLICTAS IHS PECAS- Nº DO TÍTULO BANCO: ' + vndoc;
                    obCTP.dataSet.FieldByName('N_doc_ctp').AsString := vndoc;
                    obCTP.dataSet.FieldByName('Valor_ctp').AsCurrency := strtocurr(vvalor);
                    obctp.dataSet.FieldByName('VL_CONTABIL').AsCurrency := obCTP.dataSet.FieldByName('Valor_ctp').AsCurrency;
                    obCTP.dataSet.FieldByName('Data_venc_ctp').AsDateTime := strtodate(vdtvenc);
                    obCTP.dataSet.FieldByName('N_Conta_Plc').AsFloat := obCTP.rCTP.numContaCompraProd;
                    obCTP.dataSet.FieldByName('Tipo_ctp').AsString := 'F';
                    obCTP.dataSet.FieldByName('TIP_CNT').AsString := 'C';
                    obCTP.dataSet.FieldByName('ACEITE_CTP').AsString := 'S';
                    obCTP.dataSet.FieldByName('ENTRA_PREVISAO').AsString := 'S';
                    obCTP.dataSet.FieldByName('NUM_NOTA_NFE').asstring := vnumnota;
                    obCTP.dataSet.FieldByName('SERIE').asstring := vserie;
                    obCTP.dataSet.FieldByName('CODIGO_EMP').AsString :=vDadosIni.codEmpresa;
                    obCTP.dataSet.FieldByName('COD_EMP_MULT').AsString := obCTP.dataSet.FieldByName('CODIGO_EMP').AsString;
                    obCTP.dataSet.FieldByName('COD_USUARIO_PROCESS').AsInteger := vDadosIni.vCodUsuario;
                    obCTP.dataSet.FieldByName('DATA_PROCESS').AsDateTime := vDadosIni.getDataBanco(buscas);
                    obCTP.dataSet.FieldByName('HORA_PROCESS').AsString := FormatDateTime('hh:mm:ss', vDadosIni.getDataHoraBanco(buscas));
                    obCTP.dataSet.FieldByName('NOMEARQ_PROCESS').AsString := Trim(pArquivo);
                    obCTP.Post;
                    obCTP.Apply;
                  end;
                end;
              end;
            end;
        end;
      end;
      CloseFile(F);
      obCTP.CommitaTransacao;
      vArqCTP := True;
    except
     on e: exception do
     begin
       registraErro('Erro no processamento do arquivo. Erro: '+ e.Message+ #13 +
        'Arquivo: ' + IntToStr(vParam.ContArq) + ' de ' + IntToStr(vParam.TotArq) + #13 +
        'Processando '+ IntToStr(i) +' de ' + IntToStr(totLinhas) + #13 +
        'NomeArquivo: ' + QuotedStr(trim(pArquivo)));
       Result := False;
       Application.MessageBox(pchar('Erro no processamento do arquivo. Erro: '+ e.Message+ #13 +
       'Arquivo: ' + IntToStr(vParam.ContArq) + ' de ' + IntToStr(vParam.TotArq) + #13 +
       'Processando '+ IntToStr(i) +' de ' + IntToStr(totLinhas) + #13 +
       'NomeArquivo: ' + QuotedStr(trim(pArquivo))), 'Atenção', 0+64 );
       CloseFile(F);
       obCTP.RollBackTransacao;
     end;
    end;
  obCTP.Close;
  finally
   vDadosIni.fechaStatusProcessamento;
   obCTP.buscas.Close;
   obCTP.buscas.SQL.Text := ' UPDATE OR INSERT INTO ARQ_FABRICA ' +
     ' (NOMEARQUIVO, TIPOARQUIVO, COD_EMPRESA, TP_FATPECAS, ATIVO) ' +
     ' VALUES ' +
     ' (:NOMEARQUIVO, :TIPOARQUIVO, :COD_EMPRESA, :TP_FATPECAS, :ATIVO) ' +
     ' MATCHING (NOMEARQUIVO, TIPOARQUIVO, COD_EMPRESA); ';
   obCTP.buscas.ParamByName('NOMEARQUIVO').AsString := trim(pArquivo);
   obCTP.buscas.ParamByName('TIPOARQUIVO').AsString := 'HONDA';
   obCTP.buscas.ParamByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
   obCTP.buscas.ParamByName('ATIVO').AsInteger := 1;

   if (vArqCTP) and ((vCRE) or (vFDC) or (vPCF)) then
   begin
     vDadosIni.GravaAuditoria('FAB015', 'PROCESSAR', 'SUCESSO ARQUIVO ' + QuotedStr(trim(pArquivo)), '', '', buscas);
     obCTP.buscas.ParamByName('TP_FATPECAS').AsString := 'S';
   end
   else
   begin
     vDadosIni.GravaAuditoria('FAB015', 'PROCESSAR', 'FALHA ARQUIVO ' + QuotedStr(trim(pArquivo)), '', '', buscas);
     obCTP.buscas.ParamByName('TP_FATPECAS').AsString := 'N';
   end;
   obCTP.buscas.ExecSQL;
   obCTP.CommitaTransacao;
  end;
end;

function TFabricaHonda.ProcessarArquivoPecas(pDirArquivo, pArquivo: string): boolean;
var
  vcad, vcodpps: string;
  vg, vcodint: integer;
  vcodprod, vdescprod, vvalor, vtipolista: string;
  vcodp, vcodps: string;
  vgcodp, vgcodps: integer;
  vflg, ic, ix, i, totLinhas: integer;
  vhora: Ttime;
  obProd: TProdutos;
  vUsarRegraCFOPCSTEntrada,vUsarRegraCFOPCSTSaida: string;
  vListaTemp: TStringList;
begin
   Result := True;
   vflg := 0;

   totLinhas := 0;
   vg := 1;
   i := 0;
   ic := 0;
   ix := 0;

   obProd := TProdutos.create;
   obProd.CodBarra.abreCodBarras(0,'');
//   obProd.abreProdutos(0);

	 vDadosIni.vDataHora := vDadosIni.getDataHoraBanco(obProd.buscas);

   obProd.Close;
   obProd.dataSet.CommandText := ' SELECT PRODUTOS.*, CAST(0 AS FLOAT) ESTOQUE, CAST(0 AS FLOAT) EST_PRIMA FROM PRODUTOS ' +
     ' where PRODUTOS.NUM_FAB_PROD = ' + QuotedStr('') +
     ' and PRODUTOS.COD_EMPRESA = ' + vDadosIni.codEmpresa +
     ' and PRODUTOS.ATIVO = 1 ';
   obProd.Open;
   obprod.dataSet.Insert;
   obProd.GeraCodProd(inttostr(vg));
   vcodint := StrToInt(obprod.dataSet.FieldByName('COD_PROD').AsString);
 //  .Memo1.Lines.clear;
   try
     vDadosIni.abreStatusProcessamento('Carregando arquivo(s) ' + IntToStr(vParam.ContArq) + ' de ' +
     	IntToStr(vParam.TotArq), 'Arquivo PCL');
     AssignFile(F, pDirArquivo);
	   Reset(F);
//     while not System.eof(F) do
//     begin
//       Application.ProcessMessages;
//       i := i + 1;
//       Readln(F, S);
//       if copy(s, 24, 3) <> 'PCL' then
//       begin
//        vflg := 1;
//  //      Application.MessageBox('Arquivo não é de Lista de Preco Honda!', 'Atenção', MB_ICONERROR + MB_OK);
//        break;
//       end;
//     end;
//     totLinhas := i;
     vListaTemp := TStringList.Create;
     vListaTemp.LoadFromFile(pDirArquivo);
     totLinhas := vListaTemp.Count;
   finally
     FreeAndNil(vListaTemp);
     vDadosIni.fechaStatusProcessamento;
   end;
   i := 0;
   CloseFile(F);
   if vflg = 1 then
   begin
    exit;
   end;

 try
   if not vDadosIni.PesqPros('FAB016', 'PROCESSAR', QuotedStr(trim(pArquivo)), '','', buscas, true) then
    Exit;

   Reset(F);
   vhora := time;

   if trim(vParam.pMzM1) = '' then
   begin
     Application.MessageBox('MZ/M1 Padrão não informado!', 'Atenção', MB_ICONERROR + MB_OK);
     Result := False;
     Exit;
   end;

   try
     StrToFloat(vParam.pMzM1)
   except
     Application.MessageBox('Problemas com o formato do MZ/M1!', 'Atenção', MB_ICONERROR + MB_OK);
     Result := False;
     Exit;
   end;

   if trim(vParam.pQzQ1) = '' then
   begin
     Application.MessageBox('QZ/Q1 Padrão não informado!', 'Atenção', MB_ICONERROR + MB_OK);
     Result := False;
     Exit;
   end;

   try
     StrToFloat(vParam.pQzQ1)
   except
     Application.MessageBox('Problemas com o formato do QZ/Q1!', 'Atenção', MB_ICONERROR + MB_OK);
     Result := False;
     Exit;
   end;

   if trim(vParam.pPZ) = '' then
   begin
     Application.MessageBox('Pz Padrão não informado!', 'Atenção', MB_ICONERROR + MB_OK);
     Result := False;
     Exit;
   end;

   try
     StrToFloat(vParam.pPZ)
   except
     Application.MessageBox('Problemas com o formato do Pz!', 'Atenção', MB_ICONERROR + MB_OK);
     Result := False;
     Exit;
   end;

   if trim(vParam.pH0) = '' then
   begin
     Application.MessageBox('H0 Padrão não informado!', 'Atenção', MB_ICONERROR + MB_OK);
     Result := False;
     Exit;
   end;

   try
     StrToFloat(vParam.pH0)
   except
     Application.MessageBox('Problemas com o formato do H0!', 'Atenção', MB_ICONERROR + MB_OK);
     Result := False;
     Exit;
   end;

   if trim(vParam.pH2) = '' then
   begin
     Application.MessageBox('H2 Padrão não informado!', 'Atenção', MB_ICONERROR + MB_OK);
     Result := False;
     Exit;
   end;

   try
     StrToFloat(vParam.pH2)
   except
     Application.MessageBox('Problemas com o formato do H2!', 'Atenção', MB_ICONERROR + MB_OK);
     Result := False;
     Exit;
   end;

   if trim(vParam.pH3) = '' then
   begin
     Application.MessageBox('H3 Padrão não informado!', 'Atenção', MB_ICONERROR + MB_OK);
     Result := False;
     Exit;
   end;

   try
     StrToFloat(vParam.pH3)
   except
     Application.MessageBox('Problemas com o formato do H3!', 'Atenção', MB_ICONERROR + MB_OK);
     Result := False;
     Exit;
   end;

   if trim(vParam.pH4) = '' then
   begin
     Application.MessageBox('H4 Padrão não informado!', 'Atenção', MB_ICONERROR + MB_OK);
     Result := False;
     Exit;
   end;

   try
     StrToFloat(vParam.pH4)
   except
     Application.MessageBox('Problemas com o formato do H4!', 'Atenção', MB_ICONERROR + MB_OK);
     Result := False;
     Exit;
   end;

   if trim(vParam.pH5) = '' then
   begin
     Application.MessageBox('H5 Padrão não informado!', 'Atenção', MB_ICONERROR + MB_OK);
     Result := False;
     Exit;
   end;

   try
     StrToFloat(vParam.pH5)
   except
     Application.MessageBox('Problemas com o formato do H5!', 'Atenção', MB_ICONERROR + MB_OK);
     Result := False;
     Exit;
   end;

   if trim(vParam.pH6) = '' then
   begin
     Application.MessageBox('H6 Padrão não informado!', 'Atenção', MB_ICONERROR + MB_OK);
     Result := False;
     Exit;
   end;

   try
     StrToFloat(vParam.pH6)
   except
     Application.MessageBox('Problemas com o formato do H6!', 'Atenção', MB_ICONERROR + MB_OK);
     Result := False;
     Exit;
   end;

   if trim(vParam.pH7) = '' then
   begin
     Application.MessageBox('H7 Padrão não informado!', 'Atenção', MB_ICONERROR + MB_OK);
     Result := False;
     Exit;
   end;

   try
     StrToFloat(vParam.pH7)
   except
     Application.MessageBox('Problemas com o formato do H7!', 'Atenção', MB_ICONERROR + MB_OK);
     Result := False;
     Exit;
   end;

   if trim(vParam.pH8) = '' then
   begin
     Application.MessageBox('H8 Padrão não informado!', 'Atenção', MB_ICONERROR + MB_OK);
     Result := False;
     Exit;
   end;

   try
     StrToFloat(vParam.pH8)
   except
     Application.MessageBox('Problemas com o formato do H8!', 'Atenção', MB_ICONERROR + MB_OK);
     Result := False;
     Exit;
   end;

   if trim(vParam.pPN) = '' then
   begin
     Application.MessageBox('PN Padrão não informado!', 'Atenção', MB_ICONERROR + MB_OK);
     Result := False;
     Exit;
   end;

   try
     StrToFloat(vParam.pPN)
   except
     Application.MessageBox('Problemas com o formato do PN!', 'Atenção', MB_ICONERROR + MB_OK);
     Result := False;
     Exit;
   end;

   if trim(vParam.pCA) = '' then
   begin
     Application.MessageBox('CA Padrão não informado!', 'Atenção', MB_ICONERROR + MB_OK);
     Result := False;
     Exit;
   end;

   try
     StrToFloat(vParam.pCA)
   except
     Application.MessageBox('Problemas com o formato do CA!', 'Atenção', MB_ICONERROR + MB_OK);
     Result := False;
     Exit;
   end;

   if trim(vParam.pAliqPadrao) = '' then
   begin
     Application.MessageBox('Alíquota Padrão não informado!', 'Atenção', MB_ICONERROR + MB_OK);
     Result := False;
     Exit;
   end;

   try
     StrToFloat(vParam.pAliqPadrao)
   except
     Application.MessageBox('Problemas com o formato do Alíquota!', 'Atenção', MB_ICONERROR + MB_OK);
     Result := False;
     Exit;
   end;

   if trim(vParam.pNatOP) = '' then
   begin
     Application.MessageBox('CFOP Padrão não informado', 'Atenção', MB_ICONERROR + MB_OK);
     Result := False;
     Exit;
   end;

   try
     StrToInt(vParam.pNatOP)
   except
     Application.MessageBox('Problemas com o formato do CFOP!', 'Atenção', MB_ICONERROR + MB_OK);
     Result := False;
     Exit;
   end;

   if trim(vParam.pCoefLoja) = '' then
   begin
     Application.MessageBox('Coeficiente Loja não informado', 'Atenção', MB_ICONERROR + MB_OK);
     Result := False;
     Exit;
   end;

   try
     StrToFloat(vParam.pCoefLoja)
   except
     Application.MessageBox('Problemas com o formato do Coeficiente Loja!', 'Atenção', MB_ICONERROR + MB_OK);
     Result := False;
     Exit;
   end;

   if trim(vParam.pComitar) = '' then
   	vParam.pComitar := '2000';

   try
    	vParam.pComitar := Trim(vDadosIni.apenasNumeros(vParam.pComitar));
   except
   		vParam.pComitar := '2000';
   end;

   ArqConfig.WriteString('alteracaop', 'mzm1', vParam.pMzM1);
   ArqConfig.WriteString('alteracaop', 'qzq1', vParam.pQzQ1);
   ArqConfig.WriteString('alteracaop', 'pz', vParam.pPZ);
   ArqConfig.WriteString('alteracaop', 'h3', vParam.pH3);
   ArqConfig.WriteString('alteracaop', 'h4', vParam.pH4);
   ArqConfig.WriteString('alteracaop', 'h2', vParam.pH2);
   ArqConfig.WriteString('alteracaop', 'h5', vParam.pH5);
   ArqConfig.WriteString('alteracaop', 'h6', vParam.pH6);
   ArqConfig.WriteString('alteracaop', 'h7', vParam.pH7);
   ArqConfig.WriteString('alteracaop', 'h8', vParam.pH8);
   ArqConfig.WriteString('alteracaop', 'ca', vParam.pCA);
   ArqConfig.WriteString('alteracaop', 'pn', vParam.pPN);
   ArqConfig.WriteString('alteracaop', 'h0', vParam.pH0);
   ArqConfig.WriteString('alteracaop', 'natopp', vParam.pNatOP);

   vUsarRegraCFOPCSTEntrada := vDadosIni.vEmp.vUsarRegraCFOPCSTEntrada;
   vUsarRegraCFOPCSTSaida := vDadosIni.vEmp.vUsarRegraCFOPCSTSaida;
   vDadosIni.vEmp.vUsarRegraCFOPCSTEntrada := 'N';
   vDadosIni.vEmp.vUsarRegraCFOPCSTSaida := 'N';
   Reset(F);
   while not System.eof(F) do
   begin
    try
      i := i + 1;
      Application.ProcessMessages;
      Readln(F, S);
      vDadosIni.abreStatusProcessamento('Arquivo(s) ' + IntToStr(vParam.ContArq) + ' de '
           + IntToStr(vParam.TotArq), 'Processando PCL '+ IntToStr(i) +' de ' + IntToStr(totLinhas));
      if (copy(s, 1, 1) <> 'H') and (copy(s, 1, 1) <> 'T') then
      begin
       vcad := copy(s, 74, 1);
       vcodpps := copy(s, 49, 2);
       vcodprod := copy(s, 54, 20);
       vdescprod := copy(s, 75, 30);
       vtipolista := copy(s, 112, 2);
       vvalor := copy(s, 105, 5) + ',' + copy(s, 110, 2);
       if vcad = '0' then
       begin
        obProd.Close;
        obProd.dataSet.CommandText := ' SELECT PRODUTOS.*, CAST(0 AS FLOAT) ESTOQUE, CAST(0 AS FLOAT) EST_PRIMA FROM PRODUTOS ' +
          ' where PRODUTOS.NUM_FAB_PROD = ' + QuotedStr(vcodprod) +
          ' and PRODUTOS.COD_EMPRESA = ' + vDadosIni.codEmpresa +
          ' and PRODUTOS.ATIVO = 1 ';
        obProd.Open;
        if obProd.IsEmpty then
        begin
         obProd.ProcessamentoFabrica := true;
         obProd.statusRegistro := 'I';
         obProd.dataSet.Insert;
         obProd.setaCamposVariaveisInsert;
         obProd.dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
         obProd.dataSet.FieldByName('GRUPO_PROD').AsInteger := vg;
         obProd.dataSet.FieldByName('COD_PROD').AsString :=
         	vDadosIni.strzero(vcodint, strtoint(vDadosIni.vProduto.vDigitosProd));
         vcodint := vcodint + 1;
         obProd.dataSet.FieldByName('ICM_PROD').AsString := vParam.pAliqPadrao;
         obProd.dataSet.FieldByName('DESCR_PROD').AsString := Copy(trim(vdescprod), 1, 75);
         obProd.dataSet.FieldByName('DESCR_PROD_RED').AsString := Copy(trim(vdescprod), 1, 35);
         obProd.dataSet.FieldByName('PREC_CUS_PROD').AsCurrency := strtocurr(vvalor);
         obProd.dataSet.FieldByName('CUSTO_HONDA').AsCurrency := strtocurr(vvalor);
         obProd.dataSet.FieldByName('NUM_FAB_PROD').AsString := vcodprod;
         obProd.dataSet.FieldByName('CST_PROD').AsString := '060';
         obProd.dataSet.FieldByName('UNIDADE').AsString := 'PC';
         obProd.dataSet.FieldByName('CODIGO_NOP').AsString := vParam.pNatOP;
         if (vcodpps = 'MZ') or (vcodpps = 'M1') then
         begin
          obProd.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency := obProd.dataSet.FieldByName('PREC_CUS_PROD').AsCurrency * strtofloat(vParam.pMzM1);
          obProd.dataSet.FieldByName('PREC_PUBLICO').AsCurrency := obProd.dataSet.FieldByName('PREC_CUS_PROD').AsCurrency * strtofloat(vParam.pMzM1);
         end;
         if (vcodpps = 'QZ') or (vcodpps = 'Q1') then
         begin
          obProd.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency := obProd.dataSet.FieldByName('PREC_CUS_PROD').AsCurrency * strtofloat(vParam.pQzQ1);
          obProd.dataSet.FieldByName('PREC_PUBLICO').AsCurrency := obProd.dataSet.FieldByName('PREC_CUS_PROD').AsCurrency * strtofloat(vParam.pQzQ1);
         end;
         if (vcodpps = 'PZ') then
         begin
          obProd.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency := obProd.dataSet.FieldByName('PREC_CUS_PROD').AsCurrency * strtofloat(vParam.pPZ);
          obProd.dataSet.FieldByName('PREC_PUBLICO').AsCurrency := obProd.dataSet.FieldByName('PREC_CUS_PROD').AsCurrency * strtofloat(vParam.pPZ);
         end;
         if (vcodpps = 'H3') then
         begin
          obProd.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency := obProd.dataSet.FieldByName('PREC_CUS_PROD').AsCurrency * strtofloat(vParam.pH3);
          obProd.dataSet.FieldByName('PREC_PUBLICO').AsCurrency := obProd.dataSet.FieldByName('PREC_CUS_PROD').AsCurrency * strtofloat(vParam.pH3);
         end;
         if (vcodpps = 'H4') then
         begin
          obProd.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency := obProd.dataSet.FieldByName('PREC_CUS_PROD').AsCurrency * strtofloat(vParam.pH4);
          obProd.dataSet.FieldByName('PREC_PUBLICO').AsCurrency := obProd.dataSet.FieldByName('PREC_CUS_PROD').AsCurrency * strtofloat(vParam.pH4);
         end;
         if (vcodpps = 'H2') then
         begin
          obProd.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency := obProd.dataSet.FieldByName('PREC_CUS_PROD').AsCurrency * strtofloat(vParam.pH2);
          obProd.dataSet.FieldByName('PREC_PUBLICO').AsCurrency := obProd.dataSet.FieldByName('PREC_CUS_PROD').AsCurrency * strtofloat(vParam.pH2);
         end;
         if (vcodpps = 'H5') then
         begin
          obProd.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency := obProd.dataSet.FieldByName('PREC_CUS_PROD').AsCurrency * strtofloat(vParam.pH5);
          obProd.dataSet.FieldByName('PREC_PUBLICO').AsCurrency := obProd.dataSet.FieldByName('PREC_CUS_PROD').AsCurrency * strtofloat(vParam.pH5);
         end;
         if (vcodpps = 'H6') then
         begin
          obProd.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency := obProd.dataSet.FieldByName('PREC_CUS_PROD').AsCurrency * strtofloat(vParam.pH6);
          obProd.dataSet.FieldByName('PREC_PUBLICO').AsCurrency := obProd.dataSet.FieldByName('PREC_CUS_PROD').AsCurrency * strtofloat(vParam.pH6);
         end;
         if (vcodpps = 'H7') then
         begin
          obProd.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency := obProd.dataSet.FieldByName('PREC_CUS_PROD').AsCurrency * strtofloat(vParam.pH7);
          obProd.dataSet.FieldByName('PREC_PUBLICO').AsCurrency := obProd.dataSet.FieldByName('PREC_CUS_PROD').AsCurrency * strtofloat(vParam.pH7);
         end;
         if (vcodpps = 'H8') then
         begin
          obProd.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency := obProd.dataSet.FieldByName('PREC_CUS_PROD').AsCurrency * strtofloat(vParam.pH8);
          obProd.dataSet.FieldByName('PREC_PUBLICO').AsCurrency := obProd.dataSet.FieldByName('PREC_CUS_PROD').AsCurrency * strtofloat(vParam.pH8);
         end;
         if (vcodpps = 'CA') then
         begin
          obProd.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency := obProd.dataSet.FieldByName('PREC_CUS_PROD').AsCurrency * strtofloat(vParam.pCA);
          obProd.dataSet.FieldByName('PREC_PUBLICO').AsCurrency := obProd.dataSet.FieldByName('PREC_CUS_PROD').AsCurrency * strtofloat(vParam.pCA);
         end;
         if (vcodpps = 'PN') then
         begin
          obProd.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency := obProd.dataSet.FieldByName('PREC_CUS_PROD').AsCurrency * strtofloat(vParam.pPN);
          obProd.dataSet.FieldByName('PREC_PUBLICO').AsCurrency := obProd.dataSet.FieldByName('PREC_CUS_PROD').AsCurrency * strtofloat(vParam.pPN);
         end;
         if (vcodpps = 'H0') then
         begin
          obProd.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency := obProd.dataSet.FieldByName('PREC_CUS_PROD').AsCurrency * strtofloat(vParam.pH0);
          obProd.dataSet.FieldByName('PREC_PUBLICO').AsCurrency := obProd.dataSet.FieldByName('PREC_CUS_PROD').AsCurrency * strtofloat(vParam.pH0);
         end;
               //
         if StrToFloat(vParam.pCoefLoja) > 0 then
         begin
          if vParam.pCoefEmCimaPrecoPublico then
           obProd.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency := obProd.dataSet.FieldByName('PREC_PUBLICO').AsCurrency * strtofloat(vParam.pCoefLoja)
          else
           obProd.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency := obProd.dataSet.FieldByName('PREC_CUS_PROD').AsCurrency * strtofloat(vParam.pCoefLoja);
         end;
         obProd.dataSet.FieldByName('TIP_PROD_IND').AsString := vtipolista;
         obProd.dataSet.FieldByName('COD_PPS').AsString := vcodpps;
         obProd.dataSet.FieldByName('COD_USUARIO_PROCESS').AsInteger := vDadosIni.vCodUsuario;
         obProd.dataSet.FieldByName('DATA_PROCESS').AsDateTime := vDadosIni.getDataBanco(buscas);
         obProd.dataSet.FieldByName('HORA_PROCESS').AsString := FormatDateTime('hh:mm:ss', vDadosIni.getDataHoraBanco(buscas));
         obProd.dataSet.FieldByName('NOMEARQ_PROCESS').AsString := Trim(pArquivo);
         obProd.setaCamposVariaveisPost;
         obProd.postSemTestes;
         obProd.Apply;
         obProd.CodBarra.Insert;
         obProd.CodBarra.dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.COdEmpresa;
         obProd.CodBarra.dataSet.FieldByName('GRUPO_PROD').asstring := obProd.dataSet.FieldByName('GRUPO_PROD').asstring;
         obProd.CodBarra.dataSet.FieldByName('COD_PROD').asstring := obProd.dataSet.FieldByName('COD_PROD').asstring;
         obProd.CodBarra.dataSet.FieldByName('COD_BARRA').asstring := obProd.dataSet.FieldByName('NUM_FAB_PROD').asstring;
         obProd.CodBarra.post;
         obProd.CodBarra.Apply;
        end
        else
        begin
         obProd.ProcessamentoFabrica := true;
         obProd.statusRegistro := 'E';
         obProd.dataSet.Edit;
         obProd.setaCamposVariaveisEdit;
         obProd.dataSet.FieldByName('CUSTO_HONDA').AsCurrency := strtocurr(vvalor);
         if (vcodpps = 'MZ') or (vcodpps = 'M1') then
         begin
          obProd.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency := strtocurr(vvalor) * strtofloat(vParam.pMzM1);
          obProd.dataSet.FieldByName('PREC_PUBLICO').AsCurrency := strtocurr(vvalor) * strtofloat(vParam.pMzM1);
         end;
         if (vcodpps = 'QZ') or (vcodpps = 'Q1') then
         begin
           obProd.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency := strtocurr(vvalor) * strtofloat(vParam.pQzQ1);
           obProd.dataSet.FieldByName('PREC_PUBLICO').AsCurrency := strtocurr(vvalor) * strtofloat(vParam.pQzQ1);
         end;
         if (vcodpps = 'PZ') then
         begin
          obProd.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency := strtocurr(vvalor) * strtofloat(vParam.pPZ);
          obProd.dataSet.FieldByName('PREC_PUBLICO').AsCurrency := strtocurr(vvalor) * strtofloat(vParam.pPZ);
         end;
         if (vcodpps = 'H3') then
         begin
          obProd.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency := strtocurr(vvalor) * strtofloat(vParam.pH3);
          obProd.dataSet.FieldByName('PREC_PUBLICO').AsCurrency := strtocurr(vvalor) * strtofloat(vParam.pH3);
         end;
         if (vcodpps = 'H4') then
         begin
          obProd.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency := strtocurr(vvalor) * strtofloat(vParam.pH4);
          obProd.dataSet.FieldByName('PREC_PUBLICO').AsCurrency := strtocurr(vvalor) * strtofloat(vParam.pH4);
         end;
         if (vcodpps = 'H2') then
         begin
          obProd.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency := strtocurr(vvalor) * strtofloat(vParam.pH2);
          obProd.dataSet.FieldByName('PREC_PUBLICO').AsCurrency := strtocurr(vvalor) * strtofloat(vParam.pH2);
         end;
         if (vcodpps = 'H5') then
         begin
          obProd.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency := strtocurr(vvalor) * strtofloat(vParam.pH5);
          obProd.dataSet.FieldByName('PREC_PUBLICO').AsCurrency := strtocurr(vvalor) * strtofloat(vParam.pH5);
         end;
         if (vcodpps = 'H6') then
         begin
          obProd.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency := strtocurr(vvalor) * strtofloat(vParam.pH6);
          obProd.dataSet.FieldByName('PREC_PUBLICO').AsCurrency := strtocurr(vvalor) * strtofloat(vParam.pH6);
         end;
         if (vcodpps = 'H7') then
         begin
          obProd.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency := strtocurr(vvalor) * strtofloat(vParam.pH7);
          obProd.dataSet.FieldByName('PREC_PUBLICO').AsCurrency := strtocurr(vvalor) * strtofloat(vParam.pH7);
         end;
         if (vcodpps = 'H8') then
         begin
          obProd.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency := strtocurr(vvalor) * strtofloat(vParam.pH8);
          obProd.dataSet.FieldByName('PREC_PUBLICO').AsCurrency := strtocurr(vvalor) * strtofloat(vParam.pH8);
         end;
         if (vcodpps = 'CA') then
         begin
          obProd.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency := strtocurr(vvalor) * strtofloat(vParam.pCA);
          obProd.dataSet.FieldByName('PREC_PUBLICO').AsCurrency := strtocurr(vvalor) * strtofloat(vParam.pCA);
         end;
         if (vcodpps = 'PN') then
         begin
          obProd.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency := strtocurr(vvalor) * strtofloat(vParam.pPN);
          obProd.dataSet.FieldByName('PREC_PUBLICO').AsCurrency := strtocurr(vvalor) * strtofloat(vParam.pPN);
         end;
         if StrToFloat(vParam.pCoefLoja) > 0 then
         begin
          if vParam.pCoefEmCimaPrecoPublico then
           obProd.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency := obProd.dataSet.FieldByName('PREC_PUBLICO').AsCurrency * strtofloat(vParam.pCoefLoja)
          else
            obProd.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency := strtocurr(vvalor) * strtofloat(vParam.pCoefLoja);
         end;
         obProd.dataSet.FieldByName('TIP_PROD_IND').AsString := vtipolista;
         obProd.dataSet.FieldByName('COD_PPS').AsString := vcodpps;
         obProd.dataSet.FieldByName('COD_USUARIO_PROCESS').AsInteger := vDadosIni.vCodUsuario;
         obProd.dataSet.FieldByName('DATA_PROCESS').AsDateTime := vDadosIni.getDataBanco(buscas);
         obProd.dataSet.FieldByName('HORA_PROCESS').AsString := FormatDateTime('hh:mm:ss', vDadosIni.getDataHoraBanco(buscas));
         obProd.dataSet.FieldByName('NOMEARQ_PROCESS').AsString := Trim(pArquivo);
         obProd.setaCamposVariaveisPost;
         obProd.postSemTestes;
         obProd.Apply;
        end;
       end
       else
       begin
        if vParam.pProdSimilares then
        begin
          obProd.Close;
          obProd.dataSet.CommandText := ' SELECT PRODUTOS.*, CAST(0 AS FLOAT) ESTOQUE, CAST(0 AS FLOAT) EST_PRIMA FROM PRODUTOS ' +
            ' where PRODUTOS.NUM_FAB_PROD = ' + QuotedStr(vcodprod) +
            ' and PRODUTOS.COD_EMPRESA = ' + vDadosIni.codEmpresa +
            ' and PRODUTOS.ATIVO = 1 ';
          obProd.Open;
          vgcodp := obProd.dataSet.FieldByName('GRUPO_PROD').AsInteger;
          vcodp :=obProd.dataSet.FieldByName('COD_PROD').AsString;
          obProd.Close;
          obProd.dataSet.CommandText := ' SELECT PRODUTOS.*, CAST(0 AS FLOAT) ESTOQUE, CAST(0 AS FLOAT) EST_PRIMA FROM PRODUTOS ' +
            ' where PRODUTOS.NUM_FAB_PROD = ' + QuotedStr(trim(copy(s, 75, 20))) +
            ' and PRODUTOS.COD_EMPRESA = ' + vDadosIni.codEmpresa +
            ' and PRODUTOS.ATIVO = 1 ';
          obProd.Open;
          vgcodps := obProd.dataSet.FieldByName('GRUPO_PROD').AsInteger;
          vcodps := obProd.dataSet.FieldByName('COD_PROD').AsString;
          obProd.buscas.Close;
          obProd.buscas.SQL.text := ' SELECT * FROM Prod_Similares ' +
            ' WHERE Grupo_Prod = '+ IntToStr(vgcodp) + ' and cod_prod = ' + QuotedStr(vcodp) + ' and grupo_ps = ' + IntToStr(vgcodps) +
            ' and cod_ps = ' + QuotedStr(vcodps) + ' and cod_empresa = '+ vDadosIni.codEmpresa + ' and ativo=1';
          obProd.buscas.Open;
          if obProd.buscas.IsEmpty then
          begin
           try
            obProd.buscas.close;
            obProd.buscas.SQL.text:=' insert into Prod_Similares(cod_empresa, grupo_prod, cod_prod,' +
              'grupo_ps, cod_ps) values (' +vDadosIni.codEmpresa+ ',' + inttostr(vgcodp)+
              ',' +QuotedStr(vcodp) +',' + Inttostr(vgcodps) + ',' + QuotedStr(vcodps) + ')';
            obProd.Buscas.Prepare;
            obProd.buscas.ExecSQL;
           except
             vParam.Memo := vParam.Memo + #13 + '->' + copy(s, 75, 20);
   //          .Memo1.Lines.Add(vcodprod + '->' + copy(s, 75, 20));
           end;
          end;
        end;
       end;
      end;
      ix := ix + 1;
      ic := ic + 1;
      if ic = StrToInt(vParam.pComitar) then
      begin
       ic := 0;
       obProd.CommitaTransacao;
      end;
    except
      on E: Exception do
      begin
       registraErro('Erro ao processar arquivo PCL. Erro: ' + e.Message + #13 +
        'Arquivo: ' + IntToStr(vParam.ContArq) + ' de ' + IntToStr(vParam.TotArq)+ #13 +
        'Processando PCL '+ IntToStr(i) +' de ' + IntToStr(totLinhas)+
        'NomeArquivo: ' + QuotedStr(trim(pArquivo)));
        Result := False;
       Application.MessageBox(pchar('Erro ao processar arquivo PCL. Erro: ' + e.Message + #13 +
        'Arquivo: ' + IntToStr(vParam.ContArq) + ' de ' + IntToStr(vParam.TotArq)+ #13 +
        'Processando PCL '+ IntToStr(i) +' de ' + IntToStr(totLinhas) + #13 +
        'NomeArquivo: ' + QuotedStr(trim(pArquivo))), 'Atenção', MB_OK + MB_OK);
        CloseFile(F);
        obProd.RollBackTransacao;
      end;
    end;
   end;
   CloseFile(F);
   obProd.CommitaTransacao;
   vArqPecas := True;
   vDadosIni.vEmp.vUsarRegraCFOPCSTEntrada:=vUsarRegraCFOPCSTEntrada;
   vDadosIni.vEmp.vUsarRegraCFOPCSTSaida:=vUsarRegraCFOPCSTSaida;
   obProd.Close;
   obProd.Free;
 finally
   vDadosIni.fechaStatusProcessamento;
   obProd.buscas.Close;
   obProd.buscas.SQL.Text := ' UPDATE OR INSERT INTO ARQ_FABRICA ' +
     ' (NOMEARQUIVO, TIPOARQUIVO, COD_EMPRESA, TP_LISTAPRECOS, ATIVO) ' +
     ' VALUES ' +
     ' (:NOMEARQUIVO, :TIPOARQUIVO, :COD_EMPRESA, :TP_LISTAPRECOS, :ATIVO) ' +
     ' MATCHING (NOMEARQUIVO, TIPOARQUIVO, COD_EMPRESA); ';
   obProd.buscas.ParamByName('NOMEARQUIVO').AsString := trim(pArquivo);
   obProd.buscas.ParamByName('TIPOARQUIVO').AsString := 'HONDA';
   obProd.buscas.ParamByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
   obProd.buscas.ParamByName('ATIVO').AsInteger := 1;

   if vArqPecas then
   begin
     vDadosIni.GravaAuditoria('FAB016', 'PROCESSAR', 'SUCESSO ARQUIVO ' + QuotedStr(trim(pArquivo)), '', '', buscas);
     obProd.buscas.ParamByName('TP_LISTAPRECOS').AsString := 'S';
   end
   else
   begin
     vDadosIni.GravaAuditoria('FAB016', 'PROCESSAR', 'FALHA ARQUIVO ' + QuotedStr(trim(pArquivo)), '', '', buscas);
     obProd.buscas.ParamByName('TP_LISTAPRECOS').AsString := 'N';
   end;
   obProd.buscas.ExecSQL;
   obProd.CommitaTransacao;
 end;
end;

function TFabricaHonda.ProcessarArquivoTransito(pDirArquivo, pArquivo: string): boolean;
var
  buscasNFtrans, buscasTrans: TIBQuery;
  F: TextFile;
  S: string;
  vNomeUsuario, vVendRes, vEmailVnd: string;
  vMensagem: string;
  vCodEstmoto, vCodVendRes, vCodFila: Integer;
  vStatusRes: string;
  vnumnota, vserie, vtpfat, vntit, vvalor, vndoc: string;
  vicmsub, vseg, vfrete, vdtemit, Vdtvenc: string;
  vchassi, vmotor, vmodelo, vcor, vnumcaixa,vdtarq: string;
  vanomod,vanofab: string;
  vcodfat: string;
  //vcons: array of variant;
  vflgerr, vflg, i, totLinhas: integer;
  //  vvalorcv: currency;
begin
  Result := True;
  vflg := 0;

  buscasTrans := TIBQuery.Create(Application);
  buscasTrans.Database := buscas.Database;
  buscasTrans.Transaction := buscas.Transaction;

  buscasNFtrans := TIBQuery.Create(Application);
  buscasNFtrans.Database := buscas.Database;
  buscasNFtrans.Transaction := buscas.Transaction;

  buscasNFtrans.close;
  buscasNFtrans.Sql.Clear;
  buscasNFtrans.Sql.text := ' select * from nf_transito ' +
   ' where cod_empresa = :cod_empresa and ativo = 1';
  buscasNFtrans.ParamByName('COD_EMPRESA').asstring := vDadosIni.CodEmpresa;
  buscasNFtrans.DataSource := nil;
  buscasNFtrans.open;

  if (vDadosIni.vEmp.vVersaoVeiculos = '4') then
  begin
    buscasTrans.close;
    buscasTrans.sql.clear;
    buscasTrans.sql.text := 'select * from est_moto ' +
      ' where cod_empresa = :cod_empresa and (trim(coalesce(upper(posicao), '''')) = ''TRANSITO'') ' +
      ' and ativo = 1 order by num_nota, chassi_c ';
    buscasTrans.ParamByName('COD_EMPRESA').AsString := vDadosIni.CodEmpresa;
    buscasTrans.DataSource := nil;
    buscasTrans.open;
  end
  else
  begin
    buscasTrans.close;
    buscasTrans.sql.clear;
    buscasTrans.sql.text := 'select * from transito_motos ' +
     ' where cod_empresa = :cod_empresa and ativo = 1 order by num_notat, chassit';
    buscasTrans.ParamByName('COD_EMPRESA').AsString := vDadosIni.CodEmpresa;
    buscasTrans.DataSource := nil;
    buscasTrans.open;
  end;

  // SetLength(vcons, 2);
  //   vvalorcv:=strtocurr('151,58');
  AssignFile(F, pDirArquivo);
  Reset(F);
  i := 0;
  while not System.eof(F) do
  begin
    Application.ProcessMessages;
    i := i + 1;
    Readln(F, S);
    if copy(s, 24, 3) <> 'FDC' then
    begin
     vflg := 1;
//     Application.MessageBox('Arquivo não é de Lista de Faturamento de Motos!', 'Atenção', MB_ICONERROR + MB_OK);
     break;
    end;
  end;

  totLinhas := i;
  CloseFile(F);
  if vflg = 1 then
  begin
   exit;
  end;

 try
  if not vDadosIni.PesqPros('FAB014', 'PROCESSAR', QuotedStr(trim(pArquivo)), '','', buscas, true) then
    Exit;

  vflgerr := 0;
  i := 0;
  Reset(F);
  while not System.Eof(F) do
  begin
    Readln(F, S);
    if (copy(s, 1, 1) <> 'H') and (copy(s, 1, 1) <> 'T') then
    begin
      if copy(s, 46, 1) = '2' then
      begin
        vnumnota := copy(s, 37, 6);
        vchassi := copy(s, 47, 17);
        vmotor := copy(s, 64, 17);
        vmodelo := copy(s, 81, 20);
        vcor := copy(s, 101, 10);
        vnumcaixa := copy(s, 111, 7);
        vanofab:=copy(s, 120, 4);
        vanomod:=copy(s, 124, 4);
        if copy(s,128,9) <> '' then
          vnumnota := copy(s, 128, 9);

        if (vDadosIni.vEmp.vVersaoVeiculos = '4') then
        begin
          if not buscasTrans.locate('num_nota;chassi_c', vararrayof([StrToInt(vnumnota), trim(vchassi)]), []) then
          begin
            buscas.close;
            buscas.sql.text:= ' select * from tipmodelo where DESFAB like ''%'+trim(vmodelo)+';%'' AND COD_EMPRESA = '+ vDadosIni.codEmpresa;
            buscas.open;
            if buscas.IsEmpty then
            begin
              Application.MessageBox(pchar('Erro na Descrição Honda do Modelo. Modelo não encontrado no sistema. ' + #13 +
                'Modelo: ' + vmodelo + #13 + 'É necessário a Correção'), 'Atenção', MB_ICONERROR + MB_OK);
              vflgerr := 1;
              Result := False;
            end;

            buscas.close;
            buscas.sql.text := ' SELECT COD_COR, TIPO_PINTURA FROM CODIGO_CORFAB ' +
              ' WHERE DESCRICAO_COR LIKE ' + QuotedStr(trim(vcor) + '%') + ' AND ATIVO = 1';
            buscas.open;
            if buscas.IsEmpty then
            begin
              Application.MessageBox(pchar('Erro na Descrição da Cor. Cor não encontrado no sistema. ' + #13 +
                'Cor: ' + vcor + #13 + 'É necessário a Correção'), 'Atenção', MB_ICONERROR + MB_OK);
              vflgerr := 1;
              Result := False;
            end;
          end;
        end
        else
        begin
          if not buscasTrans.locate('num_notat;chassit', vararrayof([StrToInt(vnumnota), trim(vchassi)]), []) then
          begin
            buscas.close;
            buscas.sql.text:='select * from tipmodelo where DESFAB like ''%'+trim(vmodelo)+';%'' AND COD_EMPRESA = '+ vDadosIni.codEmpresa;
            buscas.open;
            if buscas.IsEmpty then
            begin
              Application.MessageBox(pchar('Erro na Descrição Honda do Modelo. Modelo não encontrado no sistema. ' + #13 +
                'Modelo: ' + vmodelo + #13 + 'É necessário a Correção'), 'Atenção', MB_ICONERROR + MB_OK);
              vflgerr := 1;
              Result := False;
            end;

            buscas.close;
            buscas.sql.text := ' SELECT COD_COR, TIPO_PINTURA FROM CODIGO_CORFAB ' +
              ' WHERE DESCRICAO_COR LIKE ' + QuotedStr(trim(vcor) + '%') + ' AND ATIVO = 1';
            buscas.open;
            if buscas.IsEmpty then
            begin
              Application.MessageBox(pchar('Erro na Descrição da Cor. Cor não encontrado no sistema. ' + #13 +
                'Cor: ' + vcor + #13 + 'É necessário a Correção'), 'Atenção', MB_ICONERROR + MB_OK);
              vflgerr := 1;
              Result := False;
            end;
          end;

          buscas.close;
          buscas.sql.text := ' SELECT COD_COR, TIPO_PINTURA FROM CODIGO_CORFAB ' +
            ' WHERE DESCRICAO_COR LIKE ' + QuotedStr(trim(vcor) + '%') + ' AND ATIVO = 1';
          buscas.open;
          if buscas.IsEmpty then
          begin
            Application.MessageBox(pchar('Erro na Descrição da Cor. Cor não encontrado no sistema. ' + #13 +
              'Cor: ' + vcor + #13 + 'É necessário a Correção'), 'Atenção', MB_ICONERROR + MB_OK);
            vflgerr := 1;
            Result := False;
          end;
        end;
      end;
    end;
  end;

  buscas.close;
  CloseFile(F);
  vflg := 0;
  if vflgerr <> 0 then
  begin
    if (vDadosIni.vEmp.vVersaoVeiculos = '4') then
    begin
      buscas.close;
      buscas.sql.clear;
      buscas.sql.text := 'select * from est_moto where num_nota = :num_notat ' +
        'and cod_empresa = :cod_empresa and ativo = 1 order by num_nota, chassi_c';
      buscas.ParamByName('COD_EMPRESA').asstring := vDadosIni.codEmpresa;
      exit;
    end
    else
    begin
      buscas.close;
      buscas.sql.clear;
      buscas.sql.text := 'select * from transito_motos where transito_motos.num_notat = :num_notat ' +
        'and cod_empresa = :cod_empresa and ativo = 1 order by transito_motos.num_notat,transito_motos.chassit';
      buscas.ParamByName('COD_EMPRESA').asstring := vDadosIni.CodEmpresa;
      buscas.close;
      exit;
    end;
  end;
  AssignFile(F, pDirArquivo);
  Reset(F);
  //
//  with DTMmoto do
//  begin
    try
      if not transacao.InTransaction then
        transacao.StartTransaction;
      while not System.Eof(F) do
      begin
        i := i + 1;
        Readln(F, S);
        vDadosIni.abreStatusProcessamento('Arquivo(s) ' + IntToStr(vParam.ContArq) + ' de '
         + IntToStr(vParam.TotArq), 'Processando FDC '+ IntToStr(i) +' de ' + IntToStr(totLinhas));
        if (copy(s, 1, 1) <> 'H') and (copy(s, 1, 1) <> 'T') then
        begin
          if copy(s, 46, 1) = '2' then
          begin
            vdtarq:= copy(s, 2, 8);
            vnumnota := copy(s, 37, 6);
            vchassi := copy(s, 47, 17);
            vmotor := copy(s, 64, 17);
            vmodelo := copy(s, 81, 20);
            vcor := copy(s, 101, 10);
            vnumcaixa := copy(s, 111, 7);
            vanofab := copy(s, 120, 4);
            vanomod := copy(s, 124, 4);
            if copy(s,128,9) <> '' then
              vnumnota := copy(s, 128, 9);
            if (vDadosIni.vEmp.vVersaoVeiculos = '4') then
            begin
              if not buscasTrans.locate('num_nota;chassi_c', vararrayof([StrToInt(vnumnota), trim(vchassi)]), []) then
              begin
                buscas1.Close;
                buscas1.Sql.Text := 'INSERT INTO EST_MOTO' +
                  ' (CHASSI_C, COD_EMPRESA, NUM_NOTA, SERIE, MARCAEST, VERSAOEST,' +
                  ' ANO_FABEST, ANO_MODEST, COREST, CILINDROSEST, COMBUSTIVELEST, CILINDRADAEST, HPEST, LOTACAOEST,' +
                  ' TIPOEST, RENAVAMEST, PRECO_TABEST, OBS_ITEMEST, MOTOREST, PLACAEST, CERTIFICADOEST, DATA_CERTIFICADOEST,' +
                  ' CATEGORIAEST, DATA_CH_NOTA, TIP_PINTURA, NSERIE, COD_COR,' +
                  ' BASE_CALC_ICM_SUBEST, FRETE_AQUISICAOEST, FRETE_VENDAEST, VALOR_ICM_SUBEST, SITUACAO, TIPO_RES, DATA_RES,' +
                  ' VENDEDOR_RES, COD_CLIENTE, STATUS_RES, NOME_RES, SIT_RES, COD_FORNECEDOR, TIPO_VENDA,' +
                  ' DESCRICAO_VERSAOEST, CODIGO, PRECO_CUSTO, PRECO_CUSTO_REP, PRECO_CUSTO_DESP, TIPV_VEICULO, STATUS_ESTOQUE, ' +
                  ' STATUS_DEMONST, STATUS_TRANSDEP, STATUS_CANC, STATUS_USO, COD_NF, COD_MARCA,' +
                  ' COD_COMBUSTIVEL, COD_ESPE_SEG, MODELO_NF, POSICAO, ESTOQUE, PERC_RED, RED_LUCRO, CAIXA_N, N_CAIXA,' +
                  ' COD_USUARIO_PROCESS, DATA_PROCESS, HORA_PROCESS, NOMEARQ_PROCESS, US_CAD, DATA_CAD, HORA_CAD, DATA_TRANS_NOTA) ' +
                  ' VALUES ' +
                  ' (:CHASSI_C, :COD_EMPRESA, :NUM_NOTA, :SERIE, :MARCAEST, :VERSAOEST,' +
                  ' :ANO_FABEST, :ANO_MODEST, :COREST, :CILINDROSEST, :COMBUSTIVELEST, :CILINDRADAEST, :HPEST, :LOTACAOEST,' +
                  ' :TIPOEST, :RENAVAMEST, :PRECO_TABEST, :OBS_ITEMEST, :MOTOREST, :PLACAEST, :CERTIFICADOEST, :DATA_CERTIFICADOEST,' +
                  ' :CATEGORIAEST, :DATA_CH_NOTA, :TIP_PINTURA, :NSERIE, :COD_COR,' +
                  ' :BASE_CALC_ICM_SUBEST, :FRETE_AQUISICAOEST, :FRETE_VENDAEST, :VALOR_ICM_SUBEST, :SITUACAO, :TIPO_RES, :DATA_RES,' +
                  ' :VENDEDOR_RES, :COD_CLIENTE, :STATUS_RES, :NOME_RES, :SIT_RES, :COD_FORNECEDOR, :TIPO_VENDA,' +
                  ' :DESCRICAO_VERSAOEST, :CODIGO, :PRECO_CUSTO, :PRECO_CUSTO_REP, :PRECO_CUSTO_DESP, :TIPV_VEICULO, :STATUS_ESTOQUE, ' +
                  ' :STATUS_DEMONST, :STATUS_TRANSDEP, :STATUS_CANC, :STATUS_USO, :COD_NF, :COD_MARCA,' +
                  ' :COD_COMBUSTIVEL, :COD_ESPE_SEG, :MODELO_NF, :POSICAO, :ESTOQUE, :PERC_RED, :RED_LUCRO, :CAIXA_N, :N_CAIXA, ' +
                  ' :COD_USUARIO_PROCESS, :DATA_PROCESS, :HORA_PROCESS, :NOMEARQ_PROCESS, :US_CAD, :DATA_CAD, :HORA_CAD, :DATA_TRANS_NOTA)';
                vCodEstmoto := vDadosIni.Gencodigo('EST_MOTO', dtmFabrica.SpIncCodigo, vDadosIni.codEmpresa);
                buscas1.ParamByName('CODIGO').AsInteger := vCodEstmoto;
                buscas1.ParamByName('NUM_NOTA').AsInteger := strtoint(vnumnota);
                buscas1.ParamByName('SERIE').AsString := vserie;
                buscas1.ParamByName('DATA_CH_NOTA').Value := Null; //.AsDateTime := strtodate(vdtemit);
                buscas1.ParamByName('DATA_TRANS_NOTA').AsDateTime := strtodate(vdtemit);
                buscas1.ParamByName('MODELO_NF').AsString := 'TRA';
                buscas1.ParamByName('CHASSI_C').AsString := Vchassi;
                if strtoint(vcodfat) = 9 then
                begin
                  buscas1.ParamByName('POSICAO').AsString := 'MORTO';
                  buscas1.ParamByName('STATUS_CANC').AsString := 'S';
                end
                else
                  buscas1.ParamByName('POSICAO').AsString := 'TRANSITO';
                buscas1.ParamByName('TIPV_VEICULO').AsString := 'V';
                buscas1.ParamByName('MOTOREST').AsString := trim(vmotor);
                buscas1.ParamByName('DESCRICAO_VERSAOEST').AsString := UpperCase(trim(vmodelo));
                buscas1.ParamByName('COREST').AsString := Uppercase(trim(vcor));
                buscas1.ParamByName('STATUS_RES').AsString := 'N';
                buscas1.ParamByName('STATUS_DEMONST').AsString := 'N';
                buscas1.ParamByName('STATUS_TRANSDEP').AsString := 'N';
                buscas1.ParamByName('STATUS_ESTOQUE').AsString := 'N';
                
                buscas.close;
                buscas.sql.text := ' SELECT COD_COR, TIPO_PINTURA FROM CODIGO_CORFAB ' +
                 ' WHERE DESCRICAO_COR LIKE ' + QuotedStr(buscas1.ParamByName('COREST').AsString + '%') + ' AND ATIVO = 1';
                buscas.open;

                buscas1.ParamByName('COD_COR').AsInteger := buscas.fieldbyname('COD_COR').AsInteger;
                buscas1.ParamByName('TIP_PINTURA').AsString := buscas.fieldbyname('TIPO_PINTURA').AsString;
                buscas1.ParamByName('CAIXA_N').AsInteger := strtoint(Vnumcaixa);
                buscas1.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
                buscas1.ParamByName('N_CAIXA').AsString := vserie; // numero de série da nf
                //buscas1.ParamByName('N_CAIXA').AsString:=vdtarq;
                try
                 buscas1.ParamByName('ANO_FABEST').AsInteger:= strtoint(vanofab);
                 buscas1.ParamByName('ANO_MODEST').AsInteger:= strtoint(vanomod);
                except
                end;
                buscas.close;
                buscas.sql.text:='select * from tipmodelo ' +
                 ' where DESFAB like ' + QuotedStr('%'+trim(buscas1.ParamByName('DESCRICAO_VERSAOEST').AsString)+ ';%') +
                 ' AND COD_EMPRESA = '+ vDadosIni.codEmpresa;
                buscas.open;
                if not buscas.IsEmpty then
                begin
                  buscas1.ParamByName('VERSAOEST').AsInteger := buscas.fieldbyname('CODIGO').AsInteger;
                  buscas1.ParamByName('CILINDROSEST').AsInteger := buscas.FieldByName('cilindros').AsInteger;
                  buscas1.ParamByName('HPEST').AsFloat := buscas.FieldByName('hp').AsFloat;
                  buscas1.ParamByName('CILINDRADAEST').AsInteger := buscas.FieldByName('CILINDRADA').AsInteger;
                  buscas1.ParamByName('LOTACAOEST').AsString := buscas.FieldByName('lotacao').AsString;
                  buscas1.ParamByName('RENAVAMEST').AsString := buscas.FieldByName('renavam').AsString;
                  buscas1.ParamByName('PRECO_TABEST').AsFloat := buscas.FieldByName('VALTAB').AsFloat;
                  buscas1.ParamByName('NSERIE').AsString := copy(trim(Vchassi), 9, 9);
                  buscas1.ParamByName('COMBUSTIVELEST').AsString := buscas.FieldByName('combustivel').AsString;
                  buscas1.ParamByName('TIPOEST').AsString := buscas.FieldByName('tipo').AsString;
                  buscas1.ParamByName('MARCAEST').AsString := buscas.FieldByName('MARCA_DESC').AsString;
                  buscas1.ParamByName('COD_COMBUSTIVEL').AsInteger := buscas.FieldByName('cod_combustivel').AsInteger;
                  buscas1.ParamByName('COD_MARCA').AsInteger := buscas.FieldByName('cod_marca').AsInteger;
                  buscas1.ParamByName('COD_ESPE_SEG').AsInteger := buscas.FieldByName('cod_tipo_esp').AsInteger;
                  buscas1.ParamByName('COD_USUARIO_PROCESS').AsInteger := vDadosIni.vCodUsuario;
                  buscas1.ParamByName('DATA_PROCESS').AsDate := vDadosIni.getDataBanco(buscas);
                  buscas1.ParamByName('HORA_PROCESS').AsString := FormatDateTime('hh:mm:ss', vDadosIni.getDataHoraBanco(buscas));
                  buscas1.ParamByName('NOMEARQ_PROCESS').AsString := Trim(pArquivo);
                end;
                try
                  buscas1.ParamByName('US_CAD').AsInteger := vDadosIni.vCodUsuario;
                  buscas1.ParamByName('DATA_CAD').AsDateTime := vDadosIni.getDataBanco(buscas);
                  buscas1.ParamByName('HORA_CAD').AsString := FormatDateTime('HH:MM', vDadosIni.getDataHoraBanco(buscas));
                  buscas1.ExecSQL;
                  vDadosIni.AtualizarFilaReserva(buscas1, dtmFabrica.SpIncCodigo, vCodEstmoto, trim(Vchassi), true, false);
                except
                end;
              end
              else if (strtoint(vcodfat) = 9) and (vDadosIni.vEmp.vVersaoVeiculos = '4') then
              begin
                buscas1.Close;
                buscas1.SQL.Text := ' SELECT CHASSI_C, CODIGO, STATUS_RES, VENDEDOR_RES, COD_FILA_RES FROM EST_MOTO EST ' +
                  ' WHERE CHASSI_C = :CHASSI_C AND NUM_NOTA = :NUM_NOTA AND N_CAIXA = :N_CAIXA ' +
                  ' AND COD_EMPRESA = :COD_EMPRESA AND TRIM(POSICAO) = ''TRANSITO'' ';
                buscas1.ParamByName('CHASSI_C').AsString := trim(Vchassi);
                buscas1.ParamByName('NUM_NOTA').AsInteger := strtoint(vnumnota);
                buscas1.ParamByName('N_CAIXA').AsString := vserie;
                buscas1.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
                buscas1.Open;

                if not buscas1.IsEmpty then
                begin
                  vCodEstmoto := buscas1.FieldByName('CODIGO').AsInteger;
                  vStatusRes := trim(buscas1.FieldByName('STATUS_RES').AsString);
                  vCodVendRes := buscas1.FieldByName('VENDEDOR_RES').AsInteger;
                  vCodFila := buscas1.FieldByName('COD_FILA_RES').AsInteger;
                  vNomeUsuario := '';
                  vVendRes := '';
                  vEmailVnd := '';

                  buscas1.Close;
                  buscas1.SQL.Text := ' SELECT FIRST 1 COL.COD_VENDEDOR, COL.NOME_VENDEDOR, COL.EMAIL, SEN.USUARIO FROM COLABORADOR COL ' +
                   ' INNER JOIN SENHAS SEN ON SEN.CODIGO = COL.COD_VENDEDOR AND SEN.COD_EMPRESA = COL.COD_EMPRESA ' +
                   ' WHERE COL.COD_VENDEDOR = :COD_VENDEDOR AND COL.COD_EMPRESA = :COD_EMPRESA';
                  buscas1.ParamByName('COD_VENDEDOR').AsInteger := vCodVendRes;
                  buscas1.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
                  buscas1.Open;

                  if not buscas1.IsEmpty then
                  begin
                    vNomeUsuario := buscas1.FieldByName('USUARIO').AsString;
                    vVendRes := trim(buscas1.FieldByName('NOME_VENDEDOR').AsString);
                    vEmailVnd := trim(buscas1.FieldByName('EMAIL').AsString);
                  end;

                  buscas1.Close;
                  buscas1.SQL.Text := ' UPDATE EST_MOTO SET POSICAO = :POSICAO, STATUS_CANC = :STATUS_CANC, ' +
                   ' COD_USUARIO_PROCESS = :COD_USUARIO_PROCESS, DATA_PROCESS = :DATA_PROCESS, ' +
                   ' HORA_PROCESS = :HORA_PROCESS, NOMEARQ_PROCESS = :NOMEARQ_PROCESS ' +
                   ' WHERE CHASSI_C = :CHASSI_C AND CODIGO = :CODIGO ' +
                   ' AND COD_EMPRESA = :COD_EMPRESA AND TRIM(POSICAO) = ''TRANSITO'' ';
                  buscas1.ParamByName('POSICAO').AsString := 'MORTO';
                  buscas1.ParamByName('STATUS_CANC').AsString := 'S';
                  buscas1.ParamByName('CHASSI_C').AsString := trim(Vchassi);
                  buscas1.ParamByName('CODIGO').AsInteger := vCodEstmoto;
                  buscas1.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
                  buscas1.ParamByName('COD_USUARIO_PROCESS').AsInteger := vDadosIni.vCodUsuario;
                  buscas1.ParamByName('DATA_PROCESS').AsDate := vDadosIni.getDataBanco(buscas);
                  buscas1.ParamByName('HORA_PROCESS').AsString := FormatDateTime('hh:mm:ss', vDadosIni.getDataHoraBanco(buscas));
                  buscas1.ParamByName('NOMEARQ_PROCESS').AsString := Trim(pArquivo);
                  try
                    buscas1.ExecSQL;

                    if (trim(vStatusRes) = 'S') and (vCodVendRes > 0)
                      and (trim(vEmailVnd) <> '') and (trim(vNomeUsuario) <> '') then
                    begin
                       vMensagem := 'FATURAMENTO CANCELADO "'+ UpperCase(trim(Vchassi)) + '"';
                       vDadosIni.EnvMensMobile(buscas1, dtmFabrica.SpIncCodigo, vMensagem, '"'+ UpperCase(trim(Vchassi)) + '" CANCELADO', vCodVendRes);
                       vDadosIni.AtualizarFilaReserva(buscas1, dtmFabrica.SpIncCodigo, vCodEstmoto, trim(Vchassi), false);
                    end;
                  except
                  end;
                end;
              end;
              if (vDadosIni.vEmp.vVersaoVeiculos = '4') then
              begin
                buscas1.Close;
                buscas1.SQL.Text := ' select first 1 * from hist_estmoto ' +
                 ' where chassi_c = :chassi_c and natureza = :natureza ' +
                 ' and tipo = :tipo and num_nota = :num_nota ' +
//                 ' and (trim(coalesce(posicao, ''VIVO'')) = ''MORTO'') ' +
                 ' and cod_empresa = :cod_empresa ' +
                 ' order by codigo desc ';
                buscas1.ParamByName('CHASSI_C').AsString := trim(vchassi);
                buscas1.ParamByName('NATUREZA').AsString := 'T';
                buscas1.ParamByName('TIPO').AsString := 'NF';
                buscas1.ParamByName('NUM_NOTA').AsInteger := StrToInt(vnumnota);
                buscas1.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
                buscas1.Open;

                if (buscas1.IsEmpty) or (trim(buscas1.FieldByName('POSICAO').AsString) <> 'MORTO') then
                begin
                  vDadosIni.vHistV.vChassi := trim(Vchassi);
                  vDadosIni.vHistV.vCodigo := vCodEstmoto;
                  vDadosIni.vHistV.vNatureza := 'T';
                  vDadosIni.vHistV.vNumDoc := 0;
                  vDadosIni.vHistV.vTipo := 'NF';
                  vDadosIni.vHistV.vNumNota := StrToInt(vnumnota);
                  vDadosIni.vHistV.vSerieNF := vserie;
                  vDadosIni.vHistV.vModeloNF := 'TRA';
                  vDadosIni.vHistV.vValorOP := strtocurr(vvalor);
                  vDadosIni.vHistV.vData := vdtemit;
                  vDadosIni.vHistV.vDataVenc := Vdtvenc;
                  vDadosIni.vHistV.vTipvVeiculo := 'V';
                  if strtoint(vcodfat) = 9 then
                  begin
                    vDadosIni.vHistV.vStatusV := 'CANCELADA';
                    vDadosIni.vHistV.vPosicao := 'MORTO';
                    vDadosIni.vHistV.vStatusCanc := 'S';
                  end
                  else
                  begin
                    vDadosIni.vHistV.vStatusV := '';
                    vDadosIni.vHistV.vPosicao := 'TRANSITO';
                    vDadosIni.vHistV.vStatusCanc := 'N';
                  end;
                  vDadosIni.GravarHistEstMoto(buscas1, dtmFabrica.SpIncCodigo, vDadosIni.vHistV);
                end;
              end;
            end
            else
            begin
              if not buscasTrans.locate('num_notat;chassit', vararrayof([StrToInt(vnumnota), trim(vchassi)]), []) then
              begin
                 buscas1.Close;
                 buscas1.Sql.Text := 'INSERT INTO TRANSITO_MOTOS ' +
                   ' (CHASSIT, NUM_NOTAT, COD_EMPRESA, CODIGO, MARCAT, VERSAOT, ' +
                   ' ANO_FABT, ANO_MODT, CORT, CILINDROST, COMBUSTIVELT, CILINDRADAT, HPT, LOTACAOT, TIPOT, RENAVAMT, ' +
                   ' PRECO_TABT, FRETE_AQUISICAOT, FRETE_VENDAT, BASE_CALC_ICM_SUBT, VALOR_ICM_SUBT, OBS_ITEMT, MOTORT, ' +
                   ' PLACAT, CERTIFICADOT, DATA_CERTIFICADOT, CATEGORIAT, CAIXA_N, DESCRICAO_VERSAOT, TIPO_RES, DATA_RES, ' +
                   ' VENDEDOR_RES, TIPO_VENDA, COD_CLIENTE, STATUS_RES, NOME_RES, SIT_RES, SITUACAO, ATIVO, N_CAIXA, ' +
                   ' COD_USUARIO_PROCESS, DATA_PROCESS, HORA_PROCESS, NOMEARQ_PROCESS) ' +
                   ' VALUES ' +
                   ' (:CHASSIT, :NUM_NOTAT, :COD_EMPRESA, :CODIGO, :MARCAT, :VERSAOT, :ANO_FABT, :ANO_MODT, :CORT, ' +
                   ' :CILINDROST, :COMBUSTIVELT, :CILINDRADAT, :HPT, :LOTACAOT, :TIPOT, :RENAVAMT, :PRECO_TABT, ' +
                   ' :FRETE_AQUISICAOT, :FRETE_VENDAT, :BASE_CALC_ICM_SUBT, :VALOR_ICM_SUBT, :OBS_ITEMT, :MOTORT, :PLACAT, ' +
                   ' :CERTIFICADOT, :DATA_CERTIFICADOT, :CATEGORIAT, :CAIXA_N, :DESCRICAO_VERSAOT, :TIPO_RES, :DATA_RES, ' +
                   ' :VENDEDOR_RES, :TIPO_VENDA, :COD_CLIENTE, :STATUS_RES, :NOME_RES, :SIT_RES, :SITUACAO, :ATIVO, :N_CAIXA, ' +
                   ' :COD_USUARIO_PROCESS, :DATA_PROCESS, :HORA_PROCESS, :NOMEARQ_PROCESS); ';
                 buscas1.ParamByName('Num_Notat').AsInteger := strtoint(vnumnota);
                 buscas1.ParamByName('Chassit').AsString := trim(Vchassi);
                 buscas1.ParamByName('Motort').AsString := trim(vmotor);
                 buscas1.ParamByName('Descricao_versaot').AsString := trim(vmodelo);
                 buscas1.ParamByName('CorT').AsString := trim(vcor);
                 buscas1.ParamByName('Caixa_N').AsInteger := strtoint(Vnumcaixa);
                 buscas1.ParamByName('COD_EMPRESA').asstring := vDadosIni.CodEmpresa;
                 buscas1.ParamByName('N_CAIXA').AsString := vserie; // numero de série da nf
                 //buscas1.ParamByName('N_CAIXA').AsString:=vdtarq;
                 try
                  buscas1.ParamByName('ANO_FABT').AsInteger := strtoint(vanofab);
                  buscas1.ParamByName('ANO_MODT').AsInteger := strtoint(vanomod);
                 except
                 end;
                 buscas1.ParamByName('COD_USUARIO_PROCESS').AsInteger := vDadosIni.vCodUsuario;
                 buscas1.ParamByName('DATA_PROCESS').AsDate := vDadosIni.getDataBanco(buscas);
                 buscas1.ParamByName('HORA_PROCESS').AsString := FormatDateTime('hh:mm:ss', vDadosIni.getDataHoraBanco(buscas));
                 buscas1.ParamByName('NOMEARQ_PROCESS').AsString := Trim(pArquivo);
                 buscas.close;
                 buscas.sql.text := ' SELECT * FROM TIPMODELO ' +
                   ' WHERE DESFAB like ' + QuotedStr('%' + trim(buscas1.ParamByName('DESCRICAO_VERSAOT').AsString) + ';%') +
                   ' AND COD_EMPRESA = ' + vDadosIni.CodEmpresa;
                 buscas.open;
                 if not buscas.IsEmpty then
                   buscas1.ParamByName('VERSAOT').AsInteger := buscas.fieldbyname('CODIGO').AsInteger;
                 try
                   buscas1.ExecSQL;
                 except
                 end;
              end;
            end;
          end
          else
          begin
            vdtarq:= copy(s, 2, 8);
            vnumnota := copy(s, 37, 6);
            vserie := copy(s, 43, 3);
            vdtemit := copy(s, 53, 2) + '/' + copy(s, 51, 2) + '/' + copy(s, 47, 4);
            vdtVenc := copy(s, 61, 2) + '/' + copy(s, 59, 2) + '/' + copy(s, 55, 4);
            vvalor := copy(s, 63, 13) + ',' + copy(s, 75, 2);
            vcodfat := copy(s, 83, 1);
            vtpfat := copy(s, 84, 3);
            vfrete := copy(s, 87, 13) + ',' + copy(s, 99, 2);
            vseg := copy(s, 102, 13) + ',' + copy(s, 114, 2);
            vicmsub := copy(s, 117, 11) + ',' + copy(s, 128, 2);
            if copy(s,130,9) <> '' then
             vnumnota := copy(s, 130, 9);
            if not buscasNFtrans.locate('NUM_NOTAT;N_CAIXA', vararrayof([StrToInt(vnumnota), trim(vserie)]), [loCaseInsensitive]) then
            begin
               buscas1.Close;
               buscas1.SQL.Text := ' INSERT INTO NF_TRANSITO ' +
                 ' (NUM_NOTAT, COD_EMPRESA, SERIET, DATA_EMISSAOT, DATA_VENCT, VALORNOTAT, ' +
                 ' CODFATT, TPFATT, FRETET, SEGUROT, ICMSSUBT, STATUST, ATIVO, DT_REC_NF, N_CAIXA, ' +
                 ' COD_USUARIO_PROCESS, DATA_PROCESS, HORA_PROCESS, NOMEARQ_PROCESS) ' +
                 ' VALUES ' +
                 ' (:NUM_NOTAT, :COD_EMPRESA, :SERIET, :DATA_EMISSAOT, :DATA_VENCT, :VALORNOTAT, ' +
                 ' :CODFATT, :TPFATT, :FRETET, :SEGUROT, :ICMSSUBT, :STATUST, :ATIVO, :DT_REC_NF, :N_CAIXA,' +
                 ' :COD_USUARIO_PROCESS, :DATA_PROCESS, :HORA_PROCESS, :NOMEARQ_PROCESS);';
               buscas1.ParamByName('NUM_NOTAT').AsInteger := strtoint(vnumnota);
               buscas1.ParamByName('SERIET').AsString := vserie;
               buscas1.ParamByName('DATA_EMISSAOT').AsDateTime := strtodate(vdtemit);
               buscas1.ParamByName('DATA_VENCT').AsDateTime := Strtodate(vdtvenc);
               buscas1.ParamByName('VALORNOTAT').AsCurrency := strtocurr(vvalor);
               buscas1.ParamByName('TPFATT').AsString := vtpfat;
               buscas1.ParamByName('CODFATT').AsInteger := strtoint(vcodfat);
               buscas1.ParamByName('FRETET').AsFloat := strtocurr(vfrete);
               buscas1.ParamByName('SEGUROT').AsFloat := strtocurr(vseg);
               buscas1.ParamByName('ICMSSUBT').AsFloat := Strtocurr(vicmsub);
               buscas1.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
               buscas1.ParamByName('N_CAIXA').AsString := vserie; // numero de série da nf
               //buscas1.ParamByName('N_CAIXA').AsString := vdtarq;
               buscas1.ParamByName('ATIVO').AsInteger := 1;
               buscas1.ParamByName('COD_USUARIO_PROCESS').AsInteger := vDadosIni.vCodUsuario;
               buscas1.ParamByName('DATA_PROCESS').AsDate := vDadosIni.getDataBanco(buscas);
               buscas1.ParamByName('HORA_PROCESS').AsString := FormatDateTime('hh:mm:ss', vDadosIni.getDataHoraBanco(buscas));
               buscas1.ParamByName('NOMEARQ_PROCESS').AsString := Trim(pArquivo);
               if strtoint(vcodfat) = 9 then
                 buscas1.ParamByName('STATUST').AsString := 'CANCELADA';
               try
                 buscas1.ExecSQL;
               except
                Application.MessageBox(PChar('ERRO: NF' + vnumnota), 'Atenção', mb_ok + MB_ICONINFORMATION);
               end;
            end
            else
            begin
              if strtoint(vcodfat) = 9 then
              begin
                buscas1.Close;
                buscas1.SQL.Text := ' UPDATE NF_TRANSITO SET STATUST = :STATUST, ' +
                 ' COD_USUARIO_PROCESS = :COD_USUARIO_PROCESS, DATA_PROCESS = :DATA_PROCESS, ' +
                 ' HORA_PROCESS = :HORA_PROCESS, NOMEARQ_PROCESS = :NOMEARQ_PROCESS ' +
                 ' WHERE NUM_NOTAT = :NUM_NOTAT AND COD_EMPRESA = :COD_EMPRESA';
                buscas1.ParamByName('STATUST').AsString := 'CANCELADA';
                buscas1.ParamByName('NUM_NOTAT').AsInteger := strtoint(vnumnota);
                buscas1.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
                buscas1.ParamByName('COD_USUARIO_PROCESS').AsInteger := vDadosIni.vCodUsuario;
                buscas1.ParamByName('DATA_PROCESS').AsDate := vDadosIni.getDataBanco(buscas);
                buscas1.ParamByName('HORA_PROCESS').AsString := FormatDateTime('hh:mm:ss', vDadosIni.getDataHoraBanco(buscas));
                buscas1.ParamByName('NOMEARQ_PROCESS').AsString := Trim(pArquivo);
                try
                  buscas1.ExecSQL;
                except
                  Application.MessageBox(PChar('ERRO: ' + vnumnota), 'Atenção', mb_ok + MB_ICONINFORMATION);
                  Result := False;
                end;
              end;
            end;
          end;
        end;
      end;
      CloseFile(F);
      // colocar o teste se a moto já está no estoque
      CommitaTransacao;
      vArqTrans := True;
    except
      on e: exception do
      begin
        registraErro('Erro ao processar arquivo PCL. Erro: ' + e.Message +' - '+ vnumnota + #13 +
        'Arquivo: ' + IntToStr(vParam.ContArq) + ' de ' + IntToStr(vParam.TotArq)+ #13 +
        'Processando FDC '+ IntToStr(i) +' de ' + IntToStr(totLinhas) + #13 +
        'NomeArquivo: ' + QuotedStr(trim(pArquivo)));
        Result := False;
        Application.MessageBox(pchar('Erro ao processar arquivo PCL. Erro: ' + e.Message +' - '+ vnumnota + #13 +
        'Arquivo; ' + IntToStr(vParam.ContArq) + ' de ' + IntToStr(vParam.TotArq) + #13 +
        'Processando FDC '+ IntToStr(i) +' de ' + IntToStr(totLinhas) + #13 +
        'NomeArquivo: + ' + QuotedStr(trim(pArquivo))), 'Atenção', MB_ICONERROR + MB_OK);
        CloseFile(F);
        RollBackTransacao;
      end;
    end;

 finally
   vDadosIni.fechaStatusProcessamento;
   buscas.Close;
   buscas.SQL.Text := ' UPDATE OR INSERT INTO ARQ_FABRICA ' +
     ' (NOMEARQUIVO, TIPOARQUIVO, COD_EMPRESA, TP_FATMOTOS, ATIVO) ' +
     ' VALUES ' +
     ' (:NOMEARQUIVO, :TIPOARQUIVO,:COD_EMPRESA, :TP_FATMOTOS, :ATIVO) ' +
     ' MATCHING (NOMEARQUIVO, TIPOARQUIVO, COD_EMPRESA); ';
   buscas.ParamByName('NOMEARQUIVO').AsString := trim(pArquivo);
   buscas.ParamByName('TIPOARQUIVO').AsString := 'HONDA';
   buscas.ParamByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
   buscas.ParamByName('ATIVO').AsInteger := 1;
   if vArqTrans then
   begin
     vDadosIni.GravaAuditoria('FAB014', 'PROCESSAR', 'SUCESSO ARQUIVO ' + QuotedStr(trim(pArquivo)), '', '', buscas1);
     buscas.ParamByName('TP_FATMOTOS').AsString := 'S';
   end
   else
   begin
     if not Result then
     vDadosIni.GravaAuditoria('FAB014', 'PROCESSAR', 'FALHA ARQUIVO ' + QuotedStr(trim(pArquivo)), '', '', buscas1);
     buscas.ParamByName('TP_FATMOTOS').AsString := 'N';
   end;
   buscas.ExecSQL;
   CommitaTransacao;
 end;
end;

function TFabricaHonda.MontarArquivoHonda: boolean;
var
  Arq: TextFile;
  NomeArq, Arquivo: string;
  vval: string;
  vfonecomercial: string;
  vtpvenda: string;
  I: Integer;
  J: Integer;
begin
  Result := False;

  if not DirectoryExists(Diretorio) then
  begin
     Application.MessageBox(Pchar('Diretório não encontrado: ' + #13 +
     trim(Diretorio)), 'Atenção', MB_ICONINFORMATION + MB_OK);
     if frmRelHonda.EditDiretorio.CanFocus then
       frmRelHonda.EditDiretorio.SetFocus;
	  exit;
  end;

  if trim(Copy(trim(Diretorio), Length(trim(Diretorio)), 1)) = '\' then
    NomeArq := Copy(trim(Diretorio) , 1, Length(trim(Diretorio)) - 1)
  else
    NomeArq := trim(Diretorio);

  if trim(TipoRelatorio) = 'RelArquivoVendaporChassi' then
  begin
    try
      if not vDadosIni.PesqPros('FAB006', 'MONTAR ARQUIVO', '', '','', buscas, true) then
        Exit;

      J := 1;
      vDadosIni.AuxStr := vDadosIni.Space(1200);
      vDadosIni.LimpaLInha(vDadosIni.AuxStr);
//      SelectDirectory('Favor informar o local do Arquivo!', '', Nomearq);

      Arquivo:= Nomearq + '\CHASSIS'
        + formatdatetime('yyyy', Date)
        + formatdatetime('mm', Date)
        + formatdatetime('dd', Date)
        + '-' +IntToStr(J) + '.TXT';

      while (fileexists(Arquivo)) do
      begin
        J := J + 1;
        Arquivo:= Nomearq + '\CHASSIS'
         + formatdatetime('yyyy', Date)
         + formatdatetime('mm', Date)
         + formatdatetime('dd', Date)
         + '-' +IntToStr(J) + '.TXT';
      end;
      AssignFile(Arq, Arquivo);
      Rewrite(arq);

      buscas1 := TIBQuery.Create(Application);
      buscas1.Database := buscas.Database;
      buscas1.Transaction := buscas.Transaction;

      NomeArq := Arquivo;

      buscas.close;
      if (vDadosIni.vEmp.vVersaoVeiculos = '4') then
      begin
        buscas.SQL.Text := ' select ft.data_ven, ft.chassiv, ft.clientes_v, ft.status_v, ft.tipo_v ' +
         ' from COM_FAT ft,clientes cl,estados est,nat_op nt' +
         ' where ft.natop_v = nt.codigo_nop and nt.faturamento = ''S'' and ft.tipo_venda_v = ''N'' and' +
         ' ft.data_ven >= :vdat1 and ft.data_ven <= :vdat2 and  ft.clientes_v = cl.cod_cliente and' +
         ' ft.cod_empresa = cl.cod_empresa and cl.codigo_uf = est.codigo_uf and' +
         ' ft.cod_empresa = :cod_empresa and ft.ativo = 1 and ft.natureza = ''S''' +
         ' and (coalesce(trim(upper(ft.status_v)), '''') = ''FECHADO'') order by ft.data_ven';
      end
      else
      begin
       buscas.SQL.Text := ' select ft.data_ven, ft.chassiv, ft.clientes_v, ft.status_v, ft.tipo_v ' +
        ' from COM_FAT ft,MOT_VEN mtv,NAT_OP nt ' +
        ' where ft.natop_v = nt.codigo_nop and nt.faturamento <> ''N'' ' +
        ' and ft.tipo_venda_v = ''N'' and ft.data_ven >= :vdat1 and ft.data_ven <= :vdat2 ' +
        ' and ft.num_nota_v = mtv.num_nota_v  and ft.n_comando = mtv.n_comando ' +
        ' and (ft.natop_v <> 5409 and ft.natop_v <> 6409 and ft.natop_v <> 5913 and ft.natop_v <> 6913) ' +
        ' and ft.cod_empresa = mtv.cod_empresa and ft.cod_empresa = :cod_empresa and ft.ativo = 1 order by ft.data_ven';
      end;
      buscas.params[0].AsDate := datainicial;
      buscas.params[1].AsDate := datafinal;
      buscas.params[2].AsInteger := StrToInt(vDadosIni.codEmpresa);
      buscas.open;
      buscas.FetchAll;
      i := 0;
      buscas.First;
      while not buscas.eof do
      begin
        i := i + 1;
        vDadosIni.abreStatusProcessamento('', 'Montando Relação Vendas por Chassi (Honda) '+ IntToStr(i) +' de ' + IntToStr(buscas.RecordCount));
        Application.ProcessMessages;
         vDadosIni.AuxStr := '';
         vDadosIni.Auxstr := vDadosIni.Auxstr + vDadosIni.Strzero(vDadosIni.vEmp.vcodconcess, 7);
         vDadosIni.Auxstr := vDadosIni.Auxstr + buscas.FieldByName('CHASSIV').AsString;
         if (trim(buscas.FieldByName('TIPO_V').AsString) = 'CDCT') or
         (trim(buscas.FieldByName('TIPO_V').AsString) =  'CDCP') or
         (trim(buscas.FieldByName('TIPO_V').AsString) =  'LSG') or
         (trim(buscas.FieldByName('TIPO_V').AsString) = 'CC') then
           vDadosIni.Auxstr := vDadosIni.Auxstr + 'CDC'
         else
         begin
           if (trim(buscas.FieldByName('TIPO_V').AsString) = 'CTA') or
           (trim(buscas.FieldByName('TIPO_V').AsString) =  'CTV') or
           (trim(buscas.FieldByName('TIPO_V').AsString) =  'CTR') then
             vDadosIni.Auxstr := vDadosIni.Auxstr + 'CT '
           else
           begin
            if (trim(buscas.FieldByName('TIPO_V').AsString) = 'PP') then
              vDadosIni.Auxstr := vDadosIni.Auxstr + 'AV '
            else
              vDadosIni.Auxstr := vDadosIni.Auxstr + trim(buscas.FieldByName('TIPO_V').AsString) + vDadosIni.Space(3-length(trim(buscas.FieldByName('TIPO_V').AsString)));
           end;
         end;
         vDadosIni.Auxstr := vDadosIni.Auxstr + copy(datetostr(buscas.FieldByName('DATA_VEN').AsDateTime),7,4)+
         copy(datetostr(buscas.FieldByName('DATA_VEN').AsDateTime),4,2) + copy(datetostr(buscas.FieldByName('DATA_VEN').AsDateTime),1,2);
         WriteLn(arq, vDadosIni.auxstr);

        buscas1.Close;
        buscas1.SQL.Text := ' Select * from REL_VNDH ' +
         ' where CHASSI_V = :CHASSI_V and DATA_VEN = :DATA_VEN and COD_EMPRESA = :COD_EMPRESA AND ATIVO = 1';
        buscas1.ParamByName('CHASSI_V').AsString := buscas.FieldByName('CHASSIV').AsString;
        buscas1.ParamByName('DATA_VEN').AsString := buscas.FieldByName('DATA_VEN').AsString;
        buscas1.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
        buscas1.Open;
        if buscas1.IsEmpty then
        begin
         buscas1.Close;
         buscas1.SQL.Text := ' INSERT INTO REL_VNDH (CHASSI_V, DATA_VEN, COD_EMPRESA, ATIVO) ' +
          ' VALUES (:CHASSI_V, :DATA_VEN, :COD_EMPRESA, :ATIVO);';
         buscas1.ParamByName('CHASSI_V').AsString := buscas.FieldByName('CHASSIV').AsString;
         buscas1.ParamByName('DATA_VEN').AsString := buscas.FieldByName('DATA_VEN').AsString;
         buscas1.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
         buscas1.ParamByName('ATIVO').AsInteger := 1;
         buscas1.ExecSQL;
        end;
        buscas.next;
      end;
      if buscas1.Transaction.InTransaction then
        buscas1.Transaction.Commit;

      Result := True;
    finally
      if Result then
        vDadosIni.GravaAuditoria('FAB006', 'MONTAR ARQUIVO', 'SUCESSO', '', '', buscas)
      else
        vDadosIni.GravaAuditoria('FAB006', 'MONTAR ARQUIVO', 'FALHA', '', '', buscas);
    end;
  end
  else if trim(TipoRelatorio) = 'RelArquivoClientes' then
  begin
     try
       if not vDadosIni.PesqPros('FAB007', 'MONTAR ARQUIVO', '', '','', buscas, true) then
         Exit;

       vDadosIni.AuxStr := vDadosIni.Space(319);
       vDadosIni.LimpaLInha(vDadosIni.AuxStr);
//       SelectDirectory('Favor informar o local do Arquivo!', '', Nomearq);
       Nomearq := Nomearq + '\CLIENTES.TXT';
       AssignFile(Arq,NomeArq);
       Rewrite(arq);
       buscas.close;
       if (vDadosIni.vEmp.vVersaoVeiculos = '4') then
       begin
         buscas.SQL.Text := ' select ft.chassiv,cl.cpfcgc,cl.sexo,cl.nome_cliente,cl.endereco,cl.bairro,cl.cidade, ' +
          ' est.sigla_uf,cl.cep,cl.fone_cliente,cl.email,ft.data_ven,cl.data_nasc,cl.num_end_cliente,cl.renda_indvidual, ' +
          ' cl.complemento,ft.PRIMEIROVEICULO,ft.MARCAVEICULOANT,ft.MODELOVEICULOANT,ft.ACEITA_CONTATO, ' +
          ' cl.fax,cl.fone_trab,cl.cod_cliente,ft.tipo_v,ft.QTDE_PARC,tpm.desfab' +
          ' from COM_FAT ft, EST_MOTO e, NAT_OP nt, clientes cl, estados est, tipmodelo tpm' +
          ' where ft.natop_v = nt.codigo_nop and nt.faturamento = ''S'' and ft.tipo_venda_v = ''N'' ' +
          ' and ft.data_ven >= :vdat1 and ft.data_ven <= :vdat2 ' +
          ' and ft.cod_estmoto = e.codigo and ft.chassiv = e.chassi_c and ft.cod_empresa = e.cod_empresa ' +
          ' and ft.clientes_v = cl.cod_cliente and ft.cod_empresa = cl.cod_empresa and cl.codigo_uf = est.codigo_uf ' +
          ' and e.versaoest = tpm.codigo and e.cod_empresa = tpm.cod_empresa ' +
          ' and nt.faturamento = ''S'' and ft.cod_empresa = :cod_empresa and ft.ativo = 1 ' +
          ' and (coalesce(trim(upper(ft.status_v)), '''') = ''FECHADO'') ' +
          ' and ft.natureza = ''S'' order by ft.data_ven';
       end
       else
       begin
         buscas.SQL.Text := ' select ft.chassiv,cl.cpfcgc,cl.sexo,cl.nome_cliente,cl.endereco,cl.bairro,cl.cidade, ' +
          ' est.sigla_uf,cl.cep,cl.fone_cliente,cl.email,ft.data_ven,cl.data_nasc,cl.num_end_cliente,cl.renda_indvidual, ' +
          ' cl.complemento,ft.PRIMEIROVEICULO,ft.MARCAVEICULOANT,ft.MODELOVEICULOANT,ft.ACEITA_CONTATO, ' +
          ' cl.fax,cl.fone_trab,cl.cod_cliente,ft.tipo_v,ft.QTDE_PARC,tpm.desfab ' +
          ' from COM_FAT ft,MOT_VEN mtv,clientes cl,estados est,tipmodelo tpm,nat_op nt ' +
          ' where ft.natop_v = nt.codigo_nop and nt.faturamento <> ''N'' and ft.tipo_venda_v = ''N'' ' +
          ' and ft.data_ven >= :vdat1 and ft.data_ven <= :vdat2 and ft.n_comando = mtv.n_comando ' +
          ' and ft.cod_empresa = mtv.cod_empresa and ft.clientes_v = cl.cod_cliente  ' +
          ' and ft.cod_empresa = cl.cod_empresa and cl.codigo_uf = est.codigo_uf ' +
          ' and mtv.versaov = tpm.codigo and mtv.cod_empresa = tpm.cod_empresa ' +
          ' and ft.cod_empresa = :cod_empresa and ft.ativo = 1 order by ft.data_ven ';
       end;
       buscas.params[0].AsDate:= datainicial;
       buscas.params[1].AsDate:= datafinal;
       buscas.params[2].AsInteger:= StrToInt(vDadosIni.codEmpresa);
       buscas.open;
       buscas.FetchAll;
       i := 0;
       buscas.First;
       while not buscas.eof do
       begin
        i := i + 1;
        vDadosIni.abreStatusProcessamento('', 'Montando Relação Clientes (Honda) '+ IntToStr(i) +' de ' + IntToStr(buscas.RecordCount));
        Application.ProcessMessages;

        vDadosIni.MontaLinha(001, trim(buscas.FieldByName('CHASSIV').AsString));
        vDadosIni.MontaLinha(018, vDadosIni.Strzero(vDadosIni.vEmp.vcodconcess, 7));
        if length(buscas.FieldByName('CPFCGC').AsString) > 11 then
        begin
          vDadosIni.MontaLinha(025, 'J');
          vDadosIni.MontaLinha(026, ' ');
          vDadosIni.MontaLinha(027, '00');
        end
        else
        begin
          vDadosIni.MontaLinha(025, 'F');
          vDadosIni.MontaLinha(026, UpperCase(buscas.FieldByName('SEXO').AsString));
          if not buscas.FieldByName('DATA_NASC').IsNull then
            vDadosIni.MontaLinha(027, vDadosIni.Strzero(trunc(((date - buscas.FieldByName('DATA_NASC').AsDateTime) / 365)),2))
          else
            vDadosIni.MontaLinha(027, '20');
        end;
        vDadosIni.MontaLinha(029, buscas.FieldByName('CPFCGC').AsString);
        vDadosIni.MontaLinha(046, buscas.FieldByName('NOME_CLIENTE').AsString);
        vDadosIni.MontaLinha(077, trim(buscas.FieldByName('CEP').AsString));
        vDadosIni.MontaLinha(085, buscas.FieldByName('ENDERECO').AsString);
        vDadosIni.MontaLinha(116, copy(buscas.FieldByName('NUM_END_CLIENTE').AsString, 1, 5));
        vDadosIni.MontaLinha(121, buscas.FieldByName('COMPLEMENTO').AsString);
        vDadosIni.MontaLinha(127, buscas.FieldByName('BAIRRO').AsString);
        vDadosIni.MontaLinha(141, buscas.FieldByName('CIDADE').AsString);
        vDadosIni.MontaLinha(168, buscas.FieldByName('SIGLA_UF').AsString);
        if (buscas.FieldByName('FONE_CLIENTE').IsNull) or (trim(buscas.FieldByName('FONE_CLIENTE').AsString) = '') then
        begin
          vDadosIni.MontaLinha(170, copy(vDadosIni.vEmp.vTelefone, 2, 2));
          vDadosIni.MontaLinha(172, copy(vDadosIni.vEmp.vTelefone, 5, 4)+ copy(vDadosIni.vEmp.vTelefone, 10, 4));
        end
        else
        begin
          try
            vval := copy(buscas.FieldByName('FONE_CLIENTE').AsString, 1, 2);
            StrToInt(vval);
            vDadosIni.MontaLinha(170, copy(buscas.FieldByName('FONE_CLIENTE').AsString, 1, 2));
            if (not buscas.FieldByName('FONE_CLIENTE').IsNull) and (trim(buscas.FieldByName('FONE_CLIENTE').AsString) <> '') then
              vDadosIni.MontaLinha(172, copy(buscas.FieldByName('FONE_CLIENTE').AsString, 3, 8));
          except
            try
              vval := copy(buscas.FieldByName('FONE_CLIENTE').AsString, 2, 2);
              StrToInt(vval);
              vDadosIni.MontaLinha(170, copy(buscas.FieldByName('FONE_CLIENTE').AsString, 2, 2));
              if (not buscas.FieldByName('FONE_CLIENTE').IsNull) and (trim(buscas.FieldByName('FONE_CLIENTE').AsString) <> '') then
                vDadosIni.MontaLinha(172, copy(buscas.FieldByName('FONE_CLIENTE').AsString, 5, 4) + copy(buscas.FieldByName('FONE_CLIENTE').AsString, 10, 4));
            except
              vDadosIni.MontaLinha(170, '00');
              if (not buscas.FieldByName('FONE_CLIENTE').IsNull) and (trim(buscas.FieldByName('FONE_CLIENTE').AsString) <> '') then
                vDadosIni.MontaLinha(172, copy(buscas.FieldByName('FONE_CLIENTE').AsString, 3, 8));
            end
          end;
        end;
        if ((buscas.FieldByName('FONE_TRAB').IsNull) or (trim(buscas.FieldByName('FONE_TRAB').AsString) = '')) and
        ((buscas.FieldByName('FAX').IsNull) or (trim(buscas.FieldByName('FAX').AsString) = '')) then
        begin
          vDadosIni.MontaLinha(180, copy(vDadosIni.vEmp.vTelefone, 2, 2));
          vDadosIni.MontaLinha(182,copy(vDadosIni.vEmp.vTelefone, 5, 4)+copy(vDadosIni.vEmp.vTelefone, 10, 4));
        end
        else
        begin
         if ((buscas.FieldByName('FONE_TRAB').IsNull) or (trim(buscas.FieldByName('FONE_TRAB').AsString) = '')) then
           vfonecomercial := buscas.FieldByName('FAX').AsString
         else
           vfonecomercial := buscas.FieldByName('FONE_TRAB').AsString;
          try
            vval := copy(vfonecomercial, 1, 2);
            StrToInt(vval);
            vDadosIni.MontaLinha(180, copy(vfonecomercial, 1, 2));
            vDadosIni.MontaLinha(182, copy(vfonecomercial, 3, 8));
          except
            try
              vval := copy(vfonecomercial, 2, 2);
              StrToInt(vval);
              vDadosIni.MontaLinha(180, copy(vfonecomercial, 2, 2));
              vDadosIni.MontaLinha(182, copy(vfonecomercial, 5, 4) + copy(vfonecomercial, 10, 4));
            except
              vDadosIni.MontaLinha(180, '00');
              vDadosIni.MontaLinha(182, copy(vfonecomercial, 3, 8));
            end
          end;
        end;
        vDadosIni.MontaLinha(190, buscas.FieldByName('EMAIL').AsString);
        vDadosIni.MontaLinha(221, vDadosIni.Tzero(buscas.FieldByName('RENDA_INDVIDUAL').AsCurrency, 10));
        vDadosIni.MontaLinha(231, '0000');
        vDadosIni.MontaLinha(235, copy(datetostr(buscas.FieldByName('DATA_VEN').AsDateTime), 7, 4) +  copy(datetostr(buscas.FieldByName('DATA_VEN').AsDateTime), 4, 2) +
          copy(datetostr(buscas.FieldByName('DATA_VEN').AsDateTime), 1, 2));
        vDadosIni.MontaLinha(243,'S');
        if (trim(buscas.FieldByName('TIPO_V').AsString) = 'CDCT') or
        (trim(buscas.FieldByName('TIPO_V').AsString) =  'CDCP') or
        (trim(buscas.FieldByName('TIPO_V').AsString) =  'LSG') or
        (trim(buscas.FieldByName('TIPO_V').AsString) = 'CC') then
          vtpvenda := 'CDC'
        else
        begin
          if (trim(buscas.FieldByName('TIPO_V').AsString) = 'CTA') or
          (trim(buscas.FieldByName('TIPO_V').AsString) =  'CTV') or
          (trim(buscas.FieldByName('TIPO_V').AsString) =  'CTR') then
            vtpvenda := 'CT '
          else
          begin
           if (trim(buscas.FieldByName('TIPO_V').AsString) = 'PP') then
            vtpvenda := 'AV '
           else
            vtpvenda := trim(buscas.FieldByName('TIPO_V').AsString) + vDadosIni.Space(3-length(trim(buscas.FieldByName('TIPO_V').AsString)));
          end;
        end;
        vDadosIni.MontaLinha(314, vtpvenda);
        if (buscas.FieldByName('QTDE_PARC').AsInteger = 0) and (trim(vtpvenda) <> 'AV') then
          vDadosIni.MontaLinha(317, vDadosIni.StrZero(01,2))
        else
          vDadosIni.MontaLinha(317, vDadosIni.StrZero(buscas.FieldByName('QTDE_PARC').AsInteger, 2));
        if (buscas.FieldByName('ACEITA_CONTATO').IsNull) or (trim(buscas.FieldByName('ACEITA_CONTATO').AsString) = '') then
          vDadosIni.MontaLinha(319,'S')
        else
          vDadosIni.MontaLinha(319, trim(buscas.FieldByName('ACEITA_CONTATO').AsString));
        WriteLn(arq, vDadosIni.auxstr);
        vDadosIni.LimpaLinha(auxstr);
        buscas.next;
       end;

       Result := True;
     finally
       if Result then
         vDadosIni.GravaAuditoria('FAB007', 'MONTAR ARQUIVO', 'SUCESSO', '', '', buscas)
       else
         vDadosIni.GravaAuditoria('FAB007', 'MONTAR ARQUIVO', 'FALHA', '', '', buscas);
     end;
  end
  else if trim(TipoRelatorio) = 'RelEstoqueInicial' then
  begin
    try
      if not vDadosIni.PesqPros('FAB008', 'MONTAR ARQUIVO', '', '','', buscas, true) then
         Exit;

      vDadosIni.AuxStr := vDadosIni.Space(1200);
      vDadosIni.LimpaLInha(vDadosIni.AuxStr);
//      SelectDirectory('Favor informar o local do Arquivo!', '', Nomearq);
      Nomearq := Nomearq + '\' + IntToStr(vDadosIni.vEmp.vcodconcess)+'.TXT';
      AssignFile(Arq, NomeArq);
      Rewrite(arq);

      buscas.Close;
      if (vDadosIni.vEmp.vVersaoVeiculos = '4') then
      begin
       buscas.SQL.Text := ' select * from est_moto ' +
         ' where coalesce(status_estoque, ''N'') = ''S'' ' +
         ' and (trim(coalesce(upper(posicao), '''')) <> ''MORTO'') ' +
         ' and cod_empresa = :cod_empresa and ativo = 1';
      end
      else
      begin
        buscas.SQL.Text := ' select * from est_moto ' +
         ' where cod_empresa = :cod_empresa and ativo = 1';
      end;
      buscas.ParamByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
      buscas.open;
      buscas.FetchAll;

      i := 0;
      buscas.First;
      While not buscas.eof do
      begin
       i := i + 1;
       vDadosIni.abreStatusProcessamento('', 'Montando Relação Estoque Inicial (Honda) '+ IntToStr(i) +' de ' + IntToStr(buscas.RecordCount));
       if (not buscas.FieldByName('CHASSI_C').IsNull) and (trim(buscas.FieldByName('CHASSI_C').AsString) <> '') then
       begin
        vDadosIni.AuxStr := '';
        vDadosIni.Auxstr := vDadosIni.Auxstr + buscas.FieldByName('CHASSI_C').AsString;
        WriteLn(arq, vDadosIni.auxstr);
       end;
       buscas.next;
      end;

      Result := True;
    finally
      if Result then
         vDadosIni.GravaAuditoria('FAB008', 'MONTAR ARQUIVO', 'SUCESSO', '', '', buscas)
      else
         vDadosIni.GravaAuditoria('FAB008', 'MONTAR ARQUIVO', 'FALHA', '', '', buscas);
    end;
  end;
  vDadosIni.fechaStatusProcessamento;
  closeFile(arq);
  buscas.Close;
  buscas1.Close;
  Application.MessageBox(pchar('Arquivo Montado com Sucesso! ' + #13 + '"'+ Nomearq + '"'), 'Atenção', 0 + 64);
end;


procedure TFabricaHonda._localizarArquivos(pPath: string; pLista: TStringList);
var
  vEncontrou: Integer;
  vRec: TSearchRec;
begin
  pPath := IncludeTrailingPathDelimiter(pPath);
  vEncontrou := FindFirst(pPath + '*.*', 0, vRec);
  try
    pLista.Clear;
    while vEncontrou = 0 do
    begin
      pLista.Add(pPath + vRec.Name);
      vEncontrou := FindNext(vRec);
    end;
  finally
    SysUtils.FindClose(vRec);
  end;
end;

{ TComunicaAssohonda }


function TComunicaAssohonda.abrecomunicaAssohonda(vdata: Tdate): boolean;
begin
 result := montaSelect('select * from integra_assohonda ' +
  ' where data_arquivo = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vdata)) +
  ' and cod_empresa = ' + vdadosini.codEmpresa +
  ' and ativo = 1 order by ORDTIPO,DESC_MODELO,COD_COR,DESC_COR');
end;

function TComunicaAssohonda.abrecomunicaAssohonda(vdat1, vdat2: Tdate): boolean;
begin
 result := montaSelect('select * from integra_assohonda ' +
  ' where data_arquivo >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vdat1)) +
  ' and data_arquivo <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vdat2)) +
  ' and cod_empresa = ' + vdadosini.codEmpresa +
  ' and ativo = 1 order by ORDTIPO,DESC_MODELO,COD_COR,DESC_COR');

end;

function TComunicaAssohonda.abreoufechatpmod(vtp: integer): boolean;
begin
  if vtp = 1 then
  begin
   Tipomodelo.close;
   tipomodelo.sql.text:='SELECT * FROM TIPMODELO WHERE VNDESTOQUE = ''S'' '+
   'and ATIVO = 1 AND COD_EMPRESA = '+vDadosIni.codEmpresa+' ORDER BY DESCRICAO' ;
   Tipomodelo.open;
   Codfabrica.close;
   Codfabrica.sql.text:='SELECT * FROM  CODIGO_CORFAB ORDER BY DESCRICAO_COR';
   Codfabrica.open;
  end
  else
  begin
    Tipomodelo.close;
    Codfabrica.close;
  end;
end;

function TComunicaAssohonda.buscavetor(vmodelo, vcor: string; vetmodelo,
  vetcor: ArrayOfString): integer;
  var
   i: integer;
begin
  result:=-1;
  for i := 0 to Length(vetmodelo)-1 do
  begin
     if (vetmodelo[i] = vmodelo) and (vetcor[i] = vcor) then
     begin
       result:=i;
       break
     end;
  end;
end;

constructor TComunicaAssohonda.create;
begin
 inherited;
 dataSet := TClientDataSet(dtmFabrica.CdsComunicaAssohonda);
 Tipomodelo:=TIBQuery(dtmFabrica.QrTipoModelo);
 Codfabrica:=TIBQuery(dtmFabrica.Ibcodigocorfab);
end;


function TComunicaAssohonda.enviaDadosWebservice(vdataatual: Tdate;vtpop: integer): boolean;
var
 tgconcessionaria, vcnpj,vdataref: WideString;
 modelo, cor: ArrayOfString;
 estoquefisico, transito,
 saldofaturar, pedidofirme, confirmadohonda, pedidoadicional, cancelamento,
 vendasdia, vendasacumuladas: ArrayOfInt;
 i: integer;
 mensagens: Array[0..4] of string;
 vresultado: string;
 vcampost1,vcampost2: string;
begin
  mensagens[0]:='Transação completada com sucesso - informações recebidas.';
  mensagens[1]:='Código de Identificação (TgConcessionária) inválido';
  mensagens[2]:='Erro ao gravar registros - entrar em contato com a Associação';
  mensagens[3]:='Erro de autenticação de usuário - entrar em contato com a Associação';
  mensagens[4]:='tgconcessionaria e vcnpj vazios';
  if vtpop = 1 then
  begin
    vcampost1:='COD_STATUS_RET';
    vcampost2:='STATUS_RETORNO';
  end
  else
  begin
   vcampost1:='COD_STATUS_RETV';
   vcampost2:='STATUS_RETORNOV';
  end;
  // Enviando dados de estoque/vendas...
  dataset.close;
  dataset.CommandText := ' select * from integra_assohonda ' +
   ' where data_arquivo = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vdataatual)) +
   ' and cod_empresa = '+vDadosIni.codEmpresa+
   ' and ' + vcampost1 + ' <> 0' ;
  dataset.open;
  if not dataSet.isempty then
  begin
    i:=1;
    SetLength(modelo,i);
    SetLength(cor,i);
    SetLength(estoquefisico,i);
    SetLength(transito,i);
    SetLength(saldofaturar,i);
    SetLength(pedidofirme,i);
    SetLength(confirmadohonda,i);
    SetLength(pedidoadicional,i);
    SetLength(cancelamento,i);
    SetLength(vendasdia,i);
    SetLength(vendasacumuladas,i);
    for i:=0 to 0 do
    begin
     modelo[i]:='';
     cor[i]:='';
     estoquefisico[i]:=0;
     transito[i]:=0;
     saldofaturar[i]:=0;
     pedidofirme[i]:=0;
     confirmadohonda[i]:=0;
     pedidoadicional[i]:=0;
     cancelamento[i]:=0;
     vendasdia[i]:=0;
     vendasacumuladas[i]:=0;
    end;
    i:=1;
    modelo[i-1]:=dataset.FieldByName('desc_modelo').AsString;
    cor[i-1]:=dataset.FieldByName('desc_cor').AsString;
    estoquefisico[i-1]:=dataSet.FieldByName('ESTOQUEFISICO').AsInteger;
    transito[i-1]:=dataSet.FieldByName('TRANSITO').AsInteger;
    saldofaturar[i-1]:=dataSet.FieldByName('SALDOFATURAR').AsInteger;
    pedidofirme[i-1]:=dataSet.FieldByName('PEDIDOFIRME').AsInteger;
    confirmadohonda[i-1]:=dataSet.FieldByName('CONFIRMADOHONDA').AsInteger;
    pedidoadicional[i-1]:=dataSet.FieldByName('PEDIDOADICIONAL').AsInteger;
    cancelamento[i-1]:=dataSet.FieldByName('CANCELAMENTO').AsInteger;
    vendasdia[i-1]:=dataSet.FieldByName('VENDASDIA').AsInteger;
    vendasacumuladas[i-1]:=dataSet.FieldByName('VENDASACUMULADA').AsInteger;
    dataSet.next;
    while not dataset.Eof do
    begin
     i:=i+1;
     // Aumenta o array para novo modelo
     SetLength(modelo,i);
     SetLength(cor,i);
     SetLength(estoquefisico,i);
     SetLength(transito,i);
     SetLength(saldofaturar,i);
     SetLength(pedidofirme,i);
     SetLength(confirmadohonda,i);
     SetLength(pedidoadicional,i);
     SetLength(cancelamento,i);
     SetLength(vendasdia,i);
     SetLength(vendasacumuladas,i);
     modelo[i-1]:=dataset.FieldByName('desc_modelo').AsString;
     cor[i-1]:=dataset.FieldByName('desc_cor').AsString;
     estoquefisico[i-1]:=dataSet.FieldByName('ESTOQUEFISICO').AsInteger;
     transito[i-1]:=dataSet.FieldByName('TRANSITO').AsInteger;
     saldofaturar[i-1]:=dataSet.FieldByName('SALDOFATURAR').AsInteger;
     pedidofirme[i-1]:=dataSet.FieldByName('PEDIDOFIRME').AsInteger;
     confirmadohonda[i-1]:=dataSet.FieldByName('CONFIRMADOHONDA').AsInteger;
     pedidoadicional[i-1]:=dataSet.FieldByName('PEDIDOADICIONAL').AsInteger;
     cancelamento[i-1]:=dataSet.FieldByName('CANCELAMENTO').AsInteger;
     vendasdia[i-1]:=dataSet.FieldByName('VENDASDIA').AsInteger;
     vendasacumuladas[i-1]:=dataSet.FieldByName('VENDASACUMULADA').AsInteger;
     dataset.next;
    end;
    // Enviando dados do estoque/venda para o Webservice Assohonda...
    tgconcessionaria:=inttostr(vDadosIni.vEmp.vcodconcess);
//    'TESTEASSOHONDA2012';
    vcnpj:=copy(vDadosIni.vEmp.vCNPJ,1,2)+'.'+
    copy(vDadosIni.vEmp.vCNPJ,3,3)+'.'+copy(vDadosIni.vEmp.vCNPJ,6,3)+'/'+
    copy(vDadosIni.vEmp.vCNPJ,9,4)+'-'+copy(vDadosIni.vEmp.vCNPJ,13,2);
    vdataref:=DateToStr(vdataatual);
    vresultado:=enviarEstoqueVendas(inttostr(vtpop),tgconcessionaria, vcnpj,
    vdataref,modelo, cor, estoquefisico, transito,
    saldofaturar, pedidofirme, confirmadohonda, pedidoadicional, cancelamento,
    vendasdia, vendasacumuladas);
//    enviaEstoque(Pchar(tgconcessionaria), pchar(vcnpj),
//    pchar(vdataref), modelo, cor, estoquefisico, transito,
//    saldofaturar, pedidofirme, confirmadohonda, pedidoadicional, cancelamento,
//    vendasdia, vendasacumuladas,vtpop);
    vresultado:=copy(vresultado,1,1);
//    if vresultado <> '0' then
    begin
     try
      dataSet.first;
      while not dataset.eof do
      begin
        dataset.Edit;
        dataset.FieldByName(vcampost1).asinteger:=strtoint(vresultado);
        dataset.FieldByName(vcampost2).AsString:=mensagens[strtoint(vresultado)];
        dataSet.Post;
        dataSet.next;
      end;
      Apply;
      CommitaTransacao;
     except
      on e: exception do
      begin
        dataSet.Cancel;
        RollBackTransacao;
        result := false;
        if Application.MessageBox(pchar(vMensagemErro + #13 +
          'Nenhuma crédito será processado. Mostrar Erro?'), 'Confirmação', MB_YESNO +
          MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
          ShowMessage(e.Message);
      end;
     end;
    end
  end;
end;

function TComunicaAssohonda.gravardadosinsform: boolean;
begin
 Post;
 Apply;
 CommitaTransacao;
end;

function TComunicaAssohonda.MontaenvioAssohonda(vdata: Tdate;vtpop: integer): boolean;
var
 vdataatual: TDate;
 vdia, vmes, vano: word;
 i,vpos: integer;
 vflag: integer;
begin
 //
 result:=true;
 vdataatual:=vdata;
 //vDadosIni.getDataBanco(buscas);
 decodedate(vdataatual, vano, vmes, vdia);
  // gravar os dados no integra_assohonda
 vDadosIni.abreStatusProcessamento('','Verificando dados para o dia '+DateToStr(vdataatual));
 buscas.close;
 buscas.sql.text := ' select * from integra_assohonda ' +
  ' where data_arquivo = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vdataatual)) +
  ' and estoquefisico <> 0 and cod_empresa = ' + vDadosIni.codEmpresa;
 buscas.open;
 if buscas.isempty then
 begin
   try
    IniciaTransacao;
    buscas.close;
    buscas.sql.text:= ' select v.tipo,vv.ordtipo,vv.descricao,v.cod_cor, ' +
     ' v.descricao_cor,vv.codigo,count(v.qtde) as qtde from tipmodelo vv ' +
     ' inner join estoquehonda v on vv.codigo = v.versao and  vv.cod_empresa = v.cod_empresa ' +
     ' where vv.cod_empresa = 1 group by v.tipo,ordtipo,descricao,cod_cor,descricao_cor,vv.codigo ';
    //(v.tipo = ''EST'' or v.tipo = ''DEP'')
    buscas.open;
    while not buscas.eof do
    begin
     if (trim(buscas.FieldByName('tipo').AsString) <> 'CANC') then
     begin
      dataSet.close;
      dataset.CommandText:= ' select * from integra_assohonda ' +
       ' where data_arquivo = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vdataatual)) +
       ' and cod_modelo = ' + IntToStr(buscas.FieldByName('CODIGO').AsInteger) +
       ' and cod_cor = ' + IntToStr(buscas.FieldByName('cod_cor').AsInteger) +
       ' and cod_empresa = ' + vDadosIni.codEmpresa;
      dataset.open;
      if dataSet.IsEmpty then
        dataSet.Append
      else
         dataSet.Edit;
      dataset.FieldByName('DATA_ARQUIVO').AsDateTime := vdataatual;
      dataSet.FieldByName('COD_MODELO').AsInteger := buscas.FieldByName('CODIGO').AsInteger;
      dataSet.FieldByName('COD_COR').AsInteger := buscas.FieldByName('cod_cor').AsInteger;
      dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
      dataSet.FieldByName('DESC_MODELO').AsString := buscas.FieldByName('DESCRICAO').AsString;
      dataSet.FieldByName('DESC_COR').AsString := buscas.FieldByName('DESCRICAO_COR').AsString;
      if (trim(buscas.FieldByName('tipo').AsString) = 'EST') or
      (trim(buscas.FieldByName('tipo').AsString) = 'DEP') then
       dataSet.FieldByName('ESTOQUEFISICO').AsInteger:=dataSet.FieldByName('ESTOQUEFISICO').AsInteger+buscas.FieldByName('qtde').AsInteger;
      if (trim(buscas.FieldByName('tipo').AsString) = 'TRANS') then
       dataSet.FieldByName('TRANSITO').AsInteger :=dataSet.FieldByName('TRANSITO').AsInteger+buscas.FieldByName('qtde').AsInteger;
//      if buscas.FieldByName('CODIGO').AsInteger = 4 then
//       ShowMessage('ok');

      buscas1.close;
      if (vDadosIni.vEmp.vVersaoVeiculos = '4') then
        buscas1.SQL.text := 'SELECT count(*) as qtde FROM NF_TRANSITO NF ' +
         ' inner join EST_MOTO IT on IT.NUM_NOTA = NF.NUM_NOTAT AND IT.N_CAIXA = NF.N_CAIXA AND NF.COD_EMPRESA = IT.COD_EMPRESA ' +
         ' inner join TIPMODELO vv on IT.VERSAOEST = vv.CODIGO AND it.cod_empresa = vv.cod_empresa ' +
         ' left join codigo_corfab c on it.corest = c.descricao_cor ' +
         ' where DATA_EMISSAOT >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', strtodate('01/'+FloatToStr(vmes)+'/'+FloatToStr(vano)))) +
         ' AND DATA_EMISSAOT <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vdataatual)) +
         ' AND IT.VERSAOEST = ' + IntToStr(buscas.FieldByName('CODIGO').AsInteger) +
         ' AND C.COD_COR = ' + IntToStr(buscas.FieldByName('cod_cor').AsInteger) +
         ' AND NF.COD_EMPRESA = '+ vDadosIni.codEmpresa +
         ' AND (NF.STATUST = ''CANCELADA'') and vv.vndestoque = ''S'''
      else
        buscas1.SQL.text := 'SELECT count(*) as qtde FROM NF_TRANSITO NF ' +
         ' inner join TRANSITO_MOTOS IT on IT.NUM_NOTAT = NF.NUM_NOTAT AND IT.N_CAIXA = NF.N_CAIXA AND NF.COD_EMPRESA = IT.COD_EMPRESA ' +
         ' inner join TIPMODELO vv on IT.VERSAOT = vv.CODIGO AND it.cod_empresa = vv.cod_empresa ' +
         ' left join codigo_corfab c on it.cort = c.descricao_cor ' +
         ' where DATA_EMISSAOT >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', strtodate('01/'+FloatToStr(vmes)+'/'+FloatToStr(vano)))) +
         ' AND DATA_EMISSAOT <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vdataatual)) +
         ' AND IT.VERSAOT = ' + IntToStr(buscas.FieldByName('CODIGO').AsInteger) +
         ' AND C.COD_COR = ' + IntToStr(buscas.FieldByName('cod_cor').AsInteger) +
         ' AND NF.COD_EMPRESA = '+ vDadosIni.codEmpresa +
         ' AND (NF.STATUST = ''CANCELADA'') and vv.vndestoque = ''S''';
      buscas1.open;
      if not buscas1.FieldByName('qtde').AsInteger > 0 then
        dataSet.FieldByName('CANCELAMENTO').AsInteger:=buscas1.FieldByName('qtde').AsInteger;
      buscas1.close;

      dataset.FieldByName('ORDTIPO').AsInteger:=buscas.FieldByName('ORDTIPO').AsInteger;
      if vtpop = 1 then // Caso ainda não tenha a interface para fazer pedido pelo sistema...
      begin             // O usuário mudará dados na interface e o sistema sempre pega os valores do ultimo dia.
       vDadosIni.abreStatusProcessamento('','Verificando saldos para o dia '+DateToStr(vdataatual));
       buscas1.close;
       buscas1.sql.text := 'select * from integra_assohonda ' +
        ' where cod_modelo = ' + IntToStr(buscas.FieldByName('CODIGO').AsInteger) +
        ' and cod_cor = ' + IntToStr(buscas.FieldByName('cod_cor').AsInteger) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa +
        ' and data_arquivo = (select max(data_arquivo) from integra_assohonda ' +
        ' where cod_modelo = ' + IntToStr(buscas.FieldByName('CODIGO').AsInteger) +
        ' and cod_cor = '+ IntToStr(buscas.FieldByName('cod_cor').AsInteger) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa + ')';
       buscas1.open;
       if not buscas1.IsEmpty then
       begin
         dataSet.FieldByName('SALDOFATURAR').AsInteger := buscas1.FieldByName('SALDOFATURAR').AsInteger;
         dataSet.FieldByName('PEDIDOFIRME').AsInteger := buscas1.FieldByName('PEDIDOFIRME').AsInteger;
         dataSet.FieldByName('CONFIRMADOHONDA').AsInteger := buscas1.FieldByName('CONFIRMADOHONDA').AsInteger;
         dataSet.FieldByName('PEDIDOADICIONAL').AsInteger := buscas1.FieldByName('PEDIDOADICIONAL').AsInteger;
       end;
       buscas1.close;
      end;
      dataSet.post;
      Apply;
     end;
     buscas.next;
    end;
    CommitaTransacao;
   except
    on E: Exception do
    begin
      RollBackTransacao;
      result := false;
      if Application.MessageBox(pchar(vMensagemErro + #13 +
        'Nenhum estoque será processado. Mostrar Erro?'), 'Confirmação', MB_YESNO +
        MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
        ShowMessage(e.Message);
    end;
   end;
   if result then
   begin
     // Verificar se o ultimo dia montado foi feito pedido adicional de veiculo que não tinha estoque
     if vtpop = 1 then
     begin
      try
        IniciaTransacao;
        vDadosIni.abreStatusProcessamento('','Verificando Pedidos adicionais para o dia '+DateToStr(vdataatual));
        buscas.close;
        buscas.sql.text:= ' select * from integra_assohonda ' +
         ' where data_arquivo = (select max(data_arquivo) from INTEGRA_ASSOHONDA '+
         ' where cod_empresa = ' + vDadosIni.codEmpresa +
         ' and data_arquivo <> ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vdataatual)) + ') ' +
         ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and tp_inclusao = ''U'' ' ;
        buscas.open;
        while not buscas.eof do
        begin
         dataset.close;
         dataset.CommandText:= ' select * from integra_assohonda ' +
          ' where data_arquivo = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vdataatual)) +
          ' and cod_modelo = ' + IntToStr(buscas.FieldByName('cod_modelo').AsInteger) +
          ' and cod_cor = ' + IntToStr(buscas.FieldByName('cod_cor').AsInteger) +
          ' and cod_empresa = ' + vDadosIni.codEmpresa;
         dataset.open;
         if dataSet.IsEmpty then
         begin
          dataSet.Append;
          dataset.FieldByName('DATA_ARQUIVO').AsDateTime:=vdataatual;
          dataSet.FieldByName('COD_MODELO').AsInteger := buscas.FieldByName('cod_modelo').AsInteger;
          dataSet.FieldByName('COD_COR').AsInteger := buscas.FieldByName('cod_cor').AsInteger;
          dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
          dataSet.FieldByName('DESC_MODELO').AsString := buscas.FieldByName('DESC_MODELO').AsString;
          dataSet.FieldByName('DESC_COR').AsString := buscas.FieldByName('DESC_COR').AsString;
          dataSet.FieldByName('SALDOFATURAR').AsInteger := buscas.FieldByName('SALDOFATURAR').AsInteger;
          dataSet.FieldByName('PEDIDOFIRME').AsInteger := buscas.FieldByName('PEDIDOFIRME').AsInteger;
          dataSet.FieldByName('CONFIRMADOHONDA').AsInteger := buscas.FieldByName('CONFIRMADOHONDA').AsInteger;
          dataSet.FieldByName('PEDIDOADICIONAL').AsInteger := buscas.FieldByName('PEDIDOADICIONAL').AsInteger;
          dataset.FieldByName('ORDTIPO').AsInteger := buscas.FieldByName('ORDTIPO').AsInteger;
          dataset.FieldByName('TP_INCLUSAO').AsString := 'U';
          dataSet.Post;
          Apply;
         end;
         buscas.next;
        end;
        CommitaTransacao;
      except
      on E: Exception do
      begin
        RollBackTransacao;
        result := false;
        if Application.MessageBox(pchar(vMensagemErro + #13 +
          'Nenhum estoque inserido manualmente no dia anterior será processado. Mostrar Erro?'), 'Confirmação', MB_YESNO +
          MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
          ShowMessage(e.Message);
      end;
      end;
     end;
   end;
 end;
 // Montar os valores de venda e venda acumulada para os veiculos
 // venda do dia
 if Result then
 begin
   try
     vDadosIni.abreStatusProcessamento('','Verificando Vendas para o dia '+DateToStr(vdataatual));
     buscas.close;
     if (vDadosIni.vEmp.vVersaoVeiculos = '4') then
       buscas.SQL.Text := ' select vv.ordtipo,vv.descricao,c.cod_cor, ' +
        ' c.descricao_cor,vv.codigo,count(ft.n_comando) as valor from com_fat ft ' +
        ' inner join est_moto est on est.codigo = ft.cod_estmoto and est.chassi_c = ft.chassiv and est.cod_empresa = ft.cod_empresa ' +
        ' inner join TIPMODELO vv on vv.codigo = est.versaoest and vv.cod_empresa = est.cod_empresa ' +
        ' inner join nat_op nt on nt.codigo_nop = ft.natop_v ' +
        ' left join codigo_corfab c on c.cod_cor = est.cod_cor ' +
        ' WHERE ft.data_ven >=  ' + QuotedStr(FormatDateTime('mm/dd/yyyy', strtodate('01/'+FloatToStr(vmes)+'/'+FloatToStr(vano)))) +
        ' and ft.data_ven <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vdataatual)) +
        ' and nt.faturamento = ''S'' and ft.cod_empresa = '+vDadosIni.codEmpresa+' and ft.ativo = 1 and tipo_venda_v = ''N'' ' +
        ' and ft.natureza = ''S'' and (coalesce(trim(upper(ft.status_v)), '''') = ''FECHADO'') ' +
        ' group by vv.descricao,c.cod_cor,descricao_cor,vv.codigo,vv.ordtipo '
     else
       buscas.sql.text := ' select vv.ordtipo,vv.descricao,c.cod_cor, '+
       ' c.descricao_cor,vv.codigo,count(vn.n_comando) as valor from com_fat ft,mot_ven vn, '+
       ' TIPMODELO vv, nat_op nt,codigo_corfab c ' +
       ' WHERE ft.data_ven >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', strtodate('01/'+FloatToStr(vmes)+'/'+FloatToStr(vano)))) +
       ' and ft.data_ven <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vdataatual)) +
       ' and ft.chassiv = vn.chassiv and ft.num_nota_v = vn.num_nota_v and ft.n_comando = vn.n_comando ' +
       ' and ft.cod_empresa = vn.cod_empresa and vn.versaov = vv.codigo ' +
       ' and vn.cod_empresa = vv.cod_empresa and ft.natop_v = nt.codigo_nop ' +
       ' and nt.faturamento <> ''N'' and vn.cod_cor = c.cod_cor '+
       ' and ft.cod_empresa = '+vDadosIni.codEmpresa+' and ft.ativo = 1 and tipo_venda_v = ''N'' '+
       ' group by vv.descricao,c.cod_cor,descricao_cor,vv.codigo,vv.ordtipo';
     buscas.open;
     while not buscas.eof do
     begin
        dataSet.close;
        dataset.CommandText :=  'select * from integra_assohonda ' +
         ' where data_arquivo = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vdataatual)) +
         ' and cod_modelo = ' + IntToStr(buscas.FieldByName('CODIGO').AsInteger) +
         ' and cod_cor = ' + IntToStr(buscas.FieldByName('cod_cor').AsInteger) +
         ' and cod_empresa = ' + vDadosIni.codEmpresa;
        dataset.open;
        if dataSet.IsEmpty then
          dataSet.Append
        else
          dataSet.Edit;
        dataset.FieldByName('DATA_ARQUIVO').AsDateTime := vdataatual;
        dataSet.FieldByName('COD_MODELO').AsInteger := buscas.FieldByName('CODIGO').AsInteger;
        dataSet.FieldByName('COD_COR').AsInteger := buscas.FieldByName('cod_cor').AsInteger;
        dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
        dataSet.FieldByName('DESC_MODELO').AsString := buscas.FieldByName('DESCRICAO').AsString;
        dataSet.FieldByName('DESC_COR').AsString := buscas.FieldByName('DESCRICAO_COR').AsString;
        buscas1.close;
        if (vDadosIni.vEmp.vVersaoVeiculos = '4') then
          buscas1.SQL.Text := ' select count(ft.n_comando) as valor from com_fat ft ' +
           ' inner join est_moto est on est.codigo = ft.cod_estmoto and est.chassi_c = ft.chassiv and est.cod_empresa = ft.cod_empresa ' +
           ' inner join nat_op nt on nt.codigo_nop = ft.natop_v ' +
           ' WHERE ft.data_ven = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vdataatual)) +
           ' and est.versaoest = ' + IntToStr(buscas.FieldByName('CODIGO').AsInteger) +
           ' and nt.faturamento = ''S'' ' +
           ' and est.cod_cor = ' + IntToStr(buscas.FieldByName('cod_cor').AsInteger) +
           ' and ft.cod_empresa = ' + vDadosIni.codEmpresa +
           ' and ft.ativo = 1 and tipo_venda_v = ''N'' ' +
           ' and ft.natureza = ''S'' and (coalesce(trim(upper(ft.status_v)), '''') = ''FECHADO'') '
        else
          buscas1.sql.text := ' select count(vn.n_comando) as valor from com_fat ft,mot_ven vn, nat_op nt ' +
           ' WHERE ft.data_ven = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vdataatual)) +
           ' and ft.chassiv = vn.chassiv and ft.num_nota_v = vn.num_nota_v and ft.n_comando = vn.n_comando ' +
           ' and ft.cod_empresa = vn.cod_empresa and vn.versaov = ' + IntToStr(buscas.FieldByName('CODIGO').AsInteger) +
           ' and ft.natop_v = nt.codigo_nop and nt.faturamento <> ''N'' '+
           ' and vn.cod_cor = ' + IntToStr(buscas.FieldByName('cod_cor').AsInteger) +
           ' and ft.cod_empresa = ' + vDadosIni.codEmpresa +
           ' and ft.ativo = 1 and tipo_venda_v = ''N''';
        buscas1.open;
        if not buscas1.IsEmpty then
         dataSet.FieldByName('VENDASDIA').AsInteger := buscas1.FieldByName('valor').AsInteger;
        dataSet.FieldByName('ORDTIPO').AsInteger := buscas.FieldByName('ORDTIPO').AsInteger;
        dataSet.FieldByName('VENDASACUMULADA').AsInteger := buscas.FieldByName('VALOR').AsInteger;
        buscas1.close;
        if vtpop = 1 then // Caso ainda não tenha a interface para fazer pedido pelo sistema...
        begin             // O usuário mudará dados na interface e o sistema sempre pega os valores do ultimo dia.
         if (dataSet.FieldByName('ESTOQUEFISICO').AsInteger = 0) and
         (dataSet.FieldByName('TRANSITO').AsInteger = 0) and (dataSet.FieldByName('CANCELAMENTO').AsInteger = 0) then
         begin
           buscas1.close;
           buscas1.sql.text := 'select * from integra_assohonda ' +
            ' where cod_modelo = ' + IntToStr(buscas.FieldByName('CODIGO').AsInteger) +
            ' and cod_cor = ' + IntToStr(buscas.FieldByName('cod_cor').AsInteger) +
            ' and cod_empresa = '+vDadosIni.codEmpresa+
            ' and data_arquivo = (select max(data_arquivo) from integra_assohonda where '+
            ' cod_modelo = ' + IntToStr(buscas.FieldByName('CODIGO').AsInteger) +
            ' and cod_cor = ' + IntToStr(buscas.FieldByName('cod_cor').AsInteger) +
            ' and cod_empresa = '+vDadosIni.codEmpresa+')';
           buscas1.open;
           if not buscas1.IsEmpty then
           begin
            dataSet.FieldByName('SALDOFATURAR').AsInteger := buscas1.FieldByName('SALDOFATURAR').AsInteger;
            dataSet.FieldByName('PEDIDOFIRME').AsInteger := buscas1.FieldByName('PEDIDOFIRME').AsInteger;
            dataSet.FieldByName('CONFIRMADOHONDA').AsInteger := buscas1.FieldByName('CONFIRMADOHONDA').AsInteger;
            dataSet.FieldByName('PEDIDOADICIONAL').AsInteger := buscas1.FieldByName('PEDIDOADICIONAL').AsInteger;
           end;
           buscas1.close;
         end;
        end;
        dataSet.post;
        Apply;
       buscas.next;
     end;
     CommitaTransacao;
   Except
    on E: Exception do
    begin
     RollBackTransacao;
     result := false;
     if Application.MessageBox(pchar(vMensagemErro + #13 +
       'Nenhuma venda será inserida no dia atual será processado. Mostrar Erro?'), 'Confirmação', MB_YESNO +
       MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
       ShowMessage(e.Message);
    end;
   end;
 end;
 vDadosIni.fechaStatusProcessamento;
end;

function TComunicaAssohonda.verificaduplicidade(vdata: Tdate; cod_modelo,
  cod_cor: integer): boolean;
begin
 buscas.close;
 buscas.sql.text := ' SELECT * from integra_Assohonda ' +
  ' where data_arquivo = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vdata)) +
  ' and cod_modelo = ' + IntToStr(cod_modelo)+
  ' and cod_cor = ' + IntToStr(cod_cor) + ' AND COD_EMPRESA = '+vDadosIni.codEmpresa;
 buscas.Open;
 if buscas.IsEmpty then
   Result:=true
 else
   Result:=false;
 buscas.Close;
end;

function TComunicaAssohonda._FormEnvAssohonda: boolean;
begin
 Result := true;

 if not vDadosIni.PesqPros('FAB002', 'ABRIR', '', '', '', buscas, False) then
   Result := False;
end;

{ TFabricaYamaha }

constructor TFabricaYamaha.create;
begin
  if dtmFabrica = nil then
    dtmFabrica := TdtmFabrica.Create(dtmFabrica);

  Rdp := TRdPrint(dtmFabrica.RdPrint1);
  buscas := TIBQuery(dtmFabrica.qrBuscas);
  buscas1 := TIBQuery(dtmFabrica.qrBuscas1);
  transacao:=TIBTransaction(dtmFabrica.transacao);

  fArquivos := TStringList.Create;
  fArquivos1 := TStringList.Create;
  fArquivos2 := TStringList.Create;
  fProdutosNProcessados := TStringList.Create;
end;

function TFabricaYamaha.ProcessarArquivo(pDirArquivo,
  pArquivo: string): boolean;
var
  F: TextFile;
  vflg: Integer;
  vOK: Boolean;
begin
  Result := True;
  vOK := True;

  buscas.Close;
  buscas.SQL.Text := ' SELECT * FROM ARQ_FABRICA ' +
   ' WHERE UPPER(TRIM(NOMEARQUIVO)) LIKE :NOMEARQUIVO AND TIPOARQUIVO = :TIPOARQUIVO AND COD_EMPRESA = :COD_EMPRESA ';
  buscas.ParamByName('NOMEARQUIVO').AsString :=
    StringReplace(UpperCase(trim(pArquivo)), ExtractFileExt(UpperCase(trim(pArquivo))), '', [rfReplaceAll, rfIgnoreCase]) + '.%';
  buscas.ParamByName('TIPOARQUIVO').AsString := 'HONDA';
  buscas.ParamByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
  buscas.Open;

  if not buscas.IsEmpty then
  begin
    Result := False;

    if Application.MessageBox(Pchar('Arquivo ' + QuotedStr(pArquivo) +' já foi processado, ' +
      'deseja processar arquivo novamente?'), 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDNO then
        exit;

    if not vDadosIni.PesqPros('FAB017', 'PROCESSAR', QuotedStr(trim(pArquivo)), '','', buscas, true) then
      Exit;

    Result := True;
  end;

  if not ProcessarArquivoPecas(pDirArquivo, pArquivo) then
  begin
    Result := False;
    exit;
  end;

  Result := True;
end;

function TFabricaYamaha.ProcessarArquivoPecas(pDirArquivo,
  pArquivo: string): boolean;
var
  vcad, vcodpps: string;
  vg, vcodint: integer;
  vcodprod, vdescprod, vvalor, vprec, vprecGarantia, vtipolista, vorigem, vncm: string;
  vcodp, vcodps: string;
  vgcodp, vgcodps: integer;
  vflg, ic, ix, i, totLinhas: integer;
  vhora: Ttime;
  obProd: TProdutos;
  vUsarRegraCFOPCSTEntrada,vUsarRegraCFOPCSTSaida: string;
  vProc: boolean;
  vListaTemp: TStringList;
begin
   Result := True;
   vProc := false;
   vflg := 0;

   totLinhas := 0;
   vg := 1;
   i := 0;
   ic := 0;
   ix := 0;

   obProd := TProdutos.create;
   obProd.CodBarra.abreCodBarras(0,'');
//   obProd.abreProdutos(0);
   vDadosIni.vDataHora := vDadosIni.getDataHoraBanco(obProd.buscas);

   obProd.Close;
   obProd.dataSet.CommandText := ' SELECT PRODUTOS.*, CAST(0 AS FLOAT) ESTOQUE, CAST(0 AS FLOAT) EST_PRIMA FROM PRODUTOS ' +
     ' where PRODUTOS.NUM_FAB_PROD = ' + QuotedStr('') +
     ' and PRODUTOS.COD_EMPRESA = ' + vDadosIni.codEmpresa +
     ' and PRODUTOS.ATIVO = 1 ';
   obProd.Open;
   obprod.dataSet.Insert;
   obProd.GeraCodProd(inttostr(vg));
   vcodint := StrToInt(obprod.dataSet.FieldByName('COD_PROD').AsString);
 //  .Memo1.Lines.clear;
 	 try
     vDadosIni.abreStatusProcessamento('Carregando arquivo(s) ' + IntToStr(vParam.ContArq) + ' de ' +
     	IntToStr(vParam.TotArq), 'Arquivo PCL');
   	 AssignFile(F, pDirArquivo);
   	 Reset(F);
//   while not System.eof(F) do
//   begin
//     Application.ProcessMessages;
//     i := i + 1;
//     Readln(F, S);
//   end;
//   totLinhas := i;
		 vListaTemp := TStringList.Create;
     vListaTemp.LoadFromFile(pDirArquivo);
     totLinhas := vListaTemp.Count;
   finally
   	 FreeAndNil(vListaTemp);
  	 vDadosIni.fechaStatusProcessamento;
   end;
   i := 0;
   CloseFile(F);
   if vflg = 1 then
   begin
    exit;
   end;

 try
   if not vDadosIni.PesqPros('FAB016', 'PROCESSAR', QuotedStr(trim(pArquivo)), '','', buscas, true) then
    Exit;

   Reset(F);
   vhora := time;

   if vParam.pPadrao then
   begin
     if trim(vParam.pNatOP) = '' then
     begin
       Application.MessageBox('Nat. Op não informada!', 'Atenção', MB_ICONERROR + MB_OK);
       Result := False;
       Exit;
     end;

     if trim(vParam.pAliqPadrao) = '' then
     begin
       Application.MessageBox('Aliq Padrão não informada!', 'Atenção', MB_ICONERROR + MB_OK);
       Result := False;
       Exit;
     end;

     if trim(vParam.pCSTPadrao) = '' then
     begin
       Application.MessageBox('CST Padrão não informada!', 'Atenção', MB_ICONERROR + MB_OK);
       Result := False;
       Exit;
     end;

     if ((trim(vParam.pCSTPadrao) <> '') and (Length(trim(vParam.pCSTPadrao)) > 2)) then
     begin
       Application.MessageBox('Favor informar somente os 2 últimos dígitos do CST Padrão!', 'Atenção', MB_ICONERROR + MB_OK);
       Result := False;
       Exit;
     end;
   end
   else if vParam.pNCM then
   begin
     if trim(vParam.pNatOPST) = '' then
     begin
       Application.MessageBox('Nat. Op (ST) não informado!', 'Atenção', MB_ICONERROR + MB_OK);
       Result := False;
       Exit;
     end;

     if trim(vParam.pAliqSt) = '' then
     begin
       Application.MessageBox('Aliq (ST) não informado!', 'Atenção', MB_ICONERROR + MB_OK);
       Result := False;
       Exit;
     end;


     if trim(vParam.pNatOpTrib) = '' then
     begin
       Application.MessageBox('Nat. Op (TRIBUTADO) não informado!', 'Atenção', MB_ICONERROR + MB_OK);
       Result := False;
       Exit;
     end;

     if trim(vParam.pAliqTrib) = '' then
     begin
       Application.MessageBox('Aliq (TRIBUTADO) não informado!', 'Atenção', MB_ICONERROR + MB_OK);
       Result := False;
       Exit;
     end;
   end;

   fProdutosNProcessados.Clear;
   ArqConfigY.WriteString('alteracaop', 'TipoProc', vDadosIni.IfThen(vParam.pNCM, 'NCM', 'PADRAO'));
   ArqConfigY.WriteString('alteracaop', 'natopp', vParam.pNatOP);
   ArqConfigY.WriteString('alteracaop', 'CstPadrao', vParam.pCSTPadrao);
   ArqConfigY.WriteString('alteracaop', 'AliqPadrao', vParam.pAliqPadrao);

   ArqConfigY.WriteString('alteracaop', 'NatOPST', vParam.pNatOPST);
   ArqConfigY.WriteString('alteracaop', 'NatOPTrib', vParam.pNatOpTrib);
   ArqConfigY.WriteString('alteracaop', 'AliqST', vParam.pAliqSt);
   ArqConfigY.WriteString('alteracaop', 'AliqTrib', vParam.pAliqTrib);

   vUsarRegraCFOPCSTEntrada := vDadosIni.vEmp.vUsarRegraCFOPCSTEntrada;
   vUsarRegraCFOPCSTSaida := vDadosIni.vEmp.vUsarRegraCFOPCSTSaida;
   vDadosIni.vEmp.vUsarRegraCFOPCSTEntrada := 'N';
   vDadosIni.vEmp.vUsarRegraCFOPCSTSaida := 'N';
   Reset(F);
   while not System.eof(F) do
   begin
    try
      i := i + 1;
      Application.ProcessMessages;
      Readln(F, S);
      vDadosIni.abreStatusProcessamento('Arquivo(s) ' + IntToStr(vParam.ContArq) + ' de '
           + IntToStr(vParam.TotArq), 'Processando '+ IntToStr(i) +' de ' + IntToStr(totLinhas));

      if (copy(s, 1, 1) <> 'H') and (copy(s, 1, 1) <> 'T') then
      begin
       vcad := copy(s, 74, 1);
       vcodpps := copy(s, 49, 2);
       vcodprod := copy(s, 1, 12);
       vdescprod := copy(s, 13, 30);
       //vtipolista := copy(s, 112, 2);
       vvalor := copy(s, 99, 10) + ',' + copy(s, 109, 2);
       vprec := copy(s, 56, 9) + ',' + copy(s, 65, 2);
       vprecGarantia := copy(s, 87, 10) + ',' + copy(s, 97, 2);
       vncm := copy(s, 112, 8);
       vorigem := copy(s, 55, 1);

       obProd.Close;
       obProd.dataSet.CommandText := ' SELECT PRODUTOS.*, CAST(0 AS FLOAT) ESTOQUE, CAST(0 AS FLOAT) EST_PRIMA FROM PRODUTOS ' +
         ' where PRODUTOS.NUM_FAB_PROD = ' + QuotedStr(vcodprod) +
         ' and PRODUTOS.COD_EMPRESA = ' + vDadosIni.codEmpresa +
         ' and PRODUTOS.ATIVO = 1 ';
       obProd.Open;
       if obProd.IsEmpty then
       begin
         buscas.Close;
         buscas.SQL.Text := ' select first 1 grupo_prod, cod_prod, cod_barra from cod_barra ' +
           ' where cod_barra = ' + QuotedStr(vcodprod) +
           ' and cod_empresa = ' + vDadosIni.codEmpresa;
         buscas.Open;

         if not buscas.IsEmpty then
         begin
            fProdutosNProcessados.Add('Grupo: ' + IntToStr(buscas.FieldByName('GRUPO_PROD').AsInteger) + ' Cod: ' + buscas.FieldByName('COD_PROD').AsString + ' Cod Barra: ' + buscas.FieldByName('COD_BARRA').AsString);
            registraErro('Código de barras repetido, Grupo: ' + IntToStr(buscas.FieldByName('GRUPO_PROD').AsInteger) + ' Cod: ' + buscas.FieldByName('COD_PROD').AsString + ' Cod Barra: ' + buscas.FieldByName('COD_BARRA').AsString);
         end
         else
         begin
            obProd.ProcessamentoFabrica := true;
            obProd.statusRegistro := 'I';
            obProd.dataSet.Insert;
            obProd.setaCamposVariaveisInsert;
            obProd.dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
            obProd.dataSet.FieldByName('GRUPO_PROD').AsInteger := vg;
            obProd.dataSet.FieldByName('COD_PROD').AsString :=
              vDadosIni.strzero(vcodint, strtoint(vDadosIni.vProduto.vDigitosProd));
            vcodint := vcodint + 1;
            obProd.dataSet.FieldByName('DESCR_PROD').AsString := Copy(trim(vdescprod), 1, 75);
            obProd.dataSet.FieldByName('DESCR_PROD_RED').AsString := Copy(trim(vdescprod), 1, 35);
            obProd.dataSet.FieldByName('PREC_CUS_PROD').AsCurrency := strtocurr(vprec);
            obProd.dataSet.FieldByName('NUM_FAB_PROD').AsString := vcodprod;
            obProd.dataSet.FieldByName('UNIDADE').AsString := 'PC';
            obProd.dataSet.FieldByName('NBM').AsString := vncm;

            if (vParam.pPadrao) then
            begin
              obProd.dataSet.FieldByName('CST_PROD').AsString := vorigem + vParam.pCSTPadrao;
              obProd.dataSet.FieldByName('ICM_PROD').AsString := vParam.pAliqPadrao;
              obProd.dataSet.FieldByName('CODIGO_NOP').AsString := vParam.pNatOP;
            end
            else
            begin
              buscas.Close;
              buscas.SQL.Text := ' select mva from nbm ' +
               ' where cod_ncm = :cod_ncm ';
              buscas.ParamByName('COD_NCM').AsString := obProd.dataSet.FieldByName('NBM').AsString;
              buscas.Open;

              if buscas.FieldByName('MVA').AsFloat > 0 then
              begin
                obProd.dataSet.FieldByName('CST_PROD').AsString := vorigem + '60';
                obProd.dataSet.FieldByName('ICM_PROD').AsString := vParam.pAliqSt;
                obProd.dataSet.FieldByName('CODIGO_NOP').AsString := vParam.pNatOPST;
              end
              else
              begin
                obProd.dataSet.FieldByName('CST_PROD').AsString := vorigem + '00';
                obProd.dataSet.FieldByName('ICM_PROD').AsString := vParam.pAliqTrib;
                obProd.dataSet.FieldByName('CODIGO_NOP').AsString := vParam.pNatOpTrib;
              end;
            end;
            obProd.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency := StrToCurr(vvalor);
            obProd.dataSet.FieldByName('PREC_PUBLICO').AsCurrency := StrToCurr(vvalor);

            //obProd.dataSet.FieldByName('TIP_PROD_IND').AsString := vtipolista;
            //obProd.dataSet.FieldByName('COD_PPS').AsString := vcodpps;
            //obProd.dataSet.FieldByName('DATA_CAD_PROD').AsDateTime := vDadosIni.getDataBanco(buscas);
            obProd.dataSet.FieldByName('COD_USUARIO_PROCESS').AsInteger := vDadosIni.vCodUsuario;
            obProd.dataSet.FieldByName('DATA_PROCESS').AsDateTime := vDadosIni.getDataBanco(buscas);
            obProd.dataSet.FieldByName('HORA_PROCESS').AsString := FormatDateTime('hh:mm:ss', vDadosIni.getDataHoraBanco(buscas));
            obProd.dataSet.FieldByName('NOMEARQ_PROCESS').AsString := Trim(pArquivo);
            obProd.setaCamposVariaveisPost;
	          obProd.postSemTestes;
            obProd.Apply;
            obProd.CodBarra.Insert;
            obProd.CodBarra.dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.COdEmpresa;
            obProd.CodBarra.dataSet.FieldByName('GRUPO_PROD').asstring := obProd.dataSet.FieldByName('GRUPO_PROD').asstring;
            obProd.CodBarra.dataSet.FieldByName('COD_PROD').asstring := obProd.dataSet.FieldByName('COD_PROD').asstring;
            obProd.CodBarra.dataSet.FieldByName('COD_BARRA').asstring := obProd.dataSet.FieldByName('NUM_FAB_PROD').asstring;
            obProd.CodBarra.post;
            obProd.CodBarra.Apply;
         end;
      end
      else
      begin
       obProd.ProcessamentoFabrica := true;
       obProd.statusRegistro := 'E';
       obProd.dataSet.Edit;
       obProd.setaCamposVariaveisEdit;
       //obProd.dataSet.FieldByName('DATA_MOD_PROD').AsDateTime := vDadosIni.getDataBanco(buscas);

       if (vParam.pPadrao) then
       begin
         obProd.dataSet.FieldByName('CST_PROD').AsString := vorigem + vParam.pCSTPadrao;
         obProd.dataSet.FieldByName('ICM_PROD').AsString := vParam.pAliqPadrao;
         obProd.dataSet.FieldByName('CODIGO_NOP').AsString := vParam.pNatOP;
       end
       else
       begin
         buscas.Close;
         buscas.SQL.Text := ' select mva from nbm ' +
          ' where cod_ncm = :cod_ncm ';
         buscas.ParamByName('COD_NCM').AsString := obProd.dataSet.FieldByName('NBM').AsString;
         buscas.Open;
         if buscas.FieldByName('MVA').AsFloat > 0 then
         begin
           obProd.dataSet.FieldByName('CST_PROD').AsString := vorigem + '60';
           obProd.dataSet.FieldByName('ICM_PROD').AsString := vParam.pAliqSt;
           obProd.dataSet.FieldByName('CODIGO_NOP').AsString := vParam.pNatOPST;
         end
         else
         begin
           obProd.dataSet.FieldByName('CST_PROD').AsString := vorigem + '00';
           obProd.dataSet.FieldByName('ICM_PROD').AsString := vParam.pAliqTrib;
           obProd.dataSet.FieldByName('CODIGO_NOP').AsString := vParam.pNatOpTrib;
         end;
       end;
       obProd.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency := StrToCurr(vvalor);
       obProd.dataSet.FieldByName('PREC_PUBLICO').AsCurrency := StrToCurr(vvalor);
       //obProd.dataSet.FieldByName('TIP_PROD_IND').AsString := vtipolista;
       //obProd.dataSet.FieldByName('COD_PPS').AsString := vcodpps;
       obProd.dataSet.FieldByName('COD_USUARIO_PROCESS').AsInteger := vDadosIni.vCodUsuario;
       obProd.dataSet.FieldByName('DATA_PROCESS').AsDateTime := vDadosIni.getDataBanco(buscas);
       obProd.dataSet.FieldByName('HORA_PROCESS').AsString := FormatDateTime('hh:mm:ss', vDadosIni.getDataHoraBanco(buscas));
       obProd.dataSet.FieldByName('NOMEARQ_PROCESS').AsString := Trim(pArquivo);
       obProd.setaCamposVariaveisPost;
       obProd.postSemTestes;
       obProd.Apply;
      end;
      end;
      ix := ix + 1;
      ic := ic + 1;
      if ic = 2000 then
      begin
       ic := 0;
       obProd.CommitaTransacao;
      end;
    except
      on E: Exception do
      begin
       registraErro('Erro ao processar arquivo. Erro: ' + e.Message + #13 +
        'Arquivo: ' + IntToStr(vParam.ContArq) + ' de ' + IntToStr(vParam.TotArq)+ #13 +
        'Processando '+ IntToStr(i) +' de ' + IntToStr(totLinhas)+
        'NomeArquivo: ' + QuotedStr(trim(pArquivo)));
        Result := False;
       Application.MessageBox(pchar('Erro ao processar arquivo. Erro: ' + e.Message + #13 +
        'Arquivo: ' + IntToStr(vParam.ContArq) + ' de ' + IntToStr(vParam.TotArq)+ #13 +
        'Processando '+ IntToStr(i) +' de ' + IntToStr(totLinhas) + #13 +
        'NomeArquivo: ' + QuotedStr(trim(pArquivo))), 'Atenção', MB_OK + MB_OK);
        CloseFile(F);
        obProd.RollBackTransacao;
      end;
    end;
   end;
   CloseFile(F);
   obProd.CommitaTransacao;
   vDadosIni.vEmp.vUsarRegraCFOPCSTEntrada:=vUsarRegraCFOPCSTEntrada;
   vDadosIni.vEmp.vUsarRegraCFOPCSTSaida:=vUsarRegraCFOPCSTSaida;
   vProc := true;
   obProd.Close;
   obProd.Free;
 finally
   vDadosIni.fechaStatusProcessamento;
   obProd.buscas.Close;
   obProd.buscas.SQL.Text := ' UPDATE OR INSERT INTO ARQ_FABRICA ' +
     ' (NOMEARQUIVO, TIPOARQUIVO, COD_EMPRESA, TP_LISTAPRECOS, ATIVO) ' +
     ' VALUES ' +
     ' (:NOMEARQUIVO, :TIPOARQUIVO, :COD_EMPRESA, :TP_LISTAPRECOS, :ATIVO) ' +
     ' MATCHING (NOMEARQUIVO, TIPOARQUIVO, COD_EMPRESA); ';
   obProd.buscas.ParamByName('NOMEARQUIVO').AsString := trim(pArquivo);
   obProd.buscas.ParamByName('TIPOARQUIVO').AsString := 'HONDA';
   obProd.buscas.ParamByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
   obProd.buscas.ParamByName('ATIVO').AsInteger := 1;

   if vProc then
   begin
     vDadosIni.GravaAuditoria('FAB016', 'PROCESSAR', 'SUCESSO ARQUIVO ' + QuotedStr(trim(pArquivo)), '', '', buscas);
     obProd.buscas.ParamByName('TP_LISTAPRECOS').AsString := 'S';
   end
   else
   begin
     vDadosIni.GravaAuditoria('FAB016', 'PROCESSAR', 'FALHA ARQUIVO ' + QuotedStr(trim(pArquivo)), '', '', buscas);
     obProd.buscas.ParamByName('TP_LISTAPRECOS').AsString := 'N';
   end;
   obProd.buscas.ExecSQL;
   obProd.CommitaTransacao;
 end;
end;

procedure TFabricaYamaha._localizarArquivos(pPath: string; pLista: TStringList);
var
  vEncontrou: Integer;
  vRec: TSearchRec;
begin
  pPath := IncludeTrailingPathDelimiter(pPath);
  vEncontrou := FindFirst(pPath + '*.*', 0, vRec);
  try
    pLista.Clear;
    while vEncontrou = 0 do
    begin
      pLista.Add(pPath + vRec.Name);
      vEncontrou := FindNext(vRec);
    end;
  finally
    SysUtils.FindClose(vRec);
  end;
end;

end.
