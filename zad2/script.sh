#!/bin/bash
useradd user2
cat time.conf >> /etc/security/time.conf
cp sudoers /etc/sudoers.d/user2-apt
