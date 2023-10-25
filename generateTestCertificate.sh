#!/bin/bash

# 設定情報の取得
COUNTRY=$(jq -r '.countryName' setting.json)
STATE=$(jq -r '.stateOrProvinceName' setting.json)
LOCALITY=$(jq -r '.localityName' setting.json)
ORGANIZATION=$(jq -r '.organizationName' setting.json)
ORGANIZATIONAL_UNIT=$(jq -r '.organizationalUnitName' setting.json)
COMMON_NAME=$(jq -r '.commonName' setting.json)
EMAIL=$(jq -r '.emailAddress' setting.json)

outDir="export"
outDirTest="export1"

## ルートCAの作成
#openssl genrsa -out $outDir/rootCA.key 2048
#openssl req -x509 -new -nodes -key $outDir/rootCA.key -sha256 -days 365 -out $outDir/rootCA.pem -subj "/C=$COUNTRY/ST=$STATE/L=$LOCALITY/O=$ORGANIZATION/OU=$ORGANIZATIONAL_UNIT/CN=$COMMON_NAME/emailAddress=$EMAIL"
#
## サーバー証明書の作成
#openssl genrsa -out $outDir/server.key 2048
#openssl req -new -key $outDir/server.key -out $outDir/server.csr -subj "/C=$COUNTRY/ST=$STATE/L=$LOCALITY/O=$ORGANIZATION/OU=$ORGANIZATIONAL_UNIT/CN=$COMMON_NAME/emailAddress=$EMAIL"
#openssl x509 -req -in $outDir/server.csr -CA $outDir/rootCA.pem -CAkey $outDir/rootCA.key -CAcreateserial -out $outDir/server.crt -days 365 -sha256
#
## クライアント証明書の作成
#openssl genrsa -out $outDir/client.key 2048
#openssl req -new -key $outDir/client.key -out $outDir/client.csr -subj "/C=$COUNTRY/ST=$STATE/L=$LOCALITY/O=$ORGANIZATION/OU=$ORGANIZATIONAL_UNIT/CN=$COMMON_NAME/emailAddress=$EMAIL"
#openssl x509 -req -in $outDir/client.csr -CA $outDir/rootCA.pem -CAkey $outDir/rootCA.key -CAcreateserial -out $outDir/client.crt -days 365 -sha256

#openssl genrsa -out $outDir/ca.key 2048
#openssl req -x509 -new -nodes -key $outDir/ca.key -sha256 -days 365 -out $outDir/ca.crt -subj "/C=$COUNTRY/ST=$STATE/L=$LOCALITY/O=$ORGANIZATION/CN=ROO"
#
#openssl genrsa -out $outDir/server.key 2048
#openssl req -new -key $outDir/server.key -out $outDir/server.csr -subj "/C=$COUNTRY/ST=$STATE/L=$LOCALITY/O=$ORGANIZATION/CN=$COMMON_NAME"
#openssl x509 -req -in $outDir/server.csr -CA $outDir/ca.crt -CAkey $outDir/ca.key -CAcreateserial -out $outDir/server.crt -days 365 -sha256
#
#openssl genrsa -out $outDir/client.key 2048
#openssl req -new -key $outDir/client.key -out $outDir/client.csr -subj "/C=$COUNTRY/ST=$STATE/L=$LOCALITY/O=$ORGANIZATION/CN=$COMMON_NAME"
#openssl x509 -req -in $outDir/client.csr -CA $outDir/ca.crt -CAkey $outDir/ca.key -CAcreateserial -out $outDir/client.crt -days 365 -sha256
#
#
#
#openssl req -new -newkey rsa:2048 -days 365 -nodes -x509 -subj "/C=US/ST=MyState/L=MyTown/O=MyOrganization/CN=ROOT" -keyout ca_key.pem -out ca_certificate.pem
#openssl genrsa -out server_key_traditional.pem 2048
#openssl pkcs8 -topk8 -in server_key_traditional.pem -inform pem -out server_key.pem -outform pem -nocrypt
#openssl req -new -subj "/C=US/ST=MyState/L=MyTown/O=MyOrganization/CN=localhost" -key server_key.pem -out server.csr
#chmod 600 server_key.pem
#openssl x509 -req -CA ca_certificate.pem -CAkey ca_key.pem -in server.csr -out server_certificate.pem -days 365 -CAcreateserial
#chown oraclegraph:oraclegraph server_key.pem


#openssl req -new -newkey rsa:2048 -days 365 -nodes -x509 \
#    -subj "/C=JP/ST=Tokyo/L=Minato-ku/O=Latona Inc/OU=IT Department/CN=localhost" \
#    -keyout export/server.key -out export/server.crt \
#    -config <(cat /etc/ssl/openssl.cnf <(printf "\n[SAN]\nsubjectAltName=DNS:localhost")) \
#    -extensions SAN

#openssl genrsa -out $outDir/client.key 2048
#openssl req -new -key $outDir/client.key -out $outDir/client.csr -subj "/C=$COUNTRY/ST=$STATE/L=$LOCALITY/O=$ORGANIZATION/OU=$ORGANIZATIONAL_UNIT/CN=$COMMON_NAME/emailAddress=$EMAIL"
#openssl x509 -req -in $outDir/client.csr -CA $outDir/rootCA.pem -CAkey $outDir/rootCA.key -CAcreateserial -out $outDir/client.crt -days 365 -sha256




#openssl genrsa -out $outDir/ca.key 2048
#openssl req -x509 -new -nodes -key $outDir/ca.key -sha256 -days 365 -out $outDir/ca.crt -subj "/C=$COUNTRY/ST=$STATE/L=$LOCALITY/O=$ORGANIZATION/CN=ROO"
#
#openssl genrsa -out $outDir/server.key 2048
#openssl req -new -key $outDir/server.key -out $outDir/server.csr -subj "/C=$COUNTRY/ST=$STATE/L=$LOCALITY/O=$ORGANIZATION/CN=$COMMON_NAME"
#openssl x509 -req -in $outDir/server.csr -CA $outDir/ca.crt -CAkey $outDir/ca.key -CAcreateserial -out $outDir/server.crt -days 365 -sha256
#
#openssl genrsa -out $outDir/client.key 2048
#openssl req -new -key $outDir/client.key -out $outDir/client.csr -subj "/C=$COUNTRY/ST=$STATE/L=$LOCALITY/O=$ORGANIZATION/CN=$COMMON_NAME"
#openssl x509 -req -in $outDir/client.csr -CA $outDir/ca.crt -CAkey $outDir/ca.key -CAcreateserial -out $outDir/client.crt -days 365 -sha256
#

openssl req -new -newkey rsa:2048 -days 365 -nodes -x509 \
    -subj "/C=$COUNTRY/ST=$STATE/L=$LOCALITY/O=$ORGANIZATION/OU=$ORGANIZATIONAL_UNIT/CN=$COMMON_NAME/emailAddress=$EMAIL" \
    -keyout $outDir/ca.key -out $outDir/ca.crt \
    -config <(cat /etc/ssl/openssl.cnf <(printf "\n[SAN]\nsubjectAltName=DNS:localhost")) \
    -extensions SAN

openssl genrsa -out $outDir/server.key 2048
openssl req -new -key $outDir/server.key \-out $outDir/server.csr -subj "/C=$COUNTRY/ST=$STATE/L=$LOCALITY/O=$ORGANIZATION/CN=$COMMON_NAME" \
        -config <(cat /etc/ssl/openssl.cnf <(printf "\n[SAN]\nsubjectAltName=DNS:localhost")) \
        -extensions SAN
openssl x509 -req -in $outDir/server.csr -CA $outDir/ca.crt -CAkey $outDir/ca.key -out $outDir/server.crt -days 365 -sha256

#openssl req -new -newkey rsa:2048 -days 365 -nodes -x509 \
#    -subj "/C=$COUNTRY/ST=$STATE/L=$LOCALITY/O=$ORGANIZATION/OU=$ORGANIZATIONAL_UNIT/CN=$COMMON_NAME/emailAddress=$EMAIL" \
#    -CA $outDir/ca.crt -CAkey $outDir/ca.key -CAcreateserial \
#    -keyout $outDir/client.key -out $outDir/client.crt \
#    -config <(cat /etc/ssl/openssl.cnf <(printf "\n[SAN]\nsubjectAltName=DNS:localhost")) \
#    -extensions SAN
#
#openssl req -new -newkey rsa:2048 -days 365 -nodes -x509 \
#    -subj "/C=$COUNTRY/ST=$STATE/L=$LOCALITY/O=$ORGANIZATION/OU=$ORGANIZATIONAL_UNIT/CN=$COMMON_NAME/emailAddress=$EMAIL" \
#    -keyout $outDirTest/server.key -out $outDirTest/server.crt \
#    -config <(cat /etc/ssl/openssl.cnf <(printf "\n[SAN]\nsubjectAltName=DNS:localhost")) \
#    -extensions SAN
