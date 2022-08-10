unit Core.Funcoes;

interface

uses
  Winapi.ActiveX,
  System.SysUtils,
  System.StrUtils;

function GuidCreate: string;
function convertDadosParametros(ParametroDados, typeCampo: String): string;
function typeCampo(value: String): String;

var
  NomeClasse,
  NomeUnit,
  NomeInterfaced,
  NomeSchema,
  NomeTabela: String;

implementation

function GuidCreate: string;
var
  ID: TGUID;
begin
  result := '';
  if CoCreateGuid(ID) = S_OK then
    result := GUIDToString(ID);
end;

function convertDadosParametros(ParametroDados, typeCampo: String): string;
begin { os parametros json sempre chegam como string }
  case AnsiIndexStr(typeCampo, ['String', 'Integer', 'TDateTime', 'TDate', 'Double', 'TTime']) of
    0:
      result := ParametroDados;
    1:
      result := 'StrToInt(' + ParametroDados + ')';
    2:
      result := 'StrToDateTime(' + ParametroDados + ')';
    3:
      result := 'StrToDate(' + ParametroDados + ')';
    4:
      result := 'StrTofloat(' + ParametroDados + ')';
    5:
      result := 'StrToTime(' + ParametroDados + ')';
  end;
end;

function typeCampo(value: String): String;
begin

  case AnsiIndexStr(UpperCase(value), ['UNIQUEIDENTIFIER', 'VARCHAR', 'CHAR', 'TEXT', 'NCHAR', 'NVARCHAR', 'VARBINARY',
    'BINARY', 'IMAGE', 'BIGINT', 'BIT', 'SMALLINT', 'DECIMAL', 'SMALLMONEY', 'INT', 'TINYINT', 'MONEY', 'DATETIME',
    'TIMESTAMP', 'DATE', 'FLOAT', 'REAL', 'NUMERIC', 'TIME']) of
    0, 1, 2, 3, 4, 5, 6, 7, 8:
      result := 'String';
    9, 10, 11, 12, 13, 14, 15, 16:
      result := 'Integer';
    17, 18:
      result := 'TDateTime';
    19:
      result := 'TDate';
    20, 21, 22:
      result := 'Double';
    23:
      result := 'TTime';
  end;

end;

end.
