terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.84.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
  access_key = "AKIA4MTWLMWBND4UZCXH"
  secret_key = "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"
}