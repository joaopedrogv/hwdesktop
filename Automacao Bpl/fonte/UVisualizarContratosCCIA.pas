unit UVisualizarContratosCCIA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, IBQuery;

type
  TFrmVisualizarContratosCCIA = class(TForm)
    ScrollBox1: TScrollBox;
    Panel1: TPanel;
    Panel2: TPanel;
    RichEditMsg1: TRichEdit;
    BitBtn31: TBitBtn;
    BitBtn42: TBitBtn;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    labelContratos: TLabel;
    GroupBox2: TGroupBox;
    ScrollBox2: TScrollBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn31Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn42Click(Sender: TObject);
    procedure criaChecksColunas;
    procedure criaRichEdit;
  private
   vCheck: TCheckBox;
   vRichEdit: TRichEdit;
    { Private declarations }
  public
  var
     buscas: TIBQuery;
     pTipo, pAnexo, pDestino: string;
     nContrato: Integer;
    { Public declarations }
  end;

var
  FrmVisualizarContratosCCIA: TFrmVisualizarContratosCCIA;

implementation

uses
  uDtmAtivo, UDtmVeiculosCCIA, ShlObj, uDadosIni;

{$R *.dfm}

procedure TFrmVisualizarContratosCCIA.BitBtn31Click(Sender: TObject);
var
 pCodCliente, pCarta: string;
 I, K, pQuantCTR: Integer;
begin
  try
      Screen.Cursor := crHourGlass;
      pCodCliente := vDadosIni.vPesquisaCliente;
      pAnexo := '';
      pQuantCTR := 0;

      if not DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas') then
         CreateDir(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas');

      if not DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas') then
       exit;

      if not DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp') then
         CreateDir(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp');

      if not DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp') then
       exit;

      for I := 0 to vDadosIni.vListTemp.Count -1 do
      begin
        pTipo := vDadosIni.vPesquisaNComando + 'CTR' + vDadosIni.getCampoPipe(vDadosIni.vListTemp[I], 1);
        for k := 0 to ComponentCount - 1 do //Testando aqui o CheckBox já não existe.
        begin
          if (Components[k] is TCheckBox) then
            if 'CHECK'+trim(vDadosIni.getCampoPipe(vDadosIni.vListTemp[I], 1)) = TCheckBox(Components[k]).Name then
            begin
              if TCheckBox(Components[k]).Checked then
              begin
                pQuantCTR := pQuantCTR + 1;
                pAnexo := pAnexo + pDestino + pTipo + '.rtf|';
              end;
            end;
        end;
      end;
      if (pAnexo) = '' then
      begin
       Application.MessageBox(Pchar('Nenhum contrato selecionado para envio de e-mail.'), 'Atenção', MB_ICONINFORMATION + MB_OK);
       exit;
      end;

      vDadosIni.EnvEmail(
      	vDadosIni.vEmp.vAssunto_dav,
        vDadosIni.vEmp.vMsg_dav,
        StrToInt(pCodCliente),
        cEmail,
        '',
        '',
        cNenhum,
        pAnexo,
        pQuantCTR);
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFrmVisualizarContratosCCIA.BitBtn42Click(Sender: TObject);
var
 I, K: Integer;
 vCheckBox: TCheckBox;
begin
  for  I := 0 to vDadosIni.vListTemp.Count -1 do
  begin
    pTipo := vDadosIni.vPesquisaNComando + 'CTR' + vDadosIni.getCampoPipe(vDadosIni.vListTemp[I], 1);
    DeleteFile(pDestino + pTipo + '.rtf');
  end;
  ModalResult := mrCancel;
  Close;
end;

procedure TFrmVisualizarContratosCCIA.criaChecksColunas;
var
  k, i, altura: integer;
  jaexiste: boolean;
begin
  jaexiste := false;
  altura := 0;
  for I := 0 to vDadosIni.vListTemp.Count -1 do
  begin
    for k := 0 to ComponentCount - 1 do //Testando aqui o CheckBox já não existe.
    begin
      if (Components[k] is TCheckBox) then
        if 'CHECK'+trim(vDadosIni.getCampoPipe(vDadosIni.vListTemp[I], 1)) = TCheckBox(Components[k]).Name then
        begin
          jaexiste := true;
        end;
    end;
    if not jaexiste then
    begin
      vCheck := TCheckBox.create(self);
      vCheck.Alignment := taRightJustify;
      vCheck.Parent := ScrollBox2;
      vCheck.Name :='CHECK'+trim(vDadosIni.getCampoPipe(vDadosIni.vListTemp[I], 1));
      vCheck.Caption := trim(vDadosIni.getCampoPipe(vDadosIni.vListTemp[I], 1)) + ' - ' + trim(vDadosIni.getCampoPipe(vDadosIni.vListTemp[I], 2));
      vCheck.Tag := I;
      vCheck.Left := 16;
      vCheck.Width := 225;
      vCheck.Top := altura;
      vCheck.Visible := true;
      vCheck.Checked := true;
      altura := altura + 15;
    end;
  end;
end;

procedure TFrmVisualizarContratosCCIA.criaRichEdit;
var
  k, i, altura: integer;
  jaexiste: boolean;
begin
  jaexiste := false;
  altura := 0;
  for I := 0 to vDadosIni.vListTemp.Count -1 do
  begin
    for k := 0 to ComponentCount - 1 do //Testando aqui o CheckBox já não existe.
    begin
      if (Components[k] is TRichEdit) then
        if 'RICHEDIT'+trim(vDadosIni.getCampoPipe(vDadosIni.vListTemp[I], 1)) = TRichEdit(Components[k]).Name then
        begin
          jaexiste := true;
        end;
    end;
    if not jaexiste then
    begin
      vRichEdit := TRichEdit.create(self);
      vRichEdit.Name :='RICHEDIT'+trim(vDadosIni.getCampoPipe(vDadosIni.vListTemp[I], 1));
      vRichEdit.Visible := False;
      vRichEdit.Parent := FrmVisualizarContratosCCIA;

      vDadosIni.abreStatusProcessamento('', 'Abrindo Visualização: '+ IntToStr(I + 1) +'/'+IntToStr(vDadosIni.vListTemp.Count));

      pTipo := vDadosIni.vPesquisaNComando + 'CTR' + vDadosIni.getCampoPipe(vDadosIni.vListTemp[I], 1);
      vRichEdit.Text :=
      	vDadosIni._TrocaTAGsDaCarta(
        	cPropostaVeic,
        	StrToInt(vDadosIni.getCampoPipe(vDadosIni.vListTemp[I], 1)),
          StrToInt(vDadosIni.vPesquisaCliente),
          vDadosIni.vPesquisaNComando,
          '',
          0,
          0,
          '-1'
        );
      try
        vDadosIni.WriteToMSWord(vRichEdit.Text, vDadosIni.vEmp.vSenhaContratoVeic,  pDestino + pTipo + '.rtf');
      except
      end;
    end;
  end;
  if FindComponent('RICHEDIT'+trim(vDadosIni.getCampoPipe(vDadosIni.vListTemp[0], 1))) <> nil then
  begin
   vRichEdit := TRichEdit(FindComponent('RICHEDIT'+trim(vDadosIni.getCampoPipe(vDadosIni.vListTemp[0], 1))));
   RichEditMsg1.Text := vRichEdit.Text;
  end;
end;

procedure TFrmVisualizarContratosCCIA.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if (FrmVisualizarContratosCCIA <> nil) then
    FrmVisualizarContratosCCIA := nil;
end;

procedure TFrmVisualizarContratosCCIA.FormShow(Sender: TObject);
var
 I, K: Integer;
begin
  try
  SpeedButton1.Visible := False;
  RichEditMsg1.Text := '';
  pDestino := vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp\';
  SpeedButton2.Visible := vDadosIni.vListTemp.Count > 1;
  nContrato := 0;
  pAnexo := '';
  labelContratos.Caption := IntToStr(I + 1) +'/'+ IntToStr(vDadosIni.vListTemp.Count);
  Buscas := TIBQuery(DtmVeiculosCCIA.qrBuscasV);

  criaChecksColunas;
  criaRichEdit;

  I := 0;
  for k := 0 to ComponentCount - 1 do
  begin
    if (Components[k] is TRichEdit) then
      if 'RICHEDIT'+trim(vDadosIni.getCampoPipe(vDadosIni.vListTemp[I], 1)) = TRichEdit(Components[k]).Name then
        RichEditMsg1.Text := TRichEdit(Components[k]).Text;
  end;
  k := 0;
  nContrato := I;
  vDadosIni.fechaStatusProcessamento;
  FrmVisualizarContratosCCIA.Caption := 'Contrato: '+ trim(vDadosIni.getCampoPipe(vDadosIni.vListTemp[I], 1)) + ' - ' + vDadosIni.getCampoPipe(vDadosIni.vListTemp[I], 2);
  if (Self.Enabled) and (Self.Visible) and (BitBtn42.CanFocus) then
    BitBtn42.SetFocus;
  except
  end;
end;


procedure TFrmVisualizarContratosCCIA.SpeedButton1Click(Sender: TObject);
var
 K: Integer;
begin
  if vDadosIni.vListTemp.Count > 0 then
  begin
    try
      Screen.Cursor := crHourGlass;
      if nContrato >= 1 then
      begin
        nContrato := nContrato - 1;
        pTipo := vDadosIni.vPesquisaNComando + 'CTR' + vDadosIni.getCampoPipe(vDadosIni.vListTemp[nContrato], 1);

        for k := 0 to ComponentCount - 1 do //Testando aqui o CheckBox já não existe.
        begin
          if (Components[k] is TRichEdit) then
            if 'RICHEDIT'+trim(vDadosIni.getCampoPipe(vDadosIni.vListTemp[nContrato], 1)) = TRichEdit(Components[k]).Name then
              RichEditMsg1.Text := TRichEdit(Components[k]).Text
        end;

        FrmVisualizarContratosCCIA.Caption := 'Contrato: '+ trim(vDadosIni.getCampoPipe(vDadosIni.vListTemp[nContrato], 1)) + ' - ' + vDadosIni.getCampoPipe(vDadosIni.vListTemp[nContrato], 2);
        labelContratos.Caption := IntToStr(nContrato + 1) +'/'+ IntToStr(vDadosIni.vListTemp.Count);
        SpeedButton2.Visible := True;
      end;
      if nContrato = 0 then
        SpeedButton1.Visible := False;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFrmVisualizarContratosCCIA.SpeedButton2Click(Sender: TObject);
var
 k: Integer;
begin
  if vDadosIni.vListTemp.Count > 0 then
  begin
    try
      Screen.Cursor := crHourGlass;
      if nContrato < vDadosIni.vListTemp.Count - 1 then
      begin
        nContrato := nContrato + 1;
        pTipo := vDadosIni.vPesquisaNComando + 'CTR' + vDadosIni.getCampoPipe(vDadosIni.vListTemp[nContrato], 1);

        for k := 0 to ComponentCount - 1 do //Testando aqui o CheckBox já não existe.
        begin
          if (Components[k] is TRichEdit) then
            if 'RICHEDIT'+trim(vDadosIni.getCampoPipe(vDadosIni.vListTemp[nContrato], 1)) = TRichEdit(Components[k]).Name then
              RichEditMsg1.Text := TRichEdit(Components[k]).Text
        end;

        FrmVisualizarContratosCCIA.Caption := 'Contrato: '+ trim(vDadosIni.getCampoPipe(vDadosIni.vListTemp[nContrato], 1)) + ' - ' + vDadosIni.getCampoPipe(vDadosIni.vListTemp[nContrato], 2);
        SpeedButton1.Visible := True;
        labelContratos.Caption := IntToStr(nContrato + 1) +'/'+ IntToStr(vDadosIni.vListTemp.Count);
      end;
      if nContrato = vDadosIni.vListTemp.Count - 1 then
        SpeedButton2.Visible := False;

    finally
      Screen.Cursor := crDefault;
    end;
  end;

end;

end.
