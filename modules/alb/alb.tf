resource "aws_lb" "main_alb" {
  name               = "main-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_security_group]
  subnets            = var.public_subnets

access_logs {
  bucket = var.alb_access_logs_bucket
  enabled = true
  }
  tags = {
    name = "${var.environment}-main-alb"
  }
}

