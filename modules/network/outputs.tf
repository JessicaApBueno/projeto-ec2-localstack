output "subnet_id" {
  description = "ID da subnet pública."
  value       = aws_subnet.public.id
}

output "security_group_id" {
  description = "ID do security group."
  value       = aws_security_group.allow_web.id
}