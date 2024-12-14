#cp /path/to/your/keyfile.pem ~/
#chmod 600 ~/keyfile.pem
#ssh -i ~/keyfile.pem ubuntu@<public_ipv4_address>

ssh -i ~/aws-shell-key-value.pem ubuntu@<your-public-ipv4-address>
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
#aws ec2 describe-instances

#instance id of aws ec2 instance
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'

#aws lambda
#list lambda
aws lambda list-functions
#aws IAM users
#list IAM users
aws iam list-users

chmod 777 ws-resource-tracker.sh 

./aws-resource-tracker.sh | more

#The correct jq command to extract specific information from the aws ec2 describe-instances output depends on the structure of the JSON data you're working with.

# The InstanceId is inside the Instances array, which is within the Reservations array. Use the following jq command to retrieve all InstanceId values:
 aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'



# Here is how to integrate the modified script with a cron job :: 
# 1. Open the crontab configuration by running:
# crontab -e
# 2. Add the following line to the crontab file:
# 0 20 * * * /path to your script.sh 
# (Replace /path to script.sh with the actual path of your script)
# The cron job entry 0 20 * * * specifies that the script will run at 20:00 (8:00 PM) every day.
# 3. Save and exit the crontab editor.  
