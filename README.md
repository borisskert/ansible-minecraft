# ansible-docker-minecraft

Installs a minecraft server as docker container.

## System requirements

* Python 3
* Docker
* Systemd

## Role requirements

* python-docker package

## Tested operating systems

* Ubuntu
  * 16.04 (xenial)
  * 18.04 (bionic)

## Tasks

* Build docker image locally
* Create volume paths for docker container
* Setup systemd unit file
* Start/Restart service

## Role parameters

| Variable      | Type | Mandatory? | Default | Description           |
|---------------|------|------------|---------|-----------------------|
| minecraft_version | text | no         | latest | Used Minecraft version  |
| openjdk_version   | text | no         | latest | Used OpenJDK version. See [openjdk8-jre package for alpine](https://pkgs.alpinelinux.org/packages?name=openjdk8-jre&branch=edge) |
| alpine_version    | text | no         | latest | Used version of the `alpine` Docker base image   |
| volume         | text | yes       | <empty>          | Local path to minecraft server data volume |
| publish.port   | text | no        | <empty>          | Port to be published (default minecraft server port is 25565) |
| publish.interface | text | no     | 0.0.0.0          | Interface to be published                                     |
| accept_eula       | boolean | no  | no               | You need to agree to the EULA in order to run the server.     |

## Usage

### requirements.yml

```yaml
- name: install-minecraft
  src: https://github.com/borisskert/ansible-minecraft.git
  scm: git
```

### Example Playbook

Minimal:

```yaml
    - hosts: servers
    - role: ansible-minecraft
      volume: /srv/minecraft/data
      accept_eula: yes
```

All parameters:

```yaml
    - hosts: servers
    - role: install-minecraft
      minecraft_version: 1.12.2
      alpine_version: 3.11.5
      openjdk_version: 8.242.08-r0
      volume: /srv/minecraft/data
      accept_eula: yes
      force_build: no
      publish:
        port: 25565
        interface: 0.0.0.0
```
