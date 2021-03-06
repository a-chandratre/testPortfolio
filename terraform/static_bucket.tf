resource "aws_s3_bucket" "b" {
  bucket = var.website_bucket_name
  acl    = "public-read"

  tags = {
    Name = "testPortfolioBucket"
    Environment = "test"
  }

  website {
    index_document = "index.html"
    error_document = "error.html"
 }

 cors_rule {
   allowed_headers = ["*"]
   allowed_methods = ["PUT","POST"]
   allowed_origins = ["*"]
   expose_headers = ["ETag"]
   max_age_seconds = 3000
 }

 policy = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Sid": "PublicReadForGetBucketObjects",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::${var.website_bucket_name}/*"
    }
  ]
}
EOF

}

