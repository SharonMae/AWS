# Create a bucket

aws s3 mb s3://metadata-og-bucket-1020

# Create a new file 

echo "Hello Mars" > hello.txt

# Upload file with metadata

aws s3api put-object --bucket metadata-og-bucket-1020 --key hello.txt --body hello.txt --metadata Planet=Mars

# Get Metadata through head object

aws s3api head-object --bucket metadata-og-bucket-1020 --key hello.txt 
