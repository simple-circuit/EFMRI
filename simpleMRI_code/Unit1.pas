//EFMRI user interface example by  Simple-Circuit

//MIT License

//Copyright (c) 2026 Simple-Circuit

//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:

//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.

//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//SOFTWARE.

unit Unit1;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

//{$DEFINE pi3}  //comment out for windows 10 compile
{$DEFINE win10}
//windows 10 used native serial port calls to improve data transfer speed
//native windows serial functions allow for test of an active port

interface


{$ifdef pi3}
uses
  SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Menus, Spin, Buttons, Clipbrd,math,
  ComCtrls, printers, serial;
{$else}
uses
  windows, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Menus, Spin, Buttons, Clipbrd,math,
  ComCtrls, printers;
{$endif}

type

  { TForm1 }

  TForm1 = class(TForm)
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    ButtonPing: TButton;
    CheckBox1: TCheckBox;
    CheckMagOn: TCheckBox;
    deltaF: TFloatSpinEdit;
    FloatSpinpct: TFloatSpinEdit;
    Label17: TLabel;
    Label18: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Labelzft: TLabel;
    Labelzg: TLabel;
    LabelFS: TLabel;
    Labelfmax: TLabel;
    OpenCom: TButton;
    ShapeRun: TShape;
    SpinCom: TSpinEdit;
    ImageADC: TImage;
    ImageFT: TImage;
    ButtonFT: TButton;
    Spincut: TSpinEdit;
    SpinLength: TSpinEdit;
    SpinSample: TSpinEdit;
    LabelPhase: TLabel;
    SpinStart: TSpinEdit;
    SpinStop: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    Redraw: TButton;
    Draw: TButton;
    Button2D: TButton;
    SpinFreq: TSpinEdit;
    Label3: TLabel;
    ImageK: TImage;
    Image2D: TImage;
    OpenData: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    SpinSpan: TSpinEdit;
    Label4: TLabel;
    Button1: TButton;
    Label5: TLabel;
    SaveData: TButton;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    BacqDelay: TButton;
    RelaySettle: TButton;
    PolOffRy: TButton;
    Polarization: TButton;
    BDhun: TSpinEdit;
    BDten: TSpinEdit;
    BDone: TSpinEdit;
    RSten: TSpinEdit;
    RSone: TSpinEdit;
    PORten: TSpinEdit;
    PORone: TSpinEdit;
    POLthou: TSpinEdit;
    POLhun: TSpinEdit;
    Label6: TLabel;
    RunTest: TButton;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Timer1: TTimer;
    RunXY: TButton;
    Timer2: TTimer;
    dacgain: TSpinEdit;
    Label11: TLabel;
    Gain2: TUpDown;
    Gain1: TUpDown;
    Bright1: TUpDown;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    dactrim: TSpinEdit;
    dactrimtext: TLabel;
    Timer3: TTimer;
    procedure BDhunChange(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ButtonPingClick(Sender: TObject);
    procedure CheckautoChange(Sender: TObject);
    procedure deltaFChange(Sender: TObject);
    procedure LabelFSClick(Sender: TObject);
    procedure OpenComClick(Sender: TObject);
    procedure ButtonFTClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RedrawClick(Sender: TObject);
    procedure DrawClick(Sender: TObject);
    procedure Button2DClick(Sender: TObject);
    procedure OpenDataClick(Sender: TObject);
    procedure SpinComChange(Sender: TObject);
    procedure SpinSampleChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BacqDelayClick(Sender: TObject);
    procedure RelaySettleClick(Sender: TObject);
    procedure PolOffRyClick(Sender: TObject);
    procedure PolarizationClick(Sender: TObject);
    procedure SaveDataClick(Sender: TObject);
    procedure RunTestClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure RunXYClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Gain1Click(Sender: TObject; Button: TUDBtnType);
    procedure Gain2Click(Sender: TObject; Button: TUDBtnType);
    procedure Bright1Click(Sender: TObject; Button: TUDBtnType);
    procedure Timer3Timer(Sender: TObject);
    procedure dactrimChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$IFnDEF FPC}
  {$R *.dfm}
{$ELSE}
  {$R *.lfm}
{$ENDIF}
const
  st = 70.0e-6;    //adc sample time   f=14.286KHz
 var
  //Serial port I/O definitions
{$ifdef pi3}
{$else}
   d : tDCB;
   cp : tcommprop;
   cs : tcomstat;
{$endif}
   LabelPV3 : ^dword;
   p : ^dword;
   dw :dword;
   comhand: thandle;
   a : longbool;
   a2 : longbool;
   FileName : string;
   bchar : char;
   k : dword;
   cs1 : array[0..100] of char;
   cstats : integer;
 //Serial Data Buffer Array
  cline : array[0..32800] of integer;
  cline_count : integer;
  datalen : integer;
  cnt1 : integer;
 //Acquired Data
  addata : array[0..33, 0..32768] of single;
  maxpoints : integer;
  FTreal : array[0..2501,1..33] of single;
  FTimag : array[0..2501,1..33] of single;
  FTabs :  array[0..2501,1..33] of single;
  ImageReal : array[1..33,1..33] of single;
  ImageImag : array[1..33,1..33] of single;
  ImageAbs : array[1..33,1..33] of single;
  currentMag : integer;
  dailyMag : array[1..1440] of integer;
  iloops : integer;
  //Display Data
  G1, G2 : single;
  brightness : single;
  df : single;
  freqpeak : single;
  automode : integer;
  fft_count : integer;

  {$ifdef pi3}

  //Open serial comport #1 to #20 and set to 8 data no parity baud=921600. return 0 on error;
  Function opencomport(portnum : smallint): smallint;
  begin
   if (portnum < 1) or (portnum > 20) then portnum := 1;
   if portnum = 1 then FileName := 'com1';
   if portnum = 2 then FileName := 'com2';
   if portnum = 3 then FileName := 'com3';
   if portnum = 4 then FileName := 'com4';
   if portnum = 5 then FileName := 'com5';
   if portnum = 6 then FileName := 'com6';
   if portnum = 7 then FileName := 'com7';
   if portnum = 8 then FileName := 'com8';
   if portnum = 9 then FileName := 'com9';
   if portnum = 10 then FileName := '/dev/ttyACM0';
   if portnum = 11 then FileName := '/dev/ttyACM1';
   if portnum = 12 then FileName := '/dev/ttyUSB0';
   if portnum = 13 then FileName := '/dev/ttyUSB1';
   if portnum = 14 then FileName := '/dev/cu.usbserial'+form1.tubetype.text;
   if portnum = 15 then FileName := form1.tubetype.text;
   if portnum = 16 then FileName := '\\.\COM16';
   if portnum = 17 then FileName := '\\.\COM17';
   if portnum = 18 then FileName := '\\.\COM18';
   if portnum = 19 then FileName := '\\.\COM19';
   if portnum = 20 then FileName := '\\.\COM20';

   FileName := '/dev/ttyACM0';                     //for pi3, only ttyACM0 is used

   comhand := Serial.SerOpen(FileName);    //Open ComX for input-output mode
   opencomport := -1;                                 //If open works, return all ones
    try
     serial.SerSetParams(comhand,460800,8,NoneParity,1,[]);
     form1.Timer1.enabled := true;
    except
      opencomport := 0;                            //Return zero if error
    end;
   end;
  //Close the serial port
  procedure closecomport;                         //Shut down the serial port
  begin
   try
    Serial.SerClose(comhand);
    form1.Timer1.Enabled := false;
   except
   end;
  end;

  //Transmit the lower byte of an integer through the serial port. return -1 on error
  function transmitcombyte(databyte : smallint): smallint;
  var
     c : char;
     p9 : array[0..2] of char;
     f : word;
  begin
   if databyte <0 then databyte := 0;
   if databyte >255 then databyte := 255;
   c := chr(databyte);
   p9[0] := c;
   p9[1] := chr(0);
   try
    f := serial.SerWrite(comhand, p9[0], 1);
    sleep(1);
   except
     f := 0;
   end;
   if f = 0 then transmitcombyte := -1 else transmitcombyte := 0;  //on error return -1 else 0 if sent
  end;

  //write a serial string command to the arduino
  procedure writecommand(cs2 : shortstring);
  var
   i : smallint;
   p9 : array[0..255] of char;
   f : word;
   count : integer;
  begin
   count := Length(cs2);
   if count < 1 then exit;
   for i := 0 to count-1 do p9[i]:= cs2[i+1];
   p9[count] := char(13);       //add CR
   p9[count+1] := char(10);     //add LF
  try
   f := Serial.SerWrite(comhand, p9[0], count+2);
   sleep(15);
  except
  end;
  end;

  //get one byte from com port buffer. return byte 0-255 but if no data available, return 256
  function readcombyte(): integer;
  var
   f : word;
   b : array[0..1] of byte;
  begin
    b[0] := 0;
    readcombyte := 256;                  //return 256 if no byte was recieved
  try
   f := Serial.SerRead(comhand, b[0], 1);
  except
   f := 0;
  end;
   if f = 1 then readcombyte := b[0] else readcombyte := 256;
  end;

  {$else}
  //serial I/O for windows 10

  //Open serial comport #1 to #20 and set to 8 data no parity baud=921600. return 0 on error;
  Function opencomport(portnum : smallint): smallint;
  begin
    if (portnum < 1) or (portnum > 20) then portnum := 20;
    if portnum = 1 then FileName := 'com1';
    if portnum = 2 then FileName := 'com2';
    if portnum = 3 then FileName := 'com3';
    if portnum = 4 then FileName := 'com4';
    if portnum = 5 then FileName := 'com5';
    if portnum = 6 then FileName := 'com6';
    if portnum = 7 then FileName := 'com7';
    if portnum = 8 then FileName := 'com8';
    if portnum = 9 then FileName := 'com9';
    if portnum = 10 then FileName := '\\.\COM10';
    if portnum = 11 then FileName := '\\.\COM11';
    if portnum = 12 then FileName := '\\.\COM12';
    if portnum = 13 then FileName := '\\.\COM13';
    if portnum = 14 then FileName := '\\.\COM14';
    if portnum = 15 then FileName := '\\.\COM15';
    if portnum = 16 then FileName := '\\.\COM16';
    if portnum = 17 then FileName := '\\.\COM17';
    if portnum = 18 then FileName := '\\.\COM18';
    if portnum = 19 then FileName := '\\.\COM19';
    if portnum = 20 then FileName := '\\.\COM20';
    comhand := FileOpen(FileName, fmOpenReadWrite);    //Open ComX for input-output mode
    opencomport := -1;                                 //If open works, return all ones
    if (comhand > 0) and (comhand < 4294967295) then begin
      //valid file handle was returned, so set up port parameters
      getcommproperties(comhand, cp);                 //Get the com port windows handle
      a2 := SetUpComm(comhand, 32768, 16);           //Set up for a 32767 byte receive buffer and a 512 byte write buffer
      a2 := GetCommState(comhand, d);                //Get the current set up for the port
      dw := d.wreserved;
      dw := d.wreserved1;
      d.BaudRate := 460800;                         //Change the speed and bit settings
      d.ByteSize := 8;
      d.Parity := NOPARITY;
      d.StopBits := ONESTOPBIT;
      //form1.label26.Caption := inttohex(d.flags,4);
      d.flags := 17;
      a2 := SetCommState(comhand, d);               //Configure the new speed and bit settings
     end
    else
      opencomport := 0;                             //Return zero if error
  end;

  //Close the serial port
  procedure closecomport;                         //Shut down the serial port
  begin
   FileClose(comhand);      // *Converted from CloseHandle*
  end;

  //Transmit the lower byte of an integer through the serial port. return -1 on error
  function transmitcombyte(databyte : smallint): smallint;
  var
     c : char;
     p9 : array[0..2] of char;
     f : word;
  begin
   if databyte <0 then databyte := 0;
   if databyte >255 then databyte := 255;
   c := chr(databyte);
   p9[0] := c;
   p9[1] := chr(0);
   f := filewrite(comhand, p9, 1);
   if f = 0 then transmitcombyte := -1 else transmitcombyte := 0;  //on error return -1 else 0 if sent
  end;

  //write a serial string command to the curve tracer
  procedure writecommand(cs2 : shortstring);
  var
   i : smallint;
   p9 : array[0..255] of char;
   f : word;
   count : integer;
  begin
   count := Length(cs2);
   if count < 1 then exit;
   for i := 0 to count-1 do p9[i]:= cs2[i+1];
   p9[count] := char(13);       //add CR
   p9[count+1] := char(10);     //add LF
   f := filewrite(comhand, p9, count+2);
  end;

  //get one byte from com port buffer. return byte 0-255 but if no data available, return 256
  function readcombyte(): integer;
  var
   d : dword;
   f : word;
   b : byte;
  begin
   clearcommerror(comhand, d, @cs);
    b := 0;
    readcombyte := 256;                  //return 256 if no byte was recieved
   if cs.cbinque <> 0 then begin
    f := fileread (comhand, b, 1);
    if f <> 0 then readcombyte := b;
   end;
  end;

  {$endif}



procedure plotdata;
var
 i,n,j, plotcolor, plot2color : integer;
 v1, v2 : integer;
begin
 with form1 do begin
 plotcolor := $00a700; // Initial plot color is green
 plot2color := $0000a7; // 2nd plot color is blue

//Set graphing pen and background colors
 imageADC.Canvas.Pen.mode := pmcopy;
 imageADC.canvas.pen.Width := 1;
 imageADC.canvas.Rectangle(0, 0, 819, 201);
 imageADC.canvas.pen.color := $afafaf;
 imageADC.canvas.Brush.Color := $6f6f6f;
 imageADC.canvas.brush.style := bssolid;
 imageADC.canvas.FillRect(1, 1, 818, 200);

//Draw grids for the display area
 imageADC.canvas.moveto(1,100);
 imageADC.canvas.lineto(818,100);

for i := 1 to 8 do begin
 imageADC.canvas.moveto(i*100,1);
 imageADC.canvas.lineto(i*100,199);
end; {i}

//Plot the voltage
 imageADC.canvas.pen.mode := pmmerge;    //pmmerge is used to prevent writing over graph lines
 imageADC.canvas.pen.Color := plotcolor;
 imageADC.canvas.pen.Width := 2;
 imageADC.canvas.pen.style := pssolid;
 for i := 0 to 819 do begin   //Plot voltage
   v1 := i;
   n := i*10;
   v2 := 100-trunc(addata[spinsample.value,n] * 100.0*G1);
   if i=0 then imageADC.canvas.moveto(v1, v2); //Move to the first point to prevent wild lines on plot
   imageADC.canvas.lineto(v1, v2);
   for j := 1 to 5 do begin
    v2 := 100-trunc(addata[spinsample.value,n+j] * 100.0*G1);
    imageADC.canvas.lineto(v1, v2);
   end;
 end; {i}

 if checkMagOn.Checked then begin
  //Plot the mag voltage
  imageADC.canvas.pen.mode := pmmerge;    //pmmerge is used to prevent writing over graph lines
  imageADC.canvas.pen.Color := plot2color;
  imageADC.canvas.pen.Width := 2;
  imageADC.canvas.pen.style := pssolid;
  for i := 0 to 50  do begin   //Plot magnified voltage
    v1 := i * 4 + spinstart.value div 10;
    n := spinstart.value + i ;
    v2 := 100-trunc(addata[spinsample.value,n] * 100.0*G1);
    if i=0 then imageADC.canvas.moveto(v1, v2); //Move to the first point to prevent wild lines on plot
    imageADC.canvas.lineto(v1, v2);
    imageADC.canvas.lineto(v1, v2);
  end; {i}
 end;
end; {plotdata}

end;

procedure plotdaily;
begin
end;

procedure plotft;
var
 i, plotcolor : integer;
 v1, v2 : integer;
begin
 with form1 do begin
 plotcolor := $00a700; // Initial plot color is green

//Set graphing pen and background colors
 imageFT.Canvas.Pen.mode := pmcopy;
 imageFT.canvas.pen.Width := 1;
 imageFT.canvas.Rectangle(0, 0, 600, 200);
 imageFT.canvas.pen.color := $afafaf;
 imageFT.canvas.Brush.Color := $6f6f6f;
 imageFT.canvas.brush.style := bssolid;
 imageFT.canvas.FillRect(1, 1, 599, 199);

//Draw grids for the display area


for i := 1 to 11 do begin
 imageFT.canvas.moveto(i*50,1);
 imageFT.canvas.lineto(i*50,199);
end; {i}

//Plot the data
 imageFT.canvas.pen.mode := pmmerge;    //pmmerge is used to prevent writing over graph lines
 imageFT.canvas.pen.Color := plotcolor;
 imageFT.canvas.pen.Width := 2;
 imageFT.canvas.pen.style := pssolid;
 for i := 1700 to 2300 do begin   //Plot voltage
   v1 := i;
   v2 := 200-trunc(FTabs[i,spinsample.value] * G2);
   if i=1700 then imageFT.canvas.moveto(v1-1700, v2); //Move to the first point to prevent wild lines on plot
   imageFT.canvas.lineto(v1-1700, v2);
 end; {i}
 end;
end; {plotft}
//Fourier Transform up to 1500Hz to 2500Hz in 1Hz steps
procedure doft();
var
 pi, cut : single;
 j, i, k, fstart, fstop : integer;
 f1, a, ftr, fti : single;
 v : array[0..32768] of single;
 absmax : single;

begin
with form1 do begin
 pi := 3.14159265;
 for i := 0 To (maxpoints - 1) do begin      //clear data
  v[i] := 0.0;
 end;
 fstart := spinfreq.value - spinspan.value;
 if fstart < 1500 then fstart := 1500;
 fstop := spinfreq.value + spinspan.value;
 if fstop > 2500 then fstop := 2500;
 if fstop < fstart then fstop := fstart+1;
 k := spinstop.value - spinstart.value;
 for i := spinstart.value To spinstop.value do begin  //apply hamming window to data
  v[i] := addata[spinsample.value,i] * (0.54 - 0.46 * Cos(3.14159 * 2 * (i-spinstart.value) / (k - 1.0)));
 end;
 for i := 1500 To 2500 do begin      //clear storage
  FTreal[i,spinsample.value] := 0.0;
  FTimag[i,spinsample.value] := 0.0;
  FTAbs[i,spinsample.value] := 0.0;
 end;
 for i := fstart to fstop do begin
  f1 := (i-spinfreq.value)*df+spinfreq.value;
  ftr := 0.0;
  fti := 0.0;
  For j := spinstart.value To spinstop.value do begin
   ftr := ftr+v[j]*cos(pi*2.0*f1*st*j);
   fti := fti-v[j]*sin(pi*2.0*f1*st*j);
  end;
  FTreal[i,spinsample.value] := ftr;
  FTimag[i,spinsample.value] := fti;
  if ((i >= spincut.Value) and (i <= (spincut.value+spinlength.value))) then begin
   cut := floatspinpct.value*sin((pi*(1.0-spincut.value)/spinlength.value));
   FTreal[i,spinsample.value] := ftr*cut;
   FTimag[i,spinsample.value] := fti*cut;
  end;
 end;
  For i := fstart To fstop do begin
   FTabs[i,spinsample.value] := Sqrt(FTreal[i,spinsample.value] * FTreal[i,spinsample.value] + FTimag[i,spinsample.value] * FTimag[i,spinsample.value]);
  end;
 plotft;
 absmax := 0.0;
 freqpeak := 1500.0;
  For i := fstart To fstop do begin
   if FTabs[i,spinsample.value] > absmax then begin
    absmax := FTabs[i,spinsample.value];
    freqpeak := i*1.0;
   end;
  end;
 end;
end;
//Routine to test for serial input data and to sort out the incomming bytes
procedure checkforbyte;
var
 ctest : char;
 j, i, ic : integer;
begin
 j := 1;
 while (j = 1) do begin
  ic := readcombyte;
  if (ic = 256) then exit else begin  //process block of trace sweep data
   ctest := char(ic);
   cline[cline_count] := ic;
   if (cline_count mod 100) = 0 then form1.Caption := inttostr(cline_count);
   if (ic = 129) then begin              //129 marks end of data
     i := cline_count-(datalen*2+2)-0;   //test length of data block    4+4
     if i < 0 then begin                 //If not enough, exit data scan
            exit;
     end;
     cnt1 := 0;
     while (i < cline_count) do begin                 //make 12-bit word from two 6-bit bytes
      addata[0,cnt1] := (cline[i]-32)*64 + (cline[i+1]-32);   //voltage data
      i := i + 2;
      cnt1 := cnt1+1;
     end;
     if (cnt1 >= maxpoints+1) then begin  //all data received , so correct data
       for i := 0 to 16383 do begin
        addata[form1.spinsample.value,i] := (addata[0,i]-2048.0)*0.004; //zero data and scale 10mV FS
       end;
       plotdata;
       doft;
       form1.ShapeRun.brush.Color:=cllime;
     end;
    end;
   cline_count := cline_count+1;
   If (cline_count > 32800) then cline_count := 32800;
  end;
 end;
end; {checkforbyte}

procedure TForm1.OpenComClick(Sender: TObject);
begin
 closecomport;
 if opencomport(SpinCom.Value) = 0 then Spincom.Color := clRed else begin
  SpinCom.Color := ClLime;
  transmitcombyte(13);
  sleep(25);
 end;
 timer1.Enabled:=true;
end;
procedure doPing;
begin
    cnt1 := 0;
    datalen := 16384;
    maxpoints := 16384;
    cline_count := 0;
    transmitcombyte(ord('P'));    //command number is 1/4 data points
    transmitcombyte(ord('N'));
    transmitcombyte(ord('G'));
    sleep(15);
    transmitcombyte(ord('4'));
    transmitcombyte(ord('0'));
    transmitcombyte(ord('9'));
    transmitcombyte(ord('6'));
    transmitcombyte(13);
    sleep(25);
end;
procedure doNoise;
begin
    cnt1 := 0;
    datalen := 16384;
    maxpoints := 16384;
    cline_count := 0;
    transmitcombyte(ord('N'));    //command number is 1/4 data points
    transmitcombyte(ord('O'));
    transmitcombyte(ord('I'));
    sleep(15);
    transmitcombyte(ord('4'));
    transmitcombyte(ord('0'));
    transmitcombyte(ord('9'));
    transmitcombyte(ord('6'));
    transmitcombyte(13);
    sleep(25);
end;
procedure doTest;
begin
    transmitcombyte(ord('T'));    //command number is 1/4 data points
    transmitcombyte(ord('S'));
    transmitcombyte(ord('T'));
    sleep(15);
    transmitcombyte(ord('0'));
    transmitcombyte(13);
    sleep(25);
end;
procedure TForm1.ButtonPingClick(Sender: TObject);
begin
 form1.ShapeRun.brush.Color:=clred;
 doPing;
end;

procedure TForm1.BDhunChange(Sender: TObject);
begin

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Form1.ShapeRun.brush.Color:=clred;
  doNoise;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  doTest;
end;
procedure TForm1.CheckautoChange(Sender: TObject);
begin
end;

procedure TForm1.deltaFChange(Sender: TObject);
begin
  df :=  deltaF.Value;
end;

procedure TForm1.LabelFSClick(Sender: TObject);
begin

end;


procedure TForm1.ButtonFTClick(Sender: TObject);
begin
 doft;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 maxpoints := 16384;
 G1 := 0.25;
 G2 := 0.0625;
 Brightness := 10.0;
 df := 1.0;
 currentMag := 47000;
end;

procedure TForm1.RedrawClick(Sender: TObject);
begin
 plotdata;
end;

procedure TForm1.DrawClick(Sender: TObject);
begin
 plotft;
end;

procedure TForm1.Button2DClick(Sender: TObject);
var
 m : single;
 i,j,cl, x, y,t,k,b,jj : integer;
 xstart, xstop : integer;
 rx, ix : single;
 imageT : array[0..63, 0..32] of single;
begin
 xstart := spinfreq.value-16;
 xstop :=  spinfreq.value+16;
 for y := 1 to 33 do begin
  for x := 1 to 33 do begin
    cl := clblack;
    ImageReal[x,y] := FTReal[x+xstart,y];
    ImageImag[x,y] := FTImag[x+xstart,y];
    ImageAbs[x,y] := FTabs[x+xstart,y];
    cl := clblack;
    m := ImageAbs[x,y]*brightness/4000.0;
    m := m*256;
    if m >255 then m := 255;       //set brightness range 0-255
    cl :=  trunc(m)*(1+256+65536); //convert data to grey scale value
    form1.ImageK.Canvas.pen.Color := cl;
    form1.ImageK.canvas.brush.Color := cl;
    form1.ImageK.canvas.rectangle((x-1)*4,(y-1)*4, (x-1)*4+4, (y-1)*4+4); //expand pixel to 4x4
   end;
 end;

//complex ft method with window function
 for x := 0 to 31 do begin
  for t := 0 to 31 do begin
   rx := 0;
   ix := 0;
   for y := 0 to 32 do begin
    rx := rx + (cos(6.283185*y*t/32)*ImageReal[x+1,y+1]- sin(6.283185*y*t/32)*ImageImag[x+1,y+1])* (0.54 - 0.46 * Cos(6.283185 * y / 31));
    ix := ix + (cos(6.283185*y*t/32)*ImageImag[x+1,y+1]+ sin(6.283185*y*t/32)*ImageReal[x+1,y+1])* (0.54 - 0.46 * Cos(6.283185 * y / 31));
   end;
   ImageAbs[x,t] := sqrt(rx*rx+ix*ix); //find magnitude of FT
  end;
 end;

//correct position outside edge to inside edge flip

   for y := 0 to 15 do begin
    for x := 0 to 31 do begin
      imageT[x,15-y] :=  ImageAbs[x,y];
      imageT[x,31-y] :=  ImageAbs[x,y+16];
    end;
   end;

//Plot 2D image
  for y := 0 to 31 do begin
   for x := 0 to 31 do begin
    cl := clblack;
    m := imageT[x,y]*brightness/6400.0;
    m := m*256;
    if m >255 then m := 255;
    cl :=  trunc(m)*(1+256+65536);
    form1.Image2D.Canvas.pen.Color := cl;
    form1.Image2D.canvas.brush.Color := cl;
    form1.Image2D.canvas.rectangle(x*4,y*4, x*4+4, y*4+4);
   end;
  end;
 
end;


Procedure FileLoadTraces(cm : integer; fn : string);
var
  F: TextFile; //The holder for the file name
  s2 : string;
  i, j, j2, rl : integer;
  x : single;
begin
  try
    AssignFile(F, fn);
    ReSet(F);
    Readln(F,s2);
    Readln(F,rl);
    i := 0;   //Set the trace counter to zero
    while (i <= 4095) and (seekeof(F) <> true) do begin  //Read traces until end of file or 33 traces have been read
     Read(F,j2);                                          //Read the sample number
     if j2 >= 32768 then break;
     Read(F,j2);                                          //Read the sweep number
     for j := 0 to rl-1 do begin  //Read voltage values
      Read(F,x);
      addata[j2,j] := x;
     end;
     i := i + 1;                                       //Increment the trace counter
     form1.Caption := inttostr(j2);
    end;
  finally                                             //Close the file
    CloseFile(F);
  end;
  plotdata;                                           //Plot data for the current trace number
end; {FileLoadTraces}

//Process Load (data) under the File drop down menu
procedure TForm1.OpenDataClick(Sender: TObject);
begin
  OpenDialog1.DefaultExt := '*.txt';
  SaveDialog1.DefaultExt := '*.txt';
  OpenDialog1.FilterIndex := 1;
  OpenDialog1.Filename := ChangeFileExt(OpenDialog1.FileName, '.txt');
 if OpenDialog1.Execute then begin          //Open the file dialog and let the user pick a file name
  SaveDialog1.Filename := OpenDialog1.FileName;
  FileLoadTraces(0,SaveDialog1.Filename); //Load the traces
 end;
end; {load1click}

procedure TForm1.SpinComChange(Sender: TObject);
begin

end;


procedure TForm1.SpinSampleChange(Sender: TObject);
begin
 if spinsample.Value > 33 then spinsample.value := 33;
 if spinsample.Value < 1 then spinsample.value := 1;
 plotdata;
 plotft;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
i : integer;
begin
 fft_count := 1;
 timer3.Enabled:=true;

end;

procedure TForm1.BacqDelayClick(Sender: TObject);
begin
    transmitcombyte(ord('@'));
    transmitcombyte(ord('B'));
    transmitcombyte(ord('P'));
    transmitcombyte(ord('S'));
    sleep(5);
    transmitcombyte(0+48);
    transmitcombyte(BDhun.value+48);
    transmitcombyte(BDten.value+48);
    transmitcombyte(BDone.value+48);
    transmitcombyte(10);
    sleep(15);
end;

procedure TForm1.RelaySettleClick(Sender: TObject);
begin
    transmitcombyte(ord('@'));
    transmitcombyte(ord('R'));
    transmitcombyte(ord('T'));
    transmitcombyte(ord('M'));
    sleep(5);
    transmitcombyte(0+48);
    transmitcombyte(0+48);
    transmitcombyte(RSten.value+48);
    transmitcombyte(RSone.value+48);
    transmitcombyte(10);
    sleep(15);
end;

procedure TForm1.PolOffRyClick(Sender: TObject);
begin
    transmitcombyte(ord('@'));
    transmitcombyte(ord('R'));
    transmitcombyte(ord('M'));
    transmitcombyte(ord('P'));
    sleep(5);
    transmitcombyte(0+48);
    transmitcombyte(0+48);
    transmitcombyte(PORten.value+48);
    transmitcombyte(PORone.value+48);
    transmitcombyte(10);
    sleep(15);
end;

procedure TForm1.PolarizationClick(Sender: TObject);
begin
    transmitcombyte(ord('@'));
    transmitcombyte(ord('P'));
    transmitcombyte(ord('P'));
    transmitcombyte(ord('L'));
    sleep(5);
    transmitcombyte(POLthou.value+48);
    transmitcombyte(POLhun.value+48);
    transmitcombyte(0+48);
    transmitcombyte(0+48);
    sleep(5);
    transmitcombyte(10);
    sleep(15);
end;

procedure savedatafile(fs : string);
var
  F: TextFile;
  i, j, jm : integer;
begin
  try
    AssignFile(F, fs);
    Rewrite(F);
    Writeln(F, 'Comment');  //write a comment
    Writeln(F, maxpoints);  //write record length
    i := 1;
    while i <=33 do begin
     Write(F, format('%4d',[1]));              //Write the trace index = 1
     Write(F, ' ' + format('%4d',[i]));        //Write the phase step
     for j := 0 to maxpoints-1 do begin
      Write(F, ' ' + format('%2.8f',[addata[i,j]]));  //Write the voltage to .01uV
      Writeln(F, '');                                 //end the trace data with a return
     end;
     i := i + 1;
    end;
    Writeln(F, format('%3d',[70000]));  //mark end of data with any number greater than 32K
  finally
    CloseFile(F);
  end;
end; {savedatafile}

procedure TForm1.SaveDataClick(Sender: TObject);
begin
  form1.OpenDialog1.DefaultExt := '*.txt';
  form1.SaveDialog1.DefaultExt := '*.txt';
  form1.SaveDialog1.FilterIndex := 1;
  form1.SaveDialog1.Filename := ChangeFileExt(form1.SaveDialog1.FileName, '.txt');
  if form1.SaveDialog1.Execute then
  begin
    form1.SaveDialog1.Filename := ChangeFileExt(form1.SaveDialog1.FileName, '.txt');
    savedatafile(form1.SaveDialog1.Filename);
 end;
end;

procedure doRun;
begin
    cnt1 := 0;
    datalen := 16384;
    maxpoints := 16384;
    cline_count := 0;
    transmitcombyte(ord('@'));
    transmitcombyte(ord('M'));    //command number is 1/4 data points
    transmitcombyte(ord('E'));
    transmitcombyte(ord('A'));
    sleep(15);
    transmitcombyte(ord('4'));
    transmitcombyte(ord('0'));
    transmitcombyte(ord('9'));
    transmitcombyte(ord('6'));
    transmitcombyte(13);
    sleep(25);
end;
procedure dograd(n : integer);  //n is gradient step -16 to +16
var
a,b,c,d : integer;
begin
    n := (n*16*form1.dacgain.value) + 2048 - 16*form1.dactrim.value; //scale for DAC and add midpoint offset
    if n > 4095 then n := 4095;
    if n <0 then n := 0;
    a := n mod 10;
    n := n div 10;
    b := n mod 10;
    n := n div 10;
    c := n mod 10;
    n := n div 10;
    d := n mod 10;
    transmitcombyte(ord('@'));
    transmitcombyte(ord('G'));
    transmitcombyte(ord('R'));
    transmitcombyte(ord('D'));
    sleep(15);
    transmitcombyte(d+48);
    transmitcombyte(c+48);
    transmitcombyte(b+48);
    transmitcombyte(a+48);
    transmitcombyte(10);
    sleep(25);
end;
procedure TForm1.RunTestClick(Sender: TObject);
begin
 dograd(spinsample.value-17);
 form1.ShapeRun.brush.Color:=clred;
 dorun;
end;
procedure TForm1.Timer1Timer(Sender: TObject);
begin
 checkforbyte;
end;

procedure TForm1.RunXYClick(Sender: TObject);
begin
  spinsample.Value := 1;
  iloops := 0;
  RunXY.Enabled := False;
  RunTest.Enabled := False;
  timer2.enabled := true;
end;
procedure TForm1.Button4Click(Sender: TObject);
begin
  dograd(spinsample.value-17);
end;
procedure TForm1.Timer2Timer(Sender: TObject);
begin
  iloops := iloops+1;
  if (iloops >= 34) or (form1.CheckBox1.Checked = true) then begin
   timer2.enabled := false;
   form1.CheckBox1.Checked := false;
   RunXY.Enabled := True;
   RunTest.Enabled := True;
   exit;
  end;
  spinsample.Value := iloops;
  dograd(spinsample.value-17);
  dorun;
end;
procedure TForm1.Gain1Click(Sender: TObject; Button: TUDBtnType);
begin
 G1 := power(2.0,Gain1.position);
 plotdata;
 form1.LabelFS.caption := format('FS +-%1.3fV',[0.2062/G1]);
end;

procedure TForm1.Gain2Click(Sender: TObject; Button: TUDBtnType);
begin
 G2 := power(2.0,Gain2.Position);
 form1.Labelzft.caption := floattostr(G2);
 PlotFT;
end;

procedure TForm1.Bright1Click(Sender: TObject; Button: TUDBtnType);
begin
 brightness := bright1.Position;
 form1.Labelzg.caption := inttostr(trunc(brightness));
 button2D.click;
end;

procedure TForm1.Timer3Timer(Sender: TObject);
begin
  form1.spinsample.value := fft_count;
  doft;
  fft_count := fft_count+1;
  if fft_count > 33 then timer3.enabled := false;
  form1.update;
end;
procedure TForm1.dactrimChange(Sender: TObject);
var
a,b,c,d,n : integer;
begin
    n := 2048-form1.dactrim.value*16; //set midpoint for dac
    if n > 4095 then n := 4095;
    if n <0 then n := 0;
    a := n mod 10;
    n := n div 10;
    b := n mod 10;
    n := n div 10;
    c := n mod 10;
    n := n div 10;
    d := n mod 10;
    transmitcombyte(ord('D'));
    transmitcombyte(ord('A'));
    transmitcombyte(ord('0'));
    sleep(15);
    transmitcombyte(d+48);
    transmitcombyte(c+48);
    transmitcombyte(b+48);
    transmitcombyte(a+48);
    transmitcombyte(10);
    sleep(25);
end;

end.
