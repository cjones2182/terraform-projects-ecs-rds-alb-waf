resource "aws_subnet" "private_subnets" {
count = length(var.private_subnets)
vpc_id = aws_vpc.main.id
cidr_block = var.private_subnets[count.index]
availability_zone = var.availability_zones[count.index]

tags = {
    name = "${var.environment}-private-subnets-${count.index}"
}
}