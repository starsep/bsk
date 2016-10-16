#!/bin/bash
function create_user {
	username=$1
	class=$2
	id -u $username &> /dev/null || useradd $username -d /home/$username -m
	usermod -a -G $class $username
	home=/home/$username
	public=/home/$username/public
	mkdir -p $public
	chown $username $public
	chgrp $class $public
	chmod 0700 $home
	setfacl -m u:master:rwx $public
	setfacl -d -m u:master:rwx $public
	setfacl -m g:staff:rx $public
	setfacl -d -m g:staff:rwx $public
	setfacl -m other::0 $public
	setfacl -d -m other::0 $public
}

function create_class {
	class=$1
	groupadd -f $class
	shift 1
	for i in $@; do
		create_user $i $class
	done
}

# create group staff if it doesn't exist
groupadd -f staff

# create user master if it doesn't exist
id -u master &> /dev/null || useradd master

create_class klasa1e `seq 424201 424215`
create_class klasa2e `seq 424401 424415`
create_class klasa3e `seq 424601 424615`
