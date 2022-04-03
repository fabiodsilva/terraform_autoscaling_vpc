variable "region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "192.168.0.0/16"
}

variable "public_a_cidr" {
  default = "192.168.1.0/24"
}

variable "public_b_cidr" {
  default = "192.168.2.0/24"
}

variable "private_a_cidr" {
  default = "192.168.6.0/24"
}

variable "private_b_cidr" {
  default = "192.168.4.0/24"
}

variable "ami" {
  default = "ami-0c2b8ca1dad447f8a"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "key_pair" {
  default = "us-east1"
}

variable "min_size" {
  default = 1
}

variable "max_size" {
  default = 1
}

variable "desired_capacity" {
  default = 1
}



variable "enabled_metrics" {
description = "A list of metrics to collect. The allowed values are GroupMinSize, GroupMaxSize, GroupDesiredCapacity, GroupInServiceInstances, GroupPendingInstances, GroupStandbyInstances, GroupTerminatingInstances, GroupTotalInstances"
  type = list

  default = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupPendingInstances",
    "GroupStandbyInstances",
    "GroupTerminatingInstances",
    "GroupTotalInstances",
  ]
}
