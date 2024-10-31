# Create a new s3 bucket 

```md 
aws s3 mb s3://checksums-examples-ab-1309
```

# Create a file that will we do a checksum on

```
echo "Hi guys" > myfile.txt
```

# Get a checksum of a file for md5

```md
md5sum myfile.txt
# 1a16eef94be7299bb4769b46d9f0cf68  myfile.txt
```

# Upload our file and look at its etag 

```
aws s3 cp myfile.txt s3://checksums-examples-ab-1309
aws s3api head-object --bucket checksums-examples-ab-1309 --key myfile.txt
```

# Lets upload a file with a different kind of checksums 

Using a scripts
```sh
bundle exec ruby crc.rb
```

Using a library
```sh
sha1sum myfile.txt
```

```sh
aws s3api put-object \
--bucket="checksums-examples-ab-1309" \
--key="myfilesha1.txt" \ 
--body="myfile.txt" \
--checksum-algorithm="SHA1" \
--checksum-sha1="b9f2166674a3b64daf081f34158e3267ca64c582"
```