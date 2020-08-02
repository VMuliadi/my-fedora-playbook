#!/bin/bash
CURDIR=$(pwd)
: ${test:="false"}

if [[ ${test} == "true" ]]; then
  cd dummy_target
  chmod +x build.sh
  bash build.sh
  cd ${CURDIR}
fi

ansible-playbook fedora-fresh-install.yaml
