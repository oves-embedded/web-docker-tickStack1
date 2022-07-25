#!/bin/bash
set -x
#doesn't currently work using varaibles
# cacert = './ca.crt'
# cakey = './ca.key'

dir="client-certs"
echo "Creating Client Key"
openssl genrsa -out client.key 2048
echo "Creating certificate request"
openssl req -new -out client.csr -key client.key
echo "Signing client certificate with CA key"
echo "The CA key File must be in the server-certs folder"
# openssl x509 -req -in client.csr -CA ./ca.crt -CAkey ./ca.key -CAcreateserial -out client.crt -days 720
openssl x509 -req -in client.csr -CA ./ca.crt -CAkey ./ca.key -CAcreateserial -out client.crt -days 3650 -sha256

if [ -d $dir ];then
 echo "directory Exists"
else
 mkdir $dir
fi

mv client.* $dir
