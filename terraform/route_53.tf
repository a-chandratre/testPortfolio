data "aws_route53_zone" "test-site" {
        name = "achandratre.info."
        private_zone = false
}

resource "aws_route53_record" "test-site" {
  zone_id = data.aws_route53_zone.test-site.zone_id
  name    = "test-site.achandratre.info"
  type    = "A"

  alias {
    name = aws_s3_bucket.b.website_domain 
    zone_id = aws_s3_bucket.b.hosted_zone_id
    evaluate_target_health = false
  }
}
