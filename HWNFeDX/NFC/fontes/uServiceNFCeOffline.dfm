object HWNFC_Offline: THWNFC_Offline
  OldCreateOrder = False
  OnCreate = ServiceCreate
  OnDestroy = ServiceDestroy
  DisplayName = 'HWNFC Offline'
  Interactive = True
  AfterInstall = ServiceAfterInstall
  AfterUninstall = ServiceAfterUninstall
  OnContinue = ServiceContinue
  OnExecute = ServiceExecute
  OnPause = ServicePause
  OnShutdown = ServiceShutdown
  OnStart = ServiceStart
  OnStop = ServiceStop
  Height = 445
  Width = 990
  object TimerSinc: TTimer
    Enabled = False
    OnTimer = TimerSincTimer
    Left = 480
    Top = 208
  end
end
