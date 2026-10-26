unit TableFieldsEtd;

interface

type
  TTableFields = class
  private
    Fname     : string;
    Fntype    : Integer;
    Fsubtype  : Integer;
    Fftype    : string;
    Ffsize    : Integer;
    Fispk     : Integer;
    Fisfk     : Integer;
    Ffposition: Integer;
  public
    property name     : string  read Fname      write Fname;
    property ntype    : Integer read Fntype     write Fntype;
    property subtype  : Integer read Fsubtype   write Fsubtype;
    property ftype    : string  read Fftype     write Fftype;
    property fsize    : Integer read Ffsize     write Ffsize;
    property ispk     : Integer read Fispk      write Fispk;
    property isfk     : Integer read Fisfk      write Fisfk;
    property fposition: Integer read Ffposition write Ffposition;
  end;

implementation

end.
