provider "aws" {
  region = var.region
#  profile = "lab"
}

terraform {
backend "s3" {
#      profile   = "lab"
#      bucket    = "meu-curso-aws-terraform-remote-state-dev"
#      key       = "vpc/vpc.tfstate"
#      region    = "us-east-1"
  }
}

