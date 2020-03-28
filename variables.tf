variable "environment" {
  type    = string
  default = "prod"
}

variable "table_local" {
  type    = string
  default = "0.0.0.0/0"
}

variable "ami" {
  type    = string
  default = "ami-09a5b0b7edf08843d"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "aws_id" {
  type    = string
  default = "482833233562"
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "key_name" {
  type = string
  default = "tomas-pets"
}
