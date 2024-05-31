resource "aws_vpc" "main" {
  cidr_block = var.aws_network
  tags = {
    Name = "nteir"
  }
}
resource "aws_subnet" "nteir-sub" {
  vpc_id            = aws_vpc.main.id
  count             = length(var.aws_sub_network)
  cidr_block        = var.aws_sub_network[count.index]
  availability_zone = var.aws_AZ[count.index]
  tags = {
    Name = var.aws_sub_names[count.index]
  }
  depends_on = [
    aws_vpc.main
  ]
}

data "aws_route_table" "rw" {
  vpc_id = aws_vpc.main.id
  depends_on = [
    aws_vpc.main
  ]
}

resource "aws_internet_gateway" "nteir-gw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "nteir-gw"
  }

  depends_on = [
    aws_vpc.main
  ]
}

resource "aws_route" "nteir_rw" {
  route_table_id         = data.aws_route_table.rw.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.nteir-gw.id
  depends_on = [
    aws_vpc.main,
    aws_internet_gateway.nteir-gw
  ]
}