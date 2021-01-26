### Quick Start

- Clone the repository on your machine.
- Use any IDE of your choice. I'm using `Jet Brains Intellij`. Navigate to the repository on the terminal and execute the below.
```
./pip-install.sh
```
- Install the amazon aws plugin using below.
```
$ ansible-galaxy collection install amazon.aws
```
- Create `vault-password.txt` file with your vault password. Check `vault-password.example.txt` file for reference. The `vault.sh` script can be used to encrypt and decrypt your group_vars file. This will be explained later.
- Create `credentials.txt` file with your aws access key and secret key. You may also choose the region of your choice. Check `credentials.example.txt` file for reference.
- Generate the Inventory File for your environment using below.
```
$ ./gen-inventory-yaml.sh 
Welcome!! You will now be able to generate the credential file for your new environment/account. Please provide the below requested details
environment: stage
aws_access_key_id: AKIARMAHSDVFVEFCDCD                 
aws_secret_access_key: JSADSDdsdmcdc3453422/34e324e3dsacaDFG
iam_role_arn: arn:aws:iam::0912345553223:role/Administrator                                                   
Inventory Credential File created successfully!!
```
- Generate the key files which will be used for authentication into the new servers we create.
```
$ ./gen-key.sh
Welcome!! You will now be able to generate the key files for your new environment/account. Please provide the below requested details
environment: dev
Generating public/private rsa key pair.
Your identification has been saved in _ssh/dev-env-key.pem.
Your public key has been saved in _ssh/dev-env-key.pem.pub.
The key fingerprint is:
SHA256:eDfWwhh/wLhviuyj6SZ0OaVLu3AdrWioiQkPJOO/TlA vamshisiddarthgaddam@Vamshis-MBP-2
The key's randomart image is:
+---[RSA 2048]----+
|                 |
|         o       |
|   E    o o      |
|  .   .o * o     |
|oo   +o S B o    |
|+.o.*o + + +     |
|ooo+++o   o      |
|o*+++o.. o       |
|= oB*++..        |
+----[SHA256]-----+
Key File created successfully!!
```
- Create a Free Domain for yourself. I have created `vamshi.cf` using [Freenom](https://www.freenom.com/en/index.html?lang=en). We will then create a hosted zone in our AWS account and we need to update the nameservers in freenom with AWS nameservers.
- Navigate to the `terraform` directory and update the `vars.tf` and `key-file.tf` with suitable values.
```bash
# key-file.tf

resource "aws_key_pair" "dev-key" {
  key_name   = var.key_name
  public_key = file("./../_ssh/dev-env-key.pem.pub") # This should be your environment key file name
}

# vars.tf

variable "domain_name" {
  default = "vamshi.cf" # Update with your domain name
}
```
- Once these files are updated, execute the below to create the new resources in aws.
```
$ ./run.sh apply -auto-approve
aws_route53_zone.public-zone: Creating...
module.vpc_dev.aws_vpc_dhcp_options.this[0]: Creating...
aws_key_pair.dev-key: Creating...
module.vpc_dev.aws_vpc.this[0]: Creating...
aws_key_pair.dev-key: Creation complete after 1s [id=dev-env-key]
module.vpc_dev.aws_vpc_dhcp_options.this[0]: Creation complete after 3s [id=dopt-0303c1dec0b9fc27e]
module.vpc_dev.aws_vpc.this[0]: Creation complete after 10s [id=vpc-03be23a10646bd9a5]
module.vpc_dev.aws_internet_gateway.this[0]: Creating...
module.vpc_dev.aws_route_table.private[1]: Creating...
module.vpc_dev.aws_route_table.public[0]: Creating...
module.vpc_dev.aws_route_table.private[2]: Creating...
module.vpc_dev.aws_route_table.private[0]: Creating...
module.vpc_dev.aws_subnet.private[1]: Creating...
module.vpc_dev.aws_subnet.database[0]: Creating...
module.vpc_dev.aws_subnet.database[1]: Creating...
module.vpc_dev.aws_subnet.private[0]: Creating...
aws_route53_zone.public-zone: Still creating... [10s elapsed]
module.vpc_dev.aws_route_table.private[0]: Creation complete after 2s [id=rtb-05ffec8966cbaffcd]
module.vpc_dev.aws_route_table.private[1]: Creation complete after 2s [id=rtb-0509095b1c1e83517]
module.vpc_dev.aws_subnet.public[2]: Creating...
module.vpc_dev.aws_subnet.private[2]: Creating...
module.vpc_dev.aws_route_table.public[0]: Creation complete after 3s [id=rtb-08dc97e9b829f36bb]
module.vpc_dev.aws_egress_only_internet_gateway.this[0]: Creating...
module.vpc_dev.aws_route_table.private[2]: Creation complete after 3s [id=rtb-00c52f0ed2854ab62]
module.vpc_dev.aws_subnet.database[2]: Creating...
module.vpc_dev.aws_subnet.private[1]: Creation complete after 4s [id=subnet-037fb36ae0b8c38a3]
module.vpc_dev.aws_subnet.database[1]: Creation complete after 4s [id=subnet-059b142cde11c2251]
module.vpc_dev.aws_subnet.private[0]: Creation complete after 4s [id=subnet-0c3dca01bcb570f97]
module.vpc_dev.aws_vpc_dhcp_options_association.this[0]: Creating...
module.vpc_dev.aws_subnet.public[0]: Creating...
module.vpc_dev.aws_subnet.public[1]: Creating...
module.vpc_dev.aws_subnet.database[0]: Creation complete after 4s [id=subnet-0569b2aea636b0ecb]
module.cmn-sg-ssh-private.aws_security_group.this_name_prefix[0]: Creating...
module.vpc_dev.aws_internet_gateway.this[0]: Creation complete after 4s [id=igw-0954a9c4fc0843f79]
module.cmn-sg-http.aws_security_group.this_name_prefix[0]: Creating...
module.vpc_dev.aws_egress_only_internet_gateway.this[0]: Creation complete after 2s [id=eigw-009b7427372ed44de]
module.cmn-sg-ssh-public.aws_security_group.this_name_prefix[0]: Creating...
module.vpc_dev.aws_vpc_dhcp_options_association.this[0]: Creation complete after 1s [id=dopt-0303c1dec0b9fc27e-vpc-03be23a10646bd9a5]
module.vpc_dev.aws_route.public_internet_gateway[0]: Creating...
module.vpc_dev.aws_subnet.private[2]: Creation complete after 4s [id=subnet-00e373355ba1602bf]
module.vpc_dev.aws_route.public_internet_gateway_ipv6[0]: Creating...
module.vpc_dev.aws_subnet.database[2]: Creation complete after 3s [id=subnet-09146b82c1a953a92]
module.vpc_dev.aws_route.private_ipv6_egress[2]: Creating...
module.vpc_dev.aws_subnet.public[2]: Creation complete after 5s [id=subnet-0a2d44621af2d045d]
module.vpc_dev.aws_route.private_ipv6_egress[1]: Creating...
module.vpc_dev.aws_route.public_internet_gateway[0]: Creation complete after 2s [id=r-rtb-08dc97e9b829f36bb1080289494]
module.vpc_dev.aws_route.private_ipv6_egress[0]: Creating...
module.vpc_dev.aws_subnet.public[0]: Creation complete after 4s [id=subnet-04b55e5c937515898]
module.vpc_dev.aws_route_table_association.private[2]: Creating...
module.vpc_dev.aws_subnet.public[1]: Creation complete after 4s [id=subnet-02ffb013966242f48]
module.vpc_dev.aws_route_table_association.private[1]: Creating...
module.vpc_dev.aws_route.public_internet_gateway_ipv6[0]: Creation complete after 2s [id=r-rtb-08dc97e9b829f36bb2750132062]
module.vpc_dev.aws_route.private_ipv6_egress[2]: Creation complete after 2s [id=r-rtb-00c52f0ed2854ab622750132062]
module.vpc_dev.aws_route_table_association.database[2]: Creating...
module.vpc_dev.aws_route_table_association.private[0]: Creating...
module.cmn-sg-http.aws_security_group.this_name_prefix[0]: Creation complete after 5s [id=sg-01ec22237965acd7f]
module.cmn-sg-ssh-private.aws_security_group.this_name_prefix[0]: Creation complete after 5s [id=sg-086c2f084978456f3]
module.vpc_dev.aws_route_table_association.database[1]: Creating...
module.vpc_dev.aws_route_table_association.database[0]: Creating...
module.vpc_dev.aws_route_table_association.private[2]: Creation complete after 1s [id=rtbassoc-0bc613f3ddfe284b2]
module.vpc_dev.aws_route.private_ipv6_egress[1]: Creation complete after 2s [id=r-rtb-0509095b1c1e835172750132062]
module.vpc_dev.aws_route_table_association.public[0]: Creating...
module.vpc_dev.aws_route_table_association.public[2]: Creating...
module.vpc_dev.aws_route_table_association.private[1]: Creation complete after 1s [id=rtbassoc-01f741f5613611a0d]
module.vpc_dev.aws_route_table_association.public[1]: Creating...
module.vpc_dev.aws_route_table_association.private[0]: Creation complete after 1s [id=rtbassoc-044c20b437a042193]
module.vpc_dev.aws_route_table_association.database[2]: Creation complete after 1s [id=rtbassoc-058005031dfb9c044]
module.cmn-sg-http.aws_security_group_rule.ingress_rules[3]: Creating...
module.cmn-sg-http.aws_security_group_rule.ingress_rules[2]: Creating...
module.vpc_dev.aws_route.private_ipv6_egress[0]: Creation complete after 2s [id=r-rtb-05ffec8966cbaffcd2750132062]
module.cmn-sg-http.aws_security_group_rule.ingress_rules[1]: Creating...
module.vpc_dev.aws_route_table_association.database[0]: Creation complete after 1s [id=rtbassoc-0840e6850bfa5b2f5]
module.cmn-sg-http.aws_security_group_rule.egress_rules[0]: Creating...
module.vpc_dev.aws_route_table_association.database[1]: Creation complete after 1s [id=rtbassoc-0c5222a1c212e3e36]
module.cmn-sg-http.aws_security_group_rule.ingress_rules[0]: Creating...
module.vpc_dev.aws_route_table_association.public[2]: Creation complete after 1s [id=rtbassoc-0bc318107da626a01]
module.cmn-sg-ssh-private.aws_security_group_rule.egress_rules[0]: Creating...
module.vpc_dev.aws_route_table_association.public[0]: Creation complete after 1s [id=rtbassoc-0e16b00b1d5f05c0c]
module.vpc_dev.aws_route_table_association.public[1]: Creation complete after 1s [id=rtbassoc-0e096122f2effdabb]
module.cmn-sg-ssh-private.aws_security_group_rule.ingress_rules[0]: Creating...
module.cmn-sg-ssh-public.aws_security_group.this_name_prefix[0]: Creation complete after 5s [id=sg-0e67371b370328f5b]
aws_route53_zone.public-zone: Still creating... [20s elapsed]
module.cmn-sg-ssh-public.aws_security_group_rule.egress_rules[0]: Creating...
module.cmn-sg-ssh-public.aws_security_group_rule.ingress_rules[0]: Creating...
module.cmn-sg-http.aws_security_group_rule.ingress_rules[3]: Creation complete after 2s [id=sgrule-3486056792]
module.dev-ec2-bastion.aws_instance.this[0]: Creating...
module.cmn-sg-ssh-private.aws_security_group_rule.egress_rules[0]: Creation complete after 2s [id=sgrule-4024825567]
module.cmn-sg-ssh-public.aws_security_group_rule.egress_rules[0]: Creation complete after 2s [id=sgrule-3869248690]
module.cmn-sg-http.aws_security_group_rule.ingress_rules[2]: Creation complete after 4s [id=sgrule-344356267]
module.cmn-sg-ssh-private.aws_security_group_rule.ingress_rules[0]: Creation complete after 4s [id=sgrule-884063906]
module.cmn-sg-ssh-public.aws_security_group_rule.ingress_rules[0]: Creation complete after 4s [id=sgrule-1980634278]
module.cmn-sg-http.aws_security_group_rule.ingress_rules[1]: Creation complete after 6s [id=sgrule-1033354731]
module.cmn-sg-http.aws_security_group_rule.egress_rules[0]: Creation complete after 7s [id=sgrule-2351752626]
module.cmn-sg-http.aws_security_group_rule.ingress_rules[0]: Creation complete after 9s [id=sgrule-2872495831]
aws_route53_zone.public-zone: Still creating... [30s elapsed]
module.dev-ec2-bastion.aws_instance.this[0]: Still creating... [10s elapsed]
aws_route53_zone.public-zone: Creation complete after 34s [id=Z0974811ANA23TP83HGF]
module.dev-ec2-bastion.aws_instance.this[0]: Creation complete after 19s [id=i-0baccb445ce016d7f]
aws_eip.dev-ec2-bastion-eip: Creating...
aws_eip.dev-ec2-bastion-eip: Creation complete after 3s [id=eipalloc-0318ebd03092702a2]
aws_route53_record.dev-bastion-a-record: Creating...
aws_route53_record.dev-bastion-a-record: Still creating... [10s elapsed]
aws_route53_record.dev-bastion-a-record: Still creating... [20s elapsed]
aws_route53_record.dev-bastion-a-record: Still creating... [30s elapsed]
aws_route53_record.dev-bastion-a-record: Creation complete after 35s [id=Z0974811ANA23TP83HGF_bastion.vamshi.cf_A]

Apply complete! Resources: 49 added, 0 changed, 0 destroyed.

Outputs:

dev-ec2-bastion-public_dns = [
  "ec2-34-252-208-5.eu-west-1.compute.amazonaws.com",
]
dev-ec2-bastion-public_ip = "54.220.236.92"
```

Once this is done, we need to update the nameservers for the domain. It might take a little time for the domain name to resolve. Once it is successful, you might find similar output.
```
$ nslookup bastion.vamshi.cf
Server:         192.168.0.1
Address:        192.168.0.1#53

Non-authoritative answer:
Name:   bastion.vamshi.cf
Address: 54.220.236.92
```

You can now ssh into the newly created instance using the below command.
```
$ ssh -F "./ssh/web.ssh.config" ubuntu@172.16.10.120

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Tue Jan 26 12:28:15 UTC 2021

  System load:  0.08              Processes:           96
  Usage of /:   14.0% of 7.69GB   Users logged in:     0
  Memory usage: 18%               IP address for ens5: 172.16.10.120
  Swap usage:   0%


0 packages can be updated.
0 updates are security updates.


To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

ubuntu@ip-172-16-10-120:~$ 
```

With this, you have now completed the Dynamic Inventory configuration. 

### Demolition

- Execute the below to destroy the newly created resources in aws once you are done using this to avoid unnecessary billing.

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