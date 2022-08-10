unit Interfaced.; 
 
interface 
 
uses System.JSON; 
 
type 
ICadadastroUsuario = interface 
['{E45CFB09-8FBA-407D-80C1-D74C07105320}'] 
function .name(Value: String): ;
function .principal_id(Value: Integer): ;
function .diagram_id(Value: Integer): ;
function .version(Value: Integer): ;
function .definition(Value: String): ;

end; 
 
implementation 
 
end. 
