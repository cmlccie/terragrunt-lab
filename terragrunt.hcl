# --------------------------------------------------------------------------------------
# Terraform Remote-State Backend Configuration
# --------------------------------------------------------------------------------------

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    region   = "us-east-2"
    role_arn = "<--replace-->"

    bucket         = "<--replace-->"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    encrypt        = true
    dynamodb_table = "<--replace-->"
  }
}

# --------------------------------------------------------------------------------------
# Provider Generation
# --------------------------------------------------------------------------------------

generate "providers" {
  path      = "providers.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = var.aws_region
  assume_role {
    role_arn = "arn:aws:iam::$${var.aws_account_id}:role/<--replace-->"
  }
}
EOF
}
