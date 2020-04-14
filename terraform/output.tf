output "website_endpoint" {
  description = "The URL for the Website."
  value       = "${aws_s3_bucket.b.website_endpoint}"
}
