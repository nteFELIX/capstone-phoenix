terraform {
  # specifies the required Terraform version and provider to ensure compatibility and proper functioning of the Terraform configuration. This helps prevent issues that may arise from using incompatible versions of Terraform or providers.
  # minium required version of terraform is set to 1.10.5 to ensure that the configuration is compatible with the features and syntax used in the code. This helps prevent issues that may arise from using an older version of Terraform that does not support certain features or syntax used in the configuration.
  required_version = ">=1.10.5"

  required_providers {
    # AWS provider - our primary provider for managing aws resources.
    aws = {
      source  = "hashicorp/aws"
      version = "6.43.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.0" # Match with your preferred constraint
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
  }
}