# Ansible K14 Kubernetes Deployment
This repository is an example of managing multi site kubernetes deployments with Ansible and
the [k14s][k14s] tools. This is a work in progress that I'm using to evaluate this deployment
work flow.

## Getting started
This repository uses several ansible roles as submodules. After cloning update the submodules
with:
```
git submodule update --init
```
To configure git to diff with sops you need to add the following to your .git/config file
```bash
[diff "sopsdiffer"]
    	textconv = sops -d
```
The differ is optional, and will requires [sops][sops] to be installed.

## Deploying
Each site and application folder has a script `deploy.sh` for deploying the application and
`diff.sh` which just prints any changes that would be deployed. The current configuration is
expecting the namesapce `kapp` to exist for storing application deployment history, it must be
created prior to using the current configurations. After that the applications will deploy
from their scripts, each application creates it's own namespace which is created as part of the
deployment.

## Deleting
Because the deployment uses kapp to deploy you can get a list of applications with `kapp list
-n kapp` or remove an application and everything it created with `kapp delete -a app-name -n
kapp`. Because the full deployment documents are present kubectl can be used without kapp if
preferred.

## Building
To build a new version, updating after modifying configuration, or pull in changes
from helm repositories run the main playbook with the provided cluster as the inventory.
```bash
ansible-playbook -i cluster.yaml main.yaml
```

## Submodules
[ansible_k14][ansible_k14]: This is the role that does most of the work and describes the work
flow for this deployment processes. The intention is to revision the configuration as well as
the final output so that each commit contains a full diff of what changed. See the ansible_k14
repository for more details.

The other three submodules [metallb][metallb], [traefik][traefik], and [bitwarden][bitwarden]
implement specific deployments utilizing the ansible_k14 deployment method.

## Dependencies
This repository is using all of the dependencies listed in the ansible_k14 role.
 * k14:
   * ytt
   * kapp
   * kbld
 * sops
 * helm3

 None of these roles install the dependencies they must exist on the system.

## Encryption
Site 2 is not using encryption, however site1 is using an encrypted site.yaml file. This
encryption is done via [sops][sops] and is configured in `.sops.yaml`. Sops encrypts the site
file and secrets files with the listed GPG key. For anyone else to use this example, only
site2 can be used or the site.yaml file for site1 must be updated with your encryption key.

[k14s]: https://k14s.io/
[sops]: https://github.com/mozilla/sops
[ansible_k14]: https://github.com/chris-sanders/ansible_k14
[metallb]: https://github.com/chris-sanders/k14_metallb
[traefik]: https://github.com/chris-sanders/k14_traefik
[bitwarden]: https://github.com/chris-sanders/k14_bitwarden
