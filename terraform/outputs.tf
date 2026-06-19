output "instance_public_ip" {
       description = "Public IP of EC2 Instance"
       value = aws_instance.web_server.public_ip
}

output "instance_private_ip" {
        description = "Private IP of EC2 Instance"
        value = aws_instance.web_server.private_ip
}

output "vpc_id" {
      description = "VPC ID"
      value = aws_vpc.main.id
}

