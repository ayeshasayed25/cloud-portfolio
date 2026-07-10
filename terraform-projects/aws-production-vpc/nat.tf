#Elastic IP for NAT Gateway
resource "aws_eip" "nat_eip" {

  domain = "vpc"

  tags = {

    Name = "${var.project_name}-nat-eip"

  }

}
# NAT Gateway
resource "aws_nat_gateway" "nat" {

  allocation_id = aws_eip.nat_eip.id

  subnet_id = aws_subnet.public_a.id


  tags = {

    Name = "${var.project_name}-nat-gateway"

  }

}
#Create Private Route Table
resource "aws_route_table" "private_rt" {

  vpc_id = aws_vpc.main.id


  route {

    cidr_block = "0.0.0.0/0"

    nat_gateway_id = aws_nat_gateway.nat.id

  }


  tags = {

    Name = "${var.project_name}-private-route-table"

  }

}
#Associate Private Subnets
resource "aws_route_table_association" "private_a" {

  subnet_id = aws_subnet.private_a.id

  route_table_id = aws_route_table.private_rt.id

}


resource "aws_route_table_association" "private_b" {

  subnet_id = aws_subnet.private_b.id

  route_table_id = aws_route_table.private_rt.id

}