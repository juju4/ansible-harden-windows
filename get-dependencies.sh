#!/bin/sh
## one script to be used by travis, jenkins, packer...

umask 022

rolesdir=$(dirname $0)/..
[ $APPVEYOR ] && rolesdir=/etc/ansible/roles

[ ! -d $rolesdir/juju4.win-firewall ] && git clone https://github.com/juju4/ansible-win-firewall $rolesdir/juju4.win-firewall
[ ! -d $rolesdir/juju4.win-eventlog ] && git clone https://github.com/juju4/ansible-win-eventlog $rolesdir/juju4.win-eventlog
[ ! -d $rolesdir/juju4.win-audit ] && git clone https://github.com/juju4/ansible-win-audit $rolesdir/juju4.win-audit
[ ! -d $rolesdir/juju4.win-powershell ] && git clone https://github.com/juju4/ansible-win-powershell $rolesdir/juju4.win-powershell
[ ! -d $rolesdir/juju4.win-sysmon ] && git clone https://github.com/juju4/ansible-win-sysmon $rolesdir/juju4.win-sysmon
[ ! -d $rolesdir/juju4.win-applocker ] && git clone https://github.com/juju4/ansible-win-applocker $rolesdir/juju4.win-applocker
[ ! -d $rolesdir/juju4.win-services ] && git clone https://github.com/juju4/ansible-win-services $rolesdir/juju4.win-services
[ ! -d $rolesdir/juju4.win-msoffice ] && git clone https://github.com/juju4/ansible-win-msoffice $rolesdir/juju4.win-msoffice
[ ! -d $rolesdir/juju4.win-aptsimulator ] && git clone https://github.com/juju4/ansible-win-aptsimulator $rolesdir/juju4.win-aptsimulator
[ ! -d $rolesdir/juju4.win-atomic-red-team ] && git clone https://github.com/juju4/ansible-win-atomic-red-team $rolesdir/juju4.win-atomic-red-team
[ ! -d $rolesdir/juju4.win-osquery ] && git clone https://github.com/juju4/ansible-win-osquery $rolesdir/juju4.win-osquery
[ ! -d $rolesdir/juju4.win-ad-monitor ] && git clone https://github.com/juju4/ansible-win-ad-monitor $rolesdir/juju4.win-ad-monitor

## don't stop build on this script return code
true

