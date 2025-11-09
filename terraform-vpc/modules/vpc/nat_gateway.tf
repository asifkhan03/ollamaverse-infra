resource "aws_eip" "nat" {
  count  = length(var.public_subnet_cidrs)
  domain = "vpc"
  tags = merge({
    Name = "${var.project}-${var.environment}-nat-eip-${element(["a","b","c"], count.index)}"
  }, var.tags)
}