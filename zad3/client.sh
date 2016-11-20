#!/bin/bash
U=fcbsk
apt update
apt install openssh-server rsync sshfs -y
adduser $U --home /home/$U/
su $U -c "mkdir -p /home/$U/.ssh"
# Użytkownikowi U na maszynie K utwórz parę kluczy SSH
su $U -c "ssh-keygen -N tajnehaslo2 -f /home/$U/.ssh/id_rsa"
