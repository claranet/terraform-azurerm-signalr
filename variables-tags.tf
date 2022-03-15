variable "default_tags_enabled" {
  description = "Option to enable or disable default tags"
  type        = bool
  default     = true
}

variable "extra_tags" {
  description = "Tags to add to the resource"
  type        = map(string)
  default     = null
}
