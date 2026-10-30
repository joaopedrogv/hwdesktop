unit ModernCadastroFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Registry, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls, Buttons, Grids, DBGrids, Mask,
  FilterFR, FilterPadraoFR, uCadPadraoModal, hw_audit_utils, 
  IUIFormValidatorUnit, ValidationEntityOutputUnit, DataSetGrid;

type
  TModernCadastroForm = class(TfrmCadPadraoM)
    FiltroGrid: TFilterFramePadrao;
  protected
    FFormValidator: IUIFormValidator;
    FAuditor: TAudit_OOP;
  protected
    procedure ExibirValidacoes(const AValidacoes: ValidationEntityOutput);
    procedure ExibirErro(AErro: Exception);
    procedure ExibirInformacao(const AMensagem: string);
    procedure ExibirAtencao(const AMensagem: string);

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

procedure TModernCadastroForm.SetupDataSetGrid(ADataSet: TDataSetGrid);
begin
  DBGrid1.DataSource := ADataSet._dataSourceOOP;

  setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
end;

end.

