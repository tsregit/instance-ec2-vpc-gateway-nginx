output "subnet_id" {
  value = "${aws_subnet.public.id}"
}

output "scg_id" {
  value = "${aws_security_group.external.id}"
}

output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}
