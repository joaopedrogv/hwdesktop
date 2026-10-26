unit NFCeDataEtd;

interface

uses
  GenericDataEtd;

type
  TNFCeData = class
  private
    Fkeys         : TKeyWords;
    Fnfce         : TGenericRecord;
    Fdest         : TGenericRecord;
    Fitens        : TGenericListRecord;
    Fpagamentos   : TGenericListRecord;
    Finfadicionais: TGenericListRecord;
  published
    property keys         : TKeyWords read Fkeys write Fkeys;
    property nfce         : TGenericRecord read Fnfce write Fnfce;
    property dest         : TGenericRecord read Fdest write Fdest;
    property itens        : TGenericListRecord read Fitens write Fitens;
    property pagamentos   : TGenericListRecord read Fpagamentos write Fpagamentos;
    property infadicionais: TGenericListRecord read Finfadicionais write Finfadicionais;
  end;

implementation

end.
