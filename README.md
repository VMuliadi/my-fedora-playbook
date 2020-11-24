## VMuliadi's Ansible Playbook
---
`fedora-fresh-install.yaml` file contains the entire packages and repositories that I used currently in my computer. I know some packages such docker should be replaced with podman. But I still keep it since I want to replicate the exact configuration and packages in my computer.

This repository also contains the playground to play with docker environment with ansible. Most of the example are using Vagrant in the internet and I'm not really familiar with Vagrant so I create my own environment. The fedora playground is registering your public key in `${HOMEDIR}/.ssh/id_rsa.pub` as `authorized_keys` so you don't need to set the password etc etc.
`make test` if you want to set it running in docker environment for testing.
`make cleanup` to cleanup the SSH key and remove the docker environment.
`make apply` to apply it on your Fedora workstation.

 Feel free to contribute or clone.