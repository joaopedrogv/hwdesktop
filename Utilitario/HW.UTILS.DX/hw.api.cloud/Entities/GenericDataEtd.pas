unit GenericDataEtd;

interface

type
  TRawData = class
  private
    Fdata: string;
  public
    constructor Create(); overload;
    constructor Create(value: string); overload;
    property data: string read Fdata write Fdata;
  end;

  TKeyWords = class
  private
    Fseparator: string;
    FnullValue: string;
    Fquote    : string;
  published
    property separator: string read Fseparator write Fseparator;
    property nullValue: string read FnullValue write FnullValue;
    property quote    : string read Fquote write Fquote;
  end;

  KeyWordsClss = class
  public
    class function KeyWords(): TKeyWords;
  end;

  TGeneric = class
  private
    Ftable : string;
    Ffields: string;
  published
    property table : string read Ftable write Ftable;
    property fields: string read Ffields write Ffields;
  end;

  TGenericRecord = class(TGeneric)
  private
    Fregistry: TRawData;
  published
    property registry: TRawData read Fregistry write Fregistry;
  end;

  TGenericListRecord = class(TGeneric)
  private
    Flist: TArray< TRawData >;
  public
    property list: TArray< TRawData > read Flist write Flist;
  end;

  TGenericData = class(TGenericListRecord)
  private
    Fkeys: TKeyWords;
  public
    property keys: TKeyWords read Fkeys write Fkeys;
  end;

  TClientError = class
  private
    Ferrors: TArray<string>;
    Fkeys: TKeyWords;
    FdataHandle: TArray<TGenericRecord>;
  public
    property errors: TArray<string> read Ferrors write Ferrors;
    property keys: TKeyWords read Fkeys write Fkeys;
    property dataHandle: TArray<TGenericRecord> read FdataHandle write FdataHandle;
  end;

implementation

{ KeyWordsClss }

class function KeyWordsClss.KeyWords: TKeyWords;
begin
  Result := TKeyWords.Create;
  Result.separator := '¸';
  Result.nullValue := '¡';
  Result.quote := '±';
end;

{ TRawData }

constructor TRawData.Create(value: string);
begin
  Create();
  Fdata := value;
end;

constructor TRawData.Create;
begin
  inherited;
end;

end.
