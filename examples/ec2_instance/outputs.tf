# ----------------------------------------
# OUTPUTS - EC2 INSTANCE DETAILS
# ----------------------------------------

output "public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = module.ec2_instance.public_ip
}

output "ssh_command" {
  description = "SSH command to connect to the EC2 instance using a local private key"
  value       = "ssh -i ~/.ssh/new-key.pem ubuntu@${module.ec2_instance.public_dns}"
}

output "elastic_ip" {
  description = "Elastic IP address of the EC2 instance"
  value       = module.ec2_instance.elastic_ip
}

# ----------------------------------------
# SSH KEY OUTPUT
# ----------------------------------------

output "private_key_pem" {
  description = "PEM-encoded private key content if generated by the module"
  value       = module.ec2_instance.private_key_pem
  sensitive   = true
}

output "security_group_ids" {
  description = "ID of the security group attached to the instance"
  value       = module.ec2_instance.security_group_ids
}