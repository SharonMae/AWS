# Create NACL

```sh
aws ec2 create-network-acl --vpc-id vpc-03021246a87d745d4
```

# Add entry

```sh
aws ec2 create-network-acl-entry \
    --network-acl-id acl-000a2911e558c33c4 \
    --ingress \
    --rule-number 90 \
    --protocol -1 \
    --port-range From=0,To=65535 \
    --cidr-block 93.44.193.3/32 \
    --rule-action deny
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

