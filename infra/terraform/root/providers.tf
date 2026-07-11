provider "aws" {
  region = var.avail_zone

  default_tags {
    tags = {
      Project     = var.project_name
      Environment = var.environment
      managed_by  = "terraform"
      owner       = "dell"
      created_by  = "terraform"

    }
  }
  retry_mode  = "standard"
  max_retries = 5
}