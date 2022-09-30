module "ec2_east-2" {
  source = "./modules"
  public_subnet_id = data.terraform_remote_state.aws_vpcs.outputs.subnet_ids[1]
  vpc_id = data.terraform_remote_state.aws_vpcs.outputs.vpc_id
}
