# Create a bucket

aws s3 mb s3://encrypt-client-shiny-bucket 

# Run our SDK ruby script

bundle exec ruby encrypt.rb 

# Clean up 

aws s3 rm s3://encrypt-client-shiny-bucket/hello.txt
aws s3 rb s3://encrypt-client-shiny-bucket 