/*
#route and private1 subnet association

resource "aws_route_table_association" "rta4" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.rtpri.id
}
*/