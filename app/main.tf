provider "aws" {
  region = "us-east-1"
  profile = "lab"
}

terraform {
backend "s3" {
      profile   = "lab"
      bucket    = "meu-curso-aws-terraform-remote-state-dev"
      key       = "app/app.tfstate"
      region    = "us-east-1"
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    profile   = "lab"
    bucket = "meu-curso-aws-terraform-remote-state-dev"
    key    = "vpc/vpc.tfstate"
    region = "us-east-1"
  }
}
