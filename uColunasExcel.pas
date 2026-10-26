unit uColunasExcel;

interface

uses
  uPadrao,
{$IFDEF VER300}
  Data.DB, Vcl.Menus, Vcl.Dialogs, Vcl.Controls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, System.Classes,
  System.Types, IBX.IBQuery, Datasnap.DBClient, IBX.IBDatabase;
{$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, DBClient, IBQuery, IBDatabase, Grids, DBGrids, DB, Menus, 
  IniFiles;
{$ENDIF}

type
  TDirecaoCol = (tdUp, tdDown, tdLeft, tdRight);

  TfrmColunasExcel = class(TfrmPadrao)
    pnPrincipal: TPanel;
    GroupBox2: TGroupBox;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Panel4: TPanel;
    GroupBox3: TGroupBox;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    ListBox1: TListBox;
    DataSource1: TDataSource;
    Panel5: TPanel;
    Panel6: TPanel;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    FontDialog1: TFontDialog;
    ColorDialog1: TColorDialog;
    Panel9: TPanel;
    btNegrito: TSpeedButton;
    btCorFonte: TSpeedButton;
    pnCorFundo: TPanel;
    ckPersonalizar: TCheckBox;
    BitBtn1: TBitBtn;
    PopupMenu1: TPopupMenu;
    Removermodelo1: TMenuItem;
    AplicarEnter1: TMenuItem;
    N1: TMenuItem;
    Exportarparaexcel1: TMenuItem;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    GroupBox4: TGroupBox;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    Panel7: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Panel8: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure ListBox1DblClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Exportarparaexcel1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure AplicarEnter1Click(Sender: TObject);
    procedure ListBox1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Removermodelo1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure ckPersonalizarClick(Sender: TObject);
    procedure pnCorFundoClick(Sender: TObject);
    procedure btNegritoClick(Sender: TObject);
    procedure btCorFonteClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function CriaIni: boolean;
  private
    { Private declarations }
    ArqIni: string;
    ArqConfig: TIniFile;
    vNomeModeloSelecionado: string;
    excel, calc, sheet: variant;
    vLinhaExcel: integer;
    procedure aplicaConfiguracaoNosComponentes(pString: string);
    procedure aplicaConfiguracaoNoDataSet;
    procedure vDataSetReultAfterScroll(DataSet: TDataSet);
    procedure exportarParaExcel;
    procedure exportarParaCalc;
    function criarExcel:boolean;
    function criarCalc:boolean;
    function ordenarColuna(pDirecao: TDirecaoCol): Boolean;
    function moverColuna(pDirecao: TDirecaoCol): Boolean;
    procedure verificaFiltro;
  protected
    vQuery: TIBQuery;
    procedure abreConfiguracao(pTitulo: string);
    function getCampoPipe(plinha: string; pOrdem: integer; pDelimitador: string = '|'): string;
    procedure CheckBoxCamposClick(Sender: TObject);
  public
    { Public declarations }
    vNomeUsuario, vTitulo: string;

    vDataSetTabela, vDataSetResult: TClientDataSet;//, vDataSetDesab
    vTransacao: TIBTransaction;
  end;

var
  frmColunasExcel: TfrmColunasExcel;

implementation

uses
  StrUtils,
{$IFDEF VER300}
  ComObj, System.SysUtils, Vcl.Forms, Winapi.Windows, Vcl.Graphics;
{$ELSE}
  ComObj, Math;
{$ENDIF}

{$R *.dfm}

procedure TfrmColunasExcel.abreConfiguracao(pTitulo: string);
var
  I, vIndice, vCountAtivos: Integer;
  vDataSetInsert: TClientDataSet;
begin
  try
    if Trim(UpperCase(pTitulo)) = 'PADRAO' then
    begin
      vNomeModeloSelecionado := pTitulo;
      Panel1.Caption := vTitulo + ' - ' + vNomeModeloSelecionado;
      vDataSetResult.AfterScroll := nil;
      vDataSetResult.Cancel;
      vDataSetResult.EmptyDataSet;
      vDataSetResult.Insert;
      vDataSetResult.FieldByName('USUARIO').AsString := vNomeUsuario;
      vDataSetResult.FieldByName('COMPONENTE').AsString := vDataSetTabela.Name;
      vDataSetResult.FieldByName('CAMPOS').AsString := '@Titulo';
      vDataSetResult.FieldByName('DISPLAY').AsString := 'Titulo';
      vDataSetResult.FieldByName('FIELDNAME').AsString := '@Titulo';
      vDataSetResult.FieldByName('VISIVEL').AsInteger := 1;
      vDataSetResult.FieldByName('ORDEM').AsInteger := 0;
      vDataSetResult.FieldByName('LARGURA_EXIBICAO').AsInteger := 0;
      vDataSetResult.FieldByName('EXCEL_TITULO').AsString := 'Padrao';
      vDataSetResult.FieldByName('EXCEL_FORMAT').AsString := '||||';
      vDataSetResult.Post;
      vCountAtivos := 1;
      for I := 0 to vDataSetTabela.FieldCount - 1 do
        if vDataSetTabela.Fields[I].Tag <> 1 then
        begin
          vDataSetInsert := TClientDataSet(vDataSetResult);
  //        if vDataSetTabela.Fields[I].Tag = 1 then
  //          vDataSetInsert := TClientDataSet(vDataSetDesab)
  //        else if vDataSetTabela.Fields[I].Visible then
  //          vDataSetInsert := TClientDataSet(vDataSetResult)
  //        else
  //          vDataSetInsert := TClientDataSet(vDataSetDesab);
          if FindComponent(vDataSetTabela.Fields[I].Name) <> nil then
            TCheckBox(FindComponent(vDataSetTabela.Fields[I].Name)).Checked :=
              vDataSetTabela.Fields[I].Visible;
          vDataSetInsert.Insert;
          vDataSetInsert.FieldByName('USUARIO').AsString := vNomeUsuario;
          vDataSetInsert.FieldByName('COMPONENTE').AsString := vDataSetTabela.Name;
          vDataSetInsert.FieldByName('CAMPOS').AsString := IfThen(Trim(vDataSetTabela.Fields[I].Name) <> '', vDataSetTabela.Fields[I].Name, vDataSetTabela.Name + vDataSetTabela.Fields[I].FieldName);
          if vDataSetTabela.Fields[I].Tag = 1 then
            vDataSetInsert.FieldByName('VISIVEL').AsInteger := 0
          else if vDataSetTabela.Fields[I].Visible then
            vDataSetInsert.FieldByName('VISIVEL').AsInteger := 1
          else
            vDataSetInsert.FieldByName('VISIVEL').AsInteger := 0;
          vDataSetInsert.FieldByName('ORDEM').AsInteger := vCountAtivos;
          vDataSetInsert.FieldByName('LARGURA_EXIBICAO').AsInteger := 0;
          vDataSetInsert.FieldByName('EXCEL_TITULO').AsString := 'Padrao';
          vDataSetInsert.FieldByName('EXCEL_FORMAT').AsString := '||||';
          vDataSetInsert.FieldByName('DISPLAY').AsString := vDataSetTabela.Fields[I].DisplayLabel;
          vDataSetInsert.FieldByName('FIELDNAME').AsString := vDataSetTabela.Fields[I].FieldName;
          vDataSetInsert.Post;
          vCountAtivos := vCountAtivos + 1;
        end;
    end
    else
    begin
      vQuery.Close;
      vQuery.SQL.Text := 'select * from config_colunas' +
        ' where EXCEL_TITULO = ' + QuotedStr(pTitulo) +
        ' and USUARIO = ' + QuotedStr(vNomeUsuario) +
        ' and COMPONENTE like ' + QuotedStr(vDataSetTabela.Name +'@%') +
        ' order by ordem';
      vQuery.Open;

      if vQuery.IsEmpty then
        Exit;

      vNomeModeloSelecionado := pTitulo;
      Panel1.Caption := vTitulo + ' - ' + vNomeModeloSelecionado;

      vDataSetResult.Filter := '';
      vDataSetResult.Filtered := False;
      vDataSetResult.AfterScroll := nil;
      vDataSetResult.EmptyDataSet;

      vQuery.First;
      while not vQuery.Eof do
      begin
        if FindComponent(vQuery.FieldByName('CAMPOS').AsString) <> nil then
          TCheckBox(FindComponent(vQuery.FieldByName('CAMPOS').AsString)).Checked :=
            vQuery.FieldByName('VISIVEL').AsInteger = 1;

//        if vQuery.FieldByName('VISIVEL').AsInteger = 1 then
          vDataSetInsert := TClientDataSet(vDataSetResult);
//        else
//          vDataSetInsert := TClientDataSet(vDataSetDesab);

        vDataSetInsert.Insert;
        for I := 0 to vQuery.FieldCount - 1 do
          if vDataSetInsert.FindField(vQuery.Fields[I].FieldName) <> nil then
            vDataSetInsert.FieldByName(vQuery.Fields[I].FieldName).Value := vQuery.FieldByName(vQuery.Fields[I].FieldName).Value;

        if vQuery.FieldByName('CAMPOS').AsString = '@Titulo' then
        begin
          vDataSetInsert.FieldByName('DISPLAY').AsString := 'Titulo';
          vDataSetInsert.FieldByName('FIELDNAME').AsString := '@Titulo';
        end
        else
        begin
          for I := 0 to vDataSetTabela.FieldCount - 1 do
            //if ((Trim(vDataSetTabela.Fields[I].Name) = '') and ( vQuery.FieldByName('CAMPOS').AsString then
            if //vDataSetTabela.Fields[I].Name =
            IfThen(Trim(vDataSetTabela.Fields[I].Name) <> '', vDataSetTabela.Fields[I].Name, vDataSetTabela.Name + vDataSetTabela.Fields[I].FieldName) =
            vQuery.FieldByName('CAMPOS').AsString then
            begin
              vDataSetInsert.FieldByName('DISPLAY').AsString := vDataSetTabela.Fields[I].DisplayLabel;
              vDataSetInsert.FieldByName('FIELDNAME').AsString := vDataSetTabela.Fields[I].FieldName;
              Break;
            end;
        end;
        vDataSetInsert.Post;
        vQuery.Next;
      end;
    end;
  finally
    vDataSetResult.AfterScroll := vDataSetReultAfterScroll;
    verificaFiltro;
    vDataSetResult.First;
  end;
end;

procedure TfrmColunasExcel.ckPersonalizarClick(Sender: TObject);
begin
  inherited;
  aplicaConfiguracaoNoDataSet;
  aplicaConfiguracaoNosComponentes(vDataSetResult.FieldByName('EXCEL_FORMAT').AsString);
end;

function TfrmColunasExcel.CriaIni: boolean;
begin
	try
    Result := true;
    ArqIni := ExtractFilePath(Application.Exename) + 'hwsistemas.ini';
    if not FileExists(ArqIni) then
      ArqIni := ExtractFilePath(Application.Exename) + 'Config.ini';
    ArqConfig := TIniFile.Create(ArqIni);
  except
    Result := false;
  end;
end;

function TfrmColunasExcel.criarCalc: boolean;
begin
	try
    calc := CreateOleObject('com.sun.star.ServiceManager');

    Result := True;

  except
    Result := False;
    Application.MessageBox ('Versão do OpenOffice Calc Incompatível','Erro',MB_OK+MB_ICONEXCLAMATION);
  end;
end;

function TfrmColunasExcel.criarExcel: boolean;
var
  I, J: Integer;
  vtemp, vStringFormat: string;
begin
  try
    excel := CreateOleObject('Excel.Application');

    Result := True;

  except
    Result := False;
    Application.MessageBox ('Versão do Microsoft Excel Incompatível','Erro',MB_OK+MB_ICONEXCLAMATION);
  end;
  try
    excel.Workbooks.add;
    sheet := excel.Workbooks[1].sheets[1];
    sheet.cells[1,01] := Self.Caption;
    sheet.cells[1,01].Font.Size := 12;
    sheet.cells[1,01].Font.Bold := True;

    vDataSetResult.Filter := 'FIELDNAME = ''@Titulo''';
    vDataSetResult.Filtered := True;
    vStringFormat := vDataSetResult.FieldByName('excel_format').AsString;
    vDataSetResult.Filter := 'VISIVEL = 1 and FIELDNAME <> ''@Titulo''';
    vDataSetResult.Filtered := True;

    I := 0;
    vDataSetResult.First;
    while not vDataSetResult.Eof do
    begin
      I := I + 1;
      vtemp := vDataSetResult.FieldByName('display').AsString;
      if getCampoPipe(vStringFormat, 1) = 'P' then
      begin
        sheet.cells[2, I] := vtemp;
        if getCampoPipe(vStringFormat, 2) = 'N' then
          sheet.cells[2, I].Font.Bold := True;
        sheet.cells[2, I].Font.Color := ColorToRGB( StrToInt64Def(  getCampoPipe(vStringFormat, 3), clWindowText));
        sheet.cells[2, I].Interior.Color := ColorToRGB( StrToInt64Def(  getCampoPipe(vStringFormat, 4), $00ffcf9c));
      end
      else
      begin
        sheet.cells[2, I] := vtemp;
        sheet.cells[2, I].Font.Bold := True;
        sheet.cells[2, I].Interior.Color := $00ffcf9c;
      end;
      vDataSetResult.Next;
    end;
  except
  end;
end;

procedure TfrmColunasExcel.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  if vDataSetResult.IsEmpty then
    Exit
  else if vDataSetResult.FieldByName('FIELDNAME').AsString = '@Titulo' then
    Exit;
  vDataSetResult.Edit;
  if vDataSetResult.FieldByName('VISIVEL').AsInteger = 1 then
    vDataSetResult.FieldByName('VISIVEL').AsInteger := 0
  else
    vDataSetResult.FieldByName('VISIVEL').AsInteger := 1;
  vDataSetResult.Post;
end;

procedure TfrmColunasExcel.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  dtSet: TDataSet;
  R: TRect;
begin
  inherited;
  dtSet := TDataSet(DBGrid1.DataSource.DataSet);

  if dtSet.IsEmpty then
    Exit;

  if not (gdFocused in State) then
  begin
    if (dtSet.FieldByName('FIELDNAME').AsString = '@Titulo') then
    begin
      TDBGrid(sender).canvas.Font.Style := [fsBold];
      TDBGrid(sender).canvas.Brush.Color := clInfoBk;
    end
    else if (dtSet.FieldByName('visivel').AsInteger = 1) then
    begin
      TDBGrid(sender).canvas.Font.Style := [fsBold];
      TDBGrid(sender).canvas.Brush.Color := clActiveCaption;
    end
    else
    begin
      TDBGrid(sender).canvas.Font.Style := [];
      TDBGrid(sender).canvas.Brush.Color := clWindow;
    end;
    TDBGrid(sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end
  else
  begin
    if (dtSet.FieldByName('visivel').AsInteger = 1) then
      TDBGrid(sender).canvas.Font.Style := [fsBold]
    else
      TDBGrid(sender).canvas.Font.Style := [];
    TDBGrid(sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TfrmColunasExcel.DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    DBGrid1DblClick(Sender);
end;

procedure TfrmColunasExcel.Edit1Change(Sender: TObject);
begin
  inherited;
  verificaFiltro;
end;

procedure TfrmColunasExcel.Edit1Enter(Sender: TObject);
begin
  inherited;
  vDataSetResult.AfterScroll := nil;
end;

procedure TfrmColunasExcel.Edit1Exit(Sender: TObject);
begin
  inherited;
  vDataSetResult.AfterScroll := vDataSetReultAfterScroll;
end;

procedure TfrmColunasExcel.Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_INSERT then
    DBGrid1DblClick(Sender);
end;

procedure TfrmColunasExcel.exportarParaCalc;
var
	OpenDesktop, Documento, Sheets, Sheet, Celula, Planilha: Variant;
  Connect, OpenOffice: Variant;
  vTemp: string;
  vPointer: Pointer;
  vCor: integer;
  I, J: Integer;
  DataAux: TDateTime;
  DiaAux: word;
  MesAux: word;
  AnoAux: word;
  vListaErrosExcel: TStringList;
  vField: TField;
  vStringFormat: string;
  vSize: Integer;
begin
	try
    vDataSetResult.AfterScroll := nil;
    vDataSetResult.DisableControls;
    vDataSetResult.IndexFieldNames := 'ORDEM';
    if criarCalc then
	  begin
    	Panel1.Caption := vTitulo + ' - ' + vNomeModeloSelecionado + ' - Montando Planilha.';
      vPointer := vDataSetTabela.GetBookmark;
      vListaErrosExcel := TStringList.Create;
      vListaErrosExcel.Clear;

      vDataSetResult.Filter := 'VISIVEL = 1 and FIELDNAME <> ''@Titulo''';
      vDataSetResult.Filtered := True;

      //Cria o link OLE com o OpenOffice
      if VarIsEmpty(OpenOffice) then
        OpenOffice := CreateOleObject('com.sun.star.ServiceManager');
      Connect := not (VarIsEmpty(OpenOffice) or VarIsNull(OpenOffice));

      //Inicia o Calc
      OpenDesktop := OpenOffice.CreateInstance('com.sun.star.frame.Desktop');
      Documento   := OpenDesktop.LoadComponentFromURL('private:factory/scalc',
                        '_blank', 0, VarArrayCreate([0, -1], varVariant));
      Planilha    := Documento.getSheets.getByName('Planilha1');
      Sheets      := Documento.Sheets;
      Sheet       := Sheets.getByIndex(0);

      //Criar linha inicial
      Celula := Planilha.getCellByPosition(i, 0);
      Celula.CharWeight := 200;
      Sheet.getCellByPosition(i, 0).setString('Exportação de dados para Planilha');

      //Definir largura colunas
      i := 0;
      vDataSetResult.First;
      while not vDataSetResult.Eof do
      begin
        if (i = 0) then
        begin
          if (Length('Exportação de dados para Planilha') > vDataSetTabela.FieldByName(vDataSetResult.FieldByName('FIELDNAME').AsString).Size) then
            vSize := Length('Exportação de dados para Planilha')
          else if Length(vDataSetTabela.FieldByName(vDataSetResult.FieldByName('FIELDNAME').AsString).DisplayName) > vDataSetTabela.FieldByName(vDataSetResult.FieldByName('FIELDNAME').AsString).DisplayWidth then
          	vSize := Length(vDataSetTabela.FieldByName(vDataSetResult.FieldByName('FIELDNAME').AsString).DisplayName)
          else if vDataSetTabela.FieldByName(vDataSetResult.FieldByName('FIELDNAME').AsString).DisplayWidth > vDataSetTabela.FieldByName(vDataSetResult.FieldByName('FIELDNAME').AsString).Size then
	          vSize := vDataSetTabela.FieldByName(vDataSetResult.FieldByName('FIELDNAME').AsString).DisplayWidth
          else
            vSize := vDataSetTabela.FieldByName(vDataSetResult.FieldByName('FIELDNAME').AsString).Size;
        end
        else if Length(vDataSetTabela.FieldByName(vDataSetResult.FieldByName('FIELDNAME').AsString).DisplayName) > vDataSetTabela.FieldByName(vDataSetResult.FieldByName('FIELDNAME').AsString).DisplayWidth then
          vSize := Length(vDataSetTabela.FieldByName(vDataSetResult.FieldByName('FIELDNAME').AsString).DisplayName)
        else if vDataSetTabela.FieldByName(vDataSetResult.FieldByName('FIELDNAME').AsString).DisplayWidth > vDataSetTabela.FieldByName(vDataSetResult.FieldByName('FIELDNAME').AsString).Size then
          vSize := vDataSetTabela.FieldByName(vDataSetResult.FieldByName('FIELDNAME').AsString).DisplayWidth
        else
        	vSize := vDataSetTabela.FieldByName(vDataSetResult.FieldByName('FIELDNAME').AsString).Size;
        Planilha.getColumns.getByIndex(i).width := vSize * 220;

        i := i + 1;
        
        vDataSetResult.Next;
      end;

    	//Preencher colunas planilha
			i := 0;
      j := 1;
    	vDataSetResult.First;
      while not vDataSetResult.Eof do
      begin
      	Celula := Planilha.getCellByPosition(i, j);
        Celula.CharWeight := 200;
        Celula.CellBackColor := '39423';
        Sheet.getCellByPosition(i, j).setString(vDataSetTabela.FieldByName(vDataSetResult.FieldByName('FIELDNAME').AsString).DisplayName);

        i := i + 1;

        vDataSetResult.Next;
      end;

      //Preencher linhas planilha
      j := 2;
      vDataSetTabela.First;
      while not vDataSetTabela.Eof do
      begin
        if vDataSetTabela.RecNo mod 5 = 0 then
          Panel1.Caption := vTitulo + ' - ' + vNomeModeloSelecionado + ' - Montando Planilha ' + IntToStr(Trunc(vDataSetTabela.RecNo / vDataSetTabela.RecordCount * 100)) + '%';
        Application.ProcessMessages;

        I := 0;
        vDataSetResult.First;
        while not vDataSetResult.Eof do
        begin
          try
            vField := TField(vDataSetTabela.FieldByName(vDataSetResult.FieldByName('FIELDNAME').AsString));
            vStringFormat := vDataSetResult.FieldByName('excel_format').AsString;
            vTemp := Trim(vField.AsString);
            if vTemp = '' then
            else if vField is TTimeField then
            begin
            	if not vField.IsNull then
              begin
                DataAux := vField.AsDateTime;
                Sheet.getCellByPosition(i, j).setString(FormatDateTime('hh:mm:ss', DataAux));
              end;
            end
            else if vField is TDateTimeField then
            begin
            	if not vField.IsNull then
              begin
                DataAux := vField.AsDateTime;
                DecodeDate(vField.AsDateTime, AnoAux, MesAux, DiaAux);
                if DataAux - EncodeDate(AnoAux, MesAux, DiaAux) = 0 then
                  Sheet.getCellByPosition(i, j).setString(FormatDateTime('dd/mm/yyyy', EncodeDate(AnoAux, MesAux, DiaAux)))
                else
                  Sheet.getCellByPosition(i, j).setString(FormatDateTime('dd/mm/yyyy', DataAux));
              end;
            end
            else if (vField is TIntegerField) and (trim(vTemp) <> '') then
            	Sheet.getCellByPosition(i, j).setValue(StrToInt(vTemp))
            else if (vField is TFloatField) and (trim(vTemp) <> '') then
            begin
              Sheet.getCellByPosition(i, j).setValue(StrToFloat(vTemp));
              if (TFloatField(vField).currency) then
                Sheet.getCellByPosition(i, j).NumberFormat := 21
              else
                Sheet.getCellByPosition(i, j).NumberFormat := 4;
            end
            else if vField is TStringField then
              Sheet.getCellByPosition(i, j).setString(vTemp)
            else
              Sheet.getCellByPosition(i, j).setString(vTemp);

            Celula := Planilha.getCellByPosition(i, j);

            if vField is TTimeField then
            	Celula.HoriJustify   := 3
            else if vField is TDateTimeField then
            	Celula.HoriJustify   := 3
            else if vField is TFloatField then
            	Celula.HoriJustify   := 3
            else if vField is TIntegerField then
            	Celula.HoriJustify   := 3;

            if ((j mod 2) = 1) then
              Celula.CellBackColor := 8303567
            else
              Celula.CellBackColor := 13893372;

          except
            on e: exception do
            begin
              vListaErrosExcel.Add(vField.DisplayName + ': ' +
                'Linha: ' + IntToStr(vDataSetTabela.RecNo) +
                ' Conteúdo: ' + Copy(vField.AsString, 1, 20)
              );
            end;
          end;
          I := I + 1;
          
          vDataSetResult.Next;
        end;

        j := j + 1;

        vDataSetTabela.Next;
      end;

      vDataSetTabela.GotoBookmark(vPointer);
    end;
  finally
    Panel1.Caption := vTitulo + ' - ' + vNomeModeloSelecionado;
    vDataSetResult.AfterScroll := vDataSetReultAfterScroll;
    verificaFiltro;
    vDataSetResult.EnableControls;
    if Assigned(vListaErrosExcel) then
    begin
      if vListaErrosExcel.Count > 0 then
        Application.MessageBox(PChar('Alguns dados não foram copiados para Planilha.' + #13 + vListaErrosExcel.Text), 'Atenção', 0 + 64);
    end;
  end;
end;

procedure TfrmColunasExcel.exportarParaExcel;
var
  vTemp: string;
  vPointer: Pointer;
  vCor: integer;
  I: Integer;
  DataAux: TDateTime;
  DiaAux: word;
  MesAux: word;
  AnoAux: word;
  vListaErrosExcel: TStringList;
  vField: TField;
  vStringFormat: string;
begin
	CriaIni;
  if trim(ArqConfig.ReadString('Sistema', 'OpenOfficeExportRel', 'N')) = 'S' then
  begin
	  exportarParaCalc;
    exit;
  end;

  try
    vDataSetResult.AfterScroll := nil;
    vDataSetResult.DisableControls;
    vDataSetResult.IndexFieldNames := 'ORDEM';
    if criarExcel then
    begin
      Panel1.Caption := vTitulo + ' - ' + vNomeModeloSelecionado + ' - Montando Planilha.';
      vPointer := vDataSetTabela.GetBookmark;
      vListaErrosExcel := TStringList.Create;
      vListaErrosExcel.Clear;

      vDataSetResult.Filter := 'VISIVEL = 1 and FIELDNAME <> ''@Titulo''';
      vDataSetResult.Filtered := True;

      vLinhaExcel := 3;
      vDataSetTabela.First;
      while not vDataSetTabela.Eof do
      begin
        if vDataSetTabela.RecNo mod 5 = 0 then
          Panel1.Caption := vTitulo + ' - ' + vNomeModeloSelecionado + ' - Montando Planilha ' + IntToStr(Trunc(vDataSetTabela.RecNo / vDataSetTabela.RecordCount * 100)) + '%';
        Application.ProcessMessages;

        vDataSetResult.First;
        I := 0;
        while not vDataSetResult.Eof do
        begin
          I := I + 1;
          try
            vField := TField(vDataSetTabela.FieldByName(vDataSetResult.FieldByName('FIELDNAME').AsString));
            vStringFormat := vDataSetResult.FieldByName('excel_format').AsString;
            vTemp := Trim(vField.AsString);
            if vTemp = '' then
            else if vField is TDateTimeField then
            begin
              DataAux := vField.AsDateTime;
              DecodeDate(vField.AsDateTime, AnoAux, MesAux, DiaAux);
              if DataAux - EncodeDate(AnoAux, MesAux, DiaAux) = 0 then
                sheet.cells[vLinhaExcel, I].Value := EncodeDate(AnoAux, MesAux, DiaAux)
              else
              	sheet.cells[vLinhaExcel, I].Value := DataAux;
            end
            else if vField is TFloatField then
            begin
              sheet.cells[vLinhaExcel, I].Value := StrToFloat(StringReplace(vTemp,'.','',[rfReplaceAll]));
              vTemp := Trim(TFloatField(vField).DisplayFormat);
              if vTemp <> '' then
              begin
                vTemp := StringReplace(vTemp,'#','',[rfReplaceAll]);
                vTemp := StringReplace(vTemp,'.',',',[rfReplaceAll]);
              end
              else
                vTemp := '0,00';
              sheet.cells[vLinhaExcel, I].NumberFormat := vTemp;
            end
            else if vField is TStringField then
            begin
              sheet.cells[vLinhaExcel, I].NumberFormat := '@';
              sheet.cells[vLinhaExcel, I].Value := vTemp;
            end
            else
              sheet.cells[vLinhaExcel, I] := vTemp;

            if getCampoPipe(vStringFormat, 1) = 'P' then
            begin
              if getCampoPipe(vStringFormat, 2) = 'N' then
                sheet.cells[vLinhaExcel, I].Font.Bold := True;
              sheet.cells[vLinhaExcel, I].Font.Color := ColorToRGB( StrToInt64Def(  getCampoPipe(vStringFormat, 3), clWindowText));
              sheet.cells[vLinhaExcel, I].Interior.Color := ColorToRGB( StrToInt64Def(  getCampoPipe(vStringFormat, 4), $00ffcf9c));
            end
            else
            begin
              if (vLinhaExcel mod 2) = 1 then
                sheet.cells[vLinhaExcel, I].Interior.Color := 8303567//ColorToRGB(clYellow)
              else
                sheet.cells[vLinhaExcel, I].Interior.Color := 13893372;//ColorToRGB(clSkyBlue);
            end;

          except
            on e: exception do
            begin
              vListaErrosExcel.Add(vField.DisplayName + ': ' +
                'Linha: ' + IntToStr(vDataSetTabela.RecNo) +
                ' Conteúdo: ' + Copy(vField.AsString, 1, 20)
              );
            end;
          end;
          vDataSetResult.Next;
        end;

        Inc(vLinhaExcel);

        vDataSetTabela.Next;
      end;

      vDataSetTabela.GotoBookmark(vPointer);

      excel.Cells.EntireRow.AutoFit;
      excel.Cells.EntireColumn.AutoFit;
    end;
  finally
    Panel1.Caption := vTitulo + ' - ' + vNomeModeloSelecionado;
    vDataSetResult.AfterScroll := vDataSetReultAfterScroll;
    verificaFiltro; 
    vDataSetResult.EnableControls;
    if Assigned(vListaErrosExcel) then
    begin
      if vListaErrosExcel.Count > 0 then
        Application.MessageBox(PChar('Alguns dados não foram copiados para Planilha.' + #13 + vListaErrosExcel.Text), 'Atenção', 0 + 64);
    	excel.visible := True;
    end;
  end;
end;

procedure TfrmColunasExcel.Exportarparaexcel1Click(Sender: TObject);
begin
  inherited;
  if ListBox1.ItemIndex < 0 then
  begin
    Application.MessageBox('Selecione um item primeiro!', 'Atenção', 0 + 64);
    Exit;
  end;
  abreConfiguracao(ListBox1.Items[ListBox1.ItemIndex]);
  BitBtn3.Click;
end;

procedure TfrmColunasExcel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmColunasExcel := nil;
end;

procedure TfrmColunasExcel.FormCreate(Sender: TObject);
begin
  inherited;
  if vDataSetResult = nil then
  begin
    vDataSetResult := TClientDataSet.Create(Application);
    vDataSetResult.FieldDefs.Add( 'USUARIO', ftString, 20);
    vDataSetResult.FieldDefs.Add( 'COMPONENTE', ftString, 64);
    vDataSetResult.FieldDefs.Add( 'CAMPOS', ftString, 64);
    vDataSetResult.FieldDefs.Add( 'VISIVEL', ftString, 64);
    vDataSetResult.FieldDefs.Add( 'ORDEM', ftInteger);
    vDataSetResult.FieldDefs.Add( 'LARGURA_EXIBICAO', ftInteger);
    vDataSetResult.FieldDefs.Add( 'EXCEL_TITULO', ftString, 16);
    vDataSetResult.FieldDefs.Add( 'EXCEL_FORMAT', ftString, 64);
    vDataSetResult.FieldDefs.Add( 'DISPLAY', ftString, 128);
    vDataSetResult.FieldDefs.Add( 'FIELDNAME', ftString, 128);
    vDataSetResult.CreateDataSet;
    vDataSetResult.AfterScroll := vDataSetReultAfterScroll;
  end;
//  if vDataSetDesab = nil then
//  begin
//    vDataSetDesab := TClientDataSet.Create(Application);
//    vDataSetDesab.FieldDefs.Add( 'USUARIO', ftString, 20);
//    vDataSetDesab.FieldDefs.Add( 'COMPONENTE', ftString, 64);
//    vDataSetDesab.FieldDefs.Add( 'CAMPOS', ftString, 64);
//    vDataSetDesab.FieldDefs.Add( 'VISIVEL', ftString, 64);
//    vDataSetDesab.FieldDefs.Add( 'ORDEM', ftInteger);
//    vDataSetDesab.FieldDefs.Add( 'LARGURA_EXIBICAO', ftInteger);
//    vDataSetDesab.FieldDefs.Add( 'EXCEL_TITULO', ftString, 16);
//    vDataSetDesab.FieldDefs.Add( 'EXCEL_FORMAT', ftString, 64);
//    vDataSetDesab.FieldDefs.Add( 'DISPLAY', ftString, 128);
//    vDataSetDesab.FieldDefs.Add( 'FIELDNAME', ftString, 128);
//    vDataSetDesab.CreateDataSet;
//  end;
//  if vTransacao = nil then
//  begin
//    vTransacao := TIBTransaction.Create(Application);
//    vTransacao.DefaultDatabase := dtmAtivo.bancoHw;
//    vTransacao.Params.Add('read_committed');
//    vTransacao.Params.Add('rec_version');
//    vTransacao.Params.Add('nowait');
//  end;
end;

procedure TfrmColunasExcel.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    if ActiveControl = ListBox1 then
      AplicarEnter1.Click;
  end
  else if Key = VK_F2 then
    SpeedButton1.Click
  else if Key = VK_F3 then
    ActiveControl := Edit1
  else if Key = VK_F4 then
    SpeedButton2.Click
  else if Key = VK_F6 then
    SpeedButton3.Click
end;

procedure TfrmColunasExcel.FormShow(Sender: TObject);
begin
  inherited;
  try
    if vQuery = nil then
    begin
      vQuery := TIBQuery.Create(Application);
      vQuery.Database := vTransacao.DefaultDatabase;
      vQuery.Transaction := vTransacao;
    end;

    vQuery.Close;
    vQuery.SQL.Text := 'select distinct EXCEL_TITULO from CONFIG_COLUNAS' +
      ' where EXCEL_TITULO is not null' +
      ' and USUARIO = ' + QuotedStr(vNomeUsuario) +
      ' and COMPONENTE like ' + QuotedStr(vDataSetTabela.Name + '@%' ) +
      ' order by 1';
    vQuery.Open;

    ListBox1.Clear;
    ListBox1.Items.Add('Padrao');
    vQuery.First;
    while not vQuery.Eof do
    begin
      ListBox1.Items.Add(vQuery.FieldByName('excel_titulo').AsString);
      vQuery.Next;
    end;

    DataSource1.DataSet := vDataSetResult;
//    DataSource2.DataSet := vDataSetDesab;
//    criaChecksColunas;
    abreConfiguracao('Padrao');
  finally

  end;
end;

function TfrmColunasExcel.getCampoPipe(plinha: string; pOrdem: integer; pDelimitador: string): string;
var
  vTemp: string;
  vInc: Smallint;
begin
  vTemp := plinha;
  vInc := 0;
  while pos(pDelimitador, vTemp) > 0 do
  begin
    inc(vInc);
    if pOrdem = vInc then
    begin
      vTemp := Copy(vTemp, 1, pos(pDelimitador, vTemp) - 1);
      Result := Trim(vTemp);
      exit;
    end;
    vTemp := Copy(vTemp, pos(pDelimitador, vTemp) + 1, length(vTemp));
  end;
  Result := '';
end;

procedure TfrmColunasExcel.ListBox1DblClick(Sender: TObject);
begin
  inherited;
  Exportarparaexcel1.Click;
end;

procedure TfrmColunasExcel.ListBox1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_DELETE then
    Removermodelo1.Click;
end;

function TfrmColunasExcel.moverColuna(pDirecao: TDirecaoCol): Boolean;
var
  vOrdem, I: Integer;
begin
//  try
//    if pDirecao = tdLeft then
//    begin
//      if vDataSetResult.RecNo <= 1 then
//        Exit;
//      vOrdem := vDataSetResult.FieldByName('ordem').AsInteger;
//      vDataSetDesab.Insert;
//      for I := 0 to vDataSetResult.FieldCount - 1 do
//        if vDataSetDesab.FindField(vDataSetResult.Fields[i].FieldName <> nil then
//          vDataSetDesab.FieldByName(vDataSetResult.Fields[I].FieldName).Value :=
//            vDataSetResult.FieldByName(vDataSetResult.Fields[I].FieldName).Value;
//      vDataSetDesab.FieldByName('VISIVEL').AsInteger := 0;
//      vDataSetDesab.Post;
//      vDataSetDesab.Locate('ORDEM', vOrdem, []);
//    end
//    else if pDirecao = tdRight then
//    begin
//      if vDataSetDesab.RecNo <= 1 then
//        Exit;
//      vOrdem := vDataSetDesab.FieldByName('ordem').AsInteger;
//      vDataSetResult.Insert;
//      for I := 0 to vDataSetDesab.FieldCount - 1 do
//        if vDataSetResult.FindField(vDataSetDesab.Fields[i].FieldName <> nil then
//          vDataSetResult.FieldByName(vDataSetDesab.Fields[I].FieldName).Value :=
//            vDataSetDesab.FieldByName(vDataSetDesab.Fields[I].FieldName).Value;
//      vDataSetResult.FieldByName('VISIVEL').AsInteger := 1;
//      vDataSetResult.FieldByName('SEL').AsString := 'N';
//      vDataSetResult.Post;
//      vDataSetResult.Locate('ORDEM', vOrdem, []);
//    end;
//  finally
//  end;
end;

function TfrmColunasExcel.ordenarColuna(pDirecao: TDirecaoCol): Boolean;
var
  vRecNo, vNovaOrdem, vAntigaOrdem, vTempOrdem: Integer;
begin
  vRecNo := 0;
  try
    if pDirecao = tdUp then
    begin
      if vDataSetResult.RecNo <= 2 then
      begin
        vRecNo :=vDataSetResult.RecNo;
        Exit;
      end;
      vRecNo :=vDataSetResult.RecNo - 1;
      vAntigaOrdem := vDataSetResult.FieldByName('ordem').AsInteger;
      vDataSetResult.Prior;
      vNovaOrdem := vDataSetResult.FieldByName('ordem').AsInteger ;
      vTempOrdem := 1000;
    end
    else if pDirecao = tdDown then
    begin
      if vDataSetResult.RecNo = 1 then
      begin
        vRecNo :=vDataSetResult.RecNo;
        Exit;
      end;
      if vDataSetResult.RecNo >= vDataSetResult.RecordCount then
      begin
        vRecNo :=vDataSetResult.RecNo;
        Exit;
      end;
      vRecNo :=vDataSetResult.RecNo + 1;
      vAntigaOrdem := vDataSetResult.FieldByName('ordem').AsInteger;
      vDataSetResult.Next;
      vNovaOrdem := vDataSetResult.FieldByName('ordem').AsInteger ;
      vTempOrdem := 1000;
    end;

    begin
      //movendo o registro para ultima posicao
      vDataSetResult.Filter := 'ORDEM = ' + IntToStr(vAntigaOrdem);
      vDataSetResult.Filtered := True;
      vDataSetResult.Edit;
      vDataSetResult.FieldByName('ordem').AsInteger := vTempOrdem;
      vDataSetResult.Post;

      //movendo o registro de cima para baixo
      vDataSetResult.Filter := 'ORDEM = ' + IntToStr(vNovaOrdem);
      vDataSetResult.Edit;
      vDataSetResult.FieldByName('ordem').AsInteger := vAntigaOrdem;
      vDataSetResult.Post;

      //movendo o registro selecionado para a posicao final e definitiva dele
      vDataSetResult.Filter := 'ORDEM = ' + IntToStr(vTempOrdem);
      vDataSetResult.Edit;
      vDataSetResult.FieldByName('ordem').AsInteger := vNovaOrdem;
      vDataSetResult.Post;

    end;
  finally
    verificaFiltro;
    if vRecNo > 0 then
      vDataSetResult.RecNo := vRecNo;
  end;
end;

procedure TfrmColunasExcel.pnCorFundoClick(Sender: TObject);
begin
  inherited;
  if ColorDialog1.Execute then
    pnCorFundo.Color := ColorDialog1.Color;
  aplicaConfiguracaoNoDataSet;
end;

procedure TfrmColunasExcel.Removermodelo1Click(Sender: TObject);
var
  J: Integer;
begin
  inherited;
  if ListBox1.ItemIndex < 0 then
  begin
    Application.MessageBox('Selecione um item primeiro!', 'Atenção', 0 + 64);
    Exit;
  end;

  if Application.MessageBox('Deseja mesmo remover o modelo selecionado', 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
    Exit;

  vQuery.Close;
  vQuery.SQL.Text := 'delete from CONFIG_COLUNAS' +
    ' where EXCEL_TITULO = ' + QuotedStr(ListBox1.Items[ListBox1.ItemIndex]) +
    ' and USUARIO = ' + QuotedStr(vNomeUsuario) +
    ' and COMPONENTE like ' + QuotedStr(vDataSetTabela.Name + '@%' ) ;
  vQuery.ExecSQL;
  if vQuery.Transaction.Active then
    vQuery.Transaction.Commit;

  try
    vDataSetResult.DisableControls;

    vQuery.Close;
    vQuery.SQL.Text := 'select distinct EXCEL_TITULO from CONFIG_COLUNAS' +
      ' where EXCEL_TITULO is not null' +
      ' and USUARIO = ' + QuotedStr(vNomeUsuario) +
      ' and COMPONENTE like ' + QuotedStr(vDataSetTabela.Name + '@%' )  +
      ' order by 1';
    vQuery.Open;
    J := ListBox1.ItemIndex;
    ListBox1.Clear;
    ListBox1.Items.Add('Padrao');
    vQuery.First;
    while not vQuery.Eof do
    begin
      ListBox1.Items.Add(vQuery.FieldByName('excel_titulo').AsString);
      vQuery.Next;
    end;
    if ListBox1.Items.Count >= J + 1 then
      ListBox1.ItemIndex := J;
  finally
    vDataSetResult.EnableControls;
  end;
end;

procedure TfrmColunasExcel.aplicaConfiguracaoNoDataSet;
var
  vString: string;
begin
  if (fsBold in btNegrito.Font.Style) then
    vString := 'N|'
  else
    vString := '|';

  vString := vString + IntToStr(btCorFonte.Font.Color) + '|';
  vString := vString + IntToStr(pnCorFundo.Color) + '|';
  if ckPersonalizar.Checked then
    vString := 'P|' + vString
  else vString := '|' + vString;

  vDataSetResult.Edit;
  vDataSetResult.FieldByName('EXCEL_FORMAT').AsString := vString;
  vDataSetResult.Post;
end;

procedure TfrmColunasExcel.aplicaConfiguracaoNosComponentes(pString: string);
begin
  if Trim(pString) = '' then
    pString := '||||';
  try

    ckPersonalizar.OnClick := nil;

    ckPersonalizar.Checked := getCampoPipe(pString, 1) = 'P';
    if ckPersonalizar.Checked then
    begin
      if getCampoPipe(pString, 2) <> 'N' then
        btNegrito.Font.Style := btNegrito.Font.Style - [fsBold]
      else
        btNegrito.Font.Style := btNegrito.Font.Style + [fsBold];
      btCorFonte.Font.Color := StrToInt64Def(  getCampoPipe(pString,3), clWindowText);
      pnCorFundo.Color := StrToInt64Def(  getCampoPipe(pString,4), clBtnFace);
    end
    else
    begin
      if (fsBold in btNegrito.Font.Style) then
        btNegrito.Font.Style := btNegrito.Font.Style - [fsBold];
      btCorFonte.Font.Color := clWindowText;
      pnCorFundo.Color := clWhite;
    end;
    btNegrito.Enabled := ckPersonalizar.Checked;
    btCorFonte.Enabled := ckPersonalizar.Checked;
    pnCorFundo.Enabled := ckPersonalizar.Checked;
  finally
    ckPersonalizar.OnClick := ckPersonalizarClick;
  end;
end;

procedure TfrmColunasExcel.AplicarEnter1Click(Sender: TObject);
begin
  inherited;
  if ListBox1.ItemIndex < 0 then
  begin
    Application.MessageBox('Selecione um item primeiro!', 'Atenção', 0 + 64);
    Exit;
  end
  else
    abreConfiguracao(ListBox1.Items[ListBox1.ItemIndex]);
end;

procedure TfrmColunasExcel.BitBtn1Click(Sender: TObject);
var
  vNomeModelo: string;
  vSql: string;
  I, j: Integer;
begin
  inherited;
  if not InputQuery('Salvar modelo', 'Informe o nome do modelo', vNomeModelo) then
    Exit;

  vNomeModelo := Copy(vNomeModelo, 1, 16);

  if Trim(vNomeModelo) = '' then
    Exit
  else if UpperCase(Trim(vNomeModelo)) = 'PADRAO' then
  begin
    Application.MessageBox('Nome do modelo inválido, já utilizado pelo sistema, utilize outro', 'Atenção', 0 + 64);
    Exit;
  end;

  vQuery.Close;
  vQuery.SQL.Text := 'select distinct EXCEL_TITULO from CONFIG_COLUNAS' +
    ' where EXCEL_TITULO = ' + QuotedStr(vNomeModelo) +
    ' and USUARIO = ' + QuotedStr(vNomeUsuario) +
    ' and COMPONENTE like ' + QuotedStr(vDataSetTabela.Name + '@%' );
  vQuery.Open;

  if not vQuery.IsEmpty then
    if Application.MessageBox(PChar('Já existe um modelo salvo com o mesmo nome informado' + #13 +
      'Deseja continuar mesmo assim?'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
      Exit;

  try

    vDataSetResult.DisableControls;

    vQuery.Close;
    vQuery.SQL.Text := 'delete from CONFIG_COLUNAS' +
      ' where EXCEL_TITULO = ' + QuotedStr(vNomeModelo) +
      ' and USUARIO = ' + QuotedStr(vNomeUsuario) +
      ' and COMPONENTE like ' + QuotedStr(vDataSetTabela.Name + '@%' ) ;
    vQuery.ExecSQL;
         
    vQuery.Close;
    vQuery.SQL.Text := 'select cod from incrementa_codigo( 1, ''TMPCONF_COL'')';
    vQuery.Open;
    j := vQuery.FieldByName('COD').AsInteger;

    vQuery.Close;
    vQuery.SQL.Text := 'INSERT INTO CONFIG_COLUNAS ( USUARIO, COMPONENTE, CAMPOS, VISIVEL, ORDEM, LARGURA_EXIBICAO, EXCEL_TITULO, EXCEL_FORMAT )' +
      ' VALUES ( :USUARIO, :COMPONENTE, :CAMPOS, :VISIVEL, :ORDEM, :LARGURA_EXIBICAO, :EXCEL_TITULO, :EXCEL_FORMAT )';

    vDataSetResult.Filtered := False;
    vDataSetResult.First;
    while not vDataSetResult.Eof do
    begin
      vQuery.ParamByName('USUARIO').AsString := vDataSetResult.FieldByName('USUARIO').AsString;
      vQuery.ParamByName('COMPONENTE').AsString := vDataSetTabela.Name + '@' + IntToStr(j);
      vQuery.ParamByName('CAMPOS').AsString := vDataSetResult.FieldByName('CAMPOS').AsString;
      vQuery.ParamByName('VISIVEL').AsInteger := vDataSetResult.FieldByName('VISIVEL').AsInteger;
      vQuery.ParamByName('ORDEM').AsInteger := vDataSetResult.FieldByName('ORDEM').AsInteger;
      vQuery.ParamByName('LARGURA_EXIBICAO').Value := vDataSetResult.FieldByName('LARGURA_EXIBICAO').Value;
      vQuery.ParamByName('EXCEL_TITULO').AsString := vNomeModelo;
      vQuery.ParamByName('EXCEL_FORMAT').AsString := vDataSetResult.FieldByName('EXCEL_FORMAT').AsString;
      vQuery.ExecSQL;
      vDataSetResult.Next;
    end;

    if vQuery.Transaction.InTransaction then
      vQuery.Transaction.Commit;

    vQuery.Close;
    vQuery.SQL.Text := 'select distinct EXCEL_TITULO from CONFIG_COLUNAS' +
      ' where EXCEL_TITULO is not null' +
      ' and USUARIO = ' + QuotedStr(vNomeUsuario) +
      ' and COMPONENTE like ' + QuotedStr(vDataSetTabela.Name + '@%' )  +
      ' order by 1';
    vQuery.Open;

    ListBox1.Clear;
    ListBox1.Items.Add('Padrao');
    vQuery.First;
    while not vQuery.Eof do
    begin
      ListBox1.Items.Add(vQuery.FieldByName('excel_titulo').AsString);
      if vQuery.FieldByName('excel_titulo').AsString = vNomeModelo then
        J := vQuery.RecNo;
      vQuery.Next;
    end;
    if ListBox1.Items.Count >= J then
      ListBox1.ItemIndex := J - 1;
  finally
    verificaFiltro;
    vDataSetResult.EnableControls;
  end;
end;

procedure TfrmColunasExcel.BitBtn2Click(Sender: TObject);
begin
  inherited;
  ModalResult := IDCANCEL;
end;

procedure TfrmColunasExcel.BitBtn3Click(Sender: TObject);
begin
  inherited;
  exportarParaExcel;
  ModalResult := IDOK;
end;

procedure TfrmColunasExcel.btCorFonteClick(Sender: TObject);
begin
  inherited;
  if ColorDialog1.Execute then
    btCorFonte.Font.Color := ColorDialog1.Color;
  aplicaConfiguracaoNoDataSet;
end;

procedure TfrmColunasExcel.SpeedButton13Click(Sender: TObject);
begin
  inherited;
  ordenarColuna(tdUp);
end;

procedure TfrmColunasExcel.SpeedButton14Click(Sender: TObject);
begin
  inherited;
  ordenarColuna(tdDown);
end;

procedure TfrmColunasExcel.SpeedButton1Click(Sender: TObject);
var
  I: Integer;
begin
  inherited;
//  for I := 0 to vDataSetTabela.FieldCount - 1 do
//    if FindComponent(vDataSetTabela.Fields[I].Name) <> nil then
//      TCheckBox(FindComponent(vDataSetTabela.Fields[I].Name)).Checked := True;
  I := vDataSetResult.FieldByName('ORDEM').AsInteger;
  try
    vDataSetResult.DisableControls;
    vDataSetResult.First;
    while not vDataSetResult.Eof do
    begin
      if (vDataSetResult.FieldByName('FIELDNAME').AsString <> '@Titulo') and (vDataSetResult.FieldByName('VISIVEL').AsInteger = 0) then
      begin
        vDataSetResult.Edit;
        vDataSetResult.FieldByName('VISIVEL').AsInteger := 1;
        vDataSetResult.Post;
      end;
      vDataSetResult.Next;
    end;
  finally
    vDataSetResult.EnableControls;
    vDataSetResult.Locate('VISIVEL', I, []);
  end;
end;

procedure TfrmColunasExcel.SpeedButton2Click(Sender: TObject);
var
  I: Integer;
begin
  inherited;
//  for I := 0 to vDataSetTabela.FieldCount - 1 do
//    if FindComponent(vDataSetTabela.Fields[I].Name) <> nil then
//      TCheckBox(FindComponent(vDataSetTabela.Fields[I].Name)).Checked := False;
  I := vDataSetResult.FieldByName('ORDEM').AsInteger;
  try
    vDataSetResult.DisableControls;
    vDataSetResult.First;
    while not vDataSetResult.Eof do
    begin
      if (vDataSetResult.FieldByName('FIELDNAME').AsString <> '@Titulo') and (vDataSetResult.FieldByName('VISIVEL').AsInteger = 1) then
      begin
        vDataSetResult.Edit;
        vDataSetResult.FieldByName('VISIVEL').AsInteger := 0;
        vDataSetResult.Post;
      end;
      vDataSetResult.Next;
    end;
  finally
    vDataSetResult.EnableControls;
    vDataSetResult.Locate('VISIVEL', I, []);
  end;
end;

procedure TfrmColunasExcel.SpeedButton3Click(Sender: TObject);
var
  I: Integer;
begin
  inherited;
//  for I := 0 to vDataSetTabela.FieldCount - 1 do
//    if FindComponent(vDataSetTabela.Fields[I].Name) <> nil then
//      TCheckBox(FindComponent(vDataSetTabela.Fields[I].Name)).Checked := not TCheckBox(FindComponent(vDataSetTabela.Fields[I].Name)).Checked;
  I := vDataSetResult.FieldByName('ORDEM').AsInteger;
  try
    vDataSetResult.DisableControls;
    vDataSetResult.First;
    while not vDataSetResult.Eof do
    begin
      if (vDataSetResult.FieldByName('FIELDNAME').AsString <> '@Titulo') then
      begin
        vDataSetResult.Edit;
        if vDataSetResult.FieldByName('VISIVEL').AsInteger = 1 then
          vDataSetResult.FieldByName('VISIVEL').AsInteger := 0
        else
          vDataSetResult.FieldByName('VISIVEL').AsInteger := 1;
        vDataSetResult.Post;
      end;
      vDataSetResult.Next;
    end;
  finally
    vDataSetResult.EnableControls;
    vDataSetResult.Locate('VISIVEL', I, []);
  end;
end;

procedure TfrmColunasExcel.vDataSetReultAfterScroll(DataSet: TDataSet);
begin
  aplicaConfiguracaoNosComponentes(vDataSetResult.FieldByName('EXCEL_FORMAT').AsString);
end;

procedure TfrmColunasExcel.verificaFiltro;
begin
  if Trim(Edit1.Text) = '' then
    vDataSetResult.Filtered := False
  else
  begin
    vDataSetResult.Filter := 'Upper(DISPLAY) LIKE ''%' + UpperCase(Trim(Edit1.Text)) + '%''' +
      ' or Lower(DISPLAY) LIKE ''%' + LowerCase(Trim(Edit1.Text)) + '%''' +
      ' or DISPLAY LIKE ''%' + Trim(Edit1.Text) +'%''';
    vDataSetResult.Filtered := True;
  end;
  if vDataSetResult.IndexFieldNames <> 'ORDEM' then
    vDataSetResult.IndexFieldNames := 'ORDEM';
end;

procedure TfrmColunasExcel.btNegritoClick(Sender: TObject);
begin
  inherited;
  if fsBold in btNegrito.Font.Style then
    btNegrito.Font.Style := btNegrito.Font.Style - [fsBold]
  else
    btNegrito.Font.Style := btNegrito.Font.Style + [fsBold];
  aplicaConfiguracaoNoDataSet;
end;

procedure TfrmColunasExcel.CheckBoxCamposClick(Sender: TObject);
var
  vOrdem, vCount: Integer;
begin
  vOrdem := -1;
  try
    vDataSetResult.DisableControls;
    if not vDataSetResult.IsEmpty then
    begin
      vOrdem := vDataSetResult.FieldByName('ordem').AsInteger;
      vCount := vDataSetResult.RecordCount;
    end;

    vDataSetResult.Filter := 'CAMPOS = ' + QuotedStr(TCheckBox(Sender).Name);
    vDataSetResult.Filtered := True;
    if vDataSetResult.IsEmpty then
      Exit;

    vDataSetResult.Edit;
    if TCheckBox(Sender).Checked then
      vDataSetResult.FieldByName('VISIVEL').AsInteger := 1
    else
      vDataSetResult.FieldByName('VISIVEL').AsInteger := 0;
    vDataSetResult.Post;
    vOrdem := vDataSetResult.FieldByName('ORDEM').AsInteger;
  finally
    vDataSetResult.EnableControls;
    vDataSetResult.Filter := 'VISIVEL = 1';
    vDataSetResult.Filtered := True;
    if vOrdem >= 0 then
      vDataSetResult.Locate('ORDEM', vOrdem, []);
  end;
end;

end.
