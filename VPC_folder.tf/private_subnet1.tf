/*
#private subnet 1
resource "aws_subnet" "private1" {
  availability_zone = "us-east-1a"
  cidr_block = "10.10.3.0/24"
  vpc_id = aws_vpc.vpc1.id
  tags={
    Name = "splunk-private-subnet-1a"
  }
}
*/