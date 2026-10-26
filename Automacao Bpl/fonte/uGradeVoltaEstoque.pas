unit uGradeVoltaEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, uDataSet_OOP,
  DB;

type
  TVoltaEstoqueGradeModel = class
  private
    Fgrade: Integer;
    Fquantidade: Double;
  published
    property grade: Integer read Fgrade write Fgrade;
    property quantidade: Double read Fquantidade write Fquantidade;
  end;

  TVoltaEstoqueGradeModelArray = array of TVoltaEstoqueGradeModel;

  TVoltaEstoqueModel = class
  private
    Fgrupo: Integer;
    Fcodigo: string;
    Fnumfab: string;
    Fquantidade: Double;
    Fdescricao: string;
    Fgrades: TVoltaEstoqueGradeModelArray;
  published
    property grupo: Integer read Fgrupo write Fgrupo;
    property codigo: string read Fcodigo write Fcodigo;
    property numfab: string read Fnumfab write Fnumfab;
    property descricao: string read Fdescricao write Fdescricao;
    property quantidade: Double read Fquantidade write Fquantidade;

    property grades: TVoltaEstoqueGradeModelArray read Fgrades write Fgrades;
  end;

  TVoltaEstoqueOOP = class(TDataSet_OOP)
  public
    function Inicializar(grupo: Integer; codProd: string): Boolean;
  end;

  TfrmGradeVoltaEstoque = class(TfrmPadrao)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    lbGrupoCodigo: TLabel;
    lbDescricaoProd: TLabel;
    lbQtdeSai: TLabel;
    lbFalta: TLabel;
    Panel4: TPanel;
    DBGrid13: TDBGrid;
    Panel5: TPanel;
    Label2: TLabel;
    BitBtn118: TBitBtn;
    BitBtn77: TBitBtn;
    BitBtn1: TBitBtn;
    procedure BitBtn118Click(Sender: TObject);
    procedure BitBtn77Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid13KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid13ColExit(Sender: TObject);
    procedure DBGrid13ColEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    Fproduto: TVoltaEstoqueModel;
    dataEstoque: TVoltaEstoqueOOP;
    procedure UpdateLabelFalta;
  public
    property produto: TVoltaEstoqueModel read Fproduto write Fproduto;
  end;

var
  frmGradeVoltaEstoque: TfrmGradeVoltaEstoque;

implementation

uses
  uDtmAtivo, Math;

{$R *.dfm}

{ TfrmGradeVoltaEstoque }

procedure TfrmGradeVoltaEstoque.BitBtn118Click(Sender: TObject);
var
  qtde, dif: Double;
  grades : TVoltaEstoqueGradeModelArray;
begin
  dataEstoque.prepare_loop();
  qtde := 0;
  try
    while not dataEstoque.Eof do
    begin
      qtde := qtde + dataEstoque.ffloat('quantidade');

      dataEstoque.Next;
    end;

    if RoundTo(produto.quantidade, -3) <> RoundTo(qtde, -3) then
      raise Exception.Create(Format('Quantidade difere da esperada' + sLineBreak +
                                    'Quantidade esperada: %0.3f' + sLineBreak +
                                    'Quantidade informada: %0.3f',
                                    [produto.quantidade, qtde]));

    dif := produto.quantidade - qtde;

    SetLength(grades, 0);

    dataEstoque.First;
    while not dataEstoque.Eof do
    begin
      SetLength(grades,  Length(grades) + 1);
      grades[High(grades)] := TVoltaEstoqueGradeModel.Create;
      grades[High(grades)].grade := dataEstoque.fint('cod_grade');
      grades[High(grades)].quantidade := dataEstoque.ffloat('quantidade');

      dataEstoque.Next;
    end;

    if Length(grades) > 0 then
      grades[High(grades)].quantidade := grades[High(grades)].quantidade + dif;

    produto.grades := grades; 

  finally
    dataEstoque.prepare_loop_done();
  end;

  ModalResult := IDOK;
end;

procedure TfrmGradeVoltaEstoque.BitBtn1Click(Sender: TObject);
begin
  inherited;
  dataEstoque.Inicializar(produto.grupo, produto.codigo);
  UpdateLabelFalta;
end;

procedure TfrmGradeVoltaEstoque.BitBtn77Click(Sender: TObject);
begin
  inherited;
  ModalResult := IDCANCEL;
end;

procedure TfrmGradeVoltaEstoque.DBGrid13ColEnter(Sender: TObject);
begin
  inherited;
  if DBGrid13.SelectedField.FieldName = 'QUANTIDADE' then
  begin
    DBGrid13.Options := [dgEditing, dgTitles,dgIndicator,dgColumnResize,dgRowLines,dgTabs,dgConfirmDelete,dgCancelOnExit,dgMultiSelect];
    DBGrid13.DataSource.AutoEdit := True;
  end;
end;

procedure TfrmGradeVoltaEstoque.DBGrid13ColExit(Sender: TObject);
begin
  inherited;
  if DBGrid13.SelectedField.FieldName = 'QUANTIDADE' then
  begin
    DBGrid13.Options := [dgTitles,dgIndicator,dgColumnResize,dgRowLines,dgTabs,dgConfirmDelete,dgCancelOnExit,dgMultiSelect];
    DBGrid13.DataSource.AutoEdit := False;
    UpdateLabelFalta;
  end;
end;

procedure TfrmGradeVoltaEstoque.DBGrid13KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    UpdateLabelFalta;
    if (Self.Enabled) and (Self.Visible) and (BitBtn118.CanFocus) then
    	BitBtn118.SetFocus;
  end
  else if (key = VK_UP) or (key = VK_DOWN) then
    UpdateLabelFalta;
end;

procedure TfrmGradeVoltaEstoque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dataEstoque.Free;
  Action := caFree;
  frmGradeVoltaEstoque := nil;
end;

procedure TfrmGradeVoltaEstoque.FormShow(Sender: TObject);
begin
  inherited;
  lbGrupoCodigo.Caption := Format('Produto Grupo/codigo/numfab : %d - %s - %s', [produto.grupo, produto.codigo, produto.numfab]);
  lbDescricaoProd.Caption := produto.descricao;
  lbQtdeSai.Caption := Format('Sair com a quantidade de %0.3f', [produto.quantidade]);
  lbFalta.Caption := Format('Falta %0.3f', [produto.quantidade]);

  dataEstoque := TVoltaEstoqueOOP.Create(dtmAtivo.bancoHw);
  dataEstoque.Inicializar(produto.grupo, produto.codigo);
  DBGrid13.DataSource := dataEstoque._dataSourceOOP;
//  dataEstoque.on

end;

procedure TfrmGradeVoltaEstoque.UpdateLabelFalta;
var
  qtde, falta: Double;
begin
  if dataEstoque.dataSet.State = dsEdit then
  begin
    if dataEstoque.fempty('cod_grade') then
      dataEstoque.dataSet.Cancel
    else
      dataEstoque.dataSet.Post;
  end;
  
  dataEstoque.prepare_loop();
  qtde := 0;
  try
    while not dataEstoque.Eof do
    begin
      qtde := qtde + dataEstoque.ffloat('quantidade');

      dataEstoque.Next;
    end;

    falta := produto.quantidade - qtde;
    lbFalta.Caption := Format('Falta %0.3f', [falta]);

  finally
    dataEstoque.prepare_loop_done();
  end;
end;

{ TVoltaEstoqueOOP }

function TVoltaEstoqueOOP.Inicializar(
  grupo: Integer; codProd: string): Boolean;
begin
  ClientOpen('select gp.cod_grade, g.descricao, g.descricao1, 0.0000 quantidade from cod_grade_prod gp' +
             ' inner join grade g on g.cod_grade = gp.cod_grade and g.cod_empresa = gp.cod_empresa' +
             ' where gp.grupo_prod = %d and gp.cod_prod = ''%s'' and gp.cod_empresa = %d' +
             ' order by gp.cod_grade', [grupo, codProd, vDadosIni.cod_empresa]);
  dataSet.FieldByName('cod_grade').DisplayLabel := 'Cod Grade';
  dataSet.FieldByName('descricao').DisplayLabel := 'Descrição 1';
  dataSet.FieldByName('descricao1').DisplayLabel := 'Descrição 2';
  dataSet.FieldByName('quantidade').DisplayLabel := 'Quantidade';
  _dataSourceOOP.AutoEdit := True;
end;

end.
