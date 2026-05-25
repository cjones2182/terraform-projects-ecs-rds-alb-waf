resource "aws_security_group" "alb_security_group" {
  name = "alb-security-group"
  description = "alb security group"
  vpc_id = var.vpc_id 
tags = {
  name = "${var.environment}-alb-security-group"
    }
}
resource "aws_vpc_security_group_ingress_rule" "alb_ingress_rule" {
  security_group_id = aws_security_group.alb_security_group.id
 
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "tcp"
  from_port         = 80
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "name" {
  security_group_id = aws_security_group.alb_security_group.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "-1"
  
}