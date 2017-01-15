#!/bin/bash
# autor: Filip Czaplicki fc398051
./easyrsa init-pki
./easyrsa build-ca nopass
./easyrsa gen-dh
./cert_users.sh
./easyrsa build-server-full server nopass
# sudo openvpn server.conf &
ln -s pki/private/Filip\ Czaplicki\ \<fc359081@students.mimuw.edu.pl\>.key client.key
ln -s pki/issued/Filip\ Czaplicki\ \<fc359081@students.mimuw.edu.pl\>.crt client.crt
./easyrsa gen-crl  
