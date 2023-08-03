# --------------------------------------------------------------------------------------
# Environment
# --------------------------------------------------------------------------------------

variable "env_name" {
  description = "Environment name."
  type        = string
}

variable "env_tier" {
  description = "Environment tier (e.g. `sandbox`, `nonprod`, `prod`)."
  type        = string
}

variable "deployment_id" {
  description = "(optional) A unique identifier for this deployment. This ID is used to distinguish resource deployments to eliminate singletons. Defaults to a random string for each new deployment of this module."
  type        = string
  default     = null
}

# --------------------------------------------------------------------------------------
# AWS Simple Queuing Service (SQS) Queue
# --------------------------------------------------------------------------------------

variable "queue_name" {
  description = "AWS Simple Queuing Service (SQS) queue name."
  type        = string
}
