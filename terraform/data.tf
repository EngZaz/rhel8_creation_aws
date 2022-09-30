data "terraform_remote_state" "aws_vpcs" {
  backend = "s3"

  config = {
    bucket = "engzaz"
    key    = "aws_network"
    region = "us-east-1"
  }
}