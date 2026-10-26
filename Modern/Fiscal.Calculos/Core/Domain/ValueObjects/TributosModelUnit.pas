unit TributosModelUnit;

interface

uses
  ImpostoSeletivoModelUnit,
  CBSModelUnit,
  GrupoIBSCBSModelUnit,
  IBSUFModelUnit,
  IBSMunModelUnit,
  MonofasiaModelUnit,
  TributacaoRegularModelUnit,
  IBSCBSModelUnit;

type
  TributosModel = class
  private
    FIS: ImpostoSeletivoModel;
    FIBSCBS: IBSCBSModel;

    function GetIS: ImpostoSeletivoModel;

    function GetPossuiImpostoSeletivo: Boolean;
    function GetValorImpostoSeletivo: Currency;
    function GetPossuiBaseCalculoIBSCBS: Boolean;
    function GetValorBaseCalculoIBSCBS: Currency;
    function GetPossuiCbs: Boolean;
    function GetGCBS: CBSModel;
    function GetGrupoIBSCBS: GrupoIBSCBSModel;
    function GetPossuiIBSUF: Boolean;
    function GetPossuiIBSMun: Boolean;
    function GetGIBSMun: IBSMunModel;
    function GetPossuiMonofasia: Boolean;
    function GetGIBSCBSMono: MonofasiaModel;
    function GetPossuiTributacaoRegular: Boolean;
    function GetTributacaoRegular: TributacaoRegularModel;
    function GetGIBSUF: IBSUFModel;
    function GetPossuiCredPresIbs: Boolean;
    function GetPossuiCredPresCbs: Boolean;
    function GetPossuiCredPresCondSusIbs: Boolean;
    function GetVCredPresIbs: Currency;
    function GetVCredPresCondSusIbs: Currency;

  public
    constructor Create(
      const &IS: ImpostoSeletivoModel;
      IBSCBS: IBSCBSModel
    );
    destructor Destroy; override;

    property &IS: ImpostoSeletivoModel read GetIS;
    property IBSCBS: IBSCBSModel read FIBSCBS;

    property GrupoIBSCBS: GrupoIBSCBSModel read GetGrupoIBSCBS;
    property GCBS: CBSModel read GetGCBS;
    property GIBSUF: IBSUFModel read GetGIBSUF;
    property GIBSMun: IBSMunModel read GetGIBSMun;
    property GIBSCBSMono: MonofasiaModel read GetGIBSCBSMono;
    property TributacaoRegular: TributacaoRegularModel read GetTributacaoRegular;

    property PossuiIBSUF: Boolean read GetPossuiIBSUF;
    property PossuiIBSMun: Boolean read GetPossuiIBSMun;
    property PossuiCbs: Boolean read GetPossuiCbs;
    property PossuiMonofasia: Boolean read GetPossuiMonofasia;
    property PossuiTributacaoRegular: Boolean read GetPossuiTributacaoRegular;
    property PossuiCredPresIbs: Boolean read GetPossuiCredPresIbs;
    property PossuiCredPresCondSusIbs: Boolean read GetPossuiCredPresCondSusIbs;
    property PossuiCredPresCbs: Boolean read GetPossuiCredPresCbs;
    property PossuiImpostoSeletivo: Boolean read GetPossuiImpostoSeletivo;
    property PossuiBaseCalculoIBSCBS: Boolean read GetPossuiBaseCalculoIBSCBS;

    property ValorImpostoSeletivo: Currency read GetValorImpostoSeletivo;
    property ValorBaseCalculoIBSCBS: Currency read GetValorBaseCalculoIBSCBS;
    property VCredPresIbs: Currency read GetVCredPresIbs;
    property VCredPresCondSusIbs: Currency read GetVCredPresCondSusIbs;
  end;

implementation

{ TributosModel }

constructor TributosModel.Create(
  const &IS: ImpostoSeletivoModel;
  IBSCBS: IBSCBSModel
);
begin
  FIS := &IS;
  FIBSCBS := IBSCBS;
end;

function TributosModel.GetIS: ImpostoSeletivoModel;
begin
  Result := FIS;
end;

function TributosModel.GetPossuiImpostoSeletivo: Boolean;
begin
  Result := not FIS.IsNull();
end;

function TributosModel.GetValorImpostoSeletivo: Currency;
begin
  if GetPossuiImpostoSeletivo then
    Result := FIS.GetValorImpostoSeletivo
  else
    Result := 0.00;
end;

function TributosModel.GetVCredPresCondSusIbs: Currency;
begin
  if PossuiCredPresCondSusIbs then
    Result := IBSCBS.VCredPresCondSusIbs
  else
    Result := 0.00;
end;

function TributosModel.GetVCredPresIbs: Currency;
begin
  if PossuiCredPresIbs then
    Result := IBSCBS.VCredPresIbs
  else
    Result := 0.00;
end;

function TributosModel.GetPossuiCredPresCondSusIbs: Boolean;
begin
  Result := (IBSCBS <> nil) and (IBSCBS.PossuiCredPresCondSusIbs);
end;

function TributosModel.GetPossuiBaseCalculoIBSCBS: Boolean;
begin
  Result := FIBSCBS.PossuiBaseCalculoIBSCBS;
end;

function TributosModel.GetValorBaseCalculoIBSCBS: Currency;
begin
  if GetPossuiBaseCalculoIBSCBS then
    Result := FIBSCBS.ValorBaseCalculoIBSCBS
  else
    Result := 0.00;
end;

function TributosModel.GetPossuiCbs: Boolean;
begin
  Result := FIBSCBS.PossuiCbs;
end;

function TributosModel.GetPossuiCredPresCbs: Boolean;
begin
  Result := (IBSCBS <> nil) and (IBSCBS.PossuiCredPresCbs);
end;

function TributosModel.GetPossuiCredPresIbs: Boolean;
begin
  Result := (IBSCBS <> nil) and (IBSCBS.PossuiCredPresIbs);
end;

destructor TributosModel.Destroy;
begin
  FIBSCBS.Free();
  inherited;
end;

function TributosModel.GetGCBS: CBSModel;
begin
  Result := FIBSCBS.GCBS;
end;

function TributosModel.GetGrupoIBSCBS: GrupoIBSCBSModel;
begin
  Result := FIBSCBS.GrupoIBSCBS;
end;

function TributosModel.GetPossuiIBSUF: Boolean;
begin
  Result := FIBSCBS.PossuiIBSUF;
end;

function TributosModel.GetPossuiIBSMun: Boolean;
begin
  Result := FIBSCBS.PossuiIBSMun;
end;

function TributosModel.GetGIBSMun: IBSMunModel;
begin
  Result := FIBSCBS.GIBSMun;
end;

function TributosModel.GetGIBSUF: IBSUFModel;
begin
  Result := FIBSCBS.GIBSUF;
end;

function TributosModel.GetPossuiMonofasia: Boolean;
begin
  Result := FIBSCBS.PossuiMonofasia;
end;

function TributosModel.GetGIBSCBSMono: MonofasiaModel;
begin
  if GetPossuiMonofasia then
    Result := FIBSCBS.GIBSCBSMono
  else
    Result := nil;
end;

function TributosModel.GetPossuiTributacaoRegular: Boolean;
begin
  Result := FIBSCBS.PossuiTributacaoRegular;
end;

function TributosModel.GetTributacaoRegular: TributacaoRegularModel;
begin
  if GetPossuiTributacaoRegular then
    Result := FIBSCBS.TributacaoRegularModel;
end;

end.
