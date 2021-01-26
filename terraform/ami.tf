data "aws_ami" "ubuntu-bionic-latest" {
  most_recent = true

  filter {
    name = "name"
    values = [
      "ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-20200611"
    ]
  }

  owners = [
    "099720109477"
  ]

  provider = aws
}