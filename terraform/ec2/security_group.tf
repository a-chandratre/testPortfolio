resource "aws_security_group" "administration" {
  vpc_id = data.aws_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.trusted_network]
  }

  ingress { 
    from_port = -1
    to_port = -1
    protocol = "icmp"
  }
}

