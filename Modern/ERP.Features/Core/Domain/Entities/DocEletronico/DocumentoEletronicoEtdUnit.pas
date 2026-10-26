unit DocumentoEletronicoEtdUnit;

interface

uses
  Classes, SysUtils, Contnrs, IntegerNullableUnit, StringNullableUnit;

type
  DocumentoEletronicoEtd = class
  private
    FSeqid: Int64;
    FCodEmpresa: Integer;
    FIdDoc: StringNullable;
    FDoc: StringNullable;
  public
    constructor Create(); overload;
    constructor Create(
      ASeqid: Int64;
      ACodEmpresa: Integer;
      const AIdDoc: StringNullable;
      const ADoc: StringNullable
    ); overload;

    property Seqid: Int64 read FSeqid write FSeqid;
    property CodEmpresa: Integer read FCodEmpresa write FCodEmpresa;
    property IdDoc: StringNullable read FIdDoc write FIdDoc;
    property Doc: StringNullable read FDoc write FDoc;
  end;

  DocumentoEletronicoEtdList = class(TObjectList)
  private
    function GetItem(Index: Integer): DocumentoEletronicoEtd;
    procedure SetItem(Index: Integer; const Value: DocumentoEletronicoEtd);
  public
    property Items[Index: Integer]: DocumentoEletronicoEtd read GetItem write SetItem;
  end;

implementation

{ DocumentoEletronicoEtd }

constructor DocumentoEletronicoEtd.Create();
begin
  inherited Create;
end;

constructor DocumentoEletronicoEtd.Create(
  ASeqid: Int64;
  ACodEmpresa: Integer;
  const AIdDoc: StringNullable;
  const ADoc: StringNullable
);
begin
  Create();
  FSeqid := ASeqid;
  FCodEmpresa := ACodEmpresa;
  FIdDoc := AIdDoc;
  FDoc := ADoc;
end;

{ DocumentoEletronicoEtdList }

function DocumentoEletronicoEtdList.GetItem(Index: Integer): DocumentoEletronicoEtd;
begin
  Result := DocumentoEletronicoEtd(inherited Items[Index]);
end;

procedure DocumentoEletronicoEtdList.SetItem(Index: Integer; const Value: DocumentoEletronicoEtd);
begin
  Put(Index, Value);
end;

end.
