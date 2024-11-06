# Create a bucket

aws s3 mb s3://encryption-shiny-bucket

# Create a file 

echo "Leave me alone, I'm practicing" > hello.txt
aws s3 cp hello.txt s3://encryption-shiny-bucket

# Put Object with encryption of KMS

aws s3api put-object \
--bucket encryption-shiny-bucket \
--key hello.txt \
--body hello.txt \
--server-side-encryption aws:kms \

# --server-side-encryption commands in AWS CLI Command Reference 
