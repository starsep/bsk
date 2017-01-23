#!/bin/bash
sudo /sbin/iptables -N VPN_LOCAL
sudo /sbin/iptables -A VPN_LOCAL --src 192.168.0.0/16 -p tcp --destination-port 1194 -j ACCEPT
sudo /sbin/iptables -A VPN_LOCAL -p tcp --destination-port 1194 -j REJECT
