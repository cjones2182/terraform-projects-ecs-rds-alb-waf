variable "alb_security_group" {
  description = "alb security group"
  type = string
}
variable "public_subnets" {
  description = "public subnets"
  type = list(string)
}
variable "alb_access_logs_bucket" {
  description = "acess logs bucket"
  type = string
}
variable "vpc_id" {
  description = "vpc id"
  type = string
}
variable "environment" {
  description = "environment name"
  type = string
}