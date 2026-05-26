resource "aws_security_group" "endpoint_security_group" {
  name = "endpoint-security-group"
  description = "security group for secrets endpoint"
  vpc_id = var.vpc_id
}
resource "aws_vpc_security_group_ingress_rule" "endpoint_ingress_rule" {
security_group_id = aws_security_group.endpoint_security_group.id
referenced_security_group_id = aws_security_group.app_security_group.id

ip_protocol = "tcp"
from_port = 443
to_port = 443
}
resource "aws_vpc_security_group_egress_rule" "endpoint_egress_rule" {
security_group_id =  aws_security_group.endpoint_security_group.id

cidr_ipv4 = "0.0.0.0/0"
ip_protocol = "-1"
}