variable "aws_region" {
  description = "Região da AWS"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Nome do projeto"
  type        = string
}

variable "instance_type" {
  description = "Tipo da EC2"
  type        = string
  default     = "t2.micro"
}