unit ModernCadastroFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Registry, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls, Buttons, Grids, DBGrids, Mask,
  FilterFR, FilterPadraoFR, uCadPadraoModal, hw_audit_utils, 
  IUIFormValidatorUnit, ValidationEntityOutputUnit, DataSetGrid;

type
  // Cadastro com FiltroGrid: o FormShow preserva a inicializacao ancestral e
  // centraliza a ocultacao dos filtros legados, sem repeti-la nos descendentes.
  TModernCadastroForm = class(TfrmCadPadraoM)
    FiltroGrid: TFilterFramePadrao;
    procedure FormShow(Sender: TObject);
  protected
    FFormValidator: IUIFormValidator;
    FAuditor: TAudit_OOP;
  protected
    procedure ExibirValidacoes(const AValidacoes: ValidationEntityOutput);
    procedure ExibirErro(AErro: Exception);
    procedure ExibirInformacao(const AMensagem: string);
    procedure ExibirAtencao(const AMensagem: string);

    // Liga o datasource e prepara a configuracao legada; nao cria nem possui ADataSet.
    // Nao substitui Setup/ConfigFields nem DbGridConfigUtils.ApplyToDBGrid.
    procedure SetupDataSetGrid(ADataSet: TDataSetGrid);
  end;

var
  ModernCadastroForm: TModernCadastroForm;

implementation

{$R *.dfm}

uses
  uDtmAtivo, UIUtilsUnit;

{ TModernCadastroForm }

procedure TModernCadastroForm.ExibirAtencao(const AMensagem: string);
begin
  UIUtils.ShowAtention(AMensagem);
end;

procedure TModernCadastroForm.ExibirErro(AErro: Exception);
begin
  UIUtils.HandleError(AErro);
end;

procedure TModernCadastroForm.ExibirInformacao(const AMensagem: string);
begin
  UIUtils.ShowInfo(AMensagem);
end;

procedure TModernCadastroForm.ExibirValidacoes(const AValidacoes: ValidationEntityOutput);
begin
  FFormValidator.Validate(AValidacoes);
end;

procedure TModernCadastroForm.FormShow(Sender: TObject);
begin
  inherited;
  // O DFM ja desativa/oculta estes controles, substituidos por FiltroGrid.
  // O FormShow legado pode reexibi-los (ex.: MaskEdit3 na pesquisa por Todos).
  // Reaplicar apos inherited centraliza a ocultacao; nao repetir nos formularios filhos.
  MaskEdit1.Visible := False;
  MaskEdit2.Visible := False;
  MaskEdit3.Visible := False;
  ComboBox1.Visible := False;
  ComboBox2.Visible := False;
  ComboBox3.Visible := False;
end;

procedure TModernCadastroForm.SetupDataSetGrid(ADataSet: TDataSetGrid);
begin
  DBGrid1.DataSource := ADataSet._dataSourceOOP;

  setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
end;

end.

