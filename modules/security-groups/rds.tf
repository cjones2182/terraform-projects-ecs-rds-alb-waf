resource "aws_security_group" "rds_security_group" {
  name = "rds-security-group"
  description = "security group for rds"
  vpc_id = var.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "rds_ingress_rule" {
security_group_id = aws_security_group.rds_security_group.id
referenced_security_group_id = aws_security_group.app_security_group.id

ip_protocol = "tcp"
from_port = 3306
to_port = 3306
}

resource "aws_vpc_security_group_egress_rule" "rds_egress_rule" {
 security_group_id = aws_security_group.rds_security_group.id

 ip_protocol = "-1"
 cidr_ipv4 = "0.0.0.0/0"
}