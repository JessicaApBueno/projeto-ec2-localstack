output "instance_id" {
  value = aws_instance.web.id
}

output "vpc_id" {
  value = module.network.vpc_id
}