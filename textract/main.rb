require 'aws-sdk-textract'

client = Aws::Textract::Client.new({
  document: { # required
    bytes: "data",
    s3_object: {
      bucket: "S3Bucket",
      name: "S3ObjectName",
      version: "S3ObjectVersion",
    },
  },
  feature_types: ["TABLES"], # required, accepts TABLES, FORMS, QUERIES, SIGNATURES, LAYOUT
  human_loop_config: {
    human_loop_name: "HumanLoopName", # required
    flow_definition_arn: "FlowDefinitionArn", # required
    data_attributes: {
      content_classifiers: ["FreeOfPersonallyIdentifiableInformation"], # accepts FreeOfPersonallyIdentifiableInformation, FreeOfAdultContent
    },
  },
  queries_config: {
    queries: [ # required
      {
        text: "QueryInput", # required
        alias: "QueryInput",
        pages: ["QueryPage"],
      },
    ],
  },
  adapters_config: {
    adapters: [ # required
      {
        adapter_id: "AdapterId", # required
        pages: ["AdapterPage"],
        version: "AdapterVersion", # required
      },
    ],
  }
})
