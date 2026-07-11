provider "aws" {
    region = var.region
}

#s3 bucket for storing terraform state
resource "aws_s3_bucket" "terraform_bucket_state" {
  bucket = "taskapp-tfstate-dell-2026" 

    tags = {
        Name = "${var.project_name}-terraform-state"
        environment = var.environment
    }
}

# enable versioning for the s3 bucket
# this ensures that we can recover previous versions of the state file in case of accidental deletion or corruption
resource "aws_s3_bucket_versioning" "terraform_state_versioning" {
    bucket = aws_s3_bucket.terraform_bucket_state.id
    versioning_configuration {
        status = "Enabled"
    }
}

# encrypt the state file using AWS KMS to ensure that the terraform state is stored securely
resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state_encryption" {
    bucket = aws_s3_bucket.terraform_bucket_state.id

    rule {
        apply_server_side_encryption_by_default {
            sse_algorithm = "aws:kms"
        }
    }
}

# create a Dynamodb table for state locking to prevent concurrent modifications to the terraform state
resource "aws_dynamodb_table" "terraform_state_lock" {
    name         = "${var.project_name}-terraform-state-lock"
    billing_mode = "PAY_PER_REQUEST"
    hash_key     = "LockID"

    attribute {
        name = "LockID"
        type = "S"
    }

    tags = {
        Name = "${var.project_name}-terraform-state-lock"
        environment = var.environment
    }
}

data "aws_ami" "ubuntu" {
    most_recent = true
    owners = ["099720109477"] # Canonical
    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
    }
    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
    filter {
        name = "root-device-type"
        values = ["ebs"]
    }
}