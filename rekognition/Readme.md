# Create a bucket 

```sh
aws s3 mb s3://rekog-og-4050 --region us-east-1
aws s3 cp sasha.jpg s3://rekog-og-4050
```

# Run Ruby code 

```sh
bundle install
bundle exec ruby main.rb
```