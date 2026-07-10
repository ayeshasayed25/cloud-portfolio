#Bastion Security Group
resource "aws_security_group" "bastion_sg" {

  name = "bastion-security-group"

  description = "Allow SSH"

  vpc_id = aws_vpc.main.id

  ingress {

    from_port = 22

    to_port = 22

    protocol = "tcp"

    cidr_blocks = ["206.116.230.125/32"]

  }

  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]

  }

}

#Private EC2 Security Group
resource "aws_security_group" "private_ec2_sg" {

  name = "private-ec2-security-group"

  vpc_id = aws_vpc.main.id

  ingress {

    from_port = 22

    to_port = 22

    protocol = "tcp"

    security_groups = [

      aws_security_group.bastion_sg.id

    ]

  }

  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]

  }

}
