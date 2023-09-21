variable "environment" {
  type    = string
  default = "stage"
}

variable "aws-region" {
  type    = string
  default = "us-east-1"
}

variable "aws-profile" {
  type    = string
  default = "default"
}

variable "user-data" {
  type    = string
  default = "helpers/user-data.sh"
}

variable "ami-image" {
  type    = string
  default = "ami-03a6eaae9938c858c"
}

variable "key-name" {
  type = string
}

variable "instance-type" {
  type    = string
  default = "t3.small"
}

variable "subnet" {
  type = string
}

variable "root_volume_size" {
  type    = number
  default = "10"
}

variable "ebs_volume_size" {
  type    = number
  default = "5"
}

variable "root_volume_name" {
  type    = string
  default = "root-block"
}

variable "ebs_mount_point" {
  type    = string
  default = "/mnt/data"
}

variable "createdby" {
  type = string
}
variable "initiator" {
  type = string
}
variable "project" {
  type = string
}
variable "task" {
  type = string
}
