data "aws_ami" "rhel8" {
  most_recent = true

  filter {
    name   = "name"
    values = ["rhel8-linux-aws"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["303596245539"] # Canonical
}


data "aws_ssm_parameter" "public_key" {
  name = "my_public_key"
}