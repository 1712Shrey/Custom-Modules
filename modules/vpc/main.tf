resource "aws_vpc" "vpc" {
  cidr_block = var.cidr-range
  tags = {
    Name = var.vpc-name
  }
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.vpc.id
  count             = length(var.public-cidr)
  cidr_block        = element(var.public-cidr, count.index)
  availability_zone = element(var.az, count.index)

  tags = {
    Name = "public - ${count.index + 1}"
  }
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.vpc.id
  count             = length(var.private-cidr)
  cidr_block        = element(var.private-cidr, count.index)
  availability_zone = element(var.az, count.index)

  tags = {
    Name = "private - ${count.index + 1}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.igw-name
  }
}

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = var.igw_cidr
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.rt-name
  }
}

resource "aws_route_table_association" "public" {
  count = length(var.public-cidr)

  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_security_group" "sg" {
  name        = var.sg-name
  vpc_id      = aws_vpc.vpc.id

  dynamic "ingress" {
    for_each = var.in

    content{
      protocol = ingress.value.protocol
      from_port = ingress.value.from_port
      to_port = ingress.value.to_port
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}
