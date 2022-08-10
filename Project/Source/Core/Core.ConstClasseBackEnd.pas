unit Core.ConstClasseBackEnd;

interface

 uses
  FireDAC.Comp.Client,
  System.SysUtils,
  StrUtils, Core.Funcoes;

const
     interfaced = 'unit Interfaced.*NomeUnit*; '                                                                        + slinebreak +
                  ' '                                                                                                   + slinebreak +
                  'interface '                                                                                          + slinebreak +
                  ' '                                                                                                   + slinebreak +
                  'uses System.JSON; '                                                                                  + slinebreak +
                  ' '                                                                                                   + slinebreak +
                  'type '                                                                                               + slinebreak +
                  '  *Interface* = interface '                                                                          + slinebreak +
                  '  [*guid*] '                                                                                         + slinebreak +
                  ' '                                                                                                   + slinebreak +
                  '*FuncaoPublic*'                                                                                      + slinebreak +
                  '    function VisualizaRegistro: String;'                                                             + slinebreak +
                  '    function ListaRegistro: string;'                                                                 + slinebreak +
                  '    function GravaRegistro: String;'                                                                 + slinebreak +
                  '  end; '                                                                                             + slinebreak +
                  ' '                                                                                                   + slinebreak +
                  'implementation '                                                                                     + slinebreak +
                  ' '                                                                                                   + slinebreak +
                  'end. ';

    Controller = 'unit Controller.*NomeUnit*;'                                                                          + slinebreak +
                 ' '                                                                                                    + slinebreak +
                 'interface'                                                                                            + slinebreak +
                 ' '                                                                                                    + slinebreak +
                 'uses '                                                                                                + slinebreak +
                 '   Controller.QueryFD,'                                                                               + slinebreak +
                 '   System.SysUtils,'                                                                                  + slinebreak +
                 '   Vcl.Dialogs,'                                                                                      + slinebreak +
                 '   Winapi.Windows,'                                                                                   + slinebreak +
                 '   Core.FuncBancoDadosPadrao,'                                                                        + slinebreak +
                 '   System.JSON,'                                                                                      + slinebreak +
                 '   Core.Geral,'                                                                                       + slinebreak +
                 '   DataSet.Serialize,'                                                                                + slinebreak +
                 '   Horse.Commons,'                                                                                    + slinebreak +
                 '   Interfaced.*NomeUnit*;'                                                                            + slinebreak +
                 ' '                                                                                                    + slinebreak +
                 'type '                                                                                                + slinebreak +
                 '  *Classe* = class(TInterfacedObject, *Interface*) '                                                  + slinebreak +
                 '  private '                                                                                           + slinebreak +
                 '    JsonResp : TJSONObject; '                                                                         + slinebreak +
                 ' '                                                                                                    + slinebreak +
                 '*Variaveis*'                                                                                          + slinebreak +
                 ' '                                                                                                    + slinebreak +
                 '    procedure ValidaDados; '                                                                          + slinebreak +
                 ' '                                                                                                    + slinebreak +
                 '  public '                                                                                            + slinebreak +
                 '    constructor Create; '                                                                             + slinebreak +
                 '    destructor Destroy; override; '                                                                   + slinebreak +
                 '    class function New: *Interface*; '                                                                + slinebreak +
                 ' '                                                                                                    + slinebreak +
                 '*FuncaoPublic* '                                                                                      + slinebreak +
                 ' '                                                                                                    + slinebreak +
                 '    function VisualizaRegistro: String;'                                                              + slinebreak +
                 '    function ListaRegistro: string;'                                                                  + slinebreak +
                 '    function GravaRegistro: String;'                                                                  + slinebreak +
                 ' '                                                                                                    + slinebreak +
                 '  end; '                                                                                              + slinebreak +
                 ' '                                                                                                    + slinebreak +
                 'implementation '                                                                                      + slinebreak +
                 ' '                                                                                                    + slinebreak +
                 ' '                                                                                                    + slinebreak +
                 '{ *Classe* } '                                                                                        + slinebreak +
                 ' '                                                                                                    + slinebreak +
                 'class function *Classe*.New: *Interface*; '                                                           + slinebreak +
                 'begin '                                                                                               + slinebreak +
                 '  result := self.Create; '                                                                            + slinebreak +
                 'end; '                                                                                                + slinebreak +
                 ' '                                                                                                    + slinebreak +
                 'constructor *Classe*.Create; '                                                                        + slinebreak +
                 'begin '                                                                                               + slinebreak +
                 '  JsonResp := TJSONObject.Create; '                                                                   + slinebreak +
                 'end; '                                                                                                + slinebreak +
                 ' '                                                                                                    + slinebreak +
                 'destructor *Classe*.Destroy; '                                                                        + slinebreak +
                 'begin '                                                                                               + slinebreak +
                 '  JsonResp.DisposeOf; '                                                                               + slinebreak +
                  '  inherited; '                                                                                       + slinebreak +
                 'end; '                                                                                                + slinebreak +
                 ' '                                                                                                    + slinebreak +
                 '*Funcoes* '                                                                                           + slinebreak +
                 ' '                                                                                                    + slinebreak +
                 'procedure *Classe*.ValidaDados; '                                                                     + slinebreak +
                 'begin '                                                                                               + slinebreak +
                 '//  if Acao <> upView then '                                                                          + slinebreak +
                 '//  begin '                                                                                           + slinebreak +
                 '//    if FNome.IsEmpty then '                                                                         + slinebreak +
                 '//    begin '                                                                                         + slinebreak +
                 '//      raise Exception.Create(''401 - Informe um Usuario''); '                                       + slinebreak +
                 '//    end; '                                                                                          + slinebreak +
                 '//  end; '                                                                                            + slinebreak +
                 'end; '                                                                                                + slinebreak +
                 ' '                                                                                                    + slinebreak +
                 'function *Classe*.ListaRegistro: string; '                                                            + slinebreak +
                 'var '                                                                                                 + slinebreak +
                 '  cQuery: TQueryFD; '                                                                                 + slinebreak +
                 'begin '                                                                                               + slinebreak +
                 '  cQuery: TQueryFD.create; '                                                                          + slinebreak +
                 '  try '                                                                                               + slinebreak +
                 '    cQuery '                                                                                          + slinebreak +
                 '     .SQLQuery('' SELECT * FROM *SCHEMA*.*TABLE* WHERE 0=0 '') '                                      + slinebreak +
                 '       .ParametrosQuery('','') '                                                                      + slinebreak +
                 '      .Open  '                                                                                        + slinebreak +
                 '      .DataSetToJsonArray; '                                                                          + slinebreak +
                 ' '                                                                                                    + slinebreak +
                 '  except '                                                                                            + slinebreak +
                 '  on E: Exception do '                                                                                + slinebreak +
                 '    begin '                                                                                           + slinebreak +
                 '      result := ValidaErro(E, Self.UnitName , ''ListaRegistro''); '                                   + slinebreak +
                 '    end; '                                                                                            + slinebreak +
                 '  end; '                                                                                              + slinebreak +
                 'end; '                                                                                                + slinebreak +
                 ' '                                                                                                    + slinebreak +
                 'function *Classe*.VisualizaRegistro: String; '                                                        + slinebreak +
                 'var '                                                                                                 + slinebreak +
                 '  cQuery: TQueryFD; '                                                                                 + slinebreak +
                 'begin '                                                                                               + slinebreak +
                 '  cQuery: TQueryFD.create; '                                                                          + slinebreak +
                 '  try '                                                                                               + slinebreak +
                 '    cQuery '                                                                                          + slinebreak +
                 '      .SQLQuery('' SELECT * FROM *SCHEMA*.*TABLE* WHERE ID = :ID'') '                                 + slinebreak +
                 '      .ParametrosQuery(''ID'', FID) '                                                                 + slinebreak +
                 '    .Open  '                                                                                          + slinebreak +
                 '    .DataSetToJsonObject;  '                                                                          + slinebreak +
                 ' '                                                                                                    + slinebreak +
                 '  except '                                                                                            + slinebreak +
                 '  on E: Exception do '                                                                                + slinebreak +
                 '    begin '                                                                                           + slinebreak +
                 '      result := ValidaErro(E, Self.UnitName , ''VisualizaRegistro''); '                               + slinebreak +
                 '    end; '                                                                                            + slinebreak +
                 '  end; '                                                                                              + slinebreak +
                 'end; '                                                                                                + slinebreak +
                 ' '                                                                                                    + slinebreak +
                 'function *Classe*.GravaRegistro: String; '                                                            + slinebreak +
                 'const '                                                                                               + slinebreak +
                 'SQL = '' EXEC {procedure aqui}''+ '                                                                   + slinebreak +
                 ''' ,@ID            = :ID   ''+ '                                                                      + slinebreak +
                 ''' ,@Ativo         = :Ativo   ''+ '                                                                   + slinebreak +
                 ''' ,@Acao          = :Acao'' +              { OS PARAMETROS ACAO E CODUSUARIO  } '                    + slinebreak +
                 ''' ,@CodUsuarioReg = :CodUsuarioReg'';      { ESTA DENTRO DA CLASSE QUERYFD    } '                    + slinebreak +
                  'var '                                                                                                + slinebreak +
                 '  cQuery: TQueryFD; '                                                                                 + slinebreak +
                 'begin '                                                                                               + slinebreak +
                 '  cQuery: TQueryFD.create; '                                                                          + slinebreak +
                 '  result := EmptyStr; '                                                                               + slinebreak +
                 '  try '                                                                                               + slinebreak +
                 '    if Acao <> upDelete then '                                                                        + slinebreak +
                 '    ValidaDados; '                                                                                    + slinebreak +
                 '    cQuery '                                                                                          + slinebreak +
                 '      .SQLQuery(SQL) '                                                                                + slinebreak +
                 '      .ParametrosQuery(''ID'', FID)'                                                                  + slinebreak +
                 '      .ParametrosQuery(''Ativo'', FAtivo)'                                                            + slinebreak +
                 '    .ExecSql; '                                                                                       + slinebreak +
                 '  except '                                                                                            + slinebreak +
                 '  on E: Exception do '                                                                                + slinebreak +
                 '    begin '                                                                                           + slinebreak +
                 '      result := ValidaErro(E, Self.UnitName , ''GravaRegistro''); '                                   + slinebreak +
                 '    end; '                                                                                            + slinebreak +
                 '  end; '                                                                                              + slinebreak +
                 'end; '                                                                                                + slinebreak +
                 ' '                                                                                                    + slinebreak +
                 'end. '                                                                                                + slinebreak ;

  FuncaoPublic = '    function *Campo*(Value: *Type*): *Interface*;'                                                    + slinebreak ;

       Funcoes = 'function *Classe*.*Campo*(Value: *Type*): *Interface*;'                                               + slinebreak +
                 'begin '                                                                                               + slinebreak +
                 '  result := self;'                                                                                    + slinebreak +
                 '  F*Campo* := Value;'                                                                                 + slinebreak +
                 'end;'                                                                                                 + slinebreak ;

     Variaveis = '    F*Campo* : *Type*;'                                                                               + slinebreak ;




function GeraInterfaced(query: TFDQuery): String;
function GeraController(query: TFDQuery): String;
function GeraFuncaoPublic(query: TFDQuery): String;
function GeraVariaveis(query: TFDQuery): String;
function Gerafuncoes(query: TFDQuery): String;
implementation



function GeraInterfaced(query: TFDQuery): String;
begin
  var
  interfaced := interfaced;
  interfaced := StringReplace(interfaced ,'*NomeUnit*'     ,NomeUnit                ,[rfReplaceAll ,rfIgnoreCase]);
  interfaced := StringReplace(interfaced ,'*interface*'    ,NomeInterfaced          ,[rfReplaceAll ,rfIgnoreCase]);
  interfaced := StringReplace(interfaced ,'*FuncaoPublic*' ,GeraFuncaoPublic(query) ,[rfReplaceAll ,rfIgnoreCase]);
  interfaced := StringReplace(interfaced ,'*guid*'         ,QuotedStr(GuidCreate)   ,[rfReplaceAll ,rfIgnoreCase]);
  result     := interfaced;
end;

function GeraController(query: TFDQuery): String;
begin
  var
  controller := controller;
  controller := StringReplace(controller ,'*NomeUnit*'     ,NomeUnit                ,[rfReplaceAll ,rfIgnoreCase]);
  controller := StringReplace(controller ,'*interface*'    ,NomeInterfaced          ,[rfReplaceAll ,rfIgnoreCase]);
  controller := StringReplace(controller ,'*Classe*'       ,NomeClasse              ,[rfReplaceAll ,rfIgnoreCase]);
  controller := StringReplace(controller ,'*Variaveis*'    ,GeraVariaveis(query)    ,[rfReplaceAll ,rfIgnoreCase]);
  controller := StringReplace(controller ,'*FuncaoPublic*' ,GeraFuncaoPublic(query) ,[rfReplaceAll ,rfIgnoreCase]);
  controller := StringReplace(controller ,'*Funcoes*'      ,Gerafuncoes(query)      ,[rfReplaceAll ,rfIgnoreCase]);
  controller := StringReplace(controller ,'*SCHEMA*'       ,NomeSchema              ,[rfReplaceAll ,rfIgnoreCase]);
  controller := StringReplace(controller ,'*TABLE*'        ,NomeTabela              ,[rfReplaceAll ,rfIgnoreCase]);
  result     := controller;
end;


function GeraVariaveis(query: TFDQuery): String;
begin
  Query.First;
  for var count := 0 to Query.RecordCount - 1 do
  begin
    var
    value  := Variaveis;
    value  := StringReplace(value ,'*Campo*' ,Query.FieldByName('COLUMN_NAME').AsString          ,[rfReplaceAll ,rfIgnoreCase]);
    value  := StringReplace(value ,'*Type*'  ,TypeCampo(Query.FieldByName('DATA_TYPE').AsString) ,[rfReplaceAll ,rfIgnoreCase]);
    result := result + value;
    Query.Next;
  end;
end;

function GeraFuncaoPublic(query: TFDQuery): String;
begin
  Query.First;
  for var count := 0 to Query.RecordCount - 1 do
  begin
    var
    value  := FuncaoPublic;
    value  := StringReplace(value ,'*Campo*'     ,Query.FieldByName('COLUMN_NAME').AsString          ,[rfReplaceAll ,rfIgnoreCase]);
    value  := StringReplace(value ,'*Type*'      ,TypeCampo(Query.FieldByName('DATA_TYPE').AsString) ,[rfReplaceAll ,rfIgnoreCase]);
    value  := StringReplace(value ,'*Classe*'    ,NomeClasse                                         ,[rfReplaceAll ,rfIgnoreCase]);
    value  := StringReplace(value ,'*Interface*' ,NomeInterfaced                                     ,[rfReplaceAll ,rfIgnoreCase]);
    result := result + value;
    Query.Next;
  end;
end;

function Gerafuncoes(query: TFDQuery): String;
begin
  Query.First;

  for var count := 0 to Query.RecordCount - 1 do
  begin
    var
    value  := Funcoes;
    value  := StringReplace(value ,'*Campo*'     ,Query.FieldByName('COLUMN_NAME').AsString          ,[rfReplaceAll ,rfIgnoreCase]);
    value  := StringReplace(value ,'*Type*'      ,TypeCampo(Query.FieldByName('DATA_TYPE').AsString) ,[rfReplaceAll ,rfIgnoreCase]);
    value  := StringReplace(value ,'*Classe*'    ,NomeClasse                                         ,[rfReplaceAll ,rfIgnoreCase]);
    value  := StringReplace(value ,'*Interface*' ,NomeInterfaced                                     ,[rfReplaceAll ,rfIgnoreCase]);
    result := result + value;
    Query.Next;
  end;
end;

end.

