unit CompatibilidadeRtcModelUnit;

interface

type
  /// <summary>
  ///   Registro de rtc-versions/compatibility.json: liga o app/dominio RTC a calc_version.
  ///   Deserializado por REST.Json no adaptador (unidade 2006-compativel, sem tipos JSON).
  /// </summary>
  CompatibilidadeRtcModel = class
  private
    Fid: Integer;
    Fapp_name: string;
    Fcalc_version: string;
    Frtc_version: Integer;
    Fstatus: string;
  public
    property id: Integer read Fid write Fid;
    property app_name: string read Fapp_name write Fapp_name;
    property calc_version: string read Fcalc_version write Fcalc_version;
    property rtc_version: Integer read Frtc_version write Frtc_version;
    property status: string read Fstatus write Fstatus;
  end;

implementation

end.
