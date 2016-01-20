#!/bin/bash
set -e
KEYNAME=$1

openssl genrsa 2048 > $KEYNAME.key
openssl req -new -x509 -nodes -sha1 -days 3650 -key $KEYNAME.key > $KEYNAME.cert
openssl x509 -noout -fingerprint -text < $KEYNAME.cert > $KEYNAME.info
cat $KEYNAME.cert $KEYNAME.key > $KEYNAME.pem
chmod 400 $KEYNAME.key $KEYNAME.pem
