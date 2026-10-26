unit UIProgressObserverFormUnit;

interface

uses
  IProgressObserverUnit;

type
  UIProgressResponse = record
  private
    FSuccess: Boolean;
    FErrors: string;
  public
    property Success: Boolean read FSuccess;
    property Errors: string read FErrors;
  end;

//  UIProgressObserverForm = class
//  public
//    class function Create(): IProgressObserver;
//  end;

implementation

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Gauges, ComCtrls,
  UIProgressObserverUnit;

type
  ProgressObserverForm = class(UIProgressObserver)
  private
    FForm: TForm;
  private
    procedure OnStart;
  end;

{ ProgressObserverForm }

procedure ProgressObserverForm.OnStart;
begin
  FForm := TForm.Create(nil);
  try
    FForm.ShowModal()
  finally

  end;
end;

end.
