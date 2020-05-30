# Region to set up ece in
variable "aws_region" {
  default = "us-east-1"
}

variable "website_bucket_name" {
  default = "test-site.achandratre.info"
}

variable "route53_zone" {
  default = "achandratre.info."
}

variable "route53_record" {
  default = "test-site.achandratre.info"
}

variable "build_bucket_name" {
  default = "testbuild.achandratre"
}

variable "lambda_filename" {
  default = "lambda_function.py"
}

variable "lambda_function_name" {
  default = "lambda_handler"
}

variable "lambda_handler" {
  default = "exports.test"
}

variable "cb_name" {
  default = "test-project"
}

variable "cb_description" {
  default = "test_codebuild_project"
}

