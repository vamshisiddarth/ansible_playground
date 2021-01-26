variable "key_name" {
  default = "dev-env-key"
}

resource "aws_key_pair" "dev-key" {
  key_name   = var.key_name
  public_key = file("./../_ssh/dev-env-key.pem.pub")
}

