# ----------------------------------------
# EC2 INSTANCE INFORMATION
# ----------------------------------------

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.this.id
}

output "ami_id" {
  description = "AMI ID used to launch the EC2 instance"
  value       = aws_instance.this.ami
}

output "key_name" {
  description = "Name of the key pair associated with the EC2 instance"
  value       = aws_instance.this.key_name
}

# ----------------------------------------
# NETWORKING DETAILS
# ----------------------------------------

output "public_ip" {
  description = "Public IP address assigned to the EC2 instance"
  value       = aws_instance.this.public_ip
}

output "private_ip" {
  description = "Private IP address assigned to the EC2 instance"
  value       = aws_instance.this.private_ip
}

output "public_dns" {
  description = "Public DNS name of the EC2 instance"
  value       = aws_instance.this.public_dns
}

output "security_group_ids" {
  description = "List of security group IDs attached to the instance"
  value       = aws_instance.this.vpc_security_group_ids
}

# ----------------------------------------
# SSH KEY OUTPUT (IF GENERATED)
# ----------------------------------------

output "private_key_pem" {
  description = "PEM-encoded private key content if generated by the module"
  value       = tls_private_key.ssh.private_key_pem
  sensitive   = true
}
