# public route table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}
resource "aws_route_table_association" "public_route_table_association" {
    count = length(var.public_subnets)
 route_table_id = aws_route_table.public_route_table.id 
 subnet_id = var.public_subnets[count.index]
}


# private route tables
resource "aws_route_table" "private_route_table" {
  count = length(aws_nat_gateway.nat)
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat[count.index].id
  }
}
resource "aws_route_table_association" "private_route_table_association" {
  count = length(var.private_subnets)
  route_table_id = aws_route_table.private_route_table[count.index].id
  subnet_id = var.private_subnets[count.index]
}

# database route tables
resource "aws_route_table" "database_route_table" {
 vpc_id =  aws_vpc.main.id

}
resource "aws_route_table_association" "database_route_table_association" {
  count = length(var.database_subnets)
  route_table_id = aws_route_table.database_route_table.id
  subnet_id = aws_subnet.database_subnets[count.index].id
}