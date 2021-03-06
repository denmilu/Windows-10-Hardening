@echo off
rem Windows 10 Home & Pro Hardening
rem Repository: https://github.com/teusink/Home-Security-by-W10-Hardening/
rem Author: Joram Teusink

DISM /online /disable-feature /featurename:LegacyComponents
DISM /online /disable-feature /featurename:DirectPlay
DISM /online /disable-feature /featurename:SimpleTCP 
DISM /online /disable-feature /featurename:SNMP
DISM /online /disable-feature /featurename:WMISnmpProvider 
DISM /online /disable-feature /featurename:MicrosoftWindowsPowerShellV2Root
DISM /online /disable-feature /featurename:MicrosoftWindowsPowerShellV2
DISM /online /disable-feature /featurename:Windows-Identity-Foundation 
DISM /online /disable-feature /featurename:Microsoft-Windows-Subsystem-Linux 
DISM /online /disable-feature /featurename:HypervisorPlatform
DISM /online /disable-feature /featurename:Client-ProjFS 
DISM /online /disable-feature /featurename:WorkFolders-Client
DISM /online /disable-feature /featurename:MediaPlayback 
DISM /online /disable-feature /featurename:WindowsMediaPlayer
DISM /online /enable-feature /featurename:NetFx3
DISM /online /disable-feature /featurename:IIS-WebServerRole 
DISM /online /disable-feature /featurename:IIS-WebServer 
DISM /online /disable-feature /featurename:IIS-CommonHttpFeatures
DISM /online /disable-feature /featurename:IIS-HttpErrors
DISM /online /disable-feature /featurename:IIS-HttpRedirect
DISM /online /disable-feature /featurename:IIS-ApplicationDevelopment
DISM /online /disable-feature /featurename:IIS-NetFxExtensibility
DISM /online /disable-feature /featurename:IIS-NetFxExtensibility45
DISM /online /disable-feature /featurename:IIS-HealthAndDiagnostics
DISM /online /disable-feature /featurename:IIS-HttpLogging 
DISM /online /disable-feature /featurename:IIS-LoggingLibraries
DISM /online /disable-feature /featurename:IIS-RequestMonitor
DISM /online /disable-feature /featurename:IIS-HttpTracing 
DISM /online /disable-feature /featurename:IIS-Security
DISM /online /disable-feature /featurename:IIS-URLAuthorization
DISM /online /disable-feature /featurename:IIS-RequestFiltering
DISM /online /disable-feature /featurename:IIS-IPSecurity
DISM /online /disable-feature /featurename:IIS-Performance 
DISM /online /disable-feature /featurename:IIS-HttpCompressionDynamic
DISM /online /disable-feature /featurename:IIS-WebServerManagementTools
DISM /online /disable-feature /featurename:IIS-ManagementScriptingTools
DISM /online /disable-feature /featurename:IIS-IIS6ManagementCompatibility 
DISM /online /disable-feature /featurename:IIS-Metabase
DISM /online /disable-feature /featurename:WAS-WindowsActivationService
DISM /online /disable-feature /featurename:WAS-ProcessModel
DISM /online /disable-feature /featurename:WAS-NetFxEnvironment
DISM /online /disable-feature /featurename:WAS-ConfigurationAPI
DISM /online /disable-feature /featurename:IIS-HostableWebCore 
DISM /online /disable-feature /featurename:WCF-HTTP-Activation 
DISM /online /disable-feature /featurename:WCF-NonHTTP-Activation
DISM /online /disable-feature /featurename:WCF-Services45
DISM /online /disable-feature /featurename:WCF-HTTP-Activation45 
DISM /online /disable-feature /featurename:WCF-TCP-Activation45
DISM /online /disable-feature /featurename:WCF-Pipe-Activation45 
DISM /online /disable-feature /featurename:WCF-MSMQ-Activation45 
DISM /online /disable-feature /featurename:WCF-TCP-PortSharing45 
DISM /online /disable-feature /featurename:IIS-StaticContent 
DISM /online /disable-feature /featurename:IIS-DefaultDocument 
DISM /online /disable-feature /featurename:IIS-DirectoryBrowsing 
DISM /online /disable-feature /featurename:IIS-WebDAV
DISM /online /disable-feature /featurename:IIS-WebSockets
DISM /online /disable-feature /featurename:IIS-ApplicationInit 
DISM /online /disable-feature /featurename:IIS-ASPNET
DISM /online /disable-feature /featurename:IIS-ASPNET45
DISM /online /disable-feature /featurename:IIS-ASP 
DISM /online /disable-feature /featurename:IIS-CGI 
DISM /online /disable-feature /featurename:IIS-ISAPIExtensions 
DISM /online /disable-feature /featurename:IIS-ISAPIFilter 
DISM /online /disable-feature /featurename:IIS-ServerSideIncludes
DISM /online /disable-feature /featurename:IIS-CustomLogging 
DISM /online /disable-feature /featurename:IIS-BasicAuthentication 
DISM /online /disable-feature /featurename:IIS-HttpCompressionStatic 
DISM /online /disable-feature /featurename:IIS-ManagementConsole 
DISM /online /disable-feature /featurename:IIS-ManagementService 
DISM /online /disable-feature /featurename:IIS-WMICompatibility
DISM /online /disable-feature /featurename:IIS-LegacyScripts 
DISM /online /disable-feature /featurename:IIS-LegacySnapIn
DISM /online /disable-feature /featurename:IIS-FTPServer 
DISM /online /disable-feature /featurename:IIS-FTPSvc
DISM /online /disable-feature /featurename:IIS-FTPExtensibility
DISM /online /disable-feature /featurename:MSMQ-Container
DISM /online /disable-feature /featurename:MSMQ-Server 
DISM /online /disable-feature /featurename:MSMQ-Triggers 
DISM /online /disable-feature /featurename:MSMQ-HTTP 
DISM /online /disable-feature /featurename:MSMQ-Multicast
DISM /online /disable-feature /featurename:MSMQ-DCOMProxy
DISM /online /enable-feature /featurename:NetFx4-AdvSrvs
DISM /online /disable-feature /featurename:NetFx4Extended-ASPNET45 
DISM /online /enable-feature /featurename:Printing-PrintToPDFServices-Features
DISM /online /disable-feature /featurename:Printing-XPSServices-Features 
DISM /online /disable-feature /featurename:RasRip
DISM /online /enable-feature /featurename:MSRDC-Infrastructure
DISM /online /enable-feature /featurename:SearchEngine-Client-Package 
DISM /online /disable-feature /featurename:SMB1Protocol
DISM /online /disable-feature /featurename:SMB1Protocol-Client 
DISM /online /disable-feature /featurename:SMB1Protocol-Server 
DISM /online /disable-feature /featurename:SMB1Protocol-Deprecation
DISM /online /disable-feature /featurename:TelnetClient
DISM /online /disable-feature /featurename:TFTP
DISM /online /enable-feature /featurename:Windows-Defender-Default-Definitions
DISM /online /enable-feature /featurename:Microsoft-Windows-NetFx3-OC-Package 
DISM /online /enable-feature /featurename:Microsoft-Windows-NetFx4-US-OC-Package
DISM /online /enable-feature /featurename:Microsoft-Windows-NetFx3-WCF-OC-Package 
DISM /online /enable-feature /featurename:Microsoft-Windows-NetFx4-WCF-US-OC-Package
DISM /online /enable-feature /featurename:Printing-Foundation-Features
DISM /online /enable-feature /featurename:FaxServicesClientPackage
DISM /online /enable-feature /featurename:Printing-Foundation-InternetPrinting-Client 
DISM /online /disable-feature /featurename:Printing-Foundation-LPDPrintService 
DISM /online /disable-feature /featurename:Printing-Foundation-LPRPortMonitor
DISM /online /disable-feature /featurename:TIFFIFilter 
DISM /online /disable-feature /featurename:Internet-Explorer-Optional-amd64