resource "aws_nat_gateway" "nat" {
  count = length(var.public_subnets)

  allocation_id = aws_eip.nat_eip[count.index].id
  subnet_id = aws_subnet.public_subnets[count.index].id

  tags = {
      name = "${var.environment}-nat-gateway-${count.index}"
    }
}