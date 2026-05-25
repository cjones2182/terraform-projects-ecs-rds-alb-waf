resource "aws_subnet" "database_subnets" {
 count = length(var.database_subnets) 
 vpc_id = var.vpc_id
 cidr_block = var.database_subnets[count.index]
 availability_zone = var.availability_zones[count.index]

 tags = {
   name = "${var.environment}-database-subnets-${count.index}"
 }
}