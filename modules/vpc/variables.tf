variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "cidr_private" {
  type    = string
  default = "10.0.1.0/24"
}

variable "cidr_public" {
  type    = string
  default = "10.0.2.0/24"
}

variable "environment" {
  type    = string
  default = "prod"
}

variable "ami" {
  type    = string
  default = "ami-09a5b0b7edf08843d"
}

variable "table_local" {
  type    = string
  default = "0.0.0.0/0"
}

variable "project_name" {
    type    = string
  default = "PETS"
}

