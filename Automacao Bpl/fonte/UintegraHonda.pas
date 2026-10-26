unit UintegraHonda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadrao, StdCtrls, ComCtrls, Buttons, Mask, FileCtrl, ExtCtrls,inifiles,
  uPadrao, UClassesFabrica;

type
  TFrmIntegraHonda = class(TfrmPadrao)
    PageControl1: TPageControl;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label24: TLabel;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    MaskEdit6: TMaskEdit;
    MaskEdit7: TMaskEdit;
    MaskEdit9: TMaskEdit;
    MaskEdit10: TMaskEdit;
    MaskEdit11: TMaskEdit;
    MaskEdit12: TMaskEdit;
    MaskEdit13: TMaskEdit;
    MaskEdit14: TMaskEdit;
    MaskEdit15: TMaskEdit;
    MaskEdit16: TMaskEdit;
    MaskEdit21: TMaskEdit;
    MaskEdit22: TMaskEdit;
    MaskEdit8: TMaskEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Memo1: TMemo;
    GroupBox2: TGroupBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    GroupBox3: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    MaskEdit19: TMaskEdit;
    MaskEdit20: TMaskEdit;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmIntegraHonda: TFrmIntegraHonda;
  inifile: Tinifile;
//  varquivotxt: string;
  ArqIni: string;
  ArqConfig: TiniFile;
  F: TextFile;
  S: string;
  ObFabrica: TFabricaHonda;
  vPastaOrigem, vPastaDestino, vpathArquivosXML: string;
  vComitar: string;

implementation

uses uDtmAtivo, uclassesprodutos, uDadosIni, uDataSet_OOP, DB, ShlObj, MaskUtils, uDtmFabrica, uclassesContasAPagar;//uclassesContasAPagar,uDtmContasAPagar,  UClassesPedVenda,udtmPedVenda;

function Descompactar(pArquivo, pDiretorio, Caption: PChar): PChar; stdcall;
  		external 'Compacta.dll';

function DescompactarArquivo(pArquivo, pDestino: PChar; pUseStoredDirs: boolean): Boolean; stdcall;
  external 'Compacta.dll';

function ApagaDir(sPath : String): Boolean; stdcall;
  external 'Compacta.dll';

{$R *.dfm}

procedure TFrmIntegraHonda.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if MaskEdit19.Text = '  /  /    ' then
  begin
    Application.MessageBox('Data Inicial não informada', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    if (Self.Enabled) and (Self.Visible) and (MaskEdit19.CanFocus) then
      MaskEdit19.SetFocus;
    Exit;
  end;
  if MaskEdit20.Text = '  /  /    ' then
  begin
    Application.MessageBox('Data Final não informada', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    if (Self.Enabled) and (Self.Visible) and (MaskEdit20.CanFocus) then
      MaskEdit20.SetFocus;
    Exit;
  end;

  try
   StrToDate(MaskEdit19.Text);
  except
    Application.MessageBox('Data Inicial inválida', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    if (Self.Enabled) and (Self.Visible) and (MaskEdit19.CanFocus) then
      MaskEdit19.SetFocus;
    Exit;
  end;

  try
   StrToDate(MaskEdit20.Text);
  except
    Application.MessageBox('Data Final inválida', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    if (Self.Enabled) and (Self.Visible) and (MaskEdit20.CanFocus) then
      MaskEdit20.SetFocus;
    Exit;
  end;

  if StrToDate(MaskEdit19.Text) > StrToDate(MaskEdit20.Text) then
  begin
    Application.MessageBox('Data Final menor que Data Inicial', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    if (Self.Enabled) and (Self.Visible) and (MaskEdit20.CanFocus) then
      MaskEdit20.SetFocus;
    Exit;
  end;

  try
   BitBtn1.Enabled := False;
   BitBtn2.Enabled := False;
   BitBtn3.Enabled := False;
   ObFabrica.MontarMSI(MaskEdit19.Text, MaskEdit20.Text);
  finally
    BitBtn1.Enabled := True;
    BitBtn2.Enabled := True;
    BitBtn3.Enabled := True;
  end;
end;

procedure TFrmIntegraHonda.BitBtn3Click(Sender: TObject);
var
 I, J, cont: Integer;
 vNomeArq, vTemp, vArquivosP, vArquivosNP, vDestino, vArqTemp, vExtensao: string;
 vOK, vArquivo: boolean;
 ftemp, vListaArqNaoProcess: TStringList;
begin
  ftemp := TStringList.Create;
  ObFabrica.vParam.pMzM1 := trim(maskedit3.Text);
  ObFabrica.vParam.pQzQ1 := trim(maskedit4.Text);
  ObFabrica.vParam.pPZ := trim(maskedit5.Text);
  ObFabrica.vParam.pH3 := trim(maskedit6.Text);
  ObFabrica.vParam.pH4 := trim(maskedit7.Text);
  ObFabrica.vParam.pH2 := trim(maskedit10.Text);
  ObFabrica.vParam.pH5 := trim(maskedit9.Text);
  ObFabrica.vParam.pH6 := trim(maskedit12.Text);
  ObFabrica.vParam.pH7 := trim(maskedit11.Text);
  ObFabrica.vParam.pH8 := trim(maskedit13.Text);
  ObFabrica.vParam.pCA := trim(maskedit14.Text);
  ObFabrica.vParam.pPN := trim(maskedit15.Text);
  ObFabrica.vParam.pH0 := trim(maskedit16.Text);

  ObFabrica.vParam.pNatOP := trim(maskedit22.Text);
  ObFabrica.vParam.pAliqPadrao := trim(MaskEdit21.Text);
  ObFabrica.vParam.pCoefLoja := trim(maskedit8.Text);

  ObFabrica.vParam.pProdSimilares := CheckBox1.Checked;
  ObFabrica.vParam.pCoefEmCimaPrecoPublico := CheckBox2.Checked;

  ObFabrica.vParam.pTipoArqCRE := CheckBox3.Checked;
  ObFabrica.vParam.pTipoArqFDC := CheckBox4.Checked;
  ObFabrica.vParam.pTipoArqPCF := CheckBox5.Checked;
  ObFabrica.vParam.pComitar := vComitar;
  ObFabrica.vParam.Memo := '';

  try

    if trim(vPastaOrigem) = '' then
    begin
      Application.MessageBox(pchar('Diretório de Origem dos Arquivos Honda não definido!'), 'Atenção', MB_OK + MB_OK);
      exit;
    end;

    if trim(vpathArquivosXML) = '' then
    begin
      Application.MessageBox(pchar('Caminho XML não definido!'), 'Atenção', MB_OK + MB_OK);
      exit;
    end;

    if not DirectoryExists(vPastaOrigem) then
      if not CreateDir(vPastaOrigem) then
      begin
        Application.MessageBox(pchar('Erro ao criar diretório de Origem dos Arquivos Honda!' + #13 + vPastaOrigem), 'Atenção', MB_OK + MB_OK);
        exit;
      end;

   if not DirectoryExists(vPastaDestino) then
     if not CreateDir(vPastaDestino) then
     begin
        Application.MessageBox(pchar('Erro ao criar diretório "'+ vPastaDestino), 'Atenção', MB_ICONERROR + MB_OK);
        exit;
     end;

   if not DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas') then
     if not CreateDir(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas') then
     begin
        Application.MessageBox(pchar('Erro ao criar diretório "' + vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas'), 'Atenção', MB_OK + MB_OK);
        exit;
     end;

   if not DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\TempT') then
     if not CreateDir(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\TempT') then
     begin
        Application.MessageBox(pchar('Erro ao criar diretório "' + vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\TempT'), 'Atenção', MB_OK + MB_OK);
        exit;
     end;

   try
     BitBtn1.Enabled := False;
     BitBtn2.Enabled := False;
     BitBtn3.Enabled := False;
     if not vDadosIni.PesqPros('FAB013', 'PROCESSAR ARQUIVOS', '', '','', ObFabrica.buscas, true) then
       Exit;

     Screen.Cursor := crHourGlass;
     vListaArqNaoProcess := TStringList.Create;
     vListaArqNaoProcess.Clear;
     vArquivosP := '';//#13;
     vArquivosNP := #13;

     ObFabrica.fArquivos1.Clear;
     ObFabrica._localizarArquivos(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\TempT', ObFabrica.fArquivos1);
     for J := 0 to ObFabrica.fArquivos1.Count - 1 do
       DeleteFile(pchar(ObFabrica.fArquivos1[J]));

     ObFabrica.fArquivos.Clear;
     ObFabrica.fArquivos2.Clear;
     ObFabrica._localizarArquivos(vPastaOrigem, ObFabrica.fArquivos);
     ObFabrica.fArquivos.Sorted := true;

     ObFabrica.vParam.ContArq := 0;
     ObFabrica.vParam.TotArq := ObFabrica.fArquivos.Count;
     for I := 0 to ObFabrica.fArquivos.Count - 1 do
     begin
       ObFabrica.vParam.ContArq := ObFabrica.vParam.ContArq + 1;
       vExtensao := ExtractFileExt(ObFabrica.fArquivos[I]);
       vArquivo := true;
       if (UpperCase(trim(vExtensao)) = '.TXT') then
       begin
         if not CopyFile(PChar(ObFabrica.fArquivos[I]), PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\TempT\'
          + ExtractFileName(ObFabrica.fArquivos[I])), False) then
         begin
           vArquivo := false;
           vListaArqNaoProcess.Add(ExtractFileName(ObFabrica.fArquivos[I]));
           Application.MessageBox(pchar('Não foi possível copiar arquivo: ' + ObFabrica.fArquivos[I] + ', destino: ' + pchar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\TempT')), 'Atenção', MB_OK + MB_OK);
         end;
       end
       else
       begin
         if not DescompactarArquivo(PChar(ObFabrica.fArquivos[I]), PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\TempT'), False) then
         begin
           vArquivo := false;
           vListaArqNaoProcess.Add(ExtractFileName(ObFabrica.fArquivos[I]));
           Application.MessageBox(pchar('Não foi possível descompactar arquivo: ' + ObFabrica.fArquivos[I] + ', destino: ' + vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\TempT'), 'Atenção', MB_OK + MB_OK);
         end;
       end;

       if vArquivo then
       begin
         ObFabrica.fArquivos1.Clear;
         ObFabrica._localizarArquivos(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\TempT', ObFabrica.fArquivos1);
         ObFabrica.fArquivos1.Sorted := true;

         vNomeArq := ExtractFileName(ObFabrica.fArquivos[I]);
         vDestino := vPastaDestino + '\'+ vNomeArq;

         if CopyFile(PChar(ObFabrica.fArquivos[I]), PChar(vDestino), False) then
         begin
           for J := 0 to ObFabrica.fArquivos1.Count - 1 do
           begin
             if not ObFabrica.ProcessarArquivo(ObFabrica.fArquivos1[J], vNomeArq) then
             begin
               vListaArqNaoProcess.Add(ExtractFileName(ObFabrica.fArquivos[I]));
               vOK := False;
               break;
             end;
             vOK := True;
           end;
         end
         else
         begin
           vListaArqNaoProcess.Add(ExtractFileName(ObFabrica.fArquivos[I]));
           Application.MessageBox(pchar('Não foi possível copiar arquivo: ' + ObFabrica.fArquivos[I] + ', destino: ' + vDestino), 'Atenção', MB_OK + MB_OK);
           vOK := False;
           break;
         end;

         if vOK then
         begin
           ObFabrica.fArquivos2.Add(ObFabrica.fArquivos[I]);
           DeleteFile(ObFabrica.fArquivos[I]);

           vTemp := ExtractFileName(ObFabrica.fArquivos[I]);
           vArquivosP := vArquivosP + #13 + vTemp;

           for J := 0 to ObFabrica.fArquivos1.Count - 1 do
             DeleteFile(ObFabrica.fArquivos1[J]);
         end
         else
         begin
           vTemp := ExtractFileName(ObFabrica.fArquivos[I]);
           vArquivosNP := vArquivosNP + #13 + vTemp;

           DeleteFile(vDestino);
           for J := 0 to ObFabrica.fArquivos1.Count - 1 do
             DeleteFile(ObFabrica.fArquivos1[J]);
         end;

         Memo1.Lines.Text := ObFabrica.vParam.Memo;
       end;

     end;
     ObFabrica.fArquivos1.Clear;
     ObFabrica._localizarArquivos(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\TempT', ObFabrica.fArquivos1);
     ObFabrica.fArquivos1.Sorted := true;
     for I := 0 to ObFabrica.fArquivos1.Count - 1 do
       DeleteFile(pchar(ObFabrica.fArquivos1[I]));

     if (ObFabrica.fArquivos2.Count > 0) and (vListaArqNaoProcess.Count = 0) then
       Application.MessageBox(pchar('Arquivos processados com sucesso!' + vArquivosP), 'Atenção', MB_ICONINFORMATION + MB_OK)
     else if (ObFabrica.fArquivos2.Count > 0) and (vListaArqNaoProcess.Count > 0) then
       Application.MessageBox(pchar( 'Atenção! Um ou mais arquivos não puderam ser processados. Confira abaixo' + #13 + #13 +
         'Arquivos não processados!' + #13 + vListaArqNaoProcess.Text + #13 +
         'Arquivos processados com sucesso!' + vArquivosP), 'Atenção', MB_ICONERROR + MB_OK)
     else if (vListaArqNaoProcess.Count > 0) then
       Application.MessageBox(pchar( 'Atenção! Um ou mais arquivos não puderam ser processados. Confira abaixo' + #13 + #13 +
         'Arquivos não processados!' + #13 + vListaArqNaoProcess.Text), 'Atenção', MB_ICONERROR + MB_OK)
     else
       Application.MessageBox(pchar('Nenhum arquivo processado!'), 'Atenção', MB_ICONINFORMATION + MB_OK);
   finally
      BitBtn1.Enabled := True;
      BitBtn2.Enabled := True;
      BitBtn3.Enabled := True;
      Screen.Cursor := crDefault;
      if ObFabrica.fArquivos2.Count > 0 then
        vDadosIni.GravaAuditoria('FAB013', 'PROCESSAR ARQUIVOS', 'SUCESSO', '', '', ObFabrica.buscas)
      else
        vDadosIni.GravaAuditoria('FAB013', 'PROCESSAR ARQUIVOS', 'FALHA', '', '', ObFabrica.buscas);
   end;
  except
  end;
end;

procedure TFrmIntegraHonda.BitBtn1Click(Sender: TObject);
begin
  Close;                      
end;

procedure TFrmIntegraHonda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
   if (ObFabrica <> nil) then
    ObFabrica.Cancel;

  ObFabrica.free;
  ObFabrica := nil;

  Action := caFree;
  FrmIntegraHonda.Free;
  FrmIntegraHonda := nil;
end;

procedure TFrmIntegraHonda.FormCreate(Sender: TObject);
begin
  inherited;
  ObFabrica := TFabricaHonda.create;
  FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TFrmIntegraHonda.FormShow(Sender: TObject);
var
  wdata: string;
  mzm1: string;
  vNomeArq, vTemp: string;
begin
  inherited;
    vpathArquivosXML := vDadosIni.vEmp.vNfe.pathArquivos;
    if FileExists(ExtractFilePath(Application.Exename) + 'HwSistemas.Ini') then
     ArqIni := ExtractFilePath(Application.Exename) + 'HwSistemas.Ini'
    else
     ArqIni := ExtractFilePath(Application.Exename) + 'Config.Ini';
    ArqConfig := TIniFile.Create(ArqIni);
    mzm1 := ArqConfig.ReadString('alteracaop', 'mzm1', '');
    if trim(mzm1) <> '' then
    begin
      maskedit10.text := ArqConfig.ReadString('alteracaop', 'h2', '');
      maskedit9.text := ArqConfig.ReadString('alteracaop', 'h5', '');
      maskedit12.text := ArqConfig.ReadString('alteracaop', 'h6', '');
      maskedit11.text := ArqConfig.ReadString('alteracaop', 'h7', '');
      maskedit13.text := ArqConfig.ReadString('alteracaop', 'h8', '');
      maskedit14.text := ArqConfig.ReadString('alteracaop', 'ca', '');
      maskedit15.text := ArqConfig.ReadString('alteracaop', 'pn', '');
      maskedit22.text := ArqConfig.ReadString('alteracaop', 'natopp', '');
      maskedit3.text := mzm1;
      maskedit4.text := ArqConfig.ReadString('alteracaop', 'qzq1', '');;
      maskedit5.text := ArqConfig.ReadString('alteracaop', 'pz', '');;
      maskedit6.text := ArqConfig.ReadString('alteracaop', 'h3', '');;
      maskedit7.text := ArqConfig.ReadString('alteracaop', 'h4', '');;
      maskedit16.text := ArqConfig.ReadString('alteracaop', 'h0', '');
      MaskEdit21.text := ArqConfig.ReadString('alteracaop', 'AliqPadrao', '');
      MaskEdit8.text := ArqConfig.ReadString('alteracaop', 'CoefLoja', '');
      vComitar := ArqConfig.ReadString('alteracaop', 'Comitar', '');
    end;
    vPastaOrigem := ArqConfig.ReadString('Veiculos', 'PastaArqHonda', '');
    vPastaDestino := vpathArquivosXML + '\Transito';
end;

initialization
  RegisterClass(TFrmIntegraHonda);
finalization
  UnRegisterClass(TFrmIntegraHonda);

end.

