resource "aws_s3_bucket" "b" {
  bucket = "achandratre-test-portfolio"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
