#!/bin/sh
cp ~/.ssh/id_rsa.pub authorized_keys
docker build -t fedora_dummy .
docker rm -f fedora_dummy_{1,2,3} || true
docker run -d -P --name fedora_dummy_1 fedora_dummy
docker run -d -P --name fedora_dummy_2 fedora_dummy
docker run -d -P --name fedora_dummy_3 fedora_dummy

docker inspect fedora_dummy_1 -f '{{ .NetworkSettings.IPAddress }}'
docker inspect fedora_dummy_2 -f '{{ .NetworkSettings.IPAddress }}'
docker inspect fedora_dummy_3 -f '{{ .NetworkSettings.IPAddress }}'

if [ $? -eq 0 ]; then rm authorized_keys; fi
