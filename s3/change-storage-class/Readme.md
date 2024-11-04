# Create a bucket 

aws s3 mb s3://class-shiny-og-1020

# Create a file 

echo "Hi everyone, I'm practicing" > hello.txt
aws s3 cp hello.txt s3://class-shiny-og-1020 

# To change class storage via CLI | https://docs.aws.amazon.com/cli/latest/reference/s3/cp.html

aws s3 cp hello.txt s3://class-shiny-og-1020 --storage-class STANDARD_IA 

# Clean up 

aws s3 rm s3://class-shiny-og-1020/hello.txt
aws s3 rb s3://class-shiny-og-1020