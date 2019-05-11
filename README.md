[![Build Status - Master](https://travis-ci.org/juju4/ansible-harden-windows.svg?branch=master)](https://travis-ci.org/juju4/ansible-harden-windows)
[![Build Status - Devel](https://travis-ci.org/juju4/ansible-harden-windows.svg?branch=devel)](https://travis-ci.org/juju4/ansible-harden-windows/branches)(Syntax Only)

[![Appveyor - Master](https://ci.appveyor.com/api/projects/status/kkr0w77mu5rrm014?svg=true)](https://ci.appveyor.com/project/juju4/ansible-harden-windows)
![Appveyor - Devel](https://ci.appveyor.com/api/projects/status/kkr0w77mu5rrm014/branch/devel?svg=true)

# Windows harden ansible role

Ansible role to harden windows system.

* install EMET, Powershell v5
* LSA hardening, review javascript/hta file association
* review log settings, enabling command-line, powershell and WMI logging
* try to harden adobe reader, flash
* basic application firewall blocks

ATTENTION! It's a work in progress.
Pay attention to test carefully role and fit to your context unless you want to lock yourself.
This role is continuous development as security landscape is constantly evolving.

Legal disclaimer!
Depending on settings, very detailed activity log can be created.
Only apply to your own system else for most countries (ex: Europe), user must have been warned and agreed (usually through internal policy, code of conduct...)

## Requirements & Dependencies

### Ansible
It was tested on the following versions:
 * 2.0 (min required for Win)
 * 2.2
 * 2.3 (required for testing part - become_method: runas)
 * 2.4 ~~(required since s/include:/include_tasks:/)~~
 * 2.5

### Operating systems

Tested with vagrant on Ubuntu 14.04 and 16.04.
Only tested against Win10 and Ws2016 Evaluation.
Follow
http://kitchen.ci/blog/test-kitchen-windows-test-flight-with-vagrant/

## Example Playbook

Just include this role in your list.
For example

```
- host: all
  roles:
    - juju4.harden-windows
```

Run
```
$ ansible -i inventory -m win_ping win --ask-pass
$ ansible-playbook -i inventory --limit win site.yml
```

## Variables

Sample. See defaults/main.yml for full scope

```
harden_eventlogs_maxsize: 314572
```

## Continuous integration

This role has a travis basic test (for github, syntax check only) and a Vagrantfile (test/vagrant).

```
$ cd /path/to/roles/juju4.harden-windows/test/vagrant
$ vagrant up
$ vagrant provision
$ vagrant destroy
$ ansible -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory -m win_ping -e ansible_winrm_server_cert_validation=ignore -e ansible_ssh_port=55986 all
```

Role has also a packer config which allows to create image for virtualbox and vmware based on https://github.com/jonashackt/ansible-windows-docker-springboot/, https://github.com/boxcutter/windows and https://github.com/gusztavvargadr/packer.
Plan for about 50GB of free disk space and 1h to build one image.
```
$ cd /path/to/packer-build
$ cp -Rd /path/to/juju4.harden-windows/packer .
## update packer-*.json with your current absolute ansible role path for the main role
$ cd packer
$ packer build *.json
$ packer build -only=virtualbox-iso *.json
## if you want to enable extra log
$ PACKER_LOG_PATH="packerlog.txt" PACKER_LOG=1 packer build *.json
# for Azure, ensure you download and setup connection plugin. Default is for v2.6, Sep 2018
$ . ~/.azure/credentials
$ packer build azure-windows_server_2016.json
$ packer build -var-file=variables.json azure-windows_server_2016.json
```

See also
* https://github.com/hashicorp/packer/tree/master/examples/ansible/connection-plugin
* https://www.packer.io/docs/provisioners/ansible.html#winrm-communicator
* https://www.packer.io/docs/templates/user-variables.html
* https://docs.microsoft.com/en-us/windows-hardware/customize/desktop/unattend/

## Troubleshooting & Known issues

* Ensure you follow ansible guide to be able to connect
http://docs.ansible.com/ansible/intro_windows.html

* 'The property 'changed' cannot be found on this object. Verify that the property exists and can be set.'
https://github.com/ansible/ansible/issues/17139
Ansible bug in 2.1.1, ok in 2.0.1 and 2.1.2

* AdobeReader chocolatey install issue

* most windows module in ansible are not idempotent

* Ansible win_firewall_rule module does not seem mature enough currently, especially if using non-english windows.
Consider it experimental

* ```ConnectTimeout: HTTPSConnectionPool(host='192.168.1.1', port=5986): Max retries exceeded with url: /wsman (Caused by ConnectTimeoutError(<requests.packages.urllib3.con)```
https://github.com/ansible/ansible/issues/16460

* packer build sometimes fails
```
==> virtualbox-iso: Deleting output directory...
Build 'virtualbox-iso' errored: Error uploading VirtualBox version: Error restoring file from $env:TEMP\winrmcp-affcbaf4-440e-481f-7ea4-16ae1b0b7121.tmp to .vbox_version: restore operation returned code=16001
```
Restarting is usually enough.
Normally addressed per https://github.com/jonashackt/ansible-windows-docker-springboot/commit/89ad651fb7a79ee98b12ea0d5718727a5926ef9e
```
==> virtualbox-iso: Deleting output directory...
Build 'virtualbox-iso' errored: Error uploading VirtualBox version: Error restoring file from $env:TEMP\winrmcp-a6ac9db9-7493-4131-788d-23bfef94da3d.tmp to .vbox_version: unknown error Post http://127.0.0.1:3233/wsman: EOF
```
Same, restarting is usually enough.
https://github.com/StefanScherer/packer-windows/issues/21
It also sometimes stall on ` Waiting for WinRM to become available...`
==> just stop it and restart

* ```Cannot dot-source this command because it was defined in a different language mode. To invoke this command without importing its contents, omit the '.' operator.```
It happens with Applocker enabled and non-administrator user because of Constrained Powershell. See https://www.sysadmins.lv/blog-en/powershell-50-and-applocker-when-security-doesnt-mean-security.aspx

* [ansible 2.4: playbook with include_tasks: earn all memory and dramaticaly slowly #30441](https://github.com/ansible/ansible/issues/30441)

## FAQ

Extra read
* Applocker hardening
  * https://dfir-blog.com/2016/01/03/protecting-windows-networks-applocker/
  * Powershell focus: https://www.sixdub.net/?p=367, http://www.scip.ch/en/?labs.20150507, https://www.sysadmins.lv/blog-en/powershell-50-and-applocker-when-security-doesnt-mean-security.aspx

* Securing Windows Workstations: Developing a Secure Baseline: https://adsecurity.org/?p=3299

* [Validation with inspec](https://github.com/juju4/windows-baseline)(Thanks to dev-sec project!)

* [SecurityWithoutBorders HardenTools](https://github.com/securitywithoutborders/hardentools)

## Thanks

Thanks to the many people who share books, tweets, scripts or other OSINT that contributed directly or not inside this role.
Infosec community is GREAT!

## License

BSD 2-clause

