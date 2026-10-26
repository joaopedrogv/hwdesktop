unit uImagensDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ExtDlgs, UClassesCadastrosBasicos;

type
  TfrmImagensDoc = class(TForm)
    ScrollBox1: TScrollBox;
    Panel1: TPanel;
    pnImagemDoc: TPanel;
    Panel57: TPanel;
    SpeedButton48: TSpeedButton;
    SpeedButton49: TSpeedButton;
    SpeedButton50: TSpeedButton;
    SpeedButton51: TSpeedButton;
    SpeedButton52: TSpeedButton;
    Panel55: TPanel;
    Panel110: TPanel;
    Image1: TImage;
    pnEscolherImage: TPanel;
    lbDescProdImg: TLabel;
    pnDescImagemProduto: TPanel;
    pnLabelImagemDoc: TLabel;
    Panel2: TPanel;
    OpenPictureDialog1: TOpenPictureDialog;
    lbS_qtdeImg: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    procedure SpeedButton50Click(Sender: TObject);
    procedure Image1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton52Click(Sender: TObject);
    procedure SpeedButton51Click(Sender: TObject);
    procedure SpeedButton49Click(Sender: TObject);
    procedure SpeedButton48Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    function testarDiretorioImagem: boolean;
    procedure abrirDiretorioDestinoImagem;
  private
    { Private declarations }
  public
    { Public declarations }
    vGrupoProd: Integer;
    vCodProd: string;
    vCodigo: Integer;
    vCodEmpresa: Integer;
    vTipo: string;

    // Processo
    vProcessoAdicionar: string;
    vProcessoRevomer: string;
    vProcessoVisualizar: string;
    vProcessoProximo: string;
    vProcessoAnterior: string;

    //Tabela
    vNomeTabela: string;

    //Codigo Tabela Movimentada
    vCodigoTabMovimentada: string;
  end;

var
  frmImagensDoc: TfrmImagensDoc;
  vImagensDoc: TImagensDoc;
  vDiretorioDestino: string;

implementation

uses
  uDtmCadastrosBasicos, uDadosIni, uDtmAtivo, StrUtils,
  uDataSet_OOP, DateUtils, DB;

procedure hw_image_view(Source: WideString); stdcall; external 'hw.utils.dx.dll';

{$R *.dfm}

procedure TfrmImagensDoc.abrirDiretorioDestinoImagem;
begin
 if trim(vTipo) = 'PROD' then
 	 vDiretorioDestino := vDadosIni.getConfSisStr('prod_cad_diretorio_padrao_imagens', vImagensDoc.buscas)
 else
   vDiretorioDestino := vDadosIni.getConfSisStr('ctp_diretorio_padrao_imagens', vImagensDoc.buscas);

 if (trim(vDiretorioDestino) <> '') then
   if Pos('\', vDiretorioDestino) > 0 then
     if Copy(vDiretorioDestino, Length(vDiretorioDestino), 1) <> '\' then
       vDiretorioDestino := vDiretorioDestino + '\';
end;

procedure TfrmImagensDoc.BitBtn1Click(Sender: TObject);
begin
	ModalResult := mrCancel;
end;

procedure TfrmImagensDoc.FormCreate(Sender: TObject);
begin
	if not Assigned(frmImagensDoc) then
	  frmImagensDoc := TfrmImagensDoc(self);
  vImagensDoc := TImagensDoc.Create;
end;

procedure TfrmImagensDoc.FormShow(Sender: TObject);
begin
	if not testarDiretorioImagem then
  begin
  	PostMessage(frmImagensDoc.Handle, WM_CLOSE, 0, 0);
    exit;
  end;
      
  abrirDiretorioDestinoImagem;

	vImagensDoc.abreImagem(
  	vCodigo,
    vCodEmpresa,
    vTipo);

  if vImagensDoc.IsEmpty then
  begin
  	Image1.Picture.LoadFromFile('');
    Image1.Hint    := '';
    lbS_qtdeImg.Caption := '0/0';
  end
  else
  begin
	  vImagensDoc.dataSet.First;
    if not FileExists(IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') + vImagensDoc.dataSet.FieldByName('IMAGEM').AsString) then
    begin
    	if not FileExists(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg') then
      	Image1.Picture.LoadFromFile('')
      else
        Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg')
    end
    else
      Image1.Picture.LoadFromFile(IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
          vImagensDoc.dataSet.FieldByName('IMAGEM').AsString);
	  Image1.Hint    := IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
    	vImagensDoc.dataSet.FieldByName('IMAGEM').AsString;
    lbS_qtdeImg.Caption := IntToStr(vImagensDoc.dataSet.RecNo) +
	    '/' + IntToStr(vImagensDoc.dataSet.RecordCount);
  end;
end;

procedure TfrmImagensDoc.Image1DblClick(Sender: TObject);
var
  vTemp: string;
begin
  if vImagensDoc.dataSet.RecordCount <= 0 then
  	exit;

  vTemp := IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
  	vImagensDoc.dataSet.FieldByName('IMAGEM').AsString;
  InputQuery('Endereço da Imagem', 'Endereço da imagem', vTemp);
end;

procedure TfrmImagensDoc.SpeedButton48Click(Sender: TObject);
var
  vFileNameOrigem: string;
  vFileNameDestino: string;
  positionTemp: Integer;
  I: Integer;
  vtemp: string;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if not OpenPictureDialog1.Execute then
      exit;

    if not vDadosIni.PesqPros(
    	vProcessoAdicionar,
      'ADICIONAR IMAGEM',
      '',
      vNomeTabela,
      vCodigoTabMovimentada,
      vImagensDoc.buscas,
      true) then
        exit;

    try
    	for I := 0 to OpenPictureDialog1.Files.Count - 1 do
      begin
      	try
          vFileNameOrigem := OpenPictureDialog1.Files[I];//OpenPictureDialog1.FileName;

          vFileNameDestino := IfThen(trim(vDiretorioDestino) <> '',
              trim(vDiretorioDestino) + trim(ExtractFileName(vFileNameOrigem)),
              trim(vFileNameOrigem));

          if (UpperCase(ExtractFileExt(vfilenameorigem)) <> '.JPG')
            and (UpperCase(ExtractFileExt(vfilenameorigem)) <> '.JPEG')
            {and (UpperCase(ExtractFileExt(vfilenameorigem)) <> '.BMP')} then
          begin
            Application.MessageBox(PChar('Imagem selecionada não esta no formato aceito pelo sistema: ' + #13 + #13 +
              'Formatos suportados: JPG e JPEG '+ #13 + //JPG, JPEG e BMP '+ #13 +
              'Imagem: ' + ExtractFileName(vFileNameOrigem)), 'Atenção', MB_ICONERROR + MB_DEFBUTTON1);
            exit;
          end;

//          if (trim(vDiretorioDestino) <> '') then
//          begin
//            while True do
//            begin
//              if not FileExists(PChar(trim(vDiretorioDestino) + ExtractFileName(vFileNameDestino))) then
//                Break
//              else if Pos(UpperCase(trim(vDiretorioDestino)), UpperCase(trim(vfilenameorigem))) > 0 then
//                Break
//              else
//                vFileNameDestino := StringReplace(vFileNameDestino, ExtractFileExt(vFileNameDestino), '', [rfIgnoreCase]) + '1' +
//                    ExtractFileExt(vFileNameDestino);
//            end;
//            if Pos(UpperCase(trim(vDiretorioDestino)), UpperCase(trim(vfilenameorigem))) <= 0 then
//              if not CopyFile(PChar(vfilenameorigem), PChar(trim(vDiretorioDestino) + trim(ExtractFileName(vFileNameDestino))), True) then
//              begin
//                Application.MessageBox(PChar('Falha ao copiar a imagem: ' + #13 + #13 +
//                   trim(vDiretorioDestino) + ExtractFileName(vFileNameDestino)), 'Atenção', 0 + 64);
//                exit;
//              end;
//          end;

          // Criar classes e adicionar imagens a lista
          vFileNameDestino := vImagensDoc.adicionarImagem(
            vCodigo,
            vCodEmpresa,
            vTipo,
            vFileNameOrigem,
            vFileNameDestino,
            vDiretorioDestino,
            vGrupoProd,
            vCodProd);

          if vImagensDoc.dataSet.IsEmpty then
          begin
            Image1.Picture.LoadFromFile('');
            Image1.Hint    := '';
            lbS_qtdeImg.Caption := '0/0';
          end
          else
          begin
            vImagensDoc.dataSet.Last;
            Image1.Picture.LoadFromFile(IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
              vImagensDoc.dataSet.FieldByName('IMAGEM').AsString);
            Image1.Hint    := IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
              vImagensDoc.dataSet.FieldByName('IMAGEM').AsString;
            lbS_qtdeImg.Caption := IntToStr(vImagensDoc.dataSet.RecNo) +
              '/' + IntToStr(vImagensDoc.dataSet.RecordCount);
          end;

          vDadosIni.GravaAuditoria(
            vProcessoAdicionar,
            'ADICIONAR IMAGEM',
            'SUCESSO - ' + ExtractFileName(vFileNameDestino),
            vNomeTabela,
            vCodigoTabMovimentada,
            vImagensDoc.buscas);

        except on E: Exception do
        	begin
            vDadosIni.GravaAuditoria(
              vProcessoAdicionar,
              'ADICIONAR IMAGEM',
              'FALHA - ' + ExtractFileName(vFileNameDestino),
              vNomeTabela,
              vCodigoTabMovimentada,
              vImagensDoc.buscas);
              
            Application.MessageBox(Pchar('Falha adicionar imagem. Erro: '+ e.Message), 'Erro', 0 + 64);
        	end;
      	end;
      end;
    except on E: Exception do
      begin
      	Application.MessageBox(Pchar('Falha adicionar imagem. Erro: '+ e.Message), 'Erro', 0 + 64);
     end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmImagensDoc.SpeedButton49Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    lbS_qtdeImg.Caption := IntToStr(vImagensDoc.dataSet.RecNo) +
      '/' + IntToStr(vImagensDoc.dataSet.RecordCount);

    if vImagensDoc.dataSet.RecordCount > 0 then
      if (vImagensDoc.dataSet.RecNo = vImagensDoc.dataSet.RecordCount) then
      begin
        Application.MessageBox(PChar('Fim da lista de imagens!'), 'Atenção', MB_ICONWARNING + MB_DEFBUTTON1);
        exit;
      end;

    if not vDadosIni.PesqPros(
    	vProcessoProximo,
      'PROXIMA IMAGEM',
      '',
      vNomeTabela,
      vCodigoTabMovimentada,
      vImagensDoc.buscas,
      true) then
        exit;

    try
    	if vImagensDoc.dataSet.RecordCount > 0 then
     		if (vImagensDoc.dataSet.RecNo < vImagensDoc.dataSet.RecordCount) then
        	vImagensDoc.dataSet.Next;


      if vImagensDoc.dataSet.RecordCount > 0 then
      begin
      	if not FileExists(IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') + vImagensDoc.dataSet.FieldByName('IMAGEM').AsString) then
        begin
					if not FileExists(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg') then
            Image1.Picture.LoadFromFile('')
          else
            Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg')
        end
        else
          Image1.Picture.LoadFromFile(IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
            vImagensDoc.dataSet.FieldByName('IMAGEM').AsString);
        Image1.Hint    := IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
        	vImagensDoc.dataSet.FieldByName('IMAGEM').AsString;
      end;

      lbS_qtdeImg.Caption := IntToStr(vImagensDoc.dataSet.RecNo) +
        '/' + IntToStr(vImagensDoc.dataSet.RecordCount);

      vDadosIni.GravaAuditoria(
      	vProcessoProximo,
      	'PROXIMA IMAGEM',
        'SUCESSO',
        vNomeTabela,
        vCodigoTabMovimentada,
        vImagensDoc.buscas);

    except on E: Exception do
      begin
      	vDadosIni.GravaAuditoria(
        	vProcessoProximo,
          'PROXIMA IMAGEM',
          'FALHA',
	        vNomeTabela,
          vCodigoTabMovimentada,
          vImagensDoc.buscas);
          
        Application.MessageBox(Pchar('Falha posicionar a proxima imagem. Erro: '+ e.Message), 'Erro', 0 + 64);
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmImagensDoc.SpeedButton50Click(Sender: TObject);
var
  vFileNameImage: string;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if vImagensDoc.dataSet.RecordCount <= 0 then
    begin
      Application.MessageBox(PChar('Nenhuma imagem encontrada na lista'),
        'Atenção', MB_ICONWARNING + MB_DEFBUTTON1);
      exit;
    end;

    if not vDadosIni.PesqPros(
      vProcessoRevomer,
      'EXCLUIR IMAGEM',
      '',
      vNomeTabela,
      vCodigoTabMovimentada,
      vImagensDoc.buscas,
      true) then
        exit;

     try
        vFileNameImage := vImagensDoc.dataSet.FieldByName('IMAGEM').AsString;

        vImagensDoc.removerImagem(
          vCodigo,
          vCodEmpresa,
          vTipo);

        if vImagensDoc.dataSet.IsEmpty then
        begin
          Image1.Picture.LoadFromFile('');
          Image1.Hint    := '';
          lbS_qtdeImg.Caption := '0/0';
        end
        else
        begin
          Image1.Picture.LoadFromFile(IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
            vImagensDoc.dataSet.FieldByName('IMAGEM').AsString);
          Image1.Hint    := IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
            vImagensDoc.dataSet.FieldByName('IMAGEM').AsString;
          lbS_qtdeImg.Caption := IntToStr(vImagensDoc.dataSet.RecNo) +
            '/' + IntToStr(vImagensDoc.dataSet.RecordCount);
        end;

        vDadosIni.GravaAuditoria(
          vProcessoRevomer,
          'EXCLUIR IMAGEM',
          'SUCESSO - ' + ExtractFileName(vFileNameImage),
          vNomeTabela,
          vCodigoTabMovimentada,
          vImagensDoc.buscas);

    except on E: Exception do
      begin
        vDadosIni.GravaAuditoria(
          vProcessoRevomer,
          'EXCLUIR IMAGEM',
          'FALHA - ' + ExtractFileName(vFileNameImage),
          vNomeTabela,
          vCodigoTabMovimentada,
          vImagensDoc.buscas);
          
        Application.MessageBox(Pchar('Falha excluir imagem. Erro: '+ e.Message), 'Erro', 0 + 64);
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmImagensDoc.SpeedButton51Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    lbS_qtdeImg.Caption := IntToStr(vImagensDoc.dataSet.RecNo) +
      '/' + IntToStr(vImagensDoc.dataSet.RecordCount);

    if vImagensDoc.dataSet.RecordCount > 0 then
      if (vImagensDoc.dataSet.RecNo <= 1) then
      begin
        Application.MessageBox(PChar('Início da lista de imagens!'), 'Atenção', MB_ICONWARNING + MB_DEFBUTTON1);
        exit;
      end;

    if not vDadosIni.PesqPros(
    	vProcessoAnterior,
      'IMAGEM ANTERIOR',
      '',
      vNomeTabela,
      vCodigoTabMovimentada,
      vImagensDoc.buscas,
      true) then
        exit;

    try
      if vImagensDoc.dataSet.RecordCount > 0 then
     		if (vImagensDoc.dataSet.RecNo > 1) then
        	vImagensDoc.dataSet.Prior;

      if vImagensDoc.dataSet.RecordCount > 0 then
      begin
      	if not FileExists(IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') + vImagensDoc.dataSet.FieldByName('IMAGEM').AsString) then
        begin
          if not FileExists(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg') then
            Image1.Picture.LoadFromFile('')
          else
            Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg')
        end
        else
          Image1.Picture.LoadFromFile(IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
            vImagensDoc.dataSet.FieldByName('IMAGEM').AsString);
        Image1.Hint    := IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
        	vImagensDoc.dataSet.FieldByName('IMAGEM').AsString;
      end;

      lbS_qtdeImg.Caption := IntToStr(vImagensDoc.dataSet.RecNo) +
        '/' + IntToStr(vImagensDoc.dataSet.RecordCount);

      vDadosIni.GravaAuditoria(
      	vProcessoAnterior,
        'IMAGEM ANTERIOR',
        'SUCESSO',
        vNomeTabela,
        vCodigoTabMovimentada,
        vImagensDoc.buscas);

    except on E: Exception do
      begin
      	vDadosIni.GravaAuditoria(
        	vProcessoAnterior,
          'IMAGEM ANTERIOR',
          'FALHA',
	        vNomeTabela,
          vCodigoTabMovimentada,
          vImagensDoc.buscas);
          
        Application.MessageBox(Pchar('Falha posicionar imagem anterior. Erro: '+ e.Message), 'Erro', 0 + 64);
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmImagensDoc.SpeedButton52Click(Sender: TObject);
var
  wides: WideString;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if vImagensDoc.dataSet.RecordCount <= 0 then
      exit;

    if not vDadosIni.PesqPros(
    	vProcessoVisualizar,
      'VISUALIZAR IMAGEM',
      '',
    	vNomeTabela,
      vCodigoTabMovimentada,
      vImagensDoc.buscas, true) then
        exit;

    if vImagensDoc.dataSet.RecordCount > 0 then
      if not FileExists(IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') + vImagensDoc.dataSet.FieldByName('IMAGEM').AsString) then
      begin
      	Application.MessageBox(PChar('Imagem não encontrada: ' + #13 + #13 +
        	IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') + vImagensDoc.dataSet.FieldByName('IMAGEM').AsString),
          'Atenção', 0 + 64);
        exit;
      end
      else
      begin
        //viewImage(PChar(Produto.vGradesImagens.Items[Produto.vGradesImagens.fIndex].img.ItemSelected.fileNameImagemToZoom));
        wides := IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
        	vImagensDoc.dataSet.FieldByName('IMAGEM').AsString;
        hw_image_view(wides);
      end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

function TfrmImagensDoc.testarDiretorioImagem: boolean;
var
  vListaImagens: string;
begin
  Result := true;

  if trim(vTipo) = 'PROD' then
  	vListaImagens := vDadosIni.getConfSisStr('prod_cad_diretorio_padrao_imagens', vImagensDoc.buscas)
  else
  	vListaImagens := vDadosIni.getConfSisStr('ctp_diretorio_padrao_imagens', vImagensDoc.buscas);

  if trim(vListaImagens) = '' then
  begin
		Application.MessageBox(PChar('Diretório padrão para imagens do contas a pagar não foi informado, favor verificar antes de continuar!'), 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
    Result := false;
    exit;
  end;

  if trim(vListaImagens) <> '' then
  begin
    if not DirectoryExists(trim(vListaImagens)) then
    begin
      Application.MessageBox(PChar('Diretório de imagens não encontrado: ' + #13 + #13 + vListaImagens), 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      Result := false;
      exit;
    end;
  end;
end;

end.
