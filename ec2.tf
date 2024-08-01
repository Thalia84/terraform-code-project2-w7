resource "aws_instance" "server1" {
  ami                    = "ami-0195204d5dce06d99"
  instance_type          = "t2.small"
  subnet_id              = aws_subnet.public2.id
  security_groups        = [aws_security_group.sg1-demo.id]
  vpc_security_group_ids = [aws_security_group.sg1-demo.id]
  key_name               = aws_key_pair.aws_key.key_name
  user_data              = file("lucy.sh")
  tags = {
    Name = "splunk-app-inst"
  }
}

# Define the EBS volume
resource "aws_ebs_volume" "vol_storage" {
  availability_zone = "us-east-1a"
  size              = 25
  tags = {
    Name = "vol_storage"
  }
}
/*
# Attach the EBS volume to the EC2 instance
resource "aws_volume_attachment" "example_attachment" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.example_volume.id
  instance_id = aws_instance.example.id
}
output "instance_id" {
  value = aws_instance.example.id
}

output "volume_id" {
  value = aws_ebs_volume.example_volume.id
}
*/