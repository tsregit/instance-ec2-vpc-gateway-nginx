resource "aws_security_group" "external" {
  name = "${local.name_prefix}-SG"
  vpc_id = aws_vpc.vpc.id
  ingress {
    from_port = 80
    protocol = "tcp"
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  lifecycle {
      create_before_destroy = true
  }
  tags = merge({
    Name = "${local.name_prefix}-SG"
  },
  local.default_tags,
  )
}