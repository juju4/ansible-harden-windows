
References links for role tasks

# Adobe reader

* http://www.serveradventures.com/the-adventures/disabling-adobe-reader-xi-protected-mode-with-group-policy
* Recommendations for Configuring Adobe Acrobat Reader XI in a Windows Environment, NSA
http://www.nsa.gov/ia/_files/app/Recommendations_for_Configuring_Adobe_Acrobat_Reader_XI_in_a_Windows_Environment.pdf
Enhanced security and protected mode are turned on by default in ARXI, but they are not locked, meaning a user can disable them through the GUI. Protected view is not turned on by default.

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



