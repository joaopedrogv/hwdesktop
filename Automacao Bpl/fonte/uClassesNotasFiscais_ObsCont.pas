unit uClassesNotasFiscais_ObsCont;

interface

uses
  uDataSet_OOP, Classes;

type
  TNFCab_ObsCont = class(TDataSet_OOP)
  private
    FID                  : Integer;
    FOwner               : TDataSet_OOP;
    FBeforeUpdateOrInsert: TNotifyEvent;
  public
    constructor create(AOwner: TDataSet_OOP);
    //destructor Destroy; override;
    function Insert: Boolean; override;
    function Post: Boolean; override;
    function Apply: Boolean; override;
    //function delete: Boolean;

    //procedure OwnerDataSetValorTotalChange;
    function selecionaCamposAd: Boolean;

    property BeforeUpdateOrInsert: TNotifyEvent read FBeforeUpdateOrInsert write FBeforeUpdateOrInsert;
  end;

implementation

uses
  uClassesNotasFiscais, SysUtils, uDtmAtivo, DB, hw_utils, DBClient;

{ TNFCab_ObsCont }

function TNFCab_ObsCont.Apply: Boolean;
begin
  dataSet.DisableControls;
  try
    dataSet.First;
    while not dataSet.Eof do
    begin
      if dataSet.FieldByName('cod_nf').AsInteger = 0 then
      begin
        dataSet.Edit;
        dataSet.FieldByName('cod_nf').AsInteger := FOwner.fint('cod_nf');
        dataSet.FieldByName('cod_empresa').AsInteger := FOwner.fint('cod_empresa');
        dataSet.Post;
      end;
      dataSet.Next;
    end;
  finally
    dataSet.EnableControls;
  end;
  if dataSet.ChangeCount > 0 then
  begin
    Result := inherited Apply;
    selecionaCamposAd;
  end
  else
    Result := True;
end;

constructor TNFCab_ObsCont.create(AOwner: TDataSet_OOP);
begin
  inherited create(dtmAtivo.bancoHw);
  FOwner                := AOwner;
  _queryOOP.Transaction := FOwner.transacao;
  buscas.Transaction    := FOwner.transacao;
  FID                   := 0;
end;

function TNFCab_ObsCont.Insert: Boolean;
begin
  Result := False;
  if not dataSet.Active then
    selecionaCamposAd;

  if dataSet.RecordCount >= 10 then
  begin
    ShowErro('Quantidade de campos aceita é 10');
    Exit;
  end;  

  Result := inherited Insert;
  if Result then
  begin
    fdata('cod_nf').Put(FOwner.fint('cod_nf'));
    fdata('cod_empresa').Put(FOwner.fint('cod_empresa'));
    fdata('seqid').Put(0 - FID);
    FID := FID + 1;
  end;
end;

function TNFCab_ObsCont.Post: Boolean;
begin
  Result := False;
  try
    checkFieldEmpty('xcampo', 'Campo precisa ser preenchido'  , 'ed_obscont_xcampo');
    checkFieldEmpty('xtexto', 'Texto precisa ser preenchido'  , 'ed_obscont_xtexto');

    Result := inherited Post;

  except on E: Exception do
    begin
      registraErro('TNFCab_CamposAd.Post Erro: ' + e.Message);
      ShowErro('Erro ao salvar dados' + sLineBreak + sLineBreak + E.Message);
    end;
  end;
end;

function TNFCab_ObsCont.selecionaCamposAd: Boolean;
begin
  Result := ClientOpen('select * from notafiscal_obscont where cod_nf = %d and cod_empresa = %d',
                       [FOwner.fint('cod_nf'), FOwner.fint('cod_empresa')]).Active;
end;

end.
