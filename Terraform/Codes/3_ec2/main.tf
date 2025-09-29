# This Terraform configuration creates a ec2 instance

# Variables:
# Made variables.tf file to define variables

# Outputs:
# Made outputs.tf file to define outputs

# Create a key pair with name "my_terraform_key" in cmd using command: ssh-keygen


# key pair (login credentials) to access the instance
resource aws_key_pair my_key {
  key_name   = "my_terraform_key"
  public_key = file("my_terraform_key.pub")
}

# vpc and security group to allow ssh access
resource aws_default_vpc default {

}

resource aws_security_group my_sec_group {
  name        = "mysecgroup"
  description = "Allow SSH, HTTP, 8000 inbound traffic"
  vpc_id      = aws_default_vpc.default.id # interpolation syntax to get the id of the default vpc

  tags = {
    Name        = "My security group"
    Environment = "Dev"
  } 
  
  # inbound rules
  # ssh access
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH access"
  }

  # http access
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP access"
  }

  # 8000 access
  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow 8000 access"
  }

  # outbound rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }     
}


resource "aws_instance" "my_instance" {
  key_name      = aws_key_pair.my_key.key_name
  security_groups = [ aws_security_group.my_sec_group.name ]
  instance_type = var.ec2_instance_type
  ami           = var.ec2_ami_id

  root_block_device {
    volume_size = var.root_block_device["volume_size"]
    volume_type = var.root_block_device["volume_type"]
    delete_on_termination = var.root_block_device["delete_on_termination"]
  }

  tags = {
    Name        = "My instance"
    Environment = "Dev"
  }
  
}


# NOTE: Remove .pem extension from the key pair name to access the instance. Give required permissions to the file also.
# Ex: ssh -i "my_terraform_key" ubuntu@ec2-18-220-126-226.us-east-2.compute.amazonaws.com



