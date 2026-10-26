unit uThOpenTable;

interface

uses
  Classes;

type
  tOpenTable = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;

implementation

uses
  uPrincipalF, uDadosIniFiscal;

{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure tOpenTable.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ tOpenTable }

procedure tOpenTable.Execute;
begin
  { Place thread code here }
  if vDadosIniF.openTable = 'CLIENTES' then
  begin
    if not obCliente.Active then
      obCliente.getTodos;
  end
  else if vDadosIniF.openTable = 'PRODUTOS' then
  begin
    if not obProd.Active then
      obProd.getTodos;
  end
  else if vDadosIniF.openTable = 'SERVIÇOS' then
  begin
    if not obServ.Active then
      obServ.getTodos;
  end
  else if vDadosIniF.openTable = 'TODOS' then
  begin
    obProd.getTodos;
    obCliente.getTodos;
    obServ.getTodos;
  end;
  Terminate;
end;

end.

