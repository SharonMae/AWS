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

# Deleting Policies 

```sh
aws iam delete-policy-version --policy-arn arn:aws:iam::976193260990:policy/my-shiny-og-policy --version-id v1
aws iam delete-policy-version --policy-arn arn:aws:iam::976193260990:policy/my-shiny-og-policy --version-id v2
aws iam delete-policy-version --policy-arn arn:aws:iam::976193260990:policy/my-shiny-og-policy --version-id v3
aws iam delete-policy-version --policy-arn arn:aws:iam::976193260990:policy/my-shiny-og-policy --version-id v4
```