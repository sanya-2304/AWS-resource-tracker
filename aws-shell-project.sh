ssh -i ~/aws-shell-key-value.pem ubuntu@3.107.179.224
aws configure
vim ws-resource-tracker.sh
#!/bin/bash
set -x
######
#AUTHOR: SANYA DODA
#DATE: 14/12/24
#
#VERSION : V1
######

#aws s3
#list of s3 buckets
aws s3 ls
#aws ec2
#list of ec2 instances
aws ec2 describe-instances

#aws lambda
#list lambda
aws lambda list-functions
#aws IAM users
#list IAM users
aws iam list-users

chmod 777 ws-resource-tracker.sh 

./aws-resource-tracker.sh | more