# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your Terraform commands in that folder.
terraform {
  source = "git::ssh://git@bitbucket.org/naturapay/terraform-module-awsorg-scheduler-resources.git"
  extra_arguments "custom_vars" {
    commands = ["apply", "console", "destroy", "import", "plan", "push", "refresh"]


    # With the get_terragrunt_dir() function, you can use relative paths!
    arguments = [ 
      "-var-file=${find_in_parent_folders("region.tfvars")}",
      "-var-file=${find_in_parent_folders("env.tfvars")}",
      "-var-file=${find_in_parent_folders("platform.tfvars")}",
      "-var-file=local.tfvars",
      "-var-file=creation.tfvars", 
    ]   
  }
}
       
# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}
