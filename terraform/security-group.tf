module "cmn-sg-http" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 3.15"

  name        = "common-sg"
  description = "Security group for common"

  vpc_id = module.vpc_dev.vpc_id

  ingress_cidr_blocks = [
    "0.0.0.0/0"
  ]
  ingress_rules = [
    "http-80-tcp",
    "http-8080-tcp",
    "https-443-tcp",
    "https-8443-tcp",
  ]
  egress_rules = [
    "all-all"
  ]
}

module "cmn-sg-ssh-private" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 3.15"

  name        = "ssh-private-sg"
  description = "Security group for ssh-private"

  vpc_id = module.vpc_dev.vpc_id

  ingress_cidr_blocks = [var.cidr_block]

  ingress_rules = [
    "ssh-tcp",
  ]
  egress_rules = [
    "all-all"
  ]

}

module "cmn-sg-ssh-public" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 3.15"

  name        = "ssh-plublic-sg"
  description = "Security group for ssh-plublic"

  vpc_id = module.vpc_dev.vpc_id

  ingress_cidr_blocks = [
    "0.0.0.0/0"
  ]
  ingress_rules = [
    "ssh-tcp",
  ]
  egress_rules = [
    "all-all"
  ]
}
