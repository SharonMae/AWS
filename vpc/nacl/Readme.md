# Create NACL

```sh
aws ec2 create-network-acl --vpc-id vpc-03021246a87d745d4
```

# Get AMI for Amazon Linux 2

```sh
aws ec2 describe-images \
--owners amazon \
--filters "Name=name,Values=amzn2-ami-hvm-*-x86_64-gp2" "Name=architecture,Values=x86_64" \
--region us-west-1 \
--query "Images[0].ImageId" \
--output text
```
