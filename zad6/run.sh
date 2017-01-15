#!/bin/bash
# autor: Filip Czaplicki fc398051
./easyrsa init-pki
./easyrsa build-ca nopass
./easyrsa gen-dh
./cert_users.sh
