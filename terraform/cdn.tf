# AWS Cloud
locals {
  s3_origin_id = "myS3Origin"
}

# Find a certificate issued by (not imported into) ACM
data "aws_acm_certificate" "example" {
  domain      = "*.achandratre.info"
  types       = ["AMAZON_ISSUED"]
  most_recent = true
}

resource "aws_cloudfront_distribution" "s3_distribution" {
    origin {
        domain_name = aws_s3_bucket.b.bucket_regional_domain_name
        origin_id = local.s3_origin_id
 
    }
    # By default, show index.html file
    default_root_object = "index.html"
    enabled = true
    comment             = "Managed by Terraform"

    aliases = ["test-site.achandratre.info"]

    # If there is a 404, return index.html with a HTTP 200 Response
    custom_error_response {
        error_caching_min_ttl = 30
        error_code = 404
        response_code = 200
        response_page_path = "/index.html"
    }


    default_cache_behavior {
        allowed_methods = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
        cached_methods = ["GET", "HEAD"]
        target_origin_id = local.s3_origin_id

        # Forward all query strings, cookies and headers
        forwarded_values {
           query_string = true
           cookies {
              forward = "none"
           }
        }
        viewer_protocol_policy = "allow-all"
        min_ttl = 0
        default_ttl = 3600
        max_ttl = 86400
    }

    # Distributes content to US and Europe
    price_class = "PriceClass_100"

    # Restricts who is able to access this content
    restrictions {
        geo_restriction {
            # type of restriction, blacklist, whitelist or none
            restriction_type = "none"
        }
    }

    # SSL certificate for the service.
    viewer_certificate {
        acm_certificate_arn = "arn:aws:acm:us-east-1:018200839170:certificate/82231101-07b8-4a81-a26f-15987ec8fd44"
        ssl_support_method = "vip"
    }
}
