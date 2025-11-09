resource "aws_eip" "nat" {
  count  = length(var.public_subnet_cidrs)
  domain = "vpc"
  tags = merge({
    Name = "${var.project}-${var.environment}-nat-eip-${element(["a","b","c"], count.index)}"
  }, var.tags)
}

resource "aws_nat_gateway" "natblock" {
  count         = length(var.public_subnet_cidrs)
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = aws_subnet.public[count.index].id

  tags = merge({
    Name = "${var.project}-${var.environment}-nat-gateway-${element(["a","b","c"], count.index)}"
  }, var.tags)
}