provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "devsecops-demo-bucket-12345"

  acl = "public-read"  # ❌ intentionally insecure for demo
}