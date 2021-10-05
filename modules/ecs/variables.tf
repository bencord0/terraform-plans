variable "vpc_id" {}
variable "cluster_name" {}

variable "max_size" {}
variable "min_size" {}

variable "image_id" {}
variable "instance_type" {}

variable "subnet_ids" {
  type = list
}

variable "bastion_security_group_id" {}
