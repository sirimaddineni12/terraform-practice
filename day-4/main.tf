# Create VPC
resource "aws_vpc" "dev" {
  cidr_block = "10.0.0.0/16" 

  tags = {
    Name = "dev_vpc" 
  }
}

# Create Subnet
resource "aws_subnet" "dev_local" {
  vpc_id     = aws_vpc.dev.id 
  cidr_block = "10.0.1.0/24" 

  tags = {
    Name = "dev_subnet" 
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "dev_local" {
  vpc_id = aws_vpc.dev.id 

  tags = {
    Name = "dev_igw"
  }
}

# Create Route Table
resource "aws_route_table" "dev_rt" {
  vpc_id = aws_vpc.dev.id 

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev_local.id 
  }
}

# Create Subnet Association
resource "aws_route_table_association" "dev_local" {
  subnet_id      = aws_subnet.dev_local.id 
  route_table_id = aws_route_table.dev_rt.id 
}

# Create Security Group
resource "aws_security_group" "allow_tls" {
  name   = "allow_tls"
  vpc_id = aws_vpc.dev.id 

  tags = {
    Name = "dev_sg"
  }

  # Ingress rule for HTTP traffic
  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Ingress rule for SSH traffic
  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Egress rule for all traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

