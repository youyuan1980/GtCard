unit ActiveFormImpl1;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, GTCARD_TLB, StdVcl,EncdDecd, ExtCtrls,Registry;

const NameLen		          = 30;
const SexLen		          = 5;
const NationLen		        = 10;
const DateLen		          = 8;
const AddrLen		          = 70;
const IdLen			          = 18;
const DepartmentLen	      = 30;
const ReserveLen	        = 36;


type
  TActiveFormX = class(TActiveForm, IActiveFormX)
  private
    { Private declarations }
     _NAME:WideString;
    _SEX:WideString;
    _BIRTHDAY:WideString;
    _ADDRESS:WideString;
    _IDCODE:WideString;
    _DEPARTMENT:WideString;
    _STARTDATE:WideString;
    _ENDDATE:WideString;
    _NATION:WideString;
    _ReadSysDirectory:WideString;
    _MSG:WideString;
    _PhotoImageBytes:WideString;
    FEvents: IActiveFormXEvents;
    procedure ActivateEvent(Sender: TObject);
    procedure ClickEvent(Sender: TObject);
    procedure CreateEvent(Sender: TObject);
    procedure DblClickEvent(Sender: TObject);
    procedure DeactivateEvent(Sender: TObject);
    procedure DestroyEvent(Sender: TObject);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
    procedure PaintEvent(Sender: TObject);
  protected
    { Protected declarations }
    procedure DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage); override;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    function Get_Active: WordBool; safecall;
    function Get_AlignDisabled: WordBool; safecall;
    function Get_AutoScroll: WordBool; safecall;
    function Get_AutoSize: WordBool; safecall;
    function Get_AxBorderStyle: TxActiveFormBorderStyle; safecall;
    function Get_Caption: WideString; safecall;
    function Get_Color: OLE_COLOR; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_DropTarget: WordBool; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_Font: IFontDisp; safecall;
    function Get_HelpFile: WideString; safecall;
    function Get_KeyPreview: WordBool; safecall;
    function Get_PixelsPerInch: Integer; safecall;
    function Get_PrintScale: TxPrintScale; safecall;
    function Get_Scaled: WordBool; safecall;
    function Get_ScreenSnap: WordBool; safecall;
    function Get_SnapBuffer: Integer; safecall;
    function Get_Visible: WordBool; safecall;
    function Get_VisibleDockClientCount: Integer; safecall;
    procedure _Set_Font(var Value: IFontDisp); safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    procedure Set_AxBorderStyle(Value: TxActiveFormBorderStyle); safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_DropTarget(Value: WordBool); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    procedure Set_HelpFile(const Value: WideString); safecall;
    procedure Set_KeyPreview(Value: WordBool); safecall;
    procedure Set_PixelsPerInch(Value: Integer); safecall;
    procedure Set_PrintScale(Value: TxPrintScale); safecall;
    procedure Set_Scaled(Value: WordBool); safecall;
    procedure Set_ScreenSnap(Value: WordBool); safecall;
    procedure Set_SnapBuffer(Value: Integer); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_NAME: WideString; safecall;
    procedure Set_NAME(const Value: WideString); safecall;
    function Get_SEX: WideString; safecall;
    procedure Set_SEX(const Value: WideString); safecall;
    function Get_BIRTHDAY: WideString; safecall;
    procedure Set_BIRTHDAY(const Value: WideString); safecall;
    function Get_ADDRESS: WideString; safecall;
    procedure Set_ADDRESS(const Value: WideString); safecall;
    function Get_IDCODE: WideString; safecall;
    procedure Set_IDCODE(const Value: WideString); safecall;
    function Get_DEPARTMENT: WideString; safecall;
    procedure Set_DEPARTMENT(const Value: WideString); safecall;
    function Get_STARTDATE: WideString; safecall;
    procedure Set_STARTDATE(const Value: WideString); safecall;
    function Get_ENDDATE: WideString; safecall;
    procedure Set_ENDDATE(const Value: WideString); safecall;
    function Get_NATION: WideString; safecall;
    procedure Set_NATION(const Value: WideString); safecall;
    function Get_ReadSysDirectory: WideString; safecall;
    procedure Set_ReadSysDirectory(const Value: WideString); safecall;
    function Get_MSG: WideString; safecall;
    procedure Set_MSG(const Value: WideString); safecall;
    function Get_PhotoImageBytes: WideString; safecall;
    procedure Set_PhotoImageBytes(const Value: WideString); safecall;
    procedure GetCardInfo; safecall;
    function BitmapToString(img:TBitmap):string;
  public
    { Public declarations }
    procedure Initialize; override;
  end;
  function GetBmp(Wlt_File: pchar; intf: integer): integer; stdcall;external 'WltRS.dll';
  function InitComm(iPort: Integer):integer;stdcall;external 'termb.dll';
  function Authenticate():integer;stdcall;external 'termb.dll';
  function Read_Content(iActive : integer):integer;stdcall;external 'termb.dll';
  function CloseComm():integer;stdcall;external 'termb.dll';
  function GetPeopleName(szName:pchar;iLen:integer):integer;stdcall;external 'termb.dll';
  function GetPeopleSex(szSex:pchar;iLen:integer):integer;stdcall;external 'termb.dll';
  function GetPeopleNation(szNation:pchar;iLen:integer):integer;stdcall;external 'termb.dll';
  function GetPeopleBirthday(szBirthday:pchar;iLen:integer):integer;stdcall;external 'termb.dll';
  function GetPeopleAddress(szAddress:pchar;iLen:integer):integer;stdcall;external 'termb.dll';
  function GetPeopleIDCode(szID:pchar;iLen:integer):integer;stdcall;external 'termb.dll';
  function GetDepartment(szDepartment:pchar;iLen:integer):integer;stdcall;external 'termb.dll';
  function GetStartDate(szStartDate:pchar;iLen:integer):integer;stdcall;external 'termb.dll';
  function GetEndDate(szEndDate:pchar;iLen:integer):integer;stdcall;external 'termb.dll';
var
  m_szDllPath : string;
  IDCard_Port:integer = 0;
implementation

uses ComObj, ComServ;

{$R *.DFM}

{ TActiveFormX }

procedure TActiveFormX.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_ActiveFormXPage); }
end;

procedure TActiveFormX.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IActiveFormXEvents;
  inherited EventSinkChanged(EventSink);
end;

procedure TActiveFormX.Initialize;
begin
  inherited Initialize;
  OnActivate := ActivateEvent;
  OnClick := ClickEvent;
  OnCreate := CreateEvent;
  OnDblClick := DblClickEvent;
  OnDeactivate := DeactivateEvent;
  OnDestroy := DestroyEvent;
  OnKeyPress := KeyPressEvent;
  OnPaint := PaintEvent;
end;

function TActiveFormX.Get_Active: WordBool;
begin
  Result := Active;
end;

function TActiveFormX.Get_AlignDisabled: WordBool;
begin
  Result := AlignDisabled;
end;

function TActiveFormX.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TActiveFormX.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TActiveFormX.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TActiveFormX.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TActiveFormX.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TActiveFormX.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TActiveFormX.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TActiveFormX.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TActiveFormX.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TActiveFormX.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TActiveFormX.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TActiveFormX.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TActiveFormX.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TActiveFormX.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TActiveFormX.Get_ScreenSnap: WordBool;
begin
  Result := ScreenSnap;
end;

function TActiveFormX.Get_SnapBuffer: Integer;
begin
  Result := SnapBuffer;
end;

function TActiveFormX.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TActiveFormX.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TActiveFormX._Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TActiveFormX.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TActiveFormX.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TActiveFormX.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TActiveFormX.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TActiveFormX.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TActiveFormX.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TActiveFormX.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TActiveFormX.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TActiveFormX.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TActiveFormX.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TActiveFormX.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TActiveFormX.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TActiveFormX.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TActiveFormX.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TActiveFormX.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TActiveFormX.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TActiveFormX.Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TActiveFormX.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TActiveFormX.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TActiveFormX.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TActiveFormX.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TActiveFormX.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TActiveFormX.Set_ScreenSnap(Value: WordBool);
begin
  ScreenSnap := Value;
end;

procedure TActiveFormX.Set_SnapBuffer(Value: Integer);
begin
  SnapBuffer := Value;
end;

procedure TActiveFormX.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

function TActiveFormX.Get_NAME: WideString;
begin
  result:=_NAME;
end;

procedure TActiveFormX.Set_NAME(const Value: WideString);
begin
  _NAME:=value;
end;


function TActiveFormX.Get_SEX: WideString;
begin
  Result:=_SEX;
end;

procedure TActiveFormX.Set_SEX(const Value: WideString);
begin
_SEX:=Value;
end;

function TActiveFormX.Get_NATION: WideString;
begin
  Result:=_NATION;
end;

procedure TActiveFormX.Set_NATION(const Value: WideString);
begin
           _NATION:=Value;
end;

function TActiveFormX.Get_BIRTHDAY: WideString;
begin
  Result:=_BIRTHDAY;
end;

procedure TActiveFormX.Set_BIRTHDAY(const Value: WideString);
begin
          _BIRTHDAY:=Value;
end;

function TActiveFormX.Get_ADDRESS: WideString;
begin
  Result:=_ADDRESS;
end;

procedure TActiveFormX.Set_ADDRESS(const Value: WideString);
begin
          _ADDRESS:=Value;
end;

function TActiveFormX.Get_IDCODE: WideString;
begin
  Result:=_IDCODE;
end;

procedure TActiveFormX.Set_IDCODE(const Value: WideString);
begin
        _IDCODE:=Value;
end;

function TActiveFormX.Get_DEPARTMENT: WideString;
begin
  Result:=_DEPARTMENT;
end;

procedure TActiveFormX.Set_DEPARTMENT(const Value: WideString);
begin
    _DEPARTMENT:=Value;
end;

function TActiveFormX.Get_STARTDATE: WideString;
begin
   Result:=_STARTDATE;
end;

procedure TActiveFormX.Set_STARTDATE(const Value: WideString);
begin
   _STARTDATE:=Value;
end;

function TActiveFormX.Get_ENDDATE: WideString;
begin
  Result:=_ENDDATE;
end;

procedure TActiveFormX.Set_ENDDATE(const Value: WideString);
begin
  _ENDDATE:=Value;
end;

function TActiveFormX.Get_ReadSysDirectory: WideString;
begin
  Result:=_ReadSysDirectory;
end;

procedure TActiveFormX.Set_ReadSysDirectory(const Value: WideString);
begin
  _ReadSysDirectory:=value;
end;

function TActiveFormX.Get_MSG: WideString;
begin
  Result:=_MSG;
end;

procedure TActiveFormX.Set_MSG(const Value: WideString);
begin
  _MSG:=value;
end;

function TActiveFormX.Get_PhotoImageBytes: WideString;
begin
  Result:=_PhotoImageBytes;
end;

procedure TActiveFormX.Set_PhotoImageBytes(const Value: WideString);
begin
  _PhotoImageBytes:=value;
end;

function TActiveFormX.BitmapToString(img:TBitmap):string ;
var
  ms:TMemoryStream;
  ss:TStringStream;
  s:string;
begin
    ms := TMemoryStream.Create;
    img.SaveToStream(ms);
    ss := TStringStream.Create('');
    ms.Position:=0;
    EncodeStream(ms,ss);//将内存流编码为base64字符流
    s:=ss.DataString;
    ms.Free;
    ss.Free;
    result:=s; 
end;

procedure TActiveFormX.GetCardInfo;
var
  iRet : integer;
  szName:Array[0..NameLen] of char;
  szSex:Array[0..SexLen] of char;
  szNation:Array[0..NationLen] of char;
  szBirthday:Array[0..DateLen] of char;
  szAddress:Array[0..AddrLen] of char;
  szID:Array[0..IdLen] of char;
  szDepartment:Array[0..DepartmentLen] of char;
  szStartDate:Array[0..DateLen] of char;
  szEndDate:Array[0..DateLen] of char;
  i:Integer;
  AImage : TImage;
  ABitmap: TBitmap;
  reg:Tregistry;
 KeyList: TStringList;
 x:Integer;
begin
    _NAME:='';
    _SEX:='';
    _BIRTHDAY:='';
    _ADDRESS:='';
    _IDCODE:='';
    _DEPARTMENT:='';
    _STARTDATE:='';
    _ENDDATE:='';
    _NATION:='';

    reg:=Tregistry.create;
    KeyList := TStringList.Create;
    reg.RootKey := HKEY_CLASSES_ROOT;
    reg.openkey('CLSID\{D4D1E94C-171E-4CB0-B9A1-A3D38B58433E}\InprocServer32', False);
    reg.GetValueNames(KeyList);
    for x := 0 to KeyList.Count - 1 do
    begin
      _ReadSysDirectory:=extractfilepath(reg.ReadString(KeyList[0]))+'\zp.bmp';
    end;
    reg.CloseKey;
    reg.free;
    KeyList.Free;


  FillChar(szName,sizeof(szName),0);
  FillChar(szSex,sizeof(szSex),0);
  FillChar(szNation,sizeof(szNation),0);
  FillChar(szBirthday,sizeof(szBirthday),0);
  FillChar(szAddress,sizeof(szAddress),0);
  FillChar(szID,sizeof(szID),0);
  FillChar(szDepartment,sizeof(szDepartment),0);
  FillChar(szStartDate,sizeof(szStartDate),0);
  FillChar(szEndDate,sizeof(szEndDate),0);
  IDCard_Port:=0;
  iRet:=0;
  i:=0;

  while i<=6 do begin
     iRet := InitComm(i);
     if iRet = 1 then
     begin
       _MSG:='打开COM--> '+inttostr(i);
       IDCard_Port:=i;
       break;
     end;
     i:=i+1;
  end;
  if iRet <> 1 then begin
     i:=1001;
     while i<=1006  do begin
        iRet := InitComm(i);
        if iRet = 1 then  begin
        _MSG:='打开USB-->'+inttostr(i);
           IDCard_Port:=i;
           break;
         end;
         i:=i+1;
      end;
  end;
 Authenticate();

  iRet := Read_Content(1);

  if iRet <> 1 then
  begin
    _MSG:='读卡失败!';
    CloseComm();
    exit;
  end;


   GetPeopleName(szName,sizeof(szName));
   GetPeopleSex(szSex,sizeof(szSex));
   GetPeopleNation(szNation,sizeof(szNation));
   GetPeopleBirthday(szBirthday,sizeof(szBirthday));
   GetPeopleAddress(szAddress,sizeof(szAddress));
   GetPeopleIDCode(szID,sizeof(szID));
   GetDepartment(szDepartment,sizeof(szDepartment));
   GetStartDate(szStartDate,sizeof(szStartDate));
   GetEndDate(szEndDate,sizeof(szEndDate));


  CloseComm();

  if iRet = 0 then
  begin
    _MSG:='获取卡信息失败!';
    exit;
  end;

    _NAME:=szName;
    _SEX:=szSex;
    _BIRTHDAY:=szBirthday;
    _ADDRESS:=szAddress;
    _IDCODE:=szID;
    _DEPARTMENT:=szDepartment;
    _STARTDATE:=szStartDate;
    _ENDDATE:=szEndDate;
    _NATION:=szNation;
    //_ReadSysDirectory:=  GetSysDirectoryPath;
    AImage := TImage.Create(nil);
  try
    AImage.Picture.LoadFromFile(_ReadSysDirectory);
    ABitmap := TBitmap.Create;
    try
      ABitmap.Assign(AImage.Picture.Graphic);
      //下面可以处理这个Bitmap了
      _PhotoImageBytes:=BitmapToString(ABitmap);
    finally
      ABitmap.Free;
    end;
  finally
    AImage.Free;
  end;
 end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TActiveFormX,
    Class_ActiveFormX,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.
