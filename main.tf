# Define the AWS provider and region
provider "aws" {
  region = "us-east-1" # Change to your desired region
}

# Create a VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "MyVPC"
  }
}

# Create public and private subnets
resource "aws_subnet" "public_subnet" {
  count = 2
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.${count.index}.0/24"
  availability_zone = "us-east-1a" # Change availability zones as needed
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet ${count.index}"
  }
}

resource "aws_subnet" "private_subnet" {
  count = 2
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.${count.index + 2}.0/24"
  availability_zone = "us-east-1b" # Change availability zones as needed

  tags = {
    Name = "Private Subnet ${count.index}"
  }
}

# Create a security group for EC2 instances
resource "aws_security_group" "my_security_group" {
  name        = "my-security-group"
  description = "Allow HTTP and SSH traffic"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # For SSH access, you might want to restrict this to trusted IPs
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create an EC2 instance in the public subnet
resource "aws_instance" "my_instance" {
  ami           = "ami-0c55b159cbfafe1f0" # Use your desired AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet[0].id
  security_groups = [aws_security_group.my_security_group.name]

  tags = {
    Name = "MyEC2Instance"
  }
}
