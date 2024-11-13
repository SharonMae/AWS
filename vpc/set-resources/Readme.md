# first create a VPC

aws ec2 create-vpc --cidr-block 10.0.0.0/16 --amazon-provided-ipv6-cidr-block



# create a subnet

aws ec2 create-subnet --vpc-id vpc-034c19a8abe1d3d10 --ipv6-cidr-block 2600:1f1c:e24:9c00::/64 --cidr-block 10.0.2.0/24

aws ec2 modify-subnet-attribute --subnet-id subnet-00845183077c6eb1f --enable-dns64



# create an egress only internet gateway

aws ec2 create-egress-only-internet-gateway --vpc-id vpc-034c19a8abe1d3d10



# create an IGW (internet gateway)

aws ec2 create-internet-gateway


# attach an IGW to the VPC

aws ec2 attach-internet-gateway --internet-gateway-id igw-0deaedc7b3f0eb5c8 --vpc-id vpc-034c19a8abe1d3d10

#

aws ec2 allocate-address

# create nat 

aws ec2 create-nat-gateway --subnet-id subnet-00845183077c6eb1f --allocation-id eipalloc-0f37b2b6744696539

# create route table 

aws ec2 create-route-table --vpc-id vpc-034c19a8abe1d3d10

# 

aws ec2 create-route --route-table-id rtb-077d6c4e3fb1538e2 --destination-ipv6-cidr-block "::/0" --egress-only-internet-gateway eigw-090e2b5228dd65530

#

aws ec2 create-route --route-table-id rtb-077d6c4e3fb1538e2 --destination-ipv6-cidr-block 64:ff9b::/96 --nat-gateway-id 