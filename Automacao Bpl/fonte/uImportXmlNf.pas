unit uImportXmlNf;

interface

uses
  uDtmAtivo, Db, Windows, Forms, Controls, DBClient, IBQuery,
  DBCtrls, StdCtrls, Classes, uClassesNotasFiscais, udtmNF, uDataSet_OOP, produtos_tmp_class;//, ACBrBase, ACBrDFe, ACBrNFe;

type
  Tprodutos_vincularProdutoCadXML				 = function(chavenfe: string): boolean;

  TXmlImport = class
  private
    //vnfe: TACBrNFe;
    vNota: TNFCab;
  	vflgcfop: integer;
    FCodNF: integer;
    procedure SetCodNF(const Value: integer);
  public

    constructor create;
    function montarNf(vNf: TNFCab; VArquivoXml: string): boolean;
    function montarNfNovo(vNf: TNFCab; VArquivoXml: string): boolean;
    function montarNfNovoSaida(vNf: TNFCab; VArquivoXml: string; vMemo: TMemo): boolean;
    function montarPreNota(vArquivoXml: string; pCodNF, pCodEmpresaGravar: Integer; pCommit: Boolean = True): boolean;
    function _mdiAberto(pNomeFormMDI: string; pMensagem: string = ''): Boolean;
    function retornaChaveNfe(ArquivoXML: string): string;

    property CodNF: integer read FCodNF write SetCodNF;
  end;

implementation

uses
  Dialogs, SysUtils, uDadosIni, Variants, funcoes, DateUtils, StrUtils, math,
  clientes_end_doc_add_class, vw_clientes_dest_class, Contnrs,
  uClassesNotasFiscais_consts, opfiscal_model, hw_utils, ActiveX,
  uClassesNotasFiscais_itens_cadastros, config_sistema_class, UnidadeVenda_Model,
  hw_undconv_utils, ProdutosConversao_Model, hw_win_utils,  TipoComunsUnit,
  ContainerUnit, TributosDFePersistentHandler, TributosDFeInMemoryHandler,
  TributoDFeOrigemEnumUnit, TributoDFeContextEtdUnit, TipoRegraTributoDFeEnumUnit,
  StringNullableUnit;

//function hw_LerXMLNFe(AListParams: WideString): WideString; stdcall; external 'hw.nfe.dx.dll';
function hw_LerXMLNFe( AInput: PAnsiChar; out AOutput: PAnsiChar): Integer; stdcall; external 'hw.nfe.dx.dll'

{ TXmlImport }

function Abstracao_hw_LerXMLNFe(AListParams: string): string;
var
  Input, Output: PAnsiChar;
  Ret: Integer;
begin
  Input := PAnsiChar(AnsiString(AListParams));
  Ret := hw_LerXMLNFe(Input, Output);
  if Ret = 0 then
  begin
    Result := Output;
    // Usa string(Output)
    CoTaskMemFree(Output); // Libera com a mesma API
  end;
//  Result := Output;
end;

constructor TXmlImport.create;
begin
//  vnfe := TACBrNFe.Create(Application);
end;

function TXmlImport.montarNf(vNf: TNFCab; VArquivoXml: string): boolean;
var
  n, x, vnota, vCodBairro, vCodTransportador,
    vCodClienteFornecedor, vCodUf, vcodcidade: Integer;
  BaseIPI: real;
  vdtbanco: Tdate;
  vOK, vOKTransp: Boolean;
  vStringCondicao: string;
  buscas2: TIBQuery;
  vnf_e_hab_conversao_embalagem_produto: Boolean;
  ListCFOPConv: TStringList;
begin        {
  vnfe := TACBrNFe.Create(Application);
  ListCFOPConv := TStringList.Create;
  ListCFOPConv.Clear;
  ListCFOPConv.Sorted := True;
  ListCFOPConv.Duplicates := dupIgnore;
  TRY
  n := 0;
  if VArquivoXml = '' then
  begin
    Result := false;
    exit;
  end;
  vflgcfop := 0;
  vnfe.NotasFiscais.Clear;
  vnfe.NotasFiscais.LoadFromFile(VArquivoXml);
  with vnfe.NotasFiscais.Items[n].NFe do
  begin
    if det.Items[n].Prod.veicProd.chassi <> '' then
    begin
      if not vdadosini.vSistemasUsuario.vSisVeiculos then
      begin
        Application.MessageBox('Usuário não pode importar Notas fiscais de veículos. ' + #13 +
          'Favor configurar a senha do mesmo', 'Atenção', mb_ok +
          MB_ICONINFORMATION);
        result := false;
        vnf.buscas.close;
        exit;
      end;
    end
    else
    begin
      if not vdadosini.vSistemasUsuario.vSisAutomacao then
      begin
        Application.MessageBox('Usuário não pode importar Notas fiscais de Produtos. ' + #13 +
          'Favor configurar a senha do mesmo', 'Atenção', mb_ok +
          MB_ICONINFORMATION);
        result := false;
        vnf.buscas.close;
        exit;
      end;
    end;
    BaseIPI := 0;
    vdtbanco := vDadosIni.getDataBanco(vNf.buscas);
    vnf.buscas.close;
    vnf.buscas.sql.Clear;
    vnf.buscas.sql.Add('select * from bairros where NOME_BAIRRO like ' + QuotedStr(trim('%' +
      UpperCase(Emit.EnderEmit.xBairro) + '%')));
    vnf.buscas.open;

    if vnf.buscas.IsEmpty then
    begin
      vnf.buscas.close;
      vnf.buscas.sql.Clear;
      vnf.buscas.sql.Add('insert into bairros (nome_bairro, cod_usuario, cod_usuario_alt) values ' +
        '(:nome_bairro, :cod_usuario, :cod_usuario_alt)');

      vnf.buscas.ParamByName('nome_bairro').AsString := copy(uppercase(Emit.EnderEmit.xBairro),1,30);
      //          vnf.buscas.ParamByName('cod_bairro').AsInteger:=0;
      vnf.buscas.ParamByName('cod_usuario').AsInteger := vDadosIni.vCodUsuario;
      vnf.buscas.ParamByName('cod_usuario_alt').AsInteger := vDadosIni.vCodUsuario;

      vnf.buscas.ExecSQL;
      vnf.buscas.Transaction.CommitRetaining;

      vnf.buscas.close;
      vnf.buscas.sql.Clear;
      vnf.buscas.sql.Add('select * from bairros where NOME_BAIRRO like ' + QuotedStr(trim('%' +
        uppercase(Emit.EnderEmit.xBairro) + '%')));
      vnf.buscas.open;

      vCodBairro := vnf.buscas.Fields[0].AsInteger;

    end else
    begin
      vCodBairro := vnf.buscas.Fields[0].AsInteger;
    end;

    vnf.buscas.close;
    vnf.buscas.sql.Clear;
    vnf.buscas.sql.Add('select * from cidades where NOME_CIDADE like ' + QuotedStr(trim('%' +
      UpperCase(Emit.EnderEmit.xMun) + '%')));
    vnf.buscas.open;

    if vnf.buscas.IsEmpty then
    begin
      vnf.buscas.close;
      vnf.buscas.sql.Clear;
      vnf.buscas.sql.Add('insert into cidades(nome_cidade, cod_usuario,cod_usuario_alt,ibge_cod_cidade) values ' +
        '(:nome_cidade, :cod_usuario, :cod_usuario_alt,:ibge_cod_cidade)');

      vnf.buscas.ParamByName('nome_cidade').AsString := copy(uppercase(Emit.EnderEmit.xMun),1,30);
      //          vnf.buscas.ParamByName('cod_cidade').AsInteger := 0;
      vnf.buscas.ParamByName('cod_usuario').AsInteger := vDadosIni.vCodUsuario;
      vnf.buscas.ParamByName('cod_usuario_alt').AsInteger := vDadosIni.vCodUsuario;
      vnf.buscas.ParamByName('ibge_cod_cidade').AsInteger := Emit.EnderEmit.cMun;

      vnf.buscas.ExecSQL;
      vnf.buscas.Transaction.CommitRetaining;

      vnf.buscas.close;
      vnf.buscas.sql.Clear;
      vnf.buscas.sql.Add('select * from cidades where NOME_CIDADE like ' + QuotedStr(trim('%' +
        uppercase(Emit.EnderEmit.xMun) + '%')));
      vnf.buscas.open;

      vcodcidade := vnf.buscas.Fields[0].AsInteger;

    end else
    begin
      vcodcidade := vnf.buscas.Fields[0].AsInteger;
    end;
    if (trim(vnfe.NotasFiscais.items[0].NFe.Dest.CNPJCPF) <> '') and
      (trim(vnfe.NotasFiscais.items[0].NFe.Emit.CNPJCPF) <> vDadosIni.vEmp.vCNPJ) then
    begin
        if trim(vnfe.NotasFiscais.items[0].NFe.Dest.CNPJCPF) <>
        trim(vDadosIni.vEmp.vCNPJ) then
        begin
          MessageDlg('CNPJ do Destinatario difere do CNPJ da Empresa'+#13
          +'CNPJ Destinatario: '+vnfe.NotasFiscais.items[0].NFe.Dest.CNPJCPF
          +#13+ 'CNPJ Empresa: '+vDadosIni.vEmp.vCNPJ ,mtInformation,[mbok],1);
          result:= false;
          exit;
        end;
    end;
    vnf.buscas.close;
    vnf.buscas.sql.Clear;
    vnf.buscas.sql.Add('select * from estados where IBGE_CODIGO_UF = ' +
      copy(inttostr(emit.EnderEmit.cMun), 1, 2));
    vnf.buscas.open;
    // Testar aqui se não existir o não cadastramento...

    vCodUf := vnf.buscas.Fields[0].AsInteger;

    vnf.buscas.close;
    vnf.buscas.sql.Clear;
    vnf.buscas.sql.Add('select * from clientes where CPFCGC = ' + QuotedStr(trim(Emit.CNPJCPF)) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa);
    vnf.buscas.open;

    if vnf.buscas.IsEmpty then
    begin
      if Application.MessageBox('O forncedor/emitente não cadastrado.' + #13 +
        'Deseja cadastradar?',
        'Cadastrar Fornecedor/Emitente.', MB_YESNO + MB_ICONQUESTION) = idYes then
      begin
        vnf.buscas.close;
        vnf.buscas.sql.Clear;
        vnf.buscas.sql.Add('insert into clientes (COD_CLIENTE, COD_EMPRESA, CODIGO_TIPO, EST_CODIGO_UF, CODIGO_UF, CPFCGC, NOME_CLIENTE, RAZAO, INSC_EST, ENDERECO, END_COBRANCA,' +
          ' NUM_END_CLIENTE, COD_BAIRRO, COD_BAIRRO_COBRANCA, BAIRRO, BAIRRO_COBRANCA, CEP, CEP_COBRANCA, COD_CIDADE, COD_CIDADE_COBRANCA, CIDADE, CIDA_COBRANCA, FONE_CLIENTE, TIPO, INSC_SUB_F,TIPVCLIENTE,DATA_CADASTRO)' +
          ' values (:COD_CLIENTE, :COD_EMPRESA, :CODIGO_TIPO, :EST_CODIGO_UF, :CODIGO_UF, :CPFCGC, :NOME_CLIENTE, :RAZAO, :INSC_EST, :ENDERECO, :END_COBRANCA,' +
          ' :NUM_END_CLIENTE, :COD_BAIRRO, :COD_BAIRRO_COBRANCA, :BAIRRO, :BAIRRO_COBRANCA, :CEP, :CEP_COBRANCA, :COD_CIDADE, :COD_CIDADE_COBRANCA, :CIDADE, :CIDA_COBRANCA, :FONE_CLIENTE, :TIPO, :INSC_SUB_F,:TIPVCLIENTE,:DATA_CADASTRO)');

        vnf.buscas.ParamByName('COD_CLIENTE').AsInteger := vnf.Gencodigo('clientes',
          dtmNF.SpIncCodNF, vDadosIni.codEmpresa);
        vCodClienteFornecedor := vnf.buscas.ParamByName('COD_CLIENTE').AsInteger;
        vnf.buscas.ParamByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
        vnf.buscas.ParamByName('CODIGO_TIPO').AsInteger := 2;
        vnf.buscas.ParamByName('EST_CODIGO_UF').AsInteger := vCodUf;
        vnf.buscas.ParamByName('CODIGO_UF').AsInteger := vCodUf;
        vnf.buscas.ParamByName('CPFCGC').AsString := Emit.CNPJCPF;
        vnf.buscas.ParamByName('NOME_CLIENTE').AsString := copy(uppercase(Emit.xNome),1,35);
        vnf.buscas.ParamByName('RAZAO').AsString := copy(UpperCase(Emit.xNome),1,60);
        vnf.buscas.ParamByName('INSC_EST').AsString := Emit.IE;
        vnf.buscas.ParamByName('ENDERECO').AsString := copy(UpperCase(Emit.EnderEmit.xLgr), 1, 50);
        vnf.buscas.ParamByName('END_COBRANCA').AsString := copy(UpperCase(Emit.EnderEmit.xLgr + ', '
          + Emit.EnderEmit.nro), 1, 50);
        vnf.buscas.ParamByName('NUM_END_CLIENTE').AsString := Emit.EnderEmit.nro;
          //mudar  tipo de inteiro para vachar.
        vnf.buscas.ParamByName('Cod_BAIRRO').AsInteger := vCodBairro;
        vnf.buscas.ParamByName('COD_BAIRRO_COBRANCA').AsInteger := vCodBairro;
        vnf.buscas.ParamByName('BAIRRO').AsString := copy(UpperCase(Emit.EnderEmit.xBairro),1,35);
        vnf.buscas.ParamByName('BAIRRO_COBRANCA').AsString := copy(UpperCase(Emit.EnderEmit.xBairro),1,35);
        vnf.buscas.ParamByName('CEP').AsInteger := Emit.EnderEmit.Cep;
        vnf.buscas.ParamByName('CEP_COBRANCA').AsInteger := Emit.EnderEmit.Cep;
        vnf.buscas.ParamByName('COD_CIDADE').AsInteger := vcodcidade;
        vnf.buscas.ParamByName('COD_CIDADE_COBRANCA').AsInteger := vcodcidade;
        vnf.buscas.ParamByName('CIDADE').AsString := copy(uppercase(Emit.EnderEmit.xMun),1,30);
        vnf.buscas.ParamByName('CIDA_COBRANCA').AsString := copy(Uppercase(Emit.EnderEmit.xMun),1,30);
        vnf.buscas.ParamByName('FONE_CLIENTE').AsString := StringReplace(Emit.EnderEmit.fone,'(','',[rfReplaceAll]);
        vnf.buscas.ParamByName('FONE_CLIENTE').AsString := StringReplace(vnf.buscas.ParamByName('FONE_CLIENTE').AsString,')','',[rfReplaceAll]);
        vnf.buscas.ParamByName('FONE_CLIENTE').AsString := StringReplace(vnf.buscas.ParamByName('FONE_CLIENTE').AsString,'-','',[rfReplaceAll]);
        vnf.buscas.ParamByName('FONE_CLIENTE').AsString := StringReplace(vnf.buscas.ParamByName('FONE_CLIENTE').AsString,' ','',[rfReplaceAll]);
        vnf.buscas.ParamByName('FONE_CLIENTE').AsString := copy(vnf.buscas.ParamByName('FONE_CLIENTE').AsString, 1, 13);
        vnf.buscas.ParamByName('TIPO').AsString := 'A';
        vnf.buscas.ParamByName('INSC_SUB_F').AsString := Emit.IEST;
        vnf.buscas.ParamByName('TIPVCLIENTE').AsString := 'V';
        vnf.buscas.ParamByName('DATA_CADASTRO').asdate := vdtbanco;
        vnf.buscas.ExecSQL;
        vNf.buscas.Transaction.CommitRetaining;
      end
      else
      begin
        result := false;
        vnf.buscas.close;
        exit;
      end;
    end
    else
    begin
      vCodClienteFornecedor := vnf.buscas.FieldByName('COD_CLIENTE').AsInteger;
      if (vnf.buscas.FieldByName('TIPO').AsString <> 'F') and
        (vnf.buscas.FieldByName('TIPO').AsString <> 'A') then
      begin
        vnf.buscas.close;
        vnf.buscas.sql.Text := 'update clientes set tipo = ''A'' where cod_cliente = ' +
          IntToStr(vCodClienteFornecedor) + ' and cod_empresa = ' + vDadosIni.codEmpresa;
        vnf.buscas.Prepare;
        vnf.buscas.ExecSQL;
      end;
    end;
    vCodTransportador := -1;
    vOKTransp := (Trim(Transp.Transporta.CNPJCPF) <> '');
    if vOKTransp then
      if Length(Trim(Transp.Transporta.CNPJCPF)) = 14 then
        vOKTransp := vNf.cgc(Trim(Transp.Transporta.CNPJCPF))
      else if Length(Trim(Transp.Transporta.CNPJCPF)) = 11 then
        vOKTransp := vNf.Cpf(Trim(Transp.Transporta.CNPJCPF))
      else
        vOKTransp := False;
    if vOKTransp then
    begin

      vnf.buscas.close;
      vnf.buscas.sql.Clear;
      vnf.buscas.sql.Add('select * from transportador ' +
      	' where CNPJ_TR = ' + QuotedStr(Transp.Transporta.CNPJCPF) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa +
        ' and ativo <> 99 ');
      vnf.buscas.open;

      if vnf.buscas.IsEmpty then
      begin
        if Application.MessageBox('O transportador não esta cadastrado.' + #13 +
          'Deseja cadastradar?',
          'Cadastrar Transportador', MB_YESNO + MB_ICONQUESTION) = idYes then
        begin
          vnf.buscas.close;
          vnf.buscas.sql.Clear;
          vnf.buscas.sql.Add('select * from estados where SIGLA_UF = ''' + Transp.Transporta.UF +
            '''');
          vnf.buscas.open;
          vcoduf := vnf.buscas.fieldbyname('CODIGO_UF').asinteger;
          vnf.buscas.close;
          vnf.buscas.sql.Clear;
          vnf.buscas.sql.Add('insert into transportador(CODIGO_TR, COD_EMPRESA, NOME_TR, CNPJ_TR, END_TR, MUNICIPIO_TR, UF_TR, IE_TR) values ' +
            '(:CODIGO_TR,:COD_EMPRESA,:NOME_TR,:CNPJ_TR, :END_TR, :MUNICIPIO_TR, :UF_TR, :IE_TR)');
          vnf.buscas.ParamByName('CODIGO_TR').AsInteger := vnf.Gencodigo('TRANSPORTADOR',
            dtmNF.SpIncCodNF, vDadosIni.codEmpresa);
          vCodTransportador := vnf.buscas.ParamByName('CODIGO_TR').AsInteger;
          vnf.buscas.ParamByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
          vnf.buscas.ParamByName('NOME_TR').AsString := copy(upperCase(Transp.Transporta.xNome),1,60);
          vnf.buscas.ParamByName('CNPJ_TR').AsString := Transp.Transporta.CNPJCPF;
          vnf.buscas.ParamByName('END_TR').AsString := copy(UpperCase(Transp.Transporta.xEnder), 1,
            40);
          vnf.buscas.ParamByName('MUNICIPIO_TR').AsString := copy(UpperCase(Transp.Transporta.xMun), 1, 25);
          vnf.buscas.ParamByName('UF_TR').AsInteger := vCodUf;
          vnf.buscas.ParamByName('IE_TR').AsString := Transp.Transporta.IE;
          vnf.buscas.ExecSQL;
          vnf.buscas.Transaction.CommitRetaining;
        end
        else
        begin
          vnf.buscas.close;
          Result := false;
          Exit;
        end;
      end
      else
        vCodTransportador := vnf.buscas.fieldbyname('CODIGO_TR').AsInteger;
    end;

    //vNf.vItem.vProd;
    if det.Items[n].Prod.veicProd.chassi <> '' then
      vNf.incluirNf(1, 'V', 'E')
    else
      vNf.incluirNf(0, 'P', 'E');

    vnf_e_hab_conversao_embalagem_produto := vDadosIni.getConfSisBool('nf_e_hab_conversao_embalagem_produto', vNf.buscas);

    for n := 0 to vnfe.NotasFiscais.Count - 1 do
    begin

      vNf.dataSet.FieldByName('cod_empresa').AsString := vdadosini.codEmpresa;
      vNf.dataSet.FieldByName('PATH_XML_IMPORT').AsString := Trim(VArquivoXml);

      if det.Items[n].Prod.veicProd.chassi <> '' then
        vNf.dataSet.FieldByName('tipo_nf').AsString := 'V'
      else
        vNf.dataSet.FieldByName('tipo_nf').AsString := 'P';

      vNf.dataSet.FieldByName('num_nf').AsInteger := Ide.nNF;
      vNf.dataSet.FieldByName('serie').AsInteger := Ide.serie;

      vnf.buscas.close;
      vnf.buscas.sql.Clear;
      vnf.buscas.sql.Add('select * from nat_op where codigo_nop = ' + Det.Items[0].Prod.CFOP);
      vnf.buscas.open;
      if not vnf.buscas.IsEmpty then
      begin
        vNf.dataSet.FieldByName('codigo_nop').AsString :=
          vnf.buscas.FieldByName('CFOP_CONV').AsString;
        if vnf.buscas.FieldByName('CFOP_CONV').AsString = '' then
        begin
          vflgcfop := 1;
          ListCFOPConv.Add(Det.Items[0].Prod.CFOP);
        end;
      end
      else
        vNf.dataSet.FieldByName('codigo_nop').AsString := Det.Items[0].Prod.CFOP;

      vNf.dataSet.FieldByName('desc_natop').AsString := uppercase(Ide.natOp);

      if vCodTransportador > 0 then
        vNf.dataSet.FieldByName('codigo_tr').AsInteger := vCodTransportador;

      vNf.dataSet.FieldByName('cod_cliente').AsInteger := vCodClienteFornecedor;
      vNf.vClFor.selecionaClFor(vNf.dataSet.FieldByName('cod_cliente').AsInteger);
      vNf.dataSet.FieldByName('cod_cond_pag').AsInteger := 0;
      vNf.dataSet.FieldByName('cod_vendedor').AsInteger := vDadosIni.vCodUsuario;
      vNf.dataSet.FieldByName('data_contabil').AsDateTime := DateOf(Ide.dEmi); // data da emissao
      vNf.dataSet.FieldByName('hora_emissao').AsString := FormatDateTime('HH:MM:SS', TimeOf(Ide.dEmi)); // data da emissao
      vNf.dataSet.FieldByName('valor_total').Asfloat := Total.ICMSTot.vNF;
      vNf.dataSet.FieldByName('valor_prod').Asfloat := Total.ICMSTot.vProd;
      vNf.dataSet.FieldByName('valor_serv').AsFloat := Total.ISSQNtot.vServ;
      if (vdadosini.vEmp.vDesconsiderarICMSNfEnt = 'S') and
        (vNf.dataSet.FieldByName('tipo_nf').AsString <> 'V') then
      else
      begin
        if Total.ICMSTot.vBC > 0 then
          vNf.dataSet.FieldByName('aliq_icm').Asfloat := (Total.ICMSTot.vICMS / Total.ICMSTot.vBC) *
            100;
        vNf.dataSet.FieldByName('base_icm').AsFloat := Total.ICMSTot.vBC;
        vNf.dataSet.FieldByName('valor_icm').AsFloat := Total.ICMSTot.vICMS;
      end;

      vNf.dataSet.FieldByName('valor_desc').AsFloat := Total.ICMSTot.vDesc;
      vNf.dataSet.FieldByName('base_icmsub').AsFloat := Total.ICMSTot.vBCST;
      vNf.dataSet.FieldByName('valor_icmsub').AsFloat := Total.ICMSTot.vST;

      vNf.dataSet.FieldByName('valor_ipi').Asfloat := Total.ICMSTot.vIPI;
      vNf.dataSet.FieldByName('valor_frete').Asfloat := Total.ICMSTot.vFrete;
      vNf.dataSet.FieldByName('valor_seguro').AsFloat := Total.ICMSTot.vSeg;
      vNf.dataSet.FieldByName('valor_out_desp').AsFloat := Total.ICMSTot.vOutro;

      vNf.dataSet.FieldByName('obs').AsString := InfAdic.infCpl;

      if Trim(modFreteToStr(Transp.modFrete)) = '0' then //emitente
        vNf.dataSet.FieldByName('freteconta_tr').AsString := '1'
      else if Trim(modFreteToStr(Transp.modFrete)) = '1' then //destinatario / remetente
        vNf.dataSet.FieldByName('freteconta_tr').AsString := '2'
      else if Trim(modFreteToStr(Transp.modFrete)) = '2' then //terceiros
        vNf.dataSet.FieldByName('freteconta_tr').AsString := '0'
      else if Trim(modFreteToStr(Transp.modFrete)) = '9' then //sem frete
        vNf.dataSet.FieldByName('freteconta_tr').AsString := '9';

      vNf.dataSet.FieldByName('placa_tr').AsString := Transp.veicTransp.placa;
      vNf.dataSet.FieldByName('uf_placa_tr').AsString := Transp.veicTransp.UF;
      try
       vNf.dataSet.FieldByName('qtde_volumes_tr').AsInteger := Transp.Vol.Items[n].qVol;
       vNf.dataSet.FieldByName('especie_tr').AsString := Transp.Vol.Items[n].esp;
       vNf.dataSet.FieldByName('marca_tr').AsString := Transp.Vol.Items[n].marca;
       vNf.dataSet.FieldByName('numero_tr').AsString := Transp.Vol.Items[n].nVol;
       vNf.dataSet.FieldByName('peso_b').Asfloat := Transp.Vol.Items[n].pesoB;
       vNf.dataSet.FieldByName('peso_l').Asfloat := Transp.Vol.Items[n].pesoL;
      except

      end;
      //       vNf.dataSet.FieldByName('crt').Value:=  Emit.CRT;
      vNf.dataSet.FieldByName('chave_nfe').AsString := StringReplace(infNFe.ID,'NFE','',[rfReplaceAll,rfIgnoreCase]);
      vNf.dataSet.FieldByName('modelo_nf').Asinteger := 55;
      vNf.dataSet.FieldByName('cod_usuario').AsInteger := vDadosIni.vCodUsuario;
      vNf.dataSet.FieldByName('inscricao_substituto').AsString := Emit.IEST;
      vNf.dataSet.FieldByName('obs').AsString := InfAdic.infCpl + #13  + InfAdic.infAdFisco;

      vNf.vFaturasXML.Clear;
      vStringCondicao := '';
      for x := 0 to Cobr.Dup.Count - 1 do
      begin
        vOK := True;
        if Cobr.Dup.Items[x].dVenc <= 0 then
          vOK := False
        else if Cobr.Dup.Items[x].vDup <= 0 then
          vOK := False;

        if vOK then
        begin
          vNf.vFaturasXML.Add(
            Cobr.Dup.Items[x].nDup + '|' +
            DateToStr(Cobr.Dup.Items[x].dVenc) + '|' +
            FloatToStr(Cobr.Dup.Items[x].vDup) + '|'
            );
          vStringCondicao := vStringCondicao + IntToStr(Trunc(Cobr.Dup.Items[x].dVenc - Ide.dEmi)) + '/';
        end;
      end;
      if vNf.vFaturasXML.Count > 0 then
      begin
        vNf.dataSet.FieldByName('DUP_XML_ENTRADA').AsString := vNf.vFaturasXML.Text;
        if Length(vStringCondicao) > 0 then
          vStringCondicao := Copy(vStringCondicao,1,Length(vStringCondicao)-1);
        vnf.buscas.close;
        vnf.buscas.sql.Text := 'select COD_COND_PAG from COND_PAG' +
          ' where coalesce(NATUREZA_CP,'''') <> ''V''' +
          ' and DESC_COND_PAG like ' + QuotedStr(vStringCondicao + '%') ;
        vnf.buscas.open;
        if vnf.buscas.FieldByName('COD_COND_PAG').AsInteger > 0 then
          vNf.dataSet.FieldByName('cod_cond_pag').AsInteger :=
            vnf.buscas.FieldByName('COD_COND_PAG').AsInteger
        else
        begin
          vnf.buscas.close;
          vnf.buscas.sql.Text := 'select COD_COND_PAG from COND_PAG' +
            ' where coalesce(NATUREZA_CP,'''') <> ''V''' +
            ' and RTRIM(UPPER(DESC_COND_PAG)) = ' + QuotedStr(IntToStr(vNf.vFaturasXML.Count) + 'X') ;
          vnf.buscas.open;
          if vnf.buscas.FieldByName('COD_COND_PAG').AsInteger > 0 then
            vNf.dataSet.FieldByName('cod_cond_pag').AsInteger :=
              vnf.buscas.FieldByName('COD_COND_PAG').AsInteger
        end;
      end;

      //itens
      for x := 0 to Det.count - 1 do
      begin
//        if vNf.dataSet.FieldByName('tipo_nf').AsString = 'V' then
//        begin
//          vNf.vItem.dataSet.Edit;
//          vNf.vItem.vDetVeic.dataSet.Edit;
//        end
//        else
          vNf.vItem.dataSet.Insert;
        vNf.vitem.dataSet.FieldByName('COD_NF').AsInteger := 0;
        vNf.vItem.dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
        vNf.vItem.dataSet.FieldByName('NITEM').AsInteger := Det.Items[x].Prod.nItem;
        vNf.vItem.dataSet.FieldByName('descricao_item').AsString :=
          uppercase(Det.Items[x].Prod.xProd);
        vNf.vItem.dataSet.FieldByName('import_xml').AsString := 'S';
//        if Det.Items[x].Prod.NCM <> '99' then
         vNf.vItem.dataSet.FieldByName('tipo_item').AsString :=
           vNf.dataSet.FieldByName('tipo_nf').AsString;
//        else
//         vNf.vItem.dataSet.FieldByName('tipo_item').AsString :='S';

        buscas2 := TIBQuery.Create(Application);
        buscas2.Database := dtmNF.qrBuscas.Database;
        buscas2.Transaction := dtmNF.qrBuscas.Transaction;

        vNf.vItem.vProd.vQtdeConversao := 0;

        if vNf.dataSet.FieldByName('tipo_nf').AsString = 'V' then
          vNf.vItem.dataSet.FieldByName('CHASSI').AsString := Det.Items[x].Prod.veicProd.chassi
        else
        begin
          if (vNf.vItem.vProd.buscaProdutoParaConversao(Det.Items[x].Prod.cEAN, Det.Items[x].Prod.nItem)) and (vNf.vItem.vProd.vQtdeConversao > 0) then
          begin
            vDadosIni.vInibeMensPesqPros := 'S';
            if ((vDadosIni.PesqPros('NF0172', 'ALTERAR', 'ALTERAR DESCRICAO PROD ENTRADA NF', 'NOTAFISCAL', vNf.vItem.dataSet.FieldByName('COD_NF').AsString, buscas2, True))
              or (vDadosIni.vEmp.vUsarConferenciaCegaSaida = 'S1')) then
              vNf.vItem.dataSet.FieldByName('descricao_item').AsString :=
                uppercase(trim(vnf.vItem.vProd.dataSet.FieldByName('descr_prod').AsString));
            vNf.vItem.dataSet.FieldByName('num_fab_prod').AsString :=
              vNf.vItem.vProd.dataSet.FieldByName('num_fab_prod').AsString;
            vNf.vItem.dataSet.FieldByName('cod_prod').AsString :=
              vNf.vItem.vProd.dataSet.FieldByName('cod_prod').AsString;
            vNf.vItem.dataSet.FieldByName('grupo_prod').AsString :=
              vNf.vItem.vProd.dataSet.FieldByName('grupo_prod').AsString;
            vNf.vItem.dataSet.FieldByName('consumo').AsString :=
              vnf.vItem.vProd.dataSet.FieldByName('consumo').AsString;
            if Trim(vDadosIni.vEmp.vCredencInterventor) <> '' then
              vNf.vItem.dataSet.FieldByName('ecf').AsString :=
               vnf.vItem.vProd.dataSet.FieldByName('ecf').AsString;
          end
          else
          if vDadosIni.vEmp.vBuscaCodNoProduto <> 'S' then
          begin
            vNf.vItem.dataSet.FieldByName('NUM_FAB_PROD').AsString :=
              vNf.getCodigoPeloCodFornecedor(Det.Items[x].Prod.cProd, false);
            vNf.vItem.dataSet.FieldByName('NUM_FAB_FORNECEDOR').AsString :=
              (Det.Items[x].Prod.cProd);
            if trim(vNf.vItem.dataSet.FieldByName('NUM_FAB_PROD').AsString) <> '' then
            begin
              vDadosIni.vInibeMensPesqPros := 'S';
              if ((vDadosIni.PesqPros('NF0172', 'ALTERAR', 'ALTERAR DESCRICAO PROD ENTRADA NF', 'NOTAFISCAL', vNf.vItem.dataSet.FieldByName('COD_NF').AsString, buscas2, True))
                or (vDadosIni.vEmp.vUsarConferenciaCegaSaida = 'S1')) then
                vNf.vItem.dataSet.FieldByName('descricao_item').AsString :=
                  uppercase(trim(vnf.vProdForn.dataSet.FieldByName('descr_prod').AsString));
              vNf.vItem.dataSet.FieldByName('cod_prod').AsString :=
                vnf.vProdForn.dataSet.FieldByName('cod_prod').AsString;
              vNf.vItem.dataSet.FieldByName('grupo_prod').AsString :=
                vnf.vProdForn.dataSet.FieldByName('grupo_prod').AsString;
              vNf.vItem.dataSet.FieldByName('consumo').AsString :=
                vnf.vProdForn.dataSet.FieldByName('consumo').AsString;
              if Trim(vDadosIni.vEmp.vCredencInterventor) <> '' then
                vNf.vItem.dataSet.FieldByName('ecf').AsString :=
                  vnf.vProdForn.dataSet.FieldByName('ecf').AsString;
              vNf.vItem.dataSet.FieldByName('cod_grade').AsInteger :=
                vnf.vProdForn.vCodGrade;
            end;
          end
          else
          begin
            vNf.vItem.vProd.FBuscarApenasCB := True;
            if vNf.vItem.vProd.buscaProduto(Det.Items[x].Prod.cProd, False) then
            begin
              vDadosIni.vInibeMensPesqPros := 'S';
              if ((vDadosIni.PesqPros('NF0172', 'ALTERAR', 'ALTERAR DESCRICAO PROD ENTRADA NF', 'NOTAFISCAL', vNf.vItem.dataSet.FieldByName('COD_NF').AsString, buscas2, True))
                or (vDadosIni.vEmp.vUsarConferenciaCegaSaida = 'S1')) then
                vNf.vItem.dataSet.FieldByName('descricao_item').AsString :=
                  uppercase(trim(vnf.vItem.vProd.dataSet.FieldByName('descr_prod').AsString));
              vNf.vItem.dataSet.FieldByName('num_fab_prod').AsString :=
                vNf.vItem.vProd.dataSet.FieldByName('num_fab_prod').AsString;
              vNf.vItem.dataSet.FieldByName('cod_prod').AsString :=
                vNf.vItem.vProd.dataSet.FieldByName('cod_prod').AsString;
              vNf.vItem.dataSet.FieldByName('grupo_prod').AsString :=
                vNf.vItem.vProd.dataSet.FieldByName('grupo_prod').AsString;
              vNf.vItem.dataSet.FieldByName('consumo').AsString :=
                vnf.vItem.vProd.dataSet.FieldByName('consumo').AsString;
              if Trim(vDadosIni.vEmp.vCredencInterventor) <> '' then
                vNf.vItem.dataSet.FieldByName('ecf').AsString :=
                 vnf.vItem.vProd.dataSet.FieldByName('ecf').AsString;
//                  vnf.vProdForn.dataSet.FieldByName('ecf').AsString;
              //num_fab_prod, cod_prod, grupo_prod                      
              vNf.vItem.dataSet.FieldByName('cod_grade').AsInteger :=
                vnf.vItem.vProd.vCodGrade;
            end
            else
            begin
              vNf.vItem.dataSet.FieldByName('NUM_FAB_PROD').AsString :=
                vNf.getCodigoPeloCodFornecedor(Det.Items[x].Prod.cProd, false);
              vNf.vItem.dataSet.FieldByName('NUM_FAB_FORNECEDOR').AsString :=
                (Det.Items[x].Prod.cProd);

              if trim(vNf.vItem.dataSet.FieldByName('NUM_FAB_PROD').AsString) <> '' then
              begin
              	vDadosIni.vInibeMensPesqPros := 'S';
              	if ((vDadosIni.PesqPros('NF0172', 'ALTERAR', 'ALTERAR DESCRICAO PROD ENTRADA NF', 'NOTAFISCAL', vNf.vItem.dataSet.FieldByName('COD_NF').AsString, buscas2, True))
                  or (vDadosIni.vEmp.vUsarConferenciaCegaSaida = 'S1')) then
                	vNf.vItem.dataSet.FieldByName('descricao_item').AsString :=
                  	uppercase(trim(vnf.vProdForn.dataSet.FieldByName('descr_prod').AsString));
                vNf.vItem.dataSet.FieldByName('cod_prod').AsString :=
                  vnf.vProdForn.dataSet.FieldByName('cod_prod').AsString;
                vNf.vItem.dataSet.FieldByName('grupo_prod').AsString :=
                  vnf.vProdForn.dataSet.FieldByName('grupo_prod').AsString;
                vNf.vItem.dataSet.FieldByName('consumo').AsString :=
                  vnf.vProdForn.dataSet.FieldByName('consumo').AsString;
                if Trim(vDadosIni.vEmp.vCredencInterventor) <> '' then
                  vNf.vItem.dataSet.FieldByName('ecf').AsString :=
                    vnf.vProdForn.dataSet.FieldByName('ecf').AsString;  
                vNf.vItem.dataSet.FieldByName('cod_grade').AsInteger :=
                  vnf.vProdForn.vCodGrade;
              end;
            end;
          end;
          vNf.vItem.vProd.setDadosEmbalagemProduto(
            vNf.vItem.dataSet.FieldByName('grupo_prod').AsInteger,
            vNf.vItem.dataSet.FieldByName('cod_prod').AsString);
//          vNf.vItem.dataSet.FieldByName('unidade_nf').AsString := vNf.vItem.vProd.Emb_Conv_Referencia;
//          vNf.vItem.dataSet.FieldByName('qtdemb').AsFloat := vNf.vItem.vProd.Emb_Conv_Embal_Com;
        end;

        with Det.Items[x].Imposto.ICMS do
        begin
          if (CST = cst00) or (CST = cst20) then
          begin
            if CST = cst20 then
            begin
              vNf.vItem.dataSet.FieldByName('CST').AsString := OrigToStr(orig) + '20';
              vNf.vItem.dataSet.FieldByName('Perc_red_prod').Asfloat := pRedBC;
            end else
              vNf.vItem.dataSet.FieldByName('CST').AsString := OrigToStr(orig) + '00';
            vNf.vItem.dataSet.FieldByName('MODBC').AsString := modBCToStr(modBC);
//            if (vdadosini.vEmp.vDesconsiderarICMSNfEnt = 'S') and
//              (vNf.dataSet.FieldByName('tipo_nf').AsString <> 'V') then
//            else
//            begin
              vNf.vItem.dataSet.FieldByName('BASE_ICM').AsFloat := vBC;
              vNf.vItem.dataSet.FieldByName('aliq_icm').AsFloat := picms;
              vNf.vItem.dataSet.FieldByName('valor_icm').AsFloat := vICMS;
              vNf.vItem.dataSet.FieldByName('aliq_icm_xml').AsFloat := picms;
              vNf.vItem.dataSet.FieldByName('valor_icm_xml').AsFloat := vICMS;
//            end;
          end;

          if (CST = cst10) or (CST = cst70) or (CST = cst30) or (CST = cst90) then
          begin
            if (CST = cst70) or (CST = cst90) then
            begin
              vNf.vItem.dataSet.FieldByName('CST').AsString := OrigToStr(orig) + vDadosIni.IfThen( CST = cst70, '70', '90');
              vNf.vItem.dataSet.FieldByName('Perc_red_prod').Asfloat := pRedBC;
            end
            else
              if CST = cst10 then
              begin
                vNf.vItem.dataSet.FieldByName('CST').AsString := OrigToStr(orig) + '10';
              end
              else
                if CST = cst30 then
                begin
                  vNf.vItem.dataSet.FieldByName('CST').AsString := OrigToStr(orig) + '30';
                end;

            if CST <> cst30 then
            begin
              vNf.vItem.dataSet.FieldByName('MODBC').AsString := modBCToStr(modBC);
//              if (vdadosini.vEmp.vDesconsiderarICMSNfEnt = 'S') and
//                (vNf.dataSet.FieldByName('tipo_nf').AsString <> 'V') then
//              else
//              begin
                vNf.vItem.dataSet.FieldByName('BASE_ICM').AsFloat := vBC;
                vNf.vItem.dataSet.FieldByName('aliq_icm').AsFloat := picms;
                vNf.vItem.dataSet.FieldByName('valor_icm').AsFloat := vICMS;
                vNf.vItem.dataSet.FieldByName('aliq_icm_xml').AsFloat := picms;
                vNf.vItem.dataSet.FieldByName('valor_icm_xml').AsFloat := vICMS;
//              end;
            end;

            if pMVAST <> 0 then
              vNf.vItem.dataSet.FieldByName('MODBCST').AsString := modBCSTToStr(modBCST)
            else
              vNf.vItem.dataSet.FieldByName('MODBCST').AsString := '0';
            vNf.vItem.dataSet.FieldByName('MODBCST').AsString := '0';
            //                  vNf.vItem.dataSet.FieldByName('MODBCST').AsString := modBCSTToStr(modBCST);
            vNf.vItem.dataSet.FieldByName('MVA').Asfloat := pMVAST;
            vNf.vItem.dataSet.FieldByName('Perc_red_prod_sub').Asfloat := pRedBCST;
            vNf.vItem.dataSet.FieldByName('base_icmsub').AsFloat := vBCST;
            vNf.vItem.dataSet.FieldByName('aliq_icmsub').Asfloat := pICMSST;
            vNf.vItem.dataSet.FieldByName('valor_icmsub').Asfloat := vICMSST;
          end;

          if (CST = cst40) then
            vNf.vItem.dataSet.FieldByName('CST').AsString := OrigToStr(orig) + '40'
          else if (CST = cst41) then
            vNf.vItem.dataSet.FieldByName('CST').AsString := OrigToStr(orig) + '41'
          else if (CST = cst50) then
            vNf.vItem.dataSet.FieldByName('CST').AsString := OrigToStr(orig) + '50'
          else if (CST = cst51) then
            vNf.vItem.dataSet.FieldByName('CST').AsString := OrigToStr(orig) + '51'
          else if (CST = cst60) then
            vNf.vItem.dataSet.FieldByName('CST').AsString := OrigToStr(orig) + '60'
          else if (CST = cst90) then
            vNf.vItem.dataSet.FieldByName('CST').AsString := OrigToStr(orig) + '90';

          //csosm

          if (CSOSN = csosn101) or (CSOSN = csosn201) or (CSOSN = csosn900) then
          begin
            if (CSOSN = csosn101) then
            begin
              vNf.vItem.dataSet.FieldByName('CST').AsString := OrigToStr(orig) + '00';
              vNf.vItem.dataSet.FieldByName('csosn').AsString := CSOSNIcmsToStr(csosn101);
            end;
//            vNf.vItem.dataSet.FieldByName('BASE_ICM').AsFloat := vBC;
            vNf.vItem.dataSet.FieldByName('aliq_icm').AsFloat := pCredSN;
            vNf.vItem.dataSet.FieldByName('valor_icm').AsFloat := vCredICMSSN;
            if pCredSN <> 0 then
             vNf.vItem.dataSet.FieldByName('BASE_ICM').AsFloat := ((vCredICMSSN*100)/pCredSN);
          end;

          if (CSOSN = csosn201) or (CSOSN = csosn202) or (CSOSN = csosn203) or (CSOSN = csosn900) then
          begin
            if (CSOSN = csosn201) then
            begin
              vNf.vItem.dataSet.FieldByName('CST').AsString := OrigToStr(orig) + '10';
              vNf.vItem.dataSet.FieldByName('csosn').AsString := CSOSNIcmsToStr(csosn201);
            end else if (CSOSN = csosn202) then
            begin
              vNf.vItem.dataSet.FieldByName('CST').AsString := OrigToStr(orig) + '10';
              vNf.vItem.dataSet.FieldByName('csosn').AsString := CSOSNIcmsToStr(csosn202);
            end else if (CSOSN = csosn203) then
            begin
              vNf.vItem.dataSet.FieldByName('CST').AsString := OrigToStr(orig) + '30';
              vNf.vItem.dataSet.FieldByName('csosn').AsString := CSOSNIcmsToStr(csosn203);
            end;
            if pMVAST <> 0 then
              vNf.vItem.dataSet.FieldByName('MODBCST').AsString := modBCSTToStr(modBCST)
            else
              vNf.vItem.dataSet.FieldByName('MODBCST').AsString := '0';
            vNf.vItem.dataSet.FieldByName('MVA').Asfloat := pMVAST;
            vNf.vItem.dataSet.FieldByName('Perc_red_prod_sub').Asfloat := pRedBCST;
            vNf.vItem.dataSet.FieldByName('base_icmsub').AsFloat := vBCST;
            vNf.vItem.dataSet.FieldByName('aliq_icmsub').Asfloat := pICMSST;
            vNf.vItem.dataSet.FieldByName('valor_icmsub').Asfloat := vICMSST;
          end;

          if (CSOSN = csosn102) then
          begin
            vNf.vItem.dataSet.FieldByName('CST').AsString := OrigToStr(orig) + '00';
            vNf.vItem.dataSet.FieldByName('csosn').AsString := CSOSNIcmsToStr(csosn101);
          end else if (CSOSN = csosn103) then
          begin
            vNf.vItem.dataSet.FieldByName('CST').AsString := OrigToStr(orig) + '40';
            vNf.vItem.dataSet.FieldByName('csosn').AsString := CSOSNIcmsToStr(csosn103);
          end else if (CSOSN = csosn300) then
          begin
            vNf.vItem.dataSet.FieldByName('CST').AsString := OrigToStr(orig) + '00';
            vNf.vItem.dataSet.FieldByName('csosn').AsString := CSOSNIcmsToStr(csosn300);
          end else if (CSOSN = csosn400) then
          begin
            vNf.vItem.dataSet.FieldByName('CST').AsString := OrigToStr(orig) + '41';
            vNf.vItem.dataSet.FieldByName('csosn').AsString := CSOSNIcmsToStr(csosn400);
          end else if (CSOSN = csosn500) then
          begin
            vNf.vItem.dataSet.FieldByName('CST').AsString := OrigToStr(orig) + '60';
            vNf.vItem.dataSet.FieldByName('csosn').AsString := CSOSNIcmsToStr(csosn500);
          end else if (CSOSN = csosn900) then
          begin
            vNf.vItem.dataSet.FieldByName('CST').AsString := OrigToStr(orig) + '90';
            vNf.vItem.dataSet.FieldByName('csosn').AsString := CSOSNIcmsToStr(csosn900);
          end;

          vNf.vItem.dataSet.FieldByName('NCM').AsString := Det.Items[x].Prod.NCM;
          vNf.vItem.dataSet.FieldByName('CEST').AsString := Det.Items[x].Prod.CEST;
          if trim(Det.Items[x].Prod.veicProd.chassi) <> '' then
            vNf.vItem.dataSet.FieldByName('CHASSI').AsString := Det.Items[x].Prod.veicProd.chassi;
          vnf.buscas.close;
          vnf.buscas.sql.Clear;
          vnf.buscas.sql.Add('select * from nat_op where codigo_nop = ' + Det.Items[x].Prod.CFOP);
          vnf.buscas.open;
          if not vnf.buscas.IsEmpty then
          begin
            vNf.vItem.dataSet.FieldByName('CODIGO_NOP').AsString :=
              vnf.buscas.FieldByName('CFOP_CONV').AsString;
            if vnf.buscas.FieldByName('CFOP_CONV').AsString = '' then
            begin
              vflgcfop := 1;
              ListCFOPConv.Add(Det.Items[x].Prod.CFOP);
            end;
          end
          else
            vNf.vItem.dataSet.FieldByName('CODIGO_NOP').AsString := Det.Items[x].Prod.CFOP;
          vNf.vCfop.selecionaCfop(Trunc(vNf.vItem.dataSet.FieldByName('CODIGO_NOP').AsFloat));
          vNf.vItem.dataSet.FieldByName('altera_estoque_cfop').AsString := vNf.vCfop.dataSet.FieldByName('ALT_EST').AsString;
          vNf.vItem.dataSet.FieldByName('altera_custo_cfop').AsString := vNf.vCfop.dataSet.FieldByName('calc_custo').AsString;
          if vDadosIni.vEmp.vVersaoVeiculos = '4' then
            vNf.vItem.dataSet.FieldByName('tipv_veiculo').AsString := vNf.vCfop.dataSet.FieldByName('tipv_veiculo').AsString;
          //Det.Items[x].Prod.CFOP;
          vNf.vItem.dataSet.FieldByName('VALOR_TOTAL').Asfloat := Det.Items[x].Prod.vProd;
          vNf.vItem.dataSet.FieldByName('UNIDADE_NF').AsString := Det.Items[x].Prod.uCom;
          vNf.vItem.dataSet.FieldByName('QTDEMBREC').Asfloat := Det.Items[x].Prod.qCom;
          vNf.vItem.dataSet.FieldByName('EAN13').AsString := Det.Items[x].Prod.cEAN;
          if vNf.vItem.vProd.vQtdeConversao > 0 then
          begin
            vNf.vItem.dataSet.FieldByName('REFERENCIA').AsString := vNf.vItem.vProd.vUnidadeConversao;
            vNf.vItem.dataSet.FieldByName('QUANTIDADE').Asfloat := vNf.vItem.vProd.vQtdeConversao * Det.Items[x].Prod.qCom;
            vNf.vItem.dataSet.FieldByName('VALOR_UNITARIO').Asfloat := vNf.vItem.dataSet.FieldByName('VALOR_TOTAL').Asfloat /
              vNf.vItem.dataSet.FieldByName('QUANTIDADE').Asfloat;
            vNf.vItem.dataSet.FieldByName('QTDEMB').Asfloat := vNf.vItem.vProd.vQtdeConversao;
            vNf.vItem.dataSet.FieldByName('VLREMBNF').Asfloat := vDadosIni.StrToFloatFormat(vNf.vItem.dataSet.FieldByName('VALOR_TOTAL').Asfloat / vNf.vItem.dataSet.FieldByName('QTDEMBREC').Asfloat, 6);
          end
          else if (vnf_e_hab_conversao_embalagem_produto) and
            (vNf.vItem.vProd.Emb_Conv_Referencia = Trim(Det.Items[x].Prod.uCom)) and
            (vNf.vItem.vProd.Emb_Conv_Embal_Com > 0) then
          begin
            vNf.vItem.dataSet.FieldByName('REFERENCIA').AsString := vNf.vItem.vProd.Emb_Conv_RefProduto;
            vNf.vItem.dataSet.FieldByName('QUANTIDADE').Asfloat := vDadosIni.StrToFloatFormat(Det.Items[x].Prod.qCom * vNf.vItem.vProd.Emb_Conv_Embal_Com, 4);
            vNf.vItem.dataSet.FieldByName('VALOR_UNITARIO').Asfloat := vDadosIni.StrToFloatFormat(vNf.vItem.dataSet.FieldByName('VALOR_TOTAL').Asfloat / vNf.vItem.dataSet.FieldByName('QUANTIDADE').Asfloat, 4);
            vNf.vItem.dataSet.FieldByName('QTDEMB').Asfloat := vNf.vItem.vProd.Emb_Conv_Embal_Com;
            vNf.vItem.dataSet.FieldByName('VLREMBNF').Asfloat := vDadosIni.StrToFloatFormat(vNf.vItem.dataSet.FieldByName('VALOR_TOTAL').Asfloat / vNf.vItem.dataSet.FieldByName('QTDEMBREC').Asfloat, 6);
          end
          else
          begin
            vNf.vItem.dataSet.FieldByName('REFERENCIA').AsString := Det.Items[x].Prod.uCom;
            vNf.vItem.dataSet.FieldByName('QUANTIDADE').Asfloat := Det.Items[x].Prod.qCom;
            vNf.vItem.dataSet.FieldByName('VALOR_UNITARIO').Asfloat := Det.Items[x].Prod.vUnCom;
            vNf.vItem.dataSet.FieldByName('QTDEMB').Asfloat := 1;
            vNf.vItem.dataSet.FieldByName('VLREMBNF').Asfloat := vDadosIni.StrToFloatFormat(vNf.vItem.dataSet.FieldByName('VALOR_TOTAL').Asfloat / vNf.vItem.dataSet.FieldByName('QTDEMBREC').Asfloat, 6);
          end;

          if Det.Items[x].Prod.vDesc <> 0 then
          begin
            vNf.vItem.dataSet.FieldByName('RATEIO_DESCONTO').Asfloat := Det.Items[x].Prod.vDesc;
            vNf.vItem.dataSet.FieldByName('PERC_DESCONTO').Asfloat := Det.Items[x].Prod.vDesc /
              ((Det.Items[x].Prod.vProd) / 100);
            vNf.dataSet.FieldByName('TIPO_DESCONTO').AsString := 'I';
          end;
          vNf.vItem.dataSet.FieldByName('VALOR_ICM_STDES').Asfloat :=
            Det.Items[x].Imposto.ICMS.vICMSSTDest;
          vNf.vItem.dataSet.FieldByName('CAMP_ENTEST').AsString := 'L';
          vNf.vItem.dataSet.FieldByName('INDTOT').AsInteger := StrToIntDef(indTotToStr(Det.Items[x].Prod.IndTot), 1);

          if (Det.Items[x].Imposto.IPI.vIPI > 0) then
            if Det.Items[x].Imposto.IPI.vBC > 0 then
            begin
              vNf.vItem.dataSet.FieldByName('BASE_IPI').Asfloat := Det.Items[x].Imposto.IPI.vBC;
              if Det.Items[x].Imposto.IPI.pIPI > 0 then
                vNf.vItem.dataSet.FieldByName('ALIQ_IPI').Asfloat := Det.Items[x].Imposto.IPI.pIPI
              else
                vNf.vItem.dataSet.FieldByName('ALIQ_IPI').Asfloat := Det.Items[x].Imposto.IPI.vIPI / Det.Items[x].Imposto.IPI.vBC * 100;
              vNf.vItem.dataSet.FieldByName('VALOR_IPI').Asfloat := Det.Items[x].Imposto.IPI.vIPI;
              BaseIPI := BaseIPI + Det.Items[x].Imposto.IPI.vBC;
            end
            else if (Det.Items[x].Imposto.IPI.pIPI > 0) then
            begin
              vNf.vItem.dataSet.FieldByName('ALIQ_IPI').Asfloat := Det.Items[x].Imposto.IPI.pIPI;
              vNf.vItem.dataSet.FieldByName('VALOR_IPI').Asfloat := Det.Items[x].Imposto.IPI.vIPI;
              vNf.vItem.dataSet.FieldByName('BASE_IPI').Asfloat := vDadosIni.StrToFloatFormat(
                vNf.vItem.dataSet.FieldByName('VALOR_IPI').Asfloat * 100 /
                vNf.vItem.dataSet.FieldByName('ALIQ_IPI').Asfloat, 2);
              BaseIPI := BaseIPI + vNf.vItem.dataSet.FieldByName('BASE_IPI').Asfloat;
            end
            else
            begin
              vNf.vItem.dataSet.FieldByName('VALOR_IPI').Asfloat := Det.Items[x].Imposto.IPI.vIPI;
              vNf.vItem.dataSet.FieldByName('BASE_IPI').Asfloat :=
                vNf.vItem.dataSet.FieldByName('VALOR_TOTAL').Asfloat -
                vNf.vItem.dataSet.FieldByName('VALOR_DESCONTO_PERC').Asfloat;
              vNf.vItem.dataSet.FieldByName('ALIQ_IPI').Asfloat :=
                vNf.vItem.dataSet.FieldByName('VALOR_IPI').Asfloat /
                vNf.vItem.dataSet.FieldByName('BASE_IPI').Asfloat * 100;
              BaseIPI := BaseIPI + vNf.vItem.dataSet.FieldByName('BASE_IPI').Asfloat;
            end;
            if (Det.Items[x].Imposto.PISST.vPIS > 0) then
            begin
              vNf.vItem.dataSet.FieldByName('aliq_pis_st').AsFloat := Det.Items[x].Imposto.PISST.pPis;
              vNf.vItem.dataSet.FieldByName('base_pis_st').AsFloat := Det.Items[x].Imposto.PISST.vBc;
              vNf.vItem.dataSet.FieldByName('valor_pis_st').AsFloat := Det.Items[x].Imposto.PISST.vPIS;
            end;
            if (Det.Items[x].Imposto.COFINSST.vCOFINS > 0) then
            begin
              vNf.vItem.dataSet.FieldByName('aliq_cofins_st').AsFloat := Det.Items[x].Imposto.COFINSST.pCOFINS;
              vNf.vItem.dataSet.FieldByName('base_cofins_st').AsFloat := Det.Items[x].Imposto.COFINSST.vBC;
              vNf.vItem.dataSet.FieldByName('valor_cofins_st').AsFloat := Det.Items[x].Imposto.COFINSST.vCOFINS;
            end;
        end;

        vNf.vItem.dataSet.FieldByName('PERC_RED_PROD_SUB').Asfloat :=
          Det.Items[x].Imposto.ICMS.pRedBCST;
        vNf.vItem.dataSet.FieldByName('PERC_RED_PROD').Asfloat := Det.Items[x].Imposto.ICMS.pRedBC;
        vNf.vItem.dataSet.FieldByName('RATEIO_DESCONTO').Asfloat := Det.Items[x].Prod.vDesc;
        vNf.vItem.dataSet.FieldByName('NFCI').AsString := Copy(Det.Items[x].Prod.nFCI, 1, 36);
        //            vNf.vItem.dataSet.FieldByName('ALIQ_ISS').Asfloat := Det.Items[x].Imposto.ISSQN.vAliq;
        //            vNf.vItem.dataSet.FieldByName('BASE_ISS').Asfloat := Det.Items[x].Imposto.ISSQN.vBC;
        //            vNf.vItem.dataSet.FieldByName('VALOR_ISS').Asfloat := Det.Items[x].Imposto.ISSQN.vISSQN;
        //            vNf.vItem.dataSet.FieldByName('PESO_B').AsString := Det.Items[x].Prod.veicProd.pesoB;
        //            vNf.vItem.dataSet.FieldByName('PESO_L').AsString := Det.Items[x].Prod.veicProd.pesoL;
        //            vNf.vItem.dataSet.FieldByName('NPED').AsInteger :=
        //            vNf.vItem.dataSet.FieldByName('NITEM_PED').AsInteger := Det.Items[x].Prod.nItemPed;
        if Det.Items[x].Prod.veicProd.chassi <> '' then
        begin

          if Det.Items[x].Prod.CFOP = '5409' then
          begin
            vnf.buscas.close;
            vnf.buscas.sql.Text := 'select VERSAO from NOTAFISCAL_ITEM_VEICULO where CHASSI = ' +
              QuotedStr(Det.Items[x].Prod.veicProd.chassi) +
//              ' and cod_empresa = ' + vDadosIni.codEmpresa +
              ' order by cod_nf desc';
            vnf.buscas.open;

            vDadosIni.vPesquisa := IntToStr(vNf.buscas.FieldByName('versao').AsInteger);

            vnf.buscas.close;
            vnf.buscas.sql.Text := 'select * from tipmodelo where codigo = ' + vDadosIni.vPesquisa +
            ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and vndestoque = ''S'' and ativo = 1';
            vnf.buscas.open;

            vDadosIni.vPesquisa := '';
          end
          else
          begin
            vnf.buscas.close;
            //              vnf.buscas.sql.Clear;
            vnf.buscas.sql.Text := 'select * from tipmodelo where codigofab like ''%' +
              Det.Items[x].Prod.cProd +
              '%'' and cod_empresa = ' + vDadosIni.codEmpresa + ' and vndestoque = ''S'' and ativo = 1';
            vnf.buscas.open;

            if vNf.buscas.IsEmpty then
            begin
              vnf.buscas.close;
              vnf.buscas.sql.Text := 'select tm.* from TIPMODELO_CODIGOFAB t' +
                ' inner join TIPMODELO tm on tm.codigo = t.CODIGO and tm.COD_EMPRESA = t.COD_EMPRESA' +
                ' where t.CODIGO_FAB = ' +QuotedStr(Det.Items[x].Prod.cProd) +
                ' and t.cod_empresa = ' + vDadosIni.codEmpresa + ' and tm.ativo = 1  and tm.vndestoque = ''S'' ';
              vnf.buscas.open;
            end;
          end;

          vNf.vitem.vDetVeic.Insert;
          vNf.vitem.vDetVeic.dataSet.FieldByName('cod_nf').AsInteger :=
            vNf.vitem.dataSet.FieldByName('cod_nf').AsInteger;
          vNf.vitem.vDetVeic.dataSet.FieldByName('cod_empresa').AsInteger :=
            vNf.vitem.dataSet.FieldByName('cod_empresa').AsInteger;
          vNf.vitem.vDetVeic.dataSet.FieldByName('nitem').AsInteger :=
            vNf.vitem.dataSet.FieldByName('nitem').AsInteger;
          vNf.vitem.vDetVeic.dataSet.FieldByName('chassi').AsString := vNf.vitem.dataSet.FieldByName('chassi').AsString;
          vNf.vitem.vDetVeic.dataSet.FieldByName('tipo_venda').AsString := 'N';
          vNf.vitem.vDetVeic.dataSet.FieldByName('TPREST').AsString := '0';
          vNf.vItem.vDetVeic.dataSet.FieldByName('CHASSI').AsString :=
            Det.Items[x].Prod.veicProd.chassi;
          vNf.vItem.vDetVeic.dataSet.FieldByName('COR').AsString := dET.Items[x].Prod.veicProd.xCor;
          try
            if Trim(vDadosIni.vEmp.vUsarCorFabDenatran) = 'D' then
              vNf.vItem.vDetVeic.dataSet.FieldByName('COD_COR').AsString := dET.Items[x].Prod.veicProd.cCorDENATRAN
            else
              vNf.vItem.vDetVeic.dataSet.FieldByName('COD_COR').AsString := dET.Items[x].Prod.veicProd.cCor;
            if not vNf.vItem.verificaCorDenatram(vNf.vItem.vDetVeic.dataSet.FieldByName('COD_COR').AsInteger) then
              vNf.vItem.verificaCorDescricao;
          except
            vNf.vItem.verificaCorDescricao;
          end;
          vNf.vItem.vDetVeic.dataSet.FieldByName('NITEM').AsInteger := Det.Items[x].Prod.nItem;
          vNf.vItem.vDetVeic.vModV.abreModelos(vNf.buscas.FieldByName('CODIGO').AsInteger);
          vNf.vItem.vDetVeic.dataSet.FieldByName('ANO_FAB').AsInteger :=
            dET.Items[x].Prod.veicProd.anoFab;
          vNf.vItem.vDetVeic.dataSet.FieldByName('ANO_MOD').AsInteger :=
            dET.Items[x].Prod.veicProd.anoMod;
          vNf.vItem.vDetVeic.dataSet.FieldByName('MOTOR').AsString :=
            dET.Items[x].Prod.veicProd.nMotor;
          if vNf.vItem.vDetVeic.vModV.dataSet.IsEmpty then
          begin
            vNf.vItem.vDetVeic.vModV.abreModelos;
            Application.MessageBox('Modelo não encontrado. Por favor selecione o modelo correto', 'Atenção',0+64);
          end
          else
            vNf.vItem.verificaModeloVeiculo(vNf);
          {              vNf.vItem.vDetVeic.dataSet.FieldByName('MARCA').AsString:='';
                        vNf.vItem.vDetVeic.dataSet.FieldByName('CHASSI').AsString:=Det.Items[x].Prod.veicProd.chassi;
                        vNf.vItem.vDetVeic.dataSet.FieldByName('VERSAO').AsInteger:=vNf.buscas.FieldByName('CODIGO').AsInteger;
                        vNf.vItem.vDetVeic.dataSet.FieldByName('DESCRICAO_VERSAO').AsString:=vNf.buscas.FieldByName('DESCRICAO').AsString;
                        vNf.vItem.vDetVeic.dataSet.FieldByName('ANO_FAB').AsInteger:=dET.Items[x].Prod.veicProd.anoFab;
                        vNf.vItem.vDetVeic.dataSet.FieldByName('ANO_MOD').AsInteger:=dET.Items[x].Prod.veicProd.anoMod;
                        vNf.vItem.vDetVeic.dataSet.FieldByName('COR').AsString:=dET.Items[x].Prod.veicProd.xCor;
                        vNf.vItem.vDetVeic.dataSet.FieldByName('CILINDROS').AsInteger:=vNf.buscas.FieldByName('CILINDROS').AsInteger;
                        vNf.vItem.vDetVeic.dataSet.FieldByName('CILINDRADA').AsString:=vNf.buscas.FieldByName('CILINDRADA').AsString;
                        vNf.vItem.vDetVeic.dataSet.FieldByName('HP').AsString:=vNf.buscas.FieldByName('HP').AsString;
                        vNf.vItem.vDetVeic.dataSet.FieldByName('LOTACAO').AsString:=vNf.buscas.FieldByName('LOTACAO').AsString;
                        vNf.vItem.vDetVeic.dataSet.FieldByName('TIPO').AsString:=vNf.buscas.FieldByName('TIPO').AsString;
                        vNf.vItem.vDetVeic.dataSet.FieldByName('RENAVAM').AsString:=vNf.buscas.FieldByName('TIPO').AsString;}
{          if vNf.vItem.vDetVeic.dataSet.State in [dsInsert, dsEdit] then
            vNf.vItem.vDetVeic.Post;
        end;
        if (vdadosini.vEmp.vDesconsiderarICMSNfEnt = 'S') and
          (vNf.dataSet.FieldByName('tipo_nf').AsString <> 'V') then
        begin
          vNf.vItem.dataSet.FieldByName('BASE_ICM').AsFloat := 0;
          vNf.vItem.dataSet.FieldByName('aliq_icm').AsFloat := 0;
          vNf.vItem.dataSet.FieldByName('valor_icm').AsFloat := 0;
        end;

        if vNf.vItem.dataSet.FieldByName('indtot').Value <> 0 then
          vNf.vItem.calcucarAntecipacaoTributariaST(vNf, opdImportacaoXML);

        vNf.vItem.calcucarReconposicaoDeICMS(vNf);
        if vNf.vItem.dataSet.State in [dsInsert, dsEdit] then
          vNf.vItem.Post;
      end;
    end;

    vNf.dataSet.FieldByName('base_ipi').AsFloat := BaseIPI;
    //  vNf.vClFor.selecionaClFor(Emit.CNPJCPF);
  end;
  if vflgcfop = 1 then
    Application.MessageBox(PChar('Nota Fiscal não encontrou CFOP de conversão no cadastro de CFOP. ' +
      #13 +
      'Favor atualizar esta tabela.(Ex.: CFOP=6401 CFOP CONVERSÃO=2401)' + #13 + 'Lista abaixo' + #13 + #13 +
      ListCFOPConv.Text), 'Atenção', mb_ok +
      MB_ICONINFORMATION);
  Result := True;
  finally
  vnfe.Free;
  vnfe := nil;
  if buscas2 <> nil then
    FreeAndNil(buscas2);
  end;
  }
end;

function TXmlImport.montarNfNovo(vNf: TNFCab; VArquivoXml: string): boolean;
var
  AListParams: TStrings;
  AListCFOP: TStringList;
  ACodNF, I: Integer;
  ARetorno: string;
  ABaseIPI, AqCom, AvUnCom: Double;
  AuCom, AcEAN, sXmlText, sTag: string;
  AAltDescricaoItem, AExecutarDLL, AConvertEmbalagem, Asucess, validarUnExata: Boolean;
  AProdutoHandle: THandle;
  AProcedure: Tprodutos_vincularProdutoCadXML;
  ACadProdAberto: boolean;
  Apros: TProdutos_tmp_classList;
  isZFM: Boolean;
  pisCalc, cofinsCalc, ppis, pcofins, vliq: Double;
  confList: TConfig_sistema_classList;
  confEscrSN: TConfig_sistema_class;
  //sUndVenda: TStrings;
  conversoes: TUnidadeVendas_Model;
  conversao: TUnidadeVenda_Model;
  undVenda: TUnidadeVenda_Model;
  undConv: TConvUnidadeCriarSilentInput;
  payload: TConvProdutoInput;
  indUnid: Integer;
  sConteudoXML: TStrings;

  function _mdiAbertoSemMensagem(pNomeFormMDI: string): Boolean;
  var
    x: Byte;
  begin
    Result := True;
    if Application.MainForm.MDIChildCount > 0 then
      for X := 0 to Pred(Application.MainForm.MDIChildCount) do
        if UpperCase(Application.MainForm.MDIChildren[X].ClassName) =
          UpperCase(pNomeFormMDI) then
        begin
          Result := False;
          Exit;
        end;
  end;

begin
  Result := False;

  {$REGION 'Importacao da nota via xml pela dll'}
  if not FileExists(VArquivoXml) then
    Exit;

  vNf.ExecutaComandosSqlExec('delete from notafiscal' +
      ' where status in (''ImportaXML'', ''PreNotaXML'')' +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and cod_usuario = ' + IntToStr(vDadosIni.vCodUsuario));

  vNf.queryCons.Table('notafiscal', 'cod_nf, status')
    .Equals('path_xml_import', Trim(Copy(VArquivoXml, 1, 256)))
    .Equals('cod_empresa', vDadosIni.cod_empresa)
    .Equals('natureza_nf', 'E')
    .Open;

  if vNf.queryCons.IsEmpty then
  begin
    sConteudoXML := NewStringList();

    try
      sConteudoXML.LoadFromFile(VArquivoXml);
      sXmlText := AnsiLowerCase(sConteudoXML.Text);//, '<nfe ', '</ide>');

    finally
      sConteudoXML.Free;
    end;

    vNf.queryCons.Table('notafiscal', 'cod_nf, status')
      .Equals('cod_empresa', vDadosIni.cod_empresa)
      .Equals('status', 'PreNotaXML')
      .Equals('natureza_nf', 'E')
      .Equals('modelo_nf', '55');

    sTag := ExtractStr(ExtractStr(sXmlText, '<protnfe ', '</protnfe>'), '<chnfe>', '</chnfe>');
    if Length(OnlyNumber(sTag)) <> 44 then
      sTag := ExtractStr(ExtractStr(sXmlText, '<nfe ', '<ide>'), ' id="', '"');

    if Length(OnlyNumber(sTag)) = 44 then
      vNf.queryCons.Equals('chave_nfe', OnlyNumber(sTag));

    sTag := ExtractStr(ExtractStr(sXmlText, '<ide>', '</ide>'), '<nnf>', '</nnf>');
    vNf.queryCons.Equals('num_nf', StrToIntDef(sTag, -1));

    sTag := ExtractStr(ExtractStr(sXmlText, '<ide>', '</ide>'), '<serie>', '</serie>');
    vNf.queryCons.Equals('serie', sTag);

    vNf.queryCons.Open;
  end;

  vNf.Config.ExecutarLeitura('E');

  AExecutarDLL := True;
  if not vNf.queryCons.IsEmpty then
  begin
    ACodNF := vNf.buscas.FieldByName('cod_nf').AsInteger;
    if vNf.buscas.FieldByName('status').AsString = 'PreNotaXML' then
    begin
      if not vNf.ExecutaComandosSqlExec('delete from notafiscal_item' +
        ' where cod_nf = ' + IntToStr(ACodNF) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa) then
      begin
        vNf.RollBackTransacao;
        Exit;
      end;
      if not vNf.ExecutaComandosSqlExec('update notafiscal set status = ''ImportaXML'', num_nf = cod_nf, serie = '''', modelo_nf = null' +
        ' where cod_nf = ' + IntToStr(ACodNF) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa +
        ' and status = ''PreNotaXML''') then
      begin
        vNf.RollBackTransacao;
        Exit;
      end;
      AExecutarDLL := vNf.ExecutaComandosSql('select cod_nf, status from notafiscal' +
        ' where cod_nf = ' + IntToStr(ACodNF) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa +
        ' and status = ''ImportaXML''', False);
      if AExecutarDLL then
        vNf.CommitaTransacao
      else
      begin
        vNf.RollBackTransacao;
        Exit;
      end;
    end
    else if vNf.buscas.FieldByName('status').AsString <> 'ImportaXML' then
    begin
      vNf.selecionaNotaFiscal(ACodNF);
      vNf.Edit;
      Result := True;
      Exit;
    end;
  end
  else
  begin
    {$REGION 'Excluindo notas que não foram usadas'}
    //Notas do dia anterior
    vNf.ExecutaComandosSqlExec('delete from notafiscal' +
      ' where status in (''ImportaXML'', ''PreNotaXML'')' +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and data_lanc < ' + vDadosIni.FusoSqlDate);
    //Notas do usuário q nao foram usadas
    vNf.ExecutaComandosSqlExec('delete from notafiscal' +
      ' where status in (''ImportaXML'', ''PreNotaXML'')' +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and cod_usuario = ' + IntToStr(vDadosIni.vCodUsuario));
    {$ENDREGION}


    if not vNf.incluirNf(tnfProdutos, 'P', 'E') then
      Exit;
    vNf.dataSet.FieldByName('status').AsString := 'ImportaXML';

    if not vNf.ExecutaComandosSql( 'select cod_cliente from clientes' +
      ' where cpfcgc = ' + QuotedStr(vDadosIni.vEmp.vCNPJ) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa, False) then
      vNf.ExecutaComandosSql( 'select first 1 cod_cliente from clientes' +
        ' where cod_empresa = ' + vDadosIni.codEmpresa, False);
    vNf.dataSet.FieldByName('cod_cliente').AsInteger := vNf.buscas.FieldByName('cod_cliente').AsInteger;

    vNf.ExecutaComandosSql('select cod from incrementa_codigo(' + vDadosIni.codEmpresa + ', ' + QuotedStr('NOTAFISCAL') + ')', False);
    ACodNF := vNf.buscas.FieldByName('cod').AsInteger;
    vNf.dataSet.FieldByName('cod_nf').Value := ACodNF;
    vNf.dataSet.FieldByName('num_nf').Value := ACodNF;
    vNf.dataSet.FieldByName('path_xml_import').AsString := VArquivoXml;
    vNf.dataSet.FieldByName('ativo').Value := 0;
    vNf.dataSet.FieldByName('dest_seqid').AsInteger := 0;
    vNf.dataSet.Post;
    if vNf.Apply then
      vNf.CommitaTransacao
    else
    begin
      vNf.RollBackTransacao;
      Exit;
    end;
  end;

  if AExecutarDLL then
  begin
    AListParams := TStringList.Create;
    try
    	ACadProdAberto := not _mdiAbertoSemMensagem('TFrmCadProdutos');

    	AListParams.Clear;
      AListParams.Add('ASisAuto=' + BoolToStr(vDadosIni.vSistemasUsuario.vSisAutomacao, True));
      AListParams.Add('ASisVeic=' + BoolToStr(vDadosIni.vSistemasUsuario.vSisVeiculos, True));
      AListParams.Add('AUsarCorFabDenatran=' + BoolToStr(vDadosIni.vEmp.vUsarCorFabDenatran= 'S', True));
      AListParams.Add('ACodEmpresa=' + vDadosIni.codEmpresa);
      AListParams.Add('ACodUsuario=' + IntToStr(vDadosIni.vCodUsuario));
      AListParams.Add('ACodNF=' + IntToStr(ACodNF));
      AListParams.Add('AUsuario=' + trim(vDadosIni.vNomeUsuario));
      AListParams.Add('ANivel=' + IntToStr(vDadosIni.vNivel));
      AListParams.Add('ACNPJ=' + vDadosIni.vEmp.vCNPJ);
      AListParams.Add('AUFDest=' + vDadosIni.vEmp.vSiglaUF);
      AListParams.Add('AFileName=' + VArquivoXml);
      AListParams.Add('ADabaseName=' + vDadosIni.vBancoHW);
      AListParams.Add('ABuscaCodNoProduto=' + BoolToStr(vDadosIni.vEmp.vBuscaCodNoProduto = 'S', True));
      AListParams.Add('ADigitosProd=' + vDadosIni.vProduto.vDigitosProd);
      if vDadosIni.vEmp.vUsarCodigoSequencialProduto = 'S' then
	     	AListParams.Add('AUsarCodigoSequencialProduto=S')
      else
      	AListParams.Add('AUsarCodigoSequencialProduto=N');
      AListParams.Add('ACadProdAberto=' + vDadosIni.IfThen(ACadProdAberto, 'S', 'N'));
      AListParams.Add('ANatureza=E');
      AListParams.Add('CNPJsEntrada=' + vNf.Config.Conf_Geral.nf_e_cnpj_import_xml.ReadString('EntradaNF', 'CNPJs'));
      AListParams.Add('CNPJsCadastroProduto=' + vNf.Config.Conf_Geral.nf_e_cnpj_import_xml.ReadString('CadastroProdutos', 'CNPJs'));

      if IniConf.ReadStr('MD', 'LogImportXML') = 'S' then
        AListParams.SaveToFile(ExtractFilePath(Application.ExeName) + 'LogImportEntradaXML.txt');

      ARetorno := Abstracao_hw_LerXMLNFe(AListParams.Text);
      if (Pos('CADASTRARPROD|', ARetorno) > 0) or (Pos('REMOVERVINCPROD|', ARetorno) > 0) then
        // Não fazer nada
      else if ARetorno <> 'OK' then
      begin
        vDadosIni.ShowErro(vDadosIni.getCampoPipe(ARetorno + '|', 2));
        Exit;
      end;

    	while (Pos('CADASTRARPROD|', ARetorno) > 0) or (Pos('REMOVERVINCPROD|', ARetorno) > 0) do
      begin
      	if Pos('CADASTRARPROD|', ARetorno) > 0 then
        begin
          if AProdutoHandle = 0 then
            CarregaPacote('pkProdutos', AProdutoHandle);

          if AProdutoHandle = 0 then
          begin
            Application.MessageBox('Pacote Produto não carregado', 'Anteção', 0 + 64);
            Exit;
          end;
          @AProcedure := GetProcAddress(AProdutoHandle, 'produtos_vincularProdutoCadXML');
          if Assigned(AProcedure) then
            Result := AProcedure(vDadosIni.getCampoPipe(ARetorno + '|', 2));
        end;

        ACadProdAberto := not _mdiAbertoSemMensagem('TFrmCadProdutos');
        
        AListParams.Clear;
        AListParams.Add('ASisAuto=' + BoolToStr(vDadosIni.vSistemasUsuario.vSisAutomacao, True));
        AListParams.Add('ASisVeic=' + BoolToStr(vDadosIni.vSistemasUsuario.vSisVeiculos, True));
        AListParams.Add('AUsarCorFabDenatran=' + BoolToStr(vDadosIni.vEmp.vUsarCorFabDenatran= 'S', True));
        AListParams.Add('ACodEmpresa=' + vDadosIni.codEmpresa);
        AListParams.Add('ACodUsuario=' + IntToStr(vDadosIni.vCodUsuario));
        AListParams.Add('ACodNF=' + IntToStr(ACodNF));
        AListParams.Add('AUsuario=' + trim(vDadosIni.vNomeUsuario));
        AListParams.Add('ANivel=' + IntToStr(vDadosIni.vNivel));
        AListParams.Add('ACNPJ=' + vDadosIni.vEmp.vCNPJ);
        AListParams.Add('AUFDest=' + vDadosIni.vEmp.vSiglaUF);
        AListParams.Add('AFileName=' + VArquivoXml);
        AListParams.Add('ADabaseName=' + vDadosIni.vBancoHW);
        AListParams.Add('ABuscaCodNoProduto=' + BoolToStr(vDadosIni.vEmp.vBuscaCodNoProduto = 'S', True));
        AListParams.Add('ADigitosProd=' + vDadosIni.vProduto.vDigitosProd);
        if vDadosIni.vEmp.vUsarCodigoSequencialProduto = 'S' then
          AListParams.Add('AUsarCodigoSequencialProduto=S')
        else
          AListParams.Add('AUsarCodigoSequencialProduto=N');
        AListParams.Add('ACadProdAberto=' + vDadosIni.IfThen(ACadProdAberto, 'S', 'N'));
        AListParams.Add('ANatureza=E');

        ARetorno := Abstracao_hw_LerXMLNFe(AListParams.Text);
        if (Pos('CADASTRARPROD|', ARetorno) > 0) or (Pos('REMOVERVINCPROD|', ARetorno) > 0) then
        	// Não fazer nada
        else if ARetorno <> 'OK' then
        begin
          vDadosIni.ShowErro(vDadosIni.getCampoPipe(ARetorno + '|', 2));
          Exit;
        end;
      end;
    finally
      FreeAndNil(AListParams);
    end;
  end;
  {$ENDREGION}

  {$REGION 'Validações e processamentos apos a importacao'}
  vNf.selecionaNotaFiscal(ACodNF);
  if vNf.dataSet.FieldByName('cod_nf').AsInteger <> ACodNF then
  begin
    vDadosIni.ShowErro('Não foi possível selecionar a nota fiscal');
    Exit;
  end;

  if vNf.SqlScalar('select ativo from clientes where cod_cliente = %d and cod_empresa = %d',
                   [vNf.fint('cod_cliente'), vDadosIni.cod_empresa]).AsInteger = 0 then
  begin
    ShowAtencao('Cliente inativo ou não existe no cadastro');
    Exit;
  end;

  vNf.vItem.selecionaItens(ACodNF);
  vNf.Edit;
  vNf.dataSet.FieldByName('dfe_trib_ignorar').Clear; // Nos itens vai tratar

  for I := 0 to Pred(vNf.vClFor.EndDoc.lista.Count) do with vNf.vClFor.EndDoc.lista.Items[I] do
    if (vNf.dataSet.FieldByName('cod_cliente').AsInteger = cod_cliente) and
       (vNf.dataSet.FieldByName('dest_seqid').AsInteger = dest_seqid) then
      vNf.vClFor.SetDadosDestinatario(vNf.vClFor.EndDoc.lista.Items[I]);

  confList := vDadosIni.getConfSisList(vNf.buscas,
  		['nf_e_hab_conversao_embalagem_produto',
       'nf_e_conversao_ean_exata',
       'efd_icms_escrituracao']);

  ABaseIPI := 0;
  validarUnExata := confList.GetConf('nf_e_conversao_ean_exata').AsBoolean;
  AConvertEmbalagem := confList.GetConf('nf_e_hab_conversao_embalagem_produto').AsBoolean;
  AAltDescricaoItem := ((vDadosIni.PesqPros('NF0172', 'ALTERAR', 'ALTERAR DESCRICAO PROD ENTRADA NF', 'NOTAFISCAL',
                         vNf.vItem.dataSet.FieldByName('COD_NF').AsString, vNf.buscas, True, False, True)) or
                         (vDadosIni.vEmp.vUsarConferenciaCegaSaida = 'S1'));

  confEscrSN := confList.GetConf('efd_icms_escrituracao');

  AListCFOP := TStringList.Create;
  try
    AListCFOP.Sorted := True;
    AListCFOP.Duplicates := dupIgnore;
    AListCFOP.Clear;

    {$REGION 'Processando itens'}
    vNf.vItem.dataSet.First;
    while not vNf.vItem.dataSet.Eof do
    begin
      if vNf.fnull('dfe_trib_ignorar') and not vNf.vItem.fempty('dfe_trib_id') then
        vNf.dataSet.FieldByName('dfe_trib_ignorar').AsInteger := Ord(ynNo);

      vNf.vItem.dataSet.Edit;
      vNf.vItem.dataSet.FieldByName('ucom').AsString       := AnsiUpperCase(vNf.vItem.fstr('ucom'));
      vNf.vItem.dataSet.FieldByName('unidade_nf').AsString := AnsiUpperCase(vNf.vItem.fstr('unidade_nf'));
      vNf.vItem.dataSet.FieldByName('referencia').AsString := AnsiUpperCase(vNf.vItem.fstr('referencia'));

      AcEAN := vNf.vItem.dataSet.FieldByName('num_fab_prod').AsString;
      AuCom := vNf.vItem.dataSet.FieldByName('ucom').AsString;

      if vNf.vItem.fequals('tipo_item', 'O') then
        vNf.vItem.dataSet.FieldByName('descricao_item_outras').AsString := vNf.vItem.fstr('descricao_item')
      else
        vNf.vItem.dataSet.FieldByName('num_fab_prod').AsString := '';

      if vNf.dataSet.FieldByName('tipo_nf').AsString = 'P' then
      begin

        {$REGION 'Pesquisa do produto'}
        // Se já tem o grupo e codigo precisaria disso?

        vNf.vItem.vProd.Conv_QtdeEAN := 0;
        if (vNf.vItem.vProd.buscaProdutoParaConversao( AcEAN, Aucom,
          vNf.vItem.dataSet.FieldByName('nitem').AsInteger)) and (vNf.vItem.vProd.Conv_QtdeEAN > 0) then
        begin
          //codigo abaixo
        end
        else if vDadosIni.vEmp.vBuscaCodNoProduto <> 'S' then
        begin
          if vNf.getCodigoPeloCodFornecedor(vNf.vItem.dataSet.FieldByName('num_fab_fornecedor').AsString, True) <> '' then
            if not vnf.vProdForn.dataSet.IsEmpty  then
            begin
              vNf.vItem.vProd.buscaProduto(vnf.vProdForn.dataSet.FieldByName('grupo_prod').AsInteger,
                                           vnf.vProdForn.dataSet.FieldByName('cod_prod').AsString);
              vNf.vItem.vProd.vCodGrade := vnf.vProdForn.vCodGrade;
            end;
        end
        else
        begin
          vNf.vItem.vProd.FBuscarApenasCB := True;
          if vNf.vItem.vProd.buscaProduto(
            vNf.vItem.dataSet.FieldByName('num_fab_fornecedor').AsString, False) then
          begin
            //codigo abaixo
          end
          else
          begin
            if vNf.getCodigoPeloCodFornecedor(vNf.vItem.dataSet.FieldByName('num_fab_fornecedor').AsString, True) <> '' then;
              if not vnf.vProdForn.dataSet.IsEmpty  then
              begin
                vNf.vItem.vProd.buscaProduto(vnf.vProdForn.dataSet.FieldByName('grupo_prod').AsInteger,
                                             vnf.vProdForn.dataSet.FieldByName('cod_prod').AsString);
                vNf.vItem.vProd.vCodGrade := vnf.vProdForn.vCodGrade;
              end;
          end;
        end;

        if not vnf.vItem.vProd.dataSet.IsEmpty then
        begin
          if AAltDescricaoItem then
            vNf.vItem.dataSet.FieldByName('descricao_item').AsString := uppercase(trim(vnf.vItem.vProd.dataSet.FieldByName('descr_prod').AsString));
          vNf.vItem.dataSet.FieldByName('num_fab_prod').AsString     := vNf.vItem.vProd.dataSet.FieldByName('num_fab_prod').AsString;
          vNf.vItem.dataSet.FieldByName('cod_prod').AsString         := vNf.vItem.vProd.dataSet.FieldByName('cod_prod').AsString;
          vNf.vItem.dataSet.FieldByName('grupo_prod').AsString       := vNf.vItem.vProd.dataSet.FieldByName('grupo_prod').AsString;
          vNf.vItem.dataSet.FieldByName('consumo').AsString          := vnf.vItem.vProd.dataSet.FieldByName('consumo').AsString;
          vNf.vItem.dataSet.FieldByName('cod_grade').AsInteger       := vnf.vItem.vProd.vCodGrade;
          vNf.vItem.dataSet.FieldByName('ecf').AsString              := IfThen(Trim(vDadosIni.vEmp.vCredencInterventor) <> '', vnf.vItem.vProd.dataSet.FieldByName('ecf').AsString);

          vNf.vItem.vrDadosItem.grupo_prod := vNf.vItem.fint('grupo_prod');
          vNf.vItem.vrDadosItem.cod_prod := vNf.vItem.fstr('cod_prod');


          conversoes := vNf.helperConv.GetListConversao(vNf.vItem.fint('grupo_prod'), vNf.vItem.fstr('cod_prod'));

          conversao := conversoes.GetConversaoPorEan(vNf.vItem.fstr('cean'));
          if conversao = nil then
            conversao := conversoes.GetConversaoPreferencialXML(vNf.vItem.fstr('ucom'));

          if conversao = nil then
            conversao := conversoes.GetConversao(vNf.vItem.fstr('ucom'), vNf.fequals('natureza_nf', 'S') and vNf.fequals('tipo_emissao', '1'));

          //sUndVenda := vNf.vItem.GetUndVendaProd;
          //if sUndVenda.IndexOf(vNf.vItem.fstr('ucom')) = -1 then
          if conversao = nil then
          begin
            payload := TConvProdutoInput.Create;
            try
              payload.grupo_prod := vNf.vItem.fint('grupo_prod');
              payload.cod_prod := vNf.vItem.fstr('cod_prod');
              payload.cod_empresa := vDadosIni.cod_empresa;
              payload.usuario := vDadosIni.vNomeUsuario;
              if ConversaoUnidadeUtils.HandleCadastroEanEprodutoSilent(vnf.buscas.Database, payload) > 0 then
              begin
                conversoes := vNf.helperConv.GetListConversao(vNf.vItem.fint('grupo_prod'), vNf.vItem.fstr('cod_prod'));

                conversao := conversoes.GetConversaoPorEan(vNf.vItem.fstr('cean'));
                if conversao = nil then
                  conversao := conversoes.GetConversaoPreferencialXML(vNf.vItem.fstr('ucom'));

                if conversao = nil then
                  conversao := conversoes.GetConversao(vNf.vItem.fstr('ucom'), vNf.fequals('natureza_nf', 'S') and vNf.fequals('tipo_emissao', '1'));
              end;

            finally
              payload.Free;
            end;
            {
            vNf.queryCons.SQL('select first 1 ni.qtdemb from notafiscal_item ni')
              .Join('notafiscal nf', 'nf.cod_nf = ni.cod_nf and nf.cod_empresa = ni.cod_empresa')
              .Join('produtos p', 'p.grupo_prod = ni.grupo_prod and p.cod_prod = ni.cod_prod and p.cod_empresa = ni.cod_empresa')
              .Equals('nf.natureza_nf', 'E')
              .Conditional('nf.emissao_propria', '<>', 'E')
              .Equals('ni.grupo_prod', vNf.vItem.fint('grupo_prod'))
              .Equals('ni.cod_prod', vNf.vItem.fstr('cod_prod'))
              .Equals('ni.cod_empresa', vDadosIni.cod_empresa)
              .Equals('ni.altera_estoque_cfop', 'S')
              .Equals('ni.ucom', vNf.vItem.fstr('ucom'))
              .Conditional('ni.ucom', '<>', 'p.unidade', False)
              .OrderBy('nf.data_lanc desc');

            undVenda := TUnidadeVenda_Model.Create;
            undVenda.fator := vNf.queryCons.Scalar().AsFloat;

            if undVenda.fator > 0 then
            begin
                                                                   
              undVenda.cod_empresa := vDadosIni.cod_empresa;
              undVenda.grupo_prod  := vNf.vItem.fint('grupo_prod');
              undVenda.cod_prod    := vNf.vItem.fstr('cod_prod');
              undVenda.unid_princ  := vNf.vItem.vProd.fstr('unidade');
              undVenda.unid_vnd    := vNf.vItem.fstr('ucom');

              undConv             := TConvUnidadeCriarSilentInput.Create;
              undConv.usuario     := vDadosIni.vNomeUsuario;
              undConv.cod_empresa := vDadosIni.cod_empresa;
              undConv.payload     := undVenda;

              if vNf.helperConv.CriarSilent(undConv) then
              begin
                //sUndVenda := vNf.vItem.GetUndVendaProd;
                conversoes := vNf.helperConv.GetListConversao(vNf.vItem.fint('grupo_prod'), vNf.vItem.fstr('cod_prod'));
                conversao := conversoes.GetConversaoPreferencialXML(vNf.vItem.fstr('ucom'));
                if conversao = nil then
                  conversao := conversoes.GetConversao(vNf.vItem.fstr('ucom'), vNf.fequals('natureza_nf', 'S') and vNf.fequals('tipo_emissao', '1'));
              end;
            end;
            }
          end;

          //if sUndVenda.IndexOf(vNf.vItem.fstr('ucom')) >= 0 then
          if conversao <> nil then
          begin
            //undVenda := (sUndVenda.Objects[sUndVenda.IndexOf(vNf.vItem.fstr('ucom'))] as TUnidadeVenda_Model);

            vNf.vItem.dataSet.FieldByName('referencia').AsString    := AnsiUpperCase(conversao.unid_princ);
            vNf.vItem.dataSet.FieldByName('unidade_nf').AsString    := AnsiUpperCase(conversao.unid_vnd);
            vNf.vItem.dataSet.FieldByName('qtdemb').Asfloat         := conversao.fator;
            vNf.vItem.dataSet.FieldByName('qtdembrec').Asfloat      := vNf.vItem.ffloat('qcom');
            vNf.vItem.dataSet.FieldByName('quantidade').Asfloat     := conversao.CalculaPrincipal(vNf.vItem.ffloat('qcom'));
            vNf.vItem.dataSet.FieldByName('valor_unitario').Asfloat := vNf.vItem.ffloat('valor_total') / vNf.vItem.ffloat('quantidade');
            vNf.vItem.dataSet.FieldByName('vlrembnf').Asfloat       := vNf.vItem.ffloat('valor_total') / vNf.vItem.ffloat('qtdembrec');
          end
          else
          begin
            vNf.vItem.dataSet.FieldByName('referencia').AsString    := vNf.vItem.vProd.fstr('unidade');
            vNf.vItem.dataSet.FieldByName('quantidade').Asfloat     := vNf.vItem.ffloat('qcom');
            vNf.vItem.dataSet.FieldByName('valor_unitario').Asfloat := vNf.vItem.ffloat('vuncom');
          end;

          {
          vNf.vItem.vProd.setDadosEmbalagemProduto(
            vNf.vItem.dataSet.FieldByName('grupo_prod').AsInteger,
            vNf.vItem.dataSet.FieldByName('cod_prod').AsString);

          AqCom   := vNf.vItem.dataSet.FieldByName('qtdembrec').Asfloat;
          AvUnCom := vNf.vItem.dataSet.FieldByName('valor_unitario').Asfloat;
          AuCom   := vNf.vItem.dataSet.FieldByName('unidade_nf').AsString;

          if (vNf.vItem.vProd.Conv_QtdeEAN > 0) and ( (not validarUnExata) or (vNf.vItem.vProd.Conv_UnidProduto = vNf.vItem.vProd.Emb_Conv_UnidComNF) ) then
          begin
            vNf.vItem.dataSet.FieldByName('referencia').AsString    := vNf.vItem.vProd.Conv_UnidProduto;
            vNf.vItem.dataSet.FieldByName('quantidade').Asfloat     := vNf.vItem.vProd.Conv_QtdeEAN * AqCom;
            vNf.vItem.dataSet.FieldByName('valor_unitario').Asfloat := vNf.vItem.dataSet.FieldByName('valor_total').Asfloat /
                                                                         vNf.vItem.dataSet.FieldByName('quantidade').Asfloat;
            vNf.vItem.dataSet.FieldByName('qtdemb').Asfloat         := vNf.vItem.vProd.Conv_QtdeEAN;
            vNf.vItem.dataSet.FieldByName('vlrembnf').Asfloat       := RoundTo(vNf.vItem.dataSet.FieldByName('valor_total').Asfloat / vNf.vItem.dataSet.FieldByName('qtdembrec').Asfloat, -6);
          end
          else if (AConvertEmbalagem) and (vNf.vItem.vProd.Emb_Conv_UnidComNF = Trim(AuCom)) and (vNf.vItem.vProd.Emb_Conv_Embal_Com > 0) then
          begin
            vNf.vItem.dataSet.FieldByName('referencia').AsString    := vNf.vItem.vProd.Conv_UnidProduto;
            vNf.vItem.dataSet.FieldByName('quantidade').Asfloat     := RoundTo(AqCom * vNf.vItem.vProd.Emb_Conv_Embal_Com, -4);
            vNf.vItem.dataSet.FieldByName('valor_unitario').Asfloat := RoundTo(vNf.vItem.dataSet.FieldByName('valor_total').Asfloat /
                                                                               vNf.vItem.dataSet.FieldByName('quantidade').Asfloat, -4);
            vNf.vItem.dataSet.FieldByName('qtdemb').Asfloat         := vNf.vItem.vProd.Emb_Conv_Embal_Com;
            vNf.vItem.dataSet.FieldByName('vlrembnf').Asfloat       := RoundTo(vNf.vItem.dataSet.FieldByName('valor_total').Asfloat /
                                                                               vNf.vItem.dataSet.FieldByName('qtdembrec').Asfloat, -6);
          end
          else
          begin
            vNf.vItem.dataSet.FieldByName('referencia').AsString    := AuCom;
            vNf.vItem.dataSet.FieldByName('quantidade').Asfloat     := AqCom;
            vNf.vItem.dataSet.FieldByName('valor_unitario').Asfloat := AvUnCom;
            vNf.vItem.dataSet.FieldByName('qtdemb').Asfloat         := 1;
            vNf.vItem.dataSet.FieldByName('vlrembnf').Asfloat       := RoundTo(vNf.vItem.dataSet.FieldByName('VALOR_TOTAL').Asfloat /
                                                                               vNf.vItem.dataSet.FieldByName('QTDEMBREC').Asfloat, -6);
          end;
          }
        end
        else
        begin
          {
          vNf.vItem.dataSet.FieldByName('qtdemb').Asfloat         := 1;
          vNf.vItem.dataSet.FieldByName('vlrembnf').Asfloat       := RoundTo(vNf.vItem.dataSet.FieldByName('VALOR_TOTAL').Asfloat /
                                                                             vNf.vItem.dataSet.FieldByName('QTDEMBREC').Asfloat, -6);
          }
          vNf.vItem.dataSet.FieldByName('qtdemb').Asfloat         := 0;
          vNf.vItem.dataSet.FieldByName('qtdembrec').Asfloat      := 0;
          vNf.vItem.dataSet.FieldByName('vlrembnf').Asfloat       := 0;
        end;
        {$ENDREGION}

      end
      else if vNf.dataSet.FieldByName('tipo_nf').AsString = 'V' then
      begin

        {$REGION 'Pesquisa de modelo de veiculo'}
        try
          vNf.vItem.vDetVeic.dataSet.Filter := 'nitem = ' + vNf.vItem.dataSet.FieldByName('nitem').AsString;
          vNf.vItem.vDetVeic.dataSet.Filtered := True;

          if not vNf.vItem.vDetVeic.dataSet.IsEmpty then
          begin
            vNf.vItem.vDetVeic.dataSet.Edit;

            if not vNf.vItem.verificaCorDenatram(vNf.vItem.vDetVeic.dataSet.FieldByName('cod_cor').AsInteger) then
              vNf.vItem.verificaCorDescricao;

            vNf.vItem.vDetVeic.vModV.abreModelos(vNf.vItem.vDetVeic.dataSet.FieldByName('versao').AsInteger);
            if vNf.vItem.vDetVeic.vModV.dataSet.IsEmpty then
            begin
              vNf.vItem.vDetVeic.vModV.abreModelos;
              vDadosIni.ShowAtencao('Modelo não encontrado. Por favor selecione o modelo correto');
            end
            else
              vNf.vItem.verificaModeloVeiculo(vNf);

            vNf.vItem.vDetVeic.dataSet.Post;
          end;
        finally
          vNf.vItem.vDetVeic.dataSet.Filter := '';
          vNf.vItem.vDetVeic.dataSet.Filtered := False;
        end;
        {$ENDREGION}

      end;

      isZFM := vNf.SqlOpen('select c.zfm_alc from empresa e' +
                           ' inner join cidades_ibge c on c.codigo_mun_ibge =  e.ibge_cod_cidade' +
                           ' where e.cod_empresa = %d', [vDadosIni.cod_empresa])
                           .FieldByName('zfm_alc').AsString = 'S';

      vNf.buscas.Close;
      vNf.buscas.SQL.Text := 'select n.cfop_conv, n2.alt_est, n2.calc_custo, n2.tipv_veiculo from nat_op n' +
        ' left join nat_op n2 on n2.codigo_nop = n.cfop_conv ' +
        ' where n.codigo_nop = :codigo_nop';
      vNf.buscas.ParamByName('codigo_nop').AsFloat := Trunc(vNf.vItem.dataSet.FieldByName('codigo_nop').AsFloat);
      vNf.buscas.Open;
      if vNf.buscas.FieldByName('cfop_conv').AsFloat <= 0 then
      begin
        AListCFOP.Add(IntToStr(Trunc(vNf.vItem.dataSet.FieldByName('codigo_nop').AsFloat)));
        vNf.vItem.dataSet.FieldByName('codigo_nop').AsFloat         := 0;
      end
      else
        vNf.vItem.dataSet.FieldByName('codigo_nop').AsFloat         := vNf.buscas.FieldByName('cfop_conv').AsFloat;
      vNf.vItem.dataSet.FieldByName('altera_estoque_cfop').AsString := vNf.buscas.FieldByName('alt_est').AsString;
      vNf.vItem.dataSet.FieldByName('altera_custo_cfop').AsString   := vNf.buscas.FieldByName('calc_custo').AsString;
      vNf.vItem.dataSet.FieldByName('tipv_veiculo').AsString        := vNf.buscas.FieldByName('tipv_veiculo').AsString;

      if vNf.vItem.dataSet.FieldByName('rateio_desconto').AsFloat > 0 then
        vNf.dataSet.FieldByName('tipo_desconto').AsString := 'I';

      if vNf.vItem.ffloat('rateio_seguro' ) > 0 then vNf.dataSet.FieldByName('tipo_seguro').AsString := 'I';
      if vNf.vItem.ffloat('rateio_outdesp') > 0 then vNf.dataSet.FieldByName('tipo_outdesp').AsString := 'I';
      if vNf.vItem.ffloat('rateio_frete'  ) > 0 then vNf.dataSet.FieldByName('tipo_frete').AsString := 'I';

      if (vNf.dataSet.FieldByName('codigo_nop').AsFloat = 0) and
         (vNf.vItem.dataSet.FieldByName('codigo_nop').AsFloat > 0) then
        vNf.dataSet.FieldByName('codigo_nop').AsFloat := vNf.vItem.dataSet.FieldByName('codigo_nop').AsFloat;

      if (vdadosini.vEmp.vDesconsiderarICMSNfEnt = 'S') and (vNf.dataSet.FieldByName('tipo_nf').AsString <> 'V') then
      begin
        vNf.vItem.dataSet.FieldByName('base_icm').AsFloat := 0;
        vNf.vItem.dataSet.FieldByName('aliq_icm').AsFloat := 0;
        vNf.vItem.dataSet.FieldByName('valor_icm').AsFloat := 0;
        vNf.vItem.dataSet.FieldByName('fcp_pfcp').AsFloat := 0;
        vNf.vItem.dataSet.FieldByName('fcp_vfcp').AsFloat := 0;
        vNf.vItem.dataSet.FieldByName('fcp_vbcfcp').AsFloat := 0;
      end
      else if (not vNf.vItem.fempty('icm_csosn'))
        and (confEscrSN.ReadString('ICMSSN', 'NaoEscriturarIcmsProprioEmitenteSimplesNacional') = 'S') then
      begin
        vNf.vItem.dataSet.FieldByName('base_icm').AsFloat := 0;
        vNf.vItem.dataSet.FieldByName('aliq_icm').AsFloat := 0;
        vNf.vItem.dataSet.FieldByName('valor_icm').AsFloat := 0;
      end;      

      //teste do 
      if isZFM and (vNf.Config.Conf_Geral.nf_desoneracao_zfm_alc.ReadString('PISCOFINS', 'EntradaXmlConvertDescontoEmDesoneracao') = 'S') and
        (vNf.vItem.ffloat('valor_pis') = 0) and (vNf.vItem.ffloat('valor_cofins') = 0) and (vNf.vItem.ffloat('rateio_desconto') > 0) then
      begin
        vliq := vNf.vItem.ffloat('valor_total') + vNf.vItem.ffloat('rateio_seguro') + vNf.vItem.ffloat('rateio_outdesp') + vNf.vItem.ffloat('rateio_frete');
                      
        for I := 1 to 4 do
        begin
          if I = 3 then
            vliq := vliq + vNf.vItem.ffloat('valor_ipi');

          ppis    := IfThen(I mod 2 = 0, 1.65, 0.65);
          pcofins := IfThen(I mod 2 = 0, 7.60, 3.00);

          pisCalc    := ppis    * vliq / 100;
          cofinsCalc := pcofins * vliq / 100;

          if Abs((pisCalc + cofinsCalc) - vNf.vItem.ffloat('rateio_desconto')) <= 0.02 then
          begin
            vNf.vItem.dataSet.FieldByName('motdes_pc').AsInteger     := 7;
            vNf.vItem.dataSet.FieldByName('ppisdeson').AsFloat       := ppis;
            vNf.vItem.dataSet.FieldByName('pcofinsdeson').AsFloat    := pcofins;
            vNf.vItem.dataSet.FieldByName('vpisdeson').AsFloat       := RoundTo(pisCalc, -2);
            vNf.vItem.dataSet.FieldByName('vcofinsdeson').AsFloat    := RoundTo(vNf.vItem.ffloat('rateio_desconto') - vNf.vItem.ffloat('vpisdeson'), -2);
            vNf.vItem.dataSet.FieldByName('rateio_desconto').AsFloat := 0;
            vNf.vItem.dataSet.FieldByName('tipo_calc_pc').AsInteger  := ord(tcNenhum);

            vNf.vItem.dataSet.FieldByName('vpisdeson').AsFloat       := vNf.ffloat('vpisdeson') + vNf.vItem.ffloat('vpisdeson');
            vNf.vItem.dataSet.FieldByName('vcofinsdeson').AsFloat    := vNf.ffloat('vcofinsdeson') + vNf.vItem.ffloat('vcofinsdeson');
            Break;
          end;
        end;      
      end;

      if vNf.fnull('dfe_trib_ignorar') then // Nenhum item tem dfe_trib_id, entao ignora
        vNf.dataSet.FieldByName('dfe_trib_ignorar').AsInteger := Ord(ynYes);

      if vNf.vItem.dataSet.FieldByName('indtot').Value <> 0 then
        vNf.vItem.calcucarAntecipacaoTributariaST(vNf, opdImportacaoXML);

      vNf.vItem.calcucarReconposicaoDeICMS(vNf);

      ABaseIPI := ABaseIPI + vNf.vItem.dataSet.FieldByName('base_ipi').AsFloat;

      vNf.vItem.FSemCodigo := False;
      if vNf.vItem.dataSet.State in [dsInsert, dsEdit] then
        vNf.vItem.Post;
      vNf.vItem.dataSet.Next;
    end;
    vNf.vItem.FSemCodigo := False;

    if vNf.dataSet.FieldByName('tipo_nf').AsString = 'P' then
    begin
      vNf.vItem.FSemCodigo := True;
      vNf.vItem.prepare_loop();
      Apros := TProdutos_tmp_classList.Create;
      try
        while not vNf.vItem.dataSet.Eof do
        begin
          if vNf.vItem.fequals('tipo_item', 'P') then
          begin
            if not vNf.SqlOpen('select pd.grupo_prod_acabado, pd.cod_prod_acabado from produtos_desmembramento pd' +
                               ' inner join produtos p on p.grupo_prod = pd.grupo_prod_mprima and p.cod_prod = pd.cod_prod_mprima and p.cod_empresa = pd.cod_empresa' +
                               ' where pd.grupo_prod_acabado = %d' +
                               ' and pd.cod_prod_acabado = %s' +
                               ' and pd.cod_empresa = %d',
                               [vNf.vItem.fint('grupo_prod'), vNf.vItem.fstrq('cod_prod'), vDadosIni.cod_empresa]).IsEmpty then
              with Apros.New do
              begin
                grupo_prod := vNf.vItem.fint('grupo_prod');
                cod_prod   := vNf.vItem.fstr('cod_prod');
              end;
          end;
          vNf.vItem.dataSet.Next;
        end;

        for I := 0 to Apros.Count - 1 do with Apros.Items[I] do
          if vNf.vItem.dataSet.Locate('GRUPO_PROD;COD_PROD', VarArrayOf([grupo_prod, cod_prod]), []) then
          begin
            vNf.vItem.FSemCodigo := True;
            vNf.vItem.Post;
          end;
      finally
        Apros.Clear;
        Apros.Free;
        vNf.vItem.FSemCodigo := False;
        vNf.vItem.prepare_loop_done();
      end;
    end;
    {$ENDREGION}

    {$REGION 'Processando cabeçalho'}
    vNf.dataSet.FieldByName('base_ipi').AsFloat := ABaseIPI;
    vNf.dataSet.FieldByName('status').AsString := 'Aberta';
    vNf.dataSet.FieldByName('ativo').AsInteger := 1;

    if (vdadosini.vEmp.vDesconsiderarICMSNfEnt = 'S') and (vNf.dataSet.FieldByName('tipo_nf').AsString <> 'V') then
    begin
      vNf.dataSet.FieldByName('aliq_icm').AsFloat := 0;
      vNf.dataSet.FieldByName('base_icm').AsFloat := 0;
      vNf.dataSet.FieldByName('valor_icm').AsFloat := 0;
    end;
    {$ENDREGION}

    try
      vNf.dataSet.Post;
      Asucess := vNf.Apply and vNf.vItem.Apply;

      if Asucess and (vNf.dataSet.FieldByName('tipo_nf').AsString = 'V') and (vNf.vItem.vDetVeic.dataSet.ChangeCount > 0) then
        Asucess := vNf.vItem.vDetVeic.Apply;

      if Asucess then
      begin
        vNf.CommitaTransacao;
        vNf.selecionaNotaFiscal(ACodNF);
        vNf.vItem.selecionaItens(ACodNF);
        vNf.dataSet.Edit;
        Result := True;
      end
      else
      begin
        vNf.RollBackTransacao;
        raise Exception.Create('Erro ao importar xml. Por favor repita a operação');
      end;
    except on E: Exception do
      begin
        vDadosIni.ShowErro('Erro na importação do xml. Erro ' + e.Message);
        vDadosIni.registraErro('TXmlImport.montarNfNovo ' + e.Message);
      end;
    end;
    //Result := True;

    if AListCFOP.Count > 0 then
      vDadosIni.ShowAtencao('Nota Fiscal não encontrou CFOP de conversão no cadastro de CFOP. ' + #13 +
        'Favor atualizar esta tabela.(Ex.: CFOP=6401 CFOP CONVERSÃO=2401)' + #13 + 'Lista abaixo' + #13 + #13 +
        AListCFOP.Text);

  finally
    FreeAndNil(AListCFOP);
  end;
  {$ENDREGION}

end;

function TXmlImport.montarNfNovoSaida(vNf: TNFCab;
  VArquivoXml: string; vMemo: TMemo): boolean;
var
  AListParams: TStrings;
  ACodNF, I: Integer;
  ARetorno: string;
  ABaseIPI, AqCom, AvUnCom: Double;
  AuCom, AcEAN, entSai: string;
  ACadProdAberto: boolean;
  AAltDescricaoItem, AExecutarDLL, AConvertEmbalagem, Asucess: Boolean;

  function _mdiAbertoSemMensagem(pNomeFormMDI: string): Boolean;
  var
    x: Byte;
  begin
    Result := True;
    if Application.MainForm.MDIChildCount > 0 then
      for X := 0 to Pred(Application.MainForm.MDIChildCount) do
        if UpperCase(Application.MainForm.MDIChildren[X].ClassName) =
          UpperCase(pNomeFormMDI) then
        begin
          Result := False;
          Exit;
        end;
  end;

begin
  Result := False;

  ACodNF := 0;

  {$REGION 'Importacao da nota via xml pela dll'}
  if not FileExists(VArquivoXml) then
    Exit;

  AExecutarDLL := True;
  if vNf.ExecutaComandosSql('select cod_nf, cod_empresa, status, situacao_nfe from notafiscal' +
    ' where path_xml_import = ' + QuotedStr(Trim(Copy(VArquivoXml, 1, 256))) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa, False) then
  begin
    ACodNF := vNf.buscas.FieldByName('cod_nf').AsInteger;
    if vNf.buscas.FieldByName('status').AsString = 'PreNotaXML' then
    begin
      if not vNf.ExecutaComandosSqlExec('delete from notafiscal_item' +
        ' where cod_nf = ' + IntToStr(ACodNF) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa) then
      begin
        vNf.RollBackTransacao;
        Exit;
      end;
      if not vNf.ExecutaComandosSqlExec('update notafiscal set status = ''ImportaXML'', num_nf = cod_nf, serie = '''', modelo_nf = null, chave_nfe = null' +
        ' where cod_nf = ' + IntToStr(ACodNF) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa +
        ' and status = ''PreNotaXML''') then
      begin
        vNf.RollBackTransacao;
        Exit;
      end;
      AExecutarDLL := vNf.ExecutaComandosSql('select cod_nf, status from notafiscal' +
        ' where cod_nf = ' + IntToStr(ACodNF) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa +
        ' and status = ''ImportaXML''', False);
      if AExecutarDLL then
        vNf.CommitaTransacao
      else
      begin
        vNf.RollBackTransacao;
        Exit;
      end;
    end
    else if (vNf.buscas.FieldByName('status').AsString = 'Fechada')
    	and (vNf.buscas.FieldByName('situacao_nfe').AsString = 'Autorizada')  then
    begin
      Result := True;
      Exit;
    end;
  end
  else
  begin
    {$REGION 'Excluindo notas que não foram usadas'}
    //Notas do dia anterior
    vNf.ExecutaComandosSqlExec('delete from notafiscal' +
      ' where status in (''ImportaXML'', ''PreNotaXML'')' +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and data_lanc < ' + vDadosIni.FusoSqlDate);
    //Notas do usuário q nao foram usadas
    vNf.ExecutaComandosSqlExec('delete from notafiscal' +
      ' where status in (''ImportaXML'', ''PreNotaXML'')' +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and cod_usuario = ' + IntToStr(vDadosIni.vCodUsuario));
    {$ENDREGION}

    AListParams := TStringList.Create;
    try
      AListParams.LoadFromFile(VArquivoXml);

      if ContainsText(AListParams.Text, '<tpNF>0</tpNF>') then
        entSai := 'E'
      else
       entSai := 'S';
    finally
      FreeAndNil(AListParams);
    end;

    if not vNf.incluirNf(tnfProdutos, 'P', entSai[1]) then
      Exit;

    vNf.dataSet.FieldByName('status').AsString := 'ImportaXML';

    if not vNf.ExecutaComandosSql( 'select cod_cliente from clientes' +
      ' where cpfcgc = ' + QuotedStr(vDadosIni.vEmp.vCNPJ) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa, False) then
      vNf.ExecutaComandosSql( 'select first 1 cod_cliente from clientes' +
        ' where cod_empresa = ' + vDadosIni.codEmpresa, False);
    vNf.dataSet.FieldByName('cod_cliente').AsInteger := vNf.buscas.FieldByName('cod_cliente').AsInteger;

    vNf.ExecutaComandosSql('select cod from incrementa_codigo(' + vDadosIni.codEmpresa + ', ' + QuotedStr('NOTAFISCAL') + ')', False);
    ACodNF := vNf.buscas.FieldByName('cod').AsInteger;
    vNf.dataSet.FieldByName('cod_nf').Value := ACodNF;
    vNf.dataSet.FieldByName('num_nf').Value := ACodNF;
    vNf.dataSet.FieldByName('path_xml_import').AsString := VArquivoXml;
    vNf.dataSet.FieldByName('ativo').Value := 0;
    vNf.dataSet.FieldByName('dest_seqid').AsInteger := 0;
    vNf.dataSet.FieldByName('num_gerado').AsString := 'S';
    vNf.dataSet.FieldByName('emissao_propria').AsString := 'S';
    vNf.dataSet.Post;
    if vNf.Apply then
      vNf.CommitaTransacao
    else
    begin
      vNf.RollBackTransacao;
      Exit;
    end;
  end;

  if AExecutarDLL then
  begin
    AListParams := TStringList.Create;
    try
    	ACadProdAberto := not _mdiAbertoSemMensagem('TFrmCadProdutos');

      AListParams.Clear;
      AListParams.Add('ASisAuto=' + BoolToStr(vDadosIni.vSistemasUsuario.vSisAutomacao, True));
      AListParams.Add('ASisVeic=' + BoolToStr(vDadosIni.vSistemasUsuario.vSisVeiculos, True));
      AListParams.Add('AUsarCorFabDenatran=' + BoolToStr(vDadosIni.vEmp.vUsarCorFabDenatran= 'S', True));
      AListParams.Add('ACodEmpresa=' + vDadosIni.codEmpresa);
      AListParams.Add('ACodUsuario=' + IntToStr(vDadosIni.vCodUsuario));
      AListParams.Add('ACodNF=' + IntToStr(ACodNF));
      AListParams.Add('AUsuario=' + trim(vDadosIni.vNomeUsuario));
      AListParams.Add('ANivel=' + IntToStr(vDadosIni.vNivel));
      AListParams.Add('ACNPJ=' + vDadosIni.vEmp.vCNPJ);
      AListParams.Add('AUFDest=' + vDadosIni.vEmp.vSiglaUF);
      AListParams.Add('AFileName=' + VArquivoXml);
      AListParams.Add('ADabaseName=' + vDadosIni.vBancoHW);
      AListParams.Add('ABuscaCodNoProduto=' + BoolToStr(vDadosIni.vEmp.vBuscaCodNoProduto = 'S', True));
      AListParams.Add('ADigitosProd=' + vDadosIni.vProduto.vDigitosProd);
      if vDadosIni.vEmp.vUsarCodigoSequencialProduto = 'S' then
	     	AListParams.Add('AUsarCodigoSequencialProduto=S')
      else
      	AListParams.Add('AUsarCodigoSequencialProduto=N');
      AListParams.Add('ACadProdAberto=' + vDadosIni.IfThen(ACadProdAberto, 'S', 'N'));
      AListParams.Add('ANatureza=S');
      AListParams.Add('CNPJsEntrada=' + vNf.Config.Conf_Geral.nf_e_cnpj_import_xml.ReadString('EntradaNF', 'CNPJs'));
      AListParams.Add('CNPJsCadastroProduto=' + vNf.Config.Conf_Geral.nf_e_cnpj_import_xml.ReadString('CadastroProdutos', 'CNPJs'));
      AListParams.Values['EntradaOuSaida'] := entSai;

      if IniConf.ReadStr('MD', 'LogImportXML') = 'S' then
        AListParams.SaveToFile(ExtractFilePath(Application.ExeName) + 'LogImportSaidaXML.txt');

      ARetorno := Abstracao_hw_LerXMLNFe(AListParams.Text);
      if ARetorno <> 'OK' then
      begin
        vDadosIni.ShowErro(vDadosIni.getCampoPipe(ARetorno + '|', 2));

        vMemo.Lines.Add(vDadosIni.getCampoPipe(ARetorno + '|', 2));
        Exit;
      end;
    finally
      FreeAndNil(AListParams);
    end;
  end;
  {$ENDREGION}

  {$REGION 'Validações e processamentos apos a importacao'}
  vNf.selecionaNotaFiscal(ACodNF);
  if vNf.dataSet.FieldByName('cod_nf').AsInteger <> ACodNF then
  begin
    vDadosIni.ShowErro('Não foi possível selecionar a nota fiscal');
    Exit;
  end;

  if vNf.dataSet.FieldByName('tipo_nf').AsString = 'V' then
  begin
    vDadosIni.ShowErro('Opção não disponível para nota fical de veículos');
    Exit;
  end;

  vNf.vItem.selecionaItens(ACodNF);
  vNf.Edit;
  vNf.dataSet.FieldByName('dfe_trib_ignorar').Clear; // Nos itens vai tratar
//  for I := 0 to Pred(vNf.vClFor.EndDoc.lista.Count) do with vNf.vClFor.EndDoc.lista.Items[I] do
//    if (vNf.dataSet.FieldByName('cod_cliente').AsInteger = cod_cliente) and
//       (vNf.dataSet.FieldByName('dest_seqid').AsInteger = dest_seqid) then
//      vNf.vClFor.SetDadosDestinatario(vNf.vClFor.EndDoc.lista.Items[I]);

  ABaseIPI := 0;
  AConvertEmbalagem := false;//vDadosIni.getConfSisBool('nf_e_hab_conversao_embalagem_produto', vNf.buscas);
  AAltDescricaoItem := ((vDadosIni.PesqPros('NF0172', 'ALTERAR', 'ALTERAR DESCRICAO PROD ENTRADA NF', 'NOTAFISCAL',
                         vNf.vItem.dataSet.FieldByName('COD_NF').AsString, vNf.buscas, True, False, True)) or
                         (vDadosIni.vEmp.vUsarConferenciaCegaSaida = 'S1'));

  try
    {$REGION 'Processando itens'}
    vNf.vItem.dataSet.First;
    while not vNf.vItem.dataSet.Eof do
    begin
      if vNf.fnull('dfe_trib_ignorar') and not vNf.vItem.fempty('dfe_trib_id') then
        vNf.dataSet.FieldByName('dfe_trib_ignorar').AsInteger := Ord(ynNo);

      vNf.vItem.dataSet.Edit;
      vNf.vItem.dataSet.FieldByName('ucom').AsString       := AnsiUpperCase(vNf.vItem.fstr('ucom'));
      vNf.vItem.dataSet.FieldByName('unidade_nf').AsString := AnsiUpperCase(vNf.vItem.fstr('unidade_nf'));
      vNf.vItem.dataSet.FieldByName('referencia').AsString := AnsiUpperCase(vNf.vItem.fstr('referencia'));

      AcEAN := vNf.vItem.fstr('num_fab_prod');
      AcEAN := IfThen(AcEAN <> 'SEM GTIN', AcEAN);
      AuCom := vNf.vItem.dataSet.FieldByName('ucom').AsString;
      vNf.vItem.dataSet.FieldByName('num_fab_prod').AsString := '';

      if vNf.dataSet.FieldByName('tipo_nf').AsString = 'P' then
      begin

        {$REGION 'Pesquisa do produto'}
        vNf.vItem.vProd.Conv_QtdeEAN := 0;
        if (AcEAN <> '') and
          (vNf.vItem.vProd.buscaProdutoParaConversao( AcEAN, AuCom,
          vNf.vItem.dataSet.FieldByName('nitem').AsInteger)) and
          (vNf.vItem.vProd.Conv_QtdeEAN > 0) and
          (vNf.vItem.vProd.dataSet.RecordCount > 0) then
        begin
          //codigo abaixo
        end
        else if (vDadosIni.vEmp.vBuscaCodNoProduto <> 'S') and
          (vNf.getCodigoPeloCodFornecedorSaida(vNf.vItem.dataSet.FieldByName('num_fab_fornecedor').AsString) <> '') and
          (not vnf.vProdForn.dataSet.IsEmpty) then
        begin
          vNf.vItem.vProd.buscaProduto(vnf.vProdForn.dataSet.FieldByName('grupo_prod').AsInteger,
                                       vnf.vProdForn.dataSet.FieldByName('cod_prod').AsString);
          vNf.vItem.vProd.vCodGrade := vnf.vProdForn.vCodGrade;
        end
        else
        begin
          if vNf.vItem.vProd.buscaProdutoSaida(vNf.vItem.fstr('num_fab_fornecedor')) then
            //codigo abaixo

          else if (AcEAN <> '') and vNf.vItem.vProd.buscaProdutoSaida(AcEAN)  then

          else
          begin
            if vNf.getCodigoPeloCodFornecedorSaida(vNf.vItem.dataSet.FieldByName('num_fab_fornecedor').AsString) <> '' then;
              if not vnf.vProdForn.dataSet.IsEmpty  then
              begin
                vNf.vItem.vProd.buscaProduto(vnf.vProdForn.dataSet.FieldByName('grupo_prod').AsInteger,
                                             vnf.vProdForn.dataSet.FieldByName('cod_prod').AsString);
                vNf.vItem.vProd.vCodGrade := vnf.vProdForn.vCodGrade;
              end;
          end;
        end;

        if vnf.vItem.vProd.dataSet.IsEmpty then
           raise Exception.CreateFmt('Produto não encontrado, Nº Item: "%d" EAN: "%s" Código "%s"', [vNf.vItem.fint('nitem'), AcEAN, vNf.vItem.fstr('num_fab_fornecedor')])

        else if not vnf.vItem.vProd.dataSet.IsEmpty then
        begin
          if AAltDescricaoItem then
            vNf.vItem.dataSet.FieldByName('descricao_item').AsString := uppercase(trim(vnf.vItem.vProd.dataSet.FieldByName('descr_prod').AsString));
          vNf.vItem.dataSet.FieldByName('num_fab_prod').AsString     := vNf.vItem.vProd.dataSet.FieldByName('num_fab_prod').AsString;
          vNf.vItem.dataSet.FieldByName('cod_prod').AsString         := vNf.vItem.vProd.dataSet.FieldByName('cod_prod').AsString;
          vNf.vItem.dataSet.FieldByName('grupo_prod').AsString       := vNf.vItem.vProd.dataSet.FieldByName('grupo_prod').AsString;
          vNf.vItem.dataSet.FieldByName('consumo').AsString          := vnf.vItem.vProd.dataSet.FieldByName('consumo').AsString;
          vNf.vItem.dataSet.FieldByName('cod_grade').AsInteger       := vnf.vItem.vProd.vCodGrade;
          vNf.vItem.dataSet.FieldByName('ecf').AsString              := IfThen(Trim(vDadosIni.vEmp.vCredencInterventor) <> '', vnf.vItem.vProd.dataSet.FieldByName('ecf').AsString);

//          vNf.vItem.vProd.setDadosEmbalagemProduto(
//            vNf.vItem.dataSet.FieldByName('grupo_prod').AsInteger,
//            vNf.vItem.dataSet.FieldByName('cod_prod').AsString);

          AqCom   := vNf.vItem.dataSet.FieldByName('qtdembrec').Asfloat;
          AvUnCom := vNf.vItem.dataSet.FieldByName('valor_unitario').Asfloat;
          AuCom   := vNf.vItem.dataSet.FieldByName('unidade_nf').AsString;

          vNf.vItem.vProd.Conv_QtdeEAN := 0; // Nao faz sentido ter conversao na saida
          if vNf.vItem.vProd.Conv_QtdeEAN > 0 then
          begin
            vNf.vItem.dataSet.FieldByName('referencia').AsString    := vNf.vItem.vProd.Conv_UnidProduto;
            vNf.vItem.dataSet.FieldByName('quantidade').Asfloat     := vNf.vItem.vProd.Conv_QtdeEAN * AqCom;
            vNf.vItem.dataSet.FieldByName('valor_unitario').Asfloat := vNf.vItem.dataSet.FieldByName('valor_total').Asfloat /
                                                                         vNf.vItem.dataSet.FieldByName('quantidade').Asfloat;
            vNf.vItem.dataSet.FieldByName('qtdemb').Asfloat         := vNf.vItem.vProd.Conv_QtdeEAN;
            vNf.vItem.dataSet.FieldByName('vlrembnf').Asfloat       := RoundTo(vNf.vItem.dataSet.FieldByName('valor_total').Asfloat / vNf.vItem.dataSet.FieldByName('qtdembrec').Asfloat, -6);
          end
          else if (AConvertEmbalagem) and (vNf.vItem.vProd.Emb_Conv_UnidComNF = Trim(AuCom)) and (vNf.vItem.vProd.Emb_Conv_Embal_Com > 0) then
          begin
            vNf.vItem.dataSet.FieldByName('referencia').AsString    := vNf.vItem.vProd.Conv_UnidProduto;
            vNf.vItem.dataSet.FieldByName('quantidade').Asfloat     := RoundTo(AqCom * vNf.vItem.vProd.Emb_Conv_Embal_Com, -4);
            vNf.vItem.dataSet.FieldByName('valor_unitario').Asfloat := RoundTo(vNf.vItem.dataSet.FieldByName('valor_total').Asfloat /
                                                                               vNf.vItem.dataSet.FieldByName('quantidade').Asfloat, -4);
            vNf.vItem.dataSet.FieldByName('qtdemb').Asfloat         := vNf.vItem.vProd.Emb_Conv_Embal_Com;
            vNf.vItem.dataSet.FieldByName('vlrembnf').Asfloat       := RoundTo(vNf.vItem.dataSet.FieldByName('valor_total').Asfloat /
                                                                               vNf.vItem.dataSet.FieldByName('qtdembrec').Asfloat, -6);
          end
          else
          begin
            vNf.vItem.dataSet.FieldByName('referencia').AsString    := AuCom;
            vNf.vItem.dataSet.FieldByName('quantidade').Asfloat     := AqCom;
            vNf.vItem.dataSet.FieldByName('valor_unitario').Asfloat := AvUnCom;
            vNf.vItem.dataSet.FieldByName('qtdemb').Asfloat         := 1;
            vNf.vItem.dataSet.FieldByName('vlrembnf').Asfloat       := RoundTo(vNf.vItem.dataSet.FieldByName('VALOR_TOTAL').Asfloat /
                                                                               vNf.vItem.dataSet.FieldByName('QTDEMBREC').Asfloat, -6);
          end;
        end
        else
        begin
          vNf.vItem.dataSet.FieldByName('qtdemb').Asfloat         := 1;
          vNf.vItem.dataSet.FieldByName('vlrembnf').Asfloat       := RoundTo(vNf.vItem.dataSet.FieldByName('VALOR_TOTAL').Asfloat /
                                                                             vNf.vItem.dataSet.FieldByName('QTDEMBREC').Asfloat, -6);
        end;
        {$ENDREGION}

      end
      else if vNf.dataSet.FieldByName('tipo_nf').AsString = 'V' then
      begin

        {$REGION 'Pesquisa de modelo de veiculo'}
        try
          vNf.vItem.vDetVeic.dataSet.Filter := 'nitem = ' + vNf.vItem.dataSet.FieldByName('nitem').AsString;
          vNf.vItem.vDetVeic.dataSet.Filtered := True;

          if not vNf.vItem.vDetVeic.dataSet.IsEmpty then
          begin
            vNf.vItem.vDetVeic.dataSet.Edit;

            if not vNf.vItem.verificaCorDenatram(vNf.vItem.vDetVeic.dataSet.FieldByName('cod_cor').AsInteger) then
              vNf.vItem.verificaCorDescricao;

            vNf.vItem.vDetVeic.vModV.abreModelos(vNf.vItem.vDetVeic.dataSet.FieldByName('versao').AsInteger);
            if vNf.vItem.vDetVeic.vModV.dataSet.IsEmpty then
            begin
              vNf.vItem.vDetVeic.vModV.abreModelos;
              vDadosIni.ShowAtencao('Modelo não encontrado. Por favor selecione o modelo correto');
            end
            else
              vNf.vItem.verificaModeloVeiculo(vNf);

            vNf.vItem.vDetVeic.dataSet.Post;
          end;
        finally
          vNf.vItem.vDetVeic.dataSet.Filter := '';
          vNf.vItem.vDetVeic.dataSet.Filtered := False;
        end;
        {$ENDREGION}

      end;

      vNf.buscas.Close;
      vNf.buscas.SQL.Text := 'select n.codigo_nop, n2.alt_est, n2.calc_custo, n2.tipv_veiculo from nat_op n' +
        ' left join nat_op n2 on n2.codigo_nop = n.cfop_conv ' +
        ' where n.codigo_nop = :codigo_nop';
      vNf.buscas.ParamByName('codigo_nop').AsFloat := Trunc(vNf.vItem.dataSet.FieldByName('codigo_nop').AsFloat);
      vNf.buscas.Open;

      vNf.vItem.dataSet.FieldByName('codigo_nop').AsFloat           := vNf.vItem.dataSet.FieldByName('codigo_nop').AsFloat;
      vNf.vItem.dataSet.FieldByName('altera_estoque_cfop').AsString := 'N';
      vNf.vItem.dataSet.FieldByName('altera_custo_cfop').AsString   := 'N';
      vNf.vItem.dataSet.FieldByName('tipv_veiculo').AsString        := vNf.buscas.FieldByName('tipv_veiculo').AsString;

      if vNf.vItem.dataSet.FieldByName('rateio_desconto').AsFloat > 0 then
        vNf.dataSet.FieldByName('tipo_desconto').AsString := 'I';

      if vNf.vItem.ffloat('rateio_seguro' ) > 0 then vNf.dataSet.FieldByName('tipo_seguro').AsString := 'I';
      if vNf.vItem.ffloat('rateio_outdesp') > 0 then vNf.dataSet.FieldByName('tipo_outdesp').AsString := 'I';
      if vNf.vItem.ffloat('rateio_frete'  ) > 0 then vNf.dataSet.FieldByName('tipo_frete').AsString := 'I';

      if (vNf.dataSet.FieldByName('codigo_nop').AsFloat = 0) and
         (vNf.vItem.dataSet.FieldByName('codigo_nop').AsFloat > 0) then
        vNf.dataSet.FieldByName('codigo_nop').AsFloat := vNf.vItem.dataSet.FieldByName('codigo_nop').AsFloat;

//      if vNf.vItem.dataSet.FieldByName('indtot').Value <> 0 then
//        vNf.vItem.calcucarAntecipacaoTributariaST(vNf, opdImportacaoXML);
//      vNf.vItem.calcucarReconposicaoDeICMS(vNf);
//      ABaseIPI := ABaseIPI + vNf.vItem.dataSet.FieldByName('base_ipi').AsFloat;

      vNf.vItem.FSemCodigo := True;
      if vNf.vItem.dataSet.State in [dsInsert, dsEdit] then
        vNf.vItem.Post;
      vNf.vItem.dataSet.Next;
    end;
    vNf.vItem.FSemCodigo := False;
    {$ENDREGION}

    {$REGION 'Processando cabeçalho'}
    if vNf.fnull('dfe_trib_ignorar') then // Nenhum item tem dfe_trib_id, entao ignora
      vNf.dataSet.FieldByName('dfe_trib_ignorar').AsInteger := Ord(ynYes);

//    vNf.dataSet.FieldByName('base_ipi').AsFloat := ABaseIPI;
    vNf.dataSet.FieldByName('status').AsString := 'Fechada';
    vNf.dataSet.FieldByName('situacao_nfe').AsString := 'Autorizada';
    vNf.dataSet.FieldByName('ativo').AsInteger := 1;
    vNf.dataSet.FieldByName('data_lanc').AsDateTime := vNf.dataSet.FieldByName('data_contabil').AsDateTime;
    vNf.vClFor.selecionaClFor;
    vNf.vClFor.SetDadosDestinatario(vNf.vClFor.EndDoc.lista.Items[0], True);


    {$ENDREGION}

    try
      vNf.dataSet.Post;
      Asucess := vNf.vItem.Apply and vNf.Apply;

      if Asucess and (vNf.dataSet.FieldByName('tipo_nf').AsString = 'V') then
        Asucess := vNf.vItem.vDetVeic.Apply;

      if Asucess then
      begin
        vNf.CommitaTransacao;
        vDadosIni.GravaAuditoria('NF0219', 'IMPORTAR', 'SUCESSO', 'NOTAFISCAL', IntToStr(ACodNF), vNf._buscas);
//        vNf.selecionaNotaFiscal(ACodNF);
//        vNf.vItem.selecionaItens(ACodNF);
//        vNf.dataSet.Edit;
        Result := True;
      end
      else
      begin
        vNf.RollBackTransacao;
        vDadosIni.GravaAuditoria('NF0219', 'IMPORTAR', 'FALHA', 'NOTAFISCAL', IntToStr(ACodNF), vNf._buscas);
        
        raise Exception.Create('Erro ao importar xml. Por favor repita a operação');
      end;
    except on E: Exception do
      begin
        vDadosIni.ShowErro('Erro na importação do xml. Erro ' + e.Message);
        vDadosIni.registraErro('TXmlImport.montarNfNovoSaida ' + e.Message);
      end;
    end;
    //Result := True;
  finally
  end;
  {$ENDREGION}
end;


function TXmlImport.montarPreNota(vArquivoXml: string; pCodNF, pCodEmpresaGravar: Integer; pCommit: Boolean): boolean;
var
  vOK, vDesconsiderarICMS, vNewNF: Boolean;
  vNumCredInterventor, vBuscaCodNoProduto: string;
  I: Integer;
  formulario: TForm;
  hdTemp: THandle;
  vCodFornecedor: Integer;
  tribHandlerGetter: ITributosHandler;
  tribHandlerSetter: ITributosPersistentHandler;
  tribDFe: TributoDFeContextEtd;
  ignorarTribDFe: YesNoEnum;
begin
  Result := True;
  try
    vNota := TNFCab.create;
    vNota.dataSet := TClientDataSet(dtmNF.cdsTmp1);
    vNota.vItem.dataSet := TClientDataSet(dtmNF.cdsTmp2);
    vNota.vItem.vDetVeic.dataSet := TClientDataSet(dtmNF.cdsTmp3);

    vOK := False;

    if Trim(vArquivoXml) = '' then
    begin
      try
        vNota.montaSelect(' select * from notafiscal' +
          ' where cod_nf = ' + IntToStr(pCodNF) +
          ' and cod_empresa=  ' + vDadosIni.codEmpresa);

        vNota.vItem.montaSelect(' select * from notafiscal_item' +
          ' where cod_nf = ' + IntToStr(vNota.dataSet.FieldByName('cod_nf').AsInteger) +
          ' and cod_empresa =  ' + vDadosIni.codEmpresa);

        vNota.vItem.vDetVeic.montaSelect(' select * from notafiscal_item_veiculo' +
          ' where cod_nf = ' + IntToStr(vNota.dataSet.FieldByName('cod_nf').AsInteger) +
          ' and cod_empresa =  ' + vDadosIni.codEmpresa);

        if vNota.dataSet.FieldByName('TIPO_NF').AsString = 'V' then
        begin
          vNota.vItem.vDetVeic.dataSet.First;
          while not vNota.vItem.vDetVeic.dataset.Eof do
          begin
            vNota.buscas.Close;
            vNota.buscas.SQL.Text := ' SELECT FIRST 1 CODIGO FROM TIPMODELO ' +
             ' WHERE CODIGO = ' + IntToStr(vNota.vItem.vDetVeic.dataset.FieldByName('VERSAO').AsInteger) +
             ' AND COD_EMPRESA =  ' + IntToStr(pCodEmpresaGravar);
            vNota.buscas.Open;

            if vNota.buscas.IsEmpty then
            begin
              if (vDadosIni.vEmp.vVersaoVeiculos = '4') then
                Result := Application.MessageBox(PChar('O sistema está tentando gerar uma pré-nota na empresa de destino. ' +
                 #13 + 'Modelo de veículo não encontrado na empresa de destino:' +
                 '"' + IntToStr(vNota.vItem.vDetVeic.dataset.FieldByName('VERSAO').AsInteger) +
                 ' - ' + trim(vNota.vItem.vDetVeic.dataset.FieldByName('DESCRICAO_VERSAO').AsString) + '".'+
                 #13 + 'Deseja obter os dados agora?'), 'Atenção', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1) = IDYES
              else
                Result := False;

              if Result then
                if not _mdiAberto('TFrmCadModVeiculosCCIA', 'O Formulário Cadastro de Modelo de Veículos se encontra aberto!') then
                  Result := False;

              if Result then
              begin
                vDadosIni.vPesquisa := 'MODVEICULOSCAD| ' + vDadosIni.codEmpresa + '|' +
                 IntToStr(vNota.vItem.vDetVeic.dataset.FieldByName('VERSAO').AsInteger) + '|' +
                 IntToStr(pCodEmpresaGravar)+'|';

                formulario := Funcoes.AbreForm('pkVeiculosCCIA', 'TFrmCadModVeiculosCCIA', hdTemp);

                try
                  formulario.ShowModal;
                finally
                  formulario.Free;
                  unLoadPackage(hdTemp);
                  vDadosIni.vPesquisa := '';
                end;
              end
            end;

            if Result then
            begin
              vNota.buscas.Close;
              vNota.buscas.SQL.Text := ' SELECT FIRST 1 CODIGO FROM TIPMODELO ' +
                ' WHERE CODIGO = ' + IntToStr(vNota.vItem.vDetVeic.dataset.FieldByName('VERSAO').AsInteger) +
                ' AND COD_EMPRESA =  ' + IntToStr(pCodEmpresaGravar);
              vNota.buscas.Open;

              Result := not vNota.buscas.IsEmpty;
            end;
            if not Result then
            begin
              vNota.buscas.Close;
              vNota.buscas.SQL.Text := ' select COD_EMPRESA, IDENTIFICACAO_EMP, CGC_EMP from empresa  ' +
               ' where cod_empresa = ' + IntToStr(pCodEmpresaGravar);
              vNota.buscas.Open;
              
              Application.MessageBox(pchar('Pré nota não será gerada!'+ #13 +
               'Modelo do Veículo não encontrado na empresa de destino: ' + #13 +
               '"' + IntToStr(vNota.buscas.FieldByName('COD_EMPRESA').AsInteger) + ' - '+ trim(vNota.buscas.FieldByName('IDENTIFICACAO_EMP').AsString) + ': '+ trim(vNota.buscas.FieldByName('CGC_EMP').AsString) + '"' + #13 +
               'Modelo do Veículo: ' + #13 +
               '"' + IntToStr(vNota.vItem.vDetVeic.dataset.FieldByName('VERSAO').AsInteger) + ' - ' + trim(vNota.vItem.vDetVeic.dataset.FieldByName('DESCRICAO_VERSAO').AsString) + '"' + #13 +
               'Favor cadastrar o modelo do veículo!'),'Atenção', 0+ 64);
              vNota.vItem.vDetVeic.dataSet.First;
              vNota.Cancel;
              vNota.vItem.Cancel;
              Result := False;
              exit;
            end;

            vNota.vItem.vDetVeic.dataSet.Next;
          end;
        end;
      finally
        vNota.dataSet.Close;
        vNota.vItem.dataSet.Close;
        vNota.vItem.vDetVeic.dataSet.Close;
      end;
    end;


    if Trim(vArquivoXml) <> '' then
    begin
      pCodEmpresaGravar := StrToInt(vDadosIni.codEmpresa);

      if not montarNf(vNota, vArquivoXml) then
      begin
        vNota.Cancel;
        vNota.vItem.Cancel;
        Result := False;
        Exit;
      end;

      vNota.exitCodigoTabela('CLIENTES');

      if StrToIntDef(vNota.dataSet.FieldByName('COD_COND_PAG').AsString, 0) = 0 then
      begin
        vNota.buscas.Close;
        vNota.buscas.SQL.Text := 'select first 1 cod_cond_pag from cond_pag order by cod_cond_pag';
        vNota.buscas.Open;

        if vNota.buscas.IsEmpty then
        begin
      	 vNota.Cancel;
        	 vNota.vItem.Cancel;
          Result := False;
          Exit;
        end;
        vNota.dataSet.FieldByName('COD_COND_PAG').AsInteger := vNota.buscas.FieldByName('COD_COND_PAG').AsInteger;
      end;

      if vNota.existeNotaFiscal then
      begin
  		  Application.MessageBox(pchar(Format('Nota fiscal de numero %d já existe!', [vNota.dataSet.FieldByName('NUM_NF').AsInteger])), 'Informação', MB_ICONINFORMATION + MB_OK);      
        vNota.Cancel;
        vNota.vItem.Cancel;
        Result := False;
        Exit;
      end;

      if vflgcfop = 1 then
      begin
        vNota.Cancel;
        vNota.vItem.Cancel;
        Result := False;
        Exit;
      end;

      if not (vNota.dataSet.State in [dsInsert, dsEdit]) then
        vNota.dataSet.Edit;

      vNota.dataSet.FieldByName('STATUS').AsString := 'Pre Nota';
      vNota.dataSet.FieldByName('COD_NF').AsInteger := vNota.Gencodigo('NOTAFISCAL', dtmNF.SpIncCodNF, IntToStr(pCodEmpresaGravar));
			vNota.dataSet.Post;

      FCodNF := vNota.dataSet.FieldByName('COD_NF').AsInteger;

      vNota.vItem.dataSet.First;
		while not vNota.vItem.dataset.Eof do
      begin
        if not (vNota.vItem.dataSet.State in [dsInsert, dsEdit]) then
        	vNota.vItem.dataSet.Edit;
        vNota.vItem.dataSet.FieldByName('COD_NF').AsInteger := vNota.dataSet.FieldByName('COD_NF').AsInteger;
        vNota.vItem.dataSet.Post;
        vNota.vItem.dataSet.Next;
      end;

      vNota.vItem.vDetVeic.selecionaDetalheVeiculo(0);
    end
    else if (pCodNF > 0) and (pCodEmpresaGravar > 0) then
    begin
      tribHandlerGetter := TributosHandler.Create( vNota.transacao, tdfoNotaFiscal );
      tribHandlerSetter := TributosPersistentHandler.Create(
        vNota.transacao,
        Container.GetInstance().ErpFeaturesFactory.CreateSalvarTributoDFeUseCase(),
        Container.GetInstance().ErpFeaturesFactory.CreateRemoverTributoDFeUseCase()
      );
      try
        // Buscando dados ddo cabecalho da nota fiscal

        if (pCodEmpresaGravar <> StrToInt(vDadosIni.codEmpresa)) then
        begin
          vNota.buscas.Close;
          vNota.buscas.SQL.Text := 'select desconsiderar_icms_nfent, num_credenc_interventor, busca_cod_no_prod from empresa' +
            ' where cod_empresa = ' + IntToStr(pCodEmpresaGravar);
          vNota.buscas.Open;

          vDesconsiderarICMS := vNota.buscas.FieldByName('desconsiderar_icms_nfent').AsString = 'S';
          vNumCredInterventor := Trim(vNota.buscas.FieldByName('num_credenc_interventor').AsString);
          vBuscaCodNoProduto := Trim(vNota.buscas.FieldByName('busca_cod_no_prod').AsString);
        end
        else
        begin
          vDesconsiderarICMS := vDadosIni.vEmp.vDesconsiderarICMSNfEnt = 'S';
          vNumCredInterventor := vDadosIni.vEmp.vNumCredenciadoInterventor;
          vBuscaCodNoProduto := vDadosIni.vEmp.vBuscaCodNoProduto;
        end;

        vNota.buscas.Close;
        vNota.buscas.SQL.Text := 'select * from notafiscal' +
          ' where cod_nf = ' +IntToStr(pCodNF) +
          ' and cod_empresa = ' + vDadosIni.codEmpresa;
        vNota.buscas.Open;

        if vNota.buscas.IsEmpty then
          Exit;

        if vNota.buscas.FieldByName('natureza_nf').AsString = 'E' then
          Exit;

        //Verificar a configuracao da outra empresa para zerar os valores do icms

        vNota.montaSelect('select * from notafiscal' +
          ' where cod_nf_transf = ' + IntToStr(pCodNF) +
          ' and cod_empresa=  ' + IntToStr(pCodEmpresaGravar));

        if not vNota.dataSet.IsEmpty then
          if Trim(vNota.dataSet.FieldByName('status').AsString) <> 'Pre Nota' then
            Exit;

        tribHandlerGetter.Load( pCodNF, vDadosIni.cod_empresa );
        ignorarTribDFe := YesNoEnum(vNota.buscas.FieldByName('dfe_trib_ignorar').AsInteger);

        if vNota.dataSet.IsEmpty then
        begin
  //        vNota._buscas.Close;
  //        vNota._buscas.SQL.Text := 'delete from notafiscal_item_veiculo' +
  //          ' where cod_nf = ' + IntToStr(vNota.dataSet.FieldByName('cod_nf').AsInteger) +
  //          ' and cod_empresa = ' + IntToStr(vNota.dataSet.FieldByName('cod_empresa').AsInteger);
  //        vNota._buscas.ExecSQL;
  //
  //        vNota._buscas.Close;
  //        vNota._buscas.SQL.Text := 'delete from notafiscal_item' +
  //          ' where cod_nf = ' + IntToStr(vNota.dataSet.FieldByName('cod_nf').AsInteger) +
  //          ' and cod_empresa = ' + IntToStr(vNota.dataSet.FieldByName('cod_empresa').AsInteger);
  //        vNota._buscas.ExecSQL;

          vNota.dataSet.Insert;
          vNewNF := True;
        end
        else
        begin
          vNota.dataSet.Edit;
          vNewNF := False;
        end;
        for I := 0 to vNota.dataSet.Fields.Count - 1 do
          if vNota.dataSet.Fields[I].FieldName <> 'COD_NF' then
            if (vNota.dataSet.FindField(vNota.dataSet.Fields[I].FieldName) <> nil) and
              (vNota.buscas.FindField(vNota.dataSet.Fields[I].FieldName) <> nil) then
              vNota.dataSet.FieldByName(vNota.dataSet.Fields[I].FieldName).Value :=
                vNota.buscas.FieldByName(vNota.dataSet.Fields[I].FieldName).Value;
        if vNewNF then
          vNota.dataSet.FieldByName('cod_nf').AsInteger := vNota.Gencodigo('NOTAFISCAL', dtmNF.SpIncCodNF, IntToStr(pCodEmpresaGravar));

        vNota.dataSet.FieldByName('emissao_propria').AsString := 'N';
        vNota.dataSet.FieldByName('DA').AsString := 'S';
        vNota.dataSet.FieldByName('status').AsString := 'Pre Nota';
        vNota.dataSet.FieldByName('cod_nf_transf').AsInteger := pCodNF;
        vNota.dataSet.FieldByName('cod_emp_transf').AsInteger := StrToInt(vDadosIni.codEmpresa);
        vNota.dataSet.FieldByName('cod_empresa').AsInteger := pCodEmpresaGravar;
        if vNota.buscas.FieldByName('natureza_nf').AsString = 'S' then
          vNota.dataSet.FieldByName('natureza_nf').AsString := 'E'
        else
          vNota.dataSet.FieldByName('natureza_nf').AsString := 'S';
        vNota.dataSet.FieldByName('NUM_GERADO').AsString := 'N';
        vNota.dataSet.FieldByName('TIPO_EMISSAO').AsInteger := 1;
        vNota.dataSet.FieldByName('NUM_NF_EMT').AsInteger := 0;
        vNota.dataSet.FieldByName('SERIE_EMT').AsString := '0';
        vNota.dataSet.FieldByName('EXTEMPORANEO').AsString := 'N';
        vNota.dataSet.FieldByName('data_contabil').AsDateTime :=
          vNota.buscas.FieldByName('data_lanc').AsDateTime;
        vNota.dataSet.FieldByName('data_lanc').AsDateTime := vDadosIni.getDataBanco(vNota.buscas);

        vNota.buscas.Close;
        vNota.buscas.SQL.Text := 'select first 1 cod_vendedor from colaborador' +
          ' where cod_empresa = ' + IntToStr(pCodEmpresaGravar) + ' and ativo = 1';
        vNota.buscas.Open;

        if vNota.buscas.FieldByName('cod_vendedor').AsInteger = 0 then
        begin
          vNota.dataSet.CancelUpdates;
          Application.MessageBox(pchar('Pré nota não será gerada!'+ #13 +
            'Nenhum colaborador ativo encontrado na outra empresa'),'Atenção', 0+ 64);
          Result := False;
          Exit;
        end;

        vNota.dataSet.FieldByName('cod_vendedor').AsInteger := vNota.buscas.FieldByName('cod_vendedor').AsInteger;
        vNota.dataSet.FieldByName('cod_usuario').AsInteger := vNota.buscas.FieldByName('cod_vendedor').AsInteger;

        vNota.buscas.Close;
        vNota.buscas.SQL.Text := 'select cod_cliente from clientes' +
          ' where cpfcgc = ' + QuotedStr(vDadosIni.vEmp.vCNPJ) +
          ' and cod_empresa = ' + IntToStr(pCodEmpresaGravar);
        vNota.buscas.Open;

        if vNota.buscas.FieldByName('cod_cliente').AsInteger = 0 then
        begin
          vNota.buscas.Close;
          vNota.buscas.SQL.Text := 'select first 1 cod_cliente from clientes' +
            ' where cod_empresa = ' + IntToStr(pCodEmpresaGravar);
          vNota.buscas.Open;

          if vNota.buscas.FieldByName('cod_cliente').AsInteger = 0 then
          begin
            vNota.dataSet.CancelUpdates;
            Application.MessageBox(pchar('Pré nota não será gerada!'+ #13 +
              'Cadastro da empresa não encontrada com o CNPJ: ' + vDadosIni.vEmp.vCNPJ),'Atenção', 0+ 64);
            Result := False;
            Exit;
          end;
        end;
        vCodFornecedor := vNota.buscas.FieldByName('cod_cliente').AsInteger;

        vNota.dataSet.FieldByName('cod_cliente').AsInteger :=
          vNota.buscas.FieldByName('cod_cliente').AsInteger;
        vNota.dataSet.Post;
        Result := vNota.Apply;
        if not Result then
        begin
          if pCommit then
            vNota.RollBackTransacao;
          Result := False;
          Exit;
        end;
      
        if ((vNota.dataSet.FieldByName('tipo_nf').AsString = 'P') and (vCodFornecedor > 0)) then
        begin
          vNota._buscas.Close;
          vNota._buscas.SQL.Text := ' insert into produtos_forn_nfe ' +
            ' (cod_fornecedor, grupo_prod, cod_prod, cod_empresa, num_fab_fornecedor) ' +
            ' select ' + IntToStr(vCodFornecedor) + ' cod_fornecedor, ' +
            ' nfi.grupo_prod, nfi.cod_prod, ' + IntToStr(pCodEmpresaGravar) + ' cod_empresa_tf, ' +
            ' nfi.num_fab_prod from notafiscal_item nfi ' +
            ' where nfi.cod_nf = :cod_nf and nfi.cod_empresa = :cod_empresa ' +
            ' and (select count(cf.num_fab_fornecedor) from codigo_fornecedor_vw cf ' +
            ' where cf.cod_fornecedor = :cod_fornecedor ' +
            ' and cf.grupo_prod = nfi.grupo_prod and cf.cod_prod = nfi.cod_prod ' +
            ' and cf.cod_empresa = :cod_empresa_tf and cf.num_fab_fornecedor = nfi.num_fab_prod) = 0 ';
          vNota._buscas.ParamByName('cod_nf').AsInteger := pCodNF;
          vNota._buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
          vNota._buscas.ParamByName('cod_fornecedor').AsInteger := vCodFornecedor;
          vNota._buscas.ParamByName('cod_empresa_tf').AsInteger := pCodEmpresaGravar;
          vNota._buscas.ExecSQL;
        end;

        // Buscando dados dos itens da nota fiscal
        vNota.vItem.montaSelect(
          'select * from notafiscal_item' +
          ' where cod_nf = ' + IntToStr(vNota.dataSet.FieldByName('cod_nf').AsInteger) +
          ' and cod_empresa =  ' + IntToStr(pCodEmpresaGravar));
        while not vNota.vItem.dataSet.IsEmpty do
          vNota.vItem.dataSet.Delete;

        if vNota.vItem.dataSet.ChangeCount > 0 then
        begin
          Result := vNota.vItem.Apply;
          if not Result then
          begin
            if pCommit then
              vNota.RollBackTransacao;
            Result := False;
            Exit;
          end;
        end;

        vNota.buscas.Close;
        vNota.buscas.SQL.Text := 'select * from notafiscal_item' +
          ' where cod_nf = ' +IntToStr(pCodNF) +
          ' and cod_empresa = ' + vDadosIni.codEmpresa;
        vNota.buscas.Open;

        vNota.buscas.First;
        while not vNota.buscas.Eof do
        begin

  //        vNota.vItem.dataSet.Filter := 'nitem = ' + IntToStr(vNota.buscas.FieldByName('nitem').AsInteger);
  //        vNota.vItem.dataSet.Filtered := True;

          try

  //          if vNota.vItem.dataSet.FieldByName('nitem').AsInteger = vNota.buscas.FieldByName('nitem').AsInteger then
  //            vNota.vItem.dataSet.Edit
  //          else
              vNota.vItem.dataSet.Insert;
            for I := 0 to vNota.vItem.dataSet.Fields.Count - 1 do
              if (vNota.vItem.dataSet.FindField(vNota.vItem.dataSet.Fields[I].FieldName) <> nil) and
                (vNota.buscas.FindField(vNota.vItem.dataSet.Fields[I].FieldName) <> nil) then
                vNota.vItem.dataSet.FieldByName(vNota.vItem.dataSet.Fields[I].FieldName).Value :=
                  vNota.buscas.FieldByName(vNota.vItem.dataSet.Fields[I].FieldName).Value;
            vNota.vItem.dataSet.FieldByName('cod_nf').AsInteger := vNota.dataSet.FieldByName('cod_nf').AsInteger;
            vNota.vItem.dataSet.FieldByName('cod_empresa').AsInteger := pCodEmpresaGravar;

            vNota._buscas.Close;
            vNota._buscas.SQL.Text := 'select * from nat_op where codigo_nop = :codigo_nop';
            vNota._buscas.ParamByName('codigo_nop').AsFloat :=
              vNota.dataSet.FieldByName('codigo_nop').AsFloat;
            vNota._buscas.Open;

            if vNota._buscas.FieldByName('CFOP_CONV').AsFloat > 0 then
              vNota.vItem.dataSet.FieldByName('codigo_nop').AsFloat :=
                vNota._buscas.FieldByName('CFOP_CONV').AsFloat;

            if vDadosIni.vEmp.vVersaoVeiculos = '4' then
            begin
              vNota._buscas.Close;
              vNota._buscas.SQL.Text := 'select tipv_veiculo from nat_op where codigo_nop = :codigo_nop';
              vNota._buscas.ParamByName('codigo_nop').AsFloat :=
                vNota.vItem.dataSet.FieldByName('codigo_nop').AsFloat;
              vNota._buscas.Open;

              if not vNota._buscas.IsEmpty then
              vNota.vItem.dataSet.FieldByName('TIPV_VEICULO').AsString := vNota._buscas.FieldByName('TIPV_VEICULO').AsString
            end;

            vNota.vItem.dataSet.FieldByName('PMARGFIM').AsFloat := 0;
            vNota.vItem.dataSet.FieldByName('RED_LUCRO').AsString := 'N';
            vNota.vItem.dataSet.FieldByName('PR_CUSC_PROD').AsFloat := 0;
            vNota.vItem.dataSet.FieldByName('PREC_CUS_R').AsFloat := 0;
            vNota.vItem.dataSet.FieldByName('ANTEC_TRIB').AsString := 'N';
            vNota.vItem.dataSet.FieldByName('PREC_30_PROD').AsFloat := 0;
            vNota.vItem.dataSet.FieldByName('PREC_60_PROD').AsFloat := 0;
            vNota.vItem.dataSet.FieldByName('PREC_90_PROD').AsFloat := 0;

            if vNota.vItem.dataSet.FieldByName('tipo_item').AsString = 'P' then
            begin
              if vBuscaCodNoProduto <> 'S' then
              begin
                vNota.vItem.dataSet.FieldByName('NUM_FAB_FORNECEDOR').AsString :=
                  vNota.vItem.dataSet.FieldByName('NUM_FAB_PROD').AsString;
                vNota.vItem.dataSet.FieldByName('grupo_prod').Value := Null;
                vNota.vItem.dataSet.FieldByName('cod_prod').Value := Null;
                vNota.vItem.dataSet.FieldByName('num_fab_prod').Value := Null;
              end
              else
              begin
                vNota._buscas.Close;
                vNota._buscas.SQL.Text := 'select cb.*, p.num_fab_prod, p.consumo, p.ecf, p.descr_prod from cod_barra cb' +
                  ' inner join produtos p on p.grupo_prod = cb.grupo_prod and p.cod_prod = cb.cod_prod' +
                  ' and p.cod_empresa = cb.cod_empresa and p.ativo = 1' +
                  ' where cod_barra = '+ QuotedStr(Trim(vNota.vItem.dataSet.FieldByName('num_fab_prod').AsString)) +
                  ' and cb.ativo = 1 and cb.cod_empresa = ' + IntToStr(vNota.vItem.dataSet.FieldByName('cod_empresa').AsInteger);
                vNota._buscas.Open;

                if Trim(vNota._buscas.FieldByName('num_fab_prod').AsString) <> '' then
                begin
                  vNota.vItem.dataSet.FieldByName('num_fab_prod').AsString := vNota._buscas.FieldByName('num_fab_prod').AsString;
                  vNota.vItem.dataSet.FieldByName('DESCRICAO_ITEM').AsString := vNota._buscas.FieldByName('descr_prod').AsString;
                  vNota.vItem.dataSet.FieldByName('cod_prod').AsString := vNota._buscas.FieldByName('cod_prod').AsString;
                  vNota.vItem.dataSet.FieldByName('grupo_prod').AsString := vNota._buscas.FieldByName('grupo_prod').AsString;
                  vNota.vItem.dataSet.FieldByName('consumo').AsString := vNota._buscas.FieldByName('consumo').AsString;
                  if Trim(vNumCredInterventor) <> '' then
                    vNota.vItem.dataSet.FieldByName('ecf').AsString := vNota._buscas.FieldByName('ecf').AsString;
                  vNota.vItem.dataSet.FieldByName('cod_grade').AsInteger := vNota._buscas.FieldByName('cod_grade').AsInteger;
                end
                else
                begin
                  vNota.vItem.dataSet.FieldByName('NUM_FAB_FORNECEDOR').AsString :=
                    vNota.vItem.dataSet.FieldByName('NUM_FAB_PROD').AsString;
                  vNota.vItem.dataSet.FieldByName('grupo_prod').Value := Null;
                  vNota.vItem.dataSet.FieldByName('cod_prod').Value := Null;
                  vNota.vItem.dataSet.FieldByName('num_fab_prod').Value := Null;
                end;
              end;
            end;

            tribDFe := tribHandlerGetter.GetItem( vNota.vItem.fstr('dfe_trib_id') );
            try
              if tribDFe <> nil then
              begin
                tribDFe.Id := NewGuid();
                if tribDFe.IbsCbs <> nil then
                begin
                  tribDFe.IbsCbs.RegraFiscalId := StringNullable.NullInstance();
                  tribDFe.IbsCbs.TipoRegra := tctNenhuma;
                end;

                vNota.vItem.dataSet.FieldByName('dfe_trib_id').AsString := tribDFe.Id;
                tribHandlerSetter.SetItem( tribDFe, tdfoNotaFiscal );

                ignorarTribDFe := ynNo;
              end
              else
                vNota.vItem.dataSet.FieldByName('dfe_trib_id').Value := Null;

            finally
              tribDFe.Free();
            end;

            vNota.vItem.dataSet.Post;

          finally
  //          vNota.vItem.dataSet.Filtered := False;
  //          vNota.vItem.dataSet.Filter := '';
          end;

          vNota.buscas.Next;
        end;

        Result := vNota.vItem.Apply;
        if not Result then
        begin
          if pCommit then
            vNota.RollBackTransacao;
          Exit;
        end;

        //Buscando dados dos itens veiculo da nota fiscal
        vNota.vItem.vDetVeic.montaSelect(
          'select * from notafiscal_item_veiculo' +
          ' where cod_nf = ' + IntToStr(vNota.dataSet.FieldByName('cod_nf').AsInteger) +
          ' and cod_empresa =  ' + IntToStr(pCodEmpresaGravar));        
        while not vNota.vItem.vDetVeic.dataSet.IsEmpty do
          vNota.vItem.vDetVeic.dataSet.Delete;

        if vNota.vItem.vDetVeic.dataSet.ChangeCount > 0 then
        begin
          Result := vNota.vItem.vDetVeic.Apply;
          if not Result then
          begin
            if pCommit then
              vNota.RollBackTransacao;
            Exit;
          end;
        end;

        vNota.buscas.Close;
        vNota.buscas.SQL.Text := 'select * from notafiscal_item_veiculo' +
          ' where cod_nf = ' +IntToStr(pCodNF) +
          ' and cod_empresa = ' + vDadosIni.codEmpresa;
        vNota.buscas.Open;

        vNota.buscas.First;
        while not vNota.buscas.Eof do
        begin

          vNota.vItem.vDetVeic.dataSet.Insert;
          for I := 0 to vNota.vItem.vDetVeic.dataSet.Fields.Count - 1 do
            if (vNota.vItem.vDetVeic.dataSet.FindField(vNota.vItem.vDetVeic.dataSet.Fields[I].FieldName) <> nil) and
              (vNota.buscas.FindField(vNota.vItem.vDetVeic.dataSet.Fields[I].FieldName) <> nil) then
              vNota.vItem.vDetVeic.dataSet.FieldByName(vNota.vItem.vDetVeic.dataSet.Fields[I].FieldName).Value :=
                vNota.buscas.FieldByName(vNota.vItem.vDetVeic.dataSet.Fields[I].FieldName).Value;
          vNota.vItem.vDetVeic.dataSet.FieldByName('cod_nf').AsInteger := vNota.dataSet.FieldByName('cod_nf').AsInteger;
          vNota.vItem.vDetVeic.dataSet.FieldByName('cod_empresa').AsInteger := pCodEmpresaGravar;
          vNota.vItem.vDetVeic.dataSet.Post;

          vNota.buscas.Next;
        end;

        if vNota.vItem.vDetVeic.dataSet.ChangeCount > 0 then
        begin
          Result := vNota.vItem.vDetVeic.Apply;
          if not Result then
          begin
            if pCommit then
              vNota.RollBackTransacao;
            Exit;
          end;
        end;

      finally
        tribHandlerGetter.FreeSafe();
        tribHandlerSetter.FreeSafe();
      end;

    end
    else
      Exit;

    // Acertano campos do cabecalho da nota fiscal
    if not (vNota.dataSet.State in [dsInsert, dsEdit]) then
    	vNota.dataSet.Edit;

    vNota.buscas.Close;
    vNota.buscas.SQL.Text := 'select * from nat_op where codigo_nop = :codigo_nop';
    vNota.buscas.ParamByName('codigo_nop').AsFloat :=
      vNota.dataSet.FieldByName('codigo_nop').AsFloat;
    vNota.buscas.Open;

    if vNota.buscas.FieldByName('CFOP_CONV').AsFloat > 0 then
      vNota.dataSet.FieldByName('codigo_nop').AsFloat :=
        vNota.buscas.FieldByName('CFOP_CONV').AsFloat;

    if (vDadosIni.vEmp.vRegime = 'SIMPLES') then
      vNota.dataSet.FieldByName('aliq_icm_simples').AsFloat := vDadosIni.vEmp.vAliqSimplesICM
    else if pos('SIMPLES / EXCESSO', vDadosIni.vEmp.vRegime) > 0 then
      vNota.dataSet.FieldByName('crt').AsString := '2'
    else
      vNota.dataSet.FieldByName('crt').AsString := '3';
    if (vDesconsiderarICMS) and (vNota.dataSet.FieldByName('tipo_nf').AsString <> 'V') then
    begin
      vNota.dataSet.FieldByName('aliq_icm').Asfloat := 0;
      vNota.dataSet.FieldByName('base_icm').AsFloat := 0;
      vNota.dataSet.FieldByName('valor_icm').AsFloat := 0;
    end;

    vNota.dataSet.FieldByName('dfe_trib_ignorar').AsInteger := Ord(ignorarTribDFe);

    vNota.dataSet.FieldByName('obs').Value := Null;
    vNota.dataSet.FieldByName('data_ent_saida').Value := Null;
    vNota.dataSet.FieldByName('hora_ent_saida').Value := Null;
    vNota.dataSet.FieldByName('RESULTADO_ENVIO').Value := Null;
    vNota.dataSet.FieldByName('DATA_AUTORIZACAO').Value := Null;
    vNota.dataSet.FieldByName('SITUACAO_NFE').Value := Null;
    vNota.dataSet.FieldByName('DIGEST').Value := Null;
    vNota.dataSet.FieldByName('PROTOCOLO').Value := Null;
    vNota.dataSet.FieldByName('CODIGOERRO').Value := Null;
    vNota.dataSet.FieldByName('DESCRICAOERRO').Value := Null;
    vNota.dataSet.FieldByName('TEMPORESPOSTA').Value := Null;
    vNota.dataSet.FieldByName('HORA_ENVIO').Value := Null;
    vNota.dataSet.FieldByName('TIPONFE').Value := Null;
    vNota.dataSet.FieldByName('DANFEIMPRESSO').Value := Null;
    vNota.dataSet.FieldByName('DATAHORA_ENVIO').Value := Null;
    vNota.dataSet.FieldByName('SEL_NFE').Value := Null;
    vNota.dataSet.FieldByName('N_FORM_SEGURANCA').Value := Null;
    vNota.dataSet.FieldByName('JUST_CANCELAMENTO').Value := Null;
    vNota.dataSet.FieldByName('INUTILNFANT').Value := Null;
    vNota.dataSet.FieldByName('NUM_PED').Value := Null;
    vNota.dataSet.FieldByName('DEVOLUCAO').Value := Null;
    vNota.dataSet.FieldByName('CONF_ENT').Value := Null;
    vNota.dataSet.FieldByName('TP_NF').Value := Null;
    vNota.dataSet.FieldByName('MNF').Value := Null;
    vNota.dataSet.FieldByName('COD_NF_REF').Value := Null;
    vNota.dataSet.FieldByName('NUM_NF_COMPL').Value := Null;
    vNota.dataSet.FieldByName('SERIE_COMPL').Value := Null;
    vNota.dataSet.FieldByName('N_COMANDO').Value := Null;
    vNota.dataSet.FieldByName('DADOS_INTERESSE_FISCO').Value := Null;
    vNota.dataSet.FieldByName('DADOS_LANCAMENTO_FISCAL').Value := Null;
    vNota.dataSet.FieldByName('NFE_CMSG').Value := Null;
    vNota.dataSet.FieldByName('NFE_XMSG').Value := Null;
    vNota.dataSet.FieldByName('NFE_DHCONT').Value := Null;
    vNota.dataSet.FieldByName('NFE_XJUST').Value := Null;
    vNota.dataSet.FieldByName('NFE_DPEC_CSTAT').Value := Null;
    vNota.dataSet.FieldByName('NFE_DPEC_XMOTIVO').Value := Null;
    vNota.dataSet.FieldByName('NFE_DPEC_NREGDPEC').Value := Null;
    vNota.dataSet.FieldByName('N_CAIXA').Value := Null;
    vNota.dataSet.FieldByName('INF_CORPO_V').Value := Null;
    vNota.dataSet.FieldByName('NPED').Value := Null;
    vNota.dataSet.FieldByName('TIPO_PED').Value := Null;
    vNota.dataSet.FieldByName('LOTE_NFE').Value := Null;
    vNota.dataSet.FieldByName('PATH_XML_IMPORT').Value := Null;
    vNota.dataSet.FieldByName('COD_CARGA').Value := Null;
    vNota.dataSet.FieldByName('COD_DEVOLUCAO').Value := Null;
    vNota.dataSet.FieldByName('COD_NF_REM_VFE').Value := Null;
    vNota.dataSet.FieldByName('NFE_RECIBO').Value := Null;
    vNota.dataSet.FieldByName('STAT_NFERECIBO').Value := Null;
    vNota.dataSet.FieldByName('UFEMBARQ').Value := Null;
    vNota.dataSet.FieldByName('XLOCEMBARQ').Value := Null;
    vNota.dataSet.FieldByName('SEM_SERIE').Value := Null;
    vNota.dataSet.FieldByName('CONSUMIDOR_FINAL').Value := Null;
    vNota.dataSet.FieldByName('ANTEC_TRIB').Value := Null;
    vNota.dataSet.Post;

   	if vNota.dataSet.ChangeCount > 0 then
    	Result := vNota.Apply;
   	if vNota.vItem.dataSet.ChangeCount > 0 then
    	Result := vNota.vItem.Apply;

    if not Result then
    begin
      if pCommit then
        vNota.RollBackTransacao;
      Exit;
    end;

    // Acertano campos dos itens da nota fiscal
    vNota.vItem.montaSelect(
        'select * from notafiscal_item' +
        ' where cod_nf = ' + IntToStr(vNota.dataSet.FieldByName('cod_nf').AsInteger) +
        ' and cod_empresa =  ' + IntToStr(pCodEmpresaGravar));

    vNota.vItem.dataSet.First;
    while not vNota.vItem.dataSet.Eof do
    begin
      vNota.vItem.dataSet.Edit;
      vNota.vItem.dataSet.FieldByName('cod_nf').AsInteger :=
        vNota.dataSet.FieldByName('cod_nf').AsInteger;
//      vNota.vItem.dataSet.FieldByName('NUM_FAB_FORNECEDOR').AsString :=
//        vNota.vItem.dataSet.FieldByName('NUM_FAB_PROD').AsString;
      vNota.vItem.dataSet.FieldByName('IMPORT_XML').AsString := 'S';
      vNota.vItem.dataSet.FieldByName('cod_grade').AsInteger := 0;

      vNota.vItem.dataSet.FieldByName('PRCTB_ITEM').Value := Null;
      vNota.vItem.dataSet.FieldByName('PRCTB_ITEMA').Value := Null;
      vNota.vItem.dataSet.FieldByName('PREC_CUS_CNT').Value := Null;
      vNota.vItem.dataSet.FieldByName('PREC_VND_PROD').Value := Null;
      vNota.vItem.dataSet.FieldByName('PREC_VND_PRODA').Value := Null;
      vNota.vItem.dataSet.FieldByName('PREC_CUS_REP').Value := Null;
      vNota.vItem.dataSet.FieldByName('PREC_CUSM_PROD').Value := Null;

      vNota.vItem.dataSet.FieldByName('PMARGFIM_A').Value := Null;
      vNota.vItem.dataSet.FieldByName('VLREMBNF').Value := Null;
      vNota.vItem.dataSet.FieldByName('VLBRUREAL').Value := Null;
      vNota.vItem.dataSet.FieldByName('PDESC_R').Value := Null;
      vNota.vItem.dataSet.FieldByName('VLREMBNFR').Value := Null;
      vNota.vItem.dataSet.FieldByName('VLUN_B_NFE').Value := Null;
      vNota.vItem.dataSet.FieldByName('BASE_ICMSUB_ANT').Value := Null;
      vNota.vItem.dataSet.FieldByName('VALOR_ICMSUB_ANT').Value := Null;
      vNota.vItem.dataSet.FieldByName('SEQ_DEVOLUCAO').Value := Null;
      vNota.vItem.dataSet.FieldByName('MNF').Value := Null;
      vNota.vItem.dataSet.FieldByName('ALTERA_ESTOQUE_CFOP').Value := Null;
      vNota.vItem.dataSet.FieldByName('ALTERA_CUSTO_CFOP').Value := Null;
      vNota.vItem.dataSet.FieldByName('PERMITIR_DESCONTO').Value := Null;
      vNota.vItem.dataSet.FieldByName('NPED').Value := Null;
      vNota.vItem.dataSet.FieldByName('TIPO_PED').Value := Null;
      vNota.vItem.dataSet.FieldByName('NITEM_PED').Value := Null;
      vNota.vItem.dataSet.FieldByName('TERMINAL').Value := Null;
      vNota.vItem.dataSet.FieldByName('NCUPOM').Value := Null;
      vNota.vItem.dataSet.FieldByName('NSERIEECF').Value := Null;
      vNota.vItem.dataSet.FieldByName('DATA_CUPOM').Value := Null;
      vNota.vItem.dataSet.FieldByName('ECF').Value := Null;
      vNota.vItem.dataSet.FieldByName('CONSUMO').Value := Null;
      vNota.vItem.dataSet.FieldByName('COD_NF_DEV').Value := Null;
      vNota.vItem.dataSet.FieldByName('NITEM_DEV').Value := Null;
      vNota.vItem.dataSet.FieldByName('SEQID_DEVOLUCAO').Value := Null;
      vNota.vItem.dataSet.FieldByName('NITEM_REM_VFE').Value := Null;
      vNota.vItem.dataSet.FieldByName('COMB_CPRODANP').Value := Null;
      vNota.vItem.dataSet.FieldByName('COMB_CODIF').Value := Null;
      vNota.vItem.dataSet.FieldByName('COMB_QTEMP').Value := Null;
      vNota.vItem.dataSet.FieldByName('COMB_UFCONS').Value := Null;
      vNota.vItem.dataSet.FieldByName('COMB_CIDE_QBCPROD').Value := Null;
      vNota.vItem.dataSet.FieldByName('COMB_CIDE_VALIQPROD').Value := Null;
      vNota.vItem.dataSet.FieldByName('COMB_CIDE_VCIDE').Value := Null;
      vNota.vItem.dataSet.FieldByName('XPED_COMPRA').Value := Null;
      vNota.vItem.dataSet.FieldByName('NITEMPED_COMPRA').Value := Null;

      if Copy(Trim(vNota.vItem.dataSet.FieldByName('cst_ipi').AsString),1,1) = '0' then
        vNota.vItem.dataSet.FieldByName('cst_ipi').AsString := '5' +
          Copy(vNota.vItem.dataSet.FieldByName('cst_ipi').AsString,2,1)
      else if Copy(Trim(vNota.vItem.dataSet.FieldByName('cst_ipi').AsString),1,1) = '5' then
        vNota.vItem.dataSet.FieldByName('cst_ipi').AsString := '0' +
          Copy(vNota.vItem.dataSet.FieldByName('cst_ipi').AsString,2,1)
      else if Copy(Trim(vNota.vItem.dataSet.FieldByName('cst_ipi').AsString),1,1) = '4' then
        vNota.vItem.dataSet.FieldByName('cst_ipi').AsString := '9' +
          Copy(vNota.vItem.dataSet.FieldByName('cst_ipi').AsString,2,1)
      else if Copy(Trim(vNota.vItem.dataSet.FieldByName('cst_ipi').AsString),1,1) = '9' then
        vNota.vItem.dataSet.FieldByName('cst_ipi').AsString := '4' +
          Copy(vNota.vItem.dataSet.FieldByName('cst_ipi').AsString,2,1);

      if (vNota.vItem.dataSet.FieldByName('tipo_item').AsString = 'P') and
        (pCodEmpresaGravar <> StrToInt(vDadosIni.codEmpresa)) then
      begin        
        vNota.buscas.Close;
        vNota.buscas.SQL.Text := 'select grupo_prod, cod_prod, cod_empresa from produtos' +
          ' where grupo_prod = ' +IntToStr(vNota.vItem.dataSet.FieldByName('grupo_prod').AsInteger) +
          ' and cod_prod = ' + QuotedStr(vNota.vItem.dataSet.FieldByName('cod_prod').AsString) +
          ' and cod_empresa = ' + IntToStr(pCodEmpresaGravar);
        vNota.buscas.Open;

        if vNota.buscas.FieldByName('cod_empresa').AsInteger = 0 then
        begin
          vNota.vItem.dataSet.FieldByName('grupo_prod').Value := Null;
          vNota.vItem.dataSet.FieldByName('cod_prod').Value := Null;        
        end;
      end;

      if (vDesconsiderarICMS) and (vNota.dataSet.FieldByName('tipo_nf').AsString <> 'V') then
      begin
        vNota.vItem.dataSet.FieldByName('aliq_icm').Asfloat := 0;
        vNota.vItem.dataSet.FieldByName('base_icm').AsFloat := 0;
        vNota.vItem.dataSet.FieldByName('valor_icm').AsFloat := 0;
      end;
      vNota.vItem.dataSet.Post;
      
      vNota.vItem.dataSet.Next;
    end;

    if vNota.vItem.DataSet.ChangeCount > 0 then
      Result := vNota.vItem.Apply;

    if not Result then
    begin
      if pCommit then
        vNota.RollBackTransacao;
      Exit;
    end;
    
    // Acertano campos dos itens veiculo da nota fiscal
    vNota.vItem.vDetVeic.dataSet.First;
    while not vNota.vItem.vDetVeic.dataSet.Eof do
    begin
      vNota.vItem.vDetVeic.dataSet.Edit;
      vNota.vItem.vDetVeic.dataSet.FieldByName('cod_nf').AsInteger :=
        vNota.dataSet.FieldByName('cod_nf').AsInteger;
      vNota.vItem.vDetVeic.dataSet.FieldByName('RED_LUCRO').Value := Null;
      vNota.vItem.vDetVeic.dataSet.Post;
      
      vNota.vItem.vDetVeic.dataSet.Next;
    end;

    if vNota.vItem.vDetVeic.DataSet.ChangeCount > 0 then
      Result := vNota.vItem.vDetVeic.Apply;

    if not Result then
    begin
      if pCommit then
        vNota.RollBackTransacao;
      Exit;
    end;

    if Result then
      if pCommit then
        vNota.CommitaTransacao;

    Result := True;
  except on E: Exception do
    begin
      Result := False;
      if pCommit then
        vNota.RollBackTransacao;

      vNota.registraErro('function TXmlImport.montarPreNota. Erro: ' + e.Message);
    end;
  end;
end;

function TXmlImport.retornaChaveNfe(ArquivoXML: string): string;
var
  I: Integer;
begin
{  Result := '';
  if not FileExists(ArquivoXML) then
  begin
    Application.MessageBox('Arquivo XML não encontrado', 'Atenção', 0 + 64);
    Exit;
  end;

  vnfe := TACBrNFe.Create(Application);
  try
    vnfe.NotasFiscais.Clear;
    vnfe.NotasFiscais.LoadFromFile(ArquivoXML);
    for I := 0 to vnfe.NotasFiscais.Count - 1 do
      with vnfe.NotasFiscais.Items[I].NFe do
      begin
        Result := StringReplace(infNFe.ID,'NFE','',[rfReplaceAll,rfIgnoreCase]);

        Application.MessageBox(PChar(
          'Nota Fiscal contida no XML' + #13 + #13 +
          'Chave: ' + StringReplace(infNFe.ID,'NFE','',[rfReplaceAll,rfIgnoreCase]) + #13 +
          'Numero: ' + IntToStr(Ide.nNF) + #13 +
          'Serie: ' + IntToStr(Ide.serie) + #13 +
          'Modelo: 55' + #13 +
          'Razao Social Emitente: ' + Emit.xNome + #13 +
          'Nome Fantasia Emitente: ' + Emit.xFant + #13 +
          'CNPJ do Emitente: ' + Emit.CNPJCPF + #13 +
          'Valor da Nota FIscal: ' + Format('%0.2n', [Total.ICMSTot.vNF])
        ), 'Atenção', 0 +64);
        Break;
      end;
  finally
    vnfe.Free;
    vnfe := nil;
  end;     }
end;

procedure TXmlImport.SetCodNF(const Value: integer);
begin
  FCodNF := Value;
end;

function TXmlImport._mdiAberto(pNomeFormMDI, pMensagem: string): Boolean;
var
  x: Byte;
begin
  Result := True;
  if Application.MainForm.MDIChildCount > 0 then
    for X := 0 to Pred(Application.MainForm.MDIChildCount) do
      if UpperCase(Application.MainForm.MDIChildren[X].ClassName) =
        UpperCase(pNomeFormMDI) then
      begin
        Result := False;
        if trim(pMensagem) <> ''  then
          Application.MessageBox(PChar(pMensagem), 'Atenção', 64)
        else
          Application.MessageBox('Formulário se encontra aberto!', 'Atenção', 64);
        Exit;
      end;
end;

end.

