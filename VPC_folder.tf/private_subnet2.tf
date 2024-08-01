/*
# private subnet 2
resource "aws_subnet" "private2" {
  availability_zone = "us-east-1b"
  cidr_block = "10.10.4.0/24"
  vpc_id = aws_vpc.vpc1.id
  tags={
    Name = "splunk-private-subnet-1b"
  }
}
*/