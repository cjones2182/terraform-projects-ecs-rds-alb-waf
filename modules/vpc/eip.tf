resource "aws_eip" "nat_eip" {
    count = length(var.public_subnets)
  domain = "vpc"

    tags = {
      name = "${var.environment}-nat-eip-${count.index}"
    }
}