# Create bucket

aws s3 mb s3://kendra-exp-667 --region us-east-1
aws s3 cp oliver-twist.pdf s3://kendra-exp-667 --region us-east-1

# Creating our Index

aws kendra create-index \
--name my-index \
--description "My Index" \
--role-arn arn:aws:iam::976193260990:role/KendraIndexRole

# Creating our Data Source 

aws kendra create-data-source \
--index-id 1d5a90ff-be31-4eca-b7ce-3a850599b800 \
--name my-data-source \
--role-arn arn:aws:iam::976193260990:role/KendraDataSourceRole \
--type S3 \
--configuration '{"S3Configuration": {"BucketName": "kendra-exp-667"}}' 

# Sync 

aws kendra start-data-source-sync-job \
--id 26972c4d-b3aa-4ae5-94b0-f08c759ad685 \
--index-id 1d5a90ff-be31-4eca-b7ce-3a850599b800

