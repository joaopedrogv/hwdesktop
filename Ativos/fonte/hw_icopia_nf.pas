unit hw_icopia_nf;

interface

uses
  hw_const_types,
  hw_copia_nf_models,
  DB;

type

  IClipBoardItem = interface
  ['{D1179896-B7F1-42A6-93C7-D6567DC687BE}']
    function GetNota: TNFModel;
    procedure SetNota(const Value: TNFModel);
    function GetProds: TNFProdList;
    procedure SetProds(const Value: TNFProdList);

    property Nota: TNFModel read GetNota write SetNota;
    property Prods: TNFProdList read GetProds write SetProds;
  end;

  IClipBoardItems = array of IClipBoardItem;

  IClipBoardCopiador = interface
  ['{82FE18A4-8E87-453D-9AD1-47AF9471CB08}']        
    function GetNota: TNFModel;
    function GetProds: TNFProdList;
    function GetCount: Integer;
    function GetItems(Index: Integer): IClipBoardItem;
    procedure SetItems(Index: Integer; const Value: IClipBoardItem);
    function Add(Value: IClipBoardItem): IClipBoardCopiador;
    function NewItem(): IClipBoardItem;
    function FindProd(nfId, nitemNf: Integer; out indexProd: Integer): IClipBoardItem;
    procedure Delete(const Index: Integer; ACount: Integer = 1);
    property Items[Index: Integer]: IClipBoardItem read GetItems write SetItems;
    property Nota: TNFModel read GetNota;
    property Prods: TNFProdList read GetProds;
    property Count: Integer read GetCount;
  end;

  ICopiadorNF = interface
  ['{35053C02-2AF1-44CE-ADBD-56F6D4522AA1}']  
    function GetClipBoardNF: IClipBoardCopiador;
    procedure SetClipBoardNF(const Value: IClipBoardCopiador);
    function CopyFrom(dsetNF, dsetItemNF: TDataSet; ALogEvent: TLogEvent; recNoDtsNF: Integer = 0): Boolean;
    function NewCopy(props: TNewCopyProps): IClipBoardItem;

    property ClipBoardNF: IClipBoardCopiador read GetClipBoardNF write SetClipBoardNF;
  end;

implementation

end.
