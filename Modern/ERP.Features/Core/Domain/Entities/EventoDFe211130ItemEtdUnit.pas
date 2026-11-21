unit EventoDFe211130ItemEtdUnit;

interface

type
  EventoDFe211130ItemEtd = record
  private
    FId: string;
    FNItem: Integer;
    FVIbs: Currency;
    FVCbs: Currency;
    FQImobilizado: Currency;
    FUImobilizado: string;
  public
    class function Create(const AId: string; ANItem: Integer;
      AVIbs, AVCbs: Currency; AQImobilizado: Currency;
      const AUImobilizado: string): EventoDFe211130ItemEtd; static;
    property Id: string read FId;
    property NItem: Integer read FNItem;
    property VIbs: Currency read FVIbs;
    property VCbs: Currency read FVCbs;
    property QImobilizado: Currency read FQImobilizado;
    property UImobilizado: string read FUImobilizado;
  end;

  EventoDFe211130ItemEtdArray = array of EventoDFe211130ItemEtd;

implementation

{ EventoDFe211130ItemEtd }

class function EventoDFe211130ItemEtd.Create(const AId: string;
  ANItem: Integer; AVIbs, AVCbs: Currency; AQImobilizado: Currency;
  const AUImobilizado: string): EventoDFe211130ItemEtd;
begin
  Result.FId := AId;
  Result.FNItem := ANItem;
  Result.FVIbs := AVIbs;
  Result.FVCbs := AVCbs;
  Result.FQImobilizado := AQImobilizado;
  Result.FUImobilizado := AUImobilizado;
end;

end.
