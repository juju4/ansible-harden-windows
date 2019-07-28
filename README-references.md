
References links for role tasks

# General

* MVPDays - Hardening Windows Server - Orin Thomas, Jan 2019
https://www.youtube.com/watch?v=me7QlDyEF7E
* Using PowerShell DSC for Windows Hardening, Jun 2018
https://luke.geek.nz/Using-dsc-for-windows-hardening

# Adobe reader

* http://www.serveradventures.com/the-adventures/disabling-adobe-reader-xi-protected-mode-with-group-policy
* Recommendations for Configuring Adobe Acrobat Reader XI in a Windows Environment, NSA
http://www.nsa.gov/ia/_files/app/Recommendations_for_Configuring_Adobe_Acrobat_Reader_XI_in_a_Windows_Environment.pdf
Enhanced security and protected mode are turned on by default in ARXI, but they are not locked, meaning a user can disable them through the GUI. Protected view is not turned on by default.

# Active Directory

* https://lolware.net/2019/07/13/ad-security-with-pam.html

# Domain Controller krbtgt password reset

* https://cloudblogs.microsoft.com/microsoftsecure/2015/02/11/krbtgt-account-password-reset-scripts-now-available-for-customers/
* https://gallery.technet.microsoft.com/Reset-the-krbtgt-account-581a9e51
* https://gallery.technet.microsoft.com/Reset-the-krbtgt-account-581a9e51/file/142338/1/New-CtmADKrbtgtKeys.zip
* https://social.technet.microsoft.com/Forums/windows/en-US/53033b4d-766b-4588-95fc-aadd93d8a053/impact-of-resetting-the-password-of-the-krbtgt-account
* https://github.com/MicrosoftDocs/windowsserverdocs/blob/master/WindowsServerDocs/identity/ad-ds/manage/AD-Forest-Recovery-Resetting-the-krbtgt-password.md
* https://technet.microsoft.com/en-us/library/cc733991(WS.10).aspx      EventID 14
* https://adsecurity.org/?p=1441
* https://adsecurity.org/?p=483
* https://cert.europa.eu/static/WhitePapers/CERT-EU-SWP_14_07_PassTheGolden_Ticket_v1_1.pdf

# Domain Controller ldap signing

* https://technet.microsoft.com/en-ca/library/dd941856(v=ws.10).aspx
* https://dirteam.com/sander/2012/09/17/new-features-in-active-directory-domain-services-in-windows-server-2012-part-17-ldap-enhancements/

# Mbrfilter

* http://www.talosintelligence.com/mbrfilter/
* https://github.com/vrtadmin/MBRFilter
* uninstall? pnputil.exe, https://technet.microsoft.com/en-us/library/cc730875(v=ws.11).aspx
  RUNDLL32.EXE SETUPAPI.DLL,InstallHinfSection DefaultUninstall 132 path-to-uninstall-dir\infname.inf
  https://msdn.microsoft.com/en-us/windows/hardware/drivers/ifs/using-an-inf-file-to-uninstall-a-file-system-filter-driver
* https://msdn.microsoft.com/en-us/windows/hardware/drivers/ifs/using-an-inf-file-to-install-a-file-system-filter-driver

# Testing speculative

* https://support.microsoft.com/en-us/help/4072698/windows-server-guidance-to-protect-against-the-speculative-execution-s

# Admin Shares

* https://support.microsoft.com/en-us/help/842715/overview-of-problems-that-may-occur-when-administrative-shares-are-mis (<=WinXP)
* https://www.petri.com/disable_administrative_shares
* https://social.technet.microsoft.com/Forums/windows/en-US/c9d6b1c2-1059-4a8a-a6bd-56cc34104faa/disable-administrator-share
* https://social.technet.microsoft.com/Forums/windows/en-US/e56374b4-6132-4aae-ab6b-349e5d355575/disable-null-sessions-on-domain-controllers-and-member-servers

# Deviceguard

* https://docs.microsoft.com/en-us/windows/device-security/device-guard/deploy-device-guard-enable-virtualization-based-security
* https://technet.microsoft.com/en-us/itpro/windows/keep-secure/device-guard-deployment-guide
  Requires hardware, firmware (UEFI, Secure Boot) and software (win10+, ws2016+, application code signing)
* http://www.exploit-monday.com/2018/06/device-guard-and-application.html
* https://docs.microsoft.com/en-us/windows/security/threat-protection/windows-defender-application-control/select-types-of-rules-to-create
* https://docs.microsoft.com/en-us/windows/security/threat-protection/windows-defender-application-control/microsoft-recommended-block-rules
* https://github.com/Microsoft/WSLab/tree/master/Scenarios/DeviceGuard/SmartLocker

# IPv6

* https://support.microsoft.com/en-us/help/929852/how-to-disable-ipv6-or-its-components-in-windows
* https://techjourney.net/how-to-disable-tcpipv6-teredo-tunneling-in-windows/
* https://technet.microsoft.com/en-us/library/2009.07.cableguy.aspx
* https://insinuator.net/2017/01/ipv6-properties-of-windows-server-2016-windows-10/
* https://blogs.msdn.microsoft.com/virtual_pc_guy/2014/03/25/hyper-v-networkingrouter-guard/
* https://blogs.technet.microsoft.com/askpfeplat/2013/06/16/ipv6-for-the-windows-administrator-why-you-need-to-care-about-ipv6/
* https://docs.microsoft.com/en-us/windows/deployment/planning/windows-10-1803-removed-features
  "6to4 has been disabled by default since Windows 10, version 1607 (the Anniversary Update), ISATAP has been
  disabled by default since Windows 10, version 1703 (the Creators Update), and Direct Tunnels has always
  been disabled by default. Please use native IPv6 support instead."

# LAPS

Only domain joined station
* https://blogs.technet.microsoft.com/askpfeplat/2015/12/28/local-administrator-password-solution-laps-implementation-hints-and-security-nerd-commentary-including-mini-threat-model/
* https://adsecurity.org/?p=1790
* https://adsecurity.org/?p=3164
```
PS> Get-ADComputer -Filter {ms-McsAdmPwdExpirationTime -Like “*”} -Property ms-McsAdmPwdExpirationTime
```
* https://flamingkeys.com/deploying-the-local-administrator-password-solution-part-1/
* https://blogs.technet.microsoft.com/kfalde/2015/11/18/laps-audit-reporting-via-wef-posh-and-powerbi/
* https://github.com/kurtfalde/LAPS-Reporting
* https://blog.netspi.com/running-laps-around-cleartext-passwords/
* https://github.com/kfosaaen/Get-LAPSPasswords
```
PS> Get-ADObject 'CN=ms-mcs-admpwd,CN=Schema,CN=Configuration,DC=mydomain,DC=com'
PS> Find-AdmPwdExtendedrights
PS> Get-AdmPwdPassword -ComputerName <computername>
PS> Get-LAPSPasswords -DomainController 192.168.1.1 -Credential DEMO\karl | Format-Table -AutoSize
PS> Get-ADComputer -Filter * -Property * | Format-Table Name,OperatingSystem,OperatingSystemServicePack,OperatingSystemVersion -Wrap Auto
PS> Get-ADComputer -Filter {OperatingSystem -Like “Windows Server*”} -Property * | Format-Table Name,OperatingSystem,OperatingSystemServicePack -Wrap -Auto | Export-CSV AllWindows.csv -NoTypeInformation -Encoding UTF8
```
* Audit with Configuration Manager: https://4sysops.com/archives/monitoring-laps-with-configuration-manager/
* https://room362.com/post/2017/dump-laps-passwords-with-ldapsearch/
* http://archive.hack.lu/2017/HackLU_2017_Malicious_use_LAPS_Clementz_Goichot.pdf

# Mimikatz

* https://jimshaver.net/2016/02/14/defending-against-mimikatz/
* https://blogs.technet.microsoft.com/askpfeplat/2016/04/18/the-importance-of-kb2871997-and-kb2928120-for-credential-protection/
* https://posts.specterops.io/pass-the-hash-is-dead-long-live-localaccounttokenfilterpolicy-506c25a7c167
* http://www.harmj0y.net/blog/redteaming/pass-the-hash-is-dead-long-live-localaccounttokenfilterpolicy/
* https://technet.microsoft.com/en-us/library/dd835564(v=ws.10).aspx#BKMK_BuiltInAdmin
* https://isc.sans.edu/forums/diary/Mitigations+against+Mimikatz+Style+Attacks/24612/
* https://docs.microsoft.com/en-us/windows-server/security/credentials-protection-and-management/configuring-additional-lsa-protection

# GPO

* https://blogs.windows.com/msedgedev/2015/08/26/how-microsoft-edge-and-internet-explorer-11-on-windows-10-work-better-together-in-the-enterprise/#s4vAKTKvz328jwjY.97 Enterprise Mode Site List
* http://www.morgantechspace.com/2013/11/Enable-File-System-Auditing-in-Windows.html
* https://4sysops.com/archives/deny-and-allow-workstation-logons-with-group-policy/
* https://www.reddit.com/r/sysadmin/comments/1yzjul/restricting_interactive_logon_but_allow_runas/
* http://www.authlite.com/kb/allow-runas-but-block-interactive-logon/
  * Remove Debug Privileges
* https://technet.microsoft.com/en-us/library/dn221969(v=ws.11).aspx
* https://blogs.msdn.microsoft.com/oldnewthing/20080314-00/?p=23113/
* https://www.sans.org/reading-room/whitepapers/testing/passthehash-attacks-tools-and-mitigation-33283
* https://iase.disa.mil/stigs/gpo/Pages/index.aspx
* https://theitbros.com/allow-non-admins-install-printer-drivers-via-gpo/

# RDP

* https://docs.microsoft.com/en-us/windows/access-protection/remote-credential-guard
* https://social.technet.microsoft.com/wiki/contents/articles/32905.how-to-enable-restricted-admin-mode-for-remote-desktop.aspx
* need this patch installed, May 2014
* https://technet.microsoft.com/en-us/library/security/2871997.aspx
* https://michael-eder.net/post/2018/native_rdp_pass_the_hash/

# Registry

* netbios, llmnr
  * http://windowsitpro.com/networking/q-how-can-i-disable-netbios-over-tcpip-windows-server-core-installations
  * https://technet.microsoft.com/en-us/library/cc775874%28v=ws.10%29.aspx
  * https://technet.microsoft.com/en-us/library/ee692589.aspx
  * https://www.4armed.com/blog/llmnr-nbtns-poisoning-using-responder/
  * https://www.surecloud.com/newsletter/local-network-vulnerabilities-llmnr-and-nbt-ns-poisoning
  * https://support.microsoft.com/en-us/help/313314/how-to-disable-netbios-over-tcp-ip-by-using-dhcp-server-options
* windows script host
  * http://news.softpedia.com/news/how-to-prevent-zip-files-from-executing-malicious-javascript-behind-your-back-503226.shtml
  * https://labsblog.f-secure.com/2016/04/19/how-to-disable-windows-script-host/
* file association
  * https://bluesoul.me/2016/05/12/use-gpo-to-change-the-default-behavior-of-potentially-malicious-file-extensions/
  * Partially covered if Windows Script Host is disabled
* msiexec
  * https://blogs.technet.microsoft.com/fdcc/2011/01/24/alwaysinstallelevated-is-equivalent-to-granting-administrative-rights/
  * https://msdn.microsoft.com/en-us/library/windows/desktop/aa367561(v=vs.85).aspx
* credentials in memory
  * https://onedrive.live.com/view.aspx?resid=A352EBC5934F0254!3316&ithint=file%2cpptx&app=PowerPoint
  * https://support.microsoft.com/en-us/help/2871997/microsoft-security-advisory-update-to-improve-credentials-protection-and-management-may-13,-2014
* exploit process mitigation for powershell
  * https://twitter.com/mattifestation/status/1034510764642467840
  * https://github.com/MicrosoftDocs/windows-itpro-docs/blob/master/windows/security/threat-protection/windows-defender-exploit-guard/troubleshoot-exploit-protection-mitigations.md
  * https://docs.microsoft.com/en-us/windows/security/threat-protection/override-mitigation-options-for-app-related-security-policies
  * https://docs.microsoft.com/en-us/windows/security/threat-protection/windows-defender-exploit-guard/customize-exploit-protection

# SMB

* https://support.microsoft.com/en-ca/help/2696547/how-to-enable-and-disable-smbv1,-smbv2,-and-smbv3-in-windows-vista,-windows-server-2008,-windows-7,-windows-server-2008-r2,-windows-8,-and-windows-server-2012
* https://www.us-cert.gov/ncas/current-activity/2017/01/16/SMB-Security-Best-Practices
* https://packetstormsecurity.com/files/130981/Microsoft-Windows-Local-WebDAV-NTLM-Reflection-Privilege-Escalation.html
* https://community.tenable.com/thread/8723
* https://www.stigviewer.com/stig/windows_8_8.1/2015-06-16/finding/V-21950
* https://gnawgnu.blogspot.ca/2016/08/the-return-of-unchardenedpath-problems.html
* https://technet.microsoft.com/en-us/library/security/ms16-075.aspx

# Sticky keys

* https://social.technet.microsoft.com/Forums/windowsserver/en-US/6ba301df-5e3a-49ce-900a-c6b8c20217f3/disable-sticky-keys-via-gpo

# USB

* https://www.reddit.com/r/sysadmin/comments/3ti7r8/protect_against_usb_to_ethernet_adapters/
  + Enable or disable Network Bridge with Group Policy
        Local Computer Policy, Computer Configuration, Administrative Templates, Network, and Network Connections.
        Prohibit installation and configuration of Network Bridge on your DNS domain network
* https://technet.microsoft.com/en-us/library/cc732103(v=ws.10).aspx
* https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-R2-and-2012/jj679890(v=ws.11)
  + Enable or disable Internet Connection Sharing with Group Policy
        Local Computer Policy, Computer Configuration, Administrative Templates, Network, and Network Connections.
        Prohibit use of Internet Connection Sharing on your DNS domain network
* https://technet.microsoft.com/en-us/library/cc770930(v=ws.10).aspx
  + Locking down Windows Vista and Windows 7 against Malicious USB devices
        registry HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\StorageDevicePolicies\WriteProtect
        Computer Configuration->Administrative Templates->System->Device Installation->Device Installation Restrictions
        Prevent installation of devices...
        [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Group Policy Objects\{55803F47-01A6-4A85-89CE-74357A125D17}Machine\Software\Policies\Microsoft\Windows\DeviceInstall\Restrictions]: "AllowAdminInstall"=dword:00000001
* http://www.irongeek.com/i.php?page=security/locking-down-windows-vista-and-windows-7-against-malicious-usb-devices
* https://apple.slashdot.org/story/16/09/07/2048237/modified-usb-ethernet-adapter-can-steal-windows-and-mac-credentials
* http://arstechnica.com/security/2016/11/meet-poisontap-the-5-tool-that-ransacks-password-protected-computers/
* https://support.microsoft.com/en-ca/help/2516445/blocking-the-sbp-2-driver-and-thunderbolt-controllers-to-reduce-1394-d

3rd party tool
* https://www.elevenpaths.com/labstools/latch-usb-monitor/
* http://www.binisoft.org/usbc.php
* http://www.binisoft.org/download/usbc4setup.exe
* https://github.com/pmsosa/duckhunt
* https://beamgun.io/

# WEF

* https://docs.microsoft.com/en-us/windows/threat-protection/use-windows-event-forwarding-to-assist-in-instrusion-detection
* https://msdn.microsoft.com/en-us/library/cc748890(v=ws.11).aspx
* https://msdn.microsoft.com/en-us/library/bb870973(v=vs.85).aspx
* https://blogs.technet.microsoft.com/jepayne/2015/11/23/monitoring-what-matters-windows-event-forwarding-for-everyone-even-if-you-already-have-a-siem/
* https://blogs.technet.microsoft.com/wincat/2008/08/11/quick-and-dirty-large-scale-eventing-for-windows/
* https://medium.com/@palantir/windows-event-forwarding-for-network-defense-cb208d5ff86f
* https://github.com/palantir/windows-event-forwarding

# Windows 10

* https://twitter.com/dwizzzleMSFT/status/853079695520284674
  If you instal Windows 10 1703 and enable HVCI we now also enable kCFG.  Kernel mode exploits are
  subject to control flow integrity in Win10
* https://docs.microsoft.com/en-us/windows/device-security/device-guard/deploy-device-guard-enable-virtualization-based-security
* https://docs.microsoft.com/en-us/windows/device-security/device-guard/deploy-code-integrity-policies-steps
* https://blogs.technet.microsoft.com/the_microsoft_excel_support_team_blog/2015/08/19/blocked-access-to-files-with-windows-10/

# WMI

* http://la.trendmicro.com/media/misc/understanding-wmi-malware-research-paper-en.pdf
* https://files.sans.org/summit/Digital_Forensics_and_Incident_Response_Summit_2015/PDFs/TheresSomethingAboutWMIDevonKerr.pdf
* https://ics-cert.us-cert.gov/sites/default/files/documents/WMI_for_Detection_and_Response_S508C.pdf
* FIXME! cover root\subscription, root\default
* https://www.fireeye.com/blog/threat-research/2016/08/wmi_vs_wmi_monitor.html

# WPAD

* https://it.slashdot.org/story/16/08/13/0149241/disable-wpad-now-or-have-your-accounts-compromised-researchers-warn
* http://www.csoonline.com/article/3106076/data-protection/disable-wpad-now-or-have-your-accounts-and-private-data-compromised.html
