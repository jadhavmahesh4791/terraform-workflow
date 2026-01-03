# 1. Define the Security Group
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh_access"
  description = "Allow SSH inbound traffic"

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["223.185.38.147/32"] # "Anywhere" access
  }

  egress {
    description = "Security group rule does not have a description"
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Allows all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}