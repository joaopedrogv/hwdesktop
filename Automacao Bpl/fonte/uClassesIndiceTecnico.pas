unit uClassesIndiceTecnico;

interface

uses
   uDataSet_OOP, DBClient, DB, IBQuery, Provider, StdCtrls, IBDatabase, RDprint;

type

  TIndiceTecnico = class;
  TProduto_IndTec = class;
  TProdutosAcabado = class;
  TProdutosAcabadoGrade = class;
  TMateriasPrima = class;
  TMateriasPrimaGrade = class;
  TConsProdutoAcabado = class;
  TConsMateriaPrimaProdutoAcabado = class;

  TConsProdutoAcabado = class(TDataSet_OOP)
  public
    constructor create;
    destructor destroy; override;
    procedure _abreConsProdutoAcabado(Grupo_Prod, Cod_Prod: string);
    procedure datasetAfterScrollConsMateriaPrima(DataSet: TDataSet);
  var
  	vConsMateriaPrimaProdutoAcabado: TConsMateriaPrimaProdutoAcabado;
  end;

  TConsMateriaPrimaProdutoAcabado = class(TDataSet_OOP)
  public
    constructor create;
    procedure _abreConsMateriaPrimaProdutoAcabado(Grupo_Prod, Cod_Prod: string; CodGrade: Integer; IdInd: Integer);
  end;

  TProdutosAcabado = class(TDataSet_OOP)
  private
  	destructor destroy; override;
  public
	  constructor create;
    function abreProdutosAcabado(pIdInd: Integer): boolean; overload;
    function abreProdutosAcabado(pGrupoProd: Integer; pCodProd: string): boolean; overload;
  var
  	vGradeAcab: TProdutosAcabadoGrade;
    vMateriasPrima: TMateriasPrima;
  end;

  TProdutosAcabadoGrade = class(TDataSet_OOP)
  private
  public
	  constructor create;
    function abreGrade(pCodGrade: Integer): boolean; overload;
    function abreProdutosAcabadoGrade(pGrupoProd: Integer; pCodProd: string; pCodGrade: Integer): boolean; overload;
    function abreProdutosAcabadoGrade(pGrupoProd: Integer; pCodProd: string): boolean; overload;
  end;

  TMateriasPrima = class(TDataSet_OOP)
  private
  	destructor destroy; override;
  public
	  constructor create;
    function abreMateriasPrima(pIdInd: Integer): boolean; overload;
    function abreMateriasPrima(pGrupoProdAcabado: Integer; pCodProdAcabado: string): boolean; overload;
    function abreMateriasPrima(pGrupoProdMPrima: Integer; pCodProdMPrima: string; pCodGradeMprima: Integer; pIdInd: Integer): boolean; overload;
    function abreMateriasPrima(pIdInd: Integer; pIdIndIt: Integer; pGrupoProdMPrima: Integer; pCodProdMPrima: string): boolean; overload;
  var
    vGradeMatPrima:	TMateriasPrimaGrade;
  end;

  TMateriasPrimaGrade = class(TDataSet_OOP)
  private
  public
	  constructor create;
    function abreMateriasPrimaGrade(pGrupoProd: Integer; pCodProd: string): boolean;
  end;

  TIndiceTecnico = class (TDataSet_OOP)
  private
  	destructor destroy; override;
  public
    constructor create;

    function insert : Boolean; override;
    function cancel : Boolean; override;
    function delete  : Boolean; override;
    function post : Boolean; override;


    procedure cadIndiceTecnico (TipoForm : Integer;CodProd:string);
    function _AbreIndice : Boolean;
    function _PesquisaIndice(Codprod : string; CodGrupo: integer): boolean; overload;
    function _PesquisaIndice : Boolean; overload;
    function abreIndiceTecnico : Boolean;
    function pesquisaProduto(vit: integer): Boolean;
    function pesquisaProdutoIndice: Boolean;
    function testarItens: boolean;
    function inserirItem: Boolean;
    function _AlterarItem: Boolean;
    function _ExcluirItem: Boolean;
    function pesqitemjacadastrado: boolean;
    function _PesquisaNumFab : string;

    function PesquisaIndices_ProdutosAcabados : Boolean;
    function PesquisaIndice_materiaPrima (Cod_prod:string; grupo_prod:string) : Boolean;
    function _PesqRecProd(Cod_recprod : integer) : string;


    procedure PesquisaIndicesAfterScroll(DataSet: TDataSet);
    function selecionarIndiceTecnico : Boolean;
    function alterarGradeMateriaPrima(pConsProdutoAcabado: TConsProdutoAcabado): boolean;


  var
    vProduto : TProduto_IndTec;
    vProdutosAcabado: TProdutosAcabado;

    // usada na função PesquisaProduto.
    vcodprod : string;
    // usadas no cadastro do Indice T.
    vcod_prod_acabado : string;
    vgrupo_prod_acabado : string;
    vcod_prod_mp : string;
    vdescr_prod_mp : string;
    vgrupo_prod_mp : string;
    vquant_mp : Double;
    vtipoitem : string;

    vInseriuItem : Boolean;

    // usadas na tela de pesquisa
    vcod_prod_pesq : string;
    vgrupo_prod_pesq : string;

  end;


  TProduto_IndTec = class (TDataSet_OOP)
  public
     constructor create;
  var
  end;


implementation

uses
  SysUtils, Forms, Windows, Controls, uPadrao, ExtCtrls, Variants, Classes, IBScript,
  uDtmAtivo, uDadosIni, udtmprodutos, uIndiceTecnico, UVisualizarAcabadoMateriasPrimas;

{ TIndiceTecnico }
function TIndiceTecnico.abreIndiceTecnico: Boolean;
begin
   Result := montaSelect('select ii.*, pp.descr_prod' +
     ' from INDICE_TECNICO Ii' +
     ' inner join produtos pp on pp.grupo_prod = ii.grupo_prod_mprima and' +
     ' pp.cod_prod = ii.cod_prod_mprima and pp.cod_empresa = ii.cod_empresa' +
     ' where' +
     ' ii.grupo_prod_acabado = 0 and ii.cod_prod_acabado = '''' and' +
     ' ii.grupo_prod_mprima = 0 and ii.cod_prod_mprima = ''''');
   dtmprodutos.qrBuscas02.AfterScroll := PesquisaIndicesAfterScroll;
end;

function TIndiceTecnico.alterarGradeMateriaPrima(pConsProdutoAcabado: TConsProdutoAcabado): boolean;
var
	vCodGrade: Integer;
  vQuant: Double;
begin
	try
  	Result := False;

    if pConsProdutoAcabado.vConsMateriaPrimaProdutoAcabado.dataSet.IsEmpty then
    	exit;

    vProdutosAcabado.vMateriasPrima.abreMateriasPrima(
    	pConsProdutoAcabado.vConsMateriaPrimaProdutoAcabado.dataSet.FieldByName('GRUPO_PROD').AsInteger,
      pConsProdutoAcabado.vConsMateriaPrimaProdutoAcabado.dataSet.FieldByName('COD_PROD').AsString,
      vProdutosAcabado.vMateriasPrima.vGradeMatPrima.dataSet.FieldByName('COD_GRADE').AsInteger,
    	pConsProdutoAcabado.vConsMateriaPrimaProdutoAcabado.dataSet.FieldByName('ID_IND').AsInteger);

    if not vProdutosAcabado.vMateriasPrima.dataSet.IsEmpty then
    begin
    	vCodGrade := vProdutosAcabado.vMateriasPrima.vGradeMatPrima.dataSet.FieldByName('COD_GRADE').AsInteger;
    	vQuant := 0;
      while not vProdutosAcabado.vMateriasPrima.dataSet.Eof do
      begin
        vQuant := vQuant + vProdutosAcabado.vMateriasPrima.dataSet.FieldByName('QUANT').AsFloat;

        vProdutosAcabado.vMateriasPrima.dataSet.Delete;
      end;

      if vProdutosAcabado.vMateriasPrima.dataSet.ChangeCount > 0 then
      	Result := vProdutosAcabado.vMateriasPrima.Apply;

      vProdutosAcabado.vMateriasPrima.abreMateriasPrima(
        pConsProdutoAcabado.vConsMateriaPrimaProdutoAcabado.dataSet.FieldByName('ID_IND').AsInteger,
        pConsProdutoAcabado.vConsMateriaPrimaProdutoAcabado.dataSet.FieldByName('ID_IND_IT').AsInteger,
        pConsProdutoAcabado.vConsMateriaPrimaProdutoAcabado.dataSet.FieldByName('GRUPO_PROD').AsInteger,
        pConsProdutoAcabado.vConsMateriaPrimaProdutoAcabado.dataSet.FieldByName('COD_PROD').AsString);

      if not vProdutosAcabado.vMateriasPrima.dataSet.IsEmpty then
      begin
	    	vProdutosAcabado.vMateriasPrima.Edit;
        vProdutosAcabado.vMateriasPrima.dataSet.FieldByName('COD_GRADE').AsInteger :=
        	vCodGrade;
  	    vProdutosAcabado.vMateriasPrima.dataSet.FieldByName('QUANT').AsFloat :=
    	  	vProdutosAcabado.vMateriasPrima.dataSet.FieldByName('QUANT').AsFloat + vQuant;
	      vProdutosAcabado.vMateriasPrima.Post;

	      if vProdutosAcabado.vMateriasPrima.dataSet.ChangeCount > 0 then
        	Result := vProdutosAcabado.vMateriasPrima.Apply;

        if Result then
        	vProdutosAcabado.vMateriasPrima.CommitaTransacao;
      end;
    end
    else
    begin
    	vCodGrade := vProdutosAcabado.vMateriasPrima.vGradeMatPrima.dataSet.FieldByName('COD_GRADE').AsInteger;

    	vProdutosAcabado.vMateriasPrima.abreMateriasPrima(
        pConsProdutoAcabado.vConsMateriaPrimaProdutoAcabado.dataSet.FieldByName('ID_IND').AsInteger,
        pConsProdutoAcabado.vConsMateriaPrimaProdutoAcabado.dataSet.FieldByName('ID_IND_IT').AsInteger,
        pConsProdutoAcabado.vConsMateriaPrimaProdutoAcabado.dataSet.FieldByName('GRUPO_PROD').AsInteger,
        pConsProdutoAcabado.vConsMateriaPrimaProdutoAcabado.dataSet.FieldByName('COD_PROD').AsString);

      if not vProdutosAcabado.vMateriasPrima.dataSet.IsEmpty then
      begin
        vProdutosAcabado.vMateriasPrima.dataSet.Edit;
        vProdutosAcabado.vMateriasPrima.dataSet.FieldByName('COD_GRADE').AsInteger :=
        	vCodGrade;
        vProdutosAcabado.vMateriasPrima.dataSet.Post;

        if vProdutosAcabado.vMateriasPrima.dataSet.ChangeCount > 0 then
        	Result := vProdutosAcabado.vMateriasPrima.Apply;

        if Result then
        	vProdutosAcabado.vMateriasPrima.CommitaTransacao;
      end;
    end;

  	Result := True;
  except
    on E: Exception do
    begin
      result := False;
      Application.MessageBox(pchar('Erro: ' + e.Message ), 'Atenção', 0 + 64);
    end;
  end;
end;

procedure TIndiceTecnico.cadIndiceTecnico(TipoForm: Integer;CodProd :string);
begin
  vDadosIni.vTipoForm := TipoForm;
  if dtmprodutos = nil then
     dtmprodutos := Tdtmprodutos.Create(dtmprodutos);
  if frmIndiceTecnico = nil then
     Application.CreateForm(TfrmIndiceTecnico,frmIndiceTecnico);

  frmIndiceTecnico.Show;
  frmIndiceTecnico._InserirCodigoProduto(trim(CodProd));
end;

function TIndiceTecnico.cancel: Boolean;
begin
   inherited cancel;
   RollBackTransacao;
end;

constructor TIndiceTecnico.create;
begin
	 if dtmProdutos = nil then
    dtmProdutos := TdtmProdutos.Create(dtmProdutos);
   dataSet := TClientDataSet(dtmprodutos.cdsIndiceTec);
   buscas := TIBQuery(dtmprodutos.qrBuscas);
   transacao := TIBTransaction(dtmprodutos.IBTransIndiceTec); 

   vProduto := TProduto_IndTec.create;
   vProdutosAcabado := TProdutosAcabado.create;
end;

function TIndiceTecnico.delete: Boolean;
begin
   Result := False;
   if Application.MessageBox('Deseja remover matéria prima / insumo / embalagem?',
     'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> idyes then
       exit;
   if not dataSet.IsEmpty then
   begin
      if inherited Delete then
      begin
        if dataSet.ApplyUpdates(-1) = 0 then
          Result := True;
        dataSet.OnReconcileError := nil;
        if result then
         result := CommitaTransacao;

         Result := True;
      end;
   end
   else
      Result := True;
end;

destructor TIndiceTecnico.destroy;
begin
	vProduto.Free;
  vProduto := nil;
	vProdutosAcabado.Free;
  vProdutosAcabado := nil;
  inherited;
end;

function TIndiceTecnico.InserirItem: Boolean;
begin
	Result := False;
  vInseriuItem := False;

  try
     if not testarItens then
     begin
     	 Result := False;
       exit;
     end;

     if Insert then
     begin
        dataSet.FieldByName('grupo_prod_acabado').AsString := vgrupo_prod_acabado;
        dataSet.FieldByName('cod_prod_acabado').AsString := vcod_prod_acabado;
        dataSet.FieldByName('grupo_prod_mprima').AsString := vgrupo_prod_mp;
        dataSet.FieldByName('cod_prod_mprima').AsString := vcod_prod_mp;
        dataSet.FieldByName('num_fab_mprima').AsString := vcodprod;
        dataSet.FieldByName('quant').AsFloat := vquant_mp;
        dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
        dataSet.FieldByName('descr_prod').AsString := vdescr_prod_mp;
     end;

     Result := inherited Post;

     if Result then
	     Result := Apply;

     if Result then
       Result := CommitaTransacao;

     vInseriuItem := True;

     if (vDadosIni.vEmp.vUsarProducao = 'S') then
     begin
       if vDadosIni.produtoAcabadoPrimaTemGrade(
         buscas,
         StrToInt(vgrupo_prod_acabado),
         vcod_prod_acabado,
         StrToInt(vgrupo_prod_mp),
         vcod_prod_mp) then
       begin
         if vDadosIni.existeGradeProducao(
           buscas,
           StrToInt(vgrupo_prod_acabado),
           vcod_prod_acabado,
           StrToInt(vgrupo_prod_mp),
           vcod_prod_mp) then
         begin
           if not vDadosIni.vincularProdutoAcabadoMateriaPrima(
           	 buscas,
             StrToInt(vgrupo_prod_acabado),
             vcod_prod_acabado,
             0,
             StrToInt(vgrupo_prod_mp),
             vcod_prod_mp,
             vquant_mp,
             True) then
               exit;
         end;
        end;
     end;

  Except
  	on E: Exception do
		begin
     Result := False;
     vDadosIni.registraErro(e.Message);
     Application.MessageBox('Erro ao tentar inserir Indice Técnico','Atenção', MB_ICONINFORMATION + MB_OK);
		end;
 end;
end;

function TIndiceTecnico.insert: Boolean;
begin
  Result := False;

  if not dataSet.Active then
    montaSelect('select ii.*, pp.descr_prod' +
     ' from INDICE_TECNICO Ii' +
     ' inner join produtos pp on pp.grupo_prod = ii.grupo_prod_mprima and' +
     ' pp.cod_prod = ii.cod_prod_mprima and pp.cod_empresa = ii.cod_empresa' +
     ' where' +
      ' ii.grupo_prod_acabado = 0 and ii.cod_prod_acabado = '''' and' +
      ' ii.grupo_prod_mprima = 0 and ii.cod_prod_mprima = ''''' );
  if inherited Insert then
    result := True;

end;

function TIndiceTecnico.pesqitemjacadastrado: boolean;
var
 vflag: integer;
begin
  Result:=true;
{  buscas.close;
  buscas.SQL.text:='SELECT count(*) as qtde from indice_tecnico where GRUPO_PROD_ACABADO = '+
  vgrupo_prod_acabado+' and COD_PROD_ACABADO = '''+vcod_prod_acabado+''' and '+
  'GRUPO_PROD_MPRIMA = '+vgrupo_prod_mp+' AND COD_PROD_MPRIMA = '''+vcod_prod_mp+
  ''' AND COD_EMPRESA = '+vDadosIni.codEmpresa;
  buscas.open;}
  dataset.first;
  vflag:=0;
  while not dataset.Eof do
  begin
    if (trim(dataset.FieldByName('GRUPO_PROD_ACABADO').AsString) = trim(vgrupo_prod_acabado))
    and (trim(dataset.FieldByName('COD_PROD_ACABADO').AsString) = trim(vcod_prod_acabado))
    and (trim(dataset.FieldByName('GRUPO_PROD_MPRIMA').AsString) = trim(vgrupo_prod_mp))
    and (trim(dataset.FieldByName('COD_PROD_MPRIMA').AsString) = trim(vcod_prod_mp)) then
      vflag:=1;
    dataSet.next;
  end;
  if vflag = 1 then
  begin
   Application.MessageBox('Insumo já cadastro para o Produto em questão, verifique!', 'Atenção', MB_ICONINFORMATION + MB_OK);
   Result:=true;
  end
  else
   result:=false;
end;

procedure TIndiceTecnico.PesquisaIndicesAfterScroll(DataSet: TDataSet);
begin
    PesquisaIndice_materiaPrima(dtmprodutos.qrBuscas02.FieldByName('cod_prod_acabado').AsString,
      dtmprodutos.qrBuscas02.FieldByName('grupo_prod_acabado').AsString);
end;

function TIndiceTecnico.PesquisaIndices_ProdutosAcabados: Boolean;
begin
   with dtmprodutos do
   begin
       qrBuscas02.Close;
       qrBuscas02.SQL.Clear;
       qrBuscas02.SQL.Add('select it.grupo_prod_acabado, it.cod_prod_acabado, pr.descr_prod, pr.num_fab_prod '+
                          ' from indice_tecnico it '+
                          ' inner join produtos pr on it.cod_prod_acabado = pr.cod_prod and it.grupo_prod_acabado = pr.grupo_prod and it.cod_empresa = pr.cod_empresa '+
                          ' where it.cod_prod_acabado = '+ QuotedStr(vcod_prod_pesq) +
                          ' and it.grupo_prod_acabado = '+ vgrupo_prod_pesq +
                          ' and it.cod_empresa = '+ vDadosIni.codEmpresa +
                          ' group by 1,2,3,4 ');
       qrBuscas02.Open;

       if not qrBuscas02.IsEmpty then
       begin
          Result := True;
       end
       else
       begin
          Result := False;
          Application.MessageBox('Não foi encontrado Índice Técnico deste produto, verifique!', 'Atenção', MB_ICONINFORMATION + MB_OK);
       end;
   end;

end;

function TIndiceTecnico.PesquisaIndice_materiaPrima (cod_prod : string; grupo_prod :string) : Boolean;
begin

    if (Cod_prod = '') or (grupo_prod = '') then
       Exit
    else
    begin
       montaSelect('select ii.*, pp.descr_prod from indice_tecnico Ii' +
         ' inner join produtos pp on pp.grupo_prod = ii.grupo_prod_mprima and' +
         ' pp.cod_prod = ii.cod_prod_mprima and pp.cod_empresa = ii.cod_empresa'+
         ' where ii.cod_prod_acabado = ' + QuotedStr(Cod_prod) +
         ' and ii.grupo_prod_acabado = ' + grupo_prod +
         ' and ii.cod_empresa = ' + vDadosIni.codEmpresa +
         ' order by pp.descr_prod, pp.grupo_prod, pp.cod_prod ');

       if dataSet.IsEmpty then
          Result := False
       else
          Result := True;
    end;
    
end;

function TIndiceTecnico.PesquisaProduto(vit: integer): Boolean;
var
 vtipo: string;
begin

    vProduto.buscas.Close;
    vProduto.buscas.SQL.Clear;
    vtipo:=vDadosIni.StrZero(vit,2);
    vProduto.buscas.SQL.Add('select cod_prod, grupo_prod, descr_prod, unidade, cod_recprod from produtos   '+
                            ' where num_fab_prod = '+QuotedStr( vcodprod )+
                            ' and cod_empresa = '+ vDadosIni.codEmpresa+' and tipo_item = '''+vtipo+''' and ativo = 1 ');
    vProduto.buscas.Open;

    if vProduto.buscas.IsEmpty then
        Result := False;
end;

function TIndiceTecnico.pesquisaProdutoIndice: Boolean;
begin
    vProduto.buscas.Close;
    vProduto.buscas.SQL.Clear;
        vProduto.buscas.SQL.Add('select cod_prod, grupo_prod, descr_prod,'
    +' unidade, cod_recprod from produtos   '
    +' where num_fab_prod = '+QuotedStr( vcodprod )
    +' and cod_empresa = '+ vDadosIni.codEmpresa
    +' and (tipo_item <> '''' or tipo_item is not null) '
    +' and ativo = 1 ');
    vProduto.buscas.Open;

    if vProduto.buscas.IsEmpty then
        Result := False;

end;

function TIndiceTecnico.post: Boolean;
begin

  vInseriuItem := False;
  Try
    if dataSet.ChangeCount = 0 then
    begin
      Result := True;
      exit;
    end;

    if Apply then
    begin
      CommitaTransacao;
    end
    else
    begin
       Cancel;
       RollBackTransacao;
       Result := False;
    end;
    Refresh;
  Except
    on e: Exception do
    begin
      Result := False;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
  
end;

function TIndiceTecnico.selecionarIndiceTecnico: Boolean;
begin

   if not dataSet.IsEmpty  then
   begin
      Result := True;
   end
   else
   begin
      Result := False;
   end;

end;

function TIndiceTecnico.testarItens: boolean;
begin
	if Trim (vcod_prod_acabado) = '' then
  begin
    Application.MessageBox('Produto acabado não selecionado, verifique!','Atenção', MB_ICONINFORMATION + MB_OK);
    Result := False;
    exit;
  end;

  if Trim (vcod_prod_mp) = '' then
  begin
    Application.MessageBox('Produto matéria-prima não selecionado, verifique!','Atenção', MB_ICONINFORMATION + MB_OK);
    Result := False;
    exit;
  end;

  if vquant_mp <= 0 then
  begin
    Application.MessageBox('Quantidade da matéria-prima não informada, verifique!','Atenção', MB_ICONINFORMATION + MB_OK);
    Result := False;
    exit;
  end;

  if (vgrupo_prod_acabado = vgrupo_prod_mp)
    and (trim(vcod_prod_acabado) = trim(vcod_prod_mp)) then
  begin
    Application.MessageBox('Matéria prima e produto acabado não podem ser o mesmo produto, verifique!','Atenção', MB_ICONINFORMATION + MB_OK);
    Result := False;
    exit;
  end;

  dataSet.First;
  while not dataSet.Eof do
  begin
    if (dataSet.FieldByName('grupo_prod_mprima').AsString = vgrupo_prod_acabado)
    	and (Trim(dataSet.FieldByName('cod_prod_mprima').AsString) = Trim(vcod_prod_acabado)) then
    begin
      Application.MessageBox('Matéria prima e produto acabado não podem ser o mesmo produto, verifique!','Atenção', MB_ICONINFORMATION + MB_OK);
      Result := False;
      exit;
    end;
    dataSet.Next;
  end;

  dataSet.First;
  while not dataSet.Eof do
  begin
    if (dataSet.FieldByName('grupo_prod_mprima').AsString = vgrupo_prod_mp)
    	and (Trim(dataSet.FieldByName('cod_prod_mprima').AsString) = Trim(vcod_prod_mp)) then
    begin
      Application.MessageBox('Matéria prima informada já existe, verifique!','Atenção', MB_ICONINFORMATION + MB_OK);
      Result := False;
      exit;
    end;
    dataSet.Next;
  end;

  if not vDadosIni.verificarRecursividadeMateriasPrimas(
    buscas,
    StrToInt(vgrupo_prod_acabado),
    vcod_prod_acabado,
    StrToInt(vgrupo_prod_acabado),
    vcod_prod_acabado) then
  begin
    Result := False;
    exit;
  end;

  if not vDadosIni.verificarRecursividadeMateriasPrimas(
    buscas,
    StrToInt(vgrupo_prod_acabado),
    vcod_prod_acabado,
    StrToInt(vgrupo_prod_mp),
    vcod_prod_mp) then
  begin
    Result := False;
    exit;
  end;

  Result := True;
end;

function TIndiceTecnico._AbreIndice: Boolean;
begin
     Result := montaSelect('select ii.*, pp.descr_prod' +
     ' from INDICE_TECNICO Ii' +
     ' inner join produtos pp on pp.grupo_prod = ii.grupo_prod_mprima and' +
     ' pp.cod_prod = ii.cod_prod_mprima and pp.cod_empresa = ii.cod_empresa' +
     ' where' +
     ' ii.grupo_prod_acabado = 0 and ii.cod_prod_acabado = '''' and' +
     ' ii.grupo_prod_mprima = 0 and ii.cod_prod_mprima = ''''');
    
end;

function TIndiceTecnico._AlterarItem: Boolean;
begin
  if (not(dataSet.RecordCount > 0)) then
  begin
    Application.MessageBox('O indice técnico não possuí itens para edição','Indice técnico',0);
    Result := false;
    exit;
  end
  else
  begin
    if Edit then
    begin
      dataSet.FieldByName('quant').AsCurrency := vquant_mp;
      //dataSet.FieldByName('tipo_item').AsString := obIndiceTecnico.vtipoitem;
      //dataSet.FieldByName('num_fab_mprima').AsString := vcodprod;
      Result := inherited Post;

      if Result then
        Result := Apply;

      if Result then
	      Result := CommitaTransacao;
    end
    else
    begin
      Application.MessageBox('O correu um erro na edição do indice técnico, por favor tente novamente','Indice técnico',0);
      Result:= False;
      exit;
    end;
  end;

  if not vDadosIni.deletarVinculosGradeMateriaPrima(
  	buscas,
	  StrToInt(vgrupo_prod_acabado),
	  vcod_prod_acabado,
	  StrToInt(vgrupo_prod_mp),
	  vcod_prod_mp) then
    exit;

  if (vDadosIni.vEmp.vUsarProducao = 'S') then
  begin
   if vDadosIni.produtoAcabadoPrimaTemGrade(
     buscas,
     StrToInt(vgrupo_prod_acabado),
     vcod_prod_acabado,
     0,
     '') then
   begin
     if vDadosIni.existeGradeProducao(
      buscas,
      StrToInt(vgrupo_prod_acabado),
      vcod_prod_acabado,
      0,
      '') then
     begin
       if not vDadosIni.vincularProdutoAcabadoMateriaPrima(
         buscas,
         StrToInt(vgrupo_prod_acabado),
         vcod_prod_acabado,
         0,
         StrToInt(vgrupo_prod_mp),
         vcod_prod_mp,
         vquant_mp,
         true) then
          exit;
     end;
   end;
  end;
end;

function TIndiceTecnico._ExcluirItem: Boolean;
begin
	Result := False;

  if dataSet.IsEmpty then
  	exit;

  Result := inherited Delete;

  if Result then
    Result := Apply;

  if Result then
    Result := CommitaTransacao;

//  if not vDadosIni.deletarVinculosGradeMateriaPrima(
//  	buscas,
//    StrToInt(vgrupo_prod_acabado),
//    vcod_prod_acabado,
//    StrToInt(vgrupo_prod_mp),
//    vcod_prod_mp) then
//      exit;

  if (vDadosIni.vEmp.vUsarProducao = 'S') then
  begin
    if vDadosIni.produtoAcabadoPrimaTemGrade(
      buscas,
      StrToInt(vgrupo_prod_acabado),
      vcod_prod_acabado,
      0,
      '') then
    begin
      if vDadosIni.existeGradeProducao(
        buscas,
        StrToInt(vgrupo_prod_acabado),
        vcod_prod_acabado,
        0,
        '') then
      begin
        if not vDadosIni.vincularProdutoAcabadoMateriaPrima(
        	buscas,
          StrToInt(vgrupo_prod_acabado),
          vcod_prod_acabado,
          0,
          0,
          '',
          0,
          true) then
            exit;
      end;
    end;
  end;
end;

function TIndiceTecnico._PesqRecProd(Cod_recprod: integer): string;
begin
   Result :=  retornaValor('SELECT R.PROCESSO_PRODUCAO AS valor FROM REC_ASS R '
   + ' INNER JOIN PRODUTOS P ON P.cod_recprod=R.COD_RECEITA '
   + ' AND P.COD_PROD=R.COD_PROD AND P.GRUPO_PROD=R.COD_GRUPO '
   + ' AND P.COD_EMPRESA = R.COD_EMPRESA ' 
   + ' WHERE R.COD_EMPRESA = ' + vDadosIni.codEmpresa
   + ' AND R.TIPO_UTIL=''P'' AND P.cod_recprod = ' + inttostr(Cod_recprod) );
end;

function TIndiceTecnico._PesquisaIndice: Boolean;
begin
     result := montaSelect('select it.grupo_prod_acabado, it.cod_prod_acabado, ' +
                          ' pr.descr_prod, pr.num_fab_prod '+
                          ' from indice_tecnico it '+
                          ' inner join produtos pr on '+
                          ' it.cod_prod_acabado = pr.cod_prod and '+
                          ' it.grupo_prod_acabado = pr.grupo_prod and '+
                          ' it.cod_empresa = pr.cod_empresa '+
                          ' where it.cod_prod_acabado = '+QuotedStr(vcod_prod_pesq) +
                          ' and it.grupo_prod_acabado = '+ vgrupo_prod_pesq +
                          ' and it.cod_empresa = '+ vDadosIni.codEmpresa)
end;

function TIndiceTecnico._PesquisaIndice(Codprod: string;
  CodGrupo: integer): boolean;
begin
     result := montaSelect('select it.grupo_prod_acabado, it.cod_prod_acabado, ' +
                          ' pr.descr_prod, pr.num_fab_prod '+
                          ' from indice_tecnico it '+
                          ' where it.cod_prod_acabado = '+QuotedStr(codprod) +
                          ' and it.grupo_prod_acabado = '+ inttostr(codgrupo)+
                          ' and it.cod_empresa = '+ vDadosIni.codEmpresa)

end;

function TIndiceTecnico._PesquisaNumFab: string;
begin
     result := trim(retornaValor('select num_fab_prod as valor from produtos where '
     + ' cod_prod = ' + QuotedStr(dataSet.FieldByName('cod_prod_mprima').AsString)
     + ' and grupo_prod = ' + dataSet.FieldByName('grupo_prod_mprima').AsString
     + ' and cod_empresa = ' + vDadosIni.codEmpresa));
end;

{ TProduto_IndTec }
constructor TProduto_IndTec.create;
begin
   dataSet := TClientDataSet(dtmprodutos.cdsProduto);
   buscas := TIBQuery (dtmprodutos.qrProduto);
   transacao := TIBTransaction (dtmprodutos.IBTransIndiceTec);
end;

{ TProdutosAcabado }

function TProdutosAcabado.abreProdutosAcabado(pIdInd: Integer): boolean;
begin
	Result := montaSelect(' select first 1 ac.*, pr.num_fab_prod from produtos_pdc_var ac ' +
  	' inner join produtos pr on ' +
    '		pr.grupo_prod = ac.grupo_prod ' +
    '   and pr.cod_prod = ac.cod_prod ' +
    '   and pr.cod_empresa = ac.cod_empresa ' +
  	' where ac.id_ind = ' + IntToStr(pIdInd) +
    ' and ac.cod_empresa = ' + vDadosIni.codEmpresa);
end;

function TProdutosAcabado.abreProdutosAcabado(pGrupoProd: Integer;
  pCodProd: string): boolean;
begin
	Result := montaSelect(' select ac.*, pr.num_fab_prod from produtos pr ' +
  	' left join produtos_pdc_var ac on ' +
    '		ac.grupo_prod = pr.grupo_prod ' +
    '   and ac.cod_prod = pr.cod_prod ' +
    '   and ac.cod_empresa = pr.cod_empresa ' +
  	' where pr.grupo_prod = ' + IntToStr(pGrupoProd) +
    ' and pr.cod_prod = ' + QuotedStr(pCodProd) +
    ' and pr.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and (select count(*) from produtos_pdc_var ac2 ' +
    '      where ac2.grupo_prod = pr.grupo_prod ' +
    '      and ac2.cod_prod = pr.cod_prod ' +
    '      and ac2.cod_empresa = pr.cod_empresa) = 0 ');
end;

constructor TProdutosAcabado.create;
begin
	if dtmProdutos = nil then
    dtmProdutos := TdtmProdutos.Create(dtmProdutos);
	DataSet := TClientDataSet(dtmProdutos.cdsProdutoAcabado);
  transacao := TIBTransaction(dtmProdutos.IBTransProdutos);
  Buscas := TIBQuery(dtmProdutos.qrBuscas);

  vGradeAcab := TProdutosAcabadoGrade.create;
  vMateriasPrima := TMateriasPrima.create;
end;

destructor TProdutosAcabado.destroy;
begin
	vGradeAcab.Free;
  vGradeAcab := nil;
  vMateriasPrima.Free;
  vMateriasPrima := nil;
  inherited;
end;

{ TProdutosAcabadoGrade }

function TProdutosAcabadoGrade.abreGrade(pCodGrade: Integer): boolean;
begin
	Result := montaSelect(' select gr.cod_grade, ' +
  	' gr.cod_empresa, ' +
  	' (coalesce(gr.cod_grade, 0) || '' - '' || trim(coalesce(gr.descricao, ''''))) descricao, ' +
    ' (coalesce(gr.cod_grade, 0) || '' - '' || trim(coalesce(gr.descricao1, ''''))) descricao1, ' +
    ' trim(coalesce(gr.descricao, '''')) descr_grade, ' +
    ' trim(coalesce(gr.descricao1, '''')) descr_grade1 from grade gr ' +
    ' where gr.cod_grade = ' + IntToStr(pCodGrade) +
    ' and gr.cod_empresa = ' + vDadosIni.codEmpresa +
    ' order by 3 ');
end;

function TProdutosAcabadoGrade.abreProdutosAcabadoGrade(pGrupoProd: Integer;
  pCodProd: string; pCodGrade: Integer): boolean;
begin
	Result := montaSelect(' select gr.cod_grade, ' +
  	' gr.cod_empresa, ' +
  	' (coalesce(gr.cod_grade, 0) || '' - '' || trim(coalesce(gr.descricao, ''''))) descricao, ' +
    ' (coalesce(gr.cod_grade, 0) || '' - '' || trim(coalesce(gr.descricao1, ''''))) descricao1, ' +
    ' trim(coalesce(gr.descricao, '''')) descr_grade, ' +
    ' trim(coalesce(gr.descricao1, '''')) descr_grade1 from cod_grade_prod cd ' +
		' inner join grade gr on gr.cod_grade = cd.cod_grade and gr.cod_empresa = cd.cod_empresa ' +
    ' where cd.grupo_prod = ' + IntToStr(pGrupoProd) +
    ' and cd.cod_prod = ' + QuotedStr(pCodProd) +
    ' and cd.cod_grade = ' + IntToStr(pCodGrade) +
    ' and cd.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and cd.cod_grade > 0 ' +
    ' and (select count(*) from produtos_pdc_var pvar ' +
    '      where pvar.grupo_prod = cd.grupo_prod ' +
    '      and pvar.cod_prod = cd.cod_prod ' +
    '      and pvar.cod_grade = cd.cod_grade ' +
    '      and pvar.cod_empresa = cd.cod_empresa) = 0 ' +
    ' order by 3 ');
end;

function TProdutosAcabadoGrade.abreProdutosAcabadoGrade(pGrupoProd: Integer;
  pCodProd: string): boolean;
begin
	Result := montaSelect(' select gr.cod_grade, ' +
  	' gr.cod_empresa, ' +
  	' (coalesce(gr.cod_grade, 0) || '' - '' || trim(coalesce(gr.descricao, ''''))) descricao, ' +
    ' (coalesce(gr.cod_grade, 0) || '' - '' || trim(coalesce(gr.descricao1, ''''))) descricao1, ' +
    ' trim(coalesce(gr.descricao, '''')) descr_grade, ' +
    ' trim(coalesce(gr.descricao1, '''')) descr_grade1 from cod_grade_prod cd ' +
		' inner join grade gr on gr.cod_grade = cd.cod_grade and gr.cod_empresa = cd.cod_empresa ' +
    ' where cd.grupo_prod = ' + IntToStr(pGrupoProd) +
    ' and cd.cod_prod = ' + QuotedStr(pCodProd) +
    ' and cd.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and cd.cod_grade > 0 ' +
    ' and (select count(*) from produtos_pdc_var pvar ' +
    '      where pvar.grupo_prod = cd.grupo_prod ' +
    '      and pvar.cod_prod = cd.cod_prod ' +
    '      and pvar.cod_grade = cd.cod_grade ' +
    '      and pvar.cod_empresa = cd.cod_empresa) = 0 ' +
    ' order by 3 ');
end;

constructor TProdutosAcabadoGrade.create;
begin
	if dtmProdutos = nil then
    dtmProdutos := TdtmProdutos.Create(dtmProdutos);
 	DataSet := TClientDataSet(dtmProdutos.cdsProdutoAcabadoGrade);
  transacao := TIBTransaction(dtmProdutos.IBTransProdutos);
  Buscas := TIBQuery(dtmProdutos.qrBuscas);
end;

{ TMateriasPrima }

function TMateriasPrima.abreMateriasPrima(pGrupoProdAcabado: Integer;
  pCodProdAcabado: string): boolean;
begin
	Result := montaSelect(' select it.* from produtos_pdc_var ac ' +
    ' inner join produtos_pdc_var_it it on ' +
    '		it.id_ind = ac.id_ind ' +
    '   and it.cod_empresa = ac.cod_empresa ' +
  	' where ac.grupo_prod = ' + IntToStr(pGrupoProdAcabado) +
    ' and ac.cod_prod = ' + QuotedStr(pCodProdAcabado) +
    ' and ac.cod_empresa = ' + vDadosIni.codEmpresa);
end;

function TMateriasPrima.abreMateriasPrima(pIdInd: Integer): boolean;
begin
	Result := montaSelect(' select it.* from produtos_pdc_var_it it ' +
  	' where it.id_ind = ' + IntToStr(pIdInd) +
    ' and it.cod_empresa = ' + vDadosIni.codEmpresa);
end;

function TMateriasPrima.abreMateriasPrima(pGrupoProdMPrima: Integer;
  pCodProdMPrima: string; pCodGradeMprima, pIdInd: Integer): boolean;
begin
	Result := montaSelect(' select it.* from produtos_pdc_var ac ' +
    ' inner join produtos_pdc_var_it it on ' +
    '		it.id_ind = ac.id_ind ' +
    '   and it.cod_empresa = ac.cod_empresa ' +
  	' where it.id_ind = ' + IntToStr(pIdInd) +
    ' and it.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and it.grupo_prod = ' + IntToStr(pGrupoProdMprima) +
    ' and it.cod_prod = ' + QuotedStr(pCodProdMprima) +
    ' and it.cod_grade = ' + IntToStr(pCodGradeMprima));
end;

function TMateriasPrima.abreMateriasPrima(pIdInd, pIdIndIt,
  pGrupoProdMPrima: Integer; pCodProdMPrima: string): boolean;
begin
	Result := montaSelect(' select it.* from produtos_pdc_var ac ' +
    ' inner join produtos_pdc_var_it it on ' +
    '		it.id_ind = ac.id_ind ' +
    '   and it.cod_empresa = ac.cod_empresa ' +
  	' where it.id_ind = ' + IntToStr(pIdInd) +
    ' and it.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and it.id_ind_it = ' + IntToStr(pIdIndIt) +
    ' and it.grupo_prod = ' + IntToStr(pGrupoProdMprima) +
    ' and it.cod_prod = ' + QuotedStr(pCodProdMprima));
end;

constructor TMateriasPrima.create;
begin
	if dtmProdutos = nil then
    dtmProdutos := TdtmProdutos.Create(dtmProdutos);
	DataSet := TClientDataSet(dtmProdutos.cdsProdutoMatPrima);
  transacao := TIBTransaction(dtmProdutos.IBTransProdutos);
  Buscas := TIBQuery(dtmProdutos.qrBuscas);

  vGradeMatPrima :=	TMateriasPrimaGrade.create;
end;

destructor TMateriasPrima.destroy;
begin
	vGradeMatPrima.Free;
  vGradeMatPrima := nil;
  inherited;
end;

{ TMateriasPrimaGrade }

function TMateriasPrimaGrade.abreMateriasPrimaGrade(pGrupoProd: Integer;
  pCodProd: string): boolean;
begin
	Result := montaSelect(' select gr.cod_grade, ' +
  	' gr.cod_empresa, ' +
  	' (coalesce(gr.cod_grade, 0) || '' - '' || trim(coalesce(gr.descricao, ''''))) descricao, ' +
    ' (coalesce(gr.cod_grade, 0) || '' - '' || trim(coalesce(gr.descricao1, ''''))) descricao1, ' +
    ' trim(coalesce(gr.descricao, '''')) descr_grade,' +
    ' trim(coalesce(gr.descricao1, '''')) descr_grade1 ' +
    ' from cod_grade_prod cd ' +
		' inner join grade gr on gr.cod_grade = cd.cod_grade and gr.cod_empresa = cd.cod_empresa ' +
    ' where cd.grupo_prod = ' + IntToStr(pGrupoProd) +
    ' and cd.cod_prod = ' + QuotedStr(pCodProd) +
    ' and cd.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and cd.cod_grade > 0 ' +
    ' order by 3 ');
end;

constructor TMateriasPrimaGrade.create;
begin
	if dtmProdutos = nil then
    dtmProdutos := TdtmProdutos.Create(dtmProdutos);
	DataSet := TClientDataSet(dtmProdutos.cdsProdutoMatPrimaGrade);
  transacao := TIBTransaction(dtmProdutos.IBTransProdutos);
  Buscas := TIBQuery(dtmProdutos.qrBuscas);
end;

{ TConsProdutoAcabado }

constructor TConsProdutoAcabado.create;
begin
	if dtmProdutos = nil then
    dtmProdutos := TdtmProdutos.Create(dtmProdutos);
  dataSet := TClientDataSet(dtmProdutos.cdsConsProdutoAcabado);
  transacao:= TIBTransaction(dtmProdutos.IBTransProdutos);
  Buscas := TIBQuery(dtmProdutos.qrBuscas);

  vConsMateriaPrimaProdutoAcabado := TConsMateriaPrimaProdutoAcabado.Create;

  dataSet.AfterScroll := datasetAfterScrollConsMateriaPrima;
end;

procedure TConsProdutoAcabado.datasetAfterScrollConsMateriaPrima(
  DataSet: TDataSet);
begin
	if DataSet.IsEmpty then
  begin
  	vConsMateriaPrimaProdutoAcabado._abreConsMateriaPrimaProdutoAcabado(
  		'0',
	    '000000',
      0,
      0);
    exit;
  end;

	vConsMateriaPrimaProdutoAcabado._abreConsMateriaPrimaProdutoAcabado(
  	DataSet.FieldByName('grupo_prod').AsString,
    DataSet.FieldByName('cod_prod').AsString,
    DataSet.FieldByName('cod_grade').AsInteger,
    DataSet.FieldByName('id_ind').AsInteger);
end;

destructor TConsProdutoAcabado.destroy;
begin
	if Assigned(vConsMateriaPrimaProdutoAcabado) then
	  FreeAndNil(vConsMateriaPrimaProdutoAcabado);
  inherited;
end;

procedure TConsProdutoAcabado._abreConsProdutoAcabado(Grupo_Prod,
  Cod_Prod: string);
var
	buscas2: TIBQuery;
	I: Integer;
begin
	if Assigned(FrmVisualizarAcabadoMateriasPrimas) then
  begin
  	buscas2 := TIBQuery.Create(Application);
	  buscas2.Database := buscas.Database;
  	buscas2.Transaction := buscas.Transaction;

    buscas2.Close;
    buscas2.SQL.Text := ' select count(*) from cod_grade_prod ' +
    	' where grupo_prod = ' + Grupo_Prod +
      ' and cod_prod = ' + QuotedStr(Cod_Prod)  +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and cod_grade > 0 ';
    buscas2.Open;

    FrmVisualizarAcabadoMateriasPrimas.GroupBox8.Visible := buscas2.FieldByName('count').AsInteger > 0;
  end;

  dataSet.Close;
  dataSet.CommandText := ' select ' +
	  ' coalesce(cod_grade_prod.cod_grade, 0) cod_grade, ' +
    ' iif(coalesce(cod_grade_prod.cod_grade, 0) > 0, coalesce(grade.descricao, ''SEM GRADE''), ''SEM GRADE'') grade,' +
    ' iif(coalesce(cod_grade_prod.cod_grade, 0) > 0, coalesce(grade.descricao1, ''SEM GRADE''), ''SEM GRADE'') grade1,' +
	  ' produtos.grupo_prod, produtos.cod_prod, produtos.cod_empresa, ' +
  	' produtos.num_fab_prod, ' +
    ' (trim(coalesce(produtos.descr_prod, '''')) || iif(coalesce(cod_grade_prod.cod_grade, 0) > 0, ' +
    '		'' - '' || iif(coalesce(cod_grade_prod.cod_grade, 0) > 0, coalesce(grade.descricao, ''''), ''''), ''''))  descr_prod, ' +
    ' coalesce((select first 1 produtos_pdc_var.id_ind from produtos_pdc_var ' +
    '           where produtos_pdc_var.grupo_prod = produtos.grupo_prod ' +
    '           and produtos_pdc_var.cod_prod = produtos.cod_prod ' +
    '           and produtos_pdc_var.cod_empresa = produtos.cod_empresa ' +
    ' 					and produtos_pdc_var.cod_grade = coalesce(cod_grade_prod.cod_grade, 0)), 0) id_ind ' +
    ' from produtos ' +
    ' left join cod_grade_prod on ' +
    '     cod_grade_prod.grupo_prod = produtos.grupo_prod ' +
    '     and cod_grade_prod.cod_prod = produtos.cod_prod ' +
    '     and cod_grade_prod.cod_empresa = produtos.cod_empresa ' +
    ' left join grade on ' +
    '			grade.cod_grade = cod_grade_prod.cod_grade ' +
    '     and grade.cod_empresa = cod_grade_prod.cod_empresa ' +
    ' where produtos.grupo_prod = ' + Grupo_Prod +
    ' and produtos.cod_prod = ' + QuotedStr(Cod_Prod) +
    ' and produtos.cod_empresa = ' + vDadosIni.codEmpresa +
    ' order by 8, 4, 5, 2 ';
  dataSet.Open;

  if dataSet.IsEmpty then
  	vConsMateriaPrimaProdutoAcabado._abreConsMateriaPrimaProdutoAcabado(
    	'0',
      '000000',
      0,
      0);
end;

{ TConsMateriaPrimaProdutoAcabado }

constructor TConsMateriaPrimaProdutoAcabado.create;
begin
	if dtmProdutos = nil then
    dtmProdutos := TdtmProdutos.Create(dtmProdutos);
  dataSet := TClientDataSet(dtmProdutos.cdsConsMateriasPrimasAcabado);
  transacao:= TIBTransaction(dtmProdutos.IBTransProdutos);
  Buscas := TIBQuery(dtmProdutos.qrBuscas);
end;

procedure TConsMateriaPrimaProdutoAcabado._abreConsMateriaPrimaProdutoAcabado(
  Grupo_Prod, Cod_Prod: string; CodGrade, IdInd: Integer);
var
	buscas2: TIBQuery;
	I: Integer;
begin
  if (IdInd > 0) then
  begin
    buscas2 := TIBQuery.Create(Application);
		buscas2.Database := buscas.Database;
  	buscas2.Transaction := buscas.Transaction;

		buscas2.Close;
	  buscas2.SQL.Text := ' select count(*) from produtos_pdc_var_it ' +
			' where id_ind = ' + IntToStr(IdInd) +
  	  ' and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas2.Open;

    if (buscas2.FieldByName('count').AsInteger <= 0) then
    begin
    	 _abreConsMateriaPrimaProdutoAcabado(
       		Grupo_Prod,
          Cod_Prod,
          CodGrade,
          0);
//    	Application.MessageBox(PChar('Favor vincular as grades do Produto Acabado e Matérias Primas/Insumos/Embalagens!'),
//      	'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      exit;
    end;
  end;

  if (IdInd > 0) then
  begin
  	dataSet.Close;
    dataSet.CommandText := ' select ' +
      ' iif(coalesce(cod_grade_prod.cod_grade,  0) > 0, coalesce(cod_grade_prod.cod_grade,  0), 0) cod_grade, ' +
      ' iif(coalesce(cod_grade_prod.cod_grade,  0) > 0, coalesce(grade.descricao, ''SEM GRADE''), ''SEM GRADE'') grade, ' +
      ' iif(coalesce(cod_grade_prod.cod_grade,  0) > 0, coalesce(grade.descricao1, ''SEM GRADE''), ''SEM GRADE'') grade1, ' +
      ' produtos.grupo_prod, produtos.cod_prod, produtos.cod_empresa, ' +
      ' produtos.num_fab_prod, ' +
      ' ( trim(coalesce(produtos.descr_prod, '''')) || '' - '' || ' +
      '	  iif(coalesce(cod_grade_prod.cod_grade,  0) > 0, trim(coalesce(grade.descricao, '''')), '''') ) descr_prod, ' +
      ' iif(coalesce(produtos_pdc_var_it.quant, 0) > 0, coalesce(produtos_pdc_var_it.quant, 0), coalesce(indice_tecnico.quant, 0)) quant, ' +
      ' coalesce(produtos_pdc_var_it.id_ind, 0) id_ind, ' +
      ' coalesce(produtos_pdc_var_it.id_ind_it, 0) id_ind_it ' +
    	' from produtos_pdc_var_it ' +
      ' inner join indice_tecnico on ' +
      '       indice_tecnico.grupo_prod_acabado = ' + Grupo_Prod +
      '				and indice_tecnico.cod_prod_acabado = ' + QuotedStr(Cod_Prod) +
      '				and indice_tecnico.grupo_prod_mprima = produtos_pdc_var_it.grupo_prod ' +
      '				and indice_tecnico.cod_prod_mprima = produtos_pdc_var_it.cod_prod ' +
      '				and indice_tecnico.cod_empresa = produtos_pdc_var_it.cod_empresa ' +
      ' inner join produtos on ' +
      '       produtos.grupo_prod = produtos_pdc_var_it.grupo_prod ' +
      '       and produtos.cod_prod = produtos_pdc_var_it.cod_prod ' +
      '       and produtos.cod_empresa = produtos_pdc_var_it.cod_empresa ' +
      ' left join cod_grade_prod on ' +
      '       cod_grade_prod.grupo_prod = produtos_pdc_var_it.grupo_prod ' +
      '       and cod_grade_prod.cod_prod = produtos_pdc_var_it.cod_prod ' +
      '       and cod_grade_prod.cod_grade = produtos_pdc_var_it.cod_grade ' +
      '       and cod_grade_prod.cod_empresa = produtos.cod_empresa ' +
      ' left join grade on ' +
      '       grade.cod_grade = cod_grade_prod.cod_grade ' +
      '       and grade.cod_empresa = cod_grade_prod.cod_empresa ' +
      ' where produtos_pdc_var_it.id_ind = ' + IntToStr(IdInd) +
      ' and produtos_pdc_var_it.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and produtos_pdc_var_it.cod_grade > 0 ';

    dataSet.CommandText := dataSet.CommandText +
    	' union ' +
      ' select ' +
      ' 0 cod_grade, ' +
      ' ''SEM GRADE'' grade, ' +
      ' ''SEM GRADE'' grade1, ' +
      ' produtos.grupo_prod, produtos.cod_prod, produtos.cod_empresa, ' +
      ' produtos.num_fab_prod, ' +
      ' produtos.descr_prod, ' +
      ' coalesce(indice_tecnico.quant, 0) quant, ' +
      IntToStr(IdInd) + ' id_ind, ' +
      IntToStr(IdInd) + ' id_ind_it ' +
      ' from indice_tecnico ' +
      ' inner join produtos on ' +
      '       produtos.grupo_prod = indice_tecnico.grupo_prod_mprima ' +
      '       and produtos.cod_prod = indice_tecnico.cod_prod_mprima ' +
      '       and produtos.cod_empresa = indice_tecnico.cod_empresa ' +
      ' where indice_tecnico.grupo_prod_acabado = ' + Grupo_Prod +
			' and indice_tecnico.cod_prod_acabado = ' + QuotedStr(Cod_Prod) +
			' and indice_tecnico.cod_empresa = ' + vDadosIni.codEmpresa +
			' and (select count(*) from cod_grade_prod cgp ' +
      ' 	   where cgp.grupo_prod = indice_tecnico.grupo_prod_mprima ' +
      ' 		 and cgp.cod_prod = indice_tecnico.cod_prod_mprima ' +
      ' 		 and cgp.cod_empresa = indice_tecnico.cod_empresa ' +
      ' 		 and cgp.cod_grade > 0) = 0 ' +
      ' order by 8, 4, 5, 2 ';
  end
  else
  begin
  	dataSet.Close;
    dataSet.CommandText :=
    	' select ' +
      ' 0 cod_grade, ' +
      ' ''SEM GRADE'' grade, ' +
      ' ''SEM GRADE'' grade1, ' +
      ' produtos.grupo_prod, produtos.cod_prod, produtos.cod_empresa, ' +
      ' produtos.num_fab_prod, ' +
      ' trim(coalesce(produtos.descr_prod, '''')) descr_prod, ' +
      ' coalesce(indice_tecnico.quant, 0) quant, ' +
      ' case when (select count(*) from cod_grade_prod ' +
      '            where cod_grade_prod.grupo_prod = indice_tecnico.grupo_prod_mprima ' +
      '						 and cod_grade_prod.cod_prod = indice_tecnico.cod_prod_mprima ' +
      '						 and cod_grade_prod.cod_empresa = indice_tecnico.cod_empresa ' +
      '						 and cod_grade_prod.cod_grade > 0) <= 0 then ' +
      '						1 ' +
      '					else ' +
      '  	 				0 ' +
      ' end id_ind, ' +
      ' case when (select count(*) from cod_grade_prod ' +
      '            where cod_grade_prod.grupo_prod = indice_tecnico.grupo_prod_mprima ' +
      '						 and cod_grade_prod.cod_prod = indice_tecnico.cod_prod_mprima ' +
      '						 and cod_grade_prod.cod_empresa = indice_tecnico.cod_empresa ' +
      '						 and cod_grade_prod.cod_grade > 0) <= 0 then ' +
      '						1 ' +
      '         else ' +
      ' 					0 ' +
      ' end id_ind_it ' +
      ' from indice_tecnico ' +
      ' inner join produtos on ' +
      '       produtos.grupo_prod = indice_tecnico.grupo_prod_mprima ' +
      '       and produtos.cod_prod = indice_tecnico.cod_prod_mprima ' +
      '       and produtos.cod_empresa = indice_tecnico.cod_empresa ' +
      ' where indice_tecnico.grupo_prod_acabado = ' + Grupo_Prod +
      ' and indice_tecnico.cod_prod_acabado = ' + QuotedStr(Cod_Prod) +
      ' and indice_tecnico.cod_empresa = ' + vDadosIni.codEmpresa +
      ' order by 8, 4, 5, 2 ';
  end;
  dataSet.Open;
end;

end.
