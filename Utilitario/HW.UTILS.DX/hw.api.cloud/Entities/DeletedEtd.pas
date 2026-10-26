unit DeletedEtd;

interface

type
  TDeleted = class
  private
    Fid: Integer;
    FempresaId: Integer;
    Ftable: string;
    FfieldsPK: string;
    FvaluesPK: string;
  published
    property id: Integer read Fid write Fid;
    property empresaId: Integer read FempresaId write FempresaId;
    property table: string read Ftable write Ftable;
    property fieldsPK: string read FfieldsPK write FfieldsPK;
    property valuesPK: string read FvaluesPK write FvaluesPK;
  end;

implementation

end.
