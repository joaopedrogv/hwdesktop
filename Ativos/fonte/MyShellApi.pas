unit MyShellApi;

interface

uses
  Windows;

type
  SHSTOCKICONID = Integer;

  _SHSTOCKICONINFO = record
    cbSize: DWORD;
    hIcon: HICON;
    iSysImageIndex,
    iIcon: Integer;
    szPath: packed array [0..MAX_PATH-1] of WChar;
  end;
  SHStockIconInfo = _SHSTOCKICONINFO;
  TSHStockIconInfo = SHSTOCKICONINFO;
  PSHStockIconInfo = ^TSHStockIconInfo;

const
  //https://msdn.microsoft.com/en-us/library/windows/desktop/bb762179%28v=vs.85%29.aspx
  SHGFI_ADDOVERLAYS       = $000000020;
  SHGFI_ATTR_SPECIFIED    = $000020000;
  SHGFI_ATTRIBUTES        = $000000800;
  SHGFI_DISPLAYNAME       = $000000200;
  SHGFI_EXETYPE           = $000002000;
  SHGFI_ICON              = $000000100;
  SHGFI_ICONLOCATION      = $000001000;
  SHGFI_LARGEICON         = $000000000;
  SHGFI_LINKOVERLAY       = $000008000;
  SHGFI_OPENICON          = $000000002;
  SHGFI_OVERLAYINDEX      = $000000040;
  SHGFI_PIDL              = $000000008;
  SHGFI_SELECTED          = $000010000;
  SHGFI_SHELLICONSIZE     = $000000004;
  SHGFI_SMALLICON         = $000000001;
  SHGFI_SYSICONINDEX      = $000004000;
  SHGFI_TYPENAME          = $000000400;
  SHGFI_USEFILEATTRIBUTES = $000000010;

  //https://msdn.microsoft.com/en-us/library/windows/desktop/bb762205(v=vs.85).aspx
  SHGSI_ICONLOCATION = 0;
  SHGSI_ICON = SHGFI_ICON;
  SHGSI_SYSICONINDEX = SHGFI_SYSICONINDEX;
  SHGSI_LINKOVERLAY = SHGFI_LINKOVERLAY;
  SHGSI_SELECTED = SHGFI_SELECTED;
  SHGSI_LARGEICON = SHGFI_LARGEICON;
  SHGSI_SMALLICON = SHGFI_SMALLICON;
  SHGSI_SHELLICONSIZE = SHGFI_SHELLICONSIZE;

  //https://msdn.microsoft.com/en-us/library/windows/desktop/bb762542%28v=vs.85%29.aspx
  SIID_DOCNOASSOC         = 0;
  SIID_DOCASSOC           = 1;
  SIID_APPLICATION        = 2;
  SIID_FOLDER             = 3;
  SIID_FOLDEROPEN         = 4;
  SIID_DRIVE525           = 5;
  SIID_DRIVE35            = 6;
  SIID_DRIVEREMOVE        = 7;
  SIID_DRIVEFIXED         = 8;
  SIID_DRIVENET           = 9;
  SIID_DRIVENETDISABLED   = 10;
  SIID_DRIVECD            = 11;
  SIID_DRIVERAM           = 12;
  SIID_WORLD              = 13;
  SIID_SERVER             = 15;
  SIID_PRINTER            = 16;
  SIID_MYNETWORK          = 17;
  SIID_FIND               = 22;
  SIID_HELP               = 23;
  SIID_SHARE              = 28;
  SIID_LINK               = 29;
  SIID_SLOWFILE           = 30;
  SIID_RECYCLER           = 31;
  SIID_RECYCLERFULL       = 32;
  SIID_MEDIACDAUDIO       = 40;
  SIID_LOCK               = 47;
  SIID_AUTOLIST           = 49;
  SIID_PRINTERNET         = 50;
  SIID_SERVERSHARE        = 51;
  SIID_PRINTERFAX         = 52;
  SIID_PRINTERFAXNET      = 53;
  SIID_PRINTERFILE        = 54;
  SIID_STACK              = 55;
  SIID_MEDIASVCD          = 56;
  SIID_STUFFEDFOLDER      = 57;
  SIID_DRIVEUNKNOWN       = 58;
  SIID_DRIVEDVD           = 59;
  SIID_MEDIADVD           = 60;
  SIID_MEDIADVDRAM        = 61;
  SIID_MEDIADVDRW         = 62;
  SIID_MEDIADVDR          = 63;
  SIID_MEDIADVDROM        = 64;
  SIID_MEDIACDAUDIOPLUS   = 65;
  SIID_MEDIACDRW          = 66;
  SIID_MEDIACDR           = 67;
  SIID_MEDIACDBURN        = 68;
  SIID_MEDIABLANKCD       = 69;
  SIID_MEDIACDROM         = 70;
  SIID_AUDIOFILES         = 71;
  SIID_IMAGEFILES         = 72;
  SIID_VIDEOFILES         = 73;
  SIID_MIXEDFILES         = 74;
  SIID_FOLDERBACK         = 75;
  SIID_FOLDERFRONT        = 76;
  SIID_SHIELD             = 77;
  SIID_WARNING            = 78;
  SIID_INFO               = 79;
  SIID_ERROR              = 80;
  SIID_KEY                = 81;
  SIID_SOFTWARE           = 82;
  SIID_RENAME             = 83;
  SIID_DELETE             = 84;
  SIID_MEDIAAUDIODVD      = 85;
  SIID_MEDIAMOVIEDVD      = 86;
  SIID_MEDIAENHANCEDCD    = 87;
  SIID_MEDIAENHANCEDDVD   = 88;
  SIID_MEDIAHDDVD         = 89;
  SIID_MEDIABLURAY        = 90;
  SIID_MEDIAVCD           = 91;
  SIID_MEDIADVDPLUSR      = 92;
  SIID_MEDIADVDPLUSRW     = 93;
  SIID_DESKTOPPC          = 94;
  SIID_MOBILEPC           = 95;
  SIID_USERS              = 96;
  SIID_MEDIASMARTMEDIA    = 97;
  SIID_MEDIACOMPACTFLASH  = 98;
  SIID_DEVICECELLPHONE    = 99;
  SIID_DEVICECAMERA       = 100;
  SIID_DEVICEVIDEOCAMERA  = 101;
  SIID_DEVICEAUDIOPLAYER  = 102;
  SIID_NETWORKCONNECT     = 103;
  SIID_INTERNET           = 104;
  SIID_ZIPFILE            = 105;
  SIID_SETTINGS           = 106;
  SIID_DRIVEHDDVD         = 132;
  SIID_DRIVEBD            = 133;
  SIID_MEDIAHDDVDROM      = 134;
  SIID_MEDIAHDDVDR        = 135;
  SIID_MEDIAHDDVDRAM      = 136;
  SIID_MEDIABDROM         = 137;
  SIID_MEDIABDR           = 138;
  SIID_MEDIABDRE          = 139;
  SIID_CLUSTEREDDRIVE     = 140;
  SIID_MAX_ICONS          = 174;


//function SHGetStockIconInfo(siid: SHSTOCKICONID; uFlags: UINT; var psii: TSHStockIconInfo): HRESULT; stdcall;

implementation

//const
//  SHELL32 = 'shell32.dll';

//function SHGetStockIconInfo; external SHELL32 name 'SHGetStockIconInfo';

end.
