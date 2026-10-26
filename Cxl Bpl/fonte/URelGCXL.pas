unit URelGCXL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, UCrpeClasses, UCrpe32, StdCtrls, Buttons, Mask;

type
  TfrmPadrao1 = class(TfrmPadrao)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    BitBtn1: TBitBtn;
    Crpe1: TCrpe;
    Memo1: TMemo;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPadrao1: TfrmPadrao1;

implementation

{$R *.dfm}

procedure TfrmPadrao1.BitBtn1Click(Sender: TObject);
var
 vsenharel: string;
 cnt,vnv,i,vflgerr: integer;
begin
  inherited;
{  Crpe1.ReportName :='Pagamentos por dia.rpt';
  Crpe1.SummaryInfo.Retrieve;
  memo1.Lines.Assign(Crpe1.SummaryInfo.Comments);
  vsenharel:=memo1.lines[0];
  try
   vnv:=strtoint(memo1.lines[1]);
  except
   messagedlg('Erro de conversão do nível de acesso',mtinformation,[mbOK],0);
   exit;
  end;
//  vdeprel:=memo1.lines[2];
  memo1.Clear;
//  if vnivel < vnv then
//  begin
//   messagedlg('Nivel de acesso não Permitido',mtinformation,[mbOK],0);
//   exit;
//  end;
  if Crpe1.LogOnServer.Retrieve then
  begin
   // Depois olhar nos Summary...
    for cnt := 0 to (Crpe1.LogOnServer.Count - 1) do
      Crpe1.LogOnServer[cnt].Password:=vsenharel;
//    crpe1.ParamFields.Retrieve; //herbert

    crpe1.ParamFields[0].CurrentValue:=copy(maskedit1.text,7,4)+','+
        copy(MaskEdit1.text,4,2)+','+copy(MaskEdit1.text,1,2)+' 00:00:00';
    crpe1.ParamFields[1].CurrentValue:=copy(maskedit2.text,7,4)+','+
        copy(MaskEdit2.text,4,2)+','+copy(MaskEdit2.text,1,2)+' 00:00:00';
    crpe1.ParamFields[2].CurrentValue:=DtmC.QRYempresaNOME_EMP.value;
    ExecSQL('SELECT * FROM COLABORADOR WHERE COD_VENDEDOR = '+inttostr(VCODUS)+' AND COD_EMPRESA = '+codEmpresa+' and ATIVO = 1',dtmc.qrBuscas1);
    crpe1.ParamFields[3].value:='DE: '+maskedit1.text+' A: '+maskedit2.text+' Op.: '+
    copy(dtmc.QrBuscas1.fieldbyname('NOME_VENDEDOR').asstring,1,10);
    crpe1.ParamFields[4].AsNumber:=vcodus;
    crpe1.ParamFields[5].AsNumber:=StrToInt(codEmpresa);
    vflgerr:=0;
    for cnt := 0 to (Crpe1.LogOnServer.Count - 1) do
    begin
     if not Crpe1.LogOnServer[cnt].LogOn then
      vflgerr:=1;
    end;
    if vflgerr = 0 then
     Crpe1.Execute;
  end;
 }
end;

end.
