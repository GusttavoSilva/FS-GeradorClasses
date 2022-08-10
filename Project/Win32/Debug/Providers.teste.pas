unit Providers.teste;

interface

uses

  system.Generics.Collections,
  Horse,Horse.JWT,
  System.SysUtils,
  System.JSON,
  Horse.Commons,
  Controller.ClaimsJWT,
  Core.Geral,
  Controller.CadastroUsuario;

procedure Registry(AppSecret, Prefix, Route : String);
procedure Get(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure GetRegistro(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure Post(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure Put(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure Delete(Req: THorseRequest; Res: THorseResponse; Next: TProc);

var
  Dados:  TJSONObject;

implementation

procedure Registry(AppSecret, Prefix, Route : String);
begin
  THorse
    .Group
    .Prefix(Prefix)

      .AddCallback(HorseJWT(AppSecret, THorseJWTConfig.New.SessionClass(TMyClaims)))
        .Delete(route + '/:ID', Delete)

      .AddCallback(HorseJWT(AppSecret, THorseJWTConfig.New.SessionClass(TMyClaims)))
        .Get(route + '/:ID',GetRegistro)

      .AddCallback(HorseJWT(AppSecret, THorseJWTConfig.New.SessionClass(TMyClaims)))
        .Route(route)

      .AddCallback(HorseJWT(AppSecret, THorseJWTConfig.New.SessionClass(TMyClaims)))
        .Put(Put)

      .AddCallback(HorseJWT(AppSecret, THorseJWTConfig.New.SessionClass(TMyClaims)))
        .Get(Get)

      .AddCallback(HorseJWT(AppSecret, THorseJWTConfig.New.SessionClass(TMyClaims)))
        .Post(Post)
end;


procedure GetRegistro(Req: THorseRequest; Res: THorseResponse; Next: TProc);
begin
  try
    StatusCode := THTTPStatus.OK;
    getUsuarioLogado(Req);
    Acao := upView;

    Res.Send(Tteste
                .New
                  .ID(Req.Params['ID'])
                .VisualizaRegistro).Status(StatusCode);

  except
    on E: Exception do
      raise Exception.Create(E.Message);
  end;

end;

procedure Get(Req: THorseRequest; Res: THorseResponse; Next: TProc);
begin
  try
    StatusCode := THTTPStatus.OK;
    Dados := TJsonObject.ParseJSONValue(req.Body) as TJsonObject;
    getUsuarioLogado(Req);
    Acao := upView;

    Res.Send(Tteste
                .New
                  .ID(Dados.GetValue('ID').Value)
                  .dsNome(Dados.GetValue('DSNOME').Value)
                  .dsEmail(Dados.GetValue('DSEMAIL').Value)
                  .dsUsuario(Dados.GetValue('DSUSUARIO').Value)
                  .dsSenha(Dados.GetValue('DSSENHA').Value)
                  .stAtivo(Dados.GetValue('STATIVO').Value.ToString)
                  .dtReg(Dados.GetValue('DTREG').Value.ToString)
                  .codUsuarioReg(Dados.GetValue('CODUSUARIOREG').Value)
                  .stAcaoReg(Dados.GetValue('STACAOREG').Value.ToString)

                .ListaRegistro).Status(StatusCode);

  except
    on E: Exception do
      raise Exception.Create(E.Message);
  end;
end;

procedure Post(Req: THorseRequest; Res: THorseResponse; Next: TProc);
begin
  StatusCode := THTTPStatus.OK;
  Acao := upInsert;
  getUsuarioLogado(Req);
  Dados := TJsonObject.ParseJSONValue(req.Body) as TJsonObject;

  Res.Send(Tteste
              .New
                  .ID(Dados.GetValue('ID').Value)
                  .dsNome(Dados.GetValue('DSNOME').Value)
                  .dsEmail(Dados.GetValue('DSEMAIL').Value)
                  .dsUsuario(Dados.GetValue('DSUSUARIO').Value)
                  .dsSenha(Dados.GetValue('DSSENHA').Value)
                  .stAtivo(Dados.GetValue('STATIVO').Value.ToString)
                  .dtReg(Dados.GetValue('DTREG').Value.ToString)
                  .codUsuarioReg(Dados.GetValue('CODUSUARIOREG').Value)
                  .stAcaoReg(Dados.GetValue('STACAOREG').Value.ToString)

              .GravaRegistro).Status(StatusCode);

end;

procedure Put(Req: THorseRequest; Res: THorseResponse; Next: TProc);
begin
  StatusCode := THTTPStatus.Created;
  Acao := upUpdate;
  getUsuarioLogado(Req);
  Dados := TJsonObject.ParseJSONValue(req.Body) as TJsonObject;

  Res.Send(Tteste
              .New
                  .ID(Dados.GetValue('ID').Value)
                  .dsNome(Dados.GetValue('DSNOME').Value)
                  .dsEmail(Dados.GetValue('DSEMAIL').Value)
                  .dsUsuario(Dados.GetValue('DSUSUARIO').Value)
                  .dsSenha(Dados.GetValue('DSSENHA').Value)
                  .stAtivo(Dados.GetValue('STATIVO').Value.ToString)
                  .dtReg(Dados.GetValue('DTREG').Value.ToString)
                  .codUsuarioReg(Dados.GetValue('CODUSUARIOREG').Value)
                  .stAcaoReg(Dados.GetValue('STACAOREG').Value.ToString)

              .GravaRegistro).Status(StatusCode);

end;

procedure Delete(Req: THorseRequest; Res: THorseResponse; Next: TProc);
begin
  try
    StatusCode := THTTPStatus.OK;
    getUsuarioLogado(Req);
    Acao := upDelete;
    
    Res.Send(Tteste
                .New
                  .ID(Req.Params['ID'])
                .GravaRegistro);

    res.Status(StatusCode);
  except
    on E: Exception do
      raise Exception.Create(E.Message);
  end;

end;

end.

