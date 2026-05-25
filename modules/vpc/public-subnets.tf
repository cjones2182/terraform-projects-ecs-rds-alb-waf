resource "aws_subnet" "public_subnets" {
    count = length(var.public_subnets)
   vpc_id =  aws_vpc.main.id
   cidr_block =  var.public_subnets[count.index]
   availability_zone = var.availability_zones[count.index]

   tags = {
     name = "${var.environment}-public-subnets-${count.index}"
   }
}