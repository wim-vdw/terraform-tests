variable "location" {
  type        = string
  description = "Location of the resource"

  validation {
    condition     = can(regex("(?i)europe$", var.location))
    error_message = "Resources can only be created in North or West Europe."
  }
}

variable "application" {
  type        = string
  description = "Name of the application."
}

variable "environment" {
  type        = string
  description = "Name of the environment."

  validation {
    condition     = contains(["development", "production"], lower(var.environment))
    error_message = "Invalid environment."
  }
}

variable "sequence" {
  type        = number
  default     = null
  description = "Sequence number of the resource group."

  validation {
    condition     = var.sequence != null ? var.sequence >= 1 && var.sequence <= 99 : true
    error_message = "Sequence must be between 1 and 99."
  }
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags"
}
