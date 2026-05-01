resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Example VPC"
  }
}

resource "aws_ec2_instance" "example" {
  ami           = "ami-0c55b1531624917e0"
  instance_type = "t2.micro"
  subnet_id     = aws_vpc.example.subnet_ids[0]

  tags = {
    Name = "${var.vpc_name}-example-instance"
  }
}

output "instance_id" {
  value       = aws_ec2_instance.example.id
  description = "ID of the created EC2 instance."
}