unit MonofasiaModelUnit;

interface

uses
  MonofasiaPadraoModelUnit,
  MonofasiaRetencaoModelUnit,
  MonofasiaRetidoAnteriormenteModelUnit,
  MonofasiaDiferimentoModelUnit;

type
  MonofasiaModel = class
  private
    FGMonoPadrao: MonofasiaPadraoModel;
    FGMonoReten: MonofasiaRetencaoModel;
    FGMonoRet: MonofasiaRetidoAnteriormenteModel;
    FGMonoDif: MonofasiaDiferimentoModel;
    FVTotIBSMonoItem: Currency;
    FVTotCBSMonoItem: Currency;
  public
    constructor Create(
      AGMonoPadrao: MonofasiaPadraoModel;
      AGMonoReten: MonofasiaRetencaoModel;
      AGMonoRet: MonofasiaRetidoAnteriormenteModel;
      AGMonoDif: MonofasiaDiferimentoModel;
      VTotIBSMonoItem: Currency;
      VTotCBSMonoItem: Currency
    );

    property GMonoPadrao: MonofasiaPadraoModel read FGMonoPadrao;
    property GMonoReten: MonofasiaRetencaoModel read FGMonoReten;
    property GMonoRet: MonofasiaRetidoAnteriormenteModel read FGMonoRet;
    property GMonoDif: MonofasiaDiferimentoModel read FGMonoDif;

    property VTotIBSMonoItem: Currency read FVTotIBSMonoItem;
    property VTotCBSMonoItem: Currency read FVTotCBSMonoItem;
  end;

implementation

{ MonofasiaModel }

constructor MonofasiaModel.Create(
  AGMonoPadrao: MonofasiaPadraoModel;
  AGMonoReten: MonofasiaRetencaoModel;
  AGMonoRet: MonofasiaRetidoAnteriormenteModel;
  AGMonoDif: MonofasiaDiferimentoModel;
  VTotIBSMonoItem: Currency;
  VTotCBSMonoItem: Currency
);
begin
  FGMonoPadrao := AGMonoPadrao;
  FGMonoReten := AGMonoReten;
  FGMonoRet := AGMonoRet;
  FGMonoDif := AGMonoDif;
  FVTotIBSMonoItem := VTotIBSMonoItem;
  FVTotCBSMonoItem := VTotCBSMonoItem;
end;

end.