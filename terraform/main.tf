module "ec2_east-2" {
  source = "./modules"
  public_subnet_id = data.terraform_remote_state.aws_vpcs.outputs.subnet_ids[1]
  vpc_id = data.terraform_remote_state.aws_vpcs.outputs.vpc_id
  my_home_addresses = [ "99.54.17.39/32", "199.26.110.5/32" ]
}
