unit hw_const_types;

interface

uses
  SysUtils;

type
  TMessageDlgType = (mdtNone, mdtInfo, mdtError, mdtQuestion, mdtWarning);
  TLogEvent = procedure(const Value: string) of object;

  ValidacaoException = class(Exception)
  end;

implementation

end.
