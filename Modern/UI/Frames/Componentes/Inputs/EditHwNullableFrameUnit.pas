unit EditHwNullableFrameUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, uEditHw, DoubleNullableUnit;

type
  TEditHwNullableFrame = class(TFrame)
    edDouble: TEditHw;
    ckNotNull: TCheckBox;
    procedure ckNotNullClick(Sender: TObject);
  private
  public
    procedure Setup(const Value: DoubleNullable; Digits: Smallint);
    function GetDoubleNullable(): DoubleNullable;
  end;

implementation

{$R *.dfm}

{ TFrame1 }

procedure TEditHwNullableFrame.ckNotNullClick(Sender: TObject);
begin
  edDouble.Enabled := ckNotNull.Checked;
end;

function TEditHwNullableFrame.GetDoubleNullable: DoubleNullable;
begin
  if ckNotNull.Checked then                
    Result := DoubleNullable.Create( edDouble.AsValue )
  else
    Result := DoubleNullable.NullInstance();
end;

procedure TEditHwNullableFrame.Setup(const Value: DoubleNullable; Digits: Smallint);
begin
  if (Digits < 0) or (Digits > 14) then
    raise Exception.CreateFmt('Digit %d out of range [0..14] ', [Digits]);

  edDouble.FormatSize := Format('0.%d', [Digits]);
  edDouble.AsValue := Value.Value;
  edDouble.Enabled := not Value.IsNull;
  ckNotNull.Checked := not Value.IsNull;

  edDouble.Hint := 'Marcar a caixa de seleção para preencher um valor ' + sLineBreak +
                   'ou Desmarcar a caixa de seleção para deixar o campo vazio';
  ckNotNull.Hint := edDouble.Hint;
  Self.Hint := edDouble.Hint;
end;

end.
