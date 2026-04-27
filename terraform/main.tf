provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "bad_bucket" {
  bucket = "checkov-devsecops-lab-public-bucket-demo"
}

resource "aws_s3_bucket_public_access_block" "bad_bucket_public_access" {
  bucket = aws_s3_bucket.bad_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_security_group" "bad_sg" {
  name        = "bad-security-group"
  description = "Security group intentionally open for Checkov lab"

  ingress {
    description = "Allow SSH from anywhere - intentionally vulnerable"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}