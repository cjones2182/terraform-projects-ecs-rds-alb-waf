resource "aws_security_group" "app_security_group" {
  name = "app_security_group"
  description = "security group for application layer"
  vpc_id = var.vpc_id

tags = {
  name = "${var.environment}-app-security-group"
}
}

resource "aws_vpc_security_group_ingress_rule" "app_ingress_rule" {
  security_group_id = aws_security_group.app_security_group.id
 referenced_security_group_id = aws_security_group.alb_security_group.id
  
  ip_protocol = "tcp"
  from_port   = 80
  to_port     = 80
}

resource "aws_vpc_security_group_egress_rule" "app_egress_rule" {
  security_group_id = aws_security_group.app_security_group.id

ip_protocol = "-1"
cidr_ipv4 = "0.0.0.0/0"
}