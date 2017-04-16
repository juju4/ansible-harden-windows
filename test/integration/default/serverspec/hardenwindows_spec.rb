## https://github.com/mizzy/serverspec/blob/master/WINDOWS_SUPPORT.md
## http://shawinnes.com/testing-windows-infrastructure-with-serverspec/
## http://kitchen.ci/blog/test-kitchen-windows-test-flight-with-vagrant
## TARGET_HOST=192.168.2.109 rake spec

require 'serverspec'
require 'winrm'

set :backend, :winrm
set :os, :family => 'windows'

user = 'vagrant'
pass = 'vagrant'
endpoint = "http://#{ENV['TARGET_HOST']}:5985/wsman"

## WARN  WinRM::WinRMWebService : WinRM::WinRMWebService#run_powershell_script is deprecated. Use WinRM::CommandExecutor#run_powershell_script instead
## WARN  WinRM::WinRMWebService : [WinRM] connection failed, terminating (#<WinRM::WinRMHTTPTransportError: Unable to parse WinRM response: Missing end tag for 'META' (got "HEAD")
## https://github.com/jvoorhis/vagrant-serverspec/issues/24
winrm = ::WinRM::WinRMWebService.new(endpoint, :ssl, :user => user, :pass => pass, :basic_auth_only => true)
winrm.set_timeout 300 # 5 minutes max timeout for any operation
Specinfra.configuration.winrm = winrm

describe file('c:/windows') do
  it { should be_directory }
  it { should be_readable }
  it { should_not be_writable.by('Everyone') }
end

describe package('EMET') do
  it { should be_installed}
end

describe port(139) do
  it { should be_listening }
end

describe windows_registry_key('HKEY_USERS\S-1-5-21-1319311448-2088773778-316617838-32407\Test MyKey') do
  it { should exist }
  it { should have_property('string value') }
  it { should have_property('binary value', :type_binary) }
  it { should have_property('dword value', :type_dword) }
  it { should have_value('test default data') }
  it { should have_property_value('multistring value', :type_multistring, "test\nmulti\nstring\ndata") }
  it { should have_property_value('qword value', :type_qword, 'adff32') }
  it { should have_property_value('binary value', :type_binary, 'dfa0f066') }
end

describe command('& "powershell -Command \"get-eventlog -list\""') do
  its(:stdout) { should match /Max/ }
  its(:stdout) { should match /308,400.*Security/ }
  its(:stdout) { should match /308,400.*System/ }
  its(:stdout) { should match /308,400.*Application/ }
end
describe command('& "wevtutil gl Application"') do
  its(:stdout) { should match /maxSize:/ }
  its(:stdout) { should_not match /Failed to/ }
end

describe command('& "ftype htafile"') do
  its(:stdout) { should match /notepad.exe/ }
  its(:stdout) { should_not match /mshta.exe/ }
end

