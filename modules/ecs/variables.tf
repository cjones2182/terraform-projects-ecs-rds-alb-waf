variable "environment" {
  description = "environment"
  type = string
}
variable "aws_secretsmanager_secret" {
  description = "secret for RDS"
  type = string
}