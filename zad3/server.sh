#!/bin/bash
# Filip Czaplicki
function blue_echo {
  echo -e "\e[1;34m$1\e[0m"
}

# zmienić localhost na adres komputera K
K=localhost
U=fcbsk
STUDENTS=fc359081@students.mimuw.edu.pl

apt update
apt install openssh-server rsync sshfs -y
su guest -c "mkdir -p /home/guest/.ssh"

# deploy client.sh
blue_echo "Copying client.sh to $K"
scp client.sh guest@$K:~/client.sh
blue_echo "Executing client.sh @ $K as root!"
ssh -t guest@$K "sudo /home/guest/client.sh"

# Stwórz guestowi parę kluczy SSH, klucz prywatny chroniony hasłem.
su guest -c "ssh-keygen -N tajnehaslo -f /home/guest/.ssh/id_rsa"

# Umieść klucz publiczny na komputerze students.
blue_echo "Copying public key to $STUDENTS"
scp /home/guest/.ssh/id_rsa.pub $STUDENTS:~/server.pub
blue_echo "Adding public key to authorized_keys @ $STUDENTS"
ssh $STUDENTS "cat ~/server.pub >> ~/.ssh/authorized_keys && rm server.pub"

# wykonaj czynności umożliwiające U logowanie się z kluczem z K na S
scp $U@$K:/home/$U/.ssh/id_rsa.pub /home/guest/.ssh/client.pub
su guest -c "cat /home/guest/.ssh/client.pub >> /home/guest/.ssh/authorized_keys"
rm /home/guest/.ssh/client.pub

# Skonfiguruj klienta ssh tak, aby Twój login na students był używany
# jako domyślna nazwa użytkownika, gdy guest łączy się ze students
su guest -c "cat sshconfig >> /home/guest/.ssh/config"

# Skonfiguruj serwer SSH:
cp sshd_config /etc/ssh/sshd_config
service ssh restart

#  Ustaw w ten sposób montowanie, żebyś mógł obejrzeć w przeglądarce
# odpalonej na komputerze w labie BSK dowolny plik z katalogu
# /home/students/inf/PUBLIC/BSK/Obrazy z maszyny students
# (oczywiście tylko taki, do którego masz uprawnienia).
su guest -c "mkdir -p /home/guest/Obrazy && sshfs students:/home/students/inf/PUBLIC/BSK/Obrazy /home/guest/Obrazy"
# Używając programu rsync skopiuj (jako guest) ze
# students katalog /home/students/inf/PUBLIC/BSK.
# z = compress file data
su guest -c "rsync -avzhe ssh students:/home/students/inf/PUBLIC/BSK ."
