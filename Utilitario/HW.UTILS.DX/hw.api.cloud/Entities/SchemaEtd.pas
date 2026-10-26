unit SchemaEtd;

interface

type
  TSchema = class
  private
    Ftable : string;
    Ffields: string;
    Forder : integer;
  public
    property table : string read Ftable write Ftable;
    property fields: string read Ffields write Ffields;
    property order : integer read Forder write Forder;
  end;

implementation

end.
