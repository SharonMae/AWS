# Create a bucket 

aws s3 mb s3://bucket-policy-2030

# Create a bucket policy

aws s3api put-bucket-policy --bucket bucket-policy-2030 --policy file://policy.json

# In the other account access the bucket 

touch shinyfile.txt
aws s3 cp shinyfile.txt
aws s3 ls s3://bucket-policy-2030

# Clean up 

aws s3 rm s3://bucket-policy-2030/shinyfile.txt
aws s3 rb s3://bucket-policy-2030