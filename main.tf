# ---------------------------
# Terraform Configure
# ---------------------------
terraform {
  required_version = ">=0.13" # Specify version 0.13 or higher.
  required_providers {
    aws = {
      source  = "hashicorp/aws" # Specify the module name.
      version = "~>3.0"         # 3.0 or higher (ignore minor versions).
    }
  }
}

# ---------------------------
# Provider
# ---------------------------
provider "aws" {
  profile = "teraform_user" # cat ~/.aws/config
  region  = "ap-northeast-1"
}

# ---------------------------
# Variables
# ---------------------------
variable "project" {
  type = string
}

variable "environment" {
  type = string
}