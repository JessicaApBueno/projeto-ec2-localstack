output "web_instance_id" {
  description = "ID da instância EC2 criada."
  value       = aws_instance.web.id
}

output "web_instance_state" {
  description = "Estado atual da instância EC2."
  value       = aws_instance.web.instance_state
}