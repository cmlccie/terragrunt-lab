# --------------------------------------------------------------------------------------
# Load Terragrunt Parent Configuration
# --------------------------------------------------------------------------------------

include "root" {
  path = find_in_parent_folders()
}

# --------------------------------------------------------------------------------------
# Deploy SQS Stack
# --------------------------------------------------------------------------------------

terraform {
  source = "../../stack//sqs-queue"
}

inputs = {
  aws_account_id = "<--replace-->"
  aws_region     = "<--replace-->"

  env_name = "<--replace-->"
  env_tier = "nonprod"

  queue_name = "fifo-test"
}
