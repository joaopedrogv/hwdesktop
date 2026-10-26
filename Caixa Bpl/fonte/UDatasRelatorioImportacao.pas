unit UDatasRelatorioImportacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, Buttons, uclassesimportacaofinanceiro;

type
  TFrmDatasRelatorioImportacao = class(TForm)
    Panel_Datas: TPanel;
    MaskEdit_Fim: TMaskEdit;
    MaskEdit_Inicio: TMaskEdit;
    Label18: TLabel;
    Label1: TLabel;
    BitBtn_ConfirmarDatas: TBitBtn;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BitBtn_ConfirmarDatasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vQuitacaoCredito : tQuitacaoCreditos;
    vRelQuitacaoCredito : TRelQuitacaoCreditos;
  end;

var
  FrmDatasRelatorioImportacao: TFrmDatasRelatorioImportacao;

implementation

{$R *.dfm}

procedure TFrmDatasRelatorioImportacao.BitBtn_ConfirmarDatasClick(Sender: TObject);
begin
     try
      vRelQuitacaoCredito._DataInicio := datetostr(strtodate(FormatDateTime('dd/mm/yyyy',strtodate(MaskEdit_Inicio.Text))));
      vRelQuitacaoCredito._Datafim := datetostr(strtodate(FormatDateTime('dd/mm/yyyy',strtodate(MaskEdit_fim.Text))));
      vRelQuitacaoCredito._ValidarDatas := true;
      close;
     except
      vRelQuitacaoCredito._DataInicio := '';
      vRelQuitacaoCredito._Datafim := '';
      showmessage('Data inválida, digite novamente !');
     end;
end;

procedure TFrmDatasRelatorioImportacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = VK_RETURN then
 BitBtn_ConfirmarDatasClick(Sender);
end;

procedure TFrmDatasRelatorioImportacao.FormShow(Sender: TObject);
begin
  MaskEdit_Inicio.Text := '';
  MaskEdit_Fim.Text := '';
  MaskEdit_Inicio.EditMask := '';
  MaskEdit_Fim.EditMask := '';
  MaskEdit_Inicio.EditMask := '!00/00/0000;1;_';
  MaskEdit_Fim.EditMask := '!00/00/0000;1;_';
  MaskEdit_Inicio.Text := FormatDateTime('dd/mm/yyyy',now);
  MaskEdit_Fim.Text := FormatDateTime('dd/mm/yyyy',now);
  //vQuitacaoCredito._ValidarDatas := false;
  vRelQuitacaoCredito._ValidarDatas := false;
  if (Self.Enabled) and (Self.Visible) and (MaskEdit_Inicio.CanFocus) then
		MaskEdit_Inicio.SetFocus;
end;

end.
