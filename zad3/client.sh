#!/bin/bash
function blue_echo {
  echo -e "\e[1;34m$1\e[0m"
}

U=fcbsk

apt update
apt install openssh-server rsync sshfs -y

blue_echo "Creating user $U."
adduser $U --home /home/$U/

blue_echo "Setting password for $U."
passwd $U

su $U -c "mkdir -p /home/$U/.ssh"

# Użytkownikowi U na maszynie K utwórz parę kluczy SSH
blue_echo "Creating ssh key for $U."
su $U -c "ssh-keygen -N tajnehaslo2 -f /home/$U/.ssh/id_rsa"
