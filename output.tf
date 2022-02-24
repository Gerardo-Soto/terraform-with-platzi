output instance_ip {
  value       = aws_instance.platzi-instance.*.public_ip
  #sensitive   = true
  description = "description"
  #depends_on  = []
}
