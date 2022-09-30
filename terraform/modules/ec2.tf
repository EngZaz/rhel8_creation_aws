resource "aws_network_interface" "rhel8" {
  subnet_id   = var.public_subnet_id
  private_ips = ["10.0.10.10"]

  tags = {
    Name = "primary_network_interface"
  }
}
