# Create CloudWatch Log and Stream 

aws logs create-log-group --log-group-name mycloudtrail

aws logs create-log-stream --log-group-name mycloudtrail --log-stream-name main

# Update trail for CloudWatch Logs

aws cloudtrail update-trail \
--name MyTrail \
--cloud-watch-logs-log-group-arn arn:aws:logs:us-east-1:976193260990:log-group:mycloudtrail:* \
--cloud-watch-logs-role-arn arn:aws:iam::976193260990:role/MyCloudTrail2CloudWatchRole