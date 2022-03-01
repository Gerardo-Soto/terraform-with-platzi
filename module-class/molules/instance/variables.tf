
variable ami_id {
  default     = ""
  description = "AMI ID from AWS"
}

variable instance_type {
  type        = string
  description = "type of virtual machine"
}

variable tags {
  type        = map
  description = "description"
}

variable securitygroup_ssh {}

variable ingress_rules {}
