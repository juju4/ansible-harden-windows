[![Build Status - Master](https://travis-ci.org/juju4/ansible-harden-windows.svg?branch=master)](https://travis-ci.org/juju4/ansible-harden-windows)
[![Build Status - Devel](https://travis-ci.org/juju4/ansible-harden-windows.svg?branch=devel)](https://travis-ci.org/juju4/ansible-harden-windows/branches)
# Windows harden ansible role

Ansible role to harden windows system.

* install EMET, Powershell v5
* LSA hardening, review javascript/hta file association
* review log settings, enabling command-line, powershell and WMI logging
* try to harden adobe reader, flash
* basic application firewall blocks

ATTENTION! It's a work in progress and some tasks are not working as expected.

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
    - harden-windows
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

Pending

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


## FAQ

Extra read
* Applocker hardening
https://dfir-blog.com/2016/01/03/protecting-windows-networks-applocker/
Powershell focus:
https://www.sixdub.net/?p=367
http://www.scip.ch/en/?labs.20150507
https://www.sysadmins.lv/blog-en/powershell-50-and-applocker-when-security-doesnt-mean-security.aspx




## License

BSD 2-clause

