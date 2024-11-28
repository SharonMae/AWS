require 'aws-sdk-sqs'

client = Aws::SQS::Client.new

queue_url = "https://sqs.us-east-1.amazonaws.com/976193260990/sqs-standard-MyQueue-Dupg0LMQXuA5"

resp = client.send_message({
  queue_url: queue_url,
  message_body: "Hello Ruby!",
  delay_seconds: 1,
  message_attributes: {
    "Fruit" => {
      string_value: "Apple",
      data_type: "String"
    }
  }
})