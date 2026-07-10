resource "aws_instance" "bastion" {

  ami = "ami-092889649e1f53c40"

  instance_type = "t3.micro"

  subnet_id = aws_subnet.public_a.id

  vpc_security_group_ids = [

    aws_security_group.bastion_sg.id

  ]

  associate_public_ip_address = true

  tags = {

    Name = "Bastion-Host"

  }

}

resource "aws_instance" "private_server" {

  ami = "ami-092889649e1f53c40"

  instance_type = "t3.micro"

  subnet_id = aws_subnet.private_a.id

  vpc_security_group_ids = [

    aws_security_group.private_ec2_sg.id

  ]

  tags = {

    Name = "Private-App-Server"

  }

}