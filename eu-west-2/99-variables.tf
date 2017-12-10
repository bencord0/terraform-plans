variable "public_key_path" {
}

variable "key_name" {
}

variable "region" {
  default = "eu-west-2"
}

variable "coreos_amis" {
  # Use the CoreOS HVM AMIs
  # https://coreos.com/os/docs/latest/booting-on-ec2.html
  default = {
    eu-west-1 = "ami-c8a811b1"
    eu-west-2 = "ami-8ccdd3e8"
  }
}

variable "web_instance_max" {
  default = 1
}

variable "web_instance_min" {
  default = 1
}
