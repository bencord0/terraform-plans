variable "enable_bastion" {}

variable "vpc_id" {}
variable "image_id" {}
variable "instance_type" {}

variable "subnet_ids" {
  type = list
}
