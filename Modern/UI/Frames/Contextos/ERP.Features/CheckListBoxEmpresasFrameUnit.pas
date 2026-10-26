unit CheckListBoxEmpresasFrameUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, CheckLst, EmpresaEtdUnit, ListarEmpresasUseCaseUnit,
  TipoComunsUnit;

type
  TCheckListBoxEmpresasFrame = class(TFrame)
    CheckListBoxEmpresas1: TCheckListBox;
  private
    EmpresasUsuario, TodasEmpresas: EmpresasEtd;
  public
    procedure Setup(CheckedIds: TArrayInteger; IsUpdate: Boolean);
    function GetIdsEmpresasSelecionadas(): TArrayInteger; 
    destructor Destroy; override;
  end;

implementation

uses
  uDtmAtivo,
  ContainerUnit, Contnrs, BaseClassUnit;

{$R *.dfm}

{ TCheckListBoxEmpresasFrame }

destructor TCheckListBoxEmpresasFrame.Destroy;
begin
  EmpresasUsuario.Free;
  TodasEmpresas.Free;
  inherited;
end;
                        
function TCheckListBoxEmpresasFrame.GetIdsEmpresasSelecionadas: TArrayInteger;
var
  I, Count: Integer;
  empresa: EmpresaEtd;
begin
  Count := 0;
  SetLength(Result, CheckListBoxEmpresas1.Items.Count);
  for I := 0 to CheckListBoxEmpresas1.Items.Count - 1 do
    if CheckListBoxEmpresas1.Checked[I] then
    begin
      Result[Count] := EmpresaEtd(CheckListBoxEmpresas1.Items.Objects[I]).Id;
      Inc(Count);
    end;

  SetLength(Result, Count);
end;

procedure TCheckListBoxEmpresasFrame.Setup(CheckedIds: TArrayInteger; IsUpdate: Boolean);
var
  I, J, empresaId: Integer;
  empresa: EmpresaEtd;
begin
  CheckListBoxEmpresas1.Clear;

  TodasEmpresas.Free;
  with Container.GetInstance().ErpFeaturesFactory
    .CreateListarTodasEmpresasUseCase()
  do
  try
    TodasEmpresas := Executar();
  finally
    FreeSafe();
  end;

  EmpresasUsuario.Free;
  with Container.GetInstance().ErpFeaturesFactory.CreateListarEmpresasPermitidasUseCase() do
  try
    EmpresasUsuario := Executar(vDadosIni.vNomeUsuario);
  finally
    FreeSafe();
  end;

  for I := 0 to TodasEmpresas.Count - 1 do
  begin
    empresa := EmpresaEtd(TodasEmpresas.Items[I]);

    CheckListBoxEmpresas1.AddItem( Format('%d - %s', [ empresa.Id, empresa.Identificacao ]), empresa);

    CheckListBoxEmpresas1.ItemEnabled[I] := False;
    CheckListBoxEmpresas1.Checked[I] := False;

    // habilitando apenas empresas permididas ao usuario
    for J := 0 to EmpresasUsuario.Count - 1 do
      if EmpresaEtd(EmpresasUsuario.Items[J]).Id = empresa.Id then
      begin
        CheckListBoxEmpresas1.ItemEnabled[I] := True;
        CheckListBoxEmpresas1.Checked[I] := not IsUpdate;
        Break;
      end;

    if IsUpdate then
      for J := Low(CheckedIds) to High(CheckedIds) do
        if CheckedIds[J] = empresa.Id then
          CheckListBoxEmpresas1.Checked[I] := True;
  end;
end;

end.
