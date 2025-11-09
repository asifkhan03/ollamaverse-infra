# Public Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpcblock.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igwblock.id
  }

  tags = merge({
    Name = "${var.project}-${var.environment}-public-rt"
  }, var.tags)
}

resource "aws_route_table_association" "public" {
  count          = length(var.public_subnet_cidrs)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}