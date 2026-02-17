variable "project_name" {
  description = "Nome do projeto utilizado para tagueamento e prefixos de recursos."
  type        = string
}

variable "vpc_cidr" {
  description = "Bloco CIDR para a VPC principal."
  type        = string
  default     = "10.0.0.0/16"
}

variable "instance_type" {
  description = "Tipo da instância EC2."
  type        = string
  default     = "t2.micro"
}

variable "region" {
  description = "Região da AWS para o deploy."
  type        = string
  default     = "us-east-1"
}

variable "api_token" {
  description = "Token de acesso sensível para integração externa."
  type        = string
  sensitive   = true
  default     = "token-exemplo-seguro"
}