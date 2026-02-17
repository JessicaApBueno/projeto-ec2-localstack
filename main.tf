module "network" {
  source       = "./modules/network"
  project_name = var.project_name
}

resource "aws_instance" "web" {
  ami           = "ami-00000000000000000"
  instance_type = var.instance_type
  subnet_id     = module.network.subnet_id
  vpc_security_group_ids = [module.network.security_group_id]

  # Resolve alerta de segurança: Criptografia de disco
  root_block_device {
    encrypted = true
  }

  # Resolve alerta de segurança HIGH: Exigir Tokens (IMDSv2)
  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
  }

  user_data = <<-EOF
              #!/bin/bash
              apt-get update && apt-get install -y nginx
              EOF

  tags = {
    Name = "${var.project_name}-ec2"
  }
}