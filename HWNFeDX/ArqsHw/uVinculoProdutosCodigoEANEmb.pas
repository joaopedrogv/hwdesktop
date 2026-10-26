unit uVinculoProdutosCodigoEANEmb;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ComCtrls, Vcl.ExtCtrls,
  Datasnap.DBClient, IBX.IBQuery;

type
  TfrmVinculoProdutosCodigoEANEmb = class(TForm)
    pnCodigoEANUnid: TPanel;
    PageControlCodigoEANUnid: TPageControl;
    TabSheet1: TTabSheet;
    Panel12: TPanel;
    BitBtnIncluirCodigoEAN: TBitBtn;
    BitBtnDeletarCodigoEAN: TBitBtn;
    gridCodigoEANUnid: TDBGrid;
    TabSheet2: TTabSheet;
    Panel13: TPanel;
    BitBtnSalvarCodigoEAN: TBitBtn;
    BitBtnCancelarCodigoEAN: TBitBtn;
    TabSheet3: TTabSheet;
    Panel14: TPanel;
    BitBtnSalvarEmbalagem: TBitBtn;
    BitBtnCancelarEmbalagem: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    Label308: TLabel;
    Label309: TLabel;
    DBEditQuantidadeEmbalagem: TDBEdit;
    DBEditUnidadePrinc2: TDBEdit;
    Label1: TLabel;
    DBEditEmbalagem: TDBEdit;
    Panel2: TPanel;
    Label225: TLabel;
    Label227: TLabel;
    Label226: TLabel;
    DBEditCodigoEAN: TDBEdit;
    DBEditUnidadeEmb: TDBEdit;
    DBEditQtdeEmb: TDBEdit;
    Label2: TLabel;
    DBEditUnidadePrinc: TDBEdit;
    btAlterarUnd2: TSpeedButton;
    btAlterarUnd: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtnIncluirCodigoEANClick(Sender: TObject);
    procedure BitBtnSalvarCodigoEANClick(Sender: TObject);
    procedure BitBtnCancelarCodigoEANClick(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtnDeletarCodigoEANClick(Sender: TObject);
    procedure BitBtnSalvarEmbalagemClick(Sender: TObject);
    procedure BitBtnCancelarEmbalagemClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure carregarDataSetTemp;
    procedure BitBtn1Click(Sender: TObject);
    procedure PageControlCodigoEANUnidChange(Sender: TObject);
    procedure DBEditUnidadePrincKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Panel1Enter(Sender: TObject);
    procedure btAlterarUnd2Click(Sender: TObject);
    procedure btAlterarUndClick(Sender: TObject);
  private
    { Private declarations }
    vtempdataset: TClientDataSet;
  public
    { Public declarations }
    vGrupoProd: Integer;
    vCodProd: string;
    vCodEmpresa: Integer;
    vbuscas: TIBQuery;
    vdataSet: TClientDataSet;
    vdataSetCodigoEANEmb: TClientDataSet;
  end;

var
  frmVinculoProdutosCodigoEANEmb: TfrmVinculoProdutosCodigoEANEmb;

implementation

{$R *.dfm}

procedure TfrmVinculoProdutosCodigoEANEmb.BitBtn1Click(Sender: TObject);
begin
  vdataSet.Cancel;
  vdataSetCodigoEANEmb.Cancel;
  Close;
end;

procedure TfrmVinculoProdutosCodigoEANEmb.BitBtn6Click(Sender: TObject);
begin
  vdataSet.Cancel;
  Close;
end;

procedure TfrmVinculoProdutosCodigoEANEmb.BitBtnCancelarCodigoEANClick(
  Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;

    vdataSet.Cancel;
    vdataSetCodigoEANEmb.Cancel;
    TabSheet1.Show;
    carregarDataSetTemp;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmVinculoProdutosCodigoEANEmb.BitBtnCancelarEmbalagemClick(
  Sender: TObject);
begin
  if (vdataSet.State in [dsInsert, dsEdit]) then
    vdataSet.Cancel;
  Close;
end;

procedure TfrmVinculoProdutosCodigoEANEmb.BitBtnDeletarCodigoEANClick(
  Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;

    if gridCodigoEANUnid.DataSource.DataSet.IsEmpty then
      Exit;

    if Application.MessageBox('Tem certeza que deseja excluir registro?',
      'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> IDYES then
      Exit;

    if (vGrupoProd > 0) and (trim(vCodProd) <> '') then
    begin
      vbuscas.Close;
      vbuscas.SQL.Text := ' DELETE FROM PRODUTOS_CONVERSAO ' +
        ' WHERE GRUPO_PROD = :GRUPO_PROD ' +
        ' AND COD_PROD = :COD_PROD ' +
        ' AND COD_EMPRESA = :COD_EMPRESA ' +
        ' AND CODIGO_EAN = :CODIGO_EAN ';
      vbuscas.ParamByName('GRUPO_PROD').AsInteger := vGrupoProd;
      vbuscas.ParamByName('COD_PROD').AsString := vCodProd;
      vbuscas.ParamByName('COD_EMPRESA').AsInteger := vCodEmpresa;
      vbuscas.ParamByName('CODIGO_EAN').AsString := trim(vdataSetCodigoEANEmb.FieldByName('codigo_ean').AsString);
      vbuscas.ExecSQL;

      if vbuscas.Transaction.InTransaction then
        vbuscas.Transaction.Commit;
    end;

    vdataSetCodigoEANEmb.Delete;

    carregarDataSetTemp;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmVinculoProdutosCodigoEANEmb.BitBtnIncluirCodigoEANClick(
  Sender: TObject);
begin
  try
    vtempdataset.Filtered := false;
    vtempdataset.Filter := 'nitem = ' + IntToStr(vdataSet.FieldByName('nitem').AsInteger) +
      ' and codigo_ean = ' + QuotedStr(trim(vdataSet.FieldByName('cean').AsString));
    vtempdataset.Filtered := true;

    if not vtempdataset.IsEmpty then
    begin
      Application.MessageBox(PChar('Código EAN já definido: ' + trim(vdataSet.FieldByName('cean').AsString)), 'Atenção',  MB_ICONWARNING + MB_OK);
      exit;
    end;
  finally
    vtempdataset.Filtered := false;
  end;

  if not (vdataSet.State in [dsEdit, dsInsert]) then
    vdataSet.Edit;

  if not (vdataSetCodigoEANEmb.State in [dsEdit, dsInsert]) then
    vdataSetCodigoEANEmb.Insert;

  vdataSetCodigoEANEmb.FieldByName('nitem').AsInteger       := vdataSet.FieldByName('nitem').AsInteger;
  if (vGrupoProd > 0) and (trim(vCodProd) <> '') then
  begin
    vdataSetCodigoEANEmb.FieldByName('grupo_prod').AsInteger := vdataSet.FieldByName('grupo_prod').AsInteger;
    vdataSetCodigoEANEmb.FieldByName('cod_prod').AsString := vdataSet.FieldByName('cod_prod').AsString;
  end;
  vdataSetCodigoEANEmb.FieldByName('cod_empresa').AsInteger := vdataSet.FieldByName('cod_empresa').AsInteger;
  vdataSetCodigoEANEmb.FieldByName('codigo_ean').AsString   := UpperCase(trim(vdataSet.FieldByName('cean').AsString));
  vdataSetCodigoEANEmb.FieldByName('unidade').AsString      := UpperCase(trim(vdataSet.FieldByName('unidade').AsString));

  TabSheet2.Show;

  if DBEditUnidadePrinc.CanFocus then
    DBEditUnidadePrinc.SetFocus
  else if DBEditCodigoEAN.CanFocus then
    DBEditCodigoEAN.SetFocus
  else if DBEditUnidadeEmb.CanFocus then
    DBEditUnidadeEmb.SetFocus
  else if DBEditQtdeEmb.CanFocus then
    DBEditQtdeEmb.SetFocus;
end;

procedure TfrmVinculoProdutosCodigoEANEmb.BitBtnSalvarCodigoEANClick(
  Sender: TObject);
var
  I: Integer;
  vListaEmp: TStringList;
  vReplicacaoInterna: boolean;
begin
  if trim(vdataSet.FieldByName('UNIDADE_PRINC').AsString) = '' then
  begin
    Application.MessageBox(PChar('Unidade principal de venda não informada'), 'Atenção',  MB_ICONWARNING + MB_OK);
    if DBEditUnidadePrinc.CanFocus then
      DBEditUnidadePrinc.SetFocus;
    exit;
  end;

  if trim(vdataSetCodigoEANEmb.FieldByName('CODIGO_EAN').AsString) = '' then
  begin
    Application.MessageBox(PChar('Código EAN não informado'), 'Atenção',  MB_ICONWARNING + MB_OK);
    if DBEditCodigoEAN.CanFocus then
      DBEditCodigoEAN.SetFocus;
    exit;
  end;

  if trim(vdataSetCodigoEANEmb.FieldByName('UNIDADE').AsString) = '' then
  begin
    Application.MessageBox(PChar('Unidade da embalagem não informada'), 'Atenção',  MB_ICONWARNING + MB_OK);
    if DBEditUnidadeEmb.CanFocus then
      DBEditUnidadeEmb.SetFocus;
    exit;
  end;

  if vdataSetCodigoEANEmb.FieldByName('QUANTIDADE').AsFloat <= 0 then
  begin
    Application.MessageBox(PChar('Quantidade da embalagem não informada'), 'Atenção',  MB_ICONWARNING + MB_OK);
    if DBEditQtdeEmb.CanFocus then
      DBEditQtdeEmb.SetFocus;
    exit;
  end;

  try
    Screen.Cursor := crHourGlass;
    try
      vtempdataset.Filtered := false;
      vtempdataset.Filter := 'nitem = ' + IntToStr(vdataSetCodigoEANEmb.FieldByName('nitem').AsInteger) +
        ' and codigo_ean = ' + QuotedStr(trim(vdataSetCodigoEANEmb.FieldByName('codigo_ean').AsString));
      vtempdataset.Filtered := true;

      if not vtempdataset.IsEmpty then
      begin
        Application.MessageBox(PChar(
          'Código EAN já definido para este produto: ' + #13 + #13 + trim(vdataSetCodigoEANEmb.FieldByName('codigo_ean').AsString)),
          'Atenção', MB_ICONWARNING + MB_OK);
        if DBEditCodigoEAN.CanFocus then
          DBEditCodigoEAN.SetFocus;
        exit;
      end;
    finally
      vtempdataset.Filtered := false;
    end;

    vdataSet.Post;
    vdataSetCodigoEANEmb.Post;

    if (vGrupoProd > 0) and (trim(vCodProd) <> '') then
    begin
      vbuscas.Close;
      vbuscas.SQL.Text := ' select * from TAB_REP where TABELA = ''PRODUTOS'' ';
      vbuscas.open;
      vReplicacaoInterna := not vbuscas.IsEmpty;

      vListaEmp := TStringList.Create;
      vListaEmp.Duplicates := dupIgnore;
      vListaEmp.Clear;

      vListaEmp.Add(IntToStr(vCodEmpresa));
      if vReplicacaoInterna then
      begin
        vbuscas.close;
        vbuscas.sql.Text := ' select cod_empresa, ' +
         ' coalesce(emp_repl_interna, ' + IntToStr(vCodEmpresa) + ') emp_repl_interna from EMPRESA ' +
         ' where ativo = 1 and cod_empresa <> ' + IntToStr(vCodEmpresa);
        vbuscas.Open;
        vbuscas.FetchAll;

        vbuscas.First;
        while not vbuscas.Eof do
        begin
          if vbuscas.FieldByName('EMP_REPL_INTERNA').AsInteger = vCodEmpresa then
            vListaEmp.Add(IntToStr(vbuscas.FieldByName('COD_EMPRESA').AsInteger));

          vbuscas.Next;
        end;
      end;

      for I := 0 to vListaEmp.Count - 1 do
      begin
        vbuscas.Close;
        vbuscas.SQL.Text := ' UPDATE PRODUTOS SET ' +
          ' UNIDADE = :UNIDADE, REP_INT_ACTIVE = :REP_INT_ACTIVE ' +
          ' WHERE GRUPO_PROD = :GRUPO_PROD ' +
          ' AND COD_PROD = :COD_PROD ' +
          ' AND COD_EMPRESA = :COD_EMPRESA; ';
        vbuscas.ParamByName('GRUPO_PROD').AsInteger := vGrupoProd;
        vbuscas.ParamByName('COD_PROD').AsString := vCodProd;
        vbuscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vListaEmp[i]);
        vbuscas.ParamByName('UNIDADE').AsString := UpperCase(trim(vdataset.FieldByName('UNIDADE_PRINC').AsString));
        vbuscas.ParamByName('REP_INT_ACTIVE').AsInteger := 1;
        vbuscas.ExecSQL;
      end;

      vbuscas.Close;
      vbuscas.SQL.Text := ' UPDATE OR INSERT INTO PRODUTOS_CONVERSAO ' +
        ' (GRUPO_PROD, COD_PROD, COD_EMPRESA, CODIGO_EAN, UNIDADE, QUANTIDADE) ' +
        ' VALUES (:GRUPO_PROD, :COD_PROD, :COD_EMPRESA, :CODIGO_EAN, :UNIDADE, :QUANTIDADE) ' +
        ' MATCHING (GRUPO_PROD, COD_PROD, COD_EMPRESA, CODIGO_EAN); ';
      vbuscas.ParamByName('GRUPO_PROD').AsInteger := vGrupoProd;
      vbuscas.ParamByName('COD_PROD').AsString := vCodProd;
      vbuscas.ParamByName('COD_EMPRESA').AsInteger := vCodEmpresa;
      vbuscas.ParamByName('CODIGO_EAN').AsString := UpperCase(trim(vdataSetCodigoEANEmb.FieldByName('codigo_ean').AsString));
      vbuscas.ParamByName('UNIDADE').AsString := UpperCase(trim(vdataSetCodigoEANEmb.FieldByName('unidade').AsString));
      vbuscas.ParamByName('QUANTIDADE').AsFloat := vdataSetCodigoEANEmb.FieldByName('quantidade').AsFloat;
      vbuscas.ExecSQL;

      if vbuscas.Transaction.InTransaction then
        vbuscas.Transaction.Commit;
    end;

    TabSheet1.Show;
    carregarDataSetTemp;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmVinculoProdutosCodigoEANEmb.BitBtnSalvarEmbalagemClick(
  Sender: TObject);
var
  I: Integer;
  vListaEmp: TStringList;
  vReplicacaoInterna: boolean;
begin
  vReplicacaoInterna := false;
  if trim(vdataSet.FieldByName('UNIDADE_PRINC').AsString) = '' then
  begin
    Application.MessageBox(PChar('Unidade principal de venda não informada'), 'Atenção',  MB_ICONWARNING + MB_OK);
    if DBEditUnidadePrinc2.CanFocus then
      DBEditUnidadePrinc2.SetFocus;
    exit;
  end;

  try
    Screen.Cursor := crHourGlass;

    if (vGrupoProd > 0) and (trim(vCodProd) <> '') then
    begin
      vbuscas.Close;
      vbuscas.SQL.Text := ' select * from TAB_REP where TABELA = ''PRODUTOS'' ';
      vbuscas.open;
      vReplicacaoInterna := not vbuscas.IsEmpty;

      vListaEmp := TStringList.Create;
      vListaEmp.Duplicates := dupIgnore;
      vListaEmp.Clear;

      vListaEmp.Add(IntToStr(vCodEmpresa));
      if vReplicacaoInterna then
      begin
        vbuscas.close;
        vbuscas.sql.Text := ' select cod_empresa, ' +
         ' coalesce(emp_repl_interna, ' + IntToStr(vCodEmpresa) + ') emp_repl_interna from EMPRESA ' +
         ' where ativo = 1 and cod_empresa <> ' + IntToStr(vCodEmpresa);
        vbuscas.Open;
        vbuscas.FetchAll;

        vbuscas.First;
        while not vbuscas.Eof do
        begin
          if vbuscas.FieldByName('EMP_REPL_INTERNA').AsInteger = vCodEmpresa then
            vListaEmp.Add(IntToStr(vbuscas.FieldByName('COD_EMPRESA').AsInteger));

          vbuscas.Next;
        end;
      end;

      for I := 0 to vListaEmp.Count - 1 do
      begin
        vbuscas.Close;
        vbuscas.SQL.Text := ' UPDATE PRODUTOS SET ' +
          ' UNIDADE = :UNIDADE, EMB_PROD = :EMB_PROD, QTDEMB = :QTDEMB, REP_INT_ACTIVE = :REP_INT_ACTIVE ' +
          ' WHERE GRUPO_PROD = :GRUPO_PROD ' +
          ' AND COD_PROD = :COD_PROD ' +
          ' AND COD_EMPRESA = :COD_EMPRESA; ';
        vbuscas.ParamByName('GRUPO_PROD').AsInteger := vGrupoProd;
        vbuscas.ParamByName('COD_PROD').AsString := vCodProd;
        vbuscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vListaEmp[i]);
        vbuscas.ParamByName('UNIDADE').AsString := UpperCase(trim(vdataset.FieldByName('UNIDADE_PRINC').AsString));
        if trim(vdataset.FieldByName('EMB_PROD').AsString) <> '' then
          vbuscas.ParamByName('EMB_PROD').AsString := UpperCase(trim(vdataset.FieldByName('EMB_PROD').AsString));
        if vdataset.FieldByName('QTDEMB').AsInteger > 0 then
          vbuscas.ParamByName('QTDEMB').AsFloat := vdataset.FieldByName('QTDEMB').AsFloat;
        vbuscas.ParamByName('REP_INT_ACTIVE').AsInteger := 1;
        vbuscas.ExecSQL;

        if vbuscas.Transaction.InTransaction then
          vbuscas.Transaction.Commit;
      end;
    end;

    if (vdataSet.State in [dsInsert, dsEdit]) then
      vdataSet.Post;
    Close;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmVinculoProdutosCodigoEANEmb.btAlterarUndClick(Sender: TObject);
begin
  DBEditUnidadePrinc.Enabled := true;
  if DBEditUnidadePrinc.CanFocus then
    DBEditUnidadePrinc.SetFocus;
end;

procedure TfrmVinculoProdutosCodigoEANEmb.btAlterarUnd2Click(Sender: TObject);
begin
  DBEditUnidadePrinc2.Enabled := true;
  if DBEditUnidadePrinc2.CanFocus then
    DBEditUnidadePrinc2.SetFocus;
end;

procedure TfrmVinculoProdutosCodigoEANEmb.carregarDataSetTemp;
begin
  if (vGrupoProd > 0) and (trim(vCodProd) <> '') then
  begin
    if (vdataset.FieldByName('CEAN').AsString) = '' then
    begin
      vbuscas.Close;
      vbuscas.SQL.Text := ' SELECT PRODUTOS.GRUPO_PROD, ' +
        ' PRODUTOS.COD_PROD, ' +
        ' PRODUTOS.COD_EMPRESA, ' +
        ' PRODUTOS.UNIDADE, ' +
        ' PRODUTOS.EMB_PROD, ' +
        ' PRODUTOS.QTDEMB FROM PRODUTOS ' +
        ' WHERE PRODUTOS.GRUPO_PROD = :GRUPO_PROD ' +
        ' AND PRODUTOS.COD_PROD = :COD_PROD ' +
        ' AND PRODUTOS.COD_EMPRESA = :COD_EMPRESA ';
      vbuscas.ParamByName('GRUPO_PROD').AsInteger := vGrupoProd;
      vbuscas.ParamByName('COD_PROD').AsString := vCodProd;
      vbuscas.ParamByName('COD_EMPRESA').AsInteger := vCodEmpresa;
      vbuscas.Open;
      vbuscas.FetchAll;

      if not vbuscas.IsEmpty then
      begin
        if not (vdataSet.State in [dsInsert, dsEdit]) then
          vdataSet.Edit;

        vdataSet.FieldByName('UNIDADE_PRINC').AsString :=  vbuscas.FieldByName('UNIDADE').AsString;
        vdataSet.FieldByName('EMB_PROD').AsString :=  vbuscas.FieldByName('EMB_PROD').AsString;
        vdataSet.FieldByName('QTDEMB').AsFloat :=  vbuscas.FieldByName('QTDEMB').AsFloat;
      end;
    end
    else
    begin
      vdataSetCodigoEANEmb.EmptyDataSet;
      vtempdataset.EmptyDataSet;

      vbuscas.Close;
      vbuscas.SQL.Text := ' SELECT PRODUTOS.GRUPO_PROD, ' +
        ' PRODUTOS.COD_PROD, ' +
        ' PRODUTOS.COD_EMPRESA, ' +
        ' PRODUTOS.UNIDADE, ' +
        ' PRODUTOS.EMB_PROD, ' +
        ' PRODUTOS.QTDEMB FROM PRODUTOS ' +
        ' WHERE PRODUTOS.GRUPO_PROD = :GRUPO_PROD ' +
        ' AND PRODUTOS.COD_PROD = :COD_PROD ' +
        ' AND PRODUTOS.COD_EMPRESA = :COD_EMPRESA ';
      vbuscas.ParamByName('GRUPO_PROD').AsInteger := vGrupoProd;
      vbuscas.ParamByName('COD_PROD').AsString := vCodProd;
      vbuscas.ParamByName('COD_EMPRESA').AsInteger := vCodEmpresa;
      vbuscas.Open;
      vbuscas.FetchAll;

      if not vbuscas.IsEmpty then
      begin
        if not (vdataSet.State in [dsInsert, dsEdit]) then
          vdataSet.Edit;

        vdataSet.FieldByName('UNIDADE_PRINC').AsString :=  vbuscas.FieldByName('UNIDADE').AsString;
        vdataSet.FieldByName('EMB_PROD').AsString :=  vbuscas.FieldByName('EMB_PROD').AsString;
        vdataSet.FieldByName('QTDEMB').AsFloat :=  vbuscas.FieldByName('QTDEMB').AsFloat;
      end;

      vbuscas.Close;
      vbuscas.SQL.Text := ' SELECT PRODUTOS_CONVERSAO.GRUPO_PROD, ' +
        ' PRODUTOS_CONVERSAO.COD_PROD, ' +
        ' PRODUTOS_CONVERSAO.COD_EMPRESA, ' +
        ' PRODUTOS_CONVERSAO.CODIGO_EAN, ' +
        ' PRODUTOS_CONVERSAO.UNIDADE, ' +
        ' PRODUTOS_CONVERSAO.QUANTIDADE FROM PRODUTOS_CONVERSAO ' +
        ' WHERE PRODUTOS_CONVERSAO.GRUPO_PROD = :GRUPO_PROD ' +
        ' AND PRODUTOS_CONVERSAO.COD_PROD = :COD_PROD ' +
        ' AND PRODUTOS_CONVERSAO.COD_EMPRESA = :COD_EMPRESA ';
      vbuscas.ParamByName('GRUPO_PROD').AsInteger := vGrupoProd;
      vbuscas.ParamByName('COD_PROD').AsString := vCodProd;
      vbuscas.ParamByName('COD_EMPRESA').AsInteger := vCodEmpresa;
      vbuscas.Open;
      vbuscas.FetchAll;

      vbuscas.First;
      while not vbuscas.Eof do
      begin
        vtempdataset.Insert;
        vtempdataset.FieldByName('nitem').AsInteger := vbuscas.RecNo;
        vtempdataset.FieldByName('grupo_prod').AsInteger := vbuscas.FieldByName('grupo_prod').AsInteger;
        vtempdataset.FieldByName('cod_prod').AsString := trim(vbuscas.FieldByName('cod_prod').AsString);
        vtempdataset.FieldByName('cod_empresa').AsInteger := vbuscas.FieldByName('cod_empresa').AsInteger;
        vtempdataset.FieldByName('codigo_ean').AsString := UpperCase(trim(vbuscas.FieldByName('codigo_ean').AsString));
        vtempdataset.FieldByName('unidade').AsString := UpperCase(trim(vbuscas.FieldByName('unidade').AsString));
        vtempdataset.FieldByName('quantidade').AsFloat := vbuscas.FieldByName('quantidade').AsFloat;
        vtempdataset.Post;

        vdataSetCodigoEANEmb.Insert;
        vdataSetCodigoEANEmb.FieldByName('nitem').AsInteger       := vbuscas.RecNo;
        vdataSetCodigoEANEmb.FieldByName('grupo_prod').AsInteger := vbuscas.FieldByName('grupo_prod').AsInteger;
        vdataSetCodigoEANEmb.FieldByName('cod_prod').AsString := trim(vbuscas.FieldByName('cod_prod').AsString);
        vdataSetCodigoEANEmb.FieldByName('cod_empresa').AsInteger := vbuscas.FieldByName('cod_empresa').AsInteger;
        vdataSetCodigoEANEmb.FieldByName('codigo_ean').AsString   := UpperCase(trim(vbuscas.FieldByName('codigo_ean').AsString));
        vdataSetCodigoEANEmb.FieldByName('unidade').AsString      := UpperCase(trim(vbuscas.FieldByName('unidade').AsString));
        vdataSetCodigoEANEmb.FieldByName('quantidade').AsFloat    := vbuscas.FieldByName('quantidade').AsFloat;
        vdataSetCodigoEANEmb.Post;

        vbuscas.Next;
      end;

      vtempdataset.First;
      vdataSetCodigoEANEmb.First;
    end;
  end
  else
  begin
    vtempdataset.EmptyDataSet;
    vdataSetCodigoEANEmb.First;
    while not vdataSetCodigoEANEmb.Eof do
    begin
      vtempdataset.Insert;
      vtempdataset.FieldByName('nitem').AsInteger := vdataSetCodigoEANEmb.FieldByName('nitem').AsInteger;
      vtempdataset.FieldByName('cod_empresa').AsInteger := vdataSetCodigoEANEmb.FieldByName('cod_empresa').AsInteger;
      vtempdataset.FieldByName('codigo_ean').AsString := vdataSetCodigoEANEmb.FieldByName('codigo_ean').AsString;
      vtempdataset.FieldByName('unidade').AsString := vdataSetCodigoEANEmb.FieldByName('unidade').AsString;
      vtempdataset.FieldByName('quantidade').AsFloat := vdataSetCodigoEANEmb.FieldByName('quantidade').AsFloat;
      vtempdataset.Post;

      vdataSetCodigoEANEmb.Next;
    end;
    vtempdataset.First;
    vdataSetCodigoEANEmb.First;
  end;
end;

procedure TfrmVinculoProdutosCodigoEANEmb.DBEditUnidadePrincKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmVinculoProdutosCodigoEANEmb.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Assigned(vtempdataset) then
    FreeAndNil(vtempdataset);
end;

procedure TfrmVinculoProdutosCodigoEANEmb.FormCreate(Sender: TObject);
begin
  TabSheet1.TabVisible := false;
  TabSheet2.TabVisible := false;
  TabSheet3.TabVisible := false;
end;

procedure TfrmVinculoProdutosCodigoEANEmb.FormShow(Sender: TObject);
begin
  if not Assigned(vtempdataset) then
    vtempdataset := TClientDataSet.Create(Self);

  vtempdataset.FieldDefs.Add('nitem'             , ftSmallint  );
  vtempdataset.FieldDefs.Add('grupo_prod'        , ftInteger   );
  vtempdataset.FieldDefs.Add('cod_prod'          , ftString,  6);
  vtempdataset.FieldDefs.Add('cod_empresa'       , ftInteger   );
  vtempdataset.FieldDefs.Add('codigo_ean'        , ftString,  20);
  vtempdataset.FieldDefs.Add('unidade'           , ftString,  3);
  vtempdataset.FieldDefs.Add('quantidade'        , ftFloat     );
  vtempdataset.CreateDataSet;

  carregarDataSetTemp;

  if not (vdataSet.State in [dsInsert, dsEdit]) then
    vdataSet.Edit;

  if (vdataset.FieldByName('CEAN').AsString) <> '' then
  begin
    TabSheet1.Show;
    if gridCodigoEANUnid.CanFocus then
      gridCodigoEANUnid.SetFocus;
  end
  else
  begin
    TabSheet3.Show;
    vdataSet.FieldByName('emb_prod').AsString := vdataSet.FieldByName('unidade').AsString;
    Panel1Enter(Sender);
  end;

 end;

procedure TfrmVinculoProdutosCodigoEANEmb.PageControlCodigoEANUnidChange(
  Sender: TObject);
begin
  if PageControlCodigoEANUnid.ActivePage = TabSheet3 then
    if DBEditUnidadePrinc2.CanFocus then
      DBEditUnidadePrinc2.SetFocus;
end;

procedure TfrmVinculoProdutosCodigoEANEmb.Panel1Enter(Sender: TObject);
begin
  if DBEditUnidadePrinc2.CanFocus then
    DBEditUnidadePrinc2.CanFocus
  else if DBEditEmbalagem.CanFocus then
    DBEditEmbalagem.SetFocus
  else if DBEditQuantidadeEmbalagem.CanFocus then
    DBEditQuantidadeEmbalagem.SetFocus;
end;

end.
