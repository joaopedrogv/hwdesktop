unit uClassesNotasFiscais_agro;

interface

uses
  uDataSet_OOP, Classes;

type
  TNFCab_Defensivo = class(TDataSetChild_OOP)
  public
    function Insert: Boolean; override;
    function Post: Boolean; override;
    function Apply: Boolean; override;
    function Open: Boolean; override;
  end;

  TNFCab_GuiaTransito = class(TDataSetChild_OOP)
  public
    function Insert: Boolean; override;
    function Post: Boolean; override;
    function Apply: Boolean; override;
    function Open: Boolean; override;
  end;

implementation

uses hw_utils, sysutils, StrUtils, uDadosIni;

{ TNFCab_Defensivo }

function TNFCab_Defensivo.Apply: Boolean;
begin
  dataSet.DisableControls;
  try
    dataSet.First;
    while not dataSet.Eof do
    begin
      if dataSet.FieldByName('cod_nf').AsInteger = 0 then
      begin
        dataSet.Edit;
        dataSet.FieldByName('cod_nf').AsInteger := FOwner.fint('cod_nf');
        dataSet.FieldByName('cod_empresa').AsInteger := FOwner.fint('cod_empresa');
        dataSet.Post;
      end;
      dataSet.Next;
    end;
  finally
    dataSet.EnableControls;
  end;

  Result := ApplyChanges(False);
end;

function TNFCab_Defensivo.Insert: Boolean;
begin
  Result := False;
  if not dataSet.Active then
    Open;

  if dataSet.RecordCount >= 20 then
  begin
    ShowErro('Quantidade de registros aceito é 20');
    Exit;
  end;

  Result := inherited Insert;
  if Result then
  begin
    dataSet.FieldByName('cod_nf').AsInteger := FOwner.fint('cod_nf');
    dataSet.FieldByName('cod_empresa').AsInteger := FOwner.fint('cod_empresa');
    dataSet.FieldByName('id').AsString := NewGuid();
  end;
end;

function TNFCab_Defensivo.Open: Boolean;
begin
  Result := ClientOpen(
    'select * from notafiscal_defensivo where cod_nf = %d and cod_empresa = %d',
    [FOwner.fint('cod_nf'), FOwner.fint('cod_empresa')]
  ).Active;
end;

function TNFCab_Defensivo.Post: Boolean;
begin
  Result := False;
  try
    checkFieldEmpty('nreceituario', 'Numero do receituário precisa ser preenchido'  , 'ed_agro_nreceituario');
    checkFieldEmpty('cpfresptec', 'CPF do responsável técnico precisa ser preenchido'  , 'ed_agro_cpfresptec');

    if not Cpf(fstr('cpfresptec')) then
      raiseExceptionCreate('CPF do responsável técnico inválido', 'ed_agro_cpfresptec');

    Result := inherited Post;

  except on E: Exception do
    begin
      registraErro('TNFCab_Defensivo.Post Erro: ' + e.Message);
      ShowErro('Erro ao salvar dados' + sLineBreak + sLineBreak + E.Message);
    end;
  end;
end;

{ TNFCab_GuiaTransito }

function TNFCab_GuiaTransito.Apply: Boolean;
begin

  if (dataSet.RecordCount > 0) and
  (dataSet.FieldByName('cod_nf').AsInteger = 0) then
  begin
    dataSet.Edit;
    dataSet.FieldByName('cod_nf').AsInteger := FOwner.fint('cod_nf');
    dataSet.FieldByName('cod_empresa').AsInteger := FOwner.fint('cod_empresa');
    dataSet.Post;
  end;

  Result := ApplyChanges(False);
end;

function TNFCab_GuiaTransito.Insert: Boolean;
begin
  Result := False;
  if not dataSet.Active then
    Open;

  if dataSet.RecordCount > 0 then
    Result := inherited Edit
  else
  begin
    Result := inherited Insert;

    if Result then
    begin
      dataSet.FieldByName('cod_nf').AsInteger := FOwner.fint('cod_nf');
      dataSet.FieldByName('cod_empresa').AsInteger := FOwner.fint('cod_empresa');
    end;
  end;
end;

function TNFCab_GuiaTransito.Open: Boolean;
begin
  Result := ClientOpen(
    'select * from notafiscal_guiatransito where cod_nf = %d and cod_empresa = %d',
    [FOwner.fint('cod_nf'), FOwner.fint('cod_empresa')]
  ).Active;
end;

function TNFCab_GuiaTransito.Post: Boolean;
begin
  Result := False;
  try
    checkFieldEmpty('tpguia', 'Tipo da Guia precisa ser preenchido'  , 'ed_agro_tpguia');
    checkFieldEmpty('ufguia', 'UF da emissão precisa ser preenchida' , 'ed_agro_ufguia');
    checkFieldEmpty('nguia' , 'Número da guia precisa ser preenchido', 'ed_agro_nguia');

    if not MatchText(fstr('ufguia'), Const_UF) then
      raiseExceptionCreate('UF da Guia inválida', 'ed_agro_ufguia');

    Result := inherited Post;

  except on E: Exception do
    begin
      registraErro('TNFCab_Defensivo.Post Erro: ' + e.Message);
      ShowErro('Erro ao salvar dados' + sLineBreak + sLineBreak + E.Message);
    end;
  end;
end;

end.
