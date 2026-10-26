unit uFormDefinirPISCOFINSCP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls;

type
  TfrmDefinirPISCOFINSCP = class(TForm)
    Panel1: TPanel;
    lbl1: TLabel;
    lblStatus: TLabel;
    ProgressBar1: TProgressBar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDefinirPISCOFINSCP: TfrmDefinirPISCOFINSCP;

implementation

{$R *.dfm}

end.
