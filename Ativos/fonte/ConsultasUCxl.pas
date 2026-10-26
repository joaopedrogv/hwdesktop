unit ConsultasUCXL;

interface

uses DB, StdCtrls, Classes, SysUtils, DBClient, Dialogs, IBQuery;

type
  TConsultaCXL = class(TObject)
  private
    //    FDataSource: TDataSource;
    FCdsPesq: TClientDataSet;
  public
    procedure RetornaAtributos(vComb: TCombobox); virtual; abstract;
    procedure Pesquisar(Vcamp: string; Vcond: string; Pardata: string; vquery: TclientDataSet); virtual; abstract;
    procedure Pegacodigo; virtual; abstract;
    property CdsPesq: TClientDataSet read FCdsPesq write FCdsPesq;
  var
    valorindex: integer;
    vCampoPesq: string; //Conteúdo do campo de pesquisa selecionado (Atributo utilizado para pesquisa de prestações)
    vFimSql: string; //Fim do select (Atributo utilizado para pesquisa de prestações)
  end;

  TConsultaPendreq = class(TConsultaCxl)
  public
    constructor Create;
    destructor Destroy; override;
    procedure RetornaAtributos(vComb: TCombobox); override;
    procedure Pesquisar(Vcamp: string; Vcond: string; Pardata: string; vquery: TclientDataSet); override;
    procedure Pegacodigo; override;
  end;

  TConsultaPendOS = class(TConsultaCxl)
  public
    constructor Create;
    destructor Destroy; override;
    procedure RetornaAtributos(vComb: TCombobox); override;
    procedure Pesquisar(Vcamp: string; Vcond: string; Pardata: string; vquery: TclientDataSet); override;
    procedure Pegacodigo; override;
  end;

  TConsultaPendVeic = class(TConsultaCxl)
  public
    constructor Create;
    destructor Destroy; override;
    procedure RetornaAtributos(vComb: TCombobox); override;
    procedure Pesquisar(Vcamp: string; Vcond: string; Pardata: string; vquery: TclientDataSet); override;
    procedure Pegacodigo; override;
  end;

  TConsultaPendPrest = class(TConsultaCxl)
  public
    constructor Create;
    destructor Destroy; override;
    procedure RetornaAtributos(vComb: TCombobox); override;
    procedure Pesquisar(Vcamp: string; Vcond: string; Pardata: string; vquery: TclientDataSet); override;
    procedure Pegacodigo; override;
  end;

  TConsultaPendRec = class(TConsultaCxl)
  public
    buscas: TIBQuery;
    constructor Create;
    destructor Destroy; override;
    procedure RetornaAtributos(vComb: TCombobox); override;
    procedure Pesquisar(Vcamp: string; Vcond: string; Pardata: string; vquery: TclientDataSet); override;
    procedure Pegacodigo; override;
  end;

implementation

uses uDtmAtivo, uDadosIni, IBCustomDataSet; //Unit2;
{
***************************** TConsultaFuncionario *****************************
}
{constructor TConsultaFuncionario.Create;
begin
  inherited;
//  DataSource := dtm.dsFuncionario;
end;

destructor TConsultaFuncionario.Destroy;
begin
//  dtm.BuscaFuncionario.Close;
  inherited;
end;}

{procedure TConsultaFuncionario.ConsultarNome(nome: string);
begin
  with dtm.BuscaFuncionario do
  begin
    Close;
    ParamByName('NOME').AsString := nome;
    Open;
  end;
end;}

{
******************************* TConsultaCliente *******************************
}

{constructor TConsultaCliente.Create;
begin
  inherited;
  DataSource := DtmSup.dtpesqCliente;
end;

destructor TConsultaCliente.Destroy;
begin
  DtmSup.IbPesqCliente.Close;
  inherited;
end;

procedure TConsultaCliente.Pegacodigo;
begin
  valorindex := DtmSup.IbPesqCliente.Fields[0].asinteger;
end;

procedure TConsultaCliente.Pesquisar(Vcamp, Vcond: string; ParData: string);
var
  i: integer;
  campopesq: string;
begin
  with DtmSup do
  begin
    for I := 0 to IbPesqCliente.FieldCount - 1 do
    begin
      if IbPesqCliente.Fields[I].DisplayName = vcamp then
        CampoPesq := IbPesqCliente.Fields[I].FieldName;
    end;
    try
      IbPesqCliente.Close;
      IbPesqCliente.sql.Text := '';
      if Vcamp = 'TODOS' then
        IbPesqCliente.sql.Text := 'SELECT * FROM CLIENTES'
      else
      begin
        if vcond = 'Like' then
          IbPesqCliente.sql.text := 'SELECT * FROM CLIENTES WHERE ' + CampoPesq + ' LIKE ''%' +
            UpperCase(ParData) + '%'' AND COD_EMPRESA = ' + VdadosIni.codEmpresa + ' AND ATIVO = 1'
        else
          DtmSup.IbPesqCliente.sql.text := 'SELECT * FROM CLIENTES WHERE ' + CampoPesq + ' ' + vcond + ' ''' +
            UpperCase(ParData) + ''' AND COD_EMPRESA = ' + VdadosIni.codEmpresa + ' AND ATIVO = 1';
      end;
      IbPesqCliente.Open;
    except
      raise Exception.Create('Erro ao tentar abrir Cadastro' + chr(13) + 'Campo para Pesquisa não Existe');
    end;
  end;
end;

procedure TConsultaCliente.RetornaAtributos(vComb: TCombobox);
var
  I: Integer;
begin
  try
    for I := 0 to DtmSup.IbPesqCliente.FieldCount - 1 do
    begin
      Vcomb.Items.Add(DtmSup.IbPesqCliente.Fields[I].DisplayName);
    end;
    Vcomb.Items.Add('TODOS');
    vComb.ItemIndex := 1;
    vComb.Text:=VdadosIni.vpadpesqCliente;
  except
    on E: EListError do
      raise EListError.Create('Error na Montagem da Lista');
    on Exception do
      raise Exception.Create('Erro Interno com a Pesquisa');
  end; // Try...Except
end;}

{ TConsultaPendreq }

constructor TConsultaPendreq.Create;
begin

end;

destructor TConsultaPendreq.Destroy;
begin

  inherited;
end;

procedure TConsultaPendreq.Pegacodigo;
begin

end;

procedure TConsultaPendreq.Pesquisar(Vcamp, Vcond, Pardata: string;
  vquery: TclientDataSet);
begin
  CdsPesq.Locate(vcamp, pardata, [loPartialKey]);
end;

procedure TConsultaPendreq.RetornaAtributos(vComb: TCombobox);
begin
  vComb.Items.Clear;
  vcomb.Items.Add('NPED');
  vcomb.Items.Add('VALOR_TOTAL');
  //  vComb.ItemIndex := 1;
  vComb.Text := 'NPED';
end;

{ TConsultaPendOS }

constructor TConsultaPendOS.Create;
begin

end;

destructor TConsultaPendOS.Destroy;
begin

  inherited;
end;

procedure TConsultaPendOS.Pegacodigo;
begin

end;

procedure TConsultaPendOS.Pesquisar(Vcamp, Vcond, Pardata: string;
  vquery: TclientDataSet);
begin
  CdsPesq.Locate(vcamp, pardata, [loPartialKey]);
end;

procedure TConsultaPendOS.RetornaAtributos(vComb: TCombobox);
begin
  vComb.Items.Clear;
  vcomb.Items.Add('NPED');
  vcomb.Items.Add('VALOR_TOTAL');
  //  vComb.ItemIndex := 1;
  vComb.Text := 'NPED';
end;

{ TConsultaPendVeic }

constructor TConsultaPendVeic.Create;
begin

end;

destructor TConsultaPendVeic.Destroy;
begin

  inherited;
end;

procedure TConsultaPendVeic.Pegacodigo;
begin

end;

procedure TConsultaPendVeic.Pesquisar(Vcamp, Vcond, Pardata: string;
  vquery: TclientDataSet);
begin
  CdsPesq.Locate(vcamp, pardata, [loPartialKey]);
end;

procedure TConsultaPendVeic.RetornaAtributos(vComb: TCombobox);
begin
  vComb.Items.Clear;
  vcomb.Items.Add('N_COMANDO');
  vcomb.Items.Add('VALOR_A_REC');
  //  vComb.ItemIndex := 1;
  vComb.Text := 'N_COMANDO';

end;

{ TConsultaPendPrest }

constructor TConsultaPendPrest.Create;
begin

end;

destructor TConsultaPendPrest.Destroy;
begin

  inherited;
end;

procedure TConsultaPendPrest.Pegacodigo;
begin

end;

procedure TConsultaPendPrest.Pesquisar(Vcamp, Vcond, Pardata: string;
  vquery: TclientDataSet);
var
  str: string;
begin
  if pos('ORDER', uppercase(CdsPesq.CommandText)) <> 0 then
    str := copy(CdsPesq.CommandText, 0, pos('ORDER', uppercase(CdsPesq.CommandText)) - 1)
  else
    str := CdsPesq.CommandText;
  CdsPesq.Close;
  CdsPesq.CommandText:=str+' '+vFimSql;
  CdsPesq.Open;
end;

procedure TConsultaPendPrest.RetornaAtributos(vComb: TCombobox);
var
  I: integer;
begin
  try
    vComb.Items.Clear;
    for I := 0 to CdsPesq.FieldCount - 1 do
    begin
    	if UpperCase(trim(CdsPesq.Fields[I].FieldName)) <> 'SELEC' then
	      vcomb.Items.Add(CdsPesq.Fields[I].DisplayLabel);
    end;
//    vComb.Items.Add('TODOS');
    vComb.Text := 'Nº do Documento';
  except
    on E: EListError do
      raise EListError.Create('Error na Montagem da Lista');
    on Exception do
      raise Exception.Create('Erro Interno com a Pesquisa');
  end;
end;

{ TConsultaPendRec }

constructor TConsultaPendRec.Create;
begin

end;

destructor TConsultaPendRec.Destroy;
begin

  inherited;
end;

procedure TConsultaPendRec.Pegacodigo;
begin

end;

procedure TConsultaPendRec.Pesquisar(Vcamp, Vcond, Pardata: string;
  vquery: TclientDataSet);
var
  str: string;
begin
  CdsPesq.Locate(vcamp, pardata, [loPartialKey]);
end;

procedure TConsultaPendRec.RetornaAtributos(vComb: TCombobox);
begin
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmAtivo.bancoHw;
  buscas.Transaction := dtmAtivo.IbBuscas.Transaction;
  vComb.Items.Clear;
  if vDadosIni.vRecibo.HabRecPorDepart then
		vcomb.Items.Add('NUM_REC_DEP')
  else
	  vcomb.Items.Add('NRECIBO');
  vcomb.Items.Add('VALOR');
  //  vComb.ItemIndex := 1;
  if vDadosIni.vRecibo.HabRecPorDepart then
  	vComb.Text := 'NUM_REC_DEP'
  else
	  vComb.Text := 'NRECIBO';
end;

end.

