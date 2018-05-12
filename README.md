# ansible-docker-minecraft

Installs a minecraft server as docker container.
This role is only tested on ubuntu 16.04.

## System requirements

* Docker
* docker-compose
* Systemd

## Role requirements

* python-docker package

## Tasks

* Build docker image locally
* Create volume paths for docker container
* Create docker-compose file
* Setup systemd unit file
* Start/Restart service

## Role parameters

| Variable      | Type | Mandatory? | Default | Description           |
|---------------|------|------------|---------|-----------------------|
| version       | text | no         | 1.12.2  | Minecraft version     |
| volume        | text | no         | <empty> | Local path to minecraft server data volume |
| publish.port   | text | no        | <empty> | Port to be published (default minecraft server port is 25565) |
| publish.interface | text | no     | 0.0.0.0 | Interface to be published          |

## Usage

### requirements.yml

```
- name: install-minecraft
  src: https://github.com/flandiGT/ansible-docker-minecraft.git
  scm: git
```

### Example Playbook

Usage (without parameters):

    - hosts: servers
      roles:
         - { role: install-minecraft }

Usage (with parameters):

    - hosts: servers
      roles:
      - role: install-minecraft
        version: 1.12.2
        volume: /srv/minecraft/data
        publish:
          port: 25565
          interface: 0.0.0.0