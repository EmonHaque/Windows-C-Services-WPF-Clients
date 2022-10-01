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
  1) RentManagerService-POSIX

====================================================================================

1) Launcher and CommonControls Library need CommonService Library reference. 
2) Other WPF client apps need CommonControls Library reference.

====================================================================================
GetLeftOrJoined Function hasn't yet been implemented in RentManagerService-POSIX, add it in the Function enum, copy getLeftOrJoined from Database.c and sendLeftOrJoined from Dispatcher.c of Windows Service and Update switch/cases in those files. 

In the editTenant function change sqlite3_bind_int(command, 2, s->id); to sqlite3_bind_int(command, 1, s->id); for sql = "UPDATE Spaces SET IsVacant = 1 WHERE Id = ?";
