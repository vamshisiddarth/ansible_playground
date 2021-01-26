## Fixed Private IP for Bastion
variable "bastion-private-ips" {
  default = [
    "172.16.10.120"
  ]
}

module "dev-ec2-bastion" {
  source         = "terraform-aws-modules/ec2-instance/aws"
  version        = "~> 2.16"
  name           = "dev-bastion"
  instance_count = 1
  use_num_suffix = true

  ami           = data.aws_ami.ubuntu-bionic-latest.id
  instance_type = "t3.micro"
  key_name      = aws_key_pair.dev-key.key_name
  monitoring    = true

  subnet_id = module.vpc_dev.public_subnets[0]

  private_ips = var.bastion-private-ips

  associate_public_ip_address = true

  vpc_security_group_ids = [
    module.cmn-sg-ssh-public.this_security_group_id,
  ]

  tags = {
    name        = "dev-bastion"
    terraform   = "true"
    environment = "dev"
    domain      = "bastion.${var.domain_name}"
    project     = "dev bastion"
    application = "bastion"
    team        = "devops"
  }
}

resource "aws_eip" "dev-ec2-bastion-eip" {
  vpc      = true
  instance = module.dev-ec2-bastion.id[0]
}



resource "aws_route53_record" "dev-bastion-a-record" {
  zone_id = aws_route53_zone.public-zone.id
  name    = "bastion.${var.domain_name}"
  type    = "A"
  ttl     = "300"

  records = [
    aws_eip.dev-ec2-bastion-eip.public_ip
  ]

  depends_on = [
    module.dev-ec2-bastion
  ]
}

output "dev-ec2-bastion-public_ip" {
  value = aws_eip.dev-ec2-bastion-eip.public_ip
}

output "dev-ec2-bastion-public_dns" {
  value = module.dev-ec2-bastion.public_dns
}