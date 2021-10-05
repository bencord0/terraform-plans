variable "region" {
  default = "eu-west-2"
}

data "aws_availability_zones" "azs" {}

variable "enable_bastion" {
  default = 0
}

variable "bastion_instance_type" {
  # Use t2.micro if you qualify for the AWS Free Tier
  default = "t2.nano"
}

variable "ecs_instance_type" {
  # Use t2.micro if you qualify for the AWS Free Tier
  default = "t2.nano"
}

variable "debian_amis" {
  # https://wiki.debian.org/Cloud/AmazonEC2Image/Bullseye
  default = {
    eu-west-1 = "ami-01aa1a3fbe264bcd8"
    eu-west-2 = "ami-0f6e132e485a5e978"
    us-east-1 = "ami-094a5c9900e98a022"
  }
}

variable "ecs_amis" {
  # http://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html
  default = {
    eu-west-1 = "ami-4cbe0935"
    eu-west-2 = "ami-dbfee1bf"
    us-east-1 = "ami-fad25980"
  }
}

variable "ecs_max_size" {
  default = 5
}

variable "ecs_min_size" {
  default = 0
}
