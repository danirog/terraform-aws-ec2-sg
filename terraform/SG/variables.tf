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

variable "ingress_port_list" {
  type = list(object({
    from_port = number
    to_port   = number
  }))
  description = "Inbound rules port list"
}

variable "cidr_blocks" {
  description = "CIDR block for ingress sg traffic"
  type        = string
}