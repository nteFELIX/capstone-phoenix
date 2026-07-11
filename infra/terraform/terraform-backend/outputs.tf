output "state_bucket_name" {
  value = aws_s3_bucket.terraform_bucket_state.bucket
  description = "The name of the S3 bucket used for storing Terraform state."
  
}

output "state_lock_table_name" {
  value = aws_dynamodb_table.terraform_state_lock.name
  description = "The name of the DynamoDB table used for Terraform state locking."
}