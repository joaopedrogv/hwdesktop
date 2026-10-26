unit ApiCloud_45;

interface

uses
//  Hw.Servicos,
  Hw.Json,
  BaseApi_45,
  PrintModels;


type

  TApiCloud_45 = class(TBaseApi_45)
  strict private
  public
    function PostPrintText(payload: TPrintTextModel): Boolean;
    function PostPrintNFCe(payload: TPrintNFCeModel): Boolean;
    function PostPrintTermic(payload: TPrintTermicModel): Boolean;
    function PostPrintPdf(payload: TPrintPDFModel): Boolean;
    function PostOpenDrawer(payload: TOpenDrawerModel): Boolean;
    function GetAgents(): TArray<TAgents>;
  end;

implementation

{ TApiCloud_45 }

function TApiCloud_45.GetAgents: TArray<TAgents>;
begin
  Result := [];
  with Call(TReq.New('posprinter/agents'), rmGET) do
  begin
    if isSuccess then
      Result := TJsonHw.ToArrayObject< TAgents >(data);
  end;
end;

function TApiCloud_45.PostOpenDrawer(payload: TOpenDrawerModel): Boolean;
begin
  Result := False;
  Result :=  Call(TReq.New('posprinter/opendrawer', '', TJsonHw.ToJsonString(payload)), rmPOST).isSuccess;
end;

function TApiCloud_45.PostPrintNFCe(payload: TPrintNFCeModel): Boolean;
begin
  Result := False;
  Result :=  Call(TReq.New('posprinter/printnfce', '', TJsonHw.ToJsonString(payload)), rmPOST).isSuccess;
end;

function TApiCloud_45.PostPrintTermic(payload: TPrintTermicModel): Boolean;
begin
  Result := False;
  Result :=  Call(TReq.New('posprinter/printtermic', '', TJsonHw.ToJsonString(payload)), rmPOST).isSuccess;
end;

function TApiCloud_45.PostPrintPdf(payload: TPrintPDFModel): Boolean;
begin
  Result := False;
  Result :=  Call(TReq.New('posprinter/printpdf', '', TJsonHw.ToJsonString(payload)), rmPOST).isSuccess;
end;

function TApiCloud_45.PostPrintText(payload: TPrintTextModel): Boolean;
begin
  Result := False;
  Result :=  Call(TReq.New('posprinter/printtext', '', TJsonHw.ToJsonString(payload)), rmPOST).isSuccess;
end;

end.
