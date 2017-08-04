variable "public_key_path" {
}

variable "key_name" {
}

variable "aws_amis" {
  # Use the CoreOS HVM AMIs
  # https://coreos.com/os/docs/latest/booting-on-ec2.html
  default = {
    eu-west-1 = "ami-38ef0041"
    eu-west-2 = "ami-eba8be8f"
  }
}
