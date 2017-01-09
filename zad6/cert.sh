#!/bin/bash
# autor: Filip Czaplicki fc359081
if [ $# != 2 ]; then
    echo "Usage"
    exit 1
fi

name=$1
email=$2

password=tajnehaslo
OPENSSL=openssl
REQ="$OPENSSL req $SSLEAY_CONFIG"
CA="$OPENSSL ca $SSLEAY_CONFIG"
DAYS="-days 1461"
C=PL
ST=Mazowieckie
L=Warsaw
O=MIMUW
OU=BSK
mkdir -p certs
CERT_FILE=certs/$email.pem
REQ_DATA="/C=$C/ST=$ST/L=$L/O=$O/OU=$OU/CN=$name/emailAddress=$email"
$REQ -new $DAYS -passout pass:$password \
     -keyout newkey.pem -out newreq.pem -subj "$REQ_DATA"
openssl rsa -passin pass:$password -in newkey.pem -out newkey.pem
$CA -batch -key $password $DAYS -policy policy_anything \
    -out $CERT_FILE -infiles newreq.pem
rm newkey.pem newreq.pem
echo "Creating certificate for $name with email $email in $CERT_FILE"
