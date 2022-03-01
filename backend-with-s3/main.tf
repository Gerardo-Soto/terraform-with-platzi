# Infrastruture definition
provider "aws"{
    region = "us-east-2"
}

resource "aws_s3_bucket" "platzi-backend" {
    bucket = var.bucket_name
    comments_acl = "types of permissions for bucket"
    acl = var.acl
    tags = var.tags
}

resource "aws_kms_key" "mykey" {
    description = "key state file"
    deletion_window_in_days = 10
}

output "arn" {
  value       = aws_kms_key.mykey.arn
}
