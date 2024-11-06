# Create a bucket

aws s3 mb s3://encryption-shiny-bucket

# Create a file and Put Object with encryption SS3-S3

echo "Leave me alone, I'm practicing" > hello.txt
aws s3 cp hello.txt s3://encryption-shiny-bucket

# Put Object with encryption of SS3-KMS

aws s3api put-object \
--bucket encryption-shiny-bucket \
--key hello.txt \
--body hello.txt \
--server-side-encryption "aws:kms" \
--ssekms-key-id ab708200-0074-4db2-9ad3-8ab2b9a12566

# Put Object with SSE-C [Failed Attempt]

export BASE64_ENCODED_KEY=$(openssl rand -base64 32)
echo $BASE64_ENCODED_KEY

export MD5_VALUE=$(echo $BASE64_ENCODED_KEY | md5sum | awk '{print $1}' | base64)
echo $MD5_VALUE

aws s3api put-object \
--bucket encryption-shiny-bucket \
--key hello.txt \
--body ./hello.txt \
--sse-customer-algorithm AES256 \
--sse-customer-key $BASE64_ENCODED_KEY \
--sse-customer-key-md5 $MD5_VALUE

# Put Object with SSE-C via aws s3

https://catalog.us-east-1.prod.workshops.aws/workshops/aad9ff1e-b607-45bc-893f-121ea5224f24/en-US/s3/serverside/ssec

openssl rand -out ssec.key 32

aws s3 cp hello.txt s3://encryption-shiny-bucket/hello.txt \
--sse-c AES256 \
--sse-c-key fileb://ssec.key

aws s3 cp s3://encryption-shiny-bucket/hello.txt hello.txt








