output "my-vpc-ip" {
    value =  aws_vpc.vpc1.id
}
output "My-security-group-ip" {
    value = aws_vpc.vpc1.id
}
output "My-ec2-public2-ip" {
    value = aws_subnet.public2.id
}
  