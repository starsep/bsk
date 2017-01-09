#!/bin/bash
if [ $# != 2 ]; then
    echo "Usage"
    exit 1
fi

name=$1
email=$2

echo "Creating CA for $name with email $email"
