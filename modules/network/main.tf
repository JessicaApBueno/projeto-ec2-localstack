resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  # tfsec:ignore:aws-ec2-require-vpc-flow-logs-for-all-vpcs
  tags = { Name = "${var.project_name}-vpc" }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  tags       = { Name = "${var.project_name}-subnet" }
}

resource "aws_security_group" "allow_web" {
  name        = "allow_web"
  description = "Permite trafego HTTP de entrada" # Descricao obrigatoria
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "HTTP de qualquer lugar"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # tfsec:ignore:aws-ec2-no-public-ingress-sgr
  }

  egress {
    description = "Saida permitida"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}