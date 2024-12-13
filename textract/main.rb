require 'aws-sdk-textract'

client = Aws::Textract::Client.new
bucket = 'textract-exp-4565'
name = 'tax-doc.png'
resp = client.analyze_document({
  document: { # required
    bytes: "data",
    s3_object: {
      bucket: bucket,
      name: name#
      # version: "S3ObjectVersion",
    },
  },
  # required, accepts TABLES, FORMS, QUERIES, SIGNATURES, LAYOUT
  feature_types: ["TABLES"], 
})
