unit uRestruturacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, DB, IBDatabase, IBScript, Buttons,
  IBCustomDataSet, IBQuery, Menus;

  procedure setVariaveisVersao(var pVersaoBancoFiscal,
                               pVersaoBancoHwF,
                               pVersaoBancoHw,
                               pVersaoTabelaProcessos: integer;
                               var pVersaoBpl: string);

type

  
  TfrmReestruturacao = class(TForm)
    IB: TPanel;
    PageControl1: TPageControl;
    tsFiscal: TTabSheet;
    tsHwF: TTabSheet;
    tsHw: TTabSheet;
    memoFiscal: TMemo;
    memoHwf: TMemo;
    memoHw: TMemo;
    Label1: TLabel;
    ProgressBar1: TProgressBar;
    BitBtn1: TBitBtn;
    ibScriptv: TIBScript;
    ibtransacao: TIBTransaction;
    ibBanco: TIBDatabase;
    tsProcessos: TTabSheet;
    memoProcessos: TMemo;
    ibQueri: TIBQuery;
    Memo1: TMemo;
    PopupMenu1: TPopupMenu;
    CopiarTexto1: TMenuItem;
    tsOutros: TTabSheet;
    memoOutros: TMemo;
    ibScriptv2: TIBScript;
    ibBanco2: TIBDatabase;
    ibtransacao2: TIBTransaction;
    ibQueri2: TIBQuery;
    procedure ibScriptvExecuteError(Sender: TObject; Error, SQLText: string;
      LineIndex: Integer; var Ignore: Boolean);
    procedure CopiarTexto1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    function ConectarBanco(pRepl: boolean = false): boolean;
    function executarScript(j: Integer; vErros: TStringList): boolean;
  private
    vDesconectar: Boolean;
    vDesconectarVersao : integer;
    procedure _gravarLogRestruturacao(pArquivo, pSql: string);
    { Private declarations }
  public
    { Public declarations }
    vBanco: string;
    vPw, vUs: string;
  end;

var
  frmReestruturacao: TfrmReestruturacao;

implementation

uses uDtmAtivo, uDadosIni, Clipbrd;

function __getSenhaFDB: PChar; stdcall; external 'cons40.dll';
function __getUsuarioFDB: PChar; stdcall; external 'cons40.dll';
function __descriptografaTextoFDB(pTexto: PChar): PChar; stdcall; external 'cons40.dll';
function __criptografaTextoFDB(pTexto: PChar): PChar; stdcall; external 'cons40.dll';

{$R *.dfm}

procedure TfrmReestruturacao.BitBtn1Click(Sender: TObject);
var
  I: Integer;
  vCaption, vTemp: String;
  vLista, vErros: TStringList;
  j: Integer;
  vVerificadorDeVersao : boolean;
  vVersaoBancoMemo, vBDVersaoHw, vBDVersaoFiscal,vBDVersaoHwF,vBDVersaoProcessos,vBDVersaoAnteriorHw : Integer;
  vExecutarPelaQuery: Boolean;
begin
  try
    vUs := string(__getUsuarioFDB);
    vPw := string(__getSenhaFDB);
    Screen.Cursor := crHourGlass;
    BorderIcons := [];
    BitBtn1.Enabled := False;
    Memo1.Clear;
    Memo1.Visible := True;
    vVerificadorDeVersao := False;
    vVersaoBancoMemo := 0;
    try
      if vBanco = 'fiscal' then
      begin
        vErros := TStringList.Create;
        vErros.Clear;

        if vErros.Count = 0 then
          vErros.Add(IntToStr(vDadosIni.vVersaoBancoFiscal));

        vVerificadorDeVersao := False;
        vVersaoBancoMemo := 0;
        ProgressBar1.Min := 0;
        ProgressBar1.Max := memoFiscal.Lines.Count;
        ProgressBar1.Position := 0;

        ibBanco.Connected := False;
        if (Trim(vUs) <> '') then
          ibBanco.Params[0] := 'user_name=' + string(__descriptografaTextoFDB(Pchar(vUs)));
        if (Trim(vPw) <> '') then
          ibBanco.Params[1] := 'password=' + string(__descriptografaTextoFDB(Pchar(vPw)));
        ibBanco.DatabaseName := vDadosIni.vBancoFiscal;
        ibBanco.Connected := True;

        ibQueri.Close;
        ibQueri.SQL.Text := 'select versaobancofiscal, versaobancohwf, versaobancohw, versaoprocessos from EMPDESVOLV where COD_EMPDES = 1';
        try
          ibQueri.Open;
          vBDVersaoFiscal := ibQueri.FieldByName('versaobancofiscal').AsInteger;
        Except
          vBDVersaoFiscal := 0;
          ibQueri.Close;
        end;

        for I := 0 to memoFiscal.Lines.Count - 1 do
        begin
          if (i mod 50) = 0 then
          begin
            Application.ProcessMessages;
            if ibtransacao.InTransaction then
              ibtransacao.Commit;
          end;

          try
            if vDadosIni.isnumeroint(trim(memoFiscal.Lines[i])) then
            begin
              vVersaoBancoMemo := strtoint(trim(memoFiscal.Lines[i]));
              Continue;
            end;
          except
          end;
          
          if (vVersaoBancoMemo > vBDVersaoFiscal) then
            vVerificadorDeVersao := true;


          if (vVerificadorDeVersao) then
          begin
            ibScriptv.Script.Text := memoFiscal.Lines[i];

            Memo1.Clear;
            Memo1.Lines.Add(ibScriptv.Script.Text);
            try
              ibScriptv.ExecuteScript;
            except
              on e: Exception do
              begin
                vErros.Add('Linha: ' + IntToStr(I + 1 ) +  ' ' + ibScriptv.Script.Text + ' Erro: ' + e.Message);
                vDesconectar := False;
              end;
            end;
            ProgressBar1.Position := I + 1;
          end;
        end;
        if ibtransacao.InTransaction then
          ibtransacao.Commit;
        if vErros.Count > 1 then
          vErros.SaveToFile(ExtractFilePath(Application.ExeName) + 'erroReestruturaF.log');
      end
      else if vBanco = 'hwf' then
      begin
        ProgressBar1.Min := 0;
        ProgressBar1.Max := memoHwf.Lines.Count;
        ProgressBar1.Position := 0;

        ibBanco.Connected := False;
        if (Trim(vUs) <> '') then
          ibBanco.Params[0] := 'user_name=' + string(__descriptografaTextoFDB(Pchar(vUs)));
        if (Trim(vPw) <> '') then
          ibBanco.Params[1] := 'password=' + string(__descriptografaTextoFDB(Pchar(vPw)));
        ibBanco.DatabaseName := vDadosIni.vBancoHwF;
        ibBanco.Connected := True;

        ibQueri.Close;
        ibQueri.SQL.Text := 'select versaobancofiscal, versaobancohwf, versaobancohw, versaoprocessos from EMPDESVOLV where COD_EMPDES = 1';
        try
          ibQueri.Open;
          vBDVersaoHwF := ibQueri.FieldByName('versaobancohwf').AsInteger;
        Except
          vBDVersaoHwF := 0;
          ibQueri.Close;
        end;

        for I := 0 to memoHwf.Lines.Count - 1 do
        begin
          if (i mod 100) = 0 then
          begin
            Application.ProcessMessages;
            if ibtransacao.InTransaction then
              ibtransacao.Commit;
          end;

          try
            if vDadosIni.isnumeroint(trim(memoHwf.Lines[i])) then
            begin
              vVersaoBancoMemo := strtoint(trim(memoHwf.Lines[i]));
              ProgressBar1.Position := I + 1;
              Continue;
            end;
          except
          end;
          
          if (vVersaoBancoMemo > vBDVersaoHwF) then
          begin
            ProgressBar1.Position := I + 1;
            vVerificadorDeVersao := true;
          end;
          if (vVerificadorDeVersao) then
          begin
            ibScriptv.Script.Text := memoHwf.Lines[i];
            Memo1.Clear;
            Memo1.Lines.Add(ibScriptv.Script.Text);
            try
              ibScriptv.ExecuteScript;
            except
            end;
          end;
          ProgressBar1.Position := I + 1;
        end;

        if ibtransacao.InTransaction then
          ibtransacao.Commit;
      end
      else if vBanco = 'hw' then
      begin
        vErros := TStringList.Create;
        vErros.Clear;

        if vErros.Count = 0 then
          vErros.Add(IntToStr(vDadosIni.vVersaoBancoHw));

        vVerificadorDeVersao := False;
        vVersaoBancoMemo := 0;
        ProgressBar1.Min := 0;
        ProgressBar1.Max := memoHw.Lines.Count;
        ProgressBar1.Position := 0;

        ibBanco.Connected := False;
        if (Trim(vUs) <> '') then
          ibBanco.Params[0] := 'user_name=' + string(__descriptografaTextoFDB(Pchar(vUs)));
        if (Trim(vPw) <> '') then
          ibBanco.Params[1] := 'password=' + string(__descriptografaTextoFDB(Pchar(vPw)));
        ibBanco.DatabaseName := vDadosIni.vBancoHW;
        ibBanco.Connected := True;

        ibQueri.Close;
        ibQueri.SQL.Text := 'select versaobancofiscal, versaobancohwf, versaobancohw, versaoprocessos from EMPDESVOLV where COD_EMPDES = 1';
        try
          ibQueri.Open;
          vBDVersaoHw := ibQueri.FieldByName('versaobancohw').AsInteger;
          vBDVersaoProcessos := ibQueri.FieldByName('versaoprocessos').AsInteger;
        Except
          vBDVersaoHw := 0;
          vBDVersaoProcessos := 0;
          ibQueri.Close;
        end;

        vBDVersaoAnteriorHw:=0;
        ibQueri.close;
        ibQueri.SQL.Text := 'select GEN_ID(GEN_VERSAOANTERIOR_BDHW,0) from rdb$database';
        try
          ibQueri.Open;
          vBDVersaoAnteriorHw := ibQueri.FieldByName('GEN_ID').asinteger;
        Except
          ibQueri.Close;
        end;

        try
          ibQueri.Close;
          ibQueri.SQL.Text := 'select cod_empresa from empresa';
          ibQueri.Open;
          vCaption := Caption;
          vLista := TStringList.Create;
          ibQueri.First;
          while not ibQueri.Eof do
          begin
            vLista.Add(ibQueri.FieldByName('cod_empresa').AsString);
            ibQueri.Next;
          end;
        finally
          ibQueri.close;
        end;

        for I := 0 to memoHw.Lines.Count - 1 do
        begin
          if (UpperCase(memoHw.Lines[i])= UpperCase('CommitLinhaaLinha')) then
          begin
            Application.ProcessMessages;
            if ibtransacao.InTransaction then
              ibtransacao.Commit;
          end
          else if (i mod 50) = 0 then
          begin
            Application.ProcessMessages;
            if ibtransacao.InTransaction then
              ibtransacao.Commit;
          end;

          try
            if vDadosIni.isnumeroint(trim(memoHw.Lines[i])) then
            begin
              vVersaoBancoMemo := strtoint(trim(memoHw.Lines[i]));
              Continue;
            end
            else if (UpperCase(memoHw.Lines[i])= UpperCase('CommitLinhaaLinha')) then
              Continue;
          except
          end;

          if (vVersaoBancoMemo > vBDVersaoHw) then
            vVerificadorDeVersao := true;

          if (vVerificadorDeVersao) then
          begin
            if pos(':COD_EMPRESA',UpperCase(memoHw.Lines[i]))>0  then
            begin
              for j := 0 to vLista.Count - 1 do
              begin
                ibScriptv.Script.Text := StringReplace(memoHw.Lines[i],
                ':cod_empresa',vLista[J],[rfReplaceAll,rfIgnoreCase]);
                Memo1.Clear;
                Memo1.Lines.Add(ibScriptv.Script.Text);
                try
                  ibScriptv.ExecuteScript;
                except
                  on e: Exception do
                  begin
                    vErros.Add('Linha: ' + IntToStr(I + 1 ) +  ' ' + ibScriptv.Script.Text + ' Erro: ' + e.Message);
                    vDesconectar := False;
                  end;
                end;
              end;
              ProgressBar1.Position := I + 1;
            end
            else
            begin
              ibScriptv.Script.Text := memoHw.Lines[i];
              Memo1.Clear;
              Memo1.Lines.Add(ibScriptv.Script.Text);
              try
                ibScriptv.ExecuteScript;
              except  
                on e: Exception do
                begin
                  vErros.Add('Linha: ' + IntToStr(I + 1 ) +  ' ' + ibScriptv.Script.Text + ' Erro: ' + e.Message);
                  vDesconectar := False;
                end;
              end;
              ProgressBar1.Position := I + 1;
            end;
          end;
        end; 

        if ibtransacao.InTransaction then
          ibtransacao.Commit;

        if vErros.Count > 1 then
          vErros.SaveToFile(ExtractFilePath(Application.ExeName) + 'erroReestruturaHw.log');

        vErros.Clear;

        if vErros.Count = 0 then
          vErros.Add(IntToStr(vDadosIni.vVersaoBancoHw));

        /// Verificando outros scripts, como trrigeer e outros
        ProgressBar1.Min := 0;
        ProgressBar1.Position := 0;
        ProgressBar1.Max := 0;
        for I := 0 to memoOutros.Lines.Count - 1 do
          if (LowerCase(memoOutros.Lines[i]) = 'inicio') or (LowerCase(memoOutros.Lines[i]) = 'inicioq') then
            ProgressBar1.Max := ProgressBar1.Max + 1;

        for I := 0 to memoOutros.Lines.Count - 1 do
        begin
//          try
//           vVersaoBancoMemo := strtoint(trim(memoOutros.Lines[i]));
//           Continue;
//          except
//          end;

          if (LowerCase(memoOutros.Lines[i]) = 'inicio') or (LowerCase(memoOutros.Lines[i]) = 'inicioq') then
          begin
            vExecutarPelaQuery := LowerCase(memoOutros.Lines[i]) = 'inicioq';
            vDesconectar := False;
            ibScriptv.Script.Clear;
            for J := I + 1 to memoOutros.Lines.Count - 1 do
            begin
              if LowerCase(memoOutros.Lines[J]) = 'fim' then
              begin
                try
                  if vExecutarPelaQuery then
                  begin
                    ibQueri.Close;
                    ibQueri.SQL.Text := ibScriptv.Script.Text;
                    ibQueri.ExecSQL;
                  end
                  else
                    ibScriptv.ExecuteScript;

                  if (vDesconectar) or ((vDadosIni.vVersaoBancoHw=vDesconectarVersao)
                  and (vDadosIni.vVersaoBancoHw>vBDVersaoAnteriorHw)) then
                  begin
                    ibScriptv.Script.Clear;
                    ibScriptv.Script.Text := 'update EMPDESVOLV set versaobancohw = '+IntToStr(vDadosIni.vVersaoBancoHw - 1)+' where COD_EMPDES = 1';
                    ibScriptv.ExecuteScript;

                    ibScriptv.Script.Clear;
                    ibScriptv.Script.Text := 'SET GENERATOR GEN_VERSAOANTERIOR_BDHW  TO '+inttostr(vDadosIni.vVersaoBancoHw);
                    ibScriptv.ExecuteScript;

                    if ibtransacao.InTransaction then
                      ibtransacao.Commit;

                    Application.MessageBox('O sistema será reiniciado para continuar com a atualização', 'Atenção', 0 + 64);
                    vDadosIni.CreateProcessSimple(ParamStr(0) + ' ' + ParamStr(1) + ' ' + ParamStr(2) );
                    Halt(0);
                  end;
                except
                  on e: Exception do
                  begin
                    vErros.Add('Linha: ' + IntToStr(I + 1 ) +  ' ' + ibScriptv.Script.Text + ' Erro: ' + e.Message);
                    vDesconectar := False;
                    Break;
                  end;
                end;
                Break;
              end
              else if LowerCase(memoOutros.Lines[J]) = 'desconectar' then
                vDesconectar := True
              else if pos('desconectarversao', LowerCase(memoOutros.Lines[J]))>0 then
                vDesconectarVersao := strtoint(StringReplace(LowerCase(memoOutros.Lines[J]),'desconectarversao','',[]))
              else
                ibScriptv.Script.Add(memoOutros.Lines[J]);
            end;
            ProgressBar1.Position := ProgressBar1.Position + 1;
            Application.ProcessMessages;
          end;

          if (i mod 50) = 0 then
          begin
            Application.ProcessMessages;
            if ibtransacao.InTransaction then
              ibtransacao.Commit;
          end;

        end;

        if ibtransacao.InTransaction then
          ibtransacao.Commit;

        if vErros.Count > 1 then
          vErros.SaveToFile(ExtractFilePath(Application.ExeName) + 'erroReestruturaHwO.log');

      end
      else if vBanco = 'processos' then
      begin
        vErros := TStringList.Create;
        vErros.Clear;

        if vErros.Count = 0 then
          vErros.Add(IntToStr(vDadosIni.vVersaoTabelaProcessos));

        ProgressBar1.Min := 0;
        ProgressBar1.Max := memoProcessos.Lines.Count;
        ProgressBar1.Position := 0;

        ConectarBanco;

        ibQueri.Close;
        ibQueri.SQL.Text := 'select versaobancofiscal, versaobancohwf, versaobancohw, versaoprocessos from EMPDESVOLV where COD_EMPDES = 1';
        try
          ibQueri.Open;
          vBDVersaoHw := ibQueri.FieldByName('versaobancohw').AsInteger;
          vBDVersaoProcessos := ibQueri.FieldByName('versaoprocessos').AsInteger;
        Except
          vBDVersaoHw := 0;
          vBDVersaoProcessos := 0;
          ibQueri.Close;
        end;

        ibQueri.Close;
        ibQueri.SQL.Text := 'select cod_empresa from empresa';
        ibQueri.Open;

        vCaption := Caption;
        vLista := TStringList.Create;
        ibQueri.First;
        while not ibQueri.Eof do
        begin
          vLista.Add(ibQueri.FieldByName('cod_empresa').AsString);
          ibQueri.Next;
        end;
        ibQueri.close;
        for j := 0 to vLista.Count - 1 do
        begin
          vVerificadorDeVersao := False;
          vVersaoBancoMemo := 0;
          Caption := vCaption + ' [Emp: '+vLista[J]+']';
          for I := 0 to memoProcessos.Lines.Count - 1 do
          begin
            if (i mod 50) = 0 then
            begin
              Application.ProcessMessages;
              if ibtransacao.InTransaction then
                ibtransacao.Commit;
            end;
            try
                vVersaoBancoMemo := strtoint(memoProcessos.Lines[i]);
                Continue;
            except
            end;

            if (vVersaoBancoMemo > vBDVersaoProcessos) then
               vVerificadorDeVersao := true;

            if (vVerificadorDeVersao) then
            begin
              ibScriptv.Script.Text := StringReplace(memoProcessos.Lines[i],
                ':cod_empresa',vLista[J],[rfReplaceAll,rfIgnoreCase]);
              Memo1.Clear;
              Memo1.Lines.Add(ibScriptv.Script.Text);
              try
                if Pos(UpperCase('|REPL|'), UpperCase(ibScriptv.Script.Text)) > 0 then
                begin
                  ibScriptv.Script.Text := StringReplace(ibScriptv.Script.Text, '|REPL|','',[rfReplaceAll,rfIgnoreCase]);
                  if not executarScript(I, vErros) then
                    ibScriptv.ExecuteScript;
                end
                else
                  ibScriptv.ExecuteScript;
              except
                on e: Exception do
                begin
                  vErros.Add('Linha: ' + IntToStr(I + 1 ) + ' ' + ibScriptv.Script.Text + ' Erro: ' + e.Message);
                  vDesconectar := False;
                end;
              end;
              ProgressBar1.Position := I + 1;
            end;
          end;
        end;
        if ibtransacao.InTransaction then
          ibtransacao.Commit;

        if vErros.Count > 1 then
          vErros.SaveToFile(ExtractFilePath(Application.ExeName) + 'erroReestruturaP.log');
      end;
    except on e: exception do begin
        Application.MessageBox(pchar('Erro ao restruturar o banco de dados: ' +
          vBanco + #13 + 'Erro: ' + e.Message), 'Erro', 0 + 64);
      end;
    end;
  finally
    if ibtransacao.InTransaction then
      ibtransacao.Commit;
    ibBanco.Connected := False;
    BitBtn1.Enabled := True;
    Memo1.Visible := False;
    Screen.Cursor := crDefault;
    BorderIcons := [biSystemMenu];
    ModalResult := IDOK;
  end;
end;

function TfrmReestruturacao.ConectarBanco(pRepl: boolean = false): boolean;
begin
  try
    Result := true;
    if pRepl then
    begin
      if ibtransacao2.InTransaction then
        ibtransacao2.Commit;
      ibBanco2.Connected := False;
      ibBanco2.Params[0] := 'user_name=repl';
      ibBanco2.Params[1] := 'password=masterkey';
      ibBanco2.DatabaseName := vDadosIni.vBancoHW;
      ibBanco2.Connected := True;
    end
    else
    begin
      if ibtransacao.InTransaction then
        ibtransacao.Commit;
      ibBanco.Connected := False;
      if (Trim(vUs) <> '') then
        ibBanco.Params[0] := 'user_name=' + string(__descriptografaTextoFDB(Pchar(vUs)));
      if (Trim(vPw) <> '') then
        ibBanco.Params[1] := 'password=' + string(__descriptografaTextoFDB(Pchar(vPw)));
      ibBanco.DatabaseName := vDadosIni.vBancoHW;
      ibBanco.Connected := True;
    end;
  except
    if pRepl then
      ibBanco2.Connected := False
    else
      ibBanco.Connected := False;
    Result := false;
  end;
end;

procedure TfrmReestruturacao.CopiarTexto1Click(Sender: TObject);
begin
  Clipboard.AsText:= Memo1.Lines.Text;
end;

function TfrmReestruturacao.executarScript(j: Integer; vErros: TStringList): boolean;
begin
  try
    try
      Result := true;
      if not ConectarBanco(true) then
      begin
       Result := false;
       exit;
      end;
      ibScriptv2.Script.Text := ibScriptv.Script.Text;
      ibScriptv2.ExecuteScript;
      if ibtransacao2.InTransaction then
        ibtransacao2.Commit;
    except
      on e: Exception do
      begin
        vErros.Add('Linha: ' + IntToStr(j + 1 ) +  ' ' + ibScriptv2.Script.Text + ' Erro |REPL|: ' + e.Message);
        Result := false;
      end;
    end;
  finally
    ibBanco2.Connected := false;
  end;
end;

procedure TfrmReestruturacao.FormShow(Sender: TObject);
begin
  vDesconectarVersao:=0;
  if vBanco = 'fiscal' then
    Label1.Caption := 'Banco de Dados :'+vDadosIni.vBancoFiscal
  else if vBanco = 'hwf' then
    Label1.Caption := 'Banco de Dados :'+vDadosIni.vBancoHwF
  else if vBanco = 'hw' then
    Label1.Caption := 'Banco de Dados :'+vDadosIni.vBancoHW
  else if vBanco = 'processos' then
  begin
    Label1.Caption := 'Banco de Dados :'+vDadosIni.vBancoHW;
    Caption := Caption + ' - Incluindo Processos não definidos';
    Refresh;
  end;
end;

procedure TfrmReestruturacao.ibScriptvExecuteError(Sender: TObject; Error,
  SQLText: string; LineIndex: Integer; var Ignore: Boolean);
begin
  vDesconectar := False;
end;

procedure TfrmReestruturacao.PopupMenu1Popup(Sender: TObject);
begin
Application.ProcessMessages;
end;

procedure TfrmReestruturacao._gravarLogRestruturacao(pArquivo, pSql: string);
begin

end;

procedure setVariaveisVersao(var pVersaoBancoFiscal,
                               pVersaoBancoHwF,
                               pVersaoBancoHw,
                               pVersaoTabelaProcessos: integer;
                               var pVersaoBpl: string);
begin
  pVersaoBancoFiscal := 100;
  pVersaoBancoHwF := 100;
  // quando usar no script Outros a tag reservada "desconectar" nesta variavel abaixo pVersaoBancoHw colocar + 2 para o sistema reinicializar;
  // o sistema reinicializará se usar no fim de um bloco do script Outros a tag reservada "desconectarversao###" (onde ### é o número da versão do BancoHW informada abaixo);
  // Com relação a linha acima se necessário voltar uma versão do banco na tabela EMPDESVOLV deve-se voltar também o generator GEN_VERSAOANTERIOR_BDHW para valor da versão anterior;
  // quando usar no script HW "CommitLinhaaLinha" a cada iteração que encontrar esta palavra será dado commit;
  pVersaoBancoHw := 1000;
//  pVersaoBpl := '0409_5_10';
  pVersaoTabelaProcessos := 1000;
end;

end.

