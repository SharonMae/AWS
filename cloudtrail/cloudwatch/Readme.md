# Create CloudWatch Log and Stream 

aws logs create-log-group --log-group-name mycloudtrail

# Update trail for CloudWatch Logs

aws cloudtrail update-trail \
--name MyTrail \
--cloud-watch-logs-log-group-arn \
--cloud-watch-logs-role-arn 