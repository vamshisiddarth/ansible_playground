Execute the below to destroy the newly created resources in aws once you are done using this to avoid unnecessary billing.

```
$ ./run.sh destroy -auto-approve

module.vpc_dev.aws_route_table_association.database[1]: Destroying... [id=rtbassoc-0c5222a1c212e3e36]
module.cmn-sg-ssh-private.aws_security_group_rule.ingress_rules[0]: Destroying... [id=sgrule-884063906]
module.vpc_dev.aws_route_table_association.private[0]: Destroying... [id=rtbassoc-044c20b437a042193]
module.cmn-sg-http.aws_security_group_rule.ingress_rules[1]: Destroying... [id=sgrule-1033354731]
module.vpc_dev.aws_route.private_ipv6_egress[1]: Destroying... [id=r-rtb-0509095b1c1e835172750132062]
module.vpc_dev.aws_route_table_association.database[0]: Destroying... [id=rtbassoc-0840e6850bfa5b2f5]
module.cmn-sg-http.aws_security_group_rule.ingress_rules[0]: Destroying... [id=sgrule-2872495831]
module.cmn-sg-http.aws_security_group_rule.ingress_rules[3]: Destroying... [id=sgrule-3486056792]
module.vpc_dev.aws_route.private_ipv6_egress[2]: Destroying... [id=r-rtb-00c52f0ed2854ab622750132062]
module.vpc_dev.aws_route.public_internet_gateway[0]: Destroying... [id=r-rtb-08dc97e9b829f36bb1080289494]
module.vpc_dev.aws_route.private_ipv6_egress[2]: Destruction complete after 1s
module.vpc_dev.aws_route.private_ipv6_egress[1]: Destruction complete after 1s
module.vpc_dev.aws_route.public_internet_gateway[0]: Destruction complete after 1s
module.vpc_dev.aws_route_table_association.database[2]: Destroying... [id=rtbassoc-058005031dfb9c044]
module.vpc_dev.aws_vpc_dhcp_options_association.this[0]: Destroying... [id=dopt-0303c1dec0b9fc27e-vpc-03be23a10646bd9a5]
module.cmn-sg-ssh-public.aws_security_group_rule.ingress_rules[0]: Destroying... [id=sgrule-1980634278]
module.vpc_dev.aws_route_table_association.database[1]: Destruction complete after 1s
module.vpc_dev.aws_route_table_association.database[0]: Destruction complete after 1s
module.vpc_dev.aws_route_table_association.private[0]: Destruction complete after 1s
module.vpc_dev.aws_route_table_association.public[1]: Destroying... [id=rtbassoc-0e096122f2effdabb]
module.vpc_dev.aws_route_table_association.public[0]: Destroying... [id=rtbassoc-0e16b00b1d5f05c0c]
module.cmn-sg-http.aws_security_group_rule.egress_rules[0]: Destroying... [id=sgrule-2351752626]
module.cmn-sg-http.aws_security_group_rule.ingress_rules[1]: Destruction complete after 2s
module.cmn-sg-ssh-private.aws_security_group_rule.ingress_rules[0]: Destruction complete after 2s
module.vpc_dev.aws_route.private_ipv6_egress[0]: Destroying... [id=r-rtb-05ffec8966cbaffcd2750132062]
module.cmn-sg-http.aws_security_group_rule.ingress_rules[2]: Destroying... [id=sgrule-344356267]
module.vpc_dev.aws_route_table_association.database[2]: Destruction complete after 1s
module.vpc_dev.aws_vpc_dhcp_options_association.this[0]: Destruction complete after 1s
module.cmn-sg-ssh-private.aws_security_group_rule.egress_rules[0]: Destroying... [id=sgrule-4024825567]
aws_route53_record.dev-bastion-a-record: Destroying... [id=Z0974811ANA23TP83HGF_bastion.vamshi.cf_A]
module.vpc_dev.aws_route_table_association.public[1]: Destruction complete after 1s
module.vpc_dev.aws_route_table_association.public[0]: Destruction complete after 1s
module.vpc_dev.aws_route_table_association.private[2]: Destroying... [id=rtbassoc-0bc613f3ddfe284b2]
module.vpc_dev.aws_route_table_association.private[1]: Destroying... [id=rtbassoc-01f741f5613611a0d]
module.vpc_dev.aws_route.private_ipv6_egress[0]: Destruction complete after 0s
module.vpc_dev.aws_route.public_internet_gateway_ipv6[0]: Destroying... [id=r-rtb-08dc97e9b829f36bb2750132062]
module.cmn-sg-ssh-public.aws_security_group_rule.ingress_rules[0]: Destruction complete after 1s
module.vpc_dev.aws_route_table_association.public[2]: Destroying... [id=rtbassoc-0bc318107da626a01]
module.vpc_dev.aws_route_table_association.private[2]: Destruction complete after 1s
module.cmn-sg-ssh-public.aws_security_group_rule.egress_rules[0]: Destroying... [id=sgrule-3869248690]
module.vpc_dev.aws_route_table_association.private[1]: Destruction complete after 1s
module.vpc_dev.aws_subnet.database[0]: Destroying... [id=subnet-0569b2aea636b0ecb]
module.vpc_dev.aws_route.public_internet_gateway_ipv6[0]: Destruction complete after 1s
module.vpc_dev.aws_subnet.database[1]: Destroying... [id=subnet-059b142cde11c2251]
module.cmn-sg-http.aws_security_group_rule.ingress_rules[0]: Destruction complete after 3s
module.cmn-sg-ssh-private.aws_security_group_rule.egress_rules[0]: Destruction complete after 1s
module.vpc_dev.aws_vpc_dhcp_options.this[0]: Destroying... [id=dopt-0303c1dec0b9fc27e]
module.vpc_dev.aws_subnet.database[2]: Destroying... [id=subnet-09146b82c1a953a92]
module.vpc_dev.aws_route_table_association.public[2]: Destruction complete after 1s
module.vpc_dev.aws_egress_only_internet_gateway.this[0]: Destroying... [id=eigw-009b7427372ed44de]
module.vpc_dev.aws_vpc_dhcp_options.this[0]: Destruction complete after 1s
module.vpc_dev.aws_route_table.private[2]: Destroying... [id=rtb-00c52f0ed2854ab62]
module.vpc_dev.aws_egress_only_internet_gateway.this[0]: Destruction complete after 1s
module.vpc_dev.aws_route_table.private[1]: Destroying... [id=rtb-0509095b1c1e83517]
module.cmn-sg-ssh-public.aws_security_group_rule.egress_rules[0]: Destruction complete after 1s
module.vpc_dev.aws_subnet.database[0]: Destruction complete after 1s
module.vpc_dev.aws_route_table.private[0]: Destroying... [id=rtb-05ffec8966cbaffcd]
module.vpc_dev.aws_subnet.private[2]: Destroying... [id=subnet-00e373355ba1602bf]
module.vpc_dev.aws_subnet.database[1]: Destruction complete after 1s
module.vpc_dev.aws_subnet.private[0]: Destroying... [id=subnet-0c3dca01bcb570f97]
module.cmn-sg-http.aws_security_group_rule.ingress_rules[3]: Destruction complete after 5s
module.vpc_dev.aws_subnet.private[1]: Destroying... [id=subnet-037fb36ae0b8c38a3]
module.vpc_dev.aws_subnet.database[2]: Destruction complete after 2s
module.vpc_dev.aws_internet_gateway.this[0]: Destroying... [id=igw-0954a9c4fc0843f79]
module.vpc_dev.aws_subnet.private[2]: Destruction complete after 2s
module.cmn-sg-ssh-private.aws_security_group.this_name_prefix[0]: Destroying... [id=sg-086c2f084978456f3]
module.vpc_dev.aws_route_table.private[2]: Destruction complete after 2s
module.vpc_dev.aws_route_table.public[0]: Destroying... [id=rtb-08dc97e9b829f36bb]
module.vpc_dev.aws_route_table.private[1]: Destruction complete after 2s
module.vpc_dev.aws_subnet.private[0]: Destruction complete after 2s
module.vpc_dev.aws_route_table.private[0]: Destruction complete after 2s
module.cmn-sg-http.aws_security_group_rule.egress_rules[0]: Destruction complete after 5s
module.vpc_dev.aws_subnet.private[1]: Destruction complete after 1s
module.cmn-sg-ssh-private.aws_security_group.this_name_prefix[0]: Destruction complete after 1s
module.cmn-sg-http.aws_security_group_rule.ingress_rules[2]: Destruction complete after 6s
module.cmn-sg-http.aws_security_group.this_name_prefix[0]: Destroying... [id=sg-01ec22237965acd7f]
module.vpc_dev.aws_route_table.public[0]: Destruction complete after 2s
module.cmn-sg-http.aws_security_group.this_name_prefix[0]: Destruction complete after 1s
aws_route53_record.dev-bastion-a-record: Still destroying... [id=Z0974811ANA23TP83HGF_bastion.vamshi.cf_A, 10s elapsed]
module.vpc_dev.aws_internet_gateway.this[0]: Still destroying... [id=igw-0954a9c4fc0843f79, 10s elapsed]
aws_route53_record.dev-bastion-a-record: Still destroying... [id=Z0974811ANA23TP83HGF_bastion.vamshi.cf_A, 20s elapsed]
module.vpc_dev.aws_internet_gateway.this[0]: Still destroying... [id=igw-0954a9c4fc0843f79, 20s elapsed]
aws_route53_record.dev-bastion-a-record: Still destroying... [id=Z0974811ANA23TP83HGF_bastion.vamshi.cf_A, 30s elapsed]
module.vpc_dev.aws_internet_gateway.this[0]: Still destroying... [id=igw-0954a9c4fc0843f79, 30s elapsed]
aws_route53_record.dev-bastion-a-record: Destruction complete after 34s
aws_route53_zone.public-zone: Destroying... [id=Z0974811ANA23TP83HGF]
aws_eip.dev-ec2-bastion-eip: Destroying... [id=eipalloc-0318ebd03092702a2]
aws_route53_zone.public-zone: Destruction complete after 1s
aws_eip.dev-ec2-bastion-eip: Destruction complete after 3s
module.dev-ec2-bastion.aws_instance.this[0]: Destroying... [id=i-0baccb445ce016d7f]
module.vpc_dev.aws_internet_gateway.this[0]: Still destroying... [id=igw-0954a9c4fc0843f79, 40s elapsed]
module.dev-ec2-bastion.aws_instance.this[0]: Still destroying... [id=i-0baccb445ce016d7f, 10s elapsed]
module.vpc_dev.aws_internet_gateway.this[0]: Still destroying... [id=igw-0954a9c4fc0843f79, 50s elapsed]
module.dev-ec2-bastion.aws_instance.this[0]: Still destroying... [id=i-0baccb445ce016d7f, 20s elapsed]
module.vpc_dev.aws_internet_gateway.this[0]: Still destroying... [id=igw-0954a9c4fc0843f79, 1m0s elapsed]
module.dev-ec2-bastion.aws_instance.this[0]: Still destroying... [id=i-0baccb445ce016d7f, 30s elapsed]
module.vpc_dev.aws_internet_gateway.this[0]: Destruction complete after 1m6s
module.dev-ec2-bastion.aws_instance.this[0]: Still destroying... [id=i-0baccb445ce016d7f, 40s elapsed]
module.dev-ec2-bastion.aws_instance.this[0]: Destruction complete after 44s
aws_key_pair.dev-key: Destroying... [id=dev-env-key]
module.vpc_dev.aws_subnet.public[1]: Destroying... [id=subnet-02ffb013966242f48]
module.cmn-sg-ssh-public.aws_security_group.this_name_prefix[0]: Destroying... [id=sg-0e67371b370328f5b]
module.vpc_dev.aws_subnet.public[0]: Destroying... [id=subnet-04b55e5c937515898]
module.vpc_dev.aws_subnet.public[2]: Destroying... [id=subnet-0a2d44621af2d045d]
aws_key_pair.dev-key: Destruction complete after 0s
module.vpc_dev.aws_subnet.public[2]: Destruction complete after 1s
module.cmn-sg-ssh-public.aws_security_group.this_name_prefix[0]: Destruction complete after 1s
module.vpc_dev.aws_subnet.public[1]: Destruction complete after 1s
module.vpc_dev.aws_subnet.public[0]: Destruction complete after 1s
module.vpc_dev.aws_vpc.this[0]: Destroying... [id=vpc-03be23a10646bd9a5]
module.vpc_dev.aws_vpc.this[0]: Destruction complete after 1s

Destroy complete! Resources: 49 destroyed.
```