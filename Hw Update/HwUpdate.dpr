program HwUpdate;

{%File 'Arquivos\Leia-me.txt'}
{%File 'Arquivos\exec.txt'}
{%File 'Arquivos\reg.txt'}

uses
  Forms,
  Registry,
  Windows,
  uClassesHwUpdate in 'uClassesHwUpdate.pas',
  uPrincipalHwUpdate in 'uPrincipalHwUpdate.pas' {frmHwUpdate},
  uConfigHwUpdate in 'uConfigHwUpdate.pas' {frmConfigAtualizador},
  uAtualizarViaWEB in 'uAtualizarViaWEB.pas' {frmAtualizarViaWEB},
  uInstalarVersao in 'uInstalarVersao.pas' {frmInstalarVersao},
  uAtualizarViaArquivo in 'uAtualizarViaArquivo.pas' {frmAtualizarViaArquivo},
  uHistoricoHwUpdate in 'uHistoricoHwUpdate.pas' {frmHistoricoHwUpdate},
  WsAtivaCliente in '..\Registro40\WsAtivaCliente.pas',
  GifImageHw in 'GifImageHw.pas';

{$R *.res}

procedure _verificaRegistroDelphi;
var
  registro: TRegistry;
begin
  try
    Registro := TRegistry.Create(KEY_ALL_ACCESS);
    try
      Registro.RootKey := HKEY_LOCAL_MACHINE;
      Registro.OpenKey('SOFTWARE\Borland\BDS\4.0', True);
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

begin
  Application.Initialize;
  _verificaRegistroDelphi;
  Application.Title := 'Hw Update';
  Application.CreateForm(TfrmHwUpdate, frmHwUpdate);
  if ParamCount > 0 then
  begin
    if ParamCount > 1 then
      vAtHw.vSw.VERSAO := ParamStr(2);
    if ParamStr(1) = 'HW_MENS_CONFIGURAR' then
    begin

    end
    else if ParamStr(1) = 'HW_INSTALAR' then
    begin
      if vAtHw.vConfig._getConfig(False)  then
        if vAtHw.vConfig.VERSAO_INST >= ParamStr(2)  then
        begin
          try
            vAtHw.EmExecucao := True;
            Application.CreateForm(TfrmInstalarVersao, frmInstalarVersao);
            frmInstalarVersao.ShowModal;
          finally
            vAtHw.EmExecucao := False;
          end;
        end;
    end
    else if ParamStr(1) = 'HW_ATUALIZAR' then
    begin
      if vAtHw.vConfig._getConfig(False)  then
      begin
        if vAtHw.vConfig.STAND_ALONE = 'S' then
        begin
          try
            vAtHw.EmExecucao := True;
            if vAtHw._verificarAtualizacaoViaSuiteHw(True) then
            begin
				  Application.CreateForm(TfrmAtualizarViaWEB, frmAtualizarViaWEB);
              frmAtualizarViaWEB.Tag := 1;
              frmAtualizarViaWEB.CheckBox1.Checked := True;
              frmAtualizarViaWEB.ShowModal;
            end
            else
              vAtHw.EmExecucao := False;
          finally
            vAtHw.EmExecucao := False;
          end;
        end
        else
        begin
          try
            vAtHw.EmExecucao := True;
            Application.CreateForm(TfrmInstalarVersao, frmInstalarVersao);
            frmInstalarVersao.Tag := 1;
            frmInstalarVersao.ShowModal;
          finally
            vAtHw.EmExecucao := False;
          end;
        end;
      end;
    end;
  end;
  Application.Run;
end.
