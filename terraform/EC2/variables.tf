# global variables

variable "region" {
  type = string
}

variable "organization_name" {
  type = string
}

variable "environment" {
  type = string
}



# resource variables

variable "availability_zone" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "keypair_name" {
  type = string
}

variable "instance_ami" {
  type = string
}

variable "volume_type" {
  type = string
}

variable "volume_size" {
  type = string
}
