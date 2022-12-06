resource "aws_security_group" "my_sg" {
  name        = "allow_ssh"
  description = "Allow ssh inbound traffic"
  vpc_id      = var.vpc_id

  # ingress {
  #   description      = "TLS from VPC"
  #   from_port        = 22
  #   to_port          = 22
  #   protocol         = "tcp"
  #   cidr_blocks      = ["99.54.17.39/32"]
  # }

  # egress {
  #   from_port        = 0
  #   to_port          = 0
  #   protocol         = "-1"
  #   cidr_blocks      = ["0.0.0.0/0"]
  # }

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_security_group_rule" "ingress_ssh" {
  count             = length(var.my_home_addresses) > 0 ? 1 : 0
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = var.my_home_addresses
  security_group_id = aws_security_group.my_sg.id
}
resource "aws_security_group_rule" "all_eggress" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = -1
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.my_sg.id
}