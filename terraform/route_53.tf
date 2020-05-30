#    name = aws_s3_bucket.b.website_domain 
#    zone_id = aws_s3_bucket.b.hosted_zone_id

data "aws_route53_zone" "test-site" {
     name = var.route53_zone
     private_zone = false
}

resource "aws_route53_record" "test-site" {
  zone_id = data.aws_route53_zone.test-site.zone_id
  name    = var.route53_record
  type    = "A"

  alias {
    name = aws_cloudfront_distribution.s3_distribution.domain_name
    zone_id = aws_cloudfront_distribution.s3_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}
