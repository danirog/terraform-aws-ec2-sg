# gets selected aws region default vpc

resource "aws_default_vpc" "default" {}

# creates security group

resource "aws_security_group" "sg_test" {
  name        = "${lower(var.organization_name)}-${lower(var.environment)}-sg"
  description = "Security Group for EC2 test"
  vpc_id      = aws_default_vpc.default.id

  dynamic "ingress" {
    for_each = var.ingress_port_list
    content {
      from_port   = ingress["value"].from_port
      to_port     = ingress["value"].to_port
      protocol    = "tcp"
      cidr_blocks = [var.cidr_blocks]
    }
  }

  ingress {
    description = "Allow port -1 for ping from everyone"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [var.cidr_blocks]
  }

  egress {
    description = "Allow all egress traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${lower(var.organization_name)}-${lower(var.environment)}-sg"
    Environment = "${lower(var.environment)}"
    Managedby   = "terraform"
  }

}
