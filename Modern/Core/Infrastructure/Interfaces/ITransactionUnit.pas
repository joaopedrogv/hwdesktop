unit ITransactionUnit;

interface

type
  ITransaction = class abstract
  public
    procedure Commit(); virtual; abstract;
    procedure Rollback();  virtual; abstract;
    function GetId(): string; virtual; abstract;
    procedure FreeTransaction();  virtual; abstract;
  end;

implementation

end.
