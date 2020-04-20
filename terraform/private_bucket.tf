resource "aws_s3_bucket" "private-bucket" {
  bucket = "testbuild.achandratre"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

