# ----------------------------------------
# KEY PAIR GENERATION
# ----------------------------------------

resource "random_id" "suffix" {
  byte_length = 4
}

resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated" {
  key_name   = "terraform-key-ec2-${random_id.suffix.hex}"
  public_key = tls_private_key.ssh.public_key_openssh
}

# ----------------------------------------
# SECURITY GROUP
# ----------------------------------------

resource "aws_security_group" "default" {
  name   = "ec2-default-sg"
  vpc_id = var.vpc_id
  tags = {
    Name = "ec2-default-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.default.id
  ip_protocol       = "tcp"
  from_port         = 22
  to_port           = 22
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls" {
  security_group_id = aws_security_group.default.id
  ip_protocol       = "tcp"
  from_port         = 443
  to_port           = 443
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.default.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6" {
  security_group_id = aws_security_group.default.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1"
}

# ----------------------------------------
# EC2 INSTANCE
# ----------------------------------------

resource "aws_instance" "this" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.default.id]
  key_name               = aws_key_pair.generated.key_name
  tags                   = var.tags
}

resource "aws_eip" "this" {
  instance = aws_instance.this.id
  domain   = "vpc"
  tags     = var.eip_tags
}