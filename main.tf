terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_volume_attachment" "example" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.example.id
  instance_id = aws_instance.example.id
}

resource "aws_instance" "example" {
  ami           = "ami-0157b1e4eefd91fd7"
  instance_type = "t2.micro"
}

// Amazon Elastic Block Store (EBS)
resource "aws_ebs_volume" "example" {
  availability_zone = "us-west-2a"
  # xingong just changed the size from 2 to 1 and then to 4, as fari had suggested
  size              = 4
}
