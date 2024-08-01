/*#public subnet 1
resource "aws_subnet" "public1" {
  availability_zone       = "us-east-1a"
  cidr_block              = "10.10.1.0/24"
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.vpc1.id
  tags = {
    Name = "splunk-public-subnet-1a"
  }
}
*/