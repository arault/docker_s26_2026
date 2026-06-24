FROM debian:13

# Variables
ARG user=camille
ARG keypub_file=./tp_build_ed25519.pub

# Installation serveur SSH
RUN apt update
RUN apt install -y openssh-server

# Création utilisateur camille et 
# configuration authentification avec clé SSH
RUN useradd -m -s /bin/bash ${user}
RUN mkdir -p /home/${user}/.ssh
RUN chmod 700 /home/${user}/.ssh
COPY ${keypub_file} /home/${user}/.ssh/authorized_keys
RUN chmod 600 /home/${user}/.ssh/authorized_keys
RUN chown -R ${user}:${user} /home/${user}/.ssh

EXPOSE 22

CMD [ "/usr/sbin/sshd", "-D" ]