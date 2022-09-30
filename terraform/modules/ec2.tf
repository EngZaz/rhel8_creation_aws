resource "aws_network_interface" "rhel8" {
  subnet_id   = var.public_subnet_id
  private_ips = ["10.0.10.10"]
  security_groups = [aws_security_group.my_sg.id]

  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_eip" "one" {
  vpc                       = true
  network_interface         = aws_network_interface.rhel8.id
  associate_with_private_ip = "10.0.10.10"
}


resource "aws_instance" "rhel8" {
  ami           = data.aws_ami.rhel8.id
  instance_type = "t2.micro"
  key_name = aws_key_pair.my_public_key.key_name

  network_interface {
    network_interface_id = aws_network_interface.rhel8.id
    device_index         = 0
  }
}

resource "aws_key_pair" "my_public_key" {
  key_name   = "my_public_key"
  public_key = data.aws_ssm_parameter.public_key.value
}