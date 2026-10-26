unit TipoComunsUnit;

interface

const
  NULL_NUMBER = 0.00;

type
  RecordInstance = (riUnassigned, riNull, riNotNull);

  YesNoEnum = (ynNo, ynYes);

  TArrayString = array of string;

  TArrayInteger = array of Integer;

  TArrayBoolean = array of Boolean;

  {$IFDEF VER180}
  TDate = TDateTime;
  {$ENDIF}

const
  YesNoEnumStr: array[YesNoEnum] of string = ('Não', 'Sim');
  YesNoEnumGridStr: array[YesNoEnum] of string = ('0 - Não', '1 - Sim');

implementation

end.
