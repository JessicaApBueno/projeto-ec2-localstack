output "vpc_id" {
  description = "O identificador único da VPC criada."
  value       = aws_vpc.main.id
}

output "subnet_id" {
  description = "O identificador da Subnet pública criada no módulo."
  value       = aws_subnet.public.id
}

output "security_group_id" {
  description = "O ID do Security Group configurado para tráfego web."
  value       = aws_security_group.allow_web.id
}