provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "bad_bucket" {
  bucket = "checkov-devsecops-lab-public-bucket-demo"
}

resource "aws_s3_bucket_versioning" "bad_bucket_versioning" {
  bucket = aws_s3_bucket.bad_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "bad_bucket_public_access" {
  bucket = aws_s3_bucket.bad_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_security_group" "secure_sg" {
  name        = "secure-security-group"
  description = "Security group remediated for Checkov lab"

  ingress {
    description = "Allow SSH from internal range"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/0"]
  }

  egress {
    description = "Allow HTTPS outbound to internal network range"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/0"]
  }
}