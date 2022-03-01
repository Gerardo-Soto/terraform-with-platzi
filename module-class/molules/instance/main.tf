# Infraestructure definition

# requisitos minimos para crear una instancia en AWS
provider "aws" {
    region = "us-east-2"
}

#         recurso: inst.  ID: platzi-instance
resource "aws_instance" "platzi-instance"{
    #ami = "ami-0123456789abcde"
    ami = var.ami_id
    #instance_type = "t2.micro"
    instance_type = var.instance_type
    #tags = {
    #    Name = "Practice 1"
    #    Environment = "Dev"
    #}
    tags = var.tags
    
    # Add this instance to a security group
    #               [ Type_resource . Id resource . name resource ]
    security_groups = ["${aws_security_group.ssh_connection.name}"]
}


resource "aws_security_group" "ssh_connection" {
  name        = var.securitygroup_ssh
  description = "Allow ssh inbound traffic"
  #vpc_id      = aws_vpc.main.id  # = by default

    #rule
    ingress {
        description      = "TLS from VPC"
        from_port        = 443
        to_port          = 443
        protocol         = "tcp"
        #cidr_blocks      = [aws_vpc.main.cidr_block]
        #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
    }
    #another rule: I need to add another ingress for each rule
    #ingress {...}

    dynamic "ingress" {
        for_each = var.ingress_rules
        content {
                description      = "TLS from VPC"
                from_port        = ingress.value.from_port # ingress. == dinamic "ingress"
                to_port          = ingress.value.to_port 
                protocol         = ingress.value.protocol
                cidr_blocks      = ingress.value.cidr_block#[aws_vpc.main.cidr_block]
                ipv6_cidr_blocks = ingress.value.ipv6_cidr_blocks#[aws_vpc.main.ipv6_cidr_block]
        }
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Name = "allow_tls"
    }
}






