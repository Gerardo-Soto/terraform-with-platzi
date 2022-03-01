terraform {
    backend "s3" {
        bucket = "backend-terraform-platzi"
        # key: the path to the state file inside the bucket.
        key    = "path/to/my/key"
        region = "us-east-2"
        # encrypt: (optional) wheter to enable server side encryption of the state file
        encrypt = true
        kms_key_id = "llave_arn........................"
    }
}

