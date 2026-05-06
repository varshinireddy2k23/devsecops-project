# checkov:skip=CKV_AWS_18: Logging not required for demo
# checkov:skip=CKV_AWS_144: Cross-region replication not required
# checkov:skip=CKV2_AWS_61: Lifecycle config not required
# checkov:skip=CKV2_AWS_62: Event notifications not required
# checkov:skip=CKV_AWS_145: Using AES256 instead of KMS for demo

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "devsecops-demo-bucket-12345"
}

# ✅ Block public access
resource "aws_s3_bucket_public_access_block" "block" {
  bucket = aws_s3_bucket.example.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# ✅ Enable versioning
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.example.id

  versioning_configuration {
    status = "Enabled"
  }
}

# ✅ Enable encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.example.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}