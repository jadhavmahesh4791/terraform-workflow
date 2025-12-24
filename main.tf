# 1. Configure the AWS Provider
provider "aws" {
  region = "ap-south-1" 
}

# 2. Define the EC2 Instance Resource
resource "aws_instance" "mahesh_space_vm" {
  ami           = "ami-00332e67519472455" 
  instance_type = "t3.xlarge"             

  # FIX 1: Require IMDSv2 (Token-based access)
  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required" # Enforces IMDSv2
    http_put_response_hop_limit = 1
  }

  # FIX 2: Encrypt Root Block Device
  root_block_device {
    encrypted   = true
    # Optional: specify a KMS key ID if not using default AWS managed key
    # kms_key_id = "your-kms-key-arn" 
  }

  tags = {
    Name = "Terraform-Instance-Space-R-&-D"
  }
}