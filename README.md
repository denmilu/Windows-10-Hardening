# Home-Security-by-W10-Hardening
Description on how I configured the installation and Security of Windows 10 Home and Pro, and how I keep it fit for use and purpose.

**Table of Contents**
- Introduction
  - [The Scope](#the-scope)
  - [Steps to take](#steps-to-take)
- [1 - Control Panel](#control-panel)
- [2 - Settings](#settings)
- [3 - Xbox Game Bar](#xbox-game-bar)
- [4 - Explorer](#explorer)
- [5 - Registry](#registry)
- [6 - Remove third-party software](#remove-third-party-software)
- [7 - Systems repair](#systems-repair)

# Introduction
The goal of this project is to make a secure (or at least secure within a reasonable amount of effort) Windows 10 installation to ensure a secure environment to consume and produce content. It is possible that by gaining new insights hardening-options are either removed or added.

My other goal is to gain a good understanding on Windows 10 Hardening and other Security-related aspects. I think that as an Information Security Officer and Director of the Cybersecurity Company [Digicy.Cloud](https://www.digicy.cloud/en/) it is important to upkeep (general) knowledge about Technology and it's Security.

## The Scope
Scope is an important part for this project. Otherwise you can endlessly install security tools and solutions which in the end all have a trade-off. This might be resources and performance, but also your own precious time to keep it running :).

The constraints are:
- Windows 10 Home & Pro Build 1809 (compatible with 1803)
- For the larger part, the settings needs to be able to be set through a GUI. I'll make some exceptions here and there (because there was never a GUI and its impact is rather important).
- Some settings can also be set by using a registry-key file (.reg). I will supply these files.
- Settings must be able to be set without using Group Policy Object (GPO), because that is not present (by default) on Windows 10 Home.

I focus on Home, but why? The Home edition is by far the most used edition by regular consumers (even small business uses it sometimes due to buying their laptops or desktops at the local retailer...). Pro is more focused on the core IT, and Enterprise is, well, for enterprises. The GPO is only present on Pro and above. Though, where possible I take Pro into account also.

## Read instructions

From a Graphical User Interface (GUI) perspective I will touch every relevant setting. Whenever there is a mention of, for instance, [[hklm-cis-level1]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hklm-cis-level1.reg) then you can also set the setting through the use of the Windows Registry.

- HKLM stands for HKEY_LOCAL_MACHINE. It's about settings that are applied system wide. Adding it once to a system is enough.
- HKCU stands for HKEY_CURRENT_USER. It's about settings that are applied per user. These needs to be added per user.

# Upgrades to newer Windows 10 builds

Whenever you upgrade to a newer build, sometimes there are keys and entries going obsolete. Through this registry file you can remove them safely: [[hk-remove-obsolete-entries]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hk-remove-obsolete-entries.reg)

Upgrades included in the Registry file:
- From 1803 to 1809: not needed
- From 1709 to 1803: included

# Control Panel

These are the settings that are done through the use of the Control Panel. Set it's view to `Large icons` to better see all options.

## System and Security
- Security and Maintenance: User Account Control: Always notify [[hklm-cis-level1]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hklm-cis-level1.reg)
- System: Advanced system settings: Advanced: Performance Settings: Visual Effects: Adjust for best appearance [[hkcu-custom]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hkcu-custom.reg)
- System: Advanced system settings: Advanced: Performance Settings: Advanced: Virtual memory: Fixed size for recommended values
- System: Advanced system settings: Advanced: Performance Settings: Data Execution Prevention: Turn on DEP for all
- System: Advanced system settings: Advanced: Startup and Recovery settings: Write debug information: None [[hklm-custom]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hklm-custom.reg)
- System: Advanced system settings: Remote: Remote Assistance: Advanced: Set the maximum amount of time invitations can remain open: 1 Hours [[hklm-custom]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hklm-custom.reg)
- System: Advanced system settings: Remote: Remote Assistance: Advanced: Create invitations that can only be used from computers running Windows Vista or later: On [[hklm-custom]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hklm-custom.reg)
- System: Advanced system settings: Remote: Remote Assistance: Disable [[hklm-custom]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hklm-custom.reg)
- Device Encryption: Back up recovery key
- Flash Player (if present)
  - Storage: Block all sites from storing
  - Camera and Mic: Block all sites from using camera & microphone
  - Playback: Block all sites from using peer-assisted networking

## Programs
- Programs and Features: Turn Windows features off:
  - .NET Framework 3.5 (includes .NET 2.0 and 3.0): Windows Communication Foundation HTTP Activation
  - .NET Framework 3.5 (includes .NET 2.0 and 3.0): Windows Communication Foundation Non-HTTP Activation
  - .NET Framework 4.7 Advanced Services: ASP.NET 4.7 (.NET)
  - .NET Framework 4.7 Advanced Services: WCF Services (.NET)
  - Internet Explorer 11
  - Internet Information Services (and all below)
  - Internet Information Services Hostable Web Core
  - Legacy Components (and all below)
  - Media Features (and all below)
  - Microsoft Message Queue (MSMQ) Server (and all below)
  - Microsoft XPS Document Writer
  - Print and Document Services: LPD Print Service
  - Print and Document Services: LPR Port Monitor
  - RIP Listener
  - Simple Network Management Protocol (SNMP) (and all below)
  - Simple TCPIP services (i.e. echo, daytime etc)
  - SMB 1.0/CIFS File Share Support (and all below)
  - Telnet Client
  - TFTP Client
  - Windows Identity Foundation 3.5
  - Windows PowerShell 2.0 (and all below, unless needed!)
  - Windows Process Activation Service (and all below)
  - Windows Subsystem for Linux (unless needed!)
  - Windows TIFF IFilter
  - Work Folders Client
  - XPS Viewer
- Java (if present):
  - Update: Notify Me: Before installing
  - Update: Check for Updates Automatically: On
  - Update: Check for Updates Automatically: Advanced: Frequency: Daily
  - Security: Enable Java content for browser and Web Start applications: Off
  - Security: Security level for applications not on the Exception Site list: High

For automated enabling/disabling Windows Features, execute this file in the Command Promt with Administrative Privileges (right-click -> Run as Administrator): [[windows-features.bat]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/)

## Network and Internet
- Internet Options: Connections: LAN settings:
  - Automatically detect settings: Off
  - Use automatic configuration script: Off (unless explicitly used!)
  
# Settings

These are the settings that are done through the use of the new Windows Settings interface.

## System
- Notifications & actions: Show me the Windows welcome experience: Off [[hklm-cis-level1]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hklm-cis-level1.reg) & [[hkcu-custom]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hkcu-custom.reg)
- Notifications & actions: Get tips, tricks, and suggestions as you use Windows: Off [[hkcu-custom]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hkcu-custom.reg)
- Storage (Sense): On [[hkcu-custom]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hkcu-custom.reg)
- Storage (Sense): Delete temporary files that my apps aren't using: On [[hkcu-custom]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hkcu-custom.reg)
- Storage (Sense): Delete files that have been in the recycle bin for over: 30 days [[hkcu-custom]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hkcu-custom.reg)
- Storage (Sense): Delete files in the Download folder that have been there for over: Never [[hkcu-custom]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hkcu-custom.reg)
- Projecting to this PC: Always off [[hklm-cis-level1]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hklm-cis-level1.reg) & [[hkcu-custom]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hkcu-custom.reg)
- Projecting to this PC: Ask to project to this PC: Every time [[hkcu-custom]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hkcu-custom.reg)
- Projecting to this PC: Require PIN for sharing: On [[hklm-cis-level1]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hklm-cis-level1.reg)
- Projecting to this PC: This PC can be discovered for projection only when it is plugged in: Off [[hklm-cis-level1]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hklm-cis-level1.reg) & [[hkcu-custom]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hkcu-custom.reg)
- Shared experiences: Nearby sharing: Off
- Shared experiences: I can share or receive from: My devices only [[hkcu-custom]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hkcu-custom.reg)
- Shared experiences: Share across devices: On
- Shared experiences: I can share or receive from: My devices only [[hkcu-custom]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hkcu-custom.reg)
- Clipboard: Clipboard history: On [[hkcu-custom]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hkcu-custom.reg) & [[hkcu-custom]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hkcu-custom.reg)
- Clipboard: Sync across devices: Off [[hkcu-custom]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hkcu-custom.reg)

## Devices
- Bluetooth & other devices: Off (unless needed!)
- AutoPlay: Off [[hklm-cis-level1]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hklm-cis-level1.reg) & [[hkcu-custom]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hkcu-custom.reg)
- AutoPlay: Removable drive: Take no action
- AutoPlay: Memory card: Take no action

## Phone
- No Security or Privacy settings to mention

## Network & Internet
- Status: Adapter options: [Every Adapter]: Microsoft Network Adapter Multiplexor Protocol: Disabled
- Status: Adapter options: [Every Adapter]: Microsoft LLDP Protocol Driver: Disabled
- Status: Adapter options: [Every Adapter]: TCP/IPv4: Properties: Advanced: WINS: NetBIOS over TCP/IP: Disabled
- Status: Adapter options: [Every Adapter]: TCP/IPv4: Properties: Advanced: WINS: LMHOSTS Lookup: Disabled [[hklm-custom]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hklm-custom.reg)
- Wi-Fi: Use random hardware addresses: Off
- Wi-Fi: Let me use Online Sign-Up to get connected: On
- Mobile hotspot: Off
- Mobile hotspot: Turn On Remotely: Off

## Personalization
- Lock screen: Get fun fact & tips: Off [[hkcu-custom]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hkcu-custom.reg)
- Lock screen: Screen saver settings: Blank - 10 minutes, on resume logon
- Start: Show most used apps: Off [[hkcu-custom]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hkcu-custom.reg)
- Start: Occasionally show suggestions in Start: Off [[hkcu-custom]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hkcu-custom.reg)

## Apps
- Apps & features: Installing apps: Warn me before installing apps from outside the Store

## Accounts
- Sign-in options: Require sign-in: When PC wakes up from sleep [[hklm-cis-level1]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hklm-cis-level1.reg)
- Sign-in options: PIN: On
- Sign-in options: Show account details: On [[hklm-cis-level1]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hklm-cis-level1.reg)
- Sign-in options: Use sign-in after update: On [[hklm-cis-level1]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hklm-cis-level1.reg)
- Sync your settings: Sync settings: On
- Sync your settings: Theme: On [[hkcu-custom]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hkcu-custom.reg)
- Sync your settings: Internet Explorer settings: On [[hkcu-custom]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hkcu-custom.reg)
- Sync your settings: Passwords: On [[hkcu-custom]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hkcu-custom.reg)
- Sync your settings: Language preferences: On [[hkcu-custom]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hkcu-custom.reg)
- Sync your settings: Ease of Access: On [[hkcu-custom]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hkcu-custom.reg)
- Sync your settings: Other Windows settings: On [[hkcu-custom]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hkcu-custom.reg)

## Time & Language
- No Security or Privacy settings to mention

## Gaming
- No Security or Privacy settings to mention

## Ease of Access
- No Security or Privacy settings to mention

## Cortana / Search
- Talk to Cortana: It can be fully disabled if you like (but not through GUI) [[hklm-cis-level1]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hklm-cis-level1.reg)
- Talk to Cortana: Let Cortana respond to "Hey Cortana": Off [[hkcu-custom]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hkcu-custom.reg)
- Talk to Cortana: Let Cortana listen for my commands when I press the Windows logo key + C: On [[hkcu-custom]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hkcu-custom.reg)
- Talk to Cortana: Use Cortana even when my device is locked: Off [[hkcu-custom]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hkcu-custom.reg)
- Permissions & History: SafeSearch: Moderate
- Permissions & History: CloudSearch: On
- Permissions & History: Device History: On
- Cortana across my devices: Get phone notifications on this PC: On
- Cortana across my devices: Help me pick up where I left off on other devices: On
- Cortana across my devices: Get list suggestions: Off
Note: Cortana can only be disabled through the use of registry.

## Privacy

### Windows Permissions
- General: Let apps use advert ID: Off [[hklm-custom]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hklm-custom.reg)
- General: Let websites access language list: Off [[hkcu-custom]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hkcu-custom.reg)
- General: Let Windows track app launches: Off [[hkcu-custom]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hkcu-custom.reg)
- General: Show suggested content in Settings: Off [[hkcu-custom]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hkcu-custom.reg)
- Diagnostics & feedback: Basic (Level Security is only possible through Registry) [[hklm-cis-level1]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hklm-cis-level1.reg)
- Diagnostics & feedback: Improve inking & typing recognition: Off
- Diagnostics & feedback: Tailored experiences: Off
- Diagnostics & feedback: Diagnostic data viewer: Off
- Diagnostics & feedback: Feedback frequency: Never [[hklm-cis-level1]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hklm-cis-level1.reg)
- Activity history: Let Windows collect my activities from this PC: On
- Activity history: Let Windows sync my activities from this PC to the cloud: Off

### App permissions
- Categories from `Location` to `Radios`: Configure it to your needs (the more Off is better privacy protection)
- Other devices: Let apps share & sync: Off [[hkcu-custom]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hkcu-custom.reg)

## Update & Security
- Windows Update: Set `Active hours` to your likings
- Windows Update: Set `Restart options` to your likings
- Windows Update: Advanced options: Give updates other Microsoft products when I update Windows: On
- Windows Update: Advanced options: Delivery optimizations: Allow downloads from other PCs: On [[hklm-cis-level1]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hklm-cis-level1.reg)
- Windows Update: Advanced options: Delivery optimizations: PCs on my local network: On [[hklm-cis-level1]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hklm-cis-level1.reg)
- Windows Update: Advanced options: Delivery optimizations: PCs on my local network, and PCs on the Internet: Off [[hklm-cis-level1]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hklm-cis-level1.reg)
- Windows Security: Windows Defender Security Center
- Windows Security: Antivirus options: Period scanning: Off (NOTE: setting only available when third-party anti-malware is installed)
- Find my device: On [[hklm-custom]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hklm-custom.reg)
- Device encryption: On

### Update & Security - Windows Defender Security Center
Note: Settings below only available when third-party anti-malware is NOT installed
- Virus & threat Protection: Settings: Real-time protection: On
- Virus & threat Protection: Settings: Cloud-delivered protection: On
- Virus & threat Protection: Settings: Automatic sample submission: On
- Virus & threat Protection: Settings: Controlled folder access: On
- Virus & threat Protection: Settings: Notifications: Receive recent activity and scan results: On
- Virus & threat Protection: Settings: Notifications: Notify when Windows Defender Firewall blocks a new app: On
- Virus & threat Protection: Settings: Notifications: Domain firewall: On
- Virus & threat Protection: Settings: Notifications: Private firewall: On
- Virus & threat Protection: Settings: Notifications: Public firewall: On
- App & browser control: Check apps and files: Warn [[hklm-cis-level1]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hklm-cis-level1.reg) & [[hklm-custom]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hklm-custom.reg)
- App & browser control: SmartScreen for Edge: Block [[hklm-cis-level1]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hklm-cis-level1.reg) & [[hkcu-custom]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hkcu-custom.reg)
- App & browser control: SmartScreen for Windows Store apps: Warn [[hkcu-custom]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hkcu-custom.reg)
- App & browser control: Exploit protection: Control Flow Gaurd (CFG): On by default
- App & browser control: Exploit protection: Data Execution Prevention (DEP): On by default
- App & browser control: Exploit protection: Force randomization for images (Mandatory ASLR): On by default
- App & browser control: Exploit protection: Randomize memory allocation (Bottom-up ASLR): On by default
- App & browser control: Exploit protection: Validate exception chains (SEHOP): On by default
- App & browser control: Exploit protection: Validate heap integrity: On by default

# Xbox Game bar

This setting can only be set when running a game.

- Settings: General: Show tips when I start a game: Off [[hkcu-custom]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hkcu-custom.reg)

# Explorer

Seeing all extensions of all files is important to recognize malicious files.
- Open `Windows Explorer`.
- Click on the tab `View`.
- Tick the box `File name extensions`. [[hkcu-custom]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hkcu-custom.reg)

Now change the default filehandler of all `.js` and `.jse` files to Notepad, to prevent malware from executing malicious scripts.
- Create a file called `nomalware.js`.
- Now right-click on that file, and click on `Open with` and then `Choose another app`.
- Tick the box in front of `Always use this app to open .js files`.
- Click on more `More apps`.
- Click on `Notepad`.
- Click on `OK`.
- Repeat the same when you have created a file called `nomalware.jse`.

# Registry

In order to even more harden your system, add the registry key-sets below to your register. They also incorporate most of the settings above. But they also incorporate security improvements that cannot be set through an interface. Usability is considered when deciding if it should be more or less secure.

## Additional settings

**Machine Level**
- Encryption for both client and server purposes compliant to best-practices.
- DLL search path algorithm vulnerability mitigation.
- Google Chrome hardening.

**User Level**
- Automatic installation of Windows Store apps disabled.

## Registry Files
If you have Windows 10 Home:
- HKEY_LOCAL_MACHINE - Windows 10 Home CIS Level 1 (not fully compliant) [[REG]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hklm-cis-level1.reg)
- HKEY_LOCAL_MACHINE - Windows 10 Home CIS Level 2 (not fully compliant) [[REG]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hklm-cis-level2.reg)
- HKEY_LOCAL_MACHINE - Windows 10 Custom hardening [[REG]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hklm-custom.reg)
- HKEY_LOCAL_MACHINE - Windows Client and Server Encryption hardening [[REG]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hklm-encryption.reg)
- HKEY_CURRENT_USER - Windows 10 User level settings hardening [[REG]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hkcu-custom.reg)

If you have Windows 10 Pro:
- Run registry keys of Windows 10 Home +
- HKEY_LOCAL_MACHINE - Windows 10 Pro CIS Level 1 (not fully compliant) [[REG]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hklm-cis-level1-pro.reg)
- HKEY_LOCAL_MACHINE - Windows 10 Pro CIS Level 2 (not fully compliant) [[REG]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hklm-cis-level2-pro.reg)

If you use BitLocker with your Windows installment:
- HKEY_LOCAL_MACHINE - Windows 10 CIS BitLocker (not fully compliant) [[REG]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hklm-cis-bitlocker.reg)

If you use Google Chrome:
- HKEY_LOCAL_MACHINE - Google Chrome hardening [[REG]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hklm-cis-chrome.reg)

If you want to uninstall all keys and get back to the default:
- Uninstaller [[REG]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/uninstall/)

# hosts file
To disable the wpad requests (automatic proxy server configuration) without breaking the IP Helper service of Windows, you will need to add a value to your hosts file.
- This can be done by replacing your hosts file with this [[hosts]](https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/install/hosts)) file.
- Or you can manually add this line to your existing hosts file: `255.255.255.255 wpad.`.

The hosts file is located in: `C:\Windows\System32\drivers\etc`

# Remove third-party software
If you don't need the software mentioned below, really remove it!
- Adobe Shockwave Player
- Adobe Flash Player (it is built-in into Google Chrome, Mozilla Firefox and Microsoft Edge)
- Microsoft Silverlight
- Adobe Reader (PDF files can be opened in Google Chrome, Mozilla Firefox and Microsoft Edge)
- Java Runtime Environment (JRE)

# Systems repair
Sometimes a system needs repair. Try the following commands to check and fix the integrity of your system files.

## Start Command Prompt in privileged mode
- Press `⊞` (Windows logo) in the taskbar, and type `cmd`.
- Right-click `Command Prompt`, and press `Run as administrator`.
- Press `Yes` in case of User Account Control (UAC) pop-up.

## SFC
- Type in `sfc /scannow` and press `Enter` to initiate the integrity check and fix.
- Wait for it to finish and reboot.

## MDSCHED
- Type in `mdsched.exe` and press `Enter` to initiate Windows Memory Diagnostic.
- Reboot to execute the test.

## DISM
- Type in `dism /online /cleanup-image /checkhealth` and press `Enter` to check for known corruptions.
- Type in `dism /online /cleanup-image /scanhealth` and press `Enter` to scan for new corruptions.
- Type in `dism /online /cleanup-image /restorehealth` and press `Enter` to fix the known corruptions.
- Wait for it to finish and reboot.

# Word of thanks
A special word of thanks goes to Center for Internet Security (CIS) (https://www.cisecurity.org/), the Group Policy Administrative Templates Catalog site (https://getadmx.com/), and Ali Robertson with his/her Reclaim Windows script (https://gist.github.com/alirobe/7f3b34ad89a159e6daa1).

Their contributions to (not only) this guide is worth my sincere gratitude. Thanks!

# Licensing
All the licensing and copyrights of any of the code and applications belong to their respective owners. All other coding falls under the MIT-license: https://github.com/teusink/Home-Security-by-W10-Hardening/blob/master/LICENSE

Feel free to remake, reshape and reuse whatever you like or need.
