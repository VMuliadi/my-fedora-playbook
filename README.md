## VMuliadi's Ansible Playbook
---
`fedora-fresh-install.yaml` file contains the entire packages and repositories that I used currently in my computer. I know some packages such docker should be replaced with podman. But I still keep it since I want to replicate the exact configuration and packages in my computer.

This repository also contains the playground to play with docker environment with ansible. Most of the example are using Vagrant. I'm not really familiar with Vagrant so I create my own environment. The fedora playground is registering your public key as `authorized_keys` so you don't need to set the password etc etc. You only need to run the `build.sh` file and you're good to go. I set 3 different containers to ensure the changes is idempotent and testing the state. Feel free to contribute or clone
