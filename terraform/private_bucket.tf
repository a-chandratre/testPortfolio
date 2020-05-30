resource "aws_s3_bucket" "private-bucket" {
  bucket = var.build_bucket_name 
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

