unit uCadAdmCartao_RedesTEF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, DBCtrls, Mask, Grids, DBGrids, ExtCtrls,
  uDataSet_OOP, uClassesCadastrosBasicosCX;

type
  TfrmCadAdmCartao_RedesTEF = class(TfrmPadrao)
    Panel1: TPanel;
    Panel2: TPanel;
    Memo1: TMemo;
    Panel3: TPanel;
    Label1: TLabel;
    Panel5: TPanel;
    Label3: TLabel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    Panel6: TPanel;
    Panel4: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    MaskEdit1: TMaskEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    btSave: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label6: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MaskEdit1Change(Sender: TObject);
  private
    { Private declarations }
    adms: TDadosLookUp_OOP;
    bandeira: TDadosLookUp_OOP;
    debcred: TDadosLookUp_OOP;
    redes: TRoteamentoRedesAdm;
    procedure Salvar(inserir: Boolean);
  public
    { Public declarations }
  end;

var
  frmCadAdmCartao_RedesTEF: TfrmCadAdmCartao_RedesTEF;

implementation

uses
  uDtmAtivo, StrUtils, uDadosIni, hw_utils;

{$R *.dfm}

procedure TfrmCadAdmCartao_RedesTEF.BitBtn3Click(Sender: TObject);
begin
  inherited;
  Salvar(False);
end;

procedure TfrmCadAdmCartao_RedesTEF.BitBtn4Click(Sender: TObject);
begin
  inherited;
  Screen.Cursor := crHourGlass;
  try
    redes.Excluir;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadAdmCartao_RedesTEF.BitBtn6Click(Sender: TObject);
begin
  inherited;
  Salvar(True);
end;

procedure TfrmCadAdmCartao_RedesTEF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  adms.Free;
  bandeira.Free;
  debcred.Free;
  redes.Free;

  Action := caFree;
  frmCadAdmCartao_RedesTEF := nil;
end;

procedure TfrmCadAdmCartao_RedesTEF.FormShow(Sender: TObject);
begin
  inherited;
  redes := TRoteamentoRedesAdm.Create;
  adms := TDadosLookUp_OOP.create;
  bandeira := TDadosLookUp_OOP.create;
  debcred := TDadosLookUp_OOP.create;

  redes.abrir;
  adms.setDadosDataSet('cod_adm', 'adm', redes.SqlOpen('select cod_adm, descricao_adm adm from adm_cartao where cod_empresa = %d', [vdadosIni.cod_empresa]), DBLookupComboBox1);
  bandeira.setDadosDataSet(['1','2','3','4', '5', '6', '7', '8', '9', '99'],
                           ['01 - Visa', '02 - Mastercard', '03 - American Express', '04 - Sorocred',
                            '05 - Diners Club', '06 - Elo', '07 - Hipercard', '08 - Aura', '09 - Cabal',
                            '99 - Outros'], DBLookupComboBox2);
  debcred.setDadosDataSet(['C','D'], ['Crédito', 'Débito'], DBLookupComboBox3);

  DBGrid1.DataSource := redes._dataSourceOOP;
end;

procedure TfrmCadAdmCartao_RedesTEF.MaskEdit1Change(Sender: TObject);
begin
  inherited;
  btSave.Enabled := Trim(MaskEdit1.Text) <> '';
end;

procedure TfrmCadAdmCartao_RedesTEF.Salvar(inserir: Boolean);
begin
  if (not inserir) and (redes.dataSet.IsEmpty) then
  begin
    ShowAtencao('Sem registros para alterar');
    Exit;
  end;

  Screen.Cursor := crHourGlass;
  try
    if inserir then
    begin
      MaskEdit1.Enabled := True;
      MaskEdit1.Clear;
      DBLookupComboBox1.KeyValue := 0;
      DBLookupComboBox2.KeyValue := 0;
      DBLookupComboBox3.KeyValue := '';
    end
    else
    begin
      MaskEdit1.Enabled := False;
      MaskEdit1.Text := redes.fstr('rede');
      DBLookupComboBox1.KeyValue := redes.fint('cod_adm');
      DBLookupComboBox2.KeyValue := redes.fint('tband');
      DBLookupComboBox3.KeyValue := redes.fstr('debcred');
    end;

    while True do
    begin
      if not vDadosIni.abreForm(IfThen(inserir, 'Cadastro', 'Alteração') + ' de redes',
                                Panel4, opFormsDefCad) then
        Exit;

      if redes.Salvar(MaskEdit1.Text, VarToStr(DBLookupComboBox3.KeyValue), VarToInt(DBLookupComboBox1.KeyValue), VarToInt(DBLookupComboBox2.KeyValue), inserir) then
        Exit;
    end;

  finally
    Screen.Cursor := crDefault;
  end;
end;

end.
