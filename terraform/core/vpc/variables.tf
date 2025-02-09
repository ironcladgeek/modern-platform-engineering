variable "project" {
  description = "Project name"
  type        = string
  default     = "platform-engineering"
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "region" {
  description = "Aws region"
  type        = string
  default     = "eu-north-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["eu-north-1a", "eu-north-1b", "eu-north-1c"]
}
