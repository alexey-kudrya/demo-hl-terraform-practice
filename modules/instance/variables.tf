variable "instance_name" {
  type        = string
  default     = "My Host"
  description = "My instance's name"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "My instance's name"
}

variable "root_block_size" {
  type        = number
  default     = null
  description = "description"
}

variable "root_volume_type" {
  type        = string
  default     = "gp2"
  description = "description"
}

variable "instance_profile" {
  type    = string
  default = null
}

variable "security_group_id" {
  type = string
}


variable "security_group_description" {
  type        = string
  default     = "Allow connecting from my ip"
  description = "description"
}

variable "security_group_type" {
  type        = string
  default     = "ingress"
  description = "description"
}

variable "security_group_from_port" {
  type        = number
  default     = 22
  description = "description"
}

variable "security_group_to_port" {
  type        = number
  default     = 22
  description = "description"
}

variable "security_group_to_protocol" {
  type        = string
  default     = "tcp"
  description = "description"
}

variable "security_group_cidr_blocks" {
  type        = list
  default     = ["10.1.100.1/32"]
  description = "description"
}