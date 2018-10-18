#!/bin/bash
source ./vars.env
echo "checking if zone exists.."
aws route53 list-hosted-zones --query "HostedZones[?Name == '$DOMAIN.']" | jq -r '.[0].Id // empty' > zone.txt

if [ -s zone.txt ]
then
     echo "Zone exists skipping.."
else
     echo "creating hosted zone $DOMAIN..."
    aws route53 create-hosted-zone --name $DOMAIN --caller-reference pcf-$(date +%s) | jq -r .HostedZone.Id > zone.txt

fi
