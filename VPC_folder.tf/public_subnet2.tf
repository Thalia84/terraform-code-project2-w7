/*
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
*/
