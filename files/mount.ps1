# https://stackoverflow.com/questions/29222905/mapping-a-network-drive-on-a-windows-guest-using-ansible
param([string]$share)
$share | Out-File c:\ansible-test\debug.txt
New-PSDrive -Name "K" -PSProvider FileSystem -Root "$share" -Persist

