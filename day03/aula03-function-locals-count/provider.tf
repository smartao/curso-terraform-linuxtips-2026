terraform {

  backend "s3" {
    bucket = "sergei-curso-linuxtips-2026"
    key    = "day03-aula03-functions"
    region = "us-east-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}
