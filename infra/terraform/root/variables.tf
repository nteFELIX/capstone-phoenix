variable "avail_zone" {
  description = "AWS region"
  type        = string
  default     = "eu-north-1"
}

variable "ami_id" {
  description = "Ubuntu 24.04 AMI ID"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.small"
}

variable "key_name" {
  description = "Name of the EC2 Key Pair in AWS"
  type        = string
}

variable "my_ip" {
  description = "Your public IP, e.g. 1.2.3.4/32"
  type        = string
}

variable "worker_count" {
  description = "Number of worker nodes"
  type        = number
  default     = 2
}

variable "project_name" {
  description = "Prefix for resource names"
  type        = string
  default     = "phoenix"
}

variable "region" {
  description = "The region where resources will be created."
  type        = string
  default     = "eu-north-1"
}

variable "environment" {
  description = "The environment for the deployment (e.g., dev, staging, prod)."
  type        = string
  default     = "dev"
}