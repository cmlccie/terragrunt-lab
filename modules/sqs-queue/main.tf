# --------------------------------------------------------------------------------------
# Deployment ID
# --------------------------------------------------------------------------------------

# Generates a unique deployment ID to identity each deployment of this module.
# Use this ID (local.deployment_id) as entropy to distinguish resource deployments
# and eliminate singletons. Callers of this module can provide unique deployment ID
# string; the local.deployment_id will use the supplied value or default to a random
# string.

locals {
  deployment_id = coalesce(
    var.deployment_id,
    random_string.deployment_id.result,
  )
}

resource "random_string" "deployment_id" {
  length  = 8
  upper   = false
  lower   = true
  numeric = true
  special = false
}


# --------------------------------------------------------------------------------------
# AWS Simple Queuing Service (SQS) Queue
# --------------------------------------------------------------------------------------

resource "aws_sqs_queue" "fifo_queue" {
  name                        = "${var.env_name}-${var.env_tier}-${var.queue_name}-${local.deployment_id}"
  fifo_queue                  = true
  content_based_deduplication = true
}
