FROM fedora:32
LABEL maintainer=vmuliadi@max-metal.us
RUN dnf update; dnf install -y openssh-server && \
    ssh-keygen -A -q

# RUN mkdir /var/run/sshd && \
#     echo 'root:dummy_fedora' | chpasswd && \
#     sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
#     sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

COPY authorized_keys /root/.ssh/authorized_keys
RUN chmod 400 /root/.ssh/authorized_keys

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
