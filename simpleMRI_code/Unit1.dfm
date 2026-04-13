object Form1: TForm1
  Left = 258
  Top = 74
  Width = 912
  Height = 640
  Caption = 'SimpleMRI'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00AAAA
    AAAAAAAAAAABAAAAAAAAAAAAAAAAA10101000000000B000000000000000AA011
    11111100000B000001010100000AA01010100000000B000101010000000AA000
    10100101000B000011111000000AA00011111100000B000010100000000AA000
    00010000000B000000000000000AA00000000000000B111111010000000AA000
    00001011111B111111101000000AA00000000111111B111111111110100AA000
    00011111111B111111111111100AA00001111111111B111111111111110AA000
    11111111111B111119991111110AA00111111111111B111199999111111AA011
    11111111111B111119999111110ABBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBAA111
    11111111111B111111191111110AA11111111111111B111199911111000AA111
    11111111111B111999911111000AA11111911111111B199999911111000AA111
    11999111111B999999911110000AA11111999999999B999991111000000AA011
    11199999999B991111100000000AA00011111199999B111111000000000AA000
    11111111111B111111000000000AA00011111111111B111111100000000AA000
    01111101010B111111000000000AA00000101010000B001000000000000AA000
    01011111000B000000000000000AA00001101000000B000000000000000AA000
    00000000000B000000000000000AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA0000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel3: TBevel
    Left = 704
    Top = 496
    Width = 177
    Height = 81
  end
  object Shape2: TShape
    Left = 8
    Top = 232
    Width = 600
    Height = 200
    Brush.Style = bsClear
  end
  object Bevel1: TBevel
    Left = 688
    Top = 256
    Width = 201
    Height = 205
  end
  object Bevel2: TBevel
    Left = 8
    Top = 456
    Width = 329
    Height = 140
  end
  object ImageADC: TImage
    Left = 8
    Top = 8
    Width = 819
    Height = 200
  end
  object ImageFT: TImage
    Left = 8
    Top = 232
    Width = 600
    Height = 200
  end
  object LabelPhase: TLabel
    Left = 624
    Top = 224
    Width = 55
    Height = 13
    Caption = 'Phase Step'
  end
  object Label1: TLabel
    Left = 352
    Top = 504
    Width = 60
    Height = 13
    Caption = 'Start Sample'
  end
  object Label2: TLabel
    Left = 424
    Top = 504
    Width = 57
    Height = 13
    Caption = 'End Sample'
  end
  object Label3: TLabel
    Left = 560
    Top = 504
    Width = 77
    Height = 13
    Caption = 'Procession F Hz'
  end
  object ImageK: TImage
    Left = 16
    Top = 464
    Width = 128
    Height = 128
  end
  object Image2D: TImage
    Left = 152
    Top = 464
    Width = 128
    Height = 128
  end
  object Label4: TLabel
    Left = 496
    Top = 504
    Width = 50
    Height = 13
    Caption = '+-Span Hz'
  end
  object Label5: TLabel
    Left = 280
    Top = 544
    Width = 49
    Height = 13
    Caption = 'Brightness'
  end
  object Shape1: TShape
    Left = 8
    Top = 8
    Width = 819
    Height = 200
    Brush.Style = bsClear
  end
  object Shape3: TShape
    Left = 16
    Top = 464
    Width = 264
    Height = 128
    Brush.Style = bsClear
  end
  object Label6: TLabel
    Left = 800
    Top = 360
    Width = 9
    Height = 37
    Caption = '.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 864
    Top = 272
    Width = 18
    Height = 16
    Caption = 'ms'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 838
    Top = 304
    Width = 18
    Height = 16
    Caption = 'ms'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 838
    Top = 336
    Width = 18
    Height = 16
    Caption = 'ms'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 846
    Top = 368
    Width = 22
    Height = 16
    Caption = 'sec'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label11: TLabel
    Left = 624
    Top = 272
    Width = 47
    Height = 13
    Caption = 'DAC Gain'
  end
  object Label12: TLabel
    Left = 96
    Top = 208
    Width = 24
    Height = 13
    Caption = '1000'
  end
  object Label13: TLabel
    Left = 96
    Top = 432
    Width = 24
    Height = 13
    Caption = '1800'
  end
  object Label14: TLabel
    Left = 48
    Top = 432
    Width = 24
    Height = 13
    Caption = '1750'
  end
  object Label15: TLabel
    Left = 296
    Top = 208
    Width = 24
    Height = 13
    Caption = '3000'
  end
  object Label16: TLabel
    Left = 200
    Top = 208
    Width = 24
    Height = 13
    Caption = '2000'
  end
  object Label19: TLabel
    Left = 400
    Top = 208
    Width = 24
    Height = 13
    Caption = '4000'
  end
  object Label20: TLabel
    Left = 152
    Top = 432
    Width = 24
    Height = 13
    Caption = '1850'
  end
  object Label21: TLabel
    Left = 496
    Top = 208
    Width = 24
    Height = 13
    Caption = '5000'
  end
  object Label22: TLabel
    Left = 200
    Top = 432
    Width = 24
    Height = 13
    Caption = '1900'
  end
  object Label23: TLabel
    Left = 600
    Top = 208
    Width = 24
    Height = 13
    Caption = '6000'
  end
  object Label24: TLabel
    Left = 248
    Top = 432
    Width = 24
    Height = 13
    Caption = '1950'
  end
  object Label25: TLabel
    Left = 696
    Top = 208
    Width = 24
    Height = 13
    Caption = '7000'
  end
  object Label26: TLabel
    Left = 800
    Top = 208
    Width = 24
    Height = 13
    Caption = '8000'
  end
  object Label27: TLabel
    Left = 296
    Top = 432
    Width = 24
    Height = 13
    Caption = '2000'
  end
  object Label28: TLabel
    Left = 352
    Top = 432
    Width = 24
    Height = 13
    Caption = '2050'
  end
  object Label29: TLabel
    Left = 400
    Top = 432
    Width = 24
    Height = 13
    Caption = '2100'
  end
  object Label30: TLabel
    Left = 448
    Top = 432
    Width = 24
    Height = 13
    Caption = '2150'
  end
  object Label31: TLabel
    Left = 496
    Top = 432
    Width = 24
    Height = 13
    Caption = '2200'
  end
  object Label32: TLabel
    Left = 544
    Top = 432
    Width = 24
    Height = 13
    Caption = '2250'
  end
  object dactrimtext: TLabel
    Left = 624
    Top = 312
    Width = 45
    Height = 13
    Caption = 'DAC Trim'
  end
  object OpenCom: TButton
    Left = 768
    Top = 408
    Width = 65
    Height = 33
    Caption = 'OpenCom'
    TabOrder = 0
    OnClick = OpenComClick
  end
  object SpinCom: TSpinEdit
    Left = 840
    Top = 416
    Width = 41
    Height = 22
    Color = clYellow
    MaxValue = 20
    MinValue = 1
    TabOrder = 1
    Value = 13
  end
  object ButtonFT: TButton
    Left = 360
    Top = 456
    Width = 65
    Height = 25
    Caption = 'Fourier Xfrm'
    TabOrder = 2
    OnClick = ButtonFTClick
  end
  object SpinSample: TSpinEdit
    Left = 624
    Top = 240
    Width = 57
    Height = 22
    MaxValue = 33
    MinValue = 1
    TabOrder = 3
    Value = 17
    OnChange = SpinSampleChange
  end
  object SpinStart: TSpinEdit
    Left = 352
    Top = 520
    Width = 65
    Height = 22
    MaxValue = 9999
    MinValue = 1
    TabOrder = 4
    Value = 500
  end
  object SpinStop: TSpinEdit
    Left = 424
    Top = 520
    Width = 65
    Height = 22
    MaxValue = 16384
    MinValue = 1
    TabOrder = 5
    Value = 6000
  end
  object Redraw: TButton
    Left = 832
    Top = 144
    Width = 49
    Height = 25
    Caption = 'Redraw'
    TabOrder = 6
    OnClick = RedrawClick
  end
  object Draw: TButton
    Left = 616
    Top = 368
    Width = 57
    Height = 25
    Caption = 'ReDraw'
    TabOrder = 7
    OnClick = DrawClick
  end
  object Button2D: TButton
    Left = 288
    Top = 504
    Width = 41
    Height = 33
    Caption = '2D'
    TabOrder = 8
    OnClick = Button2DClick
  end
  object SpinFreq: TSpinEdit
    Left = 560
    Top = 520
    Width = 81
    Height = 22
    MaxValue = 2184
    MinValue = 1816
    TabOrder = 9
    Value = 1900
  end
  object OpenData: TButton
    Left = 720
    Top = 520
    Width = 65
    Height = 25
    Caption = 'Open File'
    TabOrder = 10
    OnClick = OpenDataClick
  end
  object SpinSpan: TSpinEdit
    Left = 496
    Top = 520
    Width = 57
    Height = 22
    MaxValue = 300
    MinValue = 16
    TabOrder = 11
    Value = 100
  end
  object Button1: TButton
    Left = 288
    Top = 464
    Width = 41
    Height = 33
    Caption = 'FT32'
    TabOrder = 12
    OnClick = Button1Click
  end
  object SaveData: TButton
    Left = 792
    Top = 520
    Width = 65
    Height = 25
    Caption = 'Save File'
    TabOrder = 13
    OnClick = SaveDataClick
  end
  object BacqDelay: TButton
    Left = 696
    Top = 272
    Width = 65
    Height = 25
    Caption = 'Phase Grad'
    TabOrder = 14
    OnClick = BacqDelayClick
  end
  object RelaySettle: TButton
    Left = 696
    Top = 304
    Width = 65
    Height = 25
    Caption = 'RelaySettle'
    TabOrder = 15
    OnClick = RelaySettleClick
  end
  object PolOffRy: TButton
    Left = 696
    Top = 336
    Width = 65
    Height = 25
    Caption = 'PolOffRy'
    TabOrder = 16
    OnClick = PolOffRyClick
  end
  object Polarization: TButton
    Left = 696
    Top = 368
    Width = 65
    Height = 25
    Caption = 'Polarization'
    TabOrder = 17
    OnClick = PolarizationClick
  end
  object BDhun: TSpinEdit
    Left = 768
    Top = 272
    Width = 33
    Height = 22
    MaxValue = 9
    MinValue = 0
    TabOrder = 18
    Value = 0
  end
  object BDten: TSpinEdit
    Left = 800
    Top = 272
    Width = 33
    Height = 22
    MaxValue = 9
    MinValue = 0
    TabOrder = 19
    Value = 0
  end
  object BDone: TSpinEdit
    Left = 832
    Top = 272
    Width = 33
    Height = 22
    MaxValue = 9
    MinValue = 0
    TabOrder = 20
    Value = 0
  end
  object RSten: TSpinEdit
    Left = 768
    Top = 304
    Width = 33
    Height = 22
    MaxValue = 9
    MinValue = 0
    TabOrder = 21
    Value = 0
  end
  object RSone: TSpinEdit
    Left = 800
    Top = 304
    Width = 33
    Height = 22
    MaxValue = 9
    MinValue = 0
    TabOrder = 22
    Value = 5
  end
  object PORten: TSpinEdit
    Left = 768
    Top = 336
    Width = 33
    Height = 22
    MaxValue = 9
    MinValue = 0
    TabOrder = 23
    Value = 3
  end
  object PORone: TSpinEdit
    Left = 800
    Top = 336
    Width = 33
    Height = 22
    MaxValue = 9
    MinValue = 1
    TabOrder = 24
    Value = 5
  end
  object POLthou: TSpinEdit
    Left = 768
    Top = 368
    Width = 33
    Height = 22
    MaxValue = 5
    MinValue = 0
    TabOrder = 25
    Value = 3
  end
  object POLhun: TSpinEdit
    Left = 808
    Top = 368
    Width = 33
    Height = 22
    MaxValue = 9
    MinValue = 0
    TabOrder = 26
    Value = 0
  end
  object RunTest: TButton
    Left = 696
    Top = 400
    Width = 65
    Height = 25
    Caption = 'Run Test'
    TabOrder = 27
    OnClick = RunTestClick
  end
  object RunXY: TButton
    Left = 696
    Top = 432
    Width = 65
    Height = 25
    Caption = 'Run X-Y'
    TabOrder = 28
    OnClick = RunXYClick
  end
  object dacgain: TSpinEdit
    Left = 624
    Top = 288
    Width = 49
    Height = 22
    MaxValue = 8
    MinValue = 1
    TabOrder = 29
    Value = 4
  end
  object Gain2: TUpDown
    Left = 610
    Top = 400
    Width = 25
    Height = 33
    Min = -3
    Max = 3
    Position = 0
    TabOrder = 30
    Wrap = False
    OnClick = Gain2Click
  end
  object Gain1: TUpDown
    Left = 828
    Top = 176
    Width = 25
    Height = 33
    Min = -3
    Max = 3
    Position = 0
    TabOrder = 31
    Wrap = False
    OnClick = Gain1Click
  end
  object Bright1: TUpDown
    Left = 282
    Top = 560
    Width = 25
    Height = 33
    Min = 1
    Position = 10
    TabOrder = 32
    Wrap = False
    OnClick = Bright1Click
  end
  object twoX: TCheckBox
    Left = 432
    Top = 464
    Width = 49
    Height = 17
    Caption = '2X'
    TabOrder = 33
    OnClick = twoXClick
  end
  object dactrim: TSpinEdit
    Left = 624
    Top = 328
    Width = 49
    Height = 22
    MaxValue = 99
    MinValue = -99
    TabOrder = 34
    Value = 0
    OnChange = dactrimChange
  end
  object OpenDialog1: TOpenDialog
    Filter = 'nmr data (*.txt)|*.txt'
    Left = 664
    Top = 544
  end
  object SaveDialog1: TSaveDialog
    Filter = 'nmr data (*.txt)|*.txt'
    Left = 664
    Top = 512
  end
  object Timer1: TTimer
    Interval = 2
    OnTimer = Timer1Timer
    Left = 840
    Top = 464
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 15000
    OnTimer = Timer2Timer
    Left = 712
    Top = 464
  end
end
