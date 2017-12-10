variable "public_key_path" {
}

variable "key_name" {
}

variable "region" {
  default = "eu-west-2"
}

variable "azs" {
  default = "eu-west-2a,eu-west-2b"
}

variable "cidrs" {
  default = "10.0.32.0/20,10.0.96.0/20"
}

variable "coreos_amis" {
  # Use the CoreOS HVM AMIs
  # https://coreos.com/os/docs/latest/booting-on-ec2.html
  default = {
    eu-west-1 = "ami-c8a811b1"
    eu-west-2 = "ami-8ccdd3e8"
  }
}

variable "ecs_amis" {
  # http://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html
  default = {
    eu-west-1 = "ami-4cbe0935"
    eu-west-2 = "ami-dbfee1bf"
  }
}

variable "instance_max" {
  default = 5
}

variable "instance_min" {
  default = 0
}
