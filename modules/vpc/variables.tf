variable "environment" {
  description = "name of environment"
  type = string
}

variable "vpc_cidr_block" {
description = "cidr of vpc"
  type = string
}
variable "vpc_id" {
description = "vpc id"
type = string
}

variable "public_subnets" {
  description = "public subnets"
  type = list(string)
}
variable "availability_zones" {
  description = "availability zones of subnet"
  type = list(string)
}
variable "private_subnets" {
  description = "private subnets"
  type = list(string)
}
variable "database_subnets" {
  description = "database subnets"
  type = list(string)
}

