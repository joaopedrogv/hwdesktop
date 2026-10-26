unit UClassesConsGeral;

interface

uses
  xhHierCube, xhGrid, IBQuery, DBClient, ComCtrls, IBDatabase, forms, Mask,
  Contnrs, Classes;

type
  TRelConsGeral = class;
  TConsultasSalvas = class;
  TConsultasSalvasFields = class;
  TConsultasSalvasFieldsList = class;
  TParametrosList = class;
  //ArrayBi = array of array of shortstring;

  TConsultasSalvas = class
  private
    //FOwer: TRelConsGeral;
    Fcod_usuario: Integer;
    Fnome_salvo: string;
    Fcod_consulta: Integer;
    FCampos: TConsultasSalvasFieldsList;
    FSQLText: string;
    FParams: TParametrosList;
    Ftipoconsulta: string;
  public
    constructor Create;
    destructor Destroy; override;
    function NewCopy: TConsultasSalvas;

    property cod_consulta: Integer read Fcod_consulta write Fcod_consulta;
    property nome_salvo: string read Fnome_salvo write Fnome_salvo;
    property tipoconsulta: string read Ftipoconsulta write Ftipoconsulta;
    property cod_usuario: Integer read Fcod_usuario write Fcod_usuario;
    property SQLText: string read FSQLText write FSQLText;
    property Campos: TConsultasSalvasFieldsList read FCampos write FCampos;
    property Params: TParametrosList read FParams write FParams;
  end;

  TConsultasSalvasList = class(TObjectList)
  private
    function GetItem(Index: integer): TConsultasSalvas;
    procedure SetItem(Index: integer; const Value: TConsultasSalvas);
  public
    function New: TConsultasSalvas;
    function NewCopy(AIndex: Integer): TConsultasSalvas;
    property Items[Index: integer]: TConsultasSalvas read GetItem write SetItem;
  end;

  TConsultasSalvasFields = class
  private
    Fseqint: integer;
    Fnome_campo: string;
    Ftipo_campo: string;
    Ftipo_pos: string;
    Fnome_apresentacao: string;
    Fformula_campo: string;
    Fformatstring: string;
    Fisnumeric: Boolean;
  public
    constructor create;
    function NewCopy(): TConsultasSalvasFields;

    property nome_campo       : string  read Fnome_campo        write Fnome_campo;
    property nome_apresentacao: string  read Fnome_apresentacao write Fnome_apresentacao;
    property formula_campo    : string  read Fformula_campo     write Fformula_campo;
    property formatstring     : string  read Fformatstring      write Fformatstring;
    property tipo_pos         : string  read Ftipo_pos          write Ftipo_pos;
    property seqint           : integer read Fseqint            write Fseqint;
    property tipo_campo       : string  read Ftipo_campo        write Ftipo_campo;
    property isnumeric        : Boolean read Fisnumeric         write Fisnumeric;
  end;

  TConsultasSalvasFieldsList = class(TObjectList)
  private
    function GetItem(Index: integer): TConsultasSalvasFields;
    procedure SetItem(Index: integer; const Value: TConsultasSalvasFields);
  public
    function New: TConsultasSalvasFields;
    function NewCopy(AIndex: Integer): TConsultasSalvasFields;
    property Items[Index: integer]: TConsultasSalvasFields read GetItem write SetItem;
  end;

  TParametros = class
  private
    Fdisplay: string;
    Fconteudo: TStrings;
    Fcodigo: string;
    Ftipo: string;
    Fvalue: string;
    Fnovo: Boolean;
  public
    destructor Destroy; override;
    constructor Create();
    function NewCopy: TParametros;

    property codigo: string read Fcodigo write Fcodigo;
    property tipo: string read Ftipo write Ftipo;
    property conteudo: TStrings read Fconteudo write Fconteudo;
    property display: string read Fdisplay write Fdisplay;
    property value: string read Fvalue write Fvalue;
    property novo: Boolean read Fnovo write Fnovo;
  end;

  TParametrosList = class(TObjectList)
  private
    function GetItem(Index: integer): TParametros;
    procedure SetItem(Index: integer; const Value: TParametros);
  public
    function New: TParametros;
    //function NewCopy(AIndex: Integer): TParametros;
    property Items[Index: integer]: TParametros read GetItem write SetItem;
  end;

  TParametros_OnChange = procedure (AList: TParametrosList) of object;
  TFields_OnChange = procedure (AList: TConsultasSalvasFieldsList) of object;

  TConsultasBuild = class
  private
    FOwner: TRelConsGeral;
    FSQLText: string;

    FParametrosConsulta: TParametrosList;
    FParametrosDB: TParametrosList;

    FDimensions: TConsultasSalvasFieldsList;
    FSummarys  : TConsultasSalvasFieldsList;
    FFormulas  : TConsultasSalvasFieldsList;

    FOnChangeParametrosConsulta: TParametros_OnChange;
    FOnChangeParametrosDB: TParametros_OnChange;
    FOnChangeFieldsSummarys: TFields_OnChange;
    FOnChangeFieldsFormulas: TFields_OnChange;
    FOnChangeFieldsDimensions: TFields_OnChange;
    FConsulta: TConsultasSalvas;
    

  public
    destructor Destroy; override;
    constructor Create(AOwner: TRelConsGeral);

    procedure Iniciar;
    procedure verificarParametros;
    procedure verificarFields;
    procedure rebuidFieldsFromConsulta;
    procedure setFieldsToConsulta;

    function GetGrupoConsulta: TStrings;
    function GetSQLInsert(ACodConsulta: Integer; ACamposSite: Boolean): TStrings;
    function SalvarConsultaNoBanco: Boolean;


    property SQLText: string read FSQLText write FSQLText;

    property Consulta: TConsultasSalvas read FConsulta write FConsulta;

    property ParametrosDB: TParametrosList read FParametrosDB write FParametrosDB;
    property ParametrosConsulta: TParametrosList read FParametrosConsulta write FParametrosConsulta;

    property Dimensions: TConsultasSalvasFieldsList read FDimensions write FDimensions;
    property Summarys  : TConsultasSalvasFieldsList read FSummarys write FSummarys;
    property Formulas  : TConsultasSalvasFieldsList read FFormulas write FFormulas;

    property OnChangeParametrosDB: TParametros_OnChange read FOnChangeParametrosDB write FOnChangeParametrosDB;
    property OnChangeParametrosConsulta: TParametros_OnChange read FOnChangeParametrosConsulta write FOnChangeParametrosConsulta;
    property OnChangeFieldsDimensions: TFields_OnChange read FOnChangeFieldsDimensions write FOnChangeFieldsDimensions;
    property OnChangeFieldsSummarys: TFields_OnChange read FOnChangeFieldsSummarys write FOnChangeFieldsSummarys;
    property OnChangeFieldsFormulas: TFields_OnChange read FOnChangeFieldsFormulas write FOnChangeFieldsFormulas;
  end;

  TRelConsGeral = class
  private
    FCont: Integer;
    Vetor, Pivo: string;
    vConsultaGeral: TclientDataset;
    VconsultaUs: TclientDataset;
    vbancotipo1: Tibdatabase;
    vstr: string;
    vsvcons: integer;
    FConsultasSalvas: TConsultasSalvasList;
//    vbancotipo2: T
  public
    constructor create;
    destructor destroy; override;
    function montapesquisa(vFerCube: THierCube; vGridCube: THierCubeGrid; vnomecons: string; vempresasd: string; Vform: Tform; vtipo: integer): boolean; overload;
    function montapesquisa(vFerCube: THierCube; vGridCube: THierCubeGrid; vnomecons: string; vempresasd: string; Vform: Tform; vtipo: integer; AConsultaSalva: TConsultasSalvas; ASetActive: Boolean): boolean; overload;
    function criaparametrosform(Vform: Tform; vdadospesq: string; vscroll: TScrollBox): boolean; overload;
    function criaparametrosform(Vform: Tform; AParamsList: TParametrosList; vscroll: TScrollBox): boolean; overload;
    procedure procuraparametros(vsqlcomand: AnsiString);
    procedure PopulaTreeView(const TreeView: TTreeView; const Node: TTreeNode; const Field: string; const ImageIndex, SelectedIndex: Integer; ChildTable, ChildField: string);
    procedure treeviewExpandir(Node: TTreeNode; var AllowExpansion: Boolean; const TreeView: TTreeView);
    function buscacodconsulta(vdadospesq: string): integer;
    function verificasenha(vcodus: string; vrel: string): boolean;
    function abresenhas(vtp: integer): boolean;
    function conectaBanco: boolean;
    function desconectabanco: boolean;
    function abreStatusProcessamento(pTitulo, vMensagemStatus: string): boolean;
    procedure fechaStatusProcessamento;
    function Gravapospesquisa(vFerCube: THierCube; vGridCube: THierCubeGrid): boolean;

    function SqlOpen(ASql: string; AQuery: TIBQuery = nil): TIBQuery;
    function SqlExec(ASql: string; AQuery: TIBQuery = nil): TIBQuery;
    procedure SelecionaConsultasSalvas(AConsulta: string);

    function ConsultaSalva_GetFromGrid(AConsulta: TConsultasSalvas; AGrid: THierCubeGrid): TConsultasSalvas;
    function ConsultaSalva_Go(AConsulta: TConsultasSalvas; AGrid: THierCubeGrid): TConsultasSalvas;
    function ConsultaSalva_Salvar(AConsulta: TConsultasSalvas): Boolean;
    function ConsultaSalva_Excluir(AConsulta: TConsultasSalvas): Boolean;

    property ConsultasSalvas: TConsultasSalvasList read FConsultasSalvas write FConsultasSalvas;

//    procedure preenchetreeview(
//    function abreEmpresas: Boolean;
//    function preenchChecklist(vcheck: TCheckListBox): boolean;
//    function VerificaEmpresas(vcheck: TCheckListBox): boolean;
//    function relacEmp: boolean;
//    function refreshDataset: boolean;
//    procedure PreencheCampos;
//    function StatusLixeira(aviso: boolean): boolean;
//    function AbrirLixeira: boolean;
//    function confirmaAlteracao: boolean;
//    function post: boolean; override;
//    procedure IncrementaGodigo;
    var
    //    Bairro:TBairros;
      vpar: array of string;
      cod_empresa: string;
      vendbanco: string;
      vusuario: string;
      vcodus: integer;
      vcodusuario: integer;
      vcodconsulta: integer;
      vtipoconsulta: string;
      vtbsenha: TIBQuery;
      vcadvincs: TClientDataSet;
      Buscas: Tibquery;
      vbuscas1: Tibquery;
      vparametrosext: array[0..4, 0..2] of ShortString;
  end;

var
  ConsOLAP: TRelConsGeral;

implementation

uses
  SysUtils, UdtmConsGeral, Windows, Controls, StdCtrls, DB, xhConsts,
  uStatusProcessamento_2, xhArrays, StrUtils, Math;

function gravarAuditoria(usuario, usuariogerenteliberou, processo, acao, mensagem, tabela, codigotabmov, cod_empresa: pchar): boolean; stdcall; external 'auditoria.dll';

function __getSenhaFDB: PChar; stdcall; external 'cons40.dll';

function __getUsuarioFDB: PChar; stdcall; external 'cons40.dll';

function __descriptografaTextoFDB(pTexto: PChar): PChar; stdcall; external 'cons40.dll';

{ TRelConsGeral }

constructor TRelConsGeral.create;
begin
  Buscas := TIBQuery(DtmConsGeral.QrBuscas);
  vbuscas1 := TIBQuery(DtmConsGeral.Qrbuscas1);
  vConsultaGeral := TClientDataSet(DtmConsGeral.CdsConsGeral);
  vtbsenha := TIBQuery(DtmConsGeral.ibSenhas);
  vcadvincs := TClientDataSet(DtmConsGeral.CdsSenhasVinc);
  vbancotipo1 := TIBDatabase(DtmConsGeral.IbDtbConsGeral);
  if not DtmConsGeral.CdsConsultaus.Active then
    DtmConsGeral.CdsConsultaus.CreateDataSet;
  VconsultaUs := TClientDataSet(DtmConsGeral.CdsConsultaus);
  FConsultasSalvas := TConsultasSalvasList.Create;
  SetLength(vpar, 30);
  vcodconsulta := 0;
  vtipoconsulta := '';
  vsvcons := 0;
  FCont := 1;
end;

function TRelConsGeral.criaparametrosform(Vform: Tform;
  AParamsList: TParametrosList; vscroll: TScrollBox): boolean;
var
  ANewCtrl: TControl;
  AComponentName: string;
  //iimp, itx,
  ALength, ALeft, ATop, I, J: integer;
//  vdeprel,vsenharel: string;
  AClasseReferencia: TControlClass;
  //cnt: integer;
begin
  Result := true;
  ALeft := 16;
  ATop := 19;
  for i := 0 to AParamsList.Count - 1 do
  begin
    FCont := FCont + 1;
    with AParamsList.Items[I] do
    begin
      if UpperCase(tipo) = 'DATE' then
      begin
        AClasseReferencia := TLabel;
        ANewCtrl := AClasseReferencia.Create(vscroll);
        ANewCtrl.Visible := False;
        ANewCtrl.Parent := vscroll;
        ANewCtrl.Left := ALeft;
        ANewCtrl.Top := ATop;
        AComponentName := AClasseReferencia.ClassName + '_naorepete_' + IntToStr(FCont);
        Delete(AComponentName, 1, 1);
        ANewCtrl.Name := AComponentName;
        ANewCtrl.Visible := True;
        (ANewCtrl as TLabel).Caption := display;
        ALength := 160;

        AClasseReferencia := TMaskedit;
        ANewCtrl := AClasseReferencia.Create(vscroll);
        ANewCtrl.Visible := False;
        ANewCtrl.Parent := vscroll;
        ANewCtrl.Left := ALength;
        ANewCtrl.Top := ATop;
        AComponentName := UpperCase(codigo);
        ANewCtrl.Name := AComponentName;
        ANewCtrl.Visible := True;
        //(ANewCtrl as Tmaskedit).clear;
        (ANewCtrl as Tmaskedit).editmask := '!99/99/0000;1;_';
        ATop := ATop + ANewCtrl.Height + 10;
        (ANewCtrl as Tmaskedit).Text := value;
        (ANewCtrl as Tmaskedit).Tag := I;
      end
      else
      begin
        AClasseReferencia := TLabel;
        ANewCtrl := AClasseReferencia.Create(vscroll);
        ANewCtrl.Visible := False;
        ANewCtrl.Parent := vscroll;
        ANewCtrl.Left := ALeft;
        ANewCtrl.Top := ATop;
        AComponentName := AClasseReferencia.ClassName + '_naorepete_' +  IntToStr(FCont);
        Delete(AComponentName, 1, 1);
        ANewCtrl.Name := AComponentName;
        ANewCtrl.Visible := True;
        (ANewCtrl as TLabel).Caption := display;
        ALength := 160;

        AClasseReferencia := TCombobox;
        ANewCtrl := AClasseReferencia.Create(vscroll);
        ANewCtrl.Visible := False;
        ANewCtrl.Parent := vscroll;
        ANewCtrl.Left := ALength;
        ANewCtrl.Top := ATop;
        AComponentName := UpperCase(codigo);
        ANewCtrl.Name := AComponentName;
        ANewCtrl.Visible := True;

        for J := 0 to conteudo.Count - 1 do (ANewCtrl as TCombobox).Items.Add(conteudo[J]);

        (ANewCtrl as TCombobox).ItemIndex := conteudo.IndexOf(value);
        (ANewCtrl as TCombobox).Tag := I;

        ATop := ATop + ANewCtrl.Height + 10;
      end;
    end;
  end;
end;

function TRelConsGeral.criaparametrosform(Vform: Tform; vdadospesq: string; vscroll: TScrollBox): boolean;
var
  NewCtrl: TControl;
  MyName: string;
  iimp, itx, tamant, x, y, i: integer;
//  vdeprel,vsenharel: string;
  ClassRef: TControlClass;
  cnt: integer;
begin
  Result := true;
  Buscas.close;
  buscas.sql.text := 'select * from SQLCONSULTASDIV where descricaocons = ''' + vdadospesq + ''' and cod_empresa = ' + cod_empresa;
  Buscas.open;
  vcodconsulta := Buscas.FieldByName('COD_CONSULTA').AsInteger;
  procuraparametros(Buscas.FieldByName('CONSULTASQL').AsString);
  x := 16;
  y := 19;
  for i := Low(vpar) to High(vpar) do
  begin
    if vpar[i] <> '' then
    begin
      Buscas.Close;
      Buscas.sql.text := 'select * from PARAMETROS_SQL where cod_parametro = ''' + vpar[i] + '''';
      Buscas.Open;
      if buscas.FieldByName('TIPO_PARAMETRO').AsString = 'DATE' then
      begin
        ClassRef := TLabel;
        NewCtrl := ClassRef.Create(Vform);
        // hide it temporarily, to avoid flickering
        NewCtrl.Visible := False;
        // set parent and position
        NewCtrl.Parent := vscroll;
        NewCtrl.Left := X;
        NewCtrl.Top := Y;
        // compute the unique name (and caption)
        MyName := ClassRef.ClassName + IntToStr(i);
        Delete(MyName, 1, 1);
        NewCtrl.Name := MyName;
        // now show it
        NewCtrl.Visible := True;
        (newctrl as TLabel).Caption := buscas.FieldByName('DISPLAY_PARAMETRO').AsString;
        tamant := 160;
        //
        ClassRef := TMaskedit;
        NewCtrl := ClassRef.Create(Vform);
        // hide it temporarily, to avoid flickering
        NewCtrl.Visible := False;
        // set parent and position
        NewCtrl.Parent := vscroll;
        //self;
        NewCtrl.Left := tamant;
        NewCtrl.Top := Y;
        // compute the unique name (and caption)
        MyName := UpperCase(Buscas.FieldByName('COD_PARAMETRO').AsString);
  //      ClassRef.ClassName + IntToStr (i);
  //      Delete (MyName, 1, 1);
        NewCtrl.Name := MyName;
        // now show it
        NewCtrl.Visible := True;
        (newctrl as Tmaskedit).clear;
        (newctrl as Tmaskedit).editmask := '!99/99/0000;1;_';
        y := y + NewCtrl.Height + 10;
      end
      else
      begin
  //    if  pos('STRING',UPPERCASE(GetEnumName(TypeInfo(TCrParamFieldType),Ord(Crpe1.ParamFields[i].ParamType)))) > 0 then
  //    begin
        ClassRef := TLabel;
        NewCtrl := ClassRef.Create(vform);
        // hide it temporarily, to avoid flickering
        NewCtrl.Visible := False;
        // set parent and position
        NewCtrl.Parent := vscroll;
  //      self;
        NewCtrl.Left := X;
        NewCtrl.Top := Y;
        // compute the unique name (and caption)
        MyName := ClassRef.ClassName + IntToStr(i);
        Delete(MyName, 1, 1);
        NewCtrl.Name := MyName;
        // now show it
        NewCtrl.Visible := True;
        (newctrl as TLabel).Caption := buscas.FieldByName('DISPLAY_PARAMETRO').AsString;
        tamant := 160;
  //      x+(newctrl as TLabel).width+20;
        //
        ClassRef := TCombobox;
        NewCtrl := ClassRef.Create(vform);
        // hide it temporarily, to avoid flickering
        NewCtrl.Visible := False;
        // set parent and position
        NewCtrl.Parent := vscroll;
        //self;
        NewCtrl.Left := tamant;
        NewCtrl.Top := Y;
        // compute the unique name (and caption)
        MyName := UpperCase(Buscas.FieldByName('COD_PARAMETRO').AsString);
  //      ClassRef.ClassName + IntToStr (i);
  //      Delete (MyName, 1, 1);
        NewCtrl.Name := MyName;
        // now show it
        Buscas.First;
//        DValues := Crpe1.ParamFields.DefaultValues;
        NewCtrl.Visible := True;
        while not Buscas.eof do
        begin
//        for itx := 0 to (DValues.Count - 1) do
          (newctrl as TCombobox).Items.Add(buscas.fieldbyname('CONTEUDO_PARAMETRO').AsString);
          Buscas.next;
        end;
        (newctrl as TCombobox).ItemIndex := 0;
        y := y + NewCtrl.Height + 10;
      end;
    end;
  end;
end;

function TRelConsGeral.desconectabanco: boolean;
begin
  try
    vbancotipo1.Connected := false;
  finally
    Result := not vbancotipo1.Connected;
  end;
end;

destructor TRelConsGeral.destroy;
begin
  if Assigned(FConsultasSalvas) then
    FreeAndNil(FConsultasSalvas);
  inherited;
end;

function TRelConsGeral.montapesquisa(vFerCube: THierCube; vGridCube: THierCubeGrid; vnomecons, vempresasd: string; Vform: Tform; vtipo: integer): boolean;
var
  i, j: integer;
  ic: integer;
  T: TComponent;
  vdggeral: TDimGroup;
  vteste: TdimSum;
  v: integer;
begin
  Result := true;
  vConsultaGeral.close;
  vConsultaGeral.CommandText := vstr;
  for i := Low(vpar) to High(vpar) do
  begin
    if vtipo = 0 then
    begin
      for Ic := Vform.ComponentCount - 1 downto 0 do
      begin
        T := Vform.Components[Ic];
        if vpar[i] <> '' then
        begin
          if vpar[i] = T.name then
          begin
            if (T is Tmaskedit) and ((T as TMaskEdit).editmask = '!99/99/0000;1;_') then
              vConsultaGeral.Params.ParamByName(t.Name).Value := StrToDate((T as TMaskEdit).text);
          //  copy((T as TMaskEdit).text,7,4)+','+
  //          copy((T as TMaskEdit).text,4,2)+','+copy((T as TMaskEdit).text,1,2)+' 00:00:00';
            //strtodate((T as TMaskEdit).text);
            if (T is Tcombobox) then
            begin
              vConsultaGeral.Params.ParamByName(t.Name).Value := (T as TCombobox).text;
  //                    crpe1.ParamFields[i].value:=(T as TCombobox).text;
            end;
          end;
        end;
      end;

    end
    else
    begin
      for ic := 0 to 4 do
      begin
        if vpar[i] <> '' then
        begin
          if vparametrosext[ic, 0] = vpar[i] then
            if (vparametrosext[ic, 2] = '!99/99/0000;1;_') then
              vConsultaGeral.Params.ParamByName(vparametrosext[ic, 0]).Value := StrToDate(vparametrosext[ic, 1])
            else
            begin
              vConsultaGeral.Params.ParamByName(vparametrosext[ic, 0]).Value := vparametrosext[ic, 1];
            end;
        end;
      end;
    end;
  end;
  vConsultaGeral.Open;
  vFerCube.Active := false;
  vFerCube.DataSet := vConsultaGeral;
  vFerCube.BuildDimensionMap;
  buscas.Close;
  Buscas.sql.text := 'select f.COD_CONSULTA,f.NOME_CAMPO,f.NOME_CAMPO,f.COD_EMPRESA, ' + 'f.TIPO_CAMPO,case when fp.TIPO_POS is null then f.tipo_pos else fp.tipo_pos end as TIPO_POS,f.NOME_APRESENTACAO,case when fp.seqint is null then f.seqint ' + 'else fp.seqint end as seqint,f.FORMULA_CAMPO,case when fp.cod_consulta is null then 0 else 1 end as uscons from fieldsolap f left join FIELDS_POSOLAP fp on ' + 'f.cod_consulta = fp.cod_consulta and f.cod_empresa = fp.cod_empresa and ' + 'f.nome_campo = fp.nome_campo and fp.cod_usuario = ' + IntToStr(vcodusuario) + '  where f.cod_consulta = ' + IntToStr(vcodconsulta) + ' and f.cod_empresa = ' + cod_empresa + ' order by f.cod_consulta,seqint';
  Buscas.open;
  vsvcons := Buscas.FieldByName('uscons').AsInteger;
  while not Buscas.Eof do
  begin
    if Buscas.FieldByName('TIPO_POS').AsString = 'PAGE' then
      vdggeral := dgPage;
    if Buscas.FieldByName('TIPO_POS').AsString = 'ROW' then
      vdggeral := dgRow;
    if Buscas.FieldByName('TIPO_POS').AsString = 'COL' then
      vdggeral := dgCol;
    if Buscas.FieldByName('TIPO_CAMPO').AsString = 'F' then
      vFerCube.DefineFieldAsDimension(Buscas.FieldByName('NOME_CAMPO').AsString, Buscas.FieldByName('NOME_APRESENTACAO').AsString, vdggeral)
    else
    begin
      if Buscas.FieldByName('TIPO_CAMPO').AsString = 'S' then
        vFerCube.DefineFieldAsSummary(Buscas.FieldByName('NOME_CAMPO').AsString);
    end;
//   v:=vteste.ID;
//   v:=vteste.Index;
    Buscas.next;
  end;
//  vbuscas1.Close;
//    '("BRUTO"."Sum"-"DESCONTO"."Sum")/"CUSTO"."Sum"');//

//  FrmVisualizaOlap.HierCubeGrid1.SummarySettings.BeginUpdate;

//  FrmVisualizaOlap.HierCubeGrid1.SummarySettings.EndUpdate;

  vfercube.Active := true;
  //
  Buscas.First;
  while not Buscas.Eof do
  begin
    if Buscas.FieldByName('TIPO_CAMPO').AsString = 'M' then
    begin
      if Buscas.FieldByName('FORMULA_CAMPO').AsString <> '' then
        vGridCube.SummarySettings.AddSummary(Buscas.FieldByName('NOME_CAMPO').AsString, Buscas.FieldByName('FORMULA_CAMPO').AsString);
//    itsum:=itsum+1;
//    vGridCube.SummarySettings.Items[itsum].FunctionSum.SubFunctions[0].FormatString:=Buscas.FieldByName('FORMATSTRING').AsString;
    end;
    Buscas.next;
  end;
  //
  buscas.Close;
  Buscas.sql.text := 'select * from fieldsolap where cod_consulta = ' + IntToStr(vcodconsulta) + ' and cod_empresa = ' + cod_empresa + ' order by cod_consulta,seqint';
  Buscas.open;
  while not Buscas.eof do
  begin
    if (Buscas.FieldByName('TIPO_CAMPO').AsString = 'S') or (Buscas.FieldByName('TIPO_CAMPO').AsString = 'M') then
    begin
      if (not Buscas.FieldByName('FORMATSTRING').isnull) and (Buscas.FieldByName('FORMATSTRING').AsString <> '') then
      begin
        for j := 0 to vGridCube.SummarySettings.Count - 1 do
        begin
          if vGridCube.SummarySettings.Items[j].DisplayName = uppercase(Buscas.FieldByName('NOME_CAMPO').AsString) then
          begin
            vGridCube.SummarySettings.Items[j].FunctionSum.SubFunctions[0].FormatString := Buscas.FieldByName('FORMATSTRING').AsString;
//          vGridCube.SummarySettings.Items[j].DisplayName:=Buscas.FieldByName('NOME_APRESENTACAO').AsString
          end;
        end;
      end;
    end;
    Buscas.next;
  end;
  Buscas.First;
  while not Buscas.eof do
  begin
    if (Buscas.FieldByName('TIPO_CAMPO').AsString = 'S') or (Buscas.FieldByName('TIPO_CAMPO').AsString = 'M') then
      for j := 0 to vGridCube.SummarySettings.Count - 1 do
        if vGridCube.SummarySettings.Items[j].FieldName = uppercase(Buscas.FieldByName('NOME_CAMPO').AsString) then
        begin
          vGridCube.SummarySettings.Items[j].DisplayName := Buscas.FieldByName('NOME_APRESENTACAO').AsString;
        end;
    Buscas.Next;
  end;
end;

procedure TRelConsGeral.procuraparametros(vsqlcomand: AnsiString);
var
  i, j, k: integer;
  vnovopar: string;
  vteste: string;
// vpar: array of string;
begin
  vstr := UpperCase(vsqlcomand) + ' ';
  vstr := StringReplace(vstr, #13, ' ', [rfReplaceAll]);
  vstr := StringReplace(vstr, #10, ' ', [rfReplaceAll]);
  for i := Low(vpar) to High(vpar) do
    vpar[i] := '';
  k := 0;
  i := 0;
  vnovopar := '';
  vteste := '';
  while i <= Length(vstr) do
  begin
    if vstr[i] = ':' then
    begin
      vnovopar := '';
      for j := i + 1 to Length(vstr) - 1 do
      begin
        if (vstr[j] = ' ') or (j >= Length(vstr) - 1) then
        begin
          if pos(vnovopar, vteste) = 0 then
          begin
            vpar[k] := vnovopar;
            vteste := vteste + vnovopar;
            k := k + 1;
            i := j;
            break;
          end
          else
            break;
        end
        else
          vnovopar := vnovopar + vstr[j];
      end;
    end;
    i := i + 1;
  end;
  vstr := (vsqlcomand);
end;

function TRelConsGeral.ConsultaSalva_Excluir(
  AConsulta: TConsultasSalvas): Boolean;
begin
  Result := False;
  if not Assigned(AConsulta) then
    Exit;

  try
    SqlExec('delete from fieldsolap_salvos' +
            ' where cod_consulta = ' + IntToStr(AConsulta.cod_consulta) +
            ' and cod_usuario = ' + IntToStr(AConsulta.cod_usuario) +
            ' and cod_empresa = ' + cod_empresa +
            ' and nome_salvo = ' + QuotedStr(AConsulta.nome_salvo));

    if Buscas.Transaction.InTransaction then
      Buscas.Transaction.Commit;

    Result := True;
  except on E: Exception do
    begin
      if Buscas.Transaction.InTransaction then
        Buscas.Transaction.Rollback;
      Application.MessageBox(PChar('Erro ao excluir consulta ' + AConsulta.nome_salvo + #13 +
        'Erro ' + e.Message), 'Erro', MB_ICONERROR);
    end;
  end;
end;

function TRelConsGeral.ConsultaSalva_GetFromGrid(AConsulta: TConsultasSalvas;
  AGrid: THierCubeGrid): TConsultasSalvas;
var
  ACons: TConsultasSalvas;
  ANewOrderFields: TConsultasSalvasFieldsList;
  AFieldsDimension, AFieldsSummary, AFieldsUnknown: TConsultasSalvasFieldsList;
  AFieldNewFormula: TConsultasSalvasFields;
  ANewFormula: Boolean;
  I, J, AIndex: Integer;

  {$REGION 'registro de um log para entender o funcionamento do hiercube e o grid'}
  
  ALog: TStringList;
  procedure log(AText: string);
  begin
    ALog.Add( IntToStr(ALog.Count + 1) + ' - '+ AText);
  end;

  procedure montarLog(AFileName: string);
  var
    JCont, ICont: Integer;    
    SumInfo: TSummaryInfo;
    FunInfo: TFunctionInfo;
    SubFun: TSubFunction;
  begin

    //log
    ALog := TStringList.Create;

    log('my fields ' + IntToStr(AConsulta.Campos.Count));
    for JCont := 0 to AConsulta.Campos.Count - 1 do
      log( IntToStr(JCont) + ' - '+  AConsulta.Campos.Items[JCont].nome_campo + ' - ' +  AConsulta.Campos.Items[JCont].nome_apresentacao );

    log('');
    log('my fields AFieldsDimension ' + IntToStr(AFieldsDimension.Count));
    for JCont := 0 to AFieldsDimension.Count - 1 do
      log( IntToStr(JCont) + ' - '+  AFieldsDimension.Items[JCont].nome_campo + ' - ' +  AFieldsDimension.Items[JCont].nome_apresentacao );

    log('');
    log('my fields AFieldsSummay ' + IntToStr(AFieldsSummary.Count));
    for JCont := 0 to AFieldsSummary.Count - 1 do
      log( IntToStr(JCont) + ' - '+  AFieldsSummary.Items[JCont].nome_campo + ' - ' +  AFieldsSummary.Items[JCont].nome_apresentacao );

    log('');  
    log('my fields AFieldsUnknown ' + IntToStr(AFieldsUnknown.Count));
    for JCont := 0 to AFieldsUnknown.Count - 1 do
      log( IntToStr(JCont) + ' - '+  AFieldsUnknown.Items[JCont].nome_campo + ' - ' +  AFieldsUnknown.Items[JCont].nome_apresentacao );

    log('');
    log('AGrid.GridInfo.Cube.DimensionMap ' + IntToStr(AGrid.GridInfo.Cube.DimensionMap.Count));

    for ICont := 0 to AGrid.GridInfo.Cube.DimensionMap.Count - 1 do
      with AGrid.GridInfo.Cube.DimensionMap.Items[ICont] do
      begin
        log(IntToStr(ICont) +
            ' - F:' + BaseFieldName +
            ' - Index:' + IntToStr(Index) +
            ' - ID:' + IntToStr(ID) +
            ' - Type:' + IfThen(DimSumType = dsDimension, 'dsDimension') + IfThen(DimSumType = dsSummary, 'dsSummary') + IfThen(DimSumType = dsUnknown, 'dsUnknown') +
            ' - DisplayName: ' + DisplayName +
            ' - ID_Field: ' + ID_Field +
            ' - Name_Field: '+ Name_Field +
            ' - DefaultFormat: '+ DefaultFormat);
        
      end;

    log('');
    log('AGrid.GridInfo.RowDimIDs ' + IntToStr(AGrid.GridInfo.RowDimIDs.Count));
    for ICont := 0 to AGrid.GridInfo.RowDimIDs.Count - 1 do
    begin
      log(IntToStr(ICont) +
        ' - Itens[' + IntToStr(ICont) + '] : ' + IntToStr(AGrid.GridInfo.RowDimIDs.Items[ICont]));
    end;

    log('');
    log('AGrid.GridInfo.ColDimIDs ' + IntToStr(AGrid.GridInfo.ColDimIDs.Count));
    for ICont := 0 to AGrid.GridInfo.ColDimIDs.Count - 1 do
    begin
      log(IntToStr(ICont) +
        ' - Itens[' + IntToStr(ICont) + '] : ' + IntToStr(AGrid.GridInfo.ColDimIDs.Items[ICont]));
    end;

    log('');
    log('AGrid.GridInfo.PageDimIDs ' + IntToStr(AGrid.GridInfo.PageDimIDs.Count));
    for ICont := 0 to AGrid.GridInfo.PageDimIDs.Count - 1 do
    begin
      log(IntToStr(ICont) +
        ' - Itens[' + IntToStr(ICont) + '] : ' + IntToStr(AGrid.GridInfo.PageDimIDs.Items[ICont]));
    end;

    log('');
    log('AGrid.GridInfo.SummarySettings ' + IntToStr(AGrid.GridInfo.SummarySettings.Count));
    for ICont := 0 to AGrid.GridInfo.SummarySettings.Count - 1 do
    begin
      log(IntToStr(ICont) +
        ' - FieldName: ' + AGrid.GridInfo.SummarySettings.Items[ICont].FieldName +
        ' - DisplayName: ' + AGrid.GridInfo.SummarySettings.Items[ICont].DisplayName +
        ' - DefaultFormat: ' + AGrid.GridInfo.SummarySettings.Items[ICont].DefaultFormat +
        ' - SumID: ' + IntToStr(AGrid.GridInfo.SummarySettings.Items[ICont].SumID) +
        ' - ID: ' + IntToStr(AGrid.GridInfo.SummarySettings.Items[ICont].ID));
      SumInfo := AGrid.FindSummaryFieldName(AGrid.GridInfo.SummarySettings.Items[ICont].FieldName);
      if Assigned(SumInfo) then
        log(IntToStr(ICont) +
          '             - Formula: ' + SumInfo.Formula);
      
      
    end;
    log('AGrid.GridInfo.FunctionDefs.Count ' + IntToStr(AGrid.GridInfo.FunctionDefs.Count));
    log('AGrid.GridInfo.Cube.Summaries.Count ' + IntToStr(AGrid.GridInfo.Cube.Summaries.Count));
    ALog.SaveToFile( ExtractFilePath(Application.ExeName) +  AFileName + '.log');
  end;
  {$ENDREGION}   

begin
  if not Assigned(AConsulta) then
    ACons := TConsultasSalvas.Create
  else
    ACons := AConsulta;

  ANewOrderFields  := TConsultasSalvasFieldsList.Create;
  AFieldsDimension := TConsultasSalvasFieldsList.Create;
  AFieldsSummary    := TConsultasSalvasFieldsList.Create;
  AFieldsUnknown   := TConsultasSalvasFieldsList.Create;

  //definindo as listas, pois no hiercube são separadas
  for I := 0 to AGrid.GridInfo.Cube.DimensionMap.Count - 1 do
    with AGrid.GridInfo.Cube.DimensionMap.Items[I] do
      for J := 0 to AConsulta.Campos.Count - 1 do
        if UpperCase(AConsulta.Campos.Items[J].nome_campo) = UpperCase(BaseFieldName) then
        begin
          if DimSumType = dsDimension then
            AFieldsDimension.Add(AConsulta.Campos.Items[J])
          else if DimSumType = dsSummary then
            AFieldsSummary.Add(AConsulta.Campos.Items[J])
          else
            AFieldsUnknown.Add(AConsulta.Campos.Items[J]);
        end;


  for I := 0 to AGrid.SummarySettings.Count - 1 do
    with AGrid.GridInfo.SummarySettings.Items[I] do
      if Trim(Formula) <> '' then
      begin
        ANewFormula := True;
        for J := 0 to AConsulta.Campos.Count - 1 do
          if (UpperCase(AConsulta.Campos.Items[J].nome_campo) = UpperCase(FieldName)) and
            (AConsulta.Campos.Items[J].tipo_campo = 'M') then
          begin
            ANewFormula := False;
            AFieldsUnknown.Add(AConsulta.Campos.Items[J]);
            Break;
          end;
        if ANewFormula then
          with AFieldsUnknown.New do
          begin
            nome_campo := FieldName;
            nome_apresentacao := DisplayName;
            formula_campo := Formula;
            formatstring := DefaultFormat;
            tipo_campo := 'M';
          end;
      end;

   montarLog('log_olap_antes');

  //adicionando a os fields a nova ordem, rows
  for I := 0 to AGrid.GridInfo.RowDimIDs.Count - 1 do
  begin
    AIndex := AGrid.GridInfo.RowDimIDs.Items[I];
    AFieldsDimension.Items[AIndex].tipo_pos := 'ROW';
    ANewOrderFields.Add(AFieldsDimension.Items[AIndex]);
  end;

  //adicionando a os fields a nova ordem, cols
  for I := 0 to AGrid.GridInfo.ColDimIDs.Count - 1 do
  begin
    AIndex := AGrid.GridInfo.ColDimIDs.Items[I];
    AFieldsDimension.Items[AIndex].tipo_pos := 'COL';
    ANewOrderFields.Add(AFieldsDimension.Items[AIndex]);
  end;

  //adicionando a os fields a nova ordem, pages
  for I := 0 to AGrid.GridInfo.PageDimIDs.Count - 1 do
  begin
    AIndex := AGrid.GridInfo.PageDimIDs.Items[I];
    AFieldsDimension.Items[AIndex].tipo_pos := 'PAGE';
    ANewOrderFields.Add(AFieldsDimension.Items[AIndex]);
  end;

  //adicionando a os fields a nova ordem, sumarios
  for I := 0 to AGrid.GridInfo.SummarySettings.Count - 1 do
  begin
    AIndex := AGrid.GridInfo.SummarySettings.Items[I].SumID;
    if (AIndex <= AFieldsSummary.Count - 1) and (AIndex >-1) then
    begin
      AFieldsSummary.Items[AIndex].tipo_pos := '';
      ANewOrderFields.Add(AFieldsSummary.Items[AIndex]);
    end
    else if AIndex = -1 then
      for J := AFieldsUnknown.Count - 1 downto 0 do
        if UpperCase(AGrid.GridInfo.SummarySettings.Items[I].FieldName) = UpperCase(AFieldsUnknown.Items[J].nome_campo) then
        begin
          ANewOrderFields.Add(AFieldsUnknown.Items[J].NewCopy);
          AFieldsUnknown.Delete(J);
          Break;
        end;
  end;

  //adicionando fields a nova ordem, Unknown
  for I := 0 to AFieldsUnknown.Count - 1 do
    ANewOrderFields.Add(AFieldsUnknown.Items[I]);

  ACons.Campos := ANewOrderFields;
  Result := ACons;
  
  montarLog('log_olap_depois');
end;

function TRelConsGeral.ConsultaSalva_Go(AConsulta: TConsultasSalvas;
  AGrid: THierCubeGrid): TConsultasSalvas;
var
  AFieldsDimension, AFieldsSummary: TConsultasSalvasFieldsList;
  ADimGroup: TDimGroup;
  ADim: TDimensionState;
  ASum: TSummaryInfo;
  I: Integer;
begin
  try
    AGrid.BeginRebuild;

    AFieldsDimension := TConsultasSalvasFieldsList.Create;
    AFieldsSummary    := TConsultasSalvasFieldsList.Create;

    for I := 0 to AConsulta.Campos.Count - 1 do
      if AConsulta.Campos.Items[I].tipo_campo = 'F' then
        AFieldsDimension.Add(AConsulta.Campos.Items[I])
      else if AConsulta.Campos.Items[I].tipo_campo = 'S' then
        AFieldsSummary.Add(AConsulta.Campos.Items[I])
      else if AConsulta.Campos.Items[I].tipo_campo = 'M' then
        AFieldsSummary.Add(AConsulta.Campos.Items[I]);


    for I := 0 to AFieldsDimension.Count - 1 do
    begin
      ADim := AGrid.DimensionStates.FindFieldName(AFieldsDimension.Items[I].nome_campo);
      if      AFieldsDimension.Items[I].tipo_pos = 'ROW'  then ADimGroup := dgRow
      else if AFieldsDimension.Items[I].tipo_pos = 'COL'  then ADimGroup := dgCol
      else if AFieldsDimension.Items[I].tipo_pos = 'PAGE' then ADimGroup := dgPage
      else                                                     ADimGroup := dgNone;

      if Assigned(ADim) then
        AGrid.MoveDim(ADim, ADimGroup, I);
    end;

    for I := 0 to AFieldsSummary.Count - 1 do
    begin
      ASum := AGrid.SummarySettings.FindFieldName(AFieldsSummary.Items[I].nome_campo);
      if Assigned(ASum) then
        ASum.MoveTo(I);
    end;
  finally
    AGrid.EndRebuild;
  end;
end;

function TRelConsGeral.ConsultaSalva_Salvar(AConsulta: TConsultasSalvas): Boolean;
var
  I: Integer;
begin
  Result := False;
  if not Assigned(AConsulta) then
    Exit;

  try
    SqlExec('delete from fieldsolap_salvos' +
            ' where cod_consulta = ' + IntToStr(AConsulta.cod_consulta) +
            ' and cod_usuario = ' + IntToStr(AConsulta.cod_usuario) +
            ' and cod_empresa = ' + cod_empresa +
            ' and nome_salvo = ' + QuotedStr(AConsulta.nome_salvo));

    Buscas.Close;
    Buscas.SQL.Text :=
      ' insert into fieldsolap_salvos (cod_consulta, nome_salvo, nome_campo, cod_usuario, cod_empresa, tipo_pos, seqint, tipo_campo)' +
      ' values (:cod_consulta, :nome_salvo, :nome_campo, :cod_usuario, :cod_empresa, :tipo_pos, :seqint, :tipo_campo)';
    for I := 0 to AConsulta.Campos.Count - 1 do
    begin
      Buscas.ParamByName('cod_consulta').AsInteger := AConsulta.cod_consulta;
      Buscas.ParamByName('nome_salvo').AsString    := Copy(AConsulta.nome_salvo, 1, 32);
      Buscas.ParamByName('nome_campo').AsString    := Copy(AConsulta.Campos.Items[I].nome_campo, 1, 30);
      Buscas.ParamByName('cod_usuario').AsInteger  := AConsulta.cod_usuario;
      Buscas.ParamByName('cod_empresa').AsInteger  := StrToInt(cod_empresa);
      Buscas.ParamByName('tipo_pos').AsString      := Copy(AConsulta.Campos.Items[I].tipo_pos, 1, 10);
      Buscas.ParamByName('seqint').AsInteger       := I;
      Buscas.ParamByName('tipo_campo').AsString    := Copy(AConsulta.Campos.Items[I].tipo_campo, 1, 1);
      if not Buscas.Prepared then
        Buscas.Prepare;
      Buscas.ExecSQL;
    end;
    if Buscas.Transaction.InTransaction then
      Buscas.Transaction.Commit;

    Result := True;
  except on E: Exception do
    begin
      if Buscas.Transaction.InTransaction then
        Buscas.Transaction.Rollback;
      Application.MessageBox(PChar('Erro ao salvar consulta ' + AConsulta.nome_salvo + IntToStr(I) + #13 +
        'Erro ' + e.Message), 'Erro', MB_ICONERROR);
    end;
  end;
end;

procedure TRelConsGeral.SelecionaConsultasSalvas(AConsulta: string);
var
  I, ACodConsulta: Integer;
  AConsultaSalva: TConsultasSalvas;
  Asql, Atipoconsulta: string;
begin
  if Assigned(FConsultasSalvas) then
    FreeAndNil(FConsultasSalvas);
  FConsultasSalvas := TConsultasSalvasList.Create;

  if vcodusuario = 0 then
    vcodusuario := SqlOpen('select codigo from senhas' +
                           ' where usuario = ' + QuotedStr(vusuario) +
                           ' and cod_empresa = ' + cod_empresa).FieldByName('codigo').AsInteger;

  ACodConsulta := SqlOpen('select cod_consulta, consultasql, tipoconsulta from SQLCONSULTASDIV' +
                          ' where descricaocons = ' + QuotedStr(AConsulta) +
                          ' and cod_empresa = ' + cod_empresa).FieldByName('cod_consulta').AsInteger;
  Asql := Buscas.FieldByName('consultasql').AsString;
  Atipoconsulta := Buscas.FieldByName('tipoconsulta').AsString;

  if SqlOpen('select distinct cod_consulta, nome_salvo, cod_usuario from FIELDSOLAP_SALVOS' +
    ' where cod_consulta = ' + IntToStr(ACodConsulta) +
    ' and cod_empresa = ' + cod_empresa +
    ' and cod_usuario = ' + IntToStr(vcodusuario)).IsEmpty then
  begin //primeiro acesso nunca salvou nenhuma, entao pesquisa na tabela antiga e salva na nova
    if not SqlOpen('select 0 ordem, fpo.seqint, fo.cod_consulta, fo.nome_campo, fo.cod_empresa, fpo.tipo_pos, fo.tipo_campo,' +
                   ' fo.formatstring, fo.nome_apresentacao, fo.formula_campo' +
                   ' from fieldsolap fo' +
                   ' inner join fields_posolap fpo on fpo.cod_consulta = fo.cod_consulta and fpo.nome_campo = fo.nome_campo and fpo.cod_empresa = fo.cod_empresa and fpo.cod_usuario = ' + IntToStr(vcodusuario) +
                   ' where fo.cod_consulta = ' + IntToStr(ACodConsulta) +
                   ' and fo.cod_empresa = ' + cod_empresa +
                   ' union' +
                   ' select 1 ordem, fo.seqint, fo.cod_consulta, fo.nome_campo, fo.cod_empresa, fo.tipo_pos, fo.tipo_campo,' +
                   ' fo.formatstring, fo.nome_apresentacao, fo.formula_campo' +
                   ' from fieldsolap fo' +
                   ' left join fields_posolap fpo on fpo.cod_consulta = fo.cod_consulta and fpo.nome_campo = fo.nome_campo and fpo.cod_empresa = fo.cod_empresa and fpo.cod_usuario = ' + IntToStr(vcodusuario) +
                   ' where fo.cod_consulta = ' + IntToStr(ACodConsulta) +
                   ' and fo.cod_empresa = ' + cod_empresa +
                   ' and fpo.nome_campo is null' +
                   ' order by 1,2').IsEmpty then
    begin
      AConsultaSalva := TConsultasSalvas.Create;
      with AConsultaSalva do
      begin
        nome_salvo := 'Ultima consulta';
        cod_usuario := vcodusuario;
        cod_consulta := ACodConsulta;

        SQLText      := Asql;
        tipoconsulta := Atipoconsulta;
        Buscas.First;
        while not Buscas.Eof do
        begin
          with Campos.New do
          begin
            nome_campo        := Buscas.FieldByName('nome_campo').AsString;
            nome_apresentacao := Buscas.FieldByName('nome_apresentacao').AsString;
            formula_campo     := Buscas.FieldByName('formula_campo').AsString;
            formatstring      := Buscas.FieldByName('formatstring').AsString;
            tipo_pos          := Buscas.FieldByName('tipo_pos').AsString;
            seqint            := Buscas.FieldByName('seqint').AsInteger;
            tipo_campo        := Buscas.FieldByName('tipo_campo').AsString;
          end;
          Buscas.Next;
        end;
      end;
      if ConsultaSalva_Salvar(AConsultaSalva) then
        SqlExec('delete from fields_posolap' +
                ' where cod_consulta = ' + IntToStr(ACodConsulta) +
                ' and cod_empresa = ' + cod_empresa +
                ' and cod_usuario = ' + IntToStr(vcodusuario));
      //continuar aqui criar a consulta na tabela nova e excluir a antiga, criar os metodos de salvar e alterar o formulario
      //para mudar e salvar tbm as novas ConsultasSalvas, tbm excluir
    end;
  end;

  with FConsultasSalvas.New do
  begin
    cod_consulta := ACodConsulta;
    nome_salvo   := 'Consulta padrao';
    cod_usuario  := vcodusuario;
    SQLText      := Asql;
    tipoconsulta := Atipoconsulta;
  end;

  if not SqlOpen('select distinct cod_consulta, nome_salvo, cod_usuario from FIELDSOLAP_SALVOS' +
    ' where cod_consulta = ' + IntToStr(ACodConsulta) +
    ' and cod_empresa = ' + cod_empresa +
    ' and cod_usuario = ' + IntToStr(vcodusuario)).IsEmpty then
    while not Buscas.Eof do
    begin
      with FConsultasSalvas.New do
      begin
        cod_consulta := Buscas.FieldByName('cod_consulta').AsInteger;
        nome_salvo   := Buscas.FieldByName('nome_salvo').AsString;
        cod_usuario  := Buscas.FieldByName('cod_usuario').AsInteger;
        SQLText      := Asql;
        tipoconsulta := Atipoconsulta;
      end;
      Buscas.Next;
    end;

  for I := 0 to FConsultasSalvas.Count - 1 do
  begin
    SqlOpen(
      IfThen( FConsultasSalvas.Items[I].nome_salvo = 'Consulta padrao',
        //consulta padrao
       'select fo.seqint, fo.cod_consulta, fo.nome_campo, fo.tipo_pos, fo.tipo_campo,' +
       ' fo.formatstring, fo.nome_apresentacao, fo.formula_campo' +
       ' from fieldsolap fo' +
       ' where fo.cod_consulta = ' + IntToStr(FConsultasSalvas.Items[I].cod_consulta) +
       ' and fo.cod_empresa = ' + cod_empresa +
       ' order by 1',
       //consulta salva pelo usuario
       'select 0 ordem, fos.seqint, fos.cod_consulta, fos.nome_campo, fos.tipo_pos, fos.tipo_campo,' +
       ' fo.formatstring, fo.nome_apresentacao, fo.formula_campo' +
       ' from fieldsolap fo' +
       ' inner join fieldsolap_salvos fos on fos.cod_consulta = fo.cod_consulta and fos.nome_campo = fo.nome_campo and fos.cod_empresa = fo.cod_empresa' +
       '   and fos.cod_usuario = ' + IntToStr(FConsultasSalvas.Items[I].cod_usuario) +
       '   and fos.nome_salvo = '  + QuotedStr(FConsultasSalvas.Items[I].nome_salvo) +
       ' where fos.cod_consulta = ' + IntToStr(FConsultasSalvas.Items[I].cod_consulta) +
       ' and fos.cod_empresa = ' + cod_empresa +
       ' union ' +
       'select 1 ordem, fo.seqint, fo.cod_consulta, fo.nome_campo, fo.tipo_pos, fo.tipo_campo,' +
       ' fo.formatstring, fo.nome_apresentacao, fo.formula_campo' +
       ' from fieldsolap fo' +
       ' left join fieldsolap_salvos fos on fos.cod_consulta = fo.cod_consulta and fos.nome_campo = fo.nome_campo and fos.cod_empresa = fo.cod_empresa' +
       '   and fos.cod_usuario = ' + IntToStr(FConsultasSalvas.Items[I].cod_usuario) +
       '   and fos.nome_salvo = '  + QuotedStr(FConsultasSalvas.Items[I].nome_salvo) +
       ' where fo.cod_consulta = ' + IntToStr(FConsultasSalvas.Items[I].cod_consulta) +
       ' and fo.cod_empresa = ' + cod_empresa +
       ' and fos.nome_salvo is null' +
       ' order by 1, 2'));       

    while not Buscas.Eof do
    begin
      with FConsultasSalvas.Items[I].Campos.New do
      begin
        nome_campo        := Buscas.FieldByName('nome_campo').AsString;
        nome_apresentacao := Buscas.FieldByName('nome_apresentacao').AsString;
        formula_campo     := Buscas.FieldByName('formula_campo').AsString;
        formatstring      := Buscas.FieldByName('formatstring').AsString;
        tipo_pos          := Buscas.FieldByName('tipo_pos').AsString;
        seqint            := Buscas.FieldByName('seqint').AsInteger;
        tipo_campo        := Buscas.FieldByName('tipo_campo').AsString;
      end;
      Buscas.Next;
    end;
  end;
  if Buscas.Transaction.InTransaction then
    Buscas.Transaction.Commit;
end;

function TRelConsGeral.SqlExec(ASql: string; AQuery: TIBQuery): TIBQuery;
begin
  if AQuery = nil then
    AQuery := buscas;

  AQuery.Close;
  AQuery.SQL.Text := ASql;
  if not AQuery.Prepared then
    AQuery.Prepare;
  AQuery.ExecSQL;

  Result := AQuery;
end;

function TRelConsGeral.SqlOpen(ASql: string; AQuery: TIBQuery): TIBQuery;
begin
  if AQuery = nil then
    AQuery := buscas;

  AQuery.Close;
  AQuery.SQL.Text := ASql;
  AQuery.Open;

  Result := AQuery;
end;

procedure TRelConsGeral.treeviewExpandir(Node: TTreeNode; var AllowExpansion: Boolean; const TreeView: TTreeView);
var
  TreeNode: TTreeNode;
//  AddFalseNode: Boolean;
begin
  try
    Screen.Cursor := crHourGlass;
    if vusuario = 'HW' then
    begin
      Buscas.close;
      buscas.sql.text := ' select * from SQLCONSULTASDIV ' +
      	'	where cod_empresa = ' + cod_empresa +
        ' and tipoconsulta = ' + QuotedStr(vtipoconsulta);
    end
    else
    begin
      Buscas.close;
      buscas.sql.text := ' select * from SQLCONSULTASDIV s ' +
      	' where s.cod_empresa = ' + cod_empresa +
        ' and s.tipoconsulta = ' + QuotedStr(vtipoconsulta) +
        ' and (select count(*) from user_consultasdiv c ' +
        '			 where c.cod_consulta = s.cod_consulta ' +
        '			 and c.cod_empresa = s.cod_empresa ' +
        ' 		 and c.usuario = ' + QuotedStr(vusuario) + ') > 0 ';
    end;
    Buscas.open;
    case Node.Level of
      0: // se a expansão for na nota
        begin
          if Node.GetFirstChild.Text <> '' then
            Exit;
          Node.DeleteChildren;
          //            DataSet.AutoCalcFields := False;
          try
            TreeView.Items.BeginUpdate;
            if Node <> nil then
              Node.DeleteChildren;

            Buscas.First;
            while not Buscas.eof do
            begin
              TreeNode := TreeView.Items.AddChild(Node, Buscas.FieldByName('DESCRICAOCONS').AsString);
              //                     TreeNode.ImageIndex := ImageIndex;
              //                     TreeNode.SelectedIndex := SelectedIndex;
//              AddFalseNode := False;
//              if (ChildTable <> '') and (ChildField <> '') then
//                VerificaTemFilhos(ChildTable, ChildField, ChildField + '=''' + DTM02.QRYItens_Config_NF.FieldByName('DESCRICAO').AsString + '''', AddFalseNode);
//              if AddFalseNode then
//                TreeView1.Items.AddChild(TreeNode, '');
              Buscas.Next;
            end;
          finally
            //               Dataset.AutoCalcFields := True;
            TreeView.Items.EndUpdate;
          end;
          //            PopulaTreeView(TreeView1, Node, DTM02.QRYCabecalhoNF, 'NOME_NF',2,3,'CABECALHO_NF','CODIGO');
          AllowExpansion := True;
        end;
    end; // case
  finally
    Screen.Cursor := crDefault;
  end;
end;

function TRelConsGeral.verificasenha(vcodus: string; vrel: string): boolean;
var
  vnivel: integer;
// vnome: string;
begin
  Result := true;
  Buscas.close;
  Buscas.sql.text := 'SELECT * FROM SENHAS WHERE USUARIO = ''' + vusuario + ''' AND COD_EMPRESA = ' + cod_empresa;
  buscas.Open;
  vnivel := Buscas.FieldByName('NIVEL_US').AsInteger;
  vcodusuario := Buscas.FieldByName('CODIGO').AsInteger;
  buscas.close;
  buscas.sql.text := 'SELECT * FROM TABELA_PROCESSOS WHERE COD_PROCESSO = ''' + vcodus + ''' AND COD_EMPRESA = ' + cod_empresa;
  Buscas.open;
  if not Buscas.IsEmpty then
  begin
    if vnivel < buscas.FieldByName('NIVEL_PROCESSO').AsInteger then
    begin
      Application.MessageBox(pchar('Processo ' + vcodus + ' Não permitido para este usuário'), Pchar('Aviso'), MB_OK);
      Result := false;
    end
    else
    begin
      if Buscas.FieldByName('GRAVAR_AUDITORIA').AsString = 'S' then
        gravarAuditoria(pchar(vusuario), pchar(''), pchar(buscas.FieldByName('COD_PROCESSO').asstring), pchar('ACESSO'), pchar(buscas.FieldByName('NOME_PROCESSO').asstring + ' "' + vrel + '"'), pchar(''), pchar(''), pchar(cod_empresa));
      Result := true;
    end;
  end
  else
  begin
    Application.MessageBox(pchar('Processo ' + vcodus + ' Não definido na tabela de processos'), Pchar('Aviso'), MB_OK);
    Result := false;
  end;
  Buscas.close;
end;

procedure TRelConsGeral.PopulaTreeView(const TreeView: TTreeView; const Node: TTreeNode; const Field: string; const ImageIndex, SelectedIndex: Integer; ChildTable, ChildField: string);
var
  TreeNode: TTreeNode;
  AddFalseNode: Boolean;
begin
  if vusuario = 'HW' then
  begin
    Buscas.close;
    buscas.sql.text := ' select distinct tipoconsulta from SQLCONSULTASDIV ' +
    	' where cod_empresa = ' + cod_empresa;
    Buscas.open;
  end
  else
  begin
    Buscas.close;
    buscas.sql.text := ' select distinct s.tipoconsulta from SQLCONSULTASDIV s ' +
    	'	where s.cod_empresa = ' + cod_empresa +
      ' and (select count(*) from user_consultasdiv c ' +
      '			 where c.cod_consulta = s.cod_consulta ' +
      '			 and c.cod_empresa = s.cod_empresa ' +
      '			 and c.usuario = ' + QuotedStr(vusuario) + ') > 0';
    Buscas.open;
  end;
  Buscas.AutoCalcFields := False;
  try
    TreeView.Items.BeginUpdate;
    buscas.First;
    if Node <> nil then
      Node.DeleteChildren;
    while not buscas.Eof do
    begin
      TreeNode := TreeView.Items.AddChild(Node, Buscas.FieldByName('TIPOCONSULTA').AsString);
      TreeNode.ImageIndex := ImageIndex;
      TreeNode.SelectedIndex := SelectedIndex;
      AddFalseNode := False;
//      if (ChildTable <> '') and (ChildField <> '') then
//        VerificaTemFilhos(ChildTable, ChildField, ChildField + '=''' + DataSet.FieldByName(ChildField).AsString + '''', AddFalseNode);
//      if AddFalseNode then
      TreeView.Items.AddChild(TreeNode, '');
      buscas.Next;
    end;
  finally
    buscas.AutoCalcFields := True;
    TreeView.Items.EndUpdate;
    Buscas.close;
  end;
end;

function TRelConsGeral.abresenhas(vtp: integer): boolean;
begin
  result := true;
  vtbsenha.Close;
  vtbsenha.SQL.Text := 'SELECT USUARIO,COD_EMPRESA,CODIGO FROM SENHAS WHERE COD_EMPRESA = ' + cod_empresa + ' AND ATIVO = 1 ';
  if vtp = 1 then
    vtbsenha.Open
  else
    vtbsenha.close;
end;

function TRelConsGeral.buscacodconsulta(vdadospesq: string): integer;
begin
  Buscas.close;
  buscas.sql.text := 'select * from SQLCONSULTASDIV where descricaocons = ''' + vdadospesq + ''' and cod_empresa = ' + cod_empresa;
  Buscas.open;
  Result := Buscas.FieldByName('COD_CONSULTA').AsInteger;
  Buscas.close;
end;

function TRelConsGeral.conectaBanco: boolean;
var
  vPw, vUs: string;
begin
  try
    vUs := string(__getUsuarioFDB);
    vPw := string(__getSenhaFDB);
    vbancotipo1.Connected := false;

    if (Trim(vUs) <> '') then
      vbancotipo1.Params[0] := 'user_name=' + string(__descriptografaTextoFDB(Pchar(vUs)));
    if (Trim(vPw) <> '') then
      vbancotipo1.Params[1] := 'password=' + string(__descriptografaTextoFDB(Pchar(vPw)));

    vbancotipo1.DatabaseName := vendbanco;
    try
      vbancotipo1.Connected := true;
    except
      on e: exception do
      begin
        if application.messagebox('Erro ao conectar banco. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
          Application.MessageBox(pchar(E.Message), Pchar('Error'), MB_OK);
      end;
    end;
  finally
    Result := vbancotipo1.Connected;
  end;

end;

function TRelConsGeral.abreStatusProcessamento(pTitulo, vMensagemStatus: string): boolean;
begin

  if frmStatusProcessamento_2 = nil then
    Application.CreateForm(TfrmStatusProcessamento_2, frmStatusProcessamento_2);
  frmStatusProcessamento_2.Show;
  if Trim(pTitulo) <> '' then
    frmStatusProcessamento_2.lbl1.Caption := pTitulo;
  frmStatusProcessamento_2.lblStatus.Caption := vMensagemStatus;
  frmStatusProcessamento_2.Refresh;

end;

procedure TRelConsGeral.fechaStatusProcessamento;
begin

  if frmStatusProcessamento_2 <> nil then
  begin
    frmStatusProcessamento_2.Close;
    frmStatusProcessamento_2.free;
    frmStatusProcessamento_2 := nil;
  end;

end;

function TRelConsGeral.Gravapospesquisa(vFerCube: THierCube; vGridCube: THierCubeGrid): boolean;
var
  vitcons, i, ix: integer;
  vflag: integer;
  eu: string;
begin
  if not DtmConsGeral.IbTransConsGeral.InTransaction then
    DtmConsGeral.IbTransConsGeral.StartTransaction;
  vConsultaGeral.close;
// vGridCube.GridInfo.FActiveDimIndexes.Sort;
  VconsultaUs.EmptyDataSet;
  vConsultaGeral.close;
  vConsultaGeral.CommandText := 'select * from FIELDS_POSOLAP where cod_consulta = ' + inttostr(vcodconsulta) + ' and cod_empresa = ' + cod_empresa + ' and cod_usuario = ' + IntToStr(vcodusuario) + ' order by seqint';
  vConsultaGeral.Open;
  while not vConsultaGeral.Eof do
  begin
    VconsultaUs.Append;
    VconsultaUs.FieldByName('NOME_CAMPO').AsString := vConsultaGeral.FieldByName('NOME_CAMPO').AsString;
    VconsultaUs.FieldByName('SEQINT').AsInteger := vConsultaGeral.FieldByName('SEQINT').AsInteger;
    VconsultaUs.FieldByName('TIPO_CAMPO').AsString := vConsultaGeral.FieldByName('TIPO_CAMPO').AsString;
    VconsultaUs.Post;
    vConsultaGeral.next;
  end;
  buscas.close;
  Buscas.SQL.text := 'delete from fields_posolap where ' + 'cod_consulta = ' + inttostr(vcodconsulta) + ' and cod_empresa = ' + cod_empresa + ' and cod_usuario = ' + IntToStr(vcodusuario);
  Buscas.Prepare;
  Buscas.ExecSQL;
  vConsultaGeral.close;
  vConsultaGeral.CommandText := 'select * from FIELDS_POSOLAP where cod_consulta = ' + inttostr(vcodconsulta) + ' and cod_empresa = ' + cod_empresa + ' and cod_usuario = ' + IntToStr(vcodusuario);
  vConsultaGeral.Open;
  vGridCube.Refresh;
  for i := 0 to vGridCube.GridInfo.Cube.DimensionMap.Count - 1 do
  begin
    if vGridCube.GridInfo.Cube.DimensionMap.Items[i].BaseFieldType <> ftDateTime then
    begin
//    vConsultaGeral.close;
//    vConsultaGeral.CommandText:='select * from FIELDS_POSOLAP where cod_consulta = '+inttostr(vcodconsulta)+
//    ' and cod_empresa = '+cod_empresa+' and cod_usuario = '+IntToStr(vcodusuario)+' and nome_campo = '''+
//    vGridCube.GridInfo.Cube.DimensionMap.Items[i].BaseFieldName+'''';
//    vConsultaGeral.Open;
//    if vConsultaGeral.IsEmpty then

      if vsvcons = 1 then
      begin
//     if VconsultaUs.Locate('SEQINT',i,[]) then
        if VconsultaUs.Locate('NOME_CAMPO', vGridCube.GridInfo.Cube.DimensionMap.Items[i].BaseFieldName, []) then
          vflag := 0
        else
          vflag := 1;
      end
      else
      begin
        buscas.close;
        buscas.SQL.Text := 'select NOME_CAMPO,seqint,tipo_campo from fieldsolap where cod_consulta = ' + inttostr(vcodconsulta) + ' and cod_empresa = ' + cod_empresa + ' and nome_campo = ''' + vGridCube.GridInfo.Cube.DimensionMap.Items[i].BaseFieldName + '''';
     //' and seqint = '+IntToStr(i);
        Buscas.Open;
        if Buscas.IsEmpty then
          vflag := 1
        else
          vflag := 0;
      end;
      if vflag = 0 then
      begin
        vConsultaGeral.Insert;
        vConsultaGeral.FieldByName('COD_CONSULTA').AsInteger := vcodconsulta;
        if vsvcons = 1 then
          vConsultaGeral.FieldByName('NOME_CAMPO').AsString := VconsultaUs.FieldByName('NOME_CAMPO').AsString
        else
          vConsultaGeral.FieldByName('NOME_CAMPO').AsString := Buscas.FieldByName('NOME_CAMPO').AsString;
        vConsultaGeral.FieldByName('NOME_CAMPO').AsString := vGridCube.GridInfo.Cube.DimensionMap.Items[i].BaseFieldName;
//      eu:=vGridCube.GridInfo.Cube.DimensionMap.Items[i].BaseFieldName;
//      eu:=vGridCube.GridInfo.Cube.DimensionMap.Items[i].DisplayName;

        vConsultaGeral.FieldByName('COD_EMPRESA').AsString := cod_empresa;
  //    vGridCube.GridInfo.Cube.DimensionMap.Items[0].Index
  //    DimensionMap.Items[DimID].DimGroup:=DimGroup;
        if vGridCube.GridInfo.Cube.DimensionMap.Items[i].DimGroup = dgRow then
          vConsultaGeral.FieldByName('TIPO_POS').AsString := 'ROW';
        if vGridCube.GridInfo.Cube.DimensionMap.Items[i].DimGroup = dgCol then
          vConsultaGeral.FieldByName('TIPO_POS').AsString := 'COL';
        if vGridCube.GridInfo.Cube.DimensionMap.Items[i].DimGroup = dgPage then
          vConsultaGeral.FieldByName('TIPO_POS').AsString := 'PAGE';
        vConsultaGeral.FieldByName('COD_USUARIO').AsInteger := vcodusuario;
        if vsvcons = 1 then
          vConsultaGeral.FieldByName('TIPO_CAMPO').AsString := VconsultaUs.FieldByName('TIPO_CAMPO').AsString
        else
          vConsultaGeral.FieldByName('TIPO_CAMPO').AsString := Buscas.FieldByName('TIPO_CAMPO').AsString;
        vConsultaGeral.Post;
        vConsultaGeral.ApplyUpdates(-1);
      end;
    end;
  end;
  vConsultaGeral.First;
  vitcons := 0;
  while not vConsultaGeral.eof do
  begin
    if vsvcons = 1 then
    begin
      VconsultaUs.Locate('NOME_CAMPO', vConsultaGeral.FieldByName('NOME_CAMPO').AsString, []);
      vitcons := VconsultaUs.FieldByName('SEQINT').AsInteger;
    end
    else
    begin
      buscas.close;
      buscas.SQL.Text := 'select NOME_CAMPO,seqint from fieldsolap where cod_consulta = ' + inttostr(vcodconsulta) + ' and cod_empresa = ' + cod_empresa + ' and nome_campo = ''' + vConsultaGeral.FieldByName('NOME_CAMPO').AsString + '''';
      Buscas.Open;
      vitcons := Buscas.FieldByName('SEQINT').AsInteger
    end;

    if vConsultaGeral.FieldByName('TIPO_POS').AsString = 'ROW' then
    begin
      if vConsultaGeral.FieldByName('TIPO_CAMPO').AsString = 'S' then
      begin
        vConsultaGeral.Edit;
        vConsultaGeral.FieldByName('SEQINT').AsInteger := vitcons;
        vConsultaGeral.Post;
        vConsultaGeral.ApplyUpdates(-1);
      end
      else
      begin
        for ix := 0 to vGridCube.GridInfo.RowDimIDs.Count do
        begin
          if vGridCube.GridInfo.RowDimIDs.Items[ix] = vitcons then
          begin
            vConsultaGeral.Edit;
            vConsultaGeral.FieldByName('SEQINT').AsInteger := ix;
            vConsultaGeral.Post;
            vConsultaGeral.ApplyUpdates(-1);
            if vitcons = 0 then
              break;
          end;
        end;
      end;
    end
    else
    begin
      if vConsultaGeral.FieldByName('TIPO_POS').AsString = 'COL' then
      begin
        for ix := 0 to vGridCube.GridInfo.ColDimIDs.Count do
        begin
          eu := vGridCube.GridInfo.ColDimIDs.ClassName;
          if vGridCube.GridInfo.ColDimIDs.Items[ix] = vitcons then
          begin
            vConsultaGeral.Edit;
            vConsultaGeral.FieldByName('SEQINT').AsInteger := ix;
            vConsultaGeral.Post;
            vConsultaGeral.ApplyUpdates(-1);
            if vitcons = 0 then
              break;
          end;
        end;
      end
      else if vConsultaGeral.FieldByName('TIPO_POS').AsString = 'PAGE' then
      begin
        for ix := 0 to vGridCube.GridInfo.PageDimIDs.Count do
        begin

//        vflag:=vGridCube.GridInfo.PageDimIDs.Items[ix];
//        if vGridCube.GridInfo.PageDimIDs.Items[ix] = vitcons then
//        begin
          vConsultaGeral.Edit;
          vConsultaGeral.FieldByName('SEQINT').AsInteger := vitcons;
          vConsultaGeral.Post;
          vConsultaGeral.ApplyUpdates(-1);
//        end;
        end;
      end;
    end;
    vConsultaGeral.next;
  end;
  vConsultaGeral.close;
  vConsultaGeral.CommandText := 'select * from FIELDS_POSOLAP where cod_consulta = ' + inttostr(vcodconsulta) + ' and cod_empresa = ' + cod_empresa + ' and cod_usuario = ' + IntToStr(vcodusuario) + ' order by tipo_campo,tipo_pos,seqint';
  vConsultaGeral.Open;
  ix := 0;
  while not vConsultaGeral.eof do
  begin
    vConsultaGeral.Edit;
    vConsultaGeral.FieldByName('SEQINT').AsInteger := ix;
    vConsultaGeral.Post;
    vConsultaGeral.ApplyUpdates(-1);
    vConsultaGeral.next;
    ix := ix + 1;
  end;
  DtmConsGeral.IbTransConsGeral.Commit;
  Application.MessageBox(pchar('Posições de Dimensões Gravadas com Sucesso'), Pchar('Aviso'), MB_OK);
end;

function TRelConsGeral.montapesquisa(vFerCube: THierCube;
  vGridCube: THierCubeGrid; vnomecons, vempresasd: string; Vform: Tform;
  vtipo: integer; AConsultaSalva: TConsultasSalvas; ASetActive: Boolean): boolean;
var
  i, j: integer;
  ic: integer;
  T: TComponent;
  vdggeral: TDimGroup;
  vteste: TdimSum;
  v: integer;
  AFieldExists: Boolean;
begin
  if not Assigned(AConsultaSalva) then
  begin
    Result := montapesquisa(vFerCube, vGridCube, vnomecons, vempresasd, Vform, vtipo);
    Exit;
  end;

  Result := true;
  vConsultaGeral.close;
  if AConsultaSalva.SQLText <> '' then
    vConsultaGeral.CommandText := AConsultaSalva.SQLText
  else
  vConsultaGeral.CommandText := vstr;
  if Assigned(AConsultaSalva.Params) then//quando definido a lista de parametros no objeto usar os parametros
  begin
    if AConsultaSalva.Params.Count > 0 then
      for I := 0 to AConsultaSalva.Params.Count - 1 do
        if vConsultaGeral.Params.FindParam(AConsultaSalva.Params.Items[I].codigo) <> nil then
          vConsultaGeral.Params.ParamByName(AConsultaSalva.Params.Items[I].codigo).Value := AConsultaSalva.Params.Items[I].value;
  end
  else if vtipo = 0 then
  begin
    for i := Low(vpar) to High(vpar) do
      if vpar[i] <> '' then
      begin
        T := Vform.FindComponent(vpar[i]);
        if Assigned(T) then
          if (T is Tcombobox) then
            vConsultaGeral.Params.ParamByName(t.Name).AsString := TCombobox(T).Text
          else if (T is Tmaskedit) then
            if (TMaskEdit(T).editmask = '!99/99/0000;1;_') then
              vConsultaGeral.Params.ParamByName(t.Name).AsDate := StrToDate(TMaskEdit(T).Text)
            else
              vConsultaGeral.Params.ParamByName(t.Name).AsString := TMaskEdit(T).Text;
      end;
  end
  else
  for i := Low(vpar) to High(vpar) do
  begin
    if vtipo = 0 then
    begin
      for Ic := Vform.ComponentCount - 1 downto 0 do
      begin
        T := Vform.Components[Ic];
        if vpar[i] <> '' then
        begin
          if vpar[i] = T.name then
          begin
            if (T is Tcombobox) then
              vConsultaGeral.Params.ParamByName(t.Name).AsString := TCombobox(T).Text
            else if (T is Tmaskedit) then
              if (TMaskEdit(T).editmask = '!99/99/0000;1;_') then
                vConsultaGeral.Params.ParamByName(t.Name).AsDate := StrToDate(TMaskEdit(T).Text)
              else
                vConsultaGeral.Params.ParamByName(t.Name).AsString := TMaskEdit(T).Text;
          end;
        end;
      end;

    end
    else
    begin
      for ic := 0 to 4 do
      begin
        if vpar[i] <> '' then
          if vparametrosext[ic, 0] = vpar[i] then
            if (vparametrosext[ic, 2] = '!99/99/0000;1;_') then
              vConsultaGeral.Params.ParamByName(vparametrosext[ic, 0]).Value := StrToDate(vparametrosext[ic, 1])
            else
              vConsultaGeral.Params.ParamByName(vparametrosext[ic, 0]).Value := vparametrosext[ic, 1];
      end;
    end;
  end;
  vConsultaGeral.Open;

  //deixando fields que nao foram informados na tabela fieldsolap para ficar na page
  for J := 0 to vConsultaGeral.Fields.Count - 1 do
  begin
    AFieldExists := False;
    for I := 0 to AConsultaSalva.Campos.Count - 1 do
      if UpperCase(AConsultaSalva.Campos.Items[I].nome_campo) = UpperCase(vConsultaGeral.Fields[J].FieldName) then
      begin
        AFieldExists := True;
        Break;
      end;
    if not AFieldExists then
      if (vConsultaGeral.Fields[J] is TDateTimeField) or
        (vConsultaGeral.Fields[J] is TDateField) or
        (vConsultaGeral.Fields[J] is TTimeField) then
        AFieldExists := True;

    if not AFieldExists then
    begin
      //poderia adicionar os campos que nao foram definidos na tabela fieldsolap, se for usar para salvar e apresentar deverá fazer um teste ao selecionar as consultas salvas e configurar 
//      with AConsultaSalva.Campos.New do
//      begin
//        nome_campo        := vConsultaGeral.Fields[J].FieldName;
//        nome_apresentacao := nome_campo;
//        tipo_campo        := IfThen(vConsultaGeral.Fields[J] is TFloatField, 'S', 'F');
//        tipo_pos          := IfThen(tipo_campo = 'F', 'PAGE');
//      end;
    end;
  end;

  //excluindo campos q não existem no select
  for I := AConsultaSalva.Campos.Count - 1 downto 0  do
    if AConsultaSalva.Campos.Items[I].tipo_campo <> 'M' then
    begin
      AFieldExists := False;
      for J := 0 to vConsultaGeral.Fields.Count - 1 do
        if UpperCase(AConsultaSalva.Campos.Items[I].nome_campo) = UpperCase(vConsultaGeral.Fields[J].FieldName) then
          begin
            AFieldExists := True;
            Break;
          end;
      if not AFieldExists then
        AConsultaSalva.Campos.Delete(I);
    end;

  vFerCube.Active := false;
  vFerCube.DataSet := vConsultaGeral;
  vFerCube.BuildDimensionMap;

  //definindo dimensoes
  for I := 0 to AConsultaSalva.Campos.Count - 1 do
    with AConsultaSalva.Campos.Items[I] do
      if tipo_campo = 'F' then
      begin
        if tipo_pos = 'ROW' then
          vdggeral := dgRow
        else if tipo_pos = 'COL' then
          vdggeral := dgCol
        else
          vdggeral := dgPage;
        vFerCube.DefineFieldAsDimension(nome_campo, nome_apresentacao, vdggeral);
      end;

  //definindo sumarios
  for I := 0 to AConsultaSalva.Campos.Count - 1 do
    with AConsultaSalva.Campos.Items[I] do
      if tipo_campo = 'S' then
        vFerCube.DefineFieldAsSummary(nome_campo)
      else if (tipo_campo = 'M') and (formula_campo <> '') then
        vGridCube.SummarySettings.AddSummary(nome_campo, formula_campo);

  vfercube.Active := ASetActive;


  {
  //definindo sumarios
  for I := 0 to AConsultaSalva.Campos.Count - 1 do
    with AConsultaSalva.Campos.Items[I] do
      if tipo_campo = 'S' then
        vFerCube.DefineFieldAsSummary(nome_campo);

  vfercube.Active := True;

  //definindo as formulas
  for I := 0 to AConsultaSalva.Campos.Count - 1 do
    with AConsultaSalva.Campos.Items[I] do
      if (tipo_campo = 'M') and (formula_campo <> '') then
        vGridCube.SummarySettings.AddSummary(nome_campo, formula_campo);
  }
  
  for I := 0 to AConsultaSalva.Campos.Count - 1 do
    with AConsultaSalva.Campos.Items[I] do
      //if ((tipo_campo = 'S') or (tipo_campo = 'M')) and (formatstring <> '') then
      if (tipo_campo = 'S') or (tipo_campo = 'M') then
        for j := 0 to vGridCube.SummarySettings.Count - 1 do
          //if vGridCube.SummarySettings.Items[j].DisplayName = uppercase(nome_campo) then
          if UpperCase(vGridCube.SummarySettings.Items[j].FieldName) = uppercase(nome_campo) then
          begin
            if formatstring <> '' then
              vGridCube.SummarySettings.Items[j].FunctionSum.SubFunctions[0].FormatString := formatstring;
            vGridCube.SummarySettings.Items[j].DisplayName                                := nome_apresentacao;
            vGridCube.SummarySettings.Items[j].FieldName                                  := nome_campo;
          end;
end;

{ TConsultasSalvasFieldsList }

function TConsultasSalvasFieldsList.GetItem(
  Index: integer): TConsultasSalvasFields;
begin
	Result := TConsultasSalvasFields(inherited Items[Index]);
end;

function TConsultasSalvasFieldsList.New: TConsultasSalvasFields;
begin
	Result := TConsultasSalvasFields.create;
  Add(Result);
end;

function TConsultasSalvasFieldsList.NewCopy(
  AIndex: Integer): TConsultasSalvasFields;
begin
  Result := Items[AIndex].NewCopy;
//  Result := TConsultasSalvasFields.Create;
//
//
//  Result.nome_campo        := Items[AIndex].nome_campo;
//  Result.nome_apresentacao := Items[AIndex].nome_apresentacao;
//  Result.formula_campo     := Items[AIndex].formula_campo;
//  Result.formatstring      := Items[AIndex].formatstring;
//  Result.tipo_pos          := Items[AIndex].tipo_pos;
//  Result.seqint            := Items[AIndex].seqint;
//  Result.tipo_campo        := Items[AIndex].tipo_campo;
//  Result.isnumeric         := Items[AIndex].isnumeric;
end;

procedure TConsultasSalvasFieldsList.SetItem(Index: integer;
  const Value: TConsultasSalvasFields);
begin
	Put(Index, Value);
end;

{ TConsultasSalvas }

constructor TConsultasSalvas.Create;
begin
  FCampos := TConsultasSalvasFieldsList.Create;
end;

destructor TConsultasSalvas.Destroy;
begin
  if Assigned(FCampos) then
    FreeAndNil(FCampos);
  inherited;
end;

function TConsultasSalvas.NewCopy: TConsultasSalvas;
var
  I: Integer;
begin
  Result := TConsultasSalvas.Create;
  Result.cod_consulta := Self.cod_consulta;
  Result.nome_salvo   := Self.nome_salvo;
  Result.cod_usuario  := Self.cod_usuario;
  Result.SQLText      := Self.SQLText;
  Result.tipoconsulta := Self.tipoconsulta;
  for I := 0 to Self.Campos.Count - 1 do
    Result.Campos.Add(Self.Campos.NewCopy(I));
end;

{ TConsultasSalvasList }

function TConsultasSalvasList.GetItem(Index: integer): TConsultasSalvas;
begin
	Result := TConsultasSalvas(inherited Items[Index]);
end;

function TConsultasSalvasList.New: TConsultasSalvas;
begin
	Result := TConsultasSalvas.create;
  Add(Result);
end;

function TConsultasSalvasList.NewCopy(AIndex: Integer): TConsultasSalvas;
var
  I: Integer;
begin
  Result := TConsultasSalvas.Create;
  Result.cod_consulta := Items[AIndex].cod_consulta;
  Result.nome_salvo   := Items[AIndex].nome_salvo;
  Result.cod_usuario  := Items[AIndex].cod_usuario;
  for I := 0 to Items[AIndex].Campos.Count - 1 do
    Result.Campos.Add(Items[AIndex].Campos.NewCopy(I));
end;

procedure TConsultasSalvasList.SetItem(Index: integer;
  const Value: TConsultasSalvas);
begin
	Put(Index, Value);
end;

{ TParametros }

constructor TParametros.Create();
begin
  Fconteudo := TStringList.Create;
  Fnovo := False;
end;

destructor TParametros.Destroy;
begin
  if Assigned(Fconteudo) then
    FreeAndNil(Fconteudo);
  inherited;
end;

function TParametros.NewCopy: TParametros;
begin
  Result := TParametros.Create;

  Result.codigo        := Self.codigo;
  Result.tipo          := Self.tipo;
  Result.conteudo.Text := Self.conteudo.Text;
  Result.display       := Self.display;
  Result.value         := Self.value;
  Result.novo          := Self.novo;
end;

{ TParametrosList }

function TParametrosList.GetItem(Index: integer): TParametros;
begin
	Result := TParametros(inherited Items[Index]);
end;

function TParametrosList.New: TParametros;
begin
	Result := TParametros.create;
  Add(Result);
end;

//function TParametrosList.NewCopy(AIndex: Integer): TParametros;
//begin
//  Result := TParametros.Create;
//
//  Result.codigo   := Items[AIndex].codigo;
//  Result.tipo     := Items[AIndex].tipo;
//  Result.conteudo := Items[AIndex].conteudo;
//  Result.display  := Items[AIndex].display;
//  Result.value    := Items[AIndex].value;
//end;

procedure TParametrosList.SetItem(Index: integer; const Value: TParametros);
begin
	Put(Index, Value);
end;

{ TConsultasBuild }

constructor TConsultasBuild.Create(AOwner: TRelConsGeral);
begin
  if not Assigned(AOwner) then
    raise Exception.Create('Owner não definido');

  FOwner := AOwner;
  FConsulta := TConsultasSalvas.Create;
  FConsulta.nome_salvo := 'TITULO DA CONSULTA';
  FConsulta.tipoconsulta := '';
  FParametrosDB := TParametrosList.Create;
  FParametrosConsulta := TParametrosList.Create;
  FDimensions := TConsultasSalvasFieldsList.Create;
  FSummarys := TConsultasSalvasFieldsList.Create;
  FFormulas := TConsultasSalvasFieldsList.Create;
end;


destructor TConsultasBuild.Destroy;
begin
  if Assigned(FParametrosDB) then
    FreeAndNil(FParametrosDB);
    
  if Assigned(FConsulta) then
    FreeAndNil(FConsulta);

  if Assigned(FParametrosConsulta) then
    FreeAndNil(FParametrosConsulta);

  if Assigned(FDimensions) then
    FreeAndNil(FDimensions);

  if Assigned(FSummarys) then
    FreeAndNil(FSummarys);

  if Assigned(FFormulas) then
    FreeAndNil(FFormulas);
  inherited;
end;

function TConsultasBuild.GetGrupoConsulta: TStrings;
begin
  Result := TStringList.Create;
           
  with FOwner do
  begin
    if SqlOpen('select distinct tipoconsulta from SQLCONSULTASDIV order by 1').IsEmpty then
      Exit;

    while not Buscas.Eof do
    begin
      Result.Add(Buscas.FieldByName('tipoconsulta').AsString);
      Buscas.Next;
    end;
  end;
end;

function TConsultasBuild.GetSQLInsert(ACodConsulta: Integer; 
  ACamposSite: Boolean): TStrings;
var
  ASql: TStrings;
  ASqlFDB, AVal: string;
  I, J: Integer;
begin
  try
    for I := 0 to FParametrosConsulta.Count - 1 do
      if FParametrosConsulta.Items[I].novo then
        if FParametrosConsulta.Items[I].display = '?' then
          raise Exception.Create('Novo parametro ' + FParametrosConsulta.Items[I].codigo + ' sem display')
        else if FParametrosConsulta.Items[I].tipo = '?' then
          raise Exception.Create('Novo parametro ' + FParametrosConsulta.Items[I].codigo + ' sem tipo')
        else if FParametrosConsulta.Items[I].tipo = 'STRING' then
          if FParametrosConsulta.Items[I].conteudo.Count = 0 then
            raise Exception.Create('Novo parametro ' + FParametrosConsulta.Items[I].codigo + ' do tipo STRING e está sem conteúdo');
  except on E: Exception do
    begin
      Application.MessageBox(PChar(e.Message), 'Atenção', MB_ICONEXCLAMATION);
      Exit;
    end;
  end;

  Result := TStringList.Create;
  if ACamposSite then
    ACamposSite := ACodConsulta <= 9999;  

  ASql := TStringList.Create;
  try
    ASqlFDB := '';
    ASql.Text := FSQLText;
    for I := 0 to ASql.Count - 1 do
      ASqlFDB := ASqlFDB + IfThen(I > 0, '||ascii_char(13)||') + QuotedStr(ASql[I]);
    
    Result.Clear;
    Result.Add('INSERT INTO SQLCONSULTASDIV (COD_CONSULTA, COD_EMPRESA, TIPOCONSULTA, DESCRICAOCONS, ATIVO, ' + IfThen(ACamposSite, 'SITE, CODSISTEMAS,') + ' CONSULTASQL)');
    Result.Add(' VALUES(' + IntToStr(ACodConsulta) + ', ' +
               FOwner.cod_empresa + ', ' +
               QuotedStr(FConsulta.tipoconsulta) + ', ' +
               QuotedStr(FConsulta.nome_salvo) + ', ' + '1 , ' + IfThen(ACamposSite, QuotedStr('S') + ', 1, ') +
               ASqlFDB + ');');
    Result.Add('');
    for I := 0 to FConsulta.Campos.Count - 1 do
    begin
      Result.Add('INSERT INTO FIELDSOLAP (COD_CONSULTA, NOME_CAMPO, SEQINT, COD_EMPRESA, TIPO_CAMPO, TIPO_POS, FORMATSTRING, ATIVO, NOME_APRESENTACAO, ' + IfThen(ACamposSite, 'SITE, CODSISTEMAS,') + ' FORMULA_CAMPO)');
      Result.Add(' VALUES(' + IntToStr(ACodConsulta) + ', ' +
                 QuotedStr(FConsulta.Campos.Items[I].nome_campo) + ', ' +
                 IntToStr(I) + ', ' +
                 FOwner.cod_empresa + ', ' +
                 QuotedStr(FConsulta.Campos.Items[I].tipo_campo) + ', ' +
                 QuotedStr(FConsulta.Campos.Items[I].tipo_pos) + ', ' +
                 QuotedStr(FConsulta.Campos.Items[I].formatstring) + ', 1, ' +
                 QuotedStr(FConsulta.Campos.Items[I].nome_apresentacao) + ', ' + IfThen(ACamposSite, QuotedStr('S') + ', 1, ') +
                 QuotedStr(FConsulta.Campos.Items[I].formula_campo) + ');');
      Result.Add('');
    end;

    for I := 0 to ParametrosConsulta.Count - 1 do
      if ParametrosConsulta.Items[I].novo then
        for J := 0 to IfThen(UpperCase(ParametrosConsulta.Items[I].tipo) = 'DATE', 1, ParametrosConsulta.Items[I].conteudo.Count) - 1 do
        begin
          if UpperCase(ParametrosConsulta.Items[I].tipo) = 'DATE' then
            AVal := 'DATA'
          else
            AVal := ParametrosConsulta.Items[I].conteudo[J];
          Result.Add('INSERT INTO PARAMETROS_SQL (COD_PARAMETRO, TIPO_PARAMETRO, CONTEUDO_PARAMETRO, DISPLAY_PARAMETRO)');
          Result.Add(' VALUES(' + QuotedStr(UpperCase(ParametrosConsulta.Items[I].codigo)) + ', ' +
                     QuotedStr(UpperCase(ParametrosConsulta.Items[I].tipo)) + ', ' +
                     QuotedStr(AVal) + ', ' +
                     QuotedStr(UpperCase(ParametrosConsulta.Items[I].tipo)) + ');');
          Result.Add('');
        end;

    Result.Add('COMMIT WORK;');
  finally
    FreeAndNil(ASql);
  end;
end;

procedure TConsultasBuild.Iniciar;
var
  I: Integer;
begin
  FSQLText := '';
  FParametrosDB.Clear;
  FParametrosConsulta.Clear;

  with FOwner do
  begin
    if SqlOpen('select distinct cod_parametro from parametros_sql').IsEmpty then
      Exit;

    while not Buscas.Eof do
    begin
      with FParametrosDB.New do
        codigo := Buscas.FieldByName('cod_parametro').AsString;
      Buscas.Next;
    end;

    for I := 0 to FParametrosDB.Count - 1 do
    begin
      SqlOpen('select * from parametros_sql where cod_parametro = ' + QuotedStr(FParametrosDB.Items[I].codigo));
      FParametrosDB.Items[I].tipo := Buscas.FieldByName('tipo_parametro').AsString;
      FParametrosDB.Items[I].display := Buscas.FieldByName('display_parametro').AsString;

      while not Buscas.Eof do
      begin
        FParametrosDB.Items[I].conteudo.Add(Buscas.FieldByName('conteudo_parametro').AsString);
        Buscas.Next;
      end;
    end;
  end;
  if Assigned(FOnChangeParametrosDB) then
    FOnChangeParametrosDB(FParametrosDB);

  if Assigned(FOnChangeParametrosConsulta) then
    FOnChangeParametrosConsulta(FParametrosConsulta);
end;

procedure TConsultasBuild.rebuidFieldsFromConsulta;
var
  I: Integer;
begin
  FDimensions.Clear;
  FSummarys.Clear;
  FFormulas.Clear;
  for I := 0 to FConsulta.Campos.Count - 1 do
  begin
    if FConsulta.Campos.Items[I].tipo_campo = 'F' then
      FDimensions.Add(FConsulta.Campos.Items[I].NewCopy)
    else if FConsulta.Campos.Items[I].tipo_campo = 'S' then
      FSummarys.Add(FConsulta.Campos.Items[I].NewCopy)
    else if FConsulta.Campos.Items[I].tipo_campo = 'M' then
      FFormulas.Add(FConsulta.Campos.Items[I].NewCopy);
  end;
                                        
  if Assigned(FOnChangeFieldsDimensions) then
    FOnChangeFieldsDimensions(FDimensions);

  if Assigned(FOnChangeFieldsSummarys) then
    FOnChangeFieldsSummarys(FSummarys);

  if Assigned(FOnChangeFieldsFormulas) then
    FOnChangeFieldsFormulas(FFormulas);
end;

function TConsultasBuild.SalvarConsultaNoBanco: Boolean;
var
  ASql: TStrings;
  I: Integer;
  ACamposInternos: Boolean;
begin   
  try
    if Trim(FConsulta.tipoconsulta) = '' then
      raise Exception.Create('Grupo da consulta não informado');
    if Trim(FConsulta.nome_salvo) = '' then
      raise Exception.Create('Título da consulta não informado');

    FConsulta.cod_consulta := 10000 + 
      FOwner.SqlOpen('select cod from incrementa_codigo(' + FOwner.cod_empresa + ', ' + QuotedStr('SQLCONSULTASDIV_')+ ')').FieldByName('cod').AsInteger;

    ACamposInternos :=
      not FOwner.SqlOpen('SELECT RDB$FIELD_NAME CAMPO FROM RDB$RELATION_FIELDS' +
                         ' WHERE RDB$FIELD_NAME = ''CODSISTEMAS'' AND RDB$RELATION_NAME = ''FIELDSOLAP''').IsEmpty;

    ASql := GetSQLInsert(FConsulta.cod_consulta, ACamposInternos);
    ASql.Delete(ASql.Count - 1); // ultima linha commit
    
    FOwner.Buscas.SQL.Clear;
    for I := 0 to ASql.Count - 1 do
    begin
      if Trim(ASql[I]) <> '' then
        FOwner.Buscas.SQL.Add(ASql[I])
      else if Trim(FOwner.Buscas.SQL.Text) <> '' then
      begin
        FOwner.SqlExec(FOwner.Buscas.SQL.Text);
        FOwner.Buscas.SQL.Clear;
      end;
    end;

    if Trim(FOwner.Buscas.SQL.Text) <> '' then
      FOwner.SqlExec(ASql.Text);

    if FOwner.Buscas.Transaction.InTransaction then
      FOwner.Buscas.Transaction.Commit;

    Result := True;

  except on E: Exception do
    begin
      Result := False;
      if FOwner.Buscas.Transaction.InTransaction then
        FOwner.Buscas.Transaction.Rollback;
      Application.MessageBox(PChar(e.Message), 'Atenção', 64);
    end;
  end;

end;

procedure TConsultasBuild.setFieldsToConsulta;
var
  I: Integer;
begin
  FConsulta.SQLText := SQLText;
  FConsulta.Campos.Clear;

  for I := 0 to FDimensions.Count - 1 do
  begin
    FDimensions.Items[I].tipo_campo := 'F';
    FConsulta.Campos.Add(FDimensions.Items[I].NewCopy);
  end;
  for I := 0 to FSummarys.Count - 1 do
  begin
    FSummarys.Items[I].tipo_campo := 'S';
    FConsulta.Campos.Add(FSummarys.Items[I].NewCopy);
  end;
  for I := 0 to FFormulas.Count - 1 do
  begin
    FFormulas.Items[I].tipo_campo := 'M';
    FConsulta.Campos.Add(FFormulas.Items[I].NewCopy);
  end;
  FConsulta.Params := FParametrosConsulta;
end;

procedure TConsultasBuild.verificarFields;
var
  I, J: Integer;
  AField: TConsultasSalvasFields;
  ARescueFields: TConsultasSalvasFieldsList;
begin
  ARescueFields := TConsultasSalvasFieldsList.Create;
  try
    for I := 0 to FDimensions.Count - 1 do
    begin
      FDimensions.Items[I].tipo_campo := 'F';
      ARescueFields.Add(FDimensions.Items[I].NewCopy);
    end;
    for I := 0 to FSummarys.Count - 1 do
    begin
      FSummarys.Items[I].tipo_campo := 'S';
      ARescueFields.Add(FSummarys.Items[I].NewCopy);
    end;
    for I := 0 to FFormulas.Count - 1 do
    begin
      FFormulas.Items[I].tipo_campo := 'M';
      ARescueFields.Add(FFormulas.Items[I].NewCopy);
    end;

    FDimensions.Clear;
    FSummarys.Clear;
    FFormulas.Clear;
    with FOwner do
    begin
      vConsultaGeral.Close;
      vConsultaGeral.CommandText := FSQLText;
      for I := 0 to FParametrosConsulta.Count - 1 do
        if vConsultaGeral.Params.FindParam(FParametrosConsulta.Items[I].codigo) <> nil then
          vConsultaGeral.Params.ParamByName(FParametrosConsulta.Items[I].codigo).Value := FParametrosConsulta.Items[I].value;
      vConsultaGeral.Open;

      for I := 0 to vConsultaGeral.Fields.Count - 1 do
        if not (vConsultaGeral.Fields[I] is TDateTimeField) then
        begin
          AField :=  nil;
          for J := ARescueFields.Count - 1 downto 0 do //aqui vai procurar o fields, pois ele ja pode ter sido configurador, displays, posicao, etc
            if vConsultaGeral.Fields[I].FieldName = ARescueFields.Items[J].nome_campo then
            begin
              if ARescueFields.Items[J].tipo_campo = 'M' then // se o campo é formula e agora esta no select entao não será recuperado
                ARescueFields.Delete(J)
              else
              begin
                AField := ARescueFields.Items[J].NewCopy;
                AField.isnumeric := (vConsultaGeral.Fields[I] is TNumericField);
                if not AField.isnumeric then//caso o campo nao seja numerico ele nuca pode ir pro summary
                  AField.tipo_campo := 'F';
              end;
              Break;
            end;

          if not Assigned(AField) then
          begin
            AField := TConsultasSalvasFields.Create;
            AField.nome_campo := vConsultaGeral.Fields[I].FieldName;
            AField.nome_apresentacao := AField.nome_campo;
            AField.tipo_pos := 'PAGE';
            AField.isnumeric := (vConsultaGeral.Fields[I] is TNumericField);
            AField.tipo_campo := IfThen( vConsultaGeral.Fields[I] is TFloatField, 'S', 'F');
          end;

          if AField.tipo_campo = 'S' then //summary
            FSummarys.Add(AField)
          else if AField.tipo_campo = 'F' then //fields dimensions
            FDimensions.Add(AField)
          else if AField.tipo_campo = 'M' then//M??? formulas
            FFormulas.Add(AField);
        end;

      for I := 0 to ARescueFields.Count - 1 do
        if ARescueFields.Items[I].tipo_campo = 'M' then
          FFormulas.Add(ARescueFields.Items[I].NewCopy);

      if Assigned(FOnChangeFieldsDimensions) then
        FOnChangeFieldsDimensions(FDimensions);

      if Assigned(FOnChangeFieldsSummarys) then
        FOnChangeFieldsSummarys(FSummarys);

      if Assigned(FOnChangeFieldsFormulas) then
        FOnChangeFieldsFormulas(FFormulas);

    end;
  finally
    FreeAndNil(ARescueFields);
  end;
end;

procedure TConsultasBuild.verificarParametros;
  var
  I, J: Integer;
  ASQLText: string;
  AParamName: string;
  AParamsRescue    : TParametrosList;
  AParamConsulta   : TParametros;
  AParamNew        : TParametros;
  AAddParamConsulta: Boolean;
  AAddParamNew     : Boolean;
  AChangeParamNew  : Boolean;
begin
  AParamsRescue := TParametrosList.Create;
  for I := 0 to FParametrosConsulta.Count - 1 do
    AParamsRescue.Add(FParametrosConsulta.Items[I].NewCopy);

  FParametrosConsulta.Clear;
  AChangeParamNew := True;
  ASQLText := UpperCase(FSQLText) + ';';
  ASQLText := StringReplace(ASQLText, #13, ' ', [rfReplaceAll]);
  ASQLText := StringReplace(ASQLText, #10, ' ', [rfReplaceAll]);

  while Pos(':', ASQLText) > 0 do
  begin
    ASQLText := Copy(ASQLText, Pos(':', ASQLText) + 1, Length(ASQLText));
    AParamName := '';
    if (Char(ASQLText[1]) in ['0'..'9', 'a'..'z', 'A'..'Z', '_', '.']) then//primeiro caracter deve ser valido
      for I := 1 to Length(ASQLText)  do
        if not (Char(ASQLText[i]) in ['0'..'9', 'a'..'z', 'A'..'Z', '_', '.']) then
          begin
            AAddParamConsulta := True;
            AParamConsulta    := nil;

            AParamName        := Trim(Copy(ASQLText, 1, I - 1));

            if Trim(AParamName) <> '' then
            begin

              for J := 0 to FParametrosConsulta.Count - 1 do
                if FParametrosConsulta.Items[J].codigo = AParamName then
                begin
                  AAddParamConsulta := False;
                  Break;
                end;

              if AAddParamConsulta then
                for J := 0 to AParamsRescue.Count - 1 do
                  if AParamsRescue.Items[J].codigo = AParamName then
                  begin
                    AParamConsulta    := AParamsRescue.Items[J].NewCopy;
                    AAddParamConsulta := False;
                    Break;
                  end;

              if AAddParamConsulta then
                for J := 0 to FParametrosDB.Count - 1 do
                  if FParametrosDB.Items[J].codigo = AParamName then
                  begin
                    AParamConsulta    := FParametrosDB.Items[J].NewCopy;
                    AAddParamConsulta := False;
                    Break;
                  end;

              if AAddParamConsulta then
              begin
                AParamConsulta := TParametros.Create;
                AParamConsulta.codigo  := AParamName;
                AParamConsulta.tipo    := '?';
                AParamConsulta.display := '?';
                AParamConsulta.novo    := True;
              end;

              if Assigned(AParamConsulta) then
                FParametrosConsulta.Add(AParamConsulta);
            end;
            Break;
          end;
  end;
  if Assigned(FOnChangeParametrosConsulta) then
    FOnChangeParametrosConsulta(FParametrosConsulta);
end;

{ TConsultasSalvasFields }

constructor TConsultasSalvasFields.create;
begin
  Fisnumeric := False;
end;

function TConsultasSalvasFields.NewCopy: TConsultasSalvasFields;
begin
  Result := TConsultasSalvasFields.Create;

  Result.nome_campo        := Self.nome_campo;
  Result.nome_apresentacao := Self.nome_apresentacao;
  Result.formula_campo     := Self.formula_campo;
  Result.formatstring      := Self.formatstring;
  Result.tipo_pos          := Self.tipo_pos;
  Result.seqint            := Self.seqint;
  Result.tipo_campo        := Self.tipo_campo;
  Result.isnumeric         := Self.isnumeric;
end;

end.

