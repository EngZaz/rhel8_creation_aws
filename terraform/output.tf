output "public_subnet_id" {
 value = data.terraform_remote_state.aws_vpcs.outputs.subnet_ids[1]
}

output "ami_id" {
    value = module.ec2_east-2.ami_id
}
