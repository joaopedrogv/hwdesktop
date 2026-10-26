unit IBXTransactionLegacyUnit;

interface

uses                              
  ITransactionUnit,
  IBXTransactionBaseUnit;

type

  {$IFDEF INTF_ON}               
  IBXTransactionLegacy = class(IBXTransactionBase, ITransaction)
  {$ELSE}
  IBXTransactionLegacy = class(IBXTransactionBase)
  {$ENDIF}
  end;

implementation

end.
