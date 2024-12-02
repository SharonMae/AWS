# Create Bucket 

```sh
aws s3 mb s3://sf-shine-diamond-3587 --region us-east-1 
```



# Enable EventBridge Communication

```sh
aws s3api put-bucket-notification-configuration \
--region us-east-1 \
--bucket sf-shine-diamond-3587 \
--notification-configuration '
{
    "EventBridgeConfiguration": {

  }
}'
```



# Upload files 

```sh
aws s3 cp info.jpg s3://sf-shine-diamond-3587/info.jpg --region us-east-1 
```



# References

https://docs.aws.amazon.com/AmazonS3/latest/userguide/ev-events.html
https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-create-pattern-operators.html#eb-filtering-prefix-matching