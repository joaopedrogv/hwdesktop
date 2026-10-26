unit ACBrHTMLtoXML;

interface

uses Forms, SysUtils, pcnNFe, pcnNFeW, pcnAuxiliar, pcnConversao, ACBrUtil;

function GerarXML(Arquivo : AnsiString) : String;

implementation

function SeparaAte(Chave, Texto : AnsiString; var Resto: AnsiString): String;
var
  inicio : integer;
begin
   Chave := Trim(Chave);
   inicio := pos(Chave, Texto);
   if inicio = 0 then
     result := ''
   else
    begin
       Resto  := copy(Texto,inicio,length(Texto));
       Result := copy(Texto,0,inicio-1);
    end;
end;

function LerCampo(Texto, NomeCampo: string; Tamanho : Integer = 0): string;
var
  ConteudoTag: string;
  inicio, fim: integer;
begin
  NomeCampo := UpperCase(Trim(NomeCampo));
  inicio := pos(NomeCampo, UpperCase(Texto));
  if inicio = 0 then
    ConteudoTag := ''
  else
  begin
    inicio := inicio + Length(NomeCampo);
    if Tamanho > 0 then
       fim := Tamanho
    else
     begin
       Texto := copy(Texto,inicio,length(Texto));
       inicio := 0;
       fim := pos('|&|',Texto)-1;
     end;
    ConteudoTag := trim(copy(Texto, inicio, fim));
  end;
  try
     result := ConteudoTag;
  except
     raise Exception.Create('Conteúdo inválido. '+ConteudoTag);
  end;
end;

function ConverteStrToNumero( Valor : String ) : Real;
begin
  Result := StrToFloatDef(StringReplace(Valor,ThousandSeparator,'',[rfReplaceAll]),0);
end;

function GerarXML(Arquivo : AnsiString) : String;
var
 NFe : TNFe;
 GeradorXML : TNFeW;
 CaminhoXML, Grupo, ArquivoTXT, ArquivoRestante : AnsiString;
 ArquivoItens, ArquivoItensTemp, ArquivoDuplicatas, ArquivoVolumes : AnsiString;
 ok : Boolean;
 i, posIni, posFim : Integer;
 vposprod,vqtde: integer;
 vgrupocst,vgrupoipi: AnsiString;
begin
 NFe := TNFe.Create;

 ArquivoTXT := StringReplace(Arquivo,#$D#$A,'|&|',[rfReplaceAll]);

 Grupo :=  SeparaAte('Dados da NF-e',ArquivoTXT,ArquivoRestante);

 NFe.infNFe.ID := OnlyNumber(LerCampo(Grupo,'Chave de acesso'));
 NFe.Ide.nNF   := StrToIntDef(OnlyNumber(LerCampo(Grupo,'Número NF-e')),0);
 NFe.infNFe.Versao := strtofloat(StringReplace(LerCampo(Grupo,'Versão'),'.',',',[rfReplaceAll]));

 NFe.Ide.cNF := RetornarCodigoNumerico(NFe.infNFe.ID,1);

 Grupo :=  SeparaAte('EMITENTE',ArquivoRestante,ArquivoRestante);
 if NFe.infNFe.versao <> 2.00 then
  NFe.Ide.dEmi :=StrToDateDef(LerCampo(Grupo,'Data de emissão'),0)
 else
 // Olhar esta conversão pois há uma diferença na apresentação da versao 1.10 e 2.0
  NFe.Ide.dEmi :=StrToDateDef(LerCampo(Grupo,'Data de emissão'),0);
  //strtodate(LerCampo(Grupo,'Data de emissão'));
//  strtodate(copy(LerCampo(Grupo,'Data de emissão'),9,2)+'/'+
//  copy(LerCampo(Grupo,'Data de emissão'),6,2)+'/'+copy(LerCampo(Grupo,'Data de emissão'),1,4));

 NFe.Total.ICMSTot.vNF := ConverteStrToNumero(LerCampo(Grupo,'Valor Total da Nota Fiscal'));

 NFe.Ide.modelo := StrToInt(copy(SomenteNumeros(NFe.infNFe.ID), 21, 2));
 NFe.Ide.serie := StrToInt(copy(SomenteNumeros(NFe.infNFe.ID), 23, 3));

 Grupo :=  SeparaAte('DESTINATÁRIO',ArquivoRestante,ArquivoRestante);

 NFe.Emit.CNPJCPF := OnlyNumber(LerCampo(Grupo,'CNPJ'));
 NFe.Emit.xNome   := LerCampo(Grupo,'Nome/Razão Social');
 NFe.Emit.IE      := OnlyAlphaNum(LerCampo(Grupo,'Inscrição Estadual'));
 NFe.Emit.EnderEmit.UF := LerCampo(Grupo,'UF');

 Grupo :=  SeparaAte('EMISSÃO',ArquivoRestante,ArquivoRestante);

 NFe.Dest.CNPJCPF := OnlyNumber(LerCampo(Grupo,'CNPJ'));
 NFe.Dest.xNome   := LerCampo(Grupo,'Nome/Razão Social');
 NFe.Dest.IE      := OnlyAlphaNum(LerCampo(Grupo,'Inscrição Estadual'));
 NFe.Dest.EnderDest.UF := LerCampo(Grupo,'UF');

 Grupo :=  SeparaAte('Dados do Emitente',ArquivoRestante,ArquivoRestante);

 NFe.Ide.procEmi := StrToProcEmi(ok, LerCampo(Grupo,'Processo',1));
 NFe.Ide.verProc := LerCampo(Grupo, 'Versão do Processo');
 NFe.ide.tpEmis  := StrToTpEmis(ok, LerCampo(Grupo, 'Tipo de Emissão',1));
 NFe.Ide.finNFe  := StrToFinNFe(ok, LerCampo(Grupo, 'Finalidade',1));
 NFe.Ide.natOp   := LerCampo(Grupo, 'Natureza da Operação');
 NFe.ide.tpNF    := StrToTpNF(ok, LerCampo(Grupo, 'Tipo da Operação',1));
 NFe.ide.indPag  := StrToIndpag(ok, LerCampo(Grupo, 'Forma de Pagamento',1));
   //SITUAÇÃO ATUAL:
{ NFE.procNFe.digVal   := LerCampo(Grupo, 'Digest Value da NF-e');
 NFe.procNFe.xMotivo  := LerCampo(Grupo, 'Ocorrência');
 NFe.procNFe.nProt    := LerCampo(Grupo, 'Protocolo');
 NFe.procNFe.dhRecbto := StrToDateDef(LerCampo(Grupo,'Data/Hora'),0);}
   //Recebimento no Ambiente Nacional

 Grupo :=  SeparaAte('Dados do destinatário',ArquivoRestante,ArquivoRestante);
 if Grupo = '' then
   Grupo :=  SeparaAte('Dados do Destinatário',ArquivoRestante,ArquivoRestante);

 NFe.Emit.xNome   := LerCampo(Grupo,'Nome / Razão Social');
 NFe.Emit.xFant   := LerCampo(Grupo,'Nome Fantasia');
 NFe.Emit.CNPJCPF := OnlyNumber(LerCampo(Grupo,'CNPJ'));
 NFe.Emit.EnderEmit.xLgr := LerCampo(Grupo,'Endereço');
 NFe.Emit.EnderEmit.xBairro := LerCampo(Grupo,'Bairro/Distrito');

 NFe.Emit.EnderEmit.CEP := StrToIntDef(OnlyNumber(LerCampo(Grupo,'CEP')),0);
 NFe.Emit.EnderEmit.cMun := StrToIntDef(LerCampo(Grupo,'Município',7),0);

 NFe.Ide.cUF := StrToIntDef(LerCampo(Grupo,'Município',2),0);

 NFe.Emit.EnderEmit.xMun := copy(LerCampo(Grupo,'Município'),10,60);
 NFe.Emit.EnderEmit.fone := OnlyAlphaNum(LerCampo(Grupo,' Fone/Fax'));
 NFe.Emit.EnderEmit.UF := LerCampo(Grupo,'UF');
 NFe.Emit.EnderEmit.cPais := StrToIntDef(LerCampo(Grupo,'País',4),0);
 NFe.Emit.EnderEmit.xPais := copy(LerCampo(Grupo,'País'),8,60);
 if NFe.Emit.EnderEmit.cPais = 0 then
 begin
   NFe.Emit.EnderEmit.cPais:=1058;
   NFe.Emit.EnderEmit.xPais:='Brasil';
 end;
 NFe.Emit.IE      := OnlyAlphaNum(LerCampo(Grupo,'Inscrição Estadual'));
 NFe.Emit.IEST      := OnlyAlphaNum(LerCampo(Grupo,'Inscrição Estadual do Substituto Tributário'));
 if LerCampo(Grupo, 'Código de Regime Tributário',1) <> '' then
   NFe.Emit.CRT:=StrToCRT(ok,LerCampo(Grupo, 'Código de Regime Tributário',1))
 else
   NFe.Emit.CRT:=StrToCRT(ok,'3');

 NFe.Ide.cMunFG := StrToIntDef(LerCampo(Grupo,'Município da Ocorrência do Fato Gerador do ICMS'),0);

 Grupo :=  SeparaAte('Dados dos Produtos e Serviços',ArquivoRestante,ArquivoRestante);

 NFe.Dest.xNome   := LerCampo(Grupo,'Nome / Razão social');
 if OnlyNumber(LerCampo(Grupo,'CNPJ/CPF')) = '' then
   NFe.Dest.CNPJCPF := OnlyNumber(LerCampo(Grupo,'CNPJ'))
 else
  NFe.Dest.CNPJCPF := OnlyNumber(LerCampo(Grupo,'CNPJ/CPF'));
 NFe.Dest.EnderDest.xLgr := LerCampo(Grupo,'Endereço');
 NFe.Dest.EnderDest.xBairro := LerCampo(Grupo,'Bairro / Distrito');
 NFe.Dest.EnderDest.CEP := StrToIntDef(OnlyNumber(LerCampo(Grupo,'CEP')),0);
 NFe.Dest.EnderDest.cMun := StrToIntDef(LerCampo(Grupo,'Município',7),0);
 NFe.Dest.EnderDest.xMun := copy(LerCampo(Grupo,'Município'),10,60);
 NFe.Dest.EnderDest.fone := OnlyAlphaNum(LerCampo(Grupo,' Fone/Fax'));
 NFe.Dest.EnderDest.UF := LerCampo(Grupo,'UF');
 NFe.Dest.EnderDest.cPais := StrToIntDef(LerCampo(Grupo,'País',4),0);
 NFe.Dest.EnderDest.xPais := copy(LerCampo(Grupo,'País'),8,60);
 if NFe.Dest.EnderDest.cPais = 0 then
 begin
   NFe.Dest.EnderDest.cPais:=1058;
   NFe.Dest.EnderDest.xPais:='Brasil';
 end;
 NFe.Dest.IE      := OnlyAlphaNum(LerCampo(Grupo,'Inscrição estadual'));
 ArquivoItens :=  SeparaAte('Dados do Transporte',ArquivoRestante,ArquivoItens);
// Grupo:=SeparaAte('Valor(R$)',ArquivoItens,ArquivoItens);
//  Grupo := copy(ArquivoItens,pos(UpperCase('Valor(R$)'),UpperCase(ArquivoItens))+9,length(ArquivoItens));
 Grupo := copy(ArquivoItens,pos(UpperCase('Valor(R$)|&|'),UpperCase(ArquivoItens))+12,length(ArquivoItens));
 Grupo:=StringReplace(Grupo,'Descrição da cor','Cor Veiculo',[rfReplaceAll,rfIgnoreCase]);
  while true do
  begin
//    ArquivoItensTemp := copy(ArquivoItens,33,length(ArquivoItens));
    if Grupo = '' then
     begin
       if pos('Num.',ArquivoItensTemp) > 0 then
        begin
          Grupo :=  ArquivoItensTemp;
          ArquivoItens := '';
        end;
       if Grupo = '' then
          Break;
     end;
    with NFe.Det.Add do
     begin
//       vtemp:='';
       if LerCampo(Grupo,'Descrição') <> '' then
//       if LerCampo(Grupo,'Num.') <> '' then
       begin
         Prod.xProd  := LerCampo(Grupo,'Descrição');
         Prod.qCom   := ConverteStrToNumero(LerCampo(Grupo,'Qtd.'));
         Prod.uCom   := LerCampo(Grupo,'Unidade Comercial');
         Prod.vUnCom := ConverteStrToNumero(LerCampo(Grupo,'Valor(R$)'));
         Prod.nItem  :=StrToIntDef(LerCampo(Grupo,'Num.'),0)
       end
       else
       begin
         Prod.nItem  :=strtoint(copy(grupo,1,pos('|&|',Grupo)-1));
         Grupo := copy(grupo,pos(UpperCase('|&|'),UpperCase(grupo))+3,length(grupo));
         Prod.xProd  :=copy(grupo,1,pos('|&|',Grupo)-1);
       end;

//         StrToIntDef(LerCampo(Grupo,'Num.'),0);
       Prod.cProd  := LerCampo(Grupo,'Código do Produto');
       Prod.NCM    := LerCampo(Grupo,'Código NCM');
       Prod.CFOP   := LerCampo(Grupo,'CFOP');
//       Prod.genero := StrToIntDef(LerCampo(Grupo,'Gênero'),0);
       Prod.vFrete  := ConverteStrToNumero(LerCampo(Grupo,'Valor Total do Frete'));
       Prod.cEAN   := LerCampo(Grupo,'Código EAN Comercial');
       Prod.qCom   := ConverteStrToNumero(LerCampo(Grupo,'Quantidade Comercial'));
       Prod.cEANTrib  := LerCampo(Grupo,'Código EAN Tributável');
       Prod.uTrib     := LerCampo(Grupo,'Unidade Tributável');
       Prod.qTrib     := ConverteStrToNumero(LerCampo(Grupo,'Quantidade Tributável'));
       Prod.vUnCom  := ConverteStrToNumero(LerCampo(Grupo,'Valor unitário de comercialização'));
       Prod.vUnTrib := ConverteStrToNumero(LerCampo(Grupo,'Valor unitário de tributação'));
       prod.vProd:=prod.qCom*prod.vUnCom;
       prod.uCom:=Prod.uTrib;
       prod.vDesc:=ConverteStrToNumero(LerCampo(Grupo,'Valor do Desconto'));
       if nfe.Emit.CRT = crtSimplesNacional then
       begin
        with Imposto.ICMS do
        begin
          orig  := StrToOrig(ok,LerCampo(Grupo,'Origem da Mercadoria',1));
          if trim(LerCampo(Grupo,'Código de Situação da Operação',1)) = '' then
           CSOSN:= StrToCSOSNIcms(ok,trim(LerCampo(Grupo,'Código de Situação da Operação – Simples Nacional',3)))
          else
           CSOSN:= StrToCSOSNIcms(ok,trim(LerCampo(Grupo,'Código de Situação da Operação',3)));

          //Modalidade Definição da BC ICMS NOR
          if LerCampo(Grupo,'Alíquota aplicável de cálculo do crédito') <> '' then
            pCredSN:= ConverteStrToNumero(trim(LerCampo(Grupo,'Alíquota aplicável de cálculo do crédito')));
          vCredICMSSN:= ConverteStrToNumero(LerCampo(Grupo,'Valor de crédito do ICMS'));
//          if pCredSN <> 0 then
//           vBC   := (vICMS*100/pICMS);
        end;
       end
       else
       begin
        with Imposto.ICMS do
        begin
          orig  := StrToOrig(ok,LerCampo(Grupo,'Origem da Mercadoria',1));
          CST   := StrToCSTICMS(ok,trim(LerCampo(Grupo,'Tributação do ICMS',3)));
          //Modalidade Definição da BC ICMS NOR
          if cst = cst70 then
          begin
            vgrupocst:= copy(grupo,pos(UpperCase('Modalidade'),UpperCase(grupo)),length(grupo));
            vBC   := ConverteStrToNumero(LerCampo(vgrupocst,'Base de Cálculo'));
            if LerCampo(vgrupocst,'Alíquota') <> '' then
              pICMS := ConverteStrToNumero(trim(LerCampo(vgrupocst,'Alíquota')));
//            else
//             pICMS := ConverteStrToNumero(trim(LerCampo(Grupo,'Alíquota ICMS Normal')));
            vICMS :=((pICMS/100)*vBC);
            //ConverteStrToNumero(LerCampo(Grupo,'Valor'));
            modBC:=StrTomodBC(ok,trim(LerCampo(vgrupocst,'Modalidade',2)));
            // ST
            modBCST:=StrTomodBCST(ok,trim(LerCampo(vgrupocst,'Modalidade de Determinação da BC do ICMS ST',1)));
            pRedBCST:=ConverteStrToNumero(LerCampo(vgrupocst,'Percentual da Redução de BC do ICMS ST'));
            pMVAST:=ConverteStrToNumero(LerCampo(vgrupocst,'Percentual da Margen de Valor Adicionado do ICMS ST'));
            vBCST:=ConverteStrToNumero(LerCampo(vgrupocst,'Valor da BC do ICMS ST'));
            pICMSST:=ConverteStrToNumero(LerCampo(vgrupocst,'Alíquota do Imposto do ICMS ST'));
            vICMSST:=ConverteStrToNumero(trim(LerCampo(vgrupocst,'Valor do ICMS ST')));
            pRedBC:=ConverteStrToNumero(trim(LerCampo(vgrupocst,'Percentual Redução de BC do ICMS Normal')));
          end
          else
          begin
            if cst = cst20 then
            begin
              vgrupocst:= copy(grupo,pos(UpperCase('Modalidade Definição da BC do ICMS'),UpperCase(grupo)),length(grupo));
              vBC   := ConverteStrToNumero(LerCampo(vgrupocst,'Base de Cálculo'));
              if LerCampo(vgrupocst,'Alíquota') <> '' then
                pICMS := ConverteStrToNumero(trim(LerCampo(vgrupocst,'Alíquota')));
  //            else
  //             pICMS := ConverteStrToNumero(trim(LerCampo(Grupo,'Alíquota ICMS Normal')));
              vICMS :=((pICMS/100)*vBC);
              //ConverteStrToNumero(LerCampo(Grupo,'Valor'));
              modBC:=StrTomodBC(ok,trim(LerCampo(vgrupocst,'Modalidade',2)));
              pRedBC:=ConverteStrToNumero(trim(LerCampo(vgrupocst,'Percentual Redução de BC do ICMS Normal')));
            end
            else
            begin
              if cst = cst10 then
              begin
               if LerCampo(grupo,'Percentual Redução de BC do ICMS ST') <> '' then
                pRedBCST:=ConverteStrToNumero(LerCampo(grupo,'Percentual Redução de BC do ICMS ST'));
              end;
              vBC   := ConverteStrToNumero(LerCampo(Grupo,'Base de Cálculo do ICMS Normal'));
              if LerCampo(Grupo,'Alíquota ICMS Normal') = '' then
                pICMS := ConverteStrToNumero(trim(LerCampo(Grupo,'Alíquota do ICMS Normal')))
              else
               pICMS := ConverteStrToNumero(trim(LerCampo(Grupo,'Alíquota ICMS Normal')));
              vICMS := ConverteStrToNumero(LerCampo(Grupo,'Valor do ICMS Normal'));
              modBC:=StrTomodBC(ok,trim(LerCampo(Grupo,'Modalidade Definição da BC ICMS NORMAL',2)));
              // ST
              modBCST:=StrTomodBCST(ok,trim(LerCampo(Grupo,'Modalidade Definição da BC ICMS ST',2)));
              vBCST:=ConverteStrToNumero(LerCampo(Grupo,'Base de Cálculo do ICMS ST'));
              pICMSST:=ConverteStrToNumero(LerCampo(Grupo,'Alíquota do ICMS ST'));
              vICMSST:=ConverteStrToNumero(trim(LerCampo(Grupo,'Valor do ICMS ST')));
              pMVAST:=ConverteStrToNumero(trim(LerCampo(Grupo,'Percentual do MVA do ICMS ST')));
            end;
          end;
        end;
       end;
        if pos(UpperCase('IMPOSTO SOBRE PRODUTOS INDUSTRIALIZADOS'),UpperCase(grupo)) > 0 then
        begin
         vgrupoipi := copy(grupo,pos(UpperCase('IMPOSTO SOBRE PRODUTOS INDUSTRIALIZADOS'),UpperCase(grupo)),length(grupo));
         with Imposto.IPI do
         begin
           cEnq := LerCampo(vgrupoipi,'Código de Enquadramento');
           vBC   := ConverteStrToNumero(LerCampo(vgrupoipi,'Base de Cálculo'));
           pIPI  := ConverteStrToNumero(LerCampo(vgrupoipi,'Alíquota'));
           if LerCampo(vgrupoipi,'Valor IPI') = '' then
             vIPI  := ConverteStrToNumero(LerCampo(vgrupoipi,'Valor'))
           else
            vIPI  := ConverteStrToNumero(LerCampo(vgrupoipi,'Valor IPI'));
           CST   := StrToCSTIPI(ok,LerCampo(vgrupoipi,'CST',2));
         end;
//         Grupo := copy(grupo,pos(UpperCase('CST'),UpperCase(grupo)),length(grupo));
//         Grupo := copy(grupo,pos(UpperCase('|&|'),UpperCase(grupo))+3,length(grupo));
        end;
        if LerCampo(Grupo,'Chassi do veículo') <> '' then
        begin
//          Grupo := copy(grupo,pos(UpperCase('DETALHAMENTO ESPECÍFICO DOS VEÍCULOS NOVOS'),UpperCase(grupo)),length(grupo));
          prod.veicProd.chassi:=LerCampo(Grupo,'Chassi do veículo');
          prod.veicProd.cCor:=LerCampo(Grupo,'Cor');
          prod.veicProd.xCor:=LerCampo(Grupo,'Cor Veiculo');
          if LerCampo(Grupo,'Potência Motor (CV)') = '' then
            Prod.veicProd.pot:=LerCampo(Grupo,'Potência Motor')
          else
            Prod.veicProd.pot:=LerCampo(Grupo,'Potência Motor (CV)');
          if LerCampo(Grupo,'CM3 (Potência)') = '' then
           Prod.veicProd.Cilin:=LerCampo(Grupo,'Cilindradas')
          else
           Prod.veicProd.Cilin:=LerCampo(Grupo,'CM3 (Potência)');
          Prod.veicProd.pesoL:=LerCampo(Grupo,'Peso Líquido');
          Prod.veicProd.pesoB:=LerCampo(Grupo,'Peso Bruto');
          Prod.veicProd.nSerie:=LerCampo(Grupo,'Serial (Série)');
          Prod.veicProd.tpComb:=LerCampo(Grupo,'Tipo de Combustível');
          Prod.veicProd.nMotor:=LerCampo(Grupo,'Número de Motor');
          if LerCampo(Grupo,'CMKG') = '' then
           Prod.veicProd.CMT:=LerCampo(Grupo,'Capacidade Máxima de Tração')
          else
           Prod.veicProd.CMT:=LerCampo(Grupo,'CMKG');
          Prod.veicProd.dist:=LerCampo(Grupo,'Distância entre eixos');
          Prod.veicProd.anoMod:=strtoint(LerCampo(Grupo,'Ano Modelo de Fabricação'));
          Prod.veicProd.anoFab:=strtoint(LerCampo(Grupo,'Ano de Fabricação'));
          Prod.veicProd.tpPint:=LerCampo(Grupo,'Tipo de Pintura');
          Prod.veicProd.tpVeic:=strtoint(LerCampo(Grupo,'Tipo de Veículo'));
          Prod.veicProd.espVeic:=strtoint(copy(LerCampo(Grupo,'Espécie de Veículo'),1,1));
          Prod.veicProd.VIN:=LerCampo(Grupo,'Condição do VIN (Vehicle Identification Number)');
          Prod.veicProd.condVeic:=cvAcabado;
          Prod.veicProd.cMod:=LerCampo(Grupo,'Código Marca Modelo');
//          if Pos('Restrição',grupo) > 0 then
//           Grupo := copy(grupo,pos(UpperCase('Restrição'),UpperCase(grupo)),length(grupo))
//          else
//           Grupo := copy(grupo,pos(UpperCase('Código Marca Modelo'),UpperCase(grupo)),length(grupo));
//          Grupo := copy(grupo,pos(UpperCase('|&|'),UpperCase(grupo))+3,length(grupo));
        end;
        while grupo <> '' do
        begin
          vposprod:=pos('|&|Código do Produto',Grupo);
          if vposprod = 0 then
           grupo:=''
          else
          begin
           grupo:=copy(grupo,vposprod+20,length(grupo));
   //        Insert('HW.',grupo,vposprod+3);
           vposprod:=pos('|&|Código do Produto',Grupo);
           if vposprod = 0 then
            grupo:=''
           else
           begin
             vposprod:=vposprod-1;
             vqtde:=0;
             while vqtde < 5 do
             begin
               while Grupo[vposprod] <> '|' do
                 vposprod:=vposprod-1;
               if (Grupo[vposprod]+Grupo[vposprod-1]+Grupo[vposprod-2]) = '|&|' then
               begin
                vposprod:=vposprod-3;
                vqtde:=vqtde+1;
               end;
             end;
             grupo:=copy(grupo,vposprod+4,length(grupo));
           end;
          end;
          if Grupo <> '' then
          begin
            if LerCampo(Grupo,'Descrição') <> '' then
              break
            else
            begin
             try
              strtoint(copy(grupo,1,pos('|&|',Grupo)-1));
              break
             except

             end;
            end;
          end;
        end;
     end;
  end;

 ArquivoRestante := copy(ArquivoRestante,pos(UpperCase('Totais'),UpperCase(ArquivoRestante)),length(ArquivoRestante));
 Grupo :=  SeparaAte('Dados do Transporte',ArquivoRestante,ArquivoItens);

 NFe.Total.ICMSTot.vBC   := ConverteStrToNumero(LerCampo(Grupo,'Base de Cálculo ICMS'));
 NFe.Total.ICMSTot.vICMS := ConverteStrToNumero(LerCampo(Grupo,'Valor do ICMS'));
 NFe.Total.ICMSTot.vBCST := ConverteStrToNumero(LerCampo(Grupo,'Base de Cálculo ICMS ST'));
 NFe.Total.ICMSTot.vST   := ConverteStrToNumero(LerCampo(Grupo,'Valor ICMS Substituição'));
 if LerCampo(Grupo,'Valor dos Produtos') <> '' then
   NFe.Total.ICMSTot.vProd := ConverteStrToNumero(LerCampo(Grupo,'Valor dos Produtos'))
 else
  NFe.Total.ICMSTot.vProd := ConverteStrToNumero(LerCampo(Grupo,'Valor Total dos Produtos'));

 NFe.Total.ICMSTot.vFrete:= ConverteStrToNumero(LerCampo(Grupo,'Valor do Frete'));
 NFe.Total.ICMSTot.vSeg  := ConverteStrToNumero(LerCampo(Grupo,'Valor do Seguro'));
 NFe.Total.ICMSTot.vOutro := ConverteStrToNumero(LerCampo(Grupo,'Outras Despesas Acessórias'));
 if LerCampo(Grupo,'Valor do IPI') <> '' then
   NFe.Total.ICMSTot.vIPI  := ConverteStrToNumero(LerCampo(Grupo,'Valor do IPI'))
 else
   NFe.Total.ICMSTot.vIPI  := ConverteStrToNumero(LerCampo(Grupo,'Valor Total do IPI'));

 NFe.Total.ICMSTot.vNF   := ConverteStrToNumero(LerCampo(Grupo,'Valor Total da NFe'));
 if LerCampo(Grupo,'Valor dos Descontos') <> '' then
   NFe.Total.ICMSTot.vDesc := ConverteStrToNumero(LerCampo(Grupo,'Valor dos Descontos'))
 else
  NFe.Total.ICMSTot.vDesc := ConverteStrToNumero(LerCampo(Grupo,'Valor Total dos Descontos'));

 NFe.Total.ICMSTot.vII   := ConverteStrToNumero(LerCampo(Grupo,'Valor do II'));
 NFe.Total.ICMSTot.vPIS  := ConverteStrToNumero(LerCampo(Grupo,'Valor do PIS'));
 NFe.Total.ICMSTot.vCOFINS := ConverteStrToNumero(LerCampo(Grupo,'Valor da COFINS'));

 ArquivoRestante := copy(ArquivoRestante,pos(UpperCase('Dados do Transporte'),UpperCase(ArquivoRestante)),length(ArquivoRestante));
 if pos('Dados de Cobrança',ArquivoRestante) > 0 then
  Grupo :=  SeparaAte('Dados de Cobrança',ArquivoRestante,ArquivoItens)
 else
  Grupo :=  SeparaAte('Informações Adicionais',ArquivoRestante,ArquivoItens);


 NFe.Transp.modFrete := StrTomodFrete( ok, LerCampo(Grupo,'Modalidade do Frete',1) );

 NFe.Transp.Transporta.CNPJCPF := OnlyNumber(LerCampo(Grupo,'CNPJ'));
 NFe.Transp.Transporta.xNome   := LerCampo(Grupo,'Razão Social / Nome');
 NFe.Transp.Transporta.IE      := LerCampo(Grupo,'Inscrição Estadual');
 NFe.Transp.Transporta.xEnder  := LerCampo(Grupo,'Endereço Completo');
 NFe.Transp.Transporta.xMun    := LerCampo(Grupo,'Município');
 NFe.Transp.Transporta.UF      := LerCampo(Grupo,'UF');

 // Volumes
 if pos('VOLUMES',UpperCase(Grupo)) > 0 then
  begin
    i := 0;
    posIni := pos('VOLUMES',UpperCase(Grupo)) + Length('VOLUMES') + 3;
    ArquivoVolumes := copy(Grupo,posIni,length(Grupo));
    while True do
     begin
       NFe.Transp.Vol.Add;
       NFe.Transp.Vol[i].qVol  := StrToIntDef(LerCampo(Grupo,'Quantidade'),0);
       NFe.Transp.vol[i].esp   := LerCampo(Grupo,'Espécie');
       NFe.Transp.Vol[i].marca := LerCampo(Grupo,'Marca dos Volumes');
       NFe.Transp.Vol[i].nVol  := LerCampo(Grupo,'Numeração');
       NFe.Transp.Vol[i].pesoL := ConverteStrToNumero(LerCampo(Grupo,'Peso Líquido'));
       NFe.Transp.Vol[i].pesoB := ConverteStrToNumero(LerCampo(Grupo,'Peso Bruto'));
       Inc(i);
       break;
       // Falta rotina para pegar vários volumes
     end;
  end;


 Grupo :=  SeparaAte('Informações Adicionais',ArquivoRestante,ArquivoItens);

 NFe.Cobr.Fat.nFat  := LerCampo(Grupo,'Número');
 NFe.Cobr.Fat.vOrig := ConverteStrToNumero(LerCampo(Grupo,'Valor Original'));
 NFe.Cobr.Fat.vDesc := ConverteStrToNumero(LerCampo(Grupo,'Valor Desconto'));
 NFe.Cobr.Fat.vLiq  := ConverteStrToNumero(LerCampo(Grupo,'Valor Líquido'));

 //Duplicatas
(* if pos('DUPLICATAS',UpperCase(Grupo)) > 0 then
  begin
    i := 0;
    posIni := pos('DUPLICATAS',UpperCase(Grupo)) + Length('DUPLICATAS') + 3;
    ArquivoDuplicatas := copy(Grupo,posIni,length(Grupo));
    posIni := pos('VALOR',UpperCase(ArquivoDuplicatas)) + Length('VALOR') + 4;
    ArquivoDuplicatas := copy(ArquivoDuplicatas,posIni,Length(ArquivoDuplicatas));
    while True do
     begin
       NFe.Cobr.Dup.Add;
       NFe.Cobr.Dup[i].nDup  := copy(ArquivoDuplicatas,1,pos('|&|',ArquivoDuplicatas)-1);
       ArquivoDuplicatas := copy(ArquivoDuplicatas,pos('|&|',ArquivoDuplicatas)+ 3,Length(ArquivoDuplicatas));
       NFe.Cobr.Dup[i].dVenc := StrToDateDef(copy(ArquivoDuplicatas,1,pos('|&|',ArquivoDuplicatas)-1),0);;
       ArquivoDuplicatas := copy(ArquivoDuplicatas,pos('|&|',ArquivoDuplicatas)+ 3,Length(ArquivoDuplicatas));
       NFe.Cobr.Dup[i].vDup  := ConverteStrToNumero(copy(ArquivoDuplicatas,1,pos('|&|',ArquivoDuplicatas)-1));;;
       ArquivoDuplicatas := copy(ArquivoDuplicatas,pos('|&|',ArquivoDuplicatas)+ 3,Length(ArquivoDuplicatas));
       Inc(i);
       if Length(ArquivoDuplicatas) <= 4 then
          break;
     end;
  end;*)

 Grupo := ArquivoItens;
 if pos('INFORMAÇÕES COMPLEMENTARES DE INTERESSE DO FISCO',UpperCase(Grupo)) > 0 then
  begin
    posIni := pos('INFORMAÇÕES COMPLEMENTARES DE INTERESSE DO FISCO',UpperCase(Grupo)) + Length('INFORMAÇÕES COMPLEMENTARES DE INTERESSE DO FISCO') + 4 ;
    posFim := pos('|&|',UpperCase(copy(Grupo,posIni,length(Grupo))))-1;
    NFe.InfAdic.infAdFisco := copy(Grupo,posIni,posFim);
  end;
 if pos('INFORMAÇÕES COMPLEMENTARES DE INTERESSE DO CONTRIBUINTE',UpperCase(Grupo)) > 0 then
  begin
    posIni := pos('INFORMAÇÕES COMPLEMENTARES DE INTERESSE DO CONTRIBUINTE',UpperCase(Grupo)) + Length('INFORMAÇÕES COMPLEMENTARES DE INTERESSE DO CONTRIBUINTE') + 4 ;
    posFim := pos('|&|',UpperCase(copy(Grupo,posIni,length(Grupo))))-1;
    NFe.InfAdic.infCpl     := copy(Grupo,posIni,posFim);
  end;

 GeradorXML := TNFeW.Create(NFe);
 try
//    GeradorXML.Versao:=2;
    //schema := TsPL005c;
    GeradorXML.GerarXml;
    CaminhoXML := PathWithDelim(ExtractFilePath(Application.ExeName))+'consultasitenfe\'+copy(NFe.infNFe.ID, (length(NFe.infNFe.ID)-44)+1, 44)+'-nfe.xml';
//    NFe.infNFe.ID+'-nfe.xml';
    //copy(NFe.infNFe.ID, (length(NFe.infNFe.ID)-44)+1, 44)+'-nfe.xml';
    GeradorXML.Gerador.SalvarArquivo(CaminhoXML);
    Result := CaminhoXML;
 finally
    GeradorXML.Free;
 end;

 NFe.Free;
end;

{ // Antes eu procurava os itens assim....
if pos(UpperCase('IMPOSTO DE IMPORTAÇÃO'),UpperCase(grupo)) > 0 then
        begin
         Grupo := copy(grupo,pos(UpperCase('IMPOSTO DE IMPORTAÇÃO'),UpperCase(grupo)),length(grupo));
         Grupo := copy(grupo,pos(UpperCase('IOF'),UpperCase(grupo)),length(grupo));
         Grupo := copy(grupo,pos(UpperCase('|&|'),UpperCase(grupo))+3,length(grupo));
        end
        else
        if pos(UpperCase('IMPOSTO SOBRE PRODUTOS INDUSTRIALIZADOS'),UpperCase(grupo)) > 0 then
        begin
         Grupo := copy(grupo,pos(UpperCase('IMPOSTO SOBRE PRODUTOS INDUSTRIALIZADOS'),UpperCase(grupo)),length(grupo));
         with Imposto.IPI do
         begin
           cEnq := LerCampo(Grupo,'Código de Enquadramento');
           vBC   := ConverteStrToNumero(LerCampo(Grupo,'Base de Cálculo'));
           pIPI  := ConverteStrToNumero(LerCampo(Grupo,'Alíquota'));
           if LerCampo(Grupo,'Valor IPI') = '' then
             vIPI  := ConverteStrToNumero(LerCampo(Grupo,'Valor'))
           else
            vIPI  := ConverteStrToNumero(LerCampo(Grupo,'Valor IPI'));
           CST   := StrToCSTIPI(ok,LerCampo(Grupo,'CST',2));
         end;
         Grupo := copy(grupo,pos(UpperCase('CST'),UpperCase(grupo)),length(grupo));
         Grupo := copy(grupo,pos(UpperCase('|&|'),UpperCase(grupo))+3,length(grupo));
        end
        else
        begin
          Grupo := copy(grupo,pos(UpperCase('ICMS NORMAL e ST'),UpperCase(grupo)),length(grupo));
          if pos(UpperCase('Modalidade Definição da BC ICMS ST'),UpperCase(grupo)) > 0 then
           Grupo := copy(grupo,pos(UpperCase('Modalidade Definição da BC ICMS ST'),UpperCase(grupo)),length(grupo))
          else
            if pos(UpperCase('Valor do ICMS ST'),UpperCase(grupo)) > 0 then
              Grupo := copy(grupo,pos(UpperCase('Valor do ICMS ST'),UpperCase(grupo)),length(grupo))
            else
             if pos(UpperCase('Valor do ICMS Normal'),UpperCase(grupo)) > 0 then
              Grupo := copy(grupo,pos(UpperCase('Valor do ICMS Normal'),UpperCase(grupo)),length(grupo))
             else
              if pos(UpperCase('Código de Tributação do ISSQN'),UpperCase(grupo)) > 0 then
               Grupo := copy(grupo,pos(UpperCase('Código de Tributação do ISSQN'),UpperCase(grupo)),length(grupo));
          Grupo := copy(grupo,pos(UpperCase('|&|'),UpperCase(grupo))+3,length(grupo));
        end;
}
end.
