#!/usr/bin/make -f
CURDIR=`pwd`
DOCKER_TAG="fedora_dummy"
DOCKER_INSPECT="docker inspect fedora_dummy"
DOCKER_RUN="docker run -d -P --name fedora_dummy"

test:
	make init
	cp $${HOME}/.ssh/id_rsa.pub $(CURDIR)/dummy_target/authorized_keys
	docker build -t $(DOCKER_TAG) -f $(CURDIR)/dummy_target/Dockerfile .
	docker rm -f $(DOCKER_TAG)_{1} || true
	$(DOCKER_RUN)_{1} $(DOCKER_TAG)
	@echo -e "[fedora_target]\n" >> $(CURDIR)/hosts
	docker inspect fedora_dummy_{1} -f '{{ .NetworkSettings.IPAddress }}')" >> $(CURDIR)/hosts
	ansible-playbook fedora-fresh-install.yaml

apply:
	@echo -e "[fedora_target]\n127.0.0.1" > $(CURDIR)/hosts
	mkdir -p /root/.ssh  # create directory for root SSH auth.
	cat $${HOME}/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
	chmod 400 /root/.ssh/authorized_keys
	ansible-playbook fedora-fresh-install.yaml

cleanup:
	rm $(CURDIR)/hosts  # ansible hosts file.

	docker stop $(DOCKER_TAG)_{1}
	docker rm $(DOCKER_TAG)_{1}
	docker rmi $(DOCKER_TAG)

init:
	sed -i "s|{{fedora_username}}|$(shell whoami)|g" $(CURDIR)/fedora-fresh-install.yaml
	sed -i "s|{{release_version}}|$(shell cat /etc/redhat-release | awk '{print $$3}')|g" $(CURDIR)/dummy_target/Dockerfile
	sed -i "s|{{release_version}}|$(shell cat /etc/redhat-release | awk '{print $$3}')|g" $(CURDIR)/fedora-fresh-install.yaml