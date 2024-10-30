terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.30.0"
    }
  }
}

resource "aws_s3_bucket" "og-default-bucket" {
}

resource "aws_s3_bucket_object" "object" {
  bucket = resource.aws_s3_bucket.og-default-bucket
  key    = "myfile.txt"
  source = "myfile.txt"
}