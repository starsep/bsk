#!/bin/bash
class1=`seq 424201 424215`
class2=`seq 424401 424415`
class3=`seq 424601 424615`
function create_user {
		useradd $1 -d /home/$1 -m
		mkdir /home/$1/public
}
function create_class {
	for i in $@; do
		create_user
	done
}

create_class $class1

groupadd staff
useradd master
