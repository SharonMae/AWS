# Create Secret via Secrets Manager

```sh
aws secretsmanager create-secret \
--name MyRdsPassword \
--description "My rds password" \
--secret-string "{\"password\":\"mypassword\"}"
``` 

# Install Postgres Client on EC2 Instance (Session Manager)

sudo dnf install postgresql15.x86_64 postgresql15-server -y

# Connection String URL (Session Manager)

psql postgresql://sharonmae:mypassword@rds-basic-rdsinstance-ekk4xeoo2qjd.c1kcoeyc00dk.us-east-1.rds.amazonaws.com:5432/mydatabase

