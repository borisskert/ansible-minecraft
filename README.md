# ansible-docker-minecraft

Installs a minecraft server as docker container.
This role is only tested on ubuntu 16.04.

## System requirements

* Docker
* Systemd

## Role requirements

* python-docker package

## Tasks

* Build docker image locally
* Create volume paths for docker container
* Setup systemd unit file
* Start/Restart service

## Role parameters

| Variable      | Type | Mandatory? | Default | Description           |
|---------------|------|------------|---------|-----------------------|
| version       | text | no         | latest version | Minecraft version     |
| volume        | text | no         | <empty>        | Local path to minecraft server data volume |
| publish.port   | text | no        | <empty>        | Port to be published (default minecraft server port is 25565) |
| publish.interface | text | no     | 0.0.0.0        | Interface to be published                                     |
| accept_eula       | boolean | no  | no             | You need to agree to the EULA in order to run the server.     |

## Usage

### requirements.yml

```yaml
- name: install-minecraft
  src: https://github.com/borisskert/ansible-minecraft.git
  scm: git
```

### Example Playbook

Usage (without parameters):

```yaml
    - hosts: servers
    - role: ansible-minecraft
      accept_eula: yes
```

Usage (with parameters):

```yaml
    - hosts: servers
    - role: ansible-minecraft
      version: 1.12.2
      volume: /srv/docker/minecraft/data
      accept_eula: yes
      publish:
        port: 25565
        interface: 0.0.0.0
```
