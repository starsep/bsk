#!/bin/bash
# autor: Filip Czaplicki fc359081
PATTERN="s|(.*)[  ](.*)[  ](.*)"
while read -r line; do
    name=`echo $line | perl -pe "$PATTERN|\1 \2|"`
    email=`echo $line | perl -pe "$PATTERN|\3|"`
    ./cert.sh "$name" $email
done < users
