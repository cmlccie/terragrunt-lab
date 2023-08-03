# --------------------------------------------------------------------------------------
# Module Inputs
# --------------------------------------------------------------------------------------

output "env_name" {
  description = "Environment name."
  value       = var.env_name
}

output "env_tier" {
  description = "Environment tier (e.g. `sandbox`, `nonprod`, `prod`)."
  value       = var.env_tier
}

output "deployment_id" {
  description = "Unique identifier for this deployment."
  value       = local.deployment_id
}

# --------------------------------------------------------------------------------------
# AWS Simple Queuing Service (SQS) Queue
# --------------------------------------------------------------------------------------

output "fifo_queue" {
  description = "Deployed AWS Simple Queuing Service (SQS) first-in first-out (FIFO) queue."
  value       = aws_sqs_queue.fifo_queue
}
