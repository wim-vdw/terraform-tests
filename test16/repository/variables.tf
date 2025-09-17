variable "name" {
  type        = string
  description = "Name of the GitHub repository"
}

variable "description" {
  type        = string
  description = "Description of the GitHub repository"
}

variable "visibility" {
  type        = string
  description = "Visibility of the GitHub repository (public, private, internal)"
  default     = "public"
}

variable "has_downloads" {
  type        = bool
  description = "Whether the repository has downloads enabled"
  default     = true
}

variable "has_issues" {
  type        = bool
  description = "Whether the repository has issues enabled"
  default     = true
}

variable "has_projects" {
  type        = bool
  description = "Whether the repository has projects enabled"
  default     = true
}

variable "has_wiki" {
  type        = bool
  description = "Whether the repository has wiki enabled"
  default     = true
}
