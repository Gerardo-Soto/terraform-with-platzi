# requisitos minimos para crear una instancia en AWS
provider "aws" {
    region = "us-east-2"
}

#         recurso: inst.  ID: platzi-instance
resource "aws_instance" "platzi-instance"{
    ami = "ami-0123456789abcde"
    instance_type = "t2.micro"
    tags = {
        Name = "Practice 1"
        Environment = "Dev"
    }
}

