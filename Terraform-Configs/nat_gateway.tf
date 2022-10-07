#####################
#   NAT Gateway #
#####################

resource "aws_eip" "eip_nat" {
  vpc = true

  tags = {
    Name = "eip1"
  }
}

resource "aws_nat_gateway" "nat_1" {
  allocation_id = aws_eip.eip_nat.id
  subnet_id     = aws_subnet.public-subnet-1.id

  tags = {
    "Name" = "nat1"
  }
}