#!/bin/bash
set -e
source ./vars.env


./create-hosted-zone.sh

./aws-cert-arn-upload.sh

echo "here are your outputs:"

echo "zone id: $(cat zone.txt)"
echo "cert ARN: $(cat arn.txt)"
echo "private key: $(cat pcf-admin-key.pem)"
echo "cert: $(cat pcf-certificate-${DOMAIN}.pem)"