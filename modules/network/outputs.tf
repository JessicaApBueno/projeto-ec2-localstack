output "vpc_id" {
  description = "ID da VPC criada no módulo de rede"
  value       = aws_vpc.main.id
}

output "subnet_id" {
  description = "ID da Subnet criada no módulo de rede"
  value       = aws_subnet.public.id
}

output "security_group_id" {
  description = "ID do Security Group criado no módulo de rede"
  value       = aws_security_group.allow_web.id
}