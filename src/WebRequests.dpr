program WebRequests;

uses
  Winapi.Windows,
  Web.WebBroker,
  WebModuleUnit1 in 'WebModuleUnit1.pas' {WebModule1: TWebModule};

{$R *.res}

begin
  // Для многопоточного ISAPI
  CoInitFlags := COINIT_MULTITHREADED;
  Application.Initialize;
  Application.WebModuleClass := WebModuleClass;
  Application.Run;
end.