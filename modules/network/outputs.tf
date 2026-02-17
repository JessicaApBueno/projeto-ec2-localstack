output "vpc_id" {
  description = "O ID da VPC criada para o projeto."
  value       = aws_vpc.main.id
}

output "subnet_id" {
  description = "O ID da Subnet pública onde os recursos de computação serão alocados."
  value       = aws_subnet.public.id
}

output "security_group_id" {
  description = "O ID do Security Group configurado para permitir tráfego na porta 80."
  value       = aws_security_group.allow_web.id
}