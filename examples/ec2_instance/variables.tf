# ----------------------------------------
# INPUT VARIABLES FOR EC2 INSTANCE EXAMPLE
# ----------------------------------------

variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-2"
}

variable "ami_id" {
  description = "Amazon Linux 2 AMI ID for us-east-2"
  type        = string
  default     = "ami-0c02fb55956c7d316"
}

variable "instance_type" {
  description = "EC2 instance type to launch"
  type        = string
  default     = "t2.micro"
}

variable "tags" {
  description = "A map of tags to assign to the EC2 instance"
  type        = map(string)
  default     = {}
}

variable "eip_tags" {
  description = "A map of tags to assign to the Elastic IP"
  type        = map(string)
  default     = {}
}

variable "subnet_id" {
  description = "ID of an existing subnet in your VPC"
  type        = string
}

variable "key_pair_name" {
  description = "Optional name to assign to the EC2 key pair that will be created"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC where the security group will be created"
  type        = string
}
