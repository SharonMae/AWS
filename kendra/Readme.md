# Create bucket

aws s3 mb s3://kendra-exp-667 --region us-east-1

# Creating our Index

aws kendra create-index \
--name my-index \
--description "My Index" \
--role-arn arn:aws:iam::976193260990:role/KendraIndexRole

# Creating our Data Source 

aws kendra create-data-source \
--index-id \
--name \
--role-arn \
--type S# \
--configuration '{"S3Configuration:{"BucketName": ""}"}'
