# Public Subnets
resource "aws_subnet" "public" {
  count                   = length(var.public_subnet_cidrs)
  vpc_id                  = aws_vpc.vpcblock.id
  cidr_block              = var.public_subnet_cidrs[count.index]
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  
              #output of availability_zone: 
              #data.aws_availability_zones.available.names = [
              #"ap-south-1a",
              #"ap-south-1b",
              #"ap-south-1c"
              #]

  tags = merge(var.tags, {
    Type = "Public"
    Name = "${var.project}-${var.environment}-public-subnet-${element(["a","b","c"], count.index)}"
  })
}