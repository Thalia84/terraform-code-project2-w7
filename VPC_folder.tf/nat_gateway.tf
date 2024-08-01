/*#Nat gateway

resource "aws_eip" "el2" {
}
resource "aws_nat_gateway" "nat2" {
  allocation_id = aws_eip.el2.id
  subnet_id     = aws_subnet.public2.id
}
*/