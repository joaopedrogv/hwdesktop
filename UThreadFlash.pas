unit UThreadFlash;

interface

uses
  Classes, ShockwaveFlashObjects_TLB, ExtCtrls;

type
  ThreadFlash = class(TThread)
  private
    F: TShockwaveFlash;
    P: Tpanel;
    jaacabou: boolean;
    vListaWeb, vListaLocal: TStringList;
    function lerPropagandaTxt: boolean;
    { Private declarations }
  protected
    procedure Execute; override;
    procedure exibeFlash;
    procedure exibeFlashLocal;
  public
    constructor CriarFlash(Flash: TShockwaveFlash; Panel: Tpanel; Acabou: boolean);
    function fim(acabou: boolean): boolean;
  end;

implementation

uses uCadPadrao, ActiveX, SysUtils, Controls, Forms,
  Windows, Dialogs, DB;

{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure ThreadFlash.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ ThreadFlash }

constructor ThreadFlash.CriarFlash(Flash: TShockwaveFlash; Panel: TPanel; Acabou: boolean);
begin

  vListaWeb := TStringList.Create;
  vListaLocal := TStringList.Create;

  lerPropagandaTxt;

  Create(False);
  F := Flash;
  P := Panel;
  jaacabou := Acabou;

end;

procedure ThreadFlash.Execute;
begin
  Synchronize(exibeFlash);
  sleep(5000);
  if not jaacabou then
    Synchronize(exibeFlashLocal);
end;

procedure ThreadFlash.exibeFlash;
begin

  if vListaWeb.Count = 0 then
    Exit;

  F.Parent := P;
  F.Align := alClient;
  Randomize;
  {//    case Random(5) of
  //      0: F.Movie := 'http://hwsistemas.homelinux.com/flash/banner.swf';
  //      1: F.Movie := 'http://hwsistemas.homelinux.com/flash/banner1.swf';
  //      2: F.Movie := 'http://hwsistemas.homelinux.com/flash/banner2.swf';
  //      3: F.Movie := 'http://hwsistemas.homelinux.com/flash/CabBotao.swf';
  //      4: F.Movie := 'http://hwsistemas.homelinux.com/flash/PropCentral.swf';
  //    end;

  case Random(5) of
    0: F.Movie := 'http://wwwimages.adobe.com/www.adobe.com/homepage/pt_br/fma_rotation/fma0/cs4.swf';
    1: F.Movie := 'http://www.cruzeiro.com.br/imgs/banners/bannerduplo.swf';
    2: F.Movie := 'http://www.cruzeiro.com.br/imgs/banners/BRAHMA.swf';
    3: F.Movie := 'http://www.cruzeiro.com.br/imgs/banners/minaspirotec.swf';
    4: F.Movie := 'http://www.cruzeiro.com.br/imgs/banners/wylltek.swf';
  end;
}

  F.Movie := vListaWeb[Random(vListaWeb.Count)];

  //F.Hint := F.Movie;
  //F.ShowHint := true;
end;

procedure ThreadFlash.exibeFlashLocal;
var
  vTemp: string;
begin

  if vListaLocal.Count = 0 then
    Exit;

  vTemp := vListaLocal[Random(vListaLocal.Count)];

  if not FileExists(vTemp) then
  begin
    vTemp := ExtractFileName(vTemp);
    vTemp := ExtractFilePath(Application.ExeName) + vTemp;
    if not FileExists(vTemp) then
      Exit;
  end;

  if ((F.ReadyState = 4) and (F.PercentLoaded = 0)) or (F.ReadyState = 3) then
    begin
      Randomize;
      {case Random(5) of
        0:
          begin
            if FileExists(ExtractFilePath(Application.Exename) + 'banner.swf') then
              F.Movie := ExtractFilePath(Application.Exename) + 'banner.swf';
          end;
        1:
          begin
            if FileExists(ExtractFilePath(Application.Exename) + 'banner1.swf') then
              F.Movie := ExtractFilePath(Application.Exename) + 'banner1.swf';
          end;
        2:
          begin
            if FileExists(ExtractFilePath(Application.Exename) + 'banner2.swf') then
              F.Movie := ExtractFilePath(Application.Exename) + 'banner2.swf';
          end;
        3:
          begin
            if FileExists(ExtractFilePath(Application.Exename) + 'CabBotao.swf') then
              F.Movie := ExtractFilePath(Application.Exename) + 'CabBotao.swf';
          end;
        4:
          begin
            if FileExists(ExtractFilePath(Application.Exename) + 'PropCentral.swf') then
              F.Movie := ExtractFilePath(Application.Exename) + 'PropCentral.swf';
          end;
      end;

      vCod := Random(CDS.RecordCount);

      CDS.IndexFieldNames:= 'COD_PROPAGANDA';
      CDS.FindNearest([vCod]);
      vTemp := Trim(CDS.FieldByName('ENDERECO_PROPAGANDA').AsString);
      CDS.Close;

      F.Movie := vTemp ;
      }

      F.Movie := vTemp;;

      //F.Hint := F.Movie;
      //F.ShowHint := true;
    end;
end;

function ThreadFlash.fim(acabou: boolean): boolean;
begin
  jaacabou := acabou;
end;

function ThreadFlash.lerPropagandaTxt: boolean;
var
  vArquivoPropaganda: TextFile;
  vLinha: string;
begin
  if FileExists(ExtractFilePath(Application.ExeName)+'prop.txt') then
  begin
    AssignFile(vArquivoPropaganda, ExtractFilePath(Application.ExeName)+'prop.txt');
    try
      Reset(vArquivoPropaganda);

      vListaWeb.Clear;
      vListaLocal.Clear;

      repeat
        Readln(vArquivoPropaganda, vLinha);
        
        if copy(vLinha,1,1) = 'S' then
          vListaLocal.Add(copy(vLinha,2,Length(vLinha)))
        else if copy(vLinha,1,1) = 'N' then
          vListaWeb.Add(copy(vLinha,2,Length(vLinha)));

      until Eof(vArquivoPropaganda);

    finally
      CloseFile(vArquivoPropaganda);
    end;
  end;
end;

end.

