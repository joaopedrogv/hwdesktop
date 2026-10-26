unit IBSCBSModelUnit;

interface

uses
  GrupoIBSCBSModelUnit,
  MonofasiaModelUnit,
  TransferenciaCreditoModelUnit,
  AjusteCompetenciaModelUnit,
  EstornoCreditoModelUnit,
  CreditoPresumidoOperacaoModelUnit,
  CreditoPresumidoIBSZFMModelUnit,
  CBSModelUnit,
  IBSUFModelUnit,
  IBSMunModelUnit,
  TributacaoRegularModelUnit;

type

  IBSCBSModel = class
  private
    FCST: Integer;
    FCClassTrib: string;
    FGIBSCBS: GrupoIBSCBSModel;
    FGIBSCBSMono: MonofasiaModel;
    FGTransfCred: TransferenciaCreditoModel;
    FGAjusteCompet: AjusteCompetenciaModel;
    FGEstornoCred: EstornoCreditoModel;
    FGCredPresIBSZFM: CreditoPresumidoIBSZFMModel;
    FGCredPresOper: CreditoPresumidoOperacaoModel;

    function GetCST: Integer;
    function GetCClassTrib: string;
    function GetGIBSCBS: GrupoIBSCBSModel;
    function GetGIBSCBSMono: MonofasiaModel;
    function GetGTransfCred: TransferenciaCreditoModel;
    function GetGAjusteCompet: AjusteCompetenciaModel;
    function GetGEstornoCred: EstornoCreditoModel;
    function GetGCredPresOper: CreditoPresumidoOperacaoModel;
    function GetGCredPresIBSZFM: CreditoPresumidoIBSZFMModel;
    function GetValorBaseCalculoIBSCBS: Currency;
    function GetGIBSUF: IBSUFModel;
    function GetGIBSMun: IBSMunModel;
    function GetTributacaoRegular: TributacaoRegularModel;
    function GetGCBS: CbsModel;

    function GetPossuiBaseCalculoIBSCBS: Boolean;
    function GetPossuiCbs: Boolean;
    function GetPossuiIBSUF: Boolean;
    function GetPossuiIBSMun: Boolean;
    function GetPossuiMonofasia: Boolean;
    function GetPossuiTributacaoRegular: Boolean;
    function GetPossuiCredPresIbs: Boolean;
    function GetPossuiCredPresCbs: Boolean;
    function GetPossuiCredPresCondSusIbs: Boolean;
    function GetVCredPresIbs: Currency;
    function GetVCredPresCondSusIbs: Currency;

  public
    constructor Create(
      CST: Integer;
      const CClassTrib: string;
      GIBSCBS: GrupoIBSCBSModel;
      GIBSCBSMono: MonofasiaModel;
      const GTransfCred: TransferenciaCreditoModel;
      const GAjusteCompet: AjusteCompetenciaModel;
      const GEstornoCred: EstornoCreditoModel;
      const GCredPresOper: CreditoPresumidoOperacaoModel;
      const GCredPresIBSZFM: CreditoPresumidoIBSZFMModel
    );
    destructor Destroy; override;

    property CST: Integer read GetCST;
    property CClassTrib: string read GetCClassTrib;
    //property IndDoacao: Integer read FIndDoacao; // Criado na v0012, sem influencia em qualquer calculo
    property GIBSCBS: GrupoIBSCBSModel read GetGIBSCBS; // parece desnecessario se GrupoIBSCBS retorna FGIBSCBS, ou GrupoIBSCBS é desnecessario ja que tem GIBSCBSMono e nao tem GrupoMonofasia
    property GIBSCBSMono: MonofasiaModel read GetGIBSCBSMono;
    property GTransfCred: TransferenciaCreditoModel read GetGTransfCred;
    property GAjusteCompet: AjusteCompetenciaModel read GetGAjusteCompet;
    property GEstornoCred: EstornoCreditoModel read GetGEstornoCred;
    property GCredPresOper: CreditoPresumidoOperacaoModel read GetGCredPresOper;
    property GCredPresIBSZFM: CreditoPresumidoIBSZFMModel read GetGCredPresIBSZFM;

    property ValorBaseCalculoIBSCBS: Currency read GetValorBaseCalculoIBSCBS;
    property GCBS: CbsModel read GetGCBS;
    property GrupoIBSCBS: GrupoIBSCBSModel read FGIBSCBS;
    property GIBSUF: IBSUFModel read GetGIBSUF;
    property GIBSMun: IBSMunModel read GetGIBSMun;
    property TributacaoRegularModel: TributacaoRegularModel read GetTributacaoRegular;

    property PossuiBaseCalculoIBSCBS: Boolean read GetPossuiBaseCalculoIBSCBS;
    property PossuiCbs: Boolean read GetPossuiCbs;
    property PossuiIBSUF: Boolean read GetPossuiIBSUF;
    property PossuiIBSMun: Boolean read GetPossuiIBSMun;
    property PossuiMonofasia: Boolean read GetPossuiMonofasia;
    property PossuiTributacaoRegular: Boolean read GetPossuiTributacaoRegular;
    property PossuiCredPresIbs: Boolean read GetPossuiCredPresIbs;
    property PossuiCredPresCbs: Boolean read GetPossuiCredPresCbs;
    property PossuiCredPresCondSusIbs: Boolean read GetPossuiCredPresCondSusIbs;

    property VCredPresIbs: Currency read GetVCredPresIbs;
    property VCredPresCondSusIbs: Currency read GetVCredPresCondSusIbs;
  end;

implementation

{ IBSCBSModel }

constructor IBSCBSModel.Create(
  CST: Integer;
  const CClassTrib: string;
  GIBSCBS: GrupoIBSCBSModel;
  GIBSCBSMono: MonofasiaModel;
  const GTransfCred: TransferenciaCreditoModel;
  const GAjusteCompet: AjusteCompetenciaModel;
  const GEstornoCred: EstornoCreditoModel;
  const GCredPresOper: CreditoPresumidoOperacaoModel;
  const GCredPresIBSZFM: CreditoPresumidoIBSZFMModel
);
begin
  FCST := CST;
  FCClassTrib := CClassTrib;
  FGIBSCBS := GIBSCBS;
  FGIBSCBSMono := GIBSCBSMono;
  FGTransfCred := GTransfCred;
  FGAjusteCompet := GAjusteCompet;
  FGEstornoCred := FGEstornoCred;
  FGCredPresOper := GCredPresOper;
  FGCredPresIBSZFM := GCredPresIBSZFM;
end;

function IBSCBSModel.GetCST: Integer;
begin
  Result := FCST;
end;

destructor IBSCBSModel.Destroy;
begin
  FGIBSCBS.Free();
  FGIBSCBSMono.Free();
  inherited;
end;

function IBSCBSModel.GetCClassTrib: string;
begin
  Result := FCClassTrib;
end;

function IBSCBSModel.GetGIBSCBS: GrupoIBSCBSModel;
begin
  Result := FGIBSCBS;
end;

function IBSCBSModel.GetGIBSCBSMono: MonofasiaModel;
begin
  Result := FGIBSCBSMono;
end;

function IBSCBSModel.GetGTransfCred: TransferenciaCreditoModel;
begin
  Result := FGTransfCred;
end;

function IBSCBSModel.GetGAjusteCompet: AjusteCompetenciaModel;
begin
  Result := FGAjusteCompet;
end;

function IBSCBSModel.GetGCBS: CbsModel;
begin
  Result := FGIBSCBS.GCBS;
end;

function IBSCBSModel.GetGCredPresIBSZFM: CreditoPresumidoIBSZFMModel;
begin
  Result := FGCredPresIBSZFM;
end;

function IBSCBSModel.GetGCredPresOper: CreditoPresumidoOperacaoModel;
begin
  Result := FGCredPresOper;
end;

function IBSCBSModel.GetGEstornoCred: EstornoCreditoModel;
begin
  Result := FGEstornoCred;
end;

function IBSCBSModel.GetPossuiBaseCalculoIBSCBS: Boolean;
begin
  Result := FGIBSCBS.PossuiBaseCalculoIBSCBS;
end;

function IBSCBSModel.GetValorBaseCalculoIBSCBS: Currency;
begin
  if GetPossuiBaseCalculoIBSCBS then
    Result := FGIBSCBS.ValorBaseCalculoIBSCBS
  else
    Result := 0.00;
end;

function IBSCBSModel.GetVCredPresCondSusIbs: Currency;
begin
  if PossuiCredPresCondSusIbs then
    Result := GCredPresOper.GIbsCredPres.VCredPresCondSus
  else
    Result := 0.0;
end;

function IBSCBSModel.GetVCredPresIbs: Currency;
begin
  if PossuiCredPresIbs then
    Result := GCredPresOper.GIbsCredPres.VCredPres
  else
    Result := 0.0;
end;

function IBSCBSModel.GetPossuiCbs: Boolean;
begin
  Result := FGIBSCBS.PossuiCbs;
end;

function IBSCBSModel.GetPossuiCredPresCbs: Boolean;
begin
  Result := not FGCredPresOper.IsNull() and not FGCredPresOper.GCbsCredPres.IsNull();
end;

function IBSCBSModel.GetPossuiCredPresCondSusIbs: Boolean;
begin
  Result := (not FGCredPresOper.IsNull() )
    and (not FGCredPresOper.GIbsCredPres.IsNull())
    and (FGCredPresOper.GIbsCredPres.VCredPresCondSus > 0); // Na calculadora o teste é != null
end;

function IBSCBSModel.GetPossuiCredPresIbs: Boolean;
begin
  Result := not FGCredPresOper.IsNull() and not FGCredPresOper.GIbsCredPres.IsNull();
end;

function IBSCBSModel.GetPossuiIBSUF: Boolean;
begin
  Result := FGIBSCBS.PossuiIBSUF;
end;

function IBSCBSModel.GetPossuiIBSMun: Boolean;
begin
  Result := FGIBSCBS.PossuiIBSMun;
end;

function IBSCBSModel.GetGIBSUF: IBSUFModel;
begin
  Result := FGIBSCBS.GIBSUF;
end;

function IBSCBSModel.GetGIBSMun: IBSMunModel;
begin
  Result := FGIBSCBS.GIBSMun;
end;

function IBSCBSModel.GetPossuiMonofasia: Boolean;
begin
  Result := FGIBSCBSMono <> nil;
end;

function IBSCBSModel.GetPossuiTributacaoRegular: Boolean;
begin
  Result := FGIBSCBS.PossuiTributacaoRegular;
end;

function IBSCBSModel.GetTributacaoRegular: TributacaoRegularModel;
begin
  Result := FGIBSCBS.TributacaoRegular;
end;

end.
