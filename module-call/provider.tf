# Define required providers
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS provider for the requester (custom VPC)
provider "aws" {
  alias  = "requester"
  region = var.requester_region
}

# Configure the AWS provider for the accepter (default VPC)
provider "aws" {
  alias  = "accepter"
  region = var.accepter_region
}
