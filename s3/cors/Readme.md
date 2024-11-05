# Create a bucket

```sh
aws s3 mb s3://cors-shiny-bucket-2030
```

# Change block public access

```sh
aws s3api put-public-access-block \
--bucket cors-shiny-bucket-2030 \
--public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```

# Create a bucket policy

```sh
aws s3api put-bucket-policy --bucket cors-shiny-bucket-2030 --policy file://bucket-policy.json
```

# Turn on static website hosting

```sh
aws s3api put-bucket-website --bucket cors-shiny-bucket-2030 --website-configuration file://website.json
```

# Upload our index.html file and include a resource that would be cross-origin 

```sh
aws s3 cp index.html s3://cors-shiny-bucket-2030
```

# View the website and see if the index.html is there 

http://cors-shiny-bucket-2030.s3-website.us-west-2.amazonaws.com

# Apply a CORS policy