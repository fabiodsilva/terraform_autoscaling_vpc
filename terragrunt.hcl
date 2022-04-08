remote_state {
  backend = "s3"
  config = {
    bucket         = "repo-state-terragrunt.v1"
    key            = "terragrunt/${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
#    dynamodb_table = "natura-foundation-org-financial-services-banking-prd-aws-lock-table"


    # s3_bucket_tags is an attribute, so an equals sign is REQUIRED
    s3_bucket_tags = {
      Environment = "prd"
      Projeto     = "cloud-platform"
      Owner       = "Cloud Platform Terragrunt"
      Name        = "Terraform state storage"
    }

    # dynamodb_table_tags is an attribute, so an equals sign is REQUIRED
#    dynamodb_table_tags = {
#      Environment = "prd"
#      Projeto     = "cloud-platform"
#      Owner       = "Cloud Platform Terragrunt"
#      Name        = "Terraform state storage"
#    }

  }
}

# Configure root level variables that all resources can inherit. This is especially helpful with multi-account configs
# where terraform_remote_state data sources are placed directly into the modules.
inputs = {
  tfstate_global_bucket        = "repo-state-terragrunt.v1"
  tfstate_global_bucket_region = "us-east-1"
}


#iam_role = "arn:aws:iam::521544279851:role/financial-services-terragrunt-prd"
