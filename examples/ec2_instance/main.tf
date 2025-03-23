# ----------------------------------------
# PROVIDER CONFIGURATION
# ----------------------------------------

provider "aws" {
  profile = "personal" # AWS profile to use for authentication
  region  = var.region # AWS region to deploy resources
}

# ----------------------------------------
# EC2 INSTANCE MODULE
# ----------------------------------------

# Retrieves latest Ubuntu 22.04 LTS AMI
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
module "ec2_instance" {
  source = "../../modules/ec2_instance" # Path to the reusable EC2 instance module

  ami_id        = data.aws_ami.ubuntu.id # AMI ID to use for the EC2 instance
  instance_type = var.instance_type      # EC2 instance type (e.g., t2.micro)
  subnet_id     = var.subnet_id          # Subnet ID to launch the instance in
  key_pair_name = var.key_pair_name      # Optional name to assign to the created key pair (a new key is always created)
  tags          = var.tags
}