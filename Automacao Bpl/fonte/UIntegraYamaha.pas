unit UIntegraYamaha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadrao, StdCtrls, ComCtrls, Buttons, Mask, FileCtrl, ExtCtrls,inifiles,
  uPadrao, UClassesFabrica;

type
  TFrmIntegraYamaha = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    GroupBox1: TGroupBox;
    ckNCM: TCheckBox;
    meNatOpPadrao: TMaskEdit;
    meCSTPadrao: TMaskEdit;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    meALIQPadrao: TMaskEdit;
    ckPadrao: TCheckBox;
    Label4: TLabel;
    meNatOpSt: TMaskEdit;
    Label5: TLabel;
    meNatOpTributado: TMaskEdit;
    Label6: TLabel;
    meAliqSt: TMaskEdit;
    Label7: TLabel;
    meAliqTrib: TMaskEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GroupBox1Enter(Sender: TObject);
    procedure ckPadraoClick(Sender: TObject);
    procedure ckNCMClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmIntegraYamaha: TFrmIntegraYamaha;
  ObFabricaYamaha: TFabricaYamaha;
  ArqIni: string;
  ArqConfigY: TiniFile;
  vPastaOrigem, vPastaDestino, vpathArquivosXML: string;

implementation

uses uDtmAtivo, uclassesprodutos, uDadosIni, uDataSet_OOP, DB, ShlObj, MaskUtils, uDtmFabrica, uclassesContasAPagar;//uclassesContasAPagar,uDtmContasAPagar,  UClassesPedVenda,udtmPedVenda;

function Descompactar(pArquivo, pDiretorio, Caption: PChar): PChar; stdcall;
  		external 'Compacta.dll';

function DescompactarArquivo(pArquivo, pDestino: PChar; pUseStoredDirs: boolean): Boolean; stdcall;
  external 'Compacta.dll';

function ApagaDir(sPath : String): Boolean; stdcall;
  external 'Compacta.dll';


{$R *.dfm}

procedure TFrmIntegraYamaha.BitBtn1Click(Sender: TObject);
begin
 Close;
end;

procedure TFrmIntegraYamaha.BitBtn3Click(Sender: TObject);
var
  I, J, cont: Integer;
  vNomeArq, vTemp, vArquivosP, vArquivosNP, vDestino, vArqTemp, vExtensao: string;
  vOK, vArquivo: boolean;
  ftemp, vListaArqNaoProcess: TStringList;
begin
  ObFabricaYamaha.vParam.pPadrao := ckPadrao.Checked;
  ObFabricaYamaha.vParam.pAliqPadrao := meALIQPadrao.Text;
  ObFabricaYamaha.vParam.pNatOP := meNatOpPadrao.Text;
  ObFabricaYamaha.vParam.pCSTPadrao := meCSTPadrao.Text;

  ObFabricaYamaha.vParam.pNCM := ckNCM.Checked;
  ObFabricaYamaha.vParam.pNatOPST := meNatOpSt.Text;
  ObFabricaYamaha.vParam.pNatOpTrib := meNatOpTributado.Text;
  ObFabricaYamaha.vParam.pAliqSt := meAliqSt.Text;
  ObFabricaYamaha.vParam.pAliqTrib := meAliqTrib.Text;

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
     BitBtn3.Enabled := False;
     if not vDadosIni.PesqPros('FAB013', 'PROCESSAR ARQUIVOS', '', '','', ObFabricaYamaha.buscas, true) then
       Exit;

	   Screen.Cursor := crHourGlass;
     vListaArqNaoProcess := TStringList.Create;
     vListaArqNaoProcess.Clear;
     vArquivosP := '';//#13;
     vArquivosNP := #13;

     ObFabricaYamaha.fArquivos1.Clear;
     ObFabricaYamaha._localizarArquivos(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\TempT', ObFabricaYamaha.fArquivos1);
     for J := 0 to ObFabricaYamaha.fArquivos1.Count - 1 do
       DeleteFile(pchar(ObFabricaYamaha.fArquivos1[J]));

     ObFabricaYamaha.fArquivos.Clear;
     ObFabricaYamaha.fArquivos2.Clear;
     ObFabricaYamaha._localizarArquivos(vPastaOrigem, ObFabricaYamaha.fArquivos);
     ObFabricaYamaha.fArquivos.Sorted := true;

     ObFabricaYamaha.vParam.ContArq := 0;
     ObFabricaYamaha.vParam.TotArq := ObFabricaYamaha.fArquivos.Count;
     for I := 0 to ObFabricaYamaha.fArquivos.Count - 1 do
     begin
       ObFabricaYamaha.vParam.ContArq := ObFabricaYamaha.vParam.ContArq + 1;
       vExtensao := ExtractFileExt(ObFabricaYamaha.fArquivos[I]);
       vArquivo := true;
       if (UpperCase(trim(vExtensao)) = '.TXT') then
       begin
         if not CopyFile(PChar(ObFabricaYamaha.fArquivos[I]), PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\TempT\'
          + ExtractFileName(ObFabricaYamaha.fArquivos[I])), False) then
         begin
           vArquivo := false;
           vListaArqNaoProcess.Add(ExtractFileName(ObFabricaYamaha.fArquivos[I]));
           Application.MessageBox(pchar('Não foi possível copiar arquivo: ' + ObFabricaYamaha.fArquivos[I] + ', destino: ' + pchar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\TempT')), 'Atenção', MB_OK + MB_OK);
         end;
       end
       else
       begin
         if not DescompactarArquivo(PChar(ObFabricaYamaha.fArquivos[I]), PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\TempT'), False) then
         begin
           vArquivo := false;
           vListaArqNaoProcess.Add(ExtractFileName(ObFabricaYamaha.fArquivos[I]));
           Application.MessageBox(pchar('Não foi possível descompactar arquivo: ' + ObFabricaYamaha.fArquivos[I] + ', destino: ' + vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\TempT'), 'Atenção', MB_OK + MB_OK);
         end;
       end;

       if vArquivo then
       begin
         ObFabricaYamaha.fArquivos1.Clear;
         ObFabricaYamaha._localizarArquivos(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\TempT', ObFabricaYamaha.fArquivos1);
         ObFabricaYamaha.fArquivos1.Sorted := true;

         vNomeArq := ExtractFileName(ObFabricaYamaha.fArquivos[I]);
         vDestino := vPastaDestino + '\'+ vNomeArq;

         if CopyFile(PChar(ObFabricaYamaha.fArquivos[I]), PChar(vDestino), False) then
         begin
           for J := 0 to ObFabricaYamaha.fArquivos1.Count - 1 do
           begin
             if not ObFabricaYamaha.ProcessarArquivo(ObFabricaYamaha.fArquivos1[J], vNomeArq) then
             begin
               vListaArqNaoProcess.Add(ExtractFileName(ObFabricaYamaha.fArquivos[I]));
               vOK := False;
               break;
             end;
             vOK := True;
           end;
         end
         else
         begin
           vListaArqNaoProcess.Add(ExtractFileName(ObFabricaYamaha.fArquivos[I]));
           Application.MessageBox(pchar('Não foi possível copiar arquivo: ' + ObFabricaYamaha.fArquivos[I] + ', destino: ' + vDestino), 'Atenção', MB_OK + MB_OK);
           vOK := False;
           break;
         end;

         if vOK then
         begin
           ObFabricaYamaha.fArquivos2.Add(ObFabricaYamaha.fArquivos[I]);
           DeleteFile(ObFabricaYamaha.fArquivos[I]);

           vTemp := ExtractFileName(ObFabricaYamaha.fArquivos[I]);
           vArquivosP := vArquivosP + #13 + vTemp;

           for J := 0 to ObFabricaYamaha.fArquivos1.Count - 1 do
             DeleteFile(ObFabricaYamaha.fArquivos1[J]);
         end
         else
         begin
           vTemp := ExtractFileName(ObFabricaYamaha.fArquivos[I]);
           vArquivosNP := vArquivosNP + #13 + vTemp;

           DeleteFile(vDestino);
           for J := 0 to ObFabricaYamaha.fArquivos1.Count - 1 do
             DeleteFile(ObFabricaYamaha.fArquivos1[J]);
         end;

         //Memo1.Lines.Text := ObFabricaYamaha.vParam.Memo;
       end;
       if (ObFabricaYamaha.fProdutosNProcessados.Count > 0) then
	       Application.MessageBox(pchar('Produto(s) não cadastrados, código de barras repetido!' + #13+ ObFabricaYamaha.fProdutosNProcessados.Text + #13 + 'Favor verificar!'), 'Atenção', MB_ICONINFORMATION + MB_OK)
     end;
     ObFabricaYamaha.fArquivos1.Clear;
     ObFabricaYamaha._localizarArquivos(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\TempT', ObFabricaYamaha.fArquivos1);
     ObFabricaYamaha.fArquivos1.Sorted := true;
     for I := 0 to ObFabricaYamaha.fArquivos1.Count - 1 do
       DeleteFile(pchar(ObFabricaYamaha.fArquivos1[I]));

     if (ObFabricaYamaha.fArquivos2.Count > 0) and (vListaArqNaoProcess.Count = 0) then
       Application.MessageBox(pchar('Arquivos processados com sucesso!' + vArquivosP), 'Atenção', MB_ICONINFORMATION + MB_OK)
     else if (ObFabricaYamaha.fArquivos2.Count > 0) and (vListaArqNaoProcess.Count > 0) then
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
      BitBtn3.Enabled := True;
      Screen.Cursor := crDefault;
      if ObFabricaYamaha.fArquivos2.Count > 0 then
        vDadosIni.GravaAuditoria('FAB013', 'PROCESSAR ARQUIVOS', 'SUCESSO', '', '', ObFabricaYamaha.buscas)
      else
        vDadosIni.GravaAuditoria('FAB013', 'PROCESSAR ARQUIVOS', 'FALHA', '', '', ObFabricaYamaha.buscas);
   end;
  except
  end;
end;

procedure TFrmIntegraYamaha.ckNCMClick(Sender: TObject);
begin
  ckPadrao.Checked := not ckNCM.Checked;
  meNatOpSt.Enabled := ckNCM.Checked;
  meNatOpTributado.Enabled := ckNCM.Checked;
  meAliqSt.Enabled := ckNCM.Checked;
  meAliqTrib.Enabled := ckNCM.Checked;

  if (Self.Enabled) and (Self.Visible) and (meNatOpSt.CanFocus) then
  	meNatOpSt.SetFocus;
  GroupBox1Enter(Sender);  
end;

procedure TFrmIntegraYamaha.ckPadraoClick(Sender: TObject);
begin
  ckNCM.Checked := not ckPadrao.Checked;
  meNatOpPadrao.Enabled := ckPadrao.Checked;
  meCSTPadrao.Enabled := ckPadrao.Checked;
  meALIQPadrao.Enabled := ckPadrao.Checked;

  if (Self.Enabled) and (Self.Visible) and (meNatOpPadrao.CanFocus) then
  	meNatOpPadrao.SetFocus;
  GroupBox1Enter(Sender);
end;

procedure TFrmIntegraYamaha.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 inherited;
  Action := caFree;
  FrmIntegraYamaha.Free;
  FrmIntegraYamaha := nil;
end;

procedure TFrmIntegraYamaha.FormCreate(Sender: TObject);
begin
 inherited;
  ObFabricaYamaha := TFabricaYamaha.create;
  FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TFrmIntegraYamaha.FormShow(Sender: TObject);
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
    ArqConfigY := TIniFile.Create(ArqIni);

    ckPadrao.Checked := trim(ArqConfigY.ReadString('alteracaop', 'TipoProc', '')) <> 'NCM';
    meNatOpPadrao.Text := ArqConfigY.ReadString('alteracaop', 'natopp', '');
    meCSTPadrao.Text := ArqConfigY.ReadString('alteracaop', 'CstPadrao', '');
    meALIQPadrao.Text := ArqConfigY.ReadString('alteracaop', 'AliqPadrao', '');

    meNatOpPadrao.Enabled := ckPadrao.Checked;
    meCSTPadrao.Enabled := ckPadrao.Checked;
    meALIQPadrao.Enabled := ckPadrao.Checked;

    ckNCM.Checked := trim(ArqConfigY.ReadString('alteracaop', 'TipoProc', '')) = 'NCM';
    meNatOpSt.Text := ArqConfigY.ReadString('alteracaop', 'NatOPST', '');
    meNatOpTributado.Text := ArqConfigY.ReadString('alteracaop', 'NatOPTrib', '');
    meAliqSt.Text := ArqConfigY.ReadString('alteracaop', 'AliqST', '');
    meAliqTrib.Text := ArqConfigY.ReadString('alteracaop', 'AliqTrib', '');

    meNatOpSt.Enabled := ckNCM.Checked;
    meNatOpTributado.Enabled := ckNCM.Checked;
    meAliqSt.Enabled := ckNCM.Checked;
    meAliqTrib.Enabled := ckNCM.Checked;

    vPastaOrigem := ArqConfigY.ReadString('Veiculos', 'PastaArqHonda', '');
    vPastaDestino := vpathArquivosXML + '\Transito';
    GroupBox1Enter(Sender);
  vDadosIni.hw_registra_estatistica(Self.Name);
end;

procedure TFrmIntegraYamaha.GroupBox1Enter(Sender: TObject);
begin
  meNatOpSt.Color := vDadosIni.IfThen(ckNCM.Checked, clWindow, clBtnFace);
  meNatOpSt.Color := vDadosIni.IfThen(ckNCM.Checked, clWindow, clBtnFace);
  meAliqSt.Color := vDadosIni.IfThen(ckNCM.Checked, clWindow, clBtnFace);
  meNatOpTributado.Color := vDadosIni.IfThen(ckNCM.Checked, clWindow, clBtnFace);
  meAliqTrib.Color := vDadosIni.IfThen(ckNCM.Checked, clWindow, clBtnFace);

  meNatOpPadrao.Color := vDadosIni.IfThen(ckPadrao.Checked, clWindow, clBtnFace);
  meCSTPadrao.Color := vDadosIni.IfThen(ckPadrao.Checked, clWindow, clBtnFace);
  meALIQPadrao.Color := vDadosIni.IfThen(ckPadrao.Checked, clWindow, clBtnFace);
end;

initialization
  RegisterClass(TFrmIntegraYamaha);
finalization
  UnRegisterClass(TFrmIntegraYamaha);


end.
