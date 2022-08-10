unit Controller.
 
interface
 
uses 
QueryFD, 
System.SysUtils, 
Firedac.Comp.Client, 
Vcl.Dialogs, 
Core.ConstantesVariaveis, 
Core.Funcoes, 
Core.Status, 
Winapi.Windows, 
I.; 
 
type 
   = class(TInterfacedObject, ) 
private 
  Conexao: TObjectFiredac; 
  FQuery : TFDQuery; 
 
 Fname : String;
Fprincipal_id : Integer;
Fdiagram_id : Integer;
Fversion : Integer;
Fdefinition : String;

 
public 
  constructor Create; 
  destructor Destroy; override; 
  class function New: ; 
 
 function .name(Value: String): ;
function .principal_id(Value: Integer): ;
function .diagram_id(Value: Integer): ;
function .version(Value: Integer): ;
function .definition(Value: String): ;
 
 
end; 
 
implementation 
 
 
{  } 
 
class function .New: ; 
begin 
  result := self.Create; 
end; 
 
constructor .Create; 
begin 
  Conexao := TObjectFiredac.Create; 
  FQuery  := Conexao.CreateQuery; 
end; 
 
destructor .Destroy; 
begin 
  FreeAndNil(FQuery); 
  inherited; 
end; 
 
 function .name(Value: String): ;
begin 
  result := self;
  Fname := Value;
end;

function .principal_id(Value: Integer): ;
begin 
  result := self;
  Fprincipal_id := Value;
end;

function .diagram_id(Value: Integer): ;
begin 
  result := self;
  Fdiagram_id := Value;
end;

function .version(Value: Integer): ;
begin 
  result := self;
  Fversion := Value;
end;

function .definition(Value: String): ;
begin 
  result := self;
  Fdefinition := Value;
end;

 
 
end. 

