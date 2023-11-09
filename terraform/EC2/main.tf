# gets selected default vpc default availability zone  

resource "aws_default_subnet" "default_az4" {
  availability_zone = var.availability_zone
}

# creates ec2 instance with terraform module

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.5.0"

  name                        = "${lower(var.organization_name)}-${lower(var.environment)}-ec2"
  instance_type               = var.instance_type
  key_name                    = var.keypair_name
  ami                         = var.instance_ami
  associate_public_ip_address = true
  vpc_security_group_ids      = [data.terraform_remote_state.sg.outputs.sg_ec2_id]
  subnet_id                   = aws_default_subnet.default_az4.id
  monitoring                  = true
  root_block_device = [
    {
      volume_type = var.volume_type
      volume_size = var.volume_size
    }
  ]

  tags = {
    Environment = "${lower(var.environment)}"
    Managedby   = "terraform"
  }
}

