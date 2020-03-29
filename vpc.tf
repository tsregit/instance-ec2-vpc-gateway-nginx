//cidr_block Nos permite crear bloques de SUBNET
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = merge({
    Name = "${local.name_prefix}-VPC"
  },
  local.default_tags,
  )
}

resource "aws_subnet" "public" {
  cidr_block              = var.cidr_public
  vpc_id                  = aws_vpc.vpc.id
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.az.names[0]
  tags = merge({
    Name = "${local.name_prefix}-${var.cidr_public}-${var.aws_region}-PUBLIC"
  },
  local.default_tags,
  )
}

resource "aws_subnet" "private" {
  cidr_block              = var.cidr_private
  vpc_id                  = aws_vpc.vpc.id
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.az.names[0]
  tags = merge({
    Name = "${local.name_prefix}-${var.cidr_public}-${var.aws_region}-PRIVATE"
  },
  local.default_tags,
  )
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = merge({
    Name = "${local.name_prefix}-PUBLIC-IGW"
  },
  local.default_tags,
  ) 
}

resource "aws_route" "default_route" {
  route_table_id         = aws_vpc.vpc.default_route_table_id
  destination_cidr_block = var.table_local
  gateway_id             = aws_internet_gateway.igw.id
}

