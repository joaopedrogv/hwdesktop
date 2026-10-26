unit PublicacaoRtcModelUnit;

interface

type
  /// <summary>
  ///   Registro de rtc-versions/databases.json: identifica a publicacao e seu hash.
  ///   Deserializado por REST.Json no adaptador (unidade 2006-compativel, sem tipos JSON).
  /// </summary>
  PublicacaoRtcModel = class
  private
    Fcalc_version: string;
    Fsha256: string;
    Frelease_tag: string;
    Fpublished_at: string;
  public
    property calc_version: string read Fcalc_version write Fcalc_version;
    property sha256: string read Fsha256 write Fsha256;
    property release_tag: string read Frelease_tag write Frelease_tag;
    /// <summary>
    ///   Data de publicacao informativa (nao usada em decisao); mantida como string.
    /// </summary>
    property published_at: string read Fpublished_at write Fpublished_at;
  end;

implementation

end.
