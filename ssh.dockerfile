aws ec2-instance-connect send-ssh-public-key \
--instance-id i-0c73c63b612cfd987 \
--instance-os-user ec2-user \
--availability-zone us-west-1b \
--ssh-public-key file://ec2-connect.pub

ssh -i ec2-connect ec2-user@54.151.44.125 

# https://aws.amazon.com/blogs/compute/new-using-amazon-ec2-instance-connect-for-ssh-access-to-your-ec2-instances/