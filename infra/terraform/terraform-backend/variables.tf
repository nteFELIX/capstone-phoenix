variable "project_name" {
  description = "The name of the project."
  type        = string
  default     = "phoenix"
}
variable "environment" {
  description = "The environment for the deployment (e.g., dev, staging, prod)."
  type        = string
  default     = "dev"
  
}
variable "region" {
  description = "The region where resources will be created."
  type        = string
  default     = "eu-north-1"
}