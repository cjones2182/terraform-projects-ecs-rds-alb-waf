resource "aws_lb_target_group" "alb_target_group" {
  name        = "alb-target-group"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.vpc_id
}