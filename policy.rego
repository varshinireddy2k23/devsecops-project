deny[msg] {
  input.resource_type == "aws_s3_bucket"
  input.acl == "public-read"
}