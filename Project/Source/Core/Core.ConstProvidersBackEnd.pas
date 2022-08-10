unit Core.ConstProvidersBackEnd;

interface

uses
  FireDAC.Comp.Client,
  System.SysUtils,
  StrUtils, Core.Funcoes;
 const
 provider = 'unit Providers.*NomeUnit*;'                                                                  + slinebreak +
            ''                                                                                            + slinebreak +
            'interface'                                                                                   + slinebreak +
            ''                                                                                            + slinebreak +
            'uses'                                                                                        + slinebreak +
            ''                                                                                            + slinebreak +
            '  system.Generics.Collections,'                                                              + slinebreak +
            '  Horse,Horse.JWT,'                                                                          + slinebreak +
            '  System.SysUtils,'                                                                          + slinebreak +
            '  System.JSON,'                                                                              + slinebreak +
            '  Horse.Commons,'                                                                            + slinebreak +
            '  Controller.ClaimsJWT,'                                                                     + slinebreak +
            '  Core.Geral,'                                                                               + slinebreak +
            '  Controller.*NomeUnit*;'                                                                    + slinebreak +
            ''                                                                                            + slinebreak +
            '  procedure Registry(AppSecret, Prefix, Route : String);'                                    + slinebreak +
            '  procedure Get(Req: THorseRequest; Res: THorseResponse; Next: TProc);'                      + slinebreak +
            '  procedure GetRegistro(Req: THorseRequest; Res: THorseResponse; Next: TProc);'              + slinebreak +
            '  procedure Post(Req: THorseRequest; Res: THorseResponse; Next: TProc);'                     + slinebreak +
            '  procedure Put(Req: THorseRequest; Res: THorseResponse; Next: TProc);'                      + slinebreak +
            '  procedure Delete(Req: THorseRequest; Res: THorseResponse; Next: TProc);'                   + slinebreak +
            ''                                                                                            + slinebreak +
            'var'                                                                                         + slinebreak +
            '  Dados:  TJSONObject;'                                                                      + slinebreak +
            ''                                                                                            + slinebreak +
            'implementation'                                                                              + slinebreak +
            ''                                                                                            + slinebreak +
            'procedure Registry(AppSecret, Prefix, Route : String);'                                      + slinebreak +
            'begin'                                                                                       + slinebreak +
            '  THorse'                                                                                    + slinebreak +
            '    .Group'                                                                                  + slinebreak +
            '    .Prefix(Prefix)'                                                                         + slinebreak +
            ''                                                                                            + slinebreak +
            '      .AddCallback(HorseJWT(AppSecret, THorseJWTConfig.New.SessionClass(TMyClaims)))'        + slinebreak +
            '        .Delete(route + ''/:ID'', Delete)'                                                   + slinebreak +
            ''                                                                                            + slinebreak +
            '      .AddCallback(HorseJWT(AppSecret, THorseJWTConfig.New.SessionClass(TMyClaims)))'        + slinebreak +
            '        .Get(route + ''/:ID'',GetRegistro)'                                                  + slinebreak +
            ''                                                                                            + slinebreak +
            '      .AddCallback(HorseJWT(AppSecret, THorseJWTConfig.New.SessionClass(TMyClaims)))'        + slinebreak +
            '        .Route(route)'                                                                       + slinebreak +
            ''                                                                                            + slinebreak +
            '      .AddCallback(HorseJWT(AppSecret, THorseJWTConfig.New.SessionClass(TMyClaims)))'        + slinebreak +
            '        .Put(Put)'                                                                           + slinebreak +
            ''                                                                                            + slinebreak +
            '      .AddCallback(HorseJWT(AppSecret, THorseJWTConfig.New.SessionClass(TMyClaims)))'        + slinebreak +
            '        .Get(Get)'                                                                           + slinebreak +
            ''                                                                                            + slinebreak +
            '      .AddCallback(HorseJWT(AppSecret, THorseJWTConfig.New.SessionClass(TMyClaims)))'        + slinebreak +
            '        .Post(Post)'                                                                         + slinebreak +
            'end;'                                                                                        + slinebreak +
            ''                                                                                            + slinebreak +
            ''                                                                                            + slinebreak +
            'procedure GetRegistro(Req: THorseRequest; Res: THorseResponse; Next: TProc);'                + slinebreak +
            'begin'                                                                                       + slinebreak +
            '  try'                                                                                       + slinebreak +
            '    StatusCode := THTTPStatus.OK;'                                                           + slinebreak +
            '    getUsuarioLogado(Req);'                                                                  + slinebreak +
            '    Acao := upView;'                                                                         + slinebreak +
            ''                                                                                            + slinebreak +
            '    Res.Send(*classe*'                                                                       + slinebreak +
            '                .New'                                                                        + slinebreak +
            '                  .ID(Req.Params[''ID''])'                                                   + slinebreak +
            '                .VisualizaRegistro).Status(StatusCode);'                                     + slinebreak +
            ''                                                                                            + slinebreak +
            '  except'                                                                                    + slinebreak +
            '    on E: Exception do'                                                                      + slinebreak +
            '      raise Exception.Create(E.Message);'                                                    + slinebreak +
            '  end;'                                                                                      + slinebreak +
            ''                                                                                            + slinebreak +
            'end;'                                                                                        + slinebreak +
            ''                                                                                            + slinebreak +
            'procedure Get(Req: THorseRequest; Res: THorseResponse; Next: TProc);'                        + slinebreak +
            'begin'                                                                                       + slinebreak +
            '  try'                                                                                       + slinebreak +
            '    StatusCode := THTTPStatus.OK;'                                                           + slinebreak +
            '    Dados := TJsonObject.ParseJSONValue(req.Body) as TJsonObject;'                           + slinebreak +
            '    getUsuarioLogado(Req);'                                                                  + slinebreak +
            '    Acao := upView;'                                                                         + slinebreak +
            ''                                                                                            + slinebreak +
            '    Res.Send(*classe*'                                                                       + slinebreak +
            '                .New'                                                                        + slinebreak +
            '*params*'                                                                                    + slinebreak +
            '                .ListaRegistro).Status(StatusCode);'                                         + slinebreak +
            ''                                                                                            + slinebreak +
            '  except'                                                                                    + slinebreak +
            '    on E: Exception do'                                                                      + slinebreak +
            '      raise Exception.Create(E.Message);'                                                    + slinebreak +
            '  end;'                                                                                      + slinebreak +
            'end;'                                                                                        + slinebreak +
            ''                                                                                            + slinebreak +
            'procedure Post(Req: THorseRequest; Res: THorseResponse; Next: TProc);'                       + slinebreak +
            'begin'                                                                                       + slinebreak +
            '  StatusCode := THTTPStatus.OK;'                                                             + slinebreak +
            '  Acao := upInsert;'                                                                         + slinebreak +
            '  getUsuarioLogado(Req);'                                                                    + slinebreak +
            '  Dados := TJsonObject.ParseJSONValue(req.Body) as TJsonObject;'                             + slinebreak +
            ''                                                                                            + slinebreak +
            '  Res.Send(*classe*'                                                                         + slinebreak +
            '              .New'                                                                          + slinebreak +
            '*params*'                                                                                    + slinebreak +
            '              .GravaRegistro).Status(StatusCode);'                                           + slinebreak +
            ''                                                                                            + slinebreak +
            'end;'                                                                                        + slinebreak +
            ''                                                                                            + slinebreak +
            'procedure Put(Req: THorseRequest; Res: THorseResponse; Next: TProc);'                        + slinebreak +
            'begin'                                                                                       + slinebreak +
            '  StatusCode := THTTPStatus.Created;'                                                        + slinebreak +
            '  Acao := upUpdate;'                                                                         + slinebreak +
            '  getUsuarioLogado(Req);'                                                                    + slinebreak +
            '  Dados := TJsonObject.ParseJSONValue(req.Body) as TJsonObject;'                             + slinebreak +
            ''                                                                                            + slinebreak +
            '  Res.Send(*classe*'                                                                         + slinebreak +
            '              .New'                                                                          + slinebreak +
            '*params*'                                                                                    + slinebreak +
            '              .GravaRegistro).Status(StatusCode);'                                           + slinebreak +
            ''                                                                                            + slinebreak +
            'end;'                                                                                        + slinebreak +
            ''                                                                                            + slinebreak +
            'procedure Delete(Req: THorseRequest; Res: THorseResponse; Next: TProc);'                     + slinebreak +
            'begin'                                                                                       + slinebreak +
            '  try'                                                                                       + slinebreak +
            '    StatusCode := THTTPStatus.OK;'                                                           + slinebreak +
            '    getUsuarioLogado(Req);'                                                                  + slinebreak +
            '    Acao := upDelete;'                                                                       + slinebreak +
            '    '                                                                                        + slinebreak +
            '    Res.Send(*classe*'                                                                       + slinebreak +
            '                .New'                                                                        + slinebreak +
            '                  .ID(Req.Params[''ID''])'                                                   + slinebreak +
            '                .GravaRegistro).Status(StatusCode);'                                         + slinebreak +
            ''                                                                                            + slinebreak +
            '  except'                                                                                    + slinebreak +
            '    on E: Exception do'                                                                      + slinebreak +
            '      raise Exception.Create(E.Message);'                                                    + slinebreak +
            '  end;'                                                                                      + slinebreak +
            ''                                                                                            + slinebreak +
            'end;'                                                                                        + slinebreak +
            ''                                                                                            + slinebreak +
            '(**  COLA JSON  **) '                                                                        + slinebreak +
            '{'                                                                                           + slinebreak +
            '*json*'                                                                                      + slinebreak +
            '}'                                                                                           + slinebreak +
            'end.'                                                                                        + slinebreak ;


parametrosProvider = '                  .*Campo*(*DadosParametro*)'                                       + slinebreak ;

DadosParametro     = 'dados.GetValue(''*CampoJson*'').Value' ;

jsontext = '  *Campo*'                                                                                    + slinebreak ;

function GeraProvider(query: TFDQuery): String;
function GeraProviderParametro(query: TFDQuery): String;
function geraJson(query: TFDQuery): String;

implementation

function GeraProvider(query: TFDQuery): String;
begin
  var
  value  := provider;
  value  := StringReplace(value ,'*params*'   ,GeraProviderParametro(query) ,[rfReplaceAll ,rfIgnoreCase]);
  value  := StringReplace(value ,'*Classe*'   ,NomeClasse                   ,[rfReplaceAll ,rfIgnoreCase]);
  value  := StringReplace(value ,'*NomeUnit*' ,NomeUnit                     ,[rfReplaceAll ,rfIgnoreCase]);
  value  := StringReplace(value ,'*json*'     ,geraJson(query)              ,[rfReplaceAll ,rfIgnoreCase]);
  result := value;
end;

function geraJson(query: TFDQuery): String;
begin
  query.First;
  for var count := 0 to query.RecordCount - 1 do
  begin
    var
    value := jsontext;
    value := StringReplace(value, '*Campo*', '"' + UpperCase(query.FieldByName('COLUMN_NAME').AsString) + '" : ""' +
      ifthen(count <> query.RecordCount - 1, ', ', ''), [rfReplaceAll, rfIgnoreCase]);
    result := result + value;
    query.Next;
  end;
end;

function GeraProviderParametro(query: TFDQuery): String;
begin
  query.First;
  for var count := 0 to query.RecordCount - 1 do
  begin
    var
    value := parametrosProvider;

    value := StringReplace(value, '*DadosParametro*', convertDadosParametros(DadosParametro,
      TypeCampo(query.FieldByName('DATA_TYPE').AsString)), [rfReplaceAll, rfIgnoreCase]);

    value := StringReplace(value, '*CampoJson*', UpperCase(query.FieldByName('COLUMN_NAME').AsString),
      [rfReplaceAll, rfIgnoreCase]);

    value  := StringReplace(value, '*Campo*', query.FieldByName('COLUMN_NAME').AsString, [rfReplaceAll, rfIgnoreCase]);

    result := result + value;

    query.Next;
  end;
end;

end.
