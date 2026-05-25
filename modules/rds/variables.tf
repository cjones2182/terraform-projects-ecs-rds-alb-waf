variable "aws_secretsmanager_secret" {
  description = "rds password"
  type = string
}
variable "rds_security_group" {
  description = "rds security group"
  type = string
}