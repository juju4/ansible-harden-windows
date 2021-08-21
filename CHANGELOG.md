# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Github Action - Work In Progress
- IE - disable legacy jscript engine
- repository: pre-commit config

### Changed
- appveyor: update ansible pypi to 4.3.0/3.4.0
- repository: gitignore, lint

### Removed
- travis-ci

## [1.3.0] - 2020-03-27

### Added
- Github Action - Work In Progress
- IE - disable legacy jscript engine

### Changed
- defaults: harden flash off - to remove as Flash EOL
- github action: lint as separated workflow
- appveyor: update ansible pypi to 2.10.7/2.9.19/3.1.0, enforce cryptography 3.3.2 (no rust)
- repository: lint
- s/travis-ci.org/travis-ci.com/

## [1.2.0] - 2020-07-19

### Added
- AMSI registry setting
- disable remote management of Service Control Manager
- References

## [1.1.0] - 2020-02-01

### Changed
- WSH: separate task file, TrustPolicy option to enforce signed
- lint
- external references

### Removed
- github.com/caseysmithrc/MimkatzCollider: repository 404

## [1.0.0] - 2019-07-20

### Changed
- Github: rename tags to match semantic versioning: 0.7.0, 0.7.1, 0.8.0
- Appveyor: use cygwin python36-cryptography
- Appveyor: update ansible to 2.8.1/2.7.11/2.6.17
- Travis: default to xenial and python3
- more linting

## [0.9.0] - 2019-02-17

### Added
- testing speculative: add SpecuCheck
- DeviceGuard CodeIntegrity: microsoft recommended policy
- packer: Azure configuration

### Changed
- Heavy lint following galaxy new rules following adoption of ansible-lint
https://groups.google.com/forum/#!topic/ansible-project/ehrb6AEptzA
https://docs.ansible.com/ansible-lint/rules/default_rules.html
https://github.com/ansible/ansible-lint
- Galaxy dependency naming evolution (juju4.redhat_epel, harden_sysctl...)
- appveyor: update ansible to 2.7.5/2.6.11/2.5.14
- Shadow Copy: disable vssadmin.exe on Win10
- Hardened UNC paths: RequirePrivacy option
- Custom LSASS AuditLevel
- appveyor: update ansible to 2.7.0/2.6.5/2.5.10

## [v0.8] - 2018-06-17

### Added
- TaskScheduler hardening (optional)
- STIG/IADgov settings enforcement (mostly general stuff, registry-based)
- SAMRi10 hardening remote
- Cryptography settings: enable TLS1.2, disable SSL2-3
- test/full: test suite with extra ansible roles
- testing: Intel-SA-00086 Detection Tool for Intel ME
- testing: IAD Secure-Host-Baseline
- testing: speculative execution
- testing: mimikatz and variants
- win10b1709 ASR options
- Disable sticky keys
- AppLocker template
- packer: Virtualbox, Vmware configurations
- Windows Event Forwarding (WEF) configuration (without GPO)
- Configure Windows Error Reporting (WER)
- Disable Admin Shares

### Changed
- test/full: disable nxlog - upstream chocolatey package issue
- harden_win_acl: defaults disabled
- Win privilege: ansible syntax for Nobody = 'Null SID'
- Cortana: disabled
- Review permissions for ansible and inspec folders

### Removed
- Move to separate ansible roles: juju4.win-ad-monitor, win-services, win-powershell, win-applocker, win-osquery...

## [v0.7b] - 2017-01-30

### Changed
- fix some path escaping, bad merge

## [v0.7] - 2017-01-30

### Added
- Initial commit on Github, include simple travis, kitchen and vagrant tests
