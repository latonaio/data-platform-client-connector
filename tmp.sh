#!/bin/bash

COUNTRY=$(jq -r '.countryName' setting.json)
STATE=$(jq -r '.stateOrProvinceName' setting.json)
LOCALITY=$(jq -r '.localityName' setting.json)
ORGANIZATION=$(jq -r '.organizationName' setting.json)
ORGANIZATIONAL_UNIT=$(jq -r '.organizationalUnitName' setting.json)
COMMON_NAME=$(jq -r '.commonName' setting.json)
EMAIL=$(jq -r '.emailAddress' setting.json)

outDir="export"
outDirTest="export1"

openssl genrsa -out $outDir/ca.key 2048
openssl req -new -x509 -days 365 -key $outDir/ca.key -subj "/C=IN/ST=KA/L=BL/O=MyOrg, Inc./CN=MyOrg Root CA" -out $outDir/ca.crt

openssl req -newkey rsa:2048 -nodes -keyout $outDir/server.key -subj "/C=IN/ST=KA/L=BL/O=MyOrg, Inc./CN=localhost" -out $outDir/server.csr

openssl x509 -req -extfile <(printf "subjectAltName=DNS:localhost") -days 365 -in $outDir/server.csr -CA $outDir/ca.crt -CAkey $outDir/ca.key -CAcreateserial -out $outDir/server.crt
