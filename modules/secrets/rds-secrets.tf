resource "random_password" "rds_random_password" {
length = 15
special = true
upper = true
lower = true
}

resource "aws_secretsmanager_secret" "rds_secret" {
  name = "rds-secret"
  description = "secret for rds password"
}
resource "aws_secretsmanager_secret_version" "rds_secrets_version" {
  secret_id = aws_secretsmanager_secret.rds_secret.id

    secret_string = jsonencode({
        "username": "app_user"
        "password": random_password.rds_random_password.result
    })
}