unit UListar;
(************************ Hw Sistemas e Computadores ***************************
1- Ele é executado de acordo com o nome da tabela, tem que ser implementado o código
de criação de acordo com o nome da tabela.
2 - Os campos abaixo são pre-requisitos para preencher exibir o formulário:

   //Nome da tabela a ser listada
   _Tabela_ : string;
   //Tipo de registro que aparecerá na tablela. exemplo: 'V' := VEÍCULOS (usado para exibir Contratos)
   _TipodeRegistro_ : char;
*Help 3 - Para procurar no Grid digite a palavra, para limpar aperte ESC e digite
outra palavra se optar buscar novamente, para selecionar aperte ENTER
*******************************************************************************)
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Buttons, ExtCtrls, Grids, DBGrids, uclassescadastrosbasicos,
  uDataSet_OOP, DB, ComCtrls, StdCtrls;

type
  TfrmListar = class(TfrmPadrao)
    DBGrid_Listar: TDBGrid;
    StatusBar_Listar: TStatusBar;
    Panel_Listar: TPanel;
    SpeedButton_Novo: TSpeedButton;
    Label_Pesquisa: TLabel;
    RadioButton_Pesquisa1: TRadioButton;
    RadioButton_Pesquisa2: TRadioButton;
    procedure RadioButton_Pesquisa2Click(Sender: TObject);
    procedure RadioButton_Pesquisa1Click(Sender: TObject);
    procedure DBGrid_ListarKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid_ListarDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton_NovoClick(Sender: TObject);
  private
    { Private declarations }
    Procura: string;
  public
    { Public declarations }
    //Dado que será resgatado
    _Registro: string;
    //Nome da tabela a ser listada
    _Tabela_: string;
    //Tipo de registro que aparecerá na tablela. exemplo: 'V' := VEÍCULOS (usado para exibir Contratos)
    _TipodeRegistro_: char;
    //Campo chave da tabela
    _CampoChave: string;

  end;

var
  frmListar: TfrmListar;
  TAGs: TTAG;
  Contratos: TContratos;
  Opcionais: TOpcionais;

implementation

uses
  UCadTAG, UDtmCadastrosBasicos, uDtmAtivo, UCadOpcionais, DBClient;

{$R *.dfm}

procedure TfrmListar.DBGrid_ListarDblClick(Sender: TObject);
begin
  try
    inherited;
    if (_Tabela_ = 'CONTRATO') then
    begin
      _Registro := DtmCadBasicos.cdsContratosCODIGO.Text; // passa o código do contrato
    end
    else if (_Tabela_ = 'MACRO') then
    begin
      _Registro := dtmcadbasicos.cdsTAGsConsNOME.Text; // passa o nome do macro
    end;
    if (_Tabela_ = 'OPCIONAIS') then
    begin
      _CampoChave := DtmCadBasicos.cdsOpcionalCOD_OPCIONAIS.AsString;
      if ((DtmCadBasicos.cdsOpcionalCODIGO_FABRICA.AsString <> '') and
        (DtmCadBasicos.cdsOpcionalDESCRICAO.AsString <> '')) then
      begin
        _Registro := dtmcadbasicos.cdsOpcionalCODIGO_FABRICA.AsString + ' - ' +
          DtmCadBasicos.cdsOpcionalDESCRICAO.AsString;
      end
      else if (DtmCadBasicos.cdsOpcionalDESCRICAO.AsString <> '') then
      begin
        _Registro := DtmCadBasicos.cdsOpcionalDESCRICAO.AsString;
      end
      else if (DtmCadBasicos.cdsOpcionalCODIGO_FABRICA.AsString <> '') then
      begin
        _Registro := DtmCadBasicos.cdsOpcionalCODIGO_FABRICA.AsString;
      end;

    end;
    Close;
  except
    Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    if (_Tabela_ = 'MACRO') then
    begin
      tags.Cancel;
      TAGs.Free;
    end;
    if (_Tabela_ = 'OPCIONAIS') then
    begin
      Opcionais.Cancel;
      Opcionais.Free;
    end;
    Close;
  end;
end;

procedure TfrmListar.DBGrid_ListarKeyPress(Sender: TObject; var Key: Char);
begin // caso seja enter...
  try

    inherited;
    if Key = #13 then
    begin
      DBGrid_ListarDblClick(Sender); // executa duploClik no grid
      Key := #0;
    end
    else if Key = #27 then
    begin
      Procura := '';
    end
    else if (_Tabela_ = 'MACRO') then
    begin
      Procura := Procura + Key;
      TAGs.dataSet.IndexFieldNames := 'NOME';
      TAGs.dataSet.FindNearest([Procura]);
    end
    else if (_Tabela_ = 'CONTRATO') then
    begin
      Procura := Procura + Key;
      Contratos.dataSet.IndexFieldNames := 'DESCRICAO';
      Contratos.dataSet.FindNearest([Procura]);
    end
    else if (_Tabela_ = 'OPCIONAIS') then
    begin
      if (RadioButton_Pesquisa1.Checked) then
      begin
        Procura := Procura + Key;
        Opcionais.dataSet.IndexFieldNames := 'CODIGO_FABRICA';
        Opcionais.dataSet.FindNearest([Procura]);
      end
      else
      begin
        Procura := Procura + Key;
        Opcionais.dataSet.IndexFieldNames := 'DESCRICAO';
        Opcionais.dataSet.FindNearest([Procura]);
      end;
    end;

    StatusBar_Listar.Panels[2].text := Procura;
  except
    Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    if (_Tabela_ = 'MACRO') then
    begin
      tags.Cancel;
      TAGs.Free;
    end;
    if (_Tabela_ = 'OPCIONAIS') then
    begin
      Opcionais.Cancel;
      Opcionais.Free;
    end;

  end;

end;

procedure TfrmListar.FormShow(Sender: TObject);
begin
  inherited;
  try
    if DtmCadBasicos = nil then
      DtmCadBasicos := TDtmCadBasicos.Create(DtmCadBasicos);

    if (_Tabela_ = 'CONTRATO') then
    begin
      Contratos := TContratos.Create;
    end
    else if  (_Tabela_ = 'MACRO') then
    begin
      TAGs := TTAG.create;
      TAGs.dataSet := TClientDataSet(DtmCadBasicos.cdsTAGsCons);
    end
    else if (_Tabela_ = 'OPCIONAIS') then
    begin
      Opcionais := TOpcionais.create;
      Label_Pesquisa.Visible := true;
      if (_LerConfiguracoesRegistroBoolean('PesqRadioButtonOpcionais')) then
        RadioButton_Pesquisa2.Checked := true
      else
        RadioButton_Pesquisa1.Checked := true;

      RadioButton_Pesquisa1.Caption := 'Cód. Fabrica';
      RadioButton_Pesquisa2.Caption := 'Descrição';
      RadioButton_Pesquisa1.Visible := true;
      RadioButton_Pesquisa2.Visible := true;
    end;

    //----------------------------------------------------------------------------

    _Registro := ''; // limpa o macro
    // Configura a posicao do form
    Left := Mouse.CursorPos.x;
    Top := Mouse.CursorPos.y;

    if (_Tabela_ = 'MACRO') then
    begin
      DBGrid_Listar.DataSource := DtmCadBasicos.dsTAGsCons;
      TAGs.montaSelect('select * from ' + trim(_Tabela_) +
      	' where ATIVO = 1 order by NOME');

      if not (TAGs.dataSet.IsEmpty) then
      begin
        //A posicao do registro
        TAGs.dataSet.RecNo := 1;
      end;

      Self.Caption := 'Listar TAG';
      Panel_Listar.Caption := 'Duplo clique<ou Enter> para inserir a TAG';

    end
    else if (_Tabela_ = 'CONTRATO') then
    begin
      SpeedButton_Novo.Visible := false;
      DBGrid_Listar.DataSource := DtmCadBasicos.dsContratos;
      DBGrid_Listar.Columns.Delete(0);
      Contratos.montaSelect('select * from ' + _Tabela_ +
        ' where ATIVO = 1 and COD_EMPRESA = ' + vDadosIni.CodEmpresa +
        ' and TIPO_ARQUIVO = ''' + _TipodeRegistro_ + ''' order by CODIGO');

      if not (Contratos.dataSet.IsEmpty) then
      begin
        //A posicao do registro
        Contratos.dataSet.RecNo := 1;
      end;

      Self.Caption := 'Listar Contratos';
      Panel_Listar.Caption := 'Duplo clique<ou Enter> para inserir o Contrato';

    end
    else if (_Tabela_ = 'OPCIONAIS') then
    begin
      DBGrid_Listar.Columns[0].FieldName := 'CODIGO_FABRICA';
      DBGrid_Listar.Columns[0].Title.Caption := 'Código de Fabrica';

      DBGrid_Listar.DataSource := DtmCadBasicos.dsOpcional;

      Opcionais.montaSelect('select * from ' + trim(_Tabela_) + ' where ATIVO = 1');

      if not Opcionais.dataSet.IsEmpty then
      begin
        //A posicao do registro
        Opcionais.dataSet.RecNo := 1;
      end;

      Self.Caption := 'Listar Opcionais';
      Panel_Listar.Caption := 'Duplo clique<ou Enter> para inserir o Opcional';

    end;

  except
    Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    if (_Tabela_ = 'MACRO') then
    begin
      tags.Cancel;
      TAGs.Free;
    end;
    if (_Tabela_ = 'OPCIONAIS') then
    begin
      Opcionais.Cancel;
      Opcionais.Free;
    end;
  end;

end;

procedure TfrmListar.RadioButton_Pesquisa1Click(Sender: TObject);
begin
  inherited;
  _GravaConfiguracoesBoolean('PesqRadioButtonOpcionais', False);
end;

procedure TfrmListar.RadioButton_Pesquisa2Click(Sender: TObject);
begin
  inherited;
  _GravaConfiguracoesBoolean('PesqRadioButtonOpcionais', True);
end;

procedure TfrmListar.SpeedButton_NovoClick(Sender: TObject);
begin
  inherited;

  try

    if not vDadosIni.PesqPros('BAS168', 'INSERINDO NOVO REGISTRO', '', 'MACRO',
      '', TAGs.buscas, true) then
    begin
      exit;
    end;

    if (_Tabela_ = 'MACRO') then
    begin
      vDadosIni.vModalOuChild := 'M';
      TAGs._CadTAG(1);
      TAGs.montaSelect('select * from ' + trim(_Tabela_) +
      	' where ATIVO = 1 order by NOME');
    end;
    if (_Tabela_ = 'OPCIONAIS') then
    begin
      vDadosIni.vModalOuChild := 'M';
      Opcionais._CadOpcionais(1);
      Opcionais.montaSelect('select * from ' + trim(_Tabela_) + ' where ATIVO = 1');
    end;
  except
    Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    if (_Tabela_ = 'MACRO') then
    begin
      tags.Cancel;
      TAGs.Free;
    end;
    if (_Tabela_ = 'OPCIONAIS') then
    begin
      Opcionais.Cancel;
      Opcionais.Free;
    end;
  end;
end;

end.

