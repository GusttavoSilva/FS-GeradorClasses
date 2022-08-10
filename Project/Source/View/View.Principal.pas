unit View.Principal;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef,
  FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  FireDAC.Phys.ODBCBase,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Mask,
  Core.ConstClasseBackEnd,
  ComObj,
  ActiveX,
  FileCtrl,
  Vcl.DBCtrls,
  System.StrUtils,
  Vcl.CheckLst,
  Core.ConstProvidersBackEnd,
  System.IniFiles,
  Core.Funcoes,
  Vcl.ComCtrls;

type
  TForm2 = class(TForm)
    FDConnection1: TFDConnection;
    qrTable: TFDQuery;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    qrCampos: TFDQuery;
    DataSource2: TDataSource;
    qrCamposCOLUMN_NAME: TWideStringField;
    qrCamposDATA_TYPE: TWideStringField;
    qrCamposCOLUMN_DEFAULT: TWideStringField;
    qrCamposIS_NULLABLE: TStringField;
    Button1: TButton;
    qrSchema: TFDQuery;
    DataSource3: TDataSource;
    GridPanel1: TGridPanel;
    DBGrid1: TDBGrid;
    DBGrid3: TDBGrid;
    DBGrid2: TDBGrid;
    qrSchemaTABLE_SCHEMA: TWideStringField;
    qrTableTABLE_NAME: TWideStringField;
    edtNomeUnit: TLabeledEdit;
    edtNomeInterface: TLabeledEdit;
    edtNomeClasse: TLabeledEdit;
    edtCaminhoInterface: TLabeledEdit;
    edtCaminhoController: TLabeledEdit;
    btnBuscaCaminhoInterface: TButton;
    btnBuscaCaminhoController: TButton;
    Panel3: TPanel;
    ckbController: TCheckBox;
    ckbProviders: TCheckBox;
    ckbInterfaced: TCheckBox;
    Panel4: TPanel;
    ckbfrontEnd: TCheckBox;
    ckbBackEnd: TCheckBox;
    edtCaminhoProvider: TLabeledEdit;
    btnBuscaCaminhoProviders: TButton;
    PG: TProgressBar;
    Memo: TMemo;
    procedure qrTableAfterScroll(DataSet: TDataSet);
    procedure qrSchemaAfterScroll(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
    procedure edtNomeUnitChange(Sender: TObject);
    procedure btnBuscaCaminhoInterfaceClick(Sender: TObject);
    procedure btnBuscaCaminhoControllerClick(Sender: TObject);
    procedure ckbBackEndClick(Sender: TObject);
    procedure btnBuscaCaminhoProvidersClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

     caminhoController,
     caminhoInterfaced,
     caminhoProviders: String;

    procedure ValidaCampos;

  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}
procedure TForm2.qrTableAfterScroll(DataSet: TDataSet);
begin
  qrCampos.Close;
  qrCampos.ParamByName('schema').AsString := qrSchema.fieldbyname('TABLE_SCHEMA').AsString;
  qrCampos.ParamByName('tabela').AsString := qrTable.fieldbyname('TABLE_NAME').AsString;
  qrCampos.Open;
end;

procedure TForm2.qrSchemaAfterScroll(DataSet: TDataSet);
begin
  qrTable.Close;
  qrTable.ParamByName('schema').AsString := qrSchema.fieldbyname('TABLE_SCHEMA').AsString;
  qrTable.Open;
end;

procedure TForm2.btnBuscaCaminhoControllerClick(Sender: TObject);
var
  selDir    : string;
begin
  SelectDirectory('Selecione uma pasta', caminhoController, selDir);
  edtCaminhoController.Text := ifthen(selDir = EmptyStr, caminhoController,selDir+ '\') ;
end;

procedure TForm2.btnBuscaCaminhoInterfaceClick(Sender: TObject);
var
  selDir    : string;
begin
  SelectDirectory('Selecione uma pasta', caminhoInterfaced, selDir);
  edtCaminhoInterface.Text := ifthen(selDir = EmptyStr, caminhoInterfaced,selDir+ '\') ;
end;

procedure TForm2.btnBuscaCaminhoProvidersClick(Sender: TObject);
var
  selDir    : string;
begin
  SelectDirectory('Selecione uma pasta', caminhoProviders, selDir);
  edtCaminhoProvider.Text := ifthen(selDir = EmptyStr, caminhoProviders,selDir+ '\') ;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin

  NomeClasse     := edtNomeClasse.Text;
  NomeUnit       := edtNomeUnit.Text;
  NomeInterfaced := edtNomeInterface.Text;
  NomeSchema     := qrSchemaTABLE_SCHEMA.Text;
  NomeTabela     := qrTableTABLE_NAME.Text;

  ValidaCampos;
  PG.Visible:= true;
  PG.Position := 25;

  if ckbInterfaced.Checked then
  begin
    Memo.Lines.Clear;
    Memo.Lines.ADD(GeraInterfaced(qrCampos));
    Memo.Lines.SaveToFile(edtCaminhoInterface.Text + 'Interfaced.' + NomeUnit + '.pas');
  end;
  PG.Position := 50;
  if ckbController.Checked then
  begin
    Memo.Lines.Clear;
    Memo.Lines.ADD(GeraController(qrCampos));
    Memo.Lines.SaveToFile(edtCaminhoController.Text + 'Controller.' + NomeUnit + '.pas');
  end;
  PG.Position := 75;
  if ckbProviders.Checked then
  begin
    Memo.Lines.Clear;
    Memo.Lines.ADD(GeraProvider(qrCampos));
    Memo.Lines.SaveToFile(edtCaminhoProvider.Text + 'Providers.' + NomeUnit + '.pas');
  end;
  PG.Position := 100;
  Application.PROCESSMESSAGES;
end;

procedure TForm2.ckbBackEndClick(Sender: TObject);
begin
  ckbProviders.Visible := ckbBackEnd.Checked;
end;

procedure TForm2.edtNomeUnitChange(Sender: TObject);
begin
  if edtNomeUnit.Text <> EmptyStr then
  begin
    edtNomeClasse.Text    := 'T' + edtNomeUnit.Text;
    edtNomeInterface.Text := 'I' + edtNomeUnit.Text;
  end
  else
  begin
    edtNomeClasse.Text    := EmptyStr;
    edtNomeInterface.Text := EmptyStr;
  end;
end;

procedure TForm2.FormCreate(Sender: TObject);
var
  ArquivoINI: TIniFile;
begin
  ArquivoINI := TIniFile.Create(ExtractFileDir(Application.ExeName) + '\ConfiguracaoINI.ini');
  try
    caminhoController :=  ArquivoINI.ReadString('backend', 'caminhoInterfaced', '');
    caminhoInterfaced :=  ArquivoINI.ReadString('backend', 'caminhoInterfaced', '');
    caminhoProviders  :=  ArquivoINI.ReadString('backend', 'caminhoInterfaced', '');

    edtCaminhoInterface.Text     := caminhoInterfaced;
    edtCaminhoController.Text    := caminhoController;
    edtCaminhoProvider.Text      := caminhoProviders;
  finally
     FreeAndNil(ArquivoINI);
  end;
end;

procedure TForm2.ValidaCampos;
begin
  if edtNomeUnit.Text = EmptyStr then
    raise Exception.Create('Informe o Nome da Unit');

  if edtNomeUnit.Text = EmptyStr then
    raise Exception.Create('Informe o Nome da Classe');

  if edtNomeUnit.Text = EmptyStr then
    raise Exception.Create('Informe o Nome da Interface');


  if ckbInterfaced.Checked then
  begin
    if not DirectoryExists(Trim(edtCaminhoInterface.Text)) then
      raise Exception.Create('O diretório da interface não existe');

    if FileExists(Trim(edtCaminhoInterface.Text + 'Interfaced.' + NomeUnit + '.pas')) then
      raise Exception.Create('Já existe um arquivo com esse nome');
  end;

    if ckbController.Checked then
  begin
    if not DirectoryExists(Trim(edtCaminhoController.Text)) then
      raise Exception.Create('O diretório da Controller não existe');
    if FileExists(Trim(edtCaminhoController.Text + 'Controller.' + NomeUnit + '.pas')) then
      raise Exception.Create('Já existe um arquivo com esse nome');
  end;

  if ckbProviders.Checked then
  begin
    if not DirectoryExists(Trim(edtCaminhoProvider.Text)) then
      raise Exception.Create('O diretório da Providers não existe');

    if FileExists(Trim(edtCaminhoProvider.Text + 'Providers.' + NomeUnit + '.pas')) then
      raise Exception.Create('Já existe um arquivo com esse nome');
  end;
end;

end.
