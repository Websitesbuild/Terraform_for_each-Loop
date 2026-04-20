resource "aws_vpc" "amit-VPC" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnet-1" {
  vpc_id = aws_vpc.amit-VPC.id
  cidr_block = "10.0.0.0/24"
}

resource "aws_subnet" "subnet-2" {
  vpc_id = aws_vpc.amit-VPC.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
}


resource "aws_internet_gateway" "amit-IGW" {
  vpc_id = aws_vpc.amit-VPC.id
}

resource "aws_route_table" "amit-RT" {
  vpc_id = aws_vpc.amit-VPC.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.amit-IGW.id
  }
}

resource "aws_route_table_association" "amit-RTA-1" {
  subnet_id = aws_subnet.subnet-1.id
  route_table_id = aws_route_table.amit-RT.id
}

resource "aws_route_table_association" "amit-RTA-2" {
  subnet_id = aws_subnet.subnet-2.id
  route_table_id = aws_route_table.amit-RT.id
}

resource "aws_security_group" "amit-SG" {
  name = "amit-SG-1"
  vpc_id = aws_vpc.amit-VPC.id
  ingress {
    description = "TLS from VPC"
    from_port = 20
    to_port = 20
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
    ipv6_cidr_blocks = [ "::/0" ]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
    ipv6_cidr_blocks = [ "::/0" ]
  }
}
