[![Build Status](https://travis-ci.org/juju4/ansible-harden-windows.svg?branch=master)](https://travis-ci.org/juju4/ansible-harden-windows)
# Windows harden ansible role

Ansible role to harden windows system.

* install EMET, Powershell v5
* LSA hardening, review javascript/hta file association
* review log settings, enabling command-line, powershell and WMI logging
* try to harden adobe reader, flash

It's a work in progress and some tasks are not working as expected.

Pay attention to test carefully role and fit to your context unless you want to lock yourself.
This role is continuous work in progress as security landscape is constantly evolving.

## Requirements & Dependencies

### Ansible
It was tested on the following versions:
 * 2.0 (required for Win)

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
$ ansible-playbook -i inventory --limit win10 site.yml
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



## License

BSD 2-clause

