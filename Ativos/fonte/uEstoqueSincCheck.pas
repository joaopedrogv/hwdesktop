unit uEstoqueSincCheck;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Produtos_tmp_class, ExtCtrls, Grids, DBGrids, DBCtrls,
  StdCtrls, Buttons;

type

  EnumEstoqueSincCheckMomento = (ecCadastroProduto, ecNotaEdicao, ecNotaConfirmacao);

  TEstoquesCheck = class(TProdutos_tmp_classList);

  TEstoqueSincCheck = class
  private
    estoque: TEstoquesCheck;
    irregulares: TEstoquesCheck;
  public
    constructor Create(payload: TEstoquesCheck);

    function Irregularidades: TEstoquesCheck;
    function HandleIrregularidades: Boolean;
  end;

  EstoqueSincCheck = class
  public
    class function Valido(momento: EnumEstoqueSincCheckMomento; payload: TEstoquesCheck): Boolean;
  end;

  TfrmEstoqueSincCheck = class(TfrmPadrao)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    DBGrid1: TDBGrid;
    Panel6: TPanel;
    DBGrid2: TDBGrid;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBLookupComboBox1: TDBLookupComboBox;
    confirmarBtn: TBitBtn;
    exitBtn: TBitBtn;
    procedure confirmarBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEstoqueSincCheck: TfrmEstoqueSincCheck;

implementation

uses hw_utils, Contnrs;

{$R *.dfm}

procedure TfrmEstoqueSincCheck.confirmarBtnClick(Sender: TObject);
begin
  inherited;

  

  ModalResult := mrOk;
end;

procedure TfrmEstoqueSincCheck.FormCreate(Sender: TObject);
begin
  inherited;
//
end;

{ TEstoqueSincCheck }

constructor TEstoqueSincCheck.Create(payload: TEstoquesCheck);
begin
  estoque := payload;
end;

function TEstoqueSincCheck.HandleIrregularidades: Boolean;
begin

end;

function TEstoqueSincCheck.Irregularidades: TEstoquesCheck;
begin
  irregulares := TEstoquesCheck.Create;

  Result := irregulares;
end;

{ EstoqueSincCheck }

class function EstoqueSincCheck.Valido(momento: EnumEstoqueSincCheckMomento;
  payload: TEstoquesCheck): Boolean;
var
  check: TEstoqueSincCheck;
  irregulares: TEstoquesCheck;
  temIrregularidades: Boolean;
begin

  check := TEstoqueSincCheck.Create(payload);
  try

    irregulares := check.Irregularidades;
    temIrregularidades := irregulares.Count > 0;

    case momento of
      ecCadastroProduto,
      ecNotaConfirmacao:
        begin
          if temIrregularidades then
          begin
            ShowAtencao('Item possui uma grade com o código 0(SEM GRADE) isso não é mais permitido' + sLineBreak +
                        'Isso está causando divergência de informações entre o estoque e o histórico de estoque' + sLineBreak +
                        'Por favor execute o procedimento seguinte o mais breve possível' + sLineBreak + sLineBreak +
                        'Faça a contagem e proceda com o movimento na tela seguinte');

            temIrregularidades := check.HandleIrregularidades;

            if temIrregularidades then
              ShowAtencao('Enquanto não realizar o procedimento não será possível prosseguir com a ação');
          end;

        end;

      ecNotaEdicao:
        begin
          if temIrregularidades then
            if ShowConfirmacao('Item possui uma grade com o código 0(SEM GRADE) isso não é mais permitido' + sLineBreak +
                               'Isso está causando divergência de informações entre o estoque e o histórico de estoque' + sLineBreak +
                               'Para confirmar a nota fiscal será necessário executar o procedimento abaixo antes' + sLineBreak + sLineBreak +
                               'Faça a contagem e proceda com o movimento na tela seguinte' + sLineBreak + sLineBreak +
                               'Deseja seguir com o procedimento?') = mrYes then
            begin

              temIrregularidades := check.HandleIrregularidades;

              if temIrregularidades then
                ShowAtencao('As irregularidade não foram solucionadas');
            end
            else
              temIrregularidades := False; // Durante a edição da nota não vai barrar, apenas na confirmação

        end;

    end;

    Result := True;

  finally
    Result := temIrregularidades;
    check.Free;
  end;

end;

end.
