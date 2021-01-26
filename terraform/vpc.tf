module "vpc_dev" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 2.66.0"

  name = "dev_vpc"
  cidr = var.cidr_block

  azs = [
    "eu-west-1a",
    "eu-west-1b",
    "eu-west-1c"
  ]

  # 172.16.0.0/16 split into 9 subnets
  # http://www.davidc.net/sites/default/subnets/subnets.html?network=172.16.0.0&mask=16&division=17.72350
  public_subnets = [
    "172.16.0.0/19",  # 8190
    "172.16.32.0/19", # 8190
    "172.16.64.0/19"  # 8190
  ]

  private_subnets = [
    "172.16.96.0/19",  # 8190
    "172.16.128.0/19", # 8190
    "172.16.160.0/19"  # 8190
  ]

  database_subnets = [
    "172.16.192.0/19", # 8190
    "172.16.224.0/20", # 4094
    "172.16.240.0/20"  # 4094
  ]

  enable_ipv6                     = true
  assign_ipv6_address_on_creation = true

  public_subnet_ipv6_prefixes   = [0, 1, 2]
  private_subnet_ipv6_prefixes  = [3, 4, 5]
  database_subnet_ipv6_prefixes = [6, 7, 8]

  create_database_subnet_group = false

  enable_dns_hostnames             = true
  enable_dns_support               = true
  default_vpc_enable_dns_hostnames = true
  default_vpc_enable_dns_support   = true

  enable_nat_gateway = false

  enable_dhcp_options = true

  tags = {
    owner       = "user"
    stack       = "dev"
    terraform   = "true"
    environment = "dev"
    name        = "dev"
  }

  vpc_endpoint_tags = {
    project  = "ansible_playground"
    endpoint = "true"
  }
}
