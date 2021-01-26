resource "aws_route53_zone" "public-zone" {
  name     = var.domain_name
  comment  = "${var.domain_name} public zone"
  provider = aws
}