unit INFSeConverterUnit;

interface

uses
  SysUtils, Classes,
  ACBrNFSeXInterface, ACBrNFSeXNotasFiscais, DpsEmitirModelUnit, NFSeModelUnit, TributoDFeContextEtdUnit;

type
  INFSeConverter = interface
    ['{75C65465-44A3-4CC6-ACDC-476D378C5B95}']
    procedure ConverterParaACBr(
      const DpsEmitir: DpsEmitirModel;
      const Nota: TNotaFiscal
    );
    function ConververParaTributoDFe(
      const NotaERP: NFSeModel;
      const NotaWS: TNotaFiscal
    ): TributoDFeContextEtd;
  end;

implementation

end.
