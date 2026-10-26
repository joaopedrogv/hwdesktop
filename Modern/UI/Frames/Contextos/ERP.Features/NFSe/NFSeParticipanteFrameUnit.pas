unit NFSeParticipanteFrameUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Mask, ExtCtrls, ComboBoxMunicipiosFrameUnit,
  ClienteEtdUnit, NFSeParticipanteEtdUnit;

type
  TNFSeParticipanteFrame = class(TFrame)
    pnContentPart: TPanel;
    Panel13: TPanel;
    Label34: TLabel;
    edCpfCnpj: TMaskEdit;
    edInscMun: TMaskEdit;
    Label1: TLabel;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    edNome: TMaskEdit;
    edEmail: TMaskEdit;
    Panel3: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    edBairro: TMaskEdit;
    edComplemento: TMaskEdit;
    Label8: TLabel;
    Label5: TLabel;
    edFone: TMaskEdit;
    Panel2: TPanel;
    Label4: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edCep: TMaskEdit;
    edEndereco: TMaskEdit;
    edNumero: TMaskEdit;
    ComboBoxMunicipiosFrame1: TComboBoxMunicipiosFrame;
  private
    FState: NFSeParticipanteEtd;
    procedure Clear();

    procedure Setup(Input: ClienteEtd); overload;
  public
    //constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Setup(Input: NFSeParticipanteEtd); overload;

    function GetParticipante(): NFSeParticipanteEtd;
  end;

implementation

uses
  UIMasksUtilsUnit, StringNullableUnit, MunicipioEtdUnit, StringServiceUnit, IntegerNullableUnit;

{$R *.dfm}

{ TDPSParticipanteFrame }

procedure TNFSeParticipanteFrame.Setup(Input: ClienteEtd);
var
  I: Integer;
begin
  if Input = nil then
  begin
    Clear();
    Exit;
  end;

  edCpfCnpj.Text := UIMasksUtils.CPFCNPJ(Input.CpfCnpj.Value);
  edInscMun.Text := Input.InscMunicipal.Value;
  edFone.Text := UIMasksUtils.Fone(Input.FoneCliente.Value);
  edInscMun.Text := Input.InscMunicipal.Value;
  edNome.Text := Input.Razao;
  edEmail.Text := Input.Email.Value;
  edCep.Text := Input.Cep;
  edEndereco.Text := Input.Endereco;
  edNumero.Text := Input.NumEndCliente.Value;
  edComplemento.Text := Input.Complemento.Value;
  edBairro.Text := Input.Bairro;

  if Input.Municipio <> nil then
    I := Input.Municipio.Codigo
  else
    I := 0;

  ComboBoxMunicipiosFrame1.Setup(TSetupComboBoxMunicipiosFrame.Create(
    I, False, True
  ));
end;

procedure TNFSeParticipanteFrame.Clear;
begin
  if Assigned(FState) then
    FreeAndNil(FState);

  edCpfCnpj.Text := '';
  edInscMun.Text := '';
  edFone.Text := '';
  edInscMun.Text := '';
  edNome.Text := '';
  edEmail.Text := '';
  edCep.Text := '';
  edEndereco.Text := '';
  edNumero.Text := '';
  edComplemento.Text := '';
  edBairro.Text := '';

  ComboBoxMunicipiosFrame1.edMunicipios.ItemIndex := -1;
  ComboBoxMunicipiosFrame1.pnInfo.Visible := False;
end;

destructor TNFSeParticipanteFrame.Destroy;
begin
  if Assigned(FState) then
    FState.Free();

  inherited;
end;

function TNFSeParticipanteFrame.GetParticipante: NFSeParticipanteEtd;
begin
  if FState = nil then
    Result := nil

  else
  begin
    FState.Cpfcnpj := StringNullable.Create( StringService.OnlyNumber(edCpfCnpj.Text) );
    FState.Im := StringNullable.Create( edInscMun.Text );
    FState.Fone := StringNullable.Create( StringService.OnlyNumber(edFone.Text) );
    FState.Xnome := Trim(edNome.Text);
    FState.Email := StringNullable.Create( edEmail.Text );
    FState.Cep := StringNullable.Create( edCep.Text );
    FState.Xlgr := StringNullable.Create( edEndereco.Text );
    FState.Nro := StringNullable.Create( edNumero.Text );
    FState.Xcpl := StringNullable.Create( edComplemento.Text );
    FState.Xbairro := StringNullable.Create( edBairro.Text );      
    FState.Cmun := IntegerNullable.CreateOrNull( ComboBoxMunicipiosFrame1.GetCodigoIBGE );
  end;

  Result := NFSeParticipanteEtd(FState.Clone());
end;

procedure TNFSeParticipanteFrame.Setup(Input: NFSeParticipanteEtd);
begin
  if Input = nil then
  begin
    Clear();
    Exit;
  end;

  FState := NFSeParticipanteEtd(Input.Clone());

  edCpfCnpj.Text := UIMasksUtils.CPFCNPJ(Input.Cpfcnpj.Value);
  edInscMun.Text := Input.Im.Value;
  edFone.Text := UIMasksUtils.Fone(Input.Fone.Value);
  edInscMun.Text := Input.Im.Value;
  edNome.Text := Input.Xnome;
  edEmail.Text := Input.Email.Value;
  edCep.Text := Input.Cep.Value;
  edEndereco.Text := Input.Xlgr.Value;
  edNumero.Text := Input.Nro.Value;
  edComplemento.Text := Input.Xcpl.Value;
  edBairro.Text := Input.Xbairro.Value;

  ComboBoxMunicipiosFrame1.Setup(TSetupComboBoxMunicipiosFrame.Create(
    Input.Cmun.Value, False, True
  ));
end;

end.
