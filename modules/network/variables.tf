variable "project_name" {
  description = "Nome do projeto herdado do módulo raiz para manter a consistência de nomes."
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block recebido do módulo raiz para configurar a VPC."
  type        = string
}