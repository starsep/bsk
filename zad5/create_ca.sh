#!/bin/bash
# autor: Filip Czaplicki fc359081
password=tajnehaslo
if [ -z "$OPENSSL" ]; then OPENSSL=openssl; fi
CADAYS="-days 3652"
REQ="$OPENSSL req $SSLEAY_CONFIG"
CA="$OPENSSL ca $SSLEAY_CONFIG"
VERIFY="$OPENSSL verify"
X509="$OPENSSL x509"
PKCS12="openssl pkcs12"
CATOP=demoCA
CAKEY=cakey.pem
CAREQ=careq.pem
CACERT=cacert.pem
C=PL
ST=Mazowieckie
L=Warsaw
O=MIMUW
OU=BSK
CN="BSK Certification Authority 16"
mail="ca@mimuw.edu.pl"
REQ_DATA="/C=$C/ST=$ST/L=$L/O=$O/OU=$OU/CN=$CN/emailAddress=$mail"
NEW="1"
if [ "$NEW" -o ! -f ${CATOP}/serial ]; then
  # create the directory hierarchy
  mkdir -p ${CATOP}
  mkdir -p ${CATOP}/certs
  mkdir -p ${CATOP}/crl
  mkdir -p ${CATOP}/newcerts
  mkdir -p ${CATOP}/private
  touch ${CATOP}/index.txt
fi
if [ ! -f ${CATOP}/private/$CAKEY ]; then
  echo "Making CA certificate ..."
  $REQ -new -keyout ${CATOP}/private/$CAKEY -passout pass:$password \
  -out ${CATOP}/$CAREQ -subj "$REQ_DATA"
  $CA -create_serial -out ${CATOP}/$CACERT $CADAYS -batch \
      -keyfile ${CATOP}/private/$CAKEY -selfsign \
      -extensions v3_ca -key $password -infiles ${CATOP}/$CAREQ
fi
