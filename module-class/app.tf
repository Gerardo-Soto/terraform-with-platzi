# requisitos minimos para crear una instancia en AWS
provider "aws" {
    region = "us-east-2"
}

module "my-app-platzi" {
    source = "./molules/instance"
    ami_id = var.ami_id
    instance_type = var.instance_type
    tags = var.tags
    securitygroup_ssh = var.securitygroup_ssh
    ingress_rules = var.ingress_rules
}

