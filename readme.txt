C# Library:  CommonService
WPF Library: CommonControls

WPF Clients:
  1) Launcher
  2) RentManager
  3) CDRM
  
Windows C Services:
  1) LaunchService (for Launcher)
  2) LoginService (for CommonControls' LoginWindow)
  3) RentManagerService (for RentManager)
  4) CDRMService (for CDRM)
  
Linux C Services:
  1) RentManagerService-POSIX (compile with -fno-stack-protector, otherwise you'll get core dumped)

====================================================================================

1) Launcher and CommonControls Library need CommonService Library reference. 
2) Other WPF client apps need CommonControls Library reference.
