# Create a new bucket

```sh
aws s3api create-bucket --bucket acl-bucket-shiny-1020 --region us-east-1
```

# Turn of Block Public Access for ACLs

```sh
aws s3api put-public-access-block \
--bucket acl-bucket-shiny-1020 \
--public-access-block-configuration "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=true,RestrictPublicBuckets=true"
```

```sh
aws s3api get-public-access-block --bucket acl-bucket-shiny-1020 
```

# Change Bucket Ownership
# https://docs.aws.amazon.com/cli/latest/reference/s3api/put-bucket-ownership-controls.html

```sh
aws s3api put-bucket-ownership-controls \
--bucket acl-bucket-shiny-1020  \
--ownership-controls="Rules=[{ObjectOwnership=BucketOwnerPreferred}]"
```

# Change ACLs to allow for a user in another AWS Account 
# https://docs.aws.amazon.com/cli/latest/reference/s3api/put-bucket-acl.html

```sh
aws s3api put-bucket-acl \
--bucket acl-bucket-shiny-1020 \
--access-control-policy file:////workspace/AWS/s3/acl/policy.json

# Find the canonical ID as the root user or IAM user (on the other account)

```sh
aws s3api list-buckets \
--query Owner.ID \
--output text
```

# Access Bucket from other account

```sh
touch file.txt
aws s3 cp file.txt s3://acl-bucket-shiny-1020
aws s3 ls s3://acl-bucket-shiny-1020
```

# Clean up 

```sh
aws s3 rm s3://acl-bucket-shiny-1020/file.txt
aws s3 rb s3://acl-bucket-shiny-1020 
```