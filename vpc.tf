# create vpc

resource "aws_vpc" "vpc1" {
  cidr_block       = "10.10.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "vpc1"
    Team = "wdp"
    env  = "dev"
  }
}

#Internet gateway

resource  "aws_internet_gateway" "gtw2" {
  vpc_id = aws_vpc.vpc1.id
}

#Nat gateway

resource "aws_eip" "el2" {
}
resource "aws_nat_gateway" "nat2" {
  allocation_id = aws_eip.el2.id
  subnet_id     = aws_subnet.public2.id
}

#public subnet 1
resource "aws_subnet" "public1" {
  availability_zone       = "us-east-1a"
  cidr_block              = "10.10.1.0/24"
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.vpc1.id
  tags = {
    Name = "splunk-public-subnet-1a"
  }
}

# public subnet 2
resource "aws_subnet" "public2" {
  availability_zone = "us-east-1b"
  cidr_block = "10.10.2.0/24"
  map_public_ip_on_launch = true
  vpc_id = aws_vpc.vpc1.id
  tags={
    Name = "splunk-public-subnet-1b"
  }
}

#private subnet 1
resource "aws_subnet" "private1" {
  availability_zone = "us-east-1a"
  cidr_block = "10.10.3.0/24"
  vpc_id = aws_vpc.vpc1.id
  tags={
    Name = "splunk-private-subnet-1a"
  }
}

# private subnet 2
resource "aws_subnet" "private2" {
  availability_zone = "us-east-1b"
  cidr_block = "10.10.4.0/24"
  vpc_id = aws_vpc.vpc1.id
  tags={
    Name = "splunk-private-subnet-1b"
  }
}

#Public route table

resource "aws_route_table" "rtpu" {
  vpc_id = aws_vpc.vpc1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gtw2.id
  }
}

#Private route table

resource "aws_route_table" "rtpri" {
  vpc_id = aws_vpc.vpc1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat2.id
  }
}

#route and public1 subnet association

resource "aws_route_table_association" "rta1" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.rtpu.id
}

#route and public2 subnet association
resource "aws_route_table_association" "rta2" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.rtpu.id
}

#route and private1 subnet association

resource "aws_route_table_association" "rta3" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.rtpri.id
}

#route and private2 subnet association

resource "aws_route_table_association" "rta4" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.rtpri.id
}

































































