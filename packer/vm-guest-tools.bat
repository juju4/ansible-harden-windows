:: Install 7zip
if not exist "C:\Windows\Temp\7z920-x64.msi" (
    powershell -Command "(New-Object System.Net.WebClient).DownloadFile('http://www.7-zip.org/a/7z920-x64.msi', 'C:\Windows\Temp\7z920-x64.msi')" <NUL
)
msiexec /qb /i C:\Windows\Temp\7z920-x64.msi

:: There needs to be Oracle CA (Certificate Authority) certificates installed in order
:: to prevent user intervention popups which will undermine a silent installation.
cmd /c certutil -addstore -f "TrustedPublisher" A:\oracle-cert.cer

if exist "C:\Users\vagrant\VBoxGuestAdditions.iso" (
    move /Y C:\Users\vagrant\VBoxGuestAdditions.iso C:\Windows\Temp
)

if not exist "C:\Windows\Temp\VBoxGuestAdditions.iso" (
    powershell -Command "(New-Object System.Net.WebClient).DownloadFile('http://download.virtualbox.org/virtualbox/5.1.22/VBoxGuestAdditions_5.1.22.iso', 'C:\Windows\Temp\VBoxGuestAdditions.iso')" <NUL
)

cmd /c ""C:\Program Files\7-Zip\7z.exe" x C:\Windows\Temp\VBoxGuestAdditions.iso -oC:\Windows\Temp\virtualbox"
certutil -addstore -f "TrustedPublisher" C:\Windows\Temp\virtualbox\cert\vbox-sha256-r3.cer
certutil -addstore -f "TrustedPublisher" C:\Windows\Temp\virtualbox\cert\vbox-sha256.cer
certutil -addstore -f "TrustedPublisher" C:\Windows\Temp\virtualbox\cert\vbox-sha1.cer
cmd /c C:\Windows\Temp\virtualbox\VBoxWindowsAdditions.exe /S
rd /S /Q "C:\Windows\Temp\virtualbox"


msiexec /qb /x C:\Windows\Temp\7z920-x64.msi
