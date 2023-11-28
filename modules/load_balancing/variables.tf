variable "vpc_id" {
  type = string
}

# variable "instance_id_1" {
#   description = "The ID of the first EC2 instance"
#   type        = string
# }

# variable "instance_id_2" {
#   description = "The ID of the second EC2 instance"
#   type        = string
# }

variable "instance_id" {
  type = list(string)
}

variable "public_subnets" {
  type = list(string)
}

variable "security_group_id" {
  type = list(string)
}