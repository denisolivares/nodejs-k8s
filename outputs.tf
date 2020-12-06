output "k8sdev" {
  description = "List of public IPs assigned to the instances"
  value       = [aws_instance.k8sdev.public_ip]
}

/* output "k8sprod" {
  description = "List of public IPs assigned to the instances"
  value       = [aws_instance.k8sprod.public_ip]
} */

/* output "ids" {
  description = "List of IDs of instances"
  value       = module.ec2.id
}

output "tags" {
  description = "List of tags"
  value       = module.ec2.tags
}

output "placement_group" {
  description = "List of placement group"
  value       = module.ec2.placement_group
}

output "instance_id" {
  description = "EC2 instance ID"
  value       = module.ec2.id[0]
}

output "t2_instance_id" {
  description = "EC2 instance ID"
  value       = module.ec2_with_t2_unlimited.id[0]
}

output "instance_public_dns" {
  description = "Public DNS name assigned to the EC2 instance"
  value       = module.ec2.public_dns[0]
}*/