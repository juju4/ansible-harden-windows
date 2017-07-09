[![Build Status - Master](https://travis-ci.org/juju4/ansible-harden-windows.svg?branch=master)](https://travis-ci.org/juju4/ansible-harden-windows)
[![Build Status - Devel](https://travis-ci.org/juju4/ansible-harden-windows.svg?branch=devel)](https://travis-ci.org/juju4/ansible-harden-windows/branches)(Syntax Only)
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

### Operating systems

Tested with vagrant on Ubuntu 14.04.
Only tested against Win10 Evaluation.
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

Role has also a packer config which allows to create image for virtualbox and vmware based on https://github.com/jonashackt/ansible-windows-docker-springboot/ and https://github.com/boxcutter/windows.
Plan for about 50GB of free disk space and 1h to build one image.
```
$ cd /path/to/packer-build
$ cp -Rd /path/to/juju4.harden-windows/packer .
## update packer-*.json with your current absolute ansible role path for the main role
$ cd packer
$ packer build packer-*.json
$ packer build -only=virtualbox-iso packer-*.json
## if you want to enable extra log
$ PACKER_LOG_PATH="packerlog.txt" PACKER_LOG=1 packer build packer-*.json
```

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


## FAQ

Extra read
* Applocker hardening
  * https://dfir-blog.com/2016/01/03/protecting-windows-networks-applocker/
  * Powershell focus: https://www.sixdub.net/?p=367, http://www.scip.ch/en/?labs.20150507, https://www.sysadmins.lv/blog-en/powershell-50-and-applocker-when-security-doesnt-mean-security.aspx

* Securing Windows Workstations: Developing a Secure Baseline: https://adsecurity.org/?p=3299

* [Validation with inspec](https://github.com/juju4/windows-baseline)(Thanks to dev-sec project!)

## License

BSD 2-clause

