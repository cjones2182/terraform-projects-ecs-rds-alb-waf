output "alb_security_group" {
  description = "alb security group"
  value = aws_security_group.alb_security_group.id
}

output "app_security_group" {
description = "app security group"
value = aws_security_group.app_security_group.id
}

output "rds_security_group" {
  description = "rds security group"
  value = aws_security_group.rds_security_group.id
}