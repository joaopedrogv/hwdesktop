unit ROCItemDomainUnit;

interface

uses
  TributosModelUnit,
  ImpostoSeletivoModelUnit,
  CbsModelUnit,
  GrupoIBSCBSModelUnit,
  IBSUfModelUnit,
  IBSMunModelUnit,
  MonofasiaModelUnit,
  TributacaoRegularModelUnit;

type
  /// <summary>
  ///   Equivale a ObjetoDomain.java
  /// </summary>
  // Java: source/src/main/java/br/gov/serpro/rtc/api/model/roc/ObjetoDomain.java
  ROCItemDomain = class
  private
    FNObj: Integer;
    FTribCalc: TributosModel;

    function GetPossuiImpostoSeletivo: Boolean;
    function GetImpostoSeletivo: ImpostoSeletivoModel;
    function GetValorImpostoSeletivo: Currency;
    function GetPossuiBaseCalculoIBSCBS: Boolean;
    function GetValorBaseCalculoIBSCBS: Currency;
    function GetPossuiCbs: Boolean;
    function GetGCBS: CbsModel;
    function GetPossuiCredPresCbs: Boolean;
    function GetPossuiCredPresIbs: Boolean;
    function GetPossuiCredPresCondSusIbs: Boolean;
    function GetVCredPresIbs: Currency;
    function GetVCredPresCondSusIbs: Currency;
    function GetGrupoIBSCBS: GrupoIBSCBSModel;
    function GetPossuiIBSUF: Boolean;
    function GetPossuiIBSMun: Boolean;
    function GetPossuiMonofasia: Boolean;
    function GetGIBSCBSMono: MonofasiaModel;
    function GetPossuiTributacaoRegular: Boolean;
    function GetTributacaoRegular: TributacaoRegularModel;
    function GetGIBSMun: IBSMunModel;
    function GetGIBSUF: IBSUfModel;

  public
    constructor Create(
      NObj: Integer;
      TribCalc: TributosModel
    );
    destructor Destroy(); override;

    property NObj: Integer read FNObj;
    property TribCalc: TributosModel read FTribCalc;

    property ImpostoSeletivoModel: ImpostoSeletivoModel read GetImpostoSeletivo;
    property GCBS: CbsModel read GetGCBS;
    property GrupoIBSCBSModel: GrupoIBSCBSModel read GetGrupoIBSCBS;
    property GIBSUF: IBSUfModel read GetGIBSUF;
    property GIBSMun: IBSMunModel read GetGIBSMun;
    property GIBSCBSMono: MonofasiaModel read GetGIBSCBSMono;
    property TributacaoRegularModel: TributacaoRegularModel read GetTributacaoRegular;

    property PossuiImpostoSeletivo: Boolean read GetPossuiImpostoSeletivo;
    property PossuiBaseCalculoIBSCBS: Boolean read GetPossuiBaseCalculoIBSCBS;
    property PossuiCbs: Boolean read GetPossuiCbs;
    property PossuiCredPresCbs: Boolean read GetPossuiCredPresCbs;
    property PossuiCredPresIbs: Boolean read GetPossuiCredPresIbs;
    property PossuiCredPresCondSusIbs: Boolean read GetPossuiCredPresCondSusIbs;
    property PossuiIBSUF: Boolean read GetPossuiIBSUF;
    property PossuiIBSMun: Boolean read GetPossuiIBSMun;
    property PossuiMonofasia: Boolean read GetPossuiMonofasia;
    property PossuiTributacaoRegular: Boolean read GetPossuiTributacaoRegular;

    property ValorImpostoSeletivo: Currency read GetValorImpostoSeletivo;
    property ValorBaseCalculoIBSCBS: Currency read GetValorBaseCalculoIBSCBS;
    property VCredPresIbs: Currency read GetVCredPresIbs;
    property VCredPresCondSusIbs: Currency read GetVCredPresCondSusIbs;

    function CompareTo(const Other: ROCItemDomain): Integer;
  end;

  ROCItens = array of ROCItemDomain;

implementation

{ ROCItemDomain }

constructor ROCItemDomain.Create(
  NObj: Integer;
  TribCalc: TributosModel
);
begin
  FNObj := NObj;
  FTribCalc := TribCalc;
end;

destructor ROCItemDomain.Destroy;
begin
  FTribCalc.Free;
  inherited;
end;

function ROCItemDomain.GetPossuiImpostoSeletivo: Boolean;
begin
  Result := FTribCalc.PossuiImpostoSeletivo;
end;

function ROCItemDomain.GetImpostoSeletivo: ImpostoSeletivoModel;
begin
  Result := FTribCalc.&IS;
end;

function ROCItemDomain.GetValorImpostoSeletivo: Currency;
begin
  if GetPossuiImpostoSeletivo then
    Result := FTribCalc.ValorImpostoSeletivo
  else
    Result := 0.00;
end;

function ROCItemDomain.GetPossuiBaseCalculoIBSCBS: Boolean;
begin
  Result := FTribCalc.PossuiBaseCalculoIBSCBS;
end;

function ROCItemDomain.GetValorBaseCalculoIBSCBS: Currency;
begin
  if GetPossuiBaseCalculoIBSCBS then
    Result := FTribCalc.ValorBaseCalculoIBSCBS
  else
    Result := 0.00;
end;

function ROCItemDomain.GetPossuiCbs: Boolean;
begin
  Result := FTribCalc.PossuiCbs;
end;

function ROCItemDomain.GetGCBS: CbsModel;
begin
  Result := FTribCalc.GCBS;
end;

function ROCItemDomain.GetPossuiCredPresCbs: Boolean;
begin
  Result := FTribCalc.PossuiCredPresCbs;
end;

function ROCItemDomain.GetPossuiCredPresIbs: Boolean;
begin
  Result := FTribCalc.PossuiCredPresIbs;
end;

function ROCItemDomain.GetPossuiCredPresCondSusIbs: Boolean;
begin
  Result := FTribCalc.PossuiCredPresCondSusIbs;
end;

function ROCItemDomain.GetVCredPresIbs: Currency;
begin
  if GetPossuiCredPresIbs then
    Result := FTribCalc.VCredPresIbs
  else
    Result := 0.00;
end;

function ROCItemDomain.GetVCredPresCondSusIbs: Currency;
begin
  if GetPossuiCredPresCondSusIbs then
    Result := FTribCalc.VCredPresCondSusIbs
  else
    Result := 0.00;
end;

function ROCItemDomain.GetGrupoIBSCBS: GrupoIBSCBSModel;
begin
  Result := FTribCalc.GrupoIBSCBS;
end;

function ROCItemDomain.GetPossuiIBSUF: Boolean;
begin
  Result := FTribCalc.PossuiIBSUF;
end;

function ROCItemDomain.GetPossuiIBSMun: Boolean;
begin
  Result := FTribCalc.PossuiIBSMun;
end;

function ROCItemDomain.GetPossuiMonofasia: Boolean;
begin
  Result := FTribCalc.PossuiMonofasia;
end;

function ROCItemDomain.GetGIBSCBSMono: MonofasiaModel;
begin
  if GetPossuiMonofasia then
    Result := FTribCalc.GIBSCBSMono
  else
    Result := nil;
end;

function ROCItemDomain.GetGIBSMun: IBSMunModel;
begin
  Result := FTribCalc.GIBSMun;
end;

function ROCItemDomain.GetGIBSUF: IBSUfModel;
begin
  Result := FTribCalc.GIBSUF;
end;

function ROCItemDomain.GetPossuiTributacaoRegular: Boolean;
begin
  Result := FTribCalc.PossuiTributacaoRegular;
end;

function ROCItemDomain.GetTributacaoRegular: TributacaoRegularModel;
begin
  if GetPossuiTributacaoRegular then
    Result := FTribCalc.TributacaoRegular
  else
    Result := TributacaoRegularModelUnit.TributacaoRegularModel.NullInstance();
end;

function ROCItemDomain.CompareTo(const Other: ROCItemDomain): Integer;
begin
  if FNObj < Other.FNObj then
    Result := -1
  else if FNObj > Other.FNObj then
    Result := 1
  else
    Result := 0;
end;

end.
