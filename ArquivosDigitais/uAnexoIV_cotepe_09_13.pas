unit uAnexoIV_cotepe_09_13;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, Mask, ExtCtrls, DB, DBClient, Grids,
  DBGrids, ComCtrls, UClasseAdig;

type
  TfrmAnexoIV_registrosPAFECF = class(TfrmPadrao)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    cbTipoEstoque: TComboBox;
    BitBtn7: TBitBtn;
    Panel3: TPanel;
    GroupBox3: TGroupBox;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    cdsTemp: TClientDataSet;
    cdsTempnum_fab_prod: TStringField;
    cdsTempdescr_prod: TStringField;
    cdsTempgrupo_prod: TIntegerField;
    cdsTempcod_prod: TStringField;
    BitBtn1: TBitBtn;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    lbRegistrosDetalhes: TLabel;
    progressRegistrosDetalhes: TProgressBar;
    progressRegistros: TProgressBar;
    lbRegistros: TLabel;
    CheckBox1: TCheckBox;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAnexoIV_registrosPAFECF: TfrmAnexoIV_registrosPAFECF;
  obAnexoIV: TAnexoIV;

implementation

uses Funcoes, udtmativo;

{$R *.dfm}

procedure TfrmAnexoIV_registrosPAFECF.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if not cdsTemp.IsEmpty then
    cdsTemp.Delete;
end;

procedure TfrmAnexoIV_registrosPAFECF.BitBtn7Click(Sender: TObject);
var
  hdTemp: THandle;
  formulario: TForm;
begin
  inherited;
  try
    vDadosIni.vPesquisa := 'BUSCA_ESTOQUE_PARCIAL';
    try
      formulario := Funcoes.AbreForm('pkFiscal', 'TfrmPesqProdutos', hdTemp);
      try
        if formulario.ShowModal = IDOK then
          if vDadosIni.vPesquisa <> 'BUSCA_ESTOQUE_PARCIAL' then
            try
              if (vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) <> '0') and
                (vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2) <> '') and
                (vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 3) <> '') and
                (vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 4) <> '') then
              begin
                cdsTemp.Filter := 'grupo_prod = ' + vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) +
                  ' and cod_prod = ' + QuotedStr(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2));
                cdsTemp.Filtered := True;
                try
                  if cdsTemp.IsEmpty then
                  begin
                    cdsTemp.Insert;
                    cdsTemp.FieldByName('grupo_prod').AsInteger := StrToIntDef(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1), 0);
                    cdsTemp.FieldByName('cod_prod').AsString := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2);
                    cdsTemp.FieldByName('num_fab_prod').AsString := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 3);
                    cdsTemp.FieldByName('descr_prod').AsString := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 4);
                    cdsTemp.Post;
                  end;
                finally
                  cdsTemp.Filtered := False;
                end; 
              end;
            except
            end;
      finally
        formulario.Free;
        unLoadPackage(hdTemp);
      end;
    finally
      vDadosIni.vPesquisa := '';
    end;
  except
    vDadosIni.vPesquisa := '';
  end;
end;

procedure TfrmAnexoIV_registrosPAFECF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmAnexoIV_registrosPAFECF := nil;
end;

procedure TfrmAnexoIV_registrosPAFECF.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = VK_ESCAPE then
    SpeedButton1.Click
  else if Key = VK_F3 then
    SpeedButton2.Click;
end;

procedure TfrmAnexoIV_registrosPAFECF.FormShow(Sender: TObject);
begin
  inherited;
  MaskEdit1.Text := DateToStr(Date);
  MaskEdit2.Text := DateToStr(Date);
  try
    if cdsTemp.Tag <> 22 then
      cdsTemp.CreateDataSet;
    cdsTemp.Tag := 22;
  except
    cdsTemp.Tag := 0;
  end;
end;

procedure TfrmAnexoIV_registrosPAFECF.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  ModalResult := IDCANCEL;
end;

procedure TfrmAnexoIV_registrosPAFECF.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  try
    obAnexoIV := TAnexoIV.create;
    try
      obAnexoIV.dataInicial := MaskEdit1.Text;
      obAnexoIV.dataFinal := MaskEdit2.Text;
      obAnexoIV.progressRegistros := TProgressBar(progressRegistros);
      obAnexoIV.progressRegistrosDetalhes := TProgressBar(progressRegistrosDetalhes);
      obAnexoIV.labelRegistros := TLabel(lbRegistros);
      obAnexoIV.labelRegistrosDetalhes := TLabel(lbRegistrosDetalhes);
      if cbTipoEstoque.Text = 'Total' then
        obAnexoIV.tipoEstoque := eTotal
      else
        obAnexoIV.tipoEstoque := eParcial;
      obAnexoIV.dataSetEstoqueParcial := TClientDataSet(cdsTemp);

      if CheckBox1.Checked then
      obAnexoIV.montarArquivoMovimentoECF
      else
			obAnexoIV.montarArquivo;
//			obAnexoIV.montarArquivoMovimentoECF;
    finally
      obAnexoIV.Free;
      obAnexoIV := nil
    end;
  except
    on E: Exception do
    begin
      Application.MessageBox(PChar('Erro de execução. Erro: ' +e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

initialization
  RegisterClass(TfrmAnexoIV_registrosPAFECF);
finalization
  UnRegisterClass(TfrmAnexoIV_registrosPAFECF);

end.
