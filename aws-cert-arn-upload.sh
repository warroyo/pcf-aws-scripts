#!/bin/bash

source ./vars.env

echo "deleting keypair of it exists.."
aws ec2 delete-key-pair --key-name pcf-admin-key
echo "creating key pair pcf-admin-key.pem ..."
aws ec2 create-key-pair --key-name pcf-admin-key --query 'KeyMaterial' --output text > pcf-admin-key.pem


echo "generating cert"

#generate
./openssl.cnf.sh

openssl req -sha256 -new -key pcf-admin-key.pem -out csr.pem -config openssl.cnf -subj "/C=$COUNTRY/ST=$STATE/L=$CITY/O=$COMPANY/OU=IT Department"

openssl x509 -req -days 365 -in csr.pem -signkey pcf-admin-key.pem -out pcf-certificate-${DOMAIN}.pem

if [ "$CERT_UPLOAD" != "false" ]; then
echo "deleting existing cert..."
aws iam delete-server-certificate --server-certificate-name pcf-certificate-${DOMAIN}
echo "uploading cert ...."
aws iam upload-server-certificate --server-certificate-name pcf-certificate-${DOMAIN} --certificate-body file://pcf-certificate-${DOMAIN}.pem --private-key file://pcf-admin-key.pem | jq -r .ServerCertificateMetadata.Arn > arn.txt
fi
