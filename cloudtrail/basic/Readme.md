# Create a bucket for cloudtrail logs

aws s3 mb s3://my-cloudtrail-og-2030

# Create bucket policy to allow cloud trail to put to bucket 

aws s3api put-bucket-policy --bucket my-cloudtrail-og-2030 --policy file://bucket-policy.json

# Create Trail 

aws cloudtrail create-trail \
--name MyTrail \
--s3-bucket-name my-cloudtrail-og-2030 \
--region us-east-1

# Start Logging 

aws cloudtrail start-logging --name MyTrail