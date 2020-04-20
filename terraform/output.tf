output "website_endpoint" {
  description = "The URL for the Website."
  value       = "${aws_s3_bucket.b.website_endpoint}"
}

output "cloudfront_distribution_domain_name" {
  description = "Cloudfront distribution domain name"
  value       = aws_cloudfront_distribution.s3_distribution.domain_name
}

output "fqdn" {
  description = "The fqdn URL for the Website."
  value       = aws_route53_record.test-site.fqdn
}

output "bucket_name" {
  description = "Static bucket to copy index file"
  value       = aws_s3_bucket.b.bucket
}
