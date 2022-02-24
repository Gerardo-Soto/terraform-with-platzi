# infrastructure for production

ami_id = "ami-963854"

instance_type = "t2.large"

tags = {
    Name = "mutable'instance Produiction"
    Environment = "prod"
}

securitygroup_ssh = "platzi-rules"

ingress_rules = [
    {
        from_port = "22"
        to_port = "22"
        protocolo = "tcp"
        cidr_blocks = ["0.0.0.0/0"]# allow any connetion (bad practice, use a VPN)
    },
    {
        from_port = "80"
        to_port = "80"
        protocolo = "tcp"
        cidr_blocks = ["0.0.0.0/0"]# allow any connetion for the app
    }
]









