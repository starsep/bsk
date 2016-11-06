#!/bin/bash
useradd user2
cat time.conf >> /etc/security/time.conf
cp sudoers /etc/sudoers.d/user2-apt
cat access.conf >> /etc/security/access.conf
cat login >> /etc/pam.d/login
