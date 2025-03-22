# ----------------------------------------
# EC2 INSTANCE CONFIGURATION
# ----------------------------------------

variable "ami_id" {
  description = "The AMI ID to use for the instance. If empty, you must pass it explicitly from the root module."
  type        = string
  default     = null
}

variable "instance_type" {
  description = "The EC2 instance type to launch. Defaults to t2.micro (Free Tier eligible)."
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "The ID of the subnet where the instance will be launched."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the instance."
  type        = map(string)
  default     = {}
}

# ----------------------------------------
# SECURITY GROUP CONFIGURATION
# ----------------------------------------

variable "vpc_security_group_ids" {
  description = "The VPC ID used to create the default security group."
  type        = list(string)
  default     = null
}

variable "vpc_id" {
  description = "The VPC ID used to create the default security group"
  type        = string
  default     = null
}

# ----------------------------------------
# SSH KEY PAIR CONFIGURATION
# ----------------------------------------

variable "key_pair_name" {
  description = "The name of an existing EC2 key pair to use for SSH access."
  type        = string
  default     = null
}
