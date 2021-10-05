variable "vpc_id" {}
variable "ecs_cluster_id" {}

variable "public_subnet_ids" {
  type = list
}

variable "private_subnet_ids" {
  type = list
}
