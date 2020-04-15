#!/bin/bash
set -e

vagrant up --provision

echo "Waiting for answer on port 22..."
while ! timeout 1 nc -z 192.168.33.93 22; do
  sleep 0.2
done

ansible-galaxy install -r requirements.yml -p ./roles --force

ansible-playbook -i inventory.ini test.yml

ansible-playbook -i inventory.ini test.yml \
  | grep -q 'changed=0.*failed=0' \
  && (echo 'Idempotence test: pass' && exit 0) \
  || (echo 'Idempotence test: fail' && exit 1)

echo "Waiting for Minecraft server answer..."
(nc -z -w300 192.168.33.93 25565) && \
(echo 'Netcat test: pass' && exit 0) ||
(echo 'Netcat test: fail' && exit 1)

vagrant destroy -f
