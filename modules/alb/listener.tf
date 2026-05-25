resource "aws_lb_listener" "main_arn" {
  load_balancer_arn = aws_lb.main_alb.arn
  port              = "80"
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb.main_alb.arn
  }
}

# not using ACM. do not have certificate. 