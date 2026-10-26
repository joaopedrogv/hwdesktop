unit TributacaoRegularModelUnit;

interface

uses
  TipoComunsUnit;

type
  TributacaoRegularModel = record
  private
    FInstance: RecordInstance;
    FCSTReg: Integer;
    FCClassTribReg: string;
    FPAliqEfetRegIBSUF: Currency;
    FVTribRegIBSUF: Currency;
    FPAliqEfetRegIBSMun: Currency;
    FVTribRegIBSMun: Currency;
    FPAliqEfetRegCBS: Currency;
    FVTribRegCBS: Currency;
  public
    class function NullInstance(): TributacaoRegularModel; static;

    class function Create(
      CSTReg: Integer;
      const CClassTribReg: string
    ): TributacaoRegularModel; static;

    function IsNull(): Boolean;
    procedure SetCBS(Aliquota, Tributo: Currency);
    procedure SetIBSUF(Aliquota, Tributo: Currency);
    procedure SetIBSMun(Aliquota, Tributo: Currency);

    property CSTReg: Integer read FCSTReg;
    property CClassTribReg: string read FCClassTribReg;
    property PAliqEfetRegIBSUF: Currency read FPAliqEfetRegIBSUF;
    property VTribRegIBSUF: Currency read FVTribRegIBSUF;
    property PAliqEfetRegIBSMun: Currency read FPAliqEfetRegIBSMun;
    property VTribRegIBSMun: Currency read FVTribRegIBSMun;
    property PAliqEfetRegCBS: Currency read FPAliqEfetRegCBS;
    property VTribRegCBS: Currency read FVTribRegCBS;
  end;

implementation

{ TributacaoRegularModel }

uses NumberServiceUnit;

class function TributacaoRegularModel.Create(
  CSTReg: Integer;
  const CClassTribReg: string
): TributacaoRegularModel;
begin
  Result.FInstance := riNotNull;
  Result.FCSTReg := CSTReg;
  Result.FCClassTribReg := CClassTribReg;
  Result.FPAliqEfetRegIBSUF := 0.00;
  Result.FVTribRegIBSUF := 0.00;
  Result.FPAliqEfetRegIBSMun := 0.00;
  Result.FVTribRegIBSMun := 0.00;
  Result.FPAliqEfetRegCBS := 0.00;
  Result.FVTribRegCBS := 0.00;
end;

function TributacaoRegularModel.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

class function TributacaoRegularModel.NullInstance: TributacaoRegularModel;
begin
  Result := TributacaoRegularModel.Create( 0, '' );
  Result.FInstance := riNull;
end;

procedure TributacaoRegularModel.SetCBS(Aliquota, Tributo: Currency);
begin
  Self.FPAliqEfetRegCBS := NumberService.RoundHalfUpTo4(Aliquota);
  Self.FVTribRegCBS := NumberService.RoundHalfUpTo2(Tributo);
end;

procedure TributacaoRegularModel.SetIBSMun(Aliquota, Tributo: Currency);
begin
  Self.FPAliqEfetRegIBSMun := NumberService.RoundHalfUpTo4(Aliquota);
  Self.FVTribRegIBSMun := NumberService.RoundHalfUpTo2(Tributo);
end;

procedure TributacaoRegularModel.SetIBSUF(Aliquota, Tributo: Currency);
begin
  Self.FPAliqEfetRegIBSUF := NumberService.RoundHalfUpTo4(Aliquota);
  Self.FVTribRegIBSUF := NumberService.RoundHalfUpTo2(Tributo);
end;

end.
