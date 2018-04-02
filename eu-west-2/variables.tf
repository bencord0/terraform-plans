variable "public_key_path" {}

variable "key_name" {}

variable "region" {
  default = "eu-west-2"
}

variable "azs" {
  type = "map"
  default = {
    eu-west-1 = "eu-west-1a,eu-west-1b,eu-west-1c"
    eu-west-2 = "eu-west-2a,eu-west-2b,eu-west-2c"
    us-east-1 = "us-east-1a,us-east-1b,us-east-1c,us-east-1d,us-east-1e,us-east-1f",
  }
}

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

variable "instance_max" {
  default = 5
}

variable "instance_min" {
  default = 0
}