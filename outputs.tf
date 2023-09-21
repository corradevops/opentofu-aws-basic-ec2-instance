output "ec2_instance_id" {
  description = "The ID of the instance"
  value       = module.ec2instance.id
}

output "ec2_instance_arn" {
  description = "The ARN of the instance"
  value       = module.ec2instance.arn
}

output "ec2_instance_public_ip" {
  description = "The public IP address of the instance"
  value       = module.ec2instance.public_ip
}
