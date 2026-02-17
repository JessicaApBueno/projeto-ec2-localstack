variable "project_name" {
  description = "Nome do projeto utilizado como prefixo para identificação de recursos e tagueamento."
  type        = string
}

variable "vpc_cidr" {
  description = "O bloco de endereços IP (CIDR) que será alocado para a VPC principal."
  type        = string
  default     = "10.0.0.0/16"
}

variable "instance_type" {
  description = "Tipo da instância EC2 (ex: t2.micro, t3.small). Define o hardware onde o servidor rodará."
  type        = string
  default     = "t2.micro"
}

# Exemplo de Variável Sensível
variable "api_token" {
  description = "Token de acesso para integração com serviços externos. Marcado como sensível para não aparecer nos logs."
  type        = string
  sensitive   = true
  default     = "token-super-secreto-123"
}