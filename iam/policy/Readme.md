# Convert to json

The command 
```sh
yq -o json policy.yml > policy.json 
```

The bash script
```sh
./convert
```

# Create a IAM Policy

```sh
aws iam create-policy \
--policy-name my-shiny-og-policy \
--policy-document file://policy.json
```

# Attach Policy to user 

```sh
aws iam attach-user-policy \
--policy-arn arn:aws:iam::976193260990:policy/my-shiny-og-policy \
--user-name amministratore 
```