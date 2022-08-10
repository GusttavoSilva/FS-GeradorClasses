object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 712
  ClientWidth = 1066
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1066
    Height = 89
    Align = alTop
    TabOrder = 0
    object edtNomeUnit: TLabeledEdit
      Left = 17
      Top = 26
      Width = 121
      Height = 23
      EditLabel.Width = 74
      EditLabel.Height = 15
      EditLabel.Caption = 'Nome da Unit'
      ImeName = 'Nome da Unit'
      TabOrder = 0
      Text = ''
      OnChange = edtNomeUnitChange
    end
    object edtNomeInterface: TLabeledEdit
      Left = 169
      Top = 26
      Width = 121
      Height = 23
      EditLabel.Width = 98
      EditLabel.Height = 15
      EditLabel.Caption = 'Nome da Interface'
      ImeName = 'Nome da Unit'
      TabOrder = 1
      Text = ''
    end
    object edtNomeClasse: TLabeledEdit
      Left = 315
      Top = 26
      Width = 121
      Height = 23
      EditLabel.Width = 83
      EditLabel.Height = 15
      EditLabel.Caption = 'Nome da classe'
      ImeName = 'Nome da Unit'
      TabOrder = 2
      Text = ''
    end
    object Panel3: TPanel
      Left = 778
      Top = 15
      Width = 151
      Height = 68
      TabOrder = 3
      object ckbController: TCheckBox
        Left = 8
        Top = 24
        Width = 97
        Height = 17
        Caption = 'Controller'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object ckbProviders: TCheckBox
        Left = 8
        Top = 47
        Width = 97
        Height = 17
        Caption = 'Providers'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object ckbInterfaced: TCheckBox
        Left = 8
        Top = 1
        Width = 97
        Height = 17
        Caption = 'Interfaced'
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
    end
    object Panel4: TPanel
      Left = 570
      Top = 15
      Width = 151
      Height = 68
      TabOrder = 4
      object ckbfrontEnd: TCheckBox
        Left = 8
        Top = 24
        Width = 97
        Height = 17
        Caption = 'Front-End'
        TabOrder = 0
      end
      object ckbBackEnd: TCheckBox
        Left = 8
        Top = 1
        Width = 97
        Height = 17
        Caption = 'BackEnd'
        TabOrder = 1
        OnClick = ckbBackEndClick
      end
    end
    object Memo: TMemo
      Left = 1064
      Top = 0
      Width = 108
      Height = 106
      Lines.Strings = (
        'Memo')
      TabOrder = 5
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 568
    Width = 1066
    Height = 144
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 760
      Top = 16
      Width = 185
      Height = 87
      Caption = 'Gerar Arquivo'
      TabOrder = 0
      OnClick = Button1Click
    end
    object edtCaminhoInterface: TLabeledEdit
      Left = 17
      Top = 23
      Width = 584
      Height = 23
      EditLabel.Width = 114
      EditLabel.Height = 15
      EditLabel.Caption = 'Caminho da Interface'
      ImeName = 'Nome da Unit'
      TabOrder = 1
      Text = ''
    end
    object edtCaminhoController: TLabeledEdit
      Left = 17
      Top = 69
      Width = 584
      Height = 23
      EditLabel.Width = 122
      EditLabel.Height = 15
      EditLabel.Caption = 'Caminho do Controller'
      ImeName = 'Nome da Unit'
      TabOrder = 2
      Text = ''
      OnChange = edtNomeUnitChange
    end
    object btnBuscaCaminhoInterface: TButton
      Left = 603
      Top = 23
      Width = 34
      Height = 23
      Caption = '...'
      TabOrder = 3
      OnClick = btnBuscaCaminhoInterfaceClick
    end
    object btnBuscaCaminhoController: TButton
      Left = 603
      Top = 66
      Width = 34
      Height = 23
      Caption = '...'
      TabOrder = 4
      OnClick = btnBuscaCaminhoControllerClick
    end
    object edtCaminhoProvider: TLabeledEdit
      Left = 17
      Top = 111
      Width = 584
      Height = 23
      EditLabel.Width = 113
      EditLabel.Height = 15
      EditLabel.Caption = 'Caminho do Provider'
      ImeName = 'Nome da Unit'
      TabOrder = 5
      Text = ''
      OnChange = edtNomeUnitChange
    end
    object btnBuscaCaminhoProviders: TButton
      Left = 603
      Top = 112
      Width = 34
      Height = 23
      Caption = '...'
      TabOrder = 6
      OnClick = btnBuscaCaminhoProvidersClick
    end
    object PG: TProgressBar
      Left = 651
      Top = 117
      Width = 409
      Height = 17
      Position = 100
      MarqueeInterval = 1
      Step = 0
      TabOrder = 7
      Visible = False
    end
  end
  object GridPanel1: TGridPanel
    Left = 0
    Top = 89
    Width = 1066
    Height = 479
    Align = alClient
    Caption = 'GridPanel1'
    ColumnCollection = <
      item
        SizeStyle = ssAbsolute
        Value = 250.000000000000000000
      end
      item
        SizeStyle = ssAbsolute
        Value = 400.000000000000000000
      end
      item
        Value = 100.000000000000000000
      end>
    ControlCollection = <
      item
        Column = 0
        Control = DBGrid1
        Row = 0
      end
      item
        Column = 1
        Control = DBGrid3
        Row = 0
      end
      item
        Column = 2
        Control = DBGrid2
        Row = 0
      end>
    RowCollection = <
      item
        Value = 100.000000000000000000
      end
      item
        SizeStyle = ssAuto
      end>
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 250
      Height = 477
      Align = alClient
      DataSource = DataSource3
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
    object DBGrid3: TDBGrid
      Left = 251
      Top = 1
      Width = 400
      Height = 477
      Align = alClient
      DataSource = DataSource1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
    object DBGrid2: TDBGrid
      Left = 651
      Top = 1
      Width = 414
      Height = 477
      Align = alClient
      DataSource = DataSource2
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=gdao'
      'User_Name=sa'
      'Password=Express'
      'Server=127.0.0.1'
      'DriverID=MSSQL')
    Connected = True
    LoginPrompt = False
    Left = 504
    Top = 464
  end
  object qrTable: TFDQuery
    AfterScroll = qrTableAfterScroll
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evRowsetSize]
    FetchOptions.RowsetSize = 99999
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS'
      'where TABLE_SCHEMA = :schema'
      'group by TABLE_NAME')
    Left = 400
    Top = 200
    ParamData = <
      item
        Name = 'SCHEMA'
        ParamType = ptInput
      end>
    object qrTableTABLE_NAME: TWideStringField
      FieldName = 'TABLE_NAME'
      Origin = 'TABLE_NAME'
      Size = 128
    end
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 424
    Top = 456
  end
  object DataSource1: TDataSource
    DataSet = qrTable
    Left = 400
    Top = 264
  end
  object qrCampos: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT COLUMN_NAME, DATA_TYPE, COLUMN_DEFAULT, IS_NULLABLE'
      'FROM INFORMATION_SCHEMA.COLUMNS'
      'WHERE TABLE_SCHEMA = :schema and TABLE_NAME = :tabela'
      '      AND COLUMN_NAME NOT IN ('#39'dtReg'#39','#39'CodUsuarioReg'#39','#39'AcaoReg'#39')')
    Left = 848
    Top = 168
    ParamData = <
      item
        Name = 'SCHEMA'
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'TABELA'
        ParamType = ptInput
      end>
    object qrCamposCOLUMN_NAME: TWideStringField
      DisplayWidth = 22
      FieldName = 'COLUMN_NAME'
      Origin = 'COLUMN_NAME'
      Size = 128
    end
    object qrCamposDATA_TYPE: TWideStringField
      DisplayWidth = 22
      FieldName = 'DATA_TYPE'
      Origin = 'DATA_TYPE'
      ReadOnly = True
      Size = 128
    end
    object qrCamposCOLUMN_DEFAULT: TWideStringField
      DisplayWidth = 22
      FieldName = 'COLUMN_DEFAULT'
      Origin = 'COLUMN_DEFAULT'
      ReadOnly = True
      Size = 4000
    end
    object qrCamposIS_NULLABLE: TStringField
      DisplayWidth = 22
      FieldName = 'IS_NULLABLE'
      Origin = 'IS_NULLABLE'
      ReadOnly = True
      Size = 3
    end
  end
  object DataSource2: TDataSource
    DataSet = qrCampos
    Left = 848
    Top = 248
  end
  object qrSchema: TFDQuery
    Active = True
    AfterScroll = qrSchemaAfterScroll
    ConstraintsEnabled = True
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evRowsetSize]
    FetchOptions.RowsetSize = 99999
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      
        'SELECT TABLE_SCHEMA FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS gr' +
        'oup by TABLE_SCHEMA')
    Left = 96
    Top = 224
    object qrSchemaTABLE_SCHEMA: TWideStringField
      FieldName = 'TABLE_SCHEMA'
      Origin = 'TABLE_SCHEMA'
      Size = 128
    end
  end
  object DataSource3: TDataSource
    DataSet = qrSchema
    Left = 96
    Top = 272
  end
end
