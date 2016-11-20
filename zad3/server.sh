#!/bin/bash
# zmienić localhost na adres komputera K
K=localhost
U=fcbsk
apt update
apt install openssh-server rsync sshfs -y
su guest -c "mkdir -p /home/guest/.ssh"
# Stwórz guestowi parę kluczy SSH, klucz prywatny chroniony hasłem.
su guest -c "ssh-keygen -N tajnehaslo -f /home/guest/.ssh/id_rsa"
# Umieść klucz publiczny na komputerze students.
scp /home/guest/.ssh/id_rsa.pub fc359081@students.mimuw.edu.pl:~/server.pub

# wykonaj czynności umożliwiające U logowanie się z kluczem z K na S
scp $U@$K:/home/$U/.ssh/id_rsa.pub /home/guest/.ssh/client.pub
cat /home/guest/.ssh/client.pub >> /home/guest/.ssh/authorized_keys
rm /home/guest/.ssh/client.pub
