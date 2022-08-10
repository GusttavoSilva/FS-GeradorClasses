program FSGeraClasses;

uses
  Vcl.Forms,
  View.Principal in 'Source\View\View.Principal.pas' {Form2},
  Core.ConstClasseBackEnd in 'Source\Core\Core.ConstClasseBackEnd.pas',
  Core.ConstProvidersBackEnd in 'Source\Core\Core.ConstProvidersBackEnd.pas',
  Core.Funcoes in 'Source\Core\Core.Funcoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
