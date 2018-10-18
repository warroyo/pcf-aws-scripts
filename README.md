# PCF AWS Scripts

Collection of scripts for completing pre-reqs in AWS as well as handy scripts.

# Usage

you can either run the scripts directly or leverage the docker container that has the aws cli installed as well as any other dependencies. 

## Setup

1. create a user in aws and get the ACCESS_KEY and SECRET_ACCESS_KEY
2. copy the `vars.env.example` to `vars.env` file and replace the vars with your values
3. run the docker container using the command below or export your AWS env vars 
4. run the script of your choosing
   
## Scripts

* `aws-cert-arn-upload` - creates an aws key pair and generates a cert and upload it to aws.
* `create-hosted-zone` - creates a hosted zone if one doesn't already exist.
* `aws-prereqs` - combines the above two scripts and outputs neccessary fields.

## Using Docker

`docker run -it --rm -e "AWS_SECRET_ACCESS_KEY=<your-secret-key>" -e "AWS_ACCESS_KEY_ID=<your-key>" -e "AWS_DEFAULT_REGION=us-east-1" warroyo90/pcf-aws-scripts:1.0.0`

this will enter you into a bash prompt in the container and you can run any scripts you need.