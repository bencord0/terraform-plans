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

variable "coreos_amis" {
  # Use the CoreOS HVM AMIs
  # https://coreos.com/os/docs/latest/booting-on-ec2.html
  default = {
    eu-west-1 = "ami-c8a811b1"
    eu-west-2 = "ami-8ccdd3e8"
    us-east-1 = "ami-6dfb9a17"
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
