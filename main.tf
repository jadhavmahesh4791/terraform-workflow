#  1. Configure the AWS Provider
#  provider "aws" {
#    region = "ap-south-1" # Specify your desired AWS region
#  }

# 2. Define the EC2 Instance Resource


resource "aws_instance" "mahesh_space_vm" {
  ami           = "ami-00332e67519472455" # Replace with a valid AMI ID for your region
  instance_type = "t3.xlarge"             # Free Tier eligible instance type

  tags = {
    Name = "Terraform-Instance-Space-R-&-D"
  }
}