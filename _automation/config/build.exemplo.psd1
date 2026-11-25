@{
    DefaultProfile = 'anterior'
    OutputDirectory = 'bpl'
    Profiles = @{
        anterior = @{
            ACBrRoot = 'D:\Hw\pac\acbrnfe_dx'
            ACBrDcuPath = 'Lib\Delphi\LibD26\Win32\Release'
        }
        nt009 = @{
            ACBrRoot = 'D:\Hw\pac\acbr-02'
            ACBrDcuPath = 'Lib\Delphi\LibD26\Win32\Release'
        }
    }
    AdditionalUnitPaths = @(
        'D:\Hw\pac\fortes_dx\Binary\LibD26'
        'D:\Hw\pac\hw.componentes.dx\Lib'
        'D:\Hw\pac\LockBox3\run\ciphers'
        'D:\Hw\pac\LockBox3\run\cryptography'
        'D:\Hw\pac\LockBox3\run\hashes'
        'D:\Hw\pac\LockBox3\run\library surface'
        'D:\Hw\pac\LockBox3\run\RSA'
        'D:\Hw\pac\LockBox3\run\utilities'
        'D:\Hw\pac\ZeosLib\packages\DelphiXE10.3\Win32\Debug'
    )
}
