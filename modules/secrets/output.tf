output "aws_secretsmanager_secret" {
  description = "rds password"
  value = aws_secretsmanager_secret.rds_secret.name
}