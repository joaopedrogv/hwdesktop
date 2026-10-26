unit uFileList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FileCtrl;

type
  TfrmFileList = class(TForm)
    FileListBox1: TFileListBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFileList: TfrmFileList;

implementation

{$R *.dfm}

end.
