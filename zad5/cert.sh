#!/bin/bash
# autor: Filip Czaplicki fc359081
LAB_ID=$(echo -n "$(hostname)" | tail -c 2)
password=tajnehaslo
if [ -z "$OPENSSL" ]; then OPENSSL=openssl; fi
REQ="$OPENSSL req $SSLEAY_CONFIG"
CA="$OPENSSL ca $SSLEAY_CONFIG"
DAYS="-days 1461"
C=PL
ST=Mazowieckie
L=Warsaw
O=MIMUW
OU=BSK
CN="bsklab$LAB_ID.mimuw.edu.pl" #CN="localhost"
mail="bsk@mimuw.edu.pl"
REQ_DATA="/C=$C/ST=$ST/L=$L/O=$O/OU=$OU/CN=$CN/emailAddress=$mail"
$REQ -new $DAYS -passout pass:$password \
     -keyout newkey.pem -out newreq.pem -subj "$REQ_DATA"
echo "Request is in newreq.pem, private key is in newkey.pem"
openssl rsa -passin pass:$password -in newkey.pem -out newkey.pem

$CA -batch -key $password $DAYS -policy policy_anything \
    -out newcert.pem -infiles newreq.pem
cat newcert.pem
echo "Signed certificate is in newcert.pem"
