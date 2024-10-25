resource "aws_s3_bucket" "shiny-terraform-bucket" {
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}