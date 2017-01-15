#!/bin/bash
# autor: Filip Czaplicki fc359081
if [ $# != 2 ]; then
    echo "Usage: $0 name email"
    exit 1
fi

name=$1
email=$2

./easyrsa build-client-full "$name <$email>" nopass

echo "Creating certificate for $name with email $email."
