resource "aws_db_instance" "main_rds" {
  allocated_storage    = 10
  db_name              = "main-rds-storage"
  engine               = "mysql"
  engine_version       = "8.4.8"
  instance_class       = "db.t3.micro"
  username             = "app_user"
  password             = var.aws_secretsmanager_secret
  skip_final_snapshot  = true
  vpc_security_group_ids = [var.rds_security_group]
  multi_az = true
}