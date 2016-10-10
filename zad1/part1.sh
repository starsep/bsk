#!/bin/bash
class1=`seq 424201 424215`
class2=`seq 424401 424415`
class3=`seq 424601 424615`
function create_user {
	id -u $1 &> /dev/null || useradd $1 -d /home/$1 -m
	public=/home/$1/public
	mkdir -p $public
	setfacl -m u:master:rwx $public
	setfacl -d -m u:master:rwx $public
	getfacl $public
}
function create_class {
	for i in $@; do
		create_user $i
	done
}

create_class $class1
create_class $class2
create_class $class3

# create group staff if doesn't exist
groupadd -f staff

# create user master if doesn't exist
id -u master &> /dev/null || useradd master
