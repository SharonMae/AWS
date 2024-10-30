terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.30.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "default" {
  # Specify bucket properties here as needed
}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.default.id  # Reference the bucket resource here
  key    = "myfile.txt"
  source = "myfile.txt"

  etag = filemd5("myfile.txt")
}
