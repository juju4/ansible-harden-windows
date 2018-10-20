$env:PATH="C:\OpenSSL-Win64\bin;$env:PATH"
Import-Module $env:APPVEYOR_BUILD_FOLDER\test\appveyor\WinrmAppveyor.psm1
New-ClientCertificate $env:winrm_user $env:APPVEYOR_BUILD_FOLDER
$env:user_cert_thumb = (Import-pfxCertificate -FilePath $env:user_pfx -CertStoreLocation Cert:\LocalMachine\root).Thumbprint
Import-pfxCertificate -FilePath $env:user_pfx -CertStoreLocation Cert:\LocalMachine\TrustedPeople
$env:winrm_cert = (New-SelfSignedCertificate -DnsName localhost -CertStoreLocation cert:\localmachine\my).Thumbprint

winrm create winrm/config/Listener?Address=*+Transport=HTTPS "@{Hostname=`"localhost`";CertificateThumbprint=`"$($env:winrm_cert)`"}"

New-WinrmUserCertificateMapping $env:user_cert_thumb
