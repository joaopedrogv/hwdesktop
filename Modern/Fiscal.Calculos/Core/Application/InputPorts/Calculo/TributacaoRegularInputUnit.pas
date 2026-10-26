unit TributacaoRegularInputUnit;

interface

uses
  TipoComunsUnit;

type
  TributacaoRegularInput = record
  private
    FInstance: RecordInstance;
    FCST: string;
    FcClassTrib: string;
  public
    class function NullInstance(): TributacaoRegularInput; static;

    class function Create(
      const CST, cClassTrib: string
    ): TributacaoRegularInput; static;

    function IsNull(): Boolean;

    property CST: string read FCST;
    property cClassTrib: string read FcClassTrib;
  end;

implementation

{ TributacaoRegularInput }

class function TributacaoRegularInput.Create(const CST, cClassTrib: string): TributacaoRegularInput;
begin
  Result.FInstance := riNotNull;
  Result.FCST := CST;
  Result.FcClassTrib := cClassTrib;
end;

function TributacaoRegularInput.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

class function TributacaoRegularInput.NullInstance: TributacaoRegularInput;
begin
  Result := TributacaoRegularInput.Create('', '');
  Result.FInstance := riNull;
end;

end.