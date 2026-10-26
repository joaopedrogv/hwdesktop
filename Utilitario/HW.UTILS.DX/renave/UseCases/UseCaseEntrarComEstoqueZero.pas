unit UseCaseEntrarComEstoqueZero;

interface

uses
  BaseUseCaseRenave;

type

  TUseCaseEntrarComEstoqueZero = class(TUseCaseBaseRenave)
  public
    function Run: Boolean;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  Vcl.Forms,
  frmVeiculosZeroEntradaEstoque,
  hw_utils, RenaveRepo;

{ TUseCaseVeiculosZeroPendentes }

function TUseCaseEntrarComEstoqueZero.Run: Boolean;
begin

  try
    InitUseCase();

    var repo := TRenaveRepoSingleton.GetInstance();

    repo.InitAuditor(ParamsUC['userHW'], repo.CodEmpresa);
    repo.Auditor.Tabela := 'RENAVE';

    if not repo.Auditor.Processo('RNV002')
      .Visualizar.Permitido then
      Exit;

    Application.CreateForm(TformVeiculosZeroEntradaEstoque, formVeiculosZeroEntradaEstoque);
    formVeiculosZeroEntradaEstoque.useCaseBase := Self;
    if StrToIntDef(ParamsUC['nfId'], 0) > 0 then
      formVeiculosZeroEntradaEstoque.nfId := StrToIntDef(ParamsUC['nfId'], 0)
    else
    begin
      formVeiculosZeroEntradaEstoque.chassis := [];
      var list := NewStringList(True, ParamsUC['chassis'], ',');
      for var chassi in list do
        if not chassi.trim.IsEmpty then
          formVeiculosZeroEntradaEstoque.chassis :=
            formVeiculosZeroEntradaEstoque.chassis +
            [chassi.Trim];
    end;

    formVeiculosZeroEntradaEstoque.ShowModal;

    Result := True;

  except on E: Exception do
    begin
      Result := False;
      LastError := E.message;
      ShowAtencao(StrConcat(['Erro ao visualizar', _LB, _LB, E.Message]));
    end;
  end;

end;

end.
