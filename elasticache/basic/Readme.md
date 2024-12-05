# Create serverless Cache

```sh
aws elasticache create-serverless-cache \
--serverless-cache-name my-og-cache-ab-3456 \
--engine redis \
--major-engine-version 7
```

# Install Redis Client (Ubuntu)

```sh
sudo apt-get install redis -y 
```

# Connect to instance

```sh
redis-cli -h my-og-cache-ab-3456-sjprfc.serverless.use1.cache.amazonaws.com
```