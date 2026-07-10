output "vpc_id" {

  value = aws_vpc.main.id

}

output "public_subnet_a" {

  value = aws_subnet.public_a.id

}

output "public_subnet_b" {

  value = aws_subnet.public_b.id

}

output "private_subnet_a" {

  value = aws_subnet.private_a.id

}

output "private_subnet_b" {

  value = aws_subnet.private_b.id

}

output "bastion_public_ip" {

  value = aws_instance.bastion.public_ip

}

output "private_instance_id" {

  value = aws_instance.private_server.id

}

output "alb_dns_name" {

  description = "Application Load Balancer DNS Name"

  value = aws_lb.application_lb.dns_name

}